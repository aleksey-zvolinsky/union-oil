unit WagonsCrash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MemDS, DBAccess, Ora, Db, DBTables, MemTable, Grids, DBGridEh, StdCtrls,
  Buttons, ExtCtrls, ImgList, uCommonForm,uOilQuery,uOilStoredProc;

type
  TWagonsCrashForm = class(TCommonForm)
    Panel1: TPanel;
    bbCancel: TBitBtn;
    grid1: TDBGridEh;
    mt: TMemoryTable;
    ds: TOraDataSource;
    mtID: TFloatField;
    mtNAME: TStringField;
    mtDOG: TStringField;
    qLoad: TOilQuery;
    mtCHECKED: TBooleanField;
    mtDOG_DATE: TDateField;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure SaveCrash;
    procedure grid1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WagonsCrashForm: TWagonsCrashForm;

implementation

{$R *.DFM}

uses UDbFunc,uCrypt,OilStd,Main,Passw;
//==============================================================================
procedure TWagonsCrashForm.FormShow(Sender: TObject);
begin
  //grid1.Columns[0].Title.Caption:='';
  _OpenQueryOra(qLoad);
  CopyToMemoryTable(qLoad,mt,'ID,DOG,DOG_DATE,NAME');
  mt.First;
end;
//==============================================================================
procedure TWagonsCrashForm.grid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  grid1.Columns[0].Width:=24;
end;
//==============================================================================
procedure TWagonsCrashForm.BitBtn1Click(Sender: TObject);
begin
  if TestPassword(pwtWagon) then
    SaveCrash;
end;
//==============================================================================
procedure TWagonsCrashForm.SaveCrash;
var vId: integer;
begin
  StartSqlOra;
  mt.First;
  while not mt.Eof do begin
    if mtChecked.AsBoolean then begin
      vId:=GetSeqNextVal('S_OIL_WAGONS_CRASH');
      _ExecProcOra('OIL.INSORUPDOIL_WAGONS_CRASH',
        ['ID#',              vId,
         'INST#',            MAIN_ORG.INST,
         'STATE#',           'Y',
         'OIL_WAGONS_ID#',   mtId.Value,
         'CRASH_KEY#',       EnCrypt(crtVersionKey,[FormatDateTime('ddmmyyyy',Date)+mtName.AsString])
        ]);
    end;
    mt.Next;
  end;
  CommitSqlOra;
end;
//==============================================================================
end.
