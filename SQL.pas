unit SQL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons,OilStd, MemDS,
  DBAccess, Ora, DBGridEh, ActnList, ComCtrls, uCommonForm,uOilQuery,uOilStoredProc,
  DBGridEhGrouping, GridsEh;

type
  TSQLForm = class(TCommonForm)
    mSQL: TRichEdit;
    Splitter1: TSplitter;
    grSQL: TDBGridEh;
    ds: TOraDataSource;
    Panel3: TPanel;
    bExec: TBitBtn;
    bClear: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    q: TOilQuery;
    ActionList: TActionList;
    Action1: TAction;
    Panel1: TPanel;
    bClose: TBitBtn;
    Action2: TAction;
    procedure bCloseClick(Sender: TObject);
    procedure bExecClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bClearClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure mSQLDblClick(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  SQLForm: TSQLForm;

implementation

uses ExcelFunc, Main, uStart;

{$R *.DFM}

procedure TSQLForm.bCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TSQLForm.bExecClick(Sender: TObject);
begin
  if mSQL.Text = '' then exit;
  try
    With q Do
    Begin
      Close;
      SQL.Clear;
      if mSQL.SelLength >0
        then SQL.Text := mSQL.SelText
        else SQL.Text := mSQL.Text;
      Screen.Cursor := crSQLWait;
      try
        ExecSQL;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  except On E:Exception Do
    ShowMessage(E.Message);
  end;
end;

procedure TSQLForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q.Close;
  Action := caFree;
end;

procedure TSQLForm.bClearClick(Sender: TObject);
begin
  mSQL.Clear;
end;

procedure TSQLForm.BitBtn1Click(Sender: TObject);
begin
 SaveDbData(Q,grSQL.Columns);
end;

procedure TSQLForm.BitBtn2Click(Sender: TObject);
begin
  grSQL.DataSource.DataSet.DisableControls;
  try
    PutGridEhToExcel(grSQL);
  finally
    grSQL.DataSource.DataSet.EnableControls;
  end;
end;

procedure TSQLForm.mSQLDblClick(Sender: TObject);
{var
  s,s1: string;
  i,j: integer;}
begin
{  s:='select id';
  for i:=0 to 9 do begin
    s:=s+',decode(id';
    for j:=0 to 99 do
      s:=s+Format(',%d,%d',[i*100+j,(i*100*j) mod 7 +1 ]);
    s:=s+') as price'+IntToStr(i);
  end;
  s:=s+' from oil_np_type';

  s1:=' select id,';
  for i:=0 to 8 do begin
    s1:=s1+'nvl(price'+IntToStr(i)+',';
  end;
  s1:=s1+'price'+IntToStr(9);
  for i:=0 to 9 do begin
    s1:=s1+')';
  end;
  s1:=s1+' as price from ('+s+') order by id';
  mSql.Lines.Text:=s1;}
end;

procedure TSQLForm.Action2Execute(Sender: TObject);
begin
 Close;
end;


end.
