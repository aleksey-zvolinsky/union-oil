unit OilStd;

interface

Uses SysUtils, Dialogs, Windows, Messages, Classes, Graphics, Controls, Forms,
     Buttons, StdCtrls, Db, DBTables, Grids, DBGrids, ExtCtrls, ComObj, StrUtils,
     Ora, DBGridEh,uOilQuery,uOilStoredProc, uCommonForm{$IFDEF VER150},Variants{$ENDIF};

Type
  TDecodebuf  = array[0..255] of byte;
  st9=array  [1..9]  of string;
  st10=array [1..10] of string;
  st4=array  [1..4]  of string;
  int4=array [1..4]  of integer;
  clht=array [1..9, 1..2] of string;

  TUpperMode=(umLower,umUpperFirst,umUpperEvery);

Const
  LatCharSet    : set of Char =
    ['a'..'z','A'..'Z'];
  RusCharSet    : set of Char =
    ['й','ц','у','к','е','н','г','ш','щ','з','х','ъ','ф','ы','в','а','п','р',
     'о','л','д','ж','э','я','ч','с','м','и','т','ь','б','ю',
     'Й','Ц','У','К','Е','Н','Г','Ш','Щ','З','Х','Ъ','Ф','Ы','В','А','П','Р',
     'О','Л','Д','Ж','Э','Я','Ч','С','М','И','Т','Ь','Б','Ю'];
  UkrCharSet    : set of Char = ['_','_','ї','Ї','є','Є'];
  DigitCharSet  : set of Char = ['0'..'9'];
  SimbolCharSet : set Of Char = [' ','.','-','"', '=', '+'];
  idoperatormax=301;
  g2wbuf:TDecodeBuf=
  (
     0,  1,  2,  3,  4,  5,  6,  7,  8,  9,
    10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
    20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
    30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
    40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
    50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
    60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
    70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
    80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
    90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
   100,101,102,103,104,105,106,107,108,109,
   110,111,112,113,114,115,116,117,118,119,
   120,121,122,123,124,125,126,127,192,193,
   194,195,196,197,198,199,200,201,202,203,
   204,205,206,207,208,209,210,211,212,213,
   214,215,216,217,218,219,220,221,222,223,
   224,225,226,227,228,229,230,231,232,233,
   234,235,236,237,238,239, 45, 45, 45, 45,
    45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
    45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
    45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
    45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
    45, 45, 45, 45,240,241,242,243,244,245,
   246,247,248,249,250,251,252,253,254,255,
   168,184,165,180,170,186,178,179,175,191,
   183,185,185,164, 45, 45
  );
  w2gbuf:TDecodeBuf=
  (
     0,  1,  2,  3,  4,  5,  6,  7,  8,  9,
    10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
    20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
    30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
    40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
    50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
    60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
    70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
    80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
    90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
   100,101,102,103,104,105,106,107,108,109,
   110,111,112,113,114,115,116,117,118,119,
   120,121,122,123,124,125,126,127, 45, 45,
    45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
    45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
    45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
    45, 45, 45, 45,253,242, 45, 45,240, 45,
   244, 45, 45, 45, 45,248, 45, 45,246,247,
   243, 45, 45,250,241,252,245, 45, 45, 45,
    45,249,128,129,130,131,132,133,134,135,
   136,137,138,139,140,141,142,143,144,145,
   146,147,148,149,150,151,152,153,154,155,
   156,157,158,159,160,161,162,163,164,165,
   166,167,168,169,170,171,172,173,174,175,
   224,225,226,227,228,229,230,231,232,233,
   234,235,236,237,238,239
  );

  Function  W2Gost (s : String) : String;
  Function  Gost2W (s : String) : String;
  Function  SubStr(S : String; N : Integer) : String;
  Function  NormText( S :String ) : String;
  Function  ReadInt(MinVal, MaxVal, DefVal : Integer ; Var I : Integer):Boolean;
  // База данных
  Procedure CommitSQL(InsideTransaction:Boolean=FALSE);
  Procedure StartSQL(InsideTransaction:Boolean=FALSE;SavePoint:string='');
  Procedure RollbackSQL(InsideTransaction:Boolean=FALSE;SavePoint:string='');

  Procedure CommitSQLOra(InsideTransaction:Boolean=FALSE);
  Procedure StartSQLOra(InsideTransaction:Boolean=FALSE;SavePoint:string='');
  Procedure RollbackSQLOra(InsideTransaction:Boolean=FALSE;SavePoint:string='');

  Procedure SetFormPos(MF , LF : TForm);
  Function  CheckOleConnected(ObjVar : Variant): Boolean;
  Function  HandleOLException( E : Exception ): Boolean;
  Function  OleConnect(const ClassName : string ; Var ObjVar : Variant): Boolean;
  Function  SetCurField( Flg : Boolean ; S: string ) : Boolean;
  Function  CutAfteRoof(s:string):string;
  Function  StrToValid( S : String): String;
  Function  NumStrGrn(Nkp: Double; Curren1, Curren2: String): String;
  Function  NumStrGrn2(Nkp: Extended; Curren1, Curren2: String): String;
  Function  MRound(Arg : Double ; NDigits : Integer) : Double;
  Function  Round05(Arg : Double) : Integer;
  function MonthToStr(M:Integer; p_Upper:Boolean=TRUE):string;
  Function  GetStrTonn( N : Extended) : String;
  Function  ExcelStr(Num: Integer): String;
  Function  TxtFldCount(St : TStringList ): Integer;
  Procedure SetTxtFieldN(Var St : TStringList; FldNum :Integer; Flag : Boolean; Str : String);
  Procedure SetTxtField(Var St : TStringList; Flag : Boolean; Str : String);
  Function  GetTxtFldN(FldN : Integer; St : TStringList; Var StrN, FldBeg, FldEnd : Integer;Var Algn : Char) : Boolean;
  Function  GetTxtFld(St : TStringList; Var StrN, FldBeg, FldEnd : Integer;Var Algn : Char) : Boolean;
  Procedure Win2DosStrs(St : TStringList);
  Function  Win2Dos(S : String) : String;
  Function  FormatDateTime2(S : String; D : TDateTime ) : String;
  Function  StrToDate2(s:string):TDateTime;  
  Procedure SaveDBData(ds:TDataSet;dbC:TDBGridColumnsEh);
  function  DaysOrf (n:integer):string;
  Function  FloatModInt(Total:Double; A:integer): Double;
  function Money2Words(p_Num: Extended; p_Short: Boolean = TRUE; p_UpperMode: TUpperMode = umUpperFirst): string;
  function _Money2Words(p_Num: Extended; p_Cur1,p_Cur2: string; p_Sex: char; p_UpperMode: TUpperMode): string;
  function FormatDateDog(p_Date: TDateTime): string;
  function Number2Words(
    p_Number: LongWord;
    p_Sex: char = 'M';
    p_Tail: string = '';
    p_UpperMode: TUpperMode = umUpperFirst;
    p_RLevel: integer = 0): string;
  {$IFDEF VER130}
  function IfThen(ACondition: boolean; AIfTrue,AIfFalse:String): String; overload;
  function IfThen(ACondition: boolean; AIfTrue,AIfFalse:Integer): Integer; overload;
  function IfThen(ACondition: boolean; AIfTrue,AIfFalse:Pointer): Pointer; overload;
  {$ENDIF}

  //Function EnCoder(Str, Inst, CheckUp_ID :string; KeyDate:TDateTime; Key:string='81943'):string;
  //Function DeCoder(Str, Inst, CheckUp_ID :string;KeyDate:TDateTime; Key:string='81943'):string;

