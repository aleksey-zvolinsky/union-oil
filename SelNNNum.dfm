inherited fSelNNNum: TfSelNNNum
  Left = 383
  Top = 324
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Новый номер НН'
  ClientHeight = 114
  ClientWidth = 234
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 234
    Height = 73
    Align = alClient
    Caption = ' Номер накладной '
    TabOrder = 0
    object rbManual: TRadioButton
      Left = 8
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Ввести номер'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbAuto: TRadioButton
      Left = 8
      Top = 48
      Width = 193
      Height = 17
      Caption = 'Получить номер автоматически'
      TabOrder = 1
    end
    object edNum: TEdit
      Left = 104
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 2
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 73
    Width = 234
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Button1: TButton
      Left = 152
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Выбрать'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
