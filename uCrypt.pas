unit uCrypt;
{ ����������� � ������� 13.10.2004
  ������������� ��� ������� Encrypt � Decrypt ��� �������� � ���������� �������
  ��� ��������� ���������� ��� �������� � ������ ����, ��� ����� ����������� � ����
  ������� ���������.
  ��������, ���� ����� ����������� ���� ������ � ����� crtVersionKey, �� ����� ���������
  ����� � ����
  res:=Encrypt(crtVersionKey,[str]);

  �������� �������������!!!
  ��� ��������� ������ ��������� ���������� ��������� ����� ��������� �������:
  1. �������� � ��� TOilCryptType ���������, ������� ������������� ������ ����
  2. ��������� � ���� ������ �������/�������, ������� ������������ ��������/����������
     �� ������ ���������. �� �������� �� � ������������ �����, ��� �� ������
     ��������������� ���������� �� ������ �������
  3. �������� ������� Encrypt � Decrypt ���, ����� ��� ������������ ����� ��� ����������
     ������� ��� ���� ����������� � ������ 2 �������.

  ������� ������� �� ���������� ���� ��������.
  (�.��������)
}
interface

uses uCommonForm,  sysutils,ExFunc,uOilQuery,Ora, uOilStoredProc;

type TOilCryptType=(
  crtTestLaunch, // ��� ������, �������������� � �������� � ����������� ���������
  crtVersionKey, // ��� ������, ��������� ���������� VERSION_KEY, � � ������������ �������� ��� ��������� ����������
  crtSmart, // ����� ������������� � �������� ������� ����������
  crtOrgKey // �������� ���� � ����� � ���, �������������� ��� ������; ����������� ���
);

type
  TOilPasswordType=(
    pwtOrg,       // ������ ��� ������ ������� ����������� � �.�. � �.�. (���������� ����������� ��������)
    pwtPart,      // ������ ��� ������������� ������
    pwtCrash,      // ������, �������� ��� ����� ����
    pwtTestLaunch, // ������, �������� ��� �������, ������� ������� �� ���� ����� � ������ ��������
    pwtWagon       // ������, ������� ����� ������ ��� �������� ���� �� �������
  );

function Encrypt(
  p_Type: TOilCryptType;
  p_List: array of variant
  ): string;

function Decrypt(
  p_Type: TOilCryptType;
  p_List: array of variant
  ): string;

function GetPassword(p_Type : TOilPasswordType;p_List: array of variant): string;

function TruncPasswId(p_Passw: string) : string;

implementation

Uses Dialogs, Windows, Messages, Classes, Graphics, Controls, Forms,
     Buttons, StdCtrls, Db, DBTables, Grids, DBGrids, ExtCtrls, ComObj,
     StrUtils;

var KEY1: string = '�� ����������� ��������� OIL - ����� �������� ��������� � ����!';
    ALFA1: string = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_!';
    st2: array[0..7] of integer=(1,2,4,8,16,32,64,128);
    vDay,vMonth,vYear : word;


//==============================================================================
// *************      ������ ��������� �� ����������     ***********************
// *************      ����� �� ����� ���������� :-)      ***********************
//------------------------------------------------------------------------------
procedure EnCipher(var Source: AnsiString);

asm
    Push ESI //Save the good stuff
    Push EDI

    Or EAX,EAX
    Jz @Done
    Push EAX
    Call UniqueString
    Pop EAX
    Mov ESI,[EAX] //String address into ESI
    Or ESI,ESI
    Jz @Done
    Mov ECX,[ESI-4] //String Length into ECX
    Jecxz @Done //Abort on null string
    Mov EDX,ECX //initialize EDX with length
    Lea EDI,@ECTbl //Table address into EDI
    Cld //make sure we go forward
@L1:
    Xor EAX,EAX
    Lodsb //Load a byte from string
    Sub AX,32 //Adjust to zero base
    Js @Next //Ignore if control char.
    Cmp AX,95
    Jg @Next //Ignore if high order char.
    Mov AL,[EDI+EAX] //get the table value
    Test CX,3 //screw it up some
    Jz @L2
    Rol EDX,3
@L2:
    And DL,31
    Xor AL,DL
    Add EDX,ECX
    Add EDX,EAX
    Add AL,32 //adjust to output range
    Mov [ESI-1],AL //write it back into string
@Next:
    Dec ECX
    Jnz @L1
// Loop @L1 //do it again if necessary

