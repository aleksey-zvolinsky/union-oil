inherited ACForm: TACForm
  Left = 481
  Top = 390
  Width = 377
  Height = 198
  Caption = #1040#1074#1090#1086#1082#1072#1083#1100#1082#1091#1083#1103#1094#1080#1103
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object rgTypeCharge: TRadioGroup
    Left = 0
    Top = 37
    Width = 129
    Height = 93
    Align = alLeft
    Caption = ' '#1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1072' '
    ItemIndex = 0
    Items.Strings = (
      'H'#1072#1083#1080#1095#1085#1099#1081' '#1088#1072#1089#1095#1077#1090
      #1055#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      #1058#1072#1083#1086#1085#1099
      #1050#1072#1088#1090#1086#1095#1082#1080
      #1064#1090#1091#1095#1085#1099#1081' '#1090#1086#1074#1072#1088)
    TabOrder = 0
    OnClick = rgTypeChargeClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 130
    Width = 369
    Height = 34
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      369
      34)
    object hbSht: TOilHelpButton
      Left = 4
      Top = 6
      Width = 25
      Height = 25
      AllowAllUp = True
      GroupIndex = 1001
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B000000FF007B7B7B00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000FF000000FF0000FF
        FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF007B7B7B000000FF007B7B7B00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF0000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000FF007B7B7B0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000FF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFF
        FF0000FFFF00FFFFFF007B7B7B007B7B7B0000FFFF00FFFFFF007B7B7B000000
        FF000000FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF000000FF000000FF00FFFFFF0000FFFF007B7B7B000000
        FF000000FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000FFFF00FFFFFF000000FF000000FF007B7B7B00FFFFFF007B7B7B000000
        FF000000FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF000000FF000000FF000000FF000000FF000000
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000FF000000FF000000FF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Visible = False
      AnimateTime = 200
      Lines.Strings = (
        '\B{12}'#1040#1042#1058#1054#1050#1040#1051#1068#1050#1059#1051#1071#1062#1048#1071' '#1064#1058#1059#1063#1053#1054#1043#1054' '#1058#1054#1042#1040#1056#1040'\D{10}'
        ''
        #1044#1083#1103' '#1091#1076#1086#1073#1089#1090#1074#1072' '#1074#1074#1086#1076#1072' '#1089#1076#1077#1083#1072#1085#1086' '#1089#1083#1077#1076#1091#1102#1097#1077#1077':'
        ''
        '- '#1087#1088#1080' '#1074#1099#1073#1086#1088#1077' '#1090#1086#1074#1072#1088#1072' '#1086#1090#1086#1073#1088#1072#1078#1072#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1090#1077' '#1090#1086#1074#1072#1088#1099', '#1082#1086#1090#1086#1088#1099#1077' '#1077#1089#1090#1100
        '  '#1074' '#1088#1077#1076#1072#1082#1090#1080#1088#1091#1077#1084#1086#1084' '#1089#1084#1077#1085#1085#1086#1084' '#1086#1090#1095#1077#1090#1077
        
          '- '#1076#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1090#1086#1074#1072#1088#1072' '#1086#1090#1086#1073#1088#1072#1078#1072#1077#1090#1089#1103' '#1094#1077#1085#1072', '#1074#1079#1103#1090#1072#1103' '#1080#1079' '#1089#1084#1077#1085#1085#1086#1075#1086' '#1086#1090#1095#1077#1090 +
          #1072
        
          '- '#1087#1088#1080' '#1087#1086#1074#1090#1086#1088#1085#1086#1084' '#1086#1090#1082#1088#1099#1090#1080#1080' '#1089#1086#1093#1088#1072#1085#1103#1077#1090#1089#1103' '#1089#1086#1089#1090#1086#1103#1085#1080#1077' '#1092#1080#1083#1100#1090#1088#1086#1074' '#1080' '#1079#1072#1076#1072#1085#1085 +
          #1099#1081
        '  '#1087#1086#1088#1103#1076#1086#1082' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080', '#1087#1088#1080' '#1101#1090#1086#1084' '#1082#1091#1088#1089#1086#1088' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1089#1090#1072#1074#1080#1090#1089#1103' '#1085#1072
        '  '#1089#1083#1077#1076#1091#1102#1097#1091#1102' '#1087#1086#1079#1080#1094#1080#1102
        '- '#1074' '#1087#1086#1083#1077' "'#1050#1086#1083'-'#1074#1086'" '#1076#1077#1081#1089#1090#1074#1091#1102#1090' '#1089#1083#1077#1076#1091#1102#1097#1080#1077' '#1075#1086#1088#1103#1095#1080#1077' '#1082#1083#1072#1074#1080#1096#1080':'
        '  \BEnter\D: '#1101#1082#1074#1080#1074#1072#1083#1077#1085#1090#1085#1086' '#1085#1072#1078#1072#1090#1080#1102' '#1082#1085#1086#1087#1082#1080' \B"'#1042#1099#1087#1086#1083#1085#1080#1090#1100'"\D'
        '  \BPage Up\D: '#1074#1099#1073#1080#1088#1072#1077#1090' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1090#1086#1074#1072#1088
        '  \BPage Down\D: '#1074#1099#1073#1080#1088#1072#1077#1090' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1090#1086#1074#1072#1088
        ''
        
          #1045#1089#1083#1080' '#1085#1072#1087#1088#1080#1084#1077#1088' '#1074' "'#1073#1091#1084#1072#1078#1085#1086#1084'" '#1089#1084#1077#1085#1085#1086#1084' '#1086#1090#1095#1077#1090#1077' '#1089' '#1040#1047#1057' '#1089#1080#1075#1072#1088#1077#1090#1099' '#1088#1072#1089#1087#1086#1083#1086 +
          #1078#1077#1085#1099
        
          #1074' '#1087#1086#1088#1103#1076#1082#1077' '#1091#1073#1099#1074#1072#1085#1080#1103' '#1094#1077#1085', '#1090#1086' '#1091#1076#1086#1073#1085#1086' '#1087#1088#1080' '#1074#1099#1073#1086#1088#1077' '#1090#1086#1074#1072#1088#1072' '#1074#1099#1073#1088#1072#1090#1100' '#1087#1086#1076#1075 +
          #1088#1091#1087#1087#1091
        
          #1089#1086#1087#1091#1090#1089#1090#1074#1091#1102#1097#1077#1075#1086' '#1090#1086#1074#1072#1088#1072' "'#1057#1080#1075#1072#1088#1077#1090#1099'", '#1086#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1094#1077#1085#1072#1084' '#1080' '#1087#1086#1089#1083#1077 +
          ' '#1101#1090#1086#1075#1086
        #1074#1073#1080#1074#1072#1090#1100' '#1074' '#1087#1086#1083#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1096#1090#1091#1082#1080', '#1085#1072#1078#1080#1084#1072#1090#1100' \BEnter\D '#1080' '#1073#1086#1083#1100#1096#1077' '#1085#1077
        
          #1086#1090#1074#1083#1077#1082#1072#1090#1100#1089#1103' '#1085#1072' '#1074#1099#1073#1086#1088' '#1090#1086#1074#1072#1088#1072', '#1090#1072#1082' '#1082#1072#1082' '#1087#1086' '#1082#1072#1078#1076#1086#1084#1091' '#1085#1072#1078#1072#1090#1080#1102' '#1072#1074#1090#1086#1084#1072#1090#1080 +
          #1095#1077#1089#1082#1080
        #1074#1099#1073#1080#1088#1072#1077#1090#1089#1103' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1090#1086#1074#1072#1088'. ')
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'MS Sans Serif'
      HeaderFont.Style = []
      Animate = False
      UseCurrentDir = False
      FormOrientation = fBottomToTop
      Images = MainForm.il
      ImageIndex = 0
    end
    object BitBtn1: TBitBtn
      Left = 184
      Top = 5
      Width = 88
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1042#1099#1087#1086#1083#1085#1080#1090#1100
      TabOrder = 0
      OnClick = BitBtn1Click
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
      Left = 275
      Top = 5
      Width = 89
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&'#1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = BitBtn2Click
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
  end
  object GroupBox1: TGroupBox
    Left = 129
    Top = 37
    Width = 240
    Height = 93
    Align = alClient
    TabOrder = 2
    DesignSize = (
      240
      93)
    object Label1: TLabel
      Left = 12
      Top = 17
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = #1042#1080#1076' '#1053#1055':'
    end
    object Label2: TLabel
      Left = 22
      Top = 68
      Width = 29
      Height = 13
      Caption = #1062#1077#1085#1072':'
    end
    object Label3: TLabel
      Left = 16
      Top = 42
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = #1051#1080#1090#1088#1099':'
    end
    object ceNPGrp: TComboEdit
      Left = 56
      Top = 12
      Width = 176
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ceNPGrpButtonClick
      OnDblClick = ceNPGrpButtonClick
      OnKeyPress = ceNPGrpKeyPress
    end
    object ePrice: TEdit
      Left = 56
      Top = 64
      Width = 176
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnExit = ePriceExit
    end
    object eLitr: TEdit
      Left = 56
      Top = 38
      Width = 176
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnExit = eLitrExit
      OnKeyDown = eLitrKeyDown
      OnKeyPress = eLitrKeyPress
    end
  end
  object grbOrg: TGroupBox
    Left = 0
    Top = 0
    Width = 369
    Height = 37
    Align = alTop
    Enabled = False
    TabOrder = 3
    DesignSize = (
      369
      37)
    object lClient: TLabel
      Left = 5
      Top = 14
      Width = 69
      Height = 13
      Caption = #1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100':'
    end
    object ceClient: TComboEdit
      Left = 77
      Top = 10
      Width = 282
      Height = 21
      Hint = #1042' '#1101#1090#1086#1084' '#1087#1086#1083#1077' '#1091#1082#1072#1078#1080#1090#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102' '#1076#1083#1103' '#1082#1086#1090#1086#1088#1086#1081' '#1089#1090#1088#1086#1080#1090#1100#1089#1103' '#1086#1090#1095#1077#1090
      Color = clSilver
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnButtonClick = ceClientButtonClick
      OnDblClick = ceClientButtonClick
    end
  end
end