unit CompOs;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc, MemDS,
  DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TFCompOs = class(TBaseForm)
    sp1: TOilStoredProc;
    qExam: TOilQuery;
    procedure bbSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCompOs: TFCompOs;

implementation
Uses Main, OilStd;
{$R *.DFM}

procedure TFCompOs.bbSearchClick(Sender: TObject);
var curr_id, curr_inst: integer;
begin
 // Получаем текущую строку
 curr_id:= q.fieldbyname('id').value;
 curr_inst:= q.fieldbyname('inst').value;
  q.close;
    q.SQL.Clear;
    q.SQL.Add(' SELECT * '+
              ' FROM  OIL_COMP_OS '+
              ' WHERE STATE=''Y'' ');
  q.open;
  // Позиционируем курсор
  q.Locate('id;inst', VarArrayOf([curr_id, curr_inst]), []);

end;

procedure TFCompOs.FormCreate(Sender: TObject);
var i:integer;
begin
  inherited;
  InsideTransaction:=FALSE;
  if DBGrid1.Columns.Count>0 then
  begin
     DBGrid1.Columns[0].Title.SortMarker:=smDownEh;
     for i:=0 to DBGrid1.Columns.Count-1 do
         DBGrid1.Columns[i].Title.TitleButton:=TRUE;
  end;
  q.close;
  q.open;
end;

end.
