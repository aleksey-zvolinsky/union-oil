unit PrihCardView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, Grids, DBGridEh, ExtCtrls, Menus,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess;

type
  TPrihCardViewForm = class(TCommonForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    DBGridEh: TDBGridEh;
    ds: TOraDataSource;
    qCTRest: TOilQuery;
    pnlBtn: TPanel;
    bbCancel: TBitBtn;
    bbSearch: TBitBtn;
    qCTRestCAUSE_NAME: TStringField;
    qCTRestOPER_DATE: TDateTimeField;
    qCTRestTO_ID: TFloatField;
    qCTRestTO_INST: TFloatField;
    qCTRestNAME: TStringField;
    qCTRestLITR: TFloatField;
    qCTRestCARD_REST: TFloatField;
    qCTRestID_RECEIPTS: TFloatField;
    qCTRestREC_LITR: TFloatField;
    qCTRestR_OPER_DATE: TDateTimeField;
    qCTRestR_DOC_NUMBER: TStringField;
    qCTRestR_DOC_DATE: TDateTimeField;
    Label1: TLabel;
    edtCard: TEdit;
    edtNp: TEdit;
    sbSum: TSpeedButton;
    qCTRestDOC_DATE: TDateTimeField;
    qCTRestDOC_NUMBER: TStringField;
    qCTRestAUTO_ID: TFloatField;
    qCTRestAUTO_INST: TFloatField;
    qCTRestEMPLOY_ID: TFloatField;
    qCTRestEMPLOY_INST: TFloatField;
    btnRecalc: TBitBtn;
    PopupMenu: TPopupMenu;
    miPtintGrid: TMenuItem;
    procedure bbSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbSumClick(Sender: TObject);
    procedure btnRecalcClick(Sender: TObject);
    procedure miPtintGridClick(Sender: TObject);
  private
    { Private declarations }
  public
    FCardNumber : Integer;
    FNpType : Integer;
    FToId, FToInst : Integer;
    FCardScheme: Integer;
  end;

var
  PrihCardViewForm: TPrihCardViewForm;

implementation

uses PrihCardRef, ExcelFunc;

{$R *.DFM}

procedure TPrihCardViewForm.bbSearchClick(Sender: TObject);
begin
  with qCTRest do
  begin
    Close;
    ParamByName('CardNumber').AsInteger := FCardNumber;
    ParamByName('NpType').AsInteger := FNpType;
    Open;
  end;
end;

procedure TPrihCardViewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TPrihCardViewForm.bbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TPrihCardViewForm.FormCreate(Sender: TObject);
begin
  inherited;
  bbSearchClick(nil);
end;

procedure TPrihCardViewForm.sbSumClick(Sender: TObject);
begin
  if sbSum.Down
    then DBGridEh.FooterRowCount := 1
    else DBGridEh.FooterRowCount := 0;
end;
procedure TPrihCardViewForm.btnRecalcClick(Sender: TObject);
begin
   RecalcByCard(FCardNumber, FCardScheme-1, FToId, FToInst);
   bbSearch.Click;
end;

procedure TPrihCardViewForm.miPtintGridClick(Sender: TObject);
begin
  DBGridEh.DataSource.DataSet.DisableControls;
  PutGridEhToExcel(DBGridEh, TranslateText('Результат пересчета карты ')+
    edtCard.Text +TranslateText(' тип НП ')+ edtNp.Text);
  DBGridEh.DataSource.DataSet.EnableControls;
end;

end.