@Done:
    Pop EDI
    Pop ESI

    Jmp @Exit
// Ret //this does not work with Delphi 3 - EFD 971022

@ECTbl: //The encipher table
    DB 75,85,86,92,93,95,74,76,84,87,91,94
    DB 63,73,77,83,88,90,62,64,72,78,82,89
    DB 51,61,65,71,79,81,50,52,60,66,70,80
    DB 39,49,53,59,67,69,38,40,48,54,58,68
    DB 27,37,41,47,55,57,26,28,36,42,46,56
    DB 15,25,29,35,43,45,14,16,24,30,34,44
    DB 06,13,17,23,31,33,05,07,12,18,22,32
    DB 01,04,08,11,19,21,00,02,03,09,10,20
@Exit:

end;
//���� ����� ������ �� �������
Procedure PasEnChiper(var p_Str:ANSIString);
const
  Tbl:array[0..95] of byte =
  (
   75,85,86,92,93,95,74,76,84,87,91,94,
   63,73,77,83,88,90,62,64,72,78,82,89,
   51,61,65,71,79,81,50,52,60,66,70,80,
   39,49,53,59,67,69,38,40,48,54,58,68,
   27,37,41,47,55,57,26,28,36,42,46,56,
   15,25,29,35,43,45,14,16,24,30,34,44,
   06,13,17,23,31,33,05,07,12,18,22,32,
   01,04,08,11,19,21,00,02,03,09,10,20
  );
var
  A,C,D,cnt:integer;
  ch:char;
  function L(p_val:integer):integer;
  begin
    result:= p_val and 255;
  end;
  procedure AssignL(var p_var:integer; const p_val:integer);
  begin
    p_var := p_var and (not 255);
    p_var := p_var or p_val;
    p_var := p_var;
  end;
begin
  C := Length(p_Str);
  D := C;
  If(p_Str='')or(Length(p_Str)=0)then
    exit;
  cnt := 1;
  while not(C = 0)do
  begin
    ch := p_Str[cnt];
    A := ord(ch);
    A := A - 32;
    if(A >= 95)then
      continue;
    A := Tbl[A];
    if C <> 4 then
      D := D shl 3;       //d * 2*2*2
    AssignL(D,L(D) and 31);
    AssignL(A,L(A) xor L(D));
    D := D + C + A;
    AssignL(A,L(A) + 32);
    p_Str[cnt] := chr(L(A));
    dec(C);
    inc(cnt);
  end;
end;
//==============================================================================
procedure DeCipher(var Source: AnsiString);

{Decrypts a string previously encrypted with EnCipher.}

asm
    Push ESI //Save the good stuff
    Push EDI
    Push EBX

    Or EAX,EAX
    Jz @Done
    Push EAX
    Call UniqueString
    Pop EAX
    Mov ESI,[EAX] //String address into ESI
    Or ESI,ESI
    Jz @Done
    Mov ECX,[ESI-4] //String Length into ECX
    Jecxz @Done //Abort on null string
    Mov EDX,ECX //Initialize EDX with length
    Lea EDI,@DCTbl //Table address into EDI
    Cld //make sure we go forward
@L1:
    Xor EAX,EAX
    Lodsb //Load a byte from string
    Sub AX,32 //Adjust to zero base
    Js @Next //Ignore if control char.
    Cmp AX,95
    Jg @Next //Ignore if high order char.
    Mov EBX,EAX //save to accumulate below
    Test CX,3 //unscrew it
    Jz @L2
    Rol EDX,3
@L2:
    And DL,31
    Xor AL,DL
    Add EDX,ECX
    Add EDX,EBX
    Mov AL,[EDI+EAX] //get the table value
    Add AL,32 //adjust to output range
    Mov [ESI-1],AL //store it back in string
@Next:
    Dec ECX
    Jnz @L1
// Loop @L1 //do it again if necessary

@Done:
    Pop EBX
    Pop EDI
    Pop ESI

    Jmp @Exit
// Ret Does not work with Delphi3 - EFD 971022

@DCTbl: //The decryption table
    DB 90,84,91,92,85,78,72,79,86,93,94,87
    DB 80,73,66,60,67,74,81,88,95,89,82,75
    DB 68,61,54,48,55,62,69,76,83,77,70,63
    DB 56,49,42,36,43,50,57,64,71,65,58,51
    DB 44,37,30,24,31,38,45,52,59,53,46,39
    DB 32,25,18,12,19,26,33,40,47,41,34,27
    DB 20,13,06,00,07,14,21,28,35,29,22,15
    DB 08,01,02,09,16,23,17,10,03,04,11,05
