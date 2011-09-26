unit uGridFunc;
{ —оздан 18.10.2004 года ƒолжиковым
  ћодуль предназначен дл€ сортировки данных в гриде DbGridEh, прежде всгео в
  случае, когда источником данных грида €вл€етс€ MemoryTable.
  ≈сли у вас есть DbGridEh, и его источником данных €вл€етс€ MemoryTable, то дл€
  того, чтобы можно было осуществл€ть сортировку с помощью щелкань€ по заголовку
  нужно сделать два действи€:
  1. ѕри создании формы вызвать функцию InitGridToolButtons от этого грида (можно
     указать необ€зательным параметром поле, по которому грид будет отсортирован
     сразу, в противном случае грид будет отсортирован по первому полю)
  2. Ќа событие OnSortMarkingChange повесить вызов SortGridMemoryTable от грида
}

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, MemTable, ExtCtrls, Ora, DbGridEh,uOilQuery,uOilStoredProc
  {$IFDEF VER150},Variants{$ENDIF};

procedure SortMemoryTable(
  p_MT: TMemoryTable;
  p_FieldName: string;
  p_Direction: integer; // 1 - пр€мое направление, -1 - обратное
  p_SortType: integer = 0 // 0 - обычна€ сортировка строк, 1 - продвинута€
  );

procedure InitGridToolButtons(p_Grid: TDbGridEh; p_FieldName: string='');
procedure SortGridMemoryTable(p_Grid: TDbGridEh);

implementation

//==============================================================================
procedure SortMemoryTable(
  p_MT: TMemoryTable;
  p_FieldName: string;
  p_Direction: integer; // 1 - пр€мое направление, -1 - обратное
  p_SortType: integer = 0 // 0 - обычна€ сортировка строк, 1 - продвинута€
  );
type
  TRec = record
    Id: integer;
    Key: Variant;
    Moved: Boolean;
  end;
