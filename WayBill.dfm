inherited WayBillForm: TWayBillForm
  Left = 367
  Top = 277
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1055#1091#1090#1077#1074#1086#1081' '#1083#1080#1089#1090' ('#1072#1082#1090' '#1085#1072' '#1089#1087#1080#1089#1072#1085#1080#1077')'
  ClientHeight = 411
  ClientWidth = 606
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbWayBill: TGroupBox
    Left = 0
    Top = 0
    Width = 233
    Height = 376
    Align = alLeft
    Caption = #1055#1091#1090#1077#1074#1086#1081' '#1083#1080#1089#1090
    Constraints.MinWidth = 200
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 17
      Width = 218
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1087#1091#1090#1077#1074#1086#1075#1086' '#1083#1080#1089#1090#1072' ('#1072#1082#1090#1072' '#1085#1072' '#1089#1087#1080#1089#1072#1085#1080#1077') :'
    end
    object lblDate: TLabel
      Left = 8
      Top = 56
      Width = 210
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1091#1090#1077#1074#1086#1075#1086' '#1083#1080#1089#1090#1072' ('#1072#1082#1090#1072' '#1085#1072' '#1089#1087#1080#1089#1072#1085#1080#1077') :'
    end
    object lblEmploy: TLabel
      Left = 8
      Top = 133
      Width = 147
      Height = 13
      Caption = #1060#1048#1054' '#1074#1086#1076#1080#1090#1077#1083#1103' ('#1060#1048#1054' '#1052#1054#1051') :'
    end
    object lblAuto: TLabel
      Left = 8
      Top = 94
      Width = 121
      Height = 13
      Caption = #1058#1077#1093#1085#1080#1095#1077#1089#1082#1086#1077' '#1089#1088#1077#1076#1089#1090#1074#1086' :'
    end
    object lblNPGroup: TLabel
      Left = 8
      Top = 172
      Width = 79
      Height = 13
      Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090' :'
    end
    object sbClearEmploy: TSpeedButton
      Left = 205
      Top = 148
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
      OnClick = sbClearEmployClick
    end
    object sbClearNPGroup: TSpeedButton
      Left = 205
      Top = 186
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
      OnClick = sbClearNPGroupClick
    end
    object sbClearAuto: TSpeedButton
      Left = 205
      Top = 109
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
      OnClick = sbClearAutoClick
    end
    object lblCountLitr: TLabel
      Left = 8
      Top = 211
      Width = 107
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086'* '#1083#1080#1090#1088#1086#1074' :'
      Enabled = False
    end
    object lblAttention: TLabel
      Left = 5
      Top = 296
      Width = 224
      Height = 65
      Caption = 
        '* '#1044#1083#1103' '#1075#1088#1091#1087#1087#1099' "'#1043#1088#1091#1079#1086#1074#1086#1081' '#1080' '#1089#1087#1077#1094'. '#1090#1088#1072#1085#1089#1087#1086#1088#1090'" '#1074#1074#1086#1076' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1079#1072#1090#1088#1072#1095 +
        #1077#1085#1085#1099#1093' '#1083#1080#1090#1088#1086#1074' '#1080' '#1087#1088#1086#1081#1076#1077#1085#1085#1099#1093' '#1082#1080#1083#1086#1084#1077#1090#1088#1086#1074' '#1086#1089#1091#1097#1077#1089#1090#1074#1083#1103#1077#1090#1089#1103' '#1087#1091#1090#1105#1084' '#1088#1072#1079#1073#1088#1086 +
        #1089#1072' '#1087#1086' '#1075#1088#1091#1087#1087#1072#1084' '#1079#1072#1090#1088#1072#1090' '#1074' '#1087#1088#1072'- '#13#10#1074#1086#1081' '#1095#1072#1089#1090#1080' '#1092#1086#1088#1084#1099
      WordWrap = True
    end
    object lblCountLength: TLabel
      Left = 8
      Top = 250
      Width = 133
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086'* '#1082#1080#1083#1086#1084#1077#1090#1088#1086#1074' :'
      Enabled = False
    end
    object eNum: TDBEdit
      Left = 8
      Top = 32
      Width = 137
      Height = 21
      DataField = 'WAYBILL_NUMBER'
      DataSource = dsWayBill
      TabOrder = 0
    end
    object deDate: TDBDateEdit
      Left = 8
      Top = 71
      Width = 137
      Height = 21
      DataField = 'WAYBILL_DATE'
      DataSource = dsWayBill
      DialogTitle = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1088#1077#1073#1091#1077#1084#1091#1102' '#1076#1072#1090#1091
      NumGlyphs = 2
      TabOrder = 1
      OnChange = deDateChange
    end
    object ceEmploy: TComboEdit
      Left = 8
      Top = 148
      Width = 196
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = ceEmployButtonClick
      OnChange = ceEmployChange
      OnDblClick = ceEmployButtonClick
    end
    object ceNPGroup: TComboEdit
      Left = 8
      Top = 187
      Width = 196
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = ceNPGroupButtonClick
      OnDblClick = ceNPGroupButtonClick
    end
    object ceAuto: TComboEdit
      Left = 8
      Top = 109
      Width = 196
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = ceAutoButtonClick
      OnChange = ceAutoChange
      OnDblClick = ceAutoButtonClick
    end
    object eCountLitr: TCurrencyEdit
      Left = 8
      Top = 226
      Width = 196
      Height = 21
      AutoSize = False
      DecimalPlaces = 4
      DisplayFormat = '0.####'
      Enabled = False
      TabOrder = 5
      OnChange = eCountLitrChange
    end
    object eCountLength: TCurrencyEdit
      Left = 8
      Top = 265
      Width = 196
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '0.###'
      Enabled = False
      TabOrder = 6
    end
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 376
    Width = 606
    Height = 35
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      606
      35)
    object bbOk: TBitBtn
      Left = 436
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
    object bbCancel: TBitBtn
      Left = 519
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = bbCancelClick
      Kind = bkCancel
    end
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 231
      Height = 31
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object Label31: TLabel
        Left = 8
        Top = 8
        Width = 45
        Height = 13
        Caption = #1054#1089#1090#1072#1090#1086#1082':'
      end
      object lAutoRest: TLabel
        Left = 56
        Top = 8
        Width = 83
        Height = 13
        AutoSize = False
        Caption = 'lAutoRest'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object pnlGrids: TPanel
    Left = 233
    Top = 0
    Width = 373
    Height = 376
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object gbDetailNew: TGroupBox
      Left = 2
      Top = 2
      Width = 369
      Height = 247
      Align = alClient
      Caption = #1056#1072#1079#1073#1088#1086#1089' '#1087#1086' '#1075#1088#1091#1087#1087#1072#1084' '#1079#1072#1090#1088#1072#1090
      Constraints.MinWidth = 200
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Grid: TDBGridEh
        Left = 2
        Top = 15
        Width = 365
        Height = 206
        Align = alClient
        AutoFitColWidths = True
        DataSource = dsOperations
        FooterColor = clGray
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clGray
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clGray
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnExit = GridExit
        OnKeyPress = GridKeyPress
        OnSumListAfterRecalcAll = GridSumListAfterRecalcAll
        Columns = <
          item
            AutoDropDown = True
            EditButtons = <>
            FieldName = 'AUTO_OPER_NAME'
            Footer.Alignment = taRightJustify
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footer.Value = #1048#1090#1086#1075#1086' :'
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Caption = #1043#1088#1091#1087#1087#1072' '#1079#1072#1090#1088#1072#1090
            Width = 201
          end
          item
            EditButtons = <>
            FieldName = 'LITRES'
            Footer.FieldName = 'LITRES'
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clWindowText
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footers = <
              item
                FieldName = 'LITRES'
                ValueType = fvtSum
              end>
            Title.Alignment = taRightJustify
            Title.Caption = #1051#1080#1090#1088#1099
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'KILOMETERS'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = #1050#1080#1083#1086#1084#1077#1090#1088#1099
            Width = 74
          end>
      end
      object pActionBtn: TPanel
        Left = 2
        Top = 221
        Width = 365
        Height = 24
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object sbDeleteRash: TSpeedButton
          Left = 0
          Top = 1
          Width = 23
          Height = 22
          Action = acDelete
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C000000000000000000000000000000000000000000000000
            1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            1F7C1F7C1F7C1F7C0000FF7FFF7F000000000000000000000000000000000000
            00001F7C1F7C1F7C0000FF7FFF7F0000007C007C007C007C007C007C007C007C
            00001F7C1F7C1F7C0000FF7FFF7F0000007C007C007C007C007C007C007C007C
            00001F7C1F7C1F7C0000FF7FFF7F000000000000000000000000000000000000
            00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            1F7C1F7C1F7C1F7C0000FF7F0000FF7F00000000FF7F000000000000FF7F0000
            1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            1F7C1F7C1F7C1F7C0000FF7F000000000000FF7F0000FF7FFF7FFF7FFF7F0000
            1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
            1F7C1F7C1F7C1F7C0000FF7F000000000000FF7FFF7FFF7F00001F7C00001F7C
            1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000001F7C1F7C
            1F7C1F7C1F7C1F7C0000000000000000000000000000000000001F7C1F7C1F7C
            1F7C1F7C1F7C}
        end
      end
    end
    object gbPrih: TGroupBox
      Left = 2
      Top = 249
      Width = 369
      Height = 125
      Align = alBottom
      Caption = #1055#1088#1080#1093#1086#1076#1099' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084' '#1080' '#1082#1072#1088#1090#1072#1084
      Constraints.MinWidth = 200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object GridPrih: TDBGridEh
        Left = 2
        Top = 15
        Width = 365
        Height = 84
        Align = alClient
        AutoFitColWidths = True
        DataSource = dsPrih
        FooterColor = clGray
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnExit = GridExit
        OnKeyPress = GridPrihKeyPress
        OnSumListAfterRecalcAll = GridPrihSumListAfterRecalcAll
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DOC_NUMBER'
            Footer.Alignment = taRightJustify
            Footer.Font.Charset = DEFAULT_CHARSET
            Footer.Font.Color = clGray
            Footer.Font.Height = -11
            Footer.Font.Name = 'MS Sans Serif'
            Footer.Font.Style = [fsBold]
            Footer.Value = #1048#1090#1086#1075#1086' :'
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090'/'#1058#1072#1083#1086#1085'/'#1050#1072#1088#1090#1072
            Width = 201
          end
          item
            EditButtons = <>
            FieldName = 'LITR'
            Footer.FieldName = 'LITR'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = #1051#1080#1090#1088#1099
            Width = 71
          end>
      end
      object Panel1: TPanel
        Left = 2
        Top = 99
        Width = 365
        Height = 24
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object sbDeletePrih: TSpeedButton
          Left = 0
          Top = 1
          Width = 23
          Height = 22
          Action = acDeletePrih
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C000000000000000000000000000000000000000000000000
            1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            1F7C1F7C1F7C1F7C0000FF7FFF7F000000000000000000000000000000000000
            00001F7C1F7C1F7C0000FF7FFF7F0000007C007C007C007C007C007C007C007C
            00001F7C1F7C1F7C0000FF7FFF7F0000007C007C007C007C007C007C007C007C
            00001F7C1F7C1F7C0000FF7FFF7F000000000000000000000000000000000000
            00001F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            1F7C1F7C1F7C1F7C0000FF7F0000FF7F00000000FF7F000000000000FF7F0000
            1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            1F7C1F7C1F7C1F7C0000FF7F000000000000FF7F0000FF7FFF7FFF7FFF7F0000
            1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
            1F7C1F7C1F7C1F7C0000FF7F000000000000FF7FFF7FFF7F00001F7C00001F7C
            1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000001F7C1F7C
            1F7C1F7C1F7C1F7C0000000000000000000000000000000000001F7C1F7C1F7C
            1F7C1F7C1F7C}
        end
      end
    end
  end
  object qOperations: TOilQuery
    SQLInsert.Strings = (
      'insert into OIL_AUTO_OPER'
      
        '  (ID, INST, STATE, WAYBILL_ID, WAYBILL_INST, AUTO_OPER_ID, KILO' +
        'METERS, LITRES)'
      'values'
      
        '  (s_oil_auto_oper.nextval, :INST, '#39'Y'#39', :WAYBILL_ID, :WAYBILL_IN' +
        'ST, :AUTO_OPER_ID, :KILOMETERS, :LITRES)')
    SQLDelete.Strings = (
      'update OIL_AUTO_OPER'
      'set STATE = '#39'N'#39
      'where'
      '  ID = :OLD_ID and'
      '  INST = :OLD_INST')
    SQLUpdate.Strings = (
      'update OIL_AUTO_OPER'
      'set'
      '  ID = :ID,'
      '  INST = :INST,'
      '  STATE = :STATE,'
      '  WAYBILL_ID = :WAYBILL_ID,'
      '  WAYBILL_INST = :WAYBILL_INST,'
      '  AUTO_OPER_ID = :AUTO_OPER_ID,'
      '  KILOMETERS = :KILOMETERS,'
      '  LITRES = :LITRES'
      'where'
      '  ID = :OLD_ID and'
      '  INST = :OLD_INST')
    SQL.Strings = (
      'SELECT OPER.*, REF.AUTO_OPER_NAME'
      '  FROM OIL_AUTO_OPER OPER,'
      '       OIL_AUTO_OPER_REF REF'
      ' WHERE REF.ID = OPER.AUTO_OPER_ID'
      '   AND OPER.WAYBILL_ID = :ID'
      '   AND OPER.WAYBILL_INST = :INST'
      '   AND OPER.STATE = '#39'Y'#39)
    CachedUpdates = True
    BeforePost = qOperationsBeforePost
    AfterPost = qOperationsApplyUpdates
    AfterDelete = qOperationsApplyUpdates
    OnNewRecord = qOperationsNewRecord
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 336
    Top = 61
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'INST'
        ParamType = ptInput
        Value = 0
      end>
    object qOperationsID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_AUTO_OPER.ID'
    end
    object qOperationsINST: TFloatField
      FieldName = 'INST'
      Origin = 'OIL_AUTO_OPER.INST'
    end
    object qOperationsSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'OIL_AUTO_OPER.STATE'
      Size = 1
    end
    object qOperationsWAYBILL_ID: TFloatField
      FieldName = 'WAYBILL_ID'
      Origin = 'OIL_AUTO_OPER.WAYBILL_ID'
    end
    object qOperationsWAYBILL_INST: TFloatField
      FieldName = 'WAYBILL_INST'
      Origin = 'OIL_AUTO_OPER.WAYBILL_INST'
    end
    object qOperationsAUTO_OPER_ID: TFloatField
      FieldName = 'AUTO_OPER_ID'
      Origin = 'OIL_AUTO_OPER.AUTO_OPER_ID'
    end
    object qOperationsKILOMETERS: TFloatField
      FieldName = 'KILOMETERS'
      Origin = 'OIL_AUTO_OPER.KILOMETERS'
    end
    object qOperationsLITRES: TFloatField
      FieldName = 'LITRES'
      Origin = 'OIL_AUTO_OPER.LITRES'
    end
    object qOperationsTONNS: TFloatField
      FieldName = 'TONNS'
      Origin = 'OIL_AUTO_OPER.TONNS'
    end
    object qOperationsDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
      Origin = 'OIL_AUTO_OPER.DATE_MOD'
    end
    object qOperationsAUTO_OPER_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'AUTO_OPER_NAME'
      LookupDataSet = qGroupRashType
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'AUTO_OPER_ID'
      Origin = 'OIL_AUTO_OPER_REF.AUTO_OPER_NAME'
      Size = 100
      Lookup = True
    end
  end
  object dsOperations: TOraDataSource
    DataSet = qOperations
    Left = 272
    Top = 61
  end
  object ActionList1: TActionList
    Images = MainForm.BaseImage
    Left = 472
    Top = 77
    object acDelete: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 2
      OnExecute = acDeleteExecute
    end
    object acDeletePrih: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 2
      OnExecute = acDeletePrihExecute
    end
  end
  object qTemp: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 352
    Top = 173
  end
  object qWayBill: TOilQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM OIL_WAYBILLS'
      ' WHERE ID = :ID'
      '   AND INST = :INST'
      '   AND STATE = '#39'Y'#39)
    CachedUpdates = True
    UpdateObject = UpWayBill
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 80
    Top = 237
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INST'
        ParamType = ptInput
      end>
    object qWayBillID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_WAYBILLS.ID'
    end
    object qWayBillINST: TFloatField
      FieldName = 'INST'
      Origin = 'OIL_WAYBILLS.INST'
    end
    object qWayBillWAYBILL_NUMBER: TStringField
      FieldName = 'WAYBILL_NUMBER'
      Origin = 'OIL_WAYBILLS.WAYBILL_NUMBER'
      Size = 100
    end
    object qWayBillWAYBILL_DATE: TDateTimeField
      FieldName = 'WAYBILL_DATE'
      Origin = 'OIL_WAYBILLS.WAYBILL_DATE'
    end
    object qWayBillEMPLOY_ID: TFloatField
      FieldName = 'EMPLOY_ID'
      Origin = 'OIL_WAYBILLS.EMPLOY_ID'
    end
    object qWayBillEMPLOY_INST: TFloatField
      FieldName = 'EMPLOY_INST'
      Origin = 'OIL_WAYBILLS.EMPLOY_INST'
    end
    object qWayBillAUTO_ID: TFloatField
      FieldName = 'AUTO_ID'
      Origin = 'OIL_WAYBILLS.AUTO_ID'
    end
    object qWayBillAUTO_INST: TFloatField
      FieldName = 'AUTO_INST'
      Origin = 'OIL_WAYBILLS.AUTO_INST'
    end
    object qWayBillNP_TYPE: TFloatField
      FieldName = 'NP_TYPE'
      Origin = 'OIL_WAYBILLS.NP_TYPE'
    end
    object qWayBillSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'OIL_WAYBILLS.STATE'
      Size = 1
    end
  end
  object dsWayBill: TOraDataSource
    DataSet = qWayBill
    Left = 48
    Top = 237
  end
  object UpWayBill: TOraUpdateSQL
    ModifySQL.Strings = (
      'update OIL_WAYBILLS'
      'set'
      '  ID = :ID,'
      '  INST = :INST,'
      '  WAYBILL_NUMBER = :WAYBILL_NUMBER,'
      '  WAYBILL_DATE = :WAYBILL_DATE,'
      '  EMPLOY_ID = :EMPLOY_ID,'
      '  EMPLOY_INST = :EMPLOY_INST,'
      '  AUTO_ID = :AUTO_ID,'
      '  AUTO_INST = :AUTO_INST,'
      '  NP_TYPE = :NP_TYPE,'
      '  STATE = :STATE'
      'where'
      '  ID = :OLD_ID and'
      '  INST = :OLD_INST')
    InsertSQL.Strings = (
      'insert into OIL_WAYBILLS'
      
        '  (ID, INST, WAYBILL_NUMBER, WAYBILL_DATE, EMPLOY_ID, EMPLOY_INS' +
        'T, '
      'AUTO_ID, '
      '   AUTO_INST, NP_TYPE, STATE)'
      'values'
      '  (:ID, :INST, :WAYBILL_NUMBER, :WAYBILL_DATE, :EMPLOY_ID, '
      ':EMPLOY_INST, '
      '   :AUTO_ID, :AUTO_INST, :NP_TYPE, '#39'Y'#39')')
    DeleteSQL.Strings = (
      'update OIL_WAYBILLS'
      'set STATE = '#39'N'#39
      'where'
      '  ID = :OLD_ID and'
      '  INST = :OLD_INST')
    Left = 112
    Top = 237
  end
  object dsGroupRashType: TOraDataSource
    DataSet = qGroupRashType
    Left = 272
    Top = 168
  end
  object qGroupRashType: TOilQuery
    SQL.Strings = (
      'SELECT'
      '  REF1.ID AS ID,'
      '  REF1.AUTO_OPER_NAME AS NAME'
      'FROM OIL_AUTO_OPER_REF REF1'
      'WHERE '
      ' REF1.ID IN (2, 3, 4, 5)')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 272
    Top = 120
    object qGroupRashTypeID: TFloatField
      FieldName = 'ID'
    end
    object qGroupRashTypeNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object qRest: TOraQuery
    SQL.Strings = (
      'SELECT A.AutoId,'
      '       A.AutoModel, /* '#1090#1080#1087' '#1084#1072#1096#1080#1085#1099' */'
      '       A.AutoNumb, /* '#1085#1086#1084#1077#1088' '#1084#1072#1096#1080#1085#1099' */'
      '       A.GroupNumber, /* '#1085#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099' */'
      '       A.NPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1053#1055' */'
      '       A.NPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      '       SUM(A.RestLitres) AS RestLitres, /* '#1086#1089#1090#1072#1090#1086#1082' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      
        '       SUM(A.PrihodLitres) AS PrihodLitres, /* '#1087#1088#1080#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' ' +
        #1074' '#1083#1080#1090#1088#1072#1093' */'
      
        '       SUM(A.RashodLitres) AS RashodLitres /* '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074 +
        ' '#1083#1080#1090#1088#1072#1093' */'
      '  FROM ('
      '        /* '#1055#1088#1080#1093#1086#1076' '#1074' '#1073#1072#1082'*/'
      '        SELECT refuel.auto_id AS AutoId, /* '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1084#1072#1096#1080#1085#1077' */'
      '                decode(refuel.auto_type_id,'
      '                       12,'
      
        '                       refuel.f_name || '#39' '#39' || SUBSTR(refuel.i_n' +
        'ame, 1, 1) || '#39'.'#39' ||'
      '                       SUBSTR(refuel.o_name, 1, 1) || '#39'.'#39','
      '                       refuel.auto_model) AS AutoModel,'
      '                decode(refuel.auto_type_id,'
      '                       12,'
      '                       '#39#1055#1086' '#1072#1082#1090#1091#39','
      '                       refuel.auto_number) AS AutoNumb,'
      
        '                refuel.auto_group_id AS GroupNumber, /* '#1085#1086#1084#1077#1088' '#1075#1088 +
        #1091#1087#1087#1099' */'
      
        '                refuel.npgrp_id AS NPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1053#1055' *' +
        '/'
      '                refuel.np_name AS NPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      
        '                refuel.litr AS RestLitres, /* '#1086#1089#1090#1072#1090#1086#1082' '#1074' '#1083#1080#1090#1088#1072#1093' *' +
        '/'
      
        '                refuel.litr AS PrihodLitres, /* '#1087#1088#1080#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076 +
        ' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      
        '                0 AS RashodLitres /* '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' *' +
        '/'
      '          FROM v_oil_own_refuel_filial refuel'
      '         WHERE refuel.Employ_Id = :EmployId'
      '           and refuel.Employ_Inst = :EmployInst'
      '           and refuel.Auto_Id = :AutoId'
      '           and refuel.Auto_Inst = :AutoInst'
      '           AND trunc(refuel.rep_date) <= :EndDate'
      
        '           AND not(refuel.waybills_id = :Id AND refuel.waybills_' +
        'inst = :Inst and refuel.waybills_inst is not null) /*TO_DATE('#39'01' +
        '.10.2001'#39', '#39'DD.MM.YYYY'#39')*/'
      '        '
      '        UNION ALL'
      '        '
      '        /* '#1056#1072#1089#1093#1086#1076' '#1080#1079' '#1073#1072#1082#1086#1074' */'
      '        SELECT /*+ORDERED*/'
      '               auto.id AS AutoId, /* '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1084#1072#1096#1080#1085#1077' */'
      '               decode(auto.auto_type_id,'
      '                      12,'
      
        '                      employ.f_name || '#39' '#39' || SUBSTR(employ.i_na' +
        'me, 1, 1) || '#39'.'#39' ||'
      '                      SUBSTR(employ.o_name, 1, 1) || '#39'.'#39','
      '                      auto.auto_model) AS AutoModel,'
      
        '               decode(auto.auto_type_id, 12, '#39#1055#1086' '#1072#1082#1090#1091#39', auto.num' +
        'b) AS AutoNumb,'
      '               autogroup.id AS GroupNumber, /* '#1085#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099' */'
      
        '               np_group.id AS NPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1053#1055 +
        ' */'
      '               np_group.name AS NPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      '               -oper.litres as RestLitres,'
      '               '
      
        '               0 AS PrihodLitres, /* '#1087#1088#1080#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' *' +
        '/'
      '               oper.litres as RashodLitres'
      '          FROM oil_auto auto,'
      '               oil_waybills waybill,'
      '               oil_auto_oper oper,'
      '               oil_auto_type autotype,'
      '               oil_auto_group autogroup,'
      '               oil_np_type np_type,'
      '               oil_np_group np_group,'
      '               oil_employ employ'
      '         WHERE waybill.id = oper.waybill_id'
      '           AND waybill.inst = oper.waybill_inst'
      '           AND waybill.auto_id = auto.id'
      '           AND waybill.auto_inst = auto.inst'
      '           AND auto.auto_type_id = autotype.id'
      '           AND autotype.auto_group = autogroup.id'
      '           AND waybill.employ_id = employ.id'
      '           AND waybill.employ_inst = employ.inst'
      '           AND waybill.np_type = np_type.id'
      '           AND np_type.grp_id = np_group.id'
      
        '           AND waybill.waybill_date <= :EndDate /* TO_DATE('#39'06.0' +
        '9.2001'#39', '#39'DD.MM.YYYY'#39') */'
      '           AND oper.state = '#39'Y'#39
      '           AND waybill.state = '#39'Y'#39
      '           AND auto.Id = :AutoId'
      '           AND auto.Inst = :AutoInst'
      '           AND waybill.employ_id = :EmployId'
      '           AND waybill.employ_inst = :EmployInst'
      '           AND not(waybill.id = :Id AND waybill.inst = :Inst)) A'
      ' GROUP BY A.GroupNumber,'
      '          A.AutoId,'
      '          A.AutoModel,'
      '          A.AutoNumb,'
      '          A.NPName,'
      '          A.NPtype'
      
        'HAVING(NVL(SUM(A.Restlitres), 0) + NVL(SUM(A.PrihodLitres), 0) +' +
        ' NVL(SUM(A.RashodLitres), 0)) <> 0')
    Left = 129
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EmployId'
      end
      item
        DataType = ftInteger
        Name = 'EmployInst'
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
        DataType = ftDateTime
        Name = 'EndDate'
      end
      item
        DataType = ftUnknown
        Name = 'Id'
      end
      item
        DataType = ftUnknown
        Name = 'Inst'
      end>
  end
  object vtPrih: TVirtualTable
    AfterPost = vtPrihAfterPost
    Left = 323
    Top = 298
    Data = {02000000000000000000}
    object vtPrihDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object vtPrihLITR: TIntegerField
      FieldName = 'LITR'
    end
  end
  object dsPrih: TOraDataSource
    DataSet = vtPrih
    Left = 363
    Top = 298
  end
  object qPrih: TOraQuery
    SQL.Strings = (
      'select DOC_NUMBER, LITRES as litr '
      '  from oil_auto_card '
      ' where state = '#39'Y'#39' '
      '   and waybills_id = :id'
      '   and waybills_inst = :inst')
    Left = 491
    Top = 297
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
      end
      item
        DataType = ftInteger
        Name = 'inst'
      end>
  end
end