@Exit:
end;
//==============================================================================
procedure Crypt(var Source: Ansistring; const Key: AnsiString);

{ �������� � ���������� �����, � �������������� ����������� XOR ����������, ����
  S-Coder (DDJ, ������� 1990). ��� ���������� ������ ��������� �������� ���
  ��������� ��������� ��� �� ����� ����. ���� �������� ���������� ������� ���
  �� ����, �� ���� �� ������ ������� ��� ��� ����� ��������, �� ������ �������
  ���������:
     1) ����������� ������� �����, ������� ������ ����� �������
     2) ������ ��� ������ �������� ������ � ������� �������. ��� ����������
        ���������� ����� � �������� �������
     3) ����������� EnCipher ����� Crypt. ��� ���������� ����� Crypt �����������
        DeCipher.
     4) ����� ���������� ������������������

  ����������: ��������� ����� ��������� ����� ������� �� 0 �� 255.
  (������� ���������)

 (Encrypt AND decrypt strings using an enhanced XOR technique similar to
  S-Coder (DDJ, Jan. 1990). To decrypt, simply re-apply the procedure
  using the same password key. This algorithm is reasonably secure on
  it's own; however,there are steps you can take to make it even more
  secure.

       1) Use a long key that is not easily guessed.
       2) Double or triple encrypt the string using different keys.
          To decrypt, re-apply the passwords in reverse order.
       3) Use EnCipher before using Crypt. To decrypt, re-apply Crypt
          first then use DeCipher.
       4) Some unique combination of the above

  NOTE: The resultant string may contain any character, 0..255.}



asm
    Push ESI //Save the good stuff
    Push EDI
    Push EBX

    Or EAX,EAX
    Jz @Done
    Push EAX
    Push EDX
    Call UniqueString
    Pop EDX
    Pop EAX
    Mov EDI,[EAX] //String address into EDI
    Or EDI,EDI
    Jz @Done
    Mov ECX,[EDI-4] //String Length into ECX
    Jecxz @Done //Abort on null string
    Mov ESI,EDX //Key address into ESI
    Or ESI,ESI
    Jz @Done
    Mov EDX,[ESI-4] //Key Length into EDX
    Dec EDX //make zero based
    Js @Done //abort if zero key length
    Mov EBX,EDX //use EBX for rotation offset
    Mov AH,DL //seed with key length
    Cld //make sure we go forward
@L1:
    Test AH,8 //build stream char.
    Jnz @L3
    Xor AH,1
@L3:
    Not AH
    Ror AH,1
    Mov AL,[ESI+EBX] //Get next char. from Key
    Xor AL,AH //XOR key with stream to make pseudo-key
    Xor AL,[EDI] //XOR pseudo-key with Source
    Stosb //store it back
    Dec EBX //less than zero ?
    Jns @L2 //no, then skip
    Mov EBX,EDX //re-initialize Key offset
@L2:
    Dec ECX
    Jnz @L1
@Done:
    Pop EBX //restore the world
    Pop EDI
    Pop ESI
end;
//���� ����� ������ �� �������
procedure PasCrypt(var Source: Ansistring; const Key: AnsiString);
const
  numbH=65280;// 00000000 00000000 11111111 00000000
  numbL=255;  // 00000000 00000000 00000000 11111111
var
  A,B,C,D,cntDI:integer;
  S,EDI:Ansistring;
  stop : boolean;
  function L(p_val:integer):integer;
  begin
    result := p_val and 255;
  end;
  function H(p_val:integer):integer;
  begin
    result := p_val and numbH;
  end;
  function HfromL(p_val:integer):integer;
  begin
    result := p_val shl 8;
  end;
  function LfromH(p_val:integer):integer;
  begin
    result := p_val shr 8;
  end;
  procedure AssignL(var p_var:integer; const p_val:integer);
  begin
    p_var := p_var and (not 255);
    p_var := p_var or p_val;
    p_var := p_var;
  end;
  procedure AssignH(var p_var:integer; const p_val:integer);
  begin
    p_var := p_var and (not numbH);
    p_var := p_var or p_val;
    p_var := p_var;
  end;
  Procedure Hshift(var p_var:integer;p_count:integer;turn:char);
  var
    tmp_var,tmp_var_1,tmp_var_2,tmp_var_3,tmp_var_4:integer;
  begin
    tmp_var := p_var and numbH;
    tmp_var_1 := tmp_var shl 8;
    tmp_var_2 := tmp_var shl 16;
    tmp_var_3 := tmp_var;
    tmp_var_4 := tmp_var shr 8;
    tmp_var := 0;
    tmp_var := tmp_var or tmp_var_1;
    tmp_var := tmp_var or tmp_var_2;
    tmp_var := tmp_var or tmp_var_3;
    tmp_var := tmp_var or tmp_var_4;
    case turn of
      'r','R':
          tmp_var := tmp_var shr p_count;
      'l','L':
          tmp_var := tmp_var shl p_count;
    end;
    tmp_var := tmp_var and numbH;
    p_var := p_var and (not numbH);
    p_var := p_var or tmp_var;
  end;
