inherited RaskredForm: TRaskredForm
  Left = 236
  Top = 114
  Width = 548
  Height = 524
  Caption = #1056#1072#1089#1082#1088#1077#1076#1080#1090#1072#1094#1080#1103
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pBottom: TPanel
    Top = 464
    Width = 540
    object sbAdd: TSpeedButton [0]
      Left = 4
      Top = 2
      Width = 25
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800008
        88888888888777788888800000009900088887777777FF77788880FFFFF0990F
        088887888887FF78788880FF00009900008887887777FF77778880FF09999999
        908887887FFFFFFFF78880FF09999999908887887FFFFFFFF78880FF00009900
        008887887777FF77778880F0FFF0990F088887878887FF78788880FFFFF0990F
        088887888887FF78788880F0F0F0000F0888878787877778788880FFFFFFFFFF
        0888878888888888788880F000F0FFFF0888878777878888788880FFFFFFF000
        0888878888888777788880F000FFF0808888878777888787888880FFFFFFF008
        8888878888888778888880000000008888888777777777888888}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbAddClick
    end
    object sbDel: TSpeedButton [1]
      Left = 30
      Top = 2
      Width = 25
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888000000000000888877777777777788880FFFFFFFFFF
        0888878888888888788880FFFFFFFFFF0888878888888888788880FF00000000
        0088878877777777778880FF09999999908887887FFFFFFFF78880FF09999999
        908887887FFFFFFFF78880FF000000000088878877777777778880FFFFFFFFFF
        0888878888888888788880F0F00F000F0888878787787778788880FFFFFFFFFF
        0888878888888888788880F000F0FFFF0888878777878888788880FFFFFFF000
        0888878888888777788880F000FFF0808888878777888787888880FFFFFFF008
        8888878888888778888880000000008888888777777777888888}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbDelClick
    end
    inherited pBtn: TPanel
      Left = 343
    end
    object edSearch: TEdit
      Left = 60
      Top = 6
      Width = 121
      Height = 21
      Hint = #1055#1086#1080#1089#1082' '#1094#1080#1089#1090#1077#1088#1085#1099
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = edSearchChange
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 540
    Height = 149
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 115
      Height = 145
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      DesignSize = (
        115
        145)
      object Label1: TLabel
        Left = 4
        Top = 4
        Width = 34
        Height = 13
        Caption = #1053#1086#1084#1077#1088
      end
      object Label2: TLabel
        Left = 6
        Top = 44
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
      end
      object edNum: TEdit
        Left = 4
        Top = 20
        Width = 101
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clScrollBar
        Enabled = False
        TabOrder = 0
      end
      object deDate: TDateEdit
        Left = 4
        Top = 60
        Width = 101
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object Panel6: TPanel
      Left = 117
      Top = 2
      Width = 421
      Height = 145
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel5: TPanel
        Left = 2
        Top = 2
        Width = 417
        Height = 94
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          417
          94)
        object Label3: TLabel
          Left = 8
          Top = 4
          Width = 84
          Height = 13
          Caption = #1054#1090#1087#1091#1089#1082' '#1089' '#1079#1072#1074#1086#1076#1072
        end
        object Label4: TLabel
          Left = 104
          Top = 4
          Width = 69
          Height = 13
          Caption = #1044#1072#1090#1072' '#1086#1090#1087#1091#1089#1082#1072
        end
        object Label5: TLabel
          Left = 184
          Top = 4
          Width = 36
          Height = 13
          Caption = #8470' '#1043#1058#1044
        end
        object lblDate: TLabel
          Left = 108
          Top = 24
          Width = 69
          Height = 13
          AutoSize = False
          Caption = '01.01.1990'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblGtd: TLabel
          Left = 184
          Top = 24
          Width = 224
          Height = 13
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = '12345'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 8
          Top = 48
          Width = 34
          Height = 13
          Caption = #1047#1072#1074#1086#1076':'
        end
        object lblZavod: TLabel
          Left = 48
          Top = 48
          Width = 360
          Height = 13
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'lblZavod'
        end
        object Label9: TLabel
          Left = 12
          Top = 72
          Width = 29
          Height = 13
          Caption = #1050#1086#1084#1091':'
        end
        object lblDep: TLabel
          Left = 48
          Top = 72
          Width = 360
          Height = 13
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'lblDep'
        end
        object ceZavodRash: TComboEdit
          Left = 8
          Top = 20
          Width = 89
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          NumGlyphs = 1
          TabOrder = 0
          OnButtonClick = ceZavodRashButtonClick
          OnDblClick = ceZavodRashButtonClick
        end
      end
      object Panel7: TPanel
        Left = 2
        Top = 96
        Width = 417
        Height = 47
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Label6: TLabel
          Left = 8
          Top = 4
          Width = 42
          Height = 13
          Caption = #1057#1090#1072#1085#1094#1080#1103
        end
        object ceRailStat: TComboEdit
          Left = 8
          Top = 20
          Width = 301
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          NumGlyphs = 1
          TabOrder = 0
          OnButtonClick = ceRailStatButtonClick
          OnDblClick = ceRailStatButtonClick
        end
      end
    end
  end
  object dbg: TDBGridEh [2]
    Left = 0
    Top = 149
    Width = 540
    Height = 315
    Align = alClient
    Color = 15658991
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clGreen
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = [fsBold]
    FooterRowCount = 1
    ParentFont = False
    ReadOnly = True
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 3
    OnGetCellParams = dbgGetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TANK_NUM'
        Footer.Value = #1048#1090#1086#1075#1086
        Footer.ValueType = fvtStaticText
        Footers = <>
        ReadOnly = False
        Title.Caption = #8470' '#1094#1080#1089#1090#1077#1088#1085#1099
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'ZD_NAKL'
        Footers = <>
        ReadOnly = False
        Title.Caption = #1046#1044' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'NP_TYPE_NAME'
        Footers = <>
        ReadOnly = False
        Title.Caption = #1058#1080#1087' '#1053#1055
        Width = 118
      end
      item
        EditButtons = <>
        FieldName = 'FULL_COUNT'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Title.Caption = #1053#1055' '#1073#1088#1091#1090#1090#1086', '#1090#1086#1085#1085
      end
      item
        EditButtons = <>
        FieldName = 'WATER_COUNT'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = False
        Title.Caption = #1042#1086#1076#1072', '#1090#1086#1085#1085
      end
      item
        EditButtons = <>
        FieldName = 'NP_COUNT'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Title.Caption = #1053#1055' '#1085#1077#1090#1090#1086', '#1090#1086#1085#1085
      end
      item
        EditButtons = <>
        FieldName = 'DENSITY'
        Footers = <>
        ReadOnly = False
        Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
      end
      item
        EditButtons = <>
        FieldName = 'TEMPERATURE'
        Footers = <>
        ReadOnly = False
        Title.Caption = #1058#1077#1084#1087'-'#1088#1072
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'TANK_TYPE_NAME'
        Footers = <>
        ReadOnly = False
        Title.Caption = #1058#1080#1087' '#1094#1080#1089#1090#1077#1088#1085#1099
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        ReadOnly = False
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'INST'
        Footers = <>
        ReadOnly = False
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'STATE'
        Footers = <>
        ReadOnly = False
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'TANK_TYPE'
        Footers = <>
        ReadOnly = False
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ZRD_ID'
        Footers = <>
        ReadOnly = False
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ZRD_INST'
        Footers = <>
        ReadOnly = False
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'NP_TYPE'
        Footers = <>
        ReadOnly = False
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'LEVEL_MM'
        Footers = <>
        ReadOnly = False
        Title.Caption = #1059#1088#1086#1074#1077#1085#1100', '#1084#1084
      end
      item
        EditButtons = <>
        FieldName = 'PV'
        Footers = <>
        ReadOnly = False
        Title.Caption = #1087'/'#1074
      end>
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select *'
      'from v_oil_raskred_full'
      'where id=:id and inst=:inst'
      'order by zrd_id')
    Left = 20
  end
  object mt: TMemoryTable
    AfterInsert = mtAfterInsert
    BeforePost = mtBeforePost
    AfterPost = mtAfterPost
    BeforeDelete = mtBeforeDelete
    Left = 184
    Top = 264
    object mtID: TFloatField
      FieldName = 'ID'
    end
    object mtINST: TFloatField
      FieldName = 'INST'
    end
    object mtTANK_NUM: TStringField
      FieldName = 'TANK_NUM'
      Size = 32
    end
    object mtTANK_TYPE: TFloatField
      FieldName = 'TANK_TYPE'
    end
    object mtZD_NAKL: TStringField
      FieldName = 'ZD_NAKL'
      Size = 32
    end
    object mtDENSITY: TFloatField
      FieldName = 'DENSITY'
    end
    object mtTEMPERATURE: TFloatField
      FieldName = 'TEMPERATURE'
    end
    object mtFULL_COUNT: TFloatField
      FieldName = 'FULL_COUNT'
    end
    object mtWATER_COUNT: TFloatField
      FieldName = 'WATER_COUNT'
    end
    object mtNP_COUNT: TFloatField
      FieldName = 'NP_COUNT'
    end
    object mtTANK_TYPE_NAME: TStringField
      FieldName = 'TANK_TYPE_NAME'
      Size = 32
    end
    object mtLEVEL_MM: TFloatField
      FieldName = 'LEVEL_MM'
    end
    object mtPV: TFloatField
      FieldName = 'PV'
    end
    object mtNP_TYPE_NAME: TStringField
      FieldName = 'NP_TYPE_NAME'
      Size = 50
    end
    object mtZRD_ID: TFloatField
      FieldName = 'ZRD_ID'
    end
    object mtZRD_INST: TFloatField
      FieldName = 'ZRD_INST'
    end
    object mtNP_TYPE: TFloatField
      FieldName = 'NP_TYPE'
    end
    object mtSTATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object mtZAVOD_COUNT: TFloatField
      FieldName = 'ZAVOD_COUNT'
    end
  end
  object ds: TOraDataSource
    DataSet = mt
    Left = 196
    Top = 252
  end
end
