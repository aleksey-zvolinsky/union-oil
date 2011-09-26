unit RezervArenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, uHelpButton,
  uCommonForm,uOilQuery,Ora, uOilStoredProc;

const
  REZ_SDAN = 'Сдан в аренду';
  REZ_END = 'Конец аренды';

type
  TRezervArendaForm = class(TCommonForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    grid1: TDBGridEh;
    ds: TOraDataSource;
    sbDel: TSpeedButton;
    OilHelpButton1: TOilHelpButton;
    procedure CancelEdit;
    procedure Test;
    procedure sbDelClick(Sender: TObject);
    procedure grid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure bbOkClick(Sender: TObject);
    procedure grid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grid1Columns1EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ActiveControlChangeOld: TNotifyEvent;
  public
    { Public declarations }
  end;

var
  RezervNpTypeForm: TRezervArendaForm;

implementation

{$R *.DFM}

uses NpTypeRef,Main,ChooseOrg;

//==============================================================================
procedure TRezervArendaForm.CancelEdit;
begin
  if ds.DataSet.State in [dsEdit,dsInsert] then
    ds.DataSet.Cancel;
end;
//==============================================================================
procedure TRezervArendaForm.sbDelClick(Sender: TObject);
begin
  with ds.DataSet do begin
    if State in [dsInsert,dsEdit] then Cancel
    else begin
      Edit;
      if FieldByName('state').AsString='Y' then
        FieldByName('state').AsString:='N'
      else
        FieldByName('state').AsString:='Y';
      Post;
    end;
  end;
end;
//==============================================================================
procedure TRezervArendaForm.grid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if ds.DataSet.FieldByName('state').AsString='N' then
    AFont.Color:=clRed
  else if ds.DataSet.FieldByName('id').AsInteger=0 then
    AFont.Color:=clBlue;
end;
//==============================================================================
procedure TRezervArendaForm.Test;
var SL: TStringList;
begin
  SL:=TStringList.Create;
  try
    with ds.DataSet do begin
      First;
      while not Eof do begin
        if FieldByName('state').AsString='Y' then begin
          if (FieldByName('org_id').AsInteger=0) and (FieldByName('oper_type_name').AsString=REZ_SDAN) then
            raise exception.create(TranslateText('Не определена организация "Кому"'));
          if SL.IndexOf(FieldByName('date_').AsString)<>-1 then
            raise exception.create(TranslateText('Даты не должны повторяться!!!'))
          else
            SL.Add(FieldByName('date_').AsString);
        end;
        ds.DataSet.Next;
      end;
    end;
  finally
    SL.Free;
  end;
end;
//==============================================================================
procedure TRezervArendaForm.bbOkClick(Sender: TObject);
begin
  Test;
  ModalResult:=mrOk;
end;
//==============================================================================
procedure TRezervArendaForm.grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#27) and (ds.DataSet.State<>dsBrowse) then
    ds.DataSet.Cancel
  else Key:=#0;
end;
//==============================================================================
procedure TRezervArendaForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CancelEdit;
end;
//==============================================================================
procedure TRezervArendaForm.grid1Columns1EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  vId,vInst: integer;
  vName: string;
begin
  if CaptureOrg(3,0,0,'yyy',vId,vInst,vName) then begin
    with ds.DataSet do begin
      Edit;
      FieldValues['org_id']:=vId;
      FieldValues['org_inst']:=vInst;
      FieldValues['org_name']:=vName;
      Post;
    end;
  end;
end;
//==============================================================================
procedure TRezervArendaForm.FormCreate(Sender: TObject);
begin
  inherited;
  with grid1.Columns[0].PickList do begin
    Clear;
    Add(REZ_SDAN);
    Add(REZ_END);
  end;
end;
//==============================================================================
end.
