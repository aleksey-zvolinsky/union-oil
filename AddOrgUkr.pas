unit AddOrgUkr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCommonForm, StdCtrls, Buttons, ExtCtrls, ComCtrls,uOilQuery,Ora, uOilStoredProc;

type
  TAddOrgUkrForm = class(TCommonForm)
    Panel6: TPanel;
    bbOk: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label20: TLabel;
    edRealAddrUkr: TEdit;
    edFullNameUkr: TEdit;
    Label10: TLabel;
    Label22: TLabel;
    edDogovorUkr: TEdit;
    Label12: TLabel;
    edThroughUkr: TEdit;
    Label3: TLabel;
    edAktSverkiUkr: TEdit;
    Label4: TLabel;
    edFullName: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    edDogovor: TEdit;
    Label6: TLabel;
    edThrough: TEdit;
    Label2: TLabel;
    edAktSverki: TEdit;
    edRealAddr: TEdit;
    ePost: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    ePostUkr: TEdit;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  AddOrgUkrForm: TAddOrgUkrForm;

implementation

Uses Main;

{$R *.DFM}

procedure TAddOrgUkrForm.FormCreate(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := LANGUAGE;
end;

end.
