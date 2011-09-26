unit PExchWarning;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Main,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess, DBGridEh;

type
  TExchWarning = class(TCommonForm)
    lbWarning: TLabel;
    bIgnore: TBitBtn;
    dbgPart: TDBGridEh;
    Timer1: TTimer;
    qPart: TOilQuery;
    dsPart: TOraDataSource;
    qPartDOG_: TStringField;
    qPartTIMES: TStringField;
    qPartN: TFloatField;
    procedure bIgnoreClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExchWarning: TExchWarning;

implementation

{$R *.DFM}

procedure TExchWarning.bIgnoreClick(Sender: TObject);
begin
  qPart.Close;
  Close;
end;

procedure TExchWarning.Timer1Timer(Sender: TObject);
begin
  if lbWarning.Font.Color = clBlack
     then lbWarning.Font.Color := clRed
     else lbWarning.Font.Color := clBlack;
end;

end.


