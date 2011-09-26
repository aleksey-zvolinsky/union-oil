unit CloseDate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TCloseDateForm = class(TCommonForm)
    deHere: TDateEdit;
    Panel1: TPanel;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    Label2: TLabel;
    deAlfa: TDateEdit;
    Label1: TLabel;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses Main,uDbFunc;
//==============================================================================
procedure TCloseDateForm.bbOkClick(Sender: TObject);
begin
  if (CUT_DATE<>'') and (deHere.Date<StrToDate(CUT_DATE)) then
     raise Exception.Create(TranslateText('Нельзя указывать дату меньшую, чем дата архивации, равная ')+CUT_DATE);
  if deHere.Date<deAlfa.Date then
    raise exception.create(TranslateText('Нельзя указывать дату, меньшую, чем дата закрытия периода Альфа-Нафтой'));
  close_date := FormatDateTime('dd.mm.yyyy', deHere.Date);
  _ExecSqlOra('update oil_var set value='''+close_date+''' where name=''CLOSE_DATE''');
  ModalResult:=mrOk;
end;
//==============================================================================
procedure TCloseDateForm.FormCreate(Sender: TObject);
begin
  inherited;
  if Close_Date<>'' then deHere.Date:=StrToDate(Close_Date);
  if Close_Date_Alfa<>'' then deAlfa.Date:=StrToDate(Close_Date_Alfa);
end;
//==============================================================================
end.