begin
  EDI := Source;
  if EDI = '' then
    exit;
  C := Length(Source);
  if C = 0 then
    exit;
  S := Key;
  if S = '' then
    exit;
  D := Length(Key);
  dec(D);
  if D<0 then
    exit;
  B := D;
  cntDI := 3;
  AssignH(A,HfromL(L(D)));
  stop := false;
  while not(stop)do
  begin
    if 0 = (A and 2048)then                   //test AH, 8
      AssignH(A,H(H(A) xor HFromL(1)));       // Xor AH,1
    AssignH(A,H(not H(A)));                   // Not AH
    Hshift(A,1,'r');                          // Ror AH,1
    AssignL(A,ord(S[B+1]));                   // Mov AL, [ESI+EBX]
    AssignL(A,L(A) xor LfromH(H(A)));         // Xor AL,AH
    AssignL(A,L(A) xor ord(Source[cntDI-2])); // Xor AL,[EDI]
    Source[cntDI-2] := chr(L(A));             // Stosb
    inc(cntDI);
    dec(B);                                   // Dec EBX
    if B<0 then
      B := D;
    dec(C);
    if C = 0 then
      stop := true;
  end;
end;

//==============================================================================
//******** ������������ ������� � ��� ������ ��������� �� ���������� ***********
//********               ������������� ���� crtSmart                 ***********
//------------------------------------------------------------------------------
function EncryptSmart(p_Str: ANSIstring; p_Key: string = ''): ANSIstring;
var
  i,n: integer;
begin
  EnCipher(p_Str);
  if p_Key='' then p_Key:=KEY1;
  Crypt(p_Str,p_Key);
  result:='@!001!'+IntToStr(length(p_Str) mod 3);

  if length(p_Str) mod 3=1 then p_Str:=p_Str+#0#0
  else if length(p_Str) mod 3=2 then p_Str:=p_Str+#0;


  for i:=0 to length(p_Str) div 3 -1 do begin
    n:=ord(p_Str[i*3+1])*256*256+ord(p_Str[i*3+2])*256+ord(p_Str[i*3+3]);
    result:=result+ALFA1[n div (64*64*64) + 1];
    n:=n mod (64*64*64);
    result:=result+ALFA1[n div (64*64) + 1];
    n:=n mod (64*64);
    result:=result+ALFA1[n div 64 + 1]+ALFA1[n mod 64 + 1];
  end;
end;
//==============================================================================
function DecryptSmart(p_Str: ANSIstring; p_Key: String=''): ANSIstring;
var i,n,k: integer;
  //****************************************************************************
  function Val(n: integer): integer;
  begin
    result:=pos(p_Str[n],ALFA1)-1;
  end;
  //****************************************************************************
begin
  if copy(p_Str,1,6)<>'@!001!' then
    raise exception.Create(TranslateText('Decrypt1: �������� ��������� �������� ������!'));
  k:=StrToInt(p_Str[7]);
  p_Str:=copy(p_Str,8,length(p_Str));
  if length(p_Str) mod 4 <> 0 then
    raise exception.Create(TranslateText('Decrypt1: �������� ����� �������� ������!'));
  result:='';
  for i:=0 to length(p_Str) div 4 - 1 do begin
    n:=Val(i*4+1)*64*64*64+Val(i*4+2)*64*64+Val(i*4+3)*64+Val(i*4+4);
    result:=result+chr(n div (256*256));
    n:=n mod (256*256);
    result:=result+chr(n div 256)+chr(n mod 256);
  end;
  if k<>0 then
    SetLength(result,length(result)-3+k);
  if p_Key='' then p_Key:=KEY1;
  Crypt(result,p_Key);
  DeCipher(result);
