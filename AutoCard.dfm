inherited AutoCardForm: TAutoCardForm
  Left = 377
  Top = 519
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1079#1072#1087#1088#1072#1074#1082#1077' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1072#1084' ('#1090#1072#1083#1086#1085#1072#1084')'
  ClientHeight = 275
  ClientWidth = 386
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 240
    Width = 386
    Height = 35
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    DesignSize = (
      386
      35)
    object bbOk: TBitBtn
      Left = 216
      Top = 5
      Width = 79
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      TabOrder = 0
      OnClick = bbOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 299
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 386
    Height = 96
    Align = alTop
    Caption = #1054#1073#1097#1080#1077' '#1076#1072#1085#1085#1099#1077
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 89
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1086#1095#1082#1080' :'
    end
    object Label2: TLabel
      Left = 216
      Top = 16
      Width = 83
      Height = 13
      Caption = #1044#1072#1090#1072' '#1079#1072#1087#1088#1072#1074#1082#1080' :'
    end
    object Edit1: TEdit
      Left = 8
      Top = 32
      Width = 33
      Height = 21
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DateEdit1: TDateEdit
      Left = 216
      Top = 32
      Width = 161
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnChange = DateEdit1Change
    end
    object rbCard: TRadioButton
      Left = 8
      Top = 57
      Width = 113
      Height = 17
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072
      TabOrder = 2
      OnClick = rbCardSelect
      OnEnter = rbCardSelect
    end
    object rbTalon: TRadioButton
      Left = 8
      Top = 76
      Width = 113
      Height = 17
      Caption = #1058#1072#1083#1086#1085
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TabStop = True
      OnClick = rbTalonSelect
      OnEnter = rbTalonSelect
    end
    object Edit2: TEdit
      Left = 42
      Top = 32
      Width = 126
      Height = 21
      MaxLength = 6
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 152
    Width = 386
    Height = 88
    Align = alBottom
    Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1090#1077#1093#1085#1080#1095#1077#1089#1082#1086#1084#1091' '#1089#1088#1077#1076#1089#1090#1074#1091
    TabOrder = 2
    object Label4: TLabel
      Left = 8
      Top = 13
      Width = 121
      Height = 13
      Caption = #1058#1077#1093#1085#1080#1095#1077#1089#1082#1086#1077' '#1089#1088#1077#1076#1089#1090#1074#1086' :'
    end
    object SpeedButton5: TSpeedButton
      Left = 170
      Top = 26
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      OnClick = SpeedButton5Click
    end
    object Label3: TLabel
      Left = 8
      Top = 47
      Width = 54
      Height = 13
      Caption = #1042#1086#1076#1080#1090#1077#1083#1100' :'
    end
    object SpeedButton3: TSpeedButton
      Left = 170
      Top = 60
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      OnClick = SpeedButton3Click
    end
    object ceAuto: TComboEdit
      Left = 8
      Top = 27
      Width = 161
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ceAutoButtonClick
      OnDblClick = ceAutoButtonClick
    end
    object ceEmploy: TComboEdit
      Left = 8
      Top = 61
      Width = 161
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = ceEmployButtonClick
      OnDblClick = ceEmployButtonClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 96
    Width = 386
    Height = 56
    Align = alClient
    Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1091
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 14
      Width = 79
      Height = 13
      Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090' :'
    end
    object SpeedButton4: TSpeedButton
      Left = 171
      Top = 27
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      OnClick = SpeedButton4Click
    end
    object Label6: TLabel
      Left = 216
      Top = 14
      Width = 103
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1083#1080#1090#1088#1086#1074' :'
    end
    object ceNPGroup: TComboEdit
      Left = 8
      Top = 28
      Width = 162
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ceNPGroupButtonClick
      OnDblClick = ceNPGroupButtonClick
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 216
      Top = 28
      Width = 161
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '0.###'
      TabOrder = 1
    end
  end
  object qTemp: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 336
    Top = 13
  end
end
