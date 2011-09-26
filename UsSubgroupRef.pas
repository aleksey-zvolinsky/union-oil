unit UsSubgroupRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  BaseEnh, ActnList, Menus, Db, DBTables, RXCtrls, Grids, DBGridEh,
  Buttons, StdCtrls, ExtCtrls,uOilQuery,Ora, uOilStoredProc;

type
  TUsSubgroupRefForm = class(TBaseFormEnh)
    Label1: TLabel;
    edName: TEdit;
    qID: TFloatField;
    qNAME: TStringField;
    qGROUP_ID: TFloatField;
    qGROUP_NAME: TStringField;
    procedure bbSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edNameChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UsSubgroupRefForm: TUsSubgroupRefForm;

implementation

{$R *.DFM}

uses UDbFunc;
//==============================================================================
procedure TUsSubgroupRefForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  if q.Active then q.Close;
  q.Sql.Text:=
    ' select uss.id,uss.name,us.id as group_id,us.name as group_name'+
    ' from oil_us_subgroup uss,oil_us_group us'+
    ' where uss.state=''Y'' and us.state=''Y'''+
    '   and uss.us_group_id=us.id'+
    '   and lower(uss.name) like ''%'+edName.Text+'%''';
  if OrderField<>'' then
    q.Sql.Add('order by '+OrderField+' '+OrderDirection);
  _OpenQuery(q);
end;
//==============================================================================
procedure TUsSubgroupRefForm.FormShow(Sender: TObject);
begin
  inherited;
  bbSearch.Click;
  edName.SetFocus;
end;
//==============================================================================
procedure TUsSubgroupRefForm.edNameChange(Sender: TObject);
begin
  inherited;
  bbSearch.Click;
end;
//==============================================================================
procedure TUsSubgroupRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  RedColorFieldName:='NAME';
  RedColorFilter:=edName;
end;
//==============================================================================
procedure TUsSubgroupRefForm.edNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then bbOk.Click;
end;
//==============================================================================
end.
