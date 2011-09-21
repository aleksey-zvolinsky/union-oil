inherited LanguageForm: TLanguageForm
  Left = 483
  Top = 367
  BorderStyle = bsDialog
  Caption = '¬ыбор €зыка'
  ClientHeight = 139
  ClientWidth = 269
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbIntfLang: TLabel
    Left = 8
    Top = 16
    Width = 95
    Height = 13
    Caption = 'язык интерфейса:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbRepLang: TLabel
    Left = 8
    Top = 49
    Width = 73
    Height = 13
    Caption = 'язык отчетов:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 60
    Top = 85
    Width = 197
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = '* настройки примен€ютс€ немедленно'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object cbInterfaceLang: TComboBox
    Left = 115
    Top = 13
    Width = 145
    Height = 21
    Style = csDropDownList
    Anchors = [akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 0
    OnChange = cbInterfaceLangChange
    Items.Strings = (
      '–усский'
      '”краинский')
  end
  object cbReportsLang: TComboBox
    Left = 115
    Top = 45
    Width = 145
    Height = 21
    Style = csDropDownList
    Anchors = [akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 1
    OnChange = cbReportsLangChange
    Items.Strings = (
      '–усский'
      '”краинский')
  end
  object bbOk: TBitBtn
    Left = 177
    Top = 109
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '«акрыть'
    TabOrder = 2
    Kind = bkCancel
  end
end
