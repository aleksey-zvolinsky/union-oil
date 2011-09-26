unit AddOrgDop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, ExtCtrls, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TAddOrgDopForm = class(TCommonForm)
    p1: TPanel;
    bbOk: TBitBtn;
    GroupBox1: TGroupBox;
    l2: TLabel;
    clcDebDays: TRxCalcEdit;
    l10: TLabel;
    clcDebSumm: TRxCalcEdit;
    gbWebService: TGroupBox;
    eMail: TEdit;
    ePass: TEdit;
    LblMail: TLabel;
    LblPass: TLabel;
    GroupBox2: TGroupBox;
    eBOSS: TEdit;
    l3: TLabel;
    l5: TLabel;
    eBOSS_TEL_W: TEdit;
    eBOSS_TEL_H: TEdit;
    l6: TLabel;
    GroupBox3: TGroupBox;
    eGBUH_TEL_W: TEdit;
    eGBUH_TEL_H: TEdit;
    l8: TLabel;
    l7: TLabel;
    eGBUH: TEdit;
    l4: TLabel;
    GroupBox4: TGroupBox;
    ePERSON: TEdit;
    l11: TLabel;
    l1: TLabel;
    eICQ: TEdit;
    l12: TLabel;
    ePERSON_TEL_H: TEdit;
    eMailMan: TEdit;
    l9: TLabel;
    eWEBSITE: TEdit;
    l13: TLabel;
    gbShrotName: TGroupBox;
    LblShortName: TLabel;
    eShortName: TMaskEdit;
  private
  public
  end;

var
  AddOrgDopForm: TAddOrgDopForm;

implementation

{$R *.DFM}

end.
