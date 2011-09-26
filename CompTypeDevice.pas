unit CompTypeDevice;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess
  {$IFDEF VER150},Variants{$ENDIF};

type
  TFCompTypeDevice = class(TBaseForm)
    procedure FormShow(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCompTypeDevice: TFCompTypeDevice;

implementation

{$R *.DFM}

procedure TFCompTypeDevice.FormShow(Sender: TObject);
begin
   q.Open;
end;

procedure TFCompTypeDevice.bbSearchClick(Sender: TObject);
var
    curr_id, curr_inst: integer;
begin
 // Получаем текущую строку
 curr_id:= q.fieldbyname('id').value;
 curr_inst:= q.fieldbyname('inst').value;
  q.close;
    q.SQL.Clear;
    q.SQL.Add('SELECT TYPE, id, inst  '+
              'FROM OIL_COMP_TYPE_DEVICE  '+
              'WHERE (state=''Y'') ');
    q.SQL.add('order by ' + OrderField + ' ' + OrderDirection);
  q.open;
  // Позиционируем курсор
  q.Locate('id;inst', VarArrayOf([curr_id, curr_inst]), []);

end;

end.
