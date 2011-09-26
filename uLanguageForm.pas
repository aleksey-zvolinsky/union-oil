unit uLanguageForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCommonForm, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBGridEh,
  RXDBCtrl,uOilQuery,Ora, uOilStoredProc;

type
  TLanguageForm = class(TCommonForm)
    cbInterfaceLang: TComboBox;
    cbReportsLang: TComboBox;
    lbIntfLang: TLabel;
    lbRepLang: TLabel;
    Label1: TLabel;
    bbOk: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure cbReportsLangChange(Sender: TObject);
    procedure cbInterfaceLangChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

var
  LanguageForm: TLanguageForm;

implementation

uses Main, ExFunc;

{$R *.DFM}

procedure TLanguageForm.FormCreate(Sender: TObject);
var
  Lang: String;
begin
  inherited;
  cbReportsLang.ItemIndex := LANGUAGE;
  try
    Lang := ReadPieceOfRegistry(HKEY_CURRENT_USER,'Software\Oil','Language');
    if Lang <> ''
      then cbInterfaceLang.ItemIndex := StrToInt(Lang)
      else cbInterfaceLang.ItemIndex := 0;
  except
    cbInterfaceLang.ItemIndex := 0;
  end;
end;

procedure TLanguageForm.cbReportsLangChange(Sender: TObject);
begin
  inherited;
  if cbReportsLang.ItemIndex >= 0  then
    InitLanguage(cbReportsLang.ItemIndex);
end;

procedure TLanguageForm.cbInterfaceLangChange(Sender: TObject);
begin
  inherited;
  if cbInterfaceLang.ItemIndex >= 0  then
    InitInterfaceLanguage(cbInterfaceLang.ItemIndex);
end;

procedure TLanguageForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
