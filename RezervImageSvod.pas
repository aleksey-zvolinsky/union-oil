unit RezervImageSvod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MemDS, VirtualTable, DB, ADODB, PrnDbgeh, GridsEh, DBGridEh,
  StdCtrls, Mask, ToolEdit;

type
  TRezervImageSvodForm = class(TForm)
    DBGridEh1: TDBGridEh;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    VirtualTable1: TVirtualTable;
    deBeginDate: TDateEdit;
    lblBeginDate: TLabel;
    lblEndDate: TLabel;
    deEndDate: TDateEdit;
  private
  public
  end;

var
  RezervImageSvodForm: TRezervImageSvodForm;

implementation

{$R *.dfm}

end.
