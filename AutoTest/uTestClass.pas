unit uTestClass;

interface

type TOnLogEvent = procedure(Sender: TObject; AText: string) of object;

type TTestClass = class(TObject)
  private
    FOnLog: TOnLogEvent;
  public
    Caption: string;
    constructor Create;
    destructor Destroy; override;
    procedure Start; virtual;
    procedure Log(AText: string);
    property OnLog: TOnLogEvent read FOnLog write FOnLog;
  end;

implementation

{ TTestClass }

//==============================================================================
constructor TTestClass.Create;
begin

end;
//==============================================================================
destructor TTestClass.Destroy;
begin
  inherited;
end;
//==============================================================================
procedure TTestClass.Log(AText: string);
begin
  if Assigned(FOnLog) then
    FOnLog(Self, AText);
end;
//==============================================================================
procedure TTestClass.Start;
begin
  Log('Start test - ' + Caption);
end;
//==============================================================================

end.
