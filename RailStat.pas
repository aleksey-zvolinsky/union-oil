unit RailStat;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  EditBase, Db, MemDS, DBAccess, Ora, StdCtrls, Buttons, ExtCtrls,uOilQuery,uOilStoredProc;

type
  TRailStatForm = class(TEditBaseForm)
    Label1: TLabel;
    edName: TEdit;
    procedure Init; override;
    procedure Test; override;
    procedure Save; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RailStatForm: TRailStatForm;

implementation

{$R *.DFM}

uses Main;

{ TRailStatForm }
//==================================================================================
procedure TRailStatForm.Init;
begin
  inherited;
  if ID<>0 then
    edName.Text:=q['name'];
end;
//==================================================================================
procedure TRailStatForm.Save;
begin
  DBSaver.SaveRecord('OIL_RAIL_STAT',
    ['id',           ID,
     'inst',         INST,
     'state',        'Y',
     'name',         edName.Text]);
end;
//==================================================================================
procedure TRailStatForm.Test;
begin
  if edName.Text='' then
    raise exception.create(TranslateText('Не введено название'));
end;
//==================================================================================
end.