var
  a: array of TRec;
  {i,}LastStart: integer;
  //s: string;
  buf1,buf2: array of variant;
  //****************************************************************************
  procedure Log_(s: string);
  //var F: TextFile;
  begin
    {AssignFile(F,'d:\log.txt');
    if FileExists('d:\log.txt') then Append(F)
    else Rewrite(F);
    writeln(F,s);
    CloseFile(F);}
  end;
  //****************************************************************************
  procedure WriteLogA;
  var
    i: integer;
    s: string;
  begin
    s:='';
    for i:=0 to High(a) do
      s:=s+Format('%d-%s; ',[a[i].id,a[i].Key ]);
    Log_(s);
  end;
  //****************************************************************************
  procedure InitA;
  var i: integer;
  begin
    SetLength(a,p_MT.RecordCount);
    p_MT.First;
    i:=0;
    while not p_MT.Eof do begin
      a[i].Id:=i;
      a[i].Key:=p_MT.FieldByName(p_FieldName).Value;
      a[i].Moved:=FALSE;
      p_MT.Next;
      inc(i);
    end;
  end;
  //****************************************************************************
  procedure Swap(i,j: integer);
  var
    vId: integer;
    vKey: variant;
  begin
    vId:=a[i].Id; vKey:=a[i].Key;
    a[i].Id:=a[j].Id; a[i].Key:=a[j].Key;
    a[j].Id:=vId; a[j].Key:=vKey;
  end;
  //****************************************************************************
  function Compare(v1,v2: variant): integer;
  begin
    if VarType(v1)=varString then begin
      if p_SortType=0 then
        result:=AnsiCompareStr(v1,v2);
    end else
      if v1>v2 then result:=1
      else if v1=v2 then result:=0
      else result:=-1;

    if p_Direction=-1 then result:=-result;
  end;
  //****************************************************************************
  procedure QuickSortA(p_First,p_Last: integer);
  var
    i,j,n: integer;
    vKey: variant;
  begin
    //Log('¬ызов: '+IntToStr(p_First)+' - '+IntToStr(p_Last));
    if p_First>=p_Last then exit;
    {if p_First+1=p_Last then begin
      if a[p_First].Key>a[p_Last].Key then
        swap(p_First,p_Last);
      exit;
    end;}
    n:=p_First+random(p_Last-p_First+1);
    //Log('  n='+IntToStr(n));
    if n<>p_First then Swap(p_First,n);
    vKey:=a[p_First].Key;
    i:=p_First; j:=p_Last+1;
    while i<j do begin
      repeat inc(i) until (i>p_Last) or (Compare(a[i].Key,vKey)>=0);
      repeat dec(j) until Compare(a[j].Key,vKey)<=0;
      if i<j then swap(i,j);
    end;
    Swap(p_First,j);
    QuickSortA(p_First,j-1);
    QuickSortA(j+1,p_Last);
  end;
  //****************************************************************************
  procedure SortMT;
  var
    i,j,iStart,nMoved,CurMtPosition: integer;
    log: string;
    //**************************************************************************
    procedure GotoPosition(p_NewPos: integer);
    begin
      p_MT.GotoRecord(p_NewPos+1);//MoveBy(p_NewPos-CurMtPosition);
      CurMtPosition:=p_NewPos;
    end;
    //**************************************************************************
    procedure PutToBuf1(p_Pos: integer);
    var i: integer;
    begin
      log:=log+'P1-'+IntToStr(p_Pos)+'; ';
      GotoPosition(p_Pos);
      for i:=0 to p_MT.Fields.Count-1 do
       buf1[i]:=p_MT.Fields[i].Value;
    end;
    //**************************************************************************
    procedure PutToBuf2(p_Pos: integer);
    var i: integer;
    begin
      log:=log+'P2-'+IntToStr(p_Pos)+'; ';
      GotoPosition(p_Pos);
      for i:=0 to p_MT.Fields.Count-1 do
       buf2[i]:=p_MT.Fields[i].Value;
    end;
    //**************************************************************************
    procedure GetFromBuf1(p_Pos: integer);
    var i: integer;
    begin
      log:=log+'G1-'+IntToStr(p_Pos)+'; ';
      GotoPosition(p_Pos);
      p_MT.Edit;
      for i:=0 to p_MT.Fields.Count-1 do
        p_MT.Fields[i].Value:=buf1[i];
      p_MT.Post;
      inc(NMoved);
      a[p_Pos].Moved:=TRUE;
    end;
    //**************************************************************************
    procedure GetFromBuf2(p_Pos: integer);
    var i: integer;
    begin
      log:=log+'G2-'+IntToStr(p_Pos)+'; ';
      GotoPosition(p_Pos);
      p_MT.Edit;
      for i:=0 to p_MT.Fields.Count-1 do
        p_MT.Fields[i].Value:=buf2[i];
      p_MT.Post;
      inc(NMoved);
      a[p_Pos].Moved:=TRUE;
    end;
    //**************************************************************************
  begin
    log:='';
    Log_(TranslateText('–азмер буферов ')+IntToStr(p_Mt.Fields.Count));
    SetLength(buf1,p_MT.Fields.Count);
    SetLength(buf2,p_MT.Fields.Count);
    NMoved:=0; p_MT.First; CurMtPosition:=0;
    LastStart:=-1;
    Log_(Format('RecordCount=%d',[p_Mt.RecordCount]));
    while NMoved<p_MT.RecordCount do begin
      Log_(TranslateText('Ќовое начало while'));
      Log_(Format('NMoved=%d',[NMoved]));
      for i:=LastStart+1 to p_MT.RecordCount-1 do
        if not a[i].Moved then
          break;
      Log_(Format('i=%d',[i]));
      {while (a[i].Key=a[a[i].Id].Key) and not a[i].Moved do begin
        log_(Format('i->%d',[a[i].Id]));
        a[i].Moved:=TRUE;
        inc(NMoved);
        i:=a[i].Id;
      end;}
      Log_(Format('NMoved=%d',[NMoved]));
      if NMoved=p_MT.RecordCount then break;
      iStart:=i;
      LastStart:=iStart;
      Log_(Format('istart=%d',[iStart]));
      Log_(Format('LastStart=%d',[LastStart]));
      if a[i].Moved then continue;
      Log_(Format(TranslateText('Ќачало цепочки %d:%s'),[iStart,a[iStart].Key]));
      PutToBuf1(iStart);
      while TRUE do begin
        j:=a[i].Id;
        if j=iStart then break;
        Log_(Format('%d -> %d',[j,i]));
        PutToBuf2(j);
        GetFromBuf2(i);
        i:=j;
      end;
      Log_(Format(TranslateText(' онец цепочки %d:%s'),[i,a[i].Key]));
      GetFromBuf1(i);
      Log_(Format('NMoved=%d',[NMoved]));
    end;
    p_MT.First;
    Log_(log);
  end;
  //****************************************************************************
begin
  InitA;
  Log_('********************************************');
  WriteLogA;
  QuickSortA(0,p_Mt.RecordCount-1);
  WriteLogA;
  SortMT;
  Log_('********************************************');
end;
//==============================================================================
procedure InitGridToolButtons(p_Grid: TDbGridEh; p_FieldName: string='');
var i: integer;
begin
  p_Grid.OptionsEh:=p_Grid.OptionsEh+[dghAutoSortMarking];
  if p_Grid.Columns.Count>0 then
    for i:=0 to p_Grid.Columns.Count-1 do begin
      if (p_FieldName='') and (i=0) or (p_Grid.Columns[i].FieldName=p_FieldName) then
        p_Grid.Columns[i].Title.SortMarker:=smDownEh
      else
        p_Grid.Columns[i].Title.SortMarker:=smNoneEh;
      p_Grid.Columns[i].Title.TitleButton:=TRUE;
    end;
end;
//==============================================================================
procedure SortGridMemoryTable(p_Grid: TDbGridEh);
var
  i,vDirection: integer;
  dset: TDataSet;
begin
  vDirection := 0;
  for i:=0 to p_Grid.SortMarkedColumns.Count-1 do begin
    case p_Grid.SortMarkedColumns[i].Title.SortMarker of
      smNoneEh: continue;
      smDownEh: vDirection:=1;
        smUpEh: vDirection:=-1;
    end;
    break;
  end;
  if p_Grid.DataSource.DataSet.RecordCount=0 then exit;
  dset:=p_Grid.DataSource.DataSet;
  p_Grid.DataSource.DataSet:=nil;
  if vDirection <> 0 then
    SortMemoryTable(dset as TMemoryTable,p_Grid.SortMarkedColumns[i].FieldName,vDirection);
  p_Grid.DataSource.DataSet:=dset;
end;
//==============================================================================
end.
