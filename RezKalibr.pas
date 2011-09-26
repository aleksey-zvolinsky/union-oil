unit RezKalibr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl, Db, DBTables,
  DBCtrls, uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess,
  OraSmart, DBGridEh;

type
  TRezKalForm = class(TCommonForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    Panel5: TPanel;
    Splitter2: TSplitter;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Splitter3: TSplitter;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    RxDBGrid1: TDBGridEh;
    RxDBGrid2: TDBGridEh;
    RxDBGrid3: TDBGridEh;
    Table1: TOraTable;
    Table2: TOraTable;
    Table3: TOraTable;
    DataSource1: TOraDataSource;
    DataSource2: TOraDataSource;
    DataSource3: TOraDataSource;
    Table3ID: TFloatField;
    Table3INST: TFloatField;
    Table3STATE: TStringField;
    Table3BELT_ID: TFloatField;
    Table3BELT_INST: TFloatField;
    Table3HGT_MM: TFloatField;
    Table3VOL_PLUS: TFloatField;
    Table2ID: TFloatField;
    Table2INST: TFloatField;
    Table2STATE: TStringField;
    Table2REZ_ID: TFloatField;
    Table2REZ_INST: TFloatField;
    Table2HGT_CM: TFloatField;
    Table2VOLUME: TFloatField;
    Table1ID: TFloatField;
    Table1INST: TFloatField;
    Table1STATE: TStringField;
    Table1REZ_ID: TFloatField;
    Table1REZ_INST: TFloatField;
    Table1BELT_NO: TFloatField;
    Table1BELT_BOTTOM_HGT: TFloatField;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    RezQuery: TOilQuery;
    RezQueryID: TFloatField;
    RezQueryID_ORG: TFloatField;
    RezQuerySTATE: TStringField;
    RezQueryINST: TFloatField;
    RezQueryNAME: TStringField;
    RezQueryCAPACITY: TStringField;
    RezQueryDEAD: TFloatField;
    RezQueryNUM: TStringField;
    RezQueryINST_ORG: TFloatField;
    RezQueryDATE_MOD: TDateTimeField;
    RezQueryUB_KAT: TFloatField;
    RezQueryDNO_CORR: TFloatField;
    RezQueryLAST_CAL_DATE: TDateTimeField;
    RezQueryID_1: TFloatField;
    RezQuerySTATE_1: TStringField;
    RezQueryNAME_1: TStringField;
    NextBeltQ: TOilQuery;
    NextBeltQBELT_BOTTOM_HGT: TFloatField;
    sBeltquery: TOilQuery;
    sCmQuery: TOilQuery;
    sMmQuery: TOilQuery;
    sCmQueryNV: TFloatField;
    sMmQueryNV: TFloatField;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    OrderTable: TOraTable;
    OrderTableID: TFloatField;
    OrderTableINST: TFloatField;
    OrderTableSTATE: TStringField;
    OrderTableREZ_ID: TFloatField;
    OrderTableREZ_INST: TFloatField;
    OrderTableBELT_NO: TFloatField;
    OrderTableBELT_BOTTOM_HGT: TFloatField;
    MaxCmQuery: TOilQuery;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    cbInterpol: TCheckBox;
    InterpolQuery: TOilQuery;
    InterpolQueryID: TFloatField;
    InterpolQueryINST: TFloatField;
    InterpolQuerySTATE: TStringField;
    InterpolQueryREZ_ID: TFloatField;
    InterpolQueryREZ_INST: TFloatField;
    InterpolQueryHGT_CM: TFloatField;
    InterpolQueryVOLUME: TFloatField;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    mmInserTOilQuery: TOilQuery;
    DelQuery1: TOilQuery;
    DelQuery2: TOilQuery;
    cbHorizont: TCheckBox;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    cmBitBtn: TBitBtn;
    mmBitBtn: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
    procedure Panel5Resize(Sender: TObject);
    procedure Panel6Resize(Sender: TObject);
    procedure Panel3CanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure Table2AfterInsert(DataSet: TDataSet);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Table1AfterEdit(DataSet: TDataSet);
    procedure Table3AfterInsert(DataSet: TDataSet);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure cmBitBtnClick(Sender: TObject);
    procedure mmBitBtnClick(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure DataSource3DataChange(Sender: TObject; Field: TField);
    procedure Table2AfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
    steps:  integer;
  public
    { Public declarations }
    rez_id, rez_inst   :integer; // ид инст резервуара, на которій составляем калибровочную таблицу
    Max_cm, min_cm     :integer;
    InsFlag            :boolean;
    belt_id, belt_inst :integer;
  end;

var
  RezKalForm: TRezKalForm;

procedure KalibrateRezervuar(Id,Inst:integer);

implementation

{$R *.DFM}

uses Main, oilstd;

procedure TRezKalForm.SpeedButton1Click(Sender: TObject);
// Свертывание в полосочку-развертывание панели
begin
  if (Sender as TSpeedButton).down then
    ((Sender as TSpeedButton).Parent as TPanel).Height := 19
  else
    ((Sender as TSpeedButton).Parent as TPanel).Height := 100;
end;

procedure TRezKalForm.Panel3Resize(Sender: TObject);
// При развертывании или ручном свертывании панели кнопка должна принять вид
begin
  if Panel3.Height < 19 then
    Panel3.Height:=19;
  SpeedButton1.Down:= (Panel3.Height <=19);
end;

procedure TRezKalForm.Panel5Resize(Sender: TObject);
// При развертывании или ручном свертывании панели кнопка должна принять вид
begin
  if Panel5.Height < 19 then
    Panel5.Height:=19;
  SpeedButton2.Down:= (Panel5.Height <=19);
end;

procedure TRezKalForm.Panel6Resize(Sender: TObject);
// При развертывании или ручном свертывании панели кнопка должна принять вид
begin
   if Panel6.Height < 19 then
    Panel6.Height:=19;
  SpeedButton3.Down:= (Panel6.Height <=19);
end;

procedure TRezKalForm.Panel3CanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
// Уменьшить высоту панели ниже минимальной никак нельзя
begin
  if NewHeight < 19 then //Newheight:= 19;
  //Resize:=true;
  Resize:=false;
end;



procedure TRezKalForm.SpeedButton2Click(Sender: TObject);
// Минимизация средней панели обрабатывается особым образом
begin
  if SpeedButton2.Down then
    Panel6.Height:=Panel4.Height-Splitter2.Height-19
  else
    Panel6.Height:=Panel4.Height-Splitter2.Height-100;
end;

procedure TRezKalForm.FormShow(Sender: TObject);
// При открытии формы следует проинициализировать справочные поля и открыть таблицы
begin
  RezQuery.Close;
  Rezquery.ParamByName('id').asInteger:=rez_id;
  RezQuery.ParamByName('inst').asInteger:=rez_inst;
  RezQuery.open;
  Edit1.Text:=RezQuery.fieldByName('num').asString;
  Edit2.Text:=RezQuery.fieldByName('name').asString;
  Edit3.Text:=RezQuery.fieldByName('name_1').asString;
  Edit4.Text:=RezQuery.fieldByName('Capacity').asString;
  Edit5.Text:=RezQuery.fieldByName('Dead').asString;
  Edit6.Text:=RezQuery.fieldByName('dno_corr').asString;
  Edit7.Text:=RezQuery.fieldByName('last_cal_date').asString;
  Table1.Close;
  Table1.Filter:='rez_id = '+IntToStr(rez_id)+
        ' and rez_inst = '+IntToStr(Rez_inst) +
        ' and state = ''Y''';
  NextBeltQ.Open;
  Table1.Open;
end;

procedure TRezKalForm.DataSource1DataChange(Sender: TObject;
  Field: TField);
// при изменении пояса изменяем и характерные для него субтаблицы.
begin
  if Datasource1.State = dsBrowse then
  begin
    Min_cm:= Trunc(Table1.FieldByName('BELT_BOTTOM_HGT').asFloat/10) + 1;
    Table2.Close;
    Table2.Filter:= 'state = ''Y''' +
           ' and rez_id = ' + IntToStr(Rez_id) +
           ' and rez_inst = ' +IntToStr (Rez_inst) +
           ' and hgt_cm >= '+ IntToStr(min_cm);
    if NextBeltQ.RecordCount > 0 then
    begin
      Max_cm:= Trunc(NextBeltQ.FieldByName('BELT_BOTTOM_HGT').asFloat/10) +1;
    end
    else
      Max_cm:=1000000;
    Table2.Filter:= Table2.Filter+
           ' and hgt_cm < '+ IntToStr(max_cm);
    Steps:=2;
    Table2.Open;
    if not Table1.FieldByName('ID').isNull then
    begin
      Table3.Close;
      Table3.Filter:= 'state = ''Y''' +
             ' and belt_id = ' + Table1.FieldByName('ID').asString+
             ' and belt_inst = ' + Table1.FieldByName('INST').asString;
      Table3.Open;
    end;
    SpeedButton10.Enabled:=false;
    SpeedButton11.Enabled:=false;
  end
  else
  begin
    SpeedButton10.Enabled:=true;
    SpeedButton11.Enabled:=true;
  end;
end;

procedure KalibrateRezervuar(Id,Inst:integer);
var F: TRezKalForm;
begin
     Application.CreateForm(TRezKalForm,F);
     F.rez_id:=Id;
     F.rez_inst:=Inst;
     F.ShowModal;
     F.Free;
end;

procedure TRezKalForm.Table1AfterInsert(DataSet: TDataSet);
// При добавлении пояса инициализируем поля, которые не вводятся вручную.
begin
  SBelTQuery.Open;
  Table1.FieldByName('ID').asInteger:=SBeltquery.Fields[0].asInteger;
  SBelTQuery.close;
  Table1.FieldByName('Inst').asInteger:=INST;
  Table1.FieldByName('State').asString:='Y';
  Table1.FieldByName('Rez_id').asInteger:=rez_id;
  Table1.FieldByName('Rez_inst').asInteger:=rez_inst;
  Table1.FieldByName('belt_no').asInteger:=9999;
  insFlag:=true;
  Belt_id:=Table1.FieldByName('ID').asInteger;
  Belt_inst:=Table1.FieldByName('Inst').asInteger;
end;

procedure TRezKalForm.SpeedButton4Click(Sender: TObject);
// Обработчик кнопки "Добавить"
begin
  Table1.Insert;
end;

procedure TRezKalForm.SpeedButton5Click(Sender: TObject);
// Обработчик кнопки "Удалить"
begin
  DelQuery1.ExecSQL;
  Table1.Refresh;
end;

procedure TRezKalForm.Table1AfterPost(DataSet: TDataSet);
// После добавления/изменения строки следует заново перенумеровать пояса резервуара
var
  i,cnt  :integer;
begin
  Table1.Close;
  OrderTable.Close;
  OrderTable.Filter:=Table1.Filter;
  OrderTable.Open;
  OrderTable.First;
  cnt := OrderTable.RecordCount;
{  i:=1;
  while not OrderTable.Eof do
  begin
    OrderTable.Edit;
    OrderTable.fieldByName('BELT_NO').asInteger:=i;
    OrderTable.Post;
    i:=i+1;
    OrderTable.Next;
  end;
}
  for i:=1 to cnt do
  begin
    OrderTable.Edit;
    OrderTable.fieldByName('BELT_NO').asInteger:=i;
    OrderTable.Post;
    OrderTable.Next;
  end;
  OrderTable.Close;
  Table1.Open;
  if insflag then
  begin
    for i := 1 to 9 do
    begin
      mmInserTOilQuery.close;
      mmInserTOilQuery.prepare;
      sMMQuery.Open;
      mmInserTOilQuery.ParamByName('id').asInteger:= sMMQueryNV.asInteger;
      sMMQuery.Close;
      mmInserTOilQuery.ParamByName('inst').asInteger:= INST;
      mmInserTOilQuery.ParamByName('belt_id').asInteger:= belt_id;
      mmInserTOilQuery.ParamByName('belt_inst').asInteger:= belt_inst;
      mmInserTOilQuery.ParamByName('hgt_mm').asInteger:= i;
      mmInserTOilQuery.ExecSQL;
    end;
  end;
end;

procedure TRezKalForm.Table2AfterInsert(DataSet: TDataSet);
// при добавлении сантиметра тоже инициализируем поля, которые не вводятся вручную.
var
  prevv, aver, kuku            :real;
  oldcm,nocm, maxsteps                :integer;
begin
  sCmQuery.Open;
  Table2.FieldByName('ID').asInteger:= sCmQueryNV.asInteger;
  sCmQuery.Close;
  Table2.FieldByName('INST').asInteger:= INST;
  Table2.FieldByName('STATE').asString:='Y';
  Table2.FieldByName('REZ_ID').asInteger:= rez_id;
  Table2.FieldByName('REZ_INST').asInteger:= rez_inst;
  MaxCmQuery.Close;
  MaxCmQuery.ParamByName('Max_cm').asInteger:=Max_cm;
  MaxCmQuery.ParamByName('Min_cm').asInteger:=Min_cm;
  MaxCmQuery.ParamByName('REZ_ID').asInteger:= rez_id;
  MaxCmQuery.ParamByName('REZ_INST').asInteger:= rez_inst;
  nocm:=min_cm;
  MaxCmQuery.Open;
  MaxCmQuery.First;
  while nocm = MaxCmQuery.FieldByName('Hgt_cm').asInteger do
  begin
    MaxCmQuery.Next;
    nocm:=nocm+1;
  end;
  Table2.FieldByName('HGT_CM').asInteger:= nocm;
  if Table2.FieldByName('HGT_CM').asInteger >= max_cm then
  begin
    if cbHorizont.Checked then
    begin
      Table2.Cancel;
      Table1.Next;
      Table2.Insert;
      Exit;
    end
    else
    begin
      Table2.Cancel;
      ShowMessage(TranslateText('Калибровочная таблица для этого пояса заполнена. Вставлять строку не требуется'));
      Exit;
    end;
  end;
  // Теперь самое сложное - инетрполяция
  if cbInterpol.Checked then
  begin
    InterpolQuery.Close;
    InterpolQuery.ParamByName('rez_id').asInteger:= rez_id;
    InterpolQuery.ParamByName('rez_inst').asInteger:=rez_inst;
    InterPolQuery.ParamByName('max_cm').asInteger:=
        Table2.FieldByName('HGT_CM').asInteger-1;
    InterPolQuery.ParamByName('min_cm').asInteger:=
        Table2.FieldByName('HGT_CM').asInteger - steps - 1;
    InterpolQuery.Open;
    InterpolQuery.First;
    prevv := -1;
    aver := 0;
    If  (Table2.FieldByName('HGT_CM').asInteger > min_cm + steps)
      or (cbHorizont.Checked and (Table2.FieldByName('HGT_CM').asInteger > steps))
    then
    begin
      while not InterpolQuery.Eof do
      begin
        if prevv = -1 then
        begin
          prevv:= InterpolQuery.FieldByName('Volume').asFloat;
          oldcm:= InterpolQuery.FieldByName('hgt_cm').asInteger;
        end
        else
        begin
          kuku:= InterpolQuery.FieldByName('Volume').asFloat;
          aver:= aver + (kuku - prevv)/
              (InterpolQuery.FieldByName('hgt_cm').asInteger - oldcm);
          prevv:=kuku;
          oldcm:=InterpolQuery.FieldByName('hgt_cm').asInteger;
        end;
        InterPolQuery.Next;
      end;
      aver:= aver/steps;
      Table2.FieldByName('Volume').asFloat:= round05((prevv + aver)*1000)/1000;
      if cbHorizont.Checked then
        maxsteps:=9
      else
        maxsteps:=64;
      if (steps >= 2) and (steps <= maxsteps) then
        steps:= steps+1;
    end;
  end;
end;

procedure TRezKalForm.SpeedButton7Click(Sender: TObject);
// Добавление строки в таблицу сантиметровых взливов
begin
  Table2.Insert;
end;

procedure TRezKalForm.SpeedButton8Click(Sender: TObject);
// Уменьшение сантиметрового взлива на 1 л
begin
  Table2.FieldByName('Volume').asFloat := Table2.FieldByName('Volume').asFloat - 0.001;
end;

procedure TRezKalForm.SpeedButton9Click(Sender: TObject);
// Увеличение сантиметрового взлива на 1 л
begin
  Table2.FieldByName('Volume').asFloat := Table2.FieldByName('Volume').asFloat + 0.001;
end;

procedure TRezKalForm.Table1AfterEdit(DataSet: TDataSet);
// Сброс флага "Произошел ИНСЕРТ"
begin
  insflag:=false;
end;

procedure TRezKalForm.Table3AfterInsert(DataSet: TDataSet);
// Ручной инсерт милиметрового взлива запрещен
begin
  Table3.Cancel;
end;

procedure TRezKalForm.SpeedButton6Click(Sender: TObject);
// Удаление сантиметрового взлива
begin
  DelQuery2.ExecSQL;
  Table2.Refresh;
end;

procedure TRezKalForm.SpeedButton10Click(Sender: TObject);
// Обработчики кнопок "Ок" и "Cancel"
begin
  Table1.Post;
end;

procedure TRezKalForm.SpeedButton12Click(Sender: TObject);
// Обработчики кнопок "Ок" и "Cancel"
begin
  Table2.Post;
end;

procedure TRezKalForm.SpeedButton14Click(Sender: TObject);
// Обработчики кнопок "Ок" и "Cancel"
begin
  Table3.Post;
end;

procedure TRezKalForm.SpeedButton11Click(Sender: TObject);
// Обработчики кнопок "Ок" и "Cancel"
begin
  Table1.Cancel;
end;

procedure TRezKalForm.SpeedButton13Click(Sender: TObject);
// Обработчики кнопок "Ок" и "Cancel"
begin
  Table2.Cancel;
end;

procedure TRezKalForm.SpeedButton15Click(Sender: TObject);
// Обработчики кнопок "Ок" и "Cancel"
begin
  Table3.Cancel;
end;

procedure TRezKalForm.cmBitBtnClick(Sender: TObject);
// Эта ппроцедура находит сантиметровый взлив делит его на десять и разносит
var
  oldvol                :real;
begin
  oldvol:=table2.FieldByName('volume').asFloat;
  Table2.Next;
  Oldvol:=table2.FieldByName('volume').asFloat - oldvol;
  Table2.Prior;
  Table3.First;
  while not Table3.EOF do
  begin
    Table3.Edit;
    Table3.FieldByName('vol_plus').asFloat:=
        round05(OldVol*Table3.FieldByName('hgt_mm').asInteger*100)/1000;
    Table3.Post;
    Table3.Next;
  end;
end;

procedure TRezKalForm.mmBitBtnClick(Sender: TObject);
// Эта процедура расчитывает значения милиметрового взлива по одному,
// введеному вручную
var
  oldvol          :real;
begin
  oldvol:=table3.FieldByName('vol_plus').asFloat/
      Table3.FieldByName('hgt_mm').asInteger;
  Table3.First;
  while not Table3.EOF do
  begin
    Table3.Edit;
    Table3.FieldByName('vol_plus').asFloat:=
        round05(OldVol*Table3.FieldByName('hgt_mm').asInteger*1000)/1000;
    Table3.Post;
    Table3.Next;
  end;
end;

procedure TRezKalForm.DataSource2DataChange(Sender: TObject;
  Field: TField);
begin
// Кнопки "Ок" и "Cancel" доступны только в режиме редактирования записи
  SpeedButton12.Enabled:= not (Datasource2.State = dsBrowse);
  SpeedButton13.Enabled:= not (Datasource2.State = dsBrowse);
  SpeedButton8.Enabled:= not (Datasource2.State = dsBrowse);
  SpeedButton9.Enabled:= not (Datasource2.State = dsBrowse);
  CmBitBtn.Enabled := Table2.active and not Table2.Eof;
end;

procedure TRezKalForm.DataSource3DataChange(Sender: TObject;
  Field: TField);
begin
// Кнопки "Ок" и "Cancel" доступны только в режиме редактирования записи
  SpeedButton14.Enabled:= not (Datasource3.State = dsBrowse);
  SpeedButton15.Enabled:= not (Datasource3.State = dsBrowse);
end;

procedure TRezKalForm.Table2AfterCancel(DataSet: TDataSet);
// Если мы отказались вводить очередное значение, то начинаем работу
// интерполятора с двух шагов
begin
  steps:=2;
end;

end.
