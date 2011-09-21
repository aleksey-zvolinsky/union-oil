inherited PrihCardForm: TPrihCardForm
  Left = 281
  Top = 232
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 368
  ClientWidth = 743
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 334
    Width = 743
    Height = 34
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    DesignSize = (
      743
      34)
    object bbOk: TBitBtn
      Left = 560
      Top = 5
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1080#1085#1103#1090#1100
      Default = True
      TabOrder = 0
      OnClick = bbOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
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
    object bbCancel: TBitBtn
      Left = 652
      Top = 5
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object gbMain: TGroupBox
    Left = 0
    Top = 0
    Width = 332
    Height = 334
    Align = alLeft
    Caption = #1058#1088#1072#1085#1079#1072#1082#1094#1080#1103
    TabOrder = 1
    object pTransaction: TPanel
      Left = 2
      Top = 15
      Width = 328
      Height = 146
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        328
        146)
      object Label2: TLabel
        Left = 2
        Top = 6
        Width = 60
        Height = 13
        Anchors = [akTop, akRight]
        BiDiMode = bdLeftToRight
        Caption = #8470' '#1082#1072#1088#1090#1086#1095#1082#1080
        ParentBiDiMode = False
      end
      object Label10: TLabel
        Left = 12
        Top = 105
        Width = 50
        Height = 13
        Anchors = [akTop, akRight]
        BiDiMode = bdLeftToRight
        Caption = #1054#1087#1077#1088#1072#1094#1080#1103
        ParentBiDiMode = False
      end
      object Label12: TLabel
        Left = 46
        Top = 130
        Width = 16
        Height = 13
        Anchors = [akTop, akRight]
        BiDiMode = bdLeftToRight
        Caption = #1053#1055
        ParentBiDiMode = False
      end
      object Label13: TLabel
        Left = 176
        Top = 130
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #1051#1080#1090#1088#1099
      end
      object lDoc: TLabel
        Left = 18
        Top = 79
        Width = 44
        Height = 13
        Anchors = [akTop, akRight]
        BiDiMode = bdLeftToRight
        Caption = #1044#1086#1075#1086#1074#1086#1088
        ParentBiDiMode = False
      end
      object Label17: TLabel
        Left = 36
        Top = 31
        Width = 26
        Height = 13
        Anchors = [akTop, akRight]
        BiDiMode = bdLeftToRight
        Caption = #1062#1077#1085#1072
        ParentBiDiMode = False
      end
      object Label18: TLabel
        Left = 183
        Top = 6
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #1044#1072#1090#1072
      end
      object Label19: TLabel
        Left = 176
        Top = 31
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #1042#1088#1077#1084#1103
      end
      object Label3: TLabel
        Left = 198
        Top = 79
        Width = 11
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #1086#1090
      end
      object sbClearDoc: TSpeedButton
        Left = 300
        Top = 74
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
        OnClick = sbDocClick
      end
      object eCardNumber: TDBEdit
        Left = 67
        Top = 1
        Width = 105
        Height = 21
        Color = clBtnFace
        DataField = 'GR_CARD_NUM'
        DataSource = PrihCardRefForm.ds
        ReadOnly = True
        TabOrder = 0
      end
      object eCause: TDBEdit
        Left = 67
        Top = 100
        Width = 256
        Height = 21
        Color = clBtnFace
        DataField = 'Cause_Name'
        DataSource = PrihCardRefForm.ds
        ReadOnly = True
        TabOrder = 6
      end
      object eNpType: TDBEdit
        Left = 67
        Top = 125
        Width = 105
        Height = 21
        Color = clBtnFace
        DataField = 'NPTYPE'
        DataSource = PrihCardRefForm.ds
        ReadOnly = True
        TabOrder = 7
      end
      object deLitr: TDBEdit
        Left = 211
        Top = 125
        Width = 112
        Height = 21
        Color = clBtnFace
        DataField = 'COUNT_LITR'
        DataSource = PrihCardRefForm.ds
        TabOrder = 8
      end
      object deDate: TDBDateEdit
        Left = 211
        Top = 1
        Width = 112
        Height = 21
        DataField = 'DATE_'
        DataSource = PrihCardRefForm.ds
        Color = clBtnFace
        NumGlyphs = 2
        TabOrder = 2
        YearDigits = dyFour
      end
      object eDogPrice: TDBEdit
        Left = 67
        Top = 26
        Width = 105
        Height = 21
        DataField = 'PRICE_DOG_NDS'
        DataSource = PrihCardRefForm.ds
        TabOrder = 1
      end
      object deDocDate: TDBDateEdit
        Left = 211
        Top = 75
        Width = 88
        Height = 21
        DataField = 'DOG_DATE'
        DataSource = PrihCardRefForm.ds
        ReadOnly = True
        NumGlyphs = 2
        TabOrder = 5
        YearDigits = dyFour
      end
      object deTime: TDBEdit
        Left = 211
        Top = 26
        Width = 112
        Height = 21
        Color = clBtnFace
        DataField = 'TIME_'
        DataSource = PrihCardRefForm.ds
        TabOrder = 3
      end
      object ceDocNum: TRxDBComboEdit
        Left = 67
        Top = 75
        Width = 130
        Height = 21
        DataField = 'DOG_NUM'
        DataSource = PrihCardRefForm.ds
        GlyphKind = gkEllipsis
        ButtonWidth = 16
        NumGlyphs = 1
        ReadOnly = True
        TabOrder = 4
        OnButtonClick = ceDocNumButtonClick
        OnDblClick = ceDocNumButtonClick
      end
      object cbDocOP: TCheckBox
        Left = 67
        Top = 56
        Width = 253
        Height = 17
        Caption = #1054#1090#1083#1086#1078#1077#1085#1085#1086#1077' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1077' '#1085#1072' '#1085#1077#1092#1090#1077#1073#1072#1079#1077
        TabOrder = 9
        OnClick = cbDocOPClick
      end
    end
    object gbCorrection: TGroupBox
      Left = 2
      Top = 161
      Width = 328
      Height = 40
      Align = alBottom
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
      TabOrder = 1
      object sbEditField: TSpeedButton
        Left = 67
        Top = 12
        Width = 111
        Height = 23
        Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          777777000000000007777733333333333077773FBBBBBBBB3077773F33333337
          3077773FBBBBBBBB3077773F333333373077773FBBBBBBBB3077773FFFFFFFFF
          3077777333333333307777773033333037777777307777307777777730777730
          7777777737077330777777777370030777777777773333777777}
        OnClick = sbEditFieldClick
      end
      object sbUndoField: TSpeedButton
        Left = 183
        Top = 12
        Width = 111
        Height = 23
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100
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
        OnClick = sbUndoFieldClick
      end
      object OilHelpButton1: TOilHelpButton
        Left = 299
        Top = 12
        Width = 25
        Height = 23
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
        AnimateTime = 200
        Lines.Strings = (
          '{12}{RED}\B'#1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080'\D{10}'
          ''
          
            '   '#1044#1083#1103' '#1082#1086#1088#1088#1077#1082#1080#1090#1080#1088#1086#1074#1082#1080' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1085#1072#1078#1072#1090#1100' '#1082#1085#1086#1087#1082#1091' "'#1056#1072#1079#1088#1077 +
            #1096#1080#1090#1100' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1091'". '#1055#1088#1080' '#1101#1090#1086#1084' '#1085#1077#1086#1073#1093#1086#1076#1084#1086' '#1074#1074#1077#1089#1090#1080' '#1087#1072#1088#1086#1083#1100', '#1082#1086#1090#1086#1088#1099#1081' '#1084 +
            #1086#1078#1085#1086' '#1087#1086#1083#1091#1095#1080#1090#1100' '#1091' '#1088#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1086#1074'.'
          ''
          
            '   '#1055#1086#1089#1083#1077' '#1074#1074#1086#1076#1072' '#1087#1072#1088#1086#1083#1103' '#1086#1090#1082#1088#1086#1077#1090#1089#1103' '#1076#1086#1089#1090#1091#1087' '#1082' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1102' '#1087#1086#1083#1077#1081' "'#1044 +
            #1072#1090#1072'", "'#1042#1088#1077#1084#1103'", "'#1051#1080#1090#1088#1099'". '#1044#1083#1103' '#1086#1090#1084#1077#1085#1099' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1085#1072#1078#1072 +
            #1090#1100' '#1082#1085#1086#1087#1082#1091' "'#1054#1090#1084#1077#1085#1080#1090#1100' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1091'".'
          ''
          
            '   '#1055#1088#1080' '#1086#1090#1084#1077#1085#1077' '#1073#1091#1076#1091#1090' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1099' '#1087#1077#1088#1074#1086#1085#1072#1095#1072#1083#1100#1085#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1087#1086#1083#1077#1081'.' +
            ' '#1054#1087#1077#1088#1072#1094#1080#1103' '#1086#1090#1084#1077#1085#1099' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080' '#1076#1086#1089#1090#1091#1087#1085#1072' '#1074' '#1083#1102#1073#1086#1077' '#1074#1088#1077#1084#1103', '#1076#1072#1078#1077' '#1087#1086#1089#1083 +
            #1077' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1092#1086#1088#1084#1099' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080'.'
          ''
          
            '   '#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100', '#1087#1088#1086#1080#1079#1074#1086#1076#1103#1097#1080#1081' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1091', '#1080' '#1079#1085#1072#1095#1077#1085#1080#1103', '#1082#1086#1090#1086#1088#1099#1077 +
            ' '#1086#1085' '#1074#1074#1086#1076#1080#1090' '#1089#1086#1093#1088#1072#1085#1103#1102#1090#1089#1103' '#1074' '#1073#1072#1079#1077'.'
          ''
          
            '   '#1058#1088#1072#1085#1079#1072#1082#1094#1080#1080', '#1082#1086#1090#1086#1088#1099#1077' '#1087#1086#1076#1074#1077#1088#1075#1083#1080#1089#1100' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1077' '#1073#1091#1076#1091#1090' '#1086#1090#1084#1077#1095#1077#1085#1099' ' +
            #1086#1090#1076#1077#1083#1100#1085#1099#1084' '#1094#1074#1077#1090#1086#1084'.'
          ''
          
            '   '#1042#1053#1048#1052#1040#1053#1048#1045'. '#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1094#1077#1085#1091' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103' '#1080' '#1076#1072#1090#1091'/'#1085#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090 +
            #1072' '#1084#1086#1078#1085#1086' '#1073#1077#1079' '#1074#1074#1086#1076#1072' '#1087#1072#1088#1086#1083#1103'. '#1055#1088#1080' '#1086#1090#1084#1077#1085#1077' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080' '#1080#1079#1084#1077#1085#1077#1085#1085#1099#1077' '#1079#1085 +
            #1072#1095#1077#1085#1080#1103' '#1101#1090#1080#1093' '#1087#1086#1083#1077#1081' '#1085#1077' '#1074#1086#1089#1089#1090#1072#1085#1072#1074#1083#1080#1074#1072#1102#1090#1089#1103'.  '
          ' '
          ' ')
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
    end
    object gbDov: TGroupBox
      Left = 2
      Top = 201
      Width = 328
      Height = 64
      Align = alBottom
      Caption = #1044#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100
      TabOrder = 2
      DesignSize = (
        328
        64)
      object sbDelDov: TSpeedButton
        Left = 300
        Top = 37
        Width = 23
        Height = 22
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1086' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
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
        ParentShowHint = False
        ShowHint = True
        OnClick = sbDelDovClick
      end
      object Label16: TLabel
        Left = 198
        Top = 18
        Width = 11
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #1086#1090
      end
      object Label15: TLabel
        Left = 117
        Top = 18
        Width = 11
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #8470
      end
      object Label14: TLabel
        Left = 31
        Top = 18
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        BiDiMode = bdLeftToRight
        Caption = #1057#1077#1088#1080#1103
        ParentBiDiMode = False
      end
      object Label4: TLabel
        Left = 30
        Top = 42
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        BiDiMode = bdLeftToRight
        Caption = #1063#1077#1088#1077#1079
        ParentBiDiMode = False
      end
      object deDovDate: TDBDateEdit
        Left = 211
        Top = 13
        Width = 112
        Height = 21
        DataField = 'DOV_DATE'
        DataSource = PrihCardRefForm.ds
        Color = clBtnFace
        Enabled = False
        NumGlyphs = 2
        TabOrder = 2
      end
      object eDovPerson: TDBEdit
        Left = 67
        Top = 38
        Width = 233
        Height = 21
        Color = clBtnFace
        DataField = 'DOV_WHO'
        DataSource = PrihCardRefForm.ds
        Enabled = False
        TabOrder = 3
      end
      object eDovNum: TDBEdit
        Left = 130
        Top = 13
        Width = 62
        Height = 21
        Color = clBtnFace
        DataField = 'DOV_NUM'
        DataSource = PrihCardRefForm.ds
        Enabled = False
        TabOrder = 1
      end
      object eDovSer: TDBEdit
        Left = 67
        Top = 13
        Width = 49
        Height = 21
        Color = clBtnFace
        DataField = 'DOV_SER'
        DataSource = PrihCardRefForm.ds
        Enabled = False
        TabOrder = 0
      end
    end
    object gbAuto: TGroupBox
      Left = 2
      Top = 265
      Width = 328
      Height = 67
      Align = alBottom
      Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1099#1081' '#1072#1074#1090#1086#1090#1088#1072#1085#1089#1087#1086#1088#1090
      TabOrder = 3
      DesignSize = (
        328
        67)
      object sbDelAuto: TSpeedButton
        Left = 300
        Top = 14
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
        OnClick = sbDelAutoClick
      end
      object sbDelDriver: TSpeedButton
        Left = 300
        Top = 39
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
        OnClick = sbDelDriverClick
      end
      object Label7: TLabel
        Left = 43
        Top = 20
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        BiDiMode = bdLeftToRight
        Caption = #8470' '#1072#1074#1090#1086
        ParentBiDiMode = False
      end
      object Label8: TLabel
        Left = 3
        Top = 45
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        BiDiMode = bdLeftToRight
        Caption = #1060#1048#1054' '#1074#1086#1076#1080#1090#1077#1083#1103
        ParentBiDiMode = False
      end
      object dbceDriver: TRxDBComboEdit
        Left = 84
        Top = 40
        Width = 215
        Height = 21
        DataField = 'EMPLOY_NAME'
        DataSource = PrihCardRefForm.ds
        DirectInput = False
        GlyphKind = gkEllipsis
        ButtonWidth = 16
        NumGlyphs = 1
        TabOrder = 1
        OnButtonClick = dbceDriverButtonClick
        OnDblClick = dbceDriverButtonClick
      end
      object dbceAutoNumb: TRxDBComboEdit
        Left = 84
        Top = 15
        Width = 215
        Height = 21
        DataField = 'AUTO_NUMB'
        DataSource = PrihCardRefForm.ds
        DirectInput = False
        GlyphKind = gkEllipsis
        ButtonWidth = 16
        NumGlyphs = 1
        TabOrder = 0
        OnButtonClick = dbceAutoNumbButtonClick
        OnDblClick = dbceAutoNumbButtonClick
      end
    end
  end
  object gbWay: TGroupBox
    Left = 332
    Top = 0
    Width = 411
    Height = 334
    Align = alClient
    Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1082#1072#1088#1090#1099
    TabOrder = 2
    object dbg: TDBGridEh
      Left = 2
      Top = 15
      Width = 407
      Height = 317
      Align = alClient
      Ctl3D = False
      DataSource = dsCardDetail
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghClearSelection]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnGetCellParams = dbgGetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'TITLE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
          Width = 162
        end
        item
          EditButtons = <>
          FieldName = 'OPER_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Width = 111
        end
        item
          EditButtons = <>
          FieldName = 'PRICE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Width = 31
        end
        item
          EditButtons = <>
          FieldName = 'NP_GROUP_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1053#1055
          Width = 28
        end
        item
          EditButtons = <>
          FieldName = 'LITR'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1051#1080#1090#1088#1099
          Width = 44
        end>
    end
  end
  object qCardDetail: TOilQuery
    SQL.Strings = (
      
        'select t.*, decode(oper_type, 0, t.price_dog_nds, t.price_nds) a' +
        's price'
      '  from (select /*+ORDERED USE_NL(t, Oil_NP_Group, cause)*/'
      
        '         decode(oper_num, 3, 0, 4, 0, 5, 0, 6, 0, 1) as oper_typ' +
        'e,'
      '         cause.cause_name as Title,'
      '         t.Oper_Date,'
      '         Oil_NP_Group.Name as NP_Group_Name,'
      '         t.Count_Litr as Litr,'
      '         t.price_dog_nds,'
      '         t.price_nds'
      
        '          from v_Card_Transaction t, Oil_NP_Group, card_cause ca' +
        'use'
      '         where t.Gr_Card_Num = :Gr_Card_Num'
      '           and t.NP_Type = Oil_NP_Group.Petrol_Id'
      '           and cause.id = t.oper_num'
      '           and oper_num > 2'
      '         order by Oil_NP_Group.Name, Oper_Date desc) t')
    MasterSource = PrihCardRefForm.ds
    AutoCalcFields = False
        DataSource = PrihCardRefForm.ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 396
    Top = 88
    ParamData = <
      item
        DataType = ftFloat
        Name = 'GR_CARD_NUM'
      end>
  end
  object dsCardDetail: TOraDataSource
    DataSet = qCardDetail
    Left = 410
    Top = 96
  end
  object qWork: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 9
    Top = 322
  end
  object qMC5: TOraQuery
    SQL.Strings = (
      'update &card_user.ecfil139'
      '   set data = :p_date,'
      '       vremya = :p_time,'
      '       summa_za_chto = :p_count_litr, '
      '       summa_chem_realno = :p_count_litr,'
      '       summa_zaproshenaya_chem = :p_count_litr'
      'where (nvl(:ID,0)<>0 and (OLDID = :ID))'
      '   or (nvl(:ID,0)=0  and TRN_GUID = :TRN_GUID)')
    Left = 400
    Top = 36
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p_date'
      end
      item
        DataType = ftInteger
        Name = 'p_time'
      end
      item
        DataType = ftFloat
        Name = 'p_count_litr'
      end
      item
        DataType = ftInteger
        Name = 'ID'
      end
      item
        DataType = ftString
        Name = 'TRN_GUID'
        Size = 32
      end>
    MacroData = <
      item
        Name = 'card_user'
      end>
  end
end
