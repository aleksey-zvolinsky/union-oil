inherited OperTypeForm: TOperTypeForm
  Left = 278
  Top = 150
  BorderStyle = bsDialog
  Caption = #1054#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1090#1080#1087#1072' '#1086#1087#1077#1088#1072#1094#1080#1080
  ClientHeight = 170
  ClientWidth = 312
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 56
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' :'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 41
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072' :'
  end
  object SpeedButton1: TSpeedButton
    Left = 283
    Top = 64
    Width = 23
    Height = 22
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD88DDDDDDDD
      88DDDDFFDDDDDDDDFFDDDD888DDDDDD888DDDDFFFDDDDDDFFFDDDDD888DDDD88
      8DDDDDDFFFDDDDFFFDDDDDDD888DD888DDDDDDDDFFFDDFFFDDDDDDDDD888888D
      DDDDDDDDDFFFFFFDDDDDDDDDDD8888DDDDDDDDDDDDFFFFDDDDDDDDDDDD8888DD
      DDDDDDDDDDFFFFDDDDDDDDDDD888888DDDDDDDDDDFFFFFFDDDDDDDDD888DD888
      DDDDDDDDFFFDDFFFDDDDDDD888DDDD888DDDDDDFFFDDDDFFFDDDDD888DDDDDD8
      88DDDDFFFDDDDDDFFFDDDD88DDDDDDDD88DDDDFFDDDDDDDDFFDDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
    NumGlyphs = 2
    OnClick = SpeedButton1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 130
    Width = 312
    Height = 40
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 139
      Top = 7
      Width = 80
      Height = 25
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 222
      Top = 7
      Width = 85
      Height = 25
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 273
    Height = 21
    Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1080#1087#1072' '#1086#1087#1077#1088#1072#1094#1080#1080
    TabOrder = 1
  end
  object ComboEdit1: TComboEdit
    Left = 8
    Top = 64
    Width = 273
    Height = 21
    Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1082' '#1082#1086#1090#1086#1088#1086#1081' '#1087#1088#1077#1085#1072#1076#1083#1077#1078#1080#1090' '#1086#1087#1077#1088#1072#1094#1080#1103
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 2
    OnButtonClick = ComboEdit1ButtonClick
    OnDblClick = ComboEdit1ButtonClick
  end
  object CheckBox1: TCheckBox
    Left = 7
    Top = 104
    Width = 215
    Height = 14
    Caption = #1053#1077' '#1079#1072#1085#1086#1089#1080#1090#1100' '#1074' '#1082#1085#1080#1075#1091' '#1091#1095#1077#1090#1072' '#1087#1088#1086#1076#1072#1078
    TabOrder = 3
  end
end
