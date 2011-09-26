unit MTEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCommonForm, Db, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, MemTable,uOilQuery,Ora, uOilStoredProc;

type
  TMTEditForm = class(TCommonForm)
    Panel1: TPanel;
    bbCancel: TBitBtn;
    dbg: TDBGridEh;
    ds: TOraDataSource;
    sbDel: TSpeedButton;
    procedure dbgGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure sbDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DEL_STATE: Boolean;
  end;

var
  MTEditForm: TMTEditForm;

procedure EditMT(
  p_MT: TMemoryTable;
  p_Caption: string;
  p_Ops: string = 'IUD';
  p_DelState: Boolean = true);

implementation

{$R *.DFM}
//=================================================================================
procedure EditMT(
  p_MT: TMemoryTable;
  p_Caption: string;
  p_Ops: string = 'IUD';
  p_DelState: Boolean = true);
var
  F: TMTEditForm;
  i: integer;
begin
  F:=TMTEditForm.Create(Application);
  F.Caption:=p_Caption;
  F.ds.DataSet:=p_MT;
  F.dbg.Columns.AddAllColumns(true);
  for i:=0 to p_MT.Fields.Count-1 do begin
    F.dbg.Columns[i].Visible:=p_MT.Fields[i].Visible;
    if p_MT.Fields[i].ReadOnly then
      F.dbg.Columns[i].Color:=$00EEEFEF;
  end;
  if pos('I',p_Ops)=0 then
    F.dbg.AllowedOperations:=F.dbg.AllowedOperations-[alopInsertEh];
  if pos('I',p_Ops)=0 then
    F.dbg.AllowedOperations:=F.dbg.AllowedOperations-[alopUpdateEh];
  F.sbDel.Visible:=pos('D',p_Ops)<>0;
  F.DEL_STATE:=p_DelState;
  F.ShowModal;
  F.Free;
end;
//=================================================================================
procedure TMTEditForm.dbgGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  inherited;
  if (DEL_STATE) and (ds.DataSet.FieldByName('STATE').AsString='N') then
    AFont.Color:=clRed;
end;
//=================================================================================
procedure TMTEditForm.sbDelClick(Sender: TObject);
var s: string;
begin
  inherited;
  with ds.DataSet do begin
    if DEL_STATE then
      if RecordCount<>0 then begin
        s:=FieldByName('state').AsString;
        if s='Y' then s:='N'
        else s:='Y';
        if State=dsBrowse then Edit;
        FieldByName('state').AsString:=s;
        Post;
      end;
  end;
end;
//=================================================================================
end.
