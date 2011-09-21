object RezervImageForm: TRezervImageForm
  Left = 245
  Top = 196
  Width = 1035
  Height = 701
  BorderIcons = [biSystemMenu]
  Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1085#1099#1081' '#1087#1072#1088#1082' '
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 634
    Width = 1027
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    Visible = False
    object pBtn: TPanel
      Left = 800
      Top = 2
      Width = 225
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        225
        29)
      object bbCancel: TBitBtn
        Left = 135
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 0
        OnClick = bbCancelClick
        Kind = bkCancel
      end
      object bbReOpen: TBitBtn
        Left = 8
        Top = 2
        Width = 121
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1042#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077
        TabOrder = 1
        OnClick = bbReOpenClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000084000000840000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF00FFFFFF000084000000840000008400000084
          000000840000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000084000000840000FFFF
          FF00FFFFFF0000840000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFF
          FF00FFFFFF0000840000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000840000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF0000840000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF00008400000084
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF00FFFFFF000084000000840000008400000084
          000000840000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008400000084
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFF
          FF00FFFFFF0000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
          FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00000000000000000000000000000000000000000000000000000000000000
          00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00}
      end
    end
  end
  object pnlHideFilter: TPanel
    Left = 0
    Top = 0
    Width = 1027
    Height = 10
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object sbTanksPosition: TSpeedButton
      Left = 3
      Top = 1
      Width = 23
      Height = 8
      Hint = #1057#1082#1088#1099#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1086#1074
      AllowAllUp = True
      GroupIndex = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbTanksPositionClick
    end
    object sbFiltersPosition: TSpeedButton
      Left = 32
      Top = 1
      Width = 23
      Height = 8
      Hint = #1057#1082#1088#1099#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1092#1080#1083#1100#1090#1088#1086#1074' '#1075#1088#1072#1092#1080#1082#1072
      AllowAllUp = True
      GroupIndex = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sbFiltersPositionClick
    end
    object sbTankCap: TSpeedButton
      Left = 61
      Top = 1
      Width = 23
      Height = 8
      Hint = #1057#1082#1088#1099#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1085#1086#1075#1086' '#1087#1072#1088#1082#1072
      AllowAllUp = True
      GroupIndex = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sbTankCapClick
    end
    object pnlTuneGridBtn: TPanel
      Left = 998
      Top = 0
      Width = 29
      Height = 10
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
  object pnlTrack: TPanel
    Left = 0
    Top = 10
    Width = 1027
    Height = 300
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object pnlTanks: TPanel
      Left = 2
      Top = 52
      Width = 327
      Height = 173
      BevelOuter = bvNone
      TabOrder = 0
      OnResize = pnlTanksResize
      object pTank1: TPanel
        Left = 8
        Top = 1
        Width = 38
        Height = 100
        Caption = 'pTank1'
        PopupMenu = PopupMenuTank
        TabOrder = 0
        DesignSize = (
          38
          100)
        object sHeadB1: TShape
          Left = 1
          Top = 85
          Width = 35
          Height = 12
          Anchors = [akLeft, akTop, akRight]
          Brush.Color = 16742263
          Shape = stEllipse
        end
        object sFull1: TShape
          Left = 1
          Top = 22
          Width = 35
          Height = 70
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
        object sFill1: TShape
          Left = 2
          Top = 61
          Width = 34
          Height = 32
          Anchors = [akLeft, akRight, akBottom]
          Brush.Color = 16742263
          Pen.Color = clNavy
          Pen.Style = psClear
        end
        object sHead1: TShape
          Left = 1
          Top = 16
          Width = 35
          Height = 15
          Anchors = [akLeft, akTop, akRight]
          Brush.Color = clGray
          Shape = stEllipse
        end
        object lblNpName1: TLabel
          Left = 1
          Top = 70
          Width = 35
          Height = 19
          Alignment = taCenter
          Anchors = [akLeft, akRight, akBottom]
          AutoSize = False
          Caption = #1040'-80'
          Color = clGrayText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblCount1: TLabel
          Left = 0
          Top = 19
          Width = 37
          Height = 12
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = '1000 '#1083'.'
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -8
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblMax: TLabel
          Left = 8
          Top = 103
          Width = 26
          Height = 13
          Caption = 'MAX:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object lblMaxCount: TLabel
          Left = 36
          Top = 103
          Width = 58
          Height = 13
          Caption = 'lblMaxCount'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object lblTankNumber1: TLabel
          Left = 9
          Top = 0
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = #8470'%s'
          Color = clGrayText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object sValid1: TShape
          Left = 1
          Top = 1
          Width = 10
          Height = 10
          Brush.Color = 24064
          Pen.Style = psClear
          Visible = False
        end
        object imError1: TImage
          Left = 1
          Top = 31
          Width = 20
          Height = 25
          Center = True
          Transparent = True
        end
        object sP1: TShape
          Left = 2
          Top = 91
          Width = 34
          Height = 2
          Anchors = [akLeft, akRight, akBottom]
          Brush.Color = 16742263
          Pen.Color = clNavy
          Pen.Style = psClear
        end
        object sHeadT1: TShape
          Left = 1
          Top = 53
          Width = 35
          Height = 12
          Anchors = [akLeft, akTop, akRight]
          Brush.Color = 16742263
          Pen.Color = clMaroon
          Shape = stEllipse
        end
        object ImZamer: TImage
          Left = 18
          Top = 34
          Width = 19
          Height = 20
          Center = True
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000120B0000120B0000000000000000
            0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFA58C69A48B68A48B68FF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA9C74FCD39BFFE4A7FFE7B0
            BFA47CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFAC9473F9CF99112FC50013D81346E3FFF3C0A48A67FF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFA68C67E1CABC0016D7002FE90034FF
            FFFFD4A38965FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFA68C68FFE4B91A4EE9000FC51961FFFFFCD3A38965FF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC2A57CE2C7990009CFFFFFD0
            CCB288FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFA58A64FFF9D3000AD9FFFFE4BDA279FF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA58A65FFF8D30011E2FFFFE3
            BCA179FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFA68B65DCC7A70017ECFFFFE3BCA079FF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA58A65FFF7D2001EF5FFFFE2
            BCA079FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFA58A65FFF7D10025FEFFFFE2BCA179FF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA68A65DBC5A6002CFFFFFFE1
            BDA27AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFA48965FFF3D2002AFFFFFFE3BDA27BFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA38966FFF0D8FFF6DBFFFFEA
            BEA480FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFB69972B59974BAA07BFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF}
          Transparent = True
          Visible = False
        end
      end
    end
    object pnlTube: TPanel
      Left = 616
      Top = 52
      Width = 185
      Height = 191
      BevelOuter = bvNone
      TabOrder = 1
      object lblTube: TLabel
        Left = 0
        Top = 0
        Width = 185
        Height = 13
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1058#1088#1091#1073#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pTankTube: TPanel
        Left = 8
        Top = 13
        Width = 52
        Height = 33
        PopupMenu = PopupMenuTank
        TabOrder = 0
        Visible = False
        DesignSize = (
          52
          33)
        object sFullTube: TShape
          Left = 1
          Top = 14
          Width = 50
          Height = 17
          Anchors = [akLeft, akTop, akRight]
        end
        object sFillTube: TShape
          Left = 2
          Top = 15
          Width = 37
          Height = 16
          Brush.Color = clBackground
          Pen.Color = clNavy
          Pen.Style = psClear
        end
        object lblTankNumberTube: TLabel
          Left = 22
          Top = 16
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = #8470'%s'
          Color = clGrayText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object lblNpNameTube: TLabel
          Left = 5
          Top = 16
          Width = 36
          Height = 20
          AutoSize = False
          Caption = #1040'-80'
          Color = clGrayText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object lblFullnessTube: TLabel
          Left = 41
          Top = 1
          Width = 10
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = '%'
          Color = clGrayText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
      end
    end
    object pTanksCap: TPanel
      Left = 2
      Top = 2
      Width = 1023
      Height = 39
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        1023
        39)
      object Panel3: TPanel
        Left = 103
        Top = 2
        Width = 720
        Height = 36
        Anchors = [akTop]
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        object Shape1: TShape
          Left = 7
          Top = 5
          Width = 10
          Height = 10
          Brush.Color = clBtnFace
          Pen.Style = psClear
        end
        object Label4: TLabel
          Left = 22
          Top = 2
          Width = 160
          Height = 13
          Caption = #1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1082#1085#1080#1078#1085#1086#1077' '#1076#1074#1080#1078#1077#1085#1080#1077
        end
        object Shape2: TShape
          Left = 189
          Top = 5
          Width = 10
          Height = 10
          Brush.Color = 44544
          Pen.Style = psClear
        end
        object Label5: TLabel
          Left = 204
          Top = 2
          Width = 142
          Height = 13
          Caption = #1082#1085#1080#1078#1085#1086#1077' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1079#1072' 3 '#1076#1085#1103
        end
        object Shape3: TShape
          Left = 354
          Top = 5
          Width = 10
          Height = 10
          Brush.Color = 57311
          Pen.Style = psClear
        end
        object Label6: TLabel
          Left = 369
          Top = 2
          Width = 154
          Height = 13
          Caption = #1082#1085#1080#1078#1085#1086#1077' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1079#1072' 15 '#1076#1085#1077#1081
        end
        object Label7: TLabel
          Left = 544
          Top = 2
          Width = 172
          Height = 13
          Caption = #1082#1085#1080#1078#1085#1086#1077' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1073#1086#1083#1077#1077' 15 '#1076#1085#1077#1081
        end
        object Shape4: TShape
          Left = 529
          Top = 5
          Width = 10
          Height = 10
          Brush.Color = 2105599
          Pen.Style = psClear
        end
        object ImLegend1: TImage
          Left = 7
          Top = 16
          Width = 20
          Height = 20
          Center = True
          Transparent = True
        end
        object Label2: TLabel
          Left = 31
          Top = 18
          Width = 52
          Height = 13
          Caption = #1074' '#1088#1077#1084#1086#1085#1090#1077
        end
        object Label11: TLabel
          Left = 117
          Top = 18
          Width = 64
          Height = 13
          Caption = #1076#1080#1072#1075#1085#1086#1089#1090#1080#1082#1072
        end
        object ImLegend2: TImage
          Left = 92
          Top = 16
          Width = 20
          Height = 20
          Center = True
          Transparent = True
        end
        object ImLegend3: TImage
          Left = 189
          Top = 16
          Width = 20
          Height = 20
          Center = True
          Transparent = True
        end
        object Label12: TLabel
          Left = 214
          Top = 18
          Width = 55
          Height = 13
          Caption = #1072#1074#1090#1086#1079#1072#1084#1077#1088
        end
        object ImLegend4: TImage
          Left = 276
          Top = 16
          Width = 20
          Height = 20
          Center = True
          Transparent = True
        end
        object Label13: TLabel
          Left = 301
          Top = 18
          Width = 93
          Height = 13
          Caption = #1085#1077#1090' '#1079#1072#1084#1077#1088#1072' '#1079#1072' '#1095#1072#1089
        end
        object cbValidColor: TCheckBox
          Left = 425
          Top = 18
          Width = 148
          Height = 17
          Caption = #1087#1086#1076#1089#1074#1077#1090#1080#1090#1100' '#1087#1088#1086#1073#1083#1077#1084#1085#1099#1077
          Checked = True
          ParentShowHint = False
          ShowHint = True
          State = cbChecked
          TabOrder = 0
          OnClick = cbValidColorClick
        end
      end
    end
    object pnlSums: TPanel
      Left = 2
      Top = 247
      Width = 1023
      Height = 51
      Align = alBottom
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object pnlSumPark: TPanel
        Left = 0
        Top = 0
        Width = 330
        Height = 51
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        OnClick = pnlSumParkClick
        object lblFillParkValue: TLabel
          Left = 94
          Top = 15
          Width = 76
          Height = 13
          Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
          Alignment = taRightJustify
          Caption = '90000 '#1082#1075'. (90%)'
          ParentShowHint = False
          ShowHint = True
          OnClick = pnlSumParkClick
        end
        object lblFillPark: TLabel
          Left = 6
          Top = 15
          Width = 61
          Height = 13
          Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
          Caption = #1047#1072#1087#1086#1083#1085#1077#1085#1086' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = pnlSumParkClick
        end
        object lblUnusedPark: TLabel
          Left = 6
          Top = 28
          Width = 55
          Height = 13
          Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
          Caption = #1057#1074#1086#1073#1086#1076#1085#1086' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = pnlSumParkClick
        end
        object lblUnusedParkValue: TLabel
          Left = 94
          Top = 28
          Width = 76
          Height = 13
          Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
          Alignment = taRightJustify
          Caption = '10000 '#1082#1075'. (10%)'
          ParentShowHint = False
          ShowHint = True
          OnClick = pnlSumParkClick
        end
        object lblWeigthPark: TLabel
          Left = 6
          Top = 2
          Width = 87
          Height = 13
          Caption = #1042#1077#1089' '#1087#1086' '#1087#1072#1088#1082#1091' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = pnlSumParkClick
        end
        object lblFillParkBook: TLabel
          Left = 188
          Top = 15
          Width = 53
          Height = 13
          Caption = #1050#1085#1080#1078#1085#1099#1077' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = pnlSumParkClick
        end
        object lblFillParkDiff: TLabel
          Left = 188
          Top = 28
          Width = 44
          Height = 13
          Caption = #1044#1077#1083#1100#1090#1072' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = pnlSumParkClick
        end
        object lblFillParkBookValue: TLabel
          Left = 278
          Top = 15
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = '89000 '#1082#1075'.'
          OnClick = pnlSumParkClick
        end
        object lblFillParkDiffValue: TLabel
          Left = 284
          Top = 28
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = '1000 '#1082#1075'.'
          OnClick = pnlSumParkClick
        end
        object imgOpenPanel: TImage
          Left = 2
          Top = 42
          Width = 326
          Height = 7
          Align = alBottom
          Center = True
          Picture.Data = {
            07544269746D6170AE000000424DAE0000000000000076000000280000000D00
            0000070000000100040000000000380000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFF4FFFFFF000FFFFF4F4FFFFF000FFFF4FFF4FFFF000FFF4FF4FF4FF
            F000FF4FF4F4FF4FF000F4FF4FFF4FF4F0004FF4FFFFF4FF4000}
          Transparent = True
          OnClick = pnlSumParkClick
        end
      end
      object pnlSumNpColor: TPanel
        Left = 330
        Top = 0
        Width = 330
        Height = 51
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BorderWidth = 1
        Color = clBlue
        TabOrder = 1
        object pnlSumNp: TPanel
          Left = 3
          Top = 3
          Width = 324
          Height = 45
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object lblUnusedNpValue: TLabel
            Left = 92
            Top = 26
            Width = 76
            Height = 13
            Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
            Alignment = taRightJustify
            Caption = '10000 '#1082#1075'. (10%)'
            ParentShowHint = False
            ShowHint = True
          end
          object lblFillNpValue: TLabel
            Left = 92
            Top = 13
            Width = 76
            Height = 13
            Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
            Alignment = taRightJustify
            Caption = '90000 '#1082#1075'. (90%)'
            ParentShowHint = False
            ShowHint = True
          end
          object lblWeigthNp: TLabel
            Left = 6
            Top = 0
            Width = 79
            Height = 13
            Caption = #1042#1077#1089' '#1087#1086' A-92 :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblFillNp: TLabel
            Left = 6
            Top = 13
            Width = 61
            Height = 13
            Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
            Caption = #1047#1072#1087#1086#1083#1085#1077#1085#1086' :'
            ParentShowHint = False
            ShowHint = True
          end
          object lblUnusedNp: TLabel
            Left = 6
            Top = 26
            Width = 55
            Height = 13
            Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
            Caption = #1057#1074#1086#1073#1086#1076#1085#1086' :'
            ParentShowHint = False
            ShowHint = True
          end
          object lblFillNpBook: TLabel
            Left = 188
            Top = 13
            Width = 53
            Height = 13
            Caption = #1050#1085#1080#1078#1085#1099#1077' :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblFillNpDiff: TLabel
            Left = 188
            Top = 25
            Width = 44
            Height = 13
            Caption = #1044#1077#1083#1100#1090#1072' :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblFillNpDiffValue: TLabel
            Left = 280
            Top = 25
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = '1000 '#1082#1075'.'
          end
          object lblFillNpBookValue: TLabel
            Left = 274
            Top = 13
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = '89000 '#1082#1075'.'
          end
        end
      end
      object pnlSumTankColor: TPanel
        Left = 660
        Top = 0
        Width = 330
        Height = 51
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        BorderWidth = 1
        Color = clBlue
        TabOrder = 2
        object Panel5: TPanel
          Left = 3
          Top = 3
          Width = 324
          Height = 45
          Align = alClient
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lblUnusedTankValue: TLabel
            Left = 92
            Top = 26
            Width = 76
            Height = 13
            Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
            Alignment = taRightJustify
            Caption = '10000 '#1082#1075'. (10%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object lblFillTankValue: TLabel
            Left = 92
            Top = 13
            Width = 76
            Height = 13
            Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
            Alignment = taRightJustify
            Caption = '90000 '#1082#1075'. (90%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object lblWeigthTank: TLabel
            Left = 6
            Top = 0
            Width = 185
            Height = 13
            Caption = #1042#1077#1089' '#1087#1086' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1091' '#8470'8 '#1089' '#1040'-92 :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblFillTank: TLabel
            Left = 6
            Top = 13
            Width = 61
            Height = 13
            Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
            Caption = #1047#1072#1087#1086#1083#1085#1077#1085#1086' :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object lblUnusedTank: TLabel
            Left = 6
            Top = 26
            Width = 55
            Height = 13
            Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
            Caption = #1057#1074#1086#1073#1086#1076#1085#1086' :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object lblFillTankBookValue: TLabel
            Left = 274
            Top = 13
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = '89000 '#1082#1075'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblFillTankDiffValue: TLabel
            Left = 280
            Top = 25
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = '1000 '#1082#1075'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblFillTankDiff: TLabel
            Left = 188
            Top = 25
            Width = 44
            Height = 13
            Caption = #1044#1077#1083#1100#1090#1072' :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblFillTankBook: TLabel
            Left = 188
            Top = 13
            Width = 53
            Height = 13
            Caption = #1050#1085#1080#1078#1085#1099#1077' :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
        end
      end
    end
  end
  object pnlDetail: TPanel
    Left = 0
    Top = 310
    Width = 1027
    Height = 324
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object lblTank: TLabel
      Left = 210
      Top = 11
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088' :'
    end
    object PageControl: TPageControl
      Left = 2
      Top = 2
      Width = 1023
      Height = 320
      ActivePage = tsChartAllFuel
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      Images = ilTabSheets
      ParentFont = False
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = PageControlChange
      object tsChartAllFuel: TTabSheet
        Caption = #1043#1083#1072#1074#1085#1072#1103
        object dbcAllFuel: TDBChart
          Left = 0
          Top = 0
          Width = 1015
          Height = 288
          AutoRefresh = False
          BackWall.Brush.Color = clWhite
          MarginBottom = 1
          MarginLeft = 1
          MarginRight = 1
          MarginTop = 1
          Title.Font.Height = -15
          Title.Text.Strings = (
            #1044#1077#1083#1100#1090#1072' '#1087#1086' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1085#1086#1084#1091' '#1087#1072#1088#1082#1091' ('#1056'1 + '#1056'3)')
          BottomAxis.AxisValuesFormat = '0'
          BottomAxis.DateTimeFormat = 'dd.MM'
          BottomAxis.LabelsAngle = 330
          BottomAxis.LabelsSize = 40
          BottomAxis.TicksInner.Style = psDashDot
          BottomAxis.Title.Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          BottomAxis.Title.Font.Style = [fsBold]
          BottomAxis.Title.Visible = False
          Chart3DPercent = 2
          LeftAxis.Title.Caption = #1042#1077#1089', '#1082#1075
          LeftAxis.Title.Font.Style = [fsBold]
          Legend.Alignment = laTop
          Legend.CheckBoxes = True
          Legend.ColorWidth = 30
          Legend.Frame.Style = psDashDotDot
          Legend.Frame.SmallDots = True
          Legend.Frame.Visible = False
          Legend.Inverted = True
          Legend.LegendStyle = lsSeries
          Legend.Shadow.HorizSize = 0
          Legend.Shadow.VertSize = 0
          Legend.Symbol.Width = 30
          Legend.TopPos = 0
          TopAxis.Visible = False
          View3DOptions.Perspective = 10
          Zoom.Animated = True
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            1015
            288)
          PrintMargins = (
            15
            20
            15
            20)
          ColorPaletteIndex = 9
          object pnlMainDate: TPanel
            Left = 2
            Top = 2
            Width = 236
            Height = 30
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object lblMainDateBegin: TLabel
              Left = 6
              Top = 8
              Width = 7
              Height = 13
              Caption = 'C'
            end
            object lblMainDateEnd: TLabel
              Left = 119
              Top = 8
              Width = 12
              Height = 13
              Caption = #1087#1086
            end
            object deBeginDateMain: TDateEdit
              Left = 21
              Top = 4
              Width = 91
              Height = 21
              DefaultToday = True
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              YearDigits = dyFour
              TabOrder = 0
              Text = '08.01.2008'
              OnChange = deBeginDateChange
            end
            object deEndDateMain: TDateEdit
              Left = 138
              Top = 4
              Width = 93
              Height = 21
              CheckOnExit = True
              DefaultToday = True
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              YearDigits = dyFour
              TabOrder = 1
              Text = '08.01.2008'
              OnChange = deEndDateChange
            end
          end
          object bbOnDay: TBitBtn
            Left = 240
            Top = 4
            Width = 60
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1047#1072' '#1089#1091#1090#1082#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = bbOnDayClick
          end
          object AllFuelSeries: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Callout.Length = 8
            Marks.Visible = True
            SeriesColor = 11796403
            Title = #1048#1058#1054#1043#1054
            Transparency = 30
            BarWidthPercent = 50
            DepthPercent = 50
            Gradient.Direction = gdTopBottom
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
          object CursorTool1: TCursorTool
            FollowMouse = True
            Pen.Width = 2
            Style = cssVertical
            OnChange = CursorChartToolChange
          end
        end
      end
      object tsChart: TTabSheet
        Caption = #1043#1088#1072#1092#1080#1082' '#1087#1086' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1091
        ImageIndex = 1
        object Splitter: TSplitter
          Left = 915
          Top = 0
          Height = 288
          Align = alRight
        end
        object DiffChart: TChart
          Left = 918
          Top = 0
          Width = 97
          Height = 288
          Cursor = crArrow
          Legend.CurrentPage = False
          Legend.Visible = False
          MarginBottom = 10
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 10
          Title.Color = 4227327
          Title.CustomPosition = True
          Title.Font.Color = 4227327
          Title.Left = 22
          Title.Text.Strings = (
            #1056#1072#1079#1085#1080#1094#1072)
          Title.Top = 0
          BottomAxis.Visible = False
          DepthTopAxis.LabelsSeparation = 0
          LeftAxis.Axis.Visible = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 5.000000000000000000
          LeftAxis.MaximumOffset = 100
          LeftAxis.MaximumRound = True
          LeftAxis.MinimumOffset = 100
          LeftAxis.MinimumRound = True
          Pages.ScaleLastPage = False
          View3D = False
          View3DOptions.HorizOffset = 4
          View3DOptions.Orthogonal = False
          View3DOptions.Zoom = 97
          View3DWalls = False
          Zoom.Allow = False
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          PrintMargins = (
            32
            15
            32
            15)
          object OneDiffSeries: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = True
            SeriesColor = 3947775
            Gradient.Direction = gdTopBottom
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000000000}
          end
          object ChartTool1: TPageNumTool
            Active = False
            Callout.Brush.Color = clBlack
            Callout.Arrow.Visible = False
            Shape.Text = 'Page 1 of 1'
            Text = 'Page 1 of 1'
            DisabledButton.EndColor = clSilver
            DisabledButton.Visible = True
            EnabledButton.EndColor = clSilver
            EnabledButton.StartColor = clBlack
            EnabledButton.Visible = True
          end
        end
        object pnlChart1: TPanel
          Left = 0
          Top = 0
          Width = 915
          Height = 288
          Align = alClient
          TabOrder = 1
          object DBChart: TDBChart
            Left = 1
            Top = 34
            Width = 913
            Height = 253
            BackWall.Brush.Color = clWhite
            MarginBottom = 1
            MarginLeft = 1
            MarginRight = 1
            MarginTop = 1
            Title.Font.Height = -15
            Title.Text.Strings = (
              #1044#1074#1080#1078#1077#1085#1080#1077' '#1090#1086#1087#1083#1080#1074#1072' '#1087#1086' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1091)
            Title.Visible = False
            OnUndoZoom = DBChartUndoZoom
            OnZoom = DBChartZoom
            BottomAxis.DateTimeFormat = 'dd.MM hh:mm'
            BottomAxis.LabelsAngle = 330
            BottomAxis.LabelsSize = 40
            BottomAxis.TicksInner.Style = psDashDot
            BottomAxis.Title.Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            BottomAxis.Title.Font.Style = [fsBold]
            BottomAxis.Title.Visible = False
            LeftAxis.Title.Caption = #1042#1077#1089', '#1082#1075
            LeftAxis.Title.Font.Style = [fsBold]
            Legend.Alignment = laTop
            Legend.CheckBoxes = True
            Legend.ColorWidth = 30
            Legend.FontSeriesColor = True
            Legend.Frame.Style = psDashDotDot
            Legend.Frame.SmallDots = True
            Legend.Frame.Visible = False
            Legend.Gradient.Direction = gdBottomTop
            Legend.Gradient.MidColor = clWhite
            Legend.Gradient.Visible = True
            Legend.Inverted = True
            Legend.LegendStyle = lsSeries
            Legend.Shadow.HorizSize = 0
            Legend.Shadow.VertSize = 0
            Legend.Symbol.Squared = True
            Legend.Symbol.Width = 30
            Legend.TopPos = 0
            RightAxis.AxisValuesFormat = '#,##0.###'#176
            RightAxis.ExactDateTime = False
            RightAxis.Increment = 5.000000000000000000
            RightAxis.LabelsFont.Color = clBlue
            RightAxis.MaximumRound = True
            RightAxis.MinimumRound = True
            RightAxis.Title.Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072', '#1057#176
            RightAxis.Title.Font.Color = clBlue
            RightAxis.Title.Font.Style = [fsBold]
            RightAxis.Title.Color = clBlue
            TopAxis.Visible = False
            View3D = False
            View3DOptions.Orthogonal = False
            View3DOptions.Perspective = 0
            Zoom.Animated = True
            OnBeforeDrawSeries = DBChartBeforeDrawSeries
            Align = alClient
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 0
            PrintMargins = (
              15
              20
              15
              20)
            object sbFullScreen: TSpeedButton
              Left = 9
              Top = 8
              Width = 30
              Height = 30
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFABA7A68C8888C09596FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFACA8A786868A2A669A4B7BA0C09494FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9D9D5492C22E99FF1B7C
                CB557A97C19595FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3DADFF
                57C1FF4DB1FF3196FA197CC9537997C19495FF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF41ABFF5DBFFE4DAFFF3196FA197BC85A7A97C29594FF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF42ABFE5CC0FE4DAFFF3096FA19
                7AC8587A96C19494FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF42AC
                FE5CC0FE4DAFFF2E94FA187AC75F7C97BB9396FF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF44ADFE5CBFFE4DB0FF2D94F81979C6437397FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF46AEFE5CBFFE4CB0FF3F97ED
                577B94FF00FFFF00FFFF00FFAE837EAE837EAE837EAE837EAE837EFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF46
                AFFE66C5FFA3CCF1BEB3AB867170A9807AAE837EE5D8BDFFFFE2FFFFE2FFFFE0
                EEDFC6AE837EAE837EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFDCBFB8C69E8ED8BDA3FFFFDDFFFFDDFF
                FFDBFFFFDAFFFFDBFFFFDDFFFFE9DEC9B7AE837EFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE857FDEC0A5FFF3
                C1FCF1C8FFFFDAFFFFD9FFFFDAFFFFE0FFFFE4FFFFEFFFFFFFDDCAC8AE837EFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                AE837EFFEFB9F5D4A5FBF0C6FFFFDBFFFFDAFFFFDDFFFFEBFFFFF5FFFFFBFFFF
                FDFFFFFEAE837EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFAE837EECD5B4F8D6A2F2C997FCEDC4FFFFDBFFFFDAFFFFE0FFFFF0
                FFFFFEFFFFFDFFFFF5FFFFEBE1D3B8AE837EFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFAE837EFFF3BFF4CB95F0C18EF9E5BAFEFDD7FF
                FFDCFFFFDFFFFFECFFFFF8FFFFF8FFFFECFFFFE0FFFFE3AE837EFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE837EFFF4C0F3C994EEB8
                84F5D5A5FDF3CBFFFFDCFFFFDDFFFFE2FFFFE8FFFFE9FFFFE2FFFFDDFFFFE3AE
                837EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE837E
                FFF5C3F6D19CEEB27DF1C593F7E0B3FDF7D0FFFFDCFFFFDDFFFFDDFFFFDDFFFF
                DBFFFFDAFFFFE1AE837EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFAE837EECD5B4FDE6B2F3C996F2C792F3D09CF8E3B5FCF5CDFFFFDA
                FFFFDCFFFFDBFFFFDBFFFFDCE2D3B8AE837EFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFAE837EFFFED0FCF0D6F8E0BEF4CF9DF3
                CD9AF6D8AAFBEABFFDF4CBFCF7CFFEF8D1FFFFDEAE837EFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE837EE0CAB2FFFF
                FFFEF9F2F8E1BEF1C48DEEBA85F1C491F4D1A1F8DEB0FFF7C6DDC7AEAE837EFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFAE837ED9C6C0FFFFFFFFF7D7F8DAA6F4CB95F5CD99F9D9A6FFF1BBDEC2
                A9AE837EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFAE837EAE837EE8D5B4FFF9C5FFF5C0FFF5C2
                EED8B7AE837EAE837EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE837EAE
                837EAE837EAE837EAE837EFF00FFFF00FFFF00FFFF00FFFF00FF}
              OnClick = sbFullScreenClick
            end
            object DiffSeries: TLineSeries
              Marks.Arrow.Visible = True
              Marks.Callout.Brush.Color = clBlack
              Marks.Callout.Arrow.Visible = True
              Marks.Font.Style = [fsBold]
              Marks.Frame.Visible = False
              Marks.Shadow.Color = 8684676
              Marks.Style = smsValue
              Marks.Transparent = True
              Marks.Visible = False
              DataSource = qChartBaseGroup
              SeriesColor = 4227327
              Shadow.Visible = False
              Title = #1056#1072#1079#1085#1080#1094#1072' '#1090#1086#1074' '#1086#1087' - '#1079#1072#1084#1077#1088#1099
              LinePen.Color = 4227327
              LinePen.Width = 2
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Order = loAscending
              XValues.ValueSource = 'MDATE'
              YValues.Name = 'Y'
              YValues.Order = loNone
              YValues.ValueSource = 'DIFF'
            end
            object DiffSeries2: TLineSeries
              Marks.Arrow.Visible = True
              Marks.Callout.Brush.Color = clBlack
              Marks.Callout.Arrow.Visible = True
              Marks.Font.Style = [fsBold]
              Marks.Frame.Visible = False
              Marks.Shadow.Color = 8684676
              Marks.Style = smsValue
              Marks.Transparent = True
              Marks.Visible = False
              DataSource = qChartDiff2
              SeriesColor = 503652
              Shadow.Visible = False
              Title = #1056#1072#1079#1085#1080#1094#1072' '#1072#1074#1090#1086#1079#1072#1084#1077#1088#1099' - '#1076#1086#1082
              LinePen.Color = clTeal
              LinePen.Width = 2
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Order = loAscending
              XValues.ValueSource = 'DATETIME'
              YValues.Name = 'Y'
              YValues.Order = loNone
              YValues.ValueSource = 'DIFF_WEIGHT'
            end
            object TemperSeries: TLineSeries
              Active = False
              Gradient.EndColor = 8388863
              Gradient.StartColor = 16744448
              Gradient.Visible = True
              Marks.Arrow.Visible = True
              Marks.Callout.Brush.Color = clBlack
              Marks.Callout.Arrow.Visible = True
              Marks.Shadow.Color = 8487297
              Marks.Visible = False
              DataSource = qChartBaseGroup
              SeriesColor = clBlue
              Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
              VertAxis = aRightAxis
              LinePen.Width = 2
              Pointer.HorizSize = 2
              Pointer.InflateMargins = True
              Pointer.Style = psDownTriangle
              Pointer.VertSize = 2
              Pointer.Visible = True
              TreatNulls = tnSkip
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Order = loAscending
              XValues.ValueSource = 'MDATE'
              YValues.Name = 'Y'
              YValues.Order = loNone
              YValues.ValueSource = 'TEMPER'
            end
            object FactSeries: TLineSeries
              Active = False
              Marks.Arrow.Visible = True
              Marks.Callout.Brush.Color = clBlack
              Marks.Callout.Arrow.Visible = True
              Marks.Style = smsValue
              Marks.Visible = False
              DataSource = qChartBaseGroup
              Title = #1056#1091#1095#1085#1099#1077' '#1079#1072#1084#1077#1088#1099
              OnClick = FactSeriesPointsClick
              ClickableLine = False
              LinePen.Color = clRed
              LinePen.Width = 2
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Order = loAscending
              XValues.ValueSource = 'MDATE'
              YValues.Name = 'Y'
              YValues.Order = loNone
              YValues.ValueSource = 'LITRES_ALL'
              OnClickPointer = FactSeriesClickPointer
            end
            object BookSeries: TLineSeries
              Marks.Arrow.Visible = True
              Marks.Callout.Brush.Color = clBlack
              Marks.Callout.Arrow.Visible = True
              Marks.Style = smsValue
              Marks.Visible = False
              DataSource = qChartBaseGroup
              SeriesColor = 25600
              Shadow.Visible = False
              Title = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
              OnClick = BookSeriesPointsClick
              LinePen.Color = clBlue
              LinePen.Width = 2
              Pointer.HorizSize = 2
              Pointer.InflateMargins = True
              Pointer.Style = psCircle
              Pointer.VertSize = 2
              Pointer.Visible = True
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Order = loAscending
              XValues.ValueSource = 'MDATE'
              YValues.Name = 'Y'
              YValues.Order = loNone
              YValues.ValueSource = 'CURAMOUNT'
              OnClickPointer = BookSeriesPointsClickPointer
            end
            object FactSeriesPoints: TLineSeries
              Marks.Arrow.Visible = True
              Marks.Callout.Brush.Color = clBlack
              Marks.Callout.Arrow.Visible = True
              Marks.Visible = False
              DataSource = qChartBaseGroup
              SeriesColor = clRed
              ShowInLegend = False
              OnClick = FactSeriesPointsClick
              LinePen.Visible = False
              Pointer.HorizSize = 3
              Pointer.InflateMargins = True
              Pointer.Style = psCircle
              Pointer.VertSize = 3
              Pointer.Visible = True
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Order = loAscending
              XValues.ValueSource = 'MDATE'
              YValues.Name = 'Y'
              YValues.Order = loNone
              YValues.ValueSource = 'LITRES_ALL_POINTS'
              OnClickPointer = FactSeriesClickPointer
            end
            object BookSeriesPoints: TLineSeries
              Marks.Arrow.Visible = True
              Marks.Callout.Brush.Color = clBlack
              Marks.Callout.Arrow.Visible = True
              Marks.Shadow.Color = 8553090
              Marks.Visible = False
              DataSource = qChartBaseGroup
              ShowInLegend = False
              OnClick = BookSeriesPointsClick
              LinePen.Visible = False
              Pointer.HorizSize = 2
              Pointer.InflateMargins = True
              Pointer.Style = psCircle
              Pointer.VertSize = 2
              Pointer.Visible = True
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Order = loAscending
              XValues.ValueSource = 'MDATE'
              YValues.Name = 'Y'
              YValues.Order = loNone
              YValues.ValueSource = 'CURAMOUNT_POINTS'
              OnClickPointer = BookSeriesPointsClickPointer
            end
            object ZamerSeries: TLineSeries
              Active = False
              Marks.Arrow.Visible = True
              Marks.Callout.Brush.Color = clBlack
              Marks.Callout.Arrow.Visible = True
              Marks.Visible = False
              DataSource = qChartZamer
              SeriesColor = 16744448
              Title = #1040#1074#1090#1086#1079#1072#1084#1077#1088#1099
              LineHeight = 1
              LinePen.Color = 16744448
              LinePen.Width = 2
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Order = loAscending
              XValues.ValueSource = 'DATETIME'
              YValues.Name = 'Y'
              YValues.Order = loNone
              YValues.ValueSource = 'WEIGHT'
            end
            object DocSeries: TLineSeries
              Marks.Arrow.Visible = True
              Marks.Callout.Brush.Color = clBlack
              Marks.Callout.Arrow.Visible = True
              Marks.Visible = False
              DataSource = qChartDoc
              SeriesColor = clFuchsia
              Title = #1044#1086#1082#1091#1084#1077#1085#1090#1099
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Order = loAscending
              XValues.ValueSource = 'DATETIME'
              YValues.Name = 'Y'
              YValues.Order = loNone
              YValues.ValueSource = 'WEIGHT'
            end
            object FaderChartTool: TFaderTool
              Color = clBtnFace
              InitialDelay = 0
              Speed = 5.000000000000000000
            end
            object CursorChartTool: TCursorTool
              FollowMouse = True
              Pen.Width = 2
              Style = cssVertical
              OnChange = CursorChartToolChange
            end
            object GridBandChartTool: TGridBandTool
              Band1.Color = 15790320
              Band1.BackColor = clWhite
              Band1.Gradient.Balance = 0
              Band1.Gradient.Direction = gdBottomTop
              Band1.Gradient.EndColor = 12058623
              Band1.Gradient.MidColor = clWhite
              Band1.Gradient.StartColor = 15395562
              Band1.Gradient.SubGradient.Transparency = 51
              Band2.Color = clWhite
              Band2.Gradient.EndColor = 13828095
              Band2.Gradient.StartColor = 15395562
              AxisID = 2
            end
            object AnnotationChartTool: TAnnotationTool
              Active = False
              Callout.Brush.Color = clBlack
              Callout.Arrow.Visible = False
              Shape.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1086#1095#1082#1080':'
              Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1086#1095#1082#1080':'
              OnClick = AnnotationChartToolClick
            end
            object MagnifyTool: TMagnifyTool
              Callout.Brush.Color = clBlack
              Callout.Arrow.Visible = False
              Position = ppLeftBottom
              Shape.Brush.Color = clWhite
              Shape.Brush.Style = bsClear
              Shape.CustomPosition = False
              Shape.Shadow.HorizSize = 0
              Shape.Shadow.VertSize = 0
              Shape.AutoSize = False
              Shape.Cursor = crHandPoint
              Height = 70
              Width = 70
              Percent = 50.000000000000000000
            end
            object FullScreenTool: TFullScreenTool
            end
          end
          object pnlFilters: TPanel
            Left = 1
            Top = 1
            Width = 913
            Height = 33
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 1
            DesignSize = (
              913
              33)
            object Label10: TLabel
              Left = 628
              Top = 10
              Width = 124
              Height = 13
              Anchors = [akTop, akRight]
              Caption = #1054#1089#1090#1072#1090#1082#1080' '#1074' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072#1093' :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblTitleChart: TLabel
              Left = 301
              Top = 7
              Width = 320
              Height = 17
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight, akBottom]
              AutoSize = False
              Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' A-92'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object pnlChartDate: TPanel
              Left = 2
              Top = 2
              Width = 236
              Height = 29
              Align = alLeft
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object lblBeginDate: TLabel
                Left = 6
                Top = 8
                Width = 7
                Height = 13
                Caption = 'C'
              end
              object lblEndDate: TLabel
                Left = 119
                Top = 8
                Width = 12
                Height = 13
                Caption = #1087#1086
              end
              object deBeginDate: TDateEdit
                Left = 21
                Top = 4
                Width = 89
                Height = 21
                DefaultToday = True
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                YearDigits = dyFour
                TabOrder = 0
                Text = '07.09.2010'
                OnChange = deBeginDateChange
              end
              object deEndDate: TDateEdit
                Left = 138
                Top = 4
                Width = 92
                Height = 21
                CheckOnExit = True
                DefaultToday = True
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                YearDigits = dyFour
                TabOrder = 1
                Text = '09.09.2010'
                OnChange = deEndDateChange
              end
            end
            object cbRests: TComboBox
              Left = 754
              Top = 6
              Width = 155
              Height = 21
              Style = csDropDownList
              Anchors = [akTop, akRight]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ItemIndex = 0
              ParentFont = False
              TabOrder = 1
              Text = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
              OnChange = cbRestsChange
              Items.Strings = (
                #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
                #1050#1085#1080#1078#1085#1099#1077)
            end
            object ZamerBtn: TBitBtn
              Left = 240
              Top = 4
              Width = 60
              Height = 25
              Anchors = [akTop, akRight]
              Caption = #1047#1072' '#1089#1091#1090#1082#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnClick = ZamerBtnClick
            end
          end
        end
      end
      object tsRepDensity: TTabSheet
        Caption = #1054#1090#1095#1077#1090' '#1087#1083#1086#1090#1085#1086#1089#1090#1080
        ImageIndex = 5
      end
      object tsKolebRef: TTabSheet
        Caption = #1050#1086#1083#1077#1073#1072#1085#1080#1103' '#1088#1072#1079#1085#1080#1094#1099
        ImageIndex = 5
      end
      object tsCountDiff: TTabSheet
        Caption = #1043#1088#1072#1092#1080#1082' '#1082#1086#1083#1077#1073#1072#1085#1080#1103' '#1088#1072#1079#1085#1080#1094#1099
        ImageIndex = 1
        OnShow = tsCountDiffShow
        object dbcCountDiff: TDBChart
          Left = 0
          Top = 0
          Width = 1015
          Height = 288
          AutoRefresh = False
          Title.Font.Height = -16
          Title.Text.Strings = (
            #1056#1072#1079#1085#1080#1094#1072' '#1087#1086' A-95')
          Chart3DPercent = 1
          Legend.CheckBoxes = True
          Legend.Inverted = True
          Legend.Title.Text.Strings = (
            #1056#1077#1079#1077#1088#1074#1091#1072#1088#1099' :')
          View3D = False
          View3DOptions.Zoom = 102
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          ColorPaletteIndex = 13
          object TankSeries: TAreaSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Callout.Length = 5
            Marks.Visible = False
            AreaBrush = bsHorizontal
            AreaChartBrush.Color = clWhite
            AreaChartBrush.Style = bsHorizontal
            DrawArea = True
            InvertedStairs = True
            MultiArea = maStacked
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            StackGroup = 1
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
            Data = {
              001900000000000000004080400000000000087B4000000000001C8140000000
              0000507E4000000000002082400000000000E07F400000000000108340000000
              000030814000000000003482400000000000BC81400000000000948140000000
              0000A084400000000000D8834000000000002C80400000000000087B40000000
              0000E877400000000000007E400000000000CC80400000000000D87D40000000
              0000C0774000000000001875400000000000F074400000000000A87640000000
              00002874400000000000287440}
          end
          object NpGroupSeries: TLineSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = False
            Title = #1056#1072#1079#1085#1080#1094#1072' '#1087#1086' '#1075#1088#1091#1087#1087#1077
            LineHeight = 1
            LinePen.Width = 2
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
      end
      object tsPoteriRez: TTabSheet
        Caption = #1055#1086#1090#1077#1088#1080' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1086#1074
        ImageIndex = 9
      end
      object tsAutoZamer: TTabSheet
        Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103' '#1091#1088#1086#1074#1085#1077#1084#1077#1088#1086#1074
        ImageIndex = 9
      end
      object tsBaseRepDeficit: TTabSheet
        Caption = #1040#1085#1072#1083#1080#1079' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1085'/'#1087
        ImageIndex = 8
      end
      object tsPrihChart: TTabSheet
        Caption = #1040#1085#1072#1083#1080#1079' '#1087#1088#1080#1093#1086#1076#1086#1074
        ImageIndex = 2
        object pcPrih: TPageControl
          Left = 0
          Top = 0
          Width = 1015
          Height = 288
          ActivePage = tsPrihTable
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          HotTrack = True
          Images = ilTabSheets
          ParentFont = False
          Style = tsFlatButtons
          TabOrder = 0
          OnChange = pcPrihChange
          object tsPrihTable: TTabSheet
            Caption = #1058#1072#1073#1083#1080#1094#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ImageIndex = 6
            ParentFont = False
          end
          object tsPrihGraphic: TTabSheet
            Caption = #1043#1088#1072#1092#1080#1082
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ImageIndex = 7
            ParentFont = False
          end
          object tsPrihBack: TTabSheet
            Caption = #1053#1072#1079#1072#1076
            ImageIndex = 4
          end
        end
      end
      object tsRashChart: TTabSheet
        Caption = #1040#1085#1072#1083#1080#1079' '#1088#1072#1089#1093#1086#1076#1086#1074
        ImageIndex = 3
        object pcRash: TPageControl
          Left = 0
          Top = 0
          Width = 1015
          Height = 288
          ActivePage = tsRashTable
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          HotTrack = True
          Images = ilTabSheets
          ParentFont = False
          Style = tsFlatButtons
          TabOrder = 0
          OnChange = pcRashChange
          object tsRashTable: TTabSheet
            Caption = #1058#1072#1073#1083#1080#1094#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ImageIndex = 6
            ParentFont = False
          end
          object tsRashGraphic: TTabSheet
            Caption = #1043#1088#1072#1092#1080#1082
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ImageIndex = 7
            ParentFont = False
          end
          object tsRashBack: TTabSheet
            Caption = #1053#1072#1079#1072#1076
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ImageIndex = 4
            ParentFont = False
          end
        end
      end
      object tsMeasureBase: TTabSheet
        Caption = #1047#1072#1084#1077#1088#1099' "Base"'
        ImageIndex = 5
      end
      object tsDocBase: TTabSheet
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099' "Base"'
        ImageIndex = 5
      end
      object tsHandInMeasure: TTabSheet
        Caption = #1042#1074#1086#1076' '#1079#1072#1084#1077#1088#1086#1074
        ImageIndex = -1
      end
      object tsHandInDocs: TTabSheet
        Caption = #1042#1074#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImageIndex = -1
        ParentFont = False
        DesignSize = (
          1015
          288)
        object cbClearDischargeDate: TSpeedButton
          Left = 327
          Top = 5
          Width = 24
          Height = 21
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
        end
        object LblDischargeDate1: TLabel
          Left = 178
          Top = 8
          Width = 59
          Height = 13
          Caption = #1044#1072#1090#1072' '#1089#1083#1080#1074#1072
        end
        object lFrom: TLabel
          Left = 14
          Top = 32
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = #1054#1090' '#1082#1086#1075#1086
        end
        object lTo: TLabel
          Left = 380
          Top = 32
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = #1050#1086#1084#1091
        end
        object lNP_Type: TLabel
          Left = 368
          Top = 80
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = #1058#1080#1087' '#1053#1055
        end
        object Label8: TLabel
          Left = 362
          Top = 56
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = #1044#1086#1075#1086#1074#1086#1088
        end
        object Label9: TLabel
          Left = 795
          Top = 57
          Width = 26
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1044#1072#1090#1072
        end
        object Label3: TLabel
          Left = 356
          Top = 8
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = #1054#1087#1077#1088#1072#1094#1080#1103
        end
        object Label1: TLabel
          Left = 21
          Top = 8
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = #1040#1082#1090' '#8470
        end
        object lRail: TLabel
          Left = 9
          Top = 57
          Width = 42
          Height = 13
          Caption = #1057#1090#1072#1085#1094#1080#1103
        end
        object edActHandly: TEdit
          Left = 56
          Top = 5
          Width = 113
          Height = 21
          TabOrder = 0
        end
        object edDischargeDate: TDateEdit
          Left = 242
          Top = 5
          Width = 83
          Height = 21
          Hint = #1044#1072#1090#1072' '#1089#1083#1080#1074#1072' '#1074' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1099
          CheckOnExit = True
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          YearDigits = dyFour
          TabOrder = 1
        end
        object edFrom: TComboEdit
          Left = 56
          Top = 29
          Width = 296
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          NumGlyphs = 1
          TabOrder = 2
        end
        object edTo: TComboEdit
          Left = 413
          Top = 29
          Width = 498
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 3
        end
        object gbDateMove: TGroupBox
          Left = 3
          Top = 72
          Width = 350
          Height = 35
          Caption = #1044#1072#1090#1072' '#1087#1088#1080#1093#1086#1076#1072
          TabOrder = 4
          object LblDateDoc: TLabel
            Left = 8
            Top = 13
            Width = 78
            Height = 13
            Caption = #1054#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
          end
          object LblDateDocRail: TLabel
            Left = 224
            Top = 13
            Width = 36
            Height = 13
            Caption = #1054#1090' '#1046#1044
          end
          object edDocDate: TDateEdit
            Left = 91
            Top = 10
            Width = 83
            Height = 21
            Hint = #1044#1072#1090#1072' '#1087#1088#1080#1093#1086#1076#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084' '#1086#1090' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
            CheckOnExit = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            YearDigits = dyFour
            TabOrder = 0
          end
          object edDocDateRail: TDateEdit
            Left = 263
            Top = 9
            Width = 83
            Height = 21
            Hint = #1044#1072#1090#1072' '#1087#1088#1080#1093#1086#1076#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084' '#1086#1090' '#1046#1044
            CheckOnExit = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            YearDigits = dyFour
            TabOrder = 1
          end
        end
        object edNP_Type: TComboEdit
          Left = 413
          Top = 77
          Width = 498
          Height = 21
          DirectInput = False
          Enabled = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 5
        end
        object edDog: TEdit
          Left = 413
          Top = 53
          Width = 377
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clSilver
          ReadOnly = True
          TabOrder = 6
        end
        object edDogDate: TDateEdit
          Left = 827
          Top = 53
          Width = 83
          Height = 21
          TabStop = False
          Color = clSilver
          ButtonWidth = 0
          Anchors = [akTop, akRight]
          NumGlyphs = 2
          ReadOnly = True
          YearDigits = dyFour
          TabOrder = 7
        end
        object DBGrid1: TDBGridEh
          Left = 0
          Top = 252
          Width = 1015
          Height = 36
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataGrouping.GroupLevels = <>
          DataSource = ds
          Enabled = False
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          RowDetailPanel.Color = clBtnFace
          TabOrder = 8
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'Nak'
              Footers = <>
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'Tank'
              Footers = <>
              Title.Hint = #1042#1099#1073#1077#1088#1077#1090#1077' '#1094#1080#1089#1090#1077#1088#1085#1091
              Width = 72
            end
            item
              EditButtons = <>
              FieldName = 'Tank_type'
              Footers = <>
              PickList.Strings = (
                #1062#1080#1089#1090#1077#1088#1085#1072)
              Width = 81
            end
            item
              EditButtons = <>
              FieldName = 'Rez_Name'
              Footers = <>
              Width = 66
            end
            item
              EditButtons = <>
              FieldName = 'Rez'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'CountDoc'
              Footers = <>
              Width = 69
            end
            item
              EditButtons = <>
              FieldName = 'Count_'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'IsDigitalText'
              Footers = <>
              PickList.Strings = (
                #1044#1072
                #1053#1077#1090)
              Width = 57
            end
            item
              EditButtons = <>
              FieldName = 'TECH_LOSS'
              Footers = <>
              ReadOnly = True
              Width = 68
            end
            item
              Color = 15658991
              EditButtons = <>
              FieldName = 'ND_Norm'
              Footers = <>
              ReadOnly = True
              Width = 72
            end
            item
              Color = 15658991
              EditButtons = <>
              FieldName = 'ND_Error'
              Footers = <>
              ReadOnly = True
              Width = 85
            end
            item
              Color = 15658991
              EditButtons = <>
              FieldName = 'ND_Post'
              Footers = <>
              ReadOnly = True
              Width = 93
            end
            item
              Color = 15658991
              EditButtons = <>
              FieldName = 'ND_Rail'
              Footers = <>
              ReadOnly = True
              Width = 95
            end
            item
              Color = 15658991
              EditButtons = <>
              FieldName = 'IZ_Norm'
              Footers = <>
              ReadOnly = True
              Width = 67
            end
            item
              Color = 15658991
              EditButtons = <>
              FieldName = 'IZ_Post'
              Footers = <>
              ReadOnly = True
              Width = 94
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object edOper: TComboEdit
          Left = 413
          Top = 5
          Width = 498
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 9
        end
        object edRail: TComboEdit
          Left = 56
          Top = 53
          Width = 296
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          NumGlyphs = 1
          TabOrder = 10
        end
      end
      object tsBaseTovarOperRef: TTabSheet
        Caption = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
        ImageIndex = 5
      end
      object tsRezervImageSvod: TTabSheet
        Caption = #1057#1074#1086#1076#1085#1072#1103' '#1090#1072#1073#1083#1080#1094#1072
        ImageIndex = -1
        TabVisible = False
      end
      object tsParams: TTabSheet
        Caption = #1047#1072#1084#1077#1088#1099' '#1091#1088#1086#1074#1085#1077#1084#1077#1088#1086#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImageIndex = -1
        ParentFont = False
        object RichEdit1: TRichEdit
          Left = 8
          Top = 8
          Width = 337
          Height = 145
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clInactiveBorder
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            #1042#1088#1077#1084#1103':'
            #1059#1088#1086#1074#1077#1085#1100' '#1090#1086#1087#1083#1080#1074#1072' ('#1084#1084'):'
            #1054#1073#1098#1077#1084' '#1090#1086#1087#1083#1080#1074#1072' ('#1082#1091#1073'.'#1084'):'
            #1054#1073#1098#1077#1084' '#1087#1088#1080#1074#1077#1076#1077#1085#1085#1099#1081' '#1082' 20 '#1075#1088#1072#1076#1091#1089#1072#1084' ('#1082#1091#1073'.'#1084'):'
            #1052#1072#1089#1089#1072' '#1090#1086#1087#1083#1080#1074#1072' ('#1090'):'
            #1057#1074#1086#1073#1086#1076#1085#1086' ('#1082#1091#1073'.'#1084'):'
            #1057#1074#1086#1073#1086#1076#1085#1086' ('#1090'):'
            #1057#1082#1086#1088#1086#1089#1090#1100' '#1089#1088#1077#1076#1085#1103#1103' ('#1082#1091#1073'.'#1084'/'#1095'):'
            #1057#1082#1086#1088#1086#1089#1090#1100' '#1089#1075#1085#1086#1074#1077#1085#1085#1072#1103' ('#1082#1091#1073'.'#1084'/'#1095'):')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object RichEdit2: TRichEdit
          Left = 8
          Top = 160
          Width = 337
          Height = 129
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clInactiveBorder
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            ''
            ''
            #1055#1086#1076#1087#1086#1074#1077#1088#1093#1085#1086#1089#1085#1072#1103':'
            #1057#1088#1077#1076#1080#1085#1085#1072#1103':'
            #1055#1088#1080#1076#1086#1085#1085#1072#1103':'
            #1042#1099#1095#1080#1089#1083#1077#1085'.'#1089#1088#1077#1076#1085#1103#1103':'
            #1042#1088#1077#1084#1103' '#1080#1079#1084#1077#1088#1077#1085#1080#1103':'
            #1052#1072#1089#1089#1072' ('#1090'):'
            #1053#1072' '#1091#1088#1086#1074#1085#1077' ('#1084#1084'):'
            #1087#1083#1086#1090#1085#1086#1089#1090#1100' ('#1082#1075'/'#1082#1091#1073'.'#1084'):')
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object RichEdit3: TRichEdit
          Left = 336
          Top = 8
          Width = 337
          Height = 145
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clInactiveBorder
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '9:41:17'
            '9235'
            '1670,596'
            '1673,207'
            '1411,631'
            '48,116'
            '40,658'
            '0'
            '4')
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object RichEdit4: TRichEdit
          Left = 336
          Top = 160
          Width = 105
          Height = 129
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clInactiveBorder
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            #1055#1083#1086#1090#1085#1086#1089#1090#1100
            '('#1082#1075'/'#1082#1091#1073'.'#1084')'
            '844,5'
            '844,9'
            '845,7'
            '845'
            '09:34:19'
            '1411,616')
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object RichEdit5: TRichEdit
          Left = 448
          Top = 160
          Width = 105
          Height = 129
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clInactiveBorder
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4227327
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
            '(*'#1057')'
            '18,68'
            '18,21'
            '17,18'
            '18,12'
            '09:35:47')
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
      end
      object tsRezParams: TTabSheet
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072
        ImageIndex = -1
        object reRezNameValue: TRichEdit
          Left = 8
          Top = 8
          Width = 337
          Height = 388
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clInactiveBorder
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            #1052#1072#1088#1082#1072' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072#9
            #1059#1095#1077#1090#1085#1086#1077' '#1086#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072#9
            #1053#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099#9
            #1058#1080#1087' '#1087#1088#1086#1076#1091#1082#1094#1080#1080#9
            #1057#1090#1072#1085#1076#1072#1088#1090#1085#1072#1103' '#1087#1083#1086#1090#1085#1086#1089#1090#1080' ('#1075'/'#1083')'#9
            #1042#1099#1089#1086#1090#1072' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072' ('#1084#1084')'#9
            #1047#1086#1085#1072' '#1085#1077#1095#1091#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086#1089#1090#1080' ('#1084#1084')'#9
            #1042#1077#1088#1093#1085#1080#1081' '#1087#1088#1077#1076#1077#1083#1100#1085#1099#1081' '#1091#1088#1086#1074#1077#1085#1100' ('#1084#1084')'#9
            #1053#1080#1078#1085#1080#1081' '#1087#1088#1077#1076#1077#1083#1100#1085#1099#1081' '#1091#1088#1086#1074#1077#1085#1100' ('#1084#1084')'#9
            #1042#1077#1088#1093#1085#1080#1081' '#1087#1088#1077#1076#1091#1087#1088#1077#1076#1080#1090#1077#1083#1100#1085#1099#1081' '#1091#1088#1086#1074#1077#1085#1100' ('#1084#1084')'
            #1053#1080#1078#1085#1080#1081' '#1087#1088#1077#1076#1091#1087#1088#1077#1076#1080#1090#1077#1083#1100#1085#1099#1081' '#1091#1088#1086#1074#1077#1085#1100' ('#1084#1084')'
            #1040#1082#1090#1080#1074#1085#1086#1089#1090#1100#9
            #1058#1080#1087' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072#9
            #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077#9
            #1055#1077#1088#1080#1086#1076' '#1079#1072#1087#1080#1089#1080' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' ('#1089#1077#1082'.)'#9
            #1055#1077#1088#1080#1086#1076' '#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103' ('#1095')'#9
            #1059#1088#1086#1074#1077#1085#1100' ('#1084#1084')'#9
            #1059#1088#1086#1074#1077#1085#1100' '#1087#1086#1076#1090#1086#1074#1072#1088#1085#1086#1081' '#1074#1086#1083#1099' ('#1084#1084')'#9
            #1055#1088#1086#1094#1077#1085#1090' '#1079#1072#1087#1086#1083#1085#1077#1085#1085#1086#1089#1090#1080#9
            #1054#1073#1098#1077#1084' ('#1083')'#9
            #1052#1072#1089#1089#1072' ('#1082#1075')'#9
            #1042#1099#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1087#1083#1086#1090#1085#1086#1089#1090#1100'('#1082#1075'/'#1082#1091#1073'. '#1084'):'#9
            #1055#1086#1076#1087#1086#1074#1077#1088#1093#1085#1086#1089#1090#1085#1072#1103' '#1087#1083#1086#1090#1085#1086#1089#1090#1100' ('#1075'/'#1083')'#9
            #1057#1088#1077#1076#1085#1103#1103' '#1090#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' ('#1057')')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object reRezValue: TRichEdit
          Left = 352
          Top = 8
          Width = 121
          Height = 388
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clInactiveBorder
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            #1044#1058#9
            '43'#9
            #1043#1088#1091#1087#1087#1072' '#1044#1058#9
            #1044#1080#1079#1077#1083#1100#9
            '840'#9
            '12020'#9
            '50'#9
            '9500'#9
            '300'#9
            '8300'#9
            '410'#9
            #1040#1082#1090#1080#1074#1085#1099#1081#9
            #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1099#1081
            #1085#1077#1090#9
            '100'#9
            '360'#9
            '9235'#9
            '9'#9
            '97%'#9
            '1663250'#9
            '1404947'#9
            '840'#9
            '844'#9
            '18,15'#9)
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object tsTubes: TTabSheet
        Caption = #1057#1093#1077#1084#1072' '#1090#1088#1091#1073#1086#1087#1088#1086#1074#1086#1076#1086#1074
        ImageIndex = -1
        TabVisible = False
      end
      object tsMeteringAuto: TTabSheet
        Caption = #1042#1074#1086#1076' '#1091#1088#1086#1074#1085#1077#1081
        ImageIndex = 9
      end
    end
  end
  object pnlSumParkEx: TOilPanel
    Left = 0
    Top = 238
    Width = 330
    Height = 19
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Constraints.MaxHeight = 176
    TabOrder = 4
    Visible = False
    OnMouseLeave = pnlSumParkExMouseLeave
    OnMouseEnter = pnlSumParkExMouseEnter
    object lblFillParkTubesEx: TLabel
      Left = 6
      Top = 28
      Width = 42
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Caption = '- '#1090#1088#1091#1073#1099' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object lblFillParkEx: TLabel
      Left = 6
      Top = 15
      Width = 61
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Caption = #1047#1072#1087#1086#1083#1085#1077#1085#1086' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object lblWeigthParkEx: TLabel
      Left = 6
      Top = 2
      Width = 87
      Height = 13
      Caption = #1042#1077#1089' '#1087#1086' '#1087#1072#1088#1082#1091' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFillParkExValue: TLabel
      Left = 94
      Top = 15
      Width = 76
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Alignment = taRightJustify
      Caption = '90000 '#1082#1075'. (90%)'
      ParentShowHint = False
      ShowHint = True
    end
    object lblFillParkTubesExValue: TLabel
      Left = 94
      Top = 28
      Width = 76
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Alignment = taRightJustify
      Caption = '10000 '#1082#1075'. (10%)'
      ParentShowHint = False
      ShowHint = True
    end
    object lblFillParkDiffEx: TLabel
      Left = 188
      Top = 28
      Width = 44
      Height = 13
      Caption = #1044#1077#1083#1100#1090#1072' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblFillParkBookEx: TLabel
      Left = 188
      Top = 15
      Width = 53
      Height = 13
      Caption = #1050#1085#1080#1078#1085#1099#1077' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblFillParkBookExValue: TLabel
      Left = 278
      Top = 15
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = '89000 '#1082#1075'.'
    end
    object lblFillParkDiffExValue: TLabel
      Left = 284
      Top = 28
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = '1000 '#1082#1075'.'
    end
    object lblFillParkTanksExValue: TLabel
      Left = 94
      Top = 41
      Width = 76
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Alignment = taRightJustify
      Caption = '10000 '#1082#1075'. (10%)'
      ParentShowHint = False
      ShowHint = True
    end
    object lblFillParkTanksEx: TLabel
      Left = 6
      Top = 41
      Width = 62
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Caption = '- '#1088#1077#1079#1077#1088#1074#1091#1072#1088':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object lblUnusedParkTanksEx: TLabel
      Left = 6
      Top = 83
      Width = 62
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Caption = '- '#1088#1077#1079#1077#1088#1074#1091#1072#1088':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object lblUnusedParkTanksExValue: TLabel
      Left = 94
      Top = 83
      Width = 76
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Alignment = taRightJustify
      Caption = '10000 '#1082#1075'. (10%)'
      ParentShowHint = False
      ShowHint = True
    end
    object lblUnusedParkTubesExValue: TLabel
      Left = 94
      Top = 70
      Width = 76
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Alignment = taRightJustify
      Caption = '10000 '#1082#1075'. (10%)'
      ParentShowHint = False
      ShowHint = True
    end
    object lblUnusedParkTubesEx: TLabel
      Left = 6
      Top = 70
      Width = 42
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Caption = '- '#1090#1088#1091#1073#1099' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object lblUnusedParkEx: TLabel
      Left = 6
      Top = 57
      Width = 55
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Caption = #1057#1074#1086#1073#1086#1076#1085#1086' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object lblUnusedParkExValue: TLabel
      Left = 94
      Top = 57
      Width = 76
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Alignment = taRightJustify
      Caption = '90000 '#1082#1075'. (90%)'
      ParentShowHint = False
      ShowHint = True
    end
    object lblTanksOtherEx: TLabel
      Left = 6
      Top = 142
      Width = 53
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Caption = '- '#1088#1072#1073#1086#1095#1080#1077' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object lblTanksOtherExValue: TLabel
      Left = 110
      Top = 142
      Width = 60
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Alignment = taRightJustify
      Caption = '43 '#1096#1090'. (86%)'
      ParentShowHint = False
      ShowHint = True
    end
    object lblTanksRepairExValue: TLabel
      Left = 116
      Top = 129
      Width = 54
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Alignment = taRightJustify
      Caption = '4 '#1096#1090'. (08%)'
      ParentShowHint = False
      ShowHint = True
    end
    object lblTanksRepairEx: TLabel
      Left = 6
      Top = 129
      Width = 64
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Caption = '- '#1074' '#1088#1077#1084#1086#1085#1090#1077' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object lblTanksDiagEx: TLabel
      Left = 6
      Top = 116
      Width = 76
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Caption = '- '#1076#1080#1072#1075#1085#1086#1089#1090#1080#1082#1072' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object lblTanksDiagExValue: TLabel
      Left = 116
      Top = 116
      Width = 54
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Alignment = taRightJustify
      Caption = '3 '#1096#1090'. (06%)'
      ParentShowHint = False
      ShowHint = True
    end
    object lblTanksEx: TLabel
      Left = 6
      Top = 103
      Width = 131
      Height = 13
      Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1085#1099' '#1074' '#1087#1072#1088#1082#1077' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTanksAllEx: TLabel
      Left = 6
      Top = 155
      Width = 36
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Caption = #1042#1089#1077#1075#1086' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object lblTanksAllExValue: TLabel
      Left = 110
      Top = 155
      Width = 31
      Height = 13
      Hint = #1055#1086' '#1079#1072#1084#1077#1088#1072#1084
      Alignment = taRightJustify
      Caption = '50 '#1096#1090'.'
      ParentShowHint = False
      ShowHint = True
    end
    object Image2: TImage
      Left = 2
      Top = 10
      Width = 326
      Height = 7
      Align = alBottom
      Center = True
      Picture.Data = {
        07544269746D6170AE000000424DAE0000000000000076000000280000000D00
        0000070000000100040000000000380000000000000000000000100000000000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF004FF4FFFFF4FF4000F4FF4FFF4FF4F000FF4FF4F4FF4FF000FFF4FF4FF4FF
        F000FFFF4FFF4FFFF000FFFFF4F4FFFFF000FFFFFF4FFFFFF000}
      Transparent = True
      OnClick = pnlSumParkClick
    end
  end
  object t: TMemoryTable
    Left = 336
    Top = 546
    object tNak: TStringField
      DisplayLabel = #8470' '#1053#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'Nak'
    end
    object tTank: TStringField
      DisplayLabel = #1062#1080#1089#1090#1077#1088#1085#1072
      FieldName = 'Tank'
    end
    object tTank_type: TStringField
      DisplayLabel = #1058#1080#1087' '#1094#1080#1089#1090#1077#1088#1085#1099
      FieldName = 'Tank_type'
      Size = 30
    end
    object tCountDoc: TFloatField
      DisplayLabel = #1050#1086#1083'.'#1087#1086' '#1076#1086#1082'.'
      FieldName = 'CountDoc'
    end
    object tCount_: TFloatField
      DisplayLabel = #1050#1086#1083'. '#1092#1072#1082#1090
      FieldName = 'Count_'
    end
    object tND_Norm: TFloatField
      DisplayLabel = #1053#1077#1076'.'#1077#1089#1090'.'#1091#1073'.'
      FieldName = 'ND_Norm'
    end
    object tND_Error: TFloatField
      DisplayLabel = #1053#1077#1076'.'#1087#1086#1075#1088'.'#1080#1079#1084'.'
      FieldName = 'ND_Error'
    end
    object tND_Post: TFloatField
      DisplayLabel = #1053#1077#1076'.'#1079#1072' '#1089#1095'.'#1087#1086#1089#1090'.'
      FieldName = 'ND_Post'
    end
    object tND_Rail: TFloatField
      DisplayLabel = #1053#1077#1076'.'#1079#1072' '#1089#1095'.'#1078'.'#1076'.'
      FieldName = 'ND_Rail'
    end
    object tIZ_Norm: TFloatField
      DisplayLabel = #1048#1079#1083'.'#1085#1086#1088#1084'.'
      FieldName = 'IZ_Norm'
    end
    object tIZ_Post: TFloatField
      DisplayLabel = #1048#1079#1083'.'#1079#1072' '#1089#1095'.'#1087#1086#1089#1090'.'
      FieldName = 'IZ_Post'
    end
    object tRez: TFloatField
      DisplayLabel = #1056#1077#1079#1077#1088#1074#1091#1072#1088
      FieldName = 'Rez'
    end
    object tRez_Name: TStringField
      DisplayLabel = #1056#1077#1079#1077#1088#1074#1091#1072#1088
      FieldName = 'Rez_Name'
    end
    object tIS_DIGITAL_WEIGHT: TFloatField
      FieldName = 'IS_DIGITAL_WEIGHT'
    end
    object tTECH_LOSS: TFloatField
      DisplayLabel = #1058#1077#1093'.'#1087#1086#1090#1077#1088#1080
      FieldName = 'TECH_LOSS'
    end
    object tIsDigitalText: TStringField
      DisplayLabel = #1062#1080#1092'.'#1074#1077#1089#1099
      FieldName = 'IsDigitalText'
      Size = 3
    end
    object tWagon_id: TFloatField
      FieldName = 'wagon_id'
    end
  end
  object ds: TOraDataSource
    DataSet = t
    Left = 344
    Top = 528
  end
  object ActionList: TActionList
    Left = 312
    Top = 76
    object actShowOnDrawing: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1093#1077#1084#1091' '#1090#1088#1091#1073#1086#1087#1088#1086#1074#1086#1076#1086#1074' '#1090#1086#1087#1083#1080#1074#1072' %s'
      OnExecute = actShowOnDrawingExecute
      OnUpdate = actShowOnDrawingUpdate
    end
    object actShowDrawing: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1093#1077#1084#1091' '#1090#1088#1091#1073#1086#1087#1088#1086#1074#1086#1076#1086#1074
      OnExecute = actShowDrawingExecute
    end
    object Action1: TAction
      Caption = 'Action1'
    end
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 522
    Top = 210
    object N1: TMenuItem
      Action = actShowOnDrawing
    end
    object N2: TMenuItem
      Action = actShowDrawing
    end
    object N3: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090
      Visible = False
    end
  end
  object qTanksAzs: TOraQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select 1 as tip, dr.azs_id, t.tank_id, t.fuel_id,'
      
        '       to_number(substr(max(to_char(dr.rep_date, '#39'ddmmyyyy_'#39') ||' +
        ' t.minamount), 10)) as minamount,'
      
        '       to_number(substr(max(to_char(dr.rep_date, '#39'ddmmyyyy_'#39') ||' +
        ' t.maxamount), 10)) as maxamount,'
      
        '       to_number(substr(max(to_char(dr.rep_date, '#39'ddmmyyyy_'#39') ||' +
        ' t.tumb), 10)) as tumb,'
      '       np.name as np_name,'
      '       np.name as fuel_name,'
      '       azs.name as azs_name,'
      '       t.tanknum as numb,'
      '       to_char(null) as rez_type,'
      '       0 as condition,'
      '       to_char(null) as condition_name,'
      '       to_date(null) as start_year,'
      
        '       to_number(substr(max(to_char(dr.rep_date, '#39'ddmmyyyy_'#39') ||' +
        ' t.Factamount), 10)) as dead'
      
        '  from oil_daily_rep dr, oil_azs_tanks t, oil_np_group np, v_org' +
        ' azs'
      ' where dr.state = '#39'Y'#39
      '   and t.state = '#39'Y'#39
      '   and dr.id = t.rep_id'
      '   and dr.inst = t.rep_inst'
      '   and t.fuel_id = np.id'
      '   and dr.azs_id = :azs_id'
      '   and dr.azs_inst = :azs_id'
      '   and azs.id = dr.azs_id'
      '   and azs.inst = dr.azs_inst'
      '   and dr.rep_date = (select max(dr.rep_date)'
      '                        from oil_daily_rep dr, oil_azs_tanks t'
      '                       where dr.state = '#39'Y'#39
      '                         and t.state = '#39'Y'#39
      '                         and dr.id = t.rep_id'
      '                         and dr.inst = t.rep_inst'
      '                         and dr.azs_id = :azs_id'
      '                         and dr.azs_inst = :azs_id)'
      
        ' group by azs.name, dr.azs_id, t.tanknum, np.name, t.tank_id, t.' +
        'fuel_id'
      
        ' order by decode(fuel_id, 4,1, 5,1.1, 6,2, 7,3, 76,4, 10,5, 3,6,' +
        ' 62,7, fuel_id + 1e2)')
    Left = 240
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'azs_id'
      end>
  end
  object qChartAzs: TOraQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      
        'select np.name, dr.rep_date, dr.rep_num, dr.smena_num, dr.azs_id' +
        ', '
      '       tp.*,'
      '       -(tp.curamount - tp.litres_all) as diff,'
      '       tp.litres_all as LITRES_ALL_POINTS,'
      '       tp.curamount as CURAMOUNT_POINTS,'
      '       tp.curamount as CURAMOUNT_ON_FACT_CONTINUOS,'
      
        '       t.minamount, t.maxamount, t.tumb, t.fuel_id, t.np_name as' +
        ' product_name, t.numb,'
      '       t.TEMPER,'
      
        '       decode(row_number() over (partition by dr.azs_id, np.id o' +
        'rder by dr.rep_date desc),1,1,0) as is_tank,'
      '       to_char(tp.mdate,'#39'mm.dd   hh24:mi'#39') as mdate_out,'
      
        '       decode(row_number() over(partition by t.numb order by tp.' +
        'MDATE desc), 1, 1, 0) as is_gauged,'
      
        '       nvl(trunc(sysdate - max(tp.mdate) over(partition by t.num' +
        'b)),9999) as valid,'
      '       case '
      '         when trunc(tp.mdate) between :begin_date and :end_date '
      '           then 1 '
      '           else 0'
      '        end as is_chart       '
      '  from oil_daily_rep dr, '
      '       oil_azs_tankparams tp, '
      
        '       (select dr.azs_id, t.tank_id, t.fuel_id, t.TANKNUM as num' +
        'b,'
      
        '               to_number(substr(max(to_char(dr.rep_date, '#39'ddmmyy' +
        'yy_'#39') || t.minamount), 10)) as minamount,'
      
        '               to_number(substr(max(to_char(dr.rep_date, '#39'ddmmyy' +
        'yy_'#39') || t.maxamount), 10)) as maxamount,'
      
        '               to_number(substr(max(to_char(dr.rep_date, '#39'ddmmyy' +
        'yy_'#39') || t.tumb), 10)) as tumb,'
      '               np.name as np_name,'
      '               azs.name as azs_name,'
      
        '               to_number(substr(max(to_char(dr.rep_date, '#39'ddmmyy' +
        'yy_'#39') || t.Temperature), 10)) as TEMPER'
      
        '          from oil_daily_rep dr, oil_azs_tanks t, oil_np_group n' +
        'p, v_org azs'
      '         where dr.state = '#39'Y'#39
      '           and t.state = '#39'Y'#39
      '           and dr.id = t.rep_id'
      '           and dr.inst = t.rep_inst'
      '           and t.fuel_id = np.id'
      '           and dr.azs_id = :azs_id'
      '           and dr.azs_inst = :azs_id'
      '           and azs.id = dr.azs_id'
      '           and azs.inst = dr.azs_inst'
      '           and dr.rep_date = (select max(dr.rep_date)'
      
        '                                from oil_daily_rep dr, oil_azs_t' +
        'anks t'
      '                               where dr.state = '#39'Y'#39
      '                                 and t.state = '#39'Y'#39
      '                                 and dr.id = t.rep_id'
      '                                 and dr.inst = t.rep_inst'
      '                                 and dr.azs_id = :azs_id'
      '                                 and dr.azs_inst = :azs_id)'
      
        '         group by azs.name, dr.azs_id, np.name, t.tank_id, t.fue' +
        'l_id, t.TANKNUM) t,'
      '       oil_np_group np'
      ' where dr.id = tp.rep_id'
      '   and dr.inst = tp.rep_inst'
      '   and t.tank_id = tp.tanks_id'
      '   and dr.state = '#39'Y'#39
      '   and tp.state = '#39'Y'#39
      '   and t.fuel_id = np.id'
      '   and t.azs_id = dr.azs_id'
      '   and dr.azs_id = :azs_id'
      '   and dr.azs_inst = :azs_id'
      '   and trunc(dr.rep_date) between :begin_date and :end_date'
      '   and (np.id = :fuel_id or :fuel_id = 0)'
      '   and abs(tp.curamount - tp.litres_all) <= 4000'
      ' order by azs_id, name, rep_date, mdate')
    Left = 184
    Top = 520
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'begin_date'
        Value = 40070d
      end
      item
        DataType = ftDateTime
        Name = 'end_date'
        Value = 40071d
      end
      item
        DataType = ftInteger
        Name = 'azs_id'
        Value = 1001870
      end
      item
        DataType = ftInteger
        Name = 'fuel_id'
        Value = 7
      end>
  end
  object qTanksBase: TOraQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select *'
      '  from ('
      '        /*'#1056#1077#1079#1077#1088#1074#1091#1072#1088#1080'*/'
      '        select 1 as tip,'
      '                nvl(-dg.id, npg.id) as fuel_id,'
      '                nvl(dg.name, npg.name) as fuel_name,'
      '                rez.num as numb,'
      
        '                to_number(rez.capacity) * nvl(den.density, 1) * ' +
        '1000 as maxamount,'
      '                rez.rez_type,'
      '                rez.condition,'
      '                decode(rez.condition,'
      '                       0,'
      '                       '#39#1048#1089#1087#1088#1072#1074#1077#1085#39','
      '                       1,'
      '                       '#39#1042' '#1088#1077#1084#1086#1085#1090#1077#39','
      '                       2,'
      '                       '#39#1044#1080#1072#1075#1085#1086#1089#1090#1080#1082#1072#39','
      '                       3,'
      '                       '#39#1055#1088#1086#1074#1086#1076#1080#1090#1100#1089#1103' '#1076#1077#1092#1077#1082#1090#1086#1089#1082#1086#1087#1080#1103#39','
      '                       4,'
      '                       '#39#1055#1086#1076#1083#1077#1078#1080#1090' '#1088#1077#1084#1086#1085#1090#1091' ('#1087#1086#1089#1083#1103' '#1076#1080#1072#1075#1085#1086#1089#1090#1080#1082#1080')'#39','
      '                       5,'
      '                       '#39#1055#1086#1076#1083#1077#1078#1080#1090' '#1091#1090#1080#1083#1080#1079#1072#1080#1080#39','
      '                       6,'
      '                       '#39#1050#1072#1087#1080#1090#1072#1083#1100#1085#1080#1081' '#1088#1077#1084#1086#1085#1090#39') as condition_name,'
      '                rez.dead * nvl(den.density, 1) * 1000 as dead,'
      '                rez.start_year,'
      '                rez.repair_date,'
      '                rez.max_level_measur,'
      '                rez.rez_height,'
      '                rez.nom_capacity,'
      '                rez.permiss_capacity,'
      '                rez.oper_capacity,'
      '                rez.cond2'
      '          from oil_rezervuar rez,'
      '                oil_np_type npt,'
      '                oil_np_group npg,'
      '                vm_oil_np_dop_group dg,'
      '                (select npgroup_id as npg_id,'
      
        '                        to_number(substr(max(to_char(date_, '#39'YYY' +
        'YMMDD'#39') ||'
      '                                             t.density),'
      '                                         9)) as density'
      '                   from oil_grp_density t'
      '                  where state = '#39'Y'#39
      '                  group by npgroup_id) den'
      '         where rez.np_type_id = npt.id'
      '           and rez.state = '#39'Y'#39
      '           and decode(npt.grp_id, 4, 5, npt.grp_id) = npg.id'
      '           and npg.id = den.npg_id(+)'
      '           and nvl(rez.condition, -1) <> -1'
      '           and dg.super_group_id(+) = 2'
      '           and dg.np_id(+) = npt.id'
      '           and rez.Realvirt = 1'
      '           and rez.inst_org = :org_inst'
      '           and rez.inst = :org_inst'
      '        '
      '        union all'
      '        '
      '        /*'#1058#1088#1091#1073#1080' '#1079' Base*/'
      '        select 2 as tip,'
      '               nvl(-dg.id, np.np_grp) as fuel_id,'
      '               nvl(dg.name, np.np_grp_name_rus) as fuel_name,'
      '               nvl(dg.name, np.np_grp_name_rus) as numb,'
      '               sum(nvl(t.max_volume, 0)) as maxamount,'
      '               to_char(null) as rez_type,'
      '               to_number(null) as condition,'
      '               to_char(null) as condition_name,'
      '               to_number(null) as dead,'
      '               to_char(null) as start_year,'
      '               to_date(null) as repair_date,'
      '               to_number(null) as max_level_measur,'
      '               to_number(null) as rez_height,'
      '               to_number(null) as nom_capacity,'
      '               to_number(null) as permiss_capacity,'
      '               to_number(null) as oper_capacity,              '
      '               to_char(null) as cond2'
      
        '          from tube_act t, v_oil_np_type np, vm_oil_np_dop_group' +
        ' dg'
      '         where t.state = '#39'Y'#39
      '           and t.np_id = np.id'
      '           and dg.super_group_id(+) = 2'
      '           and dg.np_id(+) = np.id'
      '           and t.inst = :org_inst'
      
        '         group by nvl(-dg.id, np.np_grp), nvl(dg.name, np.np_grp' +
        '_name_rus)'
      '        '
      '        union all'
      '        '
      '        /*'#1058#1088#1091#1073#1080' '#1079' OIL*/'
      '        select 2 as tip,'
      '               npg.id as fuel_id,'
      
        '               decode(npg.name,'#39#1087#1088#1086#1095#1077#1077#39','#39#1060#1088'.'#1083#1077#1075'.'#39',npg.name) as f' +
        'uel_name,'
      
        '               decode(npg.name,'#39#1087#1088#1086#1095#1077#1077#39','#39#1060#1088'.'#1083#1077#1075'.'#39',npg.name) as n' +
        'umb,'
      
        '               sum(to_number(rez.Tubingcapacity) * nvl(den.densi' +
        'ty, 1) * 1000) as maxamount,'
      '               to_char(null) as rez_type,'
      '               to_number(null) as condition,'
      '               to_char(null) as condition_name,'
      '               to_number(null) as dead,'
      '               to_char(null) as start_year,'
      '               to_date(null) as repair_date,'
      '               to_number(null) as max_level_measur,'
      '               to_number(null) as rez_height,'
      '               to_number(null) as nom_capacity,'
      '               to_number(null) as permiss_capacity,'
      '               to_number(null) as oper_capacity,               '
      '               to_char(null) as cond2'
      '          from oil_rezervuar rez,'
      '               oil_np_type npt,'
      '               oil_np_group npg,'
      '               (select npgroup_id as npg_id,'
      
        '                       to_number(substr(max(to_char(date_, '#39'YYYY' +
        'MMDD'#39') ||'
      '                                            t.density),'
      '                                        9)) as density'
      '                  from oil_grp_density t'
      '                 where state = '#39'Y'#39
      '                 group by npgroup_id) den'
      '         where rez.np_type_id = npt.id'
      '           and rez.state = '#39'Y'#39
      '           and decode(npt.grp_id, 4, 5, npt.grp_id) = npg.id'
      '           and npg.id = den.npg_id(+)'
      '           and nvl(rez.condition, -1) <> -1'
      '           and rez.Realvirt = 1'
      '           and nvl(rez.tubingcapacity, 0) <> 0'
      '           and rez.inst_org = :org_inst'
      '           and rez.inst = :org_inst'
      '         group by npg.id, npg.name)'
      ' order by tip, lpad(numb, 10, '#39'0'#39')')
    Left = 512
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'org_inst'
      end>
  end
  object qChartBase: TOraQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select * from v_oil_rez_equal Q5'
      ' order by Q5.mdate')
    BeforeOpen = qChartBaseBeforeOpen
    Left = 632
    Top = 448
  end
  object qChartBaseGroup: TOraQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select * '
      '  from v_oil_rez_equal_group'
      ' ORDER BY fuel_id, MDATE')
    FetchAll = True
    Left = 632
    Top = 496
  end
  object iml: TImageList
    Left = 402
    Top = 170
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00E7E7E700EFEFEF00FFFFFF00000000003931310039313100393931003931
      3100393131003931310039313100393931003939310039393100393131003931
      3100393131003931310039393100393931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F7F7002163
      9C00088CF7001073CE00949CA500FFFFFF003931310039313100393131003931
      3100393131003931310039393100393931003931310039313100393131003931
      3100393131003931310039313100393131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700216BAD00089C
      FF0021BDFF00089CFF001884D600EFEFEF007B7B73007B7B73007B7B73007B7B
      73007B7B7300847B730063636B00736B73007B7B7B007B7B73007B7B73007B7B
      73007B7B73007B7B73007B7B73007B7B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F7002173B50031D6FF0018AD
      FF000094FF00008CFF0010A5F700E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFF7003129CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F7F7002184BD0031D6FF0031DEFF0018B5
      FF0010A5FF0018B5FF00217BB500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F7003129CE00EFF7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F7F7F700298CC60029C6FF0029C6FF0029C6FF0029C6
      FF0018BDF700218CC600F7F7F70000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003129CE00E7E7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002984C60018ADF70018B5FF0018B5FF0018B5FF0018AD
      F7002994CE00F7F7F7000000000000000000FFFFFF00FFFFFF00FFFFFF003129
      CE00D6D6EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00E7E7
      E700DEDEDE00DEDEDE00ADA5A50029B5E7001094F700109CFF00109CEF00299C
      D600F7F7F700000000000000000000000000FFFFFF00FFFFFF003129CE00B5B5
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF009C848400C6B5
      B500C6BDBD00C6BDBD00D6CECE00D6D6D60031C6E700108CE70029A5DE00F7F7
      F70000000000000000000000000000000000E7EFE700B5B5B500CECEE700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700B5B5B500E7E7E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00BDADAD00E7DEDE00E7DE
      DE00E7DEDE00E7DEDE00D6CECE00CEBDBD00A594940029A5DE00F7F7F7000000
      000000000000000000000000000000000000B5B5B500B5B5B500B5B5B500EFEF
      E700F7F7F700FFFFFF00FFFFFF00EFEFEF00DEDEDE00FFFFFF00FFFFFF00FFFF
      FF00E7E7E700B5B5B500EFEFEF00B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADA5A500EFE7E700E7DEDE00E7DE
      DE00EFE7E700EFE7E700EFE7E700CEBDBD00E7E7E70000000000000000000000
      000000000000000000000000000000000000EFEFEF00FFFFFF00FFFFFF00B5B5
      B500B5B5B500B5B5B500EFEFEF00EFEFEF00E7E7E700EFEFEF00B5B5B500B5B5
      B500B5B5B500FFFFFF00FFFFFF00EFEFEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5949400EFEFEF00BDBDBD00BDB5
      B500EFEFEF00F7F7F700F7F7F700E7E7E700DEDEDE0000000000000000000000
      000000000000000000000000000000000000FFFFFF00B5B5B500B5B5B500F7F7
      F700F7F7F700F7F7F700B5B5B500B5B5B500B5B5B500B5B5B500F7F7F700F7F7
      F700F7F7F700B5B5B500FFFFFF00F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADA5A500BDBDBD00000000000000
      0000BDBDBD00F7F7F700FFFFFF00F7EFEF00E7E7E70000000000000000000000
      000000000000000000000000000000000000FFFFFF0042424200B5B5B500FFFF
      FF00FFFFFF00FFFFFF00B5B5B500FFFFFF00FFFFFF00B5B5B500F7F7F700FFFF
      FF00FFFFFF00BDBDB50042424200FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00B5A5A500FFFFFF00FFFFFF00CEC6C600FFFFFF0000000000000000000000
      000000000000000000000000000000000000FFFFFF004242420042424200FFFF
      FF00FFFFFF0042424200B5B5B500FFFFFF00FFFFFF00B5B5B50042424200FFFF
      FF00FFFFFF004242420042424200FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5AD
      AD00FFFFFF00FFFFFF00EFEFEF00EFEFEF000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF004242420042424200FFFFFF00FFFFFF004242420042424200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00BDB5
      B500B5B5B500BDB5B500FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFE1000000000000FFC0000000000000
      FF80000000000000FF00000000000000FE00000000000000FC01000000000000
      FC03000000000000C007000000000000800F000000000000001F000000000000
      007F000000000000007F000000000000307F000000000000E07F000000000000
      E0FF000000000000C1FF00000000000000000000000000000000000000000000
      000000000000}
  end
  object tTimer: TTimer
    Enabled = False
    Interval = 300
    OnTimer = tTimerTimer
    Left = 368
    Top = 170
  end
  object PopupMenuTank: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 522
    Top = 162
    object MenuItem1: TMenuItem
      Action = actShowOnDrawing
    end
    object MenuItem2: TMenuItem
      Action = actShowDrawing
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object objectPopupMenuTPopupMenu1: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1075#1088#1072#1092#1080#1082' '#1076#1083#1103' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1090#1086#1087#1083#1080#1074#1072
      OnClick = objectPopupMenuTPopupMenu1Click
    end
  end
  object SumTimer: TTimer
    OnTimer = SumTimerTimer
    Left = 642
    Top = 198
  end
  object TimerList: TRxTimerList
    Active = True
    Left = 272
    Top = 186
    object PnlSumCloseTimer: TRxTimerEvent
      Enabled = False
      Interval = 200
      OnTimer = PnlSumCloseTimerTimer
    end
    object TimerMessaging: TRxTimerEvent
      Enabled = False
      Interval = 10000
    end
    object TimerRezError: TRxTimerEvent
      Interval = 400
      OnTimer = TimerRezErrorTimer
    end
  end
  object vtChartAllFuel: TVirtualTable
    OnFilterRecord = vtChartAllFuelFilterRecord
    FieldDefs = <
      item
        Name = 'mdate'
        DataType = ftDateTime
      end
      item
        Name = 'diff_summ'
        DataType = ftFloat
      end>
    Left = 335
    Top = 421
    Data = {
      0300020005006D646174650B000000000000000900646966665F73756D6D0600
      000000000000000000000000}
  end
  object ilTabSheets: TImageList
    Left = 434
    Top = 98
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCCCCC00CCCC
      CC00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E1E1E100CCCCCC00CCCCCC00CCCCCC00E1E1E1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CFCFCF00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC007B7C82007B7C
      8200CCCCCC00CCCCCC00CCCCCC00000000000000000000000000000000000000
      000000000000E1E1E100B5A79300A38B6B00A28A6A00A28A6A00B5A69200E1E1
      E100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BB882500B67E0E00B47B0900B47A
      0700B47A0800B57B0700BB7E030077787B0077787B00A87F2D00A8A8AC00A8A8
      AC00A87F2D0077787B0077787B00000000000000000000000000000000000000
      000000000000B5A79300B59A7800EFCEA600FBDDB600FDE2BC00BAA28000B5A6
      9200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B67E0E0000000000000000000000
      000000000000000000000000000077787B00CDCCCD0096959800D8D7D700D8D7
      D70096969800D0CFD10077787B00F6F6F6000000000000000000000000000000
      000000000000AA937600EBC9A500BD772B00B8691800D08A4100FFEECC00A289
      6900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47B090000000000000000000000
      000000000000DBC2A700E9EAEB00C6C6C40095939300B5B3B3008E8D8B008E8D
      8D00B6B5B50098979800A17F3A00BFBFBF000000000000000000000000000000
      000000000000A28A6A00EED1B100B96B1900C77D2F00D4863500FFFBE300A088
      6700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47A080000000000FFFFFD00FFFF
      FD0000000000E0C6A80077787B00AAA8A800D8D7D7008F8D8D0000000000E9CE
      AE00908F9000D8D7D700AFAEAF0077787B000000000000000000000000000000
      000000000000A38B6A00F3DEC600D3904900B66A1900E3A15C00FFF7E000A188
      6700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47B080000000000D4B99900D5BA
      9A00D7BD9E00DFC5A50077787B00ABA9A900D8D7D70092919000CCB69C00CCB7
      9D0093929100D8D7D700B0AFB00077787B000000000000000000000000000000
      000000000000CBBCA900BAA28200C7BCAE00C5742000FFF7E600C4AF8F00CABB
      A800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47B080000000000FFFDF200FFFE
      F300FFFFF700DABE9D00FFFFFE00BCB8B2009A999700BCBBBB00949393009493
      9300BCBBBC009D9C9B009E7F4300000000000000000000000000000000000000
      00000000000000000000A1886600FCEFE000D37E2800FFFEF100B9A07C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47B080000000000FFFBEB00FFFC
      EC00FFFFF000D8BC9800FFFFF60077787B00D8D7D7009B9A9900D8D7D700D8D7
      D7009B9A9900DAD9DB0077787B00000000000000000000000000000000000000
      00000000000000000000A2886600FCEDDC00ECBD8700FFFCED00B99F7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47B080000000000D4B38C00D5B5
      8F00D7B89200D9BB9600DDBD950077787B0077787B00BEA78C00B1B1B100B1B1
      B100BEA68B0077787B0077787B00000000000000000000000000000000000000
      00000000000000000000A2896600C9BCAF00BFA27E00FFFBEA00B89F7A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47B080000000000FFF7DF00FFF8
      E100FFFBE500D6B89000FFFDE700FFFFE700DDBC9100FFFFEA0077787B007778
      7B00FFFFE60000000000BA7D0300000000000000000000000000000000000000
      00000000000000000000A2886600FBECD900F1CD9F00FFFAE900B89E7A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47B080000000000FFF5D700FFF6
      D900FFF9DE00D7B58B00FFFADF00FFFADF00D8B78B00FFFDE100FFFFE200DDBA
      8C00FFFADC0000000000B57B0700000000000000000000000000000000000000
      00000000000000000000A2886600FBECD900F1CD9F00FFFAE900B89F7A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B57B090000000000DDB17C00E0B4
      7E00E0B68200DEB78600DFB68300DFB68300DEB78600E0B78300E0B78300DEB7
      8500DCB3800000000000B57B0900000000000000000000000000000000000000
      00000000000000000000A2896600C8BBAE00BEA07C00FFFBEA00B9A07B00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B57C09000000000044C3FF0049C5
      FF0047C6FF00E3B57E0046C7FF0046C7FF00E3B57E0046C7FF0046C7FF00E1B4
      7E0040C4FF0000000000B57C0900000000000000000000000000000000000000
      00000000000000000000A2886600FBEBD800F1CC9E00FFFAE900BAA07C00F9F8
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B67E0E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B67E0E00000000000000000000000000000000000000
      00000000000000000000A2896700FDEDDB00FFF1E000FFFDEC00BDA380000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD8C2700B67E0E00B67C0900B67B
      0700B67B0800B57B0800B67B0800B67B0800B57B0800B67B0800B67B0800B57B
      0800B67C0900B67E0E00BD8C2700000000000000000000000000000000000000
      00000000000000000000E5DED400B5987200B3987400B99F7B00EAE3D9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0D0D000CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CFCFCF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCCCCC00CFCFCF000000
      000000000000000000000000000000000000D3D3D300CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CFCFCF00000000000000000000000000000000000000
      0000BB8A2700B67E0E00B47B0900B47A0800B47B0800B47B0800B47B0800B47B
      0800B47B0800B47B0900B67E0E00BB88250079686F0078656B00796369007963
      690076676700736C6400706D61006F6D5F006F6D5F006F6E61006D6D65006669
      6A0061666D0061666D0062676F00656974000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00B8844400BB894E000000
      000000000000000000000000000000000000BC8F3300B67E0E00B47B0900B47A
      0700B47A0800B47B0800B47A0800B47A0800B47B0800B47A0800B47A0800B47B
      0800B47B0900B67E0E00BB882500000000000000000000000000DDDDDD00CCCC
      CC00B67E0E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B67E0E00008D450018EEB20000E49D0000E5
      9C0014F3A800262ACB007989FF006177FF006177FF00778AFF00162CCE00FFD9
      8100FCC97400FAC87600FFD58F00BF850F000000000000000000000000000000
      0000000000000000000000000000CCCCCC00B6814100FCCD8700B88343000000
      000000000000000000000000000000000000B67E0E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B67E0E00000000000000000000000000C09C5500B881
      1400B3790500000000000000000000000000D7C0A50000000000D8C0A6000000
      0000D7BFA5000000000000000000B47B0900008846002DE3B60000D49A0000D5
      980028EAA9002A2AC2007B89FF005C71FF005C71FF00788AFF00162BC700FFD1
      7900EFBC6700EDBB6900F5CB8A00B78215000000000000000000000000000000
      00000000000000000000CCCCCC00B6814000F3CB8B00F1C68400B68242000000
      000000000000000000000000000000000000B47B090000000000000000000000
      000000000000D6BDA2000000000000000000D6BDA2000000000000000000D6BD
      A2000000000000000000B47B090000000000D0D0D000CCCCCC00B88114000000
      0000B175000000000000D5BA9B00D6BC9E00D8BFA200D8BFA200D9C0A300D8BF
      A200D8BFA100D6BC9D0000000000B47B0800008745003DE0BA0000CD990000CE
      970037E7AD002A2AC1007B8AFF00586CFA00586CFA00788AFF00162CC700FFCF
      7400EBB65A00E8B55D00F2C88700B68116000000000000000000000000000000
      000000000000CCCCCC00B6814100E6C38C00E4B26500ECC48800B68241000000
      000000000000000000000000000000000000B47A080000000000FFFFFD00FFFF
      FD0000000000D7BEA0000000000000000000D7BEA0000000000000000000D7BE
      A0000000000000000000B47A080000000000BB8A2700B7801200B57C0B000000
      0000B073000000000000FFFFF500FFFFF900D9BE9D00FFFFFD00D9BE9D00FFFF
      FD00D8BD9C00FFFFF80000000000B47B0800008845004ADEC00000C69A0000C8
      980044E5B300292AC1007A8AFF005368F8005368F800788BFF00162CC700FECD
      7000E8B05000E6AF5200F1C78300B68116000000000000000000000000000000
      0000CCCCCC00B7814000E6C49300DFAB5F00DDAA5E00EAC58E00B78241000000
      000000000000000000000000000000000000B47B080000000000D4B99900D5BA
      9A00D6BC9E00D8BFA100D7BD9E00D7BD9E00D8BFA100D7BD9E00D7BD9E00D7BF
      A000D6BC9C0000000000B47B080000000000B67F110000000000B27702000000
      0000B073000000000000D5B69100D7B99500D9BC9900D9BC9900D9BD9900D9BC
      9900D9BC9800D7B8930000000000B47B09000088440055DCC50000C0990000C2
      97004FE3B700282AC1007C8BFD004D64F6004D64F6007A8BFE00162DC800FDCB
      6E00E6AA4500E4A84800F0C58000B68217000000000000000000000000000000
      0000B9844200D8BE9600DCAC6400D7A45700D6A35600E8C69400B78241000000
      000000000000000000000000000000000000B47B080000000000FFFDF200FFFE
      F300FFFFF700D7BB9A00FFFFF800FFFFF800D7BB9A00FFFFF800FFFFF800D7BB
      9A00FFFFF60000000000B47B080000000000B57D0C0000000000B17500000000
      0000B073000000000000FFFAE200FFFDE700D9BA9200FFFFEB00D9BA9300FFFF
      EB00D8B99100FFFCE50000000000B47B08000088440061DBCA0000BA980000BB
      96005BE2BD00282AC1007C8BFC00495FF300495FF3007A8BFD00162DC900FDCA
      6B00E4A63A00E2A43C00F0C47D00B68217000000000000000000000000000000
      0000B9844200DBC29E00D6A65F00D19D4E00D19C4D00E6C89A00B78241000000
      000000000000000000000000000000000000B47B080000000000FFFBEB00FFFC
      EC00FFFFF000D7BA9600FFFFF100FFFFF100D7BA9600FFFFF100FFFFF100D7BA
      9600FFFEEF0000000000B47B080000000000B57C0B0000000000B07400000000
      0000B073000000000000DDB28000DFB68500DEB78A00DEB78A00DEB88B00DEB7
      8A00DDB78900DBB3830000000000B57B0800008A470071DDD6004FE4D6004FE6
      D4006BE4C800292CC3007D8DFA00435BF100435BF1007A8DFB00172DC900FCCA
      6A00E29E2F00E09D3200EFC37C00B68217000000000000000000000000000000
      000000000000B8814000E0C8A300CA944400CA934300E7CBA300B78240000000
      000000000000000000000000000000000000B47B080000000000D4B38C00D5B5
      8F00D7B89200D8BA9500D7B89300D7B89300D8BA9500D7B89300D7B89300D8B9
      9400D6B68F0000000000B47B080000000000B57C0B0000000000B07400000000
      0000B17300000000000044C4FF0046C6FF00E2B57F0043C7FF00E1B6800043C7
      FF00E1B57E0040C4FF0000000000B57C090010945700008A470000884400008A
      4100009239002C30C8007E8FF9003D57EF003D57EF007B8FFA00172DC900FBC9
      6A00E0992300DD982500EEC27B00B68218000000000000000000000000000000
      00000000000000000000B7814000E3CEAA00C28A3600E6CEA900B7813F000000
      000000000000000000000000000000000000B47B080000000000FFF7DF00FFF8
      E100FFFBE500D6B78F00FFFBE600FFFBE600D6B78F00FFFBE600FFFBE600D5B7
      8E00FFFAE30000000000B47B080000000000B57C0B0000000000B07400000000
      0000B27300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B67E0E00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF002D33C8008291F8003952ED003952ED007E90F900172DCA00FCC9
      6900DE911200DB901400EEC27B00B78218000000000000000000000000000000
      0000000000000000000000000000B7813F00E5CEAB00E7D3B200B8813F000000
      000000000000000000000000000000000000B47B080000000000FFF5D700FFF6
      D900FFF9DE00D7B58B00FFF9DF00FFF9DF00D7B58B00FFF9DF00FFF9DF00D7B5
      8A00FFF8DB0000000000B47B080000000000B57C0B0000000000B07200000000
      00008E8E5400B1710000B0710000B0710000AF710000AF710000AF710000B071
      0000B1740000B4790300B67E0D00BE8C2800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF002B37C4008293F700334EEA00334EEA007F91F800182ECB00FEC9
      6B00EBD28500E9D08800F1C27D00B88319000000000000000000000000000000
      000000000000000000000000000000000000B7803D00EBDDC300B88241000000
      000000000000000000000000000000000000B57B090000000000DDB17C00E0B4
      7E00E0B68200DEB78600DFB68300DFB68300DEB78600DFB68300DFB68300DDB6
      8400DBB37F0000000000B57B090000000000B57C0A0000000000B17200000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B77F11000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF002A38C1008495F5002C48E8002C48E8008294F8001A31CE00C68A
      0600BA831400B7821700B8831900CAA150000000000000000000000000000000
      00000000000000000000000000000000000000000000B9844200CFAA7D000000
      000000000000000000000000000000000000B57C09000000000044C3FF0049C5
      FF0047C6FF00E3B57E0046C7FF0046C7FF00E3B57E0046C7FF0046C7FF00E1B4
      7E0040C4FF0000000000B57C090000000000B57C0A000000000086926500B171
      0000AF710000AF710000AF720000AF720000AF720000AF720000B1740000B37A
      0600B67F1000CFAB62000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF002A39C0008596F4002540E5002540E5008395F7001F33CC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B67E0E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B67E0E0000000000B67E0F0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B77F
      110000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF002B3BC1008998F6006CAFF6006CAFF6008998F6002638C700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9A04D00B67E0E00B67C0900B67B
      0700B67B0800B57B0800B67B0800B67B0800B57B0800B67B0800B67B0800B57B
      0800B67C0900B67E0E00C3963A0000000000BD8C2700B67E0F00B57C0A00B57C
      0A00B57C0B00B57C0B00B57C0B00B57C0B00B57C0B00B57D0C00B77F1100BE8C
      280000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006F7AD6002B3AC1002B38C0002B38C0002B3AC1004B59CD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000DCDCDC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00DCDCDC00000000000000000000000000CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CFCFCF00FFFFFF000000000000000000ECECEC00CDCD
      CD00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CDCDCD00E4E4E400FEFEFE00000000000000000000000000ECECEC00CDCD
      CD00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CDCDCD00E4E4E400FEFEFE00000000000000000000000000A09F9D008C89
      8700918B8800746D6900776E6900776E6800776E6800776E6900746D6900918B
      88008C898700A09F9D000000000000000000B4B4B400A6A6A600A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A6A6A600ACACAC00FFFFFF0000000000F4F4F400B4B4B4008888
      8800858686008686860086868700868687008687870086868700868686008585
      850088898900A9A9A900F3F3F3000000000000000000F4F4F400B4B4B4008888
      8800858686008686860086868700868687008687870086868700868686008585
      850088898900A9A9A900F3F3F3000000000000000000000000008D898700AFC4
      BC00B8C7BC0000418C00359FDA002F9AD6002F9AD600359FDA0000418C00B8C7
      BC00AFC4BC008D8987000000000000000000A6A6A600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A6A6A600FFFFFF0000000000D4D4D4009B9C9C00F1F0
      EE00F0EEEF00DDDAD900DEDCDA00DEDBDA00DEDCDB00DEDBDA00DDDBD900F0ED
      EE00F0EFED009B9B9C00D5D5D5000000000000000000D4D4D4009B9C9C00F1F0
      EE00F0EEEF00DDDAD900DEDCDA00DEDBDA00DEDCDB00DEDBDA00DDDBD900F0ED
      EE00F0EFED009B9B9C00D5D5D5000000000000000000000000008D888700F4FE
      FB00FFFFFA0000458D004AA3D600288ECA00288ECA004AA3D60000458D00FFFF
      FA00F4FEFB008D8887000000000000000000A5A4A500FFFFFF00FFFFFF00FFFF
      FF00EBE2E600FFFFFF00FFFEFE00E2E1DE00FFFFFF00FFFFFF00E8E7DF00FFFF
      FE00FDFDFD00FFFFFF00A4A4A400FFFFFF0000000000BCBCBC00AEADAD00EDEC
      EA0088848300D8D6D4008A878600D9D7D5008A878600D9D7D40089868500D5D3
      D100ECEBE900AEADAD00BCBCBC000000000000000000BCBCBC00AEADAD00EDEC
      EA0088848300D8D6D4008A878600D9D7D5008A878600D9D7D40089868500D5D3
      D100ECEBE900AEADAD00BCBCBC00000000000000000000000000908C8A00BBD8
      D300C7DCD0000049920060ABD7001D84C2001D84C20060ABD70000499200C7DC
      D000BBD8D300908C8A000000000000000000A6A5A600FFFFFF0048AD8000007B
      30003EA27500FFFFFF00FFFDFD00E6E5DD006D78D4000D1FBB00616CC800FFFF
      FC00FCFBFA00FFFFFF00A4A4A400FFFFFF0000000000A9A9A900BBB8B700D8D5
      D400D1CFCD008E8C8A00D4D2D0008F8D8B00D4D2D0008F8D8B00D3D2CF008D8B
      8900D9D7D600BBB9B800A9A9A9000000000000000000A9A9A900BBB8B700D8D5
      D400D1CFCD008E8C8A00D4D2D0008F8D8B00D4D2D0008F8D8B00D3D2CF008D8B
      8900D9D7D600BBB9B800A9A9A900000000000000000000000000948F8D00BFDB
      D600CBDED400004E980075B6DC000E7CBB000E7CBB0075B6DC00004E9800CBDE
      D400BFDBD600948F8D000000000000000000A7A6A600FFFFFF00007C3100CBFF
      E800007F3400EDE0E400E0DDDA00EBE9DB001425BE00C0D3FF001324BE00E9E7
      D900DADAD600FFFFFE00A4A4A400FFFFFF000000000096969600C5C3C200CDC9
      C80091908E00CFCCCB0093918F00D0CCCC0093918F00D0CCCC0093918F00CFCC
      CB0092908E00C6C3C20096969600000000000000000096969600C5C3C200CDC9
      C80091908E00CFCCCB0093918F00D0CCCC0093918F00D0CCCC0093918F00CFCC
      CB0092908E00C6C3C200969696000000000000000000000000009B928F00C3DC
      D800CEDFD60000539E008EC1E000006FB500006FB5008EC1E00000539E00CEDF
      D600C3DCD8009B928F000000000000000000A7A6A600FFFFFF0048AD7E00007F
      340000743100FFFFFF00FFFFFB00EEEADA00000CB1001828BF00000CB100FFFF
      F800FCFBF500FEFEFD00A5A5A500FFFFFF000000000088888800CAC8C6009593
      9100C8C6C40096949200CAC7C50098959300CBC8C60097959300C9C7C5009694
      9200C8C6C400CAC8C60088888800000000000000000088888800CAC8C6009593
      9100C8C6C40097949300CBC8C60099959400CBC8C60098959300C9C7C5009694
      9200C8C6C400CAC8C600888888000000000000000000DDDDDD00A4999200CDE3
      DF00CEDFD6000055A300A7CFE600B5D6E900B5D6E900A7CFE6000055A300CEDF
      D600CDE3DF00A4999200DDDDDD0000000000A6A6A600FFFFFD00FFFEFA00FFFF
      FF00F2E2E40000602400FFFFFF000000B400FFFFF600FFFFF500ECE8D7000000
      B000FFFFF300FFFFFA00A6A6A500FFFFFF00D1D1D10086868700AAA7A500A8A6
      A400A8A5A400AAA5A400AFA6A700B7A8AB00B7A8AB00AFA6A700A9A5A400A8A5
      A400A8A5A400A9A6A40086868600D1D1D100D1D1D10086868700AAA7A500A8A6
      A400A8A5A400ADA6A600B4A8A900BAA9AC00BAA8AC00B4A8AA00ACA6A600A8A5
      A400A8A5A400A9A6A40086868600D1D1D100000000004474A000AE9F9400E3F1
      EC00CCDFD700388DBA00005CA900005DAB00005DAB00005CA900388DBA00CCDF
      D700E3F1EC00AE9F94004474A00000000000A7A6A500FFFFFB000000B000EBE5
      D500EDE5D900F4E7DF0000662500EEE2DE00DFDAD600D7D5D100DAD9D200E3DF
      D3000000AF00FFFFFB00A7A6A500FFFFFF008E8E8E00D1D1D100C3C5C800C2C6
      CD00C3C5CA00CBC5C900DCC7CE0000863C0000863B00DCC7CE00CBC5C800C3C5
      CA00C2C6CC00C3C5C800D1D1D1008E8E8E008E8E8E00D1D1D100C3C5C800C2C6
      CD00C3C5CA00CEC6CB0034976A0000863D0000863D0035976A00CEC6CB00C3C5
      CA00C2C5CC00C3C5C800D1D1D1008E8E8E0000000000004F900034688F00FFFF
      FB00CBE0DA00CEE1DB00D3E6E000D6ECE800D6ECE800D3E6E000CEE1DB00CCDF
      DA00FFFFFB0034689000004F900000000000A6A6A500FFFDF800FFFDED00000D
      B2001A2AC100000DB700FFFFFA0000612500FFF5F800F5F0F100D4D1D000F9F4
      F000FDF6F100FFFDFC00A7A6A600FFFFFF0085868900E9ECF100C5C7CB00C970
      0000E0AB6200DCC8D30000823A0000C07D0000C07D0000823A00DCC8D200DFAE
      6D00C9700000C2C8D400EAECF0008687880085868900E9ECF100C5C7CB00C86F
      0000DCAA6000D5C7D00000833A0010E6AE0000E1A30000843B00D6C7D000DAAD
      6B00C86F0000C2C8D400EAECF000868788000000000000000000005093004285
      AD00DEEBE200D3E4E100CAE4E700B04B0000AF4B0000CAE4E700D4E5E200DFEB
      E4004185AD00005095000000000000000000A5A6A500FBF9F700F8F6E7001526
      BF00C1D4FF001627C100FFFAEE00E1D5D600005F2600FFF3F700E2D3D700FFF3
      F600005C2100FFFCFE00A7A6A600FFFFFF00ACB1B900E1E7EE00C6700000E29C
      3700FFEEB50000813D0000BB7A0000DC9E0000DC9E0000BB7A0000813C00FFEE
      B500E29C3600C6700000E3EBF700B0B2B500ACB1B900E1E7EE00C6700000E09C
      3500FFEDB100FEE6F30000813A0057E6C50000D29F0000823B00FEE6F300FFED
      B000E09C3500C6700000E3EBF700B0B2B50000000000000000000060A2000050
      96004387B100EBF4ED00DAEFF000C4722B00C4722B00DBF0F000EBF4ED003D85
      B200004F9900000000000000000000000000A5A6A600F9F9F600D0CFC5005A65
      C2001224C0005B66C300D4D2C800D4CFCD00E2D3D70000643000008439000063
      2F00DED0D300FEFBFB00A6A6A600FFFFFF00CCCCCC00C5730000DB9B3700FFED
      B7000082420048D4AD0050EAC30000D59B0000D69C0051EAC30048D4AD000082
      4200FFEDB700DC9B3700C9730000CCCCCC00CCCCCC00C5730000DB9B3700FFEC
      B60019815E0000833C0000AD7C0000C59E0000C59E0000AD7C0000833C001981
      5E00FFECB600DC9B3600C9730000CCCCCC0000000000000000000067A90043A2
      D70000549A00438CB600F7FCF800E3F4F500E3F4F600F9FDF9003C88B600004D
      9C00AC9B9000000000000000000000000000A5A6A600F7F6F500E4E3DE00EBEA
      E000D1D0C300ECEAE100E6E5E000C9C7C500F6E9EC0000823700CEFFEB000081
      3600F4E7EA00FBF7F700A6A6A600FFFFFF00C4760000D89C3A00FFE8B3000000
      000059B085000087450000B67D002BD9B00000CE9C0000B67E000087450059B0
      850000000000FFE8B300DA9C3800C9770000C4760000D89C3A00FFE8B3000000
      0000008340007BDBC70000C09F0000BE9B0000BE9B0000C09F007BDBC7000083
      400000000000FFE8B200DA9C3800C977000000000000000000004F9BC800006C
      B100006CB100005CA200448FBA00FFFFFD00FFFFFE003E8CBA000052A000E0EF
      E700A1989300000000000000000000000000A6A6A600F6F6F500DCDBD900DEDD
      DA00C2C1BF00DEDDDB00DDDCDB00C3C0C000EAE0E2003EA37600007F33003EA3
      7600E8DEE100F8F7F600A6A6A600FFFFFF00D99E3F00FFE9B400000000000000
      00000000000000000000008642005BDEC70000C6A00000874300000000000000
      00000000000000000000FFE9B400DA9F3E00D99E3F00FFE9B400000000000000
      000000000000008742008EDBCB0000B99D0000B99D008EDBCB00008742000000
      00000000000000000000FFE9B400DA9F3E000000000000000000000000000000
      000000000000000000000061A8004F99C1004D98C100005CA800B29F9300D6EC
      E9009F9A9700000000000000000000000000A7A7A700F9F8F700F6F5F400F6F5
      F400F6F5F400F6F5F400F6F5F400F7F5F500FBF7F700FFF9FB00FFFAFE00FFF9
      FB00FBF6F600FAF8F700A7A7A700FFFFFF000000000000000000000000000000
      00000000000000000000008946008EE7E10068DDD300008A4700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000008742009AE0D3009AE0D30000874200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000006CB000006AB00000000000CDC4BE00A59E
      9B00BEBCBB00000000000000000000000000BDBDBD00A7A7A700A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A7A6A700A8A6A700A7A6
      A700A6A6A600A7A7A700AFAFAF00FFFFFF000000000000000000000000000000
      000000000000000000004FB08300008A4700008A47004FB08300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008A4700008A470000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFCFFC1F000000000001F80F00000000
      0001F80F000000007E00F80F000000007800F80F000000004820F80F00000000
      4000F80F000000004001FC1F000000004001FC1F000000004001FC1F00000000
      4005FC1F000000004005FC1F000000004005FC0F000000004005FC0F00000000
      7FFDFC1F000000000001FC1F00000000FFFFFFFFF000FFFFFF9F0001F0000000
      FF1F0001C7FE0000FE1F7FFDC7560000FC1F7B6D14020000F81F4B6D14020000
      F01F400554020000F01F400554020000F01F400554020000F81F400554020000
      FC1F400557FE0000FE1F400550000000FF1F40055FFB0000FF9F400540030000
      FFFF7FFD7FEF0000FFFF0001000F0000C0038000C001C001C003000080018001
      C003000080018001C003000080018001C003000080018001C003000080018001
      C003000080018001800100000000000080010000000000008001000000000000
      C003000000000000C007000000000000C007000010081008C00700003C3C381C
      FC070000FC3FFC3FFE470000FC3FFE7F00000000000000000000000000000000
      000000000000}
  end
  object dsChartAllFuel: TOraDataSource
    DataSet = vtChartAllFuel
    Left = 406
    Top = 427
  end
  object qChartZamer: TOraQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select /*+ORDERED*/'
      '  rez_name as numb, datetime, litr, weight'
      '  from  vm_zamer_finish t'
      ' where trunc(t.datetime) between :begin_date and :end_date'
      ' order by rez_name, datetime asc')
    FetchAll = True
    Left = 720
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'begin_date'
      end
      item
        DataType = ftUnknown
        Name = 'end_date'
      end>
  end
  object qChartDoc: TOraQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select fuel_id,'
      '       fuel_name,'
      '       MDATE,'
      '       MDATE as MDATE_Valid,'
      '       numb,'
      '       is_initial_rests,'
      '       book_in_out,'
      '       book_amount,'
      '       product_name,'
      '       CURAMOUNT as weight,                               '
      '       first_timestamp as datetime'
      '  from (select Q.fuel_id,'
      '               Q.fuel_name,'
      '               Q.MDATE as MDATE,'
      '               Q.numb as numb,'
      
        '               sum(AMOUNT * IN_OUT) over(partition by Q.numb/*, ' +
        'Q.fuel_id*/ order by q.first_timestamp, Q.IN_OUT, Q.P_TRANS_ID) ' +
        'as CURAMOUNT,'
      '               is_initial_rests,'
      '               Q.in_out as book_in_out,'
      '               Q.in_out * Q.AMOUNT as book_amount,'
      '               Q.product_name,'
      '               Q.first_timestamp'
      '          from (select br.fuel_id,'
      '                       br.fuel_name,'
      '                       br.MDATE as MDATE,'
      '                       br.numb, '
      '                       br.IN_OUT, '
      '                       br.P_TRANS_ID,'
      '                       br.inst,'
      '                       br.org_inst,'
      '                       br.product_name,'
      '                       br.AMOUNT,'
      '                       br.is_initial_rests,'
      '                       br.first_timestamp '
      '                  from v_oil_rez_book_rest br'
      
        '                 where br.UnionNum in (0, 1, 2, 3.1, 4, 11/*, 5*' +
        '/)'
      
        '                   and (trunc(MDATE) <= :end_date or MDATE is nu' +
        'll)'
      
        '                 /*  and ((br.TANK_ID not in (5,11) and inst = 6' +
        '24)or(inst <> 624))*/'
      
        '                 /* '#1047#1072#1082#1086#1084#1077#1085#1090#1080#1088#1086#1074#1072#1085#1099' '#1073#1083#1086#1082#1080' '#1087#1086#1089#1082#1086#1083#1100#1082#1091' '#1085#1077' '#1080#1089#1087#1086#1083#1100#1079#1091#1102 +
        #1090#1089#1103' '
      '                  * '#1074' '#1079#1072#1087#1088#1086#1089#1077' '#1087#1086' '#1075#1088#1091#1087#1087#1077' */'
      '                union all'
      '                select br.fuel_id,'
      '                       br.fuel_name,'
      '                       :end_date+1-1/24/3600 as MDATE,'
      '                       br.numb, '
      '                       br.IN_OUT, '
      '                       br.P_TRANS_ID,'
      '                       br.inst,'
      '                       br.org_inst,'
      '                       br.product_name,'
      '                       br.AMOUNT,'
      '                       br.is_initial_rests,'
      
        '                       nvl(br.first_timestamp,:end_date+1-1/24/3' +
        '600)'
      '                  from v_oil_rez_book_rest br'
      
        '                 where br.UnionNum in (9/*'#1047#1072#1075#1083#1091#1096#1082#1080' '#1076#1083#1103' '#1087#1088#1086#1090#1103#1075#1080#1074#1072 +
        #1085#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074'*/)'
      
        '                   and ((br.TANK_ID not in (5,11) and inst = 624' +
        ')or(inst <> 624))'
      '                 union all'
      '                select br.fuel_id,'
      '                       br.fuel_name,'
      '                       :begin_date+1/24/60/60 as MDATE,'
      '                       br.numb, '
      '                       br.IN_OUT, '
      '                       br.P_TRANS_ID,'
      '                       br.inst,'
      '                       br.org_inst,'
      '                       br.product_name,'
      '                       br.AMOUNT,'
      '                       br.is_initial_rests,'
      '                       br.first_timestamp'
      '                  from v_oil_rez_book_rest br'
      
        '                 where br.UnionNum in (9/*'#1047#1072#1075#1083#1091#1096#1082#1080' '#1076#1083#1103' '#1087#1088#1086#1090#1103#1075#1080#1074#1072 +
        #1085#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074'*/)'
      
        '                   and ((br.TANK_ID not in (5,11) and inst = 624' +
        ')or(inst <> 624))'
      '                   ) Q'
      '         where Q.org_inst = :org_inst'
      '           and Q.inst = :org_inst'
      '           and (Q.fuel_id = :fuel_id or :fuel_id = 0)'
      '           and (Q.numb = :numb or :numb = '#39'0'#39')'
      '           )'
      ' where trunc(first_timestamp) between :begin_date and :end_date')
    FetchAll = True
    Left = 720
    Top = 424
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'end_date'
      end
      item
        DataType = ftDateTime
        Name = 'begin_date'
      end
      item
        DataType = ftInteger
        Name = 'org_inst'
      end
      item
        Name = 'fuel_id'
        Value = Null
        ExtDataType = 107
      end
      item
        DataType = ftString
        Name = 'numb'
        Size = 1
        Value = '0'
      end>
  end
  object qChartDiff2: TOraQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select Q2.numb,'
      '       Q2.datetime,'
      '       Q2.zamer_weight,'
      '       Q2.doc_weight,'
      '       Q2.diff_weight'
      '  from (select Q1.numb,'
      '               Q1.datetime,'
      '               nvl(zamer_weight,'
      '                   max(Q1.zamer_weight)'
      
        '                   over(partition by Q1.numb, Q1.dens_flag)) as ' +
        'zamer_weight,'
      '               doc_weight,'
      '               '
      '               nvl(zamer_weight,'
      '                   max(Q1.zamer_weight)'
      '                   over(partition by Q1.numb, Q1.dens_flag)) '
      '               -doc_weight as diff_weight'
      
        '          from (select sum(typ) over(partition by numb order by ' +
        'datetime) as dens_flag,'
      '                       Q.*'
      '                  from (select numb,'
      '                               first_timestamp as datetime,'
      '                               to_number(null) as zamer_weight,'
      '                               CURAMOUNT as doc_weight,'
      '                               0 as typ'
      '                          from (select Q.fuel_id,'
      '               Q.fuel_name,'
      '               Q.MDATE as MDATE,'
      '               Q.numb as numb,'
      
        '               sum(AMOUNT * IN_OUT) over(partition by Q.numb/*, ' +
        'Q.fuel_id*/ order by q.first_timestamp, Q.IN_OUT, Q.P_TRANS_ID) ' +
        'as CURAMOUNT,'
      '               is_initial_rests,'
      '               Q.in_out as book_in_out,'
      '               Q.in_out * Q.AMOUNT as book_amount,'
      '               Q.product_name,'
      '               Q.first_timestamp'
      '          from (select br.fuel_id,'
      '                       br.fuel_name,'
      '                       br.MDATE as MDATE,'
      '                       br.numb, '
      '                       br.IN_OUT, '
      '                       br.P_TRANS_ID,'
      '                       br.inst,'
      '                       br.org_inst,'
      '                       br.product_name,'
      '                       br.AMOUNT,'
      '                       br.is_initial_rests,'
      '                       br.first_timestamp '
      '                  from v_oil_rez_book_rest br'
      
        '                 where br.UnionNum in (0, 1, 2, 3.1, 4, 11/*, 5*' +
        '/)'
      
        '                   and (trunc(MDATE) <= :end_date or MDATE is nu' +
        'll)'
      
        '                 /*  and ((br.TANK_ID not in (5,11) and inst = 6' +
        '24)or(inst <> 624))*/'
      
        '                 /* '#1047#1072#1082#1086#1084#1077#1085#1090#1080#1088#1086#1074#1072#1085#1099' '#1073#1083#1086#1082#1080' '#1087#1086#1089#1082#1086#1083#1100#1082#1091' '#1085#1077' '#1080#1089#1087#1086#1083#1100#1079#1091#1102 +
        #1090#1089#1103' '
      '                  * '#1074' '#1079#1072#1087#1088#1086#1089#1077' '#1087#1086' '#1075#1088#1091#1087#1087#1077' */'
      '                union all'
      '                select br.fuel_id,'
      '                       br.fuel_name,'
      '                       :end_date+1-1/24/3600 as MDATE,'
      '                       br.numb, '
      '                       br.IN_OUT, '
      '                       br.P_TRANS_ID,'
      '                       br.inst,'
      '                       br.org_inst,'
      '                       br.product_name,'
      '                       br.AMOUNT,'
      '                       br.is_initial_rests,'
      
        '                       nvl(br.first_timestamp,:end_date+1-1/24/3' +
        '600)'
      '                  from v_oil_rez_book_rest br'
      
        '                 where br.UnionNum in (9/*'#1047#1072#1075#1083#1091#1096#1082#1080' '#1076#1083#1103' '#1087#1088#1086#1090#1103#1075#1080#1074#1072 +
        #1085#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074'*/)'
      
        '                   and ((br.TANK_ID not in (5,11) and inst = 624' +
        ')or(inst <> 624))'
      '                 union all'
      '                select br.fuel_id,'
      '                       br.fuel_name,'
      '                       :begin_date+1/24/60/60 as MDATE,'
      '                       br.numb, '
      '                       br.IN_OUT, '
      '                       br.P_TRANS_ID,'
      '                       br.inst,'
      '                       br.org_inst,'
      '                       br.product_name,'
      '                       br.AMOUNT,'
      '                       br.is_initial_rests,'
      '                       br.first_timestamp'
      '                  from v_oil_rez_book_rest br'
      
        '                 where br.UnionNum in (9/*'#1047#1072#1075#1083#1091#1096#1082#1080' '#1076#1083#1103' '#1087#1088#1086#1090#1103#1075#1080#1074#1072 +
        #1085#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074'*/)'
      
        '                   and ((br.TANK_ID not in (5,11) and inst = 624' +
        ')or(inst <> 624))'
      '                   ) Q'
      '         where Q.org_inst = :org_inst'
      '           and Q.inst = :org_inst'
      '           and (Q.fuel_id = :fuel_id or :fuel_id = 0)'
      '           and (Q.numb = :numb or :numb = '#39'0'#39')'
      
        '--           and trunc(first_timestamp) between :begin_date and ' +
        ':end_date+1'
      '          )'
      
        '                         where trunc(first_timestamp) between :b' +
        'egin_date and'
      '                               :end_date'
      '                        union all'
      '                        select /*+ORDERED*/'
      '                         r.name as numb,'
      '                         t.datetime,'
      '                         t.weight as zamer_weight,'
      '                         to_number(null) as doc_weight,'
      '                         1 as typ'
      
        '                          from vm_zamer_finish t, oil_rezervuar ' +
        'r'
      '                         where t.rez_id = r.id'
      '                           and t.rez_inst = r.inst'
      
        '                           and trunc(t.datetime) between :begin_' +
        'date and'
      '                               :end_date'
      
        '                           and t.litr is not null               ' +
        '         '
      '                        ) Q) Q1) Q2'
      ' where diff_weight is not null'
      ' order by numb, datetime asc')
    FetchAll = True
    Left = 636
    Top = 548
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'end_date'
        Value = 40352d
      end
      item
        DataType = ftDateTime
        Name = 'begin_date'
        Value = 40232d
      end
      item
        DataType = ftInteger
        Name = 'org_inst'
        Value = 624
      end
      item
        DataType = ftInteger
        Name = 'fuel_id'
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'numb'
      end>
  end
  object vtChartTank: TVirtualTable
    OnFilterRecord = vtChartTankFilterRecord
    FieldDefs = <
      item
        Name = 'mdate'
        DataType = ftDateTime
      end
      item
        Name = 'diff_summ'
        DataType = ftFloat
      end>
    Left = 239
    Top = 421
    Data = {
      0300020005006D646174650B000000000000000900646966665F73756D6D0600
      000000000000000000000000}
  end
  object imlzamer: TImageList
    Left = 402
    Top = 206
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A58C6900A48B6800A48B6800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BA9C7400FCD39B00FFE4A700FFE7B000BFA47C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BA9C7400FCD39B00FFE4A700FFE7B000BFA47C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AC947300F9CF9900112FC5000013D8001346E300FFF3C000A48A
      6700000000000000000000000000000000000000000000000000000000000000
      000000000000F9CF9900112FC5000013D8001346E300FFF3C000A48B68000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A68C6700E1CABC000016D700002FE9000034FF00FFFFD400A389
      6500000000000000000000000000000000000000000000000000000000000000
      000000000000000000000016D700002FE9000034FF00FFFFD400A48B68000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A68C6800FFE4B9001A4EE900000FC5001961FF00FFFCD300A389
      6500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000FC5001961FF00FFFFD400A48B68000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C2A57C00E2C799000009CF00FFFFD000CCB288000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBBCA800000000000000000000000000FFFFD400CCB28800C9BBA7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A58A6400FFF9D300000AD900FFFFE400BDA279000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A48B6800000000000000000000000000BFA47C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A58A6500FFF8D3000011E200FFFFE300BCA179000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A48B6800FFFFD400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A68B6500DCC7A7000017EC00FFFFE300BCA079000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A48B6800DCC7A7000017EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A58A6500FFF7D200001EF500FFFFE200BCA079000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A48B6800FFF7D100001EF500FFFFE40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A58A6500FFF7D1000025FE00FFFFE200BCA179000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A48B6800FFF7D1000025FE00FFFFE400BFA47C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A68A6500DBC5A600002CFF00FFFFE100BDA27A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A48B6800DCC7A700002CFF00FFFFE400BFA47C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A4896500FFF3D200002AFF00FFFFE300BDA27B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A48B6800FFF7D100002CFF00FFFFE400BFA47C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A3896600FFF0D800FFF6DB00FFFFEA00BEA480000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B6997200B5997400BAA07B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFF83F00000000FE3FE00F00000000
      FC1FC00700000000F80F800300000000F80F801300000000F80F301900000000
      FC1F301900000000FC1F383900000000FC1F383900000000FC1F381900000000
      FC1F380900000000FC1F980300000000FC1F882300000000FC1FC00700000000
      FC1FE00F00000000FE3FF83F0000000000000000000000000000000000000000
      000000000000}
  end
  object qTanksLastZamerTime: TOraQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select z1.datetime, p.active, p.rec_numb, r.name as rez_name'
      '  from (select max(z0.datetime) as datetime, z0.rez_numb'
      '          from v_zamer_fuel_level z0'
      '         where trunc(datetime) = trunc(sysdate)'
      '         group by rez_numb) z1,'
      '       ZAMER_COPY_PETROL p,'
      '       exe_link el,'
      '       oil_rezervuar r'
      ' where z1.rez_numb(+) = p.rec_numb'
      '   and el.out_program = 9'
      '   and el.oil_table_name = '#39'OIL_REZERVUAR'#39
      '   and p.rec_numb = el.out_code'
      '   and el.oil_id = r.id'
      '   and el.oil_inst = r.inst')
    Left = 512
    Top = 516
  end
  object OraAlerter: TOraAlerter
    Events = 'RefreshData'
    AutoRegister = True
    Session = frmStart.OraSession1
    TimeOut = 1000
    Interval = 1000
    EventType = etAlert
    OnEvent = OraAlerterEvent
    OnTimeOut = OraAlerterTimeOut
    Left = 95
    Top = 446
  end
end
