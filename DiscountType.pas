unit DiscountType;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, StdCtrls, Menus, Db, DBTables, Grids, DBGridEh, Buttons,
  ExtCtrls, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc, MemDS,
  DBAccess;

type
  TfrmDiscountType = class(TBaseForm)
    edDiscountType: TEdit;
    Label1: TLabel;
    procedure bbSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDiscountType: TfrmDiscountType;

implementation

{$R *.DFM}

procedure TfrmDiscountType.bbSearchClick(Sender: TObject);
begin
  inherited;
  if q.Active then q.Close;
  q.ParamByName('DiscName').asString := edDiscountType.Text;
  q.Open;
end;

procedure TfrmDiscountType.FormCreate(Sender: TObject);
begin
  inherited;
  bbSearchClick(nil);
end;

end.
