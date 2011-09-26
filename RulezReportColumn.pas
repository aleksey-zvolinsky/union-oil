unit RulezReportColumn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, UReportClass, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TRulezReportColumnForm = class(TCommonForm)
    Panel5: TPanel;
    LVColumns: TListView;
    Panel9: TPanel;
    SBUp: TSpeedButton;
    SBDown: TSpeedButton;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure FillColumns(R:TReport);
    procedure PutLVChecks;
    procedure MoveLine(where:integer);
    procedure ToggleItogi;
    procedure FixCheckBoxes;
    procedure LVColumnsColumnClick(Sender: TObject; Column: TListColumn);
    procedure LVColumnsDblClick(Sender: TObject);
    procedure SBUpClick(Sender: TObject);
    procedure SBDownClick(Sender: TObject);
    procedure LVColumnsClick(Sender: TObject);
  private
    { Private declarations }
    LVChecks: array[0..MAXRULEZFIELDS] of Boolean;
  public
    { Public declarations }
  end;

var
  RulezReportColumnForm: TRulezReportColumnForm;

function SetCustomConf(R: TReport):Boolean;

implementation

{$R *.DFM}

uses ExFunc;

const COL_TOSUM=0;
      COL_ITOGI=1;
      COL_NUM=2;
      COL_NAME=3;
      COL_OPTIONAL=4;

procedure TRulezReportColumnForm.FillColumns(R:TReport);
var i:integer;
    Item: TListItem;
    s: string;
begin
    LVColumns.Items.Clear;
    for i:=1 to R.Count do begin
         Item:=LVColumns.Items.Add;
         s:=R.Fields[R.ColumnOrder[i]].Caption;
         if Pos('?',s)=0 then Item.Caption:=s
          else Item.Caption:=R.CountQuestionExpr(R.PutParamsAndFuncs(s,pptsql));
         Item.SubItems.Add(BoolToDa_(R.Fields[R.ColumnOrder[i]].Options.ToSum));
         Item.SubItems.Add(BoolToDa_(R.Fields[R.ColumnOrder[i]].FinalConf.Itogi));
         Item.SubItems.Add(IntToStr(R.ColumnOrder[i]));
         Item.SubItems.Add(R.Fields[R.ColumnOrder[i]].Name);
         Item.SubItems.Add(BoolToDaNet(R.Fields[R.ColumnOrder[i]].Options.Optional));
         Item.Checked:=R.Fields[R.ColumnOrder[i]].FinalConf.ToShow;
         LVChecks[i-1]:=Item.Checked;
    end;
end;

procedure TRulezReportColumnForm.PutLVChecks;
var i:integer;
begin
     for i:=0 to LVColumns.Items.Count-1 do begin
         LVColumns.Items[i].Checked:=LVChecks[i];
         //showLVChecked(LVColumns);
     end;
end;

procedure TRulezReportColumnForm.MoveLine(where:integer);
var n1,n2:integer;
    b:boolean;
begin
     if LVColumns.SelCount=0 then exit;
     n1:=LVColumns.Selected.Index;
     n2:=n1+where;
     if (n2<0) or (n2>=LVColumns.Items.Count) then exit;
     FlipListViewItems(LVColumns,n1,n2);
     //showLVChecked(LVColumns);
     b:=LVChecks[n1];LVChecks[n1]:=LVChecks[n2];LVChecks[n2]:=b;
     PutLVChecks;
     //showLVChecked(LVColumns);
end;

procedure TRulezReportColumnForm.ToggleItogi;
var Item:TListItem;
begin
     if LVColumns.SelCount=0 then exit;
     Item:=LVColumns.Selected;
     if Item.SubItems[1]='' then begin
          if Item.SubItems[0]='' then
             Item.SubItems[1]:=TranslateText('Да');
     end else Item.SubItems[1]:='';
end;

procedure TRulezReportColumnForm.FixCheckBoxes;
var i:integer;
    Item:TListItem;
begin
    for i:=0 to LVColumns.Items.Count-1 do begin
        Item:=LVColumns.Items[i];
        //n:=StrToInt(Item.SubItems[2]);
        if not Item.Checked then
           if Item.SubItems[COL_OPTIONAL]=TranslateText('Нет') then
             Item.Checked:=TRUE;
        LVChecks[i]:=Item.Checked;
    end;
end;


procedure TRulezReportColumnForm.LVColumnsColumnClick(Sender: TObject;
  Column: TListColumn);
begin
     FixCheckBoxes;
end;

procedure TRulezReportColumnForm.LVColumnsDblClick(Sender: TObject);
begin
     FixCheckBoxes;
     ToggleItogi;
end;

procedure TRulezReportColumnForm.SBUpClick(Sender: TObject);
begin
     MoveLine(-1);
end;

procedure TRulezReportColumnForm.SBDownClick(Sender: TObject);
begin
     MoveLine(1);
end;

function SetCustomConf(R: TReport):Boolean;
var F: TRulezReportColumnForm;
    i,n:integer;
begin
     Application.CreateForm(TRulezReportColumnForm,F);
     F.FillColumns(R);
     if (F.ShowModal=mrOk) then begin
         with F.LVColumns do begin
              for i:=0 to Items.Count-1 do begin
                  n:=StrToInt(Items[i].SubItems[COL_NUM]);
                  R.Fields[n].FinalConf.ToShow:=Items[i].Checked;
                  if Items[i].Subitems[COL_ITOGI]='' then
                     R.Fields[n].FinalConf.Itogi:=FALSE
                  else R.Fields[n].FinalConf.Itogi:=TRUE;
                  R.ColumnOrder[i+1]:=n;
              end;
         end;
         result:=TRUE;
     end else result:=FALSE;
     F.Free;
end;

procedure TRulezReportColumnForm.LVColumnsClick(Sender: TObject);
begin
     FixCheckBoxes;
end;

end.
