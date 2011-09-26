unit AzsFault;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ToolEdit, Db, Mask, DBCtrlsEh, DBLookupEh, DBTables, Buttons,
  ExtCtrls, uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess;

type
  TAzsFaultForm = class(TCommonForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    xdeBegin: TDateEdit;
    xdeEnd: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblAZS: TLabel;
    edtComment: TEdit;
    Label4: TLabel;
    cmeAZS: TComboEdit;
    SP: TOilStoredProc;
    Label5: TLabel;
    edtRespondent: TEdit;
    procedure cmeAZSButtonClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure xdeEndAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure edtCommentChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AzsFaultForm: TAzsFaultForm;

implementation

uses Main, ChooseOrg, uDBFunc, OilStd;

{$R *.DFM}

procedure TAzsFaultForm.cmeAZSButtonClick(Sender: TObject);
  var vId, vInst: Integer;
      vName: String;
begin
if ChooseOrg.CaptureOrg(2, MAIN_ID, INST, 'nnn', vId, vInst, vName) then
  begin
    cmeAZS.Tag := vId;
    cmeAZS.Text := vName;
  end;
end;

procedure TAzsFaultForm.bbOkClick(Sender: TObject);
  Var Res, S : String;
begin
  if cmeAZS.Text = '' then
     Begin
       ShowMessage(TranslateText('Выберите АЗС!'));
       Exit;
     End;

  if edtComment.Text = '' then
     Begin
       ShowMessage(TranslateText('Введите причину сбоя в поле "Описание" !'));
       Exit;
     End;

  if edtRespondent.Text = '' then
     Begin
       ShowMessage(TranslateText('Введите свою фамилию !'));
       Exit;
     End;

  S := edtRespondent.Text;
  if (Length(S) <3) or
     (ANSIUpperCase(Copy(S,1,1))<> Copy(S,1,1)) or
     (Pos('1',S)+Pos('2',S)+Pos('3',S)+Pos('4',S)+Pos('5',S)+Pos('6',S)+
      Pos('7',S)+Pos('8',S)+Pos('9',S)+Pos('0',S)<>0)
  then Begin
       ShowMessage(TranslateText('Неправильно введена фамилия !'));
       Exit;
  End;

  if xdeBegin.Date > xdeEnd.Date then
     Begin
       ShowMessage(TranslateText('Начальная дата не должна быть больше конечной !'));
       Exit;
     End;

  If cmeAZS.Enabled Then Res := TranslateText('ДОБАВИТЬ')
                    Else Res := TranslateText('ИЗМЕНИТЬ');
  If MessageDlg(TranslateText('Вы уверены, что хотите ')+Res+TranslateText(' запись ?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    Try
      With SP Do
      Begin
        StartSQL;
        StoredProcName := 'OIL.INSORUPDOIL_DR_SUMMARY';
        Prepare;
        // Если запись редактируется - то ее удалить и вставить новую
        // для того, чтобы можно было посмотреть историю. Каламбурчик
        if not cmeAZS.Enabled
           then _ExecSQL('update OIL_DR_SUMMARY set state=''N'' where id='+
                          IntToStr(lblAZS.Tag)+' and inst='+IntToStr(INST));
        ParamByName('ID#').AsInteger := GetSeqNextVal('S_OIL_DR_SUMMARY');
        ParamByName('INST#').AsInteger := INST;
        ParamByName('STATE#').AsString   := 'Y';
        ParamByName('AZS_ID#').AsInteger := cmeAZS.Tag;
        ParamByName('REP_ID#').Clear;
        ParamByName('REP_INST#').Clear;
        ParamByName('BEGIN_DATE#').AsDate := xdeBegin.Date;
        ParamByName('END_DATE#').AsDate := xdeEnd.Date;
        ParamByName('COMMENT_#').AsString := edtComment.Text;
        ParamByName('RESPONDENT#').AsString := edtRespondent.Text;
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

procedure TAzsFaultForm.xdeEndAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  if xdeBegin.Date < xdeEnd.Date then xdeEnd.Date := xdeBegin.Date;
end;

procedure TAzsFaultForm.edtCommentChange(Sender: TObject);
begin
  if Length(edtComment.Text)>250  then edtComment.Text := Copy(edtComment.text,1,250);
end;

end.
