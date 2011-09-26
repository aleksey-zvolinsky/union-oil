unit uHelpForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, ImgList;

type
  THelpForm = class(TForm)
    RichEdit: TRichEdit;
    pnlTop: TPanel;
    Image: TImage;
    procedure ImageClick(Sender: TObject);
  private
  public
  end;

implementation

{$R *.DFM}

procedure THelpForm.ImageClick(Sender: TObject);
begin
  Close;
end;

end.
