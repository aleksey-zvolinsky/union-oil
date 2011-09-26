unit RefPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXCtrls, Buttons, ExtCtrls, RXSpin, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TRefPrintForm = class(TCommonForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    RxCheckListBox1: TRxCheckListBox;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label2: TLabel;
    CN: TRxSpinEdit;
    Label3: TLabel;
    SpeedButton4: TSpeedButton;
    Bevel1: TBevel;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure CNKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   FName:TStrings;
  end;

var
  RefPrintForm: TRefPrintForm;

implementation

{$R *.DFM}

procedure TRefPrintForm.SpeedButton4Click(Sender: TObject);
var i:integer;
begin
 for i:=0 to rxchecklistbox1.items.count-1 do
 begin
  rxchecklistbox1.checked[i]:=false;
 end;
end;

procedure TRefPrintForm.SpeedButton5Click(Sender: TObject);
var i:integer;
begin
 for i:=0 to rxchecklistbox1.items.count-1 do
 begin
  rxchecklistbox1.checked[i]:=true;
 end;
end;

procedure TRefPrintForm.CNKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key='-' then key:=#0;
end;

procedure TRefPrintForm.SpeedButton1Click(Sender: TObject);
Var pos:integer;
begin
 pos:=RxCheckListBox1.ItemIndex;
 if pos>0 then begin
                RxCheckListBox1.Items.Move(pos,pos-1);
                FName.Move(pos,pos-1);
                RxCheckListBox1.ItemIndex:=pos-1;
               end;
end;

procedure TRefPrintForm.SpeedButton2Click(Sender: TObject);
var pos:integer;
begin
 pos:=RxCheckListBox1.ItemIndex;
 if pos<RxCheckListBox1.Items.count-1 then begin
                                            RxCheckListBox1.Items.Move(pos,pos+1);
                                            FName.Move(pos,pos+1);
                                            RxCheckListBox1.ItemIndex:=pos+1;
                                           end;
end;

procedure TRefPrintForm.bbOkClick(Sender: TObject);
begin
 Modalresult:=MrOk;
end;

procedure TRefPrintForm.FormCreate(Sender: TObject);
begin
 FName:=TStringList.Create;
end;

end.
