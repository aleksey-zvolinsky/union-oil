unit E_Options;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, ExtCtrls, ComCtrls, E_Var, ChooseOrg, Buttons,
  Db, DBTables, RxLookup, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TE_OptionsForm = class(TCommonForm)
    PageControl1: TPageControl;
    Panel2: TPanel;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    cbImpLog: TCheckBox;
    edImpLogFile: TEdit;
    cb_I1C_TestRecordExists: TCheckBox;
    cb_I1C_WITHNDS: TCheckBox;
    cb_I1C_ANALIZEORGNAME: TCheckBox;
    cb_I1C_ReplaceOrgName: TCheckBox;
    cb_I1C_AddFirmaAuto: TCheckBox;
    cb_I1C_SearchST: TCheckBox;
    cb_I1C_SearchNB: TCheckBox;
    procedure bbOkClick(Sender: TObject);
    procedure LoadValues;
    procedure ApplyChanges;
  private
  public
  end;

var
  E_OptionsForm: TE_OptionsForm;

procedure ShowOptions(Page:integer);

implementation

{$R *.DFM}

uses UDbFunc, ListSelect, ExFunc, E_CurRate;

//==============================================================================
procedure TE_OptionsForm.LoadValues;
begin
  cb_I1C_TestRecordExists.Checked := E_I1C_TESTRECORDEXISTS;
  cb_I1C_WITHNDS.Checked := E_I1C_WITHNDS;
  cb_I1C_AnalizeOrgName.Checked := E_I1C_ANALIZEORGNAME;
  cb_I1C_ReplaceOrgName.Checked := E_I1C_REPLACEORGNAME;
  cb_I1C_SearchST.Checked := E_I1C_SEARCHST;
  cb_I1C_SearchNB.Checked := E_I1C_SEARCHNB;
end;
//==============================================================================
procedure ShowOptions(Page: integer);
var
  F: TE_OptionsForm;
begin
  Application.CreateForm(TE_OptionsForm, F);
  if Page >= F.PageControl1.PageCount then Page := 0;
  F.PageControl1.ActivePage := F.PageControl1.Pages[Page];
  F.LoadValues;
  F.ShowModal;
  F.Free;
end;
//==============================================================================
procedure TE_OptionsForm.ApplyChanges;
begin
  E_I1C_TESTRECORDEXISTS := cb_I1C_TestRecordExists.Checked;
  E_I1C_WITHNDS := cb_I1C_WITHNDS.Checked;
  E_I1C_ANALIZEORGNAME := cb_I1C_AnalizeOrgName.Checked;
  E_I1C_REPLACEORGNAME := cb_I1C_ReplaceOrgName.Checked;
  E_I1C_ADDFIRMAAUTO := cb_I1C_AddFirmaAuto.Checked;
  E_I1C_SEARCHST := cb_I1C_SearchST.Checked;
  E_I1C_SEARCHNB := cb_I1C_SearchNB.Checked;
end;
//==============================================================================
procedure TE_OptionsForm.bbOkClick(Sender: TObject);
begin
  ApplyChanges;
  if MessageDlg(TranslateText('Сохранить опции?'), mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    E_SaveVar;
  ModalResult := mrOk;
end;
//==============================================================================

end.