implementation

Uses Main, MoneyFunc, uStart, ExFunc;
{$IFDEF VER130}
function IfThen(ACondition: boolean; AIfTrue,AIfFalse:String): String; overload;
begin
  if ACondition
    then Result := AIfTrue
    else Result := AIfFalse;
end;

function IfThen(ACondition: boolean; AIfTrue,AIfFalse:Integer): Integer; overload;
begin
  if ACondition
    then Result := AIfTrue
    else Result := AIfFalse;
end;

function IfThen(ACondition: boolean; AIfTrue,AIfFalse:Pointer): Pointer; overload;
begin
  if ACondition
    then Result := AIfTrue
    else Result := AIfFalse;
end;
{$ENDIF}
Function  FloatModInt(Total:Double; A:integer): Double;
Begin
  Result := Trunc(Total) mod A + Total-Trunc(Total);
End;

function DaysOrf (n:integer):string;
begin
     n:=n mod 100;
     case n mod 10 of
          1: if n=11 then result:=TranslateText('дней')
                     else result:=TranslateText('день');
          2,3,4:if (n>=12) and (n<=14) then result:=TranslateText('дней')
                                       else result:=TranslateText('дня');
     else result:=TranslateText('дней');
     end;
end;

Procedure SaveDBData(ds:TDataSet;dbC:TDBGridColumnsEh);
Var BM:TBookMark;
    SD:TSaveDialog;
    f:TextFile;
    st,s:string;
    i:integer;
