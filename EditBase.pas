unit EditBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCommonForm, StdCtrls, Buttons, ExtCtrls, uStart, Db, MemDS, DBAccess,
  Ora,uOilQuery,uOilStoredProc, uExeSql;

type
  TEditBaseForm = class(TCommonForm)
    pBottom: TPanel;
    pBtn: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    q: TOilQuery;
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    ID,INST: integer;
    NAME: string;
    PARENT_NAME: string;
  public
    { Public declarations }
    procedure Init; virtual;
    procedure Test; virtual; abstract;
    procedure Save; virtual; abstract;
    procedure PrintReport(AReportNumber:integer); virtual; abstract;
    procedure Test4Delete;virtual;
    class function Edit(
      p_ID, p_Inst: integer; p_ParentName:string;
      var pp_Id,pp_Inst: integer;
      var pp_Name: string): Boolean; overload;
    class function Edit(p_Id,p_Inst: integer): Boolean; overload;
    class function Edit(p_Id,p_Inst: integer; p_ClassName:string): Boolean; overload;    
    class procedure Print(AId,AInst,AReportNumber:integer); overload;
    class procedure Print(AReportName:string); overload;
    class procedure TestDelete(AId,AInst:integer);
  end;

var
  EditBaseForm: TEditBaseForm;

implementation

{$R *.DFM}

uses uDbFunc, OilStd, Main, RulezReport;
//======================================================================
procedure TEditBaseForm.Test4Delete;
begin
end;
//======================================================================
class function TEditBaseForm.Edit(
  p_ID, p_Inst: integer; p_ParentName:string;
  var pp_Id,pp_Inst: integer;
  var pp_Name: string): Boolean;
var
  F: TEditBaseForm;
begin
  F := Self.Create(Application);
  try
    F.ID := p_ID;
    F.INST := p_Inst;
    F.PARENT_NAME := p_ParentName;
    F.Init;
    result := F.ShowModal = mrOk;
    if result then
    begin
      pp_Id := F.ID;
      pp_Inst := F.INST;
      pp_Name := F.NAME;
    end;
  finally
    F.Free;
  end;
end;
//======================================================================
class function TEditBaseForm.Edit(p_Id,p_Inst: integer): Boolean; 
var
  id,inst: integer;
  s,s2: string;
begin
  result:=Self.Edit(p_Id,p_Inst,s2,id,inst,s);
end;
//======================================================================
class function TEditBaseForm.Edit(p_Id,p_Inst: integer; p_ClassName:string): Boolean;
var
  id,inst: integer;
  s: string;
begin
  result:=Self.Edit(p_Id,p_Inst,p_ClassName,id,inst,s);
end;
//======================================================================
class procedure TEditBaseForm.Print(AId,AInst,AReportNumber:integer);
var F: TEditBaseForm;
begin
  F:=self.Create(Application);
  try
    F.ID:=AId;
    F.INST:=AInst;
    F.PrintReport(AReportNumber);;
  finally
    F.Free;
  end;
end;
//======================================================================
class procedure TEditBaseForm.Print(AReportName:string);
begin
  MakePluginReport(AReportName);
end;
//======================================================================
class procedure TEditBaseForm.TestDelete(AId,AInst:integer);
var F: TEditBaseForm;
begin
  F:=self.Create(Application);
  try
    F.ID:=AId;
    F.INST:=AInst;
    F.Test4Delete;
  finally
    F.Free;
  end;
end;
//======================================================================
procedure TEditBaseForm.bbOkClick(Sender: TObject);
begin
  Test;
  StartSqlOra;
  try
    Save;
    CommitSqlOra;
    ModalResult:=mrOk;
  except
    RollbackSqlOra;
    raise;
  end;
end;
//======================================================================
procedure TEditBaseForm.Init;
begin
  if ID<>0 then begin
    if q.Active then q.Close;
    q.ParamByName('id').AsInteger:=ID;
    q.ParamByName('inst').AsInteger:=INST;
    q.Open;
  end else
    INST:=MAIN_ORG.INST;
end;
//======================================================================
procedure TEditBaseForm.bbCancelClick(Sender: TObject);
begin
  inherited;
  RollbackSqlOra;
end;
//======================================================================
procedure TEditBaseForm.FormCreate(Sender: TObject);
begin
  inherited;
  LoadSQLByForm(TForm(Self));
end;

end.
