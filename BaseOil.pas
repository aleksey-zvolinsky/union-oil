unit BaseOil;

(**
 *  ����� ������� ���������� ��� �������� ���� � ���� ������������ ���� � ������
 *  �������, ��� �������� � ������ ������ ����� ��������� ���� ������� �����
 *  �� ���� � ������� �� BaseOilForm, ����� � ������� ��� ��� �������� ��������
 *  �������� ����� �� TBaseOilForm
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