Begin
 if (DS<>nil) and (DS.Active) then
 begin
 SD:=TSaveDialog.Create(nil);
 IF SD.EXECUTE then
 begin
  try
   AssignFile(F,SD.FileName);
   Rewrite(F);
   BM:=Ds.GetBookMark;
   ds.DisableControls;
    ds.first;
    //-------- Save Header -----------
     if dbC<>nil then
     begin
      st:='';s:='';
      for i:=0 to dbC.Count-1 do
      begin
       if dbC.Items[i].visible then
       begin
        st:=st+s+dbC.Items[i].Title.caption;
        s:=Chr($9);
       end;
      End;
      writeln(f,st);
    //-------- SaveData --------------
     while not ds.eof do
     begin
      st:='';s:='';
      for i:=0 to dbC.Count-1 do
      begin
       if dbC.Items[i].visible then
       begin
        st:=st+s+ds.fieldbyname(dbC.Items[i].FieldName).asstring;
        s:=Chr($9);
       end;
      End;
      writeln(f,st);
      ds.next;
     end;
    end;
   DS.GoToBookMark(BM);
  finally
   DS.FreeBookMark(BM);
   DS.EnableControls;
   CloseFile(F);
  end;
 end;
 SD.Destroy;
 end;
End;

Function  FormatDateTime2(S : String; D : TDateTime) : String;
Begin
  If D = 0  Then Result := ' '
            Else Result := FormatDateTime(S, D);
End;

// Функция превращает строку в дату должен быть формат ДД.ММ.ГГГГ
Function StrToDate2(s:string):TDateTime;
var
  day,month,year:word;
begin
  if length(s)<>10 then
    Result:=StrToDate(s)
  else
  try
    day:=StrToInt(Copy(s,1,2));
    month:=StrToInt(Copy(s,4,2));
    year:=StrToInt(Copy(s,7,4));
    Result:=EncodeDate(year,month,day);
  except
    Result:=StrToDate(s);
  end;
end;

Function  Win2Dos(S : String) : String;
Var
  I : Integer;
Begin
  For I := 1 To Length(S) Do
  Begin
   If S[I] In ['А' .. 'п'] Then S[I] := Chr(Ord(S[I]) - 64)
   else
   If S[I] In ['р' .. 'я'] Then S[I] := Chr(Ord(S[I]) - 16)
   Else
   If S[I] = '№' Then S[I] := 'ь';
  End;

  Result := S;
End;

Procedure Win2DosStrs(St : TStringList);
Var
  I : Integer;
Begin
  For I := 0 To St.Count - 1 Do St[I] := Win2Dos(St[I]);
End;

Function  GetTxtFldN(FldN : Integer; St : TStringList; Var StrN, FldBeg, FldEnd : Integer;Var Algn : Char) : Boolean;
// Возвращает № строки, начало и конец поля с номером FldN
Var
  I, J, K, C : Integer;
  Flag, Fl2, Res : Boolean;
Begin
  Res := False;
  If FldN >0 Then
  Begin
    C := 0;
    J := 0;
    Flag := True;
    While (Flag)And(J <= St.Count - 1) Do
    Begin
      I := 1;
      While(Flag)And(I <= Length(St[J])) Do
      Begin
        If St[J][I] = '[' Then
        Begin
          Inc(C);
          If C = FldN Then
          Begin
            StrN := J;
            FldBeg := I;
            K := I;
            Fl2 := True;
            Algn := St[J][I+1];
            If Algn In ['[',' '] Then Algn := 'L';
            While (Fl2)And(K <= Length(St[J])) Do
            Begin
              If St[J][K] <> ']' Then Inc(K)
              Else
              Begin
                FldEnd := K;
                Fl2 := False;
               End;
            End;
            Res := True;
            Flag := False;
          End;
        End;
        Inc(I);
      End;
      Inc(J);
    End;
  End;
  Result := Res;
End;

Function  GetTxtFld(St : TStringList; Var StrN, FldBeg, FldEnd : Integer; Var Algn : Char) : Boolean;
// Возвращает № строки, начало и конец поля с номером 1
Begin
  Result := GetTxtFldN(1, St, StrN, FldBeg, FldEnd, Algn);
