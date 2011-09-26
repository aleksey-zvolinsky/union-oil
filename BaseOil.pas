unit BaseOil;

(**
 *  ‘орма сделана специально дл€ переноса форм в виде справочников ќйла в другие
 *  проэкты, дл€ переноса в другой проэкт нужно перенести туда базовою форму
 *  из ќйла и назвать ее BaseOilForm, затем в проэкте ќйл дл€ переноса изменить
 *  родител€ формы на TBaseOilForm
 *)


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, DBGridEhGrouping, ActnList, Menus, DB, MemDS, DBAccess,
  Ora, uOilQuery, RXCtrls, GridsEh, DBGridEh, ExtCtrls, StdCtrls, Buttons;

type
  TBaseOilForm = class(TBaseForm)
  private
    { Private declarations }
  public
    property dbBaseGrid: TDBGridEh read DBGrid1 write DBGrid1;
  end;

var
  BaseOilForm: TBaseOilForm;

implementation

{$R *.dfm}

end.
