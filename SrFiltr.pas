unit SrFiltr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask, ToolEdit, uCommonForm, uOilQuery, Ora,
  uOilStoredProc;

type
  TSrFiltrForm = class(TCommonForm)
    Panel1: TPanel;
    ceNPGrp: TComboEdit;
    Label1: TLabel;
    sb1: TSpeedButton;
    rgTypePart: TRadioGroup;
    ePart: TEdit;
    lPart: TLabel;
    sb2: TSpeedButton;
    ceSop: TComboEdit;
    Label3: TLabel;
    sbPart: TSpeedButton;
    lName: TLabel;
    eName: TEdit;
    sbName: TSpeedButton;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    bbClear: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure sb1Click(Sender: TObject);
    procedure ceNPGrpButtonClick(Sender: TObject);
    procedure ceNPGrpKeyPress(Sender: TObject; var Key: Char);
    procedure ceSopButtonClick(Sender: TObject);
    procedure sb2Click(Sender: TObject);
    procedure sbPartClick(Sender: TObject);
    procedure sbNameClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
  private
  public
  end;

implementation

uses uXMLForm;

{$R *.DFM}

procedure TSrFiltrForm.FormCreate(Sender: TObject);
begin
  inherited;
  ceNPGrp.Tag := -1;
  ceSop.Tag := -1;
end;

procedure TSrFiltrForm.ceNPGrpButtonClick(Sender: TObject);
begin
  XMLChoose('NpGroupRef', ceNPGrp);
end;

procedure TSrFiltrForm.ceSopButtonClick(Sender: TObject);
begin
  XMLChoose('UssubGroupRef', ceSop);
end;

procedure TSrFiltrForm.ceNPGrpKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TSrFiltrForm.sb1Click(Sender: TObject);
begin
  ceNPGrp.Tag := -1;
  ceNPGrp.Text := '';
end;

procedure TSrFiltrForm.sb2Click(Sender: TObject);
begin
  ceSop.Tag := -1;
  ceSop.Text := '';
end;

procedure TSrFiltrForm.sbPartClick(Sender: TObject);
begin
  ePart.Text := '';
end;

procedure TSrFiltrForm.sbNameClick(Sender: TObject);
begin
  eName.Text := '';
end;

procedure TSrFiltrForm.bbClearClick(Sender: TObject);
begin
  sbNameClick(nil);
  sb1Click(nil);
  sb2Click(nil);
  sbPartClick(nil);
  rgTypePart.ItemIndex := 0;
end;

end.
