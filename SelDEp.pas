unit SelDEp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, Db, DBTables, MemDS, DBAccess, Ora,
  uCommonForm,uOilQuery,uOilStoredProc;

type
  TSelDEPForm = class(TCommonForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    TreeView1: TTreeView;
    Panel3: TPanel;
    Label1: TLabel;
    procedure bbCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    Procedure CreateTree(Node:TTreeNode;ID,INST:INTEGER);
    procedure bbOkClick(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure TreeView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SelID,SelInst:integer;
    SelText:string;
  end;
 PNodePar=^TNodePar;
 TNodePar=record
           id:integer;
           inst:integer;
          end;

var
  SelDEPForm: TSelDEPForm;
  NP:PNodePar;
  MX,MY:integer;

implementation

uses main;
{$R *.DFM}

procedure TSelDEPForm.bbCancelClick(Sender: TObject);
begin
 close;
end;

procedure TSelDEPForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

Procedure TSelDEPForm.CreateTree(Node:TTreeNode;ID,INST:INTEGER);
Var
  Node2:TtreeNode;
  q1:TOilQuery;
Begin
  q1:=TOilQuery.Create(self);
  try
    q1.close;
    q1.sql.text:=
      ' select distinct name,id,inst'+
      ' from v_oil_org_norek '+
      ' where id=inst and org_id in (3,4,8) and par='+inttostr(ID)+' and par_inst='+inttostr(inst);
    q1.open;
    q1.first;
    while not q1.Eof do
    begin
      Node2:=TreeView1.Items.AddChild(Node,q1.fieldbyname('name').value);
      New(NP);
      NP.id:=q1.fieldbyname('id').value;NP.inst:=q1.fieldbyname('inst').value;
      Node2.data:=NP;
      CreateTree(Node2,q1.fieldbyname('id').value,q1.fieldbyname('inst').value);
      q1.next;
    end;
  finally
    q1.Free;
  end;
End;

procedure TSelDEPForm.FormCreate(Sender: TObject);
Var
  Node:TTreeNode;
  q1:TOilQuery;
begin
  inherited;
  q1:=TOilQuery.Create(self);
  try
    q1.close;
    q1.sql.text:='select distinct name,id,inst from V_oil_org_norek where id='+inttostr(MAIN_ID)+' and inst='+inttostr(inst);
    q1.open;
    treeview1.items.clear;
    Node:=TreeView1.Items.AddChild(nil,q1.fieldbyname('name').value);
    New(NP);
    NP.id:=Main_id;NP.inst:=inst;
    Node.data:=NP;
    CreateTree(Node,MAIN_ID,INST);
   // TreeView1.fullExpand;
    SelID:=-1;SelInst:=-1;
  finally
    q1.Free;
  end;
end;

procedure TSelDEPForm.bbOkClick(Sender: TObject);
Var Node:TTreeNode;
begin
 Node:=TreeView1.Selected;
 if Node<>nil then  begin
                     NP:=Node.data;
                     SelId:=NP.Id;
                     SelInst:=NP.Inst;
                     SelText:=Node.text;
                     ModalResult:=MrOk;
                    end;
end;

procedure TSelDEPForm.TreeView1Change(Sender: TObject; Node: TTreeNode);
//Var q:TOilQuery;
//    nd:TTreeNode;
begin
{ if node.HasChildren then exit;
 np:=node.data;
 q:=TOilQuery.create(self);
 q.close;
 q.sql.text:='select name,inst,id from V_oil_org where par='+inttostr(np.iD)+' and par_inst='+inttostr(np.inst);
 q.open;
 q.first;
 while not q.eof do
 begin
   nd:=TreeView1.Items.AddChild(Node,q.fieldbyname('name').value);
   new(np);
   np.id:=q.fieldbyname('id').value;
   np.inst:=q.fieldbyname('inst').value;
   nd.data:=np;
  q.next;
 end;
 q.destroy;}
end;

procedure TSelDEPForm.TreeView1DblClick(Sender: TObject);
Var Node:TTreeNode;
begin
 Node:=TreeView1.selected;
 If Node<>nil then bbOkClick(Self);
end;

end.
