unit RezervRefNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, ActnList, Menus, DB, MemDS, DBAccess, Ora, uOilQuery,
  RXCtrls, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  GridsEh;

type
  TRezervRefNewForm = class(TBaseForm)
    edNPGroup: TComboEdit;
    lblNpGroup: TLabel;
    sbClearGrp: TSpeedButton;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure edNPGroupButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbClearGrpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RezervRefNewForm: TRezervRefNewForm;

implementation

uses RezervImage, uXMLForm;

{$R *.dfm}

procedure TRezervRefNewForm.DBGrid1DblClick(Sender: TObject);
begin
  //inherited;
  RezervImageForm := TRezervImageForm.Create(Self);
  try
//    RezervImageForm.AzsId := 1001866;
    RezervImageForm.deBeginDate.Date := StrToDate('02.01.2010');
    RezervImageForm.UseAzsChoose := False;
    RezervImageForm.BaseId := 624;        
    RezervImageForm.TankNumber := q.FieldByName('numb').AsString;
    RezervImageForm.ShowModal;
  finally
    RezervImageForm.Free;
  end;
end;

procedure TRezervRefNewForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  q.Close;
  q.ParamByName('azs_id').AsInteger := 1001866;
  q.ParamByName('begin_date').AsDateTime := StrToDate('02.01.2010');
  q.ParamByName('end_date').AsDateTime := StrToDate('02.01.2010');
  if edNPGroup.Text <> '' then
    q.ParamByName('fuel_id').AsInteger := edNPGroup.Tag
  else
    q.ParamByName('fuel_id').AsInteger := 0;
  q.Open;
end;

procedure TRezervRefNewForm.edNPGroupButtonClick(Sender: TObject);
begin
  inherited;
  XMLChoose('npgroupref', edNPGroup);
  bbSearch.Click;
end;

procedure TRezervRefNewForm.FormShow(Sender: TObject);
begin
  inherited;
  bbSearch.Click;
end;

procedure TRezervRefNewForm.sbClearGrpClick(Sender: TObject);
begin
  inherited;
  edNPGroup.Tag := 0;
  edNPGroup.Text := '';
  bbSearch.Click;
end;

end.
