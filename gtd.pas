unit gtd;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  EditBase, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, Db, MemDS,
  DBAccess, Ora,uOilQuery,uOilStoredProc;

type
  TGtdForm = class(TEditBaseForm)
    Panel1: TPanel;
    Panel4: TPanel;
    deDate: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    edNum: TEdit;
    Label3: TLabel;
    ceDog: TComboEdit;
    Label4: TLabel;
    Label5: TLabel;
    lblFrom: TLabel;
    lblTo: TLabel;
  procedure Init; override;
  procedure Test; override;
  procedure Save; override;
    procedure ceDogButtonClick(Sender: TObject);
  private
    { Private declarations }
    DOG_ID,DOG_INST: integer;
  public
    { Public declarations }
  end;

var
  GtdForm: TGtdForm;

implementation

{$R *.DFM}

uses Main, DogRef, ExFunc;

{ TGtdForm }
//===================================================================================
procedure TGtdForm.Init;
begin
  inherited;
  if ID=0 then begin
    deDate.Date:=Date;
    lblFrom.Caption:='';
    lblTo.Caption:='';
    DOG_ID:=0; DOG_INST:=0;
  end else begin
    FillControls(q,
      [edNum, deDate, ceDog, lblFrom, lblTo],
      ['num', 'date_', 'dog', 'from_name', 'to_name']);
    DOG_ID:=q['dog_id'];
    DOG_INST:=q['dog_inst'];
  end;
end;
//===================================================================================
procedure TGtdForm.Save;
begin
  DBSaver.SaveRecord('OIL_GTD',
    ['id',      ID,
     'inst',    INST,
     'state',   'Y',
     'date_',   deDate.Date,
     'num',     edNum.Text,
     'dog_id',  DOG_ID,
     'dog_inst',DOG_INST
    ]);
end;
//===================================================================================
procedure TGtdForm.Test;
begin
  if edNum.Text='' then raise exception.create(TranslateText('Не введен номер!'));
  if DOG_ID = 0 then raise exception.create(TranslateText('Не введен договор!'));
end;
//===================================================================================
procedure TGtdForm.ceDogButtonClick(Sender: TObject);
var F: TDogRefForm;
begin
  F:=TDogRefForm.Create(Application);
  F.rbNo.Checked:=true;
  F.gbDogType.Enabled:=false;
  if F.ShowModal = mrOK then begin
    DOG_ID := F.q.FieldByName('id').AsInteger;
    DOG_INST := F.q.FieldByName('inst').AsInteger;
    ceDog.Text := F.q.FieldByName('dog').AsString;
    lblFrom.Caption := F.q.FieldByName('from_name').AsString;
    lblTo.Caption := F.q.FieldByName('to_name').AsString;
  end;
end;
//===================================================================================
end.
