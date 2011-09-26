unit RezMeasureRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, ActnList, Menus, DB, MemDS, DBAccess, Ora, uOilQuery,
  RXCtrls, GridsEh, DBGridEh, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  DBGridEhGrouping;

type
  TRezMeasureRefForm = class(TBaseForm)
    qID: TFloatField;
    qINST: TFloatField;
    qNUMB: TStringField;
    qOPER_ID: TFloatField;
    qOPER_NAME: TStringField;
    qUSER_ID: TFloatField;
    qEMP_ID: TFloatField;
    qEMP_INST: TFloatField;
    qF_NAME: TStringField;
    DBGridEh1: TDBGridEh;
    qDetailNUMB: TStringField;
    qDetailTEMPER: TFloatField;
    qDetailDENSITY: TFloatField;
    qDetailFUEL_QUANTITY: TFloatField;
    qDetailFUEL_WEIGHT: TFloatField;
    qDetailWATER_QUANTITY: TFloatField;
    qDetailWATER_WEIGHT: TFloatField;
    deBeginDate: TDateEdit;
    deEndDate: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    qDATE_ON: TDateTimeField;
    eNumb: TEdit;
    lblNumb: TLabel;
    procedure DBGrid1RowDetailPanelShow(Sender: TCustomDBGridEh;
      var CanShow: Boolean);
    procedure DBGrid1RowDetailPanelHide(Sender: TCustomDBGridEh;
      var CanHide: Boolean);
    procedure sbEditClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RezMeasureRefForm: TRezMeasureRefForm;

implementation

uses RezMeasureEdit, OilStd, UDbFunc;
{$R *.dfm}

procedure TRezMeasureRefForm.DBGrid1RowDetailPanelShow(
  Sender: TCustomDBGridEh; var CanShow: Boolean);
begin
  inherited;
  if not qDetail.Active then
    qDetail.Open;
end;

procedure TRezMeasureRefForm.DBGrid1RowDetailPanelHide(
  Sender: TCustomDBGridEh; var CanHide: Boolean);
begin
  inherited;
  if qDetail.Active then
    qDetail.Close;
end;

procedure TRezMeasureRefForm.sbEditClick(Sender: TObject);
begin
  inherited;
  if TRezMeasureEditForm.Edit(
    q.FieldByName('id').AsInteger, q.FieldByName('inst').AsInteger) then
    bbSearch.Click;
end;

procedure TRezMeasureRefForm.sbAddClick(Sender: TObject);
begin
  inherited;
  if TRezMeasureEditForm.Edit(0, 0) then
    bbSearch.Click;
end;

procedure TRezMeasureRefForm.sbDelClick(Sender: TObject);
begin
  inherited;
  TRezMeasureEditForm.TestDelete(
    q.FieldByName('id').AsInteger, q.FieldByName('inst').AsInteger);
  StartSql;
  _ExecSql(' update oil_rez_measure_det set state = ''N'' where head_id = :id and head_inst = :inst and state =''Y'' ',
    ['id', q.FieldByName('id').AsInteger,
     'inst',q.FieldByName('inst').AsInteger]);
  _ExecSql(' update oil_rez_measure set state = ''N'' where id = :id and inst = :inst and state =''Y'' ');
  CommitSql;
end;

procedure TRezMeasureRefForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  q.Close;
  _OpenQueryPar(q,
    ['begin_date', deBeginDate.Date,
     'end_date',   deEndDate.Date,
     'numb',       eNumb.Text]);
end;

procedure TRezMeasureRefForm.FormShow(Sender: TObject);
begin
  inherited;
  DBGrid1SortMarkingChanged(DBGrid1);
end;

initialization
  RegisterClass(TRezMeasureRefForm);

end.
