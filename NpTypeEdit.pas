unit NpTypeEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EditBase, StdCtrls, ExtCtrls, DB, MemDS, DBAccess, Ora,
  uOilQuery, Buttons;

type
  TNpTypeEditForm = class(TEditBaseForm)
    leCodInt: TLabeledEdit;
    qTest: TOilQuery;
    procedure leCodIntKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private

  public
    procedure Init; override;
    procedure Save; override;
    procedure Test; override;
  end;

var
  NpTypeEditForm: TNpTypeEditForm;

implementation

uses Main, UDbFunc;
{$R *.dfm}

{ TNpTypeEditForm }

procedure TNpTypeEditForm.Init;
begin
  inherited Init;
  if not q.FieldByName('out_code').IsNull then
    leCodInt.Text := q.FieldByName('out_code').AsString;
end;

procedure TNpTypeEditForm.Save;
begin
  DBSaver.SaveRecord('EXE_LINK',
   ['ID', q.FieldByName('el_id').Value,
    'OIL_ID', ID,
    'OIL_INST', null,
    'STATE', 'Y',
    'INST', INST,
    'OIL_TABLE_NAME', 'OIL_NP_TYPE',
    'OUT_PROGRAM', 4,
    'OUT_CODE', leCodInt.Text]);
end;

procedure TNpTypeEditForm.leCodIntKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #8]) then key := #0;
end;

procedure TNpTypeEditForm.Test;
begin
  inherited;
  if leCodInt.Text = '' then
  begin
    leCodInt.SetFocus;
    raise Exception.CreateFmt('Не определено поле "%s"',[leCodInt.EditLabel.Caption]);
  end;
  _OpenQueryPar(qTest,
   ['id', ID,
    'inst', INST,
    'cod', leCodInt.Text]);
  if not qTest.IsEmpty then
    raise Exception.Create('Товар с таким кодом уже существует!');
end;

procedure TNpTypeEditForm.FormShow(Sender: TObject);
begin
  inherited;
  leCodInt.SetFocus;
end;

end.
