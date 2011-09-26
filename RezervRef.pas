unit RezervRef;

interface

uses uCommonForm, Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls, Dialogs, Forms,
  ExtCtrls, Mask, ToolEdit, ActnList, RXCtrls, uOilQuery, Ora, uOilStoredProc,
  MemDS, DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TRezervRefForm = class(TBaseForm)
    Label3: TLabel;
    cbOrg: TComboEdit;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    edName: TEdit;
    Label2: TLabel;
    edType: TEdit;
    Label4: TLabel;
    edNum: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    pUnErase: TPanel;
    bbUnErase: TBitBtn;
    sbUnErase: TSpeedButton;
    qq: TOilQuery;
    bbKalibr: TBitBtn;
    gbClass: TGroupBox;
    cbReal: TCheckBox;
    cbVirt: TCheckBox;
    cbElev: TCheckBox;
    Label5: TLabel;
    ceNpType: TComboEdit;
    SpeedButton5: TSpeedButton;
    procedure ActivateQ(Sender: TObject);       
    procedure FormCreate(Sender: TObject);
    procedure cbOrgButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); override;
    procedure sbUnEraseClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure bbUnEraseClick(Sender: TObject);
    procedure bbKalibrClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ceNpTypeButtonClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    procedure DeleteRezervuar(id, inst: integer);
  public
    OrgId, OrgInst: integer;
    State: string;
  end;

var
  RezervRefForm: TRezervRefForm;

implementation

{$R *.DFM}

uses ExFunc, ChooseOrg, Main, UDBFunc, Rezerv, RezKalibr, NpTypeRef;
//==============================================================================
procedure TRezervRefForm.ActivateQ(Sender: TObject);
begin
  q.Close;
  _OpenQueryPar(q,
    ['AState',   State,
     'AOrgId',   BoolTo_(OrgId <> 0, OrgId, Null),
     'AOrgInst', BoolTo_(OrgId <> 0, OrgInst, Null),
     'AName',    BoolTo_(edName.Text = '', Null, edName.Text),
     'AType',    BoolTo_(edType.Text = '', Null, edType.Text),
     'ANum',     BoolTo_(edNum.Text = '', Null, edNum.Text),
     'ANPType',  BoolTo_(ceNpType.Tag <> 0, ceNpType.Tag, Null),
     'AIsReal',  BoolTo_(cbReal.Checked, 1, -1),
     'AIsVirt',  BoolTo_(cbVirt.Checked, 1, -1),
     'AIsElev',  BoolTo_(cbElev.Checked, 1, -1)
    ]);
end;
//==============================================================================
procedure TRezervRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  OrgId := MAIN.MAIN_ID;
  OrgInst := MAIN.INST;
  cbOrg.Text := GetOrgName(OrgId, OrgInst);
  State := 'Y';
end;
//==============================================================================
procedure TRezervRefForm.cbOrgButtonClick(Sender: TObject);
var
  name: string;
begin
  if CaptureOrg(1, MAIN.MAIN_ID, MAIN.INST, 'yyy', OrgId, OrgInst, name) then
  begin
    cbOrg.Text := name;
    ActivateQ(nil);
  end;
end;
//==============================================================================
procedure TRezervRefForm.SpeedButton1Click(Sender: TObject);
begin
  cbOrg.Text := '';
  OrgId := 0;
  OrgInst := 0;
  ActivateQ(nil);
end;
//==============================================================================
procedure TRezervRefForm.SpeedButton4Click(Sender: TObject);
begin
  edName.Text := '';
  ActivateQ(nil);
end;
//==============================================================================
procedure TRezervRefForm.SpeedButton3Click(Sender: TObject);
begin
  edType.Text := '';
  ActivateQ(nil);
end;
//==============================================================================
procedure TRezervRefForm.SpeedButton2Click(Sender: TObject);
begin
  edNum.Text := '';
  ActivateQ(nil);
end;
//==============================================================================
procedure TRezervRefForm.sbAddClick(Sender: TObject);
begin
  if InsertRezervuar(InsideTransaction) then ActivateQ(nil);
end;
//==============================================================================
procedure TRezervRefForm.sbEditClick(Sender: TObject);
begin
  inherited;
  if q.RecordCount > 0 then
    if EditRezervuar(InsideTransaction, q) then ActivateQ(nil);
end;
//==============================================================================
procedure TRezervRefForm.sbUnEraseClick(Sender: TObject);
begin
  pUnErase.Visible := sbUnErase.Down;
  sbEdit.Enabled := not sbUnErase.Down;
  bbOk.Enabled := sbEdit.Enabled;
  bbKalibr.Enabled := sbEdit.Enabled;
  sbDel.Enabled := sbEdit.Enabled;
  if sbUnErase.Down then State := 'N'
  else State := 'Y';
  ActivateQ(nil);
end;
//==============================================================================
procedure TRezervRefForm.DeleteRezervuar(id, inst: integer);
begin
  if qq.Active then qq.Close;
  qq.ParamByName('rez_id').AsInteger := q.FieldByName('id').AsInteger;
  qq.ParamByName('rez_inst').AsInteger := q.FieldByName('inst').AsInteger;
  qq.Open;
  if qq.FieldByName('numb').AsInteger <> 0 then
    raise Exception.Create(TranslateText('Невозможно удалить резервуар.') + #13#10 +
      TranslateText('Сначала удалите все приходы и отпуски по этому резервуару'));
  SetState('OIL_REZERVUAR', id, inst, 'N', InsideTransaction);
end;
//==============================================================================
procedure TRezervRefForm.sbDelClick(Sender: TObject);
begin
  inherited;
  if MessageDlg(TranslateText('Вы уверены, что хотите удалить резервуар?'), mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    DeleteRezervuar(q.FieldByName('id').AsInteger, q.FieldByName('inst').AsInteger);
    ActivateQ(nil);
  end;
end;
//==============================================================================
procedure TRezervRefForm.bbUnEraseClick(Sender: TObject);
begin
  inherited;
  SetState('OIL_REZERVUAR', q.FieldByName('id').AsInteger, q.FieldByName('inst').AsInteger, 'Y', InsideTransaction);
  ActivateQ(nil);
end;
//==============================================================================
procedure TRezervRefForm.bbKalibrClick(Sender: TObject);
begin
  if q.RecordCount > 0 then
    KalibrateRezervuar(q.FieldByName('id').AsInteger, q.FieldByName('inst').AsInteger);
end;
//==============================================================================
procedure TRezervRefForm.bbClearClick(Sender: TObject);
begin
  inherited;
  cbOrg.Text := '';
  OrgId := 0; OrgInst := 0;
  edName.Text := '';
  edType.Text := '';
  edNum.Text := '';
  ActivateQ(nil);
end;
//==============================================================================
procedure TRezervRefForm.FormShow(Sender: TObject);
begin
  inherited;
  ActivateQ(nil);
end;
//==============================================================================
procedure TRezervRefForm.ceNpTypeButtonClick(Sender: TObject);
var
  F: TNpTypeRefForm;
begin
  F := TNpTypeRefForm.Create(Application);
  if (F.ShowModal = mrOk) and (F.q.RecordCount <> 0) then
  begin
    ceNpType.Text := F.qName.AsString;
    ceNpType.Tag := F.qId.AsInteger;
    bbSearch.Click;
  end;
end;
//==============================================================================
procedure TRezervRefForm.SpeedButton5Click(Sender: TObject);
begin
  ceNpType.Clear;
  ceNpType.Tag := 0;
  bbSearch.Click;
end;
//==============================================================================

end.
