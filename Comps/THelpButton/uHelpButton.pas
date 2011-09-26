unit uHelpButton;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, uHelpForm;

type
  TFormOrientation = (fTopToBottom,fBottomToTop);

  TOilHelpButton = class(TSpeedButton)
  private
    FLines: TStrings;
    FHelpForm: THelpForm;
    FOwner: TComponent;
    FCaptionText: string;
    FHeaderColor: TColor;
    FHeaderFont: TFont;
    FRichEditColor: TColor;
    FAnimate: boolean;
    FHelpFileName: string;
    FUseCurrentDir: boolean;
    FFormOrientation: TFormOrientation;
    FAnimateTime: integer;
    FImages: TImageList;
    FImageIndex: integer;
    FFormWidth: integer;
    FFormHeight: integer;
    procedure SetLines(const Value: TStrings);
    procedure ShowHelpForm(Sender: TObject);
    procedure SetFHeaderFont(const Value: TFont);
    procedure SetHelpFileName(const Value: string);
    procedure OnFormShow(Sender:TObject);
    procedure OnFormClose(Sender: TObject; var Action: TCloseAction);
    procedure SetImageIndex(const Value: integer);
    procedure SetImages(const Value: TImageList);
  protected
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  published
    property AnimateTime : integer read FAnimateTime write FAnimateTime;
    property Lines : TStrings read FLines write SetLines;
    property HeaderColor: TColor read FHeaderColor write FHeaderColor default clSilver;
    property HeaderText: string read FCaptionText write FCaptionText;
    property HeaderFont: TFont read FHeaderFont write SetFHeaderFont;
    property RichEditColor: TColor read FRichEditColor write FRichEditColor default clWhite;
    property Animate : boolean read FAnimate write FAnimate;
    property HelpFileName : string read FHelpFileName write SetHelpFileName;
    property UseCurrentDir : boolean read FUseCurrentDir write FUseCurrentDir;
    property FormOrientation : TFormOrientation read FFormOrientation write FFormOrientation;
    property Images : TImageList read FImages write SetImages;
    property ImageIndex : integer read FImageIndex write SetImageIndex;
  end;

procedure Register;

implementation

uses URichEditFormat;

procedure Register;
begin
  RegisterComponents('Oil', [TOilHelpButton]);
end;

{ TOilHelpButton }
//==============================================================================
constructor TOilHelpButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLines := TStringList.Create;
  FHeaderFont := TFont.Create;
  FOwner := AOwner;
  OnClick := ShowHelpForm;
  FHeaderColor := clSilver;
  FRichEditColor := clWhite;
  FFormOrientation:=fBottomToTop;
  FAnimateTime := 200;
  FCaptionText := Self.Name;
  FImageIndex:=-1;
  AllowAllUp:=TRUE;
  GroupIndex:=1001;
  Width:=25;
  Height:=25;
end;
//==============================================================================
destructor TOilHelpButton.Destroy;
begin
  FLines.Free;
  FHeaderFont.Free;
  inherited Destroy;
end;
//==============================================================================
procedure TOilHelpButton.SetFHeaderFont(const Value: TFont);
begin
  if Assigned(Value)
    then FHeaderFont := Value;
end;
//==============================================================================
procedure TOilHelpButton.SetLines(const Value: TStrings);
begin
  if Assigned(Value)
    then FLines.Assign(Value);
end;
//==============================================================================
procedure TOilHelpButton.ShowHelpForm(Sender: TObject);
var
 P: TPoint;
begin
  if Down then begin
    FHelpForm := THelpForm.Create(FOwner);
    with FHelpForm do
    begin
      GetCursorPos(P);
      if FHelpFileName <> ''
        then FLines.LoadFromFile(FHelpFileName);
      SetRichEditText(FHelpForm.RichEdit,Lines.Text);
      RichEdit.Color := Self.RichEditColor;
      Caption:=Self.HeaderText;
      //pnlTop.Color := Self.HeaderColor;
      //pnlTop.Caption := Self.HeaderText;
      if FormOrientation = fBottomToTop
        then Top := P.y-Height
        else Top := P.y;
      Left := p.x;
      OnShow := OnFormShow;
      OnClose := OnFormClose;
      Width := Screen.Width div 2;
      Height := Screen.Height-100;
      Top :=0;
      Left := Screen.Width div 2;
      Show;
    end;
  end else
    FHelpForm.Free;
end;
//==============================================================================
procedure TOilHelpButton.SetHelpFileName(const Value: string);
begin
  if not FileExists(Value)
    then ShowMessage('File '+Value+' does not exists')
    else FHelpFileName := Value;
end;
//==============================================================================
procedure TOilHelpButton.OnFormShow(Sender: TObject);
begin
{  if Animate then
    if FormOrientation = fTopToBottom
      then AnimateWindow(FHelpForm.Handle, AnimateTime, AW_HOR_POSITIVE or AW_VER_POSITIVE)
      else AnimateWindow(FHelpForm.Handle, AnimateTime, AW_HOR_POSITIVE or AW_VER_NEGATIVE);}
  FHelpForm.RichEdit.Repaint;
  FHelpForm.pnlTop.Repaint;
end;
//==============================================================================
procedure TOilHelpButton.OnFormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  Down:=FALSE;
end;
//==============================================================================
procedure TOilHelpButton.SetImages(const Value: TImageList);
begin
  FImages := Value;
  if FImages <> nil then
    FImages.FreeNotification(Self);
  if (FImageIndex<>-1) and (FImages<>nil) then
    FImages.GetBitmap(FImageIndex,Glyph);
end;
//==============================================================================
procedure TOilHelpButton.SetImageIndex(const Value: integer);
begin
  FImageIndex := Value;
  if (FImageIndex<>-1) and (FImages<>nil) then
    FImages.GetBitmap(FImageIndex,Glyph);
end;
//==============================================================================
end.
