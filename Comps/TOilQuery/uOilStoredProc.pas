unit uOilStoredProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Ora;

type
  TOilStoredProc = class(TOraStoredProc)
  private
    FDatabaseName : string;
  protected

  public

  published
    property DatabaseName : string read FDatabaseName write FDatabaseName;
  end;



implementation

end.
