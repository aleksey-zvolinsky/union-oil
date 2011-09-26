unit xhHierCube;

{$I xhCommon.inc}

interface

uses
  SysUtils, Classes,
{$IFNDEF ASPRUNTIME}
  Windows, Graphics, Controls, xhArrays, Messages,
  Forms, Dialogs, xhBar, Menus, xhDataSet,
{$ELSE}
  xhNetArrays, System.Collections, Borland.Vcl.Types, RadarSoft.HCL.Interop,
  System.Text, System.Data,
{$ENDIF}
  db, xhConsts, xhResStr, xhStream, xhArrays2
{$IFNDEF ASPRUNTIME}
{$IFDEF COMPILER_6UP}
, Variants
{$ENDIF}
{$ENDIF}
;

type
  TCustomHierCube = class;
  TSummary = class;
  TDimension = class;
  TFunctionInfo = class;
  TSubFunctionInfo = class;
  TGridInfo = class;
  TSummaryState = class;
  TDimensionState = class;
  TChildrenList = class;
  TTotals = class;
  TSummaries = class;
  TDimensions = class;
{$IFNDEF ASPRUNTIME}
  TKeySet = class;
{$ENDIF}
  TDimComponent = class;
  TFunctionDefs = class;
  TSubFunctionDefs = class;
  TLabelNode = class;
  TCaptionNode = class;
  TSubLevelNode = class;
  TDimMembers = class;
  TFunctionDef = class;
  TSubFunctionDef = class;

{$IFDEF ASPRUNTIME}
  {$UNSAFECODE ON}
  Variant = TObject;
  OLEVariant = TObject;
  TxInterfaceList = TPointerArray;
{$ENDIF}

  TCMHierCubeMessage = record
    Msg: Cardinal;
    MsgType: Longint;
    {$IFDEF ASPRUNTIME}
    Sender: TObject;
    {$ELSE}
    Sender: TControl;
    {$ENDIF}
    Result: Longint;
  end;
  

  TExportNodeType = (enNone, enData, enDimLabel, enDimCaption, enFunction, enSubFunction, enSummary);

  
  {$IFNDEF ASPRUNTIME}
  PExportNode = ^TExportNode;
  TExportNode = record
    Dummy: integer;
    NodeType: TExportNodeType;
    ColSpan, RowSpan: integer;
    ValueString: WideString;
    Row, Col: integer; 
    Data: double;
    Empty: boolean;
    FormatString: WideString;
    Alignment: TAlignment;
    CaptionNode: TCaptionNode;
    DimState: TDimensionState;
    SubLevelNode: TSubLevelNode;
    case boolean of
      True: (ColLabelNode, RowLabelNode: TLabelNode);
      False: (LabelNode: TLabelNode);
  end;
  {$ELSE}
  TExportNode = record
    NodeType: TExportNodeType;
    ColSpan, RowSpan: integer;
    ValueString: WideString;
    Row, Col: integer; 
    Data: double;
    Empty: boolean;
    FormatString: WideString;
    Alignment: TAlignment;
    CaptionNode: TCaptionNode;
    DimState: TDimensionState;
    SubLevelNode: TSubLevelNode;
    ColLabelNode, RowLabelNode: TLabelNode;
  end;
  PExportNode = TExportNode;
  {$ENDIF}

  TGridExportStructure = class
  private
{$IFDEF ASPRUNTIME}
    FArray: array of array of TExportNode;
{$ELSE}
    FArray: pointer;
{$ENDIF}
    FWidth: integer;
    FHeight: integer;
    FFixedCols: integer;
    FFixedRows: integer;
    function GetItem(X, Y: integer): PExportNode;
  public
{$IFDEF ASPRUNTIME}
    procedure SetItem(X, Y: integer; const Value: PExportNode);
{$ENDIF}
    constructor Create(AWidth, AHeight: integer);
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
{$IFDEF ASPRUNTIME}
    property Items[X, Y: integer]: PExportNode read GetItem write SetItem; default;
{$ELSE}
    property Items[X, Y: integer]: PExportNode read GetItem; default;
{$ENDIF}
    property Width: integer read FWidth;
    property Height: integer read FHeight;
    property FixedCols: integer read FFixedCols;
    property FixedRows: integer read FFixedRows;
  end;

  TStreamedSubFunction = class(TStreamedObject)
  private
    FVisible: boolean;
    FFormatString: WideString;
    FAlignment: TAlignment;
  public
    procedure WriteStream(Stream: TStream); override;
    procedure ReadStream(Stream: TStream); override;
    function StreamSize: integer; override;

    property Visible: boolean read FVisible;
    property FormatString: WideString read FFormatString;
    property Alignment: TAlignment read FAlignment;
  end;

  TStreamedFunction = class(TStreamedObjectArray)
  public
    procedure ReadStream(Stream: TStream); override;
  end;

  TStreamedSumInfo = class(TStreamedObjectArray)
  private
    fCalculated: boolean;
    FFormula: WideString;
    FFieldName: WideString;
    FDisplayName: WideString;
  public
    procedure WriteStream(Stream: TStream); override;
    function StreamSize: integer; override;
    procedure ReadStream(Stream: TStream); override;
    property Calculated: boolean read fCalculated;
    property DisplayName: WideString read FDisplayName;
    property Formula: WideString read FFormula;
    property FieldName: WideString read FFieldName;
  end;

  TStreamedSummarySettings = class(TStreamedObjectArray)
  public
    procedure ReadStream(Stream: TStream); override;
  end;

  TSummarySettings = class;
  TSummaryInfo = class(TCollectionItem)
  private
    fGridInfo: TGridInfo;

    FSummaryState: TSummaryState; 
    fFormula: WideString;
    fFieldName: WideString;           
    fDisplayName: WideString;
    FID: integer;
    FFormulaParser: TObject;
    FDimensionMapIndex: integer;

    fFunctions: array[0..integer(high(TFunction))] of TFunctionInfo;
    FDefaultFormat: WideString;
    procedure InitAllChilds;
    function GetFunctions(AFunction: integer): TFunctionInfo;
    procedure SetFunctions(AFunction: integer; Value: TFunctionInfo);
    function GetVisible: boolean;
    procedure SetVisible(Value: boolean);
    procedure SetFormula(const Value: WideString);
    function GetSumID: integer;
    function GetCalculated: boolean;
    function GetSummary: TSummary;
    procedure SetDefaultFormat(const Value: WideString);
    function GetSummarySettings: TSummarySettings;
  protected
    function GetDisplayName: WideString; virtual; 
    procedure SetDisplayName(const Value: WideString); virtual;
    function NotCalculated: boolean;
  public
    constructor Create(Collection: TCollection); override;
    {$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
    {$ENDIF}
    procedure MoveTo(Index: integer);
    function BuildStreamedSumInfo: TStreamedSumInfo;
    procedure RestoreStreamedSumInfo(StreamedSumInfo: TStreamedSumInfo);
    procedure Assign(Source: TPersistent); override;
    property Functions[Index: integer]: TFunctionInfo read GetFunctions write SetFunctions; default;
    property FormulaParser: TObject read FFormulaParser write FFormulaParser;
    property SumID: integer read GetSumID;
    property Sum: TSummary read GetSummary;
    property SumState: TSummaryState read FSummaryState;
    property SummarySettings: TSummarySettings read GetSummarySettings;
    function GetAggregate(SumIndex: TIntegerArray; AFunction: TFunction; out Res: Double): boolean;
    function SameName(const SummaryName: WideString): boolean;
    property Calculated: boolean read GetCalculated;
    property ID: integer read fID write fID;
  published
    property DisplayName: WideString read GetDisplayName write SetDisplayName;
    property Visible: boolean read GetVisible write SetVisible stored False;
    property FieldName: WideString read fFieldName write fFieldName;
    property Formula: WideString read fFormula write SetFormula;
    property DefaultFormat: WideString read FDefaultFormat write SetDefaultFormat;
    property DimensionMapIndex: integer read FDimensionMapIndex write FDimensionMapIndex;
    property FunctionSum: TFunctionInfo index 0 read GetFunctions write SetFunctions;
    property FunctionCount: TFunctionInfo index 1 read GetFunctions write SetFunctions;
    property FunctionAverage: TFunctionInfo index 2 read GetFunctions write SetFunctions;
    property FunctionMin: TFunctionInfo index 3 read GetFunctions write SetFunctions;
    property FunctionMax: TFunctionInfo index 4 read GetFunctions write SetFunctions;
    property FunctionVariance: TFunctionInfo index 5 read GetFunctions write SetFunctions;
    property FunctionStdDev: TFunctionInfo index 6 read GetFunctions write SetFunctions;
    property FunctionMeanAbsDev: TFunctionInfo index 7 read GetFunctions write SetFunctions;
    property FunctionSkewness: TFunctionInfo index 8 read GetFunctions write SetFunctions;
    property FunctionKurtosis: TFunctionInfo index 9 read GetFunctions write SetFunctions;
    property FunctionMedian: TFunctionInfo index 10 read GetFunctions write SetFunctions;
    property FunctionCustom1: TFunctionInfo index 11 read GetFunctions write SetFunctions;
    property FunctionCustom2: TFunctionInfo index 12 read GetFunctions write SetFunctions;
    property FunctionCustom3: TFunctionInfo index 13 read GetFunctions write SetFunctions;
    property FunctionCustom4: TFunctionInfo index 14 read GetFunctions write SetFunctions;
    property FunctionCustom5: TFunctionInfo index 15 read GetFunctions write SetFunctions;
  end;

  TFunctionInfo = class(TPersistent)
  private
    FSummarySettings: TSummarySettings;
    fSubFunctions: array[0..integer(high(TSubFunction))] of TSubFunctionInfo;
    function GetSubFunctions(SubFunction: integer): TSubFunctionInfo;
    procedure SetSubFunctions(SubFunction: integer; Value: TSubFunctionInfo);
    function GetVisible: boolean;
    procedure SetVisible(Value: boolean);
  public
    constructor Create(ASummarySettings: TSummarySettings);
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    procedure Assign(Source: TPersistent); override;
    property SubFunctions[Index: integer]: TSubFunctionInfo read GetSubFunctions write SetSubFunctions; default;
  published
    property SubFunctionValue: TSubFunctionInfo index 0 read GetSubFunctions write SetSubFunctions;
    property SubFunctionRankByRow: TSubFunctionInfo index 1 read GetSubFunctions write SetSubFunctions;
    property SubFunctionRankByCol: TSubFunctionInfo index 2 read GetSubFunctions write SetSubFunctions;
    property SubFunctionPercentByRow: TSubFunctionInfo index 3 read GetSubFunctions write SetSubFunctions;
    property SubFunctionPercentByCol: TSubFunctionInfo index 4 read GetSubFunctions write SetSubFunctions;
    property SubFunctionCompareWithPrevByRow: TSubFunctionInfo index 5 read GetSubFunctions write SetSubFunctions;
    property SubFunctionCompareWithPrevByCol: TSubFunctionInfo index 6 read GetSubFunctions write SetSubFunctions;
    property SubFunctionCumulativeSumByRow: TSubFunctionInfo index 7 read GetSubFunctions write SetSubFunctions;
    property SubFunctionCumulativeSumByCol: TSubFunctionInfo index 8 read GetSubFunctions write SetSubFunctions;
    property SubFunctionCustom1: TSubFunctionInfo index 9 read GetSubFunctions write SetSubFunctions;
    property SubFunctionCustom2: TSubFunctionInfo index 10 read GetSubFunctions write SetSubFunctions;
    property SubFunctionCustom3: TSubFunctionInfo index 11 read GetSubFunctions write SetSubFunctions;
    property SubFunctionCustom4: TSubFunctionInfo index 12 read GetSubFunctions write SetSubFunctions;
    property SubFunctionCustom5: TSubFunctionInfo index 13 read GetSubFunctions write SetSubFunctions;
    property Visible: boolean read GetVisible write SetVisible stored False;
  end;

  TSubFunctionInfo = class(TPersistent)
  private
    FSummarySettings: TSummarySettings;
    fVisible: boolean;
    fFormatString: WideString;
    FAlignment: TAlignment;
    procedure SetVisible(Value: boolean);
    procedure SetFormatString(const Value: WideString);
    procedure SetAlignment(Value: TAlignment);
    function IsDefaultFormat: boolean;
  public
    constructor Create(ASummarySettings: TSummarySettings);
    procedure Assign(Source: TPersistent); override;
  published
    property Visible: boolean read fVisible write SetVisible default False;
    property FormatString: WideString read fFormatString write SetFormatString stored IsDefaultFormat;
    property Alignment: TAlignment read FAlignment write SetAlignment default taRightJustify;
  end;

  TSummarySettings = class(TOwnedCollection)
  private
    FGridInfo: TGridInfo;
    FUpdateCounter: integer;
    FSumCountChanged: boolean;
    function GetItem(Index: Integer): TSummaryInfo;
    procedure SetItem(Index: Integer; Value: TSummaryInfo);
{$IFDEF ASPRUNTIME}
  protected
    function GetOwner: TPersistent; override;
{$ENDIF}
  public
    constructor Create(AGridInfo: TGridInfo);
    function BuildStreamedSummarySettings: TStreamedSummarySettings;
    function FindFieldName(const AFieldName: WideString): TSummaryInfo;
    function FindDisplayName(const ADisplayName: WideString): TSummaryInfo;
    function FindSumInfoID(SumInfoID: integer): TSummaryInfo;
{$IFNDEF ASPRUNTIME}
    function GetOwner: TPersistent; override;
{$ENDIF}
    procedure SaveChanges(Target: TSummarySettings);
    function AddSummary(const DisplayName, Formula: WideString): TSummaryInfo;
    procedure RemoveSummary(const DisplayName: WideString); overload;
    procedure RemoveSummary(SummaryInfo: TSummaryInfo); overload;
    procedure Assign(Source: TPersistent); override;
    function Add: TSummaryInfo;
    procedure BeginUpdate; reintroduce;
    procedure EndUpdate; reintroduce;
    procedure Changed;
    property Items[Index: Integer]: TSummaryInfo read GetItem write SetItem; default;
    property GridInfo: TGridInfo read FGridInfo;
  end;

  ECubeError = class(Exception);

  THierCubeState = (dcInactive, dcBrowseAllData);

  THierCubeBeforeSwapDimsEvent  =  procedure(Sender: TObject; DimID1, DimID2: integer; var AllowSwap: boolean) of object;

  TPivotOperation = (opMoveDim, opSwapDims, opDrillDown, opDrillUp, opFilter, opNewGroup, opGroup, opUnGroup, opClearGroup, opDeleteGroup);
  
  TPivotEventArgs = class(TEventArgs)
  private
    FDimState: TDimensionState;
    FDimState2: TDimensionState;
    FAllowOperation: boolean;
    FOperation: TPivotOperation;
    FNewDimIndex: integer;
    FNewDimGroup: TDimGroup;
    FLabelNode: TLabelNode;
    FMemberIndex: integer;
    FMemberName: WideString;
    FGroupIndex: integer;
  public
    procedure Clear; override;
    property Operation: TPivotOperation read FOperation;
    property AllowOperation: boolean read FAllowOperation write FAllowOperation;
    property DimState: TDimensionState read FDimState;
    property DimState2: TDimensionState read FDimState2;
    property NewDimGroup: TDimGroup read FNewDimGroup;
    property NewDimIndex: integer read FNewDimIndex;
    property LabelNode: TLabelNode read FLabelNode;
    property MemberIndex: integer read FMemberIndex;
    property MemberName: WideString read FMemberName;
    property GroupIndex: integer read FGroupIndex;
  end;

  TPivotEvent = procedure(Sender: TObject; Args: TPivotEventArgs) of object;
{$IFNDEF ASPRUNTIME}
  TOnGetFactTableEditorEventArgs = class(TEventArgs)
  private
    FFactTableEditor: TCustomForm;
    FDataset: TDataset;
    FFreeOnExit: boolean;
  public
    procedure Clear; override;
    property FactTableEditor: TCustomForm read FFactTableEditor write FFactTableEditor;
    property Dataset: TDataset read FDataset;
    property FreeOnExit: boolean read FFreeOnExit write FFreeOnExit;
  end;
  
  TOnGetFactTableEditorEvent = procedure(Sender: TObject; Args: TOnGetFactTableEditorEventArgs) of object;

  TEditCellEventArgs = class(TEventArgs)
  protected
    FAccept: boolean;
    FDataset: TDataset;
    FRow, FCol: integer;
    FFun: TFunction;
    FSubFun: TSubFunction;
    FSumInfo: TSummaryInfo;

    FDataRow, FDataCol: integer;
    FSumIndex: TIntegerArray;
  public
    procedure Clear; override;
    property Row: integer read FRow;
    property Col: integer read FCol;
    property DataRow: integer read FDataRow;
    property DataCol: integer read FDataCol;
    property Dataset: TDataset read FDataset;
    property Accept: boolean read FAccept write FAccept;
    property Fun: TFunction read FFun;
    property SubFun: TSubFunction read FSubFun;
    property SumInfo: TSummaryInfo read FSumInfo;
    property SumIndex: TIntegerArray read FSumIndex;
  end;

  TOnEditFactTableEventArgs = class(TEditCellEventArgs)
  end;
{$ENDIF}
  TGridCellArgs = class(TEventArgs)
  protected
    FCellType: TExportNodeType;
    FRow: integer;
    FCol: integer;
    FDimState: TDimensionState;
    FColLabelNode: TLabelNode;
    FRowLabelNode: TLabelNode;
    FSubLevelNode: TSubLevelNode;
    FValue: double;
    FValueString: WideString;
    FIsNull: boolean;
  public
    procedure Clear; override;
    procedure Assign(Source: TEventArgs); override;
    property CellType: TExportNodeType read FCellType;
    property IsNull: boolean read FIsNull;
    property Col: integer read FCol;
    property Row: integer read FRow;
    property ValueString: WideString read FValueString write FValueString;
    property Value: double read FValue write FValue;
    property ColLabelNode: TLabelNode read FColLabelNode;
    property RowLabelNode: TLabelNode read FRowLabelNode;
    property DimState: TDimensionState read FDimState;
    property SubLevelNode: TSubLevelNode read FSubLevelNode;
  end;

{$IFNDEF ASPRUNTIME}
  TOnEditFactTableEvent = procedure(Sender: TObject; Args: TOnEditFactTableEventArgs) of object;
{$ENDIF}

  THierCubeAfterSwapDimsEvent  =  procedure(Sender: TObject; DimID1, DimID2: integer) of object;

  THierCubeBeforeMoveDimEvent = procedure(Sender: TObject; DimID: integer; DimGroup: TDimGroup; Index: integer; var AllowMove: boolean) of object;

  THierCubeAfterMoveDimEvent = procedure(Sender: TObject; DimID: integer; DimGroup: TDimGroup; Index: integer) of object;

  THierCubeOnExpandDimValueEvent = procedure(Sender: TObject; DimID: integer; ValueIndex: integer; Expanded: boolean) of object;

  TOnCompareDimensionMembers = function(DimState: TDimensionState; Index1, Index2: integer): integer of object;

  TPivotStateEvent = procedure(Sender: TObject; const StateName: WideString) of object;
  
  TBeforeReadFactTableEvent = procedure(Sender: TObject; Dataset: TDataset;
                                        var EventFrequency: integer) of object;
  
  TReadFactTableEvent = procedure(Sender: TObject; ProcessedRecords: integer) of object;

  TCloseDimensionEditorArgs = class(TEventArgs)
  private
    function GetChanged: boolean;
  protected
    FDimensionState: TDimensionState;
    FDisplayNameChanged: boolean;
    FOldDisplayName: WideString;
    FAttributeChanged: boolean;
    FOldAttribute: WideString;
    FSortTypeChanged: boolean;
    FOldSortType: TDimSortType;
    FFilterChanged: boolean;
    FGroupsChanged: boolean;
    FMemberHierarchyChanged: boolean;
    FMemberNamesChanged: boolean;
  public
    constructor Create(DimState: TDimensionState);
    property DimensionState: TDimensionState read FDimensionState;
    property DisplayNameChanged: boolean read FDisplayNameChanged;
    property OldDisplayName: WideString read FOldDisplayName;
    property AttributeChanged: boolean read FAttributeChanged;
    property OldAttribute: WideString read FOldAttribute;
    property SortTypeChanged: boolean read FSortTypeChanged;
    property OldSortType: TDimSortType read FOldSortType;
    property FilterChanged: boolean read FFilterChanged;
    property GroupsChanged: boolean read FGroupsChanged;
    property MemberHierarchyChanged: boolean read FMemberHierarchyChanged;
    property MemberNamesChanged: boolean read FMemberNamesChanged;
    property Changed: boolean read GetChanged;
  end;

  TOnCloseDimensionEditor = procedure(Sender: TObject; Args: TCloseDimensionEditorArgs) of object;

  THierCubeEvent = (xeStateChanged, xeDimensionMapChanged, xeSourceChange, xeReadFromStream, xeFactTableChanged,
    xeInitPivotState);

  TGridInfoEvent = (geSourceChange, gePivot, geNewGridLayout, geToggleDimValue,
    geRowsSort, geColsSort, gePivotStateChange, geAggregateChanged,
    gePageChanged, geHierCubeChanged, geSubLevelNodeChanged, geTotalAppearanceChanged,
    geInitPivotState);

  TDimComponentRecord = record
    FID_Field: WideString;
    FName_Field: WideString;
    FLookupDataSet: TDataSet;
    FFormatString: WideString;
    FFieldName: WideString;
    FFieldKind: TFieldKind;
    FFieldType: TFieldType;
  end;

  TDimCollectionItem = class(TCollectionItem)
  private
    FDimComponentRecord: TDimComponentRecord;
    procedure SetLookupDataSet(Value: TDataSet);
    function GetHierCube: TCustomHierCube;
  public
    property HierCube: TCustomHierCube read GetHierCube;
  published
    property LookupDataSet: TDataSet read FDimComponentRecord.FLookupDataSet write SetLookupDataSet;
    property ID_Field: WideString read FDimComponentRecord.FID_Field write FDimComponentRecord.FID_Field;
    property Name_Field: WideString read FDimComponentRecord.FName_Field write FDimComponentRecord.FName_Field;
    property FormatString: WideString read FDimComponentRecord.FFormatString write FDimComponentRecord.FFormatString;
    property FieldName: WideString read FDimComponentRecord.FFieldName write FDimComponentRecord.FFieldName;
  end;

  TDimCollection = class(TCollection)
  private
    FHierCube: TCustomHierCube;
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(AHierCube: TCustomHierCube);
    property HierCube: TCustomHierCube read FHierCube;
  end;
    
  TDimSum = class(TCollectionItem)
  private
    FBaseFieldName: WideString;
    FBaseFieldType: TFieldType;
    FDisplayName: WideString; 
    FDimSumType: TDimSumType; 
    FDimGroup: TDimGroup;   
    FLookupDataSet: TDataSet;
    FID_Field: WideString;
    FParentID_Field: WideString;
    FTotalAppearance: TTotalAppearance;
    FComposite: boolean;
    FComposedFields: WideString;
    FAttributes: WideString;
    FDefaultAttribute: WideString;
    FDimCollection: TDimCollection;
    FEnableTransformation: boolean;
    FMemberCount: integer;
    FTransformMethod: TTransformMethod;
    FSortType: TDimSortType;
    FDefaultFormat: WideString; 
    FAvailableMembers: TAvailableMembers;
    FAvailableMembers_Field: WideString;
    FBaseFieldKind: TFieldKind;
    function GetHierCube: TCustomHierCube;
    procedure SetLookupDataSet(Value: TDataSet);
    function StoreDimensionComponents: boolean;
    procedure SetName_Field(const Value: string);
    function GetName_Field: string;
    procedure SetDefaultAttribute(const Value: WideString);
    function IsDimension: boolean;
    function StoreRangeBasedDimension: boolean;
    function StoreAvailableMembers_Field: boolean;
  public
    constructor Create(Collection: TCollection); override;
    {$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
    {$ENDIF}
    procedure Assign(Source: TPersistent); override;
    procedure MoveToDefined;
    procedure MoveTo(Index: integer); 
    property HierCube: TCustomHierCube read GetHierCube;
  published
    property BaseFieldName: WideString read FBaseFieldName write FBaseFieldName;
    property BaseFieldType: TFieldType read FBaseFieldType write FBaseFieldType default ftUnknown;
    property BaseFieldKind: TFieldKind read FBaseFieldKind write FBaseFieldKind default fkData;
    property DisplayName: WideString read FDisplayName write FDisplayName;
    property DimSumType: TDimSumType read FDimSumType write FDimSumType default dsUnknown;
    property LookupDataSet: TDataSet read FLookupDataSet write SetLookupDataSet stored IsDimension;
    property ID_Field: WideString read FID_Field write FID_Field stored IsDimension;
    property Name_Field: string read GetName_Field write SetName_Field stored False; 
    property ParentID_Field: WideString read FParentID_Field write FParentID_Field stored IsDimension;
    property DimGroup: TDimGroup read FDimGroup write FDimGroup stored IsDimension;
    property TotalAppearance: TTotalAppearance read FTotalAppearance write FTotalAppearance stored IsDimension default taLast;
    property Composite: boolean read FComposite write FComposite default False;
    property ComposedFields: WideString read FComposedFields write FComposedFields;
    property DimCollection: TDimCollection read FDimCollection write FDimCollection stored StoreDimensionComponents;
    property Attributes: WideString read FAttributes write FAttributes stored IsDimension;
    property DefaultAttribute: WideString read FDefaultAttribute write SetDefaultAttribute stored IsDimension;
    property SortType: TDimSortType read FSortType write FSortType stored IsDimension;
    property EnableTransformation: boolean read FEnableTransformation write FEnableTransformation stored False;
    property SeriesMemberCount: integer read FMemberCount write FMemberCount stored False;
    property TransformMethod: TTransformMethod read FTransformMethod write FTransformMethod stored False;
    property RangeBased: boolean read FEnableTransformation write FEnableTransformation stored StoreRangeBasedDimension;
    property RangeMemberCount: integer read FMemberCount write FMemberCount stored StoreRangeBasedDimension;
    property RangeTransformMethod: TTransformMethod read FTransformMethod write FTransformMethod stored StoreRangeBasedDimension;
    property DefaultFormat: WideString read FDefaultFormat write FDefaultFormat;
    property AvailableMembers: TAvailableMembers read FAvailableMembers write FAvailableMembers stored IsDimension default byFactTable;
    property AvailableMembers_Field: WideString read FAvailableMembers_Field write FAvailableMembers_Field stored StoreAvailableMembers_Field;
  end;

  TDimSums = class(TCollection)
  private
    FHierCube: TCustomHierCube;         
    function GetItem(Index: integer): TDimSum;
    procedure SetItem(Index: integer; DimSum: TDimSum);
    function GetDimCount: Integer;
    function GetSumCount: Integer;
    procedure CorrectCompositeFields;
    procedure GetFieldKind(const FieldName: WideString; out FieldKind: TFieldKind; out FieldType: TFieldType);
    procedure SetFieldKind(const FieldName: WideString; FieldKind: TFieldKind);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(AHierCube: TCustomHierCube);
    function Add: TDimSum;
    function FindSummary(const FieldName: WideString): TDimSum;
    function FindItem(const FieldName: WideString): TDimSum; overload;
    function FindItem(const FieldName: WideString; ExcludeType: TDimSumType): TDimSum; overload;
    function FindField(const AFieldName: WideString; AFieldType: TFieldType): integer;
    function FindCompositeDimension(const DisplayName: WideString): TDimSum;
    function FindRangeBasedDimension(const DisplayName: WideString): TDimSum;
    function FindFirstUndefined: integer;
    property Items[Index: integer]: TDimSum read GetItem write SetItem; default;
    property HierCube: TCustomHierCube read FHierCube;
    property DimensionCount: Integer read GetDimCount;
    property SummaryCount: Integer read GetSumCount;
  end;

  TGridButton = class
  private
    FOwnerObject: TObject; 
  public
{$IFNDEF ASPRUNTIME}
    Rect: TRect;
    MouseOver: boolean; 
{$ENDIF}
    constructor Create(AnOwner: TObject);
    property OwnerObject: TObject read FOwnerObject;
  end;

  TCaptionNode = class
  private
    FDimID: integer;   
    FDimState: TDimensionState; 
    FLevelsCount: integer;      
    FDimOffset: integer;        
  public
    Rect, R: TRect;
    property DimID: integer read FDimID;
    property DimState: TDimensionState read FDimState;
    property LevelsCount: integer read FLevelsCount;
    property DimOffset: integer read FDimOffset;
  end;

  TCaptionNodes = class(TObjectArray)
  public
    {$IFNDEF ASPRUNTIME}
    function FindNodeXY(X, Y: integer; out GridButton: TGridButton): TCaptionNode;
    {$ENDIF}
  end;

  TDimMember = class(TPersistent)
  private
    FDimIndex: integer;          
    FChildMembers: TDimMembers;
    FParent: TDimMember;
    FCaption: WideString;           
    FVisible: boolean;
    FRank: integer;
    FIndex: integer;            
    FIsGroup: boolean;
    FDatabaseRank: integer;
    FOriginalID: WideString;        
    FID: WideString;                
    FIDHash: Longint;
    FMembers: TDimMembers;
    procedure MakeQualifiedName;
  public
    constructor Create(AParent: TDimMember);
    constructor CreateGroup(const ACaption: WideString);
    {$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
    {$ENDIF}
    function AddChild: TDimMember;
    function Clone: TDimMember;
    procedure Assign(Source: TPersistent); override;
    procedure SetRecursiveVisible(Value: boolean);
    procedure CheckConsistent;
    function BelongsToGroup: boolean;
    function GetGroup: TDimMember;
    function Delete: TDimMember;
    property DimIndex: integer read FDimIndex;
    property ChildMembers: TDimMembers read FChildMembers write FChildMembers;
    property Parent: TDimMember read FParent write FParent;
    property Caption: WideString read FCaption write FCaption;
    property Visible: boolean read FVisible write FVisible;
    property Rank: integer read FRank write fRank;
    property Index: integer read FIndex;
    property DatabaseRank: integer read FDatabaseRank;
    property IsGroup: boolean read FIsGroup write FIsGroup;
    property ID: WideString read FID;
    property QualifiedName: WideString read FID;
    property QualifiedNameHash: Longint read FIDHash;
    property Members: TDimMembers read FMembers;
  end;

  TDimMembers = class(TObjectArray)
  private
    FCaseSensitive: boolean;
    procedure InitFromTDimension(Dim: TDimension; const Attribute: WideString);
    function FindMember(const StringID: WideString; Dim: TDimension): TDimMember; overload;
    function FindMember(IntegerID: integer; Dim: TDimension): TDimMember; overload;
    function FindQualifiedNameHash(Hash: integer): TDimMember;
    procedure MoveToChildren(Index: integer; newParent: TDimMember);
    procedure SetAllVisible(Visible: boolean);
    procedure CorrectVisible;
    procedure MakeQualifiedNames;
  public
    procedure Assign(Source: TPersistent); override;
    procedure DeleteMember(Member: TDimMember; DeleteGroup: boolean);
    function MoveToGroup(SourceMember, TargetGroup: TDimMember): boolean;
    function Add(DimMember: TDimMember): Integer;
    procedure UpdateRanks;
    function FindDimIndex(DimIndex: integer): TDimMember;
    function FindGroupCaption(const Caption: WideString): integer; overload;
    function FindGroupCaption(const Caption: WideString; StartIndex: integer): integer; overload;
    property CaseSensitive: boolean read FCaseSensitive write FCaseSensitive;
  end;

  TCompareProc = function(DimState: TDimensionState; Index1, Index2: integer): integer;

  TSaveMember = class(TStreamedObject)
  private
    FIntegerID: integer;        
    FStringID: WideString;      
    FIsGroup: boolean;          
    FGroupCaption: WideString;  
    FGroupID: integer;          
    FHidden: boolean;           
    FGrouped: boolean;          
    FParentGroup: integer;      
    FQualifiedNameHash: Longint; 
  public
    procedure WriteStream(Stream: TStream); override;
    procedure ReadStream(Stream: TStream); override;
    function StreamSize: integer; override;

    property IntegerID: integer read FIntegerID;
    property StringID: WideString read FStringID;
    property IsGroup: boolean read FIsGroup;
    property GroupCaption: WideString read FGroupCaption;
    property GroupID: integer read FGroupID;
    property Hidden: boolean read FHidden;
    property Grouped: boolean read FGrouped;
    property ParentGroup: integer read FParentGroup;
    property QualifiedNameHash: Longint read FQualifiedNameHash;
  end;

  TMemberKeyType = (ktUnknown, ktIntegerKey, ktStringKey, ktQualifiedNameHash);

  TSaveMembers = class(TStreamedObjectArray)
  private
    FStrID: boolean;      
    FKeyType: TMemberKeyType;
  public
    property StrID: boolean read FStrID;
    procedure WriteStream(Stream: TStream); override;
    procedure ReadStream(Stream: TStream); override;
    function StreamSize: integer; override;
    property KeyType: TMemberKeyType read FKeyType;
  end;

  TStreamedDimState = class(TStreamedObject)
  private
    FRange: CubeInteger;
    FAttribute: WideString;
    FFieldName: WideString;
    FDisplayName: WideString;
    FDimGroup: TDimGroup;
    FSortType: TDimSortType;
    FSaveMembers: TSaveMembers;
    FTotalAppearance: TTotalAppearance;
    FCaseSensitive: boolean;
  public
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}

    procedure WriteStream(Stream: TStream); override;
    procedure ReadStream(Stream: TStream); override;
    function StreamSize: integer; override;

    property FieldName: WideString read FFieldName;
    property DisplayName: WideString read FDisplayName;
    property SortType: TDimSortType read FSortType;
    property DimGroup: TDimGroup read FDimGroup;
    property Range: CubeInteger read FRange;
    property TotalAppearance: TTotalAppearance read FTotalAppearance;
    property Attribute: WideString read FAttribute;
    property SaveMembers: TSaveMembers read FSaveMembers;
    property CaseSensitive: boolean read FCaseSensitive;
  end;

  TStreamedDimStates = class(TStreamedObjectArray)
  public
    procedure ReadStream(Stream: TStream); override;
  end;

  TDimensionStates = class;
  TDimensionState = class(TPersistent)
  private
    fGridInfo: TGridInfo;
    fDimID: integer;            
    fDim: TDimension;           
    fSortRank: TIntegerArray;
    fIndexSortRank: TIntegerArray;
    FOpenLevels: integer;               
    FDimGroup: TDimGroup;
    FRange: CubeInteger;                
    FTotalAppearance: TTotalAppearance;
    FMemberCount: integer;              
    FLevels: TIntegerArray;             
    FLeafCounts: TIntegerArray;         
    FHighParents: TIntegerArray;        
    FChildrenList: TChildrenList;       
    FLevelsCount: integer;              
    FItems: TIntegerArray;              
    FParents: TIntegerArray;
    FIndexConversion: TIntegerArray;    
    FMembers: TDimMembers;              
    FGroups: TDimMembers;
    FAllDimMembers: TPointerArray;      
    FFiltered: boolean;
    FDisplayName: WideString;
    FAttribute: WideString;
    FDimensionStates: TDimensionStates;
    FCaseSensitive: boolean;

    FSortedOriginalIDs: TIntegerArray;
    FSortedIDs: TIntegerArray;
    FHierRange: longword;               

    procedure GetIndexSortRank;
    procedure SetTotalAppearance(Value: TTotalAppearance);
    procedure SetSortType(Value: TDimSortType);
    procedure CalcFiltered;
    function DoGetVisible(Index: integer): boolean;
    procedure DoSetVisible(Index: integer; Value: boolean);
    function DoMove2Group(Value, GroupIndex: integer): boolean; overload;
    function DoMove2Group(Value: integer; const GroupCaption: WideString): boolean; overload;
    function DoClearGroup(GroupIndex: integer; DeleteGroup: boolean): boolean;
    function DoRemoveFromGroup(Value: integer; out GroupIndex: integer): boolean;
    function BuildLevelConversionArray(Level: integer): TIntegerArray;

    function GetFieldName: WideString;
    procedure SetAttribute(const Value: WideString);
    procedure QuickSort(L, R: Integer; Compare: TCompareProc);
    procedure InitFromDimension(ADimID: integer; ADim: TDimension);
    function BuildSaveMembers(MembersSaveMode: TMembersSaveMode): TSaveMembers;
    procedure RestoreSaveMembers(SaveMembers: TSaveMembers; RestoreMode: TMembersRestoreMode);
    function DoGetIsGroup(Index: integer): boolean;
    procedure InitGroups;
    function DoGetDatabaseRank(Index: integer): integer;
    procedure RebuildSortedOriginalIDs;
    procedure RebuildSortedIDs;
    procedure SetCaseSensitive(Value: boolean);
    {$IFDEF ASPRUNTIME}
    function BuildStateString: string;
    {$ENDIF}
    function FindOriginalID(out Index: integer; const OriginalID: WideString): boolean;
    function FindID(out Index: integer; const ID: WideString): boolean;
    function DoFindMember(out Index: integer; const Member: WideString): boolean;
    procedure DoSetCaption(Index: integer; const Value: WideString);
    function DoGetCaption(Index: integer): WideString;
    function GetQualifiedName(Index: integer): WideString;
  public
    fSortType: TDimSortType;
    constructor Create(AGridInfo: TGridInfo);
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}

    procedure RegisterChange(ChangeType: integer);
    procedure FullRebuild;
    procedure RebuildMembers(SortChanged: boolean);
    procedure Sort(ASortType: TDimSortType);
    function BuildStreamedDimState(MembersSaveMode: TMembersSaveMode): TStreamedDimState;
    procedure RestoreStreamedDimState(StreamedDimState: TStreamedDimState; RestoreMode: TMembersRestoreMode);

    property IndexConversion: TIntegerArray read FIndexConversion;
    property GridInfo: TGridInfo read FGridInfo;
    property DimMembers: TDimMembers read FMembers write FMembers;
    property DimGroups: TDimMembers read FGroups write FGroups;
    function FindMember(const AQualifiedName: WideString): integer;
    function AddGroup(const GroupCaption: WideString): integer;
    procedure MoveToGroup(Index, GroupIndex: integer); overload;
    procedure MoveToGroup(Index: integer; const GroupCaption: WideString); overload;
    procedure MoveToGroup(const Member: WideString; const GroupCaption: WideString); overload;
    procedure MoveToGroup(const Member: WideString; GroupIndex: integer); overload;
    procedure RemoveFromGroup(Index: integer); overload;
    procedure RemoveFromGroup(const Member: WideString); overload;
    procedure ClearGroup(GroupIndex: integer); overload;
    procedure ClearGroup(const GroupCaption: WideString); overload;
    procedure DeleteGroup(GroupIndex: integer); overload;
    procedure DeleteGroup(const GroupCaption: WideString); overload;
    function FindGroup(const GroupCaption: WideString): integer;
    function GetMemberGroup(Index: integer): integer;
    function GetIsGroup(Index: integer): boolean; overload;
    function GetIsGroup(const Member: WideString): boolean; overload;
    function GetVisible(Index: integer): boolean; overload;
    function GetVisible(const Member: WideString): boolean; overload;
    procedure SetVisible(Index: integer; Value: boolean); overload;
    procedure SetVisible(const Member: WideString; Value: boolean); overload;
    function GetCaption(Index: integer): WideString; overload;
    function GetCaption(const Member: WideString): WideString; overload;
    procedure SetCaption(Index: integer; const Value: WideString); overload;
    procedure SetCaption(const Member: WideString; const Value: WideString); overload;
    function GetDatabaseRank(Index: integer): integer; overload;
    function GetDatabaseRank(const Member: WideString): integer; overload;
    function GetChildrenCount(Index: integer): integer; 
    function HasChildren(Index: integer): boolean;      
    function IsLeaf(Index: integer): boolean;           
    function HasLookupTable: boolean;
    function GetMemberAsString(Index: integer): WideString;
    procedure SetDisplayName(const Value: WideString);
    function GetFirstChildrenIndex(Index: integer): integer;
    function GetNextChildrenIndex(Index, ChildIndex: integer): integer;
    function GetParentIndex(Index: integer): integer;
    function GetLevel(Index: integer): integer;
    function GetLeafCount(Index: integer): integer;
    function GetMemberID(Index: integer): variant;
    function FindIndexByID(MemberID: variant): integer;
    function HasAsAncestor(Index, AncestorIndex: integer): boolean;
    function CompareLongMonthNames(Index1, Index2: integer): integer;
    function CompareShortMonthNames(Index1, Index2: integer): integer;
    function CompareLongDayNames(Index1, Index2: integer): integer;
    function CompareShortDayNames(Index1, Index2: integer): integer;
    function CompareCaptions(Index1, Index2: integer): integer;
    function CompareDatabaseRanks(Index1, Index2: integer): integer;
    function CompareIntegerMembers(Index1, Index2: integer): integer;
    function CompareIntegerMembersDesc(Index1, Index2: integer): integer;
    procedure ChangeAttribute(const Attr: WideString; UpdateCaptions: boolean);
    function SameName(const DimensionName: WideString): boolean;
    property Dim: TDimension read fDim;
    property DimID: integer read fDimID;
    property Visible[Index: integer]: boolean read DoGetVisible write DoSetVisible;
    property IsGroup[Index: integer]: boolean read DoGetIsGroup;
    property DatabaseRank[Index: integer]: integer read DoGetDatabaseRank;
    property Items: TIntegerArray read FItems;
    property Caption[Index: integer]: WideString read DoGetCaption write DoSetCaption;
    property QualifiedName[Index: integer]: WideString read GetQualifiedName;
    property Filtered: boolean read FFiltered;
    property SortType: TDimSortType read fSortType write SetSortType;
    property DimGroup: TDimGroup read FDimGroup write FDimGroup;
    property TotalAppearance: TTotalAppearance read FTotalAppearance write SetTotalAppearance;
    property MemberCount: integer read FMemberCount;
    property SortRank: TIntegerArray read fSortRank;
    property LevelsCount: integer read FLevelsCount;
    property FieldName: WideString read GetFieldName;
    property DisplayName: WideString read FDisplayName write SetDisplayName;
    property OpenLevels: integer read FOpenLevels;
    property Attribute: WideString read FAttribute write SetAttribute;
    property CaseSensitive: boolean read FCaseSensitive write SetCaseSensitive;
  end;

  TDimensionStates = class(TObjectArray)
  private
    fGridInfo: TGridInfo;
    FUpdateCounter: integer;
    FChangedDimensions: TPointerArray;
    FChangeTypes: TIntegerArray;
    procedure CalcAllFiltered;
    procedure DoChange;
    procedure RegisterChange(DimState: TDimensionState; ChangeType: integer);
  public
    constructor Create(AGridInfo: TGridInfo);
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    function FindFieldName(const FieldName: WideString): TDimensionState;
    function FindDisplayName(const DisplayName: WideString): TDimensionState;
    function FindDimID(DimID: integer): TDimensionState;
    procedure BeginUpdate;
    procedure EndUpdate;
    function BuildStreamedDimStates(MembersSaveMode: TMembersSaveMode): TStreamedDimStates;
  end;

  TSummaryState = class
  private
    fGridInfo: TGridInfo;
    fSum: TSummary;
    fSumID: integer;
    fSummaryInfo: TSummaryInfo;

    FLoaded: boolean;

    FAllTotals: TObjectArray;  
    FFactTotals: TTotals;     
    function GetFieldName: WideString;
  public
    constructor Create(ASum: TSummary; ASumID: integer; AGridInfo: TGridInfo);
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    property Sum: TSummary read fSum;
    property SumID: integer read FSumID;
    property Loaded: boolean read FLoaded;
    property SumInfo: TSummaryInfo read fSummaryInfo;
    property FieldName: WideString read GetFieldName;
  end;

  TSummaryStates = class(TObjectArray)
  private
    fGridInfo: TGridInfo;

    FLineIDs: TInt64Array;           
    FAllOffsets: TObjectArray;       
    FFactOffsets: TCubeIntegerArray; 
    procedure InitArrays;
    procedure ClearTotals;
  public
    constructor Create(AGridInfo: TGridInfo);
    constructor CreateCount(AGridInfo: TGridInfo; ACount: integer);
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    function FindFieldName(const FieldName: WideString): TSummaryState;
    function FindDimensionMapIndex(ADimMapIndex: integer): TSummaryState;
  end;

  TLabelNodes = class;
  TSubLevelNodes = class;

  TLabelNode = class
  private
    FValue: integer;       { Dimension member index }
    FDimID: integer;       { Global dimension id }
    FDimState: TDimensionState; { Dimension state object }
    FParent: TLabelNode;   { Parent node }
    FChildNodes: TLabelNodes; { The list of child nodes }
    FValueExpanded: boolean;    { True, if node's expanded at the moment }
    FSubLevelNodes: TPointerArray;  
    FDimLevel: integer;      
    FDimOffset: integer;     
    FHierButton: TGridButton;
    FValueButton: TGridButton;
    FHierExpanded: boolean;
    FRowIndex: integer; 
    FTreeIndex: integer;   
    FIndex: integer;    
    FLabelNodes: TLabelNodes;
    FQualifiedNameHashCode: Longint; 
    function GetDimValue: integer;
    function GetIsSubTotal: boolean;
    function GetLabelText: WideString;
    function GetGrandParent: TLabelNode;
    function GetIsGroup: boolean;
    function GetBelongsToGroup: boolean;
    function GetExpandable: boolean;
    function GetExpanded: boolean;
    function GetDatabaseRank: integer;
    function GetSortRank: integer;
    function GetDimGroup: TDimGroup;
    function GetQualifiedName: WideString;
  public
    Rect, R: TRect;
    constructor Create(AParent: TLabelNode);
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    function AddChild: TLabelNode;
    function AddSubLevelNode: TSubLevelNode;
{$IFNDEF ASPRUNTIME}
    function ContainsXY(X, Y: integer): boolean;
    function MouseOverButton(X, Y: integer): TGridButton;
{$ENDIF}
    procedure BuildAttributes(out Captions, Values: TWideStringArray);
    property DimValue: integer read GetDimValue;
    property IsSubTotal: boolean read GetIsSubTotal;
    property LabelText: WideString read GetLabelText;
    property Value: integer read FValue;
    property DimID: integer read FDimID;
    property Parent: TLabelNode read FParent;
    property ChildNodes: TLabelNodes read FChildNodes;
    property LabelNodes: TLabelNodes read FLabelNodes;
    property Expandable: boolean read GetExpandable;
    property SubLevelNodes: TPointerArray read FSubLevelNodes;
    property GrandParent: TLabelNode read GetGrandParent;   { Points to the grandmaster node if any, or nil }
    property DimLevel: integer read FDimLevel;
    property DimOffset: integer read FDimOffset;
    property DimState: TDimensionState read FDimState;
    property IsGroup: boolean read GetIsGroup;
    property BelongsToGroup: boolean read GetBelongsToGroup;
    property HierButton: TGridButton read FHierButton;
    property ValueButton: TGridButton read FValueButton;
    property HierExpanded: boolean read FHierExpanded;
    property ValueExpanded: boolean read FValueExpanded;
    property Expanded: boolean read GetExpanded;
    property DatabaseRank: integer read GetDatabaseRank;
    property QualifiedName: WideString read GetQualifiedName;
    property SortRank: integer read GetSortRank;
    property DimGroup: TDimGroup read GetDimGroup;
    property TreeIndex: integer read FTreeIndex;
    property Index: integer read FIndex;
  end;

  TLabelNodesCompare = function(LabelNodes: TLabelNodes; Index1, Index2: Integer; TotalAppearance: TTotalAppearance; Data: Longint): Integer of object;

  TLabelNodeProcedure = procedure(Node: TLabelNode; Params: pointer);

  TLabelNodes = class(TObjectArray)
  private
    FNodeCount: integer; 
  public
    function RebuildVisibleNodes: TPointerArray;
{$IFNDEF ASPRUNTIME}
    function FindNodeXY(X, Y: integer; out GridButton: TGridButton): TLabelNode;
{$ENDIF}
    function ForEachNode(proc: TLabelNodeProcedure; Params: pointer): integer;
    function FindTreeIndex(TreeIndex: integer): TLabelNode;
    function Add(Node: TLabelNode): Integer;
    property NodeCount: integer read FNodeCount;
  end;

  TSubLevelNodeType = (ltSummary, ltFunction, ltSubFunction);

  TSubLevelNode = class
  private
    FParent: TSubLevelNode;
    FChildNodes: TSubLevelNodes;
    FLabelNode: TLabelNode;        
    FLevel: integer;               { NodeLevel: 0 - summary, 1 - function, 2 - subfunction }
    FSumInfoID: integer; FSumInfo: TSummaryInfo;       { for FLevel >= 0 }
    FFun: TFunction;            { only for FLevel >= 1 }
    FSubFun: TSubFunction;      { only for FLevel = 2 }
    function GetText: WideString;
  public
    Rect, R: TRect;
    constructor Create(AParent: TSubLevelNode);
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    function AddChild: TSubLevelNode;
    property Parent: TSubLevelNode read FParent;
    property ChildNodes: TSubLevelNodes read FChildNodes;
    property LabelNode: TLabelNode read FLabelNode;
    property Level: integer read FLevel;
    property SumInfoID: integer read FSumInfoID;
    property SumInfo: TSummaryInfo read FSumInfo;
    property Fun: TFunction read FFun;
    property SubFun: TSubFunction read FSubFun;
    property Text: WideString read GetText;
  end;

  TSubLevelNodes = class(TObjectArray)
  {$IFNDEF ASPRUNTIME}
  public
    function FindNodeXY(X, Y: integer): TSubLevelNode;
  {$ENDIF}
  end;

  TValueSortType = (soAscending, soDescending, soNone);

  TValueSortData = class(TStreamedObject)
  private
    FNodeID: TIntegerArray;
    FSubFun: TSubFunction;
    FFun: TFunction;
    FSortType: TValueSortType;
    FSumFieldName: WideString;
  public
    constructor Create;
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}

    procedure WriteStream(Stream: TStream); override;
    procedure ReadStream(Stream: TStream); override;
    function StreamSize: integer; override;
    procedure Assign(Source: TPersistent); override;

    procedure SaveLabelNode(Node: TLabelNode);
    procedure ResetLabelNode;
    function ThisLabelNode(Node: TLabelNode): boolean;
    function FindVisibleSubLevelNode(VisibleSubLevelNodes: TPointerArray): integer;
    property NodeID: TIntegerArray read FNodeID;
    property SortType: TValueSortType read FSortType write FSortType;
    property Fun: TFunction read FFun write FFun; 
    property SubFun: TSubFunction read FSubFun write FSubFun; 
    property SummaryFieldName: WideString read FSumFieldName write FSumFieldName;
  end;

{$IFNDEF ASPRUNTIME}
  PDataCell = ^TDataCell;
{$ENDIF}
  TDataCell = record
    Data: Double;
    NotEmpty: boolean;
  end;
{$IFDEF ASPRUNTIME}
  PDataCell = TDataCell;
{$ENDIF}

  TFuncData = class
  private
{$IFDEF ASPRUNTIME}
    FArray: array of array of PDataCell;
{$ELSE}
    FArray: pointer;
{$ENDIF}
    FWidth: integer;
    FHeight: integer;
    function GetItem(Col, Row: integer): PDataCell;
{$IFDEF ASPRUNTIME}
  public
    procedure SetItem(Col, Row: integer; const Value: PDataCell);
{$ENDIF}
  public
    constructor Create(AWidth, AHeight: integer);
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    property Width: integer read FWidth;
    property Height: integer read FHeight;
{$IFDEF ASPRUNTIME}
    property Items[Col, Row: integer]: PDataCell read GetItem write SetItem; default;
{$ELSE}
    property Items[Col, Row: integer]: PDataCell read GetItem; default;
{$ENDIF}
  end;

  TGridSubFunctionArray = class
  private
    FSubFunctions: TIntegerArray;
    FFuncDataList: TObjectArray; 
  public
    constructor Create;
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    property SubFunctions: TIntegerArray read FSubFunctions;
    property FuncDataList: TObjectArray read FFuncDataList;
  end;

  TGridFunctionArray = class
  private
    FFunctions: TIntegerArray;
    FFuncDataList: TObjectArray; 
    FGridSubFunctinList: TObjectArray; 
  public
    constructor Create;
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    property Functions: TIntegerArray read FFunctions;
    property FuncDataList: TObjectArray read FFuncDataList;
    property GridSubFunctinList: TObjectArray read FGridSubFunctinList;
  end;

  TGridSummaryArray = class
  private
    FSumInfoIDs: TIntegerArray;
    FGridFunctionList: TObjectArray; 
    FGridInfo: TGridInfo;
  public
    constructor Create(AGridInfo: TGridInfo);
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    function GetData1(Row, Col, SumInfoID: integer; Fun: TFunction; SubFun: TSubFunction; out Res: Double): boolean; overload;
    function GetData2(RowNode, ColNode: TLabelNode; SumInfoID: integer; Fun: TFunction; SubFun: TSubFunction; out Res: Double): boolean; overload;
    function GetFuncData(SumInfoID: integer; Fun: TFunction; SubFun: TSubFunction): TFuncData;
    property SumInfoIDs: TIntegerArray read FSumInfoIDs;
    property GridFunctionList: TObjectArray read FGridFunctionList;
  end;

  TOpenDimNodes = class;

  TOpenDimNode = class(TStreamedObject)
  private
    FChildNodes: TOpenDimNodes;
    FParent: TOpenDimNode;
    FValue: integer;
    FLevel: integer;
    FDimID: integer;
    FHier: boolean;
    FUseQualifiedNameHash: boolean;
    FQualifiedNameHash: Longint;
  public
    constructor Create(AParent: TOpenDimNode);
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    function AddChild: TOpenDimNode;

    procedure WriteStream(Stream: TStream); override;
    procedure ReadStream(Stream: TStream); override;
    function StreamSize: integer; override;

    property ChildNodes: TOpenDimNodes read FChildNodes;
    property Parent: TOpenDimNode read FParent;
    property Value: integer read FValue;
    property Level: integer read FLevel;
    property DimID: integer read FDimID;
    property Hier: boolean read FHier;
    property QualifiedNameHash: Longint read FQualifiedNameHash;
  end;

  TOpenDimNodes = class(TStreamedObjectArray)
  public
    procedure ReadStream(Stream: TStream); override;
    procedure SaveLabelNodes(LabelNodes: TLabelNodes);
  end;

  TPivotState = class(TStreamedObject)
  private
    FRowDimIDs: TWideStringArray;
    FColDimIDs: TWideStringArray;
    FOpenRowNodes: TOpenDimNodes;
    FOpenColNodes: TOpenDimNodes;
    FStreamedDimStates: TStreamedDimStates;
    FStreamedSummarySettings: TStreamedSummarySettings;
    FValueSortData: TValueSortData;
  public
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    procedure SaveState(GridInfo: TGridInfo; MembersSaveMode: TMembersSaveMode);
    procedure FreeAll;

    procedure WriteStream(Stream: TStream); override;
    procedure ReadStream(Stream: TStream); override;
    function StreamSize: integer; override;

    property RowDimIDs: TWideStringArray read FRowDimIDs;
    property ColDimIDs: TWideStringArray read FColDimIDs;
    property OpenRowNodes: TOpenDimNodes read FOpenRowNodes;
    property OpenColNodes: TOpenDimNodes read FOpenColNodes;
    property StreamedDimStates: TStreamedDimStates read FStreamedDimStates;
    property StreamedSummarySettings: TStreamedSummarySettings read FStreamedSummarySettings;
    property ValueSortData: TValueSortData read FValueSortData;
  end;

  TPivotStates = class(TStreamedObjectArray)
  private
    FNames: TWideStringArray;
    FGridInfo: TGridInfo;
  public
    constructor Create(AGridInfo: TGridInfo);
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    procedure Clear; override;
    function Add(const Name: WideString): TPivotState;
    function Delete(const Name: WideString): boolean; reintroduce;
    function FindState(const Name: WideString): integer;

    procedure WriteStream(Stream: TStream); override;
    procedure ReadStream(Stream: TStream); override;
    function StreamSize: integer; override;

    property Names: TWideStringArray read FNames;
  end;

{$IFNDEF ASPRUNTIME}
  TColoredCoord =  record
    Col, Row: integer;
  end;
  PColoredCoord = ^TColoredCoord;

  TColoredCells = class(TInt64Array)
  private
    FSumID: integer;
    FFun: TFunction;
    FSubFun: TSubFunction;
    FMi: double;
    FMa: double;
    function GetItem(Index: integer): PColoredCoord;
  public
    function FindColRowItem(Col, Row: integer): PColoredCoord;
    property Items[Index: integer]: PColoredCoord read GetItem; default;
    property SumID: integer read FSumID;
    property Fun: TFunction read FFun;
    property SubFun: TSubFunction read FSubFun;
    property Mi: double read FMi;
    property Ma: double read FMa;
  end;
{$ENDIF}

  TSubFunctionCalculatorArgs = class(TEventArgs)
  private
    FColLabelNode: TLabelNode;
    FRowLabelNode: TLabelNode;
    FFunctionData: TFuncData;
    FSumInfo: TSummaryInfo;
    FSumInfoID: integer;
    FRowTreeIndex: integer;
    FColTreeIndex: integer;
    FSumIndex: TIntegerArray;
    FGridInfo: TGridInfo;
    FFun: TFunction;
  public
    constructor Create(AGridInfo: TGridInfo);
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    procedure Clear; override;
    property ColLabelNode: TLabelNode read FColLabelNode;
    property RowLabelNode: TLabelNode read FRowLabelNode;
    property RowTreeIndex: integer read FRowTreeIndex;
    property ColTreeIndex: integer read FColTreeIndex;
    property FunctionData: TFuncData read FFunctionData;
    property SumInfo: TSummaryInfo read FSumInfo;
    property SumInfoID: integer read FSumInfoID;
    property Fun: TFunction read FFun;
    property SumIndex: TIntegerArray read FSumIndex;
    property GridInfo: TGridInfo read FGridInfo;
  end;

  TSubFunctionCalculator = function(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean of object;

  TOnGetSubFunctionCalculator = procedure(Sender: TObject; SubFun: TSubFunction; var Calculator: TSubFunctionCalculator) of object;

  TInitPivotStateArgs = class(TEventArgs)
  private
    FStream: TStream;
    FRestoreMode: TMembersRestoreMode;
    FDestroyStream: boolean;
  public
    constructor Create;
    property Stream: TStream read FStream write FStream;
    property RestoreMode: TMembersRestoreMode read FRestoreMode write FRestoreMode;
    property DestroyStream: boolean read FDestroyStream write FDestroyStream;
  end;

  TInitPivotStateEvent = procedure(Sender: TObject; Args: TInitPivotStateArgs) of object;
  
  {$IFNDEF ASPRUNTIME}
  PGridLayout = ^TGridLayout;
  {$ENDIF}
  TGridLayout = record
    ColCount, RowCount,
    DimsCol, DimsRow,
    OffsetCol, OffsetRow,
    FixedCols, FixedRows: integer;
  end;
  {$IFDEF ASPRUNTIME}
  PGridLayout = TGridLayout;
  {$ENDIF}

  {$IFDEF ASPRUNTIME}
  TDoubleFunctionsArray = class(TRecordArray)
  protected
    procedure WriteContents(AStream: TStream); override;
    procedure ReadContents(AStream: TStream); override;
  end;

  TGridInfo = class(TPersistent)
  {$ELSE}
  TGridInfo = class(TWinControl)
  {$ENDIF}
  private
    FCube: TCustomHierCube;             
    FChangeCount: integer;
    FGridLayout: TGridLayout;
    FRowMax: Integer;             
    FColMax: Integer;             
    FVisibleRowNodes: TPointerArray; 
    FVisibleColNodes: TPointerArray; 
    FVisibleColSubLevelNodes: TPointerArray; 

    FRowDimIDs: TIntegerArray; 
    FColDimIDs: TIntegerArray; 
    FPageDimIDs: TIntegerArray;

    FRowLabelNodes: TLabelNodes;
    FColLabelNodes: TLabelNodes;
    FColSubLevelNodes: TSubLevelNodes;
    FRowCaptionNodes: TCaptionNodes;
    FColCaptionNodes: TCaptionNodes;
    {$IFNDEF ASPRUNTIME}
    FScreenCursor: TCursor;
    FGrid: TWinControl;
    {$ENDIF}
    FGridSummaryArray: TGridSummaryArray;
    FVisibleRowDimIDs: TIntegerArray; 
    FVisibleColDimIDs: TIntegerArray; 
    FGridColsOnValue: integer; 
    FValueSortData: TValueSortData;
    FOpenRowNodes: TOpenDimNodes;
    FOpenColNodes: TOpenDimNodes;
    {$IFNDEF ASPRUNTIME}
    FColoredCells: TColoredCells;
    FColorSchema: TxhcColorSchema;
    {$ENDIF}
    FSummaryStates: TSummaryStates;
    FPivotStates: TPivotStates;
    FLinkedControls: TList;
    FIntegerArray1: TIntegerArray;
    FIntegerArray2: TIntegerArray;
    FIntegerArray3: TIntegerArray;
    FIntegerArray4: TIntegerArray;
    FIntegerArray5: TIntegerArray;
    FIntegerArray10: TIntegerArray;
    FIntegerArray11: TIntegerArray;
    fSummarySettings: TSummarySettings;

    FAfterMoveDim: THierCubeAfterMoveDimEvent;
    FAfterSwapDims: THierCubeAfterSwapDimsEvent;
    FBeforeMoveDim: THierCubeBeforeMoveDimEvent;
    FBeforeSwapDims: THierCubeBeforeSwapDimsEvent;
    FBeforePivot: TPivotEvent;
    FAfterPivot: TPivotEvent;

    FOnExpandDimValue: THierCubeOnExpandDimValueEvent;
    {$IFNDEF ASPRUNTIME}
    FOnEditFactTableEvent: TOnEditFactTableEvent;
    FOnGetFactTableEditor: TOnGetFactTableEditorEvent;
    {$ENDIF}

    FWordWrap: boolean;
    FCubeCapacity: CubeInteger;
    FLowestSubLevelNode: TSubLevelNodeType;
    FFunctionDisplayed: TFunction;
    FSubFunctionDisplayed: TSubFunction;
    FDimensionStates: TDimensionStates;
    FOnCompareDimensionMembers: TOnCompareDimensionMembers;
    FDeletedFTIndexes: TIntegerArray;    
    FModifiedFTIndexes: TIntegerArray;   
    FDimensionEditorFilterOn: boolean;

    {$IFNDEF ASPRUNTIME}
    FUserDataset: TxhMemoDataSet;
    {$ENDIF}
    fFunctionDefs: TFunctionDefs;
    FSubFunctionDefs: TSubFunctionDefs;
    FOnCalcAggregateFunction: TOnCalcAggregateFunctionEvent;
    FCurrentPivotStateName: WideString;
    FOnSavePivotState: TPivotStateEvent;
    FOnDeletePivotState: TPivotStateEvent;
    FPivotEventArgs: TPivotEventArgs;

    FFormatNulls: boolean;
    FShowAbsentTuples: boolean;
    FOnGetSubFunctionCalculator: TOnGetSubFunctionCalculator;
    FDatasetStringSize: integer;
    FOnInitPivotState: TInitPivotStateEvent;
    FInitPivotStateArgs: TInitPivotStateArgs;
    {$IFDEF ASPRUNTIME}
    procedure CMHierCubeMessage(event: THierCubeEvent);
    {$ELSE}
    procedure CMHierCubeMessage(var Msg: TCMHierCubeMessage); message CM_HIERCUBEMESSAGE;
    procedure NotifyLinkedControls(AEvent: TGridInfoEvent; Flags: longint);
    {$ENDIF}
    procedure InitPivotState;
    procedure NilAllArrays;
    procedure SyncSummaries;
    procedure SyncSummaries2;
    procedure SetupData;
    procedure SetupSummaryData;
    procedure RebuildCaptionNodes;
    procedure UpdateOpenLevels(LabelNodes: TLabelNodes; FVisibleDimIDs: TIntegerArray);
    procedure RebuildLookups;
    procedure PrecalcRootLines;
    procedure PrecalcOnExpand(LabelNode: TLabelNode; NextDimID: integer);
    procedure RebuildLabelNodes;
    procedure SortVisibleDimIDs;
    procedure RebuildGridSummaryArray;
    function CalcSubFunction(SumInfoID: integer; Fun: TFunction; SubFun: TSubFunction): boolean;
    function CalcPercentAlongRow(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
    function CalcPercentAlongCol(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
    function CalcRankAlongCol(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
    function CalcRankAlongRow(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
    function CalcCompareWithPrevAlongCol(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
    function CalcCompareWithPrevAlongRow(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
    function CalcCumulativeSumAlongCol(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
    function CalcCumulativeSumAlongRow(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;

    function BuildRootLabelNodes(DimIDs: TIntegerArray; var LabelNodes: TLabelNodes): integer;
    procedure DoExpandLabelNode(Node: TLabelNode; DimIDs: TIntegerArray);
    procedure DoExpandHierLabelNode(Node: TLabelNode; DimIDs: TIntegerArray);
    procedure DoCollapseLabelNode(Node: TLabelNode; DimIDs: TIntegerArray);
    procedure CalcExpandable(Node: TLabelNode; DimIDs: TIntegerArray);
    procedure CalcExpandable2(Node: TLabelNode; DimIDs: TIntegerArray);
    procedure DoExpandAllNodes(DimState: TDimensionState; DimIDs: TIntegerArray; LabelNodes: TLabelNodes);
    procedure DoCollapseAllNodes(DimState: TDimensionState; DimIDs: TIntegerArray; LabelNodes: TLabelNodes);

    procedure RecalcNodeOffsets(const DimIDs: TIntegerArray; const Nodes: TLabelNodes);
    procedure RebuildVisibleNodes;
    procedure RebuildVisibleDimIDs;
    procedure RebuildColSubLevelNodes;
    procedure SortLookups(SortRows, SortCols: boolean);
    function LabelNodesRankSort(Nodes: TLabelNodes; DimGroup: TDimGroup): boolean;
    function SortLabelNodesByValue: boolean;
    function GetVisibleDataRows: integer;
    function GetVisibleDataCols: integer;
    function GetActiveColDimsCount: Integer;
    function GetActiveRowDimsCount: Integer;
    procedure RestoreLabelNodes(DimGroup: TDimGroup; OpenDimNodes: TOpenDimNodes);
    procedure DoSwapDimIDs(DimState1, DimState2: TDimensionState; out PageAreaChanged: boolean);
    procedure DoMoveDim(DimID: integer; NewDimGroup: TDimGroup; NewIndex: integer; out PageAreaChanged: boolean);
    procedure DoRestorePivotState(PivotState: TPivotState; RestoreMode: TMembersRestoreMode);
    function GetActive: boolean;
    {$IFNDEF ASPRUNTIME}
    procedure SetCube(Value: TCustomHierCube);
    {$ENDIF}
    procedure SortDimIDsByDimLength(DimIDs: TIntegerArray);
    function NewActiveDimIDs: boolean;
    procedure InitSumIndexes;
    procedure InitSummaries;
    procedure InitFactTotals;
    procedure RebuildDimStates;
    {$IFDEF ASPRUNTIME}
    function BuildGridState: string;
    function GetMD5State: integer;
    {$ENDIF}
    procedure WriteCommonStream(Stream: TStream; StreamContent: TStreamContent; Buffer: pointer; Count: integer; SaveFactTable: boolean);
    procedure ReadCommonStream(Stream: TStream; Buffer: pointer; RestoreMode: TMembersRestoreMode);

    function DimIDs2Strings(DimIDs: TIntegerArray): TWideStringArray;
    function DimStrings2IDs(DimStrings: TWideStringArray): TIntegerArray;
    procedure SetWordArap(Value: boolean);
    procedure SetLowestSubLevelNode(Value: TSubLevelNodeType);
    function SumIndex2CalcOffset(SumIndex: TIntegerArray): CubeInteger; {$IFDEF ASPRUNTIME} unsafe; {$ENDIF}
    function CalcOffset2SumIndexVisible(CalcOffset: CubeInteger; out SumIndex: TIntegerArray): boolean;
    function CalcOffset2SumIndex(CalcOffset: CubeInteger): TIntegerArray;
    function SumIndex2HierIndex(SumIndex: TIntegerArray): TIntegerArray;

    function CodeHierIndex(HierIndex: TIntegerArray): longword;
    function CalcLine(LineIndex, PackedHierIndex: longword; HierIndex: TIntegerArray): integer;
    function GetBaseLine(LineIndex: longword; HierIndex: longword): integer;
    procedure CalcLine3(SumState: TSummaryState; LineIndex: longword; PackedHierIndex: longword; HierIndex: TIntegerArray; ProcessedLine: TTotals; NeedMedian: boolean);
    procedure SetFunctionDefs(const Value: TFunctionDefs);
    procedure QuickSortLabelNodes(Nodes: TLabelNodes; L, R: Integer; Compare: TLabelNodesCompare; TotalAppearance: TTotalAppearance; Data: Longint);
    function LabelNodesCompareRanks(LabelNodes: TLabelNodes; Index1, Index2: Integer; TotalAppearance: TTotalAppearance; Data: Longint): Integer;
    function LabelNodesCompareValues(LabelNodes: TLabelNodes; Index1, Index2: Integer; TotalAppearance: TTotalAppearance; Data: Longint): Integer;
    function DoCompareValues(Node1, Node2: TLabelNode; Data: Longint): Integer;
    procedure SetFCurrentPivotStateName(const Value: WideString);
    function GetCurrentPivotState: TPivotState;
    function GetCellAggregateRecords(SumIndex: TIntegerArray): TIntegerArray; overload;
    function GetCellAggregateRecords(Row, Col: integer): TIntegerArray; overload;
    {$IFNDEF ASPRUNTIME}
    function FTRecordsToEditDataset(ARecords: TIntegerArray): TDataset;
    function FTRecordsToViewDataset(ARecords: TIntegerArray): TDataset;
    function BuildUserDataset(EditDataset: TxhMemoDataset): TxhMemoDataset;
    procedure FactTableEditorOnDeleteRecord(Dataset: TDataset);
    procedure FactTableEditorAfterPost(Dataset: TDataset);
    {$ELSE}
    function FTRecordsToViewDataset(ARecords: TIntegerArray): DataTable;
    {$ENDIF}
    procedure ChangeSummarySettings(SumCountChanged: boolean);
    procedure ChangeDimensionStates;
    function BuildSummarySortedArray(SumID: integer): TIntegerArray;
    function GetGridLayout: PGridLayout;
  public
    FActiveDimIDs: TIntegerArray;
    FActiveDimIndexes: TIntegerArray;
    constructor Create(AOwner: TComponent); {$IFNDEF ASPRUNTIME}override;{$ENDIF}
    function CreateSumIndex: TIntegerArray;
    destructor Destroy; override;
    function DefineCustomFunction(const DisplayName: WideString): TFunction;
    function DimID2LocalIndex(DimID: integer): integer;
    procedure BeginChange;
    procedure EndChange(AEvent: TGridInfoEvent; Flags: longword);
    procedure RebuildActiveDimIDs;
    procedure CheckNewDimension(OldDimID, DimID: integer);
    procedure CheckNewActiveDimensions(DimIDs: TIntegerArray);
    function BuildExportStructure: TGridExportStructure;

    procedure LoadFromStream(Stream: TStream; Buffer: pointer = nil; RestoreMode: TMembersRestoreMode = rmRestoreHidden);
    procedure SaveToStream(Stream: TStream; StreamContent: TStreamContent; SaveFactTable: boolean; Buffer: pointer = nil; Count: integer = 0);
    procedure LoadFromFile(const FName: WideString; Buffer: pointer = nil; RestoreMode: TMembersRestoreMode = rmRestoreHidden);
    procedure SaveToFile(const FName: WideString; StreamContent: TStreamContent; Buffer: pointer = nil; Count: integer = 0);

    procedure SaveUncompressed(Stream: TStream; StreamContent: TStreamContent; SaveFactTable: boolean; Buffer: pointer = nil; Count: integer = 0); overload;
    procedure SaveUncompressed(const FName: WideString; StreamContent: TStreamContent; SaveFactTable: boolean; Buffer: pointer = nil; Count: integer = 0); overload;
    {$IFNDEF ASPRUNTIME}
    procedure UpdateCubeFactTable(EditDataset: TxhMemoDataset; SumInfo: TSummaryInfo);
    function EditFactTable(Row, Col, DataRow, DataCol: integer): boolean;
    procedure AddLinkedControl(Control: TWinControl);
    procedure RemoveLinkedControl(Control: TWinControl);
    function BuildCellDataset(Row, Col: integer): TDataSet; overload;
    function BuildCellDataset(SumIndex: TIntegerArray): TDataSet; overload;
    function BuildViewDataset(Row, Col: integer): TDataSet; overload;
    function BuildViewDataset(SumIndex: TIntegerArray): TDataSet; overload;
    {$ELSE}
    function BuildViewDataset(Row, Col: integer): DataTable; overload;
    function BuildViewDataset(SumIndex: TIntegerArray): DataTable; overload;
    {$ENDIF}
    function GetDimensionName(DimID: integer): WideString;
    function GetSummaryName(SumID: integer): WideString;
    function GetDimensionDisplayName(DimID: integer): WideString;
    function GetSummaryDisplayName(SumID: integer): WideString;
    function GetDimensionMemberAsString(DimID: Integer; ValueIndex: Integer): WideString;
    function RowColNodes2SumIndex(RowLabelNode, ColLabelNode: TLabelNode): TIntegerArray;
    procedure ScanFromLabelNode(LabelNode: TLabelNode; SumIndex: TIntegerArray);
    procedure Col2SumFun(ACol: integer; out SumInfoID: integer; out Fun: TFunction; out SubFun: TSubFunction);
    function RowCol2SumIndex(ARow, ACol: integer): TIntegerArray; overload;
    function RowCol2SumIndex(ARow, ACol: integer; out SumInfoID: integer; out Fun: TFunction; out SubFun: TSubFunction): TIntegerArray; overload;
    function GetDataAsDouble(ARow, ACol: integer; out Res: Double): boolean; overload;
    function GetDataAsDouble(RowNode, ColNode: TLabelNode; SumInfoID: integer;
      Fun: TFunction; SubFun: TSubFunction; out Res: Double): boolean; overload;
    function GetDataAsDouble(RowNode: TLabelNode; ACol: integer; out Res: Double): boolean; overload;
    function GetDataAsDouble1(ARow, ACol: integer; out Res: Double): boolean;
    function GetDataAsDouble2(RowNode, ColNode: TLabelNode; SumInfoID: integer;
      Fun: TFunction; SubFun: TSubFunction; out Res: Double): boolean;
    function GetDataAsDouble3(RowNode: TLabelNode; ACol: integer; out Res: Double): boolean;
    function ActiveGroupCubeIndex2DimID(DimGroup: TDimGroup; Index: Integer): integer;
    procedure SwapDims(DimGroup1, DimGroup2: TDimGroup; Index1, Index2: integer); overload;
    procedure SwapDims(DimID1, DimID2: integer); overload;
    procedure SwapDims(DimState1, DimState2: TDimensionState); overload;
    procedure SwapDims1(DimGroup1, DimGroup2: TDimGroup; Index1, Index2: integer);
    procedure SwapDims2(DimID1, DimID2: integer);
    procedure SwapDims3(DimState1, DimState2: TDimensionState);
    procedure MoveDim(DimGroup, NewDimGroup: TDimGroup; Index, NewIndex: integer); overload;
    procedure MoveDim(DimID: integer; NewDimGroup: TDimGroup; NewIndex: integer); overload;
    procedure MoveDim(DimState: TDimensionState; NewDimGroup: TDimGroup; NewIndex: integer); overload;
    procedure MoveDim1(DimGroup, NewDimGroup: TDimGroup; Index, NewIndex: integer);
    procedure MoveDim2(DimID: integer; NewDimGroup: TDimGroup; NewIndex: integer);
    procedure MoveDim3(DimState: TDimensionState; NewDimGroup: TDimGroup; NewIndex: integer);
    procedure DrillUp(Node: TLabelNode);
    procedure DrillDown(Node: TLabelNode; Hier: boolean);
    procedure ExpandAllNodes(DimState: TDimensionState); overload;
    procedure ExpandAllNodes(const DimensionName: WideString); overload;
    procedure CollapseAllNodes(DimState: TDimensionState); overload;
    procedure CollapseAllNodes(const DimensionName: WideString); overload;
    procedure ChangeDrillState(DimState: TDimensionState);
    procedure ChangeFilterState(DimState: TDimensionState);
    procedure ChangeAggregate(SumCountChanged: boolean);
{$IFNDEF ASPRUNTIME}
    procedure RebuildColoredCells(ARow, ACol: integer);
{$ENDIF}
    procedure HideMembersBelow(LabelNode: TLabelNode);
    procedure HideMembersExceptThis(LabelNode: TLabelNode);
    procedure HideThisMember(LabelNode: TLabelNode);
    procedure ShowAllMembers(DimState: TDimensionState); overload;
    procedure ShowAllMembers(const DimensionName: WideString); overload;
    procedure ShowAllMembers(LabelNode: TLabelNode); overload;
    procedure ShowAllMembers1(DimState: TDimensionState);
    procedure ShowAllMembers2(const DimensionName: WideString);
    procedure ShowAllMembers3(LabelNode: TLabelNode);
    procedure GroupMembersBelow(LabelNode: TLabelNode; GroupIndex: integer); overload;
    procedure GroupMembersBelow(LabelNode: TLabelNode; const GroupCaption: WideString); overload;
    procedure MoveToGroup(LabelNode: TLabelNode; GroupIndex: integer); overload;
    procedure MoveToGroup(LabelNode: TLabelNode; const GroupCaption: WideString); overload;
    function AddressDimensionIndex(DimState: TDimensionState): integer; overload;
    function AddressDimensionIndex(const DimensionName: WideString): integer; overload;
    function CreateCurrentPivotState(MembersSaveMode: TMembersSaveMode = smSaveAll): TPivotState;
    procedure RestorePivotState(PivotState: TPivotState; RestoreMode: TMembersRestoreMode = rmRestoreHidden);
    procedure SaveCurrentPivotState(const StateName: WideString; MembersSaveMode: TMembersSaveMode = smSaveAll);
    procedure DeletePivotState(const StateName: WideString);
    function IsVisible(SumIndex: TIntegerArray): boolean;
    function GetAggregate(SumState: TSummaryState; SumIndex: TIntegerArray; AFunction: TFunction; out Res: Double): boolean;
    function IsIndexSparse(SumIndex: TIntegerArray): boolean;
    function HasEmptyGroup(SumIndex: TIntegerArray): boolean;
    function NotEmptyGroupAndVisible(SumIndex: TIntegerArray): boolean;
    function Row2LabelNode(ARow: integer): TLabelNode;
    function Col2LabelNode(ACol: integer): TLabelNode;
    function Col2SubLevelNode(ACol: integer): TSubLevelNode;
    function GetSortedColumn(out SortType: TValueSortType): integer; overload;
    function GetSortedColumn(out SortType: TValueSortType; out SubLevelNode: TSubLevelNode): integer; overload;
    function FindLowestSubLevelNode(SubLevelNode: TSubLevelNode): TSubLevelNode; overload;
    function FindLowestSubLevelNode(ColNode: TLabelNode): TSubLevelNode; overload;
    function FindLowestSubLevelNode1(SubLevelNode: TSubLevelNode): TSubLevelNode;
    function FindLowestSubLevelNode2(ColNode: TLabelNode): TSubLevelNode; 
    procedure SetSortedColumn(ACol: integer; SortType: TValueSortType); overload;
    procedure SetSortedColumn(SubLevelNode: TSubLevelNode; SortType: TValueSortType); overload;
    procedure SetSortedColumn(ColNode: TLabelNode; SortType: TValueSortType); overload;
    procedure SetSortedColumn(ColNode: TLabelNode; SumInfoID: integer;
      Fun: TFunction; SubFun: TSubFunction; SortType: TValueSortType); overload;
    procedure SetSortedColumn(ColNode: TLabelNode; SumInfoID: integer;
      Fun: TFunction; SubFun: TSubFunction); overload;
    procedure SetSortedColumn(SubLevelNode: TSubLevelNode); overload;
    procedure SetSortedColumn(ColNode: TLabelNode); overload;
    procedure SetSortedColumn(ACol: integer); overload;
    procedure SetSortedColumn1(ACol: integer; SortType: TValueSortType);
    procedure SetSortedColumn2(SubLevelNode: TSubLevelNode; SortType: TValueSortType);
    procedure SetSortedColumn3(ColNode: TLabelNode; SortType: TValueSortType);
    procedure SetSortedColumn4(ColNode: TLabelNode; SumInfoID: integer;
      Fun: TFunction; SubFun: TSubFunction; SortType: TValueSortType);
    procedure SetSortedColumn5(ColNode: TLabelNode; SumInfoID: integer;
      Fun: TFunction; SubFun: TSubFunction);
    procedure SetSortedColumn6(SubLevelNode: TSubLevelNode);
    procedure SetSortedColumn7(ColNode: TLabelNode);
    procedure SetSortedColumn8(ACol: integer); 

    function AddFunction(const DisplayName: WideString): TFunctionDef;
    function AddSubFunction(const DisplayName: WideString): TSubFunctionDef;
    function IsLeaf(SumIndex: TIntegerArray): boolean;
    function GridIndex2DimID(DimGroup: TDimGroup; Index: integer): integer;
{$IFDEF ASPRUNTIME}
    function BuildDatasetXY(const SummaryName: string; Fun: TFunction): DataTable;
    function BuildDatasetX(const SummaryName: string; Fun: TFunction): DataTable;
    function BuildDatasetY(const SummaryName: string; Fun: TFunction): DataTable;
{$ELSE}
    function BuildDatasetXY(const SummaryName: WideString; Fun: TFunction): TDataset;
    function BuildDatasetX(const SummaryName: WideString; Fun: TFunction): TDataset;
    function BuildDatasetY(const SummaryName: WideString; Fun: TFunction): TDataset;
{$ENDIF}
    function GetStandardSubFunctionCalculator(SubFun: TSubFunction): TSubFunctionCalculator;
    function CalculateGridLayout: PGridLayout;
    property CurrentPivotStateName: WideString read FCurrentPivotStateName write SetFCurrentPivotStateName;
    property CurrentPivotState: TPivotState read GetCurrentPivotState;
    property PivotStates: TPivotStates read FPivotStates;

    property nOpenRowDims: Integer read GetActiveRowDimsCount;
    property nOpenColDims: Integer read GetActiveColDimsCount;
    property nAllDataRows: Integer read FRowMax;
    property nAllDataCols: Integer read FColMax;
    property nVisibleDataRows: integer read GetVisibleDataRows;
    property nVisibleDataCols: integer read GetVisibleDataCols;
    property GridLayout: PGridLayout read GetGridLayout;
    property RowDimIDs: TIntegerArray read FRowDimIDs;
    property ColDimIDs: TIntegerArray read FColDimIDs;
    property PageDimIDs: TIntegerArray read FPageDimIDs;
    property RowLabelNodes: TLabelNodes read FRowLabelNodes;
    property ColLabelNodes: TLabelNodes read FColLabelNodes;
    property ColSubLevelNodes: TSubLevelNodes read FColSubLevelNodes;
    property VisibleRowNodes: TPointerArray read FVisibleRowNodes;
    property VisibleColNodes: TPointerArray read FVisibleColNodes;
    property VisibleColSubLevelNodes: TPointerArray read FVisibleColSubLevelNodes;
    property GridSummaryArray: TGridSummaryArray read FGridSummaryArray;
    property ActiveDimIDs: TIntegerArray read FActiveDimIDs;
    property ActiveDimIndexes: TIntegerArray read FActiveDimIndexes;
    property VisibleRowDimIDs: TIntegerArray read FVisibleRowDimIDs;
    property VisibleColDimIDs: TIntegerArray read FVisibleColDimIDs;
    property RowCaptionNodes: TCaptionNodes read FRowCaptionNodes;
    property ColCaptionNodes: TCaptionNodes read FColCaptionNodes;
    property GridColsOnValue: integer read FGridColsOnValue; { Howmany grid cols reserved for every dimension value in the column area }
    property DimensionStates: TDimensionStates read FDimensionStates;
    property SummaryStates: TSummaryStates read FSummaryStates;
    property ValueSortData: TValueSortData read FValueSortData;
    property Active: boolean read GetActive;
    property DatasetStringSize: integer read FDatasetStringSize write FDatasetStringSize default 200;
    property InitPivotStateArgs: TInitPivotStateArgs read FInitPivotStateArgs write FInitPivotStateArgs;
    {$IFDEF ASPRUNTIME}
    property Cube: TCustomHierCube read FCube;
    {$ELSE}
    property ColoredCells: TColoredCells read FColoredCells;
    property Cube: TCustomHierCube read FCube write SetCube;
    property Grid: TWinControl read FGrid;
    {$ENDIF}
    property SummarySettings: TSummarySettings read fSummarySettings write fSummarySettings;
    property WordWrap: boolean read FWordWrap write SetWordArap;
    property LowestSubLevelNode: TSubLevelNodeType read FLowestSubLevelNode write SetLowestSubLevelNode default ltSubFunction;
    property FunctionDefs: TFunctionDefs read fFunctionDefs write SetFunctionDefs;
    property SubFunctionDefs: TSubFunctionDefs read fSubFunctionDefs;
    property ShowAbsentTuples: boolean read FShowAbsentTuples write FShowAbsentTuples default False;
    property FormatNulls: boolean read FFormatNulls write FFormatNulls;
    property DimensionEditorFilterOn: boolean read FDimensionEditorFilterOn write FDimensionEditorFilterOn default false; 

    property BeforePivot: TPivotEvent read FBeforePivot write FBeforePivot;
    property AfterPivot: TPivotEvent read FAfterPivot write FAfterPivot;
    property BeforeSwapDims: THierCubeBeforeSwapDimsEvent read FBeforeSwapDims write FBeforeSwapDims;
    property AfterSwapDims: THierCubeAfterSwapDimsEvent read FAfterSwapDims write FAfterSwapDims;
    property BeforeMoveDim: THierCubeBeforeMoveDimEvent read FBeforeMoveDim write FBeforeMoveDim;
    property AfterMoveDim: THierCubeAfterMoveDimEvent read FAfterMoveDim write FAfterMoveDim;
    property OnExpandDimValue: THierCubeOnExpandDimValueEvent read FOnExpandDimValue write FOnExpandDimValue;
    property OnCompareDimensionMembers: TOnCompareDimensionMembers read FOnCompareDimensionMembers write FOnCompareDimensionMembers;
    {$IFNDEF ASPRUNTIME}
    property OnEditFactTableEvent: TOnEditFactTableEvent read FOnEditFactTableEvent write FOnEditFactTableEvent;
    property OnGetFactTableEditor: TOnGetFactTableEditorEvent read FOnGetFactTableEditor write FOnGetFactTableEditor;
    {$ENDIF}
    property OnCalcAggregateFunction: TOnCalcAggregateFunctionEvent read FOnCalcAggregateFunction write FOnCalcAggregateFunction;
    property OnSavePivotState: TPivotStateEvent read FOnSavePivotState write FOnSavePivotState;
    property OnDeletePivotState: TPivotStateEvent read FOnDeletePivotState write FOnDeletePivotState;
    property OnGetSubFunctionCalculator: TOnGetSubFunctionCalculator read FOnGetSubFunctionCalculator write FOnGetSubFunctionCalculator;
    property OnInitPivotState: TInitPivotStateEvent read FOnInitPivotState write FOnInitPivotState;
  end;

  TLookupHasntTheValue = (lvIgnoreSumValue, lvException, lvAddFactTableID);
  TDimMemberIsNull = (dnTreatAsZero, dnIgnoreDimMember, dnCreateEmptyMember, dnException);
  TDupDimensionTableID = (diException, diIgnoreDimMember);

  THierCubeOptions = class(TPersistent)
  private
    FShowProgressBar: boolean;
    FLookupHasntTheValue: TLookupHasntTheValue;
    fOwner: TCustomHierCube;
    FDimMemberIsNull: TDimMemberIsNull;
    FEditable: boolean;
    FDupDimensionTableID: TDupDimensionTableID;
    procedure SetLookupHasntTheValue(Value: TLookupHasntTheValue);
    procedure SetEditable(const Value: boolean);
    procedure SetDupDimensionTableID(const Value: TDupDimensionTableID);
  public
    constructor Create(AOwner: TCustomHierCube);
    procedure Assign(Source: TPersistent); override;
  published
    property ShowProgressBar: boolean read FShowProgressBar write FShowProgressBar default True;
    property LookupHasntTheValue: TLookupHasntTheValue read FLookupHasntTheValue write SetLookupHasntTheValue default lvException;
    property DupDimensionTableID: TDupDimensionTableID read FDupDimensionTableID write SetDupDimensionTableID default diException;
    property DimMemberIsNull: TDimMemberIsNull read FDimMemberIsNull write FDimMemberIsNull default dnTreatAsZero;
    property Editable: boolean read FEditable write SetEditable default False;
  end;

{$IFDEF ASPRUNTIME}
  TFactTableRecord = record
    Dims: array of integer;
    Sums: array of double;
  end;
{$ENDIF}

  TFactTable = class(TRecordArray)
  private
    FDimCount: integer;         
    FSumCount: integer;         
    FCurIndex: integer;         
{$IFNDEF ASPRUNTIME}
    FCurRecord: pointer;        
{$ENDIF}
    FEOF: boolean;
    FRecordSize: integer;       
    function GetCurDim(DimID: integer): integer; {$IFNDEF ASPRUNTIME} register; {$ENDIF}
    procedure SetCurDim(DimID: integer; Value: integer); {$IFNDEF ASPRUNTIME} register; {$ENDIF}
    function GetSum(Index, SumID: integer): double; {$IFNDEF ASPRUNTIME} register; {$ENDIF}
    procedure SetSum(Index, SumID: integer; Value: double); {$IFNDEF ASPRUNTIME} register; {$ENDIF}
    function GetCurSum(SumID: integer): double; {$IFNDEF ASPRUNTIME} register; {$ENDIF}
    procedure SetCurSum(SumID: integer; Value: double); {$IFNDEF ASPRUNTIME} register; {$ENDIF}
    procedure SetCurIndex(Value: integer);
    function GetDim(Index, DimID: integer): integer; {$IFNDEF ASPRUNTIME} register; {$ENDIF}
    procedure SetDim(Index, DimID: integer; Value: integer); {$IFNDEF ASPRUNTIME} register; {$ENDIF}
{$IFDEF ASPRUNTIME}
  protected
    procedure WriteContents(AStream: TStream); override;
    procedure ReadContents(AStream: TStream); override;
{$ENDIF}
  public
    constructor Create(ADimCount, ASumCount: word);

    procedure WriteStream(Stream: TStream); override;
    procedure ReadStream(Stream: TStream); override;
    function StreamSize: integer; override;

    function BuildSummarySortedArray(SumID: integer): TIntegerArray;
    procedure Next; {$IFNDEF ASPRUNTIME} register; {$ENDIF}
    procedure First; {$IFNDEF ASPRUNTIME} register; {$ENDIF}
    function NewRecord: integer; {$IFNDEF ASPRUNTIME} register; {$ENDIF}
    function GetSumIndex(GridInfo: TGridInfo): TIntegerArray;
    property DimCount: integer read FDimCount;
    property SumCount: integer read FSumCount;
    property CurIndex: integer read FCurIndex write SetCurIndex;
    property EOF: boolean read FEOF;
    property CurDim[DimID: integer]: integer read GetCurDim write SetCurDim;
    property CurSum[SumID: integer]: double read GetCurSum write SetCurSum;
    property Dim[Index, DimID: integer]: integer read GetDim write SetDim;
    property Sum[Index, SumID: integer]: double read GetSum write SetSum;
    property RecordSize: integer read FRecordSize;
  end;

  TLookupField = class
  private
    FNames: TWideStringArray;
    FKeys: TWideStringArray;
    FDimension: TDimension;     
  public
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    function GetName(const Key: WideString): WideString;
    property Keys: TWideStringArray read FKeys;
    property Names: TWideStringArray read FNames;
    property Dimension: TDimension read FDimension;
    procedure Init;
  end;

  TLookupFields = class(TWideStringArray)
  public
    constructor Create;
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
  end;

{$IFNDEF ASPRUNTIME}
  TKeySet = class(TDatasetArray);
{$ENDIF}

  TSourceField = class
  private
    FFieldName: WideString;
    FDisplayName: WideString;
    FFieldType: TFieldType;
    FFieldKind: TFieldKind;
    FReadOnly: boolean;
    FVisible: boolean;
  public
    property FieldName: WideString read FFieldName;
    property DisplayName: WideString read FDisplayName;
    property FieldType: TFieldType read FFieldType;
    property FieldKind: TFieldKind read FFieldKind;
    property Visible: boolean read FVisible;
    property ReadOnly: boolean read FReadOnly;
  end;

  TSourceFields = class(TObjectArray)
  public
    function AddField(const FieldName: WideString; const DisplayName: WideString; FieldType: TFieldType; FieldKind: TFieldKind; Visible: boolean; ReadOnly: boolean): Integer;
    function FindField(AFieldName: WideString; AFieldType: TFieldType): integer;
  end;

  TCustomHierCube = class(TComponent)
  private
    FDimSums: TDimSums; 
    FSourceFields: TSourceFields;
    FOptions: THierCubeOptions;         
    FState: THierCubeState;
    FBeforeOpen: TNotifyEvent;
    FAfterOpen: TNotifyEvent;
    FBeforeClose: TNotifyEvent;
    FAfterClose: TNotifyEvent;
    FStreamedActive: boolean;
    FDataSet: TDataSet;
    FFactTable: TFactTable;
{$IFNDEF ASPRUNTIME}
    FEditableFields: TDatasetArray; 
{$ENDIF}
    FDimensions: TDimensions;
    FSummaries: TSummaries;
    {$IFDEF ASPRUNTIME}
    FGridInfo: TGridInfo; 
    {$ELSE}
    FLinkedControls: TList;
    FProgressDialog: THProgressDlg;
    {$ENDIF}
    FVarFields: WideString;
    FVarFieldTypes: string;                          
    FLookupFields: TLookupFields;                    
    FBeforeReadFactTable: TBeforeReadFactTableEvent;
    FOnReadFactTable: TReadFactTableEvent;
    FAfterReadFactTable: TReadFactTableEvent;
    function GetConnected: boolean;
    procedure SetConnected(AConnect: boolean);
    function GetActive: Boolean;
    procedure SetActive(Value: Boolean);
    procedure OpenCache;
    procedure Clear;
    procedure DoUpdateCache;
    procedure UpdateCache(Sender: TObject);
    function ReadSourceFields: boolean;
    procedure InitCubeMetadata;        
    procedure ReadDimensionTable(Dim: TDimension);
    procedure ReadLookupDataset(LookupField: TLookupField; DimComponent: TDimComponent);
    procedure InitInternalData;      
    procedure InitLookupDimensions;   
    procedure InitFactTable;
    {$IFDEF ASPRUNTIME}
    procedure CheckFactTablePresence;
    {$ENDIF}
    procedure DoReadFactTable(KeepExistentData: boolean);
    procedure CalculateRangeBasedDimensions;
    function InitLookupFields: TLookupFields;
    procedure BuildEditableFieldList(out FieldNames, DisplayNames: TWideStringArray);
    procedure NotifyLinkedControls(AEvent: THierCubeEvent);
    procedure SeDataSet(ADataSet: TDataSet);
    procedure WriteStream(Stream: TStream; SaveFactTable: boolean);     
    procedure ReadStream(Stream: TStream);      
    function StreamSize(SaveFactTable: boolean): integer;               
    procedure WriteCommonStream(Stream: TStream; Buffer: pointer; Count: integer);
    procedure ReadCommonStream(Stream: TStream; Buffer: pointer);
{$IFNDEF ASPRUNTIME}
    procedure WriteCompressedCommonStream(Stream: TStream; Buffer: pointer; Count: integer);
    procedure ReadCompressedCommonStream(Stream: TStream; Buffer: pointer);
    class function ReadUserDataCommonStream(Stream: TStream; Buffer: pointer): boolean; overload;
    class function ReadUserDataCommonStream(Stream: TStream): string; overload;
    class function ReadUserDataCommonStream(Stream: TStream; var P: pointer; var Count: integer): boolean; overload;
    class function ReadUserDataCommonStreamW(Stream: TStream): WideString;
{$ENDIF}
    procedure SetOptions(const Value: THierCubeOptions);
    procedure LoadVarFields(Reader: TReader);
    procedure StoreVarFields(Writer: TWriter);
    procedure LoadVarFieldTypes(Reader: TReader);
    procedure StoreVarFieldTypes(Writer: TWriter);
    property FactTable: TFactTable read FFactTable;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Connect;
    procedure Disconnect;
    procedure Loaded; override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure StateChanged;
    procedure DoBeforeOpen;
    procedure DoAfterOpen;
    procedure DoBeforeClose;
    procedure DoAfterClose;
    property Connected: boolean read GetConnected write SetConnected;
    function BuildKeyFieldTypes(const AKeyFields: WideString): string;
  public
    constructor Create(AOwner: TComponent); override;
    class function StreamVersionSupported(Version: integer): boolean;
    procedure CalculateRangeBasedDimension(DimID: integer);
    {$IFNDEF ASPRUNTIME}
    procedure AddLinkedControl(Control: TWinControl);
    destructor Destroy; override;
    {$ENDIF}
    function BuildDimensionMap: boolean;
    function DefineFieldAsDimension(const FieldName: WideString; DimGroup: TDimGroup): TDimSum; overload;
    function DefineFieldAsDimension(const FieldName, DisplayName: WideString; DimGroup: TDimGroup): TDimSum; overload;
    function DefineFieldAsDimension(const FieldName: WideString; DimGroup: TDimGroup;
      const ID_Field, ParentID_Field, Name_Field: WideString; DimensionTable: TDataSet; const AttributeFields: array of WideString): TDimSum; overload;
    function DefineFieldAsDimension(const FieldName, DisplayName: WideString; DimGroup: TDimGroup;
      const ID_Field, ParentID_Field, Name_Field: WideString; DimensionTable: TDataSet; const AttributeFields: array of WideString): TDimSum; overload;
    function DefineFieldAsDimension(const FieldName: WideString; DimGroup: TDimGroup;
      TransformMethod: TTransformMethod; IntervalCount: integer): TDimSum; overload;
    function DefineFieldAsDimension(const FieldName, DisplayName: WideString; DimGroup: TDimGroup;
      TransformMethod: TTransformMethod; IntervalCount: integer): TDimSum; overload;
    function DefineCompositeDimension(const DisplayName: WideString; DimGroup: TDimGroup): TDimSum;
    function DefineCompositeMember(CompositeDim: TDimSum; const FieldName: WideString): TDimCollectionItem; overload;
    function DefineCompositeMember(const DimensionName, FieldName: WideString): TDimCollectionItem; overload;
    function DefineCompositeMember(CompositeDim: TDimSum; const FieldName: WideString; LookupTable: TDataSet;
      const ID_Field, Name_Field: WideString): TDimCollectionItem; overload;
    function DefineCompositeMember(const DimensionName, FieldName: WideString; LookupTable: TDataSet;
      const ID_Field, Name_Field: WideString): TDimCollectionItem; overload;
    procedure DefineKeyFields(AKeyFields: array of WideString);
    procedure DefineVariableFields(AVarFields: array of WideString);
    procedure DimensionMapChanged;
    procedure FactTableChanged;
    procedure UndefineField(const FieldName: WideString); overload;
    procedure UndefineField(ADimSum: TDimSum); overload;
    procedure SetDimensionLookup(Dimension: TDimSum; DimensionTable: TDataSet;
      const ID_Field, Name_Field, ParentID_Field: WideString);
    function DefineFieldAsSummary(const FieldName: WideString): TDimSum;
    procedure UpdateFactTable;
    procedure RefreshFactTable(KeepExistentData: boolean);
    function ChangeRangeBasedDimension(DimID: integer; NewMemberCount: integer; NewTransformMethod: TTransformMethod): boolean; overload;
    function ChangeRangeBasedDimension(DimID: integer; NewMemberCount: integer): boolean; overload;
    function ChangeRangeBasedDimension(DimID: integer; NewTransformMethod: TTransformMethod): boolean; overload;
    function ChangeRangeBasedDimension(const FieldName: WideString; NewMemberCount: integer; NewTransformMethod: TTransformMethod): boolean; overload;
    function ChangeRangeBasedDimension(const FieldName: WideString; NewMemberCount: integer): boolean; overload;
    function ChangeRangeBasedDimension(const FieldName: WideString; NewTransformMethod: TTransformMethod): boolean; overload;
    procedure SaveToStream(Stream: TStream; Buffer: pointer = nil; Count: integer = 0); overload;
    procedure SaveToStream(Stream: TStream; const UserData: string); overload;
    procedure SaveToFile(const FName: WideString; Buffer: pointer = nil; Count: integer = 0); overload;
    procedure SaveToFile(const FName: WideString; const UserData: string); overload;
    procedure SaveToStreamW(Stream: TStream; const UserData: WideString);
    procedure SaveToFileW(const FName: WideString; const UserData: WideString);
    procedure SaveUncompressed(Stream: TStream; Buffer: pointer = nil; Count: integer = 0); overload;
    procedure SaveUncompressed(Stream: TStream; const UserData: string); overload;
    procedure SaveUncompressed(const FName: WideString; Buffer: pointer = nil; Count: integer = 0); overload;
    procedure SaveUncompressed(const FName: WideString; const UserData: string); overload;
    procedure SaveUncompressedW(Stream: TStream; const UserData: WideString); overload;
    procedure SaveUncompressedW(const FName: WideString; const UserData: WideString); overload;
    procedure LoadFromStream(Stream: TStream; Buffer: pointer = nil);
    procedure LoadFromFile(const FName: WideString; Buffer: pointer = nil);
{$IFNDEF ASPRUNTIME}
    class function LoadUserDataFromStream(Stream: TStream; Buffer: pointer): boolean;
    class function LoadUserDataFromFile(const FName: WideString; Buffer: pointer): boolean;
    class function LoadUserData(Stream: TStream): string; overload;
    class function LoadUserData(const FileName: WideString): string; overload;
    class function LoadUserData(Stream: TStream; Buffer: pointer): boolean; overload;
    class function LoadUserData(const FileName: WideString; Buffer: pointer): boolean; overload;
    class function LoadUserData(Stream: TStream; out P: pointer; out Count: integer): boolean; overload;
    class function LoadUserDataW(Stream: TStream): WideString; overload;
    class function LoadUserDataW(const FileName: WideString): WideString; overload;
{$ENDIF}
    class function StreamVersion(Stream: TStream): integer;
    class function CorrectStream(Stream: TStream): boolean;
    class function CompressedStream(Stream: TStream): boolean;
    class function CheckStreamFormat(Stream: TStream): integer;
    class function GetVersion: WideString; 
    property Dimensions: TDimensions read FDimensions;
    property Summaries: TSummaries read FSummaries;
    {$IFDEF ASPRUNTIME}
    property GridInfo: TGridInfo read FGridInfo;
    {$ENDIF}
    property KeyFields: WideString read FVarFields;
{$IFNDEF ASPRUNTIME}
    property EditableFields: TDatasetArray read FEditableFields;
{$ENDIF}
    property VarFields: WideString read FVarFields write FVarFields;
    property VarFieldTypes: string read FVarFieldTypes write FVarFieldTypes;
    procedure UpdateVarFieldTypes;
    property DataSet: TDataSet read FDataSet write SeDataSet;
    property DimensionMap: TDimSums read FDimSums write FDimSums;
    property Options: THierCubeOptions read FOptions write SetOptions;
    property Active: Boolean read GetActive write SetActive default False;

    { HierCube events }
    property AfterOpen: TNotifyEvent read FAfterOpen write FAfterOpen;
    property BeforeOpen: TNotifyEvent read FBeforeOpen write FBeforeOpen;
    property AfterClose: TNotifyEvent read FAfterClose write FAfterClose;
    property BeforeClose: TNotifyEvent read FBeforeClose write FBeforeClose;
    property BeforeReadFactTable: TBeforeReadFactTableEvent read FBeforeReadFactTable write FBeforeReadFactTable;
    property OnReadFactTable: TReadFactTableEvent read FOnReadFactTable write FOnReadFactTable;
    property AfterReadFactTable: TReadFactTableEvent read FAfterReadFactTable write FAfterReadFactTable;
  end;

  TDimComponents = class;
  THierCube = class(TCustomHierCube)
  published
    property DataSet;
    property DimensionMap;
    property Options;
    property Active;
    property AfterOpen;
    property BeforeOpen;
    property AfterClose;
    property BeforeClose;
    property BeforeReadFactTable;
    property OnReadFactTable;
    property AfterReadFactTable;
  end;

  TChildrenList = class(TObjectArray);

  TDimensionOrSummary = class(TStreamedObject)
  private
    FDimensionMapIndex: integer;  
    FFieldName: WideString;
    FDisplayName: WideString;
    FComposite: boolean;
    FComposedFields: WideString;
    FFieldKind: TFieldKind;
    FFieldType: TFieldType; 
  public
    procedure WriteStream(Stream: TStream); override;
    procedure ReadStream(Stream: TStream); override;
    function StreamSize: integer; override;

    property DisplayName: WideString read FDisplayName;
    property FieldName: WideString read FFieldName;
    property FieldKind: TFieldKind read FFieldKind;
    property FieldType: TFieldType read FFieldType;
    property Composite: boolean read FComposite;
    property ComposedFields: WideString read FComposedFields;
    property DimensionMapIndex: integer read FDimensionMapIndex;
  end;

  TDimensionOrSummaryList = class(TStreamedObjectArray)
  public
    function FindFieldName(const FieldName: WideString): integer;
  end;

  TTotals = class(TPersistent)
  private
{$IFDEF ASPRUNTIME}
    fFunctions: TDoubleFunctionsArray; 
{$ELSE}
    fFunctions: TRecordArray; 
{$ENDIF}
    FSums: TDoubleArray;
    FCounts: TIntegerArray;
    fMedianCalc: boolean;  
  public
    FOffsets: TCubeIntegerArray; 
    constructor Create(AOffsets: TCubeIntegerArray);
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    procedure Clear;
    function MemberCount: integer;
    function Find(AOffset: CubeInteger; out AValue: Double; out ACount: integer; out AFunctions: PFunctionValues): boolean;
    property Sums: TDoubleArray read FSums write FSums;
    property Counts: TIntegerArray read FCounts write FCounts;
{$IFDEF ASPRUNTIME}
    property Functions: TDoubleFunctionsArray read fFunctions write fFunctions;
{$ELSE}
    property Functions: TRecordArray read fFunctions write fFunctions;
{$ENDIF}
  end;

  TSummary = class(TDimensionOrSummary)
  private
    FDefaultFormat: WideString;
    FSortedFacts: TIntegerArray;  
  public
    property DefaultFormat: WideString read FDefaultFormat;
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
  end;

  TSummaries = class(TDimensionOrSummaryList)
  public
    procedure ReadStream(Stream: TStream); override;
  end;

  TDimComponent = class(TStreamedObject)
  private
    FDimComponentRecord: TDimComponentRecord;
  public
    procedure WriteStream(Stream: TStream); override;
    procedure ReadStream(Stream: TStream); override;
    function StreamSize: integer; override;
    property FieldName: WideString read FDimComponentRecord.FFieldName write FDimComponentRecord.FFieldName;
    property LookupDataSet: TDataSet read FDimComponentRecord.FLookupDataSet write FDimComponentRecord.FLookupDataSet;
    property ID_Field: WideString read FDimComponentRecord.FID_Field write FDimComponentRecord.FID_Field;
    property Name_Field: WideString read FDimComponentRecord.FName_Field write FDimComponentRecord.FName_Field;
    property FormatString: WideString read FDimComponentRecord.FFormatString write FDimComponentRecord.FFormatString;
    property FieldKind: TFieldKind read FDimComponentRecord.FFieldKind write FDimComponentRecord.FFieldKind;
    property FieldType: TFieldType read FDimComponentRecord.FFieldType write FDimComponentRecord.FFieldType;
  end;

  TDimComponents = class(TStreamedObjectArray)
  public
    procedure ReadStream(Stream: TStream); override;
  end;

  TAttributeList = class(TWideStringArray)
  public
    constructor Create;
    procedure Clear; override;
    procedure WriteStream(Stream: TStream); override;
    procedure ReadStream(Stream: TStream); override;
    function StreamSize: integer; override;
  end;

  TDimension = class(TDimensionOrSummary)
  private
    FCurrentCaptions: TWideStringArray; 
    FAttributeList: TAttributeList; 
    FParents: TIntegerArray;    
    FStrID: boolean;            
    FStringKeys: TWideStringArray;  
    FHasLookup: boolean;
    FDimGroup: TDimGroup;
    FTotalAppearance: TTotalAppearance;
    FHier: boolean;             
    FUsedMembers: TIntegerArray; 
    FDimComponents: TDimComponents;
    FDefaultAttribute: WideString;
    FDatabaseRanks: TIntegerArray;
    FItems: TIntegerArray;
    FSortType: TDimSortType;
    FRangeBased: boolean;
    FRangeTransformMethod: TTransformMethod;
    FRangeMemberCount: integer;
    FDoubleArray: TDoubleArray; 
    FFTIndexes: TIntegerArray;  
    FInvertFTIndexes: TIntegerArray; 
    FIsParentFlags: TIntegerArray;

    FLatestDoubleArrayValue: double; 
    FLatestMember: integer; 
    FAvailableMembers: TAvailableMembers;
    FEmptyMemberUsed: boolean; 

    FAdditionalMembers: TBaseArray;
    FCompositeFields: TWideStringArray;

    function GetMemberID(Index: integer): variant;
    function FindIndexByID(MemberID: variant): integer;
    procedure UpdateCurrentCaptions(const Attribute: WideString);
  public
    constructor Create;
{$IFNDEF ASPRUNTIME}
    destructor Destroy; override;
{$ENDIF}
    function IsParent(Index: integer): boolean;

    procedure WriteStream(Stream: TStream); override;
    procedure ReadStream(Stream: TStream); override;
    function StreamSize: integer; override;

    property StrID: boolean read FStrID;
    property HasLookup: boolean read FHasLookup;
    property DimComponents: TDimComponents read FDimComponents;
    property DefaultAttribute: WideString read FDefaultAttribute;
    property AttributeList: TAttributeList read FAttributeList;
    property CurrentCaptions: TWideStringArray read FCurrentCaptions;
    property StringKeys: TWideStringArray read FStringKeys;
    property DatabaseRanks: TIntegerArray read FDatabaseRanks;
    property Items: TIntegerArray read FItems;
    property Parents: TIntegerArray read FParents;
    property SortType: TDimSortType read FSortType;
    property RangeBased: boolean read FRangeBased;
    property RangeMemberCount: integer read FRangeMemberCount write FRangeMemberCount;
    property RangeTransformMethod: TTransformMethod read FRangeTransformMethod write FRangeTransformMethod;
    property AvailableMembers: TAvailableMembers read FAvailableMembers write FAvailableMembers;
  end;

  TDimensions = class(TDimensionOrSummaryList)
  public
    procedure ReadStream(Stream: TStream); override;
    function FindRangeBasedDimension(const FieldName: WideString): integer;
  end;

  TSubFunctionDef = class(TCollectionItem)
  private
    FDisplayName: WideString;
    FUserAllowed: boolean;
    function GetSubFunction: TSubFunction;
  protected
    function GetDisplayName: WideString; virtual;
    procedure SetDisplayName(const Value: WideString); virtual;
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
    procedure WriteStream(Stream: TStream);
    function StreamSize: integer;
    procedure ReadStream(Stream: TStream);
  published
    property DisplayName: WideString read GetDisplayName write SetDisplayName;
    property UserAllowed: boolean read FUserAllowed write FUserAllowed;
    property SubFunction: TSubFunction read GetSubFunction stored False;
  end;

  TSubFunctionDefs = class(TOwnedCollection)
  private
    FGridInfo: TGridInfo;
    function GetItem(Index: integer): TSubFunctionDef;
    procedure SetItem(Index: integer; const Value: TSubFunctionDef);
  public
    constructor Create(AGridInfo: TGridInfo);
    procedure Assign(Source: TPersistent); override;
    procedure WriteStream(Stream: TStream);
    function StreamSize: integer;
    procedure ReadStream(Stream: TStream);
    property GridInfo: TGridInfo read FGridInfo;
    property Items[Index: integer]: TSubFunctionDef read GetItem write SetItem; default;
  end;

  TFunctionDef = class(TCollectionItem)
  private
    fUserAllowed: boolean;
    fDisplayName: WideString;
    function GetFunction: TFunction;
  protected
    function GetDisplayName: WideString; virtual;
    procedure SetDisplayName(const Value: WideString); virtual;
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
    procedure WriteStream(Stream: TStream);
    function StreamSize: integer;
    procedure ReadStream(Stream: TStream);
  published
    property DisplayName: WideString read GetDisplayName write SetDisplayName;
    property UserAllowed: boolean read fUserAllowed write fUserAllowed;
    property FunctionType: TFunction read GetFunction stored False;
  end;

  TFunctionDefs = class(TOwnedCollection)
  private
    function GetItem(Index: integer): TFunctionDef;
    procedure SetItem(Index: integer; const Value: TFunctionDef);
    procedure InitFunctions;
  public
    procedure Assign(Source: TPersistent); override;
    procedure WriteStream(Stream: TStream);
    function StreamSize: integer;
    procedure ReadStream(Stream: TStream);
    function Add: TFunctionDef;
    function FunctionDef(AFunction: TFunction): TFunctionDef;
    property Items[Index: integer]: TFunctionDef read GetItem write SetItem; default;
  end;


{$IFNDEF ASPRUNTIME}
procedure UpdateDesigner(Sender: TComponent);
{$ENDIF}

function CompareDimCaptions(DimState: TDimensionState; Index1, Index2: integer): integer;
function CompareDimCaptionsDesc(DimState: TDimensionState; Index1, Index2: integer): integer;
function CompareDimCustom(DimState: TDimensionState; Index1, Index2: integer): integer;
function CompareDimDatabaseRanks(DimState: TDimensionState; Index1, Index2: integer): integer;

function FindSubTotal(SumIndex: TIntegerArray): integer;
function HasSubTotals(SumIndex: TIntegerArray): boolean;
function SubTotalsNumber(SumIndex: TIntegerArray): integer;

implementation

uses xhFormula
{$IFNDEF ASPRUNTIME}
,xhCompress, xhFactTableEditor
{$ENDIF}
{$IFNDEF ASPRUNTIME}
,xhUnicode
{$ENDIF}
;

type
  MemberInt = integer; 

const
  FVersionNumber: integer = 448;
  
const
  dctDisplayName        = $001;  
  dctMemberCaption      = $002;  
  dctAttribute          = $004;  
  dctTotalAppearance    = $008;  
  dctSort               = $010;  
  dctGrouped            = $020;  
  dctPageFiltered       = $040;  
  dctActiveFiltered     = $080;  
  dctFullRebuild        = $100;  

{$IFNDEF ASPRUNTIME}
procedure UpdateDesigner(Sender: TComponent);
var
  NextParent: TComponent;
begin
  if (csDesigning in Sender.ComponentState) and not (csUpdating in Sender.ComponentState) then
  begin
    NextParent := Sender;
    while assigned(NextParent) and not (NextParent is TCustomForm) do
      NextParent := NextParent.Owner;
    if Assigned(NextParent) and Assigned(TCustomForm(NextParent).Designer) then
    begin
      TCustomForm(NextParent).Designer.Modified;
    end;
  end;
end;
{$ENDIF}

procedure LookupHasntTheValueError(const ADimensionName, Value: WideString);
begin
  raise ECubeError.Create(xhWideFormat(GetResStr('xhLookupHasntTheValueError', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhLookupHasntTheValueError), [ADimensionName, Value]));
end;

procedure DimMemberIsNullError(const ADimensionName: WideString);
begin
  raise ECubeError.Create(xhWideFormat(GetResStr('xhDimMemberIsNullError', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhDimMemberIsNullError), [ADimensionName]));
end;

procedure TooLongDimensionError(const DimensionName: WideString; MemberCount: integer);
begin
  raise ECubeError.Create(xhWideFormat(GetResStr('xhTooLongDimensionError', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhTooLongDimensionError), [DimensionName, MemberCount]));
end;

procedure NotNumericRangeDimensionError(const FieldName: WideString);
begin
  raise ECubeError.Create(xhWideFormat(GetResStr('xhNotNumericRangeDimension', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhNotNumericRangeDimension), [FieldName]));
end;

procedure InvalidFunctionError(const SummaryName: WideString; Fun: TFunction);
begin
  raise ECubeError.Create(xhWideFormat(GetResStr('xhInvalidFunctionError', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhInvalidFunctionError), [Function2Str(Fun), SummaryName]));
end;

procedure SummaryAlreadyExistsError(const SummaryName: WideString);
begin
  raise ECubeError.Create(xhWideFormat(GetResStr('xhSummaryAlreadyExistsError', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhSummaryAlreadyExistsError), [SummaryName]));
end;


function NewIntegerArray: TIntegerArray;
begin
  Result := TIntegerArray.Create;
end;

function MemberCaption2ID(const s: WideString): WideString;
begin
  Result := xhLeftBracket + s + xhRightBracket;
end;

function ParseDimensionMember(const Member: WideString; out HasMemberDelimiter: boolean): WideString;
var
  Index, StartPos: integer;
  s: WideString;
begin
  HasMemberDelimiter := False;
  Result := '';
  s := WideTrim(Member);
  Index := 1;
  while Index <= length(s) do
  begin
    if s[Index] = xhLeftBracket then
      begin
        inc(Index);
        StartPos := Index;
        while Index <= length(s) do if s[Index] = xhRightBracket then break else inc(Index);
        if Result = '' then
          Result := xhLeftBracket + copy(s, StartPos, Index - StartPos) + xhRightBracket
        else
          begin
            Result := Result + xhMemberDelimiter + xhLeftBracket + copy(s, StartPos, Index - StartPos) + xhRightBracket;
            HasMemberDelimiter := True;
          end;
        inc(Index);
        if (Index <= length(s)) and (s[Index] = xhMemberDelimiter) then inc(Index);
      end
    else if s[Index] <= ' ' then
      begin
        EXIT;
      end
    else
      begin
        StartPos := Index;
        while Index <= length(s) do if (s[Index] <= ' ') or (s[Index] = xhMemberDelimiter) then break else inc(Index);
        if Result = '' then
          Result := xhLeftBracket + copy(s, StartPos, Index - StartPos) + xhRightBracket
        else
          begin
            Result := Result + xhMemberDelimiter + xhLeftBracket + copy(s, StartPos, Index - StartPos) + xhRightBracket;
            HasMemberDelimiter := True;
          end;
        if (Index <= length(s)) and (s[Index] <= ' ') then EXIT else inc(Index);
      end;
  end;
end;

function FindSubTotal(SumIndex: TIntegerArray): integer; register;
asm
    mov     EDX, EDI  
    mov     ECX, [EAX + TBaseArray.FCount]
    mov     EDI, [EAX + TBaseArray.FArrayPointer]
    mov     EAX, SubTotal
    lea     EDI, [EDI + ECX * TYPE Integer - TYPE Integer] 
    std     
    repne   scasd
    jne     @@exit
    mov     EAX, ECX
@@exit:
    cld
    mov     EDI, EDX 
end;



function SubTotalsNumber(SumIndex: TIntegerArray): integer; register;
asm 
    push    EDI
    mov     ECX, [EAX + TBaseArray.FCount]
    mov     EDI, [EAX + TBaseArray.FArrayPointer] 
    mov     EAX, SubTotal
    xor     EDX, EDX   
    cld              
@@loop:
    jecxz   @@exit
    dec     ECX
    scasd    
    jne     @@loop
    inc     EDX
    jmp     @@loop

@@exit:
    mov     EAX, EDX
    pop     EDI
end;


function HasSubTotals(SumIndex: TIntegerArray): boolean; register;
asm 
    mov     EDX, EAX
    xor     EAX, EAX          
    mov     ECX, [EDX + TBaseArray.FCount]
    jecxz   @@exit
    push    EDI
    mov     EDI, [EDX + TBaseArray.FArrayPointer] 
    mov     EAX, SubTotal
    cld              
    repne   scasd    
    sete    AL       
    pop     EDI
@@exit:
end;


function SumIndex2LineIndex(SumIndex: TIntegerArray): Longword; register;
asm
     mov    ECX, [EAX + TBaseArray.FCount]
     mov    EDX, [EAX + TBaseArray.FArrayPointer]
     xor    EAX, EAX
@@loop:
     jecxz  @@1
     dec    ECX
     cmp    dword ptr [EDX + ECX * TYPE Integer], SubTotal
     jne    @@loop
     bts    EAX, ECX
     jmp    @@loop
@@1:
end;


procedure UserCanceledError;
begin
  raise ECubeError.Create(GetResStr('xhUserCanceledError', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhUserCanceledError));
end;

procedure CubeCapacityOverflowError;
begin
  raise ECubeError.Create(GetResStr('xhCubeCapacityrOverflowError', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhCubeCapacityrOverflowError));
end;

{ TCustomHierCube }

procedure TCustomHierCube.Connect;
begin
  if not assigned(DataSet) then
    raise ECubeError.Create(GetResStr('xhecDataSetNotAssigned', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecDataSetNotAssigned));
  with DataSet do
  begin
    if not Active then
    try
      Active := True;
    except
      on E: Exception do
      begin
        raise ECubeError.Create(GetResStr('xhSourceOpenError', @xhSourceOpenError) + E.Message);
      end;
    end;
    if not Active then
      raise ECubeError.Create(GetResStr('xhSourceOpenError', @xhSourceOpenError));
  end;
end;

constructor TCustomHierCube.Create(AOwner: TComponent);
begin
  inherited;
  FState := dcInactive;
  FStreamedActive := false;
  FOptions := THierCubeOptions.Create(Self);
  FSourceFields := TSourceFields.Create;
  FDimSums := TDimSums.Create(Self); 
  {$IFDEF ASPRUNTIME}
  FGridInfo := TGridInfo.Create(Self);
  {$ENDIF}
end;

procedure TCustomHierCube.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('KeyFields', LoadVarFields, StoreVarFields, False);
  Filer.DefineProperty('KeyFieldTypes', LoadVarFieldTypes, StoreVarFieldTypes, False);
  
  Filer.DefineProperty('VarFields', LoadVarFields, StoreVarFields, VarFields <> '');
  Filer.DefineProperty('VarFieldTypes', LoadVarFieldTypes, StoreVarFieldTypes, VarFields <> '');
end;

{$IFNDEF ASPRUNTIME}
destructor TCustomHierCube.Destroy;
begin
  Disconnect;
  Clear;
  FDimSums.Free;
  FSourceFields.Free;
  FOptions.Free;
  FLinkedControls.Free;
  inherited;
end;
{$ENDIF}

procedure TCustomHierCube.Disconnect;
begin
  if assigned(DataSet) then DataSet.Active := False;
end;

function TCustomHierCube.GetConnected: boolean;
begin
  if assigned(DataSet) then Result := DataSet.Active else Result := False;
end;

function TCustomHierCube.ReadSourceFields: boolean;
var
  i: Integer;
  OldConnected: boolean;
{$IFNDEF ASPRUNTIME}
  OldCursor: TCursor;
{$ENDIF}
  Field: TField;
begin
  OldConnected := Connected;
{$IFNDEF ASPRUNTIME}
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
{$ENDIF}
  try
    if not Connected then Connected := True; 
    with DataSet do
    begin
      if FSourceFields.Count > 0 then FSourceFields.Clear;
      for i := 0 to FieldCount - 1 do
      begin
        Field := Fields[i];
        FSourceFields.AddField(Field.FieldName, Field.DisplayName, Field.DataType, Field.FieldKind, Field.Visible, Field.ReadOnly);
      end;
      Result := True;
    end;
  finally
    Connected := OldConnected; 
{$IFNDEF ASPRUNTIME}
    Screen.Cursor := OldCursor;
{$ENDIF}
  end; 
end;

procedure TCustomHierCube.SetConnected(AConnect: boolean);
begin
  if AConnect <> Connected then
  if AConnect then Connect else Disconnect;
end;

function TCustomHierCube.BuildDimensionMap: boolean;
var
  i, Index: integer;
  DS: TDimSum;
  SF: TSourceField;
begin
  Result := False;
  if not assigned(DataSet) then
    raise Exception.Create(GetResStr('xhecDataSetNotAssigned', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecDataSetNotAssigned));
  if not ReadSourceFields then EXIT;
  i := 0;
  while i <= DimensionMap.Count - 1 do
  begin
    DS := DimensionMap[i];
    Index := FSourceFields.FindField(DS.FBaseFieldName, DS.FBaseFieldType);
    if (Index < 0) and (not DS.Composite) then
      DimensionMap.Delete(i)
    else
      inc(i);
  end;
  for i := 0 to FSourceFields.Count - 1 do
  begin
    SF := TSourceField(FSourceFields[i]);
    Index := DimensionMap.FindField(SF.FieldName, SF.FieldType);
    if Index >= 0 then
      DimensionMap.SetFieldKind(SF.FieldName, SF.FieldKind)
    else
      begin
        DS := FDimSums.Add;
        DS.FBaseFieldName := SF.FieldName;
        DS.FDisplayName := SF.DisplayName;
        DS.FBaseFieldType := SF.FieldType;
        DS.FBaseFieldKind := SF.FieldKind;
      end;
  end;
  DimensionMap.CorrectCompositeFields;
  Result := True;
end;

procedure TCustomHierCube.InitInternalData;
var
  i, j: integer;
  DimOrSum: TDimensionOrSummary;
{$IFDEF ASPRUNTIME}
  Dim: TDimension;
{$ELSE}
  Dim: TDimension absolute DimOrSum;
{$ENDIF}
  DimSum: TDimSum;
  DimComponent: tDimComponent;
  FKind: TFieldKind;
  FType: TFieldType;
begin
  if DimensionMap.Count < 1 then
    raise ECubeError.Create(GetResStr('xhecDimMapIsntDefined', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecDimMapIsntDefined));
  if DimensionMap.DimensionCount < 1 then
    raise ECubeError.Create(GetResStr('xhecNoDimensionsDefined', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecNoDimensionsDefined));
  if DimensionMap.SummaryCount < 1 then
    raise ECubeError.Create(GetResStr('xhecNoSummariesDefined', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecNoSummariesDefined));
  for i := 0 to DimensionMap.Count - 1 do
  begin
    DimSum := DimensionMap[i];
    if DimSum.Composite and (DimSum.ComposedFields = '') then Continue;
    if (DimSum.DimSumType <> dsDimension) and (DimSum.DimSumType <> dsSummary) then Continue; 

    if DimSum.DimSumType = dsDimension then
      begin
{$IFDEF ASPRUNTIME}
        Dim := TDimension.Create;
        DimOrSum := Dim;
{$ELSE}
        DimOrSum := TDimension.Create;
{$ENDIF}
        Dim.FStrID := (DimSum.BaseFieldType in [db.ftString, db.ftMemo, db.ftFmtMemo,
          db.ftFixedChar, db.ftWideString]);

        Dim.FDimGroup := DimSum.DimGroup; 
        Dim.FTotalAppearance := DimSum.TotalAppearance;
        Dim.FDefaultAttribute := DimSum.DefaultAttribute;
        Dim.FSortType := DimSum.SortType;

        Dim.FRangeBased := DimSum.RangeBased;
        Dim.FRangeMemberCount := DimSum.SeriesMemberCount;
        Dim.RangeTransformMethod := DimSum.TransformMethod;
        Dim.AvailableMembers := DimSum.AvailableMembers;

        if DimSum.Composite and (DimSum.DimCollection.Count > 0) then
        begin
          Dim.FDimComponents := TDimComponents.Create;
          for j := 0 to DimSum.DimCollection.Count - 1 do
          begin
            DimComponent := TDimComponent.Create;
            DimComponent.FDimComponentRecord := TDimCollectionItem(DimSum.DimCollection.Items[j]).FDimComponentRecord;
            Dim.FDimComponents.Add(DimComponent);
            
            DimensionMap.GetFieldKind(DimComponent.FieldName, FKind, FType);
            DimComponent.FieldKind := FKind;
            DimComponent.FieldType := FType;
          end;
        end;
        FDimensions.Add(DimOrSum);
      end
    else
      begin
        DimOrSum := TSummary.Create;
        TSummary(DimOrSum).FDefaultFormat := DimSum.DefaultFormat;
        FSummaries.Add(DimOrSum);
      end;

    DimOrSum.FFieldName := DimSum.BaseFieldName;
    DimOrSum.FDisplayName := DimSum.DisplayName;
    DimOrSum.FFieldKind := DimSum.BaseFieldKind;
    DimOrSum.FFieldType := DimSum.BaseFieldType;
    DimOrSum.FDimensionMapIndex := i;
    DimOrSum.FComposite := DimSum.Composite;
    DimOrSum.FComposedFields := DimSum.ComposedFields;
  end; 
end;

procedure TCustomHierCube.ReadDimensionTable(Dim: TDimension);
var
  OldActive: boolean;
  ThereAreParents: boolean;
  Index: integer;
  ParentValue: integer;
  ParentStrings: TWideStringArray;
  DimSum: TDimSum;
  LS: TDataSet;
  ID_Field, Attributes, ParentID_Field, ControlField: WideString;
  ParentStrValue, vString, DisplayName: WideString;
  vInteger, n: Integer;
  DimArray: TIntegerArray;
  DimParents: TIntegerArray;
  DimStringKeys: TWideStringArray;
  StringList: TWideStringArray;
  DatabaseRank: integer;
  NullsArray, TempArray: TIntegerArray;

  procedure Init;
  var
    Index: integer;
    s: WideString;
  begin
    Dim.FCurrentCaptions := nil;
    FreeAndNil(Dim.FAttributeList);
    FreeAndNil(Dim.FParents);
    Index := 1;
    while Index <= length(Attributes) do
    begin
      s := ExtractWord(Attributes, Index);
      if s <> '' then
      begin
        StringList := TWideStringArray.Create;
        StringList.Duplicates := dupAccept;
        StringList.Capacity := Dim.Items.Count;
        if Dim.FAttributeList = nil then
          Dim.FAttributeList := TAttributeList.Create;
        Dim.FAttributeList.AddPointer(s, StringList);
        if WideCompareStr(Dim.DefaultAttribute, s) = 0 then Dim.FCurrentCaptions := StringList;
      end;
    end;
    if ThereAreParents then
    begin
      DimParents := TIntegerArray.Create;
      Dim.FParents := DimParents;
    end;
    Dim.FDatabaseRanks.Free;
    Dim.FDatabaseRanks := TIntegerArray.Create;
  end;

{$IFNDEF ASPRUNTIME}
  procedure UpdateProgressBar;
  begin
    if Assigned(FProgressDialog) then
    if (FProgressDialog.UpdateProgress = -1) then
    begin
      UserCanceledError;
    end;
  end;
{$ENDIF}

label
  Next1, Next2;  

begin
  if Dim = nil then EXIT;
  DimSum := DimensionMap[Dim.DimensionMapIndex];
  LS := DimSum.LookupDataSet;
  ID_Field := DimSum.ID_Field;
  Attributes := DimSum.Attributes;
  ParentID_Field := DimSum.ParentID_Field;
  DisplayName := DimSum.DisplayName;

  if not assigned(LS) then EXIT;
  with LS do
  begin
    OldActive := Active;
    try
      if not Active then
      begin
        Active := True;
        if EOF then
          raise ECubeError.Create(xhWideFormat(GetResStr('xhecEmptyLookupTable', @xhecEmptyLookupTable), [LS.Name]));
      end;
      if (ID_Field = '') or (FindField(ID_Field) = nil) then
        raise ECubeError.Create(xhWideFormat(GetResStr('xhecWrongLookupField', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecWrongLookupField), [LS.Name, ID_Field]));
      ThereAreParents := ((ParentID_Field <> '') and (FindField(ParentID_Field) <> nil));
      Init;
      {$IFNDEF ASPRUNTIME}
      if Assigned(FProgressDialog) then
      begin
        FProgressDialog.Init;
        FProgressDialog.FormatStr := GetResStr('xhRowsReadFormatStr', @xhRowsReadFormatStr);
        FProgressDialog.Caption := xhWideFormat(GetResStr('xhReadingLookupSource', @xhReadingLookupSource), [DisplayName]);
      end;
      {$ENDIF}
      LS.DisableControls;
      try
        if Dim.AvailableMembers = byDBField then
          begin
            ControlField := DimSum.AvailableMembers_Field;
            if (ControlField = '') or (FindField(ControlField) = nil) then
              raise ECubeError.Create(xhWideFormat(GetResStr('xhecWrongDatasetField', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecWrongDatasetField), [LS.Name, ControlField]));
            FreeAndNil(Dim.FUsedMembers);
            Dim.FUsedMembers := TIntegerArray.Create;
            Dim.FUsedMembers.Sorted := True;
            Dim.FUsedMembers.Duplicates := dupIgnore;
            TempArray := TIntegerArray.Create;
          end
        else
          ControlField := '';

        First;
        DimArray := Dim.Items;
        if Dim.FStrID then
          begin
            DimStringKeys := TWideStringArray.Create;
            DimStringKeys.Sorted := True;
            DimStringKeys.Duplicates := dupIgnore;
            Dim.FStringKeys := DimStringKeys;

            ParentStrings := TWideStringArray.Create;
            ParentStrings.Duplicates := dupAccept;
            try
              DatabaseRank := 0;
              Index := DimStringKeys.Add(xhEmptyStringIdentifier);
              if Dim.FAttributeList <> nil then
              for n := 0 to Dim.FAttributeList.Count - 1 do
              begin
                StringList := TWideStringArray(Dim.FAttributeList.Pointers[n]);
                StringList.InsertAt(Index, GetResStr('xhEmptyDimensionMemberCaption', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhEmptyDimensionMemberCaption));
              end;
              if ThereAreParents then ParentStrings.InsertAt(Index, '');

              Dim.DataBaseRanks.InsertAt(Index, DatabaseRank);
              {$IFDEF ASPRUNTIME}
              inc(DatabaseRank);
              if Dim.AvailableMembers = byDBField then TempArray.InsertAt(Index, TObject(0));
              {$ELSE}
              inc(DatabaseRank);
              if Dim.AvailableMembers = byDBField then TempArray.InsertAt(Index, 0);
              {$ENDIF}

              while not EOF do
              begin
                if FindField(ID_Field).IsNull then
                case Options.FDimMemberIsNull of
                  dnException: DimMemberIsNullError(DisplayName);
                  dnIgnoreDimMember: goto Next1;
                end;

                vString := GetWideDisplayText(FindField(ID_Field));
                if DimStringKeys.Find(Index, vString) then
                case Options.FDupDimensionTableID of
                  diException:
                    raise ECubeError.Create(xhWideFormat(GetResStr('xhecDupDimensionKey', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecDupDimensionKey), [Dim.DisplayName, ID_Field, vString]));
                  diIgnoreDimMember: goto Next1;
                end;
                
                DimStringKeys.InsertAt(Index, vString); 
                if Dim.FAttributeList <> nil then
                for n := 0 to Dim.FAttributeList.Count - 1 do
                begin
                  StringList := TWideStringArray(Dim.FAttributeList.Pointers[n]);
                  ParentStrValue := GetWideDisplayText(FieldByName(Dim.FAttributeList[n]));
                  StringList.InsertAt(Index, ParentStrValue);
                end;

                if ThereAreParents then
                begin
                  ParentStrValue := GetWideDisplayText(FindField(ParentID_Field));
                  ParentStrings.InsertAt(Index, ParentStrValue);
                end;
                Dim.DataBaseRanks.InsertAt(Index, DatabaseRank);
                inc(DatabaseRank);

                if Dim.AvailableMembers = byDBField then
                if FindField(ControlField).IsNull then
                  TempArray.InsertAt(Index, 0)
                else
                  TempArray.InsertAt(Index, 1);

              Next1:
                {$IFNDEF ASPRUNTIME}
                UpdateProgressBar;
                {$ENDIF}
                Next;
              end;
              DimArray.Count := DimStringKeys.Count;
              DimArray.FillRank;        
              if Dim.AvailableMembers = byDBField then
              begin
                for n := 0 to DimStringKeys.Count - 1 do
                  if TempArray[n] = 1 then Dim.FUsedMembers.Add(n);
                FreeAndNil(TempArray);  
              end;

              if ThereAreParents then
              for n := 0 to DimStringKeys.Count - 1 do
              begin
                ParentValue := DimStringKeys.IndexOf(ParentStrings[n]);
                DimParents.InsertAt(n, ParentValue);
              end;
            finally
              ParentStrings.Free;
            end;
            
            if ThereAreParents then
            begin
              Dim.FIsParentFlags := TIntegerArray.CreateCount(DimArray.Count);
              Dim.FIsParentFlags.FillWith(0);

              for n := 0 to DimArray.Count - 1 do
              begin
                DimParents[n] := DimArray.IndexOf(DimParents[n]);

                if DimParents[n] >= 0 then
                  Dim.FIsParentFlags[DimParents[n]] := 1;
              end;

              Dim.FHier := True;
            end;
          end
        else 
          begin
            NullsArray := TIntegerArray.Create;
            try
              DatabaseRank := 0;
              Index := DimArray.Add(xhEmptyIntegerIdentifier);
              if Dim.FAttributeList <> nil then
              for n := 0 to Dim.FAttributeList.Count - 1 do
              begin
                StringList := TWideStringArray(Dim.FAttributeList.Pointers[n]);
                StringList.InsertAt(Index, GetResStr('xhEmptyDimensionMemberCaption', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhEmptyDimensionMemberCaption))
              end;
              if ThereAreParents then
              begin
                DimParents.InsertAt(Index, 0);
                NullsArray.InsertAt(Index, 1);
              end;
              Dim.DataBaseRanks.InsertAt(Index, DatabaseRank);
              inc(DatabaseRank);
              if Dim.AvailableMembers = byDBField then TempArray.InsertAt(Index, 0);

              while not EOF do
              begin
                if FindField(ID_Field).IsNull then
                case Options.FDimMemberIsNull of
                  dnException: DimMemberIsNullError(DisplayName);
                  dnIgnoreDimMember: goto Next2;
                end;
                
                vInteger := FindField(ID_Field).AsInteger;
                if DimArray.Find(Index, vInteger) then
                case Options.FDupDimensionTableID of
                  diException:
                    raise ECubeError.Create(xhWideFormat(GetResStr('xhecDupDimensionKey', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecDupDimensionKey), [Dim.DisplayName, ID_Field, xhIntToWideStr(vInteger)]));
                  diIgnoreDimMember: goto Next2;
                end;

                DimArray.InsertAt(Index, vInteger); 
                if Dim.FAttributeList <> nil then
                for n := 0 to Dim.FAttributeList.Count - 1 do
                begin
                  StringList := TWideStringArray(Dim.FAttributeList.Pointers[n]);
                  StringList.InsertAt(Index, GetWideDisplayText(FieldByName(Dim.FAttributeList[n])));
                end;
                if ThereAreParents then
                begin
                  if FindField(ParentID_Field).IsNull then
                    begin
                      DimParents.InsertAt(Index, 0);
                      NullsArray.InsertAt(Index, 1);
                    end
                  else
                    begin
                      ParentValue := FindField(ParentID_Field).AsInteger;
                      DimParents.InsertAt(Index, ParentValue);
                      NullsArray.InsertAt(Index, 0);
                    end;
                end;
                Dim.DataBaseRanks.InsertAt(Index, DatabaseRank);
                inc(DatabaseRank);

                if Dim.AvailableMembers = byDBField then
                if FindField(ControlField).IsNull then
                  TempArray.InsertAt(Index, 0)
                else
                  TempArray.InsertAt(Index, 1);
              Next2:
                {$IFNDEF ASPRUNTIME}
                UpdateProgressBar;
                {$ENDIF}
                Next;
              end;

              if Dim.AvailableMembers = byDBField then
              begin
                for n := 0 to DimArray.Count - 1 do
                  if TempArray[n] = 1 then Dim.FUsedMembers.Add(n);
                FreeAndNil(TempArray);  
              end;
              
              if ThereAreParents then
              begin
                Dim.FIsParentFlags := TIntegerArray.CreateCount(DimArray.Count);
                Dim.FIsParentFlags.FillWith(0);

                for n := 0 to DimArray.Count - 1 do
                begin
                  if NullsArray[n] = 0 then 
                    DimParents[n] := DimArray.IndexOf(DimParents[n])
                  else
                    DimParents[n] := -1;

                  if DimParents[n] >= 0 then
                    Dim.FIsParentFlags[DimParents[n]] := 1;
                end;

                Dim.FHier := True;
              end;
            finally
              FreeAndNil(NullsArray);
            end;

          end;
        finally
          LS.EnableControls;
        end;
      Dim.FHasLookup := True;
    finally
      if OldActive <> Active then Active := OldActive;
    end; 
  end; 
  
end; 

procedure TCustomHierCube.InitLookupDimensions;
var
  i: integer;
begin
  for i := 0 to FDimensions.Count - 1 do ReadDimensionTable(TDimension(Dimensions[i]));
end;

procedure TCustomHierCube.InitCubeMetadata;
var
  i, MemberCount: integer;
  Dim: TDimension;
begin
  InitInternalData;
  InitLookupDimensions;
  FLookupFields := InitLookupFields;
  InitFactTable;

  for i := 0 to FDimensions.Count - 1 do
  begin
    Dim := TDimension(FDimensions[i]);
    if Dim.StrID and (Dim.FStringKeys <> nil) then
      MemberCount := Dim.FStringKeys.Count
    else
      MemberCount := Dim.Items.Count;
    if MemberCount > 1024 * 256 then TooLongDimensionError(Dim.DisplayName, MemberCount);
  end;
end;

function TCustomHierCube.GetActive: Boolean;
begin
  Result := (fState <> dcInactive);
end;

procedure TCustomHierCube.SetActive(Value: Boolean);
begin
  if ((csLoading in ComponentState) or (csReading in ComponentState)) and (Value = True) then
    FStreamedActive := True else
  begin
    if (Active = Value) then EXIT;
    if Value = True then
      begin
        DoBeforeOpen;
        try
          OpenCache;
        except
          FState := dcInactive;
          Clear;
          raise;
        end;
        DoAfterOpen;
      end
    else
      begin
        if not (csDestroying in ComponentState) then DoBeforeClose;
        FState := dcInactive;
        Clear;
        if not (csDestroying in ComponentState) then DoAfterClose;
      end;
    StateChanged;
    NotifyLinkedControls(xeSourceChange);
  end;
end;

procedure TCustomHierCube.DoBeforeOpen;
begin
  if Assigned(FBeforeOpen) then FBeforeOpen(Self);
end;

procedure TCustomHierCube.OpenCache;
begin
  if not Active then
  begin
    FDimensions.Free;
    FSummaries.Free;
    FDimensions := TDimensions.Create;
    FSummaries := TSummaries.Create;
    DoUpdateCache;
    FState := dcBrowseAllData;
  end;
end;

procedure TCustomHierCube.DoUpdateCache;
{$IFNDEF ASPRUNTIME}
var
  OldCursor: HCursor;
{$ENDIF}
begin
{$IFNDEF ASPRUNTIME}
  if FOptions.FShowProgressBar then
    OldCursor := GetCursor
  else
    OldCursor := SetCursor(LoadCursor(0, IDC_WAIT));
  try
    if FOptions.FShowProgressBar then
      begin
        FProgressDialog := THProgressDlg.Create(Application);
        try
          FProgressDialog.OnPerformBuild := UpdateCache;
          FProgressDialog.Caption := GetResStr('xhBuildingCube', @xhBuildingCube);
          FProgressDialog.ShowModal;
          if (FProgressDialog.ExceptMessage <> '') then
            raise ECubeError.Create(FProgressDialog.ExceptMessage);
        finally
          FProgressDialog.Free;
          FProgressDialog := nil;
        end;
      end
    else
{$ENDIF}
      UpdateCache(Self);
{$IFNDEF ASPRUNTIME}
  finally
    SetCursor(OldCursor);
  end;
{$ENDIF}
end;

procedure TCustomHierCube.DoAfterOpen;
begin
  if Assigned(FAfterOpen) then FAfterOpen(Self);
end;

procedure TCustomHierCube.DoAfterClose;
begin
  if Assigned(FAfterClose) then FAfterClose(Self);
end;

procedure TCustomHierCube.DoBeforeClose;
begin
  if Assigned(FBeforeClose) then FBeforeClose(Self);
end;

procedure TCustomHierCube.StateChanged;
begin
end;

procedure TCustomHierCube.UpdateCache(Sender: TObject);
begin
  InitCubeMetadata;
end;

function TCustomHierCube.DefineFieldAsDimension(const FieldName: WideString; DimGroup: TDimGroup): TDimSum;
begin
  Result := DimensionMap.FindItem(FieldName);
  if Result = nil then EXIT;
  Result.MoveToDefined;
  Result.DimSumType := dsDimension;
  Result.FDimGroup := DimGroup;
  Result.FTotalAppearance := taLast;
end;

function TCustomHierCube.DefineFieldAsDimension(const FieldName, DisplayName: WideString; DimGroup: TDimGroup): TDimSum;
begin
  Result := DefineFieldAsDimension(FieldName, DimGroup);
  if Result <> nil then Result.DisplayName := DisplayName;
end;

function TCustomHierCube.DefineFieldAsSummary(const FieldName: WideString): TDimSum;
begin
  Result := DimensionMap.FindItem(FieldName);
  if Result = nil then EXIT;
  Result.DimSumType := dsSummary;
  Result.MoveToDefined;
end;

procedure TCustomHierCube.SetDimensionLookup(Dimension: TDimSum; DimensionTable: TDataSet;
  const ID_Field, Name_Field, ParentID_Field: WideString);
begin
  if (Dimension = nil) or (DimensionTable = nil) or (ID_Field = '') then EXIT;
  if Dimension.DimSumType <> dsDimension then
    raise ECubeError.Create(GetResStr('xhecUnableSetLookupForNotDimension', @xhecUnableSetLookupForNotDimension));
  Dimension.LookupDataSet := DimensionTable;
  Dimension.FID_Field := ID_Field;
  Dimension.DefaultAttribute := Name_Field;
  Dimension.FParentID_Field := ParentID_Field;
end;

{$IFNDEF ASPRUNTIME}
procedure TCustomHierCube.AddLinkedControl(Control: TWinControl);
begin
  if FLinkedControls = nil then FLinkedControls := TList.Create;
  FLinkedControls.Add(Control);
  Control.Perform(CM_HIERCUBEMESSAGE, longint(xeSourceChange), 0);
end;
{$ENDIF}

procedure TCustomHierCube.NotifyLinkedControls(AEvent: THierCubeEvent);
{$IFNDEF ASPRUNTIME}
var
  i: integer;
{$ENDIF}
begin
  {$IFDEF ASPRUNTIME}
  FGridInfo.CMHierCubeMessage(AEvent);
  {$ELSE}
  if (csDestroying in ComponentState) then EXIT;
  if FLinkedControls <> nil then
  for i := 0 to FLinkedControls.Count - 1 do
    TWinControl(FLinkedControls[i]).Perform(CM_HIERCUBEMESSAGE, longint(AEvent), longint(Self));
  {$ENDIF}
end;

procedure TCustomHierCube.Loaded;
begin
  inherited Loaded;
  try
    if FStreamedActive then SetActive(True);
  except
    on E: Exception do
      if csDesigning in ComponentState then
        ShowException(E, ExceptAddr)
      else raise;
  end;
end;


procedure TCustomHierCube.Notification(AComponent: TComponent; Operation: TOperation);
var
  i, j: integer;
  DimCollection: TDimCollection;
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = DataSet) then DataSet := nil;

  if (Operation = opRemove) and (AComponent is TDataSet) then
  for i := 0 to DimensionMap.Count - 1 do
  begin
    if (AComponent = DimensionMap[i].LookupDataSet) then
    begin
      DimensionMap[i].LookupDataSet := nil;
    end;
    if (DimensionMap[i].FDimSumType = dsDimension) and DimensionMap[i].Composite then
    begin
      DimCollection := DimensionMap[i].DimCollection;
      for j := 0 to DimCollection.Count - 1 do
      if AComponent = TDimCollectionItem(DimCollection.Items[j]).LookupDataSet then
        TDimCollectionItem(DimCollection.Items[j]).LookupDataSet := nil;
    end;
  end;
end;

{ TDimSum }

procedure TDimSum.Assign(Source: TPersistent);
begin
  if Source is TDimSum then
  begin
    BaseFieldName := TDimSum(Source).BaseFieldName;
    BaseFieldType := TDimSum(Source).BaseFieldType;
    BaseFieldKind := TDimSum(Source).BaseFieldKind;
    DisplayName := TDimSum(Source).DisplayName;
    DimSumType := TDimSum(Source).DimSumType;
    LookupDataSet := TDimSum(Source).LookupDataSet;
    ID_Field := TDimSum(Source).ID_Field;
    Name_Field := TDimSum(Source).Name_Field;
    ParentID_Field := TDimSum(Source).ParentID_Field;
    FDimGroup := TDimSum(Source).DimGroup;
    FTotalAppearance := TDimSum(Source).TotalAppearance;
    FComposite := TDimSum(Source).Composite;
    FComposedFields := TDimSum(Source).ComposedFields;
    FAttributes := TDimSum(Source).Attributes;
    FDefaultAttribute := TDimSum(Source).DefaultAttribute;
    FEnableTransformation := TDimSum(Source).EnableTransformation;
    FMemberCount := TDimSum(Source).SeriesMemberCount;
    FTransformMethod := TDimSum(Source).TransformMethod;
    FSortType := TDimSum(Source).SortType;
    FDefaultFormat := TDimSum(Source).DefaultFormat;
    FAvailableMembers := TDimSum(Source).FAvailableMembers;
    FAvailableMembers_Field := TDimSum(Source).FAvailableMembers_Field;
  end
  else inherited Assign(Source);
end;

constructor TDimSum.Create(Collection: TCollection);
begin
  inherited;
  FDimCollection := TDimCollection.Create((Collection as TDimSums).HierCube); 
  FBaseFieldType := ftUnknown;
  FBaseFieldKind := fkData;
  FDimSumType := dsUnknown;
  FDimGroup := dgRow;
  FTotalAppearance := taLast;
  FEnableTransformation := False;
  FMemberCount := 0;
  FTransformMethod := tmEqualDensity;
  FSortType := dsNameAsc;
  FAvailablemembers := byFactTable;
end;

function TDimSum.GetHierCube: TCustomHierCube;
begin
  Result := (Collection as TDimSums).HierCube;
end;

procedure TDimSum.SetLookupDataSet(Value: TDataSet);
begin
  if Value <> FLookupDataSet then
  begin
    if Value <> nil then Value.FreeNotification(HierCube); 
    FLookupDataSet := Value;
    if Value = nil then
    begin
      FID_Field := '';
      FParentID_Field := '';
      FDefaultAttribute := '';
      FAttributes := '';
    end;
  end;
end;

{ TDimSums }

function TDimSums.Add: TDimSum;
begin
  Result := TDimSum(inherited Add);
end;

procedure TDimSums.CorrectCompositeFields;
var
  i, Index: integer;
  DimSum: TDimSum;
  s, NewComposedFields: WideString;
  p: TDimSum;
begin
  for i := 0 to Count - 1 do
  begin
    DimSum := Items[i];
    if DimSum.Composite and (WideTrim(DimSum.ComposedFields) <> '') then
    begin
      Index := 1;
      s := ExtractWord(DimSum.ComposedFields, Index);
      NewComposedFields := '';
      if s <> '' then
      repeat
        p := FindItem(s);
        if (p <> nil) and (p.Composite = False) then
        begin
          if NewComposedFields = '' then
            NewComposedFields := s
          else
            NewComposedFields := NewComposedFields + xhFieldsDelimiter + WideChar(' ') + s;
        end;

        s := ExtractWord(DimSum.ComposedFields, Index);
      until s = '';
      
      DimSum.ComposedFields := NewComposedFields;
      DimSum.BaseFieldName := NewComposedFields;
    end;
  end;
end;

constructor TDimSums.Create(AHierCube: TCustomHierCube);
begin
  inherited Create(TDimSum);
  FHierCube := AHierCube;
end;

function TDimSums.FindField(const AFieldName: WideString; AFieldType: TFieldType): integer;
var
  i: integer;
  DS: TDimSum;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  begin
    DS := Items[i];
    if (WideCompareText(DS.BaseFieldName, AFieldName) = 0) and (DS.BaseFieldType = AFieldType) then
    begin
      Result := i;
      EXIT;
    end;
  end;
end;

function TDimSums.FindItem(const FieldName: WideString): TDimSum;
var
  i: integer;
  DimSum: TDimSum;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    DimSum := Items[i];
    if not DimSum.Composite and not DimSum.RangeBased then
    if (WideCompareText(DimSum.FBaseFieldName, FieldName) = 0) then
    begin
      Result := DimSum;
      break;
    end;
  end;
end;

function TDimSums.FindFirstUndefined: integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  if Items[i].DimSumType = dsUnknown then
  begin
    Result := i;
    BREAK;
  end;
end;

function TDimSums.FindItem(const FieldName: WideString; ExcludeType: TDimSumType): TDimSum;
var
  i: integer;
  DimSum: TDimSum;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    DimSum := Items[i];
    if not DimSum.Composite and
      (DimSum.DimSumType <> ExcludeType) then
    if (WideCompareText(DimSum.FBaseFieldName, FieldName) = 0) then
    begin
      Result := DimSum;
      break;
    end;
  end;
end;

function TDimSums.FindSummary(const FieldName: WideString): TDimSum;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  if (WideCompareText(Items[i].FBaseFieldName, FieldName) = 0) and (Items[i].FDimSumType = dsSummary) then
  begin
    Result := Items[i];
    break;
  end;
end;

function TDimSums.GetDimCount: Integer;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Count - 1 do if Items[i].DimSumType = dsDimension then inc(Result);
end;

function TDimSums.GetItem(Index: integer): TDimSum;
begin
  Result := TDimSum(inherited GetItem(Index));
end;

function TDimSums.GetOwner: TPersistent;
begin
  Result := FHierCube;
end;

function TDimSums.GetSumCount: Integer;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Count - 1 do if Items[i].DimSumType = dsSummary then inc(Result);
end;

procedure TDimSums.SetItem(Index: integer; DimSum: TDimSum);
begin
  inherited SetItem(Index, DimSum);
end;

{ TGridInfo }

constructor TGridInfo.Create(AOwner: TComponent);
begin
  {$IFDEF ASPRUNTIME}
  inherited Create;
  {$ELSE}
  inherited;
  {$ENDIF}
  FDatasetStringSize := 200;
  FPivotEventArgs := TPivotEventArgs.Create;
  {$IFDEF ASPRUNTIME}
  FCube := (AOwner as TCustomHierCube);
  {$ELSE}
  FGrid := (AOwner as TWinControl);
  {$ENDIF}
  fSummarySettings := TSummarySettings.Create(Self);

{$IFNDEF ASPRUNTIME}
  FColorSchema := xhcHighestIsHot;
{$ENDIF}

  FValueSortData := TValueSortData.Create;
  FPivotStates := TPivotStates.Create(Self);

  FLowestSubLevelNode := ltSubFunction;
  fFunctionDefs := TFunctionDefs.Create(Self, TFunctionDef);
  fFunctionDefs.InitFunctions;
  FSubFunctionDefs := TSubFunctionDefs.Create(Self);
end;

destructor TGridInfo.Destroy;
begin
  NilAllArrays;
  FreeAndNil(FDeletedFTIndexes);
  FreeAndNil(FModifiedFTIndexes);
  {$IFNDEF ASPRUNTIME}
  FreeAndNil(FUserDataset);
  {$ENDIF}
  FreeAndNil(fSummarySettings);
  FreeAndNil(FValueSortData);
  FreeAndNil(FPivotStates);
  FreeAndNil(FLinkedControls);
  FreeAndNil(fFunctionDefs);
  FreeAndNil(fSubFunctionDefs);
  FreeAndNil(FPivotEventArgs);
  FCube := nil;
  inherited;
end;

procedure TGridInfo.InitSumIndexes;
var
  n: integer;
begin
  n := FActiveDimIDs.Count;

  FIntegerArray1.Free;
  FIntegerArray1 := TIntegerArray.CreateCount(n);

  FIntegerArray2.Free;
  FIntegerArray2 := TIntegerArray.CreateCount(n);

  FIntegerArray3.Free;
  FIntegerArray3 := TIntegerArray.CreateCount(n);

  FIntegerArray4.Free;
  FIntegerArray4 := TIntegerArray.CreateCount(n);

  FIntegerArray5.Free;
  FIntegerArray5 := TIntegerArray.CreateCount(n);

  FIntegerArray10.Free;
  FIntegerArray10 := TIntegerArray.CreateCount(n);

  FIntegerArray11.Free;
  FIntegerArray11 := TIntegerArray.CreateCount(n);
end;

procedure TGridInfo.RebuildActiveDimIDs;
var
  i: integer;
  Dimensions: TDimensions;
begin
  if Active then
    begin
      if NewActiveDimIDs then
      begin
        try
          Dimensions := FCube.Dimensions;
          FActiveDimIndexes.Free; 
          FActiveDimIndexes := TIntegerArray.CreateCount(Dimensions.Count);
          for i := 0 to FActiveDimIndexes.Count - 1 do
            FActiveDimIndexes[i] := FActiveDimIDs.IndexOf(i);
          InitSumIndexes;
          if FActiveDimIDs.Count > 32 then  raise ECubeError.Create(GetResStr('xhecTooMuchDimensions', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecTooMuchDimensions));
          InitSummaries;
        except
          FCube.Active := False;
          raise;
        end;
      end;
    end
  else
    begin
      FreeAndNil(FActiveDimIDs);
      FreeAndNil(FActiveDimIndexes);
    end;
end;

procedure TGridInfo.InitSummaries;
var
  DimState: TDimensionState;
  cRange: CubeInteger;
  i, j: integer;
  HierRange: longword;

  procedure TooLargeError;
  begin
    raise ECubeError.Create(GetResStr('xhecTooLargeActiveCapacity', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecTooLargeActiveCapacity));
  end;

begin
  cRange := 1; HierRange := 1;
  for i := FActiveDimIDs.Count - 1 downto 0 do
  begin
    DimState := TDimensionState(FDimensionStates[FActiveDimIDs[i]]);
    DimState.FRange := cRange;
    j := DimState.MemberCount + 1;
{$IFDEF ASPRUNTIME}
    cRange := cRange * j;
{$ELSE}
    asm
       mov    EAX, j
       mov     ecx, eax
       mul     dword ptr [cRange+4]
       or      edx, edx
       jz      @@1
       call    TooLargeError
    @@1:
       xchg    ecx, eax
       mul     dword ptr [cRange]
       add     edx, ecx
       jnc     @@2              
       call    TooLargeError
    @@2:
       mov    dword ptr [cRange], EAX
       mov    dword ptr [cRange + $04], EDX
    end;
{$ENDIF}
    DimState.FHierRange := HierRange;
    HierRange := HierRange * (longword(DimState.FLevelsCount) + 1);  
  end;
  FCubeCapacity := cRange;

  FSummaryStates.FLineIDs.Clear;
  FSummaryStates.FAllOffsets.Clear;
  FSummaryStates.FFactOffsets.Clear;
  for i := 0 to FSummaryStates.Count - 1 do
  with TSummaryState(FSummaryStates[i]) do
  begin
    FreeAndNil(FFactTotals);
    FreeAndNil(FAllTotals); FAllTotals := TObjectArray.Create;
  end;
end;

procedure TGridInfo.SetupData;
var
  DimID, SumID, i: integer;
  Dim: TDimension;
  Sum: TSummary;
  Dimensions: TDimensions;
  Summaries: TSummaries;
  DimState: TDimensionState;
  SumState: TSummaryState;
  SumInfo: TSummaryInfo;

  procedure SortDimIDs(DimIDs: TIntegerArray);
  var
    i, j, tmp: integer;
  begin
    for i := DimIDs.Count - 1 downto 1 do
    for j := 0 to i - 1 do
    if TDimension(Dimensions[DimIDs[j]]).DimensionMapIndex >
       TDimension(Dimensions[DimIDs[j + 1]]).DimensionMapIndex then
    begin
      tmp := DimIDs[j];
      DimIDs[j] := DimIDs[j + 1];
      DimIDs[j + 1] := tmp;
    end;
  end;

begin
  BeginChange;
  try
    if Active and (FCube.Dimensions.Count > 0) and (FCube.Summaries.Count > 0) then
      begin
        FRowDimIDs.Free; FRowDimIDs := TIntegerArray.Create;
        FColDimIDs.Free; FColDimIDs := TIntegerArray.Create;
        FPageDimIDs.Free; FPageDimIDs := TIntegerArray.Create;

        Dimensions := FCube.Dimensions;
        FDimensionStates.Free;
        FDimensionStates := TDimensionStates.Create(Self);
        FDimensionStates.Count := Dimensions.Count;

        for DimID := 0 to Dimensions.Count - 1 do
        begin
          Dim := TDimension(Dimensions[DimID]);

          DimState := TDimensionState.Create(Self);
          DimState.InitFromDimension(DimID, Dim);
          FDimensionStates[DimID] := DimState;
          case Dim.FDimGroup of
            dgRow: FRowDimIDs.Add(DimID);
            dgCol: FColDimIDs.Add(DimID);
            dgPage: FPageDimIDs.Add(DimID);
          end;
        end;
        SortDimIDs(FRowDimIDs);
        SortDimIDs(FColDimIDs);
        SortDimIDs(FPageDimIDs);

        Summaries := FCube.Summaries;
        FSummaryStates.Free;
        FSummaryStates := TSummaryStates.CreateCount(Self, Summaries.Count);
        for SumID := 0 to Summaries.Count - 1 do
        begin
          Sum := TSummary(Summaries[SumID]);
          SumState := TSummaryState.Create(Sum, SumID, Self);
          SumInfo := FSummarySettings.FindFieldName(Sum.FieldName);
          if SumInfo = nil then
          begin
            SumInfo := FSummarySettings.Add;
            SumInfo.FieldName := Sum.FieldName;
            SumInfo.DisplayName := Sum.DisplayName;
            SumInfo.FDefaultFormat := Sum.DefaultFormat;
            SumInfo.FID := FSummarySettings.Count - 1;
            SumInfo.InitAllChilds;
          end;
          SumInfo.fGridInfo := Self;
          SumState.fSummaryInfo := SumInfo;
          SumInfo.FSummaryState := SumState;
          SumInfo.DimensionMapIndex := Sum.DimensionMapIndex;

          FSummaryStates[SumID] := SumState;
        end;
        for i := FSummarySettings.Count - 1 downto 0 do
        begin
          SumInfo := FSummarySettings[i];
          if not SumInfo.Calculated and (SumInfo.FSummaryState = nil) then SumInfo.Free;
        end;
        FreeAndNil(FActiveDimIDs);
      end 
    else
      begin
        NilAllArrays;
        FPivotStates.Clear;
        for i := 0 to FSummarySettings.Count - 1 do FSummarySettings[i].FSummaryState := nil;
      end; 
  finally
    EndChange(geSourceChange, 0);
  end;
end;

procedure TGridInfo.PrecalcOnExpand(LabelNode: TLabelNode; NextDimID: integer);
var
  HierIndex: TIntegerArray;
  SumIndex: TIntegerArray;
  DimIDs: TIntegerArray;
  DimState: TDimensionState;
  i, n, Index, DimID: integer;
begin
  SumIndex := TIntegerArray.CreateCount(FActiveDimIDs.Count);
  try
    SumIndex.FillWith(SubTotal);
    ScanFromLabelNode(LabelNode, SumIndex);
    HierIndex := SumIndex2HierIndex(SumIndex);
    if NextDimID >= 0 then
      HierIndex[FActiveDimIndexes[NextDimID]] := 1;
    if LabelNode.DimState.DimGroup = dgRow then
      DimIDs := FColDimIDs
    else
      DimIDs := FRowDimIDs;

    if DimIDs <> nil then
      begin
        for i := 0 to DimIDs.Count - 1 do
        begin
          DimID := DimIDs[i];
          DimState := TDimensionState(FDimensionStates[DimID]);
          HierIndex[FActiveDimIndexes[DimID]] := DimState.FOpenLevels;
        end;
        for i := DimIDs.Count - 1 downto 0 do
        begin
          DimID := DimIDs[i];
          DimState := TDimensionState(FDimensionStates[DimID]);
          Index := FActiveDimIndexes[DimID];
          for n := DimState.FOpenLevels downto 1 do
          begin
            HierIndex[Index] := n;
            CalcLine(SumIndex2LineIndex(HierIndex), CodeHierIndex(HierIndex), HierIndex);
          end;
          HierIndex[Index] := SubTotal;
          CalcLine(SumIndex2LineIndex(HierIndex), CodeHierIndex(HierIndex), HierIndex);
        end;
      end
    else
       CalcLine(SumIndex2LineIndex(HierIndex), CodeHierIndex(HierIndex), HierIndex);
  finally
    SumIndex.Free;
  end;
end;

procedure TGridInfo.RebuildLookups;
begin
  if (not Active) or (FRowDimIDs = nil) or (FColDimIDs = nil) then
    begin
      FRowMax := 1;
      FColMax := 1;
    end
  else
    begin
      RebuildLabelNodes;
      SortLookups(True, True);
    end;
end;

procedure TGridInfo.RebuildLabelNodes;
begin
  FreeAndNil(FOpenRowNodes);
  if FRowLabelNodes <> nil then
  begin
    FOpenRowNodes := TOpenDimNodes.Create;
    FOpenRowNodes.SaveLabelNodes(FRowLabelNodes);
  end;
  FreeAndNil(FRowLabelNodes); FRowMax := 1;

  FreeAndNil(FOpenColNodes);
  if FColLabelNodes <> nil then
  begin
    FOpenColNodes := TOpenDimNodes.Create;
    FOpenColNodes.SaveLabelNodes(FColLabelNodes);
  end;
  FreeAndNil(FColLabelNodes); FColMax := 1;

  PrecalcRootLines;

  if RowDimIDs <> nil then
  if RowDimIDs.Count > 0 then
  begin
    FRowMax := BuildRootLabelNodes(RowDimIDs, FRowLabelNodes);
    if FRowMax = 0 then FRowMax := 1;
  end;
  if ColDimIDs <> nil then
  if ColDimIDs.Count > 0 then
  begin
    FColMax := BuildRootLabelNodes(ColDimIDs, FColLabelNodes);
    if FColMax = 0 then FColMax := 1;
  end;

  if (FRowLabelNodes <> nil) and (FOpenRowNodes <> nil) then
  if FOpenRowNodes.Count > 0 then
    RestoreLabelNodes(dgRow, FOpenRowNodes);

  if (FColLabelNodes <> nil) and (FOpenColNodes <> nil) then
  if FOpenColNodes.Count > 0 then
    RestoreLabelNodes(dgCol, FOpenColNodes);

  RebuildVisibleDimIDs;
end;

procedure TGridInfo.PrecalcRootLines;
var
  HierIndex: TIntegerArray;
begin
  HierIndex := TIntegerArray.CreateCount(FActiveDimIDs.Count);
  try
    HierIndex.FillWith(1);
    CalcLine(0, CodeHierIndex(HierIndex), HierIndex);

    if (RowDimIDs.Count > 0) and (ColDimIDs.Count > 0) then
    begin
      HierIndex.FillWith(SubTotal);
      HierIndex[FActiveDimIndexes[RowDimIDs[0]]] := 1;
      HierIndex[FActiveDimIndexes[ColDimIDs[0]]] := 1;
      CalcLine(SumIndex2LineIndex(HierIndex), CodeHierIndex(HierIndex), HierIndex);
    end;

    if RowDimIDs.Count > 0 then
    begin
      HierIndex.FillWith(SubTotal);
      HierIndex[FActiveDimIndexes[RowDimIDs[0]]] := 1;
      CalcLine(SumIndex2LineIndex(HierIndex), CodeHierIndex(HierIndex), HierIndex);
    end;

    if ColDimIDs.Count > 0 then
    begin
      HierIndex.FillWith(SubTotal);
      HierIndex[FActiveDimIndexes[ColDimIDs[0]]] := 1;
      CalcLine(SumIndex2LineIndex(HierIndex), CodeHierIndex(HierIndex), HierIndex);
    end;
  finally
    HierIndex.Free;
  end;
end;

procedure TGridInfo.BeginChange;
begin
{$IFNDEF ASPRUNTIME}
  if FChangeCount = 0 then 
  if not (csDesigning in FGrid.ComponentState) then
  begin
    FScreenCursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;
  end;
{$ENDIF}
  FChangeCount := FChangeCount + 1;
end;

procedure TGridInfo.EndChange(AEvent: TGridInfoEvent; Flags: longword);
begin
  if FChangeCount <= 1 then
    try
      if AEvent = geColsSort then SortLookups(False, True)
      else if AEvent = geRowsSort then SortLookups(True, False)
      else if AEvent = geAggregateChanged then SortLookups(True, True)
      else if AEvent = geToggleDimValue then SortLookups(True, True)
      else if (AEvent = geNewGridLayout) then RebuildVisibleNodes
      else if (AEvent = geSubLevelNodeChanged) then
        begin
          RebuildGridSummaryArray;
          RebuildColSubLevelNodes;
        end
      else if (AEvent = geTotalAppearanceChanged) or (AEvent = gePageChanged) then
        RebuildLookups
      else
        begin
          RebuildActiveDimIDs;
          RebuildLookups;
        end;
      {$IFNDEF ASPRUNTIME}
      NotifyLinkedControls(AEvent, Flags);
      {$ENDIF}
    finally
      FChangeCount := 0;
      {$IFNDEF ASPRUNTIME}
      if not (csDesigning in FGrid.ComponentState) then Screen.Cursor := FScreenCursor;
      {$ENDIF}
    end
  else
    FChangeCount := FChangeCount - 1;
end;

function TGridInfo.GetDimensionName(DimID: integer): WideString;
begin
  Result := '';
  if Active then Result := TDimensionState(FDimensionStates[DimID]).FieldName;
end;

function TGridInfo.GetSummaryName(SumID: integer): WideString;
var
  SumInfo: TSummaryInfo;
begin
  Result := '';
  if not Active then EXIT;
  SumInfo := FSummarySettings.FindSumInfoID(SumID);
  if SumInfo <> nil then
    Result := SumInfo.fFieldName
  else
    Result := '';
end;

procedure TGridInfo.RebuildVisibleNodes;
begin
  FreeAndNil(FVisibleRowNodes);
  if FRowLabelNodes <> nil then
  if FRowLabelNodes.Count > 0 then
  begin
    FVisibleRowNodes := FRowLabelNodes.RebuildVisibleNodes;
  end;

  FreeAndNil(FVisibleColNodes);
  if FColLabelNodes <> nil then
  if FColLabelNodes.Count > 0 then
  begin
    FVisibleColNodes := FColLabelNodes.RebuildVisibleNodes;
  end;

  RebuildCaptionNodes;
  RebuildGridSummaryArray;
  RebuildColSubLevelNodes;
end;

function TGridInfo.GetDataAsDouble1(ARow, ACol: integer; out Res: Double): boolean;
var
  SumInfoID: integer;
  Fun: TFunction;
  SubFun: TSubFunction;
begin
  Result := False;
  if Active then
  begin
    Col2SumFun(ACol, SumInfoID, Fun, SubFun);
    Result := FGridSummaryArray.GetData2(Row2LabelNode(ARow), Col2LabelNode(ACol), SumInfoID, Fun, SubFun, Res);
  end;
end;

function TGridInfo.GetDataAsDouble2(RowNode, ColNode: TLabelNode; SumInfoID: integer; Fun: TFunction; SubFun: TSubFunction; out Res: Double): boolean;
begin
  Result := False;
  if Active then
    Result := FGridSummaryArray.GetData2(RowNode, ColNode, SumInfoID, Fun, SubFun, Res);
end;

function TGridInfo.GetDataAsDouble3(RowNode: TLabelNode; ACol: integer; out Res: Double): boolean;
var
  SumInfoID: integer;
  Fun: TFunction;
  SubFun: TSubFunction;
begin
  Result := False;
  if Active then
  begin
    Col2SumFun(ACol, SumInfoID, Fun, SubFun);
    Result := FGridSummaryArray.GetData2(RowNode, Col2LabelNode(ACol), SumInfoID, Fun, SubFun, Res);
  end;
end;

function TGridInfo.GetDataAsDouble(ARow, ACol: integer; out Res: Double): boolean;
begin
  Result := GetDataAsDouble1(ARow, ACol, Res);
end;

function TGridInfo.GetDataAsDouble(RowNode, ColNode: TLabelNode; SumInfoID: integer; Fun: TFunction; SubFun: TSubFunction; out Res: Double): boolean;
begin
  Result := GetDataAsDouble2(RowNode, ColNode, SumInfoID, Fun, SubFun, Res);
end;

function TGridInfo.GetDataAsDouble(RowNode: TLabelNode; ACol: integer; out Res: Double): boolean;
begin
  Result := GetDataAsDouble3(RowNode, ACol, Res);
end;

{$IFNDEF ASPRUNTIME}
procedure TGridInfo.RebuildColoredCells(ARow, ACol: integer);
var
  SumInfoID: integer;
  Fun: TFunction;
  SubFun: TSubFunction;
  Horz: boolean;
  VisibleNodes: TPointerArray;
  i: integer;
  Node, ParentNode: TLabelNode;
  RowNode, ColNode: TLabelNode;
  Mi, Ma, D: double;
  AreaIndexes: TIntegerArray;
  AreaDoubles: TDoubleArray;
  ColoredCoord: PColoredCoord;
  SubFunOffset: integer;
begin
  FreeAndNil(FColoredCells);
  if not Active then EXIT;
  Col2SumFun(ACol, SumInfoID, Fun, SubFun);
  SubFunOffset := ACol mod FGridColsOnValue;
  Horz := (SubFun = sstRankByRow) or (SubFun = sstPercentByRow) or
    (SubFun = sstCompareWithPrevByRow) or (SubFun = sstCumulativeSumByRow);
  if Horz then
    begin
      VisibleNodes := FVisibleColNodes;
      if VisibleNodes <> nil then
      begin
        Node := Col2LabelNode(ACol);
        if Node.IsSubTotal then Node := Node.Parent;
        if Node = nil then EXIT; 
        ParentNode := Node.Parent;
        AreaIndexes := TIntegerArray.Create;
        AreaDoubles := TDoubleArray.Create;
        try
          RowNode := Row2LabelNode(ARow);

          for i := 0 to VisibleNodes.Count - 1 do
          begin
            Node := VisibleNodes[i];
            if ((Node.Parent = ParentNode) and not Node.IsSubTotal) or
               (Node.IsSubTotal and (Node.Parent <> nil) and (Node.Parent.Parent = ParentNode)) then
            begin
              if FGridSummaryArray.GetData2(RowNode, Node, SumInfoID, Fun, SubFun, D) then
              begin
                AreaIndexes.IncCount;  AreaIndexes[AreaIndexes.Count - 1] := i * FGridColsOnValue + SubFunOffset;
                AreaDoubles.IncCount;  AreaDoubles[AreaDoubles.Count - 1] := D;
              end;
            end;
          end;
          if AreaIndexes.Count > 0 then
          begin
            Mi := AreaDoubles[0];
            Ma := Mi;
            for i := 0 to AreaDoubles.Count - 1 do
            begin
              D := AreaDoubles[i];
              if D < Mi then Mi := D;
              if D > Ma then Ma := D;
            end;
            FColoredCells := TColoredCells.CreateCount(AreaIndexes.Count);
            FColoredCells.FMi := Mi;
            FColoredCells.FMa := Ma;
            for i := 0 to AreaIndexes.Count - 1 do
            begin
              ColoredCoord := FColoredCells.GetItem(i);
              ColoredCoord.Col := AreaIndexes[i]; 
              ColoredCoord.Row := ARow;
            end;
          end;
        finally
          AreaIndexes.Free; AreaDoubles.Free;
        end;
      end;
    end
  else
    begin
      VisibleNodes := FVisibleRowNodes;
      if VisibleNodes <> nil then
      begin
        Node := VisibleNodes[ARow];
        if Node.IsSubTotal then Node := Node.Parent;
        if Node = nil then EXIT; 
        ParentNode := Node.Parent;
        AreaIndexes := TIntegerArray.Create;
        AreaDoubles := TDoubleArray.Create;
        try
          ColNode := Col2LabelNode(ACol);

          for i := 0 to VisibleNodes.Count - 1 do
          begin
            Node := VisibleNodes[i];
            if ((Node.Parent = ParentNode) and not Node.IsSubTotal) or
               (Node.IsSubTotal and (Node.Parent <> nil) and (Node.Parent.Parent = ParentNode)) then
            begin
              if FGridSummaryArray.GetData2(Node, ColNode, SumInfoID, Fun, SubFun, D) then
              begin
                AreaIndexes.IncCount;  AreaIndexes[AreaIndexes.Count - 1] := i;
                AreaDoubles.IncCount;  AreaDoubles[AreaDoubles.Count - 1] := D;
              end;
            end;
          end;
          if AreaIndexes.Count > 0 then
          begin
            Mi := AreaDoubles[0];
            Ma := Mi;
            for i := 0 to AreaDoubles.Count - 1 do
            begin
              D := AreaDoubles[i];
              if D < Mi then Mi := D;
              if D > Ma then Ma := D;
            end;

            FColoredCells := TColoredCells.CreateCount(AreaIndexes.Count);
            FColoredCells.FMi := Mi;
            FColoredCells.FMa := Ma;
            for i := 0 to AreaIndexes.Count - 1 do
            begin
              ColoredCoord := FColoredCells.GetItem(i);
              ColoredCoord.Col := ACol; 
              ColoredCoord.Row := AreaIndexes[i];
            end;
          end;
        finally
          AreaIndexes.Free; AreaDoubles.Free;
        end;
      end;
    end;
end;
{$ENDIF}

procedure TGridInfo.Col2SumFun(ACol: integer; out SumInfoID: integer; out Fun: TFunction; out SubFun: TSubFunction);
var
  ColSubLevelNode: TSubLevelNode;
begin
  if (ACol < 0) or (ACol >= FVisibleColSubLevelNodes.Count) then
    raise exception.Create(GetResStr('xhWrongColumnValue', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhWrongColumnValue)); // This error should never be raised
  if FVisibleColSubLevelNodes <> nil then ColSubLevelNode := TSubLevelNode(FVisibleColSubLevelNodes[aCol]) else ColSubLevelNode := nil;
  SumInfoID := ColSubLevelNode.SumInfoID;
  if (FLowestSubLevelNode < ltFunction) then
    Fun := FFunctionDisplayed
  else
    Fun := ColSubLevelNode.Fun;
  if (FLowestSubLevelNode < ltSubFunction) then
    SubFun := FSubFunctionDisplayed
  else
    SubFun := ColSubLevelNode.SubFun;
end;

function TGridInfo.ActiveGroupCubeIndex2DimID(DimGroup: TDimGroup; Index: Integer): integer;
begin
  Result := WrongIndex;
  if dimGroup = dgRow then
    begin
      if (Index >= 0) and (Index < RowDimIDs.Count) then
        Result := RowDimIDs[Index]
    end
  else if dimGroup = dgCol then
    begin
      if (Index >= 0) and (Index < ColDimIDs.Count) then
        Result := ColDimIDs[Index];
    end
  else if dimGroup = dgPage then
    begin
      if (Index >= 0) and (Index < PageDimIDs.Count) then
        Result := PageDimIDs[Index];
    end;
end;

function TGridInfo.GetDimensionMemberAsString(DimID, ValueIndex: Integer): WideString;
begin
  Result := '';
  if Active then
    Result := TDimensionState(FDimensionStates[DimID]).GetMemberAsString(ValueIndex);
end;

procedure TGridInfo.ScanFromLabelNode(LabelNode: TLabelNode; SumIndex: TIntegerArray);
var
  OldDimID: integer;
  Node: TLabelNode;
{$IFNDEF ASPRUNTIME}
  SumIndexArray: PIntArray;
  ActiveDimIndexesArray: PIntArray;
{$ENDIF}
begin
  OldDimID := WrongIndex;
  Node := LabelNode;
{$IFNDEF ASPRUNTIME}
  SumIndexArray := SumIndex.ArrayPointer;
  ActiveDimIndexesArray := FActiveDimIndexes.ArrayPointer;
{$ENDIF}
  while Node <> nil do
  begin
    if Node.DimID <> OldDimID then
    begin
      while Node.Value = SubTotal do
      begin
        if Node.Parent <> nil then
          begin
            if Node.Parent.DimID = Node.DimID then Node := Node.Parent else BREAK;
          end
        else
          BREAK;
      end;
{$IFDEF ASPRUNTIME}
      SumIndex[ActiveDimIndexes[Node.DimID]] := Node.Value;
{$ELSE}
      SumIndexArray[ActiveDimIndexesArray[Node.DimID]] := Node.Value;
{$ENDIF}
      OldDimID := Node.DimID;
    end;
    Node := Node.Parent;
  end;
end;

function TGridInfo.RowColNodes2SumIndex(RowLabelNode, ColLabelNode: TLabelNode): TIntegerArray;
begin
  Result := FIntegerArray1;
  Result.FillWith(SubTotal);
  if RowLabelNode <> nil then ScanFromLabelNode(RowLabelNode, Result);
  if ColLabelNode <> nil then ScanFromLabelNode(ColLabelNode, Result);
end;

function TGridInfo.GetVisibleDataRows: integer;
begin
  Result := 1;
  if FVisibleRowNodes <> nil then
    if FVisibleRowNodes.Count > 0 then Result := FVisibleRowNodes.Count;
end;

function TGridInfo.GetVisibleDataCols: integer;
begin
  Result := 1;
  if FVisibleColSubLevelNodes <> nil then        
    if FVisibleColSubLevelNodes.Count > 0 then Result := FVisibleColSubLevelNodes.Count;
end;

function TGridInfo.GetActiveColDimsCount: Integer;
var
  i: integer;
begin
  Result := 0;
  if assigned(FVisibleColDimIDs) then
  for i := 0 to FVisibleColDimIDs.Count - 1 do
    Result := Result + TDimensionState(FDimensionStates[FVisibleColDimIDs[i]]).FOpenLevels;
end;

function TGridInfo.GetActiveRowDimsCount: Integer;
var
  i: integer;
begin
  Result := 0;
  if assigned(FVisibleRowDimIDs) then
  for i := 0 to FVisibleRowDimIDs.Count - 1 do
    Result := Result + TDimensionState(FDimensionStates[FVisibleRowDimIDs[i]]).FOpenLevels;
end;

procedure TGridInfo.SwapDims1(DimGroup1, DimGroup2: TDimGroup; Index1, Index2: integer);
var
  DimID1, DimID2: integer;
begin
  DimID1 := ActiveGroupCubeIndex2DimID(DimGroup1, Index1);
  DimID2 := ActiveGroupCubeIndex2DimID(DimGroup2, Index2);
  SwapDims2(DimID1, DimID2);
end;

procedure TGridInfo.SwapDims2(DimID1, DimID2: integer);
begin
  SwapDims3(TDimensionState(FDimensionStates[DimID1]), TDimensionState(FDimensionStates[DimID2]));
end;

procedure TGridInfo.SwapDims3(DimState1, DimState2: TDimensionState);
var
  PageAreaChanged: boolean;
begin
  if DimState1.DimID = DimState2.DimID then EXIT; 
  FPivotEventArgs.Clear;
  FPivotEventArgs.FAllowOperation := True;
  if assigned(FBeforeSwapDims) then
    FBeforeSwapDims({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, DimState1.DimID, DimState2.DimID, FPivotEventArgs.FAllowOperation);
  if assigned(FBeforePivot) then
  begin
    FPivotEventArgs.FOperation := opSwapDims;
    FPivotEventArgs.FDimState := DimState1;
    FPivotEventArgs.FDimState2 := DimState2;
    FBeforePivot({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, FPivotEventArgs);
  end;

  if not FPivotEventArgs.FAllowOperation then EXIT;
  BeginChange;
  try
    DoSwapDimIDs(DimState1, DimState2, PageAreaChanged);
    EndChange(gePivot, 0);
  finally
    FChangeCount := 0;
{$IFNDEF ASPRUNTIME}
    if not (csDesigning in FGrid.ComponentState) then Screen.Cursor := FScreenCursor;
{$ENDIF}
  end;

  if assigned(FAfterSwapDims) then
    FAfterSwapDims({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, DimState1.DimID, DimState2.DimID);
  if assigned(FAfterPivot) then
  begin
    FPivotEventArgs.FOperation := opSwapDims;
    FPivotEventArgs.FDimState := DimState1;
    FPivotEventArgs.FDimState2 := DimState2;
    FAfterPivot({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, FPivotEventArgs);
  end;
end;

procedure TGridInfo.SwapDims(DimGroup1, DimGroup2: TDimGroup; Index1, Index2: integer);
begin
  SwapDims1(DimGroup1, DimGroup2, Index1, Index2);
end;

procedure TGridInfo.SwapDims(DimID1, DimID2: integer);
begin
  SwapDims2(DimID1, DimID2);
end;

procedure TGridInfo.SwapDims(DimState1, DimState2: TDimensionState);
begin
  SwapDims3(DimState1, DimState2);
end;

procedure TGridInfo.MoveDim1(DimGroup, NewDimGroup: TDimGroup; Index, NewIndex: integer);
var
  SDimID: integer;
begin
  SDimID := ActiveGroupCubeIndex2DimID(DimGroup, Index);
  if SDimID < 0 then EXIT; 
  MoveDim2(SDimID, NewDimGroup, NewIndex);
end;

procedure TGridInfo.MoveDim2(DimID: integer; NewDimGroup: TDimGroup; NewIndex: integer);
var
  DDimID: integer;
  PageAreaChanged: boolean;
begin
  DDimID := ActiveGroupCubeIndex2DimID(NewDimGroup, NewIndex);
  if DimID = DDimID then EXIT; 
  FPivotEventArgs.Clear;
  FPivotEventArgs.FAllowOperation := True;
  if assigned(FBeforeMoveDim) then
    FBeforeMoveDim({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, DimID, NewDimGroup, NewIndex, FPivotEventArgs.FAllowOperation);
  if assigned(FBeforePivot) then
  begin
    FPivotEventArgs.FOperation := opMoveDim;
    FPivotEventArgs.FDimState := TDimensionState(FDimensionStates[DimID]);
    FPivotEventArgs.FNewDimGroup := NewDimGroup;
    FPivotEventArgs.FNewDimIndex := NewIndex;
    FBeforePivot({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, FPivotEventArgs);
  end;
  if not FPivotEventArgs.FAllowOperation then EXIT;

  BeginChange;
  try
    DoMoveDim(DimID, NewDimGroup, NewIndex, PageAreaChanged);
    EndChange(gePivot, 0);
  finally
    FChangeCount := 0;
    {$IFNDEF ASPRUNTIME}
    if not (csDesigning in FGrid.ComponentState) then Screen.Cursor := FScreenCursor;
    {$ENDIF}
  end;
  if assigned(FAfterMoveDim) then
    FAfterMoveDim({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, DimID, NewDimGroup, NewIndex);
  if assigned(FAfterPivot) then
  begin
    FPivotEventArgs.FOperation := opMoveDim;
    FPivotEventArgs.FDimState := TDimensionState(FDimensionStates[DimID]);
    FPivotEventArgs.FNewDimGroup := NewDimGroup;
    FPivotEventArgs.FNewDimIndex := NewIndex;
    FAfterPivot({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, FPivotEventArgs);
  end;
end;

procedure TGridInfo.MoveDim3(DimState: TDimensionState; NewDimGroup: TDimGroup; NewIndex: integer);
begin
  MoveDim2(DimState.DimID, NewDimGroup, NewIndex);
end;

procedure TGridInfo.MoveDim(DimGroup, NewDimGroup: TDimGroup; Index, NewIndex: integer);
begin
  MoveDim1(DimGroup, NewDimGroup, Index, NewIndex);
end;

procedure TGridInfo.MoveDim(DimID: integer; NewDimGroup: TDimGroup; NewIndex: integer);
begin
  MoveDim2(DimID, NewDimGroup, NewIndex);
end;

procedure TGridInfo.MoveDim(DimState: TDimensionState; NewDimGroup: TDimGroup; NewIndex: integer);
begin
  MoveDim3(DimState, NewDimGroup, NewIndex);
end;

procedure TGridInfo.DrillUp(Node: TLabelNode);
var
  DimIDs: TIntegerArray;
begin
  if Node = nil then EXIT;
  if Node.Expanded = False then EXIT;
  FPivotEventArgs.Clear;
  FPivotEventArgs.FAllowOperation := True;
  if assigned(FBeforePivot) then
  begin
    FPivotEventArgs.FOperation := opDrillUp;
    FPivotEventArgs.FLabelNode := Node;
    FPivotEventArgs.FMemberIndex := Node.Value;
    FPivotEventArgs.FMemberName := TDimMember(Node.DimState.FAllDimMembers[Node.Value]).FID;
    FPivotEventArgs.FDimState := Node.DimState;
    FBeforePivot({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, FPivotEventArgs);
  end;
  if FPivotEventArgs.FAllowOperation = False then EXIT;
  BeginChange;
  try
    if Node.DimGroup = dgRow then
      DimIDs := FRowDimIDs
    else
      DimIDs := FColDimIDs;
    DoCollapseLabelNode(Node, DimIDs);
    RebuildVisibleDimIDs;
  finally
    EndChange(geToggleDimValue, msgKeepTopLeftMask);
  end;
  if assigned(FOnExpandDimValue) then
    FOnExpandDimValue({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, Node.DimID, Node.Value, False);
  if assigned(FAfterPivot) then
  begin
    FPivotEventArgs.FOperation := opDrillUp;
    FPivotEventArgs.FLabelNode := Node;
    FPivotEventArgs.FMemberIndex := Node.Value;
    FPivotEventArgs.FMemberName := TDimMember(Node.DimState.FAllDimMembers[Node.Value]).FID;
    FPivotEventArgs.FDimState := Node.DimState;
    FAfterPivot({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, FPivotEventArgs);
  end;
end;

procedure TGridInfo.DrillDown(Node: TLabelNode; Hier: boolean);
var
  DimIDs: TIntegerArray;
begin
  if Node = nil then EXIT;
  if Node.Expanded then EXIT;
  FPivotEventArgs.Clear;
  FPivotEventArgs.FAllowOperation := True;
  if assigned(FBeforePivot) then
  begin
    FPivotEventArgs.FOperation := opDrillDown;
    FPivotEventArgs.FLabelNode := Node;
    FPivotEventArgs.FMemberIndex := Node.Value;
    FPivotEventArgs.FMemberName := TDimMember(Node.DimState.FAllDimMembers[Node.Value]).FID;
    FPivotEventArgs.FDimState := Node.DimState;
    FBeforePivot({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, FPivotEventArgs);
  end;
  if FPivotEventArgs.FAllowOperation = False then EXIT;
  
  BeginChange;
  try
    if Node.DimGroup = dgRow then
      DimIDs := FRowDimIDs
    else
      DimIDs := FColDimIDs;

    if Hier then
      DoExpandHierLabelNode(Node, DimIDs)
    else
      DoExpandLabelNode(Node, DimIDs);
    RebuildVisibleDimIDs;
  finally
    EndChange(geToggleDimValue, msgKeepTopLeftMask);
  end;
  
  if assigned(FOnExpandDimValue) then
    FOnExpandDimValue({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, Node.DimID, Node.Value, True);
  if assigned(FAfterPivot) then
  begin
    FPivotEventArgs.FOperation := opDrillDown;
    FPivotEventArgs.FLabelNode := Node;
    FPivotEventArgs.FMemberIndex := Node.Value;
    FPivotEventArgs.FMemberName := TDimMember(Node.DimState.FAllDimMembers[Node.Value]).FID;
    FPivotEventArgs.FDimState := Node.DimState;
    FAfterPivot({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, FPivotEventArgs);
  end;
end;


procedure TGridInfo.ExpandAllNodes(DimState: TDimensionState);
var
  DimIDs: TIntegerArray;
  LabelNodes: TLabelNodes;
begin
  if DimState = nil then EXIT;
  BeginChange;
  try
    if DimState.DimGroup = dgRow then
      begin
        DimIDs := FRowDimIDs;
        LabelNodes := FRowLabelNodes;
      end
    else
      begin
        DimIDs := FColDimIDs;
        LabelNodes := FColLabelNodes;
      end;
    DoExpandAllNodes(DimState, DimIDs, LabelNodes);
        
    RebuildVisibleDimIDs;
  finally
    EndChange(geAggregateChanged, 0);
  end;
end;

procedure TGridInfo.SortLookups;
begin
  if not Active then EXIT;
  SortVisibleDimIDs;
  if (FRowLabelNodes <> nil) and (FRowDimIDs <> nil) then
  begin
    if ValueSortData.SortType <> soNone then
      begin
        if (FVisibleRowNodes <> nil) and (FVisibleRowNodes.Count > 0) then
        begin
          RebuildVisibleNodes;
          SortLabelNodesByValue;
        end;
      end
    else
      LabelNodesRankSort(FRowLabelNodes, dgRow);
  end;

  if (FColLabelNodes <> nil) and (FColDimIDs <> nil) then
  begin
    LabelNodesRankSort(FColLabelNodes, dgCol);
  end;
  
  RebuildVisibleNodes;
end;

function TGridInfo.GetDimensionDisplayName(DimID: integer): WideString;
begin
  Result := '';
  if Active then Result := TDimensionState(FDimensionStates[DimID]).DisplayName;
end;

function TGridInfo.GetSummaryDisplayName(SumID: integer): WideString;
var
  SumInfo: TSummaryInfo;
begin
  Result := '';
  if not Active then EXIT;
  SumInfo := FSummarySettings.FindSumInfoID(SumID);
  if SumInfo <> nil then
    Result := SumInfo.fDisplayName
  else
    Result := '';
end;

function TGridInfo.SortLabelNodesByValue: boolean;
var
  SubLevelNodeCol: integer;

  procedure DoSortNodes(Nodes: TLabelNodes);
  var
    i: integer;
    TA: TTotalAppearance;
    ChildNodes: TLabelNodes;
  begin
    for i := 0 to Nodes.Count - 1 do
    begin
      ChildNodes := TLabelNode(Nodes[i]).ChildNodes;
      if (ChildNodes <> nil) and (ChildNodes.Count > 0) then DoSortNodes(ChildNodes);
    end;
    if Nodes.Count > 0 then
    begin
      TA := TLabelNode(Nodes[0]).DimState.TotalAppearance;
      QuickSortLabelNodes(Nodes, 0, Nodes.Count - 1, LabelNodesCompareValues, TA, SubLevelNodeCol);
    end;
  end;

begin
  Result := False;
  if FRowLabelNodes = nil then   EXIT;
  SubLevelNodeCol := ValueSortData.FindVisibleSubLevelNode(FVisibleColSubLevelNodes);
  if SubLevelNodeCol < 0 then EXIT;
  DoSortNodes(FRowLabelNodes); 
  Result := True;
end;


function TLabelNodes.Add(Node: TLabelNode): Integer;
begin
  Node.FLabelNodes := Self;
  Result := inherited Add(Node);
end;

function TLabelNodes.FindTreeIndex(TreeIndex: integer): TLabelNode;

  function ProcessNodes(Nodes: TLabelNodes): TLabelNode;
  var
    i: integer;
    Node: TLabelNode;
  begin
    Result := nil;
    for i := 0 to Nodes.Count - 1 do
    begin
      Node := TLabelNode(Nodes[i]);
      if Node.TreeIndex = TreeIndex then
        Result := Node
      else
        if Node.Expanded then
          if Node.ChildNodes <> nil then Result := ProcessNodes(Node.ChildNodes);
      if Result <> nil then BREAK;  
    end;
  end;
  
begin
  Result := nil;
  if Self <> nil then
  Result := ProcessNodes(Self);
end;

{$IFNDEF ASPRUNTIME}
function TLabelNodes.FindNodeXY(X, Y: integer; out GridButton: TGridButton): TLabelNode;

  function ProcessNodes(Nodes: TLabelNodes): TLabelNode;
  var
    i: integer;
    Node: TLabelNode;
    _x, _y: integer;
  begin
    Result := nil;
    for i := 0 to Nodes.Count - 1 do
    begin
      Node := TLabelNode(Nodes[i]);
      _x := X;
      _y := Y;
      {$B+}
      if ((_x >= Node.Rect.Left) and (_x <= Node.Rect.Right) and
         (_y >= Node.Rect.Top) and (_y <= Node.Rect.Bottom)) then
        begin
          Result := Node;
          GridButton := Node.MouseOverButton(_x, _y);
        end
      else
        begin
          if Node.Expanded then
            if Node.ChildNodes <> nil then Result := ProcessNodes(Node.ChildNodes);
        end;
      {$B-}
      if Result <> nil then BREAK;
    end;
  end;

begin
  Result := nil; GridButton := nil;
  if Self <> nil then
  Result := ProcessNodes(Self);
end;
{$ENDIF}

function TLabelNodes.ForEachNode(proc: TLabelNodeProcedure; Params: pointer): integer;
var
  n: integer;
  
  procedure ProcessNodes(Nodes: TLabelNodes);
  var
    i: integer;
    Node: TLabelNode;
  begin
    for i := 0 to Nodes.Count - 1 do
    begin
      Node := TlabelNode(Nodes[i]);
      proc(Node, Params); inc(n);
      if Node.ChildNodes <> nil then ProcessNodes(Node.ChildNodes);
    end;
  end;

begin
  n := 0;
  ProcessNodes(Self);
  Result := n;
end;

function TLabelNodes.RebuildVisibleNodes: TPointerArray;
var
  A: TPointerArray;
  ID, RowIndex: integer;

  procedure ProcessNodes(Nodes: TLabelNodes);
  var
    i: integer;
    Node: TLabelNode;
  begin
    for i := 0 to Nodes.Count - 1 do
    begin
      Node := TLabelNode(Nodes[i]);
      Node.FTreeIndex := ID; inc(ID);
      Node.FIndex := i; 
      {$B+}
      if Node.Expanded and (Node.ChildNodes <> nil) then
        begin
          Node.FRowIndex := -1; 
          ProcessNodes(Node.ChildNodes);
        end
      else
        begin
          Node.FRowIndex := RowIndex; inc(RowIndex);
          A.Add(Node);
        end;
      {$B-}
    end;
  end;

begin
  A := TPointerArray.Create;
  ID := 0; RowIndex := 0;
  ProcessNodes(Self);
  Self.FNodeCount := ID;
  Result := A;
end;


function TLabelNode.AddChild: TLabelNode;
begin
  Result := TLabelNode.Create(Self);
  if FChildNodes = nil then FChildNodes := TLabelNodes.Create;
  FChildNodes.Add(Result);
end;

function TLabelNode.AddSubLevelNode: TSubLevelNode;
begin
  Result := TSubLevelNode.Create(nil);
  Result.FLabelNode := Self;
  if FSubLevelNodes = nil then FSubLevelNodes := TPointerArray.Create;
  FSubLevelNodes.Add(Result);
end;

procedure TLabelNode.BuildAttributes(out Captions, Values: TWideStringArray);
var
  AttributeList: TAttributeList;
  i: integer;
  DimMember: TDimMember;
  DimIndex: integer;
  SL: TWideStringArray;
  Dim: TDimension;
begin
  Captions := nil;
  Values := nil;
  if FValue = SubTotal then EXIT;
  Dim := DimState.Dim;
  AttributeList := Dim.FAttributeList;
  if (AttributeList = nil) or (AttributeList.Count <= 1) then EXIT;
  DimMember := TDimMember(DimState.FAllDimMembers[FValue]);
  DimIndex := DimMember.FDimIndex;
  if DimIndex < 0 then EXIT;
  Captions := TWideStringArray.CreateCount(AttributeList.Count);
  Values := TWideStringArray.CreateCount(AttributeList.Count);

  for i := 0 to AttributeList.Count - 1 do
  begin
    Captions[i] := AttributeList[i];
    SL := TWideStringArray(AttributeList.Pointers[i]);
    if (SL <> nil) and (SL.Count > 0) then
      Values[i] := SL[DimIndex]
    else
      Values[i] := GetResStr('xhUndefinedAttribute', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhUndefinedAttribute);
  end;
end;

{$IFNDEF ASPRUNTIME}
function TLabelNode.ContainsXY(X, Y: integer): boolean;
begin
  Result := ((X >= Rect.Left) and (X <= Rect.Right) and (Y >= Rect.Top) and (Y <= Rect.Bottom));
end;
{$ENDIF}

constructor TLabelNode.Create(AParent: TLabelNode);
begin
{$IFDEF ASPRUNTIME}
  inherited Create;
{$ENDIF}
  FParent := AParent;
  FDimLevel := 1;
end;

{$IFNDEF ASPRUNTIME}
destructor TLabelNode.Destroy;
begin
  FreeAndNil(FChildNodes);
  FreeAndNil(FValueButton);
  FreeAndNil(FHierButton);
  FreeAndNil(FSubLevelNodes);
  inherited;
end;
{$ENDIF}

function TLabelNode.GetBelongsToGroup: boolean;
var
  Node: TLabelNode;
begin
  Node := Self;
  repeat
    Result := Node.IsGroup;
    Node := Node.Parent;
  until (Node = nil) or (Result = True);
end;

function TLabelNode.GetDatabaseRank: integer;
begin
  if Value = SubTotal then
    Result := -1
  else
    Result := TDimMember(DimState.FAllDimMembers[Value]).DatabaseRank;
end;

function TLabelNode.GetDimGroup: TDimGroup;
begin
  Result := FDimState.DimGroup;
end;

function TLabelNode.GetDimValue: integer; register;
asm
        mov     edx, [eax + TLabelNode.FDimState]
        mov     eax, [eax + TLabelNode.FValue]
        cmp     eax, SubTotal
        jne     @@1
        ret
@@1:
        mov     edx, [edx + TDimensionState.FItems]
        mov     edx, [edx + TBaseArray.FArrayPointer]
        mov     eax, [edx + eax * TYPE Integer]
end;

function TLabelNode.GetExpandable: boolean; register;
asm
        mov     edx, [eax + TLabelNode.FValueButton]
        or      edx, [eax + TLabelNode.FHierButton]
        setnz   al
end;

function TLabelNode.GetExpanded: boolean; register;
asm
        mov     dl, [eax + TLabelNode.FValueExpanded]
        or      dl, [eax + TLabelNode.FHierExpanded]
        mov     al, dl
end;

function TLabelNode.GetGrandParent: TLabelNode;
begin
  Result := nil;
  if FParent <> nil then Result := FParent.FParent;
end;

function TLabelNode.GetIsGroup: boolean; register;
asm
        mov     edx, [eax + TLabelNode.FValue]
        cmp     edx, SubTotal
        jne     @@1
        mov     al, False
        ret
@@1:
        mov     eax, [eax + TLabelNode.FDimState]
        mov     eax, [eax + TDimensionState.FAllDimMembers]
        mov     eax, [eax + TBaseArray.FArrayPointer]
        mov     eax, [eax + edx * TYPE pointer]
        mov     al, [eax + TDimMember.FIsGroup]
end;

function TLabelNode.GetIsSubTotal: boolean; register;
asm
    cmp   dword ptr [EAX + TLabelNode.FValue], SubTotal
    sete  AL
end;

function TLabelNode.GetLabelText: WideString;
begin
  if Value = SubTotal then
    Result := GetResStr('xhTotalCaption', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhTotalCaption)
  else
    Result := DimState.Caption[Value];
end;

function TLabelNode.GetQualifiedName: WideString;
begin
  if Value = SubTotal then
    if FParent <> nil then
      Result := FParent.GetQualifiedName
    else
      Result := ''
  else
    Result := TDimMember(DimState.FAllDimMembers[Value]).FID;
end;

function TLabelNode.GetSortRank: integer;
begin
  if Value = SubTotal then
    Result := -1
  else
    Result := TDimMember(DimState.FAllDimMembers[Value]).Rank;
end;

{$IFNDEF ASPRUNTIME}
function TLabelNode.MouseOverButton(X, Y: integer): TGridButton;
begin
  Result := nil;
  {$B+}
  if FValueButton <> nil then
  begin
    if ((X >= FValueButton.Rect.Left) and (X <= FValueButton.Rect.Right) and
       (Y >= FValueButton.Rect.Top) and (Y <= FValueButton.Rect.Bottom)) then Result := FValueButton;
  end;
  if (Result = nil) and (FHierButton <> nil) then
  begin
    if ((X >= FHierButton.Rect.Left) and (X <= FHierButton.Rect.Right) and
       (Y >= FHierButton.Rect.Top) and (Y <= FHierButton.Rect.Bottom)) then Result := FHierButton;
  end;
  {$B-}
end;
{$ENDIF}


procedure TGridInfo.RebuildCaptionNodes;

  procedure DoBuildCaptionNodes(DimIDs: TIntegerArray; CaptionNodes: TCaptionNodes);
  var
    i, DimID, DimOffset: integer;
    DimState: TDimensionState;
    CaptionNode: TCaptionNode;
  begin
    DimOffset := 0;
    for i := 0 to DimIDs.Count - 1 do
    begin
      DimID := DimIDs[i];
      DimState := TDimensionState(FDimensionStates[DimID]);
      CaptionNode := TCaptionNode.Create;
      CaptionNode.FDimID := DimID;
      CaptionNode.FDimState := DimState;
      CaptionNode.FLevelsCount := DimState.FOpenLevels;
      Captionnode.FDimOffset := DimOffset;
      inc(DimOffset, DimState.FOpenLevels);
      CaptionNodes.Add(CaptionNode);
    end;
  end;

begin
  FreeAndNil(FRowCaptionNodes);
  FreeAndNil(FColCaptionNodes);
  if not Active then EXIT;
  if FVisibleRowDimIDs <> nil then
  begin
    FRowCaptionNodes := TCaptionNodes.Create;
    UpdateOpenLevels(FRowLabelNodes, FVisibleRowDimIDs);
    DoBuildCaptionNodes(FVisibleRowDimIDs, FRowCaptionNodes);
    RecalcNodeOffsets(FVisibleRowDimIDs, FRowLabelNodes);
  end;
  if FVisibleColDimIDs <> nil then
  begin
    FColCaptionNodes := TCaptionNodes.Create;
    UpdateOpenLevels(FColLabelNodes, FVisibleColDimIDs);
    DoBuildCaptionNodes(FVisibleColDimIDs, FColCaptionNodes);
    RecalcNodeOffsets(FVisibleColDimIDs, FColLabelNodes);
  end;
end;

{$IFNDEF ASPRUNTIME}
function TCaptionNodes.FindNodeXY(X, Y: integer; out GridButton: TGridButton): TCaptionNode;
var
  i: integer;
  R: TRect;
  Node: TCaptionNode;
begin
  Result := nil; GridButton := nil;
  if Self <> nil then
  for i := 0 to Count - 1 do
  begin
    Node := Items[i];
    R := Node.Rect;
    if ((X >= R.Left) and (X <= R.Right) and (Y >= R.Top) and (Y <= R.Bottom)) then
    begin
      Result := Node;
      EXIT;
    end;
  end;
end;
{$ENDIF}


constructor TGridButton.Create(AnOwner: TObject);
begin
  inherited Create;
  FOwnerObject := AnOwner;
end;

class function TCustomHierCube.GetVersion: WideString;
begin
  Result := xhIntToWideStr(FVersionNumber);
  insert('.', Result, Length(Result) - 1);
end;

procedure TCustomHierCube.SeDataSet(ADataSet: TDataSet);
begin
  if (FDataSet <> ADataSet) then
  begin
    if ADataSet <> nil then ADataSet.FreeNotification(Self);
    FDataSet := ADataSet;
    Active := False;
  end;
end;

function TGridInfo.BuildRootLabelNodes(DimIDs: TIntegerArray; var LabelNodes: TLabelNodes): integer;
var
  DimID: integer;
  DimState: TDimensionState;
  SumIndex: TIntegerArray;
  i, V: integer;
  Node: TLabelNode;
  HighParents: TIntegerArray;
  b: boolean;
begin
  LabelNodes := TLabelNodes.Create;
  DimID := DimIDs[0];
  DimState := TDimensionState(FDimensionStates[DimID]);
  SumIndex := CreateSumIndex;
  try
    SumIndex.FillWith(SubTotal);

    if DimState.TotalAppearance = taFirst then
    begin
      if ShowAbsentTuples then
        b := NotEmptyGroupAndVisible(SumIndex)
      else
        b := not IsIndexSparse(SumIndex);

      if b then
      begin
        Node := TLabelNode.Create(nil);
        Node.FValue := SubTotal;
        Node.FDimLevel := 1;
        Node.FDimID := DimID;
        Node.FDimState := DimState;
        LabelNodes.Add(Node);
      end;
    end;

    HighParents := DimState.FHighParents;

    for i := 0 to HighParents.Count - 1 do
    begin
      V := HighParents[i];
      SumIndex[FActiveDimIndexes[DimID]] := V;
      if ShowAbsentTuples then
        b := NotEmptyGroupAndVisible(SumIndex)
      else
        b := not IsIndexSparse(SumIndex);

      if b then
      begin
        Node := TLabelNode.Create(nil);
        Node.FValue := V;
        Node.FQualifiedNameHashCode := TDimMember(DimState.FAllDimMembers[V]).QualifiedNameHash;
        Node.FDimLevel := 1;
        Node.FDimID := DimID;
        Node.FDimState := DimState;
        LabelNodes.Add(Node);
      end;
    end;
    SumIndex[FActiveDimIndexes[DimID]] := SubTotal;

    if DimState.TotalAppearance = taLast then
    begin
      if ShowAbsentTuples then
        b := NotEmptyGroupAndVisible(SumIndex)
      else
        b := not IsIndexSparse(SumIndex);

      if b then
      begin
        Node := TLabelNode.Create(nil);
        Node.FValue := SubTotal;
        Node.FDimLevel := 1;
        Node.FDimID := DimID;
        Node.FDimState := DimState;
        LabelNodes.Add(Node);
      end;
    end;
  finally
    SumIndex.Free;
  end;
  Result := LabelNodes.Count;
  if (DimIDs.Count > 1) or (TDimensionState(FDimensionStates[DimID]).LevelsCount > 1) then
  for i := 0 to LabelNodes.Count - 1 do
    CalcExpandable(TLabelNode(LabelNodes[i]), DimIDs);
end;

procedure TGridInfo.DoExpandLabelNode(Node: TLabelNode; DimIDs: TIntegerArray);
var
  SumIndex: TIntegerArray;
  V, k, i, DimID, NextDimID: integer;
  N: TLabelNode;
  LabelNodes: TLabelNodes;
  NextDimState: TDimensionState;
  HighParents: TIntegerArray;
  b: boolean;
begin
  if Node = nil then EXIT;
  if Node.ValueButton = nil then EXIT;
  if Node.Expanded then EXIT;

  SumIndex := CreateSumIndex;
  try
    SumIndex.FillWith(SubTotal);
    DimID := WrongIndex;
    N := Node;
    while N <> nil do
    begin
      if N.DimID <> DimID then
      begin
        DimID := N.DimID;
        SumIndex[FActiveDimIndexes[DimID]] := N.Value;
      end;
      N := N.Parent;
    end;

    DimID := Node.DimID;
    NextDimID := DimIDs[DimIDs.IndexOf(DimID) + 1];
    NextDimState := TDimensionState(FDimensionStates[NextDimID]);

    HighParents := NextDimState.FHighParents;
    k := HighParents.Count;

    if k > 0 then
    begin
      PrecalcOnExpand(Node, NextDimID);

      // OIL // if NextDimState.TotalAppearance = taFirst then
      if (NextDimState.TotalAppearance = taFirst) and (Node.FChildNodes.Count > 1) then
      begin
        if ShowAbsentTuples then
          b := NotEmptyGroupAndVisible(SumIndex)
        else
          b := not IsIndexSparse(SumIndex);

        if b then
        begin
          N := Node.AddChild;
          N.FValue := SubTotal;
          N.FDimLevel := 1;
          N.FDimID := NextDimID;
          N.FDimState := NextDimState;
        end;
      end;

      for i := 0 to k-1 do
      begin
        V := HighParents[i];
        SumIndex[FActiveDimIndexes[NextDimID]] := V;
        if ShowAbsentTuples then
          b := NotEmptyGroupAndVisible(SumIndex)
        else
          b := not IsIndexSparse(SumIndex);

        if b then
        begin
          N := Node.AddChild;
          N.FValue := V;
          N.FQualifiedNameHashCode := TDimMember(NextDimState.FAllDimMembers[V]).QualifiedNameHash; 
          N.FDimLevel := 1;
          N.FDimID := NextDimID;
          N.FDimState := NextDimState;
        end;
      end; 
      SumIndex[FActiveDimIndexes[NextDimID]] := SubTotal;

      // OIL // if NextDimState.TotalAppearance = taLast then
      if (NextDimState.TotalAppearance = taLast) and (Node.FChildNodes.Count > 1) then
      begin
        if ShowAbsentTuples then
          b := NotEmptyGroupAndVisible(SumIndex)
        else
          b := not IsIndexSparse(SumIndex);

        if b then
        begin
          N := Node.AddChild;
          N.FValue := SubTotal;
          N.FDimLevel := 1;
          N.FDimID := NextDimID;
          N.FDimState := NextDimState;
        end;
      end;
    end;
  finally
    SumIndex.Free;
  end;
  LabelNodes := Node.ChildNodes;
  if LabelNodes <> nil then
  for i := 0 to LabelNodes.Count - 1 do
  begin
    CalcExpandable(TLabelNode(LabelNodes[i]), DimIDs);
  end;

  FreeAndNil(Node.FHierButton);
  Node.FValueExpanded := True;
end;

procedure TGridInfo.CalcExpandable2(Node: TLabelNode; DimIDs: TIntegerArray);
begin
end;

procedure TGridInfo.DoExpandHierLabelNode(Node: TLabelNode; DimIDs: TIntegerArray);
var
  SumIndex: TIntegerArray;
  V, k, i, DimID, DimLevel, NextDimLevel: integer;
  N: TLabelNode;
  Childs: TIntegerArray;
  Found: boolean;
  LabelNodes: TLabelNodes;
  DimState: TDimensionState;
  b: boolean;
begin
  if Node = nil then EXIT;
  if Node.HierButton = nil then EXIT;
  if Node.Expanded then EXIT;

  SumIndex := CreateSumIndex;
  try
    SumIndex.FillWith(SubTotal);
    DimID := WrongIndex;
    N := Node;
    while N <> nil do
    begin
      if N.DimID <> DimID then
      begin
        DimID := N.DimID;
        SumIndex[FActiveDimIndexes[DimID]] := N.Value;
      end;
      N := N.Parent;
    end;

    DimID := Node.DimID;
    DimLevel := Node.DimLevel;
    DimState := Node.DimState;

    Found := False;
    while not Found and (DimLevel < DimState.LevelsCount) do
    begin
      NextDimLevel := DimLevel + 1;

      Childs := nil;
      k := 0;
      if Node.Value <> SubTotal then
      begin
        Childs := TIntegerArray(DimState.FChildrenList[Node.Value]);
        if Childs <> nil then k := Childs.Count;
      end;
      
      // OIL //
      if Childs.Count = 1 then
      begin
        DoExpandLabelNode(Node, DimIDs);
        FreeAndNil(Node.FHierButton);
        exit;
      end;

      if k > 0 then
      begin
        // OIL // if DimState.TotalAppearance = taFirst then
        if (DimState.TotalAppearance = taFirst) and (Node.FChildNodes.Count > 1) then
        begin

          if ShowAbsentTuples then
            b := NotEmptyGroupAndVisible(SumIndex)
          else
            b := not IsIndexSparse(SumIndex);
          
          if b then
          begin
            Found := True;
            N := Node.AddChild;
            N.FValue := SubTotal;
            N.FDimLevel := NextDimLevel;
            N.FDimID := DimID;
            N.FDimState := DimState;
          end;
        end;

        for i := 0 to k-1 do
        begin
          V := Childs[i];
          SumIndex[FActiveDimIndexes[DimID]] := V;
          if ShowAbsentTuples then
            b := NotEmptyGroupAndVisible(SumIndex)
          else
            b := not IsIndexSparse(SumIndex);

          if b then
          begin
            Found := True;
            N := Node.AddChild;
            N.FValue := V;
            N.FQualifiedNameHashCode := TDimMember(DimState.FAllDimMembers[V]).QualifiedNameHash;
            N.FDimLevel := NextDimLevel;
            N.FDimID := DimID;
            N.FDimState := DimState;
          end;
        end; 
        SumIndex[FActiveDimIndexes[DimID]] := SubTotal;

        // OIL // if DimState.TotalAppearance = taLast then
        if (DimState.TotalAppearance = taLast) and (Node.FChildNodes.Count > 1) then
        begin
          if ShowAbsentTuples then
            b := NotEmptyGroupAndVisible(SumIndex)
          else
            b := not IsIndexSparse(SumIndex);

          if b then
          begin
            Found := True;
            N := Node.AddChild;
            N.FValue := SubTotal;
            N.FDimLevel := NextDimLevel;
            N.FDimID := DimID;
            N.FDimState := DimState;
          end;
        end;
      end;
      DimLevel := NextDimLevel;
    end;
  finally
    SumIndex.Free;
  end;

  LabelNodes := Node.ChildNodes;
  if LabelNodes <> nil then
  for i := 0 to LabelNodes.Count - 1 do
  begin
    CalcExpandable(TLabelNode(LabelNodes[i]), DimIDs);
  end;

  FreeAndNil(Node.FValueButton); 
  Node.FHierExpanded := True;
end;

procedure TGridInfo.CalcExpandable(Node: TLabelNode; DimIDs: TIntegerArray);
var
  DimID, LastDimID: integer;
  DimLevel: integer;
  DimState, NextDimState: TDimensionState;
begin
  DimID := Node.DimID;
  LastDimID := DimIDs[DimIDs.Count - 1];
  DimLevel := Node.DimLevel;
  DimState := Node.DimState;
  if (Node.Value = SubTotal) or ((DimID = LastDimID) and (DimLevel = DimState.LevelsCount)) then EXIT;
  if DimID <> LastDimID then
  begin
    NextDimState := TDimensionState(FDimensionStates[DimIDs[DimIDs.IndexOf(DimID) + 1]]);
    if (NextDimState.FHighParents.Count > 0) then
    begin
      FreeAndNil(Node.FValueButton);
      Node.FValueButton := TGridButton.Create(Node);
    end;
  end;
  if (DimState.GetChildrenCount(Node.Value) > 0) then
  begin
    FreeAndNil(Node.FHierButton);
    Node.FHierButton := TGridButton.Create(Node);
  end;
end;

procedure TGridInfo.DoCollapseLabelNode(Node: TLabelNode; DimIDs: TIntegerArray);
begin
  if Node = nil then EXIT;
  if not Node.Expandable then EXIT;
  if not Node.Expanded then EXIT;
  FreeAndNil(Node.FChildNodes);
  Node.FValueExpanded := False; Node.FHierExpanded := False;
  CalcExpandable(Node, DimIDs);
end;


function TDimensionStates.BuildStreamedDimStates(MembersSaveMode: TMembersSaveMode): TStreamedDimStates;
var
  i: integer;
begin
  Result := TStreamedDimStates.CreateCount(Count);
  for i := 0 to Count - 1 do Result[i] := TDimensionState(Items[i]).BuildStreamedDimState(MembersSaveMode);
end;

procedure TDimensionStates.CalcAllFiltered;
var
  i: integer;
begin
  for i := 0 to Count - 1 do TDimensionState(Items[i]).CalcFiltered;
end;

constructor TDimensionStates.Create(AGridInfo: TGridInfo);
begin
  inherited Create;
  fGridInfo := AGridInfo;
  FChangedDimensions := TPointerArray.Create;
  FChangeTypes := TIntegerArray.Create;
end;

function TDimensionStates.FindDimID(DimID: integer): TDimensionState;
begin
  if (DimID >= 0) and (DimID < Count) then
    Result := TDimensionState(Self[DimID])
  else
    Result := nil;  
end;

function TDimensionStates.FindDisplayName(const DisplayName: WideString): TDimensionState;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
{$IFDEF ASPRUNTIME}
  if WideCompareText(DisplayName, TDimensionState(Self[i]).DisplayName) = 0 then
  begin
    Result := TDimensionState(Self[i]);
    BREAK;
  end;
{$ELSE}
  if WideCompareText(DisplayName, TDimensionState(PPntrArray(FArrayPointer)^[i]).DisplayName) = 0 then
  begin
    Result := PPntrArray(FArrayPointer)^[i];
    BREAK;
  end;
{$ENDIF}
end;

function TDimensionStates.FindFieldName(const FieldName: WideString): TDimensionState;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
{$IFDEF ASPRUNTIME}
  if WideCompareText(FieldName, TDimensionState(Self[i]).FieldName) = 0 then
  begin
    Result := TDimensionState(Self[i]);
    BREAK;
  end;
{$ELSE}
  if WideCompareText(FieldName, TDimensionState(PPntrArray(FArrayPointer)^[i]).FieldName) = 0 then
  begin
    Result := PPntrArray(FArrayPointer)^[i];
    BREAK;
  end;
{$ENDIF}
end;

{$IFNDEF ASPRUNTIME}
destructor TDimensionStates.Destroy;
begin
  FreeAndNil(FChangeTypes);
  FreeAndNil(FChangedDimensions);
  inherited;
end;
{$ENDIF}

procedure TDimensionStates.DoChange;
var
  i: integer;
  DimState: TDimensionState;
  ResChange: integer;
  ColsSort, RowsSort: boolean;
begin
  FUpdateCounter := 0;
  try
    if FGridInfo = nil then EXIT;
    if FChangedDimensions.Count = 0 then EXIT;
    ResChange := 0;
    ColsSort := False; RowsSort := False;
    for i := 0 to FChangedDimensions.Count - 1 do
    begin
      DimState := TDimensionState(FChangedDimensions[i]);
      DimState.CalcFiltered;
      ResChange := ResChange or FChangeTypes[i];
      if (FChangeTypes[i] and dctSort) <> 0 then
      begin
        if DimState.DimGroup = dgCol then ColsSort := True
        else if DimState.DimGroup = dgRow then RowsSort := True;
      end;  
    end;
  finally
    FChangedDimensions.Clear;
    FChangeTypes.Clear;
  end;
  if ResChange = 0 then EXIT;
  if ResChange < (dctAttribute shl 1) then
    begin
      FGridInfo.BeginChange;
      FGridInfo.EndChange(geNewGridLayout, msgKeepTopLeftMask or msgKeepCurrentMask);
    end
  else if ResChange < (dctTotalAppearance shl 1) then
    begin
      FGridInfo.BeginChange;
      FGridInfo.EndChange(geTotalAppearanceChanged, 0);
    end
  else if ResChange < (dctSort shl 1) then
    begin
      if ColsSort and RowsSort then
        begin
          FGridInfo.BeginChange;
          FGridInfo.EndChange(geAggregateChanged, 0);
        end
      else if ColsSort then
        begin
          FGridInfo.BeginChange;
          FGridInfo.EndChange(geColsSort, 0);
        end
      else if RowsSort then
        begin
          FGridInfo.BeginChange;
          FGridInfo.EndChange(geRowsSort, 0);
        end
    end
  else
    fGridInfo.ChangeDimensionStates;
end;


function TDimensionState.BuildSaveMembers(MembersSaveMode: TMembersSaveMode): TSaveMembers;
var
  StrID: boolean;
  GroupID: integer;
  KeyType: TMemberKeyType;

  procedure SaveGroups;
  var
    i: integer;
    SaveMember: TSaveMember;
  begin
    for i := 0 to FGroups.Count - 1 do
    begin
      SaveMember := TSaveMember.Create;
      SaveMember.FIsGroup := True;         
      SaveMember.FGroupCaption := TDimMember(FGroups[i]).Caption; 
      SaveMember.FGroupID := i;            
      SaveMember.FHidden := not TDimMember(FGroups[i]).Visible;            
      Result.Add(SaveMember);
    end;
  end;

  procedure ProcessGroups(Members: TDimMembers);
  var
    i: integer;
    DimMember: TDimMember;
    SaveMember: TSaveMember;
  begin
    for i := 0 to Members.Count - 1 do
    begin
      DimMember := TDimMember(Members[i]);
      if DimMember.IsGroup then inc(GroupID);   

      if DimMember.ChildMembers = nil then
        begin
          if not DimMember.IsGroup then
          begin
            SaveMember := TSaveMember.Create;
            SaveMember.FGrouped := True;      
            SaveMember.FGroupID := GroupID;
            SaveMember.FHidden := not DimMember.Visible;  
            if KeyType = ktStringKey then
              SaveMember.FStringID := Dim.FStringKeys[DimMember.DimIndex]
            else if KeyType = ktIntegerKey then
              SaveMember.FIntegerID := Dim.FItems[DimMember.DimIndex]
            else if KeyType = ktQualifiedNameHash then
              SaveMember.FQualifiedNameHash := DimMember.FIDHash
            else
              SaveMember.FIntegerID := Dim.FItems[DimMember.DimIndex];
            Result.Add(SaveMember);
          end;
        end
      else
        ProcessGroups(DimMember.ChildMembers);
    end;
  end;

  procedure ProcessMembers(Members: TDimMembers);
  var
    i: integer;
    DimMember: TDimMember;
    SaveMember: TSaveMember;
  begin
    for i := 0 to Members.Count - 1 do
    begin
      DimMember := TDimMember(Members[i]);
      if DimMember.IsGroup then Continue; 
      if DimMember.ChildMembers = nil then
        begin
          if (MembersSaveMode = smSaveAll) or
             ((MembersSaveMode = smSaveHiddenOnly) and not DimMember.Visible) or
             ((MembersSaveMode = smSaveVisibleOnly) and DimMember.Visible)
             then
          begin
            SaveMember := TSaveMember.Create;
            SaveMember.FHidden := not DimMember.Visible;  
            if KeyType = ktStringKey then
              SaveMember.FStringID := Dim.FStringKeys[DimMember.DimIndex]
            else if KeyType = ktIntegerKey then
              SaveMember.FIntegerID := Dim.FItems[DimMember.DimIndex]
            else if KeyType = ktQualifiedNameHash then
              SaveMember.FQualifiedNameHash := DimMember.FIDHash
            else
              SaveMember.FIntegerID := Dim.FItems[DimMember.DimIndex];
            Result.Add(SaveMember);
          end;
        end
      else
        ProcessMembers(DimMember.ChildMembers);
    end;    
  end;

begin
  Result := TSaveMembers.Create;
  StrID := Dim.StrID and (Dim.FStringKeys <> nil) and (Dim.FStringKeys.Count > 0);
  Result.FStrID := StrID;
  if HasLookupTable then
    begin
      if Dim.StrID then
        KeyType := ktStringKey
      else
        KeyType := ktIntegerKey;
    end
  else
    begin
      if Dim.StrID then
        KeyType := ktQualifiedNameHash
      else
        KeyType := ktUnknown;
    end;
  Result.FKeyType := KeyType;
  SaveGroups;
  GroupID := -1;
  ProcessGroups(FGroups);
  ProcessMembers(FMembers);
end;

function TDimensionState.BuildStreamedDimState(MembersSaveMode: TMembersSaveMode): TStreamedDimState;
begin
  Result := TStreamedDimState.Create;
  Result.FRange := FRange;
  Result.FAttribute := FAttribute;
  Result.FFieldName := FieldName;
  Result.FDisplayName := FDisplayName;
  Result.FDimGroup := FDimGroup;
  Result.FSortType := FSortType;
  Result.FTotalAppearance := FTotalAppearance;
  Result.FSaveMembers := BuildSaveMembers(MembersSaveMode);
  Result.FCaseSensitive := FCaseSensitive;
end;

procedure TDimensionState.CalcFiltered; register;
asm
        push    edi
        mov     [eax + FFiltered], False
        mov     ecx, [eax + FMemberCount]
        jecxz   @@exit
        mov     [eax + FFiltered], True
        mov     edi, [eax + FAllDimMembers]
        mov     edi, [edi + TBaseArray.FArrayPointer]
@@loop:
        mov     edx, [edi]
        add     edi, 4
        cmp     [edx + TDimMember.FVisible], False
        je      @@exit
        dec     ecx
        jnz     @@loop
        mov     [eax + FFiltered], False
@@exit:
        pop     edi
end;

procedure TDimensionState.ChangeAttribute(const Attr: WideString; UpdateCaptions: boolean);
var
  UseNames: boolean;
  DimNames: TWideStringArray;
  Index: integer;

  procedure ProcessMembers(Members: TDimMembers);
  var
    i: integer;
    Member: TDimMember;
  begin
    for i := 0 to Members.Count - 1 do
    begin
      Member := TDimMember(Members[i]);
      if Member.ChildMembers <> nil then ProcessMembers(Member.ChildMembers);
      if Member.DimIndex >= 0 then
      begin
        if UseNames then
          Member.FCaption := DimNames[Member.DimIndex]
        else
          Member.FCaption := xhIntToWideStr(Dim.Items[Member.DimIndex]);
      end;
    end;
  end;

begin
  FAttribute := Attr;

  if UpdateCaptions then
  begin
    UseNames := False;
    if Dim.FAttributeList <> nil then
    begin
      Index := Dim.FAttributeList.IndexOf(Attr);
      if Index >= 0 then
      begin
        DimNames := TWideStringArray(Dim.FAttributeList.Pointers[Index]);
        UseNames := ((DimNames <> nil) and (DimNames.Count > 0));
      end;
    end;
    if UseNames = False then
    if Dim.StrID then
    begin
      DimNames := Dim.FStringKeys;
      UseNames := (DimNames <> nil) and (DimNames.Count > 0);
    end;
    ProcessMembers(DimMembers);
    ProcessMembers(FGroups);
  end;
end;

function TDimensionState.SameName(const DimensionName: WideString): boolean;
begin
  Result := WideCompareText(DimensionName, Self.DisplayName) = 0;
  if not Result then Result := WideCompareText(DimensionName, Self.FieldName) = 0;
end;

function TDimensionState.CompareCaptions(Index1, Index2: integer): integer;
begin
  Result := WideCompareStr(TDimMember(FAllDimMembers[Index1]).Caption,
                           TDimMember(FAllDimMembers[Index2]).Caption);
end;

function TDimensionState.CompareDatabaseRanks(Index1, Index2: integer): integer;
var
  Rank1, Rank2: integer;
begin
  Rank1 := TDimMember(FAllDimMembers[Index1]).DatabaseRank;
  Rank2 := TDimMember(FAllDimMembers[Index2]).DatabaseRank;
  if Rank1 > Rank2 then
   Result := 1
  else if Rank1 < Rank2 then
   Result := -1
 else
   Result := 0
end;

function TDimensionState.CompareLongDayNames(Index1, Index2: integer): integer; register;
asm
        mov     eax, [eax + TDimensionState.FAllDimMembers]
        mov     eax, [eax + TBaseArray.FArrayPointer]

        mov     edx, [eax + edx * TYPE pointer]
        mov     ecx, [eax + ecx * TYPE pointer]

        push    dword ptr [edx + TDimMember.FCaption]
        mov     eax, [ecx + TDimMember.FCaption]
        call    LongDayIndex
        push    eax
        mov     eax, [esp + 4]
        call    LongDayIndex
        mov     edx, eax
        pop     ecx
        pop     eax     

        xor     eax, eax
        cmp     edx, ecx
        jne     @@1
        ret
@@1:
        mov     eax, 1
        jl      @@2
        ret
@@2:
        mov     eax, -1
end;

function TDimensionState.CompareLongMonthNames(Index1, Index2: integer): integer; register;
asm
        mov     eax, [eax + TDimensionState.FAllDimMembers]
        mov     eax, [eax + TBaseArray.FArrayPointer]

        mov     edx, [eax + edx * TYPE pointer]
        mov     ecx, [eax + ecx * TYPE pointer]

        push    dword ptr [edx + TDimMember.FCaption]
        mov     eax, [ecx + TDimMember.FCaption]
        call    LongMonthIndex
        push    eax
        mov     eax, [esp + 4]
        call    LongMonthIndex
        mov     edx, eax
        pop     ecx
        pop     eax     

        xor     eax, eax
        cmp     edx, ecx
        jne     @@1
        ret
@@1:
        mov     eax, 1
        jl      @@2
        ret
@@2:
        mov     eax, -1
end;        

function TDimensionState.CompareShortDayNames(Index1, Index2: integer): integer; register;
asm
        mov     eax, [eax + TDimensionState.FAllDimMembers]
        mov     eax, [eax + TBaseArray.FArrayPointer]

        mov     edx, [eax + edx * TYPE pointer]
        mov     ecx, [eax + ecx * TYPE pointer]

        push    dword ptr [edx + TDimMember.FCaption]
        mov     eax, [ecx + TDimMember.FCaption]
        call    ShortDayIndex
        push    eax
        mov     eax, [esp + 4]
        call    ShortDayIndex
        mov     edx, eax
        pop     ecx
        pop     eax     

        xor     eax, eax
        cmp     edx, ecx
        jne     @@1
        ret
@@1:
        mov     eax, 1
        jl      @@2
        ret
@@2:
        mov     eax, -1
end;        

function TDimensionState.CompareShortMonthNames(Index1, Index2: integer): integer; register;
asm
        mov     eax, [eax + TDimensionState.FAllDimMembers]
        mov     eax, [eax + TBaseArray.FArrayPointer]

        mov     edx, [eax + edx * TYPE pointer]
        mov     ecx, [eax + ecx * TYPE pointer]

        push    dword ptr [edx + TDimMember.FCaption]
        mov     eax, [ecx + TDimMember.FCaption]
        call    ShortMonthIndex
        push    eax
        mov     eax, [esp + 4]
        call    ShortMonthIndex
        mov     edx, eax
        pop     ecx
        pop     eax     

        xor     eax, eax
        cmp     edx, ecx
        jne     @@1
        ret
@@1:
        mov     eax, 1
        jl      @@2
        ret
@@2:
        mov     eax, -1
end;        

constructor TDimensionState.Create(AGridInfo: TGridInfo);
begin
{$IFDEF ASPRUNTIME}
  inherited Create;
{$ENDIF}
  FGridInfo := AGridInfo;
  FOpenLevels := 1;
  FFiltered := False;
  FMembers := TDimMembers.Create;
  if AGridInfo <> nil then FDimensionStates := AGridInfo.FDimensionStates; 
end;

function TDimensionState.AddGroup(const GroupCaption: WideString): integer;
var
  G: TDimMember;
  FPivotEventArgs: TPivotEventArgs;
begin
  Result := FGroups.FindGroupCaption(GroupCaption);
  if Result < 0 then
  begin
    G := TDimMember.CreateGroup(GroupCaption);
    FMembers.Add(G);
    Result := FGroups.Add(G);

    FPivotEventArgs := FGridInfo.FPivotEventArgs;
    FPivotEventArgs.Clear;
    if assigned(FGridInfo.FAfterPivot) then
    begin
      FPivotEventArgs.FOperation := opNewGroup;
      FPivotEventArgs.FDimState := Self;
      FPivotEventArgs.FGroupIndex := Result;
      FGridInfo.FAfterPivot({$IFDEF ASPRUNTIME}FGridInfo.FCube{$ELSE}FGridInfo.FGrid{$ENDIF}, FPivotEventArgs);
    end;
  end;
end;

{$IFNDEF ASPRUNTIME}
destructor TDimensionState.Destroy;
begin
  FAllDimMembers.Free;
  FMembers.Free;
  FGroups.FillWith(nil); FGroups.Free;
  FHighParents.Free;
  FChildrenList.Free;
  FParents.Free;
  FLevels.Free;
  FLeafCounts.Free;
  FIndexConversion.Free;
  FItems.Free;

  FSortedOriginalIDs.Free;
  FSortedIDs.Free;

  fSortRank.Free;
  fIndexSortRank.Free;
  inherited;
end;
{$ENDIF}

function TDimensionState.FindIndexByID(MemberID: variant): integer;
begin
  Result := FIndexConversion[FDim.FindIndexByID(MemberID)];
end;

function TDimensionState.GetChildrenCount(Index: integer): integer; register;
asm
        mov     eax, [eax + TDimensionState.FChildrenList]
        mov     eax, [eax + TBaseArray.FArrayPointer]
        mov     eax, [eax + edx * TYPE pointer]
        or      eax, eax
        jz      @@1
        mov     eax, [eax + TBaseArray.FCount]
@@1:
end;

function TDimensionState.DoGetDatabaseRank(Index: integer): integer;
begin
  Result := TDimMember(FAllDimMembers[Index]).DatabaseRank;
end;

function TDimensionState.GetFieldName: WideString;
begin
  Result := Dim.FieldName;
end;

function TDimensionState.GetFirstChildrenIndex(Index: integer): integer;
begin
  Result := -1;
  if not (LevelsCount > 1) then EXIT;
  if Index >= 0 then
    begin
      if not HasChildren(Index) then EXIT;
      Result := TIntegerArray(FChildrenList[Index])[0];
    end
  else
    Result := FHighParents[0];
end;

procedure TDimensionState.GetIndexSortRank;
var
  i: integer;
begin
  fIndexSortRank.Free;
  fIndexSortRank := TIntegerArray.CreateCount(SortRank.Count);
  for i := 0 to SortRank.Count - 1 do fIndexSortRank[SortRank[i]] := i;
end;

function TDimensionState.DoGetIsGroup(Index: integer): boolean;
begin
  Result := TDimMember(FAllDimMembers[Index]).IsGroup;
end;

function TDimensionState.GetLeafCount(Index: integer): integer;
begin
  Result := FLeafCounts[Index];
end;

function TDimensionState.GetLevel(Index: integer): integer;
begin
  Result := FLevels[Index];
end;

function TDimensionState.GetMemberAsString(Index: integer): WideString;
begin
  Result := DoGetCaption(Index);
end;

function TDimensionState.DoGetCaption(Index: integer): WideString;
begin
  Result := TDimMember(FAllDimMembers[Index]).Caption;
end;

function TDimensionState.GetMemberID(Index: integer): variant;
begin
  Result := FDim.GetMemberID(TDimMember(FAllDimMembers[Index]).FDimIndex);
end;

function TDimensionState.GetNextChildrenIndex(Index, ChildIndex: integer): integer;
var
  i: integer;
  A: TIntegerArray;
begin
  Result := -1;
  if not (LevelsCount > 1) then EXIT;
  if Index >= 0 then
   begin
    if not HasChildren(Index) then EXIT;
    A := TIntegerArray(FChildrenList[Index]);
   end else A := FHighParents;
  i := A.IndexOf(ChildIndex);
  if i < 0 then EXIT;
  if i < A.Count - 1 then Result := A[i + 1];
end;

function TDimensionState.GetParentIndex(Index: integer): integer;
begin
  Result := FParents[Index];
end;

function TDimensionState.DoGetVisible(Index: integer): boolean; register;
asm
        mov     eax, [eax + TDimensionState.FAllDimMembers]
        mov     eax, [eax + TBaseArray.FArrayPointer]
        mov     eax, [eax + edx * TYPE pointer]
        mov     al, [eax + TDimMember.FVisible]
end;

function TDimensionState.HasAsAncestor(Index, AncestorIndex: integer): boolean;
begin
  Result := False;
  while FParents[Index] >= 0 do
  if FParents[Index] = AncestorIndex then
    begin
      Result := True;
      EXIT;
    end
  else
    Index := FParents[Index];
end;

function TDimensionState.HasChildren(Index: integer): boolean; register;
asm
        mov     eax, [eax + TDimensionState.FChildrenList]
        mov     eax, [eax + TBaseArray.FArrayPointer]
        mov     eax, [eax + edx * TYPE pointer]
        or      eax, eax
        setnz   al
end;

procedure TDimensionState.InitFromDimension(ADimID: integer; ADim: TDimension);
begin
  fDimID := ADimID;
  fDim := ADim;
  FDimGroup := ADim.FDimGroup;
  FTotalAppearance := ADim.FTotalAppearance;
  FDisplayName := ADim.DisplayName;
  FAttribute := ADim.DefaultAttribute;
  FSortType := ADim.FSortType;
  FMembers.InitFromTDimension(ADim, FAttribute);
  InitGroups;
  RebuildMembers(True);
end;

procedure TDimensionState.InitGroups;
var
  M: TDimMember;
begin
  if FGroups <> nil then
    begin
      FGroups.FillWith(nil);
      FGroups.Clear;
    end
  else
    FGroups := TDimMembers.Create;

  M := TDimMember.Create(nil);
  M.FIsGroup := True;
  M.FCaption := GetResStr('xhDefaultGroupCaption', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhDefaultGroupCaption);
  M.FDimIndex := xhDefaultGroupID;
  FMembers.Add(M);
  FGroups.Add(M);
end;

function TDimensionState.IsLeaf(Index: integer): boolean; register;
asm
        mov     eax, [eax + TDimensionState.FChildrenList]
        mov     eax, [eax + TBaseArray.FArrayPointer]
        mov     eax, [eax + edx * TYPE pointer]
        or      eax, eax
        setz    al
end;

function TDimensionState.HasLookupTable: boolean;
begin
  Result := Dim.HasLookup;
end;

procedure TDimensionState.MoveToGroup(Index, GroupIndex: integer);
var
  FPivotEventArgs: TPivotEventArgs;
  MemberName: WideString;
begin
  if Index < 0 then EXIT;
  MemberName := TDimMember(FAllDimMembers[Index]).FID;
  if DoMove2Group(Index, GroupIndex) then
  begin
    RebuildMembers(False);
    RegisterChange(dctGrouped);

    FPivotEventArgs := FGridInfo.FPivotEventArgs;
    FPivotEventArgs.Clear;
    if assigned(FGridInfo.FAfterPivot) then
    begin
      FPivotEventArgs.FOperation := opGroup;
      FPivotEventArgs.FDimState := Self;
      FPivotEventArgs.FMemberIndex := Index;
      FPivotEventArgs.FMemberName := MemberName;
      FPivotEventArgs.FGroupIndex := GroupIndex;
      FGridInfo.FAfterPivot({$IFDEF ASPRUNTIME}FGridInfo.FCube{$ELSE}FGridInfo.FGrid{$ENDIF}, FPivotEventArgs);
    end;
  end;
end;

procedure TDimensionState.QuickSort(L, R: Integer; Compare: TCompareProc);
var
  I, J, P: Integer;
begin
  repeat
    I := L;
    J := R;
    P := (L + R) shr 1;
    repeat
      while Compare(Self, I, P) < 0 do inc(I);
      while Compare(Self, J, P) > 0 do dec(J);
      if I <= J then
      begin
        fSortRank.QuickExchange(i, j);
        if P = I then
          P := J
        else if P = J then
          P := I;
        inc(I);
        dec(J);
      end;
    until I > J;
    if L < J then QuickSort(L, J, Compare);
    L := I;
  until I >= R;
end;

{$IFDEF ASPRUNTIME}
function CompareRanks(BaseArray: TBaseArray; Object1, Object2, Data: TObject): Integer;
var
  Index1, Index2: integer;
begin
  Index1 := TDimMember(Object1).FRank;
  Index2 := TDimMember(Object2).FRank;
  if Index1 > Index2 then Result := 1 else if Index1 < Index2 then Result := -1 else Result := 0;
end;
{$ELSE}
function CompareRanks(BaseArray: TBaseArray; Index1, Index2: Integer; Data: Longint): Integer;
var
  ItemsArray: PPntrArray;
begin
  ItemsArray := BaseArray.ArrayPointer;
  Index1 := TDimMember(ItemsArray[Index1]).FRank;
  Index2 := TDimMember(ItemsArray[Index2]).FRank;
  if Index1 > Index2 then Result := 1 else if Index1 < Index2 then Result := -1 else Result := 0;
end;
{$ENDIF}

procedure TDimensionState.RebuildMembers(SortChanged: boolean);
var
  i, n, ParentIndex: integer;
  AChildren: TIntegerArray;
  M: TDimMember;
  AllMembers: TPointerArray;
  DimItems: TIntegerArray;

  procedure AddMembers(Members: TDimMembers);
  var
    i: integer;
    M: TDimMember;
  begin
    for i := 0 to Members.Count - 1 do
    begin
      M := TDimMember(Members[i]);
      AllMembers.Add(M);
      if M.IsGroup then FGroups.Add(M);
      if M.FChildMembers <> nil then AddMembers(M.FChildMembers);
    end;
  end;

begin
  FreeAndNil(FItems);
  FreeAndNil(FParents);
  FreeAndNil(FChildrenList);
  FreeAndNil(FLevels);
  FreeAndNil(FHighParents);
  FreeAndNil(FLeafCounts);
  FreeAndNil(FIndexConversion);
  FreeAndNil(fSortRank);
  FreeAndNil(FAllDimMembers);
  FGroups.FillWith(nil); FGroups.Clear;

  DimItems := FDim.Items;
  FIndexConversion := TIntegerArray.CreateCount(DimItems.Count);
  FIndexConversion.FillWith(-1);
  AllMembers := TPointerArray.Create;
  FAllDimMembers := AllMembers;
  AddMembers(FMembers);
  FMembers.UpdateRanks;

  for i := 0 to FGroups.Count - 1 do
  begin
    M := TDimMember(FGroups[i]);
    M.MakeQualifiedName;
  end;

  FMemberCount := AllMembers.Count;

  FItems := TIntegerArray.CreateCount(FMemberCount);
  FParents := TIntegerArray.CreateCount(FMemberCount);

  {$IFDEF ASPRUNTIME}
  if SortChanged then AllMembers.CustomSort(CompareRanks, TObject(0));
  {$ELSE}
  if SortChanged then AllMembers.CustomSort(CompareRanks, 0);
  {$ENDIF}
  asm
        mov     eax, AllMembers
        mov     edx, [eax + TBaseArray.fArrayPointer]
        mov     ecx, [eax + TBaseArray.fCount]
        jecxz   @@1
        dec     ecx
  @@loop:
        mov     eax, [edx + ecx * TYPE Pointer]
        mov     [eax + TDimMember.FIndex], ecx
        dec     ecx
        jns     @@loop
  @@1:
  end;

  for i := 0 to FMemberCount - 1 do
  begin
    M := TDimMember(AllMembers[i]);
    if M.FDimIndex >= 0 then
    begin
      FItems[i] := DimItems[M.FDimIndex];
      FIndexConversion[M.FDimIndex] := i;
    end;
    if M.Parent <> nil then
      FParents[i] := M.Parent.FIndex
    else
      FParents[i] := -1;
  end;

  FChildrenList := TChildrenList.CreateCount(fMemberCount); 
  fLevelsCount := 1;
  FLevels := TIntegerArray.CreateCount(fMemberCount);
  FHighParents := TIntegerArray.Create;
  FLeafCounts := TIntegerArray.CreateCount(fMemberCount);
  for i := 0 to fMemberCount - 1 do
  begin
    n := 1;
    ParentIndex := FParents[i];
    if ParentIndex >= 0 then
    begin
      AChildren := TIntegerArray(FChildrenList[ParentIndex]); 
      if AChildren = nil then 
      begin
        AChildren := TIntegerArray.Create;
        AChildren.Duplicates := dupIgnore; 
        FChildrenList[ParentIndex] := AChildren;
      end;
      AChildren.Add(i);
      asm
          mov     eax, Self

          mov     ecx, [eax + TDimensionState.FParents]
          mov     ecx, [ecx + TBaseArray.FArrayPointer]     

          mov     eax, [eax + TDimensionState.FLeafCounts]
          mov     eax, [eax + TBaseArray.FArrayPointer]     

          mov     edx, ParentIndex
      @@loop:
          inc     dword ptr n
          inc     dword ptr [eax + edx * TYPE Integer]
          mov     edx, [ecx + edx * TYPE Integer]
          or      edx, edx
          jns     @@loop
      end;
    end;
    FLevels[i] := n;
    if n = 1 then FHighParents.Add(i);
    if fLevelsCount < n then fLevelsCount := n;
  end; 

  fSortRank := TIntegerArray.CreateCount(FMemberCount);
  if FMemberCount = 0 then EXIT;
  fSortRank.FillRank;
  RebuildSortedOriginalIDs;
  RebuildSortedIDs;
end;

procedure TDimensionState.RestoreSaveMembers(SaveMembers: TSaveMembers; RestoreMode: TMembersRestoreMode);
var
  k: integer;
  SaveMember: TSaveMember;
  DimGroup, Leaf: TDimMember;

  function FindIDAmongChilds(Member: TDimMember; DimIndex: integer): TDimMember;
  var
    i: integer;
    M: TDimMember;
    Childs: TDimMembers;
  begin
    Result := nil;
    Childs := Member.FChildMembers;
    if Childs <> nil then
    for i := 0 to Childs.Count - 1 do
    begin
      M := TDimMember(Childs[i]);
      if M.DimIndex = DimIndex then
      begin
        Result := M;
        BREAK;
      end;
    end;
  end;

  procedure Move2Group(Leaf: TDimMember; GroupIndex: integer);
  var
    P, M, TargetMember, NewMember: TDimMember;
    Chain: TPointerArray;
    i: integer;
  begin
    TargetMember := TDimMember(FGroups[GroupIndex]);
    Chain := TPointerArray.Create;
    try
      Chain.Add(Leaf);  
      P := Leaf.Parent;
      if P <> nil then
      repeat
        Chain.Add(P);
        P := P.Parent;
      until P = nil;

      P := TargetMember; 
      for i := Chain.Count - 1 downto 0 do
      begin
        M := TDimMember(Chain[i]);
        NewMember := FindIDAmongChilds(P, M.DimIndex);
        if NewMember = nil then
        begin
          NewMember := P.AddChild;
          NewMember.Assign(M);
        end;
        P := NewMember;
      end;
 
      M := Leaf;
      repeat
        if M.FChildMembers = nil then
          begin
            P := M.Parent;
            FMembers.DeleteMember(M, True);
            M := P;
          end
        else
          P := nil;
      until P = nil;
    finally
      Chain.Free;
    end;
  end;

begin
  if SaveMembers = nil then EXIT;
  FMembers.SetAllVisible(RestoreMode = rmRestoreHidden);
  for k := 0 to SaveMembers.Count - 1 do
  begin
    SaveMember := TSaveMember(SaveMembers[k]);
    if SaveMember.IsGroup then
      begin 
        if SaveMember.GroupID = 0 then
          begin
            DimGroup := TDimMember(FGroups[0]);
            DimGroup.FCaption := SaveMember.GroupCaption;
            DimGroup.FVisible := not SaveMember.FHidden;
          end
        else
          begin
            DimGroup := TDimMember.CreateGroup(SaveMember.GroupCaption);
            DimGroup.FVisible := not SaveMember.FHidden;
            FMembers.Add(DimGroup);
            FGroups.Add(DimGroup);
          end;
      end
    else
      begin
        if SaveMember.Grouped or
           (SaveMember.Hidden and (RestoreMode = rmRestoreHidden)) or
           (not SaveMember.Hidden and (RestoreMode = rmRestoreVisible)) then
        begin
          if SaveMembers.KeyType = ktIntegerKey then
            Leaf := FMembers.FindMember(SaveMember.IntegerID, Dim)
          else if SaveMembers.KeyType = ktStringKey then
            Leaf := FMembers.FindMember(SaveMember.StringID, Dim)
          else if SaveMembers.KeyType = ktQualifiedNameHash then
            Leaf := FMembers.FindQualifiedNameHash(SaveMember.QualifiedNameHash)
          else 
            if SaveMembers.StrID then
              Leaf := FMembers.FindMember(SaveMember.StringID, Dim)
            else
              Leaf := FMembers.FindMember(SaveMember.IntegerID, Dim);

          if Leaf <> nil then
          begin
            Leaf.FVisible := not SaveMember.Hidden;
            if SaveMember.Grouped then Move2Group(Leaf, SaveMember.GroupID);
          end;
        end;
      end;
  end;
  FMembers.CorrectVisible;
end;

procedure TDimensionState.RestoreStreamedDimState(StreamedDimState: TStreamedDimState; RestoreMode: TMembersRestoreMode);
begin
  FRange := StreamedDimState.FRange;
  FAttribute := StreamedDimState.FAttribute;
  FDisplayName := StreamedDimState.FDisplayName;
  FDimGroup := StreamedDimState.FDimGroup;
  FSortType := StreamedDimState.FSortType;
  FTotalAppearance := StreamedDimState.FTotalAppearance;
  SetCaseSensitive(StreamedDimState.FCaseSensitive);

  FMembers.InitFromTDimension(Dim, FAttribute);
  InitGroups;

  RestoreSaveMembers(StreamedDimState.SaveMembers, RestoreMode);
  RebuildMembers(True);
end;

procedure TDimensionState.SetAttribute(const Value: WideString);
begin
  if WideCompareText(FAttribute, Value) <> 0 then
  begin
    ChangeAttribute(Value, True);
    RegisterChange(dctAttribute);
  end;
end;

procedure TDimensionState.DoSetCaption(Index: integer; const Value: WideString);
var
  DimMember: TDimMember;
begin
  DimMember := TDimMember(FAllDimMembers[Index]);
  if WideCompareStr(DimMember.Caption, Value) <> 0 then
  begin
    DimMember.Caption := Value;
    RegisterChange(dctMemberCaption);
  end;
end;

procedure TDimensionState.SetDisplayName(const Value: WideString);
begin
  if WideCompareStr(Value, FDisplayName) <> 0 then
  begin
    FDisplayName := Value;
    RegisterChange(dctDisplayName);
  end;
end;

procedure TDimensionState.SetSortType(Value: TDimSortType);
begin
  if Value <> fSortType then
  begin
    Sort(Value);
    RegisterChange(dctSort);
  end;
end;

procedure TDimensionState.SetTotalAppearance(Value: TTotalAppearance);
begin
  if Value <> FTotalAppearance then
  begin
    FTotalAppearance := Value;
    RegisterChange(dctTotalAppearance);
  end;
end;

procedure TDimensionState.DoSetVisible(Index: integer; Value: boolean);

  procedure SetRecursive(Index: integer; Value: boolean);
  var
    i: integer;
    Children: TIntegerArray;
  begin
    Children := TIntegerArray(FChildrenList[Index]);
    if Children <> nil then
      for i := 0 to Children.Count -  1 do SetRecursive(Children[i], Value);
    TDimMember(FAllDimMembers[Index]).Visible := Value;
  end;

var
  FPivotEventArgs: TPivotEventArgs;
begin
  if Value <> TDimMember(FAllDimMembers[Index]).Visible then
  begin
    SetRecursive(Index, Value);
    if FDimGroup = dgPage then
      RegisterChange(dctPageFiltered)
    else
      RegisterChange(dctActiveFiltered);
    FPivotEventArgs := FGridInfo.FPivotEventArgs;
    FPivotEventArgs.Clear;
    if assigned(FGridInfo.FAfterPivot) then
    begin
      FPivotEventArgs.FOperation := opFilter;
      FPivotEventArgs.FDimState := Self;
      FPivotEventArgs.FMemberIndex := Index;
      FGridInfo.FAfterPivot({$IFDEF ASPRUNTIME}FGridInfo.FCube{$ELSE}FGridInfo.FGrid{$ENDIF}, FPivotEventArgs);
    end;
  end;
end;

{$IFDEF ASPRUNTIME}
function CompareDimCaptions(DimState: TDimensionState; Index1, Index2: integer): integer;
begin
  Result := DimState.CompareCaptions(DimState.fSortRank[Index1], DimState.fSortRank[Index2]);
end;
{$ELSE}
function CompareDimCaptions(DimState: TDimensionState; Index1, Index2: integer): integer;
var
  RankArray: PIntArray;
begin
  RankArray := DimState.fSortRank.FArrayPointer;
  Result := DimState.CompareCaptions(RankArray[Index1], RankArray[Index2]);
end;
{$ENDIF}

{$IFDEF ASPRUNTIME}
function CompareDimCaptionsDesc(DimState: TDimensionState; Index1, Index2: integer): integer;
begin
  Result := DimState.CompareCaptions(DimState.fSortRank[Index2], DimState.fSortRank[Index1]);
end;
{$ELSE}
function CompareDimCaptionsDesc(DimState: TDimensionState; Index1, Index2: integer): integer;
var
  RankArray: PIntArray;
begin
  RankArray := DimState.fSortRank.FArrayPointer;
  Result := DimState.CompareCaptions(RankArray[Index2], RankArray[Index1]);
end;
{$ENDIF}

{$IFDEF ASPRUNTIME}
function CompareIntegerCaptions(DimState: TDimensionState; Index1, Index2: integer): integer;
begin
  Result := DimState.CompareIntegerMembers(DimState.fSortRank[Index1], DimState.fSortRank[Index2]);
end;
{$ELSE}
function CompareIntegerCaptions(DimState: TDimensionState; Index1, Index2: integer): integer;
var
  RankArray: PIntArray;
begin
  RankArray := DimState.fSortRank.FArrayPointer;
  Result := DimState.CompareIntegerMembers(RankArray[Index1], RankArray[Index2]);
end;
{$ENDIF}

{$IFDEF ASPRUNTIME}
function CompareIntegerCaptionsDesc(DimState: TDimensionState; Index1, Index2: integer): integer;
begin
  Result := DimState.CompareIntegerMembersDesc(DimState.fSortRank[Index1], DimState.fSortRank[Index2]);
end;
{$ELSE}
function CompareIntegerCaptionsDesc(DimState: TDimensionState; Index1, Index2: integer): integer;
var
  RankArray: PIntArray;
begin
  RankArray := DimState.fSortRank.FArrayPointer;
  Result := DimState.CompareIntegerMembersDesc(RankArray[Index1], RankArray[Index2]);
end;
{$ENDIF}

{$IFDEF ASPRUNTIME}
function CompareDimDatabaseRanks(DimState: TDimensionState; Index1, Index2: integer): integer;
begin
  Result := DimState.CompareDatabaseRanks(DimState.fSortRank[Index1], DimState.fSortRank[Index2]);
end;
{$ELSE}
function CompareDimDatabaseRanks(DimState: TDimensionState; Index1, Index2: integer): integer;
var
  RankArray: PIntArray;
begin
  RankArray := DimState.fSortRank.FArrayPointer;
  Result := DimState.CompareDatabaseRanks(RankArray[Index1], RankArray[Index2]);
end;
{$ENDIF}

{$IFDEF ASPRUNTIME}
function CompareDimCustom(DimState: TDimensionState; Index1, Index2: integer): integer;
var
  L1, L2: integer;
begin
  L1 := DimState.GetLevel(DimState.fSortRank[Index1]);
  L2 := DimState.GetLevel(DimState.fSortRank[Index2]);
  if L1 < L2 then
    Result := -1
  else if L1 > L2 then
    Result := 1
  else
    Result := DimState.FGridInfo.OnCompareDimensionMembers(DimState, DimState.fSortRank[Index1], DimState.fSortRank[Index2]);
end;
{$ELSE}
function CompareDimCustom(DimState: TDimensionState; Index1, Index2: integer): integer;
var
  RankArray: TIntegerArray;
  L1, L2: integer;
begin
  RankArray := DimState.fSortRank;
  L1 := DimState.GetLevel(RankArray[Index1]);
  L2 := DimState.GetLevel(RankArray[Index2]);
  if L1 < L2 then
    Result := -1
  else if L1 > L2 then
    Result := 1
  else
    Result := DimState.FGridInfo.OnCompareDimensionMembers(DimState, RankArray[Index1], RankArray[Index2]);
end;
{$ENDIF}

{$IFDEF ASPRUNTIME}
procedure TDimensionState.Sort(ASortType: TDimSortType);
begin
  fSortType := ASortType;
  if MemberCount = 0 then EXIT;
  SortRank.FillRank;

  case ASortType of
  dsDatabase:
    QuickSort(0, MemberCount - 1, CompareDimDatabaseRanks);

  dsNameAsc:
    if not FDim.FHasLookup and not FDim.FStrID then
      QuickSort(0, MemberCount - 1, CompareIntegerCaptions)
    else
      QuickSort(0, MemberCount - 1, CompareDimCaptions);

  dsNameDesc:
    if not FDim.FHasLookup and not FDim.FStrID then
      QuickSort(0, MemberCount - 1, CompareIntegerCaptionsDesc)
    else
      QuickSort(0, MemberCount - 1, CompareDimCaptionsDesc);

  else
    if assigned(FGridInfo.OnCompareDimensionMembers) then
      QuickSort(0, MemberCount - 1, CompareDimCustom);
  end;
end;
{$ELSE}
procedure TDimensionState.Sort(ASortType: TDimSortType);
begin
  fSortType := ASortType;
  if MemberCount = 0 then EXIT;
  SortRank.FillRank;

  case ASortType of
  dsDatabase:
    QuickSort(0, MemberCount - 1, CompareDimDatabaseRanks);

  dsNameAsc:
    if not FDim.FHasLookup and not FDim.FStrID then
      QuickSort(0, MemberCount - 1, CompareIntegerCaptions)
    else
      QuickSort(0, MemberCount - 1, CompareDimCaptions);

  dsNameDesc:
    if not FDim.FHasLookup and not FDim.FStrID then
      QuickSort(0, MemberCount - 1, CompareIntegerCaptionsDesc)
    else
      QuickSort(0, MemberCount - 1, CompareDimCaptionsDesc);

  else
    if assigned(FGridInfo.OnCompareDimensionMembers) then
      QuickSort(0, MemberCount - 1, CompareDimCustom);
  end;
end;
{$ENDIF}

procedure TGridInfo.ChangeDrillState(DimState: TDimensionState);
begin
end;

procedure TGridInfo.ChangeDimensionStates;
begin
  BeginChange;
  try
    InitSummaries;
  finally
    EndChange(gePageChanged, 0);
  end;
end;

function TGridInfo.LabelNodesRankSort(Nodes: TLabelNodes; DimGroup: TDimGroup): boolean;

  procedure DoSortNodes(Nodes: TLabelNodes);
  var
    i: integer;
    TA: TTotalAppearance;
    ChildNodes: TLabelNodes;
  begin
    for i := 0 to Nodes.Count - 1 do
    begin
      ChildNodes := TLabelNode(Nodes[i]).ChildNodes;
      if (ChildNodes <> nil) and (ChildNodes.Count > 0) then DoSortNodes(ChildNodes);
    end;
    if Nodes.Count > 1 then
    begin
      TA := TLabelNode(Nodes[0]).DimState.TotalAppearance;
      QuickSortLabelNodes(Nodes, 0, Nodes.Count - 1, LabelNodesCompareRanks, TA, 0);
    end;
  end;

var
  i: integer;
  DimState: TDimensionState;
  DimIDs: TIntegerArray;
begin
  if Nodes = nil then
    Result := False
  else
    begin
      if DimGroup = dgRow then
        DimIDs := FVisibleRowDimIDs
      else
        DimIDs := FVisibleColDimIDs;
      for i := 0 to DimensionStates.Count - 1 do
      begin
        DimState := TDimensionState(DimensionStates[i]);
        if DimIDs.IndexOf(DimState.fDimID) >= 0 then DimState.GetIndexSortRank;
      end;
      DoSortNodes(Nodes);
      Result := True;
    end;
end;

function TDimensionState.FindGroup(const GroupCaption: WideString): integer;
begin
  Result := FGroups.FindGroupCaption(GroupCaption);
end;

procedure TDimensionState.MoveToGroup(Index: integer; const GroupCaption: WideString);
var
  GroupIndex: integer;
begin
  GroupIndex := FGroups.FindGroupCaption(GroupCaption);
  MoveToGroup(Index, GroupIndex);
end;

procedure TDimensionStates.BeginUpdate;
begin
  inc(FUpdateCounter);
end;

procedure TDimensionStates.RegisterChange(DimState: TDimensionState; ChangeType: integer);
var
  Index: integer;
begin
  Index := FChangedDimensions.IndexOf(DimState);
  if Index < 0 then
    begin
      FChangedDimensions.Add(DimState);
      FChangeTypes.Add(ChangeType);
    end
  else
    FChangeTypes[Index] := FChangeTypes[Index] or ChangeType;
    
  if FUpdateCounter <= 0 then DoChange;
end;

procedure TDimensionStates.EndUpdate;
begin
  dec(FUpdateCounter);
  if FUpdateCounter <= 0 then DoChange;
end;

procedure TDimensionState.RegisterChange(ChangeType: integer);
begin
  if FDimensionStates <> nil then FDimensionStates.RegisterChange(Self, ChangeType);
end;

{$IFDEF ASPRUNTIME}
procedure TDimensionState.RebuildSortedOriginalIDs;
var
  Sarr: System.Array;
  i: integer;
begin
  if FSortedOriginalIDs = nil then
    FSortedOriginalIDs := TIntegerArray.CreateCount(FAllDimMembers.Count)
  else
    FSortedOriginalIDs.Count := FAllDimMembers.Count;
  FSortedOriginalIDs.FillRank;

  SArr := System.Array.CreateInstance(typeof(string), FAllDimMembers.Count);
  for i := 0 to FAllDimMembers.Count - 1 do SArr.SetValue(TObject(TDimMember(FAllDimMembers[i]).FOriginalID), i);
  System.Array.Sort(SArr, FSortedOriginalIDs.List);
end;
{$ELSE}

function CompareOriginalID(BaseArray: TBaseArray; Index1, Index2: Integer; Data: Longint): Integer;
var
  A: PIntArray;
  AllMembers: PPntrArray;
begin
  A := BaseArray.ArrayPointer;
  AllMembers := pointer(Data);
  Result := WideCompareStr(TDimMember(AllMembers[A[Index1]]).FOriginalID,
                  TDimMember(AllMembers[A[Index2]]).FOriginalID);
end;

procedure TDimensionState.RebuildSortedOriginalIDs;
begin
  if FSortedOriginalIDs = nil then
    FSortedOriginalIDs := TIntegerArray.CreateCount(FAllDimMembers.Count)
  else
    FSortedOriginalIDs.Count := FAllDimMembers.Count;
  FSortedOriginalIDs.FillRank;
  FSortedOriginalIDs.CustomSort(CompareOriginalID, longint(FAllDimMembers.ArrayPointer));
end;
{$ENDIF}

{$IFDEF ASPRUNTIME}
procedure TDimensionState.RebuildSortedIDs;
var
  Sarr: System.Array;
  i: integer;
begin
  if FSortedIDs = nil then
    FSortedIDs := TIntegerArray.CreateCount(FAllDimMembers.Count)
  else
    FSortedIDs.Count := FAllDimMembers.Count;
  FSortedIDs.FillRank;

  SArr := System.Array.CreateInstance(typeof(string), FAllDimMembers.Count);
  for i := 0 to FAllDimMembers.Count - 1 do SArr.SetValue(TObject(TDimMember(FAllDimMembers[i]).FID), i);
  System.Array.Sort(SArr, FSortedIDs.List);
end;
{$ELSE}

function CompareID(BaseArray: TBaseArray; Index1, Index2: Integer; Data: Longint): Integer;
var
  A: PIntArray;
  AllMembers: PPntrArray;
begin
  A := BaseArray.ArrayPointer;
  AllMembers := pointer(Data);
  Result := WideCompareStr(TDimMember(AllMembers[A[Index1]]).FID,
                  TDimMember(AllMembers[A[Index2]]).FID);
end;

procedure TDimensionState.RebuildSortedIDs;
begin
  if FSortedIDs = nil then
    FSortedIDs := TIntegerArray.CreateCount(FAllDimMembers.Count)
  else
    FSortedIDs.Count := FAllDimMembers.Count;
  FSortedIDs.FillRank;
  FSortedIDs.CustomSort(CompareID, longint(FAllDimMembers.ArrayPointer));
end;

{$ENDIF}

{$IFDEF ASPRUNTIME}
function TDimensionState.FindID(out Index: integer; const ID: WideString): boolean;
var
  L, H, I, C: Integer;
begin
  Result := False;
  L := 0;
  H := FMemberCount - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    if FCaseSensitive then
      C := WideCompareStr(TDimMember(FAllDimMembers[FSortedIDs[I]]).FID, ID)
    else
      C := WideCompareText(TDimMember(FAllDimMembers[FSortedIDs[I]]).FID, ID);
    if C < 0 then L := I + 1 else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        L := I;
      end;
    end;
  end;
  Index := FSortedIDs[L];
end;
{$ELSE}
function TDimensionState.FindID(out Index: integer; const ID: WideString): boolean;
var
  L, H, I, C: Integer;
  SortedIDsArray: PIntArray;
  AllDimMembersArray: PPntrArray;
begin
  Result := False;
  SortedIDsArray := FSortedIDs.ArrayPointer;
  AllDimMembersArray := FAllDimMembers.ArrayPointer;
  L := 0;
  H := FMemberCount - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    if FCaseSensitive then
      C := WideCompareStr(TDimMember(AllDimMembersArray[SortedIDsArray[I]]).FID, ID)
    else
      C := WideCompareText(TDimMember(AllDimMembersArray[SortedIDsArray[I]]).FID, ID);
    if C < 0 then L := I + 1 else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        L := I;
      end;
    end;
  end;
  Index := SortedIDsArray[L];
end;
{$ENDIF}

{$IFDEF ASPRUNTIME}
function TDimensionState.FindOriginalID(out Index: integer; const OriginalID: WideString): boolean;
var
  L, H, I, C: Integer;
begin
  Result := False;
  L := 0;
  H := FMemberCount - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    if FCaseSensitive then
      C := WideCompareStr(TDimMember(FAllDimMembers[FSortedOriginalIDs[I]]).FOriginalID, OriginalID)
    else
      C := WideCompareText(TDimMember(FAllDimMembers[FSortedOriginalIDs[I]]).FOriginalID, OriginalID);
    if C < 0 then L := I + 1 else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        L := I;
      end;
    end;
  end;
  Index := FSortedOriginalIDs[L];
end;
{$ELSE}
function TDimensionState.FindOriginalID(out Index: integer; const OriginalID: WideString): boolean;
var
  L, H, I, C: Integer;
  SortedIDsArray: PIntArray;
  AllDimMembersArray: PPntrArray;
begin
  Result := False;
  SortedIDsArray := FSortedOriginalIDs.ArrayPointer;
  AllDimMembersArray := FAllDimMembers.ArrayPointer;
  L := 0;
  H := FMemberCount - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    if FCaseSensitive then
      C := WideCompareStr(TDimMember(AllDimMembersArray[SortedIDsArray[I]]).FOriginalID, OriginalID)
    else
      C := WideCompareText(TDimMember(AllDimMembersArray[SortedIDsArray[I]]).FOriginalID, OriginalID);
    if C < 0 then L := I + 1 else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        L := I;
      end;
    end;
  end;
  Index := SortedIDsArray[L];
end;
{$ENDIF}

procedure TDimensionState.SetCaseSensitive(Value: boolean);
begin
  FCaseSensitive := Value;
  FMembers.FCaseSensitive := Value;
  FGroups.FCaseSensitive := Value;
end;

function TDimensionState.DoFindMember(out Index: integer; const Member: WideString): boolean;
var
  s: WideString;
  HasMemberDelimiter: boolean;
begin
  s := ParseDimensionMember(Member, HasMemberDelimiter);
  if HasMemberDelimiter then
    Result := FindID(Index, s)
  else
    Result := FindOriginalID(Index, s);
end;

function TDimensionState.FindMember(const AQualifiedName: WideString): integer;
begin
  if not DoFindMember(Result, AQualifiedName) then Result := -1;
end;

function TDimensionState.GetMemberGroup(Index: integer): integer;
var
  M: TDimMember;
begin
  M := TDimMember(FAllDimMembers[Index]);
  while M.Parent <> nil do M := M.Parent;
  Result := FGroups.IndexOf(M);
end;

procedure TDimensionState.SetVisible(Index: integer; Value: boolean);
begin
  DoSetVisible(Index, Value);
end;

procedure TDimensionState.SetVisible(const Member: WideString; Value: boolean);
var
  Index: integer;
begin
   Index := FindMember(Member);
   if Index >= 0 then DoSetVisible(Index, Value);
end;

function TDimensionState.GetVisible(Index: integer): boolean;
begin
  Result := DoGetVisible(Index);
end;

function TDimensionState.GetVisible(const Member: WideString): boolean;
var
  Index: integer;
begin
  Result := False;
  Index := FindMember(Member);
  if Index >= 0 then Result := DoGetVisible(Index);
end;

function TDimensionState.GetIsGroup(Index: integer): boolean;
begin
  Result := TDimMember(FAllDimMembers[Index]).IsGroup;
end;

function TDimensionState.GetIsGroup(const Member: WideString): boolean;
var
  Index: integer;
begin
  Result := False;
  Index := FindMember(Member);
  if Index >= 0 then Result := TDimMember(FAllDimMembers[Index]).IsGroup;
end;

function TDimensionState.GetDatabaseRank(Index: integer): integer;
begin
  Result := TDimMember(FAllDimMembers[Index]).DatabaseRank;
end;

function TDimensionState.GetDatabaseRank(const Member: WideString): integer;
var
  Index: integer;
begin
  Result := -1;
  Index := FindMember(Member);
  if Index >= 0 then Result := TDimMember(FAllDimMembers[Index]).DatabaseRank;
end;

procedure TDimensionState.SetCaption(Index: integer; const Value: WideString);
begin
  DoSetCaption(Index, Value);
end;

procedure TDimensionState.SetCaption(const Member, Value: WideString);
var
  Index: integer;
begin
  Index := FindMember(Member);
  if Index >= 0 then DoSetCaption(Index, Value);
end;

function TDimensionState.GetCaption(Index: integer): WideString;
begin
  Result := TDimMember(FAllDimMembers[Index]).Caption;
end;

function TDimensionState.GetCaption(const Member: WideString): WideString;
var
  Index: integer;
begin
  Result := '';
  Index := FindMember(Member);
  if Index >= 0 then Result := TDimMember(FAllDimMembers[Index]).Caption;
end;

function TDimensionState.DoMove2Group(Value, GroupIndex: integer): boolean;
var
  SourceMember, TargetGroup: TDimMember;
begin
  Result := False;
  if (GroupIndex < 0) or (GroupIndex > FGroups.Count - 1) then EXIT;
  SourceMember := TDimMember(FAllDimMembers[Value]);
  TargetGroup := TDimMember(FGroups[GroupIndex]);
  Result := FMembers.MoveToGroup(SourceMember, TargetGroup);
end;

function TDimensionState.DoMove2Group(Value: integer; const GroupCaption: WideString): boolean;
var
  Index: integer;
begin
  Result := False;
  Index := FindGroup(GroupCaption);
  if Index >= 0 then Result := DoMove2Group(Value, GroupCaption);
end;

procedure TDimensionState.MoveToGroup(const Member, GroupCaption: WideString);
var
  Index: integer;
begin
  Index := FindMember(Member);
  if Index >= 0 then MoveToGroup(Index, GroupCaption);
end;

procedure TDimensionState.MoveToGroup(const Member: WideString; GroupIndex: integer);
var
  Index: integer;
begin
  Index := FindMember(Member);
  if Index >= 0 then MoveToGroup(Index, GroupIndex);
end;

procedure TDimensionState.ClearGroup(GroupIndex: integer);
var
  FPivotEventArgs: TPivotEventArgs;
begin
  if (GroupIndex < 0) or (GroupIndex > FGroups.Count - 1) then EXIT;
  if DoClearGroup(GroupIndex, False) then
  begin
    RebuildMembers(False);
    RegisterChange(dctGrouped);

    FPivotEventArgs := FGridInfo.FPivotEventArgs;
    FPivotEventArgs.Clear;
    if assigned(FGridInfo.FAfterPivot) then
    begin
      FPivotEventArgs.FOperation := opClearGroup;
      FPivotEventArgs.FDimState := Self;
      FPivotEventArgs.FGroupIndex := GroupIndex;
      FGridInfo.FAfterPivot({$IFDEF ASPRUNTIME}FGridInfo.FCube{$ELSE}FGridInfo.FGrid{$ENDIF}, FPivotEventArgs);
    end;
  end;
end;

procedure TDimensionState.ClearGroup(const GroupCaption: WideString);
var
  GroupIndex: integer;
begin
  GroupIndex := FGroups.FindGroupCaption(GroupCaption);
  ClearGroup(GroupIndex);
end;

function TDimensionState.DoClearGroup(GroupIndex: integer; DeleteGroup: boolean): boolean;
var
  SourceMember, P, NewMember, M, Leaf: TDimMember;
  Chain, Leaves: TPointerArray;
  i, j: integer;

  procedure AddLeaves(Member: TDimMember);
  var
    i: integer;
    Childs: TDimMembers;
  begin
    Childs := Member.FChildMembers;
    if Childs = nil then
      Leaves.Add(Member)
    else
      for i := 0 to Childs.Count - 1 do
      AddLeaves(TDimMember(Childs[i]));
  end;

  function FindIDAmongChilds(Member: TDimMember; ID: integer): TDimMember;
  var
    i: integer;
    M: TDimMember;
    Childs: TDimMembers;
  begin
    Result := nil;
    if Member = nil then
      Childs := DimMembers
    else
      Childs := Member.FChildMembers;

    if Childs <> nil then
    for i := 0 to Childs.Count - 1 do
    begin
      M := TDimMember(Childs[i]);
      if M.DimIndex = ID then
      begin
        Result := M;
        BREAK;
      end;
    end;
  end;

begin
  Result := False;
  if (GroupIndex < 0) or (GroupIndex > FGroups.Count - 1) then EXIT;
  SourceMember := TDimMember(FGroups[GroupIndex]); 
  Chain := TPointerArray.Create;
  Leaves := TPointerArray.Create;
  try
    AddLeaves(SourceMember);
    for j := 0 to Leaves.Count - 1 do
    begin
      Leaf := TDimMember(Leaves[j]);
      Chain.Clear;
      P := Leaf;
      while P.Parent <> nil do
      begin
        Chain.Add(P);
        P := P.Parent;
      end;

      P := nil;
      for i := Chain.Count - 1 downto 0 do
      begin
        M := TDimMember(Chain[i]);
        NewMember := FindIDAmongChilds(P, M.DimIndex);
        if NewMember = nil then
        begin
          if P = nil then
            begin
              NewMember := TDimMember.Create(nil);
              DimMembers.Add(NewMember);
            end
          else
            NewMember := P.AddChild;
          NewMember.Assign(M);
        end;
        P := NewMember;
      end;
    end; 
    for j := 0 to Leaves.Count - 1 do
    begin
      M := TDimMember(Leaves[j]);
      repeat
        if M.FChildMembers = nil then
          begin
            P := M.Parent;
            FMembers.DeleteMember(M, DeleteGroup);
            M := P;
          end
        else
          P := nil;
      until P = nil;
    end;
    FGroups.Delete(GroupIndex);
  finally
    Chain.Free; Leaves.Free;
  end;
  Result := True;
end;

procedure TDimensionState.DeleteGroup(GroupIndex: integer);
var
  FPivotEventArgs: TPivotEventArgs;
begin
  if (GroupIndex < 0) or (GroupIndex > FGroups.Count - 1) then EXIT;
  if DoClearGroup(GroupIndex, GroupIndex <> 0) then
  begin
    RebuildMembers(False);
    RegisterChange(dctGrouped);
    
    FPivotEventArgs := FGridInfo.FPivotEventArgs;
    FPivotEventArgs.Clear;
    if assigned(FGridInfo.FAfterPivot) then
    begin
      FPivotEventArgs.FOperation := opDeleteGroup;
      FPivotEventArgs.FDimState := Self;
      FPivotEventArgs.FGroupIndex := GroupIndex;
      FGridInfo.FAfterPivot({$IFDEF ASPRUNTIME}FGridInfo.FCube{$ELSE}FGridInfo.FGrid{$ENDIF}, FPivotEventArgs);
    end;
  end;
end;

procedure TDimensionState.DeleteGroup(const GroupCaption: WideString);
var
  GroupIndex: integer;
begin
  GroupIndex := FGroups.FindGroupCaption(GroupCaption);
  DeleteGroup(GroupIndex);
end;

procedure TDimensionState.RemoveFromGroup(Index: integer);
var
  FPivotEventArgs: TPivotEventArgs;
  MemberName: string;
  GroupIndex: integer;
begin
  if Index < 0 then EXIT;
  MemberName := TDimMember(FAllDimMembers[Index]).FID;
  if DoRemoveFromGroup(Index, GroupIndex) then
  begin
    RebuildMembers(False);
    RegisterChange(dctGrouped);

    FPivotEventArgs := FGridInfo.FPivotEventArgs;
    FPivotEventArgs.Clear;
    if assigned(FGridInfo.FAfterPivot) then
    begin
      FPivotEventArgs.FOperation := opUnGroup;
      FPivotEventArgs.FDimState := Self;
      FPivotEventArgs.FMemberIndex := Index;
      FPivotEventArgs.FMemberName := MemberName;
      FPivotEventArgs.FGroupIndex := GroupIndex;
      FGridInfo.FAfterPivot({$IFDEF ASPRUNTIME}FGridInfo.FCube{$ELSE}FGridInfo.FGrid{$ENDIF}, FPivotEventArgs);
    end;
  end;
end;  

function TDimensionState.DoRemoveFromGroup(Value: integer; out GroupIndex: integer): boolean;
var
  SourceMember, P, NewMember, M, Leaf: TDimMember;
  Chain, Leaves: TPointerArray;
  i, j: integer;

  procedure AddLeaves(Member: TDimMember);
  var
    i: integer;
    Childs: TDimMembers;
  begin
    Childs := Member.FChildMembers;
    if Childs = nil then
      Leaves.Add(Member)
    else
      for i := 0 to Childs.Count - 1 do
      AddLeaves(TDimMember(Childs[i]));
  end;

  function FindIDAmongChilds(Member: TDimMember; ID: integer): TDimMember;
  var
    i: integer;
    M: TDimMember;
    Childs: TDimMembers;
  begin
    Result := nil;
    if Member = nil then
      Childs := DimMembers
    else
      Childs := Member.FChildMembers;

    if Childs <> nil then
    for i := 0 to Childs.Count - 1 do
    begin
      M := TDimMember(Childs[i]);
      if M.DimIndex = ID then
      begin
        Result := M;
        BREAK;
      end;
    end;
  end;

begin
  Result := False;
  SourceMember := TDimMember(FAllDimMembers[Value]);
  GroupIndex := GetMemberGroup(Value);
  if GroupIndex < 0 then EXIT; 
  Chain := TPointerArray.Create;
  Leaves := TPointerArray.Create;
  try
    AddLeaves(SourceMember);
    for j := 0 to Leaves.Count - 1 do
    begin
      Leaf := TDimMember(Leaves[j]);
      Chain.Clear;
      P := Leaf;
      while P.Parent <> nil do
      begin
        if not P.IsGroup then Chain.Add(P);
        P := P.Parent;
      end;

      
      P := nil;
      for i := Chain.Count - 1 downto 0 do
      begin
        M := TDimMember(Chain[i]);
        NewMember := FindIDAmongChilds(P, M.DimIndex);
        if NewMember = nil then
        begin
          if P = nil then
            begin
              NewMember := TDimMember.Create(nil);
              DimMembers.Add(NewMember);
            end
          else
            NewMember := P.AddChild;
          NewMember.Assign(M);
        end;
        P := NewMember;
      end;
    end; 
    for j := 0 to Leaves.Count - 1 do
    begin
      M := TDimMember(Leaves[j]);
      repeat
        if M.FChildMembers = nil then
          begin
            P := M.Parent;
            FMembers.DeleteMember(M, False);
            M := P;
          end
        else
          P := nil;
      until P = nil;
    end;
  finally
    Chain.Free; Leaves.Free;
  end;
  Result := True;
end;

procedure TDimensionState.RemoveFromGroup(const Member: WideString);
var
  Index: integer;
begin
  Index := FindMember(Member);
  if Index >= 0 then RemoveFromGroup(Index);
end;

procedure TDimensionState.FullRebuild;
begin
  RegisterChange(dctFullRebuild);
end;

{$IFDEF ASPRUNTIME}
function TDimensionState.BuildStateString: string;
var
  i: integer;
  s: StringBuilder;
  M: TDimMember;
begin
  s := StringBuilder.Create;
  for i := 0 to FSortedIDs.Count - 1 do
  begin
    M := TDimMember(FAllDimMembers[FSortedIDs[i]]);
    if M.Visible then
     begin
      if s.Length <> 0 then s.Append(xhFieldsDelimiter);
      s.Append(M.FID);
     end;
  end;
  Result := FieldName + '(' + s.ToString + ')';
end;
{$ENDIF}

{$IFDEF ASPRUNTIME}
function TDimensionState.BuildLevelConversionArray(Level: integer): TIntegerArray;
var
  i, j: integer;
begin
  Result := TIntegerArray.CreateCount(FItems.Count);
  for i := 0 to FItems.Count - 1 do
  begin
    if FLevels[i] < Level then
      Result[i] := -1
    else if FLevels[i] = Level then
      Result[i] := i
    else
      begin
        j := i;
        repeat
          j := FParents[j];
        until FLevels[j] = Level;
        Result[i] := j;
      end;
  end;
end;
{$ELSE}
function TDimensionState.BuildLevelConversionArray(Level: integer): TIntegerArray;
var
  i, j: integer;
  ResultArray: PIntArray;
  FLevelsArray: PIntArray;
  FParentsArray: PIntArray;
begin
  Result := TIntegerArray.CreateCount(FItems.Count);
  FLevelsArray := FLevels.ArrayPointer;
  FParentsArray := FParents.ArrayPointer;
  ResultArray := Result.ArrayPointer;
  for i := 0 to FItems.Count - 1 do
  begin
    if FLevelsArray[i] < Level then
      ResultArray[i] := -1
    else if FLevelsArray[i] = Level then
      ResultArray[i] := i
    else
      begin
        j := i;
        repeat
          j := FParentsArray[j];
        until FLevelsArray[j] = Level;
        ResultArray[i] := j;
      end;
  end;
end;
{$ENDIF}

function TDimensionState.CompareIntegerMembers(Index1, Index2: integer): integer;
var
  Int1, Int2: integer;
begin
  Int1 := TDimMember(FAllDimMembers[Index1]).FDimIndex;
  Int2 := TDimMember(FAllDimMembers[Index2]).FDimIndex;

  if (Int1 < 0) and (Int2 < 0) then
    Result := 0
  else if (Int1 < 0) and (Int2 >= 0) then
    Result := -1
  else if (Int1 >= 0) and (Int2 < 0) then
    Result := 1
  else
    begin
      Int1 := FItems[Index1];
      Int2 := FItems[Index2];
      if Int1 > Int2 then Result := 1 else if Int1 < Int2 then Result := -1 else Result := 0;
    end;
end;

function TDimensionState.CompareIntegerMembersDesc(Index1, Index2: integer): integer;
var
  Int1, Int2: integer;
begin
  Int1 := TDimMember(FAllDimMembers[Index1]).FDimIndex;
  Int2 := TDimMember(FAllDimMembers[Index2]).FDimIndex;

  if (Int1 < 0) and (Int2 < 0) then
    Result := 0
  else if (Int1 < 0) and (Int2 >= 0) then
    Result := -1
  else if (Int1 >= 0) and (Int2 < 0) then
    Result := 1
  else
    begin
      Int1 := FItems[Index1];
      Int2 := FItems[Index2];
      if Int1 > Int2 then Result := -1 else if Int1 < Int2 then Result := 1 else Result := 0;
    end;
end;

function TDimensionState.GetQualifiedName(Index: integer): WideString;
begin
  Result := TDimMember(FAllDimMembers[Index]).FID;
end;


function TSubLevelNode.AddChild: TSubLevelNode;
begin
  Result := TSubLevelNode.Create(Self);
  if FChildNodes = nil then FChildNodes := TSubLevelNodes.Create;
  FChildNodes.Add(Result);
end;

constructor TSubLevelNode.Create(AParent: TSubLevelNode);
begin
{$IFDEF ASPRUNTIME}
  inherited Create;
{$ENDIF}
  FParent := AParent;
end;

{$IFNDEF ASPRUNTIME}
destructor TSubLevelNode.Destroy;
begin
  FreeAndNil(FChildNodes);
  inherited;
end;
{$ENDIF}

function TSubLevelNode.GetText: WideString;
begin
  if FLevel = 0 then
    Result := FSumInfo.DisplayName
  else if FLevel = 1 then
    Result := fSumInfo.fGridInfo.fFunctionDefs[integer(fFun)].DisplayName
  else if FLevel = 2 then
    Result := fSumInfo.fGridInfo.fSubFunctionDefs[integer(FSubFun)].DisplayName
  else
    Result := '';  
end;

procedure TGridInfo.RebuildColSubLevelNodes;
var
  i: integer;

  procedure ProcessLabelNode(LabelNode: TLabelNode);
  var
    SumInfoID: integer;
    SumInfo: TSummaryInfo;
    FunInfo: TFunctionInfo;
    MaxFun, Fun: TFunction;
    SubFun: TSubFunction;
    SumNode, FunNode, SubFunNode: TSubLevelNode;
  begin
    if LabelNode <> nil then FreeAndNil(LabelNode.FSubLevelNodes); 
    for SumInfoID := 0 to FSummarySettings.Count - 1 do
    begin
      SumInfo := FSummarySettings[SumInfoID];
       if SumInfo.Visible = False then Continue;
       if LabelNode <> nil then
         SumNode := LabelNode.AddSubLevelNode
       else
         begin
           SumNode := TSubLevelNode.Create(nil);
           SumNode.FLabelNode := nil;
         end;
       SumNode.FLevel := 0;
       SumNode.FSumInfo := SumInfo;
       SumNode.FSumInfoID := SumInfoID;
       FColSubLevelNodes.Add(SumNode);
       if (FLowestSubLevelNode < ltFunction) then
       begin
         FVisibleColSubLevelNodes.Add(SumNode);
         Continue;
       end;
       
       if SumInfo.Calculated then MaxFun := low(TFunction) else MaxFun := high(TFunction);
       for Fun := low(TFunction) to MaxFun do
       if SumInfo[integer(Fun)].Visible then
       begin
         FunNode := SumNode.AddChild;
         FunNode.FLevel := 1;
         FunNode.FLabelNode := LabelNode;
         FunNode.FSumInfo := SumInfo;
         FunNode.FSumInfoID := SumInfoID;
         FunNode.FFun := Fun;
         if (FLowestSubLevelNode < ltSubFunction) then
         begin
           FVisibleColSubLevelNodes.Add(FunNode);
           Continue;
         end;
         
         FunInfo := SumInfo[integer(Fun)];
         for SubFun := low(TSubFunction) to TSubFunction(FSubFunctionDefs.Count - 1) do
         if FSubFunctionDefs[integer(SubFun)].FUserAllowed then
         if FunInfo[integer(SubFun)].Visible then
         begin
           SubFunNode := FunNode.AddChild;
           SubFunNode.FLevel := 2;
           SubFunNode.FLabelNode := LabelNode;
           SubFunNode.FSumInfo := SumInfo;
           SubFunNode.FSumInfoID := SumInfoID;
           SubFunNode.FFun := FunNode.FFun;
           SubFunNode.FSubFun := SubFun;
           FVisibleColSubLevelNodes.Add(SubFunNode);
         end;
       end;
    end;
  end;

begin
  FreeAndNil(FColSubLevelNodes);
  FreeAndNil(FVisibleColSubLevelNodes);
  if not Active then EXIT;
  FColSubLevelNodes := TSubLevelNodes.Create;
  FVisibleColSubLevelNodes := TPointerArray.Create;
  if FVisibleColNodes <> nil then
    for i := 0 to FVisibleColNodes.Count - 1 do
    begin
      ProcessLabelNode(TLabelNode(FVisibleColNodes[i]));
    end
  else
    begin
      ProcessLabelNode(nil);
    end;
end;


constructor TFuncData.Create(AWidth, AHeight: integer);
begin
{$IFDEF ASPRUNTIME}
  inherited Create;
  SetLength(FArray, AWidth, AHeight);
{$ELSE}
  GetMem(FArray, AHeight * AWidth * SizeOf(TDataCell));
  FillChar(FArray^, AHeight * AWidth * SizeOf(TDataCell), 0);
{$ENDIF}
  FHeight := AHeight;
  FWidth := AWidth;
end;

{$IFNDEF ASPRUNTIME}
destructor TFuncData.Destroy;
begin
  FreeMem(FArray, FHeight * FWidth * SizeOf(TDataCell));
  inherited;
end;
{$ENDIF}

{$IFDEF ASPRUNTIME}
function TFuncData.GetItem(Col, Row: integer): PDataCell;
begin
  Result := FArray[Col, Row];
end;
{$ELSE}
function TFuncData.GetItem(Col, Row: integer): PDataCell;
type
  TDataCellArray = array[0..High(Integer) div SizeOf(TDataCell) - 1] of TDataCell;
  PDataCellArray = ^TDataCellArray;
begin
  Result := @(PDataCellArray(FArray)^[Row * FWidth + Col]);
end;
{$ENDIF}

function TGridInfo.CalcSubFunction(SumInfoID: integer; Fun: TFunction; SubFun: TSubFunction): boolean;
var
  RowCount, ColCount: integer;
  GridFunctionArray: TGridFunctionArray;
  GridSubFunctionArray: TGridSubFunctionArray;
  FuncData, SubFuncData: TFuncData;
  i: integer;
  DataCell: PDataCell;
  SumInfo: TSummaryInfo;
  SumIndex: TIntegerArray;
  Calculator: TSubFunctionCalculator;
  Args: TSubFunctionCalculatorArgs;

  procedure FunCalculateRowColNodes(Nodes: TLabelNodes);
  var
    i: integer;
    RowNode: TLabelNode;

    procedure CalculateColNodes(Nodes: TLabelNodes);
    var
      i: integer;
      ColNode: TLabelNode;
      SumIndex: TIntegerArray;
    begin
      for i := 0 to Nodes.Count - 1 do
      begin
        ColNode := TLabelNode(Nodes[i]);

        DataCell := FuncData[ColNode.TreeIndex, RowNode.TreeIndex];
        SumIndex := RowColNodes2SumIndex(RowNode, ColNode);
        DataCell.NotEmpty := SumInfo.GetAggregate(SumIndex, Fun, DataCell.Data);
        {$IFDEF ASPRUNTIME}
        FuncData[ColNode.TreeIndex, RowNode.TreeIndex] := DataCell;
        {$ENDIF}
        if ColNode.ChildNodes <> nil then CalculateColNodes(ColNode.ChildNodes);
      end;
    end;

  begin
    for i := 0 to Nodes.Count - 1 do
    begin
      RowNode := TLabelNode(Nodes[i]);
      CalculateColNodes(FColLabelNodes);
      if RowNode.ChildNodes <> nil then FunCalculateRowColNodes(RowNode.ChildNodes);
    end;
  end;

  procedure FunCalculateRowNodes(Nodes: TLabelNodes);
  var
    i: integer;
    RowNode: TLabelNode;
  begin
    for i := 0 to Nodes.Count - 1 do
    begin
      RowNode := TLabelNode(Nodes[i]);

      DataCell := FuncData[0, RowNode.TreeIndex];
      SumIndex := RowColNodes2SumIndex(RowNode, nil);
      DataCell.NotEmpty := SumInfo.GetAggregate(SumIndex, Fun, DataCell.Data);
{$IFDEF ASPRUNTIME}
      FuncData[0, RowNode.TreeIndex] := DataCell;
{$ENDIF}

      if RowNode.ChildNodes <> nil then FunCalculateRowNodes(RowNode.ChildNodes);
    end;
  end;

  procedure FunCalculateColNodes(Nodes: TLabelNodes);
  var
    i: integer;
    ColNode: TLabelNode;
  begin
    for i := 0 to Nodes.Count - 1 do
    begin
      ColNode := TLabelNode(Nodes[i]);

      DataCell := FuncData[ColNode.TreeIndex, 0];
      SumIndex := RowColNodes2SumIndex(nil, ColNode);
      DataCell.NotEmpty := SumInfo.GetAggregate(SumIndex, Fun, DataCell.Data);
{$IFDEF ASPRUNTIME}
      FuncData[ColNode.TreeIndex, 0] := DataCell;
{$ENDIF}

      if ColNode.ChildNodes <> nil then FunCalculateColNodes(ColNode.ChildNodes);
    end;
  end;

  function CommonSubFunctionCalc(CalcSubFunction: TSubFunctionCalculator): TFuncData;
  var
    RowNode, ColNode: TLabelNode;
    R: TFuncData;

    procedure DoCalcCell(ColNode, RowNode: TLabelNode);
    var
      DataCell: PDataCell;
    begin
      Args.FColLabelNode := ColNode;
      Args.FRowLabelNode := RowNode;
      if ColNode <> nil then Args.FColTreeIndex := ColNode.TreeIndex else Args.FColTreeIndex := 0;
      if RowNode <> nil then Args.FRowTreeIndex := RowNode.TreeIndex else Args.FRowTreeIndex := 0;
      Args.FSumIndex.FillWith(SubTotal);
      if RowNode <> nil then ScanFromLabelNode(RowNode, Args.FSumIndex);
      if ColNode <> nil then ScanFromLabelNode(ColNode, Args.FSumIndex);
      DataCell := R[Args.FColTreeIndex, Args.FRowTreeIndex];
      DataCell.NotEmpty := CalcSubFunction(Args, DataCell.Data);
{$IFDEF ASPRUNTIME}
      R[Args.FColTreeIndex, Args.FRowTreeIndex] := DataCell;
{$ENDIF}
    end;

    procedure ProcessColRowNodes(Nodes: TlabelNodes);
    var
      i: integer;

      procedure ProcessRowNodes(Nodes: TlabelNodes);
      var
        i: integer;
      begin
        for i := 0 to Nodes.Count - 1 do
        begin
          RowNode := TLabelNode(Nodes[i]);
          DoCalcCell(ColNode, RowNode);
          if RowNode.ChildNodes <> nil then ProcessRowNodes(RowNode.ChildNodes);
        end;
      end;

    begin
      for i := 0 to Nodes.Count - 1 do
      begin
        ColNode := TLabelNode(Nodes[i]);
        ProcessRowNodes(FRowLabelNodes);
        if ColNode.ChildNodes <> nil then ProcessColRowNodes(ColNode.ChildNodes);
      end;
    end;

    procedure ProcessRowNodes(Nodes: TlabelNodes);
    var
      i: integer;
    begin
      for i := 0 to Nodes.Count - 1 do
      begin
        RowNode := TLabelNode(Nodes[i]);
        DoCalcCell(nil, RowNode);
        if RowNode.ChildNodes <> nil then ProcessRowNodes(RowNode.ChildNodes);
      end;
    end;

    procedure ProcessColNodes(Nodes: TlabelNodes);
    var
      i: integer;
    begin
      for i := 0 to Nodes.Count - 1 do
      begin
        ColNode := TLabelNode(Nodes[i]);
        DoCalcCell(ColNode, nil);
        if ColNode.ChildNodes <> nil then ProcessColNodes(ColNode.ChildNodes);
      end;
    end;

  begin
    R := TFuncData.Create(ColCount, RowCount);
    Args.FFunctionData := FuncData;
    Args.FSumInfoID := SumInfoID;
    Args.FSumInfo := SumInfo;
    Args.FFun := Fun;
    if (FColLabelNodes <> nil) and (FRowLabelNodes <> nil) then
      ProcessColRowNodes(FColLabelNodes)
    else if FRowLabelNodes <> nil then
      ProcessRowNodes(FRowLabelNodes)
    else if FColLabelNodes <> nil then
      ProcessColNodes(FColLabelNodes)
    else
      DoCalcCell(nil, nil);
    Result := R;
  end;

begin
  Result := false;
  if FGridSummaryArray = nil then EXIT;

  if (FVisibleRowNodes <> nil) and (FVisibleRowNodes.Count > 0) then
    RowCount := FRowLabelNodes.NodeCount
  else
    RowCount := 1;

  if (FVisibleColNodes <> nil) and (FVisibleColNodes.Count > 0) then
    ColCount := FColLabelNodes.NodeCount
  else
    ColCount := 1;
  i := FGridSummaryArray.FSumInfoIDs.IndexOf(SumInfoID);
  SumInfo := FSummarySettings[SumInfoID];
  if i < 0 then EXIT;
  GridFunctionArray := TGridFunctionArray(FGridSummaryArray.FGridFunctionList[i]);
  
  i := GridFunctionArray.FFunctions.IndexOf(integer(Fun));
  if i < 0 then EXIT;
  FuncData := TFuncData(GridFunctionArray.FFuncDataList[i]);
  if FuncData = nil then
  begin
    FuncData := TFuncData.Create(ColCount, RowCount);
    GridFunctionArray.FFuncDataList[i] := FuncData;
    if (FRowLabelNodes <> nil) and (FColLabelNodes <> nil) then
      FunCalculateRowColNodes(FRowLabelNodes)
    else if FRowLabelNodes <> nil then
      FunCalculateRowNodes(FRowLabelNodes)
    else if FColLabelNodes <> nil then
      FunCalculateColNodes(FColLabelNodes)
    else
      begin
        DataCell := FuncData[0, 0];
        SumIndex := RowColNodes2SumIndex(nil, nil);
        DataCell.NotEmpty := SumInfo.GetAggregate(SumIndex, Fun, DataCell.Data);
{$IFDEF ASPRUNTIME}
      FuncData[0, 0] := DataCell;
{$ENDIF}
      end;
  end;

  Calculator := GetStandardSubFunctionCalculator(SubFun);
  if assigned(FOnGetSubFunctionCalculator) then FOnGetSubFunctionCalculator({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, SubFun, Calculator);
  
  if assigned(Calculator) then
    begin
      Args := TSubFunctionCalculatorArgs.Create(Self);
      try
        SubFuncData := CommonSubFunctionCalc(Calculator)
      finally
        FreeAndNil(Args);
      end;
    end
  else
    SubFuncData := nil;

  GridSubFunctionArray := TGridSubFunctionArray(GridFunctionArray.FGridSubFunctinList[i]);
  i := GridSubFunctionArray.FSubFunctions.IndexOf(integer(SubFun));
  if i >= 0 then
    begin
      TObject(GridSubFunctionArray.FFuncDataList[i]).Free;
      GridSubFunctionArray.FFuncDataList[i] := SubFuncData;
    end
  else
    begin
      i := GridSubFunctionArray.FSubFunctions.Add(integer(SubFun));
      GridSubFunctionArray.FFuncDataList.InsertAt(i, SubFuncData);
    end;
  Result := True;  
end;

procedure TGridInfo.RebuildGridSummaryArray;
var
  SumInfoID: integer;
  SumInfo: TSummaryInfo;
  FunInfo: TFunctionInfo;
  Fun, MaxFun: TFunction;
  SubFun: TSubFunction;
  GridFunctionArray: TGridFunctionArray;
  GridSubFunctionArray: TGridSubFunctionArray;
  n: integer;
begin
  FreeAndNil(FGridSummaryArray);
  if Active = False then EXIT;
  FGridSummaryArray := TGridSummaryArray.Create(Self);

  n := 0;
  for SumInfoID := 0 to FSummarySettings.Count - 1 do
  begin
    SumInfo := FSummarySettings[SumInfoID];
    if SumInfo.Visible = False then Continue;

    GridFunctionArray := TGridFunctionArray.Create;
    FGridSummaryArray.FSumInfoIDs.Add(SumInfoID);
    FGridSummaryArray.FGridFunctionList.Add(GridFunctionArray);
    if SumInfo.Calculated then
      MaxFun := low(TFunction)
    else
      MaxFun := high(TFunction);

    for Fun := low(TFunction) to MaxFun do
    if SumInfo[integer(Fun)].Visible then
    begin
      GridSubFunctionArray := TGridSubFunctionArray.Create;
      GridFunctionArray.FFunctions.Add(integer(Fun));
      GridFunctionArray.FFuncDataList.Add(nil);
      GridFunctionArray.FGridSubFunctinList.Add(GridSubFunctionArray);

      FunInfo := SumInfo[integer(Fun)];
      for SubFun := low(TSubFunction) to TSubFunction(FSubFunctionDefs.Count - 1) do
      if FSubFunctionDefs[integer(SubFun)].FUserAllowed then
      if FunInfo[integer(SubFun)].Visible then
      begin
        inc(n);
        if (FLowestSubLevelNode < ltSubFunction) then
        begin
          FSubFunctionDisplayed := SubFun;
          BREAK;
        end;
      end;

      if (FLowestSubLevelNode < ltFunction) then
      begin
        FFunctionDisplayed := Fun;
        BREAK;
      end;
    end;
  end; 
  FGridColsOnValue := n;
end;

{$IFNDEF ASPRUNTIME}
function TSubLevelNodes.FindNodeXY(X, Y: integer): TSubLevelNode;

  function ProcessNodes(Nodes: TSubLevelNodes): TSubLevelNode;
  var
    i: integer;
    Node: TSubLevelNode;
    R: TRect;
  begin
    Result := nil;
    for i := 0 to Nodes.Count - 1 do
    begin
      Node := TSubLevelNode(Nodes[i]);
      R := Node.Rect;
      if ((X >= R.Left) and (X <= R.Right) and (Y >= R.Top) and (Y <= R.Bottom)) then
        Result := Node
      else
        begin
          if Node.ChildNodes <> nil then Result := ProcessNodes(Node.ChildNodes);
        end;
      if Result <> nil then BREAK;
    end;
  end;

begin
  Result := nil; 
  if Self <> nil then  Result := ProcessNodes(Self);
end;
{$ENDIF}


constructor TGridSummaryArray.Create(AGridInfo: TGridInfo);
begin
{$IFDEF ASPRUNTIME}
  inherited Create;
{$ENDIF}
  FGridInfo := AGridInfo;
  FSumInfoIDs := TIntegerArray.Create;
  FGridFunctionList := TObjectArray.Create;
end;

{$IFNDEF ASPRUNTIME}
destructor TGridSummaryArray.Destroy;
begin
  FGridFunctionList.Free;
  FSumInfoIDs.Free;
  inherited;
end;
{$ENDIF}

function TGridSummaryArray.GetData1(Row, Col, SumInfoID: integer; Fun: TFunction; SubFun: TSubFunction; out Res: Double): boolean;
var
  FuncData: TFuncData;
  DataCell: PDataCell;
  Node: TLabelNode;
  SumInfo: TSummaryInfo;
label
  FunctionValue;
begin
  if SubFun = sstValue then goto FunctionValue;
  FuncData := GetFuncData(SumInfoID, Fun, SubFun);
  if FuncData = nil then
  begin
    FGridInfo.CalcSubFunction(SumInfoID, Fun, SubFun);
    FuncData := GetFuncData(SumInfoID, Fun, SubFun);
  end;
  if FuncData = nil then goto FunctionValue;

  if FGridInfo.FVisibleRowNodes <> nil then Node := TLabelNode(FGridInfo.FVisibleRowNodes[Row]) else Node := nil;
  if Node <> nil then Row := Node.TreeIndex else Row := 0;
  if FGridInfo.FVisibleColNodes <> nil then Node := TLabelNode(FGridInfo.FVisibleColNodes[Col]) else Node := nil;
  if Node <> nil then Col := Node.TreeIndex else Col := 0;

  DataCell := FuncData[Col, Row];
  Result := DataCell.NotEmpty;
  if Result then  Res := DataCell.Data;
  EXIT;

FunctionValue:
  SumInfo := fGridInfo.fSummarySettings[SumInfoID];
  Result := SumInfo.GetAggregate(FGridInfo.RowCol2SumIndex(Row, Col), Fun, Res);
end;

function TGridSummaryArray.GetData2(RowNode, ColNode: TLabelNode; SumInfoID: integer; Fun: TFunction; SubFun: TSubFunction; out Res: Double): boolean;
var
  FuncData: TFuncData;
  DataCell: PDataCell;
  RowID, ColID: integer;
  SumInfo: TSummaryInfo;
label
  FunctionValue;
begin
  if SubFun = sstValue then goto FunctionValue;
  FuncData := GetFuncData(SumInfoID, Fun, SubFun);
  if FuncData = nil then
  begin
    FGridInfo.CalcSubFunction(SumInfoID, Fun, SubFun);
    FuncData := GetFuncData(SumInfoID, Fun, SubFun);
  end;
  if FuncData = nil then goto FunctionValue;

  if RowNode <> nil then RowID := RowNode.TreeIndex else RowID := 0;
  if ColNode <> nil then ColID := ColNode.TreeIndex else ColID := 0;

  DataCell := FuncData[ColID, RowID];
  Result := DataCell.NotEmpty;
  if Result then Res := DataCell.Data;
  EXIT;

FunctionValue:
  SumInfo := fGridInfo.fSummarySettings[SumInfoID];
  Result := SumInfo.GetAggregate(FGridInfo.RowColNodes2SumIndex(RowNode, ColNode), Fun, Res);
end;

function TGridSummaryArray.GetFuncData(SumInfoID: integer; Fun: TFunction; SubFun: TSubFunction): TFuncData;
var
  Index: integer;
  GridFunctionArray: TGridFunctionArray;
  GridSubFunctionArray: TGridSubFunctionArray;
begin
  Result := nil;
  Index := FSumInfoIDs.IndexOf(SumInfoID);
  if Index >= 0 then
  begin
    GridFunctionArray := TGridFunctionArray(FGridFunctionList[Index]);
    Index := GridFunctionArray.FFunctions.IndexOf(Integer(Fun));
    if Index >= 0 then
    begin
      if SubFun = sstValue then
        Result := TFuncData(GridFunctionArray.FFuncDataList[Index])
      else
        begin
          GridSubFunctionArray := TGridSubFunctionArray(GridFunctionArray.FGridSubFunctinList[Index]);
          Index := GridSubFunctionArray.FSubFunctions.IndexOf(Integer(SubFun));
          if Index >= 0 then
            Result := TFuncData(GridSubFunctionArray.FFuncDataList[Index]);
        end;
    end;
  end;
end;


constructor TGridFunctionArray.Create;
begin
{$IFDEF ASPRUNTIME}
  inherited Create;
{$ENDIF}
  FFunctions := TIntegerArray.Create;
  FFuncDataList := TObjectArray.Create;
  FGridSubFunctinList := TObjectArray.Create;
end;

{$IFNDEF ASPRUNTIME}
destructor TGridFunctionArray.Destroy;
begin
  FGridSubFunctinList.Free;
  FFuncDataList.Free;
  FFunctions.Free;
  inherited;
end;
{$ENDIF}


constructor TGridSubFunctionArray.Create;
begin
{$IFDEF ASPRUNTIME}
  inherited Create;
{$ENDIF}
  FSubFunctions := TIntegerArray.Create;
  FFuncDataList := TObjectArray.Create;
end;

{$IFNDEF ASPRUNTIME}
destructor TGridSubFunctionArray.Destroy;
begin
  FFuncDataList.Free;
  FSubFunctions.Free;
  inherited;
end;
{$ENDIF}

procedure TGridInfo.ChangeSummarySettings(SumCountChanged: boolean);
begin
  if SumCountChanged then
    begin
      SetupSummaryData;
    end
  else
    begin
      BeginChange;
      EndChange(gePivot, 0);
    end;
end;


procedure TValueSortData.Assign(Source: TPersistent);
begin
  if Source is TValueSortData then
    begin
      FNodeID.Assign(TValueSortData(Source).FNodeID);
      FSumFieldName := TValueSortData(Source).FSumFieldName;
      FSubFun := TValueSortData(Source).FSubFun;
      FFun := TValueSortData(Source).FFun;
      FSortType := TValueSortData(Source).FSortType;
    end
  else
    inherited;
end;

constructor TValueSortData.Create;
begin
  {$IFDEF ASPRUNTIME}
  inherited Create;
  {$ENDIF}
  FNodeID := TIntegerArray.Create;
  FSortType := soNone;
end;

{$IFNDEF ASPRUNTIME}
destructor TValueSortData.Destroy;
begin
  FNodeID.Free;
  inherited;
end;
{$ENDIF}

function TValueSortData.FindVisibleSubLevelNode(VisibleSubLevelNodes: TPointerArray): integer;
var
  i: integer;
  Node: TSubLevelNode;
begin
  Result := -1;
  if VisibleSubLevelNodes = nil then EXIT;
  for i := 0 to VisibleSubLevelNodes.Count - 1 do
  begin
    Node := TSubLevelNode(VisibleSubLevelNodes[i]);
    if (Node.SubFun = FSubFun) and (Node.Fun = FFun) and WideSameText(Node.SumInfo.FieldName, FSumFieldName) and ThisLabelNode(Node.LabelNode) then
    begin
      Result := i;
      EXIT;
    end;
  end;
end;

procedure TValueSortData.ReadStream(Stream: TStream);
var
  Tag: word;
begin
  CheckTag(Stream, tgValueSortData);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgValueSortData_NodeID:   ReadStreamedObject(Stream, FNodeID);
      tgValueSortData_SumFieldName:  FSumFieldName := ReadWideString(Stream);
      tgValueSortData_Fun: FFun := TFunction(xhStream.ReadByte(Stream));
      tgValueSortData_SubFun: FSubFun := TSubFunction(xhStream.ReadByte(Stream));
      tgValueSortData_SortType: FSortType := TValueSortType(xhStream.ReadByte(Stream));
      tgValueSortData_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

procedure TValueSortData.ResetLabelNode;
begin
  FNodeID.Count := 0;
end;

procedure TValueSortData.SaveLabelNode(Node: TLabelNode);
begin
  if Node = nil then
    FNodeID.Count := 0
  else
    begin
      FNodeID.Count := Node.DimOffset + 1;
      while Node <> nil do
      begin
        FNodeID[Node.DimOffset] := Node.Value;
        Node := Node.FParent;
      end;
    end;
end;

function TValueSortData.StreamSize: integer;
begin
  Result := TagSize * 5 + StreamedObjectSize(FNodeID) + ByteSize * 3;
  if FSumFieldName <> '' then inc(Result, TagSize + WideStringSize(FSumFieldName));
end;

function TValueSortData.ThisLabelNode(Node: TLabelNode): boolean;
begin
  if Node = nil then
    Result := (FNodeID.Count = 0)
  else
    begin
      Result := True;
      while Node <> nil do
      begin
        if Node.DimOffset > FNodeID.Count - 1 then
        begin
          Result := False;
          EXIT;
        end;
        if Node.Value <> FNodeID[Node.DimOffset] then
        begin
          Result := False;
          EXIT;
        end;
        Node := Node.FParent;
      end;
    end;
end;

procedure TGridInfo.RebuildVisibleDimIDs;
var
  i, M: integer;

  procedure DoRebuild(LabelNodes: TLabelNodes; DimIDs: TIntegerArray);
  var
    i, C: integer;
    N: TLabelNode;
  begin
    for i := 0 to LabelNodes.Count - 1 do
    begin
      N := TLabelNode(LabelNodes[i]);
      if N.ChildNodes <> nil then DoRebuild(N.ChildNodes, DimIDs);
      C := DimIDs.IndexOf(N.DimID);
      if C > M then M := C;
    end;
  end;

begin
  FreeAndNil(FVisibleRowDimIDs);
  if FRowLabelNodes <> nil then
  begin
    M := 0;
    DoRebuild(FRowLabelNodes, FRowDimIDs);
    FVisibleRowDimIDs := TIntegerArray.CreateCount(M + 1);
    for i := 0 to M do FVisibleRowDimIDs[i] := FRowDimIDs[i];
  end;

  FreeAndNil(FVisibleColDimIDs);
  if FColLabelNodes <> nil then
  begin
    M := 0;
    DoRebuild(FColLabelNodes, FColDimIDs);
    FVisibleColDimIDs := TIntegerArray.CreateCount(M + 1);
    for i := 0 to M do FVisibleColDimIDs[i] := FColDimIDs[i];
  end;
end;

function TGridInfo.RowCol2SumIndex(ARow, ACol: integer): TIntegerArray;
var
  RowLabelNode: TLabelNode;
  ColSubLevelNode: TSubLevelNode;
begin
  if FVisibleRowNodes <> nil then RowLabelNode := TLabelNode(FVisibleRowNodes[ARow]) else RowLabelNode := nil;
  if FVisibleColSubLevelNodes <> nil then ColSubLevelNode := TSubLevelNode(FVisibleColSubLevelNodes[ACol]) else ColSubLevelNode := nil;
  if ColSubLevelNode = nil then
    Result := RowColNodes2SumIndex(RowLabelNode, nil)
  else
    Result := RowColNodes2SumIndex(RowLabelNode, ColSubLevelNode.LabelNode)
end;

function TGridInfo.RowCol2SumIndex(ARow, ACol: integer; out SumInfoID: integer; out Fun: TFunction; out SubFun: TSubFunction): TIntegerArray;
begin
  Col2SumFun(ACol, SumInfoID, Fun, SubFun);
  Result := RowCol2SumIndex(ARow, ACol);
end;

procedure TValueSortData.WriteStream(Stream: TStream);
begin
  with Stream do
  begin
    WriteTag(Stream, tgValueSortData);

    WriteStreamedObject(Stream, FNodeID, tgValueSortData_NodeID);

    if FSumFieldName <> '' then
    begin
      WriteTag(Stream, tgValueSortData_SumFieldName);
      WriteWideString(Stream, FSumFieldName);
    end;

    WriteTag(Stream, tgValueSortData_Fun);
    WriteByte(Stream, byte(FFun));

    WriteTag(Stream, tgValueSortData_SubFun);
    WriteByte(Stream, byte(FSubFun));

    WriteTag(Stream, tgValueSortData_SortType);
    WriteByte(Stream, byte(FSortType));

    WriteTag(Stream, tgValueSortData_EOT);
  end;
end;


procedure TOpenDimNodes.ReadStream(Stream: TStream);
var
  Tag: word;
  ACount, i: integer;
  OpenDimNode: TOpenDimNode;
begin
  CheckTag(Stream, tgBaseArray);
  ACount := 0;
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgBaseArray_Count: ACount := ReadInteger(Stream);
      tgBaseArray_ArrayData:
        begin
          Count := ACount;
          for i := 0 to ACount - 1 do
          begin
            OpenDimNode := TOpenDimNode.Create(nil);
            OpenDimNode.ReadStream(Stream);
{$IFDEF ASPRUNTIME}
            Self[i] := OpenDimNode;
{$ELSE}
            PPntrArray(ArrayPointer)^[i] := OpenDimNode;
{$ENDIF}
          end;
        end;
      tgBaseArray_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

procedure TOpenDimNodes.SaveLabelNodes(LabelNodes: TLabelNodes);

  procedure Process(Nodes: TLabelNodes; OpenDimNodes: TOpenDimNodes; AParent: TOpenDimNode);
  var
    i: integer;
    LabelNode: TLabelNode;
    Node: TOpenDimNode;
  begin
    if Nodes <> nil then
    for i := 0 to Nodes.Count - 1 do
    begin
      LabelNode := TLabelNode(Nodes[i]);
      if LabelNode.Expanded then
      begin
        Node := TOpenDimNode.Create(nil);
        Node.FParent := AParent;
        Node.FValue := LabelNode.Value;
        Node.FQualifiedNameHash := LabelNode.FQualifiedNameHashCode;
        Node.FLevel := LabelNode.DimOffset + 1;
        Node.FDimID := LabelNode.DimID;
        Node.FHier := LabelNode.HierExpanded;
        OpenDimNodes.Add(Node);
        if LabelNode.ChildNodes <> nil then
        begin
          Node.FChildNodes := TOpenDimNodes.Create;
          Process(LabelNode.ChildNodes, Node.FChildNodes, Node);
        end;
      end;
    end;
  end;

begin
  Clear;
  Process(LabelNodes, Self, nil);
end;


function TOpenDimNode.AddChild: TOpenDimNode;
begin
  Result := TOpenDimNode.Create(Self);
  if FChildNodes = nil then FChildNodes := TOpenDimNodes.Create;
  FChildNodes.Add(Result);
end;

constructor TOpenDimNode.Create(AParent: TOpenDimNode);
begin
{$IFDEF ASPRUNTIME}
  inherited Create;
{$ENDIF}
  FParent := AParent;
  FUseQualifiedNameHash := True;  
end;

{$IFNDEF ASPRUNTIME}
destructor TOpenDimNode.Destroy;
begin
  FreeAndNil(FChildNodes);
  inherited;
end;
{$ENDIF}

procedure TGridInfo.RestoreLabelNodes(DimGroup: TDimGroup; OpenDimNodes: TOpenDimNodes);
var
  RootLabelNodes: TLabelNodes;
  DimIDs: TIntegerArray;

  function LocateOpenNode(OpenDimNode: TOpenDimNode; LabelNodes: TLabelNodes): TLabelNode;
  var
    Node: TLabelNode;
    i: integer;
    Same: boolean;
  begin
    Result := nil;
    if (LabelNodes = nil) or (LabelNodes.Count = 0) then EXIT;
    Node := TLabelNode(LabelNodes[0]);
    if OpenDimNode.DimID <> Node.DimID then EXIT;
    for i := 0 to LabelNodes.Count - 1 do
    begin
      Node := TLabelNode(LabelNodes[i]);
      if Node.IsSubTotal then Continue;
      if OpenDimNode.FUseQualifiedNameHash then
        Same := (Node.FQualifiedNameHashCode = OpenDimNode.QualifiedNameHash)
      else
        Same := (Node.Value = OpenDimNode.Value);
      if Same then
      begin
        Result := Node;
        EXIT;
      end;
    end;
  end;

  procedure Process(Nodes: TOpenDimNodes; LabelNodes: TLabelNodes);
  var
    OpenDimNode: TOpenDimNode;
    LabelNode: TLabelNode;
    i: integer;
  begin
    if Nodes <> nil then
    for i := 0 to Nodes.Count - 1 do
    begin
      OpenDimNode := TOpenDimNode(Nodes[i]);
      LabelNode := LocateOpenNode(OpenDimNode, LabelNodes);
      if LabelNode <> nil then
      begin
        if OpenDimNode.FHier then
          DoExpandHierLabelNode(LabelNode, DimIDs)
        else
          DoExpandLabelNode(LabelNode, DimIDs);
        if (OpenDimNode.ChildNodes <> nil) and (LabelNode.ChildNodes <> nil) then
          Process(OpenDimNode.ChildNodes, LabelNode.ChildNodes);
      end;
    end;
  end;

begin
  if DimGroup = dgRow then
    begin
      DimIDs := FRowDimIDs;
      RootLabelNodes := FRowLabelNodes;
    end
  else
    begin
      DimIDs := FColDimIDs;
      RootLabelNodes := FColLabelNodes;
    end;
  Process(OpenDimNodes, RootLabelNodes);
end;

procedure TOpenDimNode.ReadStream(Stream: TStream);
var
  Tag: word;
  i: integer;
begin
  FUseQualifiedNameHash := False;
  CheckTag(Stream, tgOpenDimNode);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgOpenDimNode_Value: FValue := ReadInteger(Stream);
      tgOpenDimNode_QualifiedNameHash:
        begin
          FQualifiedNameHash := ReadInteger(Stream);
          FUseQualifiedNameHash := True;
        end;
      tgOpenDimNode_Level: FLevel := ReadInteger(Stream);
      tgOpenDimNode_DimID: FDimID := ReadInteger(Stream);
      tgOpenDimNode_Hier: FHier := ReadBoolean(Stream);
      tgOpenDimNode_ChildNodes:
        begin
          FreeAndNil(FChildNodes);
          FChildNodes := TOpenDimNodes.Create;
          ReadStreamedObject(Stream, FChildNodes);
          for i := 0 to FChildNodes.Count - 1 do TOpenDimNode(FChildNodes[i]).FParent := Self;
        end;
      tgOpenDimNode_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

function TOpenDimNode.StreamSize: integer;
begin
  Result := tagSize * 3 + StreamedObjectSize(FChildNodes) + IntegerSize(FQualifiedNameHash);
  if FLevel <> 0 then inc(Result, TagSize + IntegerSize(FLevel));
  if FDimID <> 0 then inc(Result, TagSize + IntegerSize(FDimID));
  if FHier <> False then inc(Result, TagSize + BooleanSize);
end;

procedure TOpenDimNode.WriteStream(Stream: TStream);
begin
  with Stream do
  begin
    WriteTag(Stream, tgOpenDimNode);

    WriteTag(Stream, tgOpenDimNode_QualifiedNameHash);
    WriteInteger(Stream, FQualifiedNameHash);
    if FLevel <> 0 then
    begin
      WriteTag(Stream, tgOpenDimNode_Level);
      WriteInteger(Stream, FLevel);
    end;

    if FDimID <> 0 then
    begin
      WriteTag(Stream, tgOpenDimNode_DimID);
      WriteInteger(Stream, FDimID);
    end;

    if FHier <> False then
    begin
      WriteTag(Stream, tgOpenDimNode_Hier);
      WriteBoolean(Stream, FHier);
    end;

    WriteStreamedObject(Stream, FChildNodes, tgOpenDimNode_ChildNodes);

    WriteTag(Stream, tgOpenDimNode_EOT);
  end;
end;

{$IFNDEF ASPRUNTIME}

function TColoredCells.FindColRowItem(Col, Row: integer): PColoredCoord; register;
asm
    push    dword ptr [EAX + TBaseArray.FArrayPointer]
    push    ECX
    push    EDX
    call    TInt64Array.IndexOf
    pop     EDX
    or      EAX, EAX
    js      @@notFound
    lea     EAX, [EDX + EAX * TYPE Int64]
    ret
@@notFound:
    xor     EAX, EAX
end;

function TColoredCells.GetItem(Index: integer): PColoredCoord; register;
asm
    mov   EAX, [EAX + TBaseArray.FArrayPointer]
    lea   EAX, [EAX + EDX * TYPE Int64]
end;
{$ENDIF}

procedure TGridInfo.HideMembersBelow(LabelNode: TLabelNode);
var
  LabelNodes: TLabelNodes;
  Index, i: integer;
  DimensionState: TDimensionState;
begin
  if LabelNode.IsSubTotal then LabelNode := LabelNode.Parent;
  if LabelNode = nil then EXIT;
  LabelNodes := LabelNode.LabelNodes;
  Index := LabelNode.FIndex;
  DimensionState := LabelNode.DimState;
  FDimensionStates.BeginUpdate;
  for i := Index + 1 to LabelNodes.Count - 1 do
  begin
    LabelNode := TLabelNode(LabelNodes[i]);
    if not LabelNode.IsSubTotal then
      DimensionState.Visible[LabelNode.Value] := False;
  end;
  FDimensionStates.EndUpdate;
end;

procedure TGridInfo.GroupMembersBelow(LabelNode: TLabelNode; GroupIndex: integer);
var
  LabelNodes: TLabelNodes;
  Index, i: integer;
  DimensionState: TDimensionState;
  changed: boolean;
begin
  if LabelNode.IsSubTotal then LabelNode := LabelNode.Parent;
  if LabelNode = nil then EXIT;
  LabelNodes := LabelNode.LabelNodes;
  Index := LabelNode.FIndex;
  DimensionState := TDimensionState(FDimensionStates[LabelNode.DimID]);
  changed := False;
  for i := Index + 1 to LabelNodes.Count - 1 do
  begin
    LabelNode := TLabelNode(LabelNodes[i]);
    if not (LabelNode.IsSubTotal or LabelNode.BelongsToGroup) then
      changed := DimensionState.DoMove2Group(LabelNode.Value, GroupIndex) or changed;
  end;
  if changed then
  begin
    DimensionState.RebuildMembers(False);
    DimensionState.RegisterChange(dctGrouped);
  end;
end;

procedure TGridInfo.MoveToGroup(LabelNode: TLabelNode; GroupIndex: integer);
begin
  if LabelNode = nil then EXIT;
  if LabelNode.IsSubTotal then LabelNode := LabelNode.Parent;
  if LabelNode = nil then EXIT;
  if LabelNode.BelongsToGroup then EXIT;
  LabelNode.DimState.MoveToGroup(LabelNode.Value, GroupIndex);
end;

procedure TCustomHierCube.WriteStream(Stream: TStream; SaveFactTable: boolean);
begin
  if not Active then raise ECubeError.Create(GetResStr('xhCantSaveInactiveCube', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhCantSaveInactiveCube));
  with Stream do
  begin
    WriteTag(Stream, tgHierCube);


    WriteTag(Stream, tgHierCube_Version);
    WriteInteger(Stream, FVersionNumber);
    
    WriteStreamedObject(Stream, FDimensions, tgHierCube_Dimensions);

    WriteStreamedObject(Stream, FSummaries, tgHierCube_Summaries);

    if SaveFactTable then
    begin
      {$IFDEF ASPRUNTIME}
      CheckFactTablePresence;
      {$ENDIF}
      WriteStreamedObject(Stream, FFactTable, tgHierCube_FactTable);
    end;

    WriteTag(Stream, tgHierCube_EOT);
  end;
end;

procedure TCustomHierCube.ReadStream(Stream: TStream);
var
  Tag: word;
  Version: integer;
begin
  CheckTag(Stream, tgHierCube);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgHierCube_Version:
        begin
          Version := ReadInteger(Stream);
          if not StreamVersionSupported(Version) then
            raise ECubeError.Create(GetResStr('xhStreamVersionError', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhStreamVersionError));
        end;
      tgHierCube_Dimensions:
        begin
          FDimensions.Free;
          FDimensions := TDimensions.Create;
          ReadStreamedObject(Stream, FDimensions);
        end;
      tgHierCube_Summaries:
        begin
          FSummaries.Free;
          FSummaries := TSummaries.Create;
          ReadStreamedObject(Stream, FSummaries);
        end;
      tgHierCube_FactTable:
        begin
          FFactTable.Free;
          FFactTable := TFactTable.Create(FDimensions.Count, FSummaries.Count);
          ReadStreamedObject(Stream, FFactTable);
        end;
      tgHierCube_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

procedure TGridInfo.DoSwapDimIDs(DimState1, DimState2: TDimensionState; out PageAreaChanged: boolean);
var
  DimIDs1, DimIDs2: TIntegerArray;
  Index1, Index2, tmp: integer;
  tmpDimGroup: TDimGroup;
begin
  PageAreaChanged := False;
  case DimState1.DimGroup of
    dgRow: DimIDs1 := FRowDimIDs;
    dgCol: DimIDs1 := FColDimIDs;
    dgPage: DimIDs1 := FPageDimIDs;
  else
    DimIDs1 := nil;
  end;
  case DimState2.DimGroup of
    dgRow: DimIDs2 := FRowDimIDs;
    dgCol: DimIDs2 := FColDimIDs;
    dgPage: DimIDs2 := FPageDimIDs;
  else
    DimIDs2 := nil;
  end;
  if (DimIDs1 = nil) or (DimIDs2 = nil) then EXIT;
  Index1 := DimIDs1.IndexOf(DimState1.DimID);
  Index2 := DimIDs2.IndexOf(DimState2.DimID);
  if (Index1 < 0) or (Index2 < 0) then EXIT;
  if (DimIDs1 = DimIDs2) and (Index1 = Index2) then EXIT;
  if DimState1.FDimGroup = dgPage then CheckNewDimension(DimState2.DimID, DimState1.DimID);
  if DimState2.FDimGroup = dgPage then CheckNewDimension(DimState1.DimID, DimState2.DimID);
  tmp := DimIDs1[Index1];
  DimIDs1[Index1] := DimIDs2[Index2];
  DimIDs2[Index2] := tmp;
  PageAreaChanged := (DimState1.FDimGroup = dgPage) or (DimState2.FDimGroup = dgPage);
  tmpDimGroup := DimState1.FDimGroup;
  DimState1.FDimGroup := DimState2.FDimGroup;
  DimState2.FDimGroup := tmpDimGroup;
end;

procedure TGridInfo.DoMoveDim(DimID: integer; NewDimGroup: TDimGroup; NewIndex: integer; out PageAreaChanged: boolean);
var
  DimIDs, DimIDs2: TIntegerArray;
  DimState: TDimensionState;
  Index: integer;
begin
  PageAreaChanged := False;

  case NewDimGroup of
    dgRow: DimIDs2 := FRowDimIDs;
    dgCol: DimIDs2 := FColDimIDs;
    dgPage: DimIDs2 := FPageDimIDs;
  else
    DimIDs2 := nil;
  end;

  DimState := TDimensionState(FDimensionStates[DimID]);
  case DimState.DimGroup of
    dgRow: DimIDs := FRowDimIDs;
    dgCol: DimIDs := FColDimIDs;
    dgPage: DimIDs := FPageDimIDs;
  else
    DimIDs := nil;
  end;
  if DimIDs = nil then EXIT;
  Index := DimIDs.IndexOf(DimID);
  if Index < 0 then EXIT;

  if DimIDs <> DimIDs2 then
    begin
      if  DimState.DimGroup = dgPage then   CheckNewDimension(-1, DimID);
      if NewIndex > DimIDs2.Count then NewIndex := DimIDs2.Count;
      DimIDs2.InsertAt(NewIndex, DimIDs[Index]);
      DimIDs.Delete(Index);
      PageAreaChanged := (DimState.DimGroup = dgPage) or (NewDimGroup = dgPage);
      DimState.FDimGroup := NewDimGroup;
    end
  else
    begin
      if NewIndex > DimIDs.Count then NewIndex := DimIDs.Count;
      if Index < NewIndex then
        begin
          DimIDs.InsertAt(NewIndex, DimIDs[Index]);
          DimIDs.Delete(Index);
        end
      else
        begin
          DimIDs.InsertAt(NewIndex, DimIDs[Index]);
          DimIDs.Delete(Index + 1);
        end;
    end;
end;

procedure TGridInfo.RecalcNodeOffsets(const DimIDs: TIntegerArray; const Nodes: TLabelNodes);
var
  Node: TLabelNode;
  Index, DimID, DimOffset: integer;
begin
  if Nodes.Count = 0 then EXIT;
  Node := TLabelNode(Nodes[0]);
  if Node.Parent = nil then
    DimOffset := 0
  else
    begin
      DimOffset := Node.DimLevel - 1;
      Index := 0;
      while (Index < DimIDs.Count) do
      begin
        DimID := DimIDs[Index];
        if DimID = Node.DimID then BREAK;
        DimOffset := DimOffset + TDimensionState(FDimensionStates[DimID]).OpenLevels;
        inc(Index);
      end;
    end;
  for Index := 0 to Nodes.Count - 1 do
  begin
    Node := TLabelNode(Nodes[Index]);
    Node.FDimOffset := DimOffset;
    if Node.ChildNodes <> nil then RecalcNodeOffsets(DimIDs, Node.ChildNodes);
  end;
end;

procedure TCustomHierCube.UndefineField(const FieldName: WideString);
var
  DimSum: TDimSum;
begin
  DimSum := DimensionMap.FindItem(FieldName);
  if DimSum <> nil then UndefineField(DimSum);
end;


function TPivotStates.Add(const Name: WideString): TPivotState;
begin
  Result := TPivotState.Create;
  inherited Add(Result);
  FNames.Add(Name);
end;

procedure TPivotStates.Clear;
begin
  FNames.Clear;
  inherited;
end;

constructor TPivotStates.Create(AGridInfo: TGridInfo);
begin
  inherited Create;
  FGridInfo := AGridInfo;
  FNames := TWideStringArray.Create;
end;

function TPivotStates.Delete(const Name: WideString): boolean;
var
  Index: integer;
begin
  Result := False;
  Index := FNames.IndexOf(Name);
  if Index >= 0 then
  begin
    FNames.Delete(Index);
    TObject(Items[Index]).Free;
    inherited Delete(Index);
    Result := True;
  end;
end;

{$IFNDEF ASPRUNTIME}
destructor TPivotStates.Destroy;
begin
  inherited Destroy;
  FNames.Free;
end;
{$ENDIF}

function TPivotStates.FindState(const Name: WideString): integer;
begin
  Result := FNames.IndexOf(Name);
end;

procedure TPivotStates.ReadStream(Stream: TStream);
var
  Tag: word;
  ACount, i: integer;
  PivotState: TPivotState;
begin
  CheckTag(Stream, tgBaseArray);
  ACount := 0;
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgBaseArray_Count: ACount := ReadInteger(Stream);
      tgBaseArray_ArrayData:
        begin
          Count := ACount;
          for i := 0 to ACount - 1 do
          begin
            PivotState := TPivotState.Create;
            PivotState.ReadStream(Stream);
{$IFDEF ASPRUNTIME}
            Self[i] := PivotState;
{$ELSE}
            PPntrArray(ArrayPointer)^[i] := PivotState;
{$ENDIF}
          end;
        end;
      tgBaseArray_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;
  
  CheckTag(Stream, tgPivotStates);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgPivotStates_Names:
        begin
          FreeAndNil(FNames);
          FNames := TWideStringArray.Create;
          ReadStreamedObject(Stream, FNames);
        end;
      tgPivotStates_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

function TPivotStates.StreamSize: integer;
begin
  Result := inherited StreamSize;
  inc(Result, TagSize * 2 + StreamedObjectSize(FNames));
end;

procedure TPivotStates.WriteStream(Stream: TStream);
begin
  inherited WriteStream(Stream);
  with Stream do
  begin
    WriteTag(Stream, tgPivotStates);

    WriteStreamedObject(Stream, FNames, tgPivotStates_Names);
    
    WriteTag(Stream, tgPivotStates_EOT);
  end;
end;


procedure THierCubeOptions.Assign(Source: TPersistent);
var
  S: THierCubeOptions;
begin
  if Source is THierCubeOptions then S := THierCubeOptions(Source) else EXIT;
  ShowProgressBar := S.ShowProgressBar;
  LookupHasntTheValue := S.LookupHasntTheValue;
end;

constructor THierCubeOptions.Create(AOwner: TCustomHierCube);
begin
  {$IFDEF ASPRUNTIME}
  inherited Create;
  {$ENDIF}
  FShowProgressBar := True;
  FLookupHasntTheValue := lvException;
  FDimMemberIsNull := dnTreatAsZero;
  fOwner := AOwner;
end;

procedure THierCubeOptions.SetDupDimensionTableID(const Value: TDupDimensionTableID);
begin
  if not fOwner.Active then FDupDimensionTableID := Value;
end;

procedure THierCubeOptions.SetEditable(const Value: boolean);
begin
  if not fOwner.Active then FEditable := Value;
end;

procedure THierCubeOptions.SetLookupHasntTheValue(Value: TLookupHasntTheValue);
begin
  if not fOwner.Active then FLookupHasntTheValue := Value;
end;


procedure TPivotState.FreeAll;
begin
  FreeAndNil(FStreamedSummarySettings);
  FreeAndNil(FStreamedDimStates);
  FreeAndNil(FRowDimIDs);
  FreeAndNil(FColDimIDs);
  FreeAndNil(FOpenRowNodes);
  FreeAndNil(FOpenColNodes);
  FreeAndNil(FValueSortData);
end;

{$IFNDEF ASPRUNTIME}
destructor TPivotState.Destroy;
begin
  FreeAll;
  inherited;
end;
{$ENDIF}

procedure TPivotState.ReadStream(Stream: TStream);
var
  Tag: word;
begin
  CheckTag(Stream, tgPivotState);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgPivotState_RowDimIDs:
        begin
          FreeAndNil(FRowDimIDs);
          FRowDimIDs := TWideStringArray.Create;
          ReadStreamedObject(Stream, FRowDimIDs);
        end;
      tgPivotState_ColDimIDs:
        begin
          FreeAndNil(FColDimIDs);
          FColDimIDs := TWideStringArray.Create;
          ReadStreamedObject(Stream, FColDimIDs);
        end;
      tgPivotState_OpenRowNodes:
        begin
          FreeAndNil(FOpenRowNodes);
          FOpenRowNodes := TOpenDimNodes.Create;
          ReadStreamedObject(Stream, FOpenRowNodes);
        end;
      tgPivotState_OpenColNodes:
        begin
          FreeAndNil(FOpenColNodes);
          FOpenColNodes := TOpenDimNodes.Create;
          ReadStreamedObject(Stream, FOpenColNodes);
        end;
      tgPivotState_StreamedDimStates:
        begin
          FreeAndNil(FStreamedDimStates);
          FStreamedDimStates := TStreamedDimStates.Create;
          ReadStreamedObject(Stream, FStreamedDimStates);
        end;
      tgPivotState_StreamedSumSettings:
        begin
          FreeAndNil(FStreamedSummarySettings);
          FStreamedSummarySettings := TStreamedSummarySettings.Create;
          ReadStreamedObject(Stream, FStreamedSummarySettings);
        end;
      tgPivotState_ValueSortData:
        begin
          if FValueSortData = nil then FValueSortData := TValueSortData.Create;
          ReadStreamedObject(Stream, FValueSortData);
        end;
      tgPivotState_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

procedure TPivotState.SaveState(GridInfo: TGridInfo; MembersSaveMode: TMembersSaveMode);
begin
  FreeAll;
  FRowDimIDs := GridInfo.DimIDs2Strings(GridInfo.FRowDimIDs);
  FColDimIDs := GridInfo.DimIDs2Strings(GridInfo.FColDimIDs);

  if GridInfo.FDimensionStates <> nil then
    FStreamedDimStates := GridInfo.FDimensionStates.BuildStreamedDimStates(MembersSaveMode);

  if GridInfo.FSummarySettings <> nil then
    FStreamedSummarySettings := GridInfo.FSummarySettings.BuildStreamedSummarySettings;

  if GridInfo.FRowLabelNodes <> nil then
  begin
    FOpenRowNodes := TOpenDimNodes.Create;
    FOpenRowNodes.SaveLabelNodes(GridInfo.FRowLabelNodes);
  end;

  if GridInfo.FColLabelNodes <> nil then
  begin
    FOpenColNodes := TOpenDimNodes.Create;
    FOpenColNodes.SaveLabelNodes(GridInfo.FColLabelNodes);
  end;
  
  if GridInfo.FValueSortData <> nil then
  begin
    FValueSortData := TValueSortData.Create;
    FValueSortData.Assign(GridInfo.FValueSortData);
  end;
end;

constructor TSummaryState.Create(ASum: TSummary; ASumID: integer; AGridInfo: TGridInfo);
begin
  {$IFDEF ASPRUNTIME}
  inherited Create;
  {$ENDIF}
  fSum := ASum;
  FSumID := ASumID;
  fGridInfo := AGridInfo;
end;

{$IFNDEF ASPRUNTIME}
destructor TSummaryState.Destroy;
begin
  FreeAndNil(FFactTotals);
  FreeAndNil(FAllTotals);
  inherited;
end;
{$ENDIF}

function TPivotState.StreamSize: integer;
begin
  Result := TagSize * 2 +
    StreamedObjectSize(FRowDimIDs) +
    StreamedObjectSize(FColDimIDs) +
    StreamedObjectSize(FOpenRowNodes) +
    StreamedObjectSize(FOpenColNodes) +
    StreamedObjectSize(FStreamedDimStates) +
    StreamedObjectSize(FStreamedSummarySettings) +
    StreamedObjectSize(FValueSortData);
end;

procedure TPivotState.WriteStream(Stream: TStream);
begin
  with Stream do
  begin
    WriteTag(Stream, tgPivotState);

    WriteStreamedObject(Stream, FRowDimIDs, tgPivotState_RowDimIDs);
    WriteStreamedObject(Stream, FColDimIDs, tgPivotState_ColDimIDs);
    WriteStreamedObject(Stream, FOpenRowNodes, tgPivotState_OpenRowNodes);
    WriteStreamedObject(Stream, FOpenColNodes, tgPivotState_OpenColNodes);
    WriteStreamedObject(Stream, FStreamedDimStates, tgPivotState_StreamedDimStates);
    WriteStreamedObject(Stream, FStreamedSummarySettings, tgPivotState_StreamedSumSettings);
    WriteStreamedObject(Stream, FValueSortData, tgPivotState_ValueSortData);

    WriteTag(Stream, tgPivotState_EOT);
  end;
end;


procedure TSummaryStates.ClearTotals;
var
  i: integer;
begin
  FLineIDs.Clear;
  FAllOffsets.Clear;
  for i := 0 to Count - 1 do
    TSummaryState(Items[i]).FAllTotals.Clear;
end;

constructor TSummaryStates.Create(AGridInfo: TGridInfo);
begin
  inherited Create;
  fGridInfo := AGridInfo;
  InitArrays;
end;

constructor TSummaryStates.CreateCount(AGridInfo: TGridInfo; ACount: integer);
begin
  inherited CreateCount(ACount);
  FGridInfo := AGridInfo;
  InitArrays;
end;

function TSummaryStates.FindDimensionMapIndex(ADimMapIndex: integer): TSummaryState;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  if TSummaryState(Items[i]).Sum.DimensionMapIndex = ADimMapIndex then
  begin
    Result := TSummaryState(Items[i]);
    BREAK;
  end;
end;

procedure TSummaryStates.InitArrays;
begin
  FFactOffsets := TCubeIntegerArray.Create;
  FFactOffsets.Sorted := True;
  FFactOffsets.Duplicates := dupIgnore;

  FLineIDs := TInt64Array.Create;
  FLineIDs.Sorted := True;
  FLineIDs.Duplicates := dupIgnore;

  FAllOffsets := TObjectArray.Create;
end;

{$IFDEF ASPRUNTIME}
function TSummaryStates.FindFieldName(const FieldName: WideString): TSummaryState;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  if WideCompareText(FieldName, TSummaryState(Self[i]).FieldName) = 0 then
  begin
    Result := TSummaryState(Self[i]);
    BREAK;
  end;
end;
{$ELSE}
function TSummaryStates.FindFieldName(const FieldName: WideString): TSummaryState;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  if WideCompareText(FieldName, TSummaryState(PPntrArray(FArrayPointer)^[i]).FieldName) = 0 then
  begin
    Result := PPntrArray(FArrayPointer)^[i];
    BREAK;
  end;
end;
{$ENDIF}

procedure TGridInfo.RestorePivotState(PivotState: TPivotState; RestoreMode: TMembersRestoreMode = rmRestoreHidden);
begin
  if PivotState <> nil then
  begin
    BeginChange;
    try
      DoRestorePivotState(PivotState, RestoreMode);
    finally
      FSummaryStates.ClearTotals;
      FDimensionStates.CalcAllFiltered; 

      FreeAndNil(FActiveDimIDs);
      EndChange(gePivotStateChange, 0);
    end;
  end;
end;

procedure TGridInfo.DoRestorePivotState(PivotState: TPivotState; RestoreMode: TMembersRestoreMode);
var
  i: integer;
  StreamedDimState: TStreamedDimState;
  StreamedSumInfo: TStreamedSumInfo;
  DimState: TDimensionState;
  SumInfo: TSummaryInfo;
begin
  if PivotState = nil then EXIT;

  for i := 0 to FDimensionStates.Count - 1 do TDimensionState(FDimensionStates[i]).FDimGroup := dgPage;

  FreeAndNil(FRowDimIDs);
  FRowDimIDs := DimStrings2IDs(PivotState.FRowDimIDs);

  FreeAndNil(FColDimIDs);
  FColDimIDs := DimStrings2IDs(PivotState.FColDimIDs);

  FreeAndNil(FPageDimIDs);
  FPageDimIDs := TIntegerArray.Create;

  if PivotState.FStreamedDimStates <> nil then
  for i := 0 to PivotState.FStreamedDimStates.Count - 1 do
  begin
    StreamedDimState := TStreamedDimState(PivotState.FStreamedDimStates[i]);
    DimState := FDimensionStates.FindFieldName(StreamedDimState.FieldName);
    if DimState <> nil then
      DimState.RestoreStreamedDimState(StreamedDimState, RestoreMode);
  end;

  for i := 0 to FDimensionStates.Count - 1 do
  begin
    DimState := TDimensionState(FDimensionStates[i]);
    if DimState.FDimGroup = dgPage then FPageDimIDs.Add(DimState.DimID);
  end;

  if PivotState.FStreamedSummarySettings <> nil then
  begin
    i := 0;
    while i <= FSummarySettings.Count - 1 do
    begin
      if FSummarySettings.Items[i].Calculated then
        FSummarySettings.Items[i].Free
      else
        inc(i);
    end;

    for i := 0 to PivotState.FStreamedSummarySettings.Count - 1 do
    begin
      StreamedSumInfo := TStreamedSumInfo(PivotState.FStreamedSummarySettings[i]);
      if StreamedSumInfo.Calculated = False then
        begin
          SumInfo := FSummarySettings.FindFieldName(StreamedSumInfo.FieldName);
          if SumInfo <> nil then
          begin
            SumInfo.RestoreStreamedSumInfo(StreamedSumInfo);
            SumInfo.MoveTo(i);
          end;
        end
      else
        begin
          SumInfo := FSummarySettings.Add;
          SumInfo.RestoreStreamedSumInfo(StreamedSumInfo);
          SumInfo.MoveTo(i);
        end;
    end;

    for i := 0 to FSummarySettings.Count - 1 do FSummarySettings[i].FID := i;
  end;

  FreeAndNil(FActiveDimIDs);
  RebuildActiveDimIDs;

  FreeAndNil(FRowLabelNodes); FRowMax := 1;
  if RowDimIDs <> nil then
  if RowDimIDs.Count > 0 then
  begin
    FRowMax := BuildRootLabelNodes(RowDimIDs, FRowLabelNodes);
    if FRowMax = 0 then FRowMax := 1;
  end;
  FreeAndNil(FColLabelNodes); FColMax := 1;
  if ColDimIDs <> nil then
  if ColDimIDs.Count > 0 then
  begin
    FColMax := BuildRootLabelNodes(ColDimIDs, FColLabelNodes);
    if FColMax = 0 then FColMax := 1;
  end;

  if (FRowLabelNodes <> nil) and (PivotState.FOpenRowNodes <> nil) then
  if PivotState.FOpenRowNodes.Count > 0 then
    RestoreLabelNodes(dgRow, PivotState.FOpenRowNodes);

  if (FColLabelNodes <> nil) and (PivotState.FOpenColNodes <> nil) then
  if PivotState.FOpenColNodes.Count > 0 then
    RestoreLabelNodes(dgCol, PivotState.FOpenColNodes);

  if PivotState.ValueSortData <> nil then FValueSortData.Assign(PivotState.ValueSortData);
end;

{$IFNDEF ASPRUNTIME}
procedure TCustomHierCube.WriteCompressedCommonStream(Stream: TStream; Buffer: pointer; Count: integer);
var
  TmpStream: TMemoryStream;
begin
  TmpStream := TMemoryStream.Create;
  try
    WriteCommonStream(TmpStream, Buffer, Count);
    TmpStream.Position := 0;
    CompressStream(TmpStream, Stream);
  finally
    TmpStream.Free;
  end;
end;

procedure TCustomHierCube.ReadCompressedCommonStream(Stream: TStream; Buffer: pointer);
var
  TmpStream: TSmartMemoryStream;
  f: integer;
begin
  f := CheckStreamFormat(Stream);
  if f < 0 then InvalidStreamFormatError;
  if (f and sfCompressFlag) = 0 then
  begin
    ReadCommonStream(Stream, Buffer);
    EXIT;
  end;
  TmpStream := TSmartMemoryStream.Create;
  try
    UnCompressStream(Stream, TmpStream);
    TmpStream.Position := 0;
    ReadCommonStream(TmpStream, Buffer);
  finally
    TmpStream.Free;
  end;
end;
{$ENDIF}

procedure TCustomHierCube.SaveToFile(const FName: WideString; Buffer: pointer = nil; Count: integer = 0);
var
  Stream: TWideFileStream;
begin
  Stream := TWideFileStream.Create(FName, fmCreate);
  try
    SaveToStream(Stream, Buffer, Count);
  finally
    Stream.Free;
  end;
end;

procedure TCustomHierCube.SaveToFile(const FName: WideString; const UserData: string);
begin
  SaveToFile(FName, pointer(UserData), length(UserData) * SizeOf(Char));
end;

procedure TCustomHierCube.SaveToFileW(const FName: WideString; const UserData: WideString);
begin
  SaveToFile(FName, pointer(UserData), length(UserData) * SizeOf(WideChar));
end;

procedure TCustomHierCube.LoadFromFile(const FName: WideString; Buffer: pointer = nil);
var
  Stream: TWideFileStream;
begin
  Stream := TWideFileStream.Create(FName, fmOpenRead);
  try
    LoadFromStream(Stream, Buffer);
  finally
    Stream.Free;
  end;
end;

function TGridInfo.IsVisible(SumIndex: TIntegerArray): boolean; register;
asm
    push    EDI         
    push    esi         
    push    ebx         

    mov     ECX, [EAX + TGridInfo.FActiveDimIDs]
    mov     EAX, [EAX + TGridInfo.FDimensionStates]
    
    mov     esi, [ECX + TBaseArray.FArrayPointer]
    mov     ebx, [EAX + TBaseArray.FArrayPointer]
    
    mov     ECX, [EDX + TBaseArray.FCount]
    mov     EDI, [EDX + TBaseArray.FArrayPointer]       

@@loop:
    jecxz   @@ExitTrue
    dec     ECX
    cmp     dword ptr [EDI + ECX * TYPE Integer], SubTotal
    je      @@loop

    mov     EDX, [esi + ECX * TYPE Integer]             
    mov     EAX, [ebx + EDX * TYPE Pointer]             
    
    mov     EDX, [EDI + ECX * TYPE Integer]             

    mov     eax, [eax + TDimensionState.FAllDimMembers]
    mov     eax, [eax + TBaseArray.FArrayPointer]
    mov     eax, [eax + edx * TYPE pointer]
    cmp     byte ptr [eax + TDimMember.FVisible], False
    jne     @@loop

@@ExitFalse:
    xor     EAX, EAX
    pop     ebx
    pop     esi
    pop     EDI
    ret

@@ExitTrue:
    mov     AL, True
    pop     ebx
    pop     esi
    pop     EDI
end;


function TGridInfo.CalcOffset2SumIndexVisible(CalcOffset: CubeInteger; out SumIndex: TIntegerArray): boolean;
var
  _DimensionStatesArray: pointer;
  _ActiveDimIDsArray: pointer;
asm
        push EDI; push ESI; push EBX
        sub     esp, 4                  
        mov     word ptr [esp], $1F32   
        fstcw   word ptr [esp+2]        
        wait                            
        fldcw   word ptr [esp]          
    
        mov     EBX, [EAX + TGridInfo.FDimensionStates]
        mov     EBX, [EBX + TBaseArray.FArrayPointer]
        mov     _DimensionStatesArray, EBX

        mov     EBX, [EAX + TGridInfo.FActiveDimIDs]
        mov     EBX, [EBX + TBaseArray.FArrayPointer]
        mov     _ActiveDimIDsArray, EBX

        mov     EAX, [EAX + TGridInfo.FIntegerArray4]
        mov     [EDX], EAX

        mov     EBX, [EAX + TBaseArray.FCount]
        mov     EDI, [EAX + TBaseArray.FArrayPointer] 

        mov     EAX, dword ptr [CalcOffset]
        mov     EDX, dword ptr [CalcOffset + $04] 
        xor     ECX, ECX
@@loop:
        cmp     ECX, EBX
        jge     @@ExitTrue
        push    ECX

        mov     ESI, _ActiveDimIDsArray
        mov     ECX, [ESI + ECX * TYPE Integer]     

        mov     ESI, _DimensionStatesArray
        mov     ESI, [ESI + ECX * TYPE Pointer]     
        push EDX; push EAX 
        push    edx
        push    eax
        fild    qword ptr [esp]
        fild    qword [ESI + TDimensionState.FRange]
        fdivp
        fistp   qword ptr [esp]
        wait
        pop     eax
        add     esp, 4  

        cmp     EAX, [ESI + TDimensionState.FMemberCount] 
        jne     @@1

        mov     dword ptr [edi], SubTotal 
        add     edi, 4
        
@@mod:
        mov     ecx, eax
        mul     dword ptr [ESI + TDimensionState.FRange + $04]
        xchg    ecx, eax
        mul     dword ptr [ESI + TDimensionState.FRange]
        add     edx, ecx

        pop     ecx             
        sub     ecx, eax
        mov     eax, ecx
        pop     ecx             
        sbb     ecx, edx
        mov     edx, ecx

        pop     ECX
        inc     ECX
        jmp     @@loop

@@1:
        stosd   
        cmp     byte ptr [ESI + TDimensionState.FFiltered], False
        je      @@mod

        mov     edx, [esi + TDimensionState.FAllDimMembers]
        mov     edx, [edx + TBaseArray.FArrayPointer]
        mov     edx, [edx + eax * TYPE pointer]
        cmp     byte ptr [edx + TDimMember.FVisible], False
        jne     @@mod

        add     ESP, 4*3 
        xor     EAX, EAX 
        jmp     @@exit

@@ExitTrue:
        mov     AL, True
@@exit:
        fldcw   word ptr [esp+2]    
        add     esp, 4
        pop EBX; pop ESI; pop EDI
end;

function TGridInfo.SumIndex2CalcOffset(SumIndex: TIntegerArray): CubeInteger; register;
asm
  push EBX; push ESI; push edi; push ebp
  xor     ECX, ECX
  push    ecx
  push    ecx           
  mov     ECX, [EDX].TBaseArray.FCount 

  mov     EDI, [EDX].TBaseArray.FArrayPointer 

  mov     EBX, [EAX + TGridInfo.FActiveDimIDs]
  mov     EBP, [EBX + TBaseArray.FArrayPointer]

  mov     EBX, [EAX + TGridInfo.FDimensionStates]       
  mov     EBX, [EBX + TBaseArray.FArrayPointer]         
  jecxz   @@exit
  dec     ecx
  
@@loop:
  push    ECX
  mov     EAX, [EDI + ECX * TYPE Integer]       
  mov     esi, [EBP + ECX * TYPE Integer]       
  mov     esi, [EBX + esi * TYPE Pointer]       
  cmp     EAX, SubTotal
  jne     @@1
  mov     EAX, [esi + TDimensionState.FMemberCount]                                 

@@1:

  mov     ecx, eax
  mul     dword ptr [ESI + TDimensionState.FRange + $04]
  xchg    ecx, eax
  mul     dword ptr [ESI + TDimensionState.FRange]
  add     edx, ecx
  add     [esp+4], EAX
  adc     [esp+8], EDX          
  pop     ECX
  dec     ECX
  jns     @@loop

@@exit:
  pop     eax
  pop     edx
  pop ebp; pop edi; pop ESI; pop EBX
end;

function TGridInfo.CalcOffset2SumIndex(CalcOffset: CubeInteger): TIntegerArray; register;
var
  _Result: pointer;
  _DimensionsStatesArray: pointer;
  _ActiveDimIDsArray: pointer;
asm
        push EDI; push ESI; push EBX
        sub     esp, 4              
        mov     word ptr [esp], $1F32   
        fstcw   word ptr [esp+2]        
        wait                            
        fldcw   word ptr [esp]          

        mov     EBX, [EAX + TGridInfo.FDimensionStates]
        mov     EBX, [EBX + TBaseArray.FArrayPointer]
        mov     _DimensionsStatesArray, EBX

        mov     EBX, [EAX + TGridInfo.FActiveDimIDs]
        mov     EBX, [EBX + TBaseArray.FArrayPointer]
        mov     _ActiveDimIDsArray, EBX

        mov     EAX, [EAX + TGridInfo.FIntegerArray2]         
        mov     _Result, EAX
        mov     EBX, [EAX + TBaseArray.FCount]
        or      ebx, ebx
        jz      @@exit

        mov     EDI, [EAX + TBaseArray.FArrayPointer] 

        mov     EAX, dword ptr [CalcOffset]
        mov     EDX, dword ptr [CalcOffset + $04] 
        xor     ECX, ECX
@@loop:
        push    ecx
        mov     ESI, _ActiveDimIDsArray
        mov     ECX, [ESI + ECX * TYPE Integer]
        mov     ESI, _DimensionsStatesArray
        mov     ESI, [ESI + ECX * TYPE Pointer]     
        push EDX; push EAX 

        push    edx
        push    eax
        fild    qword ptr [esp]
        fild    qword [ESI + TDimensionState.FRange]
        fdivp
        fistp   qword ptr [esp]
        wait
        pop     eax     
        add     esp, 4  

        xor     edx, edx
        cmp     eax, [ESI + TDimensionState.FMemberCount] 
        sete    dl
        neg     edx
        or      edx, eax

        mov     [edi], edx
        add     edi, 4

        mov     ecx, eax
        mul     dword ptr [ESI + TDimensionState.FRange + $04]
        xchg    ecx, eax
        mul     dword ptr [ESI + TDimensionState.FRange]
        add     edx, ecx

        pop     ecx             
        sub     ecx, eax
        mov     eax, ecx
        pop     ecx             
        sbb     ecx, edx
        mov     edx, ecx
        pop     ecx
        inc     ecx
        cmp     ecx, ebx
        jl      @@loop

@@exit:
        mov     EAX, _Result
        fldcw   word ptr [esp+2]    
        add     esp, 4
        pop EBX; pop ESI; pop EDI
end;

function TGridInfo.GetAggregate(SumState: TSummaryState; SumIndex: TIntegerArray; AFunction: TFunction; out Res: Double): boolean;
var
  Index: integer;
  Totals: TTotals;
  LineIndex: longword;
  CalcOffset: CubeInteger;
  V: Double;
  C: integer;
  AFunctions: PFunctionValues;
  {$IFDEF ASPRUNTIME}
  AFunctions_: TFunctionValues;
  {$ENDIF}
  NeedMedian: boolean;
  HierIndex: TIntegerArray;
  PackedHierIndex: longword;
begin
  Result := False;
  if not IsVisible(SumIndex) then EXIT;

  CalcOffset := SumIndex2CalcOffset(SumIndex);
  LineIndex := SumIndex2LineIndex(SumIndex);
  HierIndex := SumIndex2HierIndex(SumIndex);
  PackedHierIndex := CodeHierIndex(HierIndex);

  Index := CalcLine(LineIndex, PackedHierIndex, HierIndex);
  if Index < 0 then EXIT;
  Totals := TTotals(SumState.FAllTotals[Index]);

  if not (AFunction in [stSum, stCount, stAverage]) then
   begin
    NeedMedian := (AFunction = stMedian) or SumState.SumInfo.FunctionMedian.Visible;
    if NeedMedian and (SumState.Sum.FSortedFacts = nil) then
      SumState.Sum.FSortedFacts := BuildSummarySortedArray(SumState.fSumID);
    if NeedMedian and not Totals.fMedianCalc then  FreeAndNil(Totals.fFunctions);
    if Totals.fFunctions = nil then CalcLine3(SumState, LineIndex, PackedHierIndex, HierIndex, Totals, NeedMedian);
   end;

  Result := Totals.Find(CalcOffset, V, C, AFunctions);
  if Result then
  case AFunction of
    stSum: Res := V;
    stCount: Res := C;
    stAverage: Res := V / C;
  else
   if AFunctions = nil then Res := 0 else
{$IFDEF ASPRUNTIME}
    begin
      AFunctions_ := TFunctionValues(AFunctions);
      with AFunctions_ do
       case AFunction of
        stMin: Res := Min;
        stMax: Res := Max;
        stVariance: Res := Variance;
        stStdDev: Res := Sqrt(Variance);
        stMeanAbsDev: Res := ADev;
        stSkewness: Res := Skewness;
        stKurtosis: Res := Kurtosis;
        stMedian: Res := Median;
        stCustom1: Res := Customs[1];
        stCustom2: Res := Customs[2];
        stCustom3: Res := Customs[3];
        stCustom4: Res := Customs[4];
        stCustom5: Res := Customs[5];
       end;
    end;
{$ELSE}
    with AFunctions^ do
     case AFunction of
      stMin: Res := Min;
      stMax: Res := Max;
      stVariance: Res := Variance;
      stStdDev: Res := Sqrt(Variance);
      stMeanAbsDev: Res := ADev;
      stSkewness: Res := Skewness;
      stKurtosis: Res := Kurtosis;
      stMedian: Res := Median;
      stCustom1: Res := Customs[1];
      stCustom2: Res := Customs[2];
      stCustom3: Res := Customs[3];
      stCustom4: Res := Customs[4];
      stCustom5: Res := Customs[5];
     end;
{$ENDIF}
  end;

end;

function TGridInfo.IsIndexSparse(SumIndex: TIntegerArray): boolean;
var
  SumID: integer;
  Res: Double;
  SumState: TSummaryState;
begin
  Result := True;
  for SumID := 0 to FSummaryStates.Count - 1 do
  begin
    SumState := TSummaryState(FSummaryStates[SumID]);
    if GetAggregate(SumState, SumIndex, stCount, Res) = True then
    begin
      Result := False;
      Break;
    end;
  end;
end;

function TGridInfo.GetActive: boolean;
begin
  Result := False;
  if (FCube <> nil) then Result := FCube.Active;
end;

{$IFNDEF ASPRUNTIME}
procedure TGridInfo.SetCube(Value: TCustomHierCube);
begin
  if FCube <> Value then
  begin
    FCube := Value;
    if (csLoading in ComponentState) or (csReading in ComponentState) then EXIT;
    NotifyLinkedControls(geHierCubeChanged, 0);
  end;
end;

procedure TGridInfo.NotifyLinkedControls(AEvent: TGridInfoEvent; Flags: longint);
var
  i: integer;
  Event: longint;
begin
  Event := longint(AEvent) or Flags;
  if (csDestroying in FGrid.ComponentState) then EXIT;
  PostMessage(FGrid.Handle, CM_GRIDINFOMESSAGE, Event, longint(Self));
  if FLinkedControls <> nil then
  for i := 0 to FLinkedControls.Count - 1 do
    PostMessage(TWinControl(FLinkedControls[i]).Handle, CM_GRIDINFOMESSAGE, Event, longint(Self));
end;
{$ENDIF}

{$IFDEF ASPRUNTIME}
procedure TGridInfo.CMHierCubeMessage(event: THierCubeEvent);
{$ELSE}
procedure TGridInfo.CMHierCubeMessage(var Msg: TCMHierCubeMessage);
{$ENDIF}
begin
  case {$IFDEF ASPRUNTIME}event{$ELSE}THierCubeEvent(Msg.MsgType){$ENDIF} of
    xeDimensionMapChanged:
      begin
        SyncSummaries;
        SetupData;
      end;
    xeSourceChange:
      begin
        if FCube.Summaries <> nil then
        SyncSummaries;
        SetupData;
        InitPivotState;
      end;
    xeReadFromStream:
      begin
        SyncSummaries2;
        SetupData;
      end;
    xeFactTableChanged:
      begin
        BeginChange;
        FreeAndNil(FActiveDimIDs);
        RebuildDimStates;
        EndChange(geSourceChange, msgKeepCurrentMask);
      end;
  end;
  {$IFNDEF ASPRUNTIME}
  inherited;
  {$ENDIF}
end;

procedure TGridInfo.InitPivotState;
begin
  if assigned(FOnInitPivotState) and Active then
  begin
    FreeAndNil(FInitPivotStateArgs);
    FInitPivotStateArgs := TInitPivotStateArgs.Create;
{$IFNDEF ASPRUNTIME}
    FOnInitPivotState(Owner, FInitPivotStateArgs);
    PostMessage(TWinControl(Owner).Handle, CM_GRIDINFOMESSAGE, longint(geInitPivotState), longint(Self));
{$ENDIF}
  end;
end;

{$IFNDEF ASPRUNTIME}
procedure TGridInfo.AddLinkedControl(Control: TWinControl);
begin
  if FLinkedControls = nil then FLinkedControls := TList.Create;
  FLinkedControls.Add(Control);
  Control.Perform(CM_GRIDINFOMESSAGE, longint(geSourceChange), 0);
end;

procedure TGridInfo.RemoveLinkedControl(Control: TWinControl);
begin
  FLinkedControls.Remove(Control);
end;
{$ENDIF}

{$IFNDEF ASPRUNTIME}
function CompareWideStringPointers(BaseArray: TBaseArray; Index1, Index2: Integer; Data: Longint): Integer;
begin
  Index1 := integer(TWideStringArray(BaseArray).Pointers[Index1]);
  Index2 := integer(TWideStringArray(BaseArray).Pointers[Index2]);
  if Index1 > Index2 then
    Result := 1
  else if Index1 < Index2 then
    Result := -1
  else
    Result := 0;
end;
{$ENDIF}

procedure TCustomHierCube.InitFactTable;
begin
  DoReadFactTable(False);
end;

{$IFNDEF ASPRUNTIME}
destructor TSummaryStates.Destroy;
begin
  FreeAndNil(FFactOffsets);
  FreeAndNil(FAllOffsets);
  FreeAndNil(FLineIDs);
  inherited;
end;
{$ENDIF}


constructor TFactTable.Create(ADimCount, ASumCount: word);
begin
  FRecordSize := ADimCount * SizeOf(MemberInt) + ASumCount * SizeOf(Double);
{$IFDEF ASPRUNTIME}
  inherited Create(FRecordSize, TypeOf(TFactTAbleRecord));
{$ELSE}
  inherited Create(FRecordSize);
{$ENDIF}
  FDimCount := ADimCount;
  FSumCount := ASumCount;
end;

procedure TFactTable.First;
asm
    mov      ecx, [eax + TBaseArray.FArrayPointer]
    xor      EDX, EDX
    mov      [EAX + FCurIndex], EDX
    mov      [eax + FCurRecord], ecx
    cmp      dword ptr [EAX + TBaseArray.FCount], edx
    setz     byte ptr [EAX + FEOF]
end;

function TFactTable.GetSumIndex(GridInfo: TGridInfo): TIntegerArray;
var
  ActiveDimIDs: TIntegerArray;
  i, DimID: integer;
  DimState: TDimensionState;
begin
  ActiveDimIDs := GridInfo.ActiveDimIDs;
  Result := GridInfo.FIntegerArray4;
  for i := 0 to ActiveDimIDs.Count - 1 do
  begin
    DimID := ActiveDimIDs[i];
    DimState := TDimensionState(GridInfo.fDimensionStates[DimID]);
    Result[i] := DimState.FIndexConversion[CurDim[DimID]];
  end;
end;

function TFactTable.GetCurDim(DimID: integer): integer;
asm
    mov      ecx, [eax + FCurRecord]
    mov      EAX, [ECX + EDX * TYPE MemberInt]
end;

function TFactTable.GetCurSum(SumID: integer): double;
asm
    mov      ecx, [EAX + FDimCount]
    mov      eax, [eax + FCurRecord]
    lea      EAX, [EAX + ECX * TYPE MemberInt]    
    fld      qword ptr [EAX + EDX * TYPE Double]
end;

function TFactTable.GetDim(Index, DimID: integer): integer;
asm
    push     ECX
    call     GetItemPtr                 
    pop      EDX                        
    mov      EAX, [EAX + EDX * TYPE MemberInt]
end;

function TFactTable.GetSum(Index, SumID: integer): double;
asm
    push     dword ptr [EAX + TFactTable.FDimCount]
    push     ECX
    call     GetItemPtr                 
    pop      EDX                        
    pop      ECX
    lea      EAX, [EAX + ECX * TYPE MemberInt]    
    fld      qword ptr [EAX + EDX * TYPE Double]
end;

function TFactTable.NewRecord: integer;
asm
    push     EAX
    call     TBaseArray.IncCount
    pop      ECX
    mov      EAX, [ECX + TBaseArray.FCount]
    dec      EAX
    mov      [ECX + TFactTable.FCurIndex], EAX
    imul     [ECX + TBaseArray.FItemSize]
    add      EAX, [ECX + TBaseArray.FArrayPointer]
    mov      [ECX + FCurRecord], EAX
    mov      EAX, [ECX + TBaseArray.FCount]
    dec      EAX
end;

procedure TFactTable.Next;
asm
    mov      ECX, [EAX + TBaseArray.FItemSize]
    inc      [EAX + TFactTable.FCurIndex]
    add      [eax + FCurRecord], ECX
    mov      EDX, [EAX + TBaseArray.FCount]
    cmp      [EAX + TFactTable.FCurIndex], EDX
    setge    byte ptr [EAX + TFactTable.FEOF]
end;

procedure TFactTable.SetCurDim(DimID: integer; Value: integer);
asm
    mov      EAX, [EAX + FCurRecord]
    mov      [EAX + EDX * TYPE MemberInt], ECX
end;

procedure TFactTable.SetCurIndex(Value: integer);
begin
  FCurIndex := Value;
{$IFNDEF ASPRUNTIME}
  FCurRecord := pointer(longword(FArrayPointer) + longword(Value * ItemSize));
{$ENDIF}
  FEOF := (Value >= FCount);
end;

procedure TFactTable.SetCurSum(SumID: integer; Value: double);
asm
    mov      ECX, dword ptr [EAX + FDimCount]
    mov      EAX, [EAX + FCurRecord]
    lea      EAX, [EAX + ECX * TYPE MemberInt]    
    lea      EDX, [EAX + EDX * TYPE Double]
    mov      EAX, dword ptr [Value]
    mov      [EDX], EAX
    mov      EAX, dword ptr [Value + $04]
    mov      [EDX + $04], EAX
end;

procedure TFactTable.SetSum(Index, SumID: integer; Value: double);
asm
    push     dword ptr [EAX + FDimCount]
    push     ECX
    call     GetItemPtr                 
    pop      EDX                        
    pop      ECX
    lea      EAX, [EAX + ECX * TYPE MemberInt]    
    lea      EDX, [EAX + EDX * TYPE Double]
    mov      EAX, dword ptr [Value]
    mov      [EDX], EAX
    mov      EAX, dword ptr [Value + $04]
    mov      [EDX + $04], EAX
end;

function TGridInfo.CreateSumIndex: TIntegerArray;
begin
  Result := TIntegerArray.CreateCount(FActiveDimIDs.Count);
  Result.FillWith(SubTotal);
end;

function TGridInfo.IsLeaf(SumIndex: TIntegerArray): boolean; register;
asm
    push    EDI
    push    ESI
    push    EBX

    mov     ECX, [EAX + TGridInfo.FActiveDimIDs]
    mov     ESI, [ECX + TBaseArray.FArrayPointer]

    mov     EAX, [EAX + TGridInfo.FDimensionStates]
    mov     EBX, [EAX + TBaseArray.FArrayPointer]    

    mov     ECX, [EDX + TBaseArray.FCount]
    mov     EDI, [EDX + TBaseArray.FArrayPointer]

@@loop:
    mov     AL, True                                    
    jecxz   @@exit
    dec     ECX
    mov     EDX, [ESI + ECX * TYPE Integer]             
    mov     EAX, [EBX + EDX * TYPE Pointer]             
    mov     EDX, [EAX + TDimensionState.FChildrenList]
    mov     EDX, [EDX + TBaseArray.FArrayPointer]
    mov     EAX, [EDI + ECX * TYPE Integer]             
    mov     EAX, [EDX + EAX * TYPE Pointer]             
    or      EAX, EAX
    jz      @@loop                                      

    xor     EAX, EAX                                    

@@exit:
    pop     EBX
    pop     ESI
    pop     EDI
end;


procedure TFactTable.SetDim(Index, DimID, Value: integer);
asm
    push     ECX
    call     GetItemPtr                 
    pop      EDX                        
    mov      ECX, [Value]
    mov      [EAX + EDX * TYPE MemberInt], ECX
end;

procedure TFactTable.ReadStream(Stream: TStream);
var
  Tag: word;
begin
  {$IFDEF ASPRUNTIME}
  TypeOfArray := TypeOf(TFactTableRecord);
  {$ENDIF}
  Stream.Read(Tag, SizeOf(Tag));
  if Tag = tgFactTable then
    repeat
      Stream.Read(Tag, SizeOf(Tag));
      case Tag of
        tgFactTable_DimCount:   FDimCount := ReadInteger(Stream);
        tgFactTable_SumCount:   FSumCount := ReadInteger(Stream);
        tgFactTable_EOT: BREAK;
      else 
        SkipValue(Stream);
      end;
    until False
  else
    Stream.Seek(-SizeOf(Tag), soFromCurrent);

  inherited ReadStream(Stream);
  CheckTag(Stream, tgFactTable);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgFactTable_DimCount:   FDimCount := ReadInteger(Stream);
      tgFactTable_SumCount:   FSumCount := ReadInteger(Stream);
      tgFactTable_EOT:
        begin
          {$IFDEF ASPRUNTIME}
          FRecordSize := FDimCount * SizeOf(MemberInt) + FSumCount * SizeOf(Double);
          {$ELSE}
          FRecordSize := ItemSize;
          {$ENDIF}
          First;
          BREAK;
        end;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

function TFactTable.StreamSize: integer;
begin
  Result := TagSize * 4 + IntegerSize(FDimCount) + IntegerSize(FSumCount) +
    inherited StreamSize + TagSize * 2;
  if FDimCount <> 0 then inc(Result, TagSize + IntegerSize(FDimCount));
  if FSumCount <> 0 then inc(Result, TagSize + IntegerSize(FSumCount));
end;

procedure TFactTable.WriteStream(Stream: TStream);
begin
  with Stream do
  begin
    WriteTag(Stream, tgFactTable);

    WriteTag(Stream, tgFactTable_DimCount);
    WriteInteger(Stream, FDimCount);

    WriteTag(Stream, tgFactTable_SumCount);
    WriteInteger(Stream, FSumCount);

    WriteTag(Stream, tgFactTable_EOT);
  end;
  inherited WriteStream(Stream);
  with Stream do
  begin
    WriteTag(Stream, tgFactTable);

    if FDimCount <> 0 then
    begin
      WriteTag(Stream, tgFactTable_DimCount);
      WriteInteger(Stream, FDimCount);
    end;

    if FSumCount <> 0 then
    begin
      WriteTag(Stream, tgFactTable_SumCount);
      WriteInteger(Stream, FSumCount);
    end;

    WriteTag(Stream, tgFactTable_EOT);
  end;
end;

type
  TSummaryCompareData = record
    FT: TFactTable;
    SumID: integer;
  end;
{$IFNDEF ASPRUNTIME}
  PSummaryCompareData = ^TSummaryCompareData;
{$ENDIF}

{$IFDEF ASPRUNTIME}
function SummaryCompare(BaseArray: TBaseArray; Object1, Object2, Data: TObject): integer;
var
  V1, V2: double;
  CompareData: TSummaryCompareData;
begin
  CompareData := TSummaryCompareData(Data);
  V1 := CompareData.FT.GetSum(integer(Object1), CompareData.SumID);
  V2 := CompareData.FT.GetSum(integer(Object2), CompareData.SumID);
  if V1 < V2 then Result := -1
    else if V1 > V2 then Result := 1 else Result := 0;
end;
{$ELSE}
function SummaryCompare(BaseArray: TBaseArray; Index1, Index2: integer; Data: Longint): integer;
var
  V1, V2: double;
  ItemsArray: PIntArray;
  CompareData: PSummaryCompareData;
begin
  CompareData := pointer(Data);
  ItemsArray := BaseArray.ArrayPointer;
  V1 := CompareData.FT.GetSum(ItemsArray[Index1], CompareData.SumID);
  V2 := CompareData.FT.GetSum(ItemsArray[Index2], CompareData.SumID);
  Result := CmpDouble(V1, V2);
end;
{$ENDIF}

function TFactTable.BuildSummarySortedArray(SumID: integer): TIntegerArray;
var
  Data: TSummaryCompareData;
begin
  Result := TIntegerArray.CreateCount(Count);
  Result.FillRank;
  Data.FT := Self;
  Data.SumID := SumID;
{$IFDEF ASPRUNTIME}
  Result.CustomSort(SummaryCompare, TObject(Data));
{$ELSE}
  Result.CustomSort(SummaryCompare, Longint(@Data));
{$ENDIF}
end;

{$IFDEF ASPRUNTIME}
procedure TFactTable.ReadContents(AStream: TStream);
var
  i, j, L: integer;
  d: integer;
  s: double;
  TT: TFactTableRecord;
begin
  SetCount(Count);
  with AStream do
  begin
    if ReadValueType(AStream) = vtBinary then
      begin
        Read(L, SizeOf(Integer));
        for i := 0 to FCount - 1 do
          begin
           TT := TFactTableRecord(Self[i]);
           SetLength(TT.Dims, FDimCount);
           SetLength(TT.Sums, FSumCount);
           for j := 0 to FDimCount - 1 do
            begin
             AStream.Read(d);
             TT.Dims[j] := d;
            end;
           for j := 0 to FSumCount - 1 do
            begin
             AStream.Read(s);
             TT.Sums[j] := s;
            end;
           Self[i] := TObject(TT); 
          end;
      end
    else
      InvalidPropError(AStream.Position - SizeOf(TxhValueType));
  end;
end;

procedure TFactTable.WriteContents(AStream: TStream);
var
  i, j: integer;
begin
  with AStream do
  begin
    WriteValueType(AStream, vtBinary);
    Write(Count*FRecordSize, SizeOf(Integer));
    for i := 0 to FCount - 1 do
      begin
       for j := 0 to FDimCount - 1 do AStream.Write(TFactTableRecord(Self[i]).Dims[j]);
       for j := 0 to FSumCount - 1 do AStream.Write(TFactTableRecord(Self[i]).Sums[j]);
      end;
  end;
end;
{$ENDIF}


procedure TSubFunctionInfo.Assign(Source: TPersistent);
var
  S: TSubFunctionInfo;
begin
  if Source is TSubFunctionInfo then
    begin
      S := Source as TSubFunctionInfo;
      fVisible := S.fVisible;
      fFormatString := S.fFormatString;
      FAlignment := S.FAlignment;
    end
  else
    inherited Assign(Source);
end;

const
  SubFunctionInfoDefaultFormat = '0.00';

function TSubFunctionInfo.IsDefaultFormat: boolean;
begin
  Result := fFormatString <> SubFunctionInfoDefaultFormat;
end;

constructor TSubFunctionInfo.Create(ASummarySettings: TSummarySettings);
begin
  FSummarySettings := ASummarySettings;
  inherited Create;
  fVisible := False;
  fFormatString := SubFunctionInfoDefaultFormat;
  FAlignment := taRightJustify;
end;

procedure TSubFunctionInfo.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    if FSummarySettings.FUpdateCounter <= 0 then FSummarySettings.Changed;
  end;
end;

procedure TSubFunctionInfo.SetFormatString(const Value: WideString);
begin
  if fFormatString <> Value then
  begin
    fFormatString := Value;
    if FSummarySettings.FUpdateCounter <= 0 then FSummarySettings.Changed;
  end;
end;

procedure TSubFunctionInfo.SetVisible(Value: boolean);
begin
  if fVisible <> Value then
  begin
    fVisible := Value;
    if FSummarySettings.FUpdateCounter <= 0 then FSummarySettings.Changed;
  end;
end;


procedure TFunctionInfo.Assign(Source: TPersistent);
var
  S: TFunctionInfo;
  i: TSubFunction;
begin
  if Source is TFunctionInfo then
    begin
      S := Source as TFunctionInfo;
      for i := low(TSubFunction) to high(TSubFunction) do fSubFunctions[integer(i)].Assign(S.fSubFunctions[integer(i)]);
    end
  else
    inherited Assign(Source);
end;

constructor TFunctionInfo.Create(ASummarySettings: TSummarySettings);
var
  i: TSubFunction;
begin
{$IFDEF ASPRUNTIME}
  inherited Create;
{$ENDIF}
  FSummarySettings := ASummarySettings;
  for i := low(TSubFunction) to High(TSubFunction) do fSubFunctions[integer(i)] := TSubFunctionInfo.Create(ASummarySettings);
end;
{$IFNDEF ASPRUNTIME}
destructor TFunctionInfo.Destroy;
var
  i: TSubFunction;
begin
  for i := low(TSubFunction) to high(TSubFunction) do fSubFunctions[integer(i)].Free;
  inherited;
end;
{$ENDIF}

function TFunctionInfo.GetSubFunctions(SubFunction: integer): TSubFunctionInfo;
begin
  Result := fSubFunctions[SubFunction];
end;

function TFunctionInfo.GetVisible: boolean;
var
  i: TSubFunction;
begin
  Result := True;
  for i := low(TSubFunction) to high(TSubFunction) do if fSubFunctions[integer(i)].Visible then EXIT;
  Result := False;
end;

procedure TFunctionInfo.SetSubFunctions(SubFunction: integer; Value: TSubFunctionInfo);
begin
  if Value <> nil then fSubFunctions[SubFunction].Assign(Value);
end;

procedure TFunctionInfo.SetVisible(Value: boolean);
var
  i: TSubFunction;
begin
  if Visible <> Value then
  begin
    FSummarySettings.BeginUpdate;
    if Value then
      fSubFunctions[integer(low(TSubFunction))].Visible := True
    else
      for i := low(TSubFunction) to high(TSubFunction) do fSubFunctions[integer(i)].Visible := False;
    FSummarySettings.EndUpdate;  
  end;
end;


procedure TSummaryInfo.Assign(Source: TPersistent);
var
  S: TSummaryInfo;
  i: TFunction;
begin
  if Source is TSummaryInfo then
    begin
      S := Source as TSummaryInfo;
      fFormula := S.fFormula;
      fFieldName := S.fFieldName;
      fDisplayName := S.fDisplayName;
      fDefaultFormat := S.fDefaultFormat; 
      FSummaryState := S.FSummaryState;
      FID := S.FID;
      FFormulaParser := S.FFormulaParser;
      FDimensionMapIndex := S.FDimensionMapIndex;
      for i := low(TFunction) to high(TFunction) do fFunctions[integer(i)].Assign(S.fFunctions[integer(i)]);
    end
  else
    inherited Assign(Source);
end;

constructor TSummaryInfo.Create(Collection: TCollection);
var
  i: TFunction;
begin
  inherited Create(Collection);
  FID := WrongIndex;
  FDimensionMapIndex := WrongIndex;
  for i := low(TFunction) to High(TFunction) do fFunctions[integer(i)] := TFunctionInfo.Create(TSummarySettings(Collection));
end;

procedure TSummaryInfo.InitAllChilds;
var
  i: TFunction;
  j: TSubFunction;
  FI: TFunctionInfo;
  SFI: TSubFunctionInfo;
begin
  for i := Low(TFunction) to High(TFunction) do
  begin
    FI := fFunctions[integer(i)];
    for j := Low(TSubFunction) to High(TSubFunction) do
    begin
      SFI := FI.fSubFunctions[integer(j)];
      if (i = stCount) or (j in [sstRankByRow, sstRankByCol]) then
        SFI.fFormatString := '0'
      else
        if FDefaultFormat <> '' then
          SFI.fFormatString := FDefaultFormat
        else
          SFI.fFormatString := '0.00';
      if j in [sstPercentByRow, sstPercentByCol] then SFI.fFormatString := '0.0"%"';
      SFI.FVisible := (i = Low(TFunction)) and (j = Low(TSubFunction));
    end;
  end;
end;

{$IFNDEF ASPRUNTIME}
destructor TSummaryInfo.Destroy;
var
  i: TFunction;
begin
  for i := low(TFunction) to high(TFunction) do fFunctions[integer(i)].Free;
  if TSummarySettings(Collection).GetOwner <> nil then FreeAndNil(FFormulaParser);
  inherited;
end;
{$ENDIF}

function TSummaryInfo.GetAggregate(SumIndex: TIntegerArray; AFunction: TFunction; out Res: Double): boolean;
begin
  if Calculated then
    begin

      FreeAndNil(FFormulaParser);
      if fFormula <> '' then FFormulaParser := TFormulaParser.Create2(FFormula, FGridInfo, Self);
      if FFormulaParser <> nil then
        Result := TFormulaParser(FFormulaParser).GetAggregate(SumIndex, Res)
      else
        Result := False;
    end
  else
    Result := FGridInfo.GetAggregate(SumState, SumIndex, AFunction, Res);
end;

function TSummaryInfo.SameName(const SummaryName: WideString): boolean;
begin
  Result := WideCompareText(SummaryName, Self.DisplayName) = 0;
  if not Result then Result := WideCompareText(SummaryName, Self.FieldName) = 0;
end;

function TSummaryInfo.GetCalculated: boolean;
begin
  Result := (FDimensionMapIndex = WrongIndex);
end;

function TSummaryInfo.GetDisplayName: WideString;
begin
  Result := fDisplayName;
end;

function TSummaryInfo.GetFunctions(AFunction: integer): TFunctionInfo;
begin
  if Calculated then
  if AFunction > integer(stSum) then
  if [csLoading, csDesigning] * TSummarySettings(Self.Collection).GridInfo.Owner.ComponentState = [] then
    InvalidFunctionError(DisplayName, TFunction(AFunction));
  Result := fFunctions[integer(AFunction)];
end;

function TSummaryInfo.GetSumID: integer;
begin
  if FSummaryState <> nil then
    Result := FSummaryState.SumID
  else
    Result := -1;
end;

function TSummaryInfo.GetVisible: boolean;
var
  i: TFunction;
begin
  Result := True;
  for i := low(TFunction) to high(TFunction) do if fFunctions[integer(i)].Visible then EXIT;
  Result := False;
end;

procedure TSummaryInfo.SetDisplayName(const Value: WideString);
begin
  if WideCompareStr(FDisplayName, Value) <> 0 then
  begin
    fDisplayName := Value;
    if SummarySettings.FUpdateCounter <= 0 then SummarySettings.Changed;
    Changed(False);
  end;
end;

procedure TSummaryInfo.SetFormula(const Value: WideString);
begin
  if Value <> fFormula then
  begin
    fFormula := WideTrim(Value);
    if SummarySettings.FUpdateCounter <= 0 then SummarySettings.Changed;
  end;
end;

procedure TSummaryInfo.SetFunctions(AFunction: integer; Value: TFunctionInfo);
begin
  if Value <> nil then fFunctions[AFunction].Assign(Value);
end;

procedure TSummaryInfo.SetVisible(Value: boolean);
var
  i: TFunction;
begin
  if Visible <> Value then
  begin
    SummarySettings.BeginUpdate;
    if Value then
      fFunctions[0].fSubFunctions[integer(low(TSubFunction))].Visible := True
    else
      for i := low(TFunction) to high(TFunction) do fFunctions[integer(i)].Visible := False;
    SummarySettings.EndUpdate;
  end;
end;

procedure TGridInfo.SyncSummaries;
var
  i: integer;
  SI: TSummaryInfo;
  DimensionMap: TDimSums;
  DS: TDimSum;
begin
  if fCube = nil then EXIT;
  DimensionMap := fCube.DimensionMap;
  for i := 0 to DimensionMap.Count - 1 do
  begin
    if DimensionMap[i].DimSumType <> dsSummary then CONTINUE;
    SI := SummarySettings.FindFieldName(DimensionMap[i].BaseFieldName);
    if SI <> nil then
      begin
        SI.fDisplayName := DimensionMap[i].DisplayName; 
        SI.FSummaryState := nil;
      end
    else
      begin
        SI := SummarySettings.Add;
        SI.FFieldName := DimensionMap[i].BaseFieldName;
        SI.FDisplayName := DimensionMap[i].DisplayName;
        SI.FDefaultFormat := DimensionMap[i].DefaultFormat;
        SI.InitAllChilds;
      end;
    SI.FDimensionMapIndex := i;
  end;

  for i := SummarySettings.Count - 1 downto 0 do
  begin
    SI := SummarySettings[i];
    if not SI.Calculated then
    begin
      DS := DimensionMap.FindSummary(SI.fFieldName);
      if (DS = nil) or (DS.DimSumType <> dsSummary) then SI.Free;
    end;
  end;

  for i := SummarySettings.Count - 1 downto 0 do
  begin
    SummarySettings[i].FID := i;
    SummarySettings[i].FGridInfo := Self;
  end;
end;

function TSummaryInfo.GetSummary: TSummary;
begin
  if FSummaryState <> nil then
    Result := FSummaryState.Sum
  else
    Result := nil;
end;

function TSummaryInfo.BuildStreamedSumInfo: TStreamedSumInfo;
var
  i, j: integer;
  StreamedFunction: TStreamedFunction;
  StreamedSubFunction: TStreamedSubFunction;
  FunctionInfo: TFunctionInfo;
  SubFunctionInfo: TSubFunctionInfo;
begin
  Result := TStreamedSumInfo.CreateCount(integer(high(TFunction)) + 1);
  Result.fCalculated := Calculated;
  Result.FDisplayName := FDisplayName;
  if Calculated then
    Result.FFormula := FFormula
  else
    Result.FFieldName := FFieldName;

  for i := 0 to integer(high(TFunction)) do
  begin
    FunctionInfo := fFunctions[i];
    StreamedFunction := TStreamedFunction.CreateCount(integer(high(TSubFunction)) + 1);
    
    for j := 0 to integer(high(TSubFunction)) do
    begin
      SubFunctionInfo := FunctionInfo.fSubFunctions[j];
      StreamedSubFunction := TStreamedSubFunction.Create;

      StreamedSubFunction.FVisible := SubFunctionInfo.Visible;
      StreamedSubFunction.FFormatString := SubFunctionInfo.FormatString;
      StreamedSubFunction.FAlignment := SubFunctionInfo.Alignment;

{$IFDEF ASPRUNTIME}
      StreamedFunction[j] := StreamedSubFunction;
{$ELSE}
      PPntrArray(StreamedFunction.FArrayPointer)^[j] := StreamedSubFunction;
{$ENDIF}
    end;

{$IFDEF ASPRUNTIME}
    Result[i] := StreamedFunction;
{$ELSE}
    PPntrArray(Result.FArrayPointer)^[i] := StreamedFunction;
{$ENDIF}
  end;
end;

procedure TSummaryInfo.RestoreStreamedSumInfo(StreamedSumInfo: TStreamedSumInfo);
var
  i, j: integer;
  StreamedFunction: TStreamedFunction;
  StreamedSubFunction: TStreamedSubFunction;
  FunctionInfo: TFunctionInfo;
  SubFunctionInfo: TSubFunctionInfo;
begin
  if StreamedSumInfo = nil then EXIT;
  FDisplayName := StreamedSumInfo.FDisplayName;
  if Calculated then
  begin
    FFieldName := FDisplayName;
    FFormula := StreamedSumInfo.FFormula;
  end;

  for i := 0 to StreamedSumInfo.Count - 1 do
  begin
    StreamedFunction := TStreamedFunction(StreamedSumInfo[i]);
    FunctionInfo := fFunctions[i];
    for j := 0 to StreamedFunction.Count - 1 do
    begin
      StreamedSubFunction := TStreamedSubFunction(StreamedFunction[j]);
      SubFunctionInfo := FunctionInfo.fSubFunctions[j];

      SubFunctionInfo.fVisible := StreamedSubFunction.fVisible;
      SubFunctionInfo.fFormatString := StreamedSubFunction.fFormatString;
      SubFunctionInfo.FAlignment := StreamedSubFunction.FAlignment;
    end;
  end;
end;

procedure TSummaryInfo.SetDefaultFormat(const Value: WideString);
var
  i, j: integer;
  Fun: TFunctionInfo;
  SubFun: TSubFunctionInfo;
begin
  if Value <> FDefaultFormat then
  begin
    for i := 0 to length(FFunctions) - 1 do
    begin
      Fun := FFunctions[i];
      for j := 0 to length(Fun.FSubFunctions) - 1 do
      begin
        SubFun := Fun.FSubFunctions[j];
        if SubFun.fFormatString = FDefaultFormat then SubFun.fFormatString := Value;
      end;
    end;
    FDefaultFormat := Value;
  end;
end;

function TSummaryInfo.GetSummarySettings: TSummarySettings;
begin
  {$IFDEF ASPRUNTIME}
  Result := TSummarySettings(Collection);
  {$ELSE}
  Result := pointer(Collection);
  {$ENDIF}
end;

function TSummaryInfo.NotCalculated: boolean;
begin
  Result := not Calculated;
end;

procedure TSummaryInfo.MoveTo(Index: integer);
begin
  SummarySettings.BeginUpdate;
  try
    if (Index >= 0) and (Index < Collection.Count) then
      inherited SetIndex(Index)
    else
      inherited SetIndex(Collection.Count - 1);
  finally
    SummarySettings.EndUpdate;
  end;
end;


function TSummarySettings.Add: TSummaryInfo;
begin
  Result := TSummaryInfo(inherited Add);
  Result.FGridInfo := FGridInfo;
end;

function TSummarySettings.AddSummary(const DisplayName, Formula: WideString): TSummaryInfo;
begin
  if FindDisplayName(DisplayName) <> nil then SummaryAlreadyExistsError(DisplayName);
  Result := Add;
  Result.FieldName := DisplayName;
  Result.DisplayName := DisplayName;
  Result.FFormula := Formula;
  Result.InitAllChilds;
  Result.FID := Count - 1;
  Result.FGridInfo := FGridInfo;
  FSumCountChanged := True;
  if FUpdateCounter <= 0 then Changed;
end;

procedure TSummarySettings.Assign(Source: TPersistent);
var
  i: integer;
  Fun, MaxFun: tFunction;
  SubFun: TSubFunction;
  SrcSumInfo, SumInfo: TSummaryInfo;
  SrcSubFunInfo, SubFunInfo: TSubFunctionInfo;
begin
  if Source is TSummarySettings then
    begin
      BeginUpdate;
      try
        if Count <> TSummarySettings(Source).Count then
        begin
          Clear;
          for i := 0 to TSummarySettings(Source).Count - 1 do Add;
        end;
        for i := 0 to TSummarySettings(Source).Count - 1 do
        begin
          SrcSumInfo := TSummarySettings(Source)[i];
          SumInfo := Items[i];
          SumInfo.fFormula := SrcSumInfo.fFormula;
          SumInfo.FFieldName := SrcSumInfo.FFieldName;
          SumInfo.FDisplayName := SrcSumInfo.FDisplayName;
          SumInfo.FDefaultFormat := SrcSumInfo.FDefaultFormat;
          SumInfo.FSummaryState := SrcSumInfo.FSummaryState;
          SumInfo.FID := SrcSumInfo.FID;
          SumInfo.FFormulaParser := SrcSumInfo.FFormulaParser;
          SumInfo.FDimensionMapIndex := SrcSumInfo.FDimensionMapIndex;
          SumInfo.fGridInfo := SrcSumInfo.fGridInfo;
          if SumInfo.Calculated then MaxFun := stSum else MaxFun := high(TFunction);
          for Fun := low(TFunction) to MaxFun do
          for SubFun := low(TSubFunction) to high(TSubFunction) do
          begin
            SrcSubFunInfo := SrcSumInfo[integer(Fun)][integer(SubFun)];
            SubFunInfo := SumInfo[integer(Fun)][integer(SubFun)];
            SubFunInfo.fVisible := SrcSubFunInfo.fVisible;
            SubFunInfo.fFormatString := SrcSubFunInfo.fFormatString;
          end;
        end;
      finally
        EndUpdate;
      end;
    end
  else
    inherited Assign(Source);
end;

constructor TSummarySettings.Create(AGridInfo: TGridInfo);
begin
  inherited Create(AGridInfo, TSummaryInfo);
  FGridInfo := AGridInfo;
end;

function TSummarySettings.FindDisplayName(const ADisplayName: WideString): TSummaryInfo;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  if WideCompareText(Items[i].FDisplayName, ADisplayName) = 0 then
  begin
    Result := Items[i];
    break;
  end;
end;

function TSummarySettings.FindFieldName(const AFieldName: WideString): TSummaryInfo;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  if WideCompareText(Items[i].FFieldName, AFieldName) = 0 then
  begin
    Result := Items[i];
    break;
  end;
end;

function TSummarySettings.GetItem(Index: Integer): TSummaryInfo;
begin
  Result := TSummaryInfo(inherited Items[Index]);
end;

function TSummarySettings.GetOwner: TPersistent;
begin
  Result := inherited GetOwner;
end;

procedure TSummarySettings.RemoveSummary(const DisplayName: WideString);
begin
  RemoveSummary(FindDisplayName(DisplayName));
end;

procedure TSummarySettings.RemoveSummary(SummaryInfo: TSummaryInfo);
var
  i: integer;
begin
  if SummaryInfo <> nil then
  if SummaryInfo.Calculated then
  begin
    SummaryInfo.Free;
    for i := 0 to Count - 1 do Items[i].FID := i;
    FSumCountChanged := True;
    if FUpdateCounter <= 0 then Changed;
  end;
end;

procedure TSummarySettings.SaveChanges(Target: TSummarySettings);
var
  i: integer;
  SrcSumInfo, TrgSumInfo: TSummaryInfo;
begin
  FSumCountChanged := False;
  for i := 0 to Count - 1 do
  begin
    SrcSumInfo := Items[i];
    if SrcSumInfo.FID = WrongIndex then
      begin  
        TrgSumInfo := Target.Add;
        TrgSumInfo.Assign(SrcSumInfo);
        FSumCountChanged := True;
      end
    else
      begin
        TrgSumInfo := Target.FindSumInfoID(SrcSumInfo.FID);
        if TrgSumInfo <> nil then
          TrgSumInfo.Assign(SrcSumInfo)
        else
          FSumCountChanged := True;
      end;
  end;
  for i := Target.Count - 1 downto 0 do
  begin
    TrgSumInfo := Target[i];
    if TrgSumInfo.FID <> WrongIndex then
    begin
      SrcSumInfo := FindSumInfoID(TrgSumInfo.FID);
      if SrcSumInfo = nil then
      begin
        TrgSumInfo.Free;
        FSumCountChanged := True;
      end;
    end;
  end;
  for i := 0 to Count - 1 do
  begin
    SrcSumInfo := Items[i];
    if SrcSumInfo.FID <> WrongIndex then
    begin
      TrgSumInfo := Target.FindSumInfoID(SrcSumInfo.FID);
      if TrgSumInfo <> nil then TrgSumInfo.MoveTo(i);
    end;
  end;
  if FSumCountChanged then
    for i := 0 to Target.Count - 1 do Target[i].FID := i;
  Target.FSumCountChanged := FSumCountChanged;
  Target.Changed;
end;

procedure TSummarySettings.SetItem(Index: Integer; Value: TSummaryInfo);
begin
  inherited Items[Index] := Value;
end;

function TSummarySettings.BuildStreamedSummarySettings: TStreamedSummarySettings;
var
  i: integer;
begin
  Result := TStreamedSummarySettings.CreateCount(Count);
  for i := 0 to Count - 1 do Result[i] := Items[i].BuildStreamedSumInfo; 
end;

function TSummarySettings.FindSumInfoID(SumInfoID: integer): TSummaryInfo;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  if Items[i].FID = SumInfoID then
  begin
    Result := Items[i];
    break;
  end;
end;

procedure TSummarySettings.BeginUpdate;
begin
  inc(FUpdateCounter);
end;

procedure TSummarySettings.EndUpdate;
begin
  dec(FUpdateCounter);
  if FUpdateCounter <= 0 then Changed;
end;

procedure TSummarySettings.Changed;
begin
  FUpdateCounter := 0;
  if FGridInfo <> nil then FGridInfo.ChangeSummarySettings(FSumCountChanged);
  FSumCountChanged := False;
end;

procedure TGridInfo.WriteCommonStream(Stream: TStream; StreamContent: TStreamContent; Buffer: pointer; Count: integer; SaveFactTable: boolean);
var
  l: integer;
  CurrentPivotState: TPivotState;
  SaveHidden, SaveVisible: boolean;
  MembersSaveMode: TMembersSaveMode;
begin
  if StreamContent = 0 then EXIT;
  if not Active then
    raise Exception.Create(GetResStr('xhecCantSaveInactiveGrid', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecCantSaveInactiveGrid));
    
  with Stream do
  begin
    WriteTag(Stream, tgCommonStream);

    WriteTag(Stream, tgCommonStream_VersionNumber);
    WriteInteger(Stream, FVersionNumber);

    if (StreamContent and scCube) > 0 then
    if FCube <> nil then
    begin
      l := FCube.StreamSize(SaveFactTable);
      if l > 0 then
      begin
        WriteTag(Stream, tgCommonStream_HierCube);
        WriteValueType(Stream, vtStreamedObject);
        Stream.Write(l, SizeOf(l)); 
        FCube.WriteStream(Stream, SaveFactTable);
      end;
    end;

    if (StreamContent and scPivotStateList) > 0 then
      WriteStreamedObject(Stream, FPivotStates, tgCommonStream_PivotStateList);

    if (StreamContent and scCurrentPivotState) > 0 then
    begin
      CurrentPivotState := TPivotState.Create;
      try
        SaveHidden := (StreamContent and scHiddenMembers) > 0;
        SaveVisible := (StreamContent and scVisibleMembers) > 0;
        if SaveHidden and not SaveVisible then
          MembersSaveMode := smSaveHiddenOnly
        else if not SaveHidden and SaveVisible then
          MembersSaveMode := smSaveVisibleOnly
        else
          MembersSaveMode := smSaveAll;
        CurrentPivotState.SaveState(Self, MembersSaveMode);
        WriteStreamedObject(Stream, CurrentPivotState, tgCommonStream_PivotState);
      finally
        CurrentPivotState.Free;
      end;
    end;

    if (StreamContent and scFunctionDefs) > 0 then
    if FFunctionDefs <> nil then
    begin
      l := FFunctionDefs.StreamSize;
      if l > 0 then
      begin
        WriteTag(Stream, tgCommonStream_FunctionDefs);
        WriteValueType(Stream, vtStreamedObject);
        Stream.Write(l, SizeOf(l)); 
        FFunctionDefs.WriteStream(Stream);
      end;
    end;

    if (StreamContent and scSubFunctionDefs) > 0 then
    if FSubFunctionDefs <> nil then
    begin
      l := FSubFunctionDefs.StreamSize;
      if l > 0 then
      begin
        WriteTag(Stream, tgCommonStream_SubFunctionDefs);
        WriteValueType(Stream, vtStreamedObject);
        Stream.Write(l, SizeOf(l)); 
        FSubFunctionDefs.WriteStream(Stream);
      end;
    end;

    {$IFNDEF ASPRUNTIME}
    if (Buffer <> nil) and (Count > 0) then
    begin
      WriteTag(Stream, tgCommonStream_UserData);
      WriteBinary(Stream, Buffer^, Count);
    end;
    {$ENDIF}

    WriteTag(Stream, tgCommonStream_EOT);
  end;
end;

procedure TGridInfo.ReadCommonStream(Stream: TStream; Buffer: pointer; RestoreMode: TMembersRestoreMode);
var
  Tag, L: word;
  HierCubeFound: boolean;
  PivotState: TPivotState;
begin
  HierCubeFound := False;
  PivotState := nil;
  try
    CheckTag(Stream, tgCommonStream);
    with Stream do
    repeat
      Read(Tag, SizeOf(Tag));
      case Tag of
        tgCommonStream_HierCube:
          with FCube do
          begin
            if ReadValueType(Stream) <> vtStreamedObject then InvalidPropError(Stream.Position - SizeOf(TxhValueType));
            Read(L, SizeOf(Integer));
            HierCubeFound := True;

            if Active then Active := False;
            {$IFNDEF ASPRUNTIME}
            Application.ProcessMessages;
            {$ENDIF}
            DoBeforeOpen;
            try
              FCube.ReadStream(Stream);
            except
              FState := dcInactive;
              Clear;
              raise;
            end;
          end;
        tgCommonStream_PivotStateList:
          begin
            if (HierCubeFound = False) and not Active then
              raise Exception.Create(GetResStr('xhCantRestoreInactiveGrid', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhCantRestoreInactiveGrid));
            FPivotStates.Clear;
            ReadStreamedObject(Stream, FPivotStates);
          end;
        tgCommonStream_PivotState:
          begin
            if (HierCubeFound = False) and not Active then
              raise Exception.Create(GetResStr('xhCantRestoreInactiveGrid', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhCantRestoreInactiveGrid));
            PivotState := TPivotState.Create;
            ReadStreamedObject(Stream, PivotState);
          end;
        {$IFNDEF ASPRUNTIME}
        tgCommonStream_UserData:
          begin
            if Buffer <> nil then
              ReadBinary(Stream, Buffer^)
            else
              SkipValue(Stream);
          end;
        {$ENDIF}
        tgCommonStream_FunctionDefs:
          with FFunctionDefs do
          begin
            if ReadValueType(Stream) <> vtStreamedObject then InvalidPropError(Stream.Position - SizeOf(TxhValueType));
            Read(L, SizeOf(Integer));
            FFunctionDefs.ReadStream(Stream);
          end;
        tgCommonStream_SubFunctionDefs:
          with FSubFunctionDefs do
          begin
            if ReadValueType(Stream) <> vtStreamedObject then InvalidPropError(Stream.Position - SizeOf(TxhValueType));
            Read(L, SizeOf(Integer));
            FSubFunctionDefs.ReadStream(Stream);
          end;
        tgCommonStream_EOT:
          begin
            if HierCubeFound then
            with FCube do
            begin
              FState := dcBrowseAllData;
              DoAfterOpen;
              StateChanged;
              try
                NotifyLinkedControls(xeReadFromStream);
              finally
              end;
            end;
            if PivotState <> nil then
              RestorePivotState(PivotState, RestoreMode);
            BREAK;
          end;
      else 
        SkipValue(Stream);
      end;
    until False;
  finally
    PivotState.Free;
  end;
end;

function TCustomHierCube.StreamSize(SaveFactTable: boolean): integer;
begin
  Result := TagSize * 3 + IntegerSize(FVersionNumber) + StreamedobjectSize(FDimensions) +
    StreamedobjectSize(FSummaries);
  if SaveFactTable then
  begin
    {$IFDEF ASPRUNTIME}
    CheckFactTablePresence;
    {$ENDIF}
    Result := Result + StreamedObjectSize(FFactTable);
  end;
end;

procedure TGridInfo.LoadFromFile(const FName: WideString; Buffer: pointer = nil; RestoreMode: TMembersRestoreMode = rmRestoreHidden);
var
  Stream: TWideFileStream;
begin
  Stream := TWideFileStream.Create(FName, fmOpenRead);
  try
    LoadFromStream(Stream, Buffer, RestoreMode);
  finally
    Stream.Free;
  end;
end;

procedure TGridInfo.LoadFromStream(Stream: TStream; Buffer: pointer = nil; RestoreMode: TMembersRestoreMode = rmRestoreHidden);
var
  TmpStream: TSmartMemoryStream;
  f: integer;
begin
  f := THierCube.CheckStreamFormat(Stream);
  if f < 0 then InvalidStreamFormatError;
  if (f and sfCompressFlag) = 0 then
  begin
    ReadCommonStream(Stream, Buffer, RestoreMode);
    EXIT;
  end;
  TmpStream := TSmartMemoryStream.Create;
  try
    UnCompressStream(Stream, TmpStream);
    TmpStream.Position := 0;
    ReadCommonStream(TmpStream, Buffer, RestoreMode);
  finally
    TmpStream.Free;
  end;
end;

procedure TGridInfo.SaveToFile(const FName: WideString; StreamContent: TStreamContent; Buffer: pointer = nil; Count: integer = 0);
var
  Stream: TWideFileStream;
begin
  Stream := TWideFileStream.Create(FName, fmCreate);
  try
    SaveToStream(Stream, StreamContent, True, Buffer, Count);
  finally
    Stream.Free;
  end;
end;

{$IFDEF ASPRUNTIME}
procedure TGridInfo.SaveToStream(Stream: TStream; StreamContent: TStreamContent; SaveFactTable: boolean; Buffer: pointer = nil; Count: integer = 0);
begin
  WriteCommonStream(Stream, StreamContent, Buffer, Count, SaveFactTable);
end;
{$ELSE}
procedure TGridInfo.SaveToStream(Stream: TStream; StreamContent: TStreamContent; SaveFactTable: boolean; Buffer: pointer = nil; Count: integer = 0);
var
  TmpStream: TMemoryStream;
begin
  TmpStream := TMemoryStream.Create;
  try
    WriteCommonStream(TmpStream, StreamContent, Buffer, Count, SaveFactTable);
    TmpStream.Position := 0;
    CompressStream(TmpStream, Stream);
  finally
    TmpStream.Free;
  end;
end;
{$ENDIF}

procedure TGridInfo.NilAllArrays;
begin
  FreeAndNil(FRowDimIDs); FreeAndNil(FColDimIDs); FreeAndNil(FPageDimIDs);
  FreeAndNil(FActiveDimIDs); FreeAndNil(FActiveDimIndexes);

  FreeAndNil(FIntegerArray1); FreeAndNil(FIntegerArray2); FreeAndNil(FIntegerArray3);
  FreeAndNil(FIntegerArray4); FreeAndNil(FIntegerArray5); FreeAndNil(FIntegerArray10);
  FreeAndNil(FIntegerArray11);
  
  FreeAndNil(FVisibleRowDimIDs); FreeAndNil(FVisibleColDimIDs);

{$IFNDEF ASPRUNTIME}
  FreeAndNil(FColoredCells);
{$ENDIF}

  FreeAndNil(FGridSummaryArray);
  FreeAndNil(FRowCaptionNodes); FreeAndNil(FColCaptionNodes);
  FreeAndNil(FColSubLevelNodes); FreeAndNil(FRowLabelNodes); FreeAndNil(FColLabelNodes);
  FreeAndNil(FVisibleColSubLevelNodes);
  FreeAndNil(FVisibleRowNodes);
  FreeAndNil(FVisibleColNodes);
  FreeAndNil(FSummaryStates);
  FreeAndNil(FDimensionStates);
  FreeAndNil(FOpenRowNodes); FreeAndNil(FOpenColNodes);
end;

procedure TGridInfo.SortDimIDsByDimLength(DimIDs: TIntegerArray);
var
  i, j: integer;
begin
  for j := 0 to DimIDs.Count - 2 do
  for i := DimIDs.Count - 1 downto j + 1 do
  if TDimensionState(FDimensionStates[DimIDs[i]]).MemberCount > TDimensionState(FDimensionStates[DimIDs[i - 1]]).MemberCount then
{$IFDEF ASPRUNTIME}
  DimIDs.Exchange(i, i-1);
{$ELSE}
  asm
     mov     EDX, [DimIDs]
     mov     EDX, [EDX + TBaseArray.FArrayPointer]
     mov     ECX, [i]
     mov     EAX, [EDX + ECX * TYPE Integer]          
     xchg    EAX, [EDX + ECX * TYPE Integer - TYPE Integer]
     mov     [EDX + ECX * TYPE Integer], EAX
  end;
{$ENDIF}
end;

function TGridInfo.NewActiveDimIDs: boolean;
var
  i: integer;
  DimIDs: TIntegerArray;
label changed;
begin
  DimIDs := TIntegerArray.Create;
  try
   for i := 0 to FRowDimIDs.Count - 1 do DimIDs.Add(FRowDimIDs[i]);
   for i := 0 to FColDimIDs.Count - 1 do DimIDs.Add(FColDimIDs[i]);
   SortDimIDsByDimLength(DimIDs);
   if FActiveDimIDs = nil then goto changed;
   if FActiveDimIDs.Count <> DimIDs.Count then goto changed;
   for i := 0 to DimIDs.Count - 1 do
     if DimIDs[i] <> FActiveDimIDs[i] then goto changed;
   Result := False;
   EXIT;

 changed:
   FActiveDimIDs.Free; 
   FActiveDimIDs := DimIDs;
   Result := True;
  finally
   if FActiveDimIDs <> DimIDs then DimIDs.Free;
  end;
end;

procedure TCustomHierCube.SetOptions(const Value: THierCubeOptions);
begin
  Options.Assign(Value);
end;

procedure TGridInfo.SyncSummaries2;
var
  i: integer;
  SI: TSummaryInfo;
  Summaries: TSummaries;
  Sum: TSummary;
begin
  if fCube = nil then EXIT;
  Summaries := fCube.Summaries;
  SummarySettings.Clear;
  for i := 0 to Summaries.Count - 1 do
  begin
    Sum := TSummary(Summaries[i]);
    SI := SummarySettings.Add;
    SI.FieldName := Sum.FieldName;
    SI.FDisplayName := Sum.DisplayName;
    SI.FDefaultFormat := Sum.DefaultFormat;

    SI.InitAllChilds;
    SI.FDimensionMapIndex := Sum.DimensionMapIndex;
    SI.FID := i;
    SI.FGridInfo := Self;
  end;
end;

procedure TGridInfo.SetupSummaryData;
var
  SumID: integer;
  Sum: TSummary;
  Summaries: TSummaries;
  SumState: TSummaryState;
  SumInfo: TSummaryInfo;
  i: integer;
begin
  BeginChange;
  try
    if Active and (FCube.Dimensions.Count > 0) and (FCube.Summaries.Count > 0) then
      begin
        Summaries := FCube.Summaries;
        FSummaryStates.Free;
        FSummaryStates := TSummaryStates.CreateCount(Self, Summaries.Count);
        for SumID := 0 to Summaries.Count - 1 do
        begin
          Sum := TSummary(Summaries[SumID]);
          SumState := TSummaryState.Create(Sum, SumID, Self);
          SumInfo := FSummarySettings.FindFieldName(Sum.FieldName);
          SumState.fSummaryInfo := SumInfo;
          SumInfo.FSummaryState := SumState;
          SumInfo.DimensionMapIndex := Sum.DimensionMapIndex;
          FSummaryStates[SumID] := SumState;
        end;
        FreeAndNil(FActiveDimIDs);
      end
    else
      begin
        for i := 0 to FSummarySettings.Count - 1 do FSummarySettings[i].FSummaryState := nil;
      end;
  finally
    EndChange(geSourceChange, 0);
  end;
end;

function TGridInfo.Row2LabelNode(ARow: integer): TLabelNode; register;
asm
        mov     eax, [eax + TGridInfo.FVisibleRowNodes]
        or      eax, eax
        jnz     @@1
        ret
@@1:
        mov     eax, [eax + TBaseArray.FArrayPointer]
        mov     eax, [eax + edx*4]
end;

function TGridInfo.Col2LabelNode(ACol: integer): TLabelNode; register;
asm
        mov     eax, [eax + TGridInfo.FVisibleColSubLevelNodes]
        or      eax, eax
        jnz     @@1
        ret
@@1:
        mov     eax, [eax + TBaseArray.FArrayPointer]
        mov     eax, [eax + edx*4]
        mov     eax, [eax + TSubLevelNode.FLabelNode]
end;

function TGridInfo.AddressDimensionIndex(DimState: TDimensionState): integer;
begin
  Result := -1;
  if (DimState <> nil) and (FActiveDimIndexes <> nil) and (FActiveDimIndexes.Count > 0) then
    Result := FActiveDimIndexes[DimState.DimID];
end;

function TGridInfo.AddressDimensionIndex(const DimensionName: WideString): integer;
var
  DimState: TDimensionState;
begin
  DimState := FDimensionStates.FindDisplayName(DimensionName);
  if DimState = nil then DimState := FDimensionStates.FindFieldName(DimensionName);
  Result := AddressDimensionIndex(DimState);
end;

function TGridInfo.CreateCurrentPivotState(MembersSaveMode: TMembersSaveMode = smSaveAll): TPivotState;
begin
  Result := TPivotState.Create;
  Result.SaveState(Self, MembersSaveMode);
end;

procedure TGridInfo.SetWordArap(Value: boolean);
begin
  if Value <> FWordWrap then
  begin
    BeginChange;
    FWordWrap := Value;
    EndChange(geNewGridLayout, msgKeepTopLeftMask);
  end;
end;

procedure TooLargeError;
begin
  raise ECubeError.Create(gETrESsTR('xhecTooLargeActiveCapacity', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecTooLargeActiveCapacity));
end;

procedure TGridInfo.CheckNewDimension(OldDimID, DimID: integer);
var
  j: integer;
  cRange: CubeInteger;
begin
  j := TDimensionState(FDimensionStates[DimID]).MemberCount + 1;
  cRange := FCubeCapacity;
  if OldDimID >= 0 then cRange := cRange div (TDImensionState(FDimensionStates[OldDimID]).MemberCount + 1);
  {$IFDEF ASPRUNTIME}
  cRange := cRange * j;
  {$ELSE}
  asm
       mov    EAX, j
       mov     ecx, eax
       mul     dword ptr [cRange+4]
       or      edx, edx
       jz      @@1
       call    TooLargeError
    @@1:
       xchg    ecx, eax
       mul     dword ptr [cRange]
       add     edx, ecx
       jnc     @@2              
       call    TooLargeError
    @@2:
       mov    dword ptr [cRange], EAX
       mov    dword ptr [cRange + $04], EDX
  end;
  {$ENDIF}
  if FActiveDimIDs <> nil then
  if (FActiveDimIDs.Count = 31) and (OldDimID < 0) then  raise ECubeError.Create(GetResStr('xhecTooMuchDimensions', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecTooMuchDimensions));
end;

procedure TGridInfo.CheckNewActiveDimensions(DimIDs: TIntegerArray);
var
  DimID, j: integer;
  cRange: CubeInteger;
begin
  if DimIDs = nil then EXIT;
  if (DimIDs.Count > 32) then raise ECubeError.Create(GetResStr('xhecTooMuchDimensions', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecTooMuchDimensions));
  cRange := 0;
  for DimID := 0 to DimIDs.Count - 1 do
  begin
    j := TDimensionState(FDimensionStates[DimID]).MemberCount + 1;
{$IFDEF ASPRUNTIME}
    cRange := cRange * j;
{$ELSE}
    asm
         mov    EAX, j
         mov     ecx, eax
         mul     dword ptr [cRange+4]
         or      edx, edx
         jz      @@1
         call    TooLargeError
      @@1:
         xchg    ecx, eax
         mul     dword ptr [cRange]
         add     edx, ecx
         jnc     @@2              
         call    TooLargeError
      @@2:
         mov    dword ptr [cRange], EAX
         mov    dword ptr [cRange + $04], EDX
    end;
{$ENDIF}
  end;
end;

procedure TGridInfo.SetLowestSubLevelNode(Value: TSubLevelNodeType);
begin
  if FLowestSubLevelNode <> Value then
  begin
    BeginChange;
    FLowestSubLevelNode := Value;
    EndChange(geSubLevelNodeChanged, 0);
  end;
end;

procedure TCustomHierCube.UpdateFactTable;
begin
  RefreshFactTable(True);
end;

procedure TGridInfo.RebuildDimStates;
var
  DimState: TDimensionState;
  DimID: integer;
  StreamedDimState: TStreamedDimState;
begin
  for DimID := FDimensionStates.Count - 1 downto 0 do
  begin
    DimState := TDimensionState(FDimensionStates[DimID]);
    StreamedDimState := DimState.BuildStreamedDimState(smSaveHiddenOnly);
    try
      DimState.RestoreStreamedDimState(StreamedDimState, rmRestoreHidden);
    finally
      StreamedDimState.Free;
    end;
  end;
end;


function TDimMembers.FindGroupCaption(const Caption: WideString): integer;
begin
  Result := FindGroupCaption(Caption, 0);
end;

function TDimMembers.FindGroupCaption(const Caption: WideString; StartIndex: integer): integer; 
var
  i, C: integer;
  Member: TDimMember;
begin
  Result := -1;
  for i := StartIndex to Count - 1 do
  begin
    Member := TDimMember(Items[i]);
    if FCaseSensitive then
      C := WideCompareStr(Caption, Member.FCaption)
    else
      C := WideCompareText(Caption, Member.FCaption);
    if C = 0 then
    begin
      Result := i;
      BREAK;
    end;
  end;
end;

procedure TDimMembers.DeleteMember(Member: TDimMember; DeleteGroup: boolean);
var
  Siblings: TDimMembers;
  Index: integer;
  Parent: TDimMember;
begin
  Parent := Member.Parent;
  if Parent <> nil then
    Siblings := Parent.FChildMembers
  else
    Siblings := Self;
  Index := Siblings.IndexOf(Member);
  if Index >= 0 then
  begin
    Member.Free;
    Siblings.Delete(Index);
    if (Parent <> nil) and ((Parent.IsGroup = False) or DeleteGroup) and (Siblings.Count = 0) then
      FreeAndNil(Parent.FChildMembers);
  end;
end;


procedure TDimMembers.Assign(Source: TPersistent);

  procedure Process(Members: TDimMembers; ParentMember: TDimMember);
  var
    i: integer;
    TargetMembers: TDimMembers;
    Member: TDimMember;
  begin
    if ParentMember = nil then
      TargetMembers := Self
    else
      begin
        if ParentMember.ChildMembers = nil then
          ParentMember.ChildMembers := TDimMembers.Create;
        TargetMembers := ParentMember.ChildMembers;
      end;

    for i := 0 to Members.Count - 1 do
    begin
      Member := TDimMember(Members[i]).Clone;
      Member.FParent := ParentMember;
      TargetMembers.Add(Member);
      if TDimMember(Members[i]).ChildMembers <> nil then Process(TDimMember(Members[i]).ChildMembers, Member);
    end;
  end;

begin
  if Source is TDimMembers then
    begin
      Clear;
      Process(TDimMembers(Source), nil);
    end
  else
    inherited;
end;

function TDimMembers.FindMember(const StringID: WideString; Dim: TDimension): TDimMember;

  function ProcessMembers(Members: TDimMembers): TDimMember;
  var
    i: integer;
    Member: TDimMember;
  begin
    Result := nil;
    for i := 0 to Members.Count - 1 do
    begin
      Member := TDimMember(Members[i]);
      if (Member.DimIndex >= 0) and (WideCompareStr(Dim.FStringKeys[Member.DimIndex], StringID) = 0) then
        Result := Member
      else
        begin
          if Member.ChildMembers <> nil then Result := ProcessMembers(Member.ChildMembers);
        end;
      if Result <> nil then BREAK;
    end;
  end;

begin
  Result := nil;
  if Self <> nil then Result := ProcessMembers(Self);
end;

function TDimMembers.FindQualifiedNameHash(Hash: integer): TDimMember;

  function ProcessMembers(Members: TDimMembers): TDimMember;
  var
    i: integer;
    Member: TDimMember;
  begin
    Result := nil;
    for i := 0 to Members.Count - 1 do
    begin
      Member := TDimMember(Members[i]);
      if Member.FIDHash = Hash then
        Result := Member
      else
        begin
          if Member.ChildMembers <> nil then Result := ProcessMembers(Member.ChildMembers);
        end;
      if Result <> nil then BREAK;
    end;
  end;

begin
  Result := nil;
  if Self <> nil then Result := ProcessMembers(Self);
end;

function TDimMembers.FindDimIndex(DimIndex: integer): TDimMember;

  function ProcessMembers(Members: TDimMembers): TDimMember;
  var
    i: integer;
    Member: TDimMember;
  begin
    Result := nil;
    for i := 0 to Members.Count - 1 do
    begin
      Member := TDimMember(Members[i]);
      if not Member.IsGroup and (Member.DimIndex = DimIndex) then
        Result := Member
      else
        begin
          if Member.ChildMembers <> nil then Result := ProcessMembers(Member.ChildMembers);
        end;
      if Result <> nil then BREAK;
    end;
  end;

begin
  Result := nil;
  if DimIndex < 0 then EXIT;
  if Self <> nil then Result := ProcessMembers(Self);
end;

function TDimMembers.FindMember(IntegerID: integer; Dim: TDimension): TDimMember;

  function ProcessMembers(Members: TDimMembers): TDimMember;
  var
    i: integer;
    Member: TDimMember;
  begin
    Result := nil;
    for i := 0 to Members.Count - 1 do
    begin
      Member := TDimMember(Members[i]);
      if (Member.DimIndex >= 0) and (Dim.FItems[Member.DimIndex] = IntegerID) then
        Result := Member
      else
        begin
          if Member.ChildMembers <> nil then Result := ProcessMembers(Member.ChildMembers);
        end;
      if Result <> nil then BREAK;
    end;
  end;

begin
  Result := nil;
  if Self <> nil then Result := ProcessMembers(Self);
end;

procedure TDimMembers.InitFromTDimension(Dim: TDimension; const Attribute: WideString);
var
  i, Index, ParentIndex: integer;
  DimItems, NewItemIndexes, DimIndexesFromFactTable, FParents: TIntegerArray;
  Member, ParentMember: TDimMember;
  FMemberCount: integer;
  FAllMembers: TPointerArray;
  StrKeysNotNil: boolean;
  DimNames, DefaultNames: TWideStringArray;
  s: WideString;
begin
  DimNames := nil;
  DefaultNames := nil;
  if Dim.AttributeList <> nil then
  begin
    Index := Dim.AttributeList.IndexOf(Attribute);
    if Index >= 0 then
    begin
      DimNames := TWideStringArray(Dim.AttributeList.Pointers[Index]);
      if DimNames <> nil then if DimNames.Count = 0 then DimNames := nil;
    end;
    Index := Dim.AttributeList.IndexOf(Dim.DefaultAttribute);
    if Index >= 0 then
    begin
      DefaultNames := TWideStringArray(Dim.AttributeList.Pointers[Index]);
      if DefaultNames <> nil then if DefaultNames.Count = 0 then DefaultNames := nil;
    end;
  end;
  FParents := nil;
  DimItems := Dim.Items;
  StrKeysNotNil := (Dim.StrID and (Dim.FStringKeys <> nil) and (Dim.FStringKeys.Count > 0));
  Clear;
  if Dim.FUsedMembers = nil then
    begin
      if not Dim.FHier then
        begin
          for i := 0 to DimItems.Count - 1 do
          begin
            Member := TDimMember.Create(nil);
            Member.FDimIndex := i;
            Member.FRank := i;
            Member.FDatabaseRank := Dim.FDatabaseRanks[i];
            if DefaultNames <> nil then
              s := DefaultNames[i]
            else if StrKeysNotNil then
              s := Dim.FStringKeys[i]
            else
              s := xhIntToWideStr(DimItems[i]);
            Member.FOriginalID := MemberCaption2ID(s);

            if DimNames <> nil then
              Member.FCaption := DimNames[i]
            else
              Member.FCaption := s;
            Add(Member);
          end;
        end
      else
        begin
          fMemberCount := DimItems.Count;
          FAllMembers := TPointerArray.CreateCount(fMemberCount);
          try
            for i := 0 to fMemberCount - 1 do
            begin
              Member := TDimMember.Create(nil);
              Member.FDimIndex := i;
              Member.FRank := i;
              Member.FDatabaseRank := Dim.FDatabaseRanks[i];
              if DefaultNames <> nil then
                s := DefaultNames[i]
              else if StrKeysNotNil then
                s := Dim.FStringKeys[i]
              else
                s := xhIntToWideStr(DimItems[i]);
              Member.FOriginalID := MemberCaption2ID(s);

              if DimNames <> nil then
                Member.FCaption := DimNames[i]
              else
                Member.FCaption := s;
              FAllMembers[i] := Member;
            end;
            for i := 0 to fMemberCount - 1 do
            begin
              ParentIndex := Dim.FParents[i];
              if ParentIndex >= 0 then
                begin
                  ParentMember := TDimMember(FAllMembers[ParentIndex]);
                  if ParentMember.FChildMembers = nil then ParentMember.FChildMembers := TDimMembers.Create;
                  Member := TDimMember(FAllMembers[i]);
                  ParentMember.FChildMembers.Add(Member);
                  Member.FParent := ParentMember;
                end
              else 
                Add(TDimMember(FAllMembers[i]));
            end;
          finally
            FreeAndNil(FAllMembers);
          end;
        end;
    end
  else
    begin
      if not Dim.FHier then
        begin
          DimIndexesFromFactTable := Dim.FUsedMembers;
          for i := 0 to DimIndexesFromFactTable.Count - 1 do
          begin
            Index := DimIndexesFromFactTable[i];
            Member := TDimMember.Create(nil);
            Member.FDimIndex := Index;
            Member.FRank := i;
            Member.FDatabaseRank := Dim.FDatabaseRanks[Index];
             if DefaultNames <> nil then
               s := DefaultNames[Index]
             else if StrKeysNotNil then
               s := Dim.FStringKeys[Index]
             else
               s := xhIntToWideStr(DimItems[Index]);
             Member.FOriginalID := MemberCaption2ID(s);

             if DimNames <> nil then
               Member.FCaption := DimNames[Index]
             else
               Member.FCaption := s;
            Add(Member);
          end
        end
      else
        begin
          NewItemIndexes := TIntegerArray.Create;
          try
            NewItemIndexes.Assign(Dim.FUsedMembers);
            DimIndexesFromFactTable := Dim.FUsedMembers;
            for i := 0 to DimIndexesFromFactTable.Count - 1 do
            begin
              Index := DimIndexesFromFactTable[i];
              ParentIndex := Dim.FParents[Index];
              while ParentIndex >= 0 do
              begin
                NewItemIndexes.Add(ParentIndex);
                ParentIndex := Dim.FParents[ParentIndex];
              end;
            end;
            fMemberCount := NewItemIndexes.Count;
            FParents := TIntegerArray.CreateCount(fMemberCount);
            FAllMembers := TPointerArray.CreateCount(fMemberCount);
            for i := 0 to fMemberCount - 1 do
            begin
              Index := NewItemIndexes[i];
              FParents[i] := NewItemIndexes.IndexOf(Dim.FParents[Index]);
              Member := TDimMember.Create(nil);
              Member.FDimIndex := Index;
              Member.FRank := i;
              Member.FDatabaseRank := Dim.FDatabaseRanks[Index];
              if DefaultNames <> nil then
                s := DefaultNames[Index]
              else if StrKeysNotNil then
                s := Dim.FStringKeys[Index]
              else
                s := xhIntToWideStr(DimItems[Index]);
              Member.FOriginalID := MemberCaption2ID(s);

              if DimNames <> nil then
                Member.FCaption := DimNames[Index]
              else
                Member.FCaption := s;
              FAllMembers[i] := Member;
            end;
            for i := 0 to fMemberCount - 1 do
            begin
              ParentIndex := FParents[i];
              if ParentIndex >= 0 then
                begin
                  ParentMember := TDimMember(FAllMembers[ParentIndex]);
                  if ParentMember.FChildMembers = nil then ParentMember.FChildMembers := TDimMembers.Create;
                  Member := TDimMember(FAllMembers[i]);
                  ParentMember.FChildMembers.Add(Member);
                  Member.FParent := ParentMember;
                end
              else
                Add(TDimMember(FAllMembers[i]));
            end;
          finally
            FAllMembers.Free;
            FParents.Free;
            NewItemIndexes.Free;
          end;
        end;
    end;
  MakeQualifiedNames;
end;

procedure TDimMembers.MoveToChildren(Index: integer; newParent: TDimMember);
var
  Member: TDimMember;
begin
  if NewParent.ChildMembers = nil then
    NewParent.ChildMembers := TDimMembers.Create;
  Member := TDimMember(Items[Index]);
  NewParent.ChildMembers.Add(Member);
  Member.FParent := NewParent;
  Items[Index] := nil;
  Delete(Index);
end;

procedure TDimMembers.SetAllVisible(Visible: boolean);

  procedure ProcessMembers(Members: TDimMembers);
  var
    i: integer;
    Member: TDimMember;
  begin
    for i := 0 to Members.Count - 1 do
    begin
      Member := TDimMember(Members[i]);
      Member.FVisible := Visible;
      if Member.ChildMembers <> nil then ProcessMembers(Member.ChildMembers);
    end;
  end;

begin
  ProcessMembers(Self);
end;

procedure TDimMembers.MakeQualifiedNames;

  procedure ProcessMembers(Members: TDimMembers);
  var
    i: integer;
    Member: TDimMember;
  begin
    for i := 0 to Members.Count - 1 do
    begin
      Member := TDimMember(Members[i]);
      Member.MakeQualifiedName;
      if Member.ChildMembers <> nil then ProcessMembers(Member.ChildMembers);
    end;
  end;

begin
  ProcessMembers(Self);
end;
  
procedure TDimMembers.CorrectVisible;

  function ProcessMembers(Members: TDimMembers): boolean;
  var
    i: integer;
    Member: TDimMember;
  begin
    Result := False;
    for i := 0 to Members.Count - 1 do
    begin
      Member := TDimMember(Members[i]);
      if Member.ChildMembers = nil then
        Result := Result or Member.FVisible
      else
        begin
          Member.FVisible := ProcessMembers(Member.ChildMembers);
          Result := Result or Member.FVisible;
        end;
    end;
  end;

begin
  ProcessMembers(Self);
end;


function TDimMember.AddChild: TDimMember;
begin
  Result := TDimMember.Create(Self);
  if FChildMembers = nil then FChildMembers := TDimMembers.Create;
  FChildMembers.Add(Result);
end;

procedure TDimMembers.UpdateRanks;
var
  R: integer;

  procedure ProcessNodes(Members: TDimMembers);
  var
    i: integer;
    M: TDimMember;
  begin
    for i := 0 to Members.Count - 1 do
    begin
      M := TDimMember(Members[i]);
      M.FRank := R; inc(R);
      if M.FChildMembers <> nil then ProcessNodes(M.FChildMembers); 
    end;
  end;

begin
  R := 0;
  ProcessNodes(Self);
end;

function TDimMembers.Add(DimMember: TDimMember): Integer;
begin
  if DimMember <> nil then DimMember.FMembers := Self;
  Result := inherited Add(DimMember);
end;

function TDimMembers.MoveToGroup(SourceMember, TargetGroup: TDimMember): boolean;
var
  Chain, Leaves: TPointerArray;
  i, j: integer;
  NewMember, P, M, Leaf: TDimMember;
  
  procedure AddLeaves(Member: TDimMember);
  var
    i: integer;
    Childs: TDimMembers;
  begin
    Childs := Member.FChildMembers;
    if Childs = nil then
      Leaves.Add(Member)
    else
      for i := 0 to Childs.Count - 1 do
      AddLeaves(TDimMember(Childs[i]));
  end;

  function FindIDAmongChilds(Member: TDimMember; ID: integer): TDimMember;
  var
    i: integer;
    M: TDimMember;
    Childs: TDimMembers;
  begin
    Result := nil;
    Childs := Member.FChildMembers;
    if Childs <> nil then
    for i := 0 to Childs.Count - 1 do
    begin
      M := TDimMember(Childs[i]);
      if M.DimIndex = ID then
      begin
        Result := M;
        BREAK;
      end;
    end;
  end;

begin
  Result := False;
  if (SourceMember = nil) or (TargetGroup = nil) or not TargetGroup.IsGroup then EXIT;
  if SourceMember.GetGroup = TargetGroup then EXIT; 
  Chain := TPointerArray.Create;
  Leaves := TPointerArray.Create;
  try
    AddLeaves(SourceMember);

    for j := 0 to Leaves.Count - 1 do
    begin
      Leaf := TDimMember(Leaves[j]);

      Chain.Clear;
      P := Leaf;
      while P <> nil do
      begin
        if not P.IsGroup then Chain.Add(P);
        P := P.Parent;
      end;

      P := TargetGroup; 
      for i := Chain.Count - 1 downto 0 do
      begin
        M := TDimMember(Chain[i]);
        NewMember := FindIDAmongChilds(P, M.DimIndex);
        if NewMember = nil then
        begin
          NewMember := P.AddChild;
          NewMember.Assign(M);
        end;
        P := NewMember;
      end;
    end; 
    
    for j := 0 to Leaves.Count - 1 do
    begin
      M := TDimMember(Leaves[j]);
      repeat
        if M.FChildMembers = nil then
          begin
            P := M.Parent;
            DeleteMember(M, False);
            M := P;
          end
        else
          P := nil;
      until P = nil;
    end;
    
    Result := True;
  finally
    Chain.Free; Leaves.Free;
  end;
end;

function TDimMember.BelongsToGroup: boolean;
begin
  Result := (GetGroup <> nil);
end;

function TDimMember.Delete: TDimMember;
var
  Index: integer;
begin
  Result := nil;
  Index := FMembers.IndexOf(Self);
  if Index >= 0 then
  begin
    Result := Self;
    FMembers.Delete(Index);
    FMembers := nil;
  end;
end;

function TDimMember.GetGroup: TDimMember;
var
  M: TDimMember;
begin
  Result := nil;
  M := Self;
  repeat
    if M.IsGroup then Result := M; 
    M := M.Parent;
  until (M = nil) or (Result <> nil);
end;

procedure TDimMember.SetRecursiveVisible(Value: boolean);

  procedure Process(Members: TDimMembers);
  var
    i: integer;
    M: TDimMember;
  begin
    for i := 0 to Members.Count - 1 do
    begin
      M := TDimMember(Members[i]);
      M.FVisible := Value;
      if M.FChildMembers <> nil then Process(M.FChildMembers);
    end;
  end;

begin
  FVisible := Value;
  if FChildMembers <> nil then Process(FChildMembers);
  if FParent <> nil then FParent.CheckConsistent;
end;

procedure TDimMember.CheckConsistent;
var
  i: integer;
begin
  if FChildMembers <> nil then
  begin
    FVisible := False;
    for i := 0 to FChildMembers.Count - 1 do
    begin
      FVisible := TDimMember(FChildMembers[i]).Visible;
      if FVisible then BREAK;
    end;
  end;
  if FParent <> nil then FParent.CheckConsistent;
end;

procedure TDimMember.Assign(Source: TPersistent);
var
  Member: TDimMember;
begin
  if Source is TDimMember then
    begin
      Member := Source as TDimMember;
      FDimIndex := Member.FDimIndex;
      FVisible := Member.FVisible;
      FRank := Member.FRank;
      FDatabaseRank := Member.FDatabaseRank;
      FIsGroup := Member.FIsGroup;
      FCaption := Member.FCaption;
      FOriginalID := Member.FOriginalID;
      FIndex := Member.FIndex;
      FID := Member.FID;
      FIDHash := Member.FIDHash;
    end
  else
    inherited;
end;

function TDimMember.Clone: TDimMember;
begin
  Result := TDimMember.Create(nil);
  Result.Assign(Self);
end;

constructor TDimMember.Create(AParent: TDimMember);
begin
  {$IFDEF ASPRUNTIME}
  inherited Create;
  {$ENDIF}
  FParent := AParent;
  FDimIndex := -1;
  FVisible := True;
  FRank := -1;
  FDatabaseRank := -1;
end;

constructor TDimMember.CreateGroup(const ACaption: WideString);
begin
  {$IFDEF ASPRUNTIME}
  inherited Create;
  FParent := nil;
  FDimIndex := -1;
  FVisible := True;
  FRank := -1;
  FDatabaseRank := -1;
  FIsGroup := True;
  FCaption := ACaption;
  {$ELSE}
  with Create(nil) do
  begin
    FIsGroup := True;
    FCaption := ACaption;
  end;
  {$ENDIF}
end;

{$IFNDEF ASPRUNTIME}
destructor TDimMember.Destroy;
begin
  FreeAndNil(FChildMembers);
  inherited;
end;
{$ENDIF}

procedure TCustomHierCube.WriteCommonStream(Stream: TStream; Buffer: pointer; Count: integer);
var
  l: integer;
begin
  if not Active then raise ECubeError.Create(GetResStr('xhCantSaveInactiveCube', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhCantSaveInactiveCube));
  with Stream do
  begin
    WriteTag(Stream, tgCommonStream);

    WriteTag(Stream, tgCommonStream_VersionNumber);
    WriteInteger(Stream, FVersionNumber);

    if Self <> nil then
    begin
      l := Self.StreamSize(True);
      if l > 0 then
      begin
        WriteTag(Stream, tgCommonStream_HierCube);
        WriteValueType(Stream, vtStreamedObject);
        Stream.Write(l, SizeOf(l)); 
        Self.WriteStream(Stream, True);
      end;
    end;

{$IFNDEF ASPRUNTIME}
    if (Buffer <> nil) and (Count > 0) then
    begin
      WriteTag(Stream, tgCommonStream_UserData);
      WriteBinary(Stream, Buffer^, Count);
    end;
{$ENDIF}

    WriteTag(Stream, tgCommonStream_EOT);
  end;
end;

procedure TCustomHierCube.ReadCommonStream(Stream: TStream; Buffer: pointer);
var
  Tag: word;
  L: integer;
  HierCubeFound: boolean;
  Ver: integer;
begin
  CheckTag(Stream, tgCommonStream);
  HierCubeFound := False;
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgCommonStream_VersionNumber:
        begin
          Ver := ReadInteger(Stream);
          if not StreamVersionSupported(Ver) then
            raise ECubeError.Create(GetResStr('xhStreamVersionError', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhStreamVersionError));
        end;
      tgCommonStream_HierCube:
        begin
          if ReadValueType(Stream) <> vtStreamedObject then InvalidPropError(Stream.Position - SizeOf(TxhValueType));
          Read(L, SizeOf(Integer));
          HierCubeFound := True;

          if Active then Active := False;
{$IFNDEF ASPRUNTIME}
          Application.ProcessMessages;
{$ENDIF}
          DoBeforeOpen;
          try
            Self.ReadStream(Stream);
          except
            FState := dcInactive;
            Clear;
            raise;
          end;
        end;
{$IFNDEF ASPRUNTIME}
      tgCommonStream_UserData:
        begin
          if Buffer <> nil then
            ReadBinary(Stream, Buffer^)
          else
            SkipValue(Stream);
        end;
{$ENDIF}
      tgCommonStream_EOT:
        begin
          if HierCubeFound then
          begin
            FState := dcBrowseAllData;
            DoAfterOpen;
            StateChanged;
            NotifyLinkedControls(xeReadFromStream);
          end;
          EXIT;
        end;
    else 
      SkipValue(Stream);
    end;
  until False;
end;


procedure TDimMember.MakeQualifiedName;
var
  M: TDimMember;
begin
  if FIsGroup then
    begin
      FOriginalID := xhLeftBracket + FCaption + xhRightBracket;
      FID := FOriginalID;
    end
  else
    begin
      M := Self;
      FID := FOriginalID;
      while (M.Parent <> nil) and not M.Parent.IsGroup do
      begin
        FID := M.Parent.FOriginalID + xhMemberDelimiter + FID;
        M := M.Parent;
      end;
    end;
  FIDHash := WideStringHash(FID);
end;


procedure TDimensionOrSummary.ReadStream(Stream: TStream);
var
  Tag: word;
begin
  CheckTag(Stream, tgDimensionOrSummary);
  FFieldType := ftUnknown; 
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgDimensionOrSummary_DimensionMapIndex: FDimensionMapIndex := ReadInteger(Stream);
      tgDimensionOrSummary_FieldName:    FFieldName := ReadWideString(Stream);
      tgDimensionOrSummary_DisplayName:  FDisplayName := ReadWideString(Stream);
      tgDimensionOrSummary_Composite:  FComposite := ReadBoolean(Stream);
      tgDimensionOrSummary_ComposedFields:  FComposedFields := ReadWideString(Stream);
      tgDimensionOrSummary_FieldKind: FFieldKind := TFieldKind(xhStream.ReadByte(Stream));
      tgDimensionOrSummary_FieldType: FFieldType := TFieldType(xhStream.ReadByte(Stream));
      tgDimensionOrSummary_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

function TDimensionOrSummary.StreamSize: integer;
begin
  Result := TagSize * 2;
  if FDimensionMapIndex <> 0 then inc(Result, TagSize + IntegerSize(FDimensionMapIndex));
  if FFieldName <> '' then inc(Result, TagSize + WideStringSize(FFieldName));
  if FDisplayName <> '' then inc(Result, TagSize + WideStringSize(FDisplayName));
  if FComposite <> False then inc(Result, TagSize + BooleanSize);
  if FComposedFields <> '' then inc(Result, TagSize + WideStringSize(FComposedFields));
  if byte(FFieldKind) <> 0 then inc(Result, TagSize + ByteSize);
  if byte(FFieldType) <> 0 then inc(Result, TagSize + ByteSize);
end;

procedure TDimensionOrSummary.WriteStream(Stream: TStream);
begin
  with Stream do
  begin
    WriteTag(Stream, tgDimensionOrSummary);

    if FDimensionMapIndex <> 0 then
    begin
      WriteTag(Stream, tgDimensionOrSummary_DimensionMapIndex);
      WriteInteger(Stream, FDimensionMapIndex);
    end;

    if FFieldName <> '' then
    begin
      WriteTag(Stream, tgDimensionOrSummary_FieldName);
      WriteWideString(Stream, FFieldName);
    end;

    if FDisplayName <> '' then
    begin
      WriteTag(Stream, tgDimensionOrSummary_DisplayName);
      WriteWideString(Stream, FDisplayName);
    end;

    if FComposite <> False then
    begin
      WriteTag(Stream, tgDimensionOrSummary_Composite);
      WriteBoolean(Stream, FComposite);
    end;

    if FComposedFields <> '' then
    begin
      WriteTag(Stream, tgDimensionOrSummary_ComposedFields);
      WriteWideString(Stream, FComposedFields);
    end;

    if byte(FFieldKind) <> 0 then
    begin
      WriteTag(Stream, tgDimensionOrSummary_FieldKind);
      WriteByte(Stream, byte(FFieldKind));
    end;

    if byte(FFieldType) <> 0 then
    begin
      WriteTag(Stream, tgDimensionOrSummary_FieldType);
      WriteByte(Stream, byte(FFieldType));
    end;

    WriteTag(Stream, tgDimensionOrSummary_EOT);
  end;
end;


procedure TTotals.Clear;
begin
  if assigned(FSums) then FSums.Clear;
  if assigned(FCounts) then FCounts.Clear;
  if assigned(FFunctions) then FFunctions.Clear;
end;

constructor TTotals.Create(AOffsets: TCubeIntegerArray);
begin
{$IFDEF ASPRUNTIME}
  inherited Create;
{$ENDIF}
  foffsets := AOffsets;
  FSums := TDoubleArray.Create;
  FSums.Duplicates := dupAccept;
  fMedianCalc := False;

  FCounts := TIntegerArray.Create;
  FCounts.Duplicates := dupAccept;
end;

{$IFNDEF ASPRUNTIME}
destructor TTotals.Destroy;
begin
  Clear;
  FSums.Free;
  FCounts.Free;
  FFunctions.Free;
  inherited;
end;
{$ENDIF}

function TTotals.Find(AOffset: CubeInteger; out AValue: Double; out ACount: integer; out AFunctions: PFunctionValues): boolean;
var
  i: integer;
  V: double;
{$IFNDEF ASPRUNTIME}
  VInt: Int64 absolute V;
{$ENDIF}
begin
  Result := fOffsets.Find(i, AOffset);
  AFunctions := nil;
  if Result then
  begin
    V := Sums[i];
{$IFNDEF ASPRUNTIME}
    if VInt = NAN then
     begin
      Result := False;
      EXIT;
     end;
{$ENDIF}
    AValue := V;
    ACount := Counts[i];
    if fFunctions <> nil then AFunctions := fFunctions[i];
  end;
end;

function TTotals.MemberCount: integer;
begin
  Result := FSums.Count;
end;


constructor TDimension.Create;
begin
{$IFDEF ASPRUNTIME}
  inherited Create;
{$ENDIF}
  FItems := TIntegerArray.Create;
  FItems.Sorted := True;          
  FItems.Duplicates := dupIgnore; 
end;

{$IFNDEF ASPRUNTIME}
destructor TDimension.Destroy;
begin
  FUsedMembers.Free;
  FCurrentCaptions := nil; 
  FAttributeList.Free;
  FItems.Free;
  FParents.Free;
  FStringKeys.Free;
  FDimComponents.Free;
  FDatabaseRanks.Free;
  FDoubleArray.Free;
  FFTIndexes.Free;
  FInvertFTIndexes.Free;
  FIsParentFlags.Free;
  inherited Destroy;
end;
{$ENDIF}


function TDimensions.FindRangeBasedDimension(const FieldName: WideString): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
{$IFDEF ASPRUNTIME}
  if (TDimension(Self[i]).RangeBased = True) and
    (WideCompareText(FieldName, TDimensionOrSummary(Self[i]).FieldName) = 0) then
{$ELSE}
  if (TDimension(PPntrArray(FArrayPointer)^[i]).RangeBased = True) and
    (WideCompareText(FieldName, TDimensionOrSummary(PPntrArray(FArrayPointer)^[i]).FieldName) = 0) then
{$ENDIF}
  begin
    Result := i;
    BREAK;
  end;
end;

function TDimension.FindIndexByID(MemberID: variant): integer;
begin
  if StrID and (FStringKeys <> nil) then
    Result := FStringKeys.IndexOf(MemberID)
  else
    Result := FItems.IndexOf(MemberID);
end;

function TDimension.GetMemberID(Index: integer): variant;
begin
{$IFDEF ASPRUNTIME}
  if StrID and (FStringKeys <> nil) then
    Result := FStringKeys[Index]
  else
    Result := TObject(Items[Index]);
{$ELSE}
  if StrID and (FStringKeys <> nil) then
    Result := FStringKeys[Index]
  else
    Result := Items[Index];
{$ENDIF}
end;

procedure DoUpdateOpenLevels(Nodes: TLabelNodes);
var
  i: integer;
  Node:TLabelNode;
begin
  for i := 0 to Nodes.Count - 1 do
  begin
    Node := TLabelNode(Nodes[i]);
    if Node.ChildNodes <> nil then DoUpdateOpenLevels(Node.ChildNodes);
    if Node.DimState.FOpenLevels < Node.FDimLevel then Node.DimState.FOpenLevels := Node.FDimLevel;
  end;
end;

procedure TGridInfo.UpdateOpenLevels(LabelNodes: TLabelNodes; FVisibleDimIDs: TIntegerArray);
var
  i: integer;
begin
  for i := 0 to FVisibleDimIDs.Count - 1 do
    TDimensionState(FDimensionStates[FVisibleDimIDs[i]]).FOpenLevels := 1;
  DoUpdateOpenLevels(LabelNodes);
end;

procedure TGridInfo.SortVisibleDimIDs;
var
  i: integer;
  DimState: TDimensionState;
begin
  if FVisibleRowDimIDs <> nil then
  for i := 0 to FVisibleRowDimIDs.Count - 1 do
  begin
    DimState := TDimensionState(FDimensionStates[FVisibleRowDimIDs[i]]);
    DimState.Sort(DimState.fSortType);
  end;
  if FVisibleColDimIDs <> nil then
  for i := 0 to FVisibleColDimIDs.Count - 1 do
  begin
    DimState := TDimensionState(FDimensionStates[FVisibleColDimIDs[i]]);
    DimState.Sort(DimState.fSortType);
  end;
end;

function TGridInfo.GridIndex2DimID(DimGroup: TDimGroup; Index: integer): integer;
var
  i, n: integer;
  VisibleDimIDs: TIntegerArray;
  OpenLevels: integer;
begin
  Result := -1;
  if DimGroup = dgCol then
    VisibleDimIDs := VisibleColDimIDs
  else
    VisibleDimIDs := VisibleRowDimIDs;
  n := 0;
  for i := 0 to VisibleDimIDs.Count - 1 do
  begin
    OpenLevels := TDimensionState(FDimensionStates[VisibleDimIDs[i]]).OpenLevels;
    if (Index >= n) and (Index <= n + OpenLevels - 1) then
      begin
        Result := VisibleDimIDs[i];
        EXIT;
      end
    else
      n := n + OpenLevels;
  end;
end;


function TDimCollectionItem.GetHierCube: TCustomHierCube;
begin
  Result := (Collection as TDimCollection).HierCube;
end;

procedure TDimCollectionItem.SetLookupDataSet(Value: TDataSet);
begin
  if Value <> FDimComponentRecord.FLookupDataSet then
  begin
    if Value <> nil then Value.FreeNotification(HierCube); 
    FDimComponentRecord.FLookupDataSet := Value;
    if Value = nil then
    begin
      FDimComponentRecord.FID_Field := '';
      FDimComponentRecord.FName_Field := '';
    end;
  end;
end;


constructor TDimCollection.Create(AHierCube: TCustomHierCube);
begin
  inherited Create(TDimCollectionItem);
  FHierCube := AHierCube;
end;

function TDimCollection.GetOwner: TPersistent;
begin
  Result := FHierCube;
end;

function TDimSum.StoreDimensionComponents: boolean;
begin
  Result := (DimSumType = dsDimension) and (Composite = True);
end;

{$IFNDEF ASPRUNTIME}
destructor TDimSum.Destroy;
begin
  FDimCollection.Free;
  inherited;
end;
{$ENDIF}


procedure TLookupField.Init;
begin
  FreeAndNil(FNames);
  FreeAndNil(FKeys);

  FNames := TWideStringArray.Create;
  FNames.Duplicates := dupIgnore;

  FKeys := TWideStringArray.Create;
  FKeys.Sorted := True;
  FKeys.Duplicates := dupIgnore;
end;

{$IFNDEF ASPRUNTIME}
destructor TLookupField.Destroy;
begin
  FreeAndNil(FNames);
  FreeAndNil(FKeys);
  inherited;
end;
{$ENDIF}

function TLookupField.GetName(const Key: WideString): WideString;
var
  Index: integer;
begin
  Index := FKeys.IndexOf(Key);
  if Index >= 0 then
    Result := FNames[Index]
  else
    Result := '';  
end;

function TCustomHierCube.InitLookupFields: TLookupFields;
var
  DimID, i, Dim1ID: integer;
  Dim, Dim1: TDimension;
  LookupField: TLookupField;
  DimComponent: TDimComponent;
begin
  Result := TLookupFields.Create;
  for DimID := 0 to Dimensions.Count - 1 do
  begin
    Dim := TDimension(Dimensions[DimID]);
    if (Dim.Composite = False) or (Dim.FDimComponents = nil) then Continue;
    for i := 0 to Dim.FDimComponents.Count - 1 do
    begin
      DimComponent := TDimComponent(Dim.FDimComponents[i]);
      if DimComponent.LookupDataSet <> nil then
        begin
          LookupField := TLookupField.Create;
          Result.AddPointer(DimComponent.FieldName, LookupField);
          ReadLookupDataset(LookupField, DimComponent);
        end
      else
        begin
          Dim1 := nil;
          Dim1ID := Dimensions.FindFieldName(DimComponent.FieldName);
          if Dim1ID >= 0 then Dim1 := TDimension(Dimensions[Dim1ID]);

          if (Dim1 <> nil) and Dim1.HasLookup then
          begin
            LookupField := TLookupField.Create;
            Result.AddPointer(DimComponent.FieldName, LookupField);
            LookupField.FDimension := Dim1; 
          end;
        end;
    end;
  end;
end;


constructor TLookupFields.Create;
begin
  inherited;
  Sorted := True;
  Duplicates := classes.dupIgnore;
end;

{$IFNDEF ASPRUNTIME}
destructor TLookupFields.Destroy;
var
  i: integer;
begin
  for i := 0 to Count - 1 do TObject(Pointers[i]).Free;
  inherited;
end;
{$ENDIF}

procedure TCustomHierCube.ReadLookupDataset(LookupField: TLookupField; DimComponent: TDimComponent);
var
  OldActive: boolean;
  Key: WideString;
  Index: integer;

{$IFNDEF ASPRUNTIME}
  procedure UpdateProgressBar;
  begin
    if Assigned(FProgressDialog) then
    if (FProgressDialog.UpdateProgress = -1) then
    begin
      UserCanceledError;
    end;
  end;
{$ENDIF}

begin
  LookupField.Init;
  if DimComponent.LookupDataSet = nil then EXIT;
  with DimComponent.LookupDataSet, LookupField do
  begin
    OldActive := Active;
    try
      if not Active then
      begin
        Active := True;
        First;
        if EOF then
          raise ECubeError.Create(xhWideFormat(GetResStr('xhecEmptyLookupDataset', @xhecEmptyLookupDataset), [Dataset.Name]));
      end;
      if (DimComponent.ID_Field = '') or (FindField(DimComponent.ID_Field) = nil) then
        raise ECubeError.Create(xhWideFormat(GetResStr('xhecWrongLookupField', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecWrongLookupField), [DimComponent.FieldName, DimComponent.ID_Field]));
      if (DimComponent.Name_Field = '') or (FindField(DimComponent.Name_Field) = nil) then
        raise ECubeError.Create(xhWideFormat(GetResStr('xhecWrongLookupField', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecWrongLookupField), [DimComponent.FieldName, DimComponent.Name_Field]));
      {$IFNDEF ASPRUNTIME}
      if Assigned(FProgressDialog) then
      begin
        FProgressDialog.Init;
        FProgressDialog.FormatStr := GetResStr('xhRowsReadFormatStr', @xhRowsReadFormatStr);
        FProgressDialog.Caption := xhWideFormat(GetResStr('xhReadingLookupSource', @xhReadingLookupSource), [DimComponent.FieldName]);
      end;
      {$ENDIF}

      DisableControls;
      try
        First;
        while not EOF do
        begin
          Key := GetWideDisplayText(FindField(DimComponent.ID_Field));
          Index := FKeys.Add(Key);
          FNames.InsertAt(Index, GetWideDisplayText(FindField(DimComponent.Name_Field)));
          {$IFNDEF ASPRUNTIME}
          UpdateProgressBar;
          {$ENDIF}
          Next;
        end;
      finally
        EnableControls;
      end;
    finally
      if OldActive <> Active then Active := OldActive;
    end; 
  end;
end;

procedure TDimSum.SetName_Field(const Value: string);
begin
  SetDefaultAttribute(Value);
end;

function TDimSum.GetName_Field: string;
begin
  Result := FDefaultAttribute;
end;

procedure TDimSum.SetDefaultAttribute(const Value: WideString);
begin
  if Value <> FDefaultAttribute then
  begin
    FDefaultAttribute := Value;
    if FindWord(Value, FAttributes) < 0 then
    if FAttributes = '' then FAttributes := Value else FAttributes := Value + xhFieldsDelimiter + WideString(' ') + FAttributes;
  end;
end;

procedure TCustomHierCube.LoadVarFields(Reader: TReader);
begin
  FVarFields := Reader.ReadString;
end;

procedure TCustomHierCube.StoreVarFields(Writer: TWriter);
begin
  Writer.WriteString(FVarFields);
end;

function TGridInfo.GetCellAggregateRecords(SumIndex: TIntegerArray): TIntegerArray;
var
  DimID, ftValue, siValue, Index: integer;
  FT: TFactTable;
  MeetsMask: boolean;
  DimState: TDimensionState;
begin
  Result := TIntegerArray.Create;
  Result.Duplicates := dupIgnore;
  {$IFDEF ASPRUNTIME}
  FCube.CheckFactTablePresence;
  {$ENDIF}
  FT := FCube.FFactTable;
  FT.First;
  while not FT.EOF do
  begin
    MeetsMask := True;
    for DimID := 0 to FT.DimCount - 1 do
    begin
      DimState := TDimensionState(FDimensionStates[DimID]);
      ftValue := DimState.FIndexConversion[FT.CurDim[DimID]]; 

      if DimState.Filtered then if not DimState.Visible[ftValue] then
      begin
        MeetsMask := False;
        BREAK;
      end;

      if DimState.DimGroup in [dgRow, dgCol] then
      begin
        Index := FActiveDimIndexes[DimID];    
        siValue := SumIndex[Index];

        if (siValue = SubTotal) or (ftValue = siValue) or
           DimState.HasAsAncestor(ftValue, siValue) then Continue;

        MeetsMask := False;
        BREAK;
      end;
    end;
    if MeetsMask then Result.Add(FT.CurIndex);
    FT.Next;
  end;
  Result.Sort;
  Result.Sorted := True;
end;

function TGridInfo.GetCellAggregateRecords(Row, Col: integer): TIntegerArray;
var
  SumIndex: TIntegerArray;
begin
  SumIndex := RowCol2SumIndex(Row, Col);
  Result := GetCellAggregateRecords(SumIndex);
end;

{$IFNDEF ASPRUNTIME}
function TGridInfo.FTRecordsToEditDataset(ARecords: TIntegerArray): TDataset;
var
  FieldDefs: TFieldDefs;
  i, Index: integer;
  EditableFields: TDatasetArray;
begin
  Result := nil;
  if (FCube.Options.FEditable = False) or (FCube.FEditableFields = nil) then EXIT;
  Result := TxhMemoDataset.Create({$IFDEF ASPRUNTIME}FCube{$ELSE}Self{$ENDIF});
  EditableFields := FCube.FEditableFields;
  FieldDefs := Result.FieldDefs;
  FieldDefs.BeginUpdate;
  try
    FieldDefs.Clear;
    for i := 0 to EditableFields.FieldCount - 1 do
    with FieldDefs.AddFieldDef do
    begin
      Name := EditableFields.GetFieldName(i);
      DataType := TFieldType(EditableFields.GetNormalFieldType(i));
      if DataType in [db.ftString, db.ftWideString] then Size := FDatasetStringSize;
    end;
  finally
    FieldDefs.EndUpdate;
  end;
  TxhMemoDataset(Result).IncCapacity := 1;
  TxhMemoDataset(Result).Capacity := ARecords.Count;
  Result.Open;
  for i := 0 to EditableFields.FieldCount - 1 do
    Result.Fields[i].DisplayLabel := EditableFields.GetDisplayName(i);
  Result.DisableControls;
  try
    with Result do
    for i := 0 to ARecords.Count - 1 do
    begin
      EditableFields.Position := ARecords[i];
      Append;
      for Index := 0 to EditableFields.FieldCount - 1 do
      begin
        case EditableFields.GetNormalFieldType(Index) of
          ftWideString: SetAsWideString(Result.Fields[Index], EditableFields.AsWideString[Index]);
          ftInteger: Result.Fields[Index].AsInteger := EditableFields.AsInteger[Index];
          ftFloat: Result.Fields[Index].AsFloat := EditableFields.AsFloat[Index];
          ftCurrency: Result.Fields[Index].AsCurrency := EditableFields.AsCurrency[Index];
          ftDateTime: Result.Fields[Index].AsDateTime := EditableFields.AsDateTime[Index];
          ftBoolean: Result.Fields[Index].AsBoolean := EditableFields.AsBoolean[Index];
        end;
      end;
      Post;
      TxhMemoDataset(Result).Records[i].FactTableIndex := EditableFields.Position;
    end;
  finally
    Result.EnableControls;
    Result.First;
  end;
end;

function TGridInfo.BuildUserDataset(EditDataset: TxhMemoDataset): TxhMemoDataset;
var
  i, FTIndex, Index: integer;
  FieldDefs: TFieldDefs;
  SrcFields: TFields;
  EditableFields: TDatasetArray;
begin
  Result := nil;
  if EditDataset = nil then EXIT;
  Result := TxhMemoDataset.Create({$IFDEF ASPRUNTIME}FCube{$ELSE}Self{$ENDIF});
  EditableFields := FCube.FEditableFields;

  SrcFields := EditDataset.Fields;
  FieldDefs := Result.FieldDefs;
  FieldDefs.BeginUpdate;
  try
    FieldDefs.Clear;
    for i := 0 to SrcFields.Count - 1 do
    with FieldDefs.AddFieldDef do
    begin
      Name := SrcFields[i].FieldName;
      DataType := SrcFields[i].DataType;
    end;
    with FieldDefs.AddFieldDef do
    begin
      Name := xhUpdateKindFieldName;
      DataType := ftInteger;
    end;
  finally
    FieldDefs.EndUpdate;
  end;
  TxhMemoDataset(Result).IncCapacity := 1;
  TxhMemoDataset(Result).Capacity := EditDataset.RecordCount;
  Result.Open;
  for i := 0 to SrcFields.Count - 1 do
    Result.Fields[i].DisplayLabel := SrcFields[i].DisplayName;

  Result.DisableControls;
  try
    if FDeletedFTIndexes <> nil then
    with Result do
    for i := 0 to FDeletedFTIndexes.Count - 1 do
    begin
      FTIndex := FDeletedFTIndexes[i];
      EditableFields.Position := FTIndex;
      Append;
      for Index := 0 to EditableFields.FieldCount - 1 do
      begin
        case EditableFields.GetNormalFieldType(Index) of
          ftWideString: SetAsWideString(Result.Fields[Index], EditableFields.AsWideString[Index]);
          ftInteger: Result.Fields[Index].AsInteger := EditableFields.AsInteger[Index];
          ftFloat: Result.Fields[Index].AsFloat := EditableFields.AsFloat[Index];
          ftCurrency: Result.Fields[Index].AsCurrency := EditableFields.AsCurrency[Index];
          ftDateTime: Result.Fields[Index].AsDateTime := EditableFields.AsDateTime[Index];
          ftBoolean: Result.Fields[Index].AsBoolean := EditableFields.AsBoolean[Index];
        end;
      end;
      Result.Fields[SrcFields.Count].AsInteger := integer(ukDelete);
      Post;
    end;

    with EditDataset do
    begin
      First;
      while not EOF do
      begin
        FTIndex := Records[RecordPos].FactTableIndex;
        if (FTIndex < 0) or ((FModifiedFTIndexes <> nil) and (FModifiedFTIndexes.IndexOf(FTIndex) >= 0)) then
        begin
          Result.Append;
          for Index := 0 to EditableFields.FieldCount - 1 do
          begin
            if Fields[Index].IsNull then
              Result.Fields[Index].Clear
            else
              case EditableFields.GetNormalFieldType(Index) of
                ftWideString: SetAsWideString(Result.Fields[Index], GetAsWideString(Fields[Index]));
                ftInteger: Result.Fields[Index].AsInteger := Fields[Index].AsInteger;
                ftFloat: Result.Fields[Index].AsFloat := Fields[Index].AsFloat;
                ftCurrency: Result.Fields[Index].AsCurrency := Fields[Index].AsCurrency;
                ftDateTime: Result.Fields[Index].AsDateTime := Fields[Index].AsDateTime;
                ftBoolean: Result.Fields[Index].AsBoolean := Fields[Index].AsBoolean;
              end;
          end;
          if FTIndex < 0 then
            Result.Fields[SrcFields.Count].AsInteger := integer(ukInsert)
          else
            Result.Fields[SrcFields.Count].AsInteger := integer(ukModify);
          Result.Post;
        end;
        Next;
      end;
    end;
  finally
    Result.EnableControls;
    Result.First;
  end;
end;
{$ENDIF}

{$IFNDEF ASPRUNTIME}
function TGridInfo.EditFactTable(Row, Col, DataRow, DataCol: integer): boolean;
var
  FactTableEditor: TFactTableEditor;
  SumInfo: TSummaryInfo;
  DataSet: txhMemoDataset;
  SumInfoID: integer;
  Fun: TFunction;
  SubFun: TSubFunction;
  FOnGetFactTableEditorEventArgs: TOnGetFactTableEditorEventArgs;
  FOnEditFactTableArgs: TOnEditFactTableEventArgs;
  Res: integer;
  ARecords: TIntegerArray;
  SumIndex: TIntegerArray;
begin
  Result := False;
  if not FCube.Options.Editable then EXIT;
  if (DataRow < 0) or (DataCol < 0) then EXIT;
  Col2SumFun(DataCol, SumInfoID, Fun, SubFun);
  SumInfo := FSummarySettings[SumInfoID];
  if SumInfo.Calculated then EXIT;      
  ARecords := GetCellAggregateRecords(DataRow, DataCol);
  SumIndex := RowCol2SumIndex(DataRow, DataCol);
  try
    DataSet := TxhMemoDataset(FTRecordsToEditDataset(ARecords));
    if Dataset = nil then EXIT;
    FactTableEditor := TFactTableEditor.Create(nil);
    try
      FreeAndNil(FUserDataset);
      FreeAndNil(FDeletedFTIndexes);
      FreeAndNil(FModifiedFTIndexes);
      FactTableEditor.DataSet := DataSet;
      DataSet.BeforeDelete := FactTableEditorOnDeleteRecord;
      DataSet.AfterPost := FactTableEditorAfterPost;
      FOnGetFactTableEditorEventArgs := TOnGetFactTableEditorEventArgs.Create;
      FOnGetFactTableEditorEventArgs.FFactTableEditor := FactTableEditor;
      FOnGetFactTableEditorEventArgs.FDataset := Dataset;
      try
        if assigned(FOnGetFactTableEditor) then
          FOnGetFactTableEditor(FGrid, FOnGetFactTableEditorEventArgs);
        Res := mrNone;
        if FOnGetFactTableEditorEventArgs.FFactTableEditor <> nil then
          Res := FOnGetFactTableEditorEventArgs.FFactTableEditor.ShowModal;
        if FOnGetFactTableEditorEventArgs.FFreeOnExit then
        if FOnGetFactTableEditorEventArgs.FFactTableEditor <> FactTableEditor then
          FreeAndNil(FOnGetFactTableEditorEventArgs.FFactTableEditor)
        else
          FOnGetFactTableEditorEventArgs.FFactTableEditor := nil;
        if Res = mrOk then
        begin
          FUserDataset := BuildUserDataset(DataSet);
          try
            if assigned(FOnEditFactTableEvent) then
            begin
              FOnEditFactTableArgs := TOnEditFactTableEventArgs.Create;
              try
                FOnEditFactTableArgs.FRow := Row;
                FOnEditFactTableArgs.FCol := Col;
                FOnEditFactTableArgs.FDataRow := DataRow;
                FOnEditFactTableArgs.FDataCol := DataCol;
                FOnEditFactTableArgs.FDataset := FUserDataset;
                FOnEditFactTableArgs.FSumIndex := SumIndex;
                FOnEditFactTableArgs.FAccept := False;
                FOnEditFactTableEvent(FGrid, FOnEditFactTableArgs);
                if FOnEditFactTableArgs.Accept then
                begin
                  FCube.RefreshFactTable(False);
                  Result := True;
                end;
              finally
                FOnEditFactTableArgs.Free;
              end;
            end;
          finally
            FreeAndNil(FUserDataset);
          end;
        end;
      finally
        FOnGetFactTableEditorEventArgs.Free;
      end;
    finally
      FreeAndNil(FactTableEditor);
      FreeAndNil(DataSet);
    end;
  finally
    ARecords.Free;
  end;
end;
{$ENDIF}

function TCustomHierCube.BuildKeyFieldTypes(const AKeyFields: WideString): string;
var
  Index: integer;
  s: WideString;
  DimSum: TDimSum;
begin
  Index := 1;
  Result := '';
  s := ExtractWord(AKeyFields, Index);
  while s <> '' do
  begin
    DimSum := FDimSums.FindItem(s);
    if DimSum <> nil then
      Result := Result + char(DimSum.FBaseFieldType)
    else
      Result := Result + char(ftUnknown);
    s := ExtractWord(AKeyFields, Index);
  end;
end;

procedure TCustomHierCube.UpdateVarFieldTypes;
begin
  FVarFieldTypes := BuildKeyFieldTypes(FVarFields);
end;

procedure TCustomHierCube.LoadVarFieldTypes(Reader: TReader);
begin
  FVarFieldTypes := Reader.ReadString;
end;

procedure TCustomHierCube.StoreVarFieldTypes(Writer: TWriter);
begin
  if FVarFieldTypes = '' then UpdateVarFieldTypes;
  Writer.WriteString(FVarFieldTypes);
end;

{$IFNDEF ASPRUNTIME}
procedure TGridInfo.UpdateCubeFactTable(EditDataset: TxhMemoDataset; SumInfo: TSummaryInfo);
var
  FactTableIndex: integer;
  SumField: TField;
  EditableFieldIndex: integer;
  V: Double;
  FieldType: TFieldType;
begin
  if EditDataset = nil then EXIT;
  with EditDataset do
  begin
    SumField := FindField(SumInfo.FieldName);
    EditableFieldIndex := FCube.FEditableFields.FindField(SumInfo.FieldName);
    FieldType := FCube.FEditableFields.GetNormalFieldType(EditableFieldIndex);
    if SumField = nil then EXIT;
    First;
    while not EOF do
    begin
      FactTableIndex := Records[RecordPos].FactTableIndex;
      V := SumField.AsFloat;
      FCube.FactTable.Sum[FactTableIndex, SumInfo.SumID] := V;
      FCube.FEditableFields.Position := FactTableIndex;
      case FieldType of
        ftInteger:
          FCube.FEditableFields.AsInteger[EditableFieldIndex] := round(V);
        ftFloat:
          FCube.FEditableFields.AsFloat[EditableFieldIndex] := V;
        ftCurrency:
          FCube.FEditableFields.AsCurrency[EditableFieldIndex] := V;
      end;
      Next;
    end;
  end;
end;
{$ENDIF}


function TFunctionDefs.Add: TFunctionDef;
begin
  Result := inherited Add as TFunctionDef;
end;

procedure TFunctionDefs.Assign(Source: TPersistent);
var
  Src: TFunctionDefs;
  i: integer;
  FD: TFunctionDef;
begin
  if not (Source is TFunctionDefs) then EXIT;
  Src := Source as TFunctionDefs;
  while Src.Count < Count do Items[Count - 1].Free;
  for i := 0 to Src.Count - 1 do
   begin
    if i >= Count
     then FD := Add
     else FD := Items[i];
    FD.Assign(Src[i]);
   end;
end;

function TFunctionDefs.FunctionDef(AFunction: TFunction): TFunctionDef;
begin
  if Ord(AFunction) > Count - 1
   then Result := nil
   else Result := Items[Ord(AFunction)];
end;

function TFunctionDefs.GetItem(Index: integer): TFunctionDef;
begin
  Result := inherited Items[Index] as TFunctionDef;
end;

procedure TFunctionDefs.InitFunctions;
var
  i: integer;
begin
  for i := Count to Ord(stMedian) do Add;
end;

procedure TFunctionDefs.ReadStream(Stream: TStream);
var
  Tag: word;
  ACount, i: integer;
begin
  ACount := 0;
  CheckTag(Stream, tgFunctionDefs);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgFunctionDefs_Count:  ACount := ReadInteger(Stream);
      tgFunctionDefs_ArrayData:
        begin
          Clear;
          for i := 0 to ACount - 1 do
            Add.ReadStream(Stream);
        end;
      tgFunctionDefs_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

procedure TFunctionDefs.SetItem(Index: integer; const Value: TFunctionDef);
begin
  inherited Items[Index] := Value;
end;

function TFunctionDefs.StreamSize: integer;
var
  i: integer;
begin
  Result := TagSize * 4 + IntegerSize(Count);
  for i := 0 to Count - 1 do inc(Result, TFunctionDef(inherited Items[i]).StreamSize);
end;

procedure TFunctionDefs.WriteStream(Stream: TStream);
var
  i: integer;
begin
  with Stream do
  begin
    WriteTag(Stream, tgFunctionDefs);

    WriteTag(Stream, tgFunctionDefs_Count);
    WriteInteger(Stream, Count);

    WriteTag(Stream, tgFunctionDefs_ArrayData);
    for i := 0 to Count - 1 do TFunctionDef(inherited Items[i]).WriteStream(Stream);

    WriteTag(Stream, tgFunctionDefs_EOT);
  end;
end;


procedure TFunctionDef.Assign(Source: TPersistent);
var
  Src: TFunctionDef;
begin
  if not(Source is TFunctionDef) then EXIT;
  Src := Source as TFunctionDef;
  DisplayName := Src.DisplayName;
  fUserAllowed := Src.fUserAllowed;
end;

constructor TFunctionDef.Create(Collection: TCollection);
begin
  if Collection.Count > integer(High(TFunction)) then
    raise Exception.Create(GetResStr('xhOverCalcFunctions', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhOverCalcFunctions));
  inherited;
  fUserAllowed := (GetFunction <= stMedian);
  DisplayName := Function2Str(GetFunction);
end;

procedure TGridInfo.SetFunctionDefs(const Value: TFunctionDefs);
begin
  fFunctionDefs.Assign(Value);
end;

function TFunctionDef.GetDisplayName: WideString;
begin
  Result := fDisplayName;
end;

function TFunctionDef.GetFunction: TFunction;
begin
  Result := TFunction(Index);
end;

procedure TFunctionDef.ReadStream(Stream: TStream);
var
  Tag: word;
begin
  CheckTag(Stream, tgFunctionDef);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgFunctionDef_DisplayName: FDisplayName := ReadWideString(Stream);
      tgFunctionDef_UserAllowed: FUserAllowed := ReadBoolean(Stream);
      tgFunctionDef_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

procedure TFunctionDef.SetDisplayName(const Value: WideString);
begin
  if WideCompareStr(FDisplayName, value) <> 0 then
  begin
    fDisplayName := Value;
    Changed(False);
  end;
end;

procedure TDimension.ReadStream(Stream: TStream);
var
  Tag: word;
  i: integer;
begin
  inherited ReadStream(Stream);
  CheckTag(Stream, tgDimension);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgDimension_AttributeList:
        begin
          FreeAndNil(FAttributeList);
          FAttributeList := TAttributeList.Create;
          ReadStreamedObject(Stream, FAttributeList);
        end;
      tgDimension_Parents:
        begin
          FreeAndNil(FParents);
          FParents := TIntegerArray.Create;
          ReadStreamedObject(Stream, FParents);
        end;
      tgDimension_StrID: FStrID := ReadBoolean(Stream);
      tgDimension_StringKeys:
        begin
          FreeAndNil(FStringKeys);
          FStringKeys := TWideStringArray.Create;
          ReadStreamedObject(Stream, FStringKeys);
          FreeAndNil(FItems);
          FItems := TIntegerArray.CreateCount(FStringKeys.Count);
          FItems.FillRank;
        end;
      tgDimension_Items:
        begin
          FreeAndNil(FItems);
          FItems := TIntegerArray.Create;
          ReadStreamedObject(Stream, FItems);
        end;
      tgDimension_HasLookup: FHasLookup := ReadBoolean(Stream);
      tgDimension_DimGroup: FDimGroup := TDimGroup(xhStream.ReadByte(Stream));
      tgDimension_TotalAppearance: FTotalAppearance := TTotalAppearance(xhStream.ReadByte(Stream));
      tgDimension_Hier: FHier := ReadBoolean(Stream);
      tgDimension_UsedMembers:
        begin
          FreeAndNil(FUsedMembers);
          FUsedMembers := TIntegerArray.Create;
          ReadStreamedObject(Stream, FUsedMembers);
        end;
      tgDimension_DimComponents:
        begin
          FreeAndNil(FDimComponents);
          FDimComponents := TDimComponents.Create;
          ReadStreamedObject(Stream, FDimComponents);
        end;
      tgDimension_DefaultAttribute: FDefaultAttribute := ReadWideString(Stream);
      tgDimension_DatabaseRanks:
        begin
          FreeAndNil(FDatabaseRanks);
          FDatabaseRanks := TIntegerArray.Create;
          ReadStreamedObject(Stream, FDatabaseRanks);
        end;
      tgDimension_SortType: FSortType := TDimSortType(xhStream.ReadByte(Stream));
      tgDimension_RangeBased: FRangeBased := ReadBoolean(Stream);
      tgDimension_RangeMemberCount: FRangeMemberCount := ReadInteger(Stream);
      tgDimension_RangeTransformMethod: FRangeTransformMethod := TTransformMethod(xhStream.ReadByte(Stream));
      tgDimension_DoubleArray: 
        begin
          FreeAndNil(FDoubleArray);
          FDoubleArray := TDoubleArray.Create;
          ReadStreamedObject(Stream, FDoubleArray);
        end;
      tgDimension_FTIndexes: 
        begin
          FreeAndNil(FFTIndexes);
          FFTIndexes := TIntegerArray.Create;
          ReadStreamedObject(Stream, FFTIndexes);
        end;
      tgDimension_InvertFTIndexes:
        begin
          FreeAndNil(FInvertFTIndexes);
          FInvertFTIndexes := TIntegerArray.Create;
          ReadStreamedObject(Stream, FInvertFTIndexes);
        end;

      tgDimension_EOT:
        begin
          UpdateCurrentCaptions(FDefaultAttribute);
          if FHier then
          begin
            FIsParentFlags := TIntegerArray.CreateCount(FItems.Count);
            FIsParentFlags.FillWith(0);
            for i := 0 to FItems.Count - 1 do
              if FParents[i] >= 0 then FIsParentFlags[FParents[i]] := 1;
          end;
          EXIT;
        end;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

function TDimension.StreamSize: integer;
begin
  Result := inherited StreamSize + TagSize * 2 + StreamedObjectSize(FAttributeList) +
    StreamedObjectSize(FParents) + StreamedObjectSize(FUsedMembers) +
    StreamedObjectSize(FDimComponents) + StreamedObjectSize(FDatabaseRanks) +
    StreamedObjectSize(FDoubleArray) + StreamedObjectSize(FFTIndexes) + StreamedObjectSize(FInvertFTIndexes);

  if FStrID <> False then inc(Result, TagSize + BooleanSize);
  if FStrID and (FStringKeys <> nil) and (FStringKeys.Count > 0) then
    inc(Result, StreamedObjectSize(FStringKeys))
  else
    inc(Result, StreamedObjectSize(FItems));
  if FHasLookup <> False then inc(Result, TagSize + BooleanSize);
  if byte(FDimGroup) <> 0 then inc(Result, TagSize + ByteSize);
  if byte(FTotalAppearance) <> 0 then inc(Result, TagSize + ByteSize);
  if FHier <> False then inc(Result, TagSize + BooleanSize);
  if FDefaultAttribute <> '' then inc(Result, TagSize + WideStringSize(FDefaultAttribute));
  if byte(FSortType) <> 0 then inc(Result, TagSize + ByteSize);
  if FRangeBased <> False then inc(Result, TagSize + BooleanSize);
  if FRangeMemberCount <> 0 then inc(Result, TagSize + IntegerSize(FRangeMemberCount));
  if byte(FRangeTransformMethod) <> 0 then inc(Result, TagSize + ByteSize);
end;

procedure TDimension.WriteStream(Stream: TStream);
begin
  inherited WriteStream(Stream);
  with Stream do
  begin
    WriteTag(Stream, tgDimension);

    WriteStreamedObject(Stream, FAttributeList, tgDimension_AttributeList);

    WriteStreamedObject(Stream, FParents, tgDimension_Parents);

    if FStrID <> False then
    begin
      WriteTag(Stream, tgDimension_StrID);
      WriteBoolean(Stream, FStrID);
    end;

    if FStrID and (FStringKeys <> nil) and (FStringKeys.Count > 0) then
      WriteStreamedObject(Stream, FStringKeys, tgDimension_StringKeys)
    else
      WriteStreamedObject(Stream, FItems, tgDimension_Items);

    if FHasLookup <> False then
    begin
      WriteTag(Stream, tgDimension_HasLookup);
      WriteBoolean(Stream, FHasLookup);
    end;

    if byte(FDimGroup) <> 0 then
    begin
      WriteTag(Stream, tgDimension_DimGroup);
      WriteByte(Stream, byte(FDimGroup));
    end;

    if byte(FTotalAppearance) <> 0 then
    begin
      WriteTag(Stream, tgDimension_TotalAppearance);
      WriteByte(Stream, byte(FTotalAppearance));
    end;

    if FHier <> False then
    begin
      WriteTag(Stream, tgDimension_Hier);
      WriteBoolean(Stream, FHier);
    end;

    WriteStreamedObject(Stream, FUsedMembers, tgDimension_UsedMembers);

    WriteStreamedObject(Stream, FDimComponents, tgDimension_DimComponents);

    if FDefaultAttribute <> '' then
    begin
      WriteTag(Stream, tgDimension_DefaultAttribute);
      WriteWideString(Stream, FDefaultAttribute);
    end;

    WriteStreamedObject(Stream, FDatabaseRanks, tgDimension_DatabaseRanks);

    if byte(FSortType) <> 0 then
    begin
      WriteTag(Stream, tgDimension_SortType);
      WriteByte(Stream, byte(FSortType));
    end;

    if FRangeBased <> False then
    begin
      WriteTag(Stream, tgDimension_RangeBased);
      WriteBoolean(Stream, FRangeBased);
    end;

    if FRangeMemberCount <> 0 then
    begin
      WriteTag(Stream, tgDimension_RangeMemberCount);
      WriteInteger(Stream, FRangeMemberCount);
    end;

    if byte(FRangeTransformMethod) <> 0 then
    begin
      WriteTag(Stream, tgDimension_RangeTransformMethod);
      WriteByte(Stream, byte(FRangeTransformMethod));
    end;

    WriteStreamedObject(Stream, FDoubleArray, tgDimension_DoubleArray);
    WriteStreamedObject(Stream, FFTIndexes, tgDimension_FTIndexes);
    WriteStreamedObject(Stream, FInvertFTIndexes, tgDimension_InvertFTIndexes);
    
    WriteTag(Stream, tgDimension_EOT);
  end;
end;

function TFunctionDef.StreamSize: integer;
begin
  Result := TagSize * 4 + WideStringSize(FDisplayName) + BooleanSize;
end;

procedure TFunctionDef.WriteStream(Stream: TStream);
begin
  with Stream do
  begin
    WriteTag(Stream, tgFunctionDef);

    WriteTag(Stream, tgFunctionDef_DisplayName);
    WriteWideString(Stream, FDisplayName);

    WriteTag(Stream, tgFunctionDef_UserAllowed);
    WriteBoolean(Stream, FUserAllowed);

    WriteTag(Stream, tgFunctionDef_EOT);
  end;
end;


procedure TAttributeList.Clear;
var
  i: integer;
begin
  for i := 0 to Count - 1 do TObject(Pointers[i]).Free;
  inherited;
end;

constructor TAttributeList.Create;
begin
  inherited Create;
{$IFNDEF ASPRUNTIME}
  Sorted := True;
  Duplicates := dupIgnore;
{$ENDIF}
end;

procedure TAttributeList.ReadStream(Stream: TStream);
var
  Tag: word;
  i: integer;
  StringArray: TWideStringArray;
begin
  CheckTag(Stream, tgAttributeList);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgAttributeList_Inherited: inherited ReadStream(Stream);
      tgAttributeList_Objects:
        for i := 0 to Count - 1 do
        begin
          StringArray := TWideStringArray.Create;
          StringArray.ReadStream(Stream);
          Pointers[i] := StringArray;
        end;

      tgAttributeList_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

function TAttributeList.StreamSize: integer;
var
  i: integer;
begin
  Result := TagSize * 3 + inherited StreamSize;
{$IFDEF ASPRUNTIME}
  if FCount > 0 then
  begin
    inc(Result, TagSize);
    for i := 0 to FCount - 1 do inc(Result, TWideStringArray(Pointers[i]).StreamSize);
  end;
{$ELSE}
  if (FCount > 0) and (FArrayPointer <> nil) then
  begin
    inc(Result, TagSize);
    for i := 0 to FCount - 1 do inc(Result, TWideStringArray(Pointers[i]).StreamSize);
  end;
{$ENDIF}  
end;

procedure TAttributeList.WriteStream(Stream: TStream);
var
  i: integer;
begin
  with Stream do
  begin
    WriteTag(Stream, tgAttributeList);

    WriteTag(Stream, tgAttributeList_Inherited);
    inherited WriteStream(Stream);

{$IFDEF ASPRUNTIME}
    if FCount > 0 then
    begin
      WriteTag(Stream, tgAttributeList_Objects);
      for i := 0 to FCount - 1 do TWideStringArray(Pointers[i]).WriteStream(Stream);
    end;
{$ELSE}
    if (FCount > 0) and (FArrayPointer <> nil) then
    begin
      WriteTag(Stream, tgAttributeList_Objects);
      for i := 0 to FCount - 1 do TWideStringArray(Pointers[i]).WriteStream(Stream);
    end;
{$ENDIF}
    WriteTag(Stream, tgAttributeList_EOT);
  end;
end;


procedure TDimComponents.ReadStream(Stream: TStream);
var
  Tag: word;
  ACount, i: integer;
  DimComponent: TDimComponent;
begin
  CheckTag(Stream, tgBaseArray);
  ACount := 0;
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgBaseArray_Count: ACount := ReadInteger(Stream);
      tgBaseArray_ArrayData:
        begin
          Count := ACount;
          for i := 0 to ACount - 1 do
          begin
            DimComponent := TDimComponent.Create;
            DimComponent.ReadStream(Stream);
{$IFDEF ASPRUNTIME}
            Self[i] := DimComponent;
{$ELSE}
            PPntrArray(ArrayPointer)^[i] := DimComponent;
{$ENDIF}
          end;
        end;
      tgBaseArray_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;


procedure TDimComponent.ReadStream(Stream: TStream);
var
  Tag: word;
begin
  CheckTag(Stream, tgDimComponent);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgDimComponent_FieldName: FieldName := ReadWideString(Stream);
      tgDimComponent_FormatString: FormatString := ReadWideString(Stream);
      tgDimComponent_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

function TDimComponent.StreamSize: integer;
begin
  Result := TagSize * 2;
  if FieldName <> '' then inc(Result, TagSize + WideStringSize(FieldName));
  if FormatString <> '' then inc(Result, TagSize + WideStringSize(FormatString));
end;

procedure TDimComponent.WriteStream(Stream: TStream);
begin
  with Stream do
  begin
    WriteTag(Stream, tgDimComponent);

    if FieldName <> '' then
    begin
      WriteTag(Stream, tgDimComponent_FieldName);
      WriteWideString(Stream, FieldName);
    end;

    if FormatString <> '' then
    begin
      WriteTag(Stream, tgDimComponent_FormatString);
      WriteWideString(Stream, FormatString);
    end;

    WriteTag(Stream, tgDimComponent_EOT);
  end;
end;

procedure TDimension.UpdateCurrentCaptions(const Attribute: WideString);
var
  Index: integer;
begin
  FCurrentCaptions := nil;
  if FAttributeList <> nil then
  begin
    Index := FAttributeList.IndexOf(Attribute);
    if Index >= 0 then
      FCurrentCaptions := TWideStringArray(FAttributeList.Pointers[Index]);
  end;
end;


function TDimensionOrSummaryList.FindFieldName(const FieldName: WideString): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  {$IFDEF ASPRUNTIME}
  if WideCompareText(FieldName, TDimensionOrSummary(Self[i]).FieldName) = 0 then
  {$ELSE}
  if WideCompareText(FieldName, TDimensionOrSummary(PPntrArray(FArrayPointer)^[i]).FieldName) = 0 then
  {$ENDIF}
  begin
    Result := i;
    BREAK;
  end;
end;

function TSummaryState.GetFieldName: WideString;
begin
  Result := FSum.FieldName;
end;

procedure TDimensions.ReadStream(Stream: TStream);
var
  Tag: word;
  ACount, i: integer;
  Dim: TDimension;
begin
  CheckTag(Stream, tgBaseArray);
  ACount := 0;
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgBaseArray_Count: ACount := ReadInteger(Stream);
      tgBaseArray_ArrayData:
        begin
          Count := ACount;
          for i := 0 to ACount - 1 do
          begin
            Dim := TDimension.Create;
            Dim.ReadStream(Stream);
{$IFDEF ASPRUNTIME}
            Self[i] := Dim;
{$ELSE}
            PPntrArray(ArrayPointer)^[i] := Dim;
{$ENDIF}
          end;
        end;
      tgBaseArray_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

procedure TSummaries.ReadStream(Stream: TStream);
var
  Tag: word;
  ACount, i: integer;
  Sum: TSummary;
begin
  CheckTag(Stream, tgBaseArray);
  ACount := 0;
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgBaseArray_Count: ACount := ReadInteger(Stream);
      tgBaseArray_ArrayData:
        begin
          Count := ACount;
          for i := 0 to ACount - 1 do
          begin
            Sum := TSummary.Create;
            Sum.ReadStream(Stream);
{$IFDEF ASPRUNTIME}
            Self[i] := Sum;
{$ELSE}
            PPntrArray(ArrayPointer)^[i] := Sum;
{$ENDIF}
          end;
        end;
      tgBaseArray_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

procedure TCustomHierCube.SaveToStream(Stream: TStream; Buffer: pointer = nil; Count: integer = 0);
begin
{$IFDEF ASPRUNTIME}
  WriteCommonStream(Stream, Buffer, Count);
{$ELSE}
  WriteCompressedCommonStream(Stream, Buffer, Count);
{$ENDIF}
end;

procedure TCustomHierCube.SaveToStream(Stream: TStream; const UserData: string);
begin
  SaveToStream(Stream, pointer(UserData), length(UserData) * SizeOf(Char));
end;

procedure TCustomHierCube.SaveToStreamW(Stream: TStream; const UserData: WideString);
begin
  SaveToStream(Stream, pointer(UserData), length(UserData) * SizeOf(WideChar));
end;

procedure TCustomHierCube.LoadFromStream(Stream: TStream; Buffer: pointer = nil);
begin
{$IFDEF ASPRUNTIME}
  ReadCommonStream(Stream, Buffer);
{$ELSE}
  ReadCompressedCommonStream(Stream, Buffer);
{$ENDIF}
end;



procedure TSaveMember.ReadStream(Stream: TStream);
var
  Tag: word;
begin
  CheckTag(Stream, tgSaveMember);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgSaveMember_IntegerID:      FIntegerID := ReadInteger(Stream);
      tgSaveMember_StringID:      FStringID := ReadWideString(Stream);
      tgSaveMember_IsGroup:      FIsGroup := ReadBoolean(Stream);
      tgSaveMember_GroupCaption:      FGroupCaption := ReadWideString(Stream);
      tgSaveMember_GroupID:      FGroupID := ReadInteger(Stream);
      tgSaveMember_Hidden:      FHidden := ReadBoolean(Stream);
      tgSaveMember_Grouped:      FGrouped := ReadBoolean(Stream);
      tgSaveMember_ParentGroup:      FParentGroup := ReadInteger(Stream);
      tgSaveMember_QualifiedNameHash:  FQualifiedNameHash := ReadInteger(Stream);
      tgSaveMember_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

function TSaveMember.StreamSize: integer;
begin
  Result := TagSize * 2;
  if FIntegerID <> 0 then inc(Result, TagSize + IntegerSize(FIntegerID));
  if FStringID <> '' then inc(Result, TagSize + WideStringSize(FStringID));
  if FIsGroup <> False then inc(Result, TagSize + BooleanSize);
  if FGroupCaption <> '' then inc(Result, TagSize + WideStringSize(FGroupCaption));
  if FGroupID <> 0 then inc(Result, TagSize + IntegerSize(FGroupID));
  if FHidden <> False then inc(Result, TagSize + BooleanSize);
  if FGrouped <> False then inc(Result, TagSize + BooleanSize);
  if FParentGroup <> 0 then inc(Result, TagSize + IntegerSize(FParentGroup));
  if FQualifiedNameHash <> 0 then inc(Result, TagSize + IntegerSize(FQualifiedNameHash));
end;

procedure TSaveMember.WriteStream(Stream: TStream);
begin
  with Stream do
  begin
    WriteTag(Stream, tgSaveMember);

    if FIntegerID <> 0 then
    begin
      WriteTag(Stream, tgSaveMember_IntegerID);
      WriteInteger(Stream, FIntegerID);
    end;

    if FStringID <> '' then
    begin
      WriteTag(Stream, tgSaveMember_StringID);
      WriteWideString(Stream, FStringID);
    end;

    if FIsGroup <> False then
    begin
      WriteTag(Stream, tgSaveMember_IsGroup);
      WriteBoolean(Stream, FIsGroup);
    end;

    if FGroupCaption <> '' then
    begin
      WriteTag(Stream, tgSaveMember_GroupCaption);
      WriteWideString(Stream, FGroupCaption);
    end;

    if FGroupID <> 0 then
    begin
      WriteTag(Stream, tgSaveMember_GroupID);
      WriteInteger(Stream, FGroupID);
    end;

    if FHidden <> False then
    begin
      WriteTag(Stream, tgSaveMember_Hidden);
      WriteBoolean(Stream, FHidden);
    end;

    if FGrouped <> False then
    begin
      WriteTag(Stream, tgSaveMember_Grouped);
      WriteBoolean(Stream, FGrouped);
    end;

    if FParentGroup <> 0 then
    begin
      WriteTag(Stream, tgSaveMember_ParentGroup);
      WriteInteger(Stream, FParentGroup);
    end;

    if FQualifiedNameHash <> 0 then
    begin
      WriteTag(Stream, tgSaveMember_QualifiedNameHash);
      WriteInteger(Stream, FQualifiedNameHash);
    end;

    WriteTag(Stream, tgSaveMember_EOT);
  end;
end;


procedure TSaveMembers.ReadStream(Stream: TStream);
var
  Tag: word;
  ACount, i: integer;
  SaveMember: TSaveMember;
begin
  CheckTag(Stream, tgBaseArray);
  ACount := 0;
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgBaseArray_Count: ACount := ReadInteger(Stream);
      tgBaseArray_ArrayData:
        begin
          Count := ACount;
          for i := 0 to ACount - 1 do
          begin
            SaveMember := TSaveMember.Create;
            SaveMember.ReadStream(Stream);
            {$IFDEF ASPRUNTIME}
            Self[i] := SaveMember;
            {$ELSE}
            PPntrArray(ArrayPointer)^[i] := SaveMember;
            {$ENDIF}
          end;
        end;
      tgBaseArray_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;

  FKeyType := ktUnknown; 
  CheckTag(Stream, tgSaveMembers);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgSaveMembers_StrID: FStrID := ReadBoolean(Stream);
      tgSaveMembers_KeyType: FKeyType := TMemberKeyType(xhStream.ReadByte(Stream));
      tgSaveMembers_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

function TSaveMembers.StreamSize: integer;
begin
  Result := inherited StreamSize + TagSize * 2;
  if FStrID <> False then inc(Result, TagSize + BooleanSize);
  if byte(FKeyType) <> 0 then inc(Result, TagSize + ByteSize)
end;

procedure TSaveMembers.WriteStream(Stream: TStream);
begin
  inherited WriteStream(Stream);
  with Stream do
  begin
    WriteTag(Stream, tgSaveMembers);

    if FStrID <> False then
    begin
      WriteTag(Stream, tgSaveMembers_StrID);
      WriteBoolean(Stream, FStrID);
    end;

    if byte(FKeyType) <> 0 then
    begin
      WriteTag(Stream, tgSaveMembers_KeyType);
      WriteByte(Stream, byte(FKeyType));
    end;

    WriteTag(Stream, tgSaveMembers_EOT);
  end;
end;

{$IFNDEF ASPRUNTIME}
destructor TStreamedDimState.Destroy;
begin
  FSaveMembers.Free;
  inherited;
end;
{$ENDIF}

procedure TStreamedDimState.ReadStream(Stream: TStream);
var
  Tag: word;
begin
  CheckTag(Stream, tgDimensionState);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgDimensionState_FieldName: FFieldName := ReadWideString(Stream);
      tgDimensionState_DisplayName: FDisplayName := ReadWideString(Stream);
      tgDimensionState_SortType: FSortType := TDimSortType(xhStream.ReadByte(Stream));
      tgDimensionState_DimGroup: FDimGroup := TDimGroup(xhStream.ReadByte(Stream));
      tgDimensionState_TotalAppearance: FTotalAppearance := TTotalAppearance(xhStream.ReadByte(Stream));
      tgDimensionState_Range: FRange := ReadInt64(Stream);
      tgDimensionState_Attribute: FAttribute := ReadWideString(Stream);
      tgDimensionState_CaseSensitive: FCaseSensitive := ReadBoolean(Stream);
      tgDimensionState_SaveMembers:
        begin
          FreeAndNil(FSaveMembers);
          FSaveMembers := TSaveMembers.Create;
          ReadStreamedObject(Stream, FSaveMembers);
        end;
      tgDimensionState_EOT:
        begin
          BREAK;
        end;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

function TStreamedDimState.StreamSize: integer;
begin
  Result := TagSize * 5 + WideStringSize(FieldName) + WideStringSize(DisplayName) + WideStringSize(Attribute) +
    StreamedObjectSize(SaveMembers);
  if byte(FSortType) <> 0 then inc(Result, TagSize + ByteSize);
  if byte(FDimGroup) <> 0 then inc(Result, TagSize + ByteSize);
  if FRange <> 0 then inc(Result, TagSize + Int64Size(FRange));
  if byte(FTotalAppearance) <> 0 then inc(Result, TagSize + ByteSize);
  if FCaseSensitive <> False then inc(Result, TagSize + BooleanSize);
end;

procedure TStreamedDimState.WriteStream(Stream: TStream);
begin
  with Stream do
  begin
    WriteTag(Stream, tgDimensionState);

    WriteTag(Stream, tgDimensionState_FieldName);
    WriteWideString(Stream, FieldName);

    WriteTag(Stream, tgDimensionState_DisplayName);
    WriteWideString(Stream, DisplayName);

    if byte(FSortType) <> 0 then
    begin
      WriteTag(Stream, tgDimensionState_SortType);
      WriteByte(Stream, byte(FSortType));
    end;

    if byte(FDimGroup) <> 0 then
    begin
      WriteTag(Stream, tgDimensionState_DimGroup);
      WriteByte(Stream, byte(FDimGroup));
    end;

    if FRange <> 0 then
    begin
      WriteTag(Stream, tgDimensionState_Range);
      WriteInt64(Stream, FRange);
    end;

    if byte(FTotalAppearance) <> 0 then
    begin
      WriteTag(Stream, tgDimensionState_TotalAppearance);
      WriteByte(Stream, byte(FTotalAppearance));
    end;

    WriteTag(Stream, tgDimensionState_Attribute);
    WriteWideString(Stream, Attribute);

    if FCaseSensitive <> False then
    begin
      WriteTag(Stream, tgDimensionState_CaseSensitive);
      WriteBoolean(Stream, FCaseSensitive);
    end;

    WriteStreamedObject(Stream, SaveMembers, tgDimensionState_SaveMembers);

    WriteTag(Stream, tgDimensionState_EOT);
  end;
end;


procedure TStreamedDimStates.ReadStream(Stream: TStream);
var
  Tag: word;
  ACount, i: integer;
  StreamedDimState: TStreamedDimState;
begin
  CheckTag(Stream, tgBaseArray);
  ACount := 0;
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgBaseArray_Count: ACount := ReadInteger(Stream);
      tgBaseArray_ArrayData:
        begin
          Count := ACount;
          for i := 0 to ACount - 1 do
          begin
            StreamedDimState := TStreamedDimState.Create;
            StreamedDimState.ReadStream(Stream);
{$IFDEF ASPRUNTIME}
            Self[i] := StreamedDimState;
{$ELSE}
            PPntrArray(ArrayPointer)^[i] := StreamedDimState;
{$ENDIF}
          end;
        end;
      tgBaseArray_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

function TGridInfo.DimIDs2Strings(DimIDs: TIntegerArray): TWideStringArray;
var
  i: integer;
begin
  if DimIDs = nil then
    Result := nil
  else
    begin
      Result := TWideStringArray.CreateCount(DimIDs.Count);
      for i := 0 to DimIDs.Count - 1 do
        Result[i] := TDimensionState(FDimensionStates[DimIDs[i]]).FieldName;
    end;
end;

function TGridInfo.DimStrings2IDs(DimStrings: TWideStringArray): TIntegerArray;
var
  i: integer;
  DimState: TDimensionState;
begin
  Result := TIntegerArray.Create;
  if DimStrings <> nil then
  begin
    for i := 0 to DimStrings.Count - 1 do
    begin
      DimState := FDimensionStates.FindFieldName(DimStrings[i]);
      if DimState <> nil then Result.Add(DimState.DimID);
    end;
  end;
end;


procedure TStreamedSubFunction.ReadStream(Stream: TStream);
var
  Tag: word;
begin
  CheckTag(Stream, tgStreamedSubFunction);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgStreamedSubFunction_Visible:  FVisible := ReadBoolean(Stream);
      tgStreamedSubFunction_FormatString: FFormatString := ReadWideString(Stream);
      tgStreamedSubFunction_Alignment: FAlignment := TAlignment(xhStream.ReadByte(Stream));
      tgStreamedSubFunction_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

function TStreamedSubFunction.StreamSize: integer;
begin
  Result := TagSize * 2;
  if FVisible <> False then inc(Result, TagSize + BooleanSize);
  if FFormatString <> '' then inc(Result, TagSize + WideStringSize(FFormatString));
  if byte(FAlignment) <> 0 then inc(Result, TagSize + ByteSize);
end;

procedure TStreamedSubFunction.WriteStream(Stream: TStream);
begin
  with Stream do
  begin
    WriteTag(Stream, tgStreamedSubFunction);

    if FVisible <> False then
    begin
      WriteTag(Stream, tgStreamedSubFunction_Visible);
      WriteBoolean(Stream, FVisible);
    end;

    if FFormatString <> '' then
    begin
      WriteTag(Stream, tgStreamedSubFunction_FormatString);
      WriteWideString(Stream, FFormatString);
    end;

    if byte(FAlignment) <> 0 then
    begin
      WriteTag(Stream, tgStreamedSubFunction_Alignment);
      WriteByte(Stream, byte(FAlignment));
    end;

    WriteTag(Stream, tgStreamedSubFunction_EOT);
  end;
end;


procedure TStreamedFunction.ReadStream(Stream: TStream);
var
  Tag: word;
  ACount, i: integer;
  StreamedSubFunction: TStreamedSubFunction;
begin
  CheckTag(Stream, tgBaseArray);
  ACount := 0;
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgBaseArray_Count: ACount := ReadInteger(Stream);
      tgBaseArray_ArrayData:
        begin
          Count := ACount;
          for i := 0 to ACount - 1 do
          begin
            StreamedSubFunction := TStreamedSubFunction.Create;
            StreamedSubFunction.ReadStream(Stream);
{$IFDEF ASPRUNTIME}
            Self[i] := StreamedSubFunction;
{$ELSE}
            PPntrArray(ArrayPointer)^[i] := StreamedSubFunction;
{$ENDIF}
          end;
        end;
      tgBaseArray_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;


procedure TStreamedSumInfo.ReadStream(Stream: TStream);
var
  Tag: word;
  ACount, i: integer;
  StreamedFunction: TStreamedFunction;
begin
  CheckTag(Stream, tgBaseArray);
  ACount := 0;
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgBaseArray_Count: ACount := ReadInteger(Stream);
      tgBaseArray_ArrayData:
        begin
          Count := ACount;
          for i := 0 to ACount - 1 do
          begin
            StreamedFunction := TStreamedFunction.Create;
            StreamedFunction.ReadStream(Stream);
{$IFDEF ASPRUNTIME}
            Self[i] := StreamedFunction;
{$ELSE}
            PPntrArray(ArrayPointer)^[i] := StreamedFunction;
{$ENDIF}
          end;
        end;
      tgBaseArray_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;
  
  CheckTag(Stream, tgStreamedSummaryInfo);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgStreamedSummaryInfo_Calculated: FCalculated := ReadBoolean(Stream);
      tgStreamedSummaryInfo_Formula: FFormula := ReadWideString(Stream);
      tgStreamedSummaryInfo_FieldName: FFieldName := ReadWideString(Stream);
      tgStreamedSummaryInfo_DisplayName: FDisplayName := ReadWideString(Stream);
      tgStreamedSummaryInfo_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

function TStreamedSumInfo.StreamSize: integer;
begin
  Result := inherited StreamSize + TagSize * 2;
  if FCalculated <> False then inc(Result, TagSize + BooleanSize);
  if FFormula <> '' then inc(Result, TagSize + WideStringSize(FFormula));
  if FFieldName <> '' then inc(Result, TagSize + WideStringSize(FFieldName));
  if FDisplayName <> '' then inc(Result, TagSize + WideStringSize(FDisplayName));
end;

procedure TStreamedSumInfo.WriteStream(Stream: TStream);
begin
  inherited WriteStream(Stream);
  with Stream do
  begin
    WriteTag(Stream, tgStreamedSummaryInfo);

    if FCalculated <> False then
    begin
      WriteTag(Stream, tgStreamedSummaryInfo_Calculated);
      WriteBoolean(Stream, FCalculated);
    end;
    
    if FFormula <> '' then
    begin
      WriteTag(Stream, tgStreamedSummaryInfo_Formula);
      WriteWideString(Stream, FFormula);
    end;

    if FFieldName <> '' then
    begin
      WriteTag(Stream, tgStreamedSummaryInfo_FieldName);
      WriteWideString(Stream, FFieldName);
    end;

    if FDisplayName <> '' then
    begin
      WriteTag(Stream, tgStreamedSummaryInfo_DisplayName);
      WriteWideString(Stream, FDisplayName);
    end;

    WriteTag(Stream, tgStreamedSummaryInfo_EOT);
  end;
end;


procedure TStreamedSummarySettings.ReadStream(Stream: TStream);
var
  Tag: word;
  ACount, i: integer;
  StreamedSumInfo: TStreamedSumInfo;
begin
  CheckTag(Stream, tgBaseArray);
  ACount := 0;
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgBaseArray_Count: ACount := ReadInteger(Stream);
      tgBaseArray_ArrayData:
        begin
          Count := ACount;
          for i := 0 to ACount - 1 do
          begin
            StreamedSumInfo := TStreamedSumInfo.Create;
            StreamedSumInfo.ReadStream(Stream);
{$IFDEF ASPRUNTIME}
            Self[i] := StreamedSumInfo;
{$ELSE}
            PPntrArray(ArrayPointer)^[i] := StreamedSumInfo;
{$ENDIF}
          end;
        end;
      tgBaseArray_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

procedure TCustomHierCube.CalculateRangeBasedDimensions;
var
  DimID: integer;
begin
  for DimID := 0 to Dimensions.Count - 1 do CalculateRangeBasedDimension(DimID);
end;


function TCustomHierCube.DefineCompositeDimension(const DisplayName: WideString; DimGroup: TDimGroup): TDimSum;
begin
  Result := DimensionMap.Add;
  Result.FDisplayName := DisplayName;
  Result.FBaseFieldType := db.ftString;

  Result.DimSumType := dsDimension;
  Result.FDimGroup := DimGroup;
  Result.FComposite := True;
end;

function TCustomHierCube.DefineCompositeMember(CompositeDim: TDimSum; const FieldName: WideString): TDimCollectionItem;
begin
  Result := DefineCompositeMember(CompositeDim, FieldName, nil, '', '');
end;

function TCustomHierCube.DefineCompositeMember(const DimensionName, FieldName: WideString): TDimCollectionItem;
var
  DimSum: TDimSum;
begin
  Result := nil;
  DimSum := DimensionMap.FindCompositeDimension(DimensionName);
  if DimSum <> nil then Result := DefineCompositeMember(DimSum, FieldName);
end;


function TCustomHierCube.DefineCompositeMember(CompositeDim: TDimSum;
  const FieldName: WideString; LookupTable: TDataSet; const ID_Field,
  Name_Field: WideString): TDimCollectionItem;
begin
  Result := nil;
  if (CompositeDim = nil) or (CompositeDim.FComposite = False) then EXIT;
  if CompositeDim.DimCollection = nil then
    CompositeDim.DimCollection := TDimCollection.Create(Self);
  if CompositeDim.FComposedFields = '' then
    CompositeDim.FComposedFields := FieldName
  else
    CompositeDim.FComposedFields := CompositeDim.FComposedFields + xhFieldsDelimiter + ' ' + FieldName;
  CompositeDim.BaseFieldName := CompositeDim.FComposedFields;

  Result := TDimCollectionItem(CompositeDim.DimCollection.Add);
  Result.FieldName := FieldName;
  Result.LookupDataSet := LookupTable;
  Result.ID_Field := ID_Field;
  Result.Name_Field := Name_Field;
end;

function TCustomHierCube.DefineCompositeMember(const DimensionName, FieldName: WideString;
  LookupTable: TDataSet; const ID_Field, Name_Field: WideString): TDimCollectionItem;
var
  DimSum: TDimSum;
begin
  Result := nil;
  DimSum := DimensionMap.FindCompositeDimension(DimensionName);
  if DimSum <> nil then Result := DefineCompositeMember(DimSum, FieldName, LookupTable, ID_Field, Name_Field);
end;


function TCustomHierCube.DefineFieldAsDimension(const FieldName: WideString;
  DimGroup: TDimGroup; const ID_Field, ParentID_Field, Name_Field: WideString;
  DimensionTable: TDataSet;
  const AttributeFields: array of WideString): TDimSum;
var
  i: integer;
begin
  Result := DefineFieldAsDimension(FieldName, DimGroup);
  if Result <> nil then
  begin
    SetDimensionLookup(Result, DimensionTable, ID_Field, Name_Field, ParentID_Field);
    for i := 0 to length(AttributeFields) - 1 do
    begin
      if Result.FAttributes = '' then
        Result.FAttributes := AttributeFields[i]
      else
        Result.FAttributes := Result.FAttributes + xhFieldsDelimiter + ' ' +  AttributeFields[i];
    end;
  end;
end;

function TCustomHierCube.DefineFieldAsDimension(const FieldName, DisplayName: WideString;
  DimGroup: TDimGroup; const ID_Field, ParentID_Field, Name_Field: WideString;
  DimensionTable: TDataSet;
  const AttributeFields: array of WideString): TDimSum;
begin
  Result := DefineFieldAsDimension(FieldName, DimGroup, ID_Field, ParentID_Field, Name_Field, DimensionTable, AttributeFields);
  if Result <> nil then Result.DisplayName := DisplayName;
end;

function TCustomHierCube.DefineFieldAsDimension(const FieldName: WideString;
  DimGroup: TDimGroup; TransformMethod: TTransformMethod;
  IntervalCount: integer): TDimSum;
begin
  Result := DefineFieldAsDimension(FieldName, DimGroup);
  if Result <> nil then
  begin
    if not IsNumericField(Result.FBaseFieldType) then NotNumericRangeDimensionError(Result.BaseFieldName);
    Result.EnableTransformation := True;
    Result.TransformMethod := TransformMethod;
    Result.SeriesMemberCount := IntervalCount;
  end;
end;

function TCustomHierCube.DefineFieldAsDimension(const FieldName, DisplayName: WideString;
  DimGroup: TDimGroup; TransformMethod: TTransformMethod;
  IntervalCount: integer): TDimSum;
begin
  Result := DefineFieldAsDimension(FieldName, DimGroup, TransformMethod, IntervalCount);
  if Result <> nil then Result.DisplayName := DisplayName;
end;

procedure TCustomHierCube.UndefineField(ADimSum: TDimSum);
begin
  if ADimSum <> nil then
  begin
    ADimSum.DimSumType := dsUnknown;
  end;
end;
                          
procedure TCustomHierCube.DefineKeyFields(AKeyFields: array of WideString);
begin
  DefineVariableFields(AKeyFields);
end;

procedure TCustomHierCube.DefineVariableFields(AVarFields: array of WideString);
var
  i: integer;
begin
  FVarFields := '';
  for i := 0 to length(AVarFields) - 1 do
  begin
    if FVarFields = '' then
      FVarFields := AVarFields[i]
    else
      FVarFields := FVarFields + xhFieldsDelimiter + ' ' + AVarFields[i];
  end;
  UpdateVarFieldTypes;
end;

procedure TCustomHierCube.DimensionMapChanged;
begin
  NotifyLinkedControls(xeDimensionMapChanged);
end;

procedure TGridInfo.DoExpandAllNodes(DimState: TDimensionState; DimIDs: TIntegerArray; LabelNodes: TLabelNodes);
var
  DimIndex: integer;

  procedure ProcessNodes(Nodes: TLabelNodes);
  var
    i: integer;
    LabelNode: TLabelNode;
  begin
    for i := 0 to Nodes.Count - 1 do
    begin
      LabelNode := TLabelNode(Nodes[i]);
      if LabelNode.DimID = DimState.DimID then
        begin
          if LabelNode.HierButton <> nil then
            begin
              FPivotEventArgs.Clear;
              FPivotEventArgs.FAllowOperation := True;
              if assigned(FBeforePivot) then
              begin
                FPivotEventArgs.FOperation := opDrillDown;
                FPivotEventArgs.FLabelNode := LabelNode;
                FPivotEventArgs.FMemberIndex := LabelNode.Value;
                FPivotEventArgs.FMemberName := TDimMember(LabelNode.DimState.FAllDimMembers[LabelNode.Value]).FID;
                FPivotEventArgs.FDimState := LabelNode.DimState;
                FBeforePivot({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, FPivotEventArgs);
              end;
              if FPivotEventArgs.FAllowOperation = False then Continue;
              DoExpandHierLabelNode(LabelNode, DimIDs);
              if assigned(FAfterPivot) then
              begin
                FPivotEventArgs.FOperation := opDrillDown;
                FPivotEventArgs.FLabelNode := LabelNode;
                FPivotEventArgs.FMemberIndex := LabelNode.Value;
                FPivotEventArgs.FMemberName := TDimMember(LabelNode.DimState.FAllDimMembers[LabelNode.Value]).FID;
                FPivotEventArgs.FDimState := LabelNode.DimState;
                FAfterPivot({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, FPivotEventArgs);
              end;

              if LabelNode.ChildNodes <> nil then ProcessNodes(LabelNode.ChildNodes);
            end
          else if LabelNode.ValueButton <> nil then
            begin
              FPivotEventArgs.Clear;
              FPivotEventArgs.FAllowOperation := True;
              if assigned(FBeforePivot) then
              begin
                FPivotEventArgs.FOperation := opDrillDown;
                FPivotEventArgs.FLabelNode := LabelNode;
                FPivotEventArgs.FMemberIndex := LabelNode.Value;
                FPivotEventArgs.FMemberName := TDimMember(LabelNode.DimState.FAllDimMembers[LabelNode.Value]).FID;
                FPivotEventArgs.FDimState := LabelNode.DimState;
                FBeforePivot({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, FPivotEventArgs);
              end;
              if FPivotEventArgs.FAllowOperation = False then Continue;
              DoExpandLabelNode(LabelNode, DimIDs);
              if assigned(FAfterPivot) then
              begin
                FPivotEventArgs.FOperation := opDrillDown;
                FPivotEventArgs.FLabelNode := LabelNode;
                FPivotEventArgs.FMemberIndex := LabelNode.Value;
                FPivotEventArgs.FMemberName := TDimMember(LabelNode.DimState.FAllDimMembers[LabelNode.Value]).FID;
                FPivotEventArgs.FDimState := LabelNode.DimState;
                FAfterPivot({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, FPivotEventArgs);
              end;
            end;
        end
      else
        if LabelNode.ChildNodes <> nil then ProcessNodes(LabelNode.ChildNodes);
    end;
  end;

begin
  DimIndex := DimIDs.IndexOf(DimState.DimID);
  if (DimIndex < 0) or ((DimIndex >= DimIDs.Count - 1) and (DimState.LevelsCount = 1)) then EXIT;
  ProcessNodes(LabelNodes);
end;

procedure TGridInfo.DoCollapseAllNodes(DimState: TDimensionState; DimIDs: TIntegerArray; LabelNodes: TLabelNodes);
var
  DimIndex: integer;

  procedure ProcessNodes(Nodes: TLabelNodes);
  var
    i: integer;
    LabelNode: TLabelNode;
  begin
    for i := Nodes.Count - 1 downto 0 do
    begin
      LabelNode := TLabelNode(Nodes[i]);
      if LabelNode.DimID = DimState.DimID then
        begin
          if LabelNode.Expanded then
          begin
            FPivotEventArgs.Clear;
            FPivotEventArgs.FAllowOperation := True;
            if assigned(FBeforePivot) then
            begin
              FPivotEventArgs.FOperation := opDrillUp;
              FPivotEventArgs.FLabelNode := LabelNode;
              FPivotEventArgs.FMemberIndex := LabelNode.Value;
              FPivotEventArgs.FMemberName := TDimMember(LabelNode.DimState.FAllDimMembers[LabelNode.Value]).FID;
              FPivotEventArgs.FDimState := LabelNode.DimState;
              FBeforePivot({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, FPivotEventArgs);
            end;
            if FPivotEventArgs.FAllowOperation = False then Continue;
            DoCollapseLabelNode(LabelNode, DimIDs);
            if assigned(FAfterPivot) then
            begin
              FPivotEventArgs.FOperation := opDrillUp;
              FPivotEventArgs.FLabelNode := LabelNode;
              FPivotEventArgs.FMemberIndex := LabelNode.Value;
              FPivotEventArgs.FMemberName := TDimMember(LabelNode.DimState.FAllDimMembers[LabelNode.Value]).FID;
              FPivotEventArgs.FDimState := LabelNode.DimState;
              FAfterPivot({$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF}, FPivotEventArgs);
            end;
          end;
        end
      else
        if LabelNode.ChildNodes <> nil then ProcessNodes(LabelNode.ChildNodes);
    end;
  end;

begin
  DimIndex := DimIDs.IndexOf(DimState.DimID);

  if (DimIndex < 0) or ((DimIndex >= DimIDs.Count - 1) and (DimState.LevelsCount = 1)) then EXIT;
  ProcessNodes(LabelNodes);
end;

procedure TGridInfo.CollapseAllNodes(DimState: TDimensionState);
var
  DimIDs: TIntegerArray;
  LabelNodes: TLabelNodes;
begin
  if DimState = nil then EXIT;
  BeginChange;
  try
    if DimState.DimGroup = dgRow then
      begin
        DimIDs := FRowDimIDs;
        LabelNodes := FRowLabelNodes;
      end
    else
      begin
        DimIDs := FColDimIDs;
        LabelNodes := FColLabelNodes;
      end;
    DoCollapseAllNodes(DimState, DimIDs, LabelNodes);
    RebuildVisibleDimIDs;
  finally
    EndChange(geAggregateChanged, 0); 
  end;
end;

procedure TGridInfo.ExpandAllNodes(const DimensionName: WideString);
begin
  ExpandAllNodes(FDimensionStates.FindDisplayName(DimensionName));
end;

procedure TGridInfo.CollapseAllNodes(const DimensionName: WideString);
begin
  CollapseAllNodes(FDimensionStates.FindDisplayName(DimensionName));
end;

procedure TGridInfo.QuickSortLabelNodes(Nodes: TLabelNodes; L, R: Integer; Compare: TLabelNodesCompare; TotalAppearance: TTotalAppearance; Data: Longint);
var
  I, J, P: Integer;
begin
  repeat
    I := L;
    J := R;
    P := (L + R) shr 1;
    repeat
      while Compare(Nodes, I, P, TotalAppearance, Data) < 0 do inc(I);
      while Compare(Nodes, J, P, TotalAppearance, Data) > 0 do dec(J);
      if I <= J then
      begin
        Nodes.QuickExchange(I, J);
        if P = I then
          P := J
        else if P = J then
          P := I;
        inc(I);
        dec(J);
      end;
    until I > J;
    if L < J then QuickSortLabelNodes(Nodes, L, J, Compare, TotalAppearance, Data);
    L := I;
  until I >= R;
end;

function TGridInfo.LabelNodesCompareRanks(LabelNodes: TLabelNodes; Index1, Index2: Integer; TotalAppearance: TTotalAppearance; Data: Longint): Integer;
var
  Node1, Node2: TLabelNode;
  Rank1, Rank2: integer;
begin
  Node1 := TLabelNode(LabelNodes[Index1]);
  Node2 := TLabelNode(LabelNodes[Index2]);
  if Node1.Value = SubTotal then
    begin
      if Node2.Value = SubTotal then Result := 0 else Result := 1;
      if TotalAppearance = taFirst then
        Result := -Result;
    end
  else if Node2.Value = SubTotal then
    begin
      if Node1.Value = SubTotal then Result := 0 else Result := -1;
      if TotalAppearance = taFirst then
        Result := -Result;
    end
  else
    begin
      Rank1 := Node1.DimState.fIndexSortRank[Node1.Value];
      Rank2 := Node2.DimState.fIndexSortRank[Node2.Value];

      if Rank1 > Rank2 then
        Result := 1
      else if Rank1 < Rank2 then
        Result := -1
      else
        Result := 0;
    end;
end;

function TGridInfo.LabelNodesCompareValues(LabelNodes: TLabelNodes; Index1, Index2: Integer; TotalAppearance: TTotalAppearance; Data: Longint): Integer;
var
  Node1, Node2: TLabelNode;
begin
  Node1 := TLabelNode(LabelNodes[Index1]);
  Node2 := TLabelNode(LabelNodes[Index2]);
  if Node1.Value = SubTotal then
    begin
      if Node2.Value = SubTotal then Result := 0 else Result := 1;
      if TotalAppearance = taFirst then Result := -Result;
    end
  else if Node2.Value = SubTotal then
    begin
      if Node1.Value = SubTotal then Result := 0 else Result := -1;
      if TotalAppearance = taFirst then Result := -Result;
    end
  else
    begin
      Result := DoCompareValues(Node1, Node2, Data);
      if ValueSortData.SortType = soDescending then Result := -Result;
    end;
end;

function TGridInfo.DoCompareValues(Node1, Node2: TLabelNode; Data: Longint): Integer;
var
  V1, V2: Double;
  found1, found2: boolean;
  SumInfoID: integer;
  Fun: TFunction;
  SubFun: TSubFunction;
  ColNode: TLabelNode;

begin
  Col2SumFun(Data, SumInfoID, Fun, SubFun);
  ColNode := Col2LabelNode(Data);

  found1 := fGridSummaryArray.GetData2(Node1, ColNode, SumInfoID, Fun, SubFun, V1);
  found2 := fGridSummaryArray.GetData2(Node2, ColNode, SumInfoID, Fun, SubFun, V2);

  if not found1 then
    begin
      if found2 then Result := -1 else Result := 0;
    end
  else if not found2 then
    begin
      if found1 then Result := 1 else Result := 0;
    end
  else
    begin
      if V1 > V2 then Result := 1 else if V1 < V2 then Result := -1 else
      if Node1.DatabaseRank < Node2.DatabaseRank then Result := 1 else if Node1.DatabaseRank > Node2.DatabaseRank then Result := -1 else Result := 0;
    end;
end;

procedure TGridInfo.ChangeFilterState(DimState: TDimensionState);
begin
end;

procedure TGridInfo.SaveCurrentPivotState(const StateName: WideString; MembersSaveMode: TMembersSaveMode = smSaveAll);
var
  PivotState: TPivotState;
  Index: integer;
begin
  Index := FPivotStates.FindState(StateName);
  if Index >= 0 then
    begin
      PivotState := TPivotState(PivotStates[Index]);
      fCurrentPivotStateName := FPivotStates.Names[Index];
    end
  else
    begin
      PivotState := FPivotStates.Add(StateName);
      fCurrentPivotStateName := StateName;
    end;
  PivotState.SaveState(Self, MembersSaveMode);
  if assigned(FOnSavePivotState) then FOnSavePivotState(Self, fCurrentPivotStateName);
end;

procedure TGridInfo.DeletePivotState(const StateName: WideString);
var
  deleted: boolean;
begin
  deleted := FPivotStates.Delete(StateName);
  if WideCompareText(StateName, FCurrentPivotStateName) = 0 then
    FCurrentPivotStateName := '';
  if deleted then  
  if assigned(FOnDeletePivotState) then FOnDeletePivotState(Self, StateName);
end;

procedure TGridInfo.SetFCurrentPivotStateName(const Value: WideString);
var
  Index: integer;
begin
  if Value = '' then
    FCurrentPivotStateName := ''
  else
    begin
      Index := FPivotStates.FindState(Value);
      if Index >= 0 then
      begin
        FCurrentPivotStateName := FPivotStates.Names[Index];
        RestorePivotState(TPivotState(FPivotStates[Index]), rmRestoreHidden);
      end;
    end;
end;

function TGridInfo.GetCurrentPivotState: TPivotState;
var
  Index: integer;
begin
  Result := nil;
  Index := FPivotStates.FindState(FCurrentPivotStateName);
  if Index >= 0 then Result := TPivotState(FPivotStates[Index]);
end;

procedure TDimSum.MoveToDefined;
var
  NewIndex: integer;
begin
  NewIndex := TDimSums(Collection).FindFirstUndefined;
  MoveTo(NewIndex);
end;

procedure TDimSum.MoveTo(Index: integer);
begin
  if Index >= 0 then
    inherited SetIndex(Index)
  else
    inherited SetIndex(Collection.Count - 1);
end;

procedure TGridInfo.HideMembersExceptThis(LabelNode: TLabelNode);
var
  Index: integer;
  DimState: TDimensionState;
  DimMember: TDimMember;
begin
  if LabelNode.IsSubTotal then LabelNode := LabelNode.Parent;
  if LabelNode = nil then EXIT;
  DimState := LabelNode.DimState;
  FDimensionStates.BeginUpdate;
  for Index := 0 to DimState.MemberCount - 1 do
    TDimMember(DimState.FAllDimMembers[Index]).Visible := DimState.HasAsAncestor(Index, LabelNode.Value);
  DimMember := TDimMember(DimState.FAllDimMembers[LabelNode.Value]);
  while DimMember <> nil do
  begin
    DimMember.Visible := True;
    DimMember := DimMember.FParent;
  end;

  if DimState.DimGroup = dgPage then
    DimState.RegisterChange(dctPageFiltered)
  else
    DimState.RegisterChange(dctActiveFiltered);
  FDimensionStates.EndUpdate;
end;

procedure TCustomHierCube.DoReadFactTable(KeepExistentData: boolean);
var
  IndexArrays: TObjectArray;
  DimFields, SumFields, Keys: TPointerArray;
  i, j, DimID, SumID, Index, v, IntKey, ParentIndex, k: integer;
  Dim: TDimension;
  FT: TFactTable;
  ReadSummaries: boolean;
  vDouble: double;
  StrKey, CompositeKey, s, cap, ErrorKey: WideString;
  LookupField: TLookupField;
  IndexArray: TIntegerArray;
  NewMember: boolean;

  EventFrequency: integer;
  ProcessedRecords: integer;
  EventCounter: integer;
  StringArray: TWideStringArray;

  {$IFNDEF ASPRUNTIME}
  procedure UpdateProgressBar;
  begin
    if Assigned(FProgressDialog) then
    if (FProgressDialog.UpdateProgress = -1) then
    begin
      UserCanceledError;
    end;
  end;
  {$ENDIF}

  {$IFNDEF ASPRUNTIME}
  procedure InitEditableFields;
  var
    FieldNames: TWideStringArray;
    DisplayNames: TWideStringArray;
    i: integer;
  begin
    BuildEditableFieldList(FieldNames, DisplayNames);
    if FieldNames <> nil then
    begin
      try
        for i := 0 to FieldNames.Count - 1 do
        FEditableFields.AddField(FieldNames[i], TFieldType(FieldNames.Pointers[i]), DisplayNames[i]);
      finally
        FieldNames.Free; DisplayNames.Free;
      end;
    end;
    FEditableFields.Open; 
  end;
  {$ENDIF}

begin
  if FSummaries.Count < 1 then
    raise ECubeError.Create(GetResStr('xhecNoSummariesDefined', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecNoSummariesDefined));
  if FDimensions.Count < 1 then
    raise ECubeError.Create(GetResStr('xhecNoDimensionsDefined', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecNoDimensionsDefined));
  IndexArrays := TObjectArray.CreateCount(Dimensions.Count);
  Keys := TPointerArray.Create;
  DimFields := TPointerArray.CreateCount(Dimensions.Count);
  SumFields := TPointerArray.CreateCount(Summaries.Count);
  try
    try
      if not Connected then  Connected := True;
    except
      raise ECubeError.Create(GetResStr('xhecNotConnectedToDB', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhecNotConnectedToDB));
    end;
    {$IFNDEF ASPRUNTIME}
    if Assigned(FProgressDialog) then
    begin
      FProgressDialog.Init;
      FProgressDialog.FormatStr := GetResStr('xhRowsReadFormatStr', @xhRowsReadFormatStr);
      FProgressDialog.Caption := GetResStr('xhReadingFactTable', @xhReadingFactTable);
    end;
    {$ENDIF}

    EventFrequency := 1;
    EventCounter := 0;
    if assigned(FBeforeReadFactTable) then FBeforeReadFactTable(Self, DataSet, EventFrequency);

    with DataSet do
    begin
      for i := 0 to DimFields.Count - 1 do
      if TDimensionOrSummary(Dimensions[i]).Composite = False then
        DimFields[i] := FieldByName(TDimensionOrSummary(Dimensions[i]).FieldName);

      for i := 0 to SumFields.Count - 1 do
        SumFields[i] := FieldByName(TDimensionOrSummary(Summaries[i]).FieldName);

      for DimID := 0 to Dimensions.Count - 1 do
      begin
        Dim := TDimension(Dimensions[DimID]);
        if Dim.RangeBased then
          begin
            Dim.FUsedMembers := nil;
            if Dim.FDefaultAttribute = '' then
              Dim.FDefaultAttribute := GetResStr('xhDefaultAttributeName', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhDefaultAttributeName);
            if Dim.FCurrentCaptions = nil then
            begin
              Dim.FCurrentCaptions := TWideStringArray.Create;
              Dim.FCurrentCaptions.Duplicates := dupAccept;
            end;
            if Dim.FAttributeList = nil then
            begin
              Dim.FAttributeList := TAttributeList.Create;
              Dim.FAttributeList.AddPointer(Dim.FDefaultAttribute, Dim.FCurrentCaptions);
            end;
            if Dim.FDoubleArray = nil then
              begin
                Dim.FDoubleArray := TDoubleArray.Create;
                Dim.FDoubleArray.Sorted := True;
                Dim.FDoubleArray.Duplicates := dupAccept;

                Dim.FFTIndexes := TIntegerArray.Create;
                Dim.FInvertFTIndexes := TIntegerArray.Create;
              end
            else if KeepExistentData = False then
              begin
                Dim.FDoubleArray.Clear;
                Dim.FFTIndexes.Clear;
                Dim.FInvertFTIndexes.Clear;
              end;
          end
        else if Dim.HasLookup then
          begin
            if KeepExistentData = False then Dim.FEmptyMemberUsed := False;
            if Dim.AvailableMembers = byFactTable then
              begin
                if Dim.FUsedMembers = nil then
                  begin
                    Dim.FUsedMembers := TIntegerArray.Create;
                    Dim.FUsedMembers.Sorted := True;
                    Dim.FUsedMembers.Duplicates := dupIgnore;
                  end
                else
                  if KeepExistentData = False then Dim.FUsedMembers.Clear;
              end
            else if Dim.AvailableMembers = byDimension then
              FreeAndNil(Dim.FUsedMembers);

            if Dim.StrID then
              Dim.FAdditionalMembers := TWideStringArray.Create
            else
              Dim.FAdditionalMembers := TIntegerArray.Create;
          end
        else
          begin
            Dim.FUsedMembers := nil;
            if Dim.Composite = True then
              begin
                if Dim.FDefaultAttribute = '' then
                  Dim.FDefaultAttribute := GetResStr('xhDefaultAttributeName', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhDefaultAttributeName);

                if Dim.FCurrentCaptions = nil then
                  begin
                    Dim.FCurrentCaptions := TWideStringArray.Create;
                    Dim.FCurrentCaptions.Duplicates := dupAccept;
                  end
                else
                  if KeepExistentData = False then Dim.FCurrentCaptions.Clear;

                if Dim.FAttributeList = nil then
                begin
                  Dim.FAttributeList := TAttributeList.Create;
                  Dim.FAttributeList.AddPointer(Dim.FDefaultAttribute, Dim.FCurrentCaptions);
                end;

                if Dim.FStringKeys = nil then
                  begin
                    Dim.FStringKeys := TWideStringArray.Create;
                    Dim.FStringKeys.Sorted := True;
                    Dim.FStringKeys.Duplicates := dupIgnore;
                  end
                else
                  Dim.FStringKeys.Sorted := True;
                if KeepExistentData = False then Dim.FStringKeys.Clear;

                if Dim.FParents = nil then
                  Dim.FParents := TIntegerArray.Create
                else
                  if KeepExistentData = False then Dim.FParents.Clear;

                Dim.FCompositeFields := TWideStringArray.Create;

                j := 1;
                s := ExtractWord(Dim.ComposedFields, j);
                if s <> '' then
                repeat
                  {$IFDEF ASPRUNTIME}
                  Dim.FCompositeFields.AddPointer(s, FieldByName(s));
                  {$ELSE}
                  Dim.FCompositeFields.AddPointer(s, FieldByName(s));
                  {$ENDIF}
                  s := ExtractWord(Dim.ComposedFields, j);
                until s = '';

              end
            else if Dim.StrID then
              begin
                if Dim.FDefaultAttribute = '' then
                  Dim.FDefaultAttribute := GetResStr('xhDefaultAttributeName', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhDefaultAttributeName);
                if Dim.FCurrentCaptions = nil then
                  begin
                    Dim.FCurrentCaptions := TWideStringArray.Create;
                    Dim.FCurrentCaptions.Sorted := True;
                  end
                else
                  Dim.FCurrentCaptions.Sorted := True;
                if KeepExistentData = False then Dim.FCurrentCaptions.Clear;

                if Dim.FAttributeList = nil then
                begin
                  Dim.FAttributeList := TAttributeList.Create;
                  Dim.FAttributeList.AddPointer(Dim.FDefaultAttribute, Dim.FCurrentCaptions);
                end;
              end
            else
              begin
                if Dim.Items.Count = 0 then
                  IndexArrays[DimID] := TIntegerArray.Create
                else
                  begin
                    if KeepExistentData = False then Dim.Items.Clear;

                    IndexArray := TIntegerArray.CreateCount(Dim.Items.Count);
                    IndexArrays[DimID] := IndexArray;
                    IndexArray.FillRank;

                    if Dim.Items.Count > 1 then
                    {$IFDEF ASPRUNTIME}
                    System.Array.Sort(Dim.Items.List, IndexArray.List, 0, Dim.Items.Count);
                    {$ELSE}
                    for i := 0 to IndexArray.Count - 2 do
                    for j := i + 1 to IndexArray.Count - 1 do
                    if Dim.Items[i] > Dim.Items[j] then
                    begin
                      Dim.Items.QuickExchange(i, j);
                      IndexArray.QuickExchange(i, j);
                    end;
                    {$ENDIF}
                    Dim.Items.Sorted := True;
                  end;
              end;

            if Dim.FDatabaseRanks = nil then
            begin
              Dim.FDatabaseRanks := TIntegerArray.Create;
            end;
          end;
      end;

      if FFactTable = nil then
        FFactTable := TFactTable.Create(Dimensions.Count, Summaries.Count)
      else if KeepExistentData = False then FFactTable.Clear;

      FT := FFactTable;

      {$IFNDEF ASPRUNTIME}
      if Options.Editable then
      begin
        if FEditableFields = nil then
          begin
            FEditableFields := TDatasetArray.Create;
            InitEditableFields;
          end
        else if KeepExistentData = False then FEditableFields.Clear;

        for i := 0 to FEditableFields.FieldCount - 1 do
          Keys.Add(DataSet.FieldByName(FEditableFields.GetFieldName(i)));
      end;
      {$ENDIF}
      ProcessedRecords := 0;

      DisableControls;
      try
        First;
        while not EOF do
        begin
          ReadSummaries := True;
          for DimID := 0 to Dimensions.Count - 1 do
          begin
            Dim := TDimension(Dimensions[DimID]);
            if Dim.RangeBased then
              begin
                Dim.FLatestDoubleArrayValue := TField(DimFields[DimID]).AsFloat;
              end
            else if Dim.HasLookup then
              begin 
                v := -1; 
                if Dim.StrID then
                  begin
                    if TField(DimFields[DimID]).IsNull then
                      case Options.FDimMemberIsNull of
                        dnTreatAsZero:
                         begin
                          v := Dim.FStringKeys.IndexOf('');
                          if v < 0 then ErrorKey := '';
                         end;
                        dnCreateEmptyMember:
                          begin
                            v := Dim.FStringKeys.IndexOf(xhEmptyStringIdentifier);
                            if v < 0 then ErrorKey := xhEmptyStringIdentifier;
                            Dim.FEmptyMemberUsed := True;
                          end;
                        dnException: DimMemberIsNullError(Dim.DisplayName);
                      end
                    else
                      begin
                        StrKey := GetWideDisplayText(DimFields[DimID]);
                        v := Dim.FStringKeys.IndexOf(StrKey);
                        if v < 0 then ErrorKey := StrKey;
                      end;
                  end
                else
                  begin
                    if TField(DimFields[DimID]).IsNull then
                      case Options.FDimMemberIsNull of
                        dnTreatAsZero: v := Dim.Items.IndexOf(0);
                        dnCreateEmptyMember:
                          begin
                            v := Dim.Items.IndexOf(xhEmptyIntegerIdentifier);
                            if v < 0 then ErrorKey := xhIntToWideStr(xhEmptyIntegerIdentifier);
                            Dim.FEmptyMemberUsed := True;
                          end;
                        dnException: DimMemberIsNullError(Dim.DisplayName);
                      end
                    else
                      begin
                        IntKey := TField(DimFields[DimID]).AsInteger;
                        v := Dim.Items.IndexOf(IntKey);
                        if v < 0 then ErrorKey := xhIntToWideStr(IntKey);
                      end;
                  end;

                NewMember := False;  
                if v < 0 then
                case Options.LookupHasntTheValue of
                  lvIgnoreSumValue:
                    begin
                      ReadSummaries := False;
                      BREAK;
                    end;
                  lvException:
                    begin
                      LookupHasntTheValueError(Dim.DisplayName, ErrorKey);
                    end;
                  lvAddFactTableID:
                    begin
                      if Dim.StrID then
                        begin
                          i := TWideStringArray(Dim.FAdditionalMembers).IndexOf(StrKey);
                          if i < 0 then i := TWideStringArray(Dim.FAdditionalMembers).Add(StrKey);
                          v := Dim.FStringKeys.Count + i;
                        end
                      else
                        begin
                          i := TIntegerArray(Dim.FAdditionalMembers).IndexOf(IntKey);
                          if i < 0 then i := TIntegerArray(Dim.FAdditionalMembers).Add(IntKey);
                          v := Dim.Items.Count + i;
                        end;
                      NewMember := True;  
                    end;
                end;

                if not NewMember then
                if Dim.IsParent(v) then
                begin
                  ReadSummaries := False;
                  BREAK;
                end;

                Dim.FLatestMember := v;
              end
            else  
              begin
                if Dim.Composite = True then
                  begin
                    CompositeKey := '';
                    ParentIndex := -1;

                    for j := 0 to Dim.FCompositeFields.Count - 1 do
                    begin
                      s := Dim.FCompositeFields[j];
                      {$IFDEF ASPRUNTIME}
                      StrKey := IxField(Dim.FCompositeFields.Pointers[j]).DisplayText;
                      {$ELSE}
                      StrKey := TField(Dim.FCompositeFields.Pointers[j]).DisplayText;
                      {$ENDIF}
                      if CompositeKey = '' then
                        CompositeKey := StrKey
                      else
                        CompositeKey := CompositeKey + xhFieldsDelimiter + StrKey;

                      Index := Dim.FStringKeys.IndexOf(CompositeKey);
                      if Index < 0 then
                      begin
                        Index := Dim.FStringKeys.AddPointer(CompositeKey, pointer(Dim.FStringKeys.Count));
                        cap := '';
                        k := FLookupFields.IndexOf(s);
                        if k >= 0 then
                        begin
                          LookupField := TLookupField(FLookupFields.Pointers[k]);
                          if LookupField.FDimension = nil then
                            begin 
                              k := LookupField.FKeys.IndexOf(StrKey);
                              if k >= 0 then cap := LookupField.FNames[k];
                            end
                          else 
                            if LookupField.FDimension.FCurrentCaptions <> nil then
                            begin
                              if LookupField.FDimension.FStringKeys <> nil then
                                begin
                                  k := LookupField.FDimension.FStringKeys.IndexOf(StrKey);
                                  if k >= 0 then cap := LookupField.FDimension.FCurrentCaptions[k];
                                end
                              else
                                begin
                                  k := LookupField.FDimension.Items.IndexOf(StrToInt(StrKey));
                                  if k >= 0 then cap := LookupField.FDimension.FCurrentCaptions[k];
                                end;
                            end;
                        end;
                        if cap <> '' then
                          Dim.FCurrentCaptions.Add(cap)
                        else 
                          Dim.FCurrentCaptions.Add(StrKey);

                        Dim.FParents.Add(ParentIndex);
                        Dim.FDatabaseRanks.Add(Dim.FDatabaseRanks.Count);
                      end;
                      ParentIndex := integer(Dim.FStringKeys.Pointers[Index]);
                    end;

                    Dim.FLatestMember := ParentIndex;
                  end
                else if Dim.StrID then
                  begin
                    if TField(DimFields[DimID]).IsNull then
                      case Options.FDimMemberIsNull of
                        dnException: DimMemberIsNullError(Dim.DisplayName);
                        dnTreatAsZero, dnCreateEmptyMember: s := GetResStr('xhEmptyDimensionMemberCaption', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhEmptyDimensionMemberCaption);
                        else
                          begin
                            ReadSummaries := false;
                            BREAK;
                          end;
                      end
                    else
                      s := GetWideDisplayText(DimFields[DimID]);
                    Index := Dim.FCurrentCaptions.IndexOf(s);
                    if Index < 0 then
                    begin
                      Index := Dim.FCurrentCaptions.AddPointer(s, pointer(Dim.FCurrentCaptions.Count));
                      Dim.FDatabaseRanks.Add(Dim.FDatabaseRanks.Count);
                    end;

                    Dim.FLatestMember := integer(Dim.FCurrentCaptions.Pointers[Index]);
                  end
                else
                  begin
                    v := -1;
                    if TField(DimFields[DimID]).IsNull then
                      case Options.FDimMemberIsNull of
                        dnException: DimMemberIsNullError(Dim.DisplayName);
                        dnTreatAsZero, dnCreateEmptyMember: v := 0;
                        else
                          begin
                            ReadSummaries := false;
                            BREAK;
                          end;
                      end
                    else
                      v := TField(DimFields[DimID]).AsInteger;

                    IndexArray := TintegerArray(IndexArrays[DimID]);
                    Index := Dim.Items.IndexOf(v);
                    if Index < 0 then
                    begin
                      Index := Dim.Items.Add(v);
                      IndexArray.InsertAt(Index, IndexArray.Count);
                      Dim.FDatabaseRanks.Add(Dim.FDatabaseRanks.Count);
                    end;

                    Dim.FLatestMember := IndexArray[Index];
                  end;
              end;
          end;

          if ReadSummaries then
          begin
            FT.NewRecord;

            for DimID := 0 to Dimensions.Count - 1 do
            begin
              Dim := TDimension(Dimensions[DimID]);
              if Dim.RangeBased then
                begin
                  Index := Dim.FDoubleArray.Add(Dim.FLatestDoubleArrayValue);
                  Dim.FFTIndexes.InsertAt(Index, FT.Count - 1);
                  Dim.FInvertFTIndexes.Add(Index);
                end
              else if Dim.HasLookup then
                begin
                  FT.CurDim[DimID] := Dim.FLatestMember;
                  if Dim.AvailableMembers in [byFactTable, byDBField] then
                    Dim.FUsedMembers.Add(Dim.FLatestMember); 
                end
              else
                begin
                  FT.CurDim[DimID] := Dim.FLatestMember;
                end;
            end;

            {$IFNDEF ASPRUNTIME}
            if Options.Editable and FEditableFields.Active then
            begin
              FEditableFields.Append;
              for i := 0 to FEditableFields.FieldCount - 1 do
              case FEditableFields.GetNormalFieldType(i) of
                db.ftWideString: FEditableFields.AsWideString[i] := GetAsWideString(Keys[i]);
                db.ftInteger: FEditableFields.AsInteger[i] := TField(Keys[i]).AsInteger;
                db.ftCurrency: FEditableFields.AsCurrency[i] := TField(Keys[i]).AsCurrency;
                db.ftFloat: FEditableFields.AsFloat[i] := TField(Keys[i]).AsFloat;
                db.ftDateTime: FEditableFields.AsDateTime[i] := TField(Keys[i]).AsDateTime;
                db.ftBoolean: FEditableFields.AsBoolean[i] := TField(Keys[i]).AsBoolean;
              end;
            end;
            {$ENDIF}

            for SumID := 0 to Summaries.Count - 1 do
            begin
              if TField(SumFields[SumID]).IsNull then CONTINUE;
              vDouble := TField(SumFields[SumID]).AsFloat;
              FT.CurSum[SumID] := vDouble;
            end
          end;

          inc(ProcessedRecords);

          if assigned(FOnReadFactTable) then
          begin
            inc(EventCounter);
            if EventCounter >= EventFrequency then
            begin
              FOnReadFactTable(Self, ProcessedRecords);
              EventCounter := 0;
            end;
          end;
          {$IFNDEF ASPRUNTIME}
          UpdateProgressBar;
          {$ENDIF}
          Next;
        end; { while not EOF do }
      finally
        EnableControls;
      end;

      for DimID := 0 to Dimensions.Count - 1 do
      begin
        Dim := TDimension(Dimensions[DimID]);
        if Dim.RangeBased then
          begin
          end
        else if Dim.HasLookup then
          begin
            if Dim.FAdditionalMembers.Count > 0 then
            begin
              if Dim.StrID then
                begin
                  Dim.FStringKeys.Sorted := False; 
                  for i := 0 to Dim.FAdditionalMembers.Count - 1 do
                  begin
                    StrKey := TWideStringArray(Dim.FAdditionalMembers)[i];
                    v := Dim.FStringKeys.Count;

                    Dim.FStringKeys.InsertAt(v, StrKey);
                    Dim.FCurrentCaptions.InsertAt(v, StrKey);
                    Dim.Items.InsertAt(v, v);

                    for Index := 0 to Dim.FAttributeList.Count - 1 do
                    if Dim.FAttributeList.Pointers[Index] <> Dim.FCurrentCaptions then
                    begin
                      StringArray := TWideStringArray(Dim.FAttributeList.Pointers[Index]);
                      StringArray.InsertAt(v, '');
                    end;
                    Dim.DatabaseRanks.InsertAt(v, Dim.DatabaseRanks.Count);
                    if Dim.Parents <> nil then Dim.Parents.InsertAt(v, -1);
                  end;
                end
              else
                begin
                  Dim.Items.Sorted := False; 
                  for i := 0 to Dim.FAdditionalMembers.Count - 1 do
                  begin
                    IntKey := TIntegerArray(Dim.FAdditionalMembers)[i];
                    v := Dim.Items.Count;

                    Dim.Items.InsertAt(v, IntKey);
                    Dim.FCurrentCaptions.InsertAt(v, xhIntToWideStr(IntKey));

                    for Index := 0 to Dim.FAttributeList.Count - 1 do
                    if Dim.FAttributeList.Pointers[Index] <> Dim.FCurrentCaptions then
                    begin
                      StringArray := TWideStringArray(Dim.FAttributeList.Pointers[Index]);
                      StringArray.InsertAt(v, '');
                    end;
                    Dim.DatabaseRanks.InsertAt(v, Dim.DatabaseRanks.Count);
                    if Dim.Parents <> nil then Dim.Parents.InsertAt(v, -1);
                  end;
                end;

            end;
            FreeAndNil(Dim.FAdditionalMembers); 
            if Dim.AvailableMembers = byDimension then
            begin
              Dim.FUsedMembers := TIntegerArray.Create;
              Dim.FUsedMembers.Sorted := True;
              Dim.FUsedMembers.Duplicates := dupIgnore;
              Dim.FUsedMembers.Count := Dim.Items.Count;
              Dim.FUsedMembers.FillRank;
              if Dim.FEmptyMemberUsed = False then
              begin
                if Dim.FStrID then
                  i := Dim.FStringKeys.IndexOf(xhEmptyStringIdentifier)
                else
                  i := Dim.Items.IndexOf(xhEmptyIntegerIdentifier);

                if i >= 0 then Dim.FUsedMembers.Delete(i);
              end;
            end;
          end
        else
          begin
            if Dim.Composite then
              begin
                FreeAndNil(Dim.FCompositeFields);

                Dim.Items.Count := Dim.FStringKeys.Count;
                Dim.Items.FillRank;

                Dim.FStringKeys.Sorted := False;
                {$IFDEF ASPRUNTIME}
                Dim.FStringKeys.PointerSort;
                {$ELSE}
                Dim.FStringKeys.CustomSort(CompareWideStringPointers, 0);
                {$ENDIF}
                Dim.FHier := True;
              end
            else if Dim.StrID then
              begin
                Dim.Items.Count := Dim.FCurrentCaptions.Count;
                Dim.Items.FillRank;

                Dim.FCurrentCaptions.Sorted := False;
                {$IFDEF ASPRUNTIME}
                Dim.FCurrentCaptions.PointerSort;
                {$ELSE}
                Dim.FCurrentCaptions.CustomSort(CompareWideStringPointers, 0);
                {$ENDIF}
              end
            else
              begin
                Dim.Items.Sorted := False;

                IndexArray := TIntegerArray(IndexArrays[DimID]);
                {$IFDEF ASPRUNTIME}
                System.Array.Sort(IndexArray.List, Dim.Items.List, 0, IndexArray.Count);
                {$ELSE}
                for i := 0 to IndexArray.Count - 2 do
                for j := i + 1 to IndexArray.Count - 1 do
                if IndexArray[i] > IndexArray[j] then
                begin
                  Dim.Items.QuickExchange(i, j);
                  IndexArray.QuickExchange(i, j);
                end;
                {$ENDIF}
              end;
          end;
      end; 
    end; 
  finally
    DimFields.Free; SumFields.Free; IndexArrays.Free; Keys.Free;
  end;

  if assigned(FAfterReadFactTable) then FAfterReadFactTable(Self, ProcessedRecords);
  CalculateRangeBasedDimensions;
end;

procedure TCustomHierCube.RefreshFactTable(KeepExistentData: boolean);
begin
  DoReadFactTable(KeepExistentData);
  NotifyLinkedControls(xeFactTableChanged);
end;

procedure TCustomHierCube.CalculateRangeBasedDimension(DimID: integer);
var
  L, N, i, j, k: integer;
  Dim: TDimension;
  DoubleArray: TDoubleArray;
  FTIndexes: TIntegerArray;
  RangeList: TIntegerArray;
  FT: TFactTable;
  d, d1: double;
  SL: TWideStringArray;
begin
  {$IFDEF ASPRUNTIME}
  CheckFactTablePresence;
  {$ENDIF}
  FT := FFactTable;

  Dim := TDimension(Dimensions[DimID]);
  if not Dim.RangeBased then EXIT;

  DoubleArray := Dim.FDoubleArray;
  FTIndexes := Dim.FFTIndexes;

  N := Dim.RangeMemberCount;
  L := DoubleArray.Count;

  if L = 0 then
  begin
    Dim.FItems.Free;
    Dim.FItems := TIntegerArray.Create;

    Dim.FDatabaseRanks.Free;
    Dim.FDatabaseRanks := TIntegerArray.Create;

    EXIT;
  end;

  if Dim.RangeTransformMethod = tmEqualDensity then
    begin
      d := L / N;   
      d1 := d;      
    end
  else
    begin
      d := (DoubleArray[DoubleArray.Count - 1] - DoubleArray[0]) / N;
      d1 := DoubleArray[0] + d;     
    end;

  RangeList := TIntegerArray.Create;
  try
    k := 0;       
    j := 0;       
    while k < N - 1 do
    begin
      if Dim.RangeTransformMethod = tmEqualDensity then
        i := round(d1)
      else
        DoubleArray.Find(i, d1);
      RangeList.Add(i);
      while j <= i do
      begin
        FT.SetDim(FTIndexes[j], DimID, k);
        inc(j);
      end;
      d1 := d1 + d;
      inc(k);
    end;
    while j <= L - 1 do
    begin
      FT.SetDim(FTIndexes[j], DimID, k);
      inc(j);
    end;

    Dim.FItems.Free;
    Dim.FItems := TIntegerArray.CreateCount(RangeList.Count + 1);
    Dim.FItems.FillRank;

    Dim.FDatabaseRanks.Free;
    Dim.FDatabaseRanks := TIntegerArray.CreateCount(RangeList.Count + 1);
    Dim.FDatabaseRanks.FillRank;

    SL := Dim.FCurrentCaptions;
    SL.Count := RangeList.Count + 1;

    SL[0] := Format(GetResStr('xhRangeBasedDimensionMemberOuter', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhRangeBasedDimensionMemberOuter), [DoubleArray[0], DoubleArray[RangeList[0]]]);
    for i := 1 to RangeList.Count - 1 do
      SL[i] := Format(GetResStr('xhRangeBasedDimensionMemberInner', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhRangeBasedDimensionMemberInner), [DoubleArray[RangeList[i - 1]], DoubleArray[RangeList[i]]]);
    SL[Dim.FCurrentCaptions.Count - 1] :=
      Format(GetResStr('xhRangeBasedDimensionMemberOuter', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhRangeBasedDimensionMemberOuter), [DoubleArray[RangeList[RangeList.Count - 1]], DoubleArray[L - 1]]);
  finally
    RangeList.Free;
  end;
end;

function TCustomHierCube.ChangeRangeBasedDimension(DimID, NewMemberCount: integer; NewTransformMethod: TTransformMethod): boolean;
var
  Dim: TDimension;
begin
  Result := False;
  if not Active then EXIT;
  Dim := TDimension(Dimensions[DimID]);
  if Dim.RangeBased = False then EXIT;
  if Dim.FRangeMemberCount <> NewMemberCount then
  begin
    Dim.FRangeMemberCount := NewMemberCount;
    Result := true;
  end;
  if Dim.RangeTransformMethod <> NewTransformMethod then
  begin
    Dim.FRangeTransformMethod := NewTransformMethod;
    Result := true;
  end;
  if Result = True then
  begin
    CalculateRangeBasedDimension(DimID);
    NotifyLinkedControls(xeFactTableChanged);
  end;
end;

function TCustomHierCube.ChangeRangeBasedDimension(DimID, NewMemberCount: integer): boolean;
var
  Dim: TDimension;
begin
  Result := False;
  if not Active then EXIT;
  Dim := TDimension(Dimensions[DimID]);
  if Dim.RangeBased = False then EXIT;
  if Dim.FRangeMemberCount <> NewMemberCount then
  begin
    Dim.FRangeMemberCount := NewMemberCount;
    Result := true;
  end;
  if Result = True then
  begin
    CalculateRangeBasedDimension(DimID);
    NotifyLinkedControls(xeFactTableChanged);
  end;
end;

function TCustomHierCube.ChangeRangeBasedDimension(DimID: integer; NewTransformMethod: TTransformMethod): boolean;
var
  Dim: TDimension;
begin
  Result := False;
  if not Active then EXIT;
  Dim := TDimension(Dimensions[DimID]);
  if Dim.RangeBased = False then EXIT;
  if Dim.FRangeTransformMethod <> NewTransformMethod then
  begin
    Dim.FRangeTransformMethod := NewTransformMethod;
    Result := true;
  end;
  if Result = True then
  begin
    CalculateRangeBasedDimension(DimID);
    NotifyLinkedControls(xeFactTableChanged);
  end;
end;

function TCustomHierCube.ChangeRangeBasedDimension(const FieldName: WideString; NewMemberCount: integer; NewTransformMethod: TTransformMethod): boolean;
var
  DimID: integer;
begin
  Result := False;
  if not Active then EXIT;
  DimID := Dimensions.FindRangeBasedDimension(FieldName);
  if DimID >= 0 then
    Result := ChangeRangeBasedDimension(DimID, NewMemberCount, NewTransformMethod);
end;

function TCustomHierCube.ChangeRangeBasedDimension(const FieldName: WideString; NewMemberCount: integer): boolean;
var
  DimID: integer;
begin
  Result := False;
  if not Active then EXIT;
  DimID := Dimensions.FindRangeBasedDimension(FieldName);
  if DimID >= 0 then
    Result := ChangeRangeBasedDimension(DimID, NewMemberCount);
end;

function TCustomHierCube.ChangeRangeBasedDimension(const FieldName: WideString; NewTransformMethod: TTransformMethod): boolean;
var
  DimID: integer;
begin
  Result := False;
  if not Active then EXIT;
  DimID := Dimensions.FindRangeBasedDimension(FieldName);
  if DimID >= 0 then
    Result := ChangeRangeBasedDimension(DimID, NewTransformMethod);
end;

procedure TCustomHierCube.FactTableChanged;
begin
  NotifyLinkedControls(xeFactTableChanged);
end;

procedure TGridInfo.HideThisMember(LabelNode: TLabelNode);
begin
  if LabelNode.IsSubTotal then LabelNode := LabelNode.Parent;
  if LabelNode = nil then EXIT;
  FDimensionStates.BeginUpdate;
  LabelNode.DimState.Visible[LabelNode.Value] := False;
  FDimensionStates.EndUpdate;
end;

{$IFDEF ASPRUNTIME}
function TGridInfo.BuildDatasetXY(const SummaryName: string; Fun: TFunction): DataTable;
var
  SumInfo: TSummaryInfo;
  x, y: integer;
  RowLabelNode, ColLabelNode: TLabelNode;
  RowNodesArray, ColNodesArray: System.Array;
  RowCount, ColCount: integer;
  SumIndex: TIntegerArray;
  Data: double;
  r: DataRow;
begin
  Result := nil;
  if not Active then EXIT;

  if (FRowLabelNodes <> nil) and (FRowLabelNodes.Count > 0) then
    begin
      RowNodesArray := FRowLabelNodes.List;
      RowCount := FRowLabelNodes.Count;
    end
  else
    begin
      RowNodesArray := nil;
      RowCount := 1;
    end;

  if (FColLabelNodes <> nil) and (FColLabelNodes.Count > 0) then
    begin
      ColNodesArray := FColLabelNodes.List;
      ColCount := FColLabelNodes.Count;
    end
  else
    begin
      ColNodesArray := nil;
      ColCount := 1;
    end;

  if (RowNodesArray = nil) and (ColNodesArray = nil) then EXIT;
  if RowNodesArray = nil then
  begin
    Result := BuildDatasetX(SummaryName, Fun);
    EXIT;
  end;
  if ColNodesArray = nil then
  begin
    Result := BuildDatasetY(SummaryName, Fun);
    EXIT;
  end;

  SumInfo := FSummarySettings.FindFieldName(SummaryName);
  if SumInfo = nil then
    SumInfo := FSummarySettings.FindDisplayName(SummaryName);
  if SumInfo = nil then EXIT;

  Result := DataTable.Create;
  RowLabelNode := TLabelNode(RowNodesArray[0]);
  ColLabelNode := TLabelNode(ColNodesArray[0]);

  Result.Columns.Add(RowLabelNode.DimState.FieldName, typeof(string));
  Result.Columns.Add(ColLabelNode.DimState.FieldName, typeof(string));
  Result.Columns.Add(SumInfo.FieldName, typeof(double));

  Result.Columns[0].Caption := RowLabelNode.DimState.DisplayName;
  Result.Columns[1].Caption := ColLabelNode.DimState.DisplayName;
  Result.Columns[2].Caption := SumInfo.DisplayName;

  for y := 0 to RowCount - 1 do
  begin
    RowLabelNode := TLabelNode(RowNodesArray[y]);
    if RowLabelNode.IsSubTotal then Continue;

    for x := 0 to ColCount - 1 do
    begin
      ColLabelNode := TLabelNode(ColNodesArray[x]);
      if ColLabelNode.IsSubTotal then Continue;

      SumIndex := RowColNodes2SumIndex(RowLabelNode, ColLabelNode);

      r := Result.NewRow;
      r[0] := RowLabelNode.LabelText;
      r[1] := ColLabelNode.LabelText;

      if SumInfo.GetAggregate(SumIndex, Fun, Data) then
        r[2] := TObject(Data)
      else
        r[2] := DBNull.Value;
      Result.Rows.Add(r);  
    end;
  end;
end;

function TGridInfo.BuildDatasetX(const SummaryName: string; Fun: TFunction): DataTable;
var
  SumInfo: TSummaryInfo;
  x: integer;
  ColLabelNode: TLabelNode;
  ColNodesArray: System.Array;
  ColCount: integer;
  SumIndex: TIntegerArray;
  Data: double;
  r: DataRow;
begin
  Result := nil;
  if not Active then EXIT;

  if (FColLabelNodes <> nil) and (FColLabelNodes.Count > 0) then
    begin
      ColNodesArray := FColLabelNodes.List;
      ColCount := FColLabelNodes.Count;
    end
  else EXIT;

  SumInfo := FSummarySettings.FindFieldName(SummaryName);
  if SumInfo = nil then
    SumInfo := FSummarySettings.FindDisplayName(SummaryName);
  if SumInfo = nil then EXIT;

  Result := DataTable.Create;
  ColLabelNode := TLabelNode(ColNodesArray[0]);

  Result.Columns.Add(ColLabelNode.DimState.FieldName, typeof(string));
  Result.Columns.Add(SumInfo.Sum.FieldName, typeof(double));

  Result.Columns[0].Caption := ColLabelNode.DimState.DisplayName;
  Result.Columns[1].Caption := SumInfo.DisplayName;

  for x := 0 to ColCount - 1 do
  begin
    ColLabelNode := TLabelNode(ColNodesArray[x]);
    if ColLabelNode.IsSubTotal then Continue;

    SumIndex := RowColNodes2SumIndex(nil, ColLabelNode);

    r := Result.NewRow;
    r[0] := ColLabelNode.LabelText;

    if SumInfo.GetAggregate(SumIndex, Fun, Data) then
      r[1] := TObject(Data)
    else
      r[1] := DBNull.Value;
    Result.Rows.Add(r);
  end;
end;

function TGridInfo.BuildDatasetY(const SummaryName: string; Fun: TFunction): DataTable;
var
  SumInfo: TSummaryInfo;
  y: integer;
  FieldDefs: TFieldDefs;
  RowLabelNode: TLabelNode;
  RowNodesArray: System.Array;
  RowCount: integer;
  SumIndex: TIntegerArray;
  Data: double;
  r: DataRow;
begin
  Result := nil;
  if not Active then EXIT;

  if (FRowLabelNodes <> nil) and (FRowLabelNodes.Count > 0) then
    begin
      RowNodesArray := FRowLabelNodes.List;
      RowCount := FRowLabelNodes.Count;
    end
  else EXIT;

  SumInfo := FSummarySettings.FindFieldName(SummaryName);
  if SumInfo = nil then
    SumInfo := FSummarySettings.FindDisplayName(SummaryName);
  if SumInfo = nil then EXIT;

  Result := DataTable.Create;
  RowLabelNode := TLabelNode(RowNodesArray[0]);

  Result.Columns.Add(RowLabelNode.DimState.FieldName, typeof(string));
  Result.Columns.Add(SumInfo.Sum.FieldName, typeof(double));

  Result.Columns[0].Caption := RowLabelNode.DimState.DisplayName;
  Result.Columns[1].Caption := SumInfo.DisplayName;

  for y := 0 to RowCount - 1 do
  begin
    RowLabelNode := TLabelNode(RowNodesArray[y]);
    if RowLabelNode.IsSubTotal then Continue;

    SumIndex := RowColNodes2SumIndex(RowLabelNode, nil);

    r := Result.NewRow;
    r[0] := RowLabelNode.LabelText;

    if SumInfo.GetAggregate(SumIndex, Fun, Data) then
      r[1] := TObject(Data)
    else
      r[1] := DBNull.Value;
    Result.Rows.Add(r);
  end;
end;
{$ELSE}
function TGridInfo.BuildDatasetXY(const SummaryName: WideString; Fun: TFunction): TDataset;
var
  SumInfo: TSummaryInfo;
  x, y: integer;
  FieldDefs: TFieldDefs;
  RowLabelNode, ColLabelNode: TLabelNode;
  RowNodesArray, ColNodesArray: PPntrArray;
  RowCount, ColCount: integer;
  SumIndex: TIntegerArray;
  Data: double;
  DimFieldX, DimFieldY, SumField: TField;
begin
  Result := nil;
  if not Active then EXIT;

  if (FRowLabelNodes <> nil) and (FRowLabelNodes.Count > 0) then
    begin
      RowNodesArray := FRowLabelNodes.ArrayPointer;
      RowCount := FRowLabelNodes.Count;
    end
  else
    begin
      RowNodesArray := nil;
      RowCount := 1;
    end;

  if (FColLabelNodes <> nil) and (FColLabelNodes.Count > 0) then
    begin
      ColNodesArray := FColLabelNodes.ArrayPointer;
      ColCount := FColLabelNodes.Count;
    end
  else
    begin
      ColNodesArray := nil;
      ColCount := 1;
    end;

  if (RowNodesArray = nil) and (ColNodesArray = nil) then EXIT;
  if RowNodesArray = nil then
  begin
    Result := BuildDatasetX(SummaryName, Fun);
    EXIT;
  end;
  if ColNodesArray = nil then
  begin
    Result := BuildDatasetY(SummaryName, Fun);
    EXIT;
  end;

  SumInfo := FSummarySettings.FindFieldName(SummaryName);
  if SumInfo = nil then
    SumInfo := FSummarySettings.FindDisplayName(SummaryName);
  if SumInfo = nil then EXIT;

  Result := TxhMemoDataset.Create(Self);
  FieldDefs := Result.FieldDefs;
  FieldDefs.BeginUpdate;
  try
    FieldDefs.Clear;
    RowLabelNode := RowNodesArray[0];
    ColLabelNode := ColNodesArray[0];
    with FieldDefs.AddFieldDef do
    begin
      DataType := db.ftWideString;
      Name := RowLabelNode.DimState.FieldName;
      Size := 50;
    end;
    with FieldDefs.AddFieldDef do
    begin
      DataType := db.ftWideString;
      Name := ColLabelNode.DimState.FieldName;
      Size := 50;
    end;
    with FieldDefs.AddFieldDef do
    begin
      DataType := db.ftFloat;
      Name := SumInfo.FieldName;
    end;
  finally
    FieldDefs.EndUpdate;
  end;
  TxhMemoDataset(Result).IncCapacity := 1;
  TxhMemoDataset(Result).Capacity := RowCount * ColCount;
  Result.Open;

  DimFieldY := Result.Fields[0];
  DimFieldX := Result.Fields[1];
  SumField := Result.Fields[2];

  DimFieldY.DisplayLabel := RowLabelNode.DimState.DisplayName;
  DimFieldX.DisplayLabel := ColLabelNode.DimState.DisplayName;
  SumField.DisplayLabel := SumInfo.DisplayName;

  for y := 0 to RowCount - 1 do
  begin
    RowLabelNode := RowNodesArray[y];
    if RowLabelNode.IsSubTotal then Continue;

    for x := 0 to ColCount - 1 do
    begin
      ColLabelNode := ColNodesArray[x];
      if ColLabelNode.IsSubTotal then Continue;

      SumIndex := RowColNodes2SumIndex(RowLabelNode, ColLabelNode);

      Result.Append;
      SetAsWideString(DimFieldY, RowLabelNode.LabelText);
      SetAsWideString(DimFieldX, ColLabelNode.LabelText);

      if SumInfo.GetAggregate(SumIndex, Fun, Data) then
        SumField.AsFloat := Data
      else
        SumField.Clear;
      Result.Post;
    end;
  end;
end;

function TGridInfo.BuildDatasetX(const SummaryName: WideString; Fun: TFunction): TDataset;
var
  SumInfo: TSummaryInfo;
  x: integer;
  FieldDefs: TFieldDefs;
  ColLabelNode: TLabelNode;
  ColNodesArray: PPntrArray;
  ColCount: integer;
  SumIndex: TIntegerArray;
  Data: double;
  DimFieldX, SumField: TField;
begin
  Result := nil;
  if not Active then EXIT;

  if (FColLabelNodes <> nil) and (FColLabelNodes.Count > 0) then
    begin
      ColNodesArray := FColLabelNodes.ArrayPointer;
      ColCount := FColLabelNodes.Count;
    end
  else
    begin
      ColNodesArray := nil;
      ColCount := 1;
    end;

  if ColNodesArray = nil then EXIT;

  SumInfo := FSummarySettings.FindFieldName(SummaryName);
  if SumInfo = nil then
    SumInfo := FSummarySettings.FindDisplayName(SummaryName);
  if SumInfo = nil then EXIT;

  Result := TxhMemoDataset.Create(Self);
  FieldDefs := Result.FieldDefs;
  FieldDefs.BeginUpdate;
  try
    FieldDefs.Clear;
    ColLabelNode := ColNodesArray[0];
    with FieldDefs.AddFieldDef do
    begin
      DataType := db.ftWideString;
      Name := ColLabelNode.DimState.FieldName;
      Size := 50;
    end;
    with FieldDefs.AddFieldDef do
    begin
      DataType := db.ftFloat;
      Name := SumInfo.Sum.FieldName;
    end;
  finally
    FieldDefs.EndUpdate;
  end;
  TxhMemoDataset(Result).IncCapacity := 1;
  TxhMemoDataset(Result).Capacity := ColCount;
  Result.Open;

  DimFieldX := Result.Fields[0];
  SumField := Result.Fields[1];

  DimFieldX.DisplayLabel := ColLabelNode.DimState.DisplayName;
  SumField.DisplayLabel := SumInfo.DisplayName;

  for x := 0 to ColCount - 1 do
  begin
    ColLabelNode := ColNodesArray[x];
    if ColLabelNode.IsSubTotal then Continue;

    SumIndex := RowColNodes2SumIndex(nil, ColLabelNode);

    Result.Append;
    SetAsWideString(DimFieldX, ColLabelNode.LabelText);

    if SumInfo.GetAggregate(SumIndex, Fun, Data) then
      SumField.AsFloat := Data
    else
      SumField.Clear;
    Result.Post;
  end;
end;

function TGridInfo.BuildDatasetY(const SummaryName: WideString; Fun: TFunction): TDataset;
var
  SumInfo: TSummaryInfo;
  y: integer;
  FieldDefs: TFieldDefs;
  RowLabelNode: TLabelNode;
  RowNodesArray: PPntrArray;
  RowCount: integer;
  SumIndex: TIntegerArray;
  Data: double;
  DimFieldY, SumField: TField;
begin
  Result := nil;
  if not Active then EXIT;

  if (FRowLabelNodes <> nil) and (FRowLabelNodes.Count > 0) then
    begin
      RowNodesArray := FRowLabelNodes.ArrayPointer;
      RowCount := FRowLabelNodes.Count;
    end
  else
    begin
      RowNodesArray := nil;
      RowCount := 1;
    end;

  if RowNodesArray = nil then EXIT;

  SumInfo := FSummarySettings.FindFieldName(SummaryName);
  if SumInfo = nil then
    SumInfo := FSummarySettings.FindDisplayName(SummaryName);
  if SumInfo = nil then EXIT;

  Result := TxhMemoDataset.Create(Self);
  FieldDefs := Result.FieldDefs;
  FieldDefs.BeginUpdate;
  try
    FieldDefs.Clear;
    RowLabelNode := RowNodesArray[0];
    with FieldDefs.AddFieldDef do
    begin
      DataType := db.ftWideString;
      Name := RowLabelNode.DimState.FieldName;
      Size := 50;
    end;
    with FieldDefs.AddFieldDef do
    begin
      DataType := db.ftFloat;
      Name := SumInfo.Sum.FieldName;
    end;
  finally
    FieldDefs.EndUpdate;
  end;
  TxhMemoDataset(Result).IncCapacity := 1;
  TxhMemoDataset(Result).Capacity := RowCount;
  Result.Open;

  DimFieldY := Result.Fields[0];
  SumField := Result.Fields[1];

  DimFieldY.DisplayLabel := RowLabelNode.DimState.DisplayName;
  SumField.DisplayLabel := SumInfo.DisplayName;

  for y := 0 to RowCount - 1 do
  begin
    RowLabelNode := RowNodesArray[y];
    if RowLabelNode.IsSubTotal then Continue;

    SumIndex := RowColNodes2SumIndex(RowLabelNode, nil);

    Result.Append;
    SetAsWideString(DimFieldY, RowLabelNode.LabelText);

    if SumInfo.GetAggregate(SumIndex, Fun, Data) then
      SumField.AsFloat := Data
    else
      SumField.Clear;
    Result.Post;
  end;
end;
{$ENDIF}

procedure TCustomHierCube.Clear;
begin
  FreeAndNil(FLookupFields);
  FreeAndNil(FDimensions);
  FreeAndNil(FSummaries);
{$IFNDEF ASPRUNTIME}
  FreeAndNil(FEditableFields);
{$ENDIF}
  FreeAndNil(FFactTable);
end;

function TDimSum.IsDimension: boolean;
begin
  Result := (FDimSumType = dsDimension);
end;

function TDimSum.StoreRangeBasedDimension: boolean;
begin
  Result := (DimSumType = dsDimension) and (RangeBased = True); 
end;

function TDimension.IsParent(Index: integer): boolean;
begin
  Result := FHier and (FIsParentFlags <> nil) and (FIsParentFlags[Index] = 1);
end;

function TGridInfo.CalcPercentAlongRow(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
var
  Total: double;
  DataCell: PDataCell;
begin
  with Args do
  begin
    SumIndex.FillWith(SubTotal);
    ScanFromLabelNode(RowLabelNode, SumIndex);
    SumInfo.GetAggregate(SumIndex, Fun, Total);
    DataCell := FunctionData[ColTreeIndex, RowTreeIndex];
    Result := DataCell.NotEmpty;
    if Result then
    begin
      if Total <> 0 then
        Res := (DataCell.Data * 100) / Total
      else
        Res := 0;
    end;
  end;
end;

function TGridInfo.CalcPercentAlongCol(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
var
  Total: double;
  DataCell: PDataCell;
begin
  with Args do
  begin
    SumIndex.FillWith(SubTotal);
    ScanFromLabelNode(ColLabelNode, Args.SumIndex);
    SumInfo.GetAggregate(SumIndex, Fun, Total);
    DataCell := FunctionData[ColTreeIndex, RowTreeIndex];
    Result := DataCell.NotEmpty;
    if Result then
    begin
      if Total <> 0 then
        Res := (DataCell.Data * 100) / Total
      else
        Res := 0;
    end;
  end;
end;

function TGridInfo.CalcRankAlongCol(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
var
  Data: double;
  Rank: integer;
  Node: TLabelNode;
  Nodes: TLabelNodes;
  i: integer;
  DataCell: PDataCell;
begin
  with Args do
  begin
    Result := FunctionData[ColTreeIndex, RowTreeIndex].NotEmpty;
    if Result = False then EXIT;
    Data := FunctionData[ColTreeIndex, RowTreeIndex].Data;
    Rank := 1; Res := 1; 
    if RowLabelNode <> nil then
    begin
      Node := RowLabelNode;
      if Node.IsSubTotal then Node := Node.Parent;
      if Node = nil then EXIT;
      Nodes := Node.LabelNodes;
      for i := 0 to Nodes.Count - 1 do
      begin
        Node := TLabelNode(Nodes[i]);
        if Node.IsSubTotal then Continue;
        DataCell := FunctionData[ColTreeIndex, Node.TreeIndex];
        if DataCell.NotEmpty and (DataCell.Data > Data) then inc(Rank);
      end;
    end;
    Res := Rank;
  end;
end;

function TGridInfo.CalcRankAlongRow(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
var
  Data: double;
  Rank: integer;
  Node: TLabelNode;
  Nodes: TLabelNodes;
  i: integer;
  DataCell: PDataCell;
begin
  with Args do
  begin
    Result := FunctionData[ColTreeIndex, RowTreeIndex].NotEmpty;
    if Result = False then EXIT;
    Data := FunctionData[ColTreeIndex, RowTreeIndex].Data;
    Rank := 1; Res := 1; 
    if ColLabelNode <> nil then
    begin
      Node := ColLabelNode;
      if Node.IsSubTotal then Node := Node.Parent;
      if Node = nil then EXIT;
      Nodes := Node.LabelNodes;
      for i := 0 to Nodes.Count - 1 do
      begin
        Node := TLabelNode(Nodes[i]);
        if Node.IsSubTotal then Continue;
        DataCell := FunctionData[Node.TreeIndex, RowTreeIndex];
        if DataCell.NotEmpty and (DataCell.Data > Data) then inc(Rank);
      end;
    end;
    Res := Rank;
  end;
end;

function TGridInfo.CalcCompareWithPrevAlongCol(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
var
  Node: TLabelNode;
  Nodes: TLabelNodes;
  i: integer;
  PrevCell, DataCell: PDataCell;
begin
  Result := False;
  with Args do
  begin
    DataCell := FunctionData[ColTreeIndex, RowTreeIndex];
    if DataCell.NotEmpty = False then EXIT;
    if RowLabelNode = nil then EXIT;
    Node := RowLabelNode;
    if Node.IsSubTotal then Node := Node.Parent;
    if Node = nil then EXIT;
    Nodes := Node.LabelNodes;
    i := Node.FIndex - 1;
    if i >= 0 then
    begin
      Node := TLabelNode(Nodes[i]);
      if Node.IsSubTotal then EXIT;
      PrevCell := FunctionData[ColTreeIndex, Node.TreeIndex];
      Result := PrevCell.NotEmpty;
      if Result then
        Res := (DataCell.Data - PrevCell.Data); 
    end;
  end;
end;
function TGridInfo.CalcCompareWithPrevAlongRow(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
var
  Node: TLabelNode;
  Nodes: TLabelNodes;
  i: integer;
  PrevCell, DataCell: PDataCell;
begin
  Result := False;
  with Args do
  begin
    DataCell := FunctionData[ColTreeIndex, RowTreeIndex];
    if DataCell.NotEmpty = False then EXIT;
    if ColLabelNode = nil then EXIT;
    Node := ColLabelNode;
    if Node.IsSubTotal then Node := Node.Parent;
    if Node = nil then EXIT;
    Nodes := Node.LabelNodes;
    i := Node.FIndex - 1;
    if i >= 0 then
    begin
      Node := TLabelNode(Nodes[i]);
      if Node.IsSubTotal then EXIT;
      PrevCell := FunctionData[Node.TreeIndex, RowTreeIndex];
      Result := PrevCell.NotEmpty;
      if Result then
        Res := (DataCell.Data - PrevCell.Data); 
    end;
  end;
end;

function TGridInfo.CalcCumulativeSumAlongCol(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
var
  Node: TLabelNode;
  Nodes: TLabelNodes;
  i: integer;
  PrevCell: PDataCell;
  S: double;
  Found: boolean;
begin
  Result := False;
  with Args do
  begin
    if FunctionData[ColTreeIndex, RowTreeIndex].NotEmpty = False then EXIT;
    if RowLabelNode = nil then EXIT;
    Node := RowLabelNode;
    if Node.IsSubTotal then Node := Node.Parent;
    if Node = nil then EXIT;
    Nodes := Node.LabelNodes;
    i := Node.FIndex;
    Found := False;
    S := 0; 
    while i >= 0 do
    begin
      Node := TLabelNode(Nodes[i]);
      if Node.IsSubTotal = False then
      begin
        PrevCell := FunctionData[ColTreeIndex, Node.TreeIndex];
        if PrevCell.NotEmpty then
        begin
          Found := True;
          S := S + PrevCell.Data;
        end;
      end;
      dec(i);
    end;
    if Found then
    begin
      Result := True;
      Res := S;
    end;
  end;
end;

function TGridInfo.CalcCumulativeSumAlongRow(Args: TSubFunctionCalculatorArgs; out Res: Double): boolean;
var
  Node: TLabelNode;
  Nodes: TLabelNodes;
  i: integer;
  PrevCell: PDataCell;
  S: double;
  Found: boolean;
begin
  Result := False;
  with Args do
  begin
    if FunctionData[ColTreeIndex, RowTreeIndex].NotEmpty = False then EXIT;
    if ColLabelNode = nil then EXIT;
    Node := ColLabelNode;
    if Node.IsSubTotal then Node := Node.Parent;
    if Node = nil then EXIT;
    Nodes := Node.LabelNodes;
    i := Node.FIndex;
    Found := False;
    S := 0; 
    while i >= 0 do
    begin
      Node := TLabelNode(Nodes[i]);
      if Node.IsSubTotal = False then
      begin
        PrevCell := FunctionData[Node.TreeIndex, RowTreeIndex];
        if PrevCell.NotEmpty then
        begin
          Found := True;
          S := S + PrevCell.Data;
        end;
      end;
      dec(i);
    end;
    if Found then
    begin
      Result := True;
      Res := S;
    end;
  end;
end;

function TGridInfo.Col2SubLevelNode(ACol: integer): TSubLevelNode; {$IFNDEF ASPRUNTIME} register; {$ENDIF}
{$IFDEF ASPRUNTIME}
begin
  if FVisibleColSubLevelNodes <> nil then Result := TSubLevelNode(FVisibleColSubLevelNodes[ACol]) else Result := nil;
{$ELSE}
asm
        mov     eax, [eax + TGridInfo.FVisibleColSubLevelNodes]
        or      eax, eax
        jnz     @@1
        ret
@@1:
        mov     eax, [eax + TBaseArray.FArrayPointer]
        mov     eax, [eax + edx*4]
{$ENDIF}
end;


procedure TPivotEventArgs.Clear;
begin
  FDimState := nil;
  FDimState2 := nil;
  FAllowOperation := False;
  FOperation := TPivotOperation(0);
  FNewDimIndex := -1;
  FNewDimGroup := dgNone;
  FLabelNode := nil;
  FMemberIndex := -1;
  FGroupIndex := -1;
  FMemberName := '';
end;

procedure TGridInfo.ChangeAggregate(SumCountChanged: boolean);
begin
end;

function TDimSums.FindCompositeDimension(const DisplayName: WideString): TDimSum;
var
  i: integer;
  DimSum: TDimSum;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    DimSum := Items[i];
    if (DimSum.FDimSumType = dsDimension) and (DimSum.FComposite = True) then
    if (WideCompareText(DimSum.FDisplayName, DisplayName) = 0) then
    begin
      Result := DimSum;
      break;
    end;
  end;
end;

{$IFNDEF ASPRUNTIME}
class function TCustomHierCube.ReadUserDataCommonStream(Stream: TStream; Buffer: pointer): boolean;
var
  Tag: word;
begin
  Result := False;
  CheckTag(Stream, tgCommonStream);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgCommonStream_UserData:
        begin
          if Buffer <> nil then
            begin
              ReadBinary(Stream, Buffer^);
              Result := True;
            end
          else
            SkipValue(Stream);
        end;
      tgCommonStream_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

class function TCustomHierCube.ReadUserDataCommonStream(Stream: TStream): string;
var
  Tag: word;
  L: integer;
begin
  Result := '';
  CheckTag(Stream, tgCommonStream);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgCommonStream_UserData:
        begin
          if ReadValueType(Stream) = vtBinary then
            begin
              Read(L, SizeOf(Integer));
              if L > 0 then
              begin
                SetLength(Result, L div SizeOf(Char));
                ReadBuffer(pointer(Result)^, L);
              end;
            end
          else
            InvalidPropError(Stream.Position - SizeOf(TxhValueType));
        end;
      tgCommonStream_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

class function TCustomHierCube.ReadUserDataCommonStreamW(Stream: TStream): WideString;
var
  Tag: word;
  L: integer;
begin
  Result := '';
  CheckTag(Stream, tgCommonStream);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgCommonStream_UserData:
        begin
          if ReadValueType(Stream) = vtBinary then
            begin
              Read(L, SizeOf(Integer));
              if L > 0 then
              begin
                SetLength(Result, L div SizeOf(WideChar));
                ReadBuffer(pointer(Result)^, L);
              end;
            end
          else
            InvalidPropError(Stream.Position - SizeOf(TxhValueType));
        end;
      tgCommonStream_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

class function TCustomHierCube.ReadUserDataCommonStream(Stream: TStream; var P: pointer; var Count: integer): boolean;
var
  Tag: word;
begin
  P := nil;
  Count := 0;
  Result := False;
  CheckTag(Stream, tgCommonStream);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgCommonStream_UserData:
        begin
          if ReadValueType(Stream) = vtBinary then
            begin
              Read(Count, SizeOf(Integer));
              if Count > 0 then
              begin
                GetMem(P, Count);
                ReadBuffer(P^, Count);
                Result := True;
              end;
            end
          else
            InvalidPropError(Stream.Position - SizeOf(TxhValueType));
        end;
      tgCommonStream_EOT: EXIT;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

class function TCustomHierCube.LoadUserDataFromStream(Stream: TStream; Buffer: pointer): boolean;
begin
  Result := LoadUserData(Stream, Buffer);
end;

class function TCustomHierCube.LoadUserData(Stream: TStream): string;
var
  TmpStream: TSmartMemoryStream;
  f: integer;
begin
  f := CheckStreamFormat(Stream);
  if f < 0 then InvalidStreamFormatError;
  if (f and sfCompressFlag) = 0 then
  begin
    Result := ReadUserDataCommonStream(Stream);
    EXIT;
  end;
  TmpStream := TSmartMemoryStream.Create;
  try
    UnCompressStream(Stream, TmpStream);
    TmpStream.Position := 0;
    Result := ReadUserDataCommonStream(TmpStream);
  finally
    TmpStream.Free;
  end;
end;

class function TCustomHierCube.LoadUserDataW(Stream: TStream): WideString;
var
  TmpStream: TSmartMemoryStream;
  f: integer;
begin
  f := CheckStreamFormat(Stream);
  if f < 0 then InvalidStreamFormatError;
  if (f and sfCompressFlag) = 0 then
  begin
    Result := ReadUserDataCommonStreamW(Stream);
    EXIT;
  end;
  TmpStream := TSmartMemoryStream.Create;
  try
    UnCompressStream(Stream, TmpStream);
    TmpStream.Position := 0;
    Result := ReadUserDataCommonStreamW(TmpStream);
  finally
    TmpStream.Free;
  end;
end;

class function TCustomHierCube.LoadUserData(const FileName: WideString): string;
var
  Stream: TWideFileStream;
begin
  Stream := TWideFileStream.Create(FileName, fmOpenRead);
  try
    Result := LoadUserData(Stream);
  finally
    Stream.Free;
  end;
end;

class function TCustomHierCube.LoadUserDataW(const FileName: WideString): WideString;
var
  Stream: TWideFileStream;
begin
  Stream := TWideFileStream.Create(FileName, fmOpenRead);
  try
    Result := LoadUserDataW(Stream);
  finally
    Stream.Free;
  end;
end;

class function TCustomHierCube.LoadUserDataFromFile(const FName: WideString; Buffer: pointer): boolean;
begin
  Result := LoadUserData(FName, Buffer);
end;
{$ENDIF}

procedure TGridInfo.MoveToGroup(LabelNode: TLabelNode; const GroupCaption: WideString);
var
  Index: integer;
begin
  if LabelNode = nil then EXIT;
  Index := LabelNode.DimState.FGroups.FindGroupCaption(GroupCaption);
  MoveToGroup(LabelNode, Index);
end;

procedure TGridInfo.GroupMembersBelow(LabelNode: TLabelNode; const GroupCaption: WideString);
var
  Index: integer;
begin
  if LabelNode = nil then EXIT;
  Index := LabelNode.DimState.FGroups.FindGroupCaption(GroupCaption);
  GroupMembersBelow(LabelNode, Index);
end;

function TGridInfo.GetSortedColumn(out SortType: TValueSortType): integer;
begin
  if FColSubLevelNodes <> nil then
    begin
      Result := FValueSortData.FindVisibleSubLevelNode(FVisibleColSubLevelNodes);
      if Result >= 0 then SortType := FValueSortData.SortType;
    end
  else
    Result := -1;
end;

function TGridInfo.GetSortedColumn(out SortType: TValueSortType; out SubLevelNode: TSubLevelNode): integer;
begin
  Result := GetSortedColumn(SortType);
  if Result >= 0 then SubLevelNode := Col2SubLevelNode(Result);
end;

procedure TGridInfo.SetSortedColumn1(ACol: integer; SortType: TValueSortType);
var
  SumInfoID: integer;
  Fun: TFunction;
  SubFun: TSubFunction;
  ColNode: TLabelNode;
begin
  Col2SumFun(ACol, SumInfoID, Fun, SubFun);
  ColNode := Col2LabelNode(ACol);
  SetSortedColumn4(ColNode, SumInfoID, Fun, SubFun, SortType);
end;

procedure TGridInfo.SetSortedColumn2(SubLevelNode: TSubLevelNode; SortType: TValueSortType);
begin
  SubLevelNode := FindLowestSubLevelNode1(SubLevelNode);
  if SubLevelNode <> nil then
    SetSortedColumn4(SubLevelNode.LabelNode, SubLevelNode.SumInfoID, SubLevelNode.Fun, SubLevelNode.SubFun, SortType);
end;

procedure TGridInfo.SetSortedColumn3(ColNode: TLabelNode; SortType: TValueSortType);
var
  SublevelNode: TSubLevelNode;
begin
  SubLevelNode := FindLowestSubLevelNode2(ColNode);
  if SubLevelNode <> nil then
    SetSortedColumn4(SubLevelNode.LabelNode, SubLevelNode.SumInfoID, SubLevelNode.Fun, SubLevelNode.SubFun, SortType);
end;

procedure TGridInfo.SetSortedColumn4(ColNode: TLabelNode;
  SumInfoID: integer; Fun: TFunction; SubFun: TSubFunction; SortType: TValueSortType);
begin
  BeginChange;
  ValueSortData.SaveLabelNode(ColNode);
  ValueSortData.FSumFieldName := FSummarySettings[SumInfoID].FieldName;
  ValueSortData.FFun := Fun;
  ValueSortData.FSubFun := SubFun;
  ValueSortData.FSortType := SortType;
  EndChange(geRowsSort, 0);
end;

procedure TGridInfo.SetSortedColumn5(ColNode: TLabelNode;
  SumInfoID: integer; Fun: TFunction; SubFun: TSubFunction);
var
  EqualNode: boolean;
begin
  if ColNode <> nil then
    EqualNode := ValueSortData.ThisLabelNode(ColNode)
  else
    EqualNode := (ValueSortData.NodeID.Count = 0);

  BeginChange;
  if not EqualNode or
     not WideSameText(ValueSortData.SummaryFieldName, FSummarySettings[SumInfoID].FieldName) or
     (ValueSortData.Fun <> Fun) or
     (ValueSortData.SubFun <> SubFun) then
    begin
      ValueSortData.SaveLabelNode(ColNode);
      ValueSortData.FSumFieldName := FSummarySettings[SumInfoID].FieldName;
      ValueSortData.FFun := Fun;
      ValueSortData.FSubFun := SubFun;
      ValueSortData.FSortType := soAscending;
    end
  else
    case ValueSortData.SortType of
      soAscending  : ValueSortData.FSortType := soDescending;
      soDescending : ValueSortData.FSortType := soNone;
    else
      ValueSortData.FSortType := soAscending;
    end;
  EndChange(geRowsSort, 0);
end;

procedure TGridInfo.SetSortedColumn6(SubLevelNode: TSubLevelNode);
begin
  SubLevelNode := FindLowestSubLevelNode1(SubLevelNode);
  if SubLevelNode <> nil then
    SetSortedColumn5(SubLevelNode.LabelNode, SubLevelNode.SumInfoID, SubLevelNode.Fun, SubLevelNode.SubFun);
end;

procedure TGridInfo.SetSortedColumn7(ColNode: TLabelNode);
var
  SublevelNode: TSubLevelNode;
begin
  SubLevelNode := FindLowestSubLevelNode2(ColNode);
  if SubLevelNode <> nil then
    SetSortedColumn5(SubLevelNode.LabelNode, SubLevelNode.SumInfoID, SubLevelNode.Fun, SubLevelNode.SubFun);
end;

procedure TGridInfo.SetSortedColumn8(ACol: integer);
var
  SumInfoID: integer;
  Fun: TFunction;
  SubFun: TSubFunction;
  ColNode: TLabelNode;
begin
  Col2SumFun(ACol, SumInfoID, Fun, SubFun);
  ColNode := Col2LabelNode(ACol);
  SetSortedColumn5(ColNode, SumInfoID, Fun, SubFun);
end;

procedure TGridInfo.SetSortedColumn(ACol: integer; SortType: TValueSortType);
begin
  SetSortedColumn1(ACol, SortType);
end;

procedure TGridInfo.SetSortedColumn(SubLevelNode: TSubLevelNode; SortType: TValueSortType);
begin
  SetSortedColumn2(SubLevelNode, SortType);
end;

procedure TGridInfo.SetSortedColumn(ColNode: TLabelNode; SortType: TValueSortType);
begin
  SetSortedColumn3(ColNode, SortType);
end;

procedure TGridInfo.SetSortedColumn(ColNode: TLabelNode;
  SumInfoID: integer; Fun: TFunction; SubFun: TSubFunction; SortType: TValueSortType);
begin
  SetSortedColumn4(ColNode, SumInfoID, Fun, SubFun, SortType);
end;

procedure TGridInfo.SetSortedColumn(ColNode: TLabelNode;
  SumInfoID: integer; Fun: TFunction; SubFun: TSubFunction);
begin
  SetSortedColumn5(ColNode, SumInfoID, Fun, SubFun);
end;

procedure TGridInfo.SetSortedColumn(SubLevelNode: TSubLevelNode);
begin
  SetSortedColumn6(SubLevelNode);
end;

procedure TGridInfo.SetSortedColumn(ColNode: TLabelNode);
begin
  SetSortedColumn7(ColNode);
end;

procedure TGridInfo.SetSortedColumn(ACol: integer);
begin
  SetSortedColumn8(ACol);
end;

function TGridInfo.FindLowestSubLevelNode1(SubLevelNode: TSubLevelNode): TSubLevelNode;
begin
  Result := SubLevelNode;
  if Result <> nil then
  while Result.ChildNodes <> nil do Result := TSubLevelNode(Result.ChildNodes[0]);
end;

function TGridInfo.FindLowestSubLevelNode2(ColNode: TLabelNode): TSubLevelNode;
begin
  Result := nil;
  if ColNode = nil then EXIT;
  if ColNode.SubLevelNodes = nil then EXIT;
  FindLowestSubLevelNode1(TSubLevelNode(ColNode.SubLevelNodes[0]));
end;

function TGridInfo.FindLowestSubLevelNode(SubLevelNode: TSubLevelNode): TSubLevelNode;
begin
   Result := FindLowestSubLevelNode1(SubLevelNode);
end;

function TGridInfo.FindLowestSubLevelNode(ColNode: TLabelNode): TSubLevelNode;
begin
   Result := FindLowestSubLevelNode2(ColNode);
end;

function TDimSums.FindRangeBasedDimension(const DisplayName: WideString): TDimSum;
var
  i: integer;
  DimSum: TDimSum;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    DimSum := Items[i];
    if (DimSum.FDimSumType = dsDimension) and (DimSum.EnableTransformation = True) then
    if (WideCompareText(DimSum.FDisplayName, DisplayName) = 0) then
    begin
      Result := DimSum;
      break;
    end;
  end;
end;

{$IFNDEF ASPRUNTIME}
function TGridInfo.BuildCellDataset(SumIndex: TIntegerArray): TDataSet;
var
  Records: TIntegerArray;
begin
  Result := nil;
  if (SumIndex = nil) then EXIT;
  Records := GetCellAggregateRecords(SumIndex);
  try
    if (Records = nil) or (Records.Count = 0) then EXIT;
    Result := FTRecordsToEditDataset(Records);
  finally
    Records.Free;
  end;
end;

class function TCustomHierCube.LoadUserData(Stream: TStream; Buffer: pointer): boolean;
var
  TmpStream: TSmartMemoryStream;
  f: integer;
begin
  f := CheckStreamFormat(Stream);
  if f < 0 then InvalidStreamFormatError;
  if (f and sfCompressFlag) = 0 then
  begin
    Result := ReadUserDataCommonStream(Stream, Buffer);
    EXIT;
  end;
  TmpStream := TSmartMemoryStream.Create;
  try
    UnCompressStream(Stream, TmpStream);
    TmpStream.Position := 0;
    Result := ReadUserDataCommonStream(TmpStream, Buffer);
  finally
    TmpStream.Free;
  end;
end;

class function TCustomHierCube.LoadUserData(const FileName: WideString; Buffer: pointer): boolean;
var
  Stream: TWideFileStream;
begin
  Stream := TWideFileStream.Create(FileName, fmOpenRead);
  try
    Result := LoadUserData(Stream, Buffer);
  finally
    Stream.Free;
  end;
end;

class function TCustomHierCube.LoadUserData(Stream: TStream; out P: pointer; out Count: integer): boolean;
var
  TmpStream: TSmartMemoryStream;
  f: integer;
begin
  f := CheckStreamFormat(Stream);
  if f < 0 then InvalidStreamFormatError;
  if (f and sfCompressFlag) = 0 then
  begin
    Result := ReadUserDataCommonStream(Stream, P, Count);
    EXIT;
  end;
  TmpStream := TSmartMemoryStream.Create;
  try
    UnCompressStream(Stream, TmpStream);
    TmpStream.Position := 0;
    Result := ReadUserDataCommonStream(TmpStream, P, Count);
  finally
    TmpStream.Free;
  end;
end;
{$ENDIF}


function TGridInfo.HasEmptyGroup(SumIndex: TIntegerArray): boolean;
var
  i, Member: integer;
  M: TDimMember;
begin
  Result := True;
  for i := 0 to SumIndex.Count - 1 do
  begin
    Member := SumIndex[i];
    if Member <> SubTotal then
    begin
      M := TDimMember(TDimensionState(FDimensionStates[FActiveDimIDs[i]]).FAllDimMembers[Member]);
      if (M.IsGroup = True) and (M.ChildMembers = nil) then EXIT;
    end;
  end;
  Result := False;
end;

function TGridInfo.NotEmptyGroupAndVisible(SumIndex: TIntegerArray): boolean;
var
  i, Member: integer;
  M: TDimMember;
begin
  Result := False;
  for i := 0 to SumIndex.Count - 1 do
  begin
    Member := SumIndex[i];
    if Member <> SubTotal then
    begin
      M := TDimMember(TDimensionState(FDimensionStates[FActiveDimIDs[i]]).FAllDimMembers[Member]);
      if (M.Visible = False) or ((M.IsGroup = True) and (M.ChildMembers = nil)) then EXIT;
    end;
  end;
  Result := True;
end;

function TDimSum.StoreAvailableMembers_Field: boolean;
begin
  Result := (FDimSumType = dsDimension) and (AvailableMembers = byDBField);
end;

{$IFNDEF ASPRUNTIME}
function TGridInfo.BuildCellDataset(Row, Col: integer): TDataSet;
var
  Records: TIntegerArray;
begin
  Result := nil;
  if (Row < 0) or (Col < 0) then EXIT;
  Records := GetCellAggregateRecords(Row, Col);
  try
    Result := FTRecordsToEditDataset(Records);
  finally
    Records.Free;
  end;
end;


procedure TOnGetFactTableEditorEventArgs.Clear;
begin
  FFactTableEditor := nil;
  FDataset := nil;
  FreeOnExit := False;
end;
{$ENDIF}


function TSourceFields.AddField(const FieldName, DisplayName: WideString;
  FieldType: TFieldType; FieldKind: TFieldKind; Visible,
  ReadOnly: boolean): Integer;
var
  SourceField: TSourceField;
begin
  SourceField := TSourceField.Create;
  SourceField.FFieldName := FieldName;
  SourceField.FDisplayName := DisplayName;
  SourceField.FFieldType := FieldType;
  SourceField.FFieldKind := FieldKind;
  SourceField.FVisible := Visible;
  SourceField.FReadOnly := ReadOnly;
  Result := Add(SourceField);
end;

function TSourceFields.FindField(AFieldName: WideString; AFieldType: TFieldType): integer;
var
  i: integer;
  F: TSourceField;
begin
  Result := -1;
  for i := 0 to Count - 1 do
  begin
    F := TSourceField(Items[i]);
    if (WideCompareText(F.FieldName, AFieldName) = 0) and (F.FieldType = AFieldType) then
    begin
      Result := i;
      EXIT;
    end;
  end;
end;

procedure TDimSums.GetFieldKind(const FieldName: WideString; out FieldKind: TFieldKind; out FieldType: TFieldType);
var
  i: integer;
  DimSum: TDimSum;
begin
  FieldKind := TFieldKind(-1);
  FieldType := ftUnknown;
  for i := 0 to Count - 1 do
  begin
    DimSum := Items[i];
    if not DimSum.Composite then
    if (WideCompareText(DimSum.FBaseFieldName, FieldName) = 0) then
    begin
      FieldKind := DimSum.FBaseFieldKind;
      FieldType := DimSum.FBaseFieldType;
      EXIT;
    end;
  end;
end;

procedure TDimSums.SetFieldKind(const FieldName: WideString; FieldKind: TFieldKind);
var
  i: integer;
  DimSum: TDimSum;
begin
  for i := 0 to Count - 1 do
  begin
    DimSum := Items[i];
    if not DimSum.Composite then
    if (WideCompareText(DimSum.FBaseFieldName, FieldName) = 0) then DimSum.FBaseFieldKind := FieldKind;
  end;
end;

procedure TCustomHierCube.BuildEditableFieldList(out FieldNames, DisplayNames: TWideStringArray);
var
  Index, i, DimID: integer;
  s: WideString;
  Dim: TDimension;
  DimComponent: TDimComponent;
  Sum: TSummary;
begin
  FieldNames := nil; DisplayNames := nil;
  if not Options.Editable then EXIT;
  FieldNames := TWideStringArray.Create;
  DisplayNames := TWideStringArray.Create;
  if FVarFields <> '' then
  begin
    Index := 1; i := 1;
    s := ExtractWord(FVarFields, Index);
    while s <> '' do
    begin
      if FieldNames.IndexOf(s) < 0 then
      begin
        FieldNames.AddPointer(s, pointer(char(FVarFieldTypes[i])));
        DisplayNames.Add(s);
      end;
      s := ExtractWord(FVarFields, Index);
      inc(i);
    end;
  end;
  for DimID := 0 to FDimensions.Count - 1 do
  begin
    Dim := TDimension(FDimensions[DimID]);
    if Dim.Composite and (Dim.DimComponents <> nil) then
      begin
        for i := 0 to Dim.DimComponents.Count - 1 do
        begin
          DimComponent := TDimComponent(Dim.DimComponents[i]);
          if DimComponent.FieldKind = fkData then
          if FieldNames.IndexOf(DimComponent.FieldName) < 0 then
          begin
            FieldNames.AddPointer(DimComponent.FieldName, pointer(DimComponent.FieldType));
            DisplayNames.Add(DimComponent.FieldName);
          end;
        end;
      end
    else
      begin
        if Dim.FieldKind = fkData then
        if FieldNames.IndexOf(Dim.FieldName) < 0 then
        begin
          FieldNames.AddPointer(Dim.FieldName, pointer(Dim.FieldType));
          DisplayNames.Add(Dim.DisplayName);
        end;
      end;
  end;
  for i := 0 to FSummaries.Count - 1 do
  begin
    Sum := TSummary(FSummaries[i]);
    if Sum.FieldKind = fkData then
    if FieldNames.IndexOf(Sum.FieldName) < 0 then
    begin
      FieldNames.AddPointer(Sum.FieldName, pointer(Sum.FieldType));
      DisplayNames.Add(Sum.DisplayName);
    end;
  end;
end;

{$IFNDEF ASPRUNTIME}
procedure TGridInfo.FactTableEditorOnDeleteRecord(Dataset: TDataset);
var
  FTIndex: integer;
begin
  if FDeletedFTIndexes = nil then
  begin
    FDeletedFTIndexes := TIntegerArray.Create;
    FDeletedFTIndexes.Sorted := True;
    FDeletedFTIndexes.Duplicates := dupIgnore;
  end;
  FTIndex := TxhMemoDataSet(DataSet).Records[TxhMemoDataSet(DataSet).RecordPos].FactTableIndex;
  if FTIndex >= 0 then FDeletedFTIndexes.Add(FTIndex);
end;

procedure TGridInfo.FactTableEditorAfterPost(Dataset: TDataset);
var
  FTIndex: integer;
begin
  if FModifiedFTIndexes = nil then
  begin
    FModifiedFTIndexes := TIntegerArray.Create;
    FModifiedFTIndexes.Sorted := True;
    FModifiedFTIndexes.Duplicates := dupIgnore;
  end;
  FTIndex := TxhMemoDataSet(DataSet).Records[TxhMemoDataSet(DataSet).RecordPos].FactTableIndex;
  if FTIndex >= 0 then FModifiedFTIndexes.Add(FTIndex);
end;


procedure TEditCellEventArgs.Clear;
begin
  FAccept := False;
  FDataset := nil;
end;
{$ENDIF}

class function TCustomHierCube.StreamVersionSupported(Version: integer): boolean;
begin
  Result := (Version >= 400);
end;

{$IFNDEF ASPRUNTIME}
{$ENDIF}

{$IFDEF ASPRUNTIME}
procedure TCustomHierCube.CheckFactTablePresence;
var
  Stream: TMemoryStream;
begin
  if (FFactTable = nil) or (FFactTable.Count = 0) then
  begin
    Stream := TMemoryStream.Create;
    try
      if assigned(FOnNeedFactTable) then FOnNeedFactTable(Self, Stream);
      if Stream.Size > 0 then
      begin
        Stream.Position := 0;
        FFactTable.Free;
        FFactTable := TFactTable.Create(1, 1);
        FFactTable.ReadCompressedStream(Stream);
      end;
    finally
      Stream.Free;
    end;
  end;
  if (FFactTable = nil) or (FFactTable.Count = 0) then
    raise exception.create(GetResStr('xhCantAccessFactTable', xhCantAccessFactTable));
end;

function TGridInfo.GetMD5State: integer;
begin
  Result := BuildGridState.GetHashCode;
end;

function TGridInfo.BuildGridState: string;

  function DimIDsState(DimIDs: TIntegerArray): string;
  var
    i, DimID: integer;
    Tmp: TIntegerArray;
    Names, Body: StringBuilder;
    s: string;
  begin
    Result := '';
    if (DimIDs = nil) or (DimIDs.Count = 0) then EXIT;
    Tmp := TIntegerArray.CreateCount(DimIDs.Count);
    try
      for i := 0 to DimIDs.Count - 1 do Tmp[i] := DimIDs[i];
      Tmp.Sort;

      Names := StringBuilder.Create;
      Body := StringBuilder.Create;
      for i := 0 to Tmp.Count - 1 do
      begin
        DimID := Tmp[i];
        Names.Append(IntToStr(DimID));

        s := TDimensionState(FDimensionStates[DimID]).BuildStateString;

        Body.Append(s);
      end;
      Result := '(' + Names.ToString + ')' + xhFieldsDelimiter + '(' + Body.ToString + ')';
    finally
      Tmp.Free;
    end;
  end;

begin
  Result := DimIDsState(FActiveDimIDs) + DimIDsState(FPageDimIDs);
end;
{$ENDIF}


procedure TGridInfo.ShowAllMembers1(DimState: TDimensionState);
var
  i: integer;
{$IFNDEF ASPRUNTIME}
  AllDimMembersArray: PPntrArray;
{$ENDIF}
begin
  if DimState = nil then EXIT;
{$IFNDEF ASPRUNTIME}
  AllDimMembersArray := DimState.FAllDimMembers.ArrayPointer;
{$ENDIF}

  FDimensionStates.BeginUpdate;
  for i := 0 to DimState.MemberCount - 1 do
{$IFDEF ASPRUNTIME}
    TDimMember(DimState.FAllDimMembers[i]).Visible := True;
{$ELSE}
    TDimMember(AllDimMembersArray[i]).Visible := True;
{$ENDIF}

  if DimState.DimGroup = dgPage then
    DimState.RegisterChange(dctPageFiltered)
  else
    DimState.RegisterChange(dctActiveFiltered);
  FDimensionStates.EndUpdate;
end;

procedure TGridInfo.ShowAllMembers2(const DimensionName: WideString);
var
  DimState: TDimensionState;
begin
  DimState := FDimensionStates.FindDisplayName(DimensionName);
  if DimState = nil then DimState := FDimensionStates.FindFieldName(DimensionName);
  ShowAllMembers1(DimState);
end;

procedure TGridInfo.ShowAllMembers3(LabelNode: TLabelNode);
begin
  if LabelNode.IsSubTotal then LabelNode := LabelNode.Parent;
  if LabelNode = nil then EXIT;
  ShowAllMembers1(LabelNode.DimState);
end;

procedure TGridInfo.ShowAllMembers(DimState: TDimensionState);
begin
  ShowAllMembers1(DimState);
end;

procedure TGridInfo.ShowAllMembers(const DimensionName: WideString);
begin
  ShowAllMembers2(DimensionName);
end;

procedure TGridInfo.ShowAllMembers(LabelNode: TLabelNode);
begin
  ShowAllMembers3(LabelNode);
end;

function TGridInfo.GetBaseLine(LineIndex: longword; HierIndex: longword): integer;
var
  CandLines: TIntegerArray; 
  LineIDs: TInt64Array;
  i, n, ni: integer;
  CandLineIndex: longword;
  CandHierIndex: longword;
  Offsets: TCubeIntegerArray;
begin
  Result := -1;
  CandLines := TIntegerArray.Create;
  try
    LineIDs := FSummaryStates.FLineIDs;
    for i := 0 to LineIDs.Count - 1 do
    begin
{$IFDEF ASPRUNTIME}
      CandLineIndex := LineIDs[i] shr 32;
      CandHierIndex := LineIDs[i] - (Int64(CandLineIndex) shl 32);
{$ELSE}
      asm
        mov     eax, [LineIDs]
        mov     ecx, [i]
        mov     eax, [eax + TInt64Array.FArrayPointer]
        mov     edx, [eax + ecx * TYPE Int64 + $04] 
        mov     eax, [eax + ecx * TYPE Int64]       
        mov     [CandLineIndex], edx
        mov     [CandHierIndex], eax
      end;
{$ENDIF}
      if ((LineIndex and CandLineIndex) = CandLineIndex) and (CandLineIndex <> LineIndex) and
         (HierIndex = CandHierIndex) then CandLines.Add(i);
    end;
    
    if CandLines.Count > 0 then
    begin
      Offsets := TInt64Array(FSummaryStates.FAllOffsets[CandLines[0]]);
      n := Offsets.Count;
      Result := CandLines[0];
      for i := 1 to CandLines.Count - 1 do
      begin
        Offsets := TInt64Array(FSummaryStates.FAllOffsets[CandLines[i]]);
        ni := Offsets.Count;
        if ni < n then
        begin
          Result := CandLines[i];
          n := ni;
        end;
      end;
    end;
  finally
    CandLines.Free;
  end;
end;

function TGridInfo.CalcLine(LineIndex, PackedHierIndex: longword; HierIndex: TIntegerArray): integer;
var
  NeedSums: TPointerArray;
  SummaryArrays: TObjectArray;
  i, j: integer;
  V: Double;
{$IFNDEF ASPRUNTIME}
  VInt: Int64 absolute V;
{$ENDIF}
  Line: integer;
  CalcOffset: CubeInteger;
  SumIndex: TIntegerArray;
{$IFNDEF ASPRUNTIME}
  LineSumIndexArray: PIntArray;
{$ENDIF}
  Totals: TTotals;
  Count: integer;
  LevelConversionArrays: TObjectArray;
  LevelConversionArray: TIntegerArray;
  DimState: TDimensionState;
  Offsets: TCubeIntegerArray;
begin
  if FSummaryStates.FLineIDs.Find(Result, MakeInt64(PackedHierIndex, LineIndex)) then EXIT;
  Result := -1;
  {$IFDEF ASPRUNTIME}
  MD5State := GetMD5State;
  TotalsArray := nil;
  Offsets := nil;
  NeedCalc := True;
  if assigned(FOnNeedLine1) then
  begin
    FLine1EventArgs.Clear;
    FLine1EventArgs.FLineIndex := LineIndex;
    FLine1EventArgs.FHierIndex := PackedHierIndex;
    FLine1EventArgs.FMD5State := MD5State;
    FLine1EventArgs.FStream := TMemoryStream.Create;
    FLine1EventArgs.FNeedFactTotals := (FSummaryStates.FFactOffsets.Count = 0); 
    FOnNeedLine1(Self, FLine1EventArgs);
    if FLine1EventArgs.FStream.Size > 0 then
    begin
      Offsets := TCubeIntegerArray.Create;
      TotalsArray := TObjectArray.CreateCount(FSummaryStates.Count);
      try
        FLine1EventArgs.FStream.Position := 0;
        FLine1EventArgs.FStream.Position := 0;
        Offsets.ReadStream(FLine1EventArgs.FStream);
        for i := 0 to FSummaryStates.Count - 1 do
        begin
          Totals := TTotals.Create(Offsets);
          Totals.FSums.ReadStream(FLine1EventArgs.FStream);
          Totals.FCounts.ReadStream(FLine1EventArgs.FStream);
          TotalsArray[i] := Totals; 
        end;

        if FLine1EventArgs.FResult = 0 then
          begin
            Result := FSummaryStates.FLineIDs.Add(MakeInt64(PackedHierIndex, LineIndex));
            FSummaryStates.FAllOffsets.InsertAt(Result, Offsets);
            Offsets := nil;
            for i := 0 to FSummaryStates.Count - 1 do
            begin
              TSummaryState(FSummaryStates[i]).FAllTotals.InsertAt(Result, TotalsArray[i]);
              TotalsArray[i] := nil;
            end;
            NeedCalc := False;
          end
        else if FLine1EventArgs.FResult = 1 then
          begin
            if not FSummaryStates.FLineIDs.Find(j, MakeInt64(FLine1EventArgs.FHierIndex, FLine1EventArgs.FLineIndex)) then
            begin
              j := FSummaryStates.FLineIDs.Add(MakeInt64(FLine1EventArgs.FHierIndex, FLine1EventArgs.FLineIndex));
              FSummaryStates.FAllOffsets.InsertAt(j, Offsets);
              Offsets := nil;
              for i := 0 to FSummaryStates.Count - 1 do
              begin
                TSummaryState(FSummaryStates[i]).FAllTotals.InsertAt(j, TotalsArray[i]);
                TotalsArray[i] := nil;
              end;
            end;
          end
        else if FLine1EventArgs.FResult = 2 then
          begin
            if FSummaryStates.FFactOffsets.Count = 0 then
            begin
              FSummaryStates.FFactOffsets.Free;
              FSummaryStates.FFactOffsets := Offsets;
              Offsets := nil;
              for i := 0 to FSummaryStates.Count - 1 do
              begin
                SumState := TSummaryState(FSummaryStates[i]);
                SumState.FFactTotals.Free;
                SumState.FFactTotals := TTotals(TotalsArray[i]);
                TotalsArray[i] := nil;
              end;
            end;
          end;
      finally
        FreeAndNil(TotalsArray);
        FreeAndnIl(Offsets);
      end;
    end;
  end;
  if NeedCalc = False then EXIT;
  {$ENDIF}

  if FSummaryStates.Count = 0 then EXIT;
  NeedSums := TPointerArray.CreateCount(FSummaryStates.Count); 
  SummaryArrays := TObjectArray.CreateCount(FSummaryStates.Count); 
  try
    for i := 0 to NeedSums.Count - 1 do
    begin
      NeedSums[i] := FSummaryStates[i];
      SummaryArrays[i] := TSummaryArray.Create;
    end;
    
    Line := GetBaseLine(LineIndex, PackedHierIndex); 
    
    if (Line < 0) and (FSummaryStates.FFactOffsets.Count = 0) then
      InitFactTotals;

    LevelConversionArrays := TObjectArray.CreateCount(FActiveDimIDs.Count);
    try
      for i := 0 to LevelConversionArrays.Count - 1 do
      begin
        DimState := TDimensionState(FDimensionStates[FActiveDimIDs[i]]);
        if (DimState.FLevelsCount > 1) and ((LineIndex and (1 shl i)) = 0) then
          LevelConversionArrays[i] := DimState.BuildLevelConversionArray(HierIndex[i]);
      end;

      if Line < 0 then
        Offsets := FSummaryStates.FFactOffsets
      else
        Offsets := TInt64Array(FSummaryStates.FAllOffsets[Line]);

      for i := 0 to Offsets.Count - 1 do
      begin
        CalcOffset := Offsets[i];
        if not CalcOffset2SumIndexVisible(CalcOffset, SumIndex) then Continue;

{$IFDEF ASPRUNTIME}
        for j := 0 to SumIndex.Count - 1 do
        begin
          LevelConversionArray := TIntegerArray(LevelConversionArrays[j]);
          if (LineIndex and (1 shl j)) <> 0 then
            FIntegerArray5[j] := SubTotal
          else
            if (LevelConversionArray = nil) or (SumIndex[j] = SubTotal) then
              FIntegerArray5[j] := SumIndex[j]
            else
              FIntegerArray5[j] := LevelConversionArray[SumIndex[j]];
        end;
{$ELSE}
        LineSumIndexArray := FIntegerArray5.ArrayPointer;
        for j := 0 to SumIndex.Count - 1 do
        begin
          LevelConversionArray := LevelConversionArrays[j];
          if (LineIndex and (1 shl j)) <> 0 then
            LineSumIndexArray[j] := SubTotal
          else
            if (LevelConversionArray = nil) or (SumIndex[j] = SubTotal) then
              LineSumIndexArray[j] := SumIndex[j]
            else
              LineSumIndexArray[j] := LevelConversionArray[SumIndex[j]];
        end;
{$ENDIF}
        CalcOffset := SumIndex2CalcOffset(FIntegerArray5);

        for j := 0 to NeedSums.Count - 1 do
        begin
          if Line < 0 then
            Totals := TSummaryState(NeedSums[j]).FFactTotals
          else
            Totals := TTotals(TSummaryState(NeedSums[j]).FAllTotals[Line]);

          if Totals <> nil then
          begin
            V := Totals.Sums[i];
{$IFNDEF ASPRUNTIME}
            if VInt = NAN then CONTINUE;
{$ENDIF}
            Count := Totals.Counts[i];
            TSummaryArray(SummaryArrays[j]).Merge(CalcOffset, V, Count);
          end;
        end;
      end;

    finally
      LevelConversionArrays.Free;
    end;

    Offsets := TCubeIntegerArray.Create;
    Offsets.Sorted := True;
    Offsets.Duplicates := dupIgnore;
    Result := FSummaryStates.FLineIDs.Add(MakeInt64(PackedHierIndex, LineIndex));
    FSummaryStates.FAllOffsets.InsertAt(Result, Offsets);

    for i := 0 to NeedSums.Count - 1 do
    begin
      Totals := TTotals(TSummaryArray(SummaryArrays[i]).ConvertToTotals(Offsets));
      TSummaryState(NeedSums[i]).FAllTotals.InsertAt(Result, Totals);
    end;

  finally
    SummaryArrays.Free;
    NeedSums.Free;
  end;
end;

{$IFDEF ASPRUNTIME}
function TGridInfo.SumIndex2HierIndex(SumIndex: TIntegerArray): TIntegerArray;
var
  i: integer;
  DimState: TDimensionState;
begin
  Result := FIntegerArray10;
  for i := 0 to SumIndex.Count - 1 do
  if SumIndex[i] = SubTotal then
    Result[i] := SubTotal
  else
    begin
      DimState := TDimensionState(fDimensionStates[FActiveDimIDs[i]]);
      Result[i] := DimState.FLevels[SumIndex[i]];
    end;
end;
{$ELSE}
function TGridInfo.SumIndex2HierIndex(SumIndex: TIntegerArray): TIntegerArray;
var
  i: integer;
  DimState: TDimensionState;
  ResultArray: PIntArray;
  SumIndexArray: PIntArray;
  FActiveDimIDsArray: PIntArray;
  FDimensionStatesArray: PPntrArray;
begin
  Result := FIntegerArray10;
  SumIndexArray := SumIndex.ArrayPointer;
  ResultArray := Result.ArrayPointer;
  FActiveDimIDsArray := FActiveDimIDs.ArrayPointer;
  FDimensionStatesArray := fDimensionStates.ArrayPointer;
  for i := 0 to SumIndex.Count - 1 do
  if SumIndexArray[i] = SubTotal then
    ResultArray[i] := SubTotal
  else
    begin
      DimState := FDimensionStatesArray[FActiveDimIDsArray[i]];
      ResultArray[i] := DimState.FLevels[SumIndexArray[i]];
    end;
end;
{$ENDIF}

{$IFDEF ASPRUNTIME}
function TGridInfo.CodeHierIndex(HierIndex: TIntegerArray): longword;
var
  i: integer;
  DimState: TDimensionState;
begin
  Result := 0;
  for i := 0 to HierIndex.Count - 1 do
  begin
    DimState := TDimensionState(FDimensionStates[FActiveDimIDs[i]]);
    if HierIndex[i] = SubTotal then
      Result := Result + DimState.FHierRange * 1
    else
      Result := Result + (DimState.FHierRange * longword(HierIndex[i]))
  end;
end;
{$ELSE}
function TGridInfo.CodeHierIndex(HierIndex: TIntegerArray): longword;
var
  i: integer;
  DimState: TDimensionState;
  FActiveDimIDsArray: PIntArray;
  FDimensionStatesArray: PPntrArray;
begin
  Result := 0;
  FActiveDimIDsArray := FActiveDimIDs.ArrayPointer;
  FDimensionStatesArray := FDimensionStates.ArrayPointer;
  for i := 0 to HierIndex.Count - 1 do
  begin
    DimState := FDimensionStatesArray[FActiveDimIDsArray[i]];
    if HierIndex[i] = SubTotal then
      Result := Result + DimState.FHierRange * 1
    else
      Result := Result + (DimState.FHierRange * longword(HierIndex[i]))
  end;
end;
{$ENDIF}

{$IFNDEF ASPRUNTIME}
destructor TSummary.Destroy;
begin
  FSortedFacts.Free;
  inherited;
end;
{$ENDIF}

procedure TGridInfo.CalcLine3(SumState: TSummaryState; LineIndex: longword; PackedHierIndex: longword;
  HierIndex: TIntegerArray; ProcessedLine: TTotals; NeedMedian: boolean);
var
  Visible: boolean;
  i, j, k: integer;
  CalcOffset: CubeInteger;
  SumIndex: TIntegerArray;
  LevelConversionArrays: TObjectArray;
  LevelConversionArray: TIntegerArray;
  DimState: TDimensionState;

  CalcArray: TPointerArray;
  FactTable: TFactTable;
  FactIndexConvertor: TIntegerArray;
  CustomCount: integer;
  DimID: integer;
  ProcessedOffsets: TCubeIntegerArray;
  SumID: integer;
{$IFDEF ASPRUNTIME}
  TT: TObject;
{$ENDIF}
begin
  {$IFDEF ASPRUNTIME}
  NeedCalc := True;
  if assigned(FOnNeedLine2) then
  begin
    FLine2EventArgs.Clear;
    FLine2EventArgs.FLineIndex := LineIndex;
    FLine2EventArgs.FHierIndex := PackedHierIndex;
    FLine2EventArgs.FMD5State := GetMD5State;
    FLine2EventArgs.FSumID := SumState.SumID;
    FLine2EventArgs.FMedian := NeedMedian;
    FLine2EventArgs.FStream := TMemoryStream.Create;
    try
      FOnNeedLine2(Self, FLine2EventArgs);
      if FLine2EventArgs.FStream.Size > 0 then
      begin
        FLine2EventArgs.FStream.Position := 0;
        ProcessedLine.fFunctions.Free;
{$IFDEF ASPRUNTIME}
        ProcessedLine.fFunctions := TDoubleFunctionsArray.Create(sizeof(TFunctionValues), typeof(TFunctionValues));
{$ELSE}
        ProcessedLine.fFunctions := TRecordArray.Create(4);
{$ENDIF}
        ProcessedLine.fFunctions.ReadCompressedStream(FLine2EventArgs.FStream);
        ProcessedLine.fMedianCalc := FLine2EventArgs.FMedian;
        NeedCalc := False;
      end;
    finally
      FreeAndNil(FLine2EventArgs.FStream); 
    end;
  end;
  if NeedCalc = False then EXIT;
  {$ENDIF}

  SumID := SumState.SumID;
  CalcArray := TPointerArray.CreateCount(ProcessedLine.MemberCount);
  LevelConversionArrays := TObjectArray.CreateCount(FActiveDimIDs.Count);
  ProcessedOffsets := ProcessedLine.FOffsets;

  CustomCount := fFunctionDefs.Count - Ord(stMedian) - 1;
  if not Assigned(FOnCalcAggregateFunction) then CustomCount := 0;
  for i := 0 to ProcessedLine.MemberCount - 1 do
    CalcArray[i] := TDoTwoPassHelper.Create(ProcessedLine.Counts[i],
      ProcessedLine.Sums[i]/ProcessedLine.Counts[i], FOnCalcAggregateFunction,
      CustomCount, {$IFDEF ASPRUNTIME}FCube{$ELSE}FGrid{$ENDIF});

{$IFDEF ASPRUNTIME}
   ProcessedLine.Functions := TDoubleFunctionsArray.CreateCount(ProcessedLine.MemberCount, SizeOf(TFunctionValues), TypeOf(TFunctionValues));
{$ELSE}
   ProcessedLine.Functions := TRecordArray.CreateCount(ProcessedLine.MemberCount, SizeOf(TFunctionValues));
{$ENDIF}

   SumIndex := FIntegerArray4;
   for i := 0 to LevelConversionArrays.Count - 1 do
    begin
     DimState := TDimensionState(FDimensionStates[FActiveDimIDs[i]]);
     if (DimState.FLevelsCount > 1) and (HierIndex[i] >= 0) then
       LevelConversionArrays[i] := DimState.BuildLevelConversionArray(HierIndex[i]);
    end;

  {$IFDEF ASPRUNTIME}
  FCube.CheckFactTablePresence;
  {$ENDIF}
  FactTable := FCube.FFactTable;

   if NeedMedian
    then begin
     FactIndexConvertor := SumState.fSum.FSortedFacts;
     for i := 0 to FactIndexConvertor.Count - 1 do
      begin
       FactTable.CurIndex := FactIndexConvertor[i];
       Visible := True;
       for j := 0 to PageDimIDs.Count - 1 do
        begin
         DimID := PageDimIDs[j];
         DimState := TDimensionState(fDimensionStates[DimID]);
         if not DimState.Visible[DimState.FIndexConversion[FactTable.CurDim[DimID]]] then
          begin
           Visible := False;
           FactTable.Next;
           Break;
          end;
        end;
       if not Visible then Continue;

       for j := 0 to ActiveDimIDs.Count - 1 do
        begin
         DimID := ActiveDimIDs[j];
         DimState := TDimensionState(fDimensionStates[DimID]);
         k := DimState.FIndexConversion[FactTable.CurDim[DimID]];
         if not DimState.Visible[k] then
          begin
           Visible := False;
           FactTable.Next;
           Break;
          end;
         SumIndex[j] := k;
        end;
       if not Visible then Continue;

       for j := 0 to SumIndex.Count - 1 do
        begin
         LevelConversionArray := TIntegerArray(LevelConversionArrays[j]);
         if (LineIndex and (1 shl j)) <> 0 then
           SumIndex[j] := SubTotal
          else if LevelConversionArray <> nil
           then SumIndex[j] := LevelConversionArray[SumIndex[j]];
        end;
       CalcOffset := SumIndex2CalcOffset(SumIndex);
       if ProcessedOffsets.Find(k, CalcOffset) then
         TDoTwoPassHelper(CalcArray[k]).Add(factTable.CurSum[SumID]);
      end;
     ProcessedLine.fMedianCalc := True;
    end else begin
     FactTable.First;
     while not FactTable.EoF do
      begin
       Visible := True;
       for i := 0 to PageDimIDs.Count - 1 do
        begin
         DimID := PageDimIDs[i];
         DimState := TDimensionState(fDimensionStates[DimID]);
         if not DimState.Visible[DimState.FIndexConversion[FactTable.CurDim[DimID]]] then
          begin
           Visible := False;
           FactTable.Next;
           Break;
          end;
        end;
       if not Visible then Continue;

       for i := 0 to ActiveDimIDs.Count - 1 do
        begin
         DimID := ActiveDimIDs[i];
         DimState := TDimensionState(fDimensionStates[DimID]);
         j := DimState.FIndexConversion[FactTable.CurDim[DimID]];
         if not DimState.Visible[j] then
          begin
           Visible := False;
           FactTable.Next;
           Break;
          end;
         SumIndex[i] := j;
        end;
       if not Visible then Continue;

       for j := 0 to SumIndex.Count - 1 do
        begin
         LevelConversionArray := TIntegerArray(LevelConversionArrays[j]);
         if (LineIndex and (1 shl j)) <> 0 then
           SumIndex[j] := SubTotal
          else if LevelConversionArray <> nil
           then SumIndex[j] := LevelConversionArray[SumIndex[j]];
        end;
       CalcOffset := SumIndex2CalcOffset(SumIndex);
       if ProcessedOffsets.Find(k, CalcOffset) then
         TDoTwoPassHelper(CalcArray[k]).Add(factTable.CurSum[SumID]);
       FactTable.Next;  
      end;
     ProcessedLine.fMedianCalc := False;
    end;
  for i := 0 to CalcArray.Count - 1 do
   begin
{$IFDEF ASPRUNTIME}
    TDoTwoPassHelper(CalcArray[i]).WriteResultValues(TT);
    ProcessedLine.Functions[i] := TFunctionValues(TT);
{$ELSE}
    TDoTwoPassHelper(CalcArray[i]).WriteResultValues(ProcessedLine.Functions[i]);
{$ENDIF}
    TDoTwoPassHelper(CalcArray[i]).Free;
   end;
  LevelConversionArrays.Free;
  CalcArray.Free;

  {$IFDEF ASPRUNTIME}
  if assigned(FOnNewLine2) then
  begin
    FLine2EventArgs.Clear;
    FLine2EventArgs.FLineIndex := LineIndex;
    FLine2EventArgs.FHierIndex := PackedHierIndex;
    FLine2EventArgs.FMD5State := GetMD5State;
    FLine2EventArgs.FStream := TMemoryStream.Create;
    FLine2EventArgs.FSumID := SumState.SumID;
    FLine2EventArgs.FMedian := NeedMedian;
    try
      ProcessedLine.fFunctions.WriteCompressedStream(FLine2EventArgs.FStream);
      FLine2EventArgs.FStream.Position := 0;
      FOnNewLine2(Self, FLine2EventArgs);
    finally
      FreeAndNil(FLine2EventArgs.FStream); 
    end;
  end;
  {$ENDIF}
end;


procedure TGridInfo.InitFactTotals;
var
  DimID, i, j: integer;
  SumArrays: TObjectArray;
  SumArray: TSummaryArray;
  DrilledDimIDs: TIntegerArray;
  FT: TFactTable;
  SumIndex: TIntegerArray;
  Visible: boolean;
  CalcOffset: CubeInteger;
  vDouble: Double;
  SumState: TSummaryState;
  DimState: TDimensionState;
{$IFDEF ASPRUNTIME}
  Totals: TTotals;
{$ENDIF}  
begin

  SumArrays := TObjectArray.CreateCount(FSummaryStates.Count);
  for i := 0 to FSummaryStates.Count - 1 do
  begin
    SumArrays[i] := TSummaryArray.Create;
  end;

  DrilledDimIDs := TIntegerArray.Create;
  for i := 0 to FPageDimIDs.Count - 1 do
  begin
    DimID := FPageDimIDs[i];
    if TDimensionState(FDimensionStates[DimID]).Filtered then DrilledDimIDs.Add(DimID);
  end;

  {$IFDEF ASPRUNTIME}
  FCube.CheckFactTablePresence;
  {$ENDIF}
  FT := FCube.FFactTable;
  SumIndex := CreateSumIndex;
  try
    FT.First;
    while not FT.EOF do
    begin
      asm
        push    esi
        push    edi
        mov     esi, FT
        mov     eax, Self

        mov     edx, SumIndex
        push    dword ptr [edx + TBaseArray.FArrayPointer]      

        mov     edx, [eax + TGridInfo.FDimensionStates]
        push    dword ptr [edx + TBaseArray.FArrayPointer]      

        mov     edx, [eax + TGridInfo.FActiveDimIDs]
        push    dword ptr [edx + TBaseArray.FArrayPointer]      

        mov     ecx, [edx + TBaseArray.FCount]
        jecxz   @@1
        dec     ecx

      @@loop:
        mov     edx, [esp]                      
        mov     edi, [edx + ecx * TYPE Integer] 

        mov     eax, [esi + TFactTable.FCurRecord]
        mov     eax, [eax + edi * TYPE MemberInt] 
        mov     edx, [esp+4]                    
        mov     edx, [edx + edi * TYPE Pointer] 
        mov     edx, [edx + TDimensionState.FIndexConversion]
        mov     edx, [edx + TBaseArray.FArrayPointer]
        mov     eax, [edx + eax * TYPE Integer] 
        mov     edx, [esp+8]                    
        mov     [edx + ecx * TYPE Integer], eax 
        dec     ecx             
        jns     @@loop

      @@1:
        add     esp, 4*3
        pop     edi
        pop     esi
      end;
      if IsLeaf(SumIndex) then
      begin
        Visible := True;
        asm
                push    esi
                push    edi
                mov     esi, FT
                mov     eax, Self

                mov     edx, [eax + TGridInfo.FDimensionStates]
                push    dword ptr [edx + TBaseArray.FArrayPointer]      

                mov     edx, [DrilledDimIDs]
                push    dword ptr [edx + TBaseArray.FArrayPointer]      

                mov     ecx, [edx + TBaseArray.FCount]
                jecxz   @@1
                dec     ecx

              @@loop:
                mov     edx, [esp]                      
                mov     edi, [edx + ecx * TYPE Integer] 

                mov     eax, [esi + TFactTable.FCurRecord]
                mov     eax, [eax + edi * TYPE MemberInt]       
                mov     edx, [esp+4]                    
                mov     edx, [edx + edi * TYPE Pointer] 
                push    edx
                mov     edx, [edx + TDimensionState.FIndexConversion]
                mov     edx, [edx + TBaseArray.FArrayPointer]
                mov     eax, [edx + eax * TYPE Integer] 
                pop     edx

                mov     edx, [edx + TDimensionState.FAllDimMembers]
                mov     edx, [edx + TBaseArray.FArrayPointer]
                mov     edx, [edx + eax * TYPE pointer]
                mov     al, [edx + TDimMember.FVisible]
                mov     Visible, al

                or      al, al
                jz      @@1

                dec     ecx             
                jns     @@loop

              @@1:
                add     esp, 4*2
                pop     edi
                pop     esi
        end;
        if Visible then
        begin
          CalcOffset := SumIndex2CalcOffset(SumIndex);
          for i := 0 to SumArrays.Count - 1 do
          begin
            SumArray := TSummaryArray(SumArrays[i]);
            vDouble := FT.CurSum[i];
            SumArray.Merge(CalcOffset, vDouble, 1);
          end;
        end;
      end;
      FT.Next;
    end;
    for i := 0 to FSummaryStates.Count - 1 do
    begin
      SumState := TSummaryState(FSummaryStates[i]);
      SumArray := TSummaryArray(SumArrays[i]);
      if SumArray.Count > 0 then
      begin
        FreeAndNil(SumState.FFactTotals);
        SumState.FFactTotals := TTotals(SumArray.ConvertToTotals(FSummaryStates.FFactOffsets));
      end;
    end;
    {$IFDEF ASPRUNTIME}
    if assigned(FOnNewLine1) then
    begin
      FLine1EventArgs.FStream := TMemoryStream.Create;
      try
        FSummaryStates.FFactOffsets.WriteStream(FLine1EventArgs.FStream);
        for i := 0 to FSummaryStates.Count - 1 do
        begin
          Totals := TSummaryState(FSummaryStates[i]).FFactTotals;
          Totals.FSums.WriteStream(FLine1EventArgs.FStream);
          Totals.FCounts.WriteStream(FLine1EventArgs.FStream);
        end;
        FLine1EventArgs.FLineIndex := 0;
        FLine1EventArgs.FHierIndex := 0;
        FLine1EventArgs.FMD5State := GetMD5State;
        FLine1EventArgs.FCount := FSummaryStates.FFactOffsets.Count;
        FLine1EventArgs.FStream.Position := 0; 
        FOnNewLine1(Self, FLine1EventArgs);
      finally
        FLine1EventArgs.FStream.Free;
      end;
    end;
    {$ENDIF}
  finally
    SumIndex.Free;
    DrilledDimIDs.Free;
    SumArrays.Free;
  end;
  for i := 0 to FSummaryStates.Count - 1 do TSummaryState(FSummaryStates[i]).FLoaded := True;
end;

function TGridInfo.BuildSummarySortedArray(SumID: integer): TIntegerArray;
begin
  {$IFDEF ASPRUNTIME}
  Result := nil;
  if assigned(FOnNeedSortedSummary) then
  begin
    FSortedSummaryEventArgs.Clear;
    FSortedSummaryEventArgs.FSumID := SumID;
    FSortedSummaryEventArgs.FStream := TMemoryStream.Create;
    try
      FOnNeedSortedSummary(Self, FSortedSummaryEventArgs);
      if FSortedSummaryEventArgs.FStream.Size > 0 then
      begin
        Result := TIntegerArray.Create;
        FSortedSummaryEventArgs.FStream.Position := 0;
        Result.ReadCompressedStream(FSortedSummaryEventArgs.FStream)
      end;
    finally
      FreeAndNil(FSortedSummaryEventArgs.FStream);
    end;
  end;
  if Result <> nil then EXIT;
  FCube.CheckFactTablePresence;
  {$ENDIF}
  Result := FCube.FFactTable.BuildSummarySortedArray(SumID);
end;

{$IFNDEF ASPRUNTIME}
function TGridInfo.FTRecordsToViewDataset(ARecords: TIntegerArray): TDataset;
var
  FieldDefs: TFieldDefs;
  DimState: TDimensionState;
  SumInfo: TSummaryInfo;
  Dim: TDimension;
  DimID, i, j, Index, FactTableIndex: integer;
  WhatArray: TIntegerArray;
  What: integer;
  Field: TField;

  function AddField(const FieldName: AnsiString): TFieldDef;
  var
    suffix: integer;
  begin
    suffix := 0;
    if FieldDefs.IndexOf(FieldName) >= 0 then
      begin
        inc(suffix);
        while FieldDefs.IndexOf(FieldName + IntToStr(suffix)) >= 0 do inc(suffix);
        Result := FieldDefs.AddFieldDef;
        Result.Name := FieldName + IntToStr(suffix);
      end
    else
      begin
        Result := FieldDefs.AddFieldDef;
        Result.Name := FieldName;
      end;
  end;

const
  bitMask = $80000000;
  
begin
  Result := nil;
  if (ARecords = nil) or (ARecords.Count = 0) then EXIT;
  Result := TxhMemoDataset.Create(Self);
  WhatArray := TIntegerArray.Create; 
  try
    FieldDefs := Result.FieldDefs;
    FieldDefs.BeginUpdate;
    try
      FieldDefs.Clear;
      for DimID := 0 to FDimensionStates.Count - 1 do
      begin
        DimState := FDimensionStates[DimID];
        Dim := DimState.Dim;
        if Dim.Composite = False then
        begin
          if Dim.RangeBased then
            with AddField(Dim.FieldName) do
            begin
              DataType := db.ftFloat;
              WhatArray.Add(DimID);
            end
          else
            with AddField(Dim.FieldName) do
            begin
              DataType := db.ftWideString;
              Size := FDatasetStringSize; 
              WhatArray.Add(DimID);
            end;
        end;
      end;

      for i := 0 to FSummarySettings.Count - 1 do
      begin
        SumInfo := FSummarySettings[i];
        if SumInfo.Calculated then Continue;
        with AddField(SumInfo.FieldName) do
        begin
          DataType := db.ftFloat;
          WhatArray.Add(SumInfo.SumID or bitMask);
        end
      end
    finally
      FieldDefs.EndUpdate;
    end;
    TxhMemoDataset(Result).IncCapacity := 1;
    TxhMemoDataset(Result).Capacity := ARecords.Count;
    Result.Open;

    for i := 0 to WhatArray.Count - 1 do
    begin
      What := WhatArray[i];
      DimID := What and not bitMask;
      if (What and bitMask) = 0 then
        Result.Fields[i].DisplayLabel := TDimensionState(FDimensionStates[DimID]).DisplayName
      else
        Result.Fields[i].DisplayLabel := TSummaryInfo(FSummarySettings[DimID]).DisplayName;
    end;

    Result.DisableControls;
    try
      with TxhMemoDataset(Result) do
      for i := 0 to ARecords.Count - 1 do
      begin
        FactTableIndex := ARecords[i];
        Append;
        for j := 0 to WhatArray.Count - 1 do
        begin
          What := WhatArray[j];
          DimID := What and not bitMask;
          if (What and bitMask) = 0 then
            begin
              DimState := FDimensionStates[DimID];
              Dim := DimState.Dim;
              if Dim.RangeBased then
                Result.Fields[j].AsFloat := Dim.FDoubleArray[Dim.FInvertFTIndexes[FactTableIndex]]
              else
                begin
                  Index := DimState.FIndexConversion[FCube.FactTable.GetDim(FactTableIndex, DimID)];
                  Field := Result.Fields[j];
                  SetAsWideString(Field, DimState.Caption[Index]);
                end;
            end
          else
           Result.Fields[j].AsFloat := FCube.FactTable.GetSum(FactTableIndex, DimID);
        end;
        Post;
        TxhMemoDataset(Result).Records[i].FactTableIndex := FactTableIndex;
      end;
    finally
      Result.EnableControls;
      Result.First;
    end;
  finally
    WhatArray.Free;
  end;
end;
{$ELSE}
function TGridInfo.FTRecordsToViewDataset(ARecords: TIntegerArray): DataTable;
var
  DimState: TDimensionState;
  SumInfo: TSummaryInfo;
  Dim: TDimension;
  DimID, i, j, Index, FactTableIndex: integer;
  WhatArray: TIntegerArray;
  What: integer;
  R: DataRow;

const
  bitMask = $80000000;

begin
  Result := nil;
  if (ARecords = nil) or (ARecords.Count = 0) then EXIT;
  Result := DataTable.Create;
  WhatArray := TIntegerArray.Create; 
  try
    for DimID := 0 to FDimensionStates.Count - 1 do
    begin
      DimState := TDimensionState(FDimensionStates[DimID]);
      Dim := DimState.Dim;
      if Dim.Composite = False then
      begin
        if Dim.RangeBased then
          begin
           if Result.Columns[Dim.FieldName] = nil then
             Result.Columns.Add(Dim.FieldName, typeof(Double));
           WhatArray.Add(DimID);
          end
        else
          begin
           if Result.Columns[Dim.FieldName] = nil then
             Result.Columns.Add(Dim.FieldName, typeof(string));
           WhatArray.Add(DimID);
          end
      end;
    end;

    for i := 0 to FSummarySettings.Count - 1 do
    begin
      SumInfo := FSummarySettings[i];
      if SumInfo.Calculated then Continue;
      if Result.Columns[SumInfo.FieldName] = nil then
        Result.Columns.Add(SumInfo.FieldName, typeof(Double));
      WhatArray.Add(SumInfo.SumID or bitMask);
    end;

    for i := 0 to WhatArray.Count - 1 do
    begin
      What := WhatArray[i];
      DimID := What and not bitMask;
      if (What and bitMask) = 0 then
        Result.Columns[i].Caption := TDimensionState(FDimensionStates[DimID]).DisplayName
      else
        Result.Columns[i].Caption := TSummaryInfo(FSummarySettings[DimID]).DisplayName;
    end;

    FCube.CheckFactTablePresence;
    with Result do
    for i := 0 to ARecords.Count - 1 do
    begin
      FactTableIndex := ARecords[i];
      R := NewRow;
      for j := 0 to WhatArray.Count - 1 do
      begin
        What := WhatArray[j];
        DimID := What and not bitMask;
        if (What and bitMask) = 0 then
          begin
            DimState := TDimensionState(FDimensionStates[DimID]);
            Dim := DimState.Dim;
            if Dim.RangeBased then
              R[j] := Dim.FDoubleArray.List[Dim.FInvertFTIndexes[FactTableIndex]]
            else
              begin
                Index := DimState.FIndexConversion[FCube.FactTable.GetDim(FactTableIndex, DimID)];
                R[j] := DimState.Caption[Index];
              end;
          end
        else
         R[j] := TObject(FCube.FactTable.GetSum(FactTableIndex, DimID));
      end;
      Result.Rows.Add(R);
    end;
  finally
    WhatArray.Free;
  end;
end;
{$ENDIF}



procedure TSubFunctionDefs.Assign(Source: TPersistent);
var
  Src: TSubFunctionDefs;
  i: integer;
  FD: TSubFunctionDef;
begin
  if Source is TSubFunctionDefs then
    begin
      Src := TSubFunctionDefs(Source);
      while Src.Count < Count do Items[Count - 1].Free;
      for i := 0 to Src.Count - 1 do
      begin
        if i >= Count
         then FD := TSubFunctionDef(Add)
         else FD := Items[i];
        FD.Assign(Src[i]);
      end;
     end
   else
     inherited Assign(Source);
end;

constructor TSubFunctionDefs.Create(AGridInfo: TGridInfo);
var
  i: integer;
begin
  FGridInfo := AGridInfo;
  inherited Create(AGridInfo, TSubFunctionDef);
  for i := 0 to integer(sstCumulativeSumByCol) do Add;
end;

function TSubFunctionDefs.GetItem(Index: integer): TSubFunctionDef;
begin
  Result := TSubFunctionDef(inherited Items[Index]);
end;

procedure TSubFunctionDefs.ReadStream(Stream: TStream);
var
  Tag: word;
  ACount, i: integer;
begin
  ACount := 0;
  CheckTag(Stream, tgSubFunctionDefs);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgSubFunctionDefs_Count:  ACount := ReadInteger(Stream);
      tgSubFunctionDefs_ArrayData:
        begin
          Clear;
          for i := 0 to ACount - 1 do
            TSubFunctionDef(Add).ReadStream(Stream);
        end;
      tgSubFunctionDefs_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

procedure TSubFunctionDefs.SetItem(Index: integer; const Value: TSubFunctionDef);
begin
  inherited Items[Index] := Value;
end;

function TSubFunctionDefs.StreamSize: integer;
var
  i: integer;
begin
  Result := TagSize * 4 + IntegerSize(Count);
  for i := 0 to Count - 1 do inc(Result, TSubFunctionDef(inherited Items[i]).StreamSize);
end;

procedure TSubFunctionDefs.WriteStream(Stream: TStream);
var
  i: integer;
begin
  with Stream do
  begin
    WriteTag(Stream, tgSubFunctionDefs);

    WriteTag(Stream, tgSubFunctionDefs_Count);
    WriteInteger(Stream, Count);

    WriteTag(Stream, tgSubFunctionDefs_ArrayData);
    for i := 0 to Count - 1 do TSubFunctionDef(inherited Items[i]).WriteStream(Stream);

    WriteTag(Stream, tgSubFunctionDefs_EOT);
  end;
end;


procedure TSubFunctionDef.Assign(Source: TPersistent);
begin
  if Source is TSubFunctionDef then
    begin
      FDisplayName := TSubFunctionDef(Source).FDisplayName;
      FUserAllowed := TSubFunctionDef(Source).FUserAllowed;
    end
  else
    inherited Assign(Source);
end;

constructor TSubFunctionDef.Create(Collection: TCollection);
begin
  if Collection.Count > integer(High(TSubFunction)) then
    raise Exception.Create(GetResStr('xhOverCalcSubFunctions', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhOverCalcSubFunctions));
  inherited;
  fUserAllowed := (Index <= integer(sstCumulativeSumByCol));
  DisplayName := SubFunction2Str(SubFunction);
end;

function TSubFunctionDef.GetDisplayName: WideString;
begin
  Result := FDisplayName;
end;

function TSubFunctionDef.GetSubFunction: TSubFunction;
begin
  Result := TSubFunction(Index);
end;

procedure TSubFunctionDef.ReadStream(Stream: TStream);
var
  Tag: word;
begin
  CheckTag(Stream, tgSubFunctionDef);
  with Stream do
  repeat
    Read(Tag, SizeOf(Tag));
    case Tag of
      tgSubFunctionDef_DisplayName: FDisplayName := ReadWideString(Stream);
      tgSubFunctionDef_UserAllowed: FUserAllowed := ReadBoolean(Stream);
      tgSubFunctionDef_EOT: BREAK;
    else 
      SkipValue(Stream);
    end;
  until False;
end;

procedure TSubFunctionDef.SetDisplayName(const Value: WideString);
begin
  if WideCompareStr(FDisplayName, Value) <> 0 then
  begin
    FDisplayName := Value;
    Changed(False);
  end;
end;

{$IFDEF ASPRUNTIME}
function TGridInfo.BuildViewDataset(Row, Col: integer): DataTable;
var
  Records: TIntegerArray;
begin
  Result := nil;
  if (Row < 0) or (Col < 0) then EXIT;
  Records := GetCellAggregateRecords(Row, Col);
  try
    Result := FTRecordsToViewDataset(Records);
  finally
    Records.Free;
  end;
end;

function TGridInfo.BuildViewDataset(SumIndex: TIntegerArray): DataTable;
var
  Records: TIntegerArray;
begin
  Result := nil;
  if (SumIndex = nil) then EXIT;
  Records := GetCellAggregateRecords(SumIndex);
  try
    if (Records = nil) or (Records.Count = 0) then EXIT;
    Result := FTRecordsToViewDataset(Records);
  finally
    Records.Free;
  end;
end;
{$ELSE}
function TGridInfo.BuildViewDataset(Row, Col: integer): TDataSet;
var
  Records: TIntegerArray;
begin
  Result := nil;
  if (Row < 0) or (Col < 0) then EXIT;
  Records := GetCellAggregateRecords(Row, Col);
  try
    Result := FTRecordsToViewDataset(Records);
  finally
    Records.Free;
  end;
end;

function TGridInfo.BuildViewDataset(SumIndex: TIntegerArray): TDataSet;
var
  Records: TIntegerArray;
begin
  Result := nil;
  if (SumIndex = nil) then EXIT;
  Records := GetCellAggregateRecords(SumIndex);
  try
    if (Records = nil) or (Records.Count = 0) then EXIT;
    Result := FTRecordsToViewDataset(Records);
  finally
    Records.Free;
  end;
end;
{$ENDIF}

class function TCustomHierCube.StreamVersion(Stream: TStream): integer;
var
  f: integer;
begin
  f := CheckStreamFormat(Stream);
  if f < 0 then InvalidStreamFormatError;
  Result := (f and sfVersion);
end;

class function TCustomHierCube.CorrectStream(Stream: TStream): boolean;
begin
  Result := (CheckStreamFormat(Stream) >= 0);
end;

class function TCustomHierCube.CompressedStream(Stream: TStream): boolean;
var
  f: integer;
begin
  f := CheckStreamFormat(Stream);
  if f < 0 then InvalidStreamFormatError;
  Result := (f and sfCompressFlag > 0);
end;

class function TCustomHierCube.CheckStreamFormat(Stream: TStream): integer;
var
  b: byte;
  w: word;
  Version: integer;
  Position: integer;
begin
  Result := -1;
  Position := Stream.Position;
  if Stream.Size - Position < 5 then EXIT;
  try
    Stream.Read(b, sizeof(byte));
    if b = 0 then Stream.Seek(-sizeof(byte), soFromCurrent);
    Stream.Read(w, sizeof(word)); 
    if w = tgCommonStream then
    begin
      if b > 0 then Result := sfCompressFlag else Result := 0;
      Stream.Read(w, sizeof(word)); 
      if w = tgCommonStream_VersionNumber then 
      begin
        Version := xhStream.ReadInteger(Stream);
        Result := Result or (Version and sfVersion);
      end;
    end;
  finally
    Stream.Position := Position;
  end;
end;


procedure TCustomHierCube.SaveUncompressed(Stream: TStream; const UserData: string);
begin
  WriteCommonStream(Stream, pointer(UserData), length(UserData) * SizeOf(Char));
end;

procedure TCustomHierCube.SaveUncompressedW(Stream: TStream; const UserData: WideString);
begin
  WriteCommonStream(Stream, pointer(UserData), length(UserData) * SizeOf(WideChar));
end;

procedure TCustomHierCube.SaveUncompressed(Stream: TStream; Buffer: pointer = nil; Count: integer = 0);
begin
  WriteCommonStream(Stream, Buffer, Count);
end;

procedure TCustomHierCube.SaveUncompressed(const FName: WideString; const UserData: string);
var
  Stream: TWideFileStream;
begin
  Stream := TWideFileStream.Create(FName, fmCreate);
  try
    WriteCommonStream(Stream, pointer(UserData), length(UserData) * SizeOf(Char));
  finally
    Stream.Free;
  end;
end;

procedure TCustomHierCube.SaveUncompressedW(const FName: WideString; const UserData: WideString);
var
  Stream: TWideFileStream;
begin
  Stream := TWideFileStream.Create(FName, fmCreate);
  try
    WriteCommonStream(Stream, pointer(UserData), length(UserData) * SizeOf(WideChar));
  finally
    Stream.Free;
  end;
end;

procedure TCustomHierCube.SaveUncompressed(const FName: WideString; Buffer: pointer = nil; Count: integer = 0);
var
  Stream: TWideFileStream;
begin
  Stream := TWideFileStream.Create(FName, fmCreate);
  try
    WriteCommonStream(Stream, Buffer, Count);
  finally
    Stream.Free;
  end;
end;

procedure TGridInfo.SaveUncompressed(Stream: TStream; StreamContent: TStreamContent;
  SaveFactTable: boolean; Buffer: pointer; Count: integer);
begin
  WriteCommonStream(Stream, StreamContent, Buffer, Count, SaveFactTable);
end;

procedure TGridInfo.SaveUncompressed(const FName: WideString; StreamContent: TStreamContent;
  SaveFactTable: boolean; Buffer: pointer; Count: integer);
var
  Stream: TWideFileStream;
begin
  Stream := TWideFileStream.Create(FName, fmCreate);
  try
    WriteCommonStream(Stream, StreamContent, Buffer, Count, SaveFactTable);
  finally
    Stream.Free;
  end;
end;

function TSubFunctionDef.StreamSize: integer;
begin
  Result := TagSize * 4 + WideStringSize(FDisplayName) + BooleanSize;
end;

procedure TSubFunctionDef.WriteStream(Stream: TStream);
begin
  with Stream do
  begin
    WriteTag(Stream, tgSubFunctionDef);

    WriteTag(Stream, tgSubFunctionDef_DisplayName);
    WriteWideString(Stream, FDisplayName);

    WriteTag(Stream, tgSubFunctionDef_UserAllowed);
    WriteBoolean(Stream, FUserAllowed);

    WriteTag(Stream, tgSubFunctionDef_EOT);
  end;
end;


procedure TSubFunctionCalculatorArgs.Clear;
begin
  FColLabelNode := nil;
  FRowLabelNode := nil;
  FFunctionData := nil;
  FSumInfo := nil;
  FRowTreeIndex := 0;
  FColTreeIndex := 0;
  FSumIndex := nil;
end;

constructor TSubFunctionCalculatorArgs.Create(AGridInfo: TGridInfo);
begin
{$IFDEF ASPRUNTIME}
  inherited Create;
{$ENDIF}
  FGridInfo := AGridInfo;
  if (AGridInfo <> nil) and (AGridInfo.Active) then FSumIndex := AGridInfo.CreateSumIndex;
end;

{$IFNDEF ASPRUNTIME}
destructor TSubFunctionCalculatorArgs.Destroy;
begin
  FreeAndNil(FSumIndex);
end;
{$ENDIF}

function TGridInfo.GetStandardSubFunctionCalculator(SubFun: TSubFunction): TSubFunctionCalculator;
begin
  Result := nil;
  case SubFun of
    sstRankByRow: Result := CalcRankAlongRow;
    sstRankByCol: Result := CalcRankAlongCol;
    sstPercentByRow: Result := CalcPercentAlongRow;
    sstPercentByCol: Result := CalcPercentAlongCol;
    sstCompareWithPrevByRow: Result := CalcCompareWithPrevAlongRow;
    sstCompareWithPrevByCol: Result := CalcCompareWithPrevAlongCol;
    sstCumulativeSumByRow: Result := CalcCumulativeSumAlongRow;
    sstCumulativeSumByCol: Result := CalcCumulativeSumAlongCol;
  end;
end;


procedure TGridCellArgs.Clear;
begin
  FCellType := enNone;
  FRow := -1;
  FCol := -1;
  FDimState := nil;
  FColLabelNode := nil;
  FRowLabelNode := nil;
  FSubLevelNode := nil;
  FValue := 0;
  FValueString := '';
  FIsNull := False;
end;

procedure TGridCellArgs.Assign(Source: TEventArgs);
var
  Args: TGridCellArgs;
begin
  if Source is TGridCellArgs then
  begin
    Args := TGridCellArgs(Source);
    FCellType := Args.FCellType;
    FRow := Args.FRow;
    FCol := Args.FCol;
    FDimState := Args.FDimState;
    FColLabelNode := Args.FColLabelNode;
    FRowLabelNode := Args.FRowLabelNode;
    FSubLevelNode := Args.FSubLevelNode;
    FValue := Args.FValue;
    FValueString := Args.FValueString;
    FIsNull := Args.FIsNull;
  end;
end;


constructor TGridExportStructure.Create(AWidth, AHeight: integer);
begin
{$IFDEF ASPRUNTIME}
  inherited Create;
  FHeight := AHeight;
  FWidth := AWidth;
  SetLength(FArray, FWidth, FHeight);
{$ELSE}
  FHeight := AHeight;
  FWidth := AWidth;
  GetMem(FArray, AHeight * AWidth * SizeOf(TExportNode));
  FillChar(FArray^, AHeight * AWidth * SizeOf(TExportNode), 0);
{$ENDIF}
end;


{$IFNDEF ASPRUNTIME}
destructor TGridExportStructure.Destroy;
begin
  FreeMem(FArray, FHeight * FWidth * SizeOf(TExportNode));
  inherited;
end;
{$ENDIF}


{$IFDEF ASPRUNTIME}
function TGridExportStructure.GetItem(X, Y: integer): PExportNode;
begin
  Result := FArray[X,Y];
end;
{$ELSE}
function TGridExportStructure.GetItem(X, Y: integer): PExportNode;
type
  TExportNodeArray = array[0..High(Integer) div SizeOf(TExportNode) - 1] of TExportNode;
  PExportNodeArray = ^TExportNodeArray;
begin
  Result := @(PExportNodeArray(FArray)^[Y * FWidth + X]);
end;
{$ENDIF}

function TGridInfo.BuildExportStructure: TGridExportStructure;
var
  GES: TGridExportStructure;
  EN: PExportNode;

  procedure ExportData;
  var
    ax, ay: integer;
    i, j: integer;
    SubFunInfo: TSubFunctionInfo;
    SumInfoID: integer;
    Fun: TFunction;
    SubFun: TSubFunction;
  begin
    ay := FGridLayout.FixedRows;
    for i := 0 to FGridLayout.RowCount - FGridLayout.FixedRows - 1 do
    begin
      ax := FGridLayout.FixedCols;
      for j := 0 to FGridLayout.ColCount - FGridLayout.FixedCols - 1 do
      begin
        EN := GES[ax, ay];
        EN.NodeType := enData;
        EN.ColSpan := 1;
        EN.RowSpan := 1;
        EN.Row := i;
        EN.Col := j;
        EN.RowLabelNode := Row2LabelNode(i);
        EN.ColLabelNode := Col2LabelNode(j);
        EN.SubLevelNode := Col2SubLevelNode(j);

        Col2SumFun(j, SumInfoID, Fun, SubFun);
        SubFunInfo := SummarySettings[SumInfoID][integer(Fun)][integer(SubFun)];
        EN.Alignment := SubFunInfo.Alignment;
        EN.FormatString := SubFunInfo.FormatString;
        EN.Empty := not GridSummaryArray.GetData2(EN.RowLabelNode, EN.ColLabelNode, SumInfoID, Fun, SubFun, EN.Data);

        if not EN.Empty then
          EN.ValueString := xhFormatFloat(SubFunInfo.FormatString, EN.Data)
        else
          if FFormatNulls then
            EN.ValueString := xhFormatFloat(SubFunInfo.FormatString, 0)
          else
            EN.ValueString := '';
{$IFDEF ASPRUNTIME}
        GES[ax, ay] := EN;
{$ENDIF}
        inc(ax);
      end;
      inc(ay);
    end; 
  end;

  procedure ExportNodes(Nodes: TLabelNodes);
  var
    i: integer;
    Node: TLabelNode;
  begin
    if Nodes <> nil then
    for i := 0 to Nodes.Count - 1 do
    begin
      Node := TLabelNode(Nodes[i]);
      if Node.Expanded then
        ExportNodes(Node.ChildNodes);
        
      EN := GES[Node.R.Left, Node.R.Top];
      EN.NodeType := enDimLabel;
      EN.ColSpan := Node.R.Right - Node.R.Left + 1;
      EN.RowSpan := Node.R.Bottom - Node.R.Top + 1;
      EN.RowLabelNode := Node;
      EN.ColLabelNode := Node;
      EN.ValueString := WideTrim(Node.LabelText);
      EN.DimState := Node.DimState;
{$IFDEF ASPRUNTIME}
      GES[Node.R.Left, Node.R.Top] := EN;
{$ENDIF}
    end;
  end;

  procedure ExportColDimensions;
  var
    StartX, StartY, StopY: Integer;
    i: integer;
    Node: TSubLevelNode;
    LabelNode: TLabelNode;
    VisibleNodes: TPointerArray;

    procedure CalcSubLevelNodes(Nodes: TSubLevelNodes);
    var
      i: integer;
      Node: TSubLevelNode;
    begin
      if Nodes <> nil then
      begin
        for i := 0 to Nodes.Count - 1 do
        begin
          Node := TSubLevelNode(Nodes[i]);
          Node.R.Top := StopY - (FGridLayout.OffsetRow - Node.Level) + 1;
          Node.R.Bottom := Node.R.Top;
          if Node.ChildNodes <> nil then
          begin
            if Node.Level = 0 then CalcSubLevelNodes(Node.ChildNodes);
            Node.R.Left := TSubLevelNode(Node.ChildNodes[0]).R.Left;
            Node.R.Right := TSubLevelNode(Node.ChildNodes[Node.ChildNodes.Count - 1]).R.Right;
          end;
        end;
      end;
    end;

    procedure CalcNodesRect(Nodes: TLabelNodes);
    var
      i: integer;
      Node: TLabelNode;
    begin
      if Nodes <> nil then
      begin
        for i := 0 to Nodes.Count - 1 do
        begin
          Node := TLabelNode(Nodes[i]);
          Node.R.Top := StartY + Node.DimOffset;
          if Node.Expanded then
          begin
            CalcNodesRect(Node.ChildNodes);
            Node.R.Left := TLabelNode(Node.ChildNodes[0]).R.Left;
            Node.R.Right := TLabelNode(Node.ChildNodes[Node.ChildNodes.Count - 1]).R.Right;
            Node.R.Bottom := TLabelNode(Node.ChildNodes[0]).R.Top - 1;
          end;
        end;
      end;
    end;

    procedure ExportSubLevelNodes(Nodes: TSubLevelNodes);
    var
      i:integer;
      Node: TSubLevelNode;
      SumInfo: TSummaryInfo;
    begin
      if Nodes <> nil then
      begin
        for i := 0 to Nodes.Count - 1 do
        begin
          Node := TSubLevelNode(Nodes[i]);
          if Node.ChildNodes <> nil then ExportSubLevelNodes(Node.ChildNodes);
          EN := GES[Node.R.Left, Node.R.Top];

          SumInfo := Node.SumInfo;
          EN.ColSpan := Node.R.Right - Node.R.Left + 1;
          EN.RowSpan := Node.R.Bottom - Node.R.Top + 1;
          EN.SubLevelNode := Node;
          EN.RowLabelNode := Node.LabelNode;
          EN.ColLabelNode := Node.LabelNode;
          if Node.LabelNode <> nil then EN.DimState := Node.LabelNode.DimState;
          case Node.Level of
            0: begin
                 EN.NodeType := enSummary;
                 if SumInfo.DisplayName <> '' then
                   EN.ValueString := SumInfo.DisplayName
                 else
                   EN.ValueString := SumInfo.FieldName;
               end;
            1: begin
                 EN.NodeType := enFunction;
                 if SumInfo.Calculated then
                   EN.ValueString := GetResStr('xhstCalculated', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhstCalculated)
                 else
                   EN.ValueString := FunctionDefs[integer(Node.Fun)].DisplayName;
               end;
            2: begin
                 EN.NodeType := enSubFunction;
                 EN.ValueString := SubFunctionDefs[integer(Node.SubFun)].DisplayName;
               end;
          end;
{$IFDEF ASPRUNTIME}
          GES[Node.R.Left, Node.R.Top] := EN;
{$ENDIF}
        end;
      end;
    end;

  begin
    StartX := FGridLayout.FixedCols;
    StartY := 0;
    StopY := FGridLayout.FixedRows - 1;
    VisibleNodes := VisibleColSubLevelNodes;
    for i := 0 to FGridLayout.ColCount - FGridLayout.FixedCols - 1 do
    begin
      Node := TSubLevelNode(VisibleNodes[i]);
      Node.R.Left := StartX + i;
      Node.R.Right := StartX + i;
      Node.R.Bottom := StopY;
      Node.R.Top := StopY;
    end;
    CalcSubLevelNodes(FColSubLevelNodes);
    if (FVisibleColNodes <> nil) and (FColLabelNodes <> nil) then
    begin
      VisibleNodes := FVisibleColNodes;
      for i := 0 to VisibleNodes.Count - 1 do
      begin
        LabelNode := TLabelNode(VisibleNodes[i]);
        LabelNode.R.Bottom := StopY - FGridLayout.OffsetRow;
        LabelNode.R.Top := LabelNode.R.Bottom;
        LabelNode.R.Left := TSubLevelNode(LabelNode.SubLevelNodes[0]).R.Left;
        LabelNode.R.Right := TSubLevelNode(LabelNode.SubLevelNodes[LabelNode.SubLevelNodes.Count - 1]).R.Right;
      end;
      CalcNodesRect(FColLabelNodes);
    end;
    ExportSubLevelNodes(FColSubLevelNodes);
    if (FVisibleColNodes <> nil) and (FColLabelNodes <> nil) then
      ExportNodes(FColLabelNodes);
  end;

  procedure ExportRowDimensions;
  var
    StartX, StartY, StopX: Integer;
    i: integer;
    Node: TLabelNode;
    VisibleNodes: TPointerArray;

    procedure CalcNodesRect(Nodes: TLabelNodes);
    var
      i: integer;
      Node: TLabelNode;
    begin
      if Nodes <> nil then
      begin
        for i := 0 to Nodes.Count - 1 do
        begin
          Node := TLabelNode(Nodes[i]);
          Node.R.Left := StartX + Node.DimOffset;
          if Node.Expanded then
          begin
            CalcNodesRect(Node.ChildNodes);
            Node.R.Top := TLabelNode(Node.ChildNodes[0]).R.Top;
            Node.R.Bottom := TLabelNode(Node.ChildNodes[Node.ChildNodes.Count - 1]).R.Bottom;
            Node.R.Right := TLabelNode(Node.ChildNodes[0]).R.Left - 1;
          end;
        end;
      end;
    end;

  begin
    StartX := 0;
    StopX := FGridLayout.DimsCol + FGridLayout.OffsetCol - 1;
    StartY := FGridLayout.DimsRow + FGridLayout.OffsetRow;
    VisibleNodes := FVisibleRowNodes;

    if (FGridLayout.DimsCol > 0) and (VisibleNodes <> nil) then
      begin
        for i := 0 to VisibleNodes.Count - 1 do
        begin
          Node := TLabelNode(VisibleNodes[i]);
          Node.R.Top := StartY + i;
          Node.R.Bottom := StartY + i;
          Node.R.Right := StopX; 
        end;
        CalcNodesRect(FRowLabelNodes);
        ExportNodes(FRowLabelNodes);
      end
    else if FGridLayout.OffsetCol > 0 then
      begin
      end;
  end;

  procedure ExportCaptions(CaptionNodes: TCaptionNodes);
  var
    i: integer;
    Node: TCaptionNode;
  begin
    if CaptionNodes <> nil then
    for i := 0 to CaptionNodes.Count - 1 do
    begin
      Node := TCaptionNode(CaptionNodes[i]);
      EN := GES[Node.R.Left, Node.R.Top];
      EN.NodeType := enDimCaption;
      EN.ColSpan := Node.R.Right - Node.R.Left + 1;
      EN.RowSpan := Node.R.Bottom - Node.R.Top + 1;
      EN.CaptionNode := Node;
      EN.ValueString := Node.DimState.DisplayName;
      EN.DimState := Node.DimState;
{$IFDEF ASPRUNTIME}
      GES[Node.R.Left, Node.R.Top] := EN;
{$ENDIF}
    end;
  end;

  procedure ExportRowCaptions;
  var
    StartX, StartY, StopY: Integer;
    CaptionNodes: TCaptionNodes;

    procedure CalcCaptionRect(L: TCaptionNodes);
    var
      CaptionNode: TCaptionNode;
      i, X1, X2: integer;
    begin
      X1 := StartX;
      X2 := X1;
      for i := 0 to CaptionNodes.Count - 1 do
      begin
        CaptionNode := TCaptionNode(CaptionNodes[i]);
        X2 := X2 + CaptionNode.LevelsCount;
        CaptionNode.R.Left := X1;
        CaptionNode.R.Right := X2 - 1;
        CaptionNode.R.Top := StartY;
        CaptionNode.R.Bottom := StopY;
        X1 := X2;
      end;
    end;

  begin
    if FGridLayout.DimsCol = 0 then EXIT;
    CaptionNodes := FRowCaptionNodes;
    if CaptionNodes = nil then EXIT;
    StartX := 0;
    StartY := FGridLayout.DimsRow;
    StopY := FGridLayout.DimsRow + FGridLayout.OffsetRow - 1;
    CalcCaptionRect(CaptionNodes);
    ExportCaptions(CaptionNodes);
  end;
  
  procedure ExportColCaptions;
  var
    StartX, StartY, StopX: Integer;
    CaptionNodes: TCaptionNodes;

    procedure CalcCaptionRect(L: TCaptionNodes);
    var
      i, Y1, Y2: integer;
      CaptionNode: TCaptionNode;
    begin
      Y1 := StartY;
      Y2 := Y1;
      for i := 0 to CaptionNodes.Count - 1 do
      begin
        CaptionNode := TCaptionNode(CaptionNodes[i]);
        Y2 := Y2 + CaptionNode.LevelsCount;
        CaptionNode.R.Left := StartX;
        CaptionNode.R.Right := StopX; 
        CaptionNode.R.Top := Y1;
        CaptionNode.R.Bottom := Y2 - 1;
        Y1 := Y2;
      end;
    end;

  begin
    if FGridLayout.DimsRow = 0 then EXIT;
    CaptionNodes := FColCaptionNodes;
    if CaptionNodes = nil then EXIT;
    StartX := 0;
    StartY := 0;
    StopX := FGridLayout.DimsCol + FGridLayout.OffsetCol - 1;
    CalcCaptionRect(CaptionNodes);
    ExportCaptions(CaptionNodes);
  end;

var
  y: integer;
{$IFDEF ASPRUNTIME}
  GESNode: TExportNode;
{$ENDIF}
begin
  Result := nil;
  if not Active then EXIT;
  CalculateGridLayout;
  GES := TGridExportStructure.Create(FGridLayout.ColCount, FGridLayout.RowCount);
  GES.FFixedCols := FGridLayout.FixedCols;
  GES.FFixedRows := FGridLayout.FixedRows;
  try
    ExportColCaptions;
    ExportRowCaptions;
    ExportRowDimensions;
    ExportColDimensions;
    ExportData;
    for y := GES.FHeight - 1 downto 0 do
    if GES[0, y].NodeType <> enNone then
    begin
{$IFDEF ASPRUNTIME}
      GESNode := GES[0, y];
      GESNode.RowSpan := GES.FHeight - y;
      GES[0, y] := GESNode;
{$ELSE}
      GES[0, y].RowSpan := GES.FHeight - y;
{$ENDIF}
      BREAK;
    end;
  except
    GES.Free;
    raise;
  end;
  Result := GES;
end;

function TGridInfo.CalculateGridLayout: PGridLayout;
begin
{$IFNDEF ASPRUNTIME}
  Result := @FGridLayout;
{$ENDIF}
  with FGridLayout do
  if Active then
    begin
      DimsCol := nOpenRowDims;
      DimsRow := nOpenColDims;
      if (DimsCol = 0) and (DimsRow = 0) then
        OffsetCol := 0
      else
        if DimsCol > 0 then OffsetCol := 0 else OffsetCol := 1;

      OffsetRow := integer(LowestSubLevelNode) + 1; 

      FixedCols := 0;
      FixedRows := 0;
      RowCount := DimsRow + OffsetRow + nVisibleDataRows;
      ColCount := DimsCol + OffsetCol + nVisibleDataCols;
      if nVisibleDataRows > 0 then FixedCols := DimsCol + OffsetCol;
      if nVisibleDataCols > 0 then FixedRows := DimsRow + OffsetRow;
    end
  else
    begin
      FixedCols := 0;
      FixedRows := 0;
      RowCount := 1;
      ColCount := 1;
      DimsCol := 0;
      DimsRow := 0;
      OffsetRow := 0;
      OffsetCol := 0;
    end;
{$IFDEF ASPRUNTIME}
  Result := FGridLayout;
{$ENDIF}
end;

function TGridInfo.GetGridLayout: PGridLayout;
begin
{$IFDEF ASPRUNTIME}
  Result := FGridLayout;
{$ELSE}
  Result := @FGridLayout;
{$ENDIF}
end;

{$IFDEF ASPRUNTIME}
procedure TGridExportStructure.SetItem(X, Y: integer; const Value: PExportNode);
begin
  FArray[X, Y] := Value;
end;
{$ENDIF}

function TGridInfo.DefineCustomFunction(const DisplayName: WideString): TFunction;
var
  Def: TFunctionDef;
begin
  if FunctionDefs.Count - 1 = integer(high(TFunction)) then
    raise Exception.Create(GetResStr('xhOverCalcFunctions', {$IFNDEF ASPRUNTIME}@{$ENDIF}xhOverCalcFunctions));
  Def := FunctionDefs.Add;
  Result := Def.FunctionType;
  Def.DisplayName := DisplayName;
end;

{$IFDEF ASPRUNTIME}
procedure TDoubleFunctionsArray.ReadContents(AStream: TStream);
var
  i, j, L: integer;
  TF: TFunctionValues;
begin
  SetCount(Count);
  with AStream do
  begin
    if ReadValueType(AStream) = vtBinary then
      begin
        Read(L, SizeOf(Integer));
        for i := 0 to FCount - 1 do
          begin
           Read(TF.Min);
           Read(TF.Max);
           Read(TF.Variance);
           Read(TF.Skewness);
           Read(TF.Kurtosis);
           Read(TF.ADev);
           Read(TF.Median);
           for j := 1 to 5 do
            Read(TF.Customs[j]);
           Self[i] := TObject(TF);
          end;
      end
    else
      InvalidPropError(AStream.Position - SizeOf(TxhValueType));
  end;
end;

procedure TDoubleFunctionsArray.WriteContents(AStream: TStream);
var
  i, j: integer;
  TF: TFunctionValues;
begin
  with AStream do
  begin
    WriteValueType(AStream, vtBinary);
    Write(Count*sizeof(TFunctionValues), SizeOf(Integer));
    for i := 0 to FCount - 1 do
      begin
       TF := TFunctionValues(Self[i]);
       Write(TF.Min);
       Write(TF.Max);
       Write(TF.Variance);
       Write(TF.Skewness);
       Write(TF.Kurtosis);
       Write(TF.ADev);
       Write(TF.Median);
       for j := 1 to 5 do
        Write(TF.Customs[j]);
      end;
  end;
end;

procedure TFuncData.SetItem(Col, Row: integer; const Value: PDataCell);
begin
  FArray[Col, Row] := Value;
end;
{$ENDIF}

function TGridInfo.DimID2LocalIndex(DimID: integer): integer;
begin
  if DimID < ActiveDimIndexes.Count then
    Result := ActiveDimIndexes[DimID]
  else
    Result := -1;
end;

function TGridInfo.AddFunction(const DisplayName: WideString): TFunctionDef;
begin
  Result := nil;
  if FunctionDefs.Count >= Ord(High(TFunction)) + 1 then EXIT; 
  Result := FunctionDefs.Add;
  Result.fDisplayName := DisplayName;
  Result.fUserAllowed := True;
end;

function TGridInfo.AddSubFunction(const DisplayName: WideString): TSubFunctionDef;
begin
  Result := nil;
  if SubFunctionDefs.Count >= Ord(High(TSubFunction)) + 1 then EXIT; 
  Result := TSubFunctionDef(SubFunctionDefs.Add);
  Result.fDisplayName := DisplayName;
  Result.fUserAllowed := True;
end;

constructor TInitPivotStateArgs.Create;
begin
  inherited Create;
  FDestroyStream := True; 
end;

constructor TCloseDimensionEditorArgs.Create(DimState: TDimensionState);
begin
  FDimensionState := DimState;
end;

function TCloseDimensionEditorArgs.GetChanged: boolean;
begin
  Result := (FDisplayNameChanged or FAttributeChanged or FSortTypeChanged or FFilterChanged or FGroupsChanged or
    FMemberHierarchyChanged or FMemberNamesChanged);
end;

end.




