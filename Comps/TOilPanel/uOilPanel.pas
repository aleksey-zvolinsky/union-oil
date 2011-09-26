unit uOilPanel;

interface

uses
  SysUtils, Classes, Controls, ExtCtrls, Messages;

type
  TOilPanel = class(TPanel)
  private
    { Private declarations }
    FOnMouseLeave: TNotifyEvent;
    FOnMouseEnter: TNotifyEvent;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Oil', [TOilPanel]);
end;

{ TOilPanel }

procedure TOilPanel.CMMouseEnter(var Message: TMessage);
begin
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TOilPanel.CMMouseLeave(var Message: TMessage);
begin
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

end.

