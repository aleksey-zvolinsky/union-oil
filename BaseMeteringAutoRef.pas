unit BaseMeteringAutoRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, DBGridEhGrouping, ActnList, Menus, DB, MemDS, DBAccess,
  Ora, uOilQuery, RXCtrls, GridsEh, DBGridEh, ExtCtrls, StdCtrls, Buttons,
  Mask, DBCtrlsEh, VirtualTable;

type
  TBaseMeteringAutoRefForm = class(TBaseForm)
    dteDate: TDBDateTimeEditEh;
    lblDate: TLabel;
    GridChoose: TDBGridEh;
    vt: TVirtualTable;
    dsIn: TOraDataSource;
    procedure bbSearchClick(Sender: TObject);
    procedure dteDateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1RowDetailPanelShow(Sender: TCustomDBGridEh;
      var CanShow: Boolean);
    procedure GridChooseGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GridChooseDblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    FInit: boolean;
  public
    { Public declarations }
  end;

var
  BaseMeteringAutoRefForm: TBaseMeteringAutoRefForm;

implementation

uses UDbFunc;

{$R *.dfm}

procedure TBaseMeteringAutoRefForm.bbSearchClick(Sender: TObject);
begin
  if not FInit and (dteDate.Value <> null)then
  begin
  //  inherited;
    DefineRepDates(dteDate.Value-3, dteDate.Value);
    q.Close;
    q.ParamByName('date_').AsDate := trunc(dteDate.Value);
    q.ParamByName('datetime').AsDateTime := dteDate.Value;
    q.Open;
    vt.Assign(q);
    vt.Open;
    vt.First;
    // Оставляем начальный выбор
    while not vt.Eof do
    begin
      if not((vt.FieldByName('rn').AsInteger = 1) and (vt.FieldByName('diff_datetime').AsInteger = 1))then
        vt.Delete
      else
        vt.Next;
    end;
  end;
end;

procedure TBaseMeteringAutoRefForm.dteDateChange(
  Sender: TObject);
begin
  inherited;
  bbSearch.Click;
end;

procedure TBaseMeteringAutoRefForm.FormCreate(Sender: TObject);
begin
  FInit := True;
  try
    inherited;
    dteDate.Value := Date()+1/24*10;
  finally
    FInit := False;
  end;
end;

procedure TBaseMeteringAutoRefForm.DBGrid1RowDetailPanelShow(
  Sender: TCustomDBGridEh; var CanShow: Boolean);
begin
  inherited;
  q.Filtered := False;

  q.Filter := format('oil_id=%d and oil_inst=%d', [
    vt.FieldByName('oil_id').AsInteger,
    vt.FieldByName('oil_inst').AsInteger]);
  q.Filtered := True;
  q.LocateEx('is_checked', 1, []);
end;

procedure TBaseMeteringAutoRefForm.GridChooseGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if q.FieldByName('is_checked').AsInteger = 1 then
    Background := $00FFE3AA;
end;

procedure TBaseMeteringAutoRefForm.GridChooseDblClick(Sender: TObject);
var
  CurRecNo: integer;
begin
  inherited;
  q.Edit;
  q.FieldByName('is_checked').AsInteger := 1;
  q.Post;
  CurRecNo := q.RecNo;
  q.DisableControls;
  try
    q.First;
    while not q.Eof do
    begin
      if (q.FieldByName('is_checked').AsInteger = 1) and (CurRecNo <> q.RecNo) then
      begin
        q.Edit;
        q.FieldByName('is_checked').AsInteger := 0;
        q.Post;
      end;
      q.Next;
    end;
  finally
    q.RecNo := CurRecNo;
    q.EnableControls;
  end;
  vt.Edit;
  vt.FieldValues['datetime;litr;weight'] := q.FieldValues['datetime;litr;weight'];
  vt.Post;
  DBGrid1.RowDetailPanel.Visible := False;
end;

procedure TBaseMeteringAutoRefForm.DBGrid1DblClick(Sender: TObject);
begin
  DBGrid1.RowDetailPanel.Visible := True;
end;

end.
