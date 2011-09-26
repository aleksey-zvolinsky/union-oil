unit GetFromGrid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, Grids, DBGridEh, dbtables, uCommonForm,
  uOilQuery, Ora, uOilStoredProc, GridsEh;

type
  TGetFromGridOption=(GFG_MULT);

  TGetFromGridOptions=set of TGetFromGridOption;

  TGetFromGridForm = class(TCommonForm)
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Grid1: TDBGridEh;
    ds: TOraDataSource;
    panelHead: TPanel;
    procedure Grid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure Find(p_Letter: string);
  private
    { Private declarations }
  public
    { Public declarations }
    NameField: string;
  end;

var
  GetFromGridForm: TGetFromGridForm;

function ChooseFromGrid(p_Q:TDataSet;p_ColTitles:string;p_Title:string='';p_Options: TGetFromGridOptions = []; p_NameField: string=''):Boolean;

implementation

{$R *.DFM}

uses ExFunc;
//==============================================================================
function ChooseFromGrid(p_Q:TDataSet;p_ColTitles:string;p_Title:string='';p_Options: TGetFromGridOptions = []; p_NameField: string=''):Boolean;
var F: TGetFromGridForm;
    ColTitles: TStringList;
    i: integer;
begin
     result:=FALSE;

     if not p_Q.Active then p_Q.Open;
     if p_Q.RecordCount=0 then exit;

     Application.CreateForm(TGetFromGridForm,F);
     F.ds.DataSet:=p_Q;
     F.NameField:=p_NameField;

     if p_Title='' then F.panelHead.Visible:=FALSE
     else F.panelHead.Caption:=p_Title;

     ColTitles:=TStringList.Create;
     Str2StringList(p_ColTitles,ColTitles);

     for i:=0 to F.Grid1.Columns.Count-1 do begin
         F.Grid1.Columns[i].Title.Caption:=ColTitles[i];
     end;

     if GFG_MULT in p_Options then F.Grid1.Options:=F.Grid1.Options+[dgMultiSelect];

     if F.ShowModal=mrOk then result:=TRUE;
     F.Free;
end;
//==============================================================================
procedure TGetFromGridForm.Find(p_Letter: string);
var Direction: Boolean; // True - вперед, False - назад
begin
    if NameField='' then exit;
    p_Letter:=RusUpperCase(p_Letter);
    if RusUpperCase(ds.DataSet.FieldByName(NameField).AsString[1])=p_Letter then exit;
    Direction:=(RusUpperCase(ds.DataSet.FieldByName(NameField).AsString[1])<p_Letter);
    while not (Direction and ds.DataSet.Eof or not Direction and ds.DataSet.Bof) do begin
         if Direction and (RusUpperCase(ds.DataSet.FieldByName(NameField).AsString[1])>=p_Letter)
            or not Direction and (RusUpperCase(ds.DataSet.FieldByName(NameField).AsString[1])<p_Letter)
         then break;

         if Direction then ds.DataSet.Next
                      else ds.DataSet.Prior;
    end;
    if not Direction and not ds.DataSet.Bof then ds.DataSet.Next;
end;
//==============================================================================
procedure TGetFromGridForm.Grid1DblClick(Sender: TObject);
begin
    bbOk.Click;
end;
//==============================================================================
procedure TGetFromGridForm.FormCreate(Sender: TObject);
begin
  inherited;
    NameField:='';
end;
//==============================================================================
procedure TGetFromGridForm.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
    Grid1.SetFocus;
    Find(Key);
end;
//==============================================================================
end.
