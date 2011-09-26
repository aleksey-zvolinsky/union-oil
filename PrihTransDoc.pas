unit PrihTransDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCommonForm, Mask, ToolEdit, StdCtrls, Buttons, ExtCtrls,uOilQuery,Ora, uOilStoredProc;

type
  TPrihTransDocForm = class(TCommonForm)
    Panel1: TPanel;
    bbCancel: TBitBtn;
    Panel2: TPanel;
    Label12: TLabel;
    edUnderSigned: TEdit;
    Label13: TLabel;
    edDocuments: TEdit;
    Label15: TLabel;
    cePred: TComboEdit;
    Label1: TLabel;
    edActNum: TEdit;
    procedure cePredButtonClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PRED_ID,PRED_INST: Variant;
  end;

var
  PrihTransDocForm: TPrihTransDocForm;

implementation

{$R *.DFM}

uses ChooseOrg;
//==========================================================================
procedure TPrihTransDocForm.cePredButtonClick(Sender: TObject);
var
  vId,vInst:integer;
  vName:string;
begin
  if ChooseOrg.CaptureOrg(1,0,0,'yyy',vId,vInst,vName) then begin
    cePred.Text:=vName;
    PRED_ID:=vId;
    PRED_INST:=vInst;
  end;
end;
//==========================================================================
procedure TPrihTransDocForm.bbCancelClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;
//==========================================================================
end.
