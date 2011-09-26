unit SetNum;
{ ---------------------------
  Created by Urise 01.10.2004
  ---------------------------
  Каждый номер, который можно менять - это сиквенс.
  Список сиквенсов, которые можно менять с помощью этой формы берется из
  таблицы EXE_SEQUENCES, это - записи с show_in_form='Y' (см.запрос q)

  Если сиксенс по какой-то причине не существует, он выводится красным цветом и
  создается на нажатие кнопки "Принять"

  Для того, чтобы добавить сиквенс в эту форму необходимо внести в таблицу
  exe_sequences соответствующий сиквенс (если его там раньше не было) и проставить
  ему show_in_form='Y' и заполнить поле description описанием того, что это за номер
  (оно будет отображаться в гриде).
  Это делается с помощью Supervisor и рассылается пакетами. 

}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MemDS, DBAccess, Ora, Db, DBTables, MemTable, Grids, DBGridEh, StdCtrls,
  Buttons, ExtCtrls, uStart, uCommonForm,uOilQuery,uOilStoredProc;

type
  TSetNumForm = class(TCommonForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    DBGridEh1: TDBGridEh;
    mt: TMemoryTable;
    ds: TOraDataSource;
    mtDESCRIPTION: TStringField;
    mtNUM: TFloatField;
    mtNUM_OLD: TFloatField;
    q: TOilQuery;
    mtSEQUENCE_NAME: TStringField;
    mtDEF_NUM: TFloatField;
    function Changed: Boolean;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure bbOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mtBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetNumForm: TSetNumForm;

implementation

{$R *.DFM}

uses UDbFunc;
//==============================================================================
procedure TSetNumForm.FormShow(Sender: TObject);
begin
  _OpenQueryOra(q);
  CopyToMemoryTable(q,mt,'DESCRIPTION,NUM,SEQUENCE_NAME,DEF_NUM,NUM_OLD');
end;
//==============================================================================
procedure TSetNumForm.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (mtNum_Old.AsInteger=0) and (Column.FieldName='DESCRIPTION') then
    AFont.Color:=clRed;
end;
//==============================================================================
function TSetNumForm.Changed: Boolean;
begin
  mt.First;
  result:=FALSE;
  while not mt.Eof do begin
    if mtNum_Old.AsInteger<>mtNum.AsInteger then begin
      result:=TRUE; exit;
    end;
    mt.Next;
  end;
end;
//==============================================================================
procedure TSetNumForm.bbOkClick(Sender: TObject);
begin
  mt.First;
  while not mt.Eof do begin
    if mtNum_Old.AsInteger<>mtNum.AsInteger then
      _ExecProcOra('OILT.SetSequenceValue',
        ['p_Seq',       mtSequence_Name.AsString,
         'p_Value',     mtNum.AsInteger]);
    mt.Next;
  end;
  ModalResult:=mrOk;
end;
//==============================================================================
procedure TSetNumForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (ModalResult<>mrOk) and Changed and
      (MessageDlg(TranslateText('Вы уверены, что хотите выйти без сохранения изменений?'),mtWarning,[mbYes,mbNo],0)=mrNo)
  then
    Action:=caNone;
end;
//==============================================================================
procedure TSetNumForm.mtBeforePost(DataSet: TDataSet);
begin
  if mtNum.AsInteger<=0 then
    mtNum.AsInteger:=mtDef_Num.AsInteger;
end;
//==============================================================================
end.
