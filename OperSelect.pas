unit OperSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst,Main, Db, DBTables, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TOperSelectForm = class(TCommonForm)
    CL1: TCheckListBox;
    BitBtn1: TBitBtn;
    q: TOilQuery;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Query1: TOilQuery;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation
{$R *.DFM}

procedure TOperSelectForm.FormCreate(Sender: TObject);
begin
 query1.open;
 while not query1.eof do
 begin
  combobox1.items.add(query1.fieldbyname('name').asstring);
  query1.next;
 end;
 combobox1.itemindex:=0;
end;

procedure TOperSelectForm.ComboBox1Change(Sender: TObject);
var i:integer;
begin
 q.close;
  if combobox1.itemindex=0 then Q.SQL.Text:='select * from v_oil_oper_type order by name'
  else begin
        query1.first;
        for i:=0 to combobox1.itemindex-2 do begin
                                              query1.next;
                                             end; 
        Q.SQL.Text:='select * from v_oil_oper_type where grp_id='+query1.fieldbyname('id').asstring+' order by name'
       end;
 q.open;
 CL1.clear;
 while not q.Eof do
 begin
  CL1.Items.add(q.fieldbyname('name').asstring);
  q.next;
 end;
end;

end.
