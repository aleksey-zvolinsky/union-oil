unit DopReports;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  BaseEnh, RxMemDS, Menus, Db, DBTables, Grids, DBGridEh, Buttons,
  StdCtrls, ExtCtrls, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc;

type
  TDopReportsForm = class(TBaseFormEnh)
    md: TRxMemoryData;
    mdNAME: TStringField;
    N1: TMenuItem;
    procedure ActivateMd;
    procedure bbSearchClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DopReportsForm: TDopReportsForm;

implementation

{$R *.DFM}

uses UReportClass,ExFunc,RulezReport;

procedure TDopReportsForm.ActivateMd;
var SR:TSearchRec;
    n:integer;
    F: TextFile;
    line:string;

    procedure AddToMd(s:string);
    begin
         s:=copy(s,1,length(s)-4);
         md.Insert;
         md.FieldByName('name').AsString:=s;
         md.Post;
    end;

begin
    md.EmptyTable;
    md.Open;
    n:=FindFirst(GetMainDir+'\'+DIRFORPLUGINS+'\*.rrr', faAnyFile, SR);
    if n<>0 then exit;
    repeat
       AssignFile(F,GetMainDir+'\'+DIRFORPLUGINS+'\'+SR.Name);
       Reset(F);
       readln(F,line);
       CloseFile(F);
       if line<>'#REGISTERED' then
          AddToMd(SR.Name);
       n:=FindNext(SR);
    until n<>0;

end;

procedure TDopReportsForm.bbSearchClick(Sender: TObject);
begin
    inherited;
    ActivateMd;
end;

procedure TDopReportsForm.bbOkClick(Sender: TObject);
begin
   inherited;
   if not md.IsEmpty then
      MakePluginReport(md.FieldByName('name').AsString);
end;

procedure TDopReportsForm.SpeedButton1Click(Sender: TObject);
var s:string;
begin
  inherited;
  md.First;
  while not md.Eof do begin
     s:=s+mdName.AsString+',';
     md.Next;
  end;
  ShowTextInMemo(s);
end;

procedure TDopReportsForm.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  bbOk.Click;
end;

procedure TDopReportsForm.N1Click(Sender: TObject);
var
  SI : TStartupInfo;
  P  : TProcessInformation;
begin
 FillChar( SI, SizeOf( SI ) , 0 );
 CreateProcess(nil,PChar('NOTEPAD.EXE '+ GetMainDir+'\'+DIRFORPLUGINS+'\'+mdName.asString+'.rrr'),
   NIL,NIL,false,CREATE_DEFAULT_ERROR_MODE,NIL,NIL,SI,P);
end;

end.