end;
//==============================================================================
function  FormatDateTime2(S : String; D : TDateTime) : String;
begin
  if D = 0 then Result := ' '
  else Result := FormatDateTime(S, D);
end;
//==============================================================================
//************ ����������� ������� ��� �������� � ���������� *******************
//************     ������������� ���� crtTestLaunch          *******************
//==============================================================================
{ ������� EnCoder � DeCoder
  Str - ������, ������� ����� ����������� (���� ������ ���� ������� ������ � ���������� �����)
  ���������:
    Inst - �����-������
    CheckUp_ID - �����-������
    KeyDate - ����
    Key - ������-����� (�������������� ��������)
  �������� ��������:
    1. ���� ���� �� ���������� Inst, CheckUp_ID, KeyDate
       �� ������ - �� ��� ����������� ��������� ����.
    2. ��� ��������� ������ � Key �� ����� -
       ������ ����� ����������� � ������ '81943'
    3. ���� ������ ���� ����������� �� ����� ������ - ���������
       Inst, CheckUp_ID, KeyDate ���������� �������
       (Inst='', CheckUp_ID='', KeyDate=0), � ������ ���� Key.
}
function EnCoder(Str, Inst, CheckUp_ID :string; KeyDate:TDateTime; Key:string='81943'):string;
var
  InStr, TempStr, s : string;
  i, j : integer;
{$IFDEF VER150}
  function ReplaceStr(const S, Srch, Replace: string): string;
  var
    I: Integer;
    Source: string;
  begin
    Source := S;
    Result := '';
    repeat
      I := Pos(Srch, Source);
      if I > 0 then begin
        Result := Result + Copy(Source, 1, I - 1) + Replace;
        Source := Copy(Source, I + Length(Srch), MaxInt);
      end
      else Result := Result + Source;
    until I <= 0;
  end;
{$ENDIF}
begin
  // �������� !!! ������ ������ ������� ����� ��������� ������ ������,
  // ������� ������� �� �������� � ����������� ������ !
  result := '';
  if length(Str)=0 then exit;
  TempStr := '';
  // �� ����(����-��������) ����� ������ �� ����� � ���� �������� ��� ���������������
  // ������������� ������ ����� ������
  if Inst + CheckUp_ID + ReplaceStr(FormatDateTime2('ddmm',KeyDate),' ','')<>'' then
    Key := Inst + CheckUp_ID + ReplaceStr(FormatDateTime2('ddmm',KeyDate),' ','');
  InStr := Str;
  // ���� ���������� ������� ��������� ������ - ��������� �� ('_'+�������) �� 10 ����.
  if Length(Str)<4 then begin
    InStr := InStr + '_'+IntToStr((ord(InStr[1])*2+1) mod 10);
    while Length(InStr)<10 do
      InStr := InStr +IntToStr((StrToInt(InStr[Length(InStr)])*2+1) mod 10)
  end;
  // ��������� ������ �� ����� �������� �������� ������ � ���������� � ������
  for i :=1 to Length(InStr) do
    TempStr := TempStr + IntToStr(ord(InStr[i]));
  InStr := TempStr;
  j:=1; s:='';
  for i:=1 to Length(InStr) do begin
    s:=s+IntToStr((StrToInt(InStr[i])+StrToInt(Key[j])) mod 10);
    inc(j);
    if j>Length(Key) then j:=1;
  end;
  InStr := s;
  // ����� ������ �� ����� �� 6 ��������, ��� ������ ������ �������������
  // ������������ � �������� � ������-���������
  i:=1;
  while i<length(InStr) do begin
    s:= Copy(InStr,i,6);
    if Length(s)<6 then Result := Result +s
    else Result:=Result+s[3]+s[1]+s[6]+s[2]+s[4]+s[5];
    inc(i,6);
  end;
