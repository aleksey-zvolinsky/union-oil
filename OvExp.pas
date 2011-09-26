unit OvExp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, ToolEdit, StdCtrls, Mask, ExtCtrls, Buttons, Db, DBTables,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess;

type
  TOvExpForm = class(TCommonForm)
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    lPart: TLabel;
    Label8: TLabel;
    Label23: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    lDate: TLabel;
    Bevel2: TBevel;
    Bevel6: TBevel;
    edPart: TComboEdit;
    edDog: TEdit;
    edNP_Type: TEdit;
    edDogDate: TDateEdit;
    edDate: TDateEdit;
    edType: TComboEdit;
    Label26: TLabel;
    edComm: TEdit;
    Label19: TLabel;
    edSumm: TRxCalcEdit;
    Bevel1: TBevel;
    SP: TOilStoredProc;
    procedure edPartButtonClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure edTypeButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OvExpForm: TOvExpForm;

implementation

uses Main, PartRef, OILStd, uDBFunc, OvExpTypeRef;

{$R *.DFM}

procedure TOvExpForm.edPartButtonClick(Sender: TObject);
Var
  PartRefForm : TPartRefForm;
begin
  Application.CreateForm(TPartRefForm, PartRefForm);
  PartRefForm.ShowModal;
  If PartRefForm.ModalResult = mrOk Then
  Begin
    edPart.Text       := PartRefForm.qId.AsString;
    edPart.Tag        := PartRefForm.qId.AsInteger;
    lPart.Tag         := PartRefForm.qInst.AsInteger;
    edDog.Text        := PartRefForm.qDog.AsString;
    edDogDate.Date    := PartRefForm.qDog_Date.AsDateTime;
    edNP_Type.Text    := PartRefForm.qNP_Type_Name.AsString;
    edNP_Type.Tag     := PartRefForm.qNP_Type.AsInteger;
    PartRefForm.Free;
  End;
end;

procedure TOvExpForm.bbOkClick(Sender: TObject);
  Var Res : String;
begin
  if edDate.Text = '' then
     Begin
       ShowMessage(TranslateText('Введите дату накл. расхода!'));
       Exit;
     End;

  if edType.Text = '' then
     Begin
       ShowMessage(TranslateText('Выберите тип накл. расхода!'));
       Exit;
     End;

  if edPart.Text = '' then
     Begin
       ShowMessage(TranslateText('Выберите партию !'));
       Exit;
     End;

  if edSumm.Value = 0 then
     Begin
       ShowMessage(TranslateText('Нулевая сумма не допускается!'));
       Exit;
     End;

  If lDate.Tag = 0 Then Res := TranslateText('ДОБАВИТЬ')
                   Else Res := TranslateText('ИЗМЕНИТЬ');
  If MessageDlg(TranslateText('Вы уверены, что хотите ')+Res+TranslateText(' запись ?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    Try
      With SP Do
      Begin
        StartSQL;
        StoredProcName := 'OIL.INSORUPDOIL_OVERHEAD_EXPENCES';
        Prepare;
        if lDate.Tag = 0
           then ParamByName('ID#').AsInteger := GetSeqNextVal('S_OIL_OVERHEAD_EXPENCES')
           else ParamByName('ID#').AsInteger := lDate.Tag;
        ParamByName('INST#').AsInteger := INST;
        ParamByName('STATE#').AsString   := 'Y';
        ParamByName('DATE_#').AsDateTime := edDate.Date;
        ParamByName('PART_ID#').AsInteger:= edPart.Tag;
        ParamByName('PART_INST#').AsInteger := lPart.Tag;
        ParamByName('OV_EXP_TYPE#').AsInteger := edType.Tag;
        ParamByName('SUMM#').AsFloat := edSumm.Value;
        ParamByName('COMMENT_#').AsString := edComm.Text;
        ParamByName('REAL_EXP#').AsString := 'Y';
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
      MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
    End;
  End;
end;

procedure TOvExpForm.edTypeButtonClick(Sender: TObject);
Var
  OvExpTypeRefForm : TOvExpTypeRefForm;
begin
  Application.CreateForm(TOvExpTypeRefForm, OvExpTypeRefForm);
  OvExpTypeRefForm.ShowModal;
  If OvExpTypeRefForm.ModalResult = mrOk Then
  Begin
    edType.Text := OvExpTypeRefForm.qName.AsString;
    edType.Tag  := OvExpTypeRefForm.qId.AsInteger;
  End;
  OvExpTypeRefForm.Free;
end;

end.
