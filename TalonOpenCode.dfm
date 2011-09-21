inherited TalonOpenCodeForm: TTalonOpenCodeForm
  Left = 168
  Top = 219
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1048#1084#1087#1086#1088#1090' '#1092#1072#1081#1083#1072' dbf'
  ClientHeight = 386
  ClientWidth = 691
  OldCreateOrder = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object DBGCode: TDBGridEh
    Left = 9
    Top = 30
    Width = 128
    Height = 251
    Align = alLeft
    DataSource = DSCode
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel3: TPanel
    Left = 0
    Top = 281
    Width = 691
    Height = 105
    Align = alBottom
    TabOrder = 1
    object ReadButton: TBitBtn
      Left = 264
      Top = 64
      Width = 81
      Height = 25
      Hint = #1044#1077#1096#1080#1092#1088#1086#1074#1082#1072' '#1096#1090#1088#1080#1093'-'#1082#1086#1076#1086#1074
      Caption = #1063#1090#1077#1085#1080#1077
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ReadButtonClick
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
    object CloseButton: TBitBtn
      Left = 600
      Top = 64
      Width = 81
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = CloseButtonClick
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
    object GroupBox1: TGroupBox
      Left = 264
      Top = 8
      Width = 417
      Height = 49
      Caption = #1055#1086#1080#1089#1082' '#1092#1072#1081#1083#1072' dbf :'
      TabOrder = 2
      object FilenameEdit1: TFilenameEdit
        Left = 8
        Top = 20
        Width = 401
        Height = 21
        Filter = 'dbf|*.dbf*|All files|* *'
        ClickKey = 8314
        DirectInput = False
        NumGlyphs = 1
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnChange = FilenameEdit1Change
      end
    end
    object PB: TProgressBar
      Left = 1
      Top = 94
      Width = 689
      Height = 10
      Align = alBottom
      TabOrder = 3
    end
    object ImportButton: TBitBtn
      Left = 352
      Top = 64
      Width = 81
      Height = 25
      Hint = #1048#1084#1087#1086#1088#1090' '#1085#1077' '#1086#1096#1080#1073#1086#1095#1085#1099#1093' '#1090#1072#1083#1086#1085#1086#1074' '#1074' '#1090#1072#1073#1083#1080#1094#1091' '#1086#1090#1087#1091#1089#1082#1072' '#1090#1072#1083#1086#1085#1086#1074
      Caption = #1048#1084#1087#1086#1088#1090
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ImportButtonClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
        3333333333773FF3333333333309003333333333337F773FF333333333099900
        33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
        99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
        33333333337F3F77333333333309003333333333337F77333333333333090033
        33333333337F7733333333333309990033333FFFFF7F33773FF3000000099999
        0033777777733333773F09999999999999007FFFFFFF33333F77000000099999
        00337777777F333F773333333309990033333333337F3F773333333333090033
        33333333337F7733333333333300333333333333337733333333}
      NumGlyphs = 2
    end
    object e1: TEdit
      Left = 231
      Top = 8
      Width = 17
      Height = 21
      TabOrder = 5
      Visible = False
    end
    object ExportError: TBitBtn
      Left = 440
      Top = 64
      Width = 153
      Height = 25
      Hint = #1042#1099#1075#1088#1091#1079#1082#1072' '#1086#1096#1080#1073#1086#1095#1085#1099#1093' '#1090#1072#1083#1086#1085#1086#1074
      Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1086#1096#1080#1073#1086#1082
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = ExportErrorClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333FFFF33333333333000003FFFFFFFFFF88888000000000006
        666088888888888F333808888888806EEF038F33333338F3338F30E6666606EE
        F07338F333338F3338F3330E66606EEF0603338F3338F333838F3330E606EEF0
        00033338F38F333888833333006EEF033333333388F3338F3333333306EEF003
        333333338F33388F333333306EEF068033333338F3338F38F3333306EEF0E668
        0333338F3338F3338F33306EEF030E66803338F3338F8F3338F30FFFF03330EE
        EE038FFFF8F338FFFF8F00000333330000038888833333888883333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object gbPrice: TGroupBox
      Left = 8
      Top = 8
      Width = 248
      Height = 81
      Caption = #1062#1077#1085#1099
      DockSite = True
      TabOrder = 7
      object lPrice: TLabel
        Left = 23
        Top = 27
        Width = 198
        Height = 13
        Caption = #1040'-76  A-80   '#1040'-92   '#1040'-95  '#1040'-98    '#1044#1058'    '#1043#1072#1079
      end
      object ce76: TCurrencyEdit
        Left = 19
        Top = 40
        Width = 29
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '0.00'
        ParentCtl3D = False
        TabOrder = 0
      end
      object ce80: TCurrencyEdit
        Left = 49
        Top = 40
        Width = 29
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '0.00'
        ParentCtl3D = False
        TabOrder = 1
      end
      object ce92: TCurrencyEdit
        Left = 79
        Top = 40
        Width = 29
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '0.00'
        ParentCtl3D = False
        TabOrder = 2
      end
      object ce95: TCurrencyEdit
        Left = 109
        Top = 40
        Width = 29
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '0.00'
        ParentCtl3D = False
        TabOrder = 3
      end
      object ce98: TCurrencyEdit
        Left = 139
        Top = 40
        Width = 29
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '0.00'
        ParentCtl3D = False
        TabOrder = 4
      end
      object ceDT: TCurrencyEdit
        Left = 169
        Top = 40
        Width = 29
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '0.00'
        ParentCtl3D = False
        TabOrder = 5
      end
      object ceGaz: TCurrencyEdit
        Left = 199
        Top = 40
        Width = 29
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '0.00'
        ParentCtl3D = False
        TabOrder = 6
      end
    end
  end
  object DBGError: TDBGridEh
    Left = 411
    Top = 30
    Width = 270
    Height = 251
    Align = alLeft
    DataSource = DSError
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SER'
        Footers = <>
        Title.Caption = #1057#1077#1088#1080#1103
        Width = 36
      end
      item
        EditButtons = <>
        FieldName = 'NUM'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 39
      end
      item
        EditButtons = <>
        FieldName = 'ERROR'
        Footers = <>
        Title.Caption = #1054#1096#1080#1073#1082#1072
        Width = 307
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 691
    Height = 30
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 112
      Height = 13
      Caption = #1058#1072#1073#1083#1080#1094#1072'  '#1096#1090#1088#1080#1093'-'#1082#1086#1076#1086#1074
    end
    object Label2: TLabel
      Left = 176
      Top = 8
      Width = 195
      Height = 13
      Caption = #1058#1072#1073#1083#1080#1094#1072' '#1076#1077#1096#1080#1092#1088#1086#1074#1072#1085#1085#1099#1093' '#1096#1090#1088#1080#1093'-'#1082#1086#1076#1086#1074
    end
    object Label3: TLabel
      Left = 468
      Top = 8
      Width = 152
      Height = 13
      Caption = #1058#1072#1073#1083#1080#1094#1072'  '#1086#1096#1080#1073#1086#1095#1085#1099#1093'  '#1090#1072#1083#1086#1085#1086#1074
    end
  end
  object DBGTalon: TDBGridEh
    Left = 146
    Top = 30
    Width = 256
    Height = 251
    Align = alLeft
    DataSource = DSRozSh
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SER'
        Footers = <>
        Title.Caption = #1057#1077#1088#1080#1103
        Width = 36
      end
      item
        EditButtons = <>
        FieldName = 'NUM'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'NPGRP'
        Footers = <>
        Title.Caption = #1053#1055
        Width = 36
      end
      item
        EditButtons = <>
        FieldName = 'NOMINAL'
        Footers = <>
        Title.Caption = #1053#1086#1084#1080#1085#1072#1083
        Width = 51
      end
      item
        EditButtons = <>
        FieldName = 'PRICE'
        Footers = <>
        Title.Caption = #1062#1077#1085#1072
        Width = 34
      end>
  end
  object Panel2: TPanel
    Left = 137
    Top = 30
    Width = 9
    Height = 251
    Align = alLeft
    TabOrder = 5
  end
  object Panel4: TPanel
    Left = 402
    Top = 30
    Width = 9
    Height = 251
    Align = alLeft
    TabOrder = 6
  end
  object Panel5: TPanel
    Left = 0
    Top = 30
    Width = 9
    Height = 251
    Align = alLeft
    TabOrder = 7
  end
  object Panel6: TPanel
    Left = 681
    Top = 30
    Width = 11
    Height = 251
    Align = alLeft
    TabOrder = 8
  end
  object DSCode: TOraDataSource
    DataSet = TCode
    Left = 61
    Top = 83
  end
  object DSRozSh: TOraDataSource
    DataSet = MTRozSh
    Left = 277
    Top = 83
  end
  object DSError: TOraDataSource
    DataSet = MTError
    Left = 549
    Top = 83
  end
  object MTError: TMemoryTable
    AutoRefresh = True
    Left = 520
    Top = 83
    object MTErrorSER: TStringField
      FieldName = 'SER'
    end
    object MTErrorNUM: TStringField
      FieldName = 'NUM'
    end
    object MTErrorERROR: TStringField
      FieldName = 'ERROR'
      Size = 50
    end
  end
  object TCode: TTable
    AutoRefresh = True
    ReadOnly = True
    Left = 32
    Top = 83
  end
  object q: TOilQuery
    SQL.Strings = (
      'TALON')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 90
    Top = 83
  end
  object MTRozSh: TMemoryTable
    AutoRefresh = True
    Left = 248
    Top = 83
    object MTRozShNPGRP: TStringField
      FieldName = 'NPGRP'
    end
    object MTRozShSER: TStringField
      FieldName = 'SER'
    end
    object MTRozShNUM: TStringField
      FieldName = 'NUM'
    end
    object MTRozShNOMINAL: TStringField
      FieldName = 'NOMINAL'
    end
    object MTRozShPRICE: TStringField
      FieldName = 'PRICE'
    end
    object MTRozShnpgrp_id: TFloatField
      FieldName = 'npgrp_id'
    end
  end
  object SD: TSaveDialog
    Filter = #1050#1085#1080#1075#1072' Microsoft Excel|*.xls*|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|* *'
    Left = 579
    Top = 83
  end
end
