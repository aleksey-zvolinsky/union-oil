unit BaseEditKoefUdWeightRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EditBase, DB, MemDS, DBAccess, Ora, uOilQuery, StdCtrls,
  Buttons, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh, Mask, ToolEdit;

type
  TBaseEditKoefUdWeightRefForm = class(TEditBaseForm)
    cbNPG: TComboBox;
    koefudweight: TEdit;
    lblBeginDate: TLabel;
    deBeginDate: TDateEdit;
    lblEndDate: TLabel;
    deEndDate: TDateEdit;
    lblkoef: TLabel;
    lblProduct: TLabel;
    qID: TFloatField;
    qNP_GROUP_ID: TFloatField;
    qDATE_FROM: TDateTimeField;
    qDATE_TO: TDateTimeField;
    qKOEF: TFloatField;
    qDATE_MOD: TDateTimeField;
    qINST: TFloatField;
  private
    { Private declarations }
  public
    procedure Init; override;
    procedure Save; override;
    procedure Test; override;
  end;

var
  BaseEditKoefUdWeightRefForm: TBaseEditKoefUdWeightRefForm;
const
  NP: array[0..4] of string = ('3', '5', '6', '7', '-28');

implementation

{$R *.dfm}

uses uDbFunc, ExFunc, uDbSaver, main;

procedure TBaseEditKoefUdWeightRefForm.Init;
var
  NpGName: string;
  i: integer;
begin
  inherited Init;
  // Поверки на: где был создан сменный отчет, дату закрытия и не редактируется ли он в этот момент
  bbOk.Enabled := (MAIN_ORG.INST = q.FieldByName('Inst').AsInteger) or (0 = q.FieldByName('Inst').AsInteger);
  if q.Active then
    q.Close;
  _OpenQueryPar(q, ['id', id, 'inst', inst]);
  case q.fieldbyname('np_group_id').AsInteger of
    3: NpGName := 'ДТ';
    5: NpGName := 'А-80';
    6: NpGName := 'А-92';
    7: NpGName := 'А-95';
    -28: NpGName := 'Фракция лёгкая';
    else
      NpGName := '';
  end;
  cbnpg.ItemIndex := cbnpg.Items.IndexOf(NpGName);
  deBeginDate.Date := q.fieldbyname('DATE_FROM').AsDateTime;
  deEndDate.Date := q.fieldbyname('DATE_TO').AsDateTime;
  koefudweight.text := floattostr(q.fieldbyname('KOEF').AsFloat);
  if koefudweight.text = '0' then
    koefudweight.text := '0.002';
end;

procedure TBaseEditKoefUdWeightRefForm.Save;
begin
  DBSaver.SaveRecord('OIL_KOEF_UD_WEIGHT',
    ['ID', q.FieldByName('id').Value,
    'INST', MAIN_ORG.INST,
      'NP_GROUP_ID', np[cbnpg.ItemIndex],
      'DATE_FROM', deBeginDate.Date,
      'DATE_TO', deEndDate.Date,
      'KOEF', koefudweight.Text,
      'STATE', 'Y']
      );
end;

procedure TBaseEditKoefUdWeightRefForm.Test;
begin
  inherited;
  if cbnpg.ItemIndex = -1 then
  begin
    cbnpg.SetFocus;
    raise Exception.CreateFmt('Не определено поле "%s"', [lblProduct.Caption]);
  end;
  if koefudweight.Text = '' then
  begin
    koefudweight.SetFocus;
    raise Exception.CreateFmt('Не определено поле "%s"', [lblkoef.Caption]);
  end;
end;

end.

