{*******************************************************}
{                                                       }
{                       EhLib v3.2                      }
{      Register object that sort data in TOilQuery         }
{                                                       }
{    Copyright (c) 2002, 2003 by Dmitry V. Bolshakov    }
{                                                       }
{*******************************************************}

{*******************************************************}
{ Add this unit to 'uses uCommonForm, ' clause of any unit of your    }
{ project to allow TDBGridEh to sort data in            }
{ TOilQuery automatically after sorting markers            }
{ will be changed.                                      }
{ TSQLDatasetFeaturesEh will try to find line in        }
{ TOilQuery.SQL string that begin from 'ORDER BY' phrase   }
{ and replace line by 'ORDER BY FieldNo1 [DESC],....'   }
{ using SortMarkedColumns.                              }
{*******************************************************}

unit EhLibBDE;

{$I EhLib.Inc}

interface

uses
{$IFDEF EH_LIB_6} Variants, {$ENDIF}
  DbUtilsEh, DBGridEh, DBTables, Db, BDE, SysUtils,uOilQuery,Ora, uOilStoredProc;

implementation

uses Classes;

type
  TBDEDataSetCrack = class(TBDEDataSet);

function BDEDataSetDriverName(DataSet: TBDEDataSet): String;
var
  hCur: hDBICur;
  rslt: DBIResult;
  Descs: STMTBaseDesc;
  dbDes: DBDesc;
begin
  hCur := nil;
  try
    // Look at DbiQGetBaseDescs in the BDE32.HLP for more information...
    Check(DbiQGetBaseDescs(TBDEDataSetCrack(DataSet).STMTHandle, hCur));
    rslt := DbiGetNextRecord(hCur, dbiNOLOCK, @Descs, nil);
    Check(DbiGetDatabaseDesc(Descs.szDatabase, @dbDes));
     if (rslt = DBIERR_NONE) then
       // Look at STMTBaseDescs in the BDE32.HLP for more information...
       Result := dbDes.szDbType;
  finally
    if (hCur <> nil) then
      check(DbiCloseCursor(hCur));
  end;
end;

function DateValueToBDESQLStringProc(DataSet: TDataSet; Value: Variant): String;
begin
  Result := DateValueToDataBaseSQLString(BDEDataSetDriverName(TBDEDataSet(DataSet)), Value)
end;

type
  TBDEDatasetFeaturesEh = class(TSQLDatasetFeaturesEh)
  public
    procedure ApplyFilter(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean); override;
  end;

{ TBDEDatasetFeaturesEh }

procedure TBDEDatasetFeaturesEh.ApplyFilter(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean);
begin
  if TDBGridEh(Sender).STFilter.Local then
    TDBGridEh(Sender).DataSource.DataSet.Filter :=
      GetExpressionAsFilterString(TDBGridEh(Sender),
        GetOneExpressionAsLocalFilterString, nil)
  else
    ApplyFilterSQLBasedDataSet(TDBGridEh(Sender), DateValueToBDESQLStringProc, IsReopen, 'SQL');
end;

initialization
  RegisterDatasetFeaturesEh(TBDEDatasetFeaturesEh, TOilQuery);
  RegisterDatasetFeaturesEh(TBDEDatasetFeaturesEh, TTable);
end.
