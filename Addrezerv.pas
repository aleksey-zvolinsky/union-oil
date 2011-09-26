unit Addrezerv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, Mask,
  ToolEdit, CurrEdit, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TAddrezervForm = class(TCommonForm)
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    ListView1: TListView;
    Edit2: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pAdd: TSpeedButton;
    pEdit: TSpeedButton;
    pDel: TSpeedButton;
    ce2: TCurrencyEdit;
    ce1: TEdit;
    admq: TOilQuery;
    canDeleteQuery: TOilQuery;
    CEKat: TComboEdit;
    Label5: TLabel;
    CalcDno_Corr: TRxCalcEdit;
    Label6: TLabel;
    DELast_Cal_Date: TDateEdit;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbOkClick(Sender: TObject);
    procedure pAddClick(Sender: TObject);
    procedure pDelClick(Sender: TObject);
    procedure ce1KeyPress(Sender: TObject; var Key: Char);
    procedure ListView1Click(Sender: TObject);
    procedure pEditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CEKatButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OrgId,OrgInst:integer;
  end;

var
  AddrezervForm: TAddrezervForm;

implementation

{$R *.DFM}
uses addorgref,main,rezkalibr,reztype;

procedure TAddrezervForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caHide	;
end;

procedure TAddrezervForm.bbOkClick(Sender: TObject);
var i:integer;
begin
 //===========================
  RezervList.clear;
  for i:=0 to Listview1.Items.Count-1 do
  begin
   New(Rezerv);
   Rezerv.id:=strtoint(ListView1.Items[i].caption);
   Rezerv.name:=ListView1.Items[i].subitems.Strings[0];
   Rezerv.cap:=ListView1.Items[i].subitems.Strings[1];
   Rezerv.dead:=strtofloat(ListView1.Items[i].subitems.Strings[2]);
   Rezerv.DbId:=strtoint(ListView1.Items[i].subitems.Strings[3]);
   Rezerv.DbInst:=strtoint(ListView1.Items[i].subitems.Strings[4]);
   Rezerv.Ub_Kat_Name:=ListView1.Items[i].subitems.Strings[5];
   Rezerv.Dno_Corr:=strtofloat(ListView1.Items[i].subitems.Strings[6]);
   if ListView1.Items[i].subitems.Strings[7]='' then Rezerv.Last_Cal_Date:=0
   else Rezerv.Last_Cal_Date:=strtodate(ListView1.Items[i].subitems.Strings[7]);
   Rezerv.Ub_Kat:=strtoint(ListView1.Items[i].subitems.Strings[8]);
   RezervList.Add(Rezerv);
  end;
 //===========================
 close;
end;

procedure TAddrezervForm.pAddClick(Sender: TObject);
Var Item:TListItem;
begin
    Item:=Listview1.Items.Add;
    if ce1.text='' then ce1.text:='0';
    if edit2.text='' then edit2.text:='0';
    Item.Caption:=ce1.text;
    Item.SubItems.add(edit4.text);
    Item.SubItems.add(edit2.text);
    Item.SubItems.add(floattostr(ce2.Value));
    Item.SubItems.add('0');
    Item.SubItems.add(IntToStr(Main.INST));
    Item.SubItems.add(CEKat.Text);
    Item.SubItems.add(FloatToStr(CalcDno_Corr.Value));
    if DELast_Cal_Date.Text='  .  .    ' then Item.SubItems.add('')
    else Item.SubItems.add(DELast_Cal_Date.Text);
    Item.SubItems.add(IntToStr(CEKat.Tag));
    ce1.text:='0';
    ce2.text:='';
    edit2.text:='';
    edit4.text:='';
end;

procedure TAddrezervForm.pDelClick(Sender: TObject);
Var Item:TListItem;
begin
  Item:=ListView1.Selected;
  If Item<>nil then
  begin
    CanDeleteQuery.Close;
    CanDeleteQuery.Prepare;
    CanDeleteQuery.ParamByName('rez_id').asInteger:= strtoint(Item.subitems.Strings[3]);
    CanDeleteQuery.ParamByName('rez_inst').asInteger:= strtoint(Item.subitems.Strings[4]);
    CanDeleteQuery.ParamByName('rez_id2').asInteger:= strtoint(Item.subitems.Strings[3]);
    CanDeleteQuery.ParamByName('rez_inst2').asInteger:= strtoint(Item.subitems.Strings[4]);
    CanDeleteQuery.Open;
    if CanDeleteQuery.FieldByName('a').asInteger > 0 then
      ShowMessage(TranslateText('С этим резервуаром проводились операции. Он не может быть удален.'))
    else
      Item.Delete;
    CanDeleteQuery.Close;
  end;
