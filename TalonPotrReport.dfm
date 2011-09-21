inherited TalonPotrReportForm: TTalonPotrReportForm
  Left = 353
  Top = 243
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1054#1090#1095#1077#1090#1099' '#1087#1086' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1103#1084
  ClientHeight = 361
  ClientWidth = 368
  Constraints.MinHeight = 340
  Constraints.MinWidth = 320
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 39
    Width = 67
    Height = 13
    Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
  end
  object rgTalonReportType: TRadioGroup
    Left = 5
    Top = 110
    Width = 186
    Height = 91
    Caption = #1054#1090#1095#1077#1090
    ItemIndex = 0
    Items.Strings = (
      #1056#1077#1077#1089#1090#1088' '#1086#1090#1087#1091#1097#1077#1085#1085#1099#1093' '#1090#1072#1083#1086#1085#1086#1074' '
      #1056#1077#1077#1089#1090#1088' '#1086#1090#1086#1074#1072#1088#1077#1085#1085#1099#1093' '#1090#1072#1083#1086#1085#1086#1074' '
      #1054#1089#1090#1072#1090#1082#1080' '#1090#1072#1083#1086#1085#1086#1074' '
      #1044#1074#1080#1078#1077#1085#1080#1077' '#1053#1055' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084' ')
    TabOrder = 2
    Visible = False
    OnClick = rgTalonReportTypeClick
  end
  object rgCardReportType: TRadioGroup
    Left = 5
    Top = 110
    Width = 186
    Height = 91
    Caption = #1054#1090#1095#1077#1090
    ItemIndex = 0
    Items.Strings = (
      #1056#1077#1077#1089#1090#1088' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103' '#1082#1072#1088#1090#1086#1095#1077#1082
      #1056#1077#1077#1089#1090#1088' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1082#1072#1088#1090#1086#1095#1077#1082
      #1054#1089#1090#1072#1090#1082#1080' '#1053#1055' '#1085#1072' '#1082#1072#1088#1090#1086#1095#1082#1072#1093
      #1044#1074#1080#1078#1077#1085#1080#1077' '#1053#1055' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1072#1084)
    TabOrder = 11
    Visible = False
    OnClick = rgCardReportTypeClick
  end
  object pClient: TPanel
    Left = 5
    Top = 60
    Width = 356
    Height = 21
    BevelOuter = bvNone
    TabOrder = 9
    Visible = False
    object lClient: TLabel
      Left = 5
      Top = 5
      Width = 66
      Height = 13
      Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
    end
    object sbClearClient: TSpeedButton
      Left = 335
      Top = 1
      Width = 20
      Height = 20
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
      OnClick = sbClearClientClick
    end
    object ceClient: TComboEdit
      Left = 75
      Top = 0
      Width = 261
      Height = 21
      Hint = #1042' '#1101#1090#1086#1084' '#1087#1086#1083#1077' '#1091#1082#1072#1078#1080#1090#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102' '#1076#1083#1103' '#1082#1086#1090#1086#1088#1086#1081' '#1089#1090#1088#1086#1080#1090#1100#1089#1103' '#1086#1090#1095#1077#1090
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnButtonClick = ceClientButtonClick
      OnDblClick = ceClientButtonClick
    end
  end
  object rgTalonType: TRadioGroup
    Left = 195
    Top = 120
    Width = 171
    Height = 56
    Caption = #1043#1088#1091#1087#1087#1080#1088#1086#1074#1082#1072' '#1090#1072#1083#1086#1085#1086#1074
    ItemIndex = 0
    Items.Strings = (
      #1042#1089#1077' '#1090#1072#1083#1086#1085#1099' '#1086#1090#1076#1077#1083#1100#1085#1086
      #1055#1086' '#1076#1080#1072#1087#1072#1079#1086#1085#1072#1084)
    TabOrder = 0
    Visible = False
  end
  object pAutoDriver: TPanel
    Left = 5
    Top = 60
    Width = 356
    Height = 21
    BevelOuter = bvNone
    TabOrder = 10
    Visible = False
    object Label2: TLabel
      Left = 5
      Top = 5
      Width = 24
      Height = 13
      Caption = #1040#1074#1090#1086
    end
    object sbClearAuto: TSpeedButton
      Left = 130
      Top = 1
      Width = 20
      Height = 20
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
      OnClick = sbClearAutoClick
    end
    object Label4: TLabel
      Left = 165
      Top = 5
      Width = 48
      Height = 13
      Caption = #1042#1086#1076#1080#1090#1077#1083#1100
    end
    object sbClearDriver: TSpeedButton
      Left = 335
      Top = 1
      Width = 20
      Height = 20
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
      OnClick = sbClearDriverClick
    end
    object ceAuto: TComboEdit
      Left = 35
      Top = 0
      Width = 96
      Height = 21
      Hint = #1042' '#1101#1090#1086#1084' '#1087#1086#1083#1077' '#1091#1082#1072#1078#1080#1090#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102' '#1076#1083#1103' '#1082#1086#1090#1086#1088#1086#1081' '#1089#1090#1088#1086#1080#1090#1100#1089#1103' '#1086#1090#1095#1077#1090
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnButtonClick = ceAutoButtonClick
      OnDblClick = ceAutoButtonClick
    end
    object ceDriver: TComboEdit
      Left = 215
      Top = 0
      Width = 121
      Height = 21
      Hint = #1042' '#1101#1090#1086#1084' '#1087#1086#1083#1077' '#1091#1082#1072#1078#1080#1090#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102' '#1076#1083#1103' '#1082#1086#1090#1086#1088#1086#1081' '#1089#1090#1088#1086#1080#1090#1100#1089#1103' '#1086#1090#1095#1077#1090
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnButtonClick = ceDriverButtonClick
      OnDblClick = ceDriverButtonClick
    end
  end
  object gbTypeRefuelCard: TGroupBox
    Left = 195
    Top = 110
    Width = 171
    Height = 76
    Caption = #1054#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1077
    TabOrder = 12
    Visible = False
    object cbOurClientOurAZS: TCheckBox
      Left = 5
      Top = 15
      Width = 161
      Height = 17
      Caption = #1053#1072#1096#1080' '#1082#1083#1080#1077#1085#1090#1099' + '#1053#1072#1096#1080' '#1040#1047#1057
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbOurClientAlienAZS: TCheckBox
      Left = 5
      Top = 35
      Width = 161
      Height = 17
      Caption = #1053#1072#1096#1080' '#1082#1083#1080#1077#1085#1090#1099' + '#1063#1091#1078#1080#1077' '#1040#1047#1057
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object cbAlienClientOurAZS: TCheckBox
      Left = 5
      Top = 55
      Width = 161
      Height = 17
      Caption = #1063#1091#1078#1080#1077' '#1082#1083#1080#1077#1085#1090#1099' + '#1053#1072#1096#1080' '#1040#1047#1057
      TabOrder = 2
    end
  end
  object pCurDate: TPanel
    Left = 45
    Top = 5
    Width = 261
    Height = 21
    BevelOuter = bvNone
    TabOrder = 8
    object Label3: TLabel
      Left = 70
      Top = 5
      Width = 12
      Height = 13
      Caption = #1085#1072
    end
    object deCurDate: TDateEdit
      Left = 90
      Top = 0
      Width = 101
      Height = 21
      DefaultToday = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
      Text = '05.06.2000'
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 325
    Width = 361
    Height = 34
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object bExit: TBitBtn
      Left = 260
      Top = 5
      Width = 93
      Height = 25
      Caption = '&'#1042#1099#1093#1086#1076
      TabOrder = 0
      OnClick = bExitClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 160
      Top = 5
      Width = 93
      Height = 25
      Caption = '&'#1055#1077#1095#1072#1090#1100
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B004000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000
        000000000000000000000000000000000000000000000000000000C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6C6000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C00000000000000000000000000000000000000000
        00000000000000000000000000000000000000C6C6C6000000C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600FFFF
        00FFFF00FFFFC6C6C6C6C6C6000000000000000000C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C684848484848484
        8484C6C6C6C6C6C6000000C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000C6C6C6C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0000000C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000
        C6C6C6000000C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
        00000000000000000000000000000000000000000000000000C6C6C6000000C6
        C6C6000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C6C6000000C6C6
        C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF00
        0000000000000000000000000000FFFFFF000000000000000000000000C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF000000000000
        000000000000000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000000000000000000000
        00000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0}
    end
  end
  object CEOrg: TComboEdit
    Left = 80
    Top = 34
    Width = 281
    Height = 21
    Hint = #1042' '#1101#1090#1086#1084' '#1087#1086#1083#1077' '#1091#1082#1072#1078#1080#1090#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102' '#1076#1083#1103' '#1082#1086#1090#1086#1088#1086#1081' '#1089#1090#1088#1086#1080#1090#1100#1089#1103' '#1086#1090#1095#1077#1090
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnButtonClick = CEOrgButtonClick
  end
  object gbColumns: TGroupBox
    Left = 5
    Top = 205
    Width = 201
    Height = 116
    Caption = #1053#1077#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1077' '#1082#1086#1083#1086#1085#1082#1080' '#1086#1090#1095#1077#1090#1072
    TabOrder = 5
    object pTalon: TPanel
      Left = 5
      Top = 55
      Width = 186
      Height = 16
      BevelOuter = bvNone
      TabOrder = 4
      Visible = False
      object cbSer: TCheckBox
        Left = 75
        Top = 0
        Width = 51
        Height = 17
        Caption = #1057#1077#1088#1080#1103
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = cbSerClick
      end
      object cbNominal: TCheckBox
        Left = 0
        Top = 0
        Width = 66
        Height = 17
        Caption = #1053#1086#1084#1080#1085#1072#1083
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = cbNominalClick
      end
      object cbNum: TCheckBox
        Left = 130
        Top = 0
        Width = 56
        Height = 17
        Caption = #1053#1086#1084#1077#1088
        TabOrder = 2
        OnClick = cbNumClick
      end
    end
    object cbCardNumber: TCheckBox
      Left = 5
      Top = 55
      Width = 191
      Height = 17
      Caption = #8470' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1086#1081' '#1082#1072#1088#1090#1086#1095#1082#1080
      Checked = True
      State = cbChecked
      TabOrder = 3
      Visible = False
      OnClick = cbCardNumberClick
    end
    object pAZS: TPanel
      Left = 5
      Top = 15
      Width = 146
      Height = 36
      BevelOuter = bvNone
      TabOrder = 2
      object cbAZS: TCheckBox
        Left = 0
        Top = 20
        Width = 41
        Height = 17
        Caption = #1040#1047#1057
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = cbAZSClick
      end
      object cbPart: TCheckBox
        Left = 0
        Top = 0
        Width = 61
        Height = 17
        Caption = #1055#1072#1088#1090#1080#1103
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = cbPartClick
      end
      object cbSubPart: TCheckBox
        Left = 65
        Top = 0
        Width = 76
        Height = 17
        Caption = #1055#1086#1076#1055#1072#1088#1090#1080#1103
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = cbSubPartClick
      end
    end
    object cbDate: TCheckBox
      Left = 5
      Top = 95
      Width = 106
      Height = 17
      Caption = #1044#1072#1090#1099' '#1086#1087#1077#1088#1072#1094#1080#1081
      TabOrder = 0
    end
    object cbPrice: TCheckBox
      Left = 5
      Top = 75
      Width = 51
      Height = 17
      Caption = #1062#1077#1085#1072
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object gbSubTotal: TGroupBox
    Left = 210
    Top = 205
    Width = 156
    Height = 76
    Caption = #1048#1090#1086#1075#1080
    TabOrder = 6
    object cbSTNominal: TCheckBox
      Left = 5
      Top = 55
      Width = 146
      Height = 17
      Caption = #1053#1086#1084#1080#1085#1072#1083
      TabOrder = 0
      Visible = False
    end
    object cbSTCardNumber: TCheckBox
      Left = 5
      Top = 55
      Width = 146
      Height = 17
      Caption = #8470' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1086#1081' '#1082#1072#1088#1090#1086#1095#1082#1080
      TabOrder = 2
      Visible = False
    end
    object pSTAZS: TPanel
      Left = 5
      Top = 15
      Width = 141
      Height = 36
      BevelOuter = bvNone
      TabOrder = 1
      object cbSTAZS: TCheckBox
        Left = 0
        Top = 20
        Width = 46
        Height = 17
        Caption = #1040#1047#1057
        TabOrder = 0
      end
      object cbSTPart: TCheckBox
        Left = 0
        Top = 0
        Width = 66
        Height = 17
        Caption = #1055#1072#1088#1090#1080#1103
        TabOrder = 1
      end
      object cbSTSubPart: TCheckBox
        Left = 65
        Top = 0
        Width = 76
        Height = 17
        Caption = #1055#1086#1076#1055#1072#1088#1090#1080#1103
        TabOrder = 2
      end
    end
  end
  object pBeginEndDate: TPanel
    Left = 45
    Top = 5
    Width = 261
    Height = 21
    BevelOuter = bvNone
    TabOrder = 7
    object lEndDate: TLabel
      Left = 135
      Top = 5
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object lBeginDate: TLabel
      Left = 5
      Top = 5
      Width = 6
      Height = 13
      Caption = 'c'
    end
    object deBeginDate: TDateEdit
      Left = 20
      Top = 0
      Width = 101
      Height = 21
      DefaultToday = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
      Text = '05.06.2000'
      OnAcceptDate = deBeginDateAcceptDate
    end
    object deEndDate: TDateEdit
      Left = 155
      Top = 0
      Width = 101
      Height = 21
      DefaultToday = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
      Text = '06.06.2000'
      OnAcceptDate = deEndDateAcceptDate
      OnChange = deEndDateChange
    end
  end
  object gbTypeRefuelAuto: TGroupBox
    Left = 195
    Top = 85
    Width = 171
    Height = 116
    Caption = #1058#1080#1087' '#1079#1072#1087#1088#1072#1074#1082#1080' '#1090#1077#1093#1085#1080#1095'. '#1089#1088#1077#1076#1089#1090#1074
    TabOrder = 13
    Visible = False
    object cbRTAVedomost: TCheckBox
      Left = 5
      Top = 15
      Width = 161
      Height = 17
      Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbRTACard: TCheckBox
      Left = 5
      Top = 35
      Width = 161
      Height = 17
      Caption = #1069#1083'. '#1082#1072#1088#1090#1099
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object cbRTATalon: TCheckBox
      Left = 5
      Top = 55
      Width = 161
      Height = 17
      Caption = #1058#1072#1083#1086#1085#1099
      TabOrder = 2
    end
    object cbRTANB: TCheckBox
      Left = 5
      Top = 75
      Width = 161
      Height = 17
      Caption = #1057' '#1085#1077#1092#1090#1077#1073#1072#1079#1099
      TabOrder = 3
    end
    object cbRTANal: TCheckBox
      Left = 5
      Top = 95
      Width = 161
      Height = 17
      Caption = #1047#1072' '#1085#1072#1083#1080#1095#1085#1099#1077
      TabOrder = 4
    end
  end
  object rgRefuelReportType: TRadioGroup
    Left = 5
    Top = 110
    Width = 186
    Height = 91
    Caption = #1054#1090#1095#1077#1090
    ItemIndex = 1
    Items.Strings = (
      #1055#1086#1087#1086#1083#1085#1077#1085#1080#1077' '#1069#1050' ('#1074#1099#1076'. '#1090#1072#1083#1086#1085#1086#1074')'
      #1054#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1077
      #1054#1089#1090#1072#1090#1086#1082' '#1069#1050' '#1080' '#1090#1072#1083#1086#1085#1086#1074
      #1044#1074#1080#1078#1077#1085#1080#1077' '#1053#1055' '#1087#1086' '#1089#1086#1073'. '#1072#1074#1090#1086)
    TabOrder = 4
    Visible = False
    OnClick = rgRefuelReportTypeClick
  end
  object qTalonRest: TOilQuery
    SQL.Strings = (
      '--> qTalonRest,TalonPotrReport'
      
        'select /*+ORDERED USE_MERGE(TalOut) USE_HASH(Org, Oil_NP_Group)*' +
        '/'
      ' Dep_Name,'
      ' Org_Name,'
      ' Org_OKPO,'
      ' NPGrp_Name,'
      ' Out_Date,'
      ' Ser,'
      ' Num,'
      ' Nominal,'
      ' Price,'
      ' count(*) as Quantity,'
      ' sum(Litr) as Litr,'
      ' sum(Amount) as Amount'
      '  from --'#1042#1099#1073#1086#1088#1082#1072' '#1090#1072#1083#1086#1085#1086#1074' '#1082#1086#1090#1086#1088#1099#1077' '#1085#1072#1093#1086#1076#1103#1090#1089#1103' '#1091' '#1082#1083#1080#1077#1085#1090#1086#1074
      
        '       (select /*+ORDERED USE_MERGE(TalOut) USE_HASH(Org, Oil_NP' +
        '_Group)*/'
      '         TalOut.Dep_Name as Dep_Name,'
      '         Org.Name as Org_Name,'
      '         Org.Id_Num as Org_OKPO,'
      '         Oil_NP_Group.Name as NPGrp_Name,'
      
        '         decode(:PrintDate, 0, to_date(null), TalOut.Out_Date) a' +
        's Out_Date,'
      
        '         decode(:PrintNominal, 0, to_number(null), TalOut.Nomina' +
        'l) as Nominal,'
      '         decode(:PrintSer, 0, to_char(null), TalOut.Ser) as Ser,'
      
        '         decode(:PrintNum, 0, to_number(null), TalOut.Num) as Nu' +
        'm,'
      
        '         decode(:PrintPrice, 0, to_number(null), TalOut.Price) a' +
        's Price,'
      '         TalOut.Nominal as Litr,'
      '         TalOut.Price * TalOut.Nominal as Amount'
      '          from (select /*+NO_MERGE*/'
      '                 Ser, Num, max(SamDate) MaxDate'
      
        '                  from -- '#1042#1099#1073#1086#1088#1082#1072' '#1086#1090#1086#1074#1072#1088#1077#1085#1085#1099#1093' '#1080' '#1087#1088#1086#1076#1072#1085#1085#1099#1093' '#1090#1072#1083#1086#1085#1086 +
        #1074
      '                       (select Ser,'
      '                               Num,'
      
        '                               decode(Tip, '#39'P'#39', Date_ + 0.1, Dat' +
        'e_) SamDate'
      '                          from V_Oil_Talon_Op'
      '                         where ((Tip = '#39'P'#39') or'
      
        '                               (Tip = '#39'O'#39' and oper_id in (190, 2' +
        '00, 245)))'
      '                           and Date_ <= :EndDate) TalMax'
      '                 group by Ser, Num'
      
        '                having(max(SamDate) - Trunc(max(SamDate), '#39'DD'#39'))' +
        ' = 0) TalMax,'
      
        '               ( --'#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1090#1072#1083#1086#1085#1086#1074' '#1082#1086#1090#1086#1088#1099#1077' '#1085#1072#1093#1086#1076#1103#1090#1089#1103' '#1091' '#1082 +
        #1083#1080#1077#1085#1090#1086#1074
      '                select o.Org_Id,'
      '                        o.Org_Inst,'
      '                        Dep.Name as Dep_Name,'
      '                        o.Date_ as Out_Date,'
      '                        o.Ser,'
      '                        o.Num,'
      '                        o.Price,'
      '                        o.Nominal,'
      '                        o.NPGrp_Id'
      '                  from (select Id, Inst, Name'
      '                           from v_org'
      '                          where Id = :DepId'
      '                            and Inst = :DepInst'
      '                         union all'
      '                         select Id, Inst, Name'
      '                           from v_org'
      '                          where Par = :DepId'
      '                            and Par_Inst = :DepInst) Dep,'
      '                        V_Oil_Talon_Op o'
      '                 where o.Tip = '#39'O'#39
      '                   and o.Dep_Id = Dep.Id'
      '                   and o.oper_id in (190, 200, 245)'
      '                   and o.Dep_Inst = Dep.Inst) TalOut,'
      '               v_org Org,'
      '               Oil_NP_Group'
      '         where TalOut.Ser = TalMax.Ser'
      '           and TalOut.Num = TalMax.Num'
      '           and TalOut.Out_Date = Trunc(TalMax.MaxDate, '#39'DD'#39')'
      '           and TalOut.Org_Id = Org.Id'
      '           and TalOut.Org_Inst = Org.Inst'
      '           and (TalOut.Org_Id = :OrgId or :OrgId = 0)'
      '           and (TalOut.Org_Inst = :OrgInst or :OrgInst = 0)'
      '           and Oil_NP_Group.Id = TalOut.NPGrp_Id)'
      ' group by Dep_Name,'
      '          Org_Name,'
      '          Org_OKPO,'
      '          NPGrp_Name,'
      '          Out_Date,'
      '          Ser,'
      '          Num,'
      '          Nominal,'
      '          Price'
      ' order by Dep_Name,'
      '          Org_Name,'
      '          Org_OKPO,'
      '          NPGrp_Name,'
      '          Out_Date,'
      '          Ser,'
      '          Num,'
      '          Nominal,'
      '          Price')
    FetchAll = True
    AutoCalcFields = False
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 160
    Top = 215
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'PrintDate'
      end
      item
        DataType = ftBoolean
        Name = 'PrintNominal'
      end
      item
        DataType = ftBoolean
        Name = 'PrintSer'
      end
      item
        DataType = ftBoolean
        Name = 'PrintNum'
      end
      item
        DataType = ftBoolean
        Name = 'PrintPrice'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end>
  end
  object qTalonMove: TOilQuery
    SQL.Strings = (
      '--> qTalonMove,TalonPotrReport'
      '-- '#1048#1090#1086#1075#1086#1074#1072#1103' '#1074#1099#1073#1086#1088#1082#1072
      'select /*+ORDERED USE_HASH(TalSer, Oil_NP_Group)*/'
      ' Dep_Name,'
      ' Org_Name,'
      ' Org_OKPO,'
      ' NP_Name,'
      ' Nominal,'
      ' sum(Begin_Amount) as Begin_Amount,'
      ' sum(Begin_Litr) as Begin_Litr,'
      ' sum(Begin_Money) as Begin_Money,'
      ' sum(Out_Amount) as Out_Amount,'
      ' sum(Out_Litr) as Out_Litr,'
      ' sum(Out_Money) as Out_Money,'
      ' sum(Prih_Amount) as Prih_Amount,'
      ' sum(Prih_Litr) as Prih_Litr,'
      ' sum(Prih_Money) as Prih_Money,'
      ' sum(End_Amount) as End_Amount,'
      ' sum(End_Litr) as End_Litr,'
      ' sum(End_Money) as End_Money'
      '  from ( -- '#1042#1099#1073#1086#1088#1082#1072' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1087#1086' '#1082#1083#1080#1077#1085#1090#1072#1084
      '        select TalMove.Dep_Name as Dep_Name,'
      '                TalMove.Org_Name as Org_Name,'
      '                TalMove.Org_OKPO as Org_OKPO,'
      '                NpGrp.name as NP_Name,'
      '                decode(:PrintNominal,'
      '                       0,'
      '                       to_number(null),'
      '                       decode(substr(TalMove.Ser, 3, 1),'
      '                              '#39'0'#39','
      '                              5,'
      '                              '#39'1'#39','
      '                              10,'
      '                              '#39'2'#39','
      '                              20,'
      '                              '#39'3'#39','
      '                              50,'
      '                              0)) as Nominal,'
      '                TalMove.Ser,'
      '                TalMove.Begin_Amount,'
      '                TalMove.Begin_Litr,'
      '                TalMove.Begin_Money,'
      '                TalMove.Out_Amount,'
      '                TalMove.Out_Litr,'
      '                TalMove.Out_Money,'
      '                decode(substr(TalMove.Ser, 3, 1),'
      '                       '#39'0'#39','
      '                       TalMove.Prih_Litr / 5,'
      '                       '#39'1'#39','
      '                       TalMove.Prih_Litr / 10,'
      '                       '#39'2'#39','
      '                       TalMove.Prih_Litr / 20,'
      '                       '#39'3'#39','
      '                       TalMove.Prih_Litr / 50,'
      '                       0) as Prih_Amount,'
      '                TalMove.Prih_Litr,'
      '                TalMove.Prih_Money,'
      '                TalMove.End_Amount,'
      '                TalMove.End_Litr,'
      '                TalMove.End_Money'
      '          from --'#1042#1099#1073#1086#1088#1082#1072' '#1090#1072#1083#1086#1085#1086#1074' '#1082#1086#1090#1086#1088#1099#1077' '#1085#1072#1093#1086#1076#1103#1090#1089#1103' '#1091' '#1082#1083#1080#1077#1085#1090#1086#1074
      
        '                (select /*+ORDERED USE_MERGE(TalOut) USE_HASH(Or' +
        'g, Oil_NP_Group)*/'
      '                  TalOut.Dep_Name,'
      '                  Org.Name as Org_Name,'
      '                  Org.Id_Num as Org_OKPO,'
      '                  TalOut.NPGrp_Id,'
      '                  TalOut.Ser,'
      '                  1 as Begin_Amount,'
      '                  TalOut.Nominal as Begin_Litr,'
      '                  TalOut.Nominal * TalOut.Price as Begin_Money,'
      '                  to_number(null) as Out_Amount,'
      '                  to_number(null) as Out_Litr,'
      '                  to_number(null) as Out_Money,'
      '                  to_number(null) as Prih_Litr,'
      '                  to_number(null) as Prih_Money,'
      '                  to_number(null) as End_Amount,'
      '                  to_number(null) as End_Litr,'
      '                  to_number(null) as End_Money'
      '                   from (select /*+NO_MERGE*/'
      '                          Ser, Num, max(SamDate) MaxDate'
      
        '                           from ( -- '#1042#1099#1073#1086#1088#1082#1072' '#1086#1090#1086#1074#1072#1088#1077#1085#1085#1099#1093' '#1080' '#1087#1088#1086#1076#1072 +
        #1085#1085#1099#1093' '#1090#1072#1083#1086#1085#1086#1074
      '                                 select Ser,'
      '                                         Num,'
      
        '                                         decode(Tip, '#39'P'#39', Date_ ' +
        '+ 0.1, Date_) SamDate'
      '                                   from V_Oil_Talon_Op'
      '                                  where ((Tip = '#39'P'#39') or'
      
        '                                        (Tip = '#39'O'#39' and oper_id !' +
        '= 192))'
      
        '                                    and Date_ < :BeginDate) TalM' +
        'ax'
      '                          group by Ser, Num'
      
        '                         having(max(SamDate) - trunc(max(SamDate' +
        '))) = 0) TalMax,'
      
        '                        ( --'#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1090#1072#1083#1086#1085#1086#1074' '#1082#1086#1090#1086#1088#1099#1077' '#1085#1072#1093#1086 +
        #1076#1103#1090#1089#1103' '#1091' '#1082#1083#1080#1077#1085#1090#1086#1074
      '                         select o.Org_Id,'
      '                                 o.Org_Inst,'
      '                                 Dep.Name as Dep_Name,'
      '                                 o.Date_ as Out_Date,'
      '                                 o.Ser,'
      '                                 o.Num,'
      '                                 o.Price,'
      '                                 o.Nominal,'
      '                                 o.NPGrp_Id'
      '                           from (select Id, Inst, Name'
      '                                    from v_Org'
      '                                   where Id = :DepId'
      '                                     and Inst = :DepInst'
      '                                  union all'
      '                                  select Id, Inst, Name'
      '                                    from v_Org'
      '                                   where Par = :DepId'
      
        '                                     and Par_Inst = :DepInst) De' +
        'p,'
      '                                 V_Oil_Talon_Op o'
      '                          where Tip = '#39'O'#39
      '                            and o.Dep_Id = Dep.Id'
      '                            and o.Dep_Inst = Dep.Inst'
      '                            and o.oper_id != 192) TalOut,'
      '                        v_org Org'
      '                  where TalOut.Ser = TalMax.Ser'
      '                    and TalOut.Num = TalMax.Num'
      '                    and TalOut.Out_Date = trunc(TalMax.MaxDate)'
      '                    and TalOut.Org_Id = Org.Id'
      '                    and TalOut.Org_Inst = Org.Inst'
      '                    and (TalOut.Org_Id = :OrgId or :OrgId = 0)'
      
        '                    and (TalOut.Org_Inst = :OrgInst or :OrgInst ' +
        '= 0)'
      '                 '
      '                 union all'
      '                 '
      '                 --'#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1086#1076#1072#1085#1085#1099#1093' '#1090#1072#1083#1086#1085#1086#1074
      '                 select'
      '                  Dep.Name,'
      '                  Org.NAME,'
      '                  Org.ID_Num,'
      '                  o.NPGrp_Id,'
      '                  o.Ser,'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  1,'
      '                  o.Nominal,'
      '                  o.Nominal * o.Price,'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null)'
      '                   from (select Id, Inst, Name'
      '                           from v_org'
      '                          where Id = :DepId'
      '                            and Inst = :DepInst'
      '                         union all'
      '                         select Id, Inst, Name'
      '                           from v_org'
      '                          where Par = :DepId'
      '                            and Par_Inst = :DepInst) Dep,'
      '                        V_Oil_Talon_Op o,'
      '                        v_org Org'
      '                  where Tip = '#39'O'#39
      '                    and o.Org_Id = Org.Id'
      '                    and o.Org_Inst = Org.Inst'
      '                    and Org.Org_Type not in (3, 4)'
      '                    and o.Date_ between :BeginDate and :EndDate'
      '                    and o.Dep_Id = Dep.Id'
      '                    and o.Dep_Inst = Dep.Inst'
      '                    and o.Auto_Id is null'
      '                    and (o.Org_Id = :OrgId or :OrgId = 0)'
      '                    and (o.Org_Inst = :OrgInst or :OrgInst = 0)'
      '                    and o.oper_id != 192'
      '                 '
      '                 union all'
      '                 '
      '                 --'#1042#1099#1073#1086#1088#1082#1072' '#1074#1086#1079#1074#1088#1072#1097#1077#1085#1085#1099#1093' '#1090#1072#1083#1086#1085#1086#1074
      '                 select /*+ORDERED USE_MERGE(TalOut)*/'
      '                  TalPrih.Dep_Name,'
      '                  nvl(TalOut.Org_Name,'
      '                      '#39'<'#1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100' '#1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085'>'#39'),'
      '                  TalOut.Id_Num,'
      '                  TalOut.NPGrp_Id,'
      '                  TalOut.Ser,'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  -1,'
      '                  -TalPrih.Nominal,'
      '                  -TalPrih.Nominal * TalOut.Price,'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null)'
      
        '                   from ( --'#1042#1099#1073#1086#1088#1082#1072' '#1074#1086#1079#1074#1088#1072#1097#1077#1085#1085#1099#1093' '#1090#1072#1083#1086#1085#1086#1074' '#1074' '#1087#1088#1080#1093#1086 +
        #1076#1072#1093
      '                         select Dep.Name as Dep_Name,'
      '                                 o.Date_ as Prih_Date,'
      '                                 o.Head_Num as Prih_Num,'
      '                                 o.Ser,'
      '                                 o.Num,'
      
        '                                 Oil_NP_Group.Name as NPGrp_Name' +
        ','
      '                                 o.Nominal'
      '                           from (select Id, Inst, Name'
      '                                    from v_Org'
      '                                   where Id = :DepId'
      '                                     and Inst = :DepInst'
      '                                  union all'
      '                                  select Id, Inst, Name'
      '                                    from v_Org'
      '                                   where Par = :DepId'
      
        '                                     and Par_Inst = :DepInst) De' +
        'p,'
      '                                 V_Oil_Talon_Op o,'
      '                                 v_org Org,'
      '                                 Oil_NP_Group'
      '                          where Tip = '#39'P'#39
      
        '                            and o.Date_ between :BeginDate and :' +
        'EndDate'
      '                            and Org.Org_Type not in (3, 4, 8)'
      '                            and o.Dep_Id = Dep.Id'
      '                            and o.Dep_Inst = Dep.Inst'
      '                            and o.Org_Id = Org.Id'
      '                            and o.Org_Inst = Org.Inst'
      
        '                            and o.NPGrp_Id = Oil_NP_Group.Id) Ta' +
        'lPrih,'
      
        '                        -- '#1042#1099#1073#1086#1088#1082#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1081' '#1086#1090#1087#1091#1089#1082#1072' '#1080' '#1087#1088#1080#1093#1086#1076 +
        #1072' '#1090#1072#1083#1086#1085#1072
      '                        v_Oil_Talon_GetEqual GetEqual,'
      '                        ( -- '#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1090#1072#1083#1086#1085#1086#1074
      '                         select o.Org_Id,'
      '                                 o.Org_Inst,'
      '                                 Oil_Org.Id_Num,'
      '                                 Oil_Org.Name as Org_Name,'
      '                                 o.Date_ as Out_Date,'
      '                                 o.Ser,'
      '                                 o.Num,'
      '                                 o.Price,'
      '                                 o.Auto_Id,'
      '                                 o.NPGrp_Id'
      '                           from V_Oil_Talon_Op o, v_org Oil_Org'
      '                          where Tip = '#39'O'#39
      '                            and o.Org_Id = Oil_Org.Id'
      '                            and o.Org_Inst = Oil_Org.Inst'
      '                            and o.oper_id != 192) TalOut'
      
        '                  where TalPrih.Prih_Date = GetEqual.Prih_Date(+' +
        ')'
      '                    and TalPrih.Ser = GetEqual.Ser(+)'
      '                    and TalPrih.Num = GetEqual.Num(+)'
      '                    and GetEqual.Out_Date = TalOut.Out_Date(+)'
      '                    and GetEqual.Ser = TalOut.Ser(+)'
      '                    and GetEqual.Num = TalOut.Num(+)'
      '                    and (TalOut.Org_Id = :OrgId or :OrgId = 0)'
      
        '                    and (TalOut.Org_Inst = :OrgInst or :OrgInst ' +
        '= 0)'
      '                    and Auto_Id is null'
      '                 '
      '                 union all'
      '                 '
      
        '                 select /*+ORDERED USE_MERGE(TalPrih, TalOut, Ge' +
        'tEqual) */'
      '                  TalOut.Dep_Name,'
      '                  nvl(TalOut.Org_Name,'
      '                      '#39'<'#1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100' '#1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085'>'#39'),'
      '                  TalOut.Org_OKPO,'
      '                  TalOut.NPGrp_Id,'
      '                  TalPrih.Ser,'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  TalPrih.Litr,'
      '                  TalPrih.Litr * TalOut.Price,'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null)'
      
        '                   from (select /*+ORDERED NO_MERGE USE_HASH(Dai' +
        'lyRep, DRData, SRTal)*/'
      '                          SRTal.Ser,'
      '                          SRTal.Num,'
      '                          SRTal.Litr,'
      '                          trunc(DailyRep.Rep_Date) as Prih_Date'
      '                           from (select Id, Inst'
      '                                   from v_org'
      '                                  where Id = :DepId'
      '                                    and Inst = :DepInst'
      '                                 union all'
      '                                 select Id, Inst'
      '                                   from v_org'
      '                                  where Par = :DepId'
      
        '                                    and Par_Inst = :DepInst) Dep' +
        ','
      '                                Oil_Daily_Rep DailyRep,'
      '                                Oil_DR_Data DRData,'
      '                                OIL_SRTalon SRTal'
      '                          where DRData.State = '#39'Y'#39
      '                            and SRTal.State = '#39'Y'#39
      '                            and DailyRep.Id = DRData.REP_ID'
      '                            and DailyRep.Inst = DRData.REP_Inst'
      '                            and DRData.ID = SRTal.SRep_Id'
      '                            and DRData.INST = SRTal.SRep_Inst'
      
        '                            and trunc(DailyRep.Rep_Date) >= :Beg' +
        'inDate'
      
        '                            and trunc(DailyRep.Rep_Date) <= :End' +
        'Date'
      '                            and DailyRep.Inst = Dep.Id'
      
        '                            and DailyRep.Inst = Dep.Inst) TalPri' +
        'h,'
      '                        v_Oil_Talon_GetEqual GetEqual,'
      '                        (select'
      '                          o.Auto_Id,'
      '                          o.Date_ as Out_Date,'
      '                          o.Ser,'
      '                          o.Num,'
      '                          o.Price,'
      '                          Org.Id as Org_Id,'
      '                          Org.Inst as Org_Inst,'
      '                          Org.Name as Org_Name,'
      '                          Org.Id_Num as Org_OKPO,'
      '                          Dep.Name as Dep_Name,'
      '                          o.NPGrp_Id'
      
        '                           from V_Oil_Talon_Op o, v_org Org, v_o' +
        'rg Dep'
      '                          where o.Tip = '#39'O'#39
      '                            and o.Org_Id = Org.Id'
      '                            and o.Org_Inst = Org.Inst'
      '                            and o.Dep_Id = Dep.Id'
      '                            and o.Dep_Inst = Dep.Inst'
      '                            and o.oper_id != 192) TalOut'
      
        '                  where TalPrih.Prih_Date = GetEqual.Prih_Date(+' +
        ')'
      '                    and TalPrih.Ser = GetEqual.Ser(+)'
      '                    and TalPrih.Num = GetEqual.Num(+)'
      '                    and TalOut.Out_Date(+) = GetEqual.Out_Date'
      '                    and TalOut.Ser(+) = GetEqual.Ser'
      '                    and TalOut.Num(+) = GetEqual.Num'
      '                    and TalOut.Auto_Id is null'
      '                    and (TalOut.Org_Id = :OrgId or :OrgId = 0)'
      
        '                    and (TalOut.Org_Inst = :OrgInst or :OrgInst ' +
        '= 0)'
      '                 '
      '                 union all'
      '                 '
      
        '                 select /*+ORDERED USE_MERGE(TalOut) USE_HASH(Or' +
        'g, Oil_NP_Group)*/'
      '                  TalOut.Dep_Name,'
      '                  Org.Name,'
      '                  Org.Id_Num,'
      '                  TalOut.NPGrp_Id,'
      '                  TalOut.Ser,'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  to_number(null),'
      '                  1,'
      '                  TalOut.Nominal,'
      '                  TalOut.Nominal * TalOut.Price'
      
        '                   from ( -- '#1042#1099#1073#1086#1088#1082#1072' '#1090#1072#1083#1086#1085#1086#1074' '#1082#1086#1090#1086#1088#1099#1077' '#1085#1072#1093#1086#1076#1103#1090#1089#1103' '#1091 +
        ' '#1082#1083#1080#1077#1085#1090#1086#1074
      '                         select /*+NO_MERGE*/'
      '                          Ser, Num, max(SamDate) MaxDate'
      
        '                           from ( -- '#1042#1099#1073#1086#1088#1082#1072' '#1086#1090#1086#1074#1072#1088#1077#1085#1085#1099#1093' '#1080' '#1087#1088#1086#1076#1072 +
        #1085#1085#1099#1093' '#1090#1072#1083#1086#1085#1086#1074
      '                                  select Ser,'
      '                                          Num,'
      
        '                                          decode(Tip, '#39'P'#39', Date_' +
        ' + 0.1, Date_) SamDate'
      '                                    from V_Oil_Talon_Op'
      '                                   where ((Tip = '#39'P'#39') or'
      
        '                                         (Tip = '#39'O'#39' and oper_id ' +
        '!= 192))'
      
        '                                     and Date_ <= :EndDate) TalM' +
        'ax'
      '                          group by Ser, Num'
      
        '                         having(max(SamDate) - Trunc(max(SamDate' +
        '), '#39'DD'#39')) = 0) TalMax,'
      
        '                        ( --'#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1090#1072#1083#1086#1085#1086#1074' '#1082#1086#1090#1086#1088#1099#1077' '#1085#1072#1093#1086 +
        #1076#1103#1090#1089#1103' '#1091' '#1082#1083#1080#1077#1085#1090#1086#1074
      '                         select o.Org_Id,'
      '                                 o.Org_Inst,'
      '                                 Dep.Name as Dep_Name,'
      '                                 o.Date_ as Out_Date,'
      '                                 o.Ser,'
      '                                 o.Num,'
      '                                 o.Price,'
      '                                 o.Nominal,'
      '                                 o.NPGrp_Id'
      '                           from (select Id, Inst, Name'
      '                                    from v_Org'
      '                                   where Id = :DepId'
      '                                     and Inst = :DepInst'
      '                                  union all'
      '                                  select Id, Inst, Name'
      '                                    from v_Org'
      '                                   where Par = :DepId'
      
        '                                     and Par_Inst = :DepInst) De' +
        'p,'
      '                                 V_Oil_Talon_Op o'
      '                          where o.Tip = '#39'O'#39
      '                            and o.Dep_Id = Dep.Id'
      '                            and o.Dep_Inst = Dep.Inst'
      '                            and o.oper_id != 192) TalOut,'
      '                        v_org Org'
      '                  where TalOut.Ser = TalMax.Ser'
      '                    and TalOut.Num = TalMax.Num'
      '                    and TalOut.Out_Date = trunc(TalMax.MaxDate)'
      '                    and TalOut.Org_Id = Org.Id'
      '                    and TalOut.Org_Inst = Org.Inst'
      '                    and (TalOut.Org_Id = :OrgId or :OrgId = 0)'
      
        '                    and (TalOut.Org_Inst = :OrgInst or :OrgInst ' +
        '= 0)) TalMove,'
      '                v_oil_np_group NpGrp'
      '         where NpGrp.id = TalMove.NPGrp_Id)'
      ' group by Dep_Name, Org_Name, Org_OKPO, NP_Name, Nominal')
    FetchAll = True
    AutoCalcFields = False
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 225
    Top = 215
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'PrintNominal'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
  end
  object qTalonOut: TOilQuery
    SQL.Strings = (
      'select Dep_Name,'
      '       Org_Name,'
      '       Org_OKPO,'
      '       NPGrp_Name,'
      '       oper.id as Oper_id,'
      '       oper.name as Oper_name,'
      '       Out_Date,'
      '       Nominal,'
      '       Ser,'
      '       Num,'
      '       Price,'
      '       sum(Quantity) as Quantity,'
      '       sum(Litr) as Litr,'
      '       sum(Amount) as Amount'
      '  from v_oil_oper_type oper,'
      '       ( --'#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1086#1076#1072#1085#1085#1099#1093' '#1090#1072#1083#1086#1085#1086#1074
      '        select Dep.Name as Dep_Name,'
      '                Org.Name as Org_Name,'
      '                Org.Id_Num as Org_OKPO,'
      '                Oil_NP_Group.Name as NPGrp_Name,'
      '                o.oper_id,'
      
        '                decode(:PrintDate, 0, to_date(null), o.Date_) as' +
        ' Out_Date,'
      
        '                decode(:PrintNominal, 0, to_number(null), o.Nomi' +
        'nal) as Nominal,'
      
        '                decode(:PrintSer, 0, to_char(null), o.Ser) as Se' +
        'r,'
      
        '                decode(:PrintNum, 0, to_number(null), o.Num) as ' +
        'Num,'
      
        '                decode(:PrintPrice, 0, to_number(null), o.Price)' +
        ' as Price,'
      '                1 as Quantity,'
      '                o.Nominal as Litr,'
      '                o.Nominal * o.Price as Amount'
      '          from (select Id, Inst, Name'
      '                   from v_org'
      '                  where Id = :DepId'
      '                    and Inst = :DepInst'
      '                 union all'
      '                 select Id, Inst, Name'
      '                   from v_org'
      '                  where Par = :DepId'
      '                    and Par_Inst = :DepInst) Dep,'
      '                V_Oil_Talon_Op o,'
      '                v_org Org,'
      '                Oil_NP_Group'
      '         where Tip = '#39'O'#39
      '           and o.Org_Id = Org.Id'
      '           and o.Org_Inst = Org.Inst'
      '           and Org.Org_Type not in (3, 4, 5)'
      '           and o.NPGrp_Id = Oil_NP_Group.Id'
      '           and o.Date_ between :BeginDate and :EndDate'
      '           and o.Dep_Id = Dep.Id'
      '           and o.Dep_Inst = Dep.Inst'
      '           and :OrgId in (o.Org_Id, 0)'
      '           and :OrgInst in (o.Org_Inst, 0)'
      '           and o.Auto_Id is null'
      '        '
      '        union all'
      '        '
      '        --'#1042#1099#1073#1086#1088#1082#1072' '#1074#1086#1079#1074#1088#1072#1097#1077#1085#1085#1099#1093' '#1090#1072#1083#1086#1085#1086#1074
      '        select /*+ORDERED USE_MERGE(TalPrih, GetEqual, TalOut)*/'
      
        '         decode(:PrintClient, 0, to_char(null), TalPrih.Dep_Name' +
        '),'
      '         decode(:PrintClient,'
      '                0,'
      '                to_char(null),'
      '                nvl(TalOut.Org_Name,'
      '                    '#39'<'#1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100' '#1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085'>'#39')),'
      '         decode(:PrintClient, 0, to_char(null), TalOut.Id_Num),'
      '         TalPrih.NPGrp_Name,'
      '         TalPrih.oper_id,'
      
        '         decode(:PrintDate, 0, to_date(null), TalPrih.Prih_Date)' +
        ','
      
        '         decode(:PrintNominal, 0, to_number(null), TalPrih.Nomin' +
        'al),'
      '         decode(:PrintSer, 0, to_char(null), TalPrih.Ser),'
      '         decode(:PrintNum, 0, to_number(null), TalPrih.Num),'
      '         decode(:PrintPrice, 0, to_number(null), TalOut.Price),'
      '         -1,'
      '         -TalPrih.Nominal,'
      '         -TalPrih.Nominal * TalOut.Price'
      '          from ( --'#1042#1099#1073#1086#1088#1082#1072' '#1074#1086#1079#1074#1088#1072#1097#1077#1085#1085#1099#1093' '#1090#1072#1083#1086#1085#1086#1074' '#1074' '#1087#1088#1080#1093#1086#1076#1072#1093
      '                select Dep.Name as Dep_Name,'
      '                        o.Date_ as Prih_Date,'
      '                        o.Head_Num as Prih_Num,'
      '                        o.oper_id,'
      '                        o.Ser,'
      '                        o.Num,'
      '                        Oil_NP_Group.Name as NPGrp_Name,'
      '                        o.Nominal'
      '                  from (select Id, Inst, Name'
      '                           from v_org'
      '                          where Id = :DepId'
      '                            and Inst = :DepInst'
      '                         union all'
      '                         select Id, Inst, Name'
      '                           from v_org'
      '                          where Par = :DepId'
      '                            and Par_Inst = :DepInst) Dep,'
      '                        V_Oil_Talon_Op o,'
      '                        v_org Org,'
      '                        Oil_NP_Group'
      '                 where Tip = '#39'P'#39
      '                   and o.Date_ between :BeginDate and :EndDate'
      '                   and Org.Org_Type not in (3, 4, 5, 8)'
      '                   and o.Dep_Id = Dep.Id'
      '                   and o.Dep_Inst = Dep.Inst'
      '                   and o.Org_Id = Org.Id'
      '                   and o.Org_Inst = Org.Inst'
      '                   and o.NPGrp_Id = Oil_NP_Group.Id) TalPrih,'
      '               --'#1042#1099#1073#1086#1088#1082#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1081' '#1086#1090#1087#1091#1089#1082#1072' '#1080' '#1087#1088#1080#1093#1086#1076#1072' '#1090#1072#1083#1086#1085#1072
      '               v_Oil_Talon_GetEqual GetEqual,'
      '               ( --'#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1090#1072#1083#1086#1085#1086#1074
      '                select o.Org_Id,'
      '                        o.Org_Inst,'
      '                        Oil_Org.Id_Num,'
      '                        Oil_Org.Name as Org_Name,'
      
        '                        o.Date_ as Out_Date,                    ' +
        '    '
      '                        o.Ser,                        '
      '                        o.Num,'
      '                        o.Price,'
      '                        o.Auto_Id'
      '                  from V_Oil_Talon_Op o, v_org Oil_Org'
      '                 where Tip = '#39'O'#39
      '                   and o.Org_Id = Oil_Org.Id'
      '                   and o.Org_Inst = Oil_Org.Inst) TalOut'
      '         where TalPrih.Prih_Date = GetEqual.Prih_Date(+)'
      '           and TalPrih.Ser = GetEqual.Ser(+)'
      '           and TalPrih.Num = GetEqual.Num(+)'
      '           and GetEqual.Out_Date = TalOut.Out_Date(+)'
      '           and GetEqual.Ser = TalOut.Ser(+)'
      '           and GetEqual.Num = TalOut.Num(+)'
      '           and :OrgId in (TalOut.Org_Id, 0)'
      '           and :OrgInst in (TalOut.Org_Inst, 0)'
      '           and Auto_Id is null) Tal'
      ' where oper.id = Tal.oper_id'
      ' group by Dep_Name,'
      '          Org_Name,'
      '          Org_OKPO,'
      '          NPGrp_Name,'
      '          oper.id,'
      '          oper.name,'
      '          Out_Date,'
      '          Nominal,'
      '          Ser,'
      '          Num,'
      '          Price'
      ' order by Dep_Name,'
      '          Org_Name,'
      '          Org_OKPO,'
      '          NPGrp_Name,'
      '          Oper_id,'
      '          Oper_name,'
      '          Out_Date,'
      '          Nominal,'
      '          Ser,'
      '          Num,'
      '          Price')
    FetchAll = True
    AutoCalcFields = False
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 35
    Top = 215
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'PrintDate'
      end
      item
        DataType = ftBoolean
        Name = 'PrintNominal'
      end
      item
        DataType = ftBoolean
        Name = 'PrintSer'
      end
      item
        DataType = ftBoolean
        Name = 'PrintNum'
      end
      item
        DataType = ftBoolean
        Name = 'PrintPrice'
      end
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftBoolean
        Name = 'PrintClient'
      end>
  end
  object qTalonPrih: TOilQuery
    SQL.Strings = (
      '--> qTalonPrih,TalonPotrReport'
      'select /*+ORDERED USE_HASH(sropl,oazs,ofrom,oto,grp)*/'
      '       ofrom.name dep_name,'
      '       oto.name org_name,'
      '       oto.id_num org_okpo,'
      '       grp.name npgrp_name,'
      '       decode(:PrintPart, 0, to_char(null), sropl.part) as Part,'
      
        '       decode(:PrintSubPart, 0, to_char(null), sropl.sub_part) a' +
        's Sub_Part,'
      
        '       decode(:PrintAZS, 0, to_char(null), oazs.name) as AZS_Nam' +
        'e,'
      
        '       decode(:PrintAZS, 0, to_char(null), sropl.smena_num) as S' +
        'mena_Num,'
      
        '       decode(:PrintDate, 0, to_date(null), sropl.out_date) as O' +
        'ut_Date,'
      
        '       decode(:PrintDate, 0, to_date(null), sropl.prih_date) as ' +
        'Prih_Date,'
      
        '       decode(:PrintNominal, 0, to_number(null), sropl.nominal) ' +
        'as Nominal,'
      '       decode(:PrintSer, 0, '#39#39', sropl.ser) as Ser,'
      '       decode(:PrintNum, 0, '#39#39', sropl.num) as Num,'
      
        '       decode(:PrintPrice, 0, to_number(null), sropl.price) as P' +
        'rice,'
      '       max(sropl.quantity) quantity,'
      '       max(sropl.litr) litr,'
      '       max(sropl.count_t) count_t,'
      '       max(sropl.amount) amount'
      '  from (select from_id azs_id,'
      '               from_inst azs_inst, --azs_name'
      '               prev_from_id from_id,'
      '               prev_from_inst from_inst, -- dep_name,'
      '               to_id as prih_dep_id,'
      '               to_inst as prih_dep_inst,'
      '               npgrp_id, --npgrp_name'
      '               dog part, --part'
      '               to_char(sub_part) sub_part, -- sub_part'
      '               prev_to_id to_id,'
      '               prev_to_inst to_inst, -- org_name,org_okpo'
      '               to_char(smena_num) smena_num, --smena-num'
      '               prev_date out_date, --out_date'
      '               date_ prih_date, --prih_date'
      '               nominal, --nominal'
      '               ser, --ser'
      '               to_char(num) num, --num'
      '               prev_price_korr price, --price'
      
        '               litr_azs / nominal quantity, --litr/nominal quant' +
        'ity'
      '               litr_azs litr, --litr'
      '               tonn_azs count_t, --count_t'
      '               (prev_price_korr * litr_azs) amount --Price Litr'
      '          from v_oil_talon_sropl'
      '         where date_ between :BeginDATE and :EndDATE'
      '           and prev_date is not null'
      '           and nominal is not null /*and litr_azs is not null*/'
      '           and tip = '#39'P'#39
      '           and oper_id = 180) sropl,'
      '       oil_org oazs,'
      '       oil_org ofrom,'
      '       oil_org oto,'
      '       oil_org odep,'
      '       oil_np_group grp'
      ' where oazs.id = sropl.azs_id'
      '   and oazs.inst = sropl.azs_inst'
      '   and ofrom.id = sropl.from_id'
      '   and ofrom.inst = sropl.from_inst'
      '   and odep.id = sropl.prih_dep_id'
      '   and odep.inst = sropl.prih_dep_inst'
      '   and grp.id = sropl.npgrp_id'
      '   and sropl.to_id = oto.id'
      '   and sropl.to_inst = oto.inst'
      '   and ofrom.id = ofrom.inst'
      '   and :DepId = :DepInst'
      '   and :DepId in (odep.id, odep.par)'
      '   and (oto.Id = :OrgId or :OrgId = 0)'
      '   and (oto.Inst = :OrgInst or :OrgInst = 0)'
      ' group by ofrom.name,'
      '          oto.name,'
      '          oto.id_num,'
      '          grp.name,'
      '          sropl.part,'
      '          sropl.sub_part,'
      '          oazs.name,'
      '          sropl.smena_num,'
      '          sropl.out_date,'
      '          sropl.prih_date,'
      '          sropl.nominal,'
      '          sropl.ser,'
      '          sropl.num,'
      '          sropl.price')
    FetchAll = True
    AutoCalcFields = False
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 95
    Top = 215
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'PrintPart'
      end
      item
        DataType = ftBoolean
        Name = 'PrintSubPart'
      end
      item
        DataType = ftBoolean
        Name = 'PrintAZS'
      end
      item
        DataType = ftBoolean
        Name = 'PrintDate'
      end
      item
        DataType = ftBoolean
        Name = 'PrintNominal'
      end
      item
        DataType = ftBoolean
        Name = 'PrintSer'
      end
      item
        DataType = ftBoolean
        Name = 'PrintNum'
      end
      item
        DataType = ftBoolean
        Name = 'PrintPrice'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end>
  end
  object qAutoPrih: TOilQuery
    SQL.Strings = (
      '--> qAutoPrih,TalonPotrReport'
      '-- '#1048#1090#1086#1075#1086#1074#1072#1103' '#1074#1099#1073#1086#1088#1082#1072' '#1086#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1103' '#1090#1077#1093#1085#1080#1095#1077#1089#1082#1080#1093' '#1089#1088#1077#1076#1089#1090#1074
      ' select Employ_Name,'
      '        Auto_Number,'
      '        Auto_Type_Name,'
      '        Auto_Group_Name,'
      '        NP_Name,'
      '        Refuel_Type_Name,'
      '        Part,'
      '        Sub_Part,'
      '        Filial_Name,'
      '        AZS_Name,'
      '        Rep_Date,'
      '        Smena_Num,'
      '        Exp_Date,'
      '        Card_Number,'
      '        Rec_Date,'
      '        SS,'
      '        Term_Price,'
      '        sum(Litr) as Litr,'
      '        sum(Weight) as Weight,'
      '        sum(SS_Amount) as SS_Amount,'
      '        sum(Term_Amount) as Term_Amount'
      '   from (-- '#1042#1099#1073#1086#1088#1082#1072' '#1086#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1103' '#1087#1086' '#1069#1050' '#1085#1072' '#1085#1072#1096#1080#1093' '#1040#1047#1057
      '         select /*+ORDERED*/'
      
        '                Refuel.F_Name || '#39' '#39' || DECODE(SUBSTR(Refuel.I_N' +
        'ame, 1, 1), '#39' '#39', '#39#39', '#39#39', '#39#39', SUBSTR(Refuel.I_Name, 1, 1) || '#39'.'#39')' +
        ' || DECODE(SUBSTR(Refuel.O_Name, 1, 1), '#39' '#39', '#39#39', '#39'_'#39', '#39#39', SUBSTR' +
        '(Refuel.O_Name, 1, 1) || '#39'.'#39') as Employ_Name,'
      '                Refuel.Auto_Number,'
      '                Refuel.Auto_Type_Name,'
      '                Refuel.Auto_Group_Name,'
      '                Refuel.NP_Name,'
      '                Refuel.Refuel_Type_Name,'
      
        '                decode(:PrintPart, 0, to_char(null), Refuel.Part' +
        ') as Part,'
      
        '                decode(:PrintSubPart, 0, to_number(null), Refuel' +
        '.Sub_Part) as Sub_Part,'
      
        '                decode(:PrintAZS, 0, to_char(null), Refuel.Filia' +
        'l_Name) as Filial_Name,'
      
        '                decode(:PrintAZS, 0, to_char(null), Refuel.AZS_N' +
        'ame) as AZS_Name,'
      
        '                decode(:PrintDate, 0, to_date(null), trunc(Refue' +
        'l.Rep_Date)) as Rep_Date,'
      
        '                decode(:PrintAZS, 0, to_number(null), Refuel.Sme' +
        'na_Num) as Smena_Num,'
      
        '                decode(:PrintDate, 0, to_date(null), trunc(Refue' +
        'l.Exp_Date)) as Exp_Date,'
      
        '                decode(:PrintCardNumber, 0, to_number(null), Ref' +
        'uel.Card_Number) as Card_Number,'
      
        '                decode(:PrintDate, 0, to_date(null), trunc(Refue' +
        'l.Rec_Date)) as Rec_Date,'
      
        '                decode(:PrintPrice, 0, to_number(null), Refuel.S' +
        'S) as SS,'
      
        '                decode(:PrintPrice, 0, to_number(null), Refuel.T' +
        'erm_Price) as Term_Price,'
      '                Refuel.Litr,'
      '                Refuel.Weight,'
      '                Refuel.SS_Amount,'
      '                Refuel.Term_Amount'
      '           from v_Oil_Own_Refuel Refuel,'
      
        '                (select Id, Inst from v_org where Id = :DepId an' +
        'd  Inst = :DepInst and id=inst and org_type in (3,4)'
      ' union all'
      
        'select par, Par_Inst from v_org where Id = :DepId and Inst = :De' +
        'pInst  and id=inst and org_type in (3,4)'
      ' union all'
      
        'select Id, Inst from v_org where Par = :DepId and Par_Inst = :De' +
        'pInst  and id=inst and org_type in (3,4)) Dep'
      '          where trunc(Refuel.Rep_Date) >= :BeginDate'
      '            and trunc(Refuel.Rep_Date) <= :EndDate'
      '            and (Refuel.Employ_Id = :EmpId or :EmpId = 0)'
      '            and (Refuel.Employ_Inst = :EmpInst or :EmpInst = 0)'
      '            and (Refuel.Auto_Id = :AutoId or :AutoId = 0)'
      '            and (Refuel.Auto_Inst = :AutoInst or :AutoInst = 0)'
      
        '            and ((:SelectVedomost <> 0 and Refuel.Refuel_Type = ' +
        '1)'
      
        '              or (:SelectCard <> 0 and Refuel.Refuel_Type in (2,' +
        ' 3))'
      '              or (:SelectTalon <> 0 and Refuel.Refuel_Type = 4)'
      '              or (:SelectNB <> 0 and Refuel.Refuel_Type = 5)'
      '              or (:SelectNal <> 0 and Refuel.Refuel_Type = 6))'
      
        '            and (Refuel.CardAlign <> 1 or Refuel.CardAlign is nu' +
        'll)'
      '            and Refuel.Auto_Inst = Dep.Id'
      '            and Refuel.Auto_Inst = Dep.Inst)'
      
        '  group by Employ_Name, Auto_Number, Auto_Type_Name, Auto_Group_' +
        'Name, NP_Name, Refuel_Type_Name, Part, Sub_Part,'
      
        '           Filial_Name, AZS_Name, Rep_Date, Smena_Num, Exp_Date,' +
        ' Card_Number, Rec_Date, SS, Term_Price'
      
        '  order by Employ_Name, Auto_Number, Auto_Type_Name, Auto_Group_' +
        'Name, NP_Name, Refuel_Type_Name, Part, Sub_Part,'
      
        '           Filial_Name, AZS_Name, Rep_Date desc, Smena_Num, Exp_' +
        'Date desc, Card_Number, Rec_Date desc, SS, Term_Price')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 95
    Top = 260
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'PrintPart'
      end
      item
        DataType = ftBoolean
        Name = 'PrintSubPart'
      end
      item
        DataType = ftBoolean
        Name = 'PrintAZS'
      end
      item
        DataType = ftBoolean
        Name = 'PrintDate'
      end
      item
        DataType = ftBoolean
        Name = 'PrintCardNumber'
      end
      item
        DataType = ftBoolean
        Name = 'PrintPrice'
      end
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end
      item
        DataType = ftInteger
        Name = 'EmpId'
      end
      item
        DataType = ftInteger
        Name = 'EmpInst'
      end
      item
        DataType = ftInteger
        Name = 'AutoId'
      end
      item
        DataType = ftInteger
        Name = 'AutoInst'
      end
      item
        DataType = ftBoolean
        Name = 'SelectVedomost'
      end
      item
        DataType = ftBoolean
        Name = 'SelectCard'
      end
      item
        DataType = ftBoolean
        Name = 'SelectTalon'
      end
      item
        DataType = ftBoolean
        Name = 'SelectNB'
      end
      item
        DataType = ftBoolean
        Name = 'SelectNal'
      end>
  end
  object qCardOut: TOilQuery
    SQL.Strings = (
      '--> qCardOut,TalonPotrReport'
      '-- '#1048#1090#1086#1075#1086#1074#1072#1103' '#1074#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1069#1050
      ' select Emitent_Name,'
      '        Client_Name,'
      '        Client_OKPO,'
      '        NP_Name,'
      '        Card_Number,'
      '        Rec_Date,'
      '        Price,'
      '        sum(Litr) as Litr,'
      '        sum(Weight) as Weight,'
      '        sum(Amount) as Amount'
      '   from (-- '#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1069#1050
      
        '         select /*+ORDERED NO_MERGE USE_HASH(Card_Receipt, Clien' +
        't, Oil_NP_Group, Emitent, Dep)*/'
      '                Emitent.Name as Emitent_Name,'
      '                Client.Name as Client_Name,'
      '                Client.Id_Num as Client_OKPO,'
      '                Oil_NP_Group.Name as NP_Name,'
      
        '                decode(:PrintCardNumber, 0, to_number(null), Car' +
        'd_Receipt.Card_Number) as Card_Number,'
      
        '                decode(:PrintDate, 0, to_date(null), Card_Receip' +
        't.Date_) as Rec_Date,'
      
        '                decode(:PrintPrice, 0, to_number(null), Card_Rec' +
        'eipt.Price) as Price,'
      '                Card_Receipt.Litr,'
      
        '                round(Card_Receipt.Litr * Card_Receipt.Price, 2)' +
        ' as Amount,'
      
        '                round(Card_Receipt.Litr * last_dest.density/1000' +
        ',6) as Weight'
      
        '           from v_Card_Receipts Card_Receipt, v_org Client, Oil_' +
        'NP_Group, v_org Emitent,'
      '                (select Id, Inst from v_org '
      
        '                  where (Id = :DepId and Inst = :DepInst) or (Pa' +
        'r = :DepId and Par_Inst = :DepInst)'
      '                 ) Dep,'
      '                (select npgroup_id, '
      
        '                        to_number(substr(max(to_char(date_,'#39'YYYY' +
        'MMDDHH24MI'#39')||density),13)) as density'
      '                   from oil_grp_density g2'
      '                  where state = '#39'Y'#39
      '                  group by npgroup_id) last_dest'
      '          where Date_ between :BeginDate and :EndDate'
      '            and Card_Receipt.CardAlign = 0'
      '            and (Card_Receipt.To_Id = :OrgId or :OrgId = 0)'
      
        '            and (Card_Receipt.To_Inst = :OrgInst or :OrgInst = 0' +
        ')'
      
        '            and Card.GetDep(Card_Receipt.Card_Number,  Card_Rece' +
        'ipt.oper_date) = Emitent.Id (+) and Emitent.ID(+)=Emitent.Inst(+' +
        ')'
      
        '            and Card.GetDep(Card_Receipt.Card_Number,  Card_Rece' +
        'ipt.oper_date) = Emitent.Inst (+)'
      '            and Card_Receipt.To_Id = Client.Id'
      '            and Card_Receipt.To_Inst = Client.Inst'
      '            and Card_Receipt.NP_Type = Oil_NP_Group.Petrol_Id'
      '            and Card_Receipt.Auto_Id is null'
      '            and Emitent.Id = Dep.Id'
      '            and Emitent.Inst = Dep.Inst'
      '            and last_dest.npgroup_id(+) = Oil_NP_Group.id)'
      
        '  group by Emitent_Name, Client_Name, Client_OKPO, NP_Name, Card' +
        '_Number, Rec_Date, Price'
      
        '  order by Emitent_Name, Client_Name, Client_OKPO, NP_Name, Card' +
        '_Number, Rec_Date, Price')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 35
    Top = 305
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'PrintCardNumber'
      end
      item
        DataType = ftBoolean
        Name = 'PrintDate'
      end
      item
        DataType = ftBoolean
        Name = 'PrintPrice'
      end
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end>
  end
  object qCardRest: TOilQuery
    SQL.Strings = (
      '--> qCardRest,TalonPotrReport'
      '-- '#1048#1090#1086#1075#1086#1074#1072#1103' '#1074#1099#1073#1086#1088#1082#1072' '#1086#1089#1090#1072#1090#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1085#1072' '#1069#1050
      'select To_Id,'
      '       To_Inst,'
      '       Emitent_Name,'
      '       Client_Name,'
      '       Client_OKPO,'
      '       NP_Name,'
      '       Card_Number,'
      '       Rec_Date,'
      '       Price,'
      '       sum(Litr) as Litr,'
      '       sum(Amount) as Amount'
      '  from ( -- '#1042#1099#1073#1086#1088#1082#1072' '#1086#1089#1090#1072#1090#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1085#1072' '#1069#1050
      
        '        select /*+ORDERED NO_MERGE USE_HASH(Card_Receipt, Client' +
        ', Oil_NP_Group, Emitent, Dep)*/'
      '         To_Id,'
      '          To_Inst,'
      '          Emitent.Name as Emitent_Name,'
      '          Client.Name as Client_Name,'
      '          Client.Id_Num as Client_OKPO,'
      '          Oil_NP_Group.Name as NP_Name,'
      '          decode(:PrintCardNumber,'
      '                 0,'
      '                 to_number(null),'
      '                 Card_Receipt.Card_Number) as Card_Number,'
      
        '          decode(:PrintDate, 0, to_date(null), trunc(Card_Receip' +
        't.Oper_Date)) as Rec_Date,'
      
        '          decode(:PrintPrice, 0, to_number(null), Card_Receipt.P' +
        'rice) as Price,'
      '          Card_Receipt.Litr,'
      '          Card_Receipt.Amount'
      '          from ( -- '#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1085#1072' '#1069#1050
      '                 select To_Id,'
      '                         To_Inst,'
      '                         NP_Type,'
      '                         Card_Number,'
      '                         Oper_Date,'
      '                         Price,'
      '                         Litr,'
      '                         round(Price * Litr, 2) as Amount'
      '                   from v_Card_Receipts'
      '                  where trunc(Oper_Date) <= :CurDate'
      '                    and Auto_Id is null'
      '                    and CardAlign = 0'
      '                 '
      '                 union all'
      '                 '
      '                 -- '#1042#1099#1073#1086#1088#1082#1072' '#1089#1087#1080#1089#1072#1085#1080#1081' '#1087#1086' '#1069#1050
      
        '                 select /*+ORDERED USE_HASH(Daily_Rep, v_Card_Eq' +
        'ual)*/'
      '                  To_Id,'
      '                  To_Inst,'
      '                  NP_Type,'
      '                  Card_Number,'
      '                  R_Oper_Date,'
      '                  Price,'
      '                  -Litr,'
      '                  -Amount'
      
        '                   from (select /*VERSION=105.2*/ /*+ORDERED USE' +
        '_HASH(Daily_Rep, v_Card_Equal)*/'
      
        '                          nvl(Daily_Rep.AZS_Id, v_Card_Equal.AZS' +
        '_Id) as AZS_Id,'
      
        '                          nvl(Daily_Rep.AZS_Inst, v_Card_Equal.A' +
        'ZS_Inst) as AZS_Inst,'
      
        '                          nvl(Daily_Rep.Rep_Date, v_Card_Equal.D' +
        'ate_) as Rep_Date,'
      '                          v_Card_Equal.Auto_Id,'
      '                          v_Card_Equal.Auto_Inst,'
      '                          v_Card_Equal.Employ_Id,'
      '                          v_Card_Equal.Employ_Inst,'
      '                          v_Card_Equal.To_Id,'
      '                          v_Card_Equal.To_Inst,'
      '                          v_Card_Equal.Card_Number,'
      '                          v_Card_Equal.Doc_Number,'
      '                          v_Card_Equal.Doc_Date,'
      '                          v_Card_Equal.R_Doc_Number,'
      '                          v_Card_Equal.R_Oper_Date,'
      '                          /*v_Card_Equal.Emitent_AZS,*/'
      '                          v_Card_Equal.NP_Type,'
      '                          v_Card_Equal.Term_Price,'
      '                          v_Card_Equal.Price,'
      '                          v_Card_Equal.Litr,'
      '                          v_Card_Equal.Amount,'
      '                          v_Card_Equal.CardAlign,'
      '                          v_Card_Equal.tr_type,'
      '                          v_Card_Equal.Date_'
      
        '                           from v_Card_Equal, v_Oil_Daily_Rep Da' +
        'ily_Rep'
      
        '                          where Daily_Rep.AZS_Id(+) = v_Card_Equ' +
        'al.AZS_Id'
      
        '                            and Daily_Rep.AZS_Inst(+) = v_Card_E' +
        'qual.AZS_Id'
      
        '                            and Daily_Rep.Rep_Date(+) <= v_Card_' +
        'Equal.Oper_Date'
      
        '                            and Daily_Rep.End_Date(+) > v_Card_E' +
        'qual.Oper_Date'
      
        '                            and nvl(v_Card_Equal.Card_Number, 0)' +
        ' > 0)'
      '                  where Date_ <= :CurDate'
      '                    and CardAlign = 0'
      '                    and Auto_Id is null'
      '                    and tr_type <> 12) Card_Receipt,'
      '                v_org Client,'
      '                Oil_NP_Group,'
      '                v_org Emitent,'
      '                (select Id, Inst'
      '                   from v_org'
      '                  where Id = :DepId'
      '                     or Inst = :DepInst'
      '                 union all'
      '                 select Id, Inst'
      '                   from v_org'
      '                  where Par = :DepId'
      '                     or Par_Inst = :DepInst) Dep'
      '         where (Card_Receipt.To_Id = :OrgId or :OrgId = 0)'
      '           and (Card_Receipt.To_Inst = :OrgInst or :OrgInst = 0)'
      
        '           and Card.GetDep(Card_Receipt.Card_Number, Card_Receip' +
        't.oper_date) = Emitent.Id(+)'
      
        '           and Card.GetDep(Card_Receipt.Card_Number, Card_Receip' +
        't.oper_date) = Emitent.Inst(+)'
      '           and Emitent.ID(+) = Emitent.Inst(+)'
      '           and Card_Receipt.To_Id = Client.Id'
      '           and Card_Receipt.To_Inst = Client.Inst'
      '           and Card_Receipt.NP_Type = Oil_NP_Group.Petrol_Id'
      '           and Emitent.Id = Dep.Id'
      '           and Emitent.Inst = Dep.Inst)'
      ' group by Emitent_Name,'
      '          to_id,'
      '          to_inst,'
      '          Client_Name,'
      '          Client_OKPO,'
      '          NP_Name,'
      '          Card_Number,'
      '          Rec_Date,'
      '          Price'
      'having sum(Litr) <> 0'
      ' order by Emitent_Name,'
      '          Client_Name,'
      '          Client_OKPO,'
      '          NP_Name,'
      '          Card_Number,'
      '          Rec_Date,'
      '          Price')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 160
    Top = 305
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'PrintCardNumber'
      end
      item
        DataType = ftBoolean
        Name = 'PrintDate'
      end
      item
        DataType = ftBoolean
        Name = 'PrintPrice'
      end
      item
        DataType = ftDateTime
        Name = 'CurDate'
      end
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end>
  end
  object qCardMove: TOilQuery
    SQL.Strings = (
      '--> qCardMove,TalonPotrReport'
      '-- '#1048#1090#1086#1075#1086#1074#1072#1103' '#1074#1099#1073#1086#1088#1082#1072' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1053#1055' '#1087#1086' '#1069#1050
      ' select Emitent_Name,'
      '        Client_Name,'
      '        Client_OKPO,'
      '        NP_Name,'
      '        Card_Number,'
      '        Price,'
      '        sum(BeginRest) as BeginRest,'
      '        sum(BeginRestAmount) as BeginRestAmount,'
      '        sum(Receipt) as Receipt,'
      '        sum(ReceiptAmount) as ReceiptAmount,'
      '        sum(Expense) as Expense,'
      '        sum(ExpenseAmount) as ExpenseAmount,'
      '        sum(EndRest) as EndRest,'
      '        sum(EndRestAmount) as EndRestAmount'
      '   from (-- '#1042#1099#1073#1086#1088#1082#1072' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1053#1055' '#1087#1086' '#1069#1050
      
        '         select /*+ORDERED NO_MERGE USE_HASH(Card_Receipt, Clien' +
        't, Oil_NP_Group, Emitent, Dep)*/'
      '                Emitent.Name as Emitent_Name,'
      '                Client.Name as Client_Name,'
      '                Client.Id_Num as Client_OKPO,'
      '                Oil_NP_Group.Name as NP_Name,'
      
        '                decode(:PrintCardNumber, 0, to_number(null), Car' +
        'd_Receipt.Card_Number) as Card_Number,'
      
        '                decode(:PrintPrice, 0, to_number(null), Card_Rec' +
        'eipt.Price) as Price,'
      '                Card_Receipt.BeginRest,'
      '                Card_Receipt.BeginRestAmount,'
      '                Card_Receipt.Receipt,'
      '                Card_Receipt.ReceiptAmount,'
      '                Card_Receipt.Expense,'
      '                Card_Receipt.ExpenseAmount,'
      '                Card_Receipt.EndRest,'
      '                Card_Receipt.EndRestAmount'
      '           from (-- '#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1085#1072' '#1069#1050
      '                 select To_Id,'
      '                        To_Inst,'
      '                        NP_Type,'
      '                        Card_Number,'
      '                        Oper_Date,'
      '                        Price,'
      '                        Litr as BeginRest,'
      
        '                        round(Litr * Price, 2) as BeginRestAmoun' +
        't,'
      '                        to_number(null) as Receipt,'
      '                        to_number(null) as ReceiptAmount,'
      '                        to_number(null) as Expense,'
      '                        to_number(null) as ExpenseAmount,'
      '                        to_number(null) as EndRest,'
      '                        to_number(null) as EndRestAmount'
      '                   from v_Card_Receipts'
      '                  where trunc(Oper_Date) < :BeginDate'
      '                    and CardAlign = 0'
      '                    and Auto_Id is null'
      ''
      '                  union all'
      ''
      '                 -- '#1042#1099#1073#1086#1088#1082#1072' '#1086#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1103' '#1087#1086' '#1069#1050
      '                 select To_Id,'
      '                        To_Inst,'
      '                        NP_Type,'
      '                        Card_Number,'
      '                        R_Oper_Date,'
      '                        Price,'
      '                        - Litr,'
      '                        - Amount,'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null)'
      
        '                   from (select /*VERSION=105.2*/ /*+ORDERED USE' +
        '_HASH(Daily_Rep, v_Card_Equal)*/'
      
        '                          nvl(Daily_Rep.AZS_Id, v_Card_Equal.AZS' +
        '_Id) as AZS_Id,'
      
        '                          nvl(Daily_Rep.AZS_Inst, v_Card_Equal.A' +
        'ZS_Inst) as AZS_Inst,'
      
        '                          nvl(Daily_Rep.Rep_Date, v_Card_Equal.D' +
        'ate_) as Rep_Date,'
      '                          v_Card_Equal.Auto_Id,'
      '                          v_Card_Equal.Auto_Inst,'
      '                          v_Card_Equal.Employ_Id,'
      '                          v_Card_Equal.Employ_Inst,'
      '                          v_Card_Equal.To_Id,'
      '                          v_Card_Equal.To_Inst,'
      '                          v_Card_Equal.Card_Number,'
      '                          v_Card_Equal.Doc_Number,'
      '                          v_Card_Equal.Doc_Date,'
      '                          v_Card_Equal.R_Doc_Number,'
      '                          v_Card_Equal.R_Oper_Date,'
      '                          /*v_Card_Equal.Emitent_AZS,*/'
      '                          v_Card_Equal.NP_Type,'
      '                          v_Card_Equal.Term_Price,'
      '                          v_Card_Equal.Price,'
      '                          v_Card_Equal.Litr,'
      '                          v_Card_Equal.Amount,'
      '                          v_Card_Equal.CardAlign,'
      '                          v_Card_Equal.tr_type,'
      '                          v_Card_Equal.Date_'
      
        '                           from v_Card_Equal, v_Oil_Daily_Rep Da' +
        'ily_Rep'
      
        '                          where Daily_Rep.AZS_Id(+) = v_Card_Equ' +
        'al.AZS_Id'
      
        '                            and Daily_Rep.AZS_Inst(+) = v_Card_E' +
        'qual.AZS_Id'
      
        '                            and Daily_Rep.Rep_Date(+) <= v_Card_' +
        'Equal.Oper_Date'
      
        '                            and Daily_Rep.End_Date(+) > v_Card_E' +
        'qual.Oper_Date'
      
        '                            and nvl(v_Card_Equal.Card_Number, 0)' +
        ' > 0)'
      '                  where Date_ < :BeginDate'
      '                    and Auto_Id is null'
      '                    and CardAlign = 0'
      '                    and tr_type <> 12'
      ''
      '                  union all'
      ''
      '                 -- '#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1085#1072' '#1069#1050
      '                 select To_Id,'
      '                        To_Inst,'
      '                        NP_Type,'
      '                        Card_Number,'
      '                        Oper_Date,'
      '                        Price,'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        Litr,'
      '                        round(Litr * Price, 2),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null)'
      '                   from v_Card_Receipts'
      
        '                  where trunc(Oper_Date) between :BeginDate and ' +
        ':EndDate'
      '                    and Auto_Id is null'
      '                    and CardAlign = 0'
      ''
      '                  union all'
      ''
      '                 -- '#1042#1099#1073#1086#1088#1082#1072' '#1086#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1103' '#1087#1086' '#1069#1050
      
        '                 select /*+ORDERED USE_HASH(Daily_Rep, v_Card_Eq' +
        'ual)*/'
      '                        To_Id,'
      '                        To_Inst,'
      '                        NP_Type,'
      '                        Card_Number,'
      '                        R_Oper_Date,'
      '                        Price,'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        Litr,'
      '                        Amount,'
      '                        to_number(null),'
      '                        to_number(null)'
      
        '                   from (select /*VERSION=105.2*/ /*+ORDERED USE' +
        '_HASH(Daily_Rep, v_Card_Equal)*/'
      
        '                          nvl(Daily_Rep.AZS_Id, v_Card_Equal.AZS' +
        '_Id) as AZS_Id,'
      
        '                          nvl(Daily_Rep.AZS_Inst, v_Card_Equal.A' +
        'ZS_Inst) as AZS_Inst,'
      
        '                          nvl(Daily_Rep.Rep_Date, v_Card_Equal.D' +
        'ate_) as Rep_Date,'
      '                          v_Card_Equal.Auto_Id,'
      '                          v_Card_Equal.Auto_Inst,'
      '                          v_Card_Equal.Employ_Id,'
      '                          v_Card_Equal.Employ_Inst,'
      '                          v_Card_Equal.To_Id,'
      '                          v_Card_Equal.To_Inst,'
      '                          v_Card_Equal.Card_Number,'
      '                          v_Card_Equal.Doc_Number,'
      '                          v_Card_Equal.Doc_Date,'
      '                          v_Card_Equal.R_Doc_Number,'
      '                          v_Card_Equal.R_Oper_Date,'
      '                          /*v_Card_Equal.Emitent_AZS,*/'
      '                          v_Card_Equal.NP_Type,'
      '                          v_Card_Equal.Term_Price,'
      '                          v_Card_Equal.Price,'
      '                          v_Card_Equal.Litr,'
      '                          v_Card_Equal.Amount,'
      '                          v_Card_Equal.CardAlign,'
      '                          v_Card_Equal.tr_type,'
      '                          v_Card_Equal.Date_'
      
        '                           from v_Card_Equal, v_Oil_Daily_Rep Da' +
        'ily_Rep'
      
        '                          where Daily_Rep.AZS_Id(+) = v_Card_Equ' +
        'al.AZS_Id'
      
        '                            and Daily_Rep.AZS_Inst(+) = v_Card_E' +
        'qual.AZS_Id'
      
        '                            and Daily_Rep.Rep_Date(+) <= v_Card_' +
        'Equal.Oper_Date'
      
        '                            and Daily_Rep.End_Date(+) > v_Card_E' +
        'qual.Oper_Date'
      
        '                            and nvl(v_Card_Equal.Card_Number, 0)' +
        ' > 0)'
      '                  where date_ between :BeginDate and :EndDate'
      '                    and Auto_Id is null'
      '                    and CardAlign = 0'
      '                    and tr_type <> 12'
      ''
      '                  union all'
      ''
      '                 -- '#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1085#1072' '#1069#1050
      '                 select To_Id,'
      '                        To_Inst,'
      '                        NP_Type,'
      '                        Card_Number,'
      '                        Oper_Date,'
      '                        Price,'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        Litr,'
      '                        round(Litr * Price, 2)'
      '                   from v_Card_Receipts'
      '                  where trunc(Oper_Date) <= :EndDate'
      '                    and Auto_Id is null'
      '                    and CardAlign = 0'
      ''
      '                  union all'
      ''
      '                 -- '#1042#1099#1073#1086#1088#1082#1072' '#1086#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1103' '#1087#1086' '#1069#1050
      
        '                 select /*+ORDERED USE_HASH(Daily_Rep, v_Card_Eq' +
        'ual)*/'
      '                        To_Id,'
      '                        To_Inst,'
      '                        NP_Type,'
      '                        Card_Number,'
      '                        R_Oper_Date,'
      '                        Price,'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        to_number(null),'
      '                        - Litr,'
      '                        - Amount'
      
        '                   from (select /*VERSION=105.2*/ /*+ORDERED USE' +
        '_HASH(Daily_Rep, v_Card_Equal)*/'
      
        '                          nvl(Daily_Rep.AZS_Id, v_Card_Equal.AZS' +
        '_Id) as AZS_Id,'
      
        '                          nvl(Daily_Rep.AZS_Inst, v_Card_Equal.A' +
        'ZS_Inst) as AZS_Inst,'
      
        '                          nvl(Daily_Rep.Rep_Date, v_Card_Equal.D' +
        'ate_) as Rep_Date,'
      '                          v_Card_Equal.Auto_Id,'
      '                          v_Card_Equal.Auto_Inst,'
      '                          v_Card_Equal.Employ_Id,'
      '                          v_Card_Equal.Employ_Inst,'
      '                          v_Card_Equal.To_Id,'
      '                          v_Card_Equal.To_Inst,'
      '                          v_Card_Equal.Card_Number,'
      '                          v_Card_Equal.Doc_Number,'
      '                          v_Card_Equal.Doc_Date,'
      '                          v_Card_Equal.R_Doc_Number,'
      '                          v_Card_Equal.R_Oper_Date,'
      '                          /*v_Card_Equal.Emitent_AZS,*/'
      '                          v_Card_Equal.NP_Type,'
      '                          v_Card_Equal.Term_Price,'
      '                          v_Card_Equal.Price,'
      '                          v_Card_Equal.Litr,'
      '                          v_Card_Equal.Amount,'
      '                          v_Card_Equal.CardAlign,'
      '                          v_Card_Equal.tr_type,'
      '                          v_Card_Equal.Date_'
      
        '                           from v_Card_Equal, v_Oil_Daily_Rep Da' +
        'ily_Rep'
      
        '                          where Daily_Rep.AZS_Id(+) = v_Card_Equ' +
        'al.AZS_Id'
      
        '                            and Daily_Rep.AZS_Inst(+) = v_Card_E' +
        'qual.AZS_Id'
      
        '                            and Daily_Rep.Rep_Date(+) <= v_Card_' +
        'Equal.Oper_Date'
      
        '                            and Daily_Rep.End_Date(+) > v_Card_E' +
        'qual.Oper_Date'
      
        '                            and nvl(v_Card_Equal.Card_Number, 0)' +
        ' > 0)'
      '                  where date_ <= :EndDate'
      '                    and CardAlign = 0'
      '                    and Auto_Id is null'
      
        '                    and tr_type <> 12) Card_Receipt, v_org Clien' +
        't, Oil_NP_Group, v_org Emitent,'
      
        '                (select Id, Inst from v_org where Id = :DepId or' +
        ' Inst = :DepInst'
      '                  union all'
      
        '                 select Id, Inst from v_org where Par = :DepId o' +
        'r Par_Inst = :DepInst) Dep'
      '          where (Card_Receipt.To_Id = :OrgId or :OrgId = 0)'
      
        '            and (Card_Receipt.To_Inst = :OrgInst or :OrgInst = 0' +
        ')'
      
        '            and Card.GetDep(Card_Receipt.Card_Number, Card_Recei' +
        'pt.oper_date) = Emitent.Id (+) and Emitent.ID(+)=Emitent.Inst(+)'
      
        '            and Card.GetDep(Card_Receipt.Card_Number, Card_Recei' +
        'pt.oper_date) = Emitent.Inst(+)'
      '            and Card_Receipt.To_Id = Client.Id'
      '            and Card_Receipt.To_Inst = Client.Inst'
      '            and Card_Receipt.NP_Type = Oil_NP_Group.Petrol_Id'
      '            and Emitent.Id = Dep.Id (+)'
      '            and Emitent.Inst = Dep.Inst (+) )'
      
        '  group by Emitent_Name, Client_Name, Client_OKPO, NP_Name, Card' +
        '_Number, Price'
      ' having nvl(sum(BeginRest), 0) <> 0'
      '     or nvl(sum(Receipt), 0) <> 0'
      '     or nvl(sum(Expense), 0) <> 0'
      '     or nvl(sum(EndRest), 0) <> 0'
      
        '  order by Emitent_Name, Client_Name, Client_OKPO, NP_Name, Card' +
        '_Number, Price')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 225
    Top = 305
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'PrintCardNumber'
      end
      item
        DataType = ftBoolean
        Name = 'PrintPrice'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end>
  end
  object qCheckCardSR: TOilQuery
    SQL.Strings = (
      
        ' select Title || '#39' '#39' || AZS_Name || '#39' '#39' || trunc(Rep_Date) || '#39' ' +
        #39' || NP_Name || '#39' '#1085#1072' '#39' || Litr || '#39' '#1083#1080#1090#1088#1086#1074#39' as Title'
      '   from v_Check_Card_SR'
      '  where trunc(Rep_Date) >= :BeginDate'
      '    and trunc(Rep_Date) <= :EndDate')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 312
    Top = 110
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
  end
  object qAutoOut: TOilQuery
    SQL.Strings = (
      '--> qAutoOut,TalonPotrReport'
      '-- '#1048#1090#1086#1075#1086#1074#1072#1103' '#1074#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1069#1050
      ' select Employ_Name,'
      '        Auto_Number,'
      '        Auto_Type_Name,'
      '        Auto_Group_Name,'
      '        NP_Name,'
      '        Refuel_Type_Name,'
      '        Card_Number,'
      '        Rec_Date as Out_Date,'
      '        sum(Litr) as Litr'
      '   from (-- '#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1069#1050
      
        '         select /*+ORDERED USE_HASH(Receipt, Oil_NP_Group, Oil_E' +
        'mploy, Oil_Auto, Oil_Auto_Type, Oil_Auto_Group, Dep)*/'
      
        '                Oil_Employ.F_NAME || '#39' '#39' || DECODE(SUBSTR(oil_em' +
        'ploy.I_NAME, 1, 1), '#39' '#39', '#39#39', '#39#39', '#39#39', '
      
        '                  SUBSTR(oil_employ.I_NAME, 1, 1) || '#39'.'#39') || DEC' +
        'ODE(SUBSTR(oil_employ.O_NAME, 1, 1), '#39' '#39', '#39#39', '#39'_'#39', '#39#39', '
      
        '                  SUBSTR(oil_employ.O_NAME, 1, 1) || '#39'.'#39') as Emp' +
        'loy_Name,'
      '                Oil_Auto.Numb as Auto_Number,'
      '                Oil_Auto_Type.Name as Auto_Type_Name,'
      '                Oil_Auto_Group.Name as Auto_Group_Name,'
      '                Oil_NP_Group.Name as NP_Name,'
      '                '#39#1055#1086' '#1101#1083'. '#1082#1072#1088#1090#1072#1084#39' as Refuel_Type_Name,'
      
        '                decode(:PrintCardNumber, 0, to_number(null), Rec' +
        'eipt.Card_Number) as Card_Number,'
      
        '                decode(:PrintDate, 0, to_date(null), trunc(Recei' +
        'pt.Oper_Date)) as Rec_Date,'
      '                Receipt.Litr'
      
        '           from v_Card_Receipts Receipt, Oil_NP_Group, Oil_Emplo' +
        'y, Oil_Auto, Oil_Auto_Type, Oil_Auto_Group,'
      
        '                (select Id, Inst from v_org where Id = :DepId an' +
        'd  Inst = :DepInst and id=inst and org_type in (3,4)'
      '                  union all'
      
        '                 select par, Par_Inst from v_org where Id = :Dep' +
        'Id and Inst = :DepInst  and id=inst and org_type in (3,4)'
      '                  union all'
      
        '                 select Id, Inst from v_org where Par = :DepId a' +
        'nd Par_Inst = :DepInst  and id=inst and org_type in (3,4)) Dep'
      '          where trunc(Oper_Date) >= :BeginDate'
      '            and trunc(Oper_Date) <= :EndDate'
      '            and Receipt.CardAlign = 0'
      '            and Receipt.NP_Type = Oil_NP_Group.Petrol_Id'
      '            and (Receipt.Employ_Id = :EmpId or :EmpId = 0)'
      '            and (Receipt.Employ_Inst = :EmpInst or :EmpInst = 0)'
      '            and (Receipt.Auto_Id = :AutoId or :AutoId = 0)'
      '            and (Receipt.Auto_Inst = :AutoInst or :AutoInst = 0)'
      '            and Receipt.Employ_Id = Oil_Employ.Id'
      '            and Receipt.Employ_Inst = Oil_Employ.Inst'
      '            and Receipt.Auto_Id = Oil_Auto.Id'
      '            and Receipt.Auto_Inst = Oil_Auto.Inst'
      '            and Oil_Auto.Auto_Type_Id = Oil_Auto_Type.Id'
      '            and Oil_Auto_Type.Auto_Group = Oil_Auto_Group.Id'
      '            and Oil_Auto.Inst = Dep.Id'
      '            and Oil_Auto.Inst = Dep.Inst'
      '            and :SelectCard <> 0'
      
        '            and Receipt.Litr > 0 /* '#1044#1083#1103' '#1089#1083#1091#1095#1072#1077#1074' '#1082#1086#1075#1076#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1077 +
        ' '#1089#1087#1080#1089#1072#1085#1086' '#1087#1086#1083#1085#1086#1089#1090#1100#1102' */'
      '          union all'
      
        '         select /*+ORDERED USE_HASH(Receipt, Oil_NP_Group, Oil_E' +
        'mploy, Oil_Auto, Oil_Auto_Type, Oil_Auto_Group, Dep)*/'
      
        '                Oil_Employ.F_NAME || '#39' '#39' || DECODE(SUBSTR(oil_em' +
        'ploy.I_NAME, 1, 1), '#39' '#39', '#39#39', '#39#39', '#39#39', '
      
        '                  SUBSTR(oil_employ.I_NAME, 1, 1) || '#39'.'#39') || DEC' +
        'ODE(SUBSTR(oil_employ.O_NAME, 1, 1), '#39' '#39', '#39#39', '#39'_'#39', '#39#39', '
      
        '                  SUBSTR(oil_employ.O_NAME, 1, 1) || '#39'.'#39') as Emp' +
        'loy_Name,'
      '                Oil_Auto.Numb as Auto_Number,'
      '                Oil_Auto_Type.Name as Auto_Type_Name,'
      '                Oil_Auto_Group.Name as Auto_Group_Name,'
      '                Oil_NP_Group.Name as NP_Name,'
      '                '#39#1055#1086' '#1090#1072#1083#1086#1085#1072#1084#39' as Refuel_Type_Name,'
      
        '                decode(:PrintCardNumber, 0, to_number(null), Tal' +
        'Out.Ser || '#39'/'#39' || to_char(TalOut.Num)) as Card_Number,'
      
        '                decode(:PrintDate, 0, to_date(null), trunc(TalOu' +
        't.Date_)) as Out_Date,'
      '                TalOut.Nominal as Litr'
      
        '           from V_Oil_Talon_Op TalOut, Oil_NP_Group, Oil_Employ,' +
        ' Oil_Auto,'
      '                Oil_Auto_Type, Oil_Auto_Group,'
      
        '                (select Id, Inst from v_org where Id = :DepId an' +
        'd  Inst = :DepInst and id=inst and org_type in (3,4)'
      '                  union all'
      
        '                 select par, Par_Inst from v_org where Id = :Dep' +
        'Id and Inst = :DepInst  and id=inst and org_type in (3,4)'
      '                  union all'
      
        '                 select Id, Inst from v_org where Par = :DepId a' +
        'nd Par_Inst = :DepInst  and id=inst and org_type in (3,4)) Dep'
      '          where TalOut.Tip = '#39'O'#39' '
      
        '            and trunc(TalOut.Date_) between :BeginDate and :EndD' +
        'ate'
      '            and TalOut.NPGrp_Id = Oil_NP_Group.Id'
      '            and (TalOut.Employ_Id = :EmpId or :EmpId = 0)'
      '            and (TalOut.Employ_Inst = :EmpInst or :EmpInst = 0)'
      '            and (TalOut.Auto_Id = :AutoId or :AutoId = 0)'
      '            and (TalOut.Auto_Inst = :AutoInst or :AutoInst = 0)'
      '            and TalOut.Employ_Id = Oil_Employ.Id'
      '            and TalOut.Employ_Inst = Oil_Employ.Inst'
      '            and TalOut.Auto_Id = Oil_Auto.Id'
      '            and TalOut.Auto_Inst = Oil_Auto.Inst'
      '            and Oil_Auto.Auto_Type_Id = Oil_Auto_Type.Id'
      '            and Oil_Auto_Type.Auto_Group = Oil_Auto_Group.Id'
      '            and Oil_Auto.Inst = Dep.Id'
      '            and Oil_Auto.Inst = Dep.Inst'
      '            and :SelectTalon <> 0)'
      
        '  group by Employ_Name, Auto_Number, Auto_Type_Name, Auto_Group_' +
        'Name, NP_Name, Refuel_Type_Name, Card_Number, Rec_Date'
      
        '  order by Employ_Name, Auto_Number, Auto_Type_Name, Auto_Group_' +
        'Name, NP_Name, Refuel_Type_Name, Card_Number, Rec_Date')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 35
    Top = 260
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'PrintCardNumber'
      end
      item
        DataType = ftBoolean
        Name = 'PrintDate'
      end
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end
      item
        DataType = ftInteger
        Name = 'EmpId'
      end
      item
        DataType = ftInteger
        Name = 'EmpInst'
      end
      item
        DataType = ftInteger
        Name = 'AutoId'
      end
      item
        DataType = ftInteger
        Name = 'AutoInst'
      end
      item
        DataType = ftBoolean
        Name = 'SelectCard'
      end
      item
        DataType = ftBoolean
        Name = 'SelectTalon'
      end>
  end
  object qCardPrih: TOilQuery
    SQL.Strings = (
      '--> qCardPrih,TalonPotrReport'
      ' select Emitent_Name,'
      '        Client_Name,'
      '        Client_OKPO,'
      '        NP_Name,'
      '        Part,'
      '        Sub_Part,'
      '        Filial_Name,'
      '        AZS_Name,'
      '        Rep_Date,'
      '        Smena_Num,'
      '        Exp_Date,'
      '        Card_Number,'
      '        Rec_Date,'
      '        Price,'
      '        sum(Litr) as Litr,'
      '        sum(Weight) as Weight,'
      '        sum(Amount) as Amount'
      '   from ('
      '         select /*+ORDERED*/'
      '                CS_Equal.Emitent_Name,'
      '                CS_Equal.Client_Name,'
      '                CS_Equal.Client_OKPO,'
      '                CS_Equal.Auto_Id,'
      '                CS_Equal.NP_Name,'
      
        '                decode(:PrintPart, 0, to_char(null), CS_Equal.Pa' +
        'rt_Dog) as Part,'
      
        '                decode(:PrintSubPart, 0, to_number(null), CS_Equ' +
        'al.Sub_Part) as Sub_Part,'
      
        '                decode(:PrintAZS, 0, to_char(null), CS_Equal.Fil' +
        'ial_Name) as Filial_Name,'
      
        '                decode(:PrintAZS, 0, to_char(null), CS_Equal.AZS' +
        '_Name) as AZS_Name,'
      
        '                decode(:PrintDate, 0, to_date(null), to_date(CS_' +
        'Equal.Rep_Date)) as Rep_Date,'
      
        '                decode(:PrintAZS, 0, to_number(null), CS_Equal.S' +
        'mena_Num) as Smena_Num,'
      
        '                decode(:PrintDate, 0, to_date(null), to_date(CS_' +
        'Equal.Exp_Date)) as Exp_Date,'
      
        '                decode(:PrintCardNumber, 0, to_number(null), CS_' +
        'Equal.Card_Number) as Card_Number,'
      
        '                decode(:PrintDate, 0, to_date(null), to_date(CS_' +
        'Equal.Rec_Date)) as Rec_Date,'
      
        '                decode(:PrintPrice, 0, to_number(null), decode(P' +
        'rice, null, Term_Price, Price)) as Price,'
      '                CS_Equal.Litr,'
      '                CS_Equal.Weight,'
      
        '                decode(Price, null, round(CS_Equal.Litr * Term_P' +
        'rice, 2), CS_Equal.Dog_Amount) as Amount'
      '           from v_Card_SR_Equal CS_Equal,'
      
        '                (select Id, Inst from Oil_Org where Id = :DepId ' +
        'or Inst = :DepInst'
      '                  union all'
      
        '                 select Id, Inst from Oil_Org where Par = :DepId' +
        ' or Par_Inst = :DepInst) Dep'
      
        '          where trunc(CS_Equal.exp_date) between :BeginDate and ' +
        ':EndDate'
      '            and CS_Equal.CardAlign = 0'
      '            and (CS_Equal.Client_Id = :OrgId or :OrgId = 0)'
      
        '            and (CS_Equal.Client_Inst = :OrgInst or :OrgInst = 0' +
        ')'
      
        '            and ((:PrintOurClientOurAZS <> 0 and azs_obl_id = em' +
        'itent_obl_id )'
      
        '              or (:PrintAlienClientOurAZS <> 0 and azs_obl_id <>' +
        ' emitent_obl_id) )'
      '            and CS_Equal.Filial_Id = Dep.Id'
      '            and CS_Equal.Filial_Inst = Dep.Inst'
      '            /*and CS_Equal.is_ls = 0*/'
      '          union all'
      
        '         select /*+ORDERED USE_HASH(Card_Expense, Emitent, Clien' +
        't, Oil_NP_Group)*/'
      '                Emitent.dep_name as Emitent_Name,'
      '                Client.Name as Client_Name,'
      '                Client.Id_Num as Client_OKPO,'
      '                Card_Expense.Auto_Id,'
      '                Oil_NP_Group.Name as NP_Name,'
      '                to_char(null) as Part,'
      '                to_number(null) as Sub_Part,'
      
        '                decode(:PrintAZS, 0, to_char(null), Card_Expense' +
        '.azs_par_name) as Filial_Name,'
      
        '                decode(:PrintAZS, 0, to_char(null), Card_Expense' +
        '.AZS_Name) as AZS_Name,'
      '                to_date(null) as Rep_Date,'
      '                to_number(null) as Smena_Num,'
      
        '                decode(:PrintDate, 0, to_date(null), Card_Expens' +
        'e.Date_) as Exp_Date,'
      
        '                decode(:PrintCardNumber, 0, to_number(null), Car' +
        'd_Expense.Card_Number) as Card_Number,'
      
        '                decode(:PrintDate, 0, to_date(null), Card_Expens' +
        'e.R_Date_) as Rec_Date,'
      
        '                decode(:PrintPrice, 0, to_number(null), Card_Exp' +
        'ense.Price) as Price,'
      '                Card_Expense.Litr,'
      '                to_number(null) as Weight,'
      '                Card_Expense.Amount'
      
        '           from v_Card_Equal Card_Expense, Oil_Org Client, v_car' +
        'd_id_history Emitent, Oil_NP_Group'
      '          where :PrintOurClientAlienAZS <> 0'
      '            and (Card_Expense.To_Id = :OrgId or :OrgId = 0)'
      
        '            and (Card_Expense.To_Inst = :OrgInst or :OrgInst = 0' +
        ')'
      
        '            and Card_Expense.Date_ between  :BeginDate and :EndD' +
        'ate'
      '            and Card_Expense.CardAlign = 0'
      '            and Card_Expense.To_Id = Client.Id (+)'
      '            and Card_Expense.To_Inst = Client.Inst (+)'
      
        '            and Substr(Card_Expense.Card_Number,1,3) = Emitent.C' +
        'ard_Id'
      '            and :DepId in (Emitent.obl_id, Emitent.dep_id)'
      
        '            and Card_Expense.r_date_ between Emitent.date_ and E' +
        'mitent.date_to'
      '            and Card_Expense.NP_Type = Oil_NP_Group.Petrol_Id'
      '            and Card_Expense.Is_Alien_AZS = 1'
      '            /*and Card_Expense.tr_type <> 12*/'
      '            )'
      '  where Auto_Id is null'
      '  group by Emitent_Name,'
      '        Client_Name,'
      '        Client_OKPO,'
      '        NP_Name,'
      '        Part,'
      '        Sub_Part,'
      '        Filial_Name,'
      '        AZS_Name,'
      '        Rep_Date,'
      '        Smena_Num,'
      '        Exp_Date,'
      '        Card_Number,'
      '        Rec_Date,'
      '        Price'
      '  order by Emitent_Name,'
      '        Client_Name,'
      '        Client_OKPO,'
      '        NP_Name,'
      '        Part,'
      '        Sub_Part,'
      '        Filial_Name,'
      '        AZS_Name,'
      '        Rep_Date desc,'
      '        Smena_Num,'
      '        Exp_Date desc,'
      '        Card_Number,'
      '        Rec_Date desc,'
      '        Price')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 95
    Top = 305
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'PrintPart'
      end
      item
        DataType = ftBoolean
        Name = 'PrintSubPart'
      end
      item
        DataType = ftBoolean
        Name = 'PrintAZS'
      end
      item
        DataType = ftBoolean
        Name = 'PrintDate'
      end
      item
        DataType = ftBoolean
        Name = 'PrintCardNumber'
      end
      item
        DataType = ftBoolean
        Name = 'PrintPrice'
      end
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftBoolean
        Name = 'PrintOurClientOurAZS'
      end
      item
        DataType = ftBoolean
        Name = 'PrintAlienClientOurAZS'
      end
      item
        DataType = ftBoolean
        Name = 'PrintOurClientAlienAZS'
      end>
  end
  object qAutoRest: TOilQuery
    SQL.Strings = (
      '--> qAutoRest,TalonPotrReport'
      '-- '#1048#1090#1086#1075#1086#1074#1072#1103' '#1074#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1069#1050
      'select Employ_Name,'
      '       Auto_Number,'
      '       Auto_Type_Name,'
      '       Auto_Group_Name,'
      '       NP_Name,'
      '       Refuel_Type_Name,'
      '       Card_Number,'
      '       Rec_Date as Out_Date,'
      '       sum(Litr) as Litr'
      '  from ( -- '#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1069#1050
      
        '        select /*+ORDERED USE_HASH(Receipt, Oil_NP_Group, Oil_Em' +
        'ploy, Oil_Auto, Oil_Auto_Type, Oil_Auto_Group, Dep)*/'
      '         Oil_Employ.F_NAME || '#39' '#39' ||'
      '          DECODE(SUBSTR(oil_employ.I_NAME, 1, 1),'
      '                 '#39' '#39','
      '                 '#39#39','
      '                 '#39#39','
      '                 '#39#39','
      '                 SUBSTR(oil_employ.I_NAME, 1, 1) || '#39'.'#39') ||'
      '          DECODE(SUBSTR(oil_employ.O_NAME, 1, 1),'
      '                 '#39' '#39','
      '                 '#39#39','
      '                 '#39'_'#39','
      '                 '#39#39','
      
        '                 SUBSTR(oil_employ.O_NAME, 1, 1) || '#39'.'#39') as Empl' +
        'oy_Name,'
      '          Oil_Auto.Numb as Auto_Number,'
      '          Oil_Auto_Type.Name as Auto_Type_Name,'
      '          Oil_Auto_Group.Name as Auto_Group_Name,'
      '          Oil_NP_Group.Name as NP_Name,'
      '          '#39#1055#1086' '#1101#1083'. '#1082#1072#1088#1090#1072#1084#39' as Refuel_Type_Name,'
      
        '          decode(:PrintCardNumber, 0, to_number(null), Receipt.C' +
        'ard_Number) as Card_Number,'
      
        '          decode(:PrintDate, 0, to_date(null), trunc(Receipt.Ope' +
        'r_Date)) as Rec_Date,'
      '          Receipt.Litr'
      '          from ( -- '#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1069#1050' '#1085#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1072#1074#1090#1086
      '                 select Auto_Id,'
      '                         Auto_Inst,'
      '                         Employ_Id,'
      '                         Employ_Inst,'
      '                         Card_Number,'
      '                         NP_Type,'
      '                         Oper_Date,'
      '                         Litr'
      '                   from v_Card_Receipts'
      '                  where trunc(Oper_Date) <= :EndDate'
      '                    and CardAlign = 0'
      '                    and Auto_Id is not null'
      '                 union all'
      '                 -- '#1042#1099#1073#1086#1088#1082#1072' '#1089#1087#1080#1089#1072#1085#1080#1081' '#1069#1050' '#1085#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1072#1074#1090#1086
      '                 select Auto_Id,'
      '                        Auto_Inst,'
      '                        Employ_Id,'
      '                        Employ_Inst,'
      '                        Card_Number,'
      '                        NP_Type,'
      '                        R_Oper_Date,'
      '                        -Litr'
      '                   from v_Card_Equal'
      '                  where trunc(Oper_Date) <= :EndDate'
      '                    and CardAlign = 0'
      '                    and Auto_Id is not null) Receipt,'
      '                Oil_NP_Group,'
      '                Oil_Employ,'
      '                Oil_Auto,'
      '                Oil_Auto_Type,'
      '                Oil_Auto_Group,'
      '                (select Id, Inst'
      '                   from v_org'
      '                  where Id = :DepId'
      '                    and Inst = :DepInst'
      '                    and id = inst'
      '                    and org_type in (3, 4)'
      '                 union all'
      '                 select par, Par_Inst'
      '                   from v_org'
      '                  where Id = :DepId'
      '                    and Inst = :DepInst'
      '                    and id = inst'
      '                    and org_type in (3, 4)'
      '                 union all'
      '                 select Id, Inst'
      '                   from v_org'
      '                  where Par = :DepId'
      '                    and Par_Inst = :DepInst'
      '                    and id = inst'
      '                    and org_type in (3, 4)) Dep'
      '         where Receipt.NP_Type = Oil_NP_Group.Petrol_Id'
      '           and (Receipt.Employ_Id = :EmpId or :EmpId = 0)'
      '           and (Receipt.Employ_Inst = :EmpInst or :EmpInst = 0)'
      '           and (Receipt.Auto_Id = :AutoId or :AutoId = 0)'
      '           and (Receipt.Auto_Inst = :AutoInst or :AutoInst = 0)'
      '           and Receipt.Employ_Id = Oil_Employ.Id'
      '           and Receipt.Employ_Inst = Oil_Employ.Inst'
      '           and Receipt.Auto_Id = Oil_Auto.Id'
      '           and Receipt.Auto_Inst = Oil_Auto.Inst'
      '           and Oil_Auto.Auto_Type_Id = Oil_Auto_Type.Id'
      '           and Oil_Auto_Type.Auto_Group = Oil_Auto_Group.Id'
      '           and Oil_Auto.Inst = Dep.Id'
      '           and Oil_Auto.Inst = Dep.Inst'
      '           and :SelectCard <> 0'
      '        union all'
      
        '        select /*+ORDERED USE_HASH(TalMax, TalData, TalOut, Oil_' +
        'NP_Group, Oil_Employ, Oil_Auto, Oil_Auto_Type, Oil_Auto_Group, D' +
        'ep)*/'
      '         Oil_Employ.F_NAME || '#39' '#39' ||'
      '         DECODE(SUBSTR(oil_employ.I_NAME, 1, 1),'
      '                '#39' '#39','
      '                '#39#39','
      '                '#39#39','
      '                '#39#39','
      '                SUBSTR(oil_employ.I_NAME, 1, 1) || '#39'.'#39') ||'
      '         DECODE(SUBSTR(oil_employ.O_NAME, 1, 1),'
      '                '#39' '#39','
      '                '#39#39','
      '                '#39'_'#39','
      '                '#39#39','
      
        '                SUBSTR(oil_employ.O_NAME, 1, 1) || '#39'.'#39') as Emplo' +
        'y_Name,'
      '         Oil_Auto.Numb as Auto_Number,'
      '         Oil_Auto_Type.Name as Auto_Type_Name,'
      '         Oil_Auto_Group.Name as Auto_Group_Name,'
      '         Oil_NP_Group.Name as NP_Name,'
      '         '#39#1055#1086' '#1090#1072#1083#1086#1085#1072#1084#39' as Refuel_Type_Name,'
      '         decode(:PrintCardNumber,'
      '                0,'
      '                to_number(null),'
      
        '                TalData.Ser || '#39'/'#39' || to_char(TalData.Num)) as C' +
        'ard_Number,'
      
        '         decode(:PrintDate, 0, to_date(null), trunc(TalOut.Out_D' +
        'ate)) as Out_Date,'
      '         TalData.Nominal as Litr'
      '          from (select /*+NO_MERGE*/'
      '                 Ser, Num, max(SamDate) MaxDate'
      '                  from ( --'#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1080#1093#1086#1076#1072' '#1080' '#1086#1090#1087#1091#1089#1082#1072' '#1090#1072#1083#1086#1085#1086#1074
      '                        select Ser,'
      '                                Num,'
      
        '                                decode(Tip, '#39'P'#39', Date_ + 0.1, Da' +
        'te_) as SamDate'
      '                          from V_Oil_Talon_Op'
      '                         where Date_ <= :EndDate) TalMax'
      '                 group by Ser, Num) TalMax,'
      '               Oil_Talon_Data TalData,'
      '               Oil_Talon_Out TalOut,'
      '               Oil_NP_Group,'
      '               Oil_Employ,'
      '               Oil_Auto,'
      '               Oil_Auto_Type,'
      '               Oil_Auto_Group,'
      '               (select Id, Inst'
      '                  from v_org'
      '                 where Id = :DepId'
      '                   and Inst = :DepInst'
      '                   and id = inst'
      '                   and org_type in (3, 4)'
      '                union all'
      '                select par, Par_Inst'
      '                  from v_org'
      '                 where Id = :DepId'
      '                   and Inst = :DepInst'
      '                   and id = inst'
      '                   and org_type in (3, 4)'
      '                union all'
      '                select Id, Inst'
      '                  from v_org'
      '                 where Par = :DepId'
      '                   and Par_Inst = :DepInst'
      '                   and id = inst'
      '                   and org_type in (3, 4)) Dep'
      '         where TalMax.Ser = TalData.Ser'
      '           and TalMax.Num = TalData.Num'
      '           and TalMax.MaxDate = TalOut.Out_Date'
      '           and TalOut.Id = TalData.Head_Id'
      '           and TalOut.Inst = TalData.Head_Inst'
      '           and TalData.NPGrp_Id = Oil_NP_Group.Id'
      '           and (TalData.Employ_Id = :EmpId or :EmpId = 0)'
      '           and (TalData.Employ_Inst = :EmpInst or :EmpInst = 0)'
      '           and (TalData.Auto_Id = :AutoId or :AutoId = 0)'
      '           and (TalData.Auto_Inst = :AutoInst or :AutoInst = 0)'
      '           and TalData.Employ_Id = Oil_Employ.Id'
      '           and TalData.Employ_Inst = Oil_Employ.Inst'
      '           and TalData.Auto_Id = Oil_Auto.Id'
      '           and TalData.Auto_Inst = Oil_Auto.Inst'
      '           and Oil_Auto.Auto_Type_Id = Oil_Auto_Type.Id'
      '           and Oil_Auto_Type.Auto_Group = Oil_Auto_Group.Id'
      '           and Oil_Auto.Inst = Dep.Id'
      '           and Oil_Auto.Inst = Dep.Inst'
      '           and :SelectTalon <> 0)'
      ' group by Employ_Name,'
      '          Auto_Number,'
      '          Auto_Type_Name,'
      '          Auto_Group_Name,'
      '          NP_Name,'
      '          Refuel_Type_Name,'
      '          Card_Number,'
      '          Rec_Date'
      'having sum(Litr) <> 0'
      ' order by Employ_Name,'
      '          Auto_Number,'
      '          Auto_Type_Name,'
      '          Auto_Group_Name,'
      '          NP_Name,'
      '          Refuel_Type_Name,'
      '          Card_Number,'
      '          Rec_Date')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 160
    Top = 260
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'PrintCardNumber'
      end
      item
        DataType = ftBoolean
        Name = 'PrintDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end
      item
        DataType = ftInteger
        Name = 'EmpId'
      end
      item
        DataType = ftInteger
        Name = 'EmpInst'
      end
      item
        DataType = ftInteger
        Name = 'AutoId'
      end
      item
        DataType = ftInteger
        Name = 'AutoInst'
      end
      item
        DataType = ftBoolean
        Name = 'SelectCard'
      end
      item
        DataType = ftBoolean
        Name = 'SelectTalon'
      end>
  end
  object qAutoMove: TOilQuery
    SQL.Strings = (
      '--> qAutoMove,TalonPotrReport'
      '-- '#1048#1090#1086#1075#1086#1074#1072#1103' '#1074#1099#1073#1086#1088#1082#1072' '
      ' select Employ_Name,'
      ' dep_name,'
      '        Auto_Number,'
      '        Auto_Type_Name,'
      '        Auto_Group_Name,'
      '        NP_Name,'
      '        Refuel_Type_Name,'
      '        sum(BeginRest) as BeginRest,'
      '        sum(OutLitr) as OutLitr,'
      '        sum(RefuelLitr) as RefuelLitr,'
      '        sum(EndRest) as EndRest'
      '   from (-- '#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1069#1050
      
        '         select /*+ORDERED USE_HASH(Receipt, Oil_NP_Group, Oil_E' +
        'mploy, Oil_Auto, Oil_Auto_Type, Oil_Auto_Group, Dep)*/'
      
        '                Oil_Employ.F_NAME || '#39' '#39' || DECODE(SUBSTR(oil_em' +
        'ploy.I_NAME, 1, 1), '#39' '#39', '#39#39', '#39#39', '#39#39', SUBSTR(oil_employ.I_NAME, 1' +
        ', 1) || '#39'.'#39') || DECODE(SUBSTR(oil_employ.O_NAME, 1, 1), '#39' '#39', '#39#39',' +
        ' '#39'_'#39', '#39#39', SUBSTR(oil_employ.O_NAME, 1, 1) || '#39'.'#39') as Employ_Name' +
        ','
      '                Oil_Auto.Numb as Auto_Number,'
      '                Oil_Auto_Type.Name as Auto_Type_Name,'
      '                Oil_Auto_Group.Name as Auto_Group_Name,'
      '                Oil_NP_Group.Name as NP_Name,'
      '                AutoNPMove.Refuel_Type_Name,'
      '                AutoNPMove.BeginRest,'
      '                AutoNPMove.OutLitr,'
      '                AutoNPMove.RefuelLitr,'
      '                AutoNPMove.EndRest,'
      '                dep.name as dep_name'
      '           from (-- '#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1069#1050' '#1085#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1072#1074#1090#1086
      '                 select Receipt.Auto_Id,'
      '                        Receipt.Auto_Inst,'
      '                        Receipt.Employ_Id,'
      '                        Receipt.Employ_Inst,'
      '                        Oil_NP_Group.Id as NP_Id,'
      '                        '#39#1055#1086' '#1101#1083'. '#1082#1072#1088#1090#1072#1084#39' as Refuel_Type_Name,'
      '                        Receipt.Litr as BeginRest,'
      '                        to_number(null) as OutLitr,'
      '                        to_number(null) as RefuelLitr,'
      '                        to_number(null) as EndRest'
      '                   from v_Card_Receipts Receipt, Oil_NP_Group'
      '                  where trunc(Receipt.Oper_Date) < :BeginDate'
      
        '                    and (Receipt.Employ_Id = :EmpId or :EmpId = ' +
        '0)'
      
        '                    and (Receipt.Employ_Inst = :EmpInst or :EmpI' +
        'nst = 0)'
      
        '                    and (Receipt.Auto_Id = :AutoId or :AutoId = ' +
        '0)'
      
        '                    and (Receipt.Auto_Inst = :AutoInst or :AutoI' +
        'nst = 0)'
      '                    and CardAlign = 0'
      '                    and Receipt.NP_Type = Oil_NP_Group.Petrol_Id'
      '                    and Receipt.Auto_Id is not null'
      '                    and :SelectCard <> 0'
      '                  union all'
      '                 -- '#1042#1099#1073#1086#1088#1082#1072' '#1089#1087#1080#1089#1072#1085#1080#1081' '#1069#1050' '#1085#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1072#1074#1090#1086
      '                 select Expense.Auto_Id,'
      '                        Expense.Auto_Inst,'
      '                        Expense.Employ_Id,'
      '                        Expense.Employ_Inst,'
      '                        Oil_NP_Group.Id as NP_Id,'
      '                        '#39#1055#1086' '#1101#1083'. '#1082#1072#1088#1090#1072#1084#39' as Refuel_Type_Name,'
      '                        - Expense.Litr as BeginRest,'
      '                        to_number(null) as OutLitr,'
      '                        to_number(null) as Refuel,'
      '                        to_number(null) as EndRest'
      '                   from v_Card_Equal Expense, Oil_NP_Group'
      '                  where trunc(Expense.Oper_Date) < :BeginDate'
      
        '                    and (Expense.Employ_Id = :EmpId or :EmpId = ' +
        '0)'
      
        '                    and (Expense.Employ_Inst = :EmpInst or :EmpI' +
        'nst = 0)'
      
        '                    and (Expense.Auto_Id = :AutoId or :AutoId = ' +
        '0)'
      
        '                    and (Expense.Auto_Inst = :AutoInst or :AutoI' +
        'nst = 0)'
      '                    and CardAlign = 0'
      '                    and Expense.NP_Type = Oil_NP_Group.Petrol_Id'
      '                    and Expense.Auto_Id is not null'
      '                    and :SelectCard <> 0'
      '                  union all'
      '                 select TalOut.Auto_Id,'
      '                        TalOut.Auto_Inst,'
      '                        TalOut.Employ_Id,'
      '                        TalOut.Employ_Inst,'
      '                        TalOut.NPGrp_Id as NP_Id,'
      '                        '#39#1055#1086' '#1090#1072#1083#1086#1085#1072#1084#39' as Refuel_Type_Name,'
      '                        TalOut.Nominal as BeginRest,'
      '                        to_number(null) as OutLitr,'
      '                        to_number(null) as Refuel,'
      '                        to_number(null) as EndRest'
      '                   from (select /*+NO_MERGE*/'
      '                                Ser, Num, max(SamDate) MaxDate'
      
        '                           from (select Ser, Num, decode(Tip, '#39'P' +
        #39', Date_ + 0.1, Date_) as SamDate'
      '                                   from V_Oil_Talon_Op'
      
        '                                  where Date_ < :BeginDate) TalM' +
        'ax'
      
        '                          group by Ser, Num) TalMax, V_Oil_Talon' +
        '_Op TalOut'
      '                  where Tip = '#39'O'#39
      '                    and TalMax.Ser = TalOut.Ser'
      '                    and TalMax.Num = TalOut.Num'
      '                    and TalMax.MaxDate = TalOut.Date_'
      
        '                    and (TalOut.Employ_Id = :EmpId or :EmpId = 0' +
        ')'
      
        '                    and (TalOut.Employ_Inst = :EmpInst or :EmpIn' +
        'st = 0)'
      
        '                    and (TalOut.Auto_Id = :AutoId or :AutoId = 0' +
        ')'
      
        '                    and (TalOut.Auto_Inst = :AutoInst or :AutoIn' +
        'st = 0)'
      '                    and TalOut.Auto_Id is not null'
      '                    and :SelectTalon <> 0'
      '                  union all'
      '                 select Receipt.Auto_Id,'
      '                        Receipt.Auto_Inst,'
      '                        Receipt.Employ_Id,'
      '                        Receipt.Employ_Inst,'
      '                        Oil_NP_Group.Id as NP_Id,'
      '                        '#39#1055#1086' '#1101#1083'. '#1082#1072#1088#1090#1072#1084#39' as Refuel_Type_Name,'
      '                        to_number(null) as BeginRest,'
      '                        Receipt.Litr as OutLitr,'
      '                        to_number(null) as Refuel,'
      '                        to_number(null) as EndRest'
      '                   from v_Card_Receipts Receipt, Oil_NP_Group'
      '                  where trunc(Receipt.Oper_Date) >= :BeginDate'
      '                    and trunc(Receipt.Oper_Date) <= :EndDate'
      
        '                    and (Receipt.Employ_Id = :EmpId or :EmpId = ' +
        '0)'
      
        '                    and (Receipt.Employ_Inst = :EmpInst or :EmpI' +
        'nst = 0)'
      
        '                    and (Receipt.Auto_Id = :AutoId or :AutoId = ' +
        '0)'
      
        '                    and (Receipt.Auto_Inst = :AutoInst or :AutoI' +
        'nst = 0)'
      '                    and Receipt.CardAlign = 0'
      '                    and Receipt.NP_Type = Oil_NP_Group.Petrol_Id'
      '                    and Receipt.Auto_Id is not null'
      '                    and :SelectCard <> 0'
      '                  union all'
      '                 select TalOut.Auto_Id,'
      '                        TalOut.Auto_Inst,'
      '                        TalOut.Employ_Id,'
      '                        TalOut.Employ_Inst,'
      '                        TalOut.NPGrp_Id as NP_Id,'
      '                        '#39#1055#1086' '#1090#1072#1083#1086#1085#1072#1084#39' as Refuel_Type_Name,'
      '                        to_number(null) as BeginRest,'
      '                        TalOut.Nominal as OutLitr,'
      '                        to_number(null) as Refuel,'
      '                        to_number(null) as EndRest'
      '                   from V_Oil_Talon_Op TalOut'
      '                  where Tip = '#39'O'#39' '
      
        '                    and trunc(TalOut.Date_) between :BeginDate a' +
        'nd :EndDate'
      '                    and TalOut.Id = TalOut.Head_Id'
      '                    and TalOut.Inst = TalOut.Head_Inst'
      
        '                    and (TalOut.Employ_Id = :EmpId or :EmpId = 0' +
        ')'
      
        '                    and (TalOut.Employ_Inst = :EmpInst or :EmpIn' +
        'st = 0)'
      
        '                    and (TalOut.Auto_Id = :AutoId or :AutoId = 0' +
        ')'
      
        '                    and (TalOut.Auto_Inst = :AutoInst or :AutoIn' +
        'st = 0)'
      '                    and TalOut.Auto_Id is not null'
      '                    and :SelectTalon <> 0'
      '                  union all'
      '                 select /*+ORDERED*/'
      '                        Refuel.Auto_Id,'
      '                        Refuel.Auto_Inst,'
      '                        Refuel.Employ_Id,'
      '                        Refuel.Employ_Inst,'
      '                        Refuel.NPGrp_Id,'
      '                        Refuel.Refuel_Type_Name,'
      '                        to_number(null) as BeginRest,'
      '                        to_number(null) as OutLitr,'
      '                        Refuel.Litr as Refuel,'
      '                        to_number(null) as EndRest'
      '                   from v_Oil_Own_Refuel Refuel'
      '                  where trunc(Refuel.Exp_Date) >= :BeginDate'
      '                    and trunc(Refuel.Exp_Date) <= :EndDate'
      
        '                    and (Refuel.Employ_Id = :EmpId or :EmpId = 0' +
        ')'
      
        '                    and (Refuel.Employ_Inst = :EmpInst or :EmpIn' +
        'st = 0)'
      
        '                    and (Refuel.Auto_Id = :AutoId or :AutoId = 0' +
        ')'
      
        '                    and (Refuel.Auto_Inst = :AutoInst or :AutoIn' +
        'st = 0)'
      '                    and Refuel.Auto_Id is not null'
      
        '                    and (Refuel.CardAlign <> 1 or Refuel.CardAli' +
        'gn is null)'
      
        '                    and ((:SelectVedomost <> 0 and Refuel.Refuel' +
        '_Type = 1)'
      
        '                      or (:SelectCard <> 0 and Refuel.Refuel_Typ' +
        'e in (2, 3))'
      
        '                      or (:SelectTalon <> 0 and Refuel.Refuel_Ty' +
        'pe = 4)'
      
        '                      or (:SelectNB <> 0 and Refuel.Refuel_Type ' +
        '= 5)'
      
        '                      or (:SelectNal <> 0 and Refuel.Refuel_Type' +
        ' = 6))'
      '                  union all'
      '                 -- '#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' '#1069#1050' '#1085#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1072#1074#1090#1086
      '                 select Receipt.Auto_Id,'
      '                        Receipt.Auto_Inst,'
      '                        Receipt.Employ_Id,'
      '                        Receipt.Employ_Inst,'
      '                        Oil_NP_Group.Id as NP_Id,'
      '                        '#39#1055#1086' '#1101#1083'. '#1082#1072#1088#1090#1072#1084#39' as Refuel_Type_Name,'
      '                        to_number(null) as BeginRest,'
      '                        to_number(null) as OutLitr,'
      '                        to_number(null) as Refuel,'
      '                        Receipt.Litr as EndRest'
      '                   from v_Card_Receipts Receipt, Oil_NP_Group'
      '                  where trunc(Receipt.Oper_Date) <= :EndDate'
      
        '                    and (Receipt.Employ_Id = :EmpId or :EmpId = ' +
        '0)'
      
        '                    and (Receipt.Employ_Inst = :EmpInst or :EmpI' +
        'nst = 0)'
      
        '                    and (Receipt.Auto_Id = :AutoId or :AutoId = ' +
        '0)'
      
        '                    and (Receipt.Auto_Inst = :AutoInst or :AutoI' +
        'nst = 0)'
      '                    and Receipt.NP_Type = Oil_NP_Group.Petrol_Id'
      '                    and Receipt.Auto_Id is not null'
      '                    and :SelectCard <> 0'
      '                    and Receipt.CardAlign = 0'
      '                  union all'
      '                 -- '#1042#1099#1073#1086#1088#1082#1072' '#1089#1087#1080#1089#1072#1085#1080#1081' '#1069#1050' '#1085#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1072#1074#1090#1086
      '                 select Expense.Auto_Id,'
      '                        Expense.Auto_Inst,'
      '                        Expense.Employ_Id,'
      '                        Expense.Employ_Inst,'
      '                        Oil_NP_Group.Id as NP_Id,'
      '                        '#39#1055#1086' '#1101#1083'. '#1082#1072#1088#1090#1072#1084#39' as Refuel_Type_Name,'
      '                        to_number(null) as BeginRest,'
      '                        to_number(null) as OutLitr,'
      '                        to_number(null) as Refuel,'
      '                        - Expense.Litr as EndRest'
      '                   from v_Card_Equal Expense, Oil_NP_Group'
      '                  where trunc(Expense.Oper_Date) <= :EndDate'
      
        '                    and (Expense.Employ_Id = :EmpId or :EmpId = ' +
        '0)'
      
        '                    and (Expense.Employ_Inst = :EmpInst or :EmpI' +
        'nst = 0)'
      
        '                    and (Expense.Auto_Id = :AutoId or :AutoId = ' +
        '0)'
      
        '                    and (Expense.Auto_Inst = :AutoInst or :AutoI' +
        'nst = 0)'
      '                    and Expense.NP_Type = Oil_NP_Group.Petrol_Id'
      '                    and Expense.Auto_Id is not null'
      '                    and Expense.CardAlign = 0'
      '                    and :SelectCard <> 0'
      '                  union all'
      '                 select TalOut.Auto_Id,'
      '                        TalOut.Auto_Inst,'
      '                        TalOut.Employ_Id,'
      '                        TalOut.Employ_Inst,'
      '                        TalOut.NPGrp_Id as NP_Id,'
      '                        '#39#1055#1086' '#1090#1072#1083#1086#1085#1072#1084#39' as Refuel_Type_Name,'
      '                        to_number(null) as BeginRest,'
      '                        to_number(null) as OutLitr,'
      '                        to_number(null) as Refuel,'
      '                        TalOut.Nominal as EndRest'
      '                   from (select /*+NO_MERGE*/'
      '                                Ser, Num, max(SamDate) MaxDate'
      
        '                           from (select Ser, Num, decode(Tip, '#39'P' +
        #39', Date_ + 0.1, Date_) as SamDate'
      '                                   from V_Oil_Talon_Op'
      
        '                                  where Date_ <= :EndDate) TalMa' +
        'x'
      
        '                          group by Ser, Num) TalMax, V_Oil_Talon' +
        '_Op TalOut'
      '                  where Tip = '#39'O'#39
      '                    and TalMax.Ser = TalOut.Ser'
      '                    and TalMax.Num = TalOut.Num'
      '                    and TalMax.MaxDate = TalOut.Date_'
      
        '                    and (TalOut.Employ_Id = :EmpId or :EmpId = 0' +
        ')'
      
        '                    and (TalOut.Employ_Inst = :EmpInst or :EmpIn' +
        'st = 0)'
      
        '                    and (TalOut.Auto_Id = :AutoId or :AutoId = 0' +
        ')'
      
        '                    and (TalOut.Auto_Inst = :AutoInst or :AutoIn' +
        'st = 0)'
      '                    and TalOut.Auto_Id is not null'
      '                    and :SelectTalon <> 0) AutoNPMove,'
      
        '                Oil_NP_Group, Oil_Employ, Oil_Auto, Oil_Auto_Typ' +
        'e, Oil_Auto_Group,'
      
        '                (select Id, Inst, name from v_org where Id = :De' +
        'pId and  Inst = :DepInst and id=inst and org_type in (3,4)'
      '                  union all'
      
        '                 select par, Par_Inst, name from v_org where Id ' +
        '= :DepId and Inst = :DepInst  and id=inst and org_type in (3,4)'
      '                  union all'
      
        '                 select Id, Inst, name from v_org where Par = :D' +
        'epId and Par_Inst = :DepInst  and id=inst and org_type in (3,4))' +
        ' Dep'
      '          where AutoNPMove.NP_Id = Oil_NP_Group.Id'
      '            and AutoNPMove.Employ_Id = Oil_Employ.Id'
      '            and AutoNPMove.Employ_Inst = Oil_Employ.Inst'
      '            and AutoNPMove.Auto_Id = Oil_Auto.Id'
      '            and AutoNPMove.Auto_Inst = Oil_Auto.Inst'
      '            and Oil_Auto.Auto_Type_Id = Oil_Auto_Type.Id (+)'
      '            and Oil_Auto_Type.Auto_Group = Oil_Auto_Group.Id (+)'
      '            and Oil_Auto.Inst = Dep.Id(+)'
      '            and Oil_Auto.Inst = Dep.Inst(+)'
      '            )'
      
        '  group by dep_name,Employ_Name, Auto_Number, Auto_Type_Name, Au' +
        'to_Group_Name, NP_Name, Refuel_Type_Name'
      ' having nvl(sum(BeginRest), 0) <> 0'
      '     or nvl(sum(OutLitr), 0) <> 0'
      '     or nvl(sum(RefuelLitr), 0) <> 0'
      '     or nvl(sum(EndRest), 0) <> 0'
      
        '  order by Employ_Name, Auto_Number, Auto_Type_Name, Auto_Group_' +
        'Name, NP_Name, Refuel_Type_Name')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 225
    Top = 260
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftInteger
        Name = 'EmpId'
      end
      item
        DataType = ftInteger
        Name = 'EmpInst'
      end
      item
        DataType = ftInteger
        Name = 'AutoId'
      end
      item
        DataType = ftInteger
        Name = 'AutoInst'
      end
      item
        DataType = ftBoolean
        Name = 'SelectCard'
      end
      item
        DataType = ftBoolean
        Name = 'SelectTalon'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end
      item
        DataType = ftBoolean
        Name = 'SelectVedomost'
      end
      item
        DataType = ftBoolean
        Name = 'SelectNB'
      end
      item
        DataType = ftBoolean
        Name = 'SelectNal'
      end
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end>
  end
end
