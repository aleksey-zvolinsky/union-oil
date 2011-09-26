unit Auto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask, ToolEdit, CurrEdit, DBCtrls,
  RXDBCtrl, Grids, DBGrids, RxLookup, DBCtrlsEh, DBLookupEh, uCommonForm,
  uOilQuery, Ora, uOilStoredProc, MemDS, DBAccess, DBGridEh, EditBase,
  VirtualTable, GridsEh, DBGridEhGrouping;

type
  TAutoForm = class(TEditBaseForm)
    qType: TOilQuery;
    dsType: TOraDataSource;
    qCheckNumber: TOilQuery;
    pnlBase: TPanel;
    Label7: TLabel;
    dbtGroupName: TDBText;
    Label4: TLabel;
    cbType: TDBLookupComboBox;
    Label1: TLabel;
    eNumber: TDBEdit;
    Label6: TLabel;
    eMark: TDBEdit;
    Label5: TLabel;
    dbeV: TDBEdit;
    dbceDriver: TRxDBComboEdit;
    lEmploy: TLabel;
    Label3: TLabel;
    dbeATP: TDBEdit;
    gbSections: TGroupBox;
    grSections: TDBGridEh;
    qSections: TOraQuery;
    dsSections: TOraDataSource;
    vtSections: TVirtualTable;
    vtSectionsPOSITION: TIntegerField;
    vtSectionsCAPACITY: TFloatField;
    sbDel: TSpeedButton;
    vtSectionsID: TIntegerField;
    vtSectionsINST: TIntegerField;
    procedure dbceDriverButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbTypeClick(Sender: TObject);
    procedure grSectionsExit(Sender: TObject);
    procedure vtSectionsAfterPost(DataSet: TDataSet);
    procedure dbeVChange(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure vtSectionsAfterDelete(DataSet: TDataSet);
    procedure vtSectionsBeforePost(DataSet: TDataSet);
  private
  public
    procedure Init; override;
    procedure Test; override;
    procedure Save; override;
  end;

var
  AutoForm: TAutoForm;

implementation

uses Main, OilStd, EmpRef, AutoRef, UDbFunc;

{$R *.DFM}

//==============================================================================
procedure TAutoForm.dbceDriverButtonClick(Sender: TObject);
var
  vid,vinst: integer;
  vname: string;
begin
  if dbceDriver.DataSource.DataSet.State = dsBrowse then
    dbceDriver.DataSource.DataSet.Edit;
  if TEmpRefForm.Choose(vid,vinst, vname) then
  begin
    dbceDriver.DataSource.DataSet.FieldByName('Employ_Id').Value := vid;
    dbceDriver.DataSource.DataSet.FieldByName('Employ_Inst').Value := vinst;
    dbceDriver.Text := vname;
  end;
end;
//==============================================================================
procedure TAutoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qType.Close;
end;
//==============================================================================
procedure TAutoForm.cbTypeClick(Sender: TObject);
begin
  if qType.FieldByName('ID').AsInteger = 16 then
    dbceDriver.Clear;
  dbceDriver.Enabled := not (qType.FieldByName('ID').AsInteger = 16);
  gbSections.Enabled := (qType.FieldByName('ID').AsInteger in [2, 16]);
end;
//==============================================================================
procedure TAutoForm.Init;
begin
  qType.Open;
  if ID <> 0 then
  begin
    qSections.Close;
    _OpenQueryPar(qSections,
    ['id',   ID,
     'inst', INST]);
    vtSections.Assign(qSections);
    vtSections.Open;
    qSections.Close;
  end
  else
    vtSections.Open;
  cbTypeClick(nil);
  StartSqlOra;
end;
//==============================================================================
procedure TAutoForm.Save;
var
  iID: integer;
begin
  if not (dbceDriver.DataSource.DataSet.State in [dsEdit, dsInsert]) then
    dbeV.DataSource.DataSet.Edit;
  if grSections.SumList.SumCollection[0].SumValue <> 0 then
    dbeV.DataSource.DataSet.FieldByName('CAPACITY').AsString := FloatToStr(grSections.SumList.SumCollection[0].SumValue);
  dbeV.DataSource.DataSet.Post;

  if qType.FieldByName('ID').AsInteger in [2, 16] then
  begin
    _ExecSql('update OIL_AUTO_DETAIL set state = ''N'' where state = ''Y'' and auto_id = :auto_id and auto_inst = :auto_inst',
     ['AUTO_ID',  qCheckNumber.DataSource.DataSet.FieldByName('Id').AsInteger,
      'AUTO_INST', qCheckNumber.DataSource.DataSet.FieldByName('Inst').AsInteger]);
    vtSections.First;
    while not vtSections.Eof do
    begin
      // знаходимо ID із OIL_AUTO_DETAIL
      if vtSections.FieldByName('ID').AsInteger <> 0 then
        iID := vtSections.FieldByName('ID').AsInteger
      else
        iID := GetNextId('OIL_AUTO_DETAIL',
          ['AUTO_ID',   qCheckNumber.DataSource.DataSet.FieldByName('Id').AsInteger,
           'AUTO_INST', qCheckNumber.DataSource.DataSet.FieldByName('Inst').AsInteger],
          'S_OIL_AUTO_DETAIL');

      DbSaver.SaveRecord('OIL_AUTO_DETAIL',
       ['ID',        iID,
        'INST',      vtSections.FieldByName('INST').AsInteger,
        'STATE',     'Y',
        'AUTO_ID',   qCheckNumber.DataSource.DataSet.FieldByName('Id').AsInteger,
        'AUTO_INST', qCheckNumber.DataSource.DataSet.FieldByName('Inst').AsInteger,
        'POSITION',  vtSections.FieldByName('POSITION').AsInteger,
        'CAPACITY',  vtSections.FieldByName('CAPACITY').AsFloat]);
      vtSections.Next;
    end;
  end;
end;
//==============================================================================
procedure TAutoForm.Test;
var
  vt: TVirtualTable;
begin
  if qType.FieldByName('group_id').AsInteger = 5 then
    raise exception.create(TranslateText('Водный транспорт вводится в отдельной форме'));
  if eNumber.Text = '' then
    raise Exception.Create(TranslateText('Введите номер авто !'));
  if (dbceDriver.Text = '') and dbceDriver.Enabled then
    raise Exception.Create(TranslateText('Введите водителя авто !'));
  if cbType.Text = '' then
    raise Exception.Create(TranslateText('Введите тип авто !'));

  qCheckNumber.Close;
  qCheckNumber.ParamByName('Id').Value := qCheckNumber.DataSource.DataSet.FieldByName('Id').Value;
  qCheckNumber.ParamByName('Inst').Value := qCheckNumber.DataSource.DataSet.FieldByName('Inst').Value;
  qCheckNumber.ParamByName('Numb').Value := qCheckNumber.DataSource.DataSet.FieldByName('Numb').Value;
  qCheckNumber.Open;
  if not qCheckNumber.IsEmpty then
    raise Exception.Create(TranslateText('Такой автомобиль уже введен !'));

  vt := TVirtualTable.Create(Self);
  try
    vt.Assign(vtSections);
    vt.Open;
    vtSections.First;
    while not vtSections.Eof do
    begin
      vt.Filtered := False;
      vt.Filter := 'position = '+ vtSections.FieldByName('position').AsString;
      vt.Filtered := True;
      if vt.RecordCount > 1 then
        raise Exception.CreateFmt('Позиция №%s введена больше одного раза!', [vtSections.FieldByName('position').AsString]);

      if vtSections.FieldByName('CAPACITY').AsFloat <= 0 then
        raise Exception.CreateFmt('Позиция №%s имеет неверный объем!', [vtSections.FieldByName('position').AsString]);
      vtSections.Next;
    end;
  finally
    vt.Free;
  end;
end;
//==============================================================================
procedure TAutoForm.grSectionsExit(Sender: TObject);
begin
  if vtSections.State <> dsBrowse then
    vtSections.Post;
end;
//==============================================================================
procedure TAutoForm.vtSectionsAfterPost(DataSet: TDataSet);
begin
  dbeVChange(nil);
end;
//==============================================================================
procedure TAutoForm.dbeVChange(Sender: TObject);
begin
  if grSections.SumList.SumCollection[0].SumValue <> 0 then
    dbeV.Text := FloatToStr(grSections.SumList.SumCollection[0].SumValue);
end;
//==============================================================================
procedure TAutoForm.sbDelClick(Sender: TObject);
begin
  vtSections.Delete;
end;
//==============================================================================
procedure TAutoForm.vtSectionsAfterDelete(DataSet: TDataSet);
begin
  if vtSections.FieldByName('ID').AsInteger <> 0 then
    SetState('OIL_AUTO_DETAIL', vtSections.FieldByName('ID').AsInteger, vtSections.FieldByName('INST').AsInteger, 'N');
end;
//==============================================================================
procedure TAutoForm.vtSectionsBeforePost(DataSet: TDataSet);
begin
  if (vtSections.FieldByName('POSITION').AsString = '') or (vtSections.FieldByName('POSITION').AsString = '0') then
  begin
    if vtSections.State = dsInsert then
      vtSections.FieldByName('POSITION').AsInteger := vtSections.RecordCount + 1
    else
      vtSections.FieldByName('POSITION').AsInteger := vtSections.RecordCount;
  end;

  if vtSections.FieldByName('ID').IsNull then
  begin
    vtSections.FieldByName('ID').AsInteger := 0;
    vtSections.FieldByName('INST').AsInteger := MAIN_ORG.Inst;
  end;
end;
//==============================================================================

end.
