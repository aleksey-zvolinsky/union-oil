unit E_Permit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  EditBase, CurrEdit, StdCtrls, Buttons, Mask, ToolEdit, Db, MemDS,
  DBAccess, Ora, uOilQuery, ExtCtrls, uCommonForm;

type
  TE_PermitForm = class(TEditBaseForm)
    Label2: TLabel;
    DDatePirmit: TDateEdit;
    sb1: TSpeedButton;
    Label1: TLabel;
    EPirmit: TEdit;
    sb2: TSpeedButton;
    sb3: TSpeedButton;
    EComments: TEdit;
    rcSumm: TRxCalcEdit;
    Label5: TLabel;
    Label3: TLabel;
    procedure Init; override;
    procedure Test; override;
    procedure Save; override;
    procedure sb1Click(Sender: TObject);
    procedure sb2Click(Sender: TObject);
    procedure sb3Click(Sender: TObject);
  private
  public
  end;

var
  E_PermitForm: TE_PermitForm;

implementation

uses Main, UDbFunc, ChooseOrg, ExFunc, MoneyFunc, OilStd, E_BillRef, E_Var, uStart,
  EmpRef;

{$R *.DFM}

//==============================================================================
procedure TE_PermitForm.Init;
begin
  inherited;
  if ID = 0 then
  begin
    EPirmit.Text := '';
    DDatePirmit.Date := 0;
    rcSumm.Value := 0;
    EComments.Text := '';
  end
  else
  begin
    FillControls(q,
      [EPirmit, DDatePirmit, EComments],
      ['NAME', 'DATE_', 'COMMENTS']);
    rcSumm.Value := q['SUMM'];
  end;
end;
//==============================================================================
procedure TE_PermitForm.Save;
begin
  StartSQLOra;
  try
    DBSaver.SaveRecord('E_PERMIT',
      ['ID',            ID,
       'STATE',         'Y',
       'INST',          INST,
       'DATE_',         DDatePirmit.Text,
       'NAME',          EPirmit.Text,
       'SUMM',          rcSumm.Value,
       'COMMENTS',      EComments.Text
      ]);
    CommitSQLOra;
  except on E: Exception do
    begin
      RollBackSQLOra;
      if pos(#10, E.Message) > 0 then
        MessageDlg(copy(E.Message, 0, pos(#10, E.Message)), mtWarning, [mbOk], 0)
      else
        MessageDlg(E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;
//==============================================================================
procedure TE_PermitForm.Test;
begin
  if DDatePirmit.Date = 0 then
    raise exception.create(TranslateText('Не введена дата!'));
  if EPirmit.Text = '' then
    raise exception.create(TranslateText('Не введен текст разрешения!'));
  if rcSumm.Value <= 0 then
    raise exception.create(TranslateText('Сумма должна быть больше нуля!'));
end;
//==============================================================================
procedure TE_PermitForm.sb1Click(Sender: TObject);
begin
  DDatePirmit.Date := 0;
end;
//==============================================================================
procedure TE_PermitForm.sb2Click(Sender: TObject);
begin
  EPirmit.Text := '';
end;
//==============================================================================
procedure TE_PermitForm.sb3Click(Sender: TObject);
begin
  EComments.Text := '';
end;
//==============================================================================

end.
