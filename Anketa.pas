unit Anketa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, ExtCtrls, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

const NumOfButtons=6;

type

  PRadioButton = ^TRadioButton;

  TAnketaForm = class(TCommonForm)
    Panel1: TPanel;
    Panel2: TPanel;
    panelQ: TPanel;
    RB1: TRadioButton;
    RB2: TRadioButton;
    RB3: TRadioButton;
    RB4: TRadioButton;
    RB5: TRadioButton;
    RB6: TRadioButton;
    btnForward: TBitBtn;
    btnBack: TBitBtn;
    q: TOilQuery;
    BitBtn3: TBitBtn;
    qA: TOilQuery;
    bbOk: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Init;
    procedure ShowCurrentQuestion;
    procedure btnForwardClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    function SaveCurrentAnswer: Boolean;
    procedure bbOkClick(Sender: TObject);
    procedure RB1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CurQNumber:integer;
    AnketaNumber:integer;
    NumOfQuestions:integer;
    Buttons:array[1..NumOfButtons] of PRadioButton;
    Results,PastResults:string;
    AutoForward: Boolean;
  end;

var
  AnketaForm: TAnketaForm;

function MakeAnketing(Title:string;AnketaNumber:integer; PastResult:string; var Res:string):Boolean;

implementation

{$R *.DFM}

function MakeAnketing(Title:string;AnketaNumber:integer; PastResult:string; var Res:string):Boolean;
var F: TAnketaForm;
begin
     Application.CreateForm(TAnketaForm,F);
     F.Caption:=Title;
     F.AnketaNumber:=AnketaNumber;
     F.Results:=PastResult;
     F.PastResults:=PastResult;
     try
        F.Init;
        if F.ShowModal=mrOk then begin
           Res:=F.Results;
           result:=TRUE;
        end else result:=FALSE;
     finally
        F.Free;
     end;
end;

function TAnketaForm.SaveCurrentAnswer: Boolean;
var i:integer;
begin
     for i:=1 to qA.RecordCount do
         if Buttons[i].Checked then begin
            Results[CurQNumber]:=chr(ord('0')+i);
            result:=TRUE;
            exit;
         end;
     result:=FALSE;
end;

procedure TAnketaForm.ShowCurrentQuestion;
var i,n:integer;
begin
     AutoForward:=FALSE;
     panelQ.Caption:=q.FieldByName('text').AsString;
     if qA.Active then qA.Close;
     qA.SQL.Text:='select * from oil_anketa_a where anketa_q_id='+q.FieldByName('id').AsString+' order by numb';
     qA.Open;
     if qA.RecordCount>NumOfButtons then
        Raise Exception.Create(TranslateText('Кол-во вариантов ответов на один из вопросов превышает допустимое'));
     for i:=1 to NumOfButtons do
         if i<=qA.RecordCount then begin
            Buttons[i].Visible:=TRUE;
            Buttons[i].Caption:=qA.FieldByName('text').AsString;
            qA.Next;
         end else Buttons[i].Visible:=FALSE;

     if CurQNumber=1 then btnBack.Visible:=FALSE
                     else btnBack.Visible:=TRUE;
     if CurQNumber=NumOfQuestions then btnForward.Visible:=FALSE
                                  else btnForward.Visible:=TRUE;

     n:=ord(Results[CurQNumber])-ord('0');
     if n>NumOfButtons then
        Raise Exception.Create(TranslateText('Номер предыдущего ответа на один из вопросов превышает кол-во ответов'));

     if n=0 then begin
        for i:=1 to NumOfButtons do
            Buttons[i].Checked:=FALSE;
     end else Buttons[n].Checked:=TRUE;
     AutoForward:=TRUE;
end;

procedure TAnketaForm.Init;
var i:integer;
begin
     if q.Active then q.Close;
     q.Sql.Text:='select * from oil_anketa_q where anketa_num='+IntToStr(AnketaNumber)+' order by numb';
     q.Open;
     NumOfQuestions:=q.RecordCount;
     if NumOfQuestions=0 then
        Raise Exception.Create(TranslateText('Не найдены вопросы по анкете №')+IntToStr(AnketaNumber));

     if length(Results)>q.RecordCount then
        Raise Exception.Create(TranslateText('Кол-во вопросов в прошлом варианте ответов превышает текущее'));

     for i:=length(Results)+1 to q.RecordCount do
         Results:=Results+'0';

     CurQNumber:=1;
     ShowCurrentQuestion;
     AutoForward:=TRUE;
end;

procedure TAnketaForm.FormCreate(Sender: TObject);
begin
  inherited;
     AutoForward:=FALSE;
     Buttons[1]:=@RB1;
     Buttons[2]:=@RB2;
     Buttons[3]:=@RB3;
     Buttons[4]:=@RB4;
     Buttons[5]:=@RB5;
     Buttons[6]:=@RB6;
end;

procedure TAnketaForm.btnForwardClick(Sender: TObject);
begin
     if not SaveCurrentAnswer then exit;
     inc(CurQNumber);
     q.Next;
     ShowCurrentQuestion;
end;

procedure TAnketaForm.btnBackClick(Sender: TObject);
begin
     if not SaveCurrentAnswer then exit;
     dec(CurQNumber);
     q.Prior;
     ShowCurrentQuestion;
end;

procedure TAnketaForm.BitBtn3Click(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

procedure TAnketaForm.bbOkClick(Sender: TObject);
begin
    if PastResults<>Results then
       if MessageDlg(TranslateText('Анкета была изменена. Сохранить изменения?'),mtConfirmation,[mbYes,mbNo],0)=mrYes then begin
          if not SaveCurrentAnswer then exit
       end else exit;
    ModalResult:=mrOk;
end;

procedure TAnketaForm.RB1Click(Sender: TObject);
begin
    if btnForward.Visible and AutoForward then btnForward.Click;
end;

end.
