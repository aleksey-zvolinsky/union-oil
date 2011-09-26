unit uOilQuery;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,  MemDs, DBAccess, Ora,uOilStoredProc;

type
  TOilQuery = class(TOraQuery)
  private
    FDatabaseName : String;
    FDataSrc: TDataSource;
    FRequestLive : Boolean;
    FUpdateMode : TUpdateMode;
    procedure SetDataSource(Value:TDataSource);
  protected
  public
    constructor Create(AOwner: TComponent);  reintroduce;
    destructor Destroy; reintroduce;
    //procedure FetchAll;
    procedure Open; reintroduce;
    procedure GotoBookmark(Bookmark: TBookmark); reintroduce;
  published
    property DatabaseName : string read FDatabaseName write FDataBaseName;
    property DataSource : TDataSource read FDataSrc write SetDataSource;
    property RequestLive : boolean read FRequestLive write FRequestLive;
    property UpdateMode : TUpdateMode read FUpdateMode write FUpdateMode;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Oil', [TOilQuery]);
  RegisterComponents('Oil', [TOilStoredProc]);
end;

{ TOilQuery }

constructor TOilQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //FDataSrc := TOraDataSource.Create(Self);
end;

destructor TOilQuery.Destroy;
begin
 FDataSrc.Free;
 inherited Destroy;
end;

{procedure TOilQuery.FetchAll;
begin
///
end;}

procedure TOilQuery.GotoBookmark(Bookmark: TBookmark);
begin
  if not IsEmpty then
    inherited GotoBookmark(Bookmark);
end;

procedure TOilQuery.Open;
begin
  try
    Screen.Cursor := crSQLWait;
    //Application.ProcessMessages;//отпускает форму
    inherited Open;
  finally
    Screen.Cursor := crDefault;

  end;
end;

procedure TOilQuery.SetDataSource(Value : TDataSource);
begin
  MasterSource := Value;
  FDataSrc :=Value;
end;



end.
