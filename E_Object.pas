unit E_Object;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  EditBase, Buttons, Mask, ToolEdit, StdCtrls, Db, MemDS, DBAccess, Ora,
  uOilQuery, ExtCtrls, uCommonForm;

type
  TE_ObjectForm = class(TEditBaseForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EComments: TEdit;
    DBegin: TDateEdit;
    sb2: TSpeedButton;
    EObject: TEdit;
    sb1: TSpeedButton;
    sb3: TSpeedButton;
    procedure Init; override;
    procedure Test; override;
    procedure Save; override;
    procedure sb1Click(Sender: TObject);
    procedure sb3Click(Sender: TObject);
    procedure sb2Click(Sender: TObject);
  private
  public
  end;

var
  E_ObjectForm: TE_ObjectForm;

implementation

{$R *.DFM}

uses Main, UDbFunc, ChooseOrg, ExFunc, MoneyFunc, OilStd, E_BillRef, E_Var, uStart,
  EmpRef;

//==============================================================================
procedure TE_ObjectForm.Init;
begin
  inherited;
  if ID = 0 then
  begin
    EObject.Text := '';
    DBegin.Date := 0;
    EComments.Text := '';
  end
  else
  begin
    FillControls(q,
      [EObject, DBegin, EComments],
      ['NAME', 'DATE_', 'COMMENTS']);
  end;
end;
//==============================================================================
procedure TE_ObjectForm.Save;
begin
  StartSQLOra;
  try
    DBSaver.SaveRecord('E_OBJECT',
      ['ID',            ID,
       'STATE',         'Y',
       'INST',          INST,
       'DATE_',         DBegin.Text,
       'NAME',          EObject.Text,
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
procedure TE_ObjectForm.Test;
begin
  if EObject.Text = '' then
    raise exception.create(TranslateText('Не введен объект!'));
  if DBegin.Date = 0 then
    raise exception.create(TranslateText('Не введена дата ввода в эксплуатацию!'));
end;
//==============================================================================
procedure TE_ObjectForm.sb1Click(Sender: TObject);
begin
  EObject.Text := '';
end;
//==============================================================================
procedure TE_ObjectForm.sb3Click(Sender: TObject);
begin
  EComments.Text := '';
end;
//==============================================================================
procedure TE_ObjectForm.sb2Click(Sender: TObject);
begin
  DBegin.Date := 0;
end;
//==============================================================================

end.