End;

Procedure SetTxtField(Var St : TStringList; Flag : Boolean; Str : String);
Begin
  SetTxtFieldN(St, 1, Flag, Str);
End;

Procedure SetTxtFieldN(Var St : TStringList; FldNum :Integer; Flag : Boolean; Str : String);
// Устанавливает поле с № FldNum в St значением Str
Var
  StrN, FldBeg, FldEnd : Integer;
  S : String;
  Algn : Char;
Begin
  If (Flag)And(Str = '') Then Str := '...';
  If Not GetTxtFld(St, StrN, FldBeg, FldEnd, Algn) Then
    Raise Exception.Create(TranslateText('Невозможно получить поле № ')+IntToStr(FldNum));
  S := Algn;
  S := ANSIUpperCase(S);
  Algn := S[1];
  If Length(Str) > FldEnd - FldBeg + 1 Then Str := Copy(Str, 1, FldEnd - FldBeg + 1);
  While Length(Str) < FldEnd - FldBeg + 1 Do
  Begin
    If Algn = 'L' Then Str := Str + ' '
    Else
    If Algn = 'R' Then Str := ' ' + Str
    Else
    If Algn = 'C' Then
    Begin
      If Odd(Length(Str)) Then Str := Str + ' '
                          Else Str := ' ' + Str;
    End
    Else
    Raise Exception.Create(TranslateText('Неправильный Align "')+Algn+TranslateText('" в поле № ')+IntToStr(FldNum)+#10#13+TranslateText('В строке № ')+IntToStr(StrN));
  End;
  S := ' '+St[StrN]+' ';
  St[StrN] := Copy(S, 2, FldBeg - 1) + Str + Copy(S, FldEnd + 2, Length(S) - FldEnd - 2);
End;

Function  TxtFldCount(St : TStringList ): Integer;
// Вовращает кол полей в текстовом шаблоне или -№ строки в которой Кол '[' <> Кол ']'
Var
  IncorrStr, I, J, C1, Cc1, Cc2 : Integer;
Begin
  C1 := 0;
  IncorrStr := -1;
  For J := 0 To St.Count - 1 Do
  Begin
    Cc1 := 0;
    Cc2 := 0;
    For I := 1 To Length(St[J]) Do
    Begin
      If St[J][I] = '[' Then Inc(Cc1);
      If St[J][I] = ']' Then Inc(Cc2);
    End;
    If Cc1 <> Cc2 Then IncorrStr := J;
    C1 := C1 + Cc1;
  End;
  If IncorrStr = -1 Then TxtFldCount := C1
                    Else TxtFldCount := - IncorrStr;
End;

Function ExcelStr(Num: Integer): String;
Var
  Letter: String;
  ex : Extended;
Begin
  Letter := 'ERROR';
  If Num <= 26 Then Letter := Chr(Num + 64)
  Else
  If (Num>26) AND (num<=200) Then
  Begin
    ex := MRound(Num/26,4) - 0.0005;
    letter := Concat(CHR(Trunc(ex) + 64),CHR(Num - Trunc(ex) * 26 + 64));
  End;
  Result := Letter;
End;

Function W2Gost(S:String):String;
Var I : Byte;
begin
 For I  := 1 To Length(S) Do S[I] := Chr( W2Gbuf[ Ord(S[I])] );
 Result := S;
end;

Function Gost2W(S:String):String;
Var I : Byte;
begin
 For I  := 1 To Length(S) Do S[I] := Chr ( G2Wbuf [ Ord(S[I])] );
 Result := S;
end;

Function GetStrTonn( N : Extended) : String;
//Возвращает склонение слова "ТОННА"
Var
  S : String;
Begin
  S := '';
  N := Round(N*1000)/1000;
  If Round(N) <> N Then S := TranslateText('тонн')
  Else
  Case Round(N-Round(N/10)*10) Of
    1    : S := TranslateText('тонна');
    2..4 : S := TranslateText('тонны');
  Else S := TranslateText('тонн');
  End;
  Result := S;
End;

Function  NumStrGrn2(Nkp: Extended; Curren1, Curren2: String): String;
// Выдает числовое значение стоимости (12.34 = 12 грн. 34 коп.)
Var
  S, S2 : String;
Begin
  S := '';
  S := FloatToStr(Trunc(Nkp));
  S2 := IntToStr(Trunc((Nkp - Trunc(Nkp))*100 +0.500001));
  If Length(S2) < 2 Then S2 := '0' + S2;
  Result := S +' '+Curren1 + ' ' + S2 +' '+Curren2;
End;

function MonthToStr(M:Integer; p_Upper:Boolean=TRUE):string;
begin
  case M of
    1:  Result := LangText('Month1');
    2:  Result := LangText('Month2');
    3:  Result := LangText('Month3');
    4:  Result := LangText('Month4');
    5:  Result := LangText('Month5');
    6:  Result := LangText('Month6');
    7:  Result := LangText('Month7');
    8:  Result := LangText('Month8');
    9:  Result := LangText('Month9');
    10: Result := LangText('Month10');
    11: Result := LangText('Month11');
    12: Result := LangText('Month12');
  else
    Result := TranslateText('Неизвестный');
  end;
  if not p_Upper then
    result:=ANSILowerCase(result);
end;

function FormatDateDog(p_Date: TDateTime): string;
var day,month,year: Word;
begin
  DecodeDate(p_Date,year,month,day);
  result:=IntToStr(day)+' '+MonthToStr(month,FALSE)+' '+IntToStr(year)+TranslateText(' г.');
end;

Function MRound(Arg : Double ; NDigits : Integer) : Double;
Var
  I, R : Integer;
  X: double;
Begin
  if Arg<0 then X:=-Arg
  else X:=Arg;
  R:=1;
  For I := 1 To NDigits Do R := R*10;
  Result := Int(X*R+0.500001)/R;
  if Arg<0 then result:=-result;
end;


Function StrToValid( S : String): String;
Const
  Delimiters='\/:|?"<>*;'; // These symbols are not allowed in Windows - filename
Var
  I, K : Integer;
Begin
  K := Length(S);
  For I := 1 To K Do
  Begin
    If IsDelimiter(Delimiters, S, I) Then S[I] := '-';
  End;
  Result:=s;
End;


Function CutAfteRoof(s:string):string;
{cuts all symbols after '^' including it one}
Begin
  Delete(S,Pos('^',S), Length(s)-Pos('^',S)+1);
  CutAfteRoof := S;
End;

Procedure SetFormPos(MF,LF:TForm);
Begin
 LF.Left:=(mf.ClientWidth-LF.Width)div 2;
 LF.Top:=(mf.ClientHeight-LF.Height-65)div 2;
End;

Function SubStr(S : String; N : Integer) : String;
Var
  I : Integer;
Begin
  S := S +'#';
  For I := 1 To N - 1  Do
  If Pos('#',S)>0 Then S := Copy(S,Pos('#',S)+1, Length(S)-Pos('#',S));
  Result := Copy(S,1,Pos('#',S)-1);
End;

Function NormText( S :String ) : String;
Var
  I : Integer;
  Res : String;
Begin
  S := Trim(ANSIUpperCase(S));
  If Length(S)>0 Then Res := S[1]
                 Else Res := '';
  For I := 2 To Length(S) Do
    If (S[I] <> ' ')Or(S[I-1] <> ' ') Then Res := Res + S[I];
  Result := Res;
End;

Function  ReadInt(MinVal, MaxVal, DefVal : Integer ; Var I : Integer):Boolean;
Var
  Code: Integer;
  NewString: string;
  ClickedOK: Boolean;
Begin
  NewString := IntToStr(DefVal);
  Repeat
    ClickedOK := InputQuery(TranslateText('Введите число'), TranslateText('От ')+IntToStr(MinVal)+TranslateText(' до ')+
      IntToStr(MaxVal)+'.', NewString);
    Val(NewString, I, Code);
    If Code <> 0 Then MessageDlg(TranslateText('Некорректное число. Попробуйте ещё раз пожалуйста. '), mtWarning, [mbOk], 0)
    Else
    If (ClickedOk)And((I>MaxVal)Or(I<MinVal)) Then
    Begin
      MessageDlg(TranslateText('Число должно быть от ')+IntToStr(MinVal)+TranslateText(' до ')+
        IntToStr(MaxVal)+'.'+#10#13+TranslateText('Попробуйте ещё раз пожалуйста. '), mtWarning, [mbOk], 0);
      Code := 1;
    End;
  Until (Code = 0)Or(Not ClickedOk) ;
  Result := ClickedOk;
End;

Procedure CommitSQL(InsideTransaction:Boolean=FALSE);
Begin
  CommitSQLOra(InsideTransaction);
End;

Procedure StartSQL(InsideTransaction:Boolean=FALSE;SavePoint:string='');
Begin
  StartSQLOra(InsideTransaction,SavePoint);
End;

Procedure RollbackSQL(InsideTransaction:Boolean=FALSE;SavePoint:string='');
Begin
  RollbackSQLOra(InsideTransaction,SavePoint);
End;

procedure CommitSQLOra(InsideTransaction:Boolean=FALSE);
begin
  if not InsideTransaction then
  Try
    frmStart.ORASESSION1.Commit;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure StartSQLOra(InsideTransaction:Boolean=FALSE;SavePoint:string='');
begin
  if not frmStart.OraSession1.InTransaction then
    if SavePoint='' then
      frmStart.OraSession1.StartTransaction
    else
      frmStart.OraSession1.Savepoint(SavePoint);
end;

procedure RollbackSQLOra(InsideTransaction:Boolean=FALSE;SavePoint:string='');
begin
  if not InsideTransaction and frmStart.OraSession1.InTransaction then
    if SavePoint='' then
      frmStart.OraSession1.Rollback
    else
      frmStart.OraSession1.RollbackToSavepoint(SavePoint);
end;

//--------------- обработка ошибки OLE ---------
Function HandleOLException(E:exception): Boolean;
Const
  OLError = 'Ошибка связи с Word for Windows:';
begin
  Result := True;
  If (E is EOleError)or(E is EOleSysError)or(E is EOleException)
    Then ShowMessage(OLError+E.Message)
    Else Result := False; // Это не Ole-ошибка!
End;

Function CheckOleConnected(ObjVar: Variant): Boolean;
Begin
  Result := False;
  If VarType(ObjVar) = VarDispatch Then Result := True; //already connected
end;

Function OleConnect(Const ClassName: String;var ObjVar :variant): Boolean;
Begin
  Result := True;
  Try
    If Not CheckOleConnected(ObjVar) Then ObjVar := CreateOleObject(ClassName);
  Except on E: exception do
    If not HandleOLException(E) then
    Begin
      Raise;
      Result:=False;
    End;
  End;
end;

//заменяет поле на строку
Function SetCurField(Flg:Boolean;S: string): Boolean;
Begin
  Result := True;
  if Flg then
  begin
    If (Trim(S)='') Then S := ' ... ';
  end
  Else
  begin
    If (Trim(S)='') Then S := '';
  end;
  Range.Fields.Item(1).Select;
  MsWord.Selection.Text := S;
  MsWord.Documents.Item(1).Fields.Update;
end;

// ФУНКЦИЯ  ОКРУГЛЕНИЯ ДО БЛИЖАЙШЕГО ЦЕЛОГО
// в отличие от стандартной 0.5 всегда
// округляет в большую по абсолютной величине
// сторону
Function  Round05(Arg : Double ) : Integer;
  var y:integer;
begin
   y:=trunc(int(Arg));
   Result := y;
   if (Arg-y+0.0000000001>0.5) or (FloatToStr(Arg-y)=FloatToStr(0.5))
      then inc(result);
end;
//==============================================================================
procedure DevideTo3(p_Str: string; var s1,s2,s3: string);
var n: integer;
begin
  n:=pos(',',p_Str);
  if n=0 then s1:=p_Str
  else s1:=copy(p_Str,1,n-1);
  p_Str:=copy(p_Str,n+1,length(p_Str));
  n:=pos(',',p_Str);
  if n=0 then s2:=p_Str
  else s2:=copy(p_Str,1,n-1);
  s3:=copy(p_Str,n+1,length(p_Str));
  if s2='' then s2:=s1;
  if s3='' then s3:=s2;
end;
//==============================================================================

type
  TNumbers = array [0..19] of string;
  TTens = array[2..9] of string;
  THundreds = array[1..9] of string;
  THuge = array [2..11] of string;

var
  {рус}
  rusNumbers: TNumbers =
    ('ноль','один','два','три','четыре','пять','шесть','семь','восемь','девять','десять',
     'одиннадцать','двенадцать','тринадцать','четырнадцать','пятнадцать','шестнадцать',
     'семнадцать','восемнадцать','девятнадцать');
  rusTens: TTens =
    ('двадцать','тридцать','сорок','пятьдесят','шестьдесят','семьдесят',
     'восемьдесят','девяносто');
  rusHundreds: THundreds =
    ('сто','двести','триста','четыреста','пятьсот','шестьсот','семьсот',
     'восемьсот','девятьсот');
  rusHuge : THuge =
    ('миллион','миллиард','триллион','квадрильон','квинтильон','секстильон','септильон',
     'октильон','нонильон','додецильон');

  {укр}
  ukrNumbers: TNumbers =
    ('нуль','один','два','три','чотири','п`ять','шість','сім','вісім','дев`ять','десять',
     'одинадцять','дванадцять','тринадцять','чотирнадцять','п`ятнадцять','шістнадцять',
     'сімнадцять','вісімнадцять','дев`ятнадцять');
  ukrTens: TTens =
    ('двадцять','тридцять','сорок','п`ятдесят','шістдесят','сімдесят',
     'вісімдесят','дев`яносто');
  ukrHundreds: THundreds =
    ('сто','двісті','триста','чотириста','п`ятсот','шістсот','сімсот',
     'вісімсот','дев`ятсот');
  ukrHuge : THuge =
    ('мільйон','мільярд','трильйон','квадрильон','квiнтiльон','секстiльон','септiльон',
     'октiльон','нонiльон','додецiльон');

  nwNumbers : TNumbers;
  nwTens : TTens;
  nwHundreds : THundreds;
  nwHuge : THuge;




{ функция переводит число в слова, например 21 -> двадцать один
  имеет следующие параметры:
    p_Number - целое число, которое будет записываться словами
    p_Sex - грамматический род числа. В случае значения 'M' - мужской, конечные 1 и 2
            передаются как "один" и "два", а в случае значения 'F' - женский,
            как "одна" и "две"
    p_Tail - "хвостик". Слово, которое будет следовать за числом. Например, если нам нужно
             на выходе получить запись вроде "21 литр", или "22 литра", или "25 литров", то
             в этот параметр нужно передать строку 'литр,литра,литров'.
             То есть нужное нам существительное через запятую в именительном падеже ед.числа,
             родительном падеже ед.числа и родительном падеже мн.числа.
             Если одна из форм не указана, то в недостающих случаях будет использована последняя
             из указанных форм.
    p_UpperMode - может принимать следующие значения:
             umLower: все маленькими буквами
             umUpperFirst: самая первая буква результата большая, остальные маленькие
             umUpperEvery: каждое слово с большой буквы
    p_RLevel - чисто внутренний параметр, по умолчанию равен 0, указывать при вызове его не нужно.
}
procedure AssignLang;
begin
  if LANGUAGE = 0 then
  begin
    nwNumbers := rusNumbers;
    nwTens := rusTens;
    nwHundreds := rusHundreds;
    nwHuge := rusHuge;
  end
  else
  begin
    nwNumbers := ukrNumbers;
    nwTens := ukrTens;
    nwHundreds := ukrHundreds;
    nwHuge := ukrHuge;
  end;
end;

function Number2Words(
  p_Number: LongWord;
  p_Sex: char = 'M';
  p_Tail: string = '';
  p_UpperMode: TUpperMode = umUpperFirst;
  p_RLevel: integer = 0): string;
var
  s1,s2,s3: string;
  vNum,i: integer;
  //****************************************************************************
  function ShortNumber2Words(p_Num: integer): string;
  var n1,n2,n3,n12: integer;
  begin
    AssignLang;
    result:='';
    if p_Num=0 then exit;

    n1:=p_Num mod 10;
    n2:=p_Num mod 100 div 10;
    n3:=p_Num div 100;
    n12:=p_Num mod 100;

    if n12<>0 then
      if n2=1 then result:=nwNumbers[n12]+' '
      else begin
        if (n1=2) and (p_Sex='F') then result:=IfThen(LANGUAGE=0,TranslateText('две '),TranslateText('дві '))
        else if (n1=1) and (p_Sex='F') then result:=IfThen(LANGUAGE=0,TranslateText('одна '),TranslateText('одна '))
        else if n1<>0 then result:=nwNumbers[n1]+' ';
        if n2<>0 then result:=nwTens[n2]+' '+result;
      end;

    if n3<>0 then result:=nwHundreds[n3]+' '+result;
    if (n2<>1) and (n1=1) then result:=result+s1
    else if (n2<>1) and (n1 in [2,3,4]) then result:=result+s2
    else result:=result+s3;
    if result[length(result)]=' ' then
      SetLength(result,length(result)-1);
  end;
  //****************************************************************************
begin
  AssignLang;
  case p_RLevel of
    0: DevideTo3(p_Tail,s1,s2,s3);
    1: begin
         s1 := IfThen(LANGUAGE=0,TranslateText('тысяча'),TranslateText('тисяча'));
         s2 := IfThen(LANGUAGE=0,TranslateText('тысячи'),TranslateText('тисячі'));
         s3 := IfThen(LANGUAGE=0,TranslateText('тысяч'),TranslateText('тисяч'));
         p_Sex:='F';
       end;
  else begin
         s1:=nwHuge[p_RLevel];
         s2:=s1+'а';
         s3:=s1+TranslateText('ов');
         p_Sex:='M';
       end;
  end;

  if p_Number=0 then begin
    if p_RLevel=0 then result:=nwNumbers[0]+' '+s3
    else result:='';
    exit;
  end;

  result:=Number2Words(p_Number div 1000,p_Sex,'',p_UpperMode,p_RLevel+1)+' '+
    ShortNumber2Words(p_Number mod 1000);

  result:=trim(result);
  if (result<>'') and (p_RLevel=0) then
    if p_UpperMode=umUpperFirst then
      result:=ANSIUpperCase(result[1])+copy(result,2,length(result))
    else if p_UpperMode=umUpperEvery then begin
        result[1]:=ANSIUpperCase(result[1])[1];
        for i:=2 to length(result) do
          if (result[i]<>' ') and (result[i-1]=' ') then
            result[i]:=ANSIUpperCase(result[i])[1];
    end;
end;
//==============================================================================
{ записывает деньги в любой валюте словами
  имеет следующие параметры:
    p_Num - число с плавающей точкой. Будут использоваться только первые два знака
            после запятой
    p_Cur1, p_Cur2 - название старшей и младшей (то есть "рублевой" и "копеечной")
           валюты в трёх формах (см. примечание к Number2Words)
           Возможные параметры например: 'тугрик,тугрика,тугриков','сантик,сантика,сантиков'
    p_Sex - грамматический род старшего названия валюты
    p_Upper - см. комментарий к Number2Words
}
function _Money2Words(
  p_Num: Extended;
  p_Cur1,p_Cur2: string;
  p_Sex: char;
  p_UpperMode: TUpperMode): string;
var
  kop: integer;
  sKop,s1,s2,s3: string;
begin
  result:=Number2Words(trunc(p_Num),p_Sex,p_Cur1,p_UpperMode);
  if p_Cur2<>'' then begin
    DevideTo3(p_Cur2,s1,s2,s3);
    kop:=Round(Frac(p_Num)*100);
    sKop:=IntToStr(kop);
    if length(sKop)=1 then sKop:='0'+sKop;
    result:=result+' '+sKop+' ';
    if (sKop[1]='1') or not (sKop[2] in ['1','2','3','4'])then
      result:=result+s3
    else if sKop[2]='1' then
      result:=result+s1
    else
      result:=result+s2;
  end;
end;
//==============================================================================
{ записывает гривны словами
  имеет следующие параметры:
    p_Num - число с плавающей точкой. Будут использоваться только первые два знака
            после запятой
    p_Short - по умолчанию TRUE. Если TRUE, то используются сокращенные названия
              грн. и коп. Если FALSE, то полные
    p_Upper - см. комментарий к Number2Words
}
function Money2Words(
  p_Num: Extended;
  p_Short: Boolean = TRUE;
  p_UpperMode: TUpperMode = umUpperFirst): string;
const
  rusGrn : String = 'гривна,гривны,гривен';
  ukrGrn : String = 'гривня,гривні,гривень';
  rusKop : String = 'копейка,копейки,копеек';
  ukrKop : String = 'копійка,копійки,копійок';
var
  CurGrn,CurKop : String;

begin
  curGrn := IfThen(LANGUAGE = 0,rusGrn,ukrGrn);
  curKop := IfThen(LANGUAGE = 0,rusKop,ukrKop);
  if p_Short then result:=_Money2Words(p_Num,TranslateText('грн.'),TranslateText('коп.'),'F',p_UpperMode)
  else result:=_Money2Words(p_Num,CurGrn,CurKop,'F',p_UpperMode);
end;
//==============================================================================
// эмуляция старой функции, переводившей число в гривны
// использовать не рекомендуется, используйте вместе нее новую Money2Words
function NumStrGrn(Nkp: Double; Curren1, Curren2: string): string;
begin
  result:=Money2Words(Nkp);
end;
//==============================================================================

end.
