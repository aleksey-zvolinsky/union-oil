unit Memo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, RxRichEd, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  ActnList;

type
  TMemoForm = class(TCommonForm)
    RE1: TRichEdit;
    ActionList: TActionList;
    actClose: TAction;
    procedure actCloseExecute(Sender: TObject);
  private
  public
  end;

var
  MemoForm: TMemoForm;

procedure ShowText(s: string);
procedure ShowFormattedText(p_Text: string; p_Caption: string='Справка');

implementation

{$R *.DFM}

var SetRichEditTextErrors: array [1..6] of string = (
{ 1} 'Нелегальный символ внутри фигурных скобок',
{ 2} 'Нелегальный символ после слеша',
{ 3} 'Пустой тэг {}',
{ 4} 'Отсутствует символ после слеша',
{ 5} 'Незакрытая фигурная скобка',
{ 6} 'Неизвестный тэг'
);

var TagList: string ='D,B,b,I,i,U,u,S,s,WHITE,BLACK,BLUE,RED,GREEN,PURPLE,MAROON,LIME,NAVY,OLIVE,FUCHSIA,AQUA,DEFAULT';

//==============================================================================
procedure SetRichEditText(var p_RE: TRichEdit; p_Text: string);
var
  s: string;
  slTags: TStringList;
  //****************************************************************************
  procedure ReadText;
  type TState=(stNormal,stAfterSlash,stAfterBrace);

  var
    vTag: string;
    i,len,nLine,nSymb,nLineSymb: integer;
    c: char;
    vState: TState;
    //**************************************************************************
    procedure DoErr(p_Num: integer);
    begin
      raise exception.create(
        TranslateText('SetRichEditText: ошибка параметра p_Text в строке ')+IntToStr(nLine)+TranslateText(' позиции ')+IntToStr(nLineSymb)+#13#10+
        SetRichEditTextErrors[p_Num]);
    end;
    //**************************************************************************
    procedure AddToS(p_Char: char);
    begin
      s:=s+p_Char;
      inc(nSymb);
      if p_Char=#13 then inc(nLine);
    end;
    //**************************************************************************
    function TestTag(p_Tag: string): Boolean;
    begin
      if pos(','+p_Tag+',',','+TagList+',')=0 then
        try
          StrToInt(p_Tag);
        except
          DoErr(6);
        end;
    end;
    //**************************************************************************
    procedure AddToTags(p_Tag: string);
    begin
      TestTag(p_Tag);
    end;
    //****************************************************************************
  begin
    nLine:=1; nSymb:=1; nLineSymb:=1;
    len:=length(p_Text);
    s:='';
    vState:=stNormal;
    vTag:='';

    for i:=1 to len do begin
      c:=p_Text[i];
      case c of
        '\':
          case vState of
            stNormal: vState:=stAfterSlash;
            stAfterSlash:
              begin
                AddToS('\');
                vState:=stNormal;
              end;
            stAfterBrace: DoErr(1);
          end;
        '{':
          case vState of
            stNormal: vState:=stAfterBrace;
            stAfterBrace:
              if vTag='' then begin
                AddToS('(');
                vState:=stNormal;
              end else
                DoErr(1);
            stAfterSlash: DoErr(3);
          end;
        '}':
          case vState of
            stNormal: AddToS('}');
            stAfterSlash: DoErr(3);
            stAfterBrace:
              begin
                if vTag='' then DoErr(4)
                else begin
                  slTags.Add(IntToStr(nSymb)+':'+vTag);
                  vTag:='';
                  vState:=stNormal;
                end;
              end;
          end;
        else
          case vState of
            stNormal: AddToS(c);
            stAfterSlash:
              begin
                slTags.Add(IntToStr(nSymb)+':'+c);
                vState:=stNormal;
              end;
            stAfterBrace: vTag:=vTag+c;
          end;
      end; // case

      if c=#13 then nLineSymb:=1
      else inc(nLIneSymb);
    end; // for

    case vState of
      stAfterSlash: DoErr(4);
      stAfterBrace: DoErr(5);
    end;
  end;
  //****************************************************************************
  procedure DoTag(p_Tag: string);
  begin
    if p_Tag='B' then p_RE.SelAttributes.Style:=p_RE.SelAttributes.Style+[fsBold]
    else if p_Tag='b' then p_RE.SelAttributes.Style:=p_RE.SelAttributes.Style-[fsBold]
    else if p_Tag='I' then p_RE.SelAttributes.Style:=p_RE.SelAttributes.Style+[fsItalic]
    else if p_Tag='i' then p_RE.SelAttributes.Style:=p_RE.SelAttributes.Style-[fsItalic]
    else if p_Tag='U' then p_RE.SelAttributes.Style:=p_RE.SelAttributes.Style+[fsUnderline]
    else if p_Tag='u' then p_RE.SelAttributes.Style:=p_RE.SelAttributes.Style-[fsUnderline]
    else if p_Tag='S' then p_RE.SelAttributes.Style:=p_RE.SelAttributes.Style+[fsStrikeOut]
    else if p_Tag='s' then p_RE.SelAttributes.Style:=p_RE.SelAttributes.Style-[fsStrikeOUt]

    else if p_Tag='WHITE'   then p_RE.SelAttributes.Color:=clWhite
    else if p_Tag='BLACK'   then p_RE.SelAttributes.Color:=clBlack
    else if p_Tag='RED'     then p_RE.SelAttributes.Color:=clRed
    else if p_Tag='BLUE'    then p_RE.SelAttributes.Color:=clBlue
    else if p_Tag='GREEN'   then p_RE.SelAttributes.Color:=clGreen
    else if p_Tag='PURPLE'  then p_RE.SelAttributes.Color:=clPurple
    else if p_Tag='MAROON'  then p_RE.SelAttributes.Color:=clMaroon
    else if p_Tag='LIME'    then p_RE.SelAttributes.Color:=clLime
    else if p_Tag='NAVY'    then p_RE.SelAttributes.Color:=clNavy
    else if p_Tag='OLIVE'   then p_RE.SelAttributes.Color:=clOlive
    else if p_Tag='FUCHSIA' then p_RE.SelAttributes.Color:=clFuchsia
    else if p_Tag='AQUA'    then p_RE.SelAttributes.Color:=clAqua

    else if (p_Tag='D') or (p_Tag='DEFAULT') then
      p_RE.SelAttributes:=p_RE.DefAttributes

    else p_RE.SelAttributes.Size:=StrToInt(p_Tag);
  end;
  //****************************************************************************
  procedure PutToRichEdit;
  var
    i,n,len: integer;
    stemp,vTag: string;
  begin
    p_RE.Text:=s;
    len:=length(p_RE.Text);
    for i:=0 to slTags.Count-1 do begin
      n:=pos(':',slTags[i]);
      stemp:=copy(slTags[i],1,n-1);
      vTag:=copy(slTags[i],n+1,length(slTags[i]));
      n:=StrToInt(stemp);
      p_RE.SelStart:=n-1;
      p_RE.SelLength:=len-n;
      DoTag(vTag);
    end;
    p_RE.SelLength:=0;
  end;
  //****************************************************************************
begin
  slTags:=TStringList.Create;
  try
    ReadText;
    PutToRichEdit;
  finally
    slTags.Free;
  end;
end;
//==============================================================================
procedure ShowText(s:string);
var
  MF: TMemoForm;
begin
  Application.CreateForm(TMemoForm, MF);
  MF.RE1.Lines.Clear;
  MF.RE1.Lines.Text := s;
  MF.RE1.ReadOnly := true;
  MF.ShowModal;
  MF.Free;
end;
//==============================================================================
procedure ShowFormattedText(p_Text: string; p_Caption: string='Справка');
var MF:TMemoForm;
begin
  Application.CreateForm(TMemoForm,MF);
  MF.RE1.Lines.Clear;
  MF.RE1.Lines.Text := trim(p_Text);
  MF.RE1.ReadOnly := true;
  SetRichEditText(MF.RE1,p_Text);
  MF.ShowModal;
  MF.Free;
end;
//==============================================================================
procedure TMemoForm.actCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;
//==============================================================================

end.
