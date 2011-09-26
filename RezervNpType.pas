unit RezervNpType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, uHelpButton,
  uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TRezervNpTypeForm = class(TCommonForm)
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
    procedure grid1Columns0EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure grid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ActiveControlChangeOld: TNotifyEvent;
  public
    { Public declarations }
  end;

var
  RezervNpTypeForm: TRezervNpTypeForm;

implementation

{$R *.DFM}

uses NpTypeRef,Main;

//==============================================================================
procedure TRezervNpTypeForm.CancelEdit;
begin
  if ds.DataSet.State in [dsEdit,dsInsert] then
    ds.DataSet.Cancel;
end;
//==============================================================================
procedure TRezervNpTypeForm.sbDelClick(Sender: TObject);
begin
  with ds.DataSet do begin
    if State in [dsInsert,dsEdit] then Cancel
    else begin
      if FieldByName('first_line').AsString='Y' then exit;
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
procedure TRezervNpTypeForm.grid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if ds.DataSet.FieldByName('state').AsString='N' then
    AFont.Color:=clRed
  else if ds.DataSet.FieldByName('id').AsInteger=0 then
    AFont.Color:=clBlue;
end;
//==============================================================================
procedure TRezervNpTypeForm.Test;
var SL: TStringList;
begin
  SL:=TStringList.Create;
  try
    with ds.DataSet do begin
      First;
      while not Eof do begin
        if FieldByName('STATE').AsString='Y' then begin
          if FieldByName('np_type').AsInteger=0 then
            raise exception.create(TranslateText('Не определен тип НП'));
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
procedure TRezervNpTypeForm.bbOkClick(Sender: TObject);
begin
  Test;
  ModalResult:=mrOk;
end;
//==============================================================================
procedure TRezervNpTypeForm.grid1Columns0EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var F: TNPTypeRefForm;
begin
  Application.CreateForm(TNPTypeRefForm,F);
  if F.ShowModal=mrOk then begin
    with ds.DataSet do begin
      if State=dsBrowse then
        if IsEmpty then Insert
        else Edit;
      FieldByName('np_type_name').AsString:=F.q.FieldByName('name').AsString;
      FieldByName('np_type').AsInteger:=F.q.FieldByName('id').AsInteger;
    end;
  end;
  F.Free;
end;
//==============================================================================
procedure TRezervNpTypeForm.grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#27) and (ds.DataSet.State<>dsBrowse) then
    ds.DataSet.Cancel;
end;
//==============================================================================
procedure TRezervNpTypeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CancelEdit;
end;
//==============================================================================
end.
