unit Topic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, DBTables, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TTopicForm = class(TCommonForm)
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    bClose: TBitBtn;
    qText: TOilQuery;
    procedure bCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TopicForm: TTopicForm;

implementation

uses ExFunc,Main,uRichEditFormat,uExeSql;

{$R *.DFM}
//==============================================================================
procedure TTopicForm.bCloseClick(Sender: TObject);
begin
  Close;
end;
//==============================================================================
procedure TTopicForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
//==============================================================================
procedure TTopicForm.FormShow(Sender: TObject);
var i:integer;
begin
  LoadExeSql(qText.Sql, VERSION.FileVersion, 'TopicForm');
  SetRichEditText(RichEdit1,qText.Sql.Text);
end;
//==============================================================================
end.
