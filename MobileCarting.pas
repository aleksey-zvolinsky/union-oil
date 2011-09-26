unit MobileCarting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EditBase, DB, MemDS, DBAccess, Ora, uOilQuery, StdCtrls,
  Buttons, ExtCtrls, RXCtrls, uHelpButton;

type
  TMobileCartingForm = class(TEditBaseForm)
    OilHelpButton: TOilHelpButton;
    RxCheckListBox2: TRxCheckListBox;
    RxCheckListBox1: TRxCheckListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MobileCartingForm: TMobileCartingForm;

implementation

{$R *.dfm}

end.
