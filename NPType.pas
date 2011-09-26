unit NPType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask, ToolEdit, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TNPTypeForm = class(TCommonForm)
    Panel2: TPanel;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edName: TEdit;
    edShort_Name: TEdit;
    SP: TOilStoredProc;
    Label3: TLabel;
    edNPGroup: TComboEdit;
    procedure bbOkClick(Sender: TObject);
    procedure edNPGroupButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private                  
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NPTypeForm: TNPTypeForm;

implementation

Uses Main, OilStd, NPGroupRef, ExFunc, UDbFunc;

{$R *.DFM}

procedure TNPTypeForm.bbOkClick(Sender: TObject);
Var
  Res : String;
  vId: integer;
begin
  If edName.Tag = 0 Then Res := TranslateText('ƒŒ¡¿¬»“‹')
                    Else Res := TranslateText('»«Ã≈Õ»“‹');
  If MessageDlg(TranslateText('¬˚ Û‚ÂÂÌ˚ ˜ÚÓ ıÓÚËÚÂ ')+Res+TranslateText(' “»œ Õ≈‘“≈œ–Œƒ” “¿ ?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    Try
      With SP Do
      Begin
        vId:=decode([edName.Tag,0,GetSeqNextVal('S_OIL_NP_TYPE')]);
        StoredProcName := 'OIL.INSORUPDOIL_NP_TYPE';
        Prepare;
        ParamByName('ID#').AsInteger     := vId;
        ParamByName('STATE#').AsString   := 'Y';
        ParamByName('NAME#').AsString    := edName.Text;
        ParamByName('SHORT_NAME#').AsString   := edShort_Name.Text;
        ParamByName('GRP_ID#').AsInteger := edNPGroup.Tag;
        ExecProc;
        Res:=ParamByName('Result').AsString;
        If Length(Res)>0 Then
          If Res[1]<>'0' Then
            Raise Exception.Create(SubStr(Res,2));
        CommitSQL;
        Close;
        ModalResult := mrOk;
      End;
    Except On E:Exception Do
      MessageDlg(TranslateText('Œ¯Ë·Í‡ : ')+E.message,mtError,[mbOk],0);
    End;
  End;
end;

procedure TNPTypeForm.edNPGroupButtonClick(Sender: TObject);
Var
  NPGroupRefForm : TNPGroupRefForm;
begin
  Application.CreateForm(TNPGroupRefForm, NPGroupRefForm);
  NPGroupRefForm.ShowModal;
  If NPGroupRefForm.ModalResult = mrOk Then
  Begin
    edNPGroup.Text := NPGroupRefForm.qName.AsString;
    edNPGroup.Tag  := NPGroupRefForm.qId.AsInteger;
  End;
  NPGroupRefForm.Free;
end;

procedure TNPTypeForm.FormShow(Sender: TObject);
begin
  If edName.Tag = 0 Then
  Begin
    edName.Clear;
    edNPGroup.Clear;
    edShort_Name.Clear;
  End;
end;

end.
