unit RezType;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls,uOilQuery,Ora, uOilStoredProc,
  ActnList, MemDS, DBAccess, RXCtrls, DBGridEh;

type
  TRezTypeForm = class(TBaseForm)
    qID: TFloatField;
    qSTATE: TStringField;
    qNAME: TStringField;
    procedure bbSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RezTypeForm: TRezTypeForm;

implementation

{$R *.DFM}

procedure TRezTypeForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  q.Close;
  q.Open;
end;

procedure TRezTypeForm.FormShow(Sender: TObject);
begin
  inherited;
  bbSearchClick(nil);
end;

end.
