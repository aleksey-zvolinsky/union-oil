unit CompIFace;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc, MemDS,
  DBAccess;

type
  TFCompIFace = class(TBaseForm)
    qID: TFloatField;
    qINST: TFloatField;
    qSTATE: TStringField;
    qIFACE: TStringField;
    qDATE_MOD: TDateTimeField;
    sp1: TOilStoredProc;
    qExam: TOilQuery;
    procedure bbSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
        modeOk: Integer;
    { Public declarations }
  end;

var
   FCompIFace: TFCompIFace;

implementation
Uses Main, OilStd;
{$R *.DFM}

procedure TFCompIFace.bbSearchClick(Sender: TObject);
begin
    q.close;
    q.SQL.Clear;
    q.SQL.Add(' SELECT * '+
              ' FROM  OIL_COMP_IFACE '+
              ' WHERE STATE=''Y'' ');
    q.open;
end;

procedure TFCompIFace.FormCreate(Sender: TObject);
begin
     inherited;
     case modeOk of
         1:
         bbOk.Enabled:=True;
     end;
     q.close;
     q.open;
end;

end.