end;

procedure TAddrezervForm.ce1KeyPress(Sender: TObject; var Key: Char);
begin
 if (not (key in ['0'..'9'])) and (key<>#8) then key:=#0;
end;

procedure TAddrezervForm.ListView1Click(Sender: TObject);
Var Item:TListItem;
begin
 Item:=ListView1.Selected;
 if item<>nil then
 begin
     ce1.text:=Item.Caption;
     edit4.text:=Item.subItems.Strings[0];
     edit2.text:=Item.subItems.Strings[1];
     ce2.text:=Item.subItems.Strings[2];
     CEKat.Text:=Item.subItems.Strings[5];
     CalcDno_Corr.Value:=StrToFloat(Item.subItems.Strings[6]);
     if Item.subItems.Strings[7]='' then DELast_Cal_Date.Clear
     else DELast_Cal_Date.Date:=StrToDate(Item.subItems.Strings[7]);
 end;
end;

procedure TAddrezervForm.pEditClick(Sender: TObject);
Var Item:TListItem;
    DbId,DbInst:string;
begin
 Item:=Listview1.selected;
 if item<>nil then
 begin
  DbId:=Item.SubItems.strings[3];
  DbInst:=Item.SubItems.strings[4];
  if ce1.text='' then ce1.text:='0';
  if edit2.text='' then edit2.text:='0';
  Item.Caption:=ce1.text;

  Item.SubItems.Clear;

  Item.SubItems.add(edit4.text);
  Item.SubItems.add(edit2.text);
  Item.SubItems.add(floattostr(ce2.Value));
  Item.SubItems.add(DbId);
  Item.SubItems.add(DbInst);
  Item.SubItems.add(CEKat.Text);
  Item.SubItems.add(FloatToStr(CalcDno_Corr.Value));
  if DELast_Cal_Date.Text='  .  .    ' then Item.SubItems.add('')
  else Item.SubItems.add(DELast_Cal_Date.Text);
  Item.SubItems.add(IntToStr(CEKat.Tag));
 end;
end;

procedure TAddrezervForm.FormShow(Sender: TObject);
begin
 ce1.text:='0';
 edit4.text:='';
 edit2.text:='';
 ce2.Text:='';
 CEKat.Text:='';
 CalcDno_Corr.Value:=0;
 DELast_Cal_Date.Clear;
end;

procedure TAddrezervForm.FormCreate(Sender: TObject);
begin
 admq.close;
  if pos('_',name)=0 then admq.sql.text:='select * from v_user_rights where user_id='+inttostr(EMp_id)+' and Upper(object_name)='''+UpperCase(name)+''''
                     else admq.sql.text:='select * from v_user_rights where user_id='+inttostr(EMp_id)+' and Upper(object_name)='''+UpperCase(copy(name,1,pos('_',name)-1))+'''';
  admq.open;
  admq.first;
  while not admq.eof do
  begin
   case admq.fieldbyname('right_id').value of
    1:pAdd.Visible:=true;
    2:pEdit.Visible:=true;
    3:pDel.Visible:=true;
   end;
   admq.next;
  end;
end;

procedure TAddrezervForm.BitBtn1Click(Sender: TObject);
var
  RezKalForm: TRezKalForm;
  Item:TListItem;
begin
  if ListView1.SelCount=0 then
  begin
     showmessage(TranslateText('Сначала нужно выбрать резервуар'));
     exit;
  end;
  Item:=ListView1.Selected;
  RezKalForm := TRezKalForm.Create(Application);
  RezKalForm.rez_id := StrToInt(Item.SubItems.Strings[3]);
  RezKalForm.rez_inst := StrToInt(Item.SubItems.Strings[4]);
  RezKalForm.ShowModal;
  RezKalForm.Free;
end;

procedure TAddrezervForm.CEKatButtonClick(Sender: TObject);
var
  F :TRezTypeForm;
begin
  F:=TRezTypeForm.Create(Application);
  if (F.ShowModal=mrOk) and (F.q.RecordCount>0) then
  begin
       CEKat.Text:=F.q.FieldByName('name').AsString;
       CEKat.Tag :=F.q.FieldByName('id').AsInteger;
  end;
  F.Free;
end;

end.
