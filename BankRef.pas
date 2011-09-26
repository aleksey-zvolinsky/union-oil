unit BankRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus, Main,
  ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess,
  DBGridEh;

type
  TBankRefForm = class(TBaseForm)
    Panel5: TPanel;
    Label1: TLabel;
    edMFO: TEdit;
    Label2: TLabel;
    edName: TEdit;
    sbClearMFO: TSpeedButton;
    sbClearName: TSpeedButton;
    Panel6: TPanel;
    cbHere: TCheckBox;
    cbAlfa: TCheckBox;
    cbOther: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); Override;
    procedure sbDelClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edMFOChange(Sender: TObject);
    procedure edNameChange(Sender: TObject);
    procedure sbClearMFOClick(Sender: TObject);
    procedure sbClearNameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}
uses Bank,OilStd,UDbFunc,ExFunc;
//==============================================================================
procedure TBankRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  bbSearch.Click;
end;
//==============================================================================
procedure TBankRefForm.bbClearClick(Sender: TObject);
begin
  edMFO.text:='';
  edName.text:='';
end;
//==============================================================================
procedure TBankRefForm.bbSearchClick(Sender: TObject);
begin
  if q.Active then q.close;
  q.sql.Text:=' select * from v_oil_bank,v_oil_info where 1=1';
  if edMFO.text <> '' then q.sql.add('and upper(mfo) like ''%'+ANSIUpperCase(edMFO.text)+'%'' ');
  if edName.text <> '' then q.sql.add('and upper(name) like ''%'+ANSIUpperCase(edName.text)+'%''');
  q.Sql.Add(' and decode(inst,main_inst,0,1,1,2) in ('+
    GetConstructedString(['0','1','2'],[cbHere.Checked,cbAlfa.Checked,cbOther.Checked],',','null')+')');
  q.sql.add('order by name');
  _OpenQuery(q);
end;
//==============================================================================
procedure TBankRefForm.sbAddClick(Sender: TObject);
begin
  edName.Text:=EditBank(0,MAIN_ORG.INST);
end;
//==============================================================================
procedure TBankRefForm.sbEditClick(Sender: TObject);
begin
  if not q.Active or (q.RecordCount=0) then exit;
  if q['inst']<>MAIN_ORG.INST then
    raise exception.create(TranslateText('Ќельз€ редактировать банк, заведенный не здесь'));

  edName.Text:=EditBank(q['id'],q['inst']);
end;
//==============================================================================
procedure TBankRefForm.sbDelClick(Sender: TObject);
begin
  if MessageDlg(TranslateText('ѕодтвердите удаление'), mtConfirmation, [mbYes, mbNo], 0 ) <> mrYes then Exit;
  if (not q.Active) or (q.RecordCount=0) then exit;
  if q['inst']<>MAIN_ORG.INST then
    raise exception.create(TranslateText('Ќельз€ удал€ть банк, заведенный не здесь'));
  if GetSqlValue(Format(
    ' select count(*) from oil_org_rekvizit where state=''%s'' and id_bank=%d and bank_inst=%d',
    ['Y',q.FieldByName('id').asInteger,q.FieldByName('inst').AsInteger]))>0
  then
    raise exception.create(TranslateText('”даление невозможно, поскольку существуют организации, ссылающиес€ на этот банк'));

  DBSaver.SetState('OIL_BANK',q['id'],q['inst'],'N');
  bbSearch.Click;
end;
//==============================================================================
procedure TBankRefForm.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if bbOk.Visible then bbOk.Click;
end;
//==============================================================================
procedure TBankRefForm.edMFOChange(Sender: TObject);
begin
  inherited;
  bbSearch.Click;
end;
//==============================================================================
procedure TBankRefForm.edNameChange(Sender: TObject);
begin
  inherited;
  bbSearch.Click;
end;
//==============================================================================
procedure TBankRefForm.sbClearMFOClick(Sender: TObject);
begin
  inherited;
  edMFO.Text:='';
end;

procedure TBankRefForm.sbClearNameClick(Sender: TObject);
begin
  inherited;
  edName.Text:='';
end;

end.
