unit AutoShip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  EditBase, Db, MemDS, DBAccess, Ora, uOilQuery, StdCtrls, Buttons, ExtCtrls,
  Mask, ToolEdit;

type
  TAutoShipForm = class(TEditBaseForm)
    Panel1: TPanel;
    edName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ceType: TComboEdit;
    procedure Init; override;
    procedure Test; override;
    procedure Save; override;
    procedure ceTypeButtonClick(Sender: TObject);
  private
  public
  end;

var
  AutoShipForm: TAutoShipForm;

implementation

uses Main, UDbFunc, ExFunc, uXMLForm, AutoRef;

{$R *.DFM}

//==============================================================================
procedure TAutoShipForm.Init;
begin
  inherited;
  if ID = 0 then
  begin
    ceType.Tag := 14;
    ceType.Text := GetSqlValue('select name from oil_auto_type where id=' + IntToStr(ceType.Tag));
  end
  else
  begin
    FillControls(q, [edName, ceType], ['numb', 'auto_type_name']);
    ceType.Tag := q['auto_type_id'];
  end;
end;
//==============================================================================
procedure TAutoShipForm.Save;
begin
  DBSaver.SaveRecord('OIL_AUTO',
    ['ID',           ID,
     'INST',         INST,
     'STATE',        'Y',
     'NUMB',         edName.Text,
     'AUTO_TYPE_ID', ceType.Tag]);
end;
//==============================================================================
procedure TAutoShipForm.Test;
begin
  if edName.Text = '' then raise exception.create('Не введено название!');
  if ceType.Tag = 0 then raise exception.create('Не введен тип!');
  if GetSqlValue('select auto_group from oil_auto_type where id = '+ IntToStr(ceType.Tag)) <> 5 then
    raise exception.create('Здесь можно вводить только водный транспорт!');
end;
//==============================================================================
procedure TAutoShipForm.ceTypeButtonClick(Sender: TObject);
begin
  inherited;
  XMLChoose('autotyperef', ceType);
end;
//==============================================================================

end.
