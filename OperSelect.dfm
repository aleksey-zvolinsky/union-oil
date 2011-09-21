inherited OperSelectForm: TOperSelectForm
  Left = 457
  Top = 202
  BorderStyle = bsDialog
  Caption = 'Выбор операции'
  ClientHeight = 330
  ClientWidth = 305
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 3
    Width = 41
    Height = 13
    Caption = 'Группа :'
  end
  object Label2: TLabel
    Left = 8
    Top = 45
    Width = 56
    Height = 13
    Caption = 'Операции :'
  end
  object CL1: TCheckListBox
    Left = 8
    Top = 61
    Width = 289
    Height = 233
    ItemHeight = 13
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 301
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 19
    Width = 289
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox1Change
    Items.Strings = (
      'Все')
  end
  object q: TOilQuery
        Left = 8
    Top = 296
  end
  object Query1: TOilQuery
        SQL.Strings = (
      'select * from v_oil_oper_grp order by name')
    Left = 48
    Top = 296
  end
end