End;
//==============================================================================
function DeCoder(Str, Inst, CheckUp_ID :string;KeyDate:TDateTime; Key:string='81943'):string;
var
  InStr, TempStr, s : string;
  i, j : integer;
{$IFDEF VER150}
  function ReplaceStr(const S, Srch, Replace: string): string;
  var
    I: Integer;
    Source: string;
  begin
    Source := S;
    Result := '';
    repeat
      I := Pos(Srch, Source);
      if I > 0 then begin
        Result := Result + Copy(Source, 1, I - 1) + Replace;
        Source := Copy(Source, I + Length(Srch), MaxInt);
      end
      else Result := Result + Source;
    until I <= 0;
  end;
{$ENDIF}  
begin
  // �������� ������������ ������
  result := '';
  i:=1;
  InStr := '';
  while i<length(Str) do begin
    s:= Copy(Str,i,6);
    if Length(s)<6 then InStr := InStr +s
    else InStr := InStr +s[2]+s[4]+s[1]+s[5]+s[6]+s[3];
    inc(i,6);
  end;
  // �������� ����
  if Inst + CheckUp_ID + ReplaceStr(FormatDateTime2('ddmm',KeyDate),' ','')<>'' then
    Key := Inst + CheckUp_ID + ReplaceStr(FormatDateTime2('ddmm',KeyDate),' ','');

  j:=1; TempStr:='';
  for i:=1 to Length(InStr) do begin
    TempStr := TempStr +IntToStr((StrToInt(InStr[i])+10-StrToInt(Key[j])) mod 10);
    inc(j);
    if j>Length(Key) then j:=1;
  end;
  // ��������� � �������
  i:=1; InStr := TempStr;
  while i<Length(InStr) do begin
    Result := Result + chr(StrToInt(Copy(InStr,i,2)));
    inc(i,2);
  end;
  if Pos('_',Result)>0 then
    Result := Copy(Result,1,Pos('_',Result)-1);
End;
//==============================================================================
//********* ������� ��������� ��� ����������� VERSION_KEY � ��� ������� ********
//*********             ������������� ���� crtVersionKey                ********
//==============================================================================
const Shifr='1234567890.ABCDEFGHIJKLMNOPRSTUVWXYZabcdefghijklmnoprstuvwxyz';

function Coding(s:string; seed: integer = 0):string;
var sm,i,n:integer;
    res:string;
begin
  if seed=0 then sm:=random(length(Shifr))+1
  else sm:=seed mod length(Shifr)+1;
  res:=Shifr[sm];
  for i:=1 to length(s) do begin
    n:=pos(s[i],Shifr);
    if n=0 then Raise Exception.Create(TranslateText('Coding: �� ������ ������ ')+s[i]);
    n:=(n+sm*i) mod length(Shifr)+1;
    res:=res+Shifr[n];
  end;
  result:=res;
end;
//==============================================================================
function Decoding(s:string):string;
var sm,i,n:integer;
    res:string;
begin
     sm:=pos(s[1],Shifr);
     res:='';
     for i:=2 to length(s) do begin
         n:=pos(s[i],Shifr);
         if n=0 then Raise Exception.Create(TranslateText('Decoding: �� ������ ������ ')+s[i]);
         n:=n-sm*(i-1)+length(Shifr)*i-2;
         n:=n mod length(Shifr)+1;
         res:=res+Shifr[n];
     end;
     result:=res;
end;
//==============================================================================
function GetKey(CurrDate:TDateTime;inst:integer):string;
const
  days :array[1..7] of string =
    ('Monday', 'Tuesday', 'Wednesday', 'Thursday',
     'Friday', 'Saturday', 'Sunday');
var
  dd, mon, year : word;
  temp, str_dd : integer;
begin
  DecodeDate(CurrDate, Year, mon, dd);
  str_dd := DayOfWeek(CurrDate);
  Temp := ((inst*101) mod (dd+mon))*99999+str_dd*9999+((dd+mon)*(str_dd+inst))*999*inst+(dd-mon-inst)*99-dd-mon-inst;
  result := IntToStr(Temp)+days[str_dd][inst*dd mod 6 + 1];
  insert(days[str_dd][ABS(dd+mon-inst)*str_dd mod 6 + 1],result,(str_dd*str_dd+inst+dd) mod 8 + 1);
  insert(days[str_dd][(inst+mon) mod 6 + 1],result,(dd*mon+inst+str_dd) mod 8 + 1);
  while Pos('-',result)<>0 do delete(result,Pos('-',result),1);
end;
//==============================================================================
//**************   ������� ������������ �������    *****************************
//------------------------------------------------------------------------------
procedure GetTestLaunchArgs(
  p_List: array of variant;
  p_Len: integer;
  var pp_Inst,pp_Checkup_id: string;
  var pp_KeyDate: TDateTime;
  var pp_Key: string);
