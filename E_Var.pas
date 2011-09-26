unit E_Var;

interface

uses uCommonForm,  Main, UDbFunc, Classes, uOilQuery, Ora, uOilStoredProc;

var
  // первая группа
  E_ORGINST: integer;
  E_ORGNAME: string;

  // вторая группа
  E_I1C_LOGFILENAME: string = 'import1C.log';
  E_I1C_TESTRECORDEXISTS: boolean=TRUE;   // 1
  E_I1C_WITHNDS:          boolean=TRUE;   // 2
  E_I1C_ANALIZEORGNAME:   boolean=TRUE;   // 3
  E_I1C_REPLACEORGNAME:   boolean=TRUE;   // 4
  E_I1C_ADDFIRMAAUTO:     boolean=TRUE;   // 5
  E_I1C_SEARCHST:         boolean=TRUE;   // 6
  E_I1C_SEARCHNB:         boolean=TRUE;   // 7

  procedure E_InitVar;
  procedure E_SaveVar;

implementation

uses ExFunc;

//==============================================================================
procedure E_InitVar;
var
  Options: string;
begin
  try
    if MAIN.MAIN_TYPE = 4 then E_ORGINST := MAIN.INST
    else E_ORGINST := GetOblId(MAIN.INST, MAIN.INST);
    // підтягуємо назву організації
    E_ORGNAME := GetOrgName(E_ORGINST, E_ORGINST);
    Options := ReadOilVar('E_OPTIONS');
    if Options = '' then Options := 'yyyyynn'
    else
      if Options[1] = ',' then Options := copy(Options, 2, length(Options));
    E_I1C_TESTRECORDEXISTS := (Options[1]='y');
    E_I1C_WITHNDS          := (Options[2]='y');
    E_I1C_ANALIZEORGNAME   := (Options[3]='y');
    E_I1C_REPLACEORGNAME   := (Options[4]='y');
    E_I1C_ADDFIRMAAUTO     := (Options[5]='y');
    E_I1C_SEARCHST         := (Options[6]='y');
    E_I1C_SEARCHNB         := (Options[7]='y');
  except
    E_I1C_TESTRECORDEXISTS := TRUE;
    E_I1C_WITHNDS          := TRUE;
    E_I1C_ANALIZEORGNAME   := TRUE;
    E_I1C_REPLACEORGNAME   := TRUE;
    E_I1C_ADDFIRMAAUTO     := TRUE;
    E_I1C_SEARCHST         := FALSE;
    E_I1C_SEARCHNB         := FALSE;
  end;
end;
//==============================================================================
procedure E_SaveVar;
var
  s: string;
begin
  s := 'nnnnnnn';
  if E_I1C_TESTRECORDEXISTS then s[1] := 'y';
  if E_I1C_WITHNDS          then s[2] := 'y';
  if E_I1C_ANALIZEORGNAME   then s[3] := 'y';
  if E_I1C_REPLACEORGNAME   then s[4] := 'y';
  if E_I1C_ADDFIRMAAUTO     then s[5] := 'y';
  if E_I1C_SEARCHST         then s[6] := 'y';
  if E_I1C_SEARCHNB         then s[7] := 'y';
  WriteOilVar('E_OPTIONS', ',' + s);
end;
//==============================================================================

end.
