unit Emp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls, Db, DBTables, DBCtrls, RXDBCtrl,
  uCommonForm, uOilQuery, Ora, uOilStoredProc, MemDS, DBAccess
  {$IFDEF VER150},Variants{$ENDIF};

type
  TEmpForm = class(TCommonForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    lOrg: TLabel;
    bClearOrg: TSpeedButton;
    eName: TDBEdit;
    eSecName: TDBEdit;
    eSurName: TDBEdit;
    cbSex: TDBComboBox;
    Label14: TLabel;
    DBEdit4: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    dbceOrg: TRxDBComboEdit;
    qCheckEmploy: TOilQuery;
    procedure bClearOrgClick(Sender: TObject);
    procedure dbceOrgButtonClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
  private
  public
  end;

var
  EmpForm: TEmpForm;

implementation

uses Main, OilStd, ChooseOrg, EmpRef;

{$R *.DFM}

procedure TEmpForm.bClearOrgClick(Sender: TObject);
begin
  dbceOrg.DataSource.DataSet.FieldByName('Org_Id').AsVariant := null;
  dbceOrg.DataSource.DataSet.FieldByName('Org_Inst').AsVariant := null;
  dbceOrg.Clear;
end;

procedure TEmpForm.dbceOrgButtonClick(Sender: TObject);
var
  vId, vInst: Integer;
  vName: string;
begin
  if dbceOrg.DataSource.DataSet.State <> dsBrowse then dbceOrg.DataSource.DataSet.Edit;
  if ChooseOrg.CaptureOrg(1, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
  begin
    dbceOrg.DataSource.DataSet.FieldByName('Org_Id').AsInteger := vId;
    dbceOrg.DataSource.DataSet.FieldByName('Org_Inst').AsInteger := vInst;
    dbceOrg.Text := vName;
  end;
end;

procedure TEmpForm.bbOkClick(Sender: TObject);
begin
  if eSurName.Text = '' then raise Exception.Create(TranslateText('Отсутствует Фамилия !'));
  if eName.Text = '' then raise Exception.Create(TranslateText('Отсутствует Имя !'));
  if eSecName.Text = '' then raise Exception.Create(TranslateText('Отсутствует Отчество !'));
  if cbSex.Text = '' then raise Exception.Create(TranslateText('Отсутствует Пол !'));

  qCheckEmploy.Close;
  qCheckEmploy.ParamByName('Id').Value := qCheckEmploy.DataSource.DataSet.FieldByName('Id').Value;
  qCheckEmploy.ParamByName('Inst').Value := qCheckEmploy.DataSource.DataSet.FieldByName('Inst').Value;
  qCheckEmploy.ParamByName('F_Name').Value := qCheckEmploy.DataSource.DataSet.FieldByName('F_Name').Value;
  qCheckEmploy.ParamByName('I_Name').Value := qCheckEmploy.DataSource.DataSet.FieldByName('I_Name').Value;
  qCheckEmploy.ParamByName('O_Name').Value := qCheckEmploy.DataSource.DataSet.FieldByName('O_Name').Value;
  qCheckEmploy.Open;
  if not qCheckEmploy.IsEmpty then raise Exception.Create(TranslateText('Такой сотрудник уже введен !'));

  if dbceOrg.DataSource.DataSet.State <> dsBrowse then
    dbceOrg.DataSource.DataSet.Post;
  ModalResult := mrOk;
end;

end.