begin
  if p_Len>1 then pp_Inst:=p_List[1]
  else pp_Inst:='';
  if p_Len>2 then pp_Checkup_Id:=p_List[2]
  else pp_Checkup_Id:='';
  if p_Len>3 then pp_KeyDate:=p_List[3]
  else pp_KeyDate:=0;
  if p_Len>4 then pp_Key:=p_List[4]
  else pp_Key:='81943';
end;

function Encrypt(
  p_Type: TOilCryptType;
  p_List: array of variant
  ): string;
var
  vInst,vCheckup_Id,vKey: string;
  vKeyDate:TDateTime;
  len,sid: integer;
begin
  try
    len:=length(p_List);
    if len<=0 then raise exception.create(
      TranslateText('������������ ����������'));
    case p_Type of
      crtTestLaunch:
        begin
          GetTestLaunchArgs(p_List,len,vInst,vCheckup_Id,vKeyDate,vKey);
          result:=EnCoder(p_List[0],vInst,vCheckup_Id,vKeyDate,vKey);
        end;
      crtVersionKey:
          if len=1 then result:=Coding(p_List[0])
          else result:=Coding(p_List[0],p_List[1]);
      crtSmart:
        begin
          {���� ������ ������ p_List ���� ���� �� ������������ ���
          ����� ���� �� ���������}
          if len=1
            then result:=EncryptSmart(p_List[0])
            else result:=EncryptSmart(p_List[0],p_List[1]);
        end;
      crtOrgKey:
        begin
          if len<2 then raise exception.create(
            TranslateText('������������ ���������� ��� ������ � ����� crtOrgKey'));
          result:=GetKey(p_List[0],p_List[1]);
        end;
    end;
  except
    on E:Exception do
      raise exception.create('Encrypt: '+E.Message);
  end;
end;
//==============================================================================
function Decrypt(
  p_Type: TOilCryptType;
  p_List: array of variant
  ): string;
var
  vInst,vCheckup_Id,vKey: string;
  vKeyDate:TDateTime;
  len: integer;
begin
  try
    len:=length(p_List);
    if len<=0 then raise exception.create(
      TranslateText('Decrypt: ������������ ����������'));
    case p_Type of
      crtTestLaunch:
        begin
          GetTestLaunchArgs(p_List,len,vInst,vCheckup_Id,vKeyDate,vKey);
          result:=DeCoder(p_List[0],vInst,vCheckup_Id,vKeyDate,vKey);
        end;
      crtVersionKey: result:=Decoding(p_List[0]);
      crtSmart:
        begin
          {���� ������ ������ p_List ���� ���� �� ������������ ���
          ����� ���� �� ���������}
          if len=1
            then result:=DecryptSmart(p_List[0])
            else result:=DecryptSmart(p_List[0],p_List[1]);       
        end;
      crtOrgKey: raise exception.create(
        TranslateText('Decrypt: ����������� �������� ����������� � ����� crtOrgKey'));
    end;
  except
    on E: Exception do
      raise exception.create('Decrypt: '+E.Message);
  end;
end;
//==============================================================================
function GetPassword(p_Type : TOilPasswordType;p_List: array of variant): string;
var
  SPassw,SStr : string;
begin
  case p_Type of
    pwtTestLaunch:
      begin
        try
          DecodeDate(p_List[2],vYear,vMonth,vDay);
          SStr :=
            IntToStr(p_List[1])+
            p_List[3]+
            FormatDateTime('md',p_List[2])+
            p_List[0]
            ;
          SPassw := Encrypt(
             crtSmart,
             [FormatDateTime('mmddyy',p_List[2]), SStr ]
           );
          Result := TruncPasswId(SPassw);
        except on E:Exception do
          ShowMessage(TranslateText('������ � GetPassword.pwtTestLaunch:')+E.Message);
        end;
      end;
    pwtOrg : result:=GetKey(p_List[0],p_List[1]);
    pwtWagon: result:=Encrypt(crtVersionKey,[Integer(p_List[0])+p_List[1],Integer(p_List[0])]);
    else raise Exception.Create(TranslateText('����� ��������� ��� ������. ���� �������� �����, ����� �������� � uCrypt.GetPassword'));
  end;

end;
//==============================================================================
function TruncPasswId(p_Passw: string) : string;
begin
  Result := Copy(p_Passw,Pos('@!001!',p_Passw)+6,length(p_Passw));
end;
//==============================================================================
end.
