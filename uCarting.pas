unit uCarting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EditBase, DB, MemDS, DBAccess, Ora, uOilQuery, StdCtrls,
  Buttons, ExtCtrls, Mask, ToolEdit, Grids, DBGridEh, DBTables, MemTable,
  ActnList;

type
  TCartingForm = class(TEditBaseForm)
    pnlHeader: TPanel;
    pnlDetails: TPanel;
    ceClient: TComboEdit;
    grDetail: TDBGridEh;
    meMobTel: TMaskEdit;
    deBegin: TDateEdit;
    deEnd: TDateEdit;
    lbClient: TLabel;
    lbMobTel: TLabel;
    lbBeginDate: TLabel;
    lbEndDate: TLabel;
    dsDetail: TDataSource;
    mtDetail: TMemoryTable;
    mtDetailID: TIntegerField;
    mtDetailINST: TIntegerField;
    mtDetailCARD_NUMBER: TIntegerField;
    mtDetailIS_REGULAR: TIntegerField;
    mtDetailOPER_NAME: TStringField;
    mtDetailOPER_ID: TFloatField;
    sbDel: TSpeedButton;
    ActionList: TActionList;
    actDeleteRecord: TAction;
    procedure grDetailColumns1EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure ceClientChange(Sender: TObject);
    procedure actDeleteRecordExecute(Sender: TObject);
    procedure mtDetailBeforeInsert(DataSet: TDataSet);
  private
    FClientId, FClientInst: integer;  // клієнт
    InInit: Boolean;
  public
    procedure Save();override;
    procedure Test();override;
    procedure Init();override;
  end;

var
  CartingForm: TCartingForm;

implementation
uses OperTypeRef, ChooseOrg, Main, uDbFunc, ExFunc, uCardBlank, uCommonForm;

{$R *.dfm}

procedure TCartingForm.Save();
begin
  DbSaver.ExecSql('update CARD_CARTING set state=''N'' where id=:id and inst=:inst and state=''Y'' ',
    ['id',ID,
     'inst',INST]);
  ID := DBSaver.SaveRecord('CARD_CARTING',
      ['id',          ID,
       'inst',        INST,
       'state',       'Y',
       'client_id',   FClientId,
       'client_inst', FClientInst,
       'mob_tel',     '80'+meMobTel.Text,
       'date_begin',  deBegin.Date,
       'date_end',    deEnd.Date
      ]);
  mtDetail.First;
  while not mtDetail.Eof do
  begin
    DBSaver.SaveRecord('CARD_CARTING_DET',
      ['id',           0,
       'inst',         INST,
       'state',        'Y',
       'carting_id',   ID,
       'carting_inst', INST,
       'card_number',  mtDetailCARD_NUMBER.AsInteger,
       'oper_id',      mtDetailOPER_ID.AsInteger,
       'is_regular',   mtDetailIS_REGULAR.AsInteger
      ]);
    mtDetail.Next;
  end;
end;
//------------------------------------------------------------------------------
procedure TCartingForm.Test();
begin
  if ceClient.Text='' then
    raise Exception.Create(TranslateText('Не определен клиент!'));
  if deBegin.Text = '' then
    raise Exception.Create(TranslateText('Не определена начальная дата!'));
  if deEnd.Text = '' then
    raise Exception.Create(TranslateText('Не определена конечная дата!'));
  if deBegin.Date > deEnd.Date then
    raise Exception.Create(TranslateText('Дата конца периода меньше, чем дата начала!'));
  if meMobTel.Text='' then
    raise Exception.Create(TranslateText('Не введен мобильный телефон клиента!'));
  if mtDetail.IsEmpty then
    raise Exception.Create(TranslateText('Не определена табличная часть!'));
  mtDetail.DisableControls;
  try
    mtDetail.First;
    while not mtDetail.Eof do
    begin
      if Length(mtDetailCARD_NUMBER.AsString)<>9 then
        raise Exception.Create(TranslateText('Не правильная длина номера карты!'));
      if mtDetailOPER_ID.IsNull or (mtDetailOPER_ID.AsInteger=0)then
        raise Exception.Create(TranslateText('Не определена услуга для карты: ')+mtDetailCARD_NUMBER.AsString);
      mtDetail.Next;
    end;
  finally
    mtDetail.EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TCartingForm.Init();
var mob: string;
begin
  inherited Init;
  if ID=0 then
  begin
    mtDetail.Active := False;
    mtDetail.EmptyTable;
    mtDetail.Active := True;
    deBegin.Date := Now;
  end
  else
  begin
    q.Close;
    _OpenQueryPar(q,
      ['id', ID,
       'inst', INST]);
    FillIntegers(q,
      [@FClientId, @FClientInst],
      ['client_id', 'client_inst']);
    FillControls(q,
      [deBegin, deEnd, ceClient],
      ['date_begin', 'date_end', 'client_name']);
    mob := q.FieldByName('mob_tel').AsString;
    if (mob[1]='8') and (mob[2]='0') then
      mob := copy(mob, 3, 9);
    meMobtel.text := mob;
    InInit := True;
    CopyToMemoryTable(q, mtDetail, 'ID,INST,CARD_NUMBER,OPER_ID,OPER_NAME,IS_REGULAR');
    InInit := False;
  end;
end;
//------------------------------------------------------------------------------


procedure TCartingForm.grDetailColumns1EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  OperTypeForm: TOperTypeRefForm;
begin
  inherited;
  OperTypeForm := TOperTypeRefForm.Create(Self);
  OperTypeForm.SgrpId := 20;
  OperTypeForm.ShowModal;
  if OpertypeForm.ModalResult = mrOK then
    begin
      mtDetail.Edit;
      mtDetailOPER_ID.AsInteger := OperTypeForm.qID.AsInteger;
      mtDetailOPER_NAME.AsString := OperTypeForm.qNAME.AsString;
    end;
  OperTypeForm.Free;
end;

procedure TCartingForm.ceClientChange(Sender: TObject);
var
  strName: string;
begin
  if CaptureOrg(3, MAIN_ID, INST, 'nny', FClientId, FClientInst, strName) then
    ceClient.Text := strName;
end;

procedure TCartingForm.actDeleteRecordExecute(Sender: TObject);
begin
  if not mtDetail.IsEmpty then
    mtdetail.Delete;
end;

procedure TCartingForm.mtDetailBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.RecordCount > 0) and not InInit then
    if Length(DataSet.FieldByName('CARD_NUMBER').AsString)<>9 then
      raise Exception.Create(TranslateText('Не правильная длина номера карты!'));
end;

end.
