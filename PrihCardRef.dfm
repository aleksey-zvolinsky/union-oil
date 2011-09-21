inherited PrihCardRefForm: TPrihCardRefForm
  Left = 274
  Top = 293
  BorderStyle = bsSingle
  Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1101#1083'. '#1082#1072#1088#1090#1086#1095#1082#1072#1084
  ClientHeight = 393
  ClientWidth = 797
  Constraints.MinHeight = 420
  Constraints.MinWidth = 760
  OldCreateOrder = True
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 361
    Width = 797
    Height = 32
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    OnDblClick = Panel1DblClick
    object lFilterStatus: TLabel
      Left = 364
      Top = 11
      Width = 54
      Height = 13
      Caption = 'lFilterStatus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sbSum: TSpeedButton
      Left = 334
      Top = 4
      Width = 25
      Height = 25
      Hint = #1042#1082#1083'/'#1086#1090#1082#1083'. '#1087#1086#1076#1089#1095#1077#1090' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
      AllowAllUp = True
      GroupIndex = 12
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
        03333377777777777F33333003333330033333377FF333377F33333300333333
        0333333377FF33337F3333333003333303333333377FF3337333333333003333
        333333333377FF3333333333333003333333333333377FF33333333333330033
        3333333333337733333333333330033333333333333773333333333333003333
        33333333337733333F3333333003333303333333377333337F33333300333333
        03333333773333337F33333003333330033333377FFFFFF77F33330000000000
        0333337777777777733333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = sbSumClick
    end
    object Panel3: TPanel
      Left = 702
      Top = 2
      Width = 93
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object bbCancel: TBitBtn
        Left = 5
        Top = 2
        Width = 85
        Height = 25
        Caption = '&'#1047#1072#1082#1088#1099#1090#1100
        TabOrder = 0
        OnClick = bbCancelClick
        Kind = bkCancel
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 329
      Height = 28
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object sbPrint: TRxSpeedButton
        Left = 282
        Top = 2
        Width = 45
        Height = 25
        Hint = #1055#1077#1095#1072#1090#1100' '#1089#1086#1087#1091#1090#1089#1090#1074#1091#1102#1097#1080#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        DropDownMenu = ppPrintDoc
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
      object sbAdd: TSpeedButton
        Left = 4
        Top = 2
        Width = 25
        Height = 25
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1089#1082#1091#1089#1090#1074#1077#1085#1085#1091#1102' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1102
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
      end
      object bbClear: TBitBtn
        Left = 115
        Top = 2
        Width = 81
        Height = 25
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1077' '#1087#1086#1083#1103' '#1087#1086#1080#1089#1082#1072
        Caption = #1054'&'#1095#1080#1089#1090#1080#1090#1100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbClearClick
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
      object bbSearch: TBitBtn
        Left = 200
        Top = 2
        Width = 77
        Height = 25
        Hint = #1053#1072#1081#1090#1080
        Caption = #1055#1086'&'#1080#1089#1082
        Default = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bbSearchClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888000000000000880077777777777788770FFFFFFFFFF0
          800078888888888787770F0000FF0000700878777788777777780FFFFFF07887
          078878888887788777880F0FFF0788E770887878887788F777880FFFFF088887
          808878888878888787880F000F08E887808878777878F88787880FFFFF07EE87
          708878888877FF8777880F0F0FF07887088878787887788778880FFFFFFF0000
          888878888888777788880F000F0FFFF0888878777878888788880FFFFFFF0000
          888878888888777788880F000FFF0808888878777888787888880FFFFFFF0088
          8888788888887788888800000000088888887777777778888888}
        NumGlyphs = 2
      end
      object PEdit: TPanel
        Left = 0
        Top = 0
        Width = 114
        Height = 28
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object sbEdit: TSpeedButton
          Left = 29
          Top = 2
          Width = 25
          Height = 25
          Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbEditClick
        end
        object spbDelTrans: TSpeedButton
          Left = 57
          Top = 2
          Width = 25
          Height = 25
          Hint = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1090#1100' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1102
          Enabled = False
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
          OnClick = spbDelTransClick
        end
        object SpeedButton5: TSpeedButton
          Left = 1
          Top = 2
          Width = 25
          Height = 25
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1089#1082#1091#1089#1090#1074#1077#1085#1085#1091#1102' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1102
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
          OnClick = SpeedButton5Click
        end
        object sbViewRecalc: TSpeedButton
          Left = 85
          Top = 2
          Width = 25
          Height = 25
          Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080#1089#1090#1086#1088#1080#1080
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888888888888888888888888888888888888888888888888
            8888888888888888888888888F8F8F8F8F8888888F8F8F8F8F8888F8F8F8F8F8
            F8F888F8F8F8F8F8F8F88F8F800000077F8F8F8F877777777F8FF8F00EEEFFF7
            78F8F8F77FFFFFF778F88F04E400E0007F8F8F77F777F7777F8FF800E000E007
            F8F8F877F777F777F8F88F000000007F8F8F8F777777778F8F8FF87700077778
            F8F8F88877788888F8F88F777777778F8F888F888888888F8F8888F77778F8F8
            F88888F88888F8F8F888888F8F8F8F888888888F8F8F8F888888888888888888
            8888888888888888888888888888888888888888888888888888}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbViewRecalcClick
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 97
    Align = alTop
    TabOrder = 1
    DesignSize = (
      797
      97)
    object Label2: TLabel
      Left = 126
      Top = 9
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = #1069#1084#1080#1090#1077#1085#1090
    end
    object lClient: TLabel
      Left = 126
      Top = 35
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1083#1080#1077#1085#1090
    end
    object SpeedButton1: TSpeedButton
      Left = 424
      Top = 5
      Width = 21
      Height = 21
      Hint = '21'
      Anchors = [akTop, akRight]
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
      OnClick = SpeedButton1Click
    end
    object SpeedButton3: TSpeedButton
      Left = 424
      Top = 31
      Width = 21
      Height = 21
      Hint = '21'
      Anchors = [akTop, akRight]
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
    object Label1: TLabel
      Left = 6
      Top = 9
      Width = 13
      Height = 13
      Caption = #1054#1090
    end
    object Label5: TLabel
      Left = 6
      Top = 35
      Width = 15
      Height = 13
      Caption = #1044#1086
    end
    object Label6: TLabel
      Left = 135
      Top = 61
      Width = 34
      Height = 13
      Caption = #8470' '#1076#1086#1075'.'
    end
    object Label7: TLabel
      Left = 456
      Top = 35
      Width = 16
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1053#1055
    end
    object SpeedButton2: TSpeedButton
      Left = 564
      Top = 31
      Width = 21
      Height = 21
      Hint = '21'
      Anchors = [akTop, akRight]
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
      OnClick = SpeedButton2Click
    end
    object Label9: TLabel
      Left = 6
      Top = 61
      Width = 48
      Height = 13
      Caption = #8470' '#1082#1072#1088#1090#1099':'
    end
    object Label4: TLabel
      Left = 280
      Top = 61
      Width = 49
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072' '#1076#1086#1075'.'
    end
    object SpeedButton4: TSpeedButton
      Left = 424
      Top = 57
      Width = 21
      Height = 21
      Hint = '21'
      Anchors = [akTop, akRight]
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
    object Label3: TLabel
      Left = 456
      Top = 9
      Width = 21
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1040#1047#1057
    end
    object sbCearAZS: TSpeedButton
      Left = 564
      Top = 5
      Width = 21
      Height = 21
      Hint = '21'
      Anchors = [akTop, akRight]
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
      OnClick = sbCearAZSClick
    end
    object RxSpeedButton2: TRxSpeedButton
      Left = 489
      Top = 72
      Width = 17
      Height = 15
      Anchors = [akTop, akRight]
      DropDownMenu = miTransType
      Flat = True
    end
    object lbTransType: TLabel
      Left = 510
      Top = 72
      Width = 81
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1058#1080#1087' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object deDate1: TDateEdit
      Left = 28
      Top = 6
      Width = 90
      Height = 21
      DirectInput = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      YearDigits = dyFour
      TabOrder = 0
    end
    object ceEmName: TComboEdit
      Left = 173
      Top = 6
      Width = 250
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = ceEmNameButtonClick
      OnDblClick = ceEmNameButtonClick
    end
    object ceToName: TComboEdit
      Left = 173
      Top = 32
      Width = 250
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = ceToNameButtonClick
      OnDblClick = ceToNameButtonClick
    end
    object deDate2: TDateEdit
      Left = 28
      Top = 32
      Width = 90
      Height = 21
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
    end
    object eDogNum: TEdit
      Left = 173
      Top = 58
      Width = 100
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
    object ceNpType: TComboEdit
      Left = 483
      Top = 32
      Width = 80
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akTop, akRight]
      NumGlyphs = 1
      TabOrder = 8
      OnButtonClick = ceNpTypeButtonClick
      OnDblClick = ceNpTypeButtonClick
    end
    object pnlFilter: TPanel
      Left = 595
      Top = 1
      Width = 201
      Height = 95
      Align = alRight
      Alignment = taRightJustify
      BevelInner = bvLowered
      TabOrder = 10
      DesignSize = (
        201
        95)
      object RxLabel1: TRxLabel
        Left = 154
        Top = 3
        Width = 42
        Height = 13
        Caption = #1060#1080#1083#1100#1090#1088
      end
      object sbAdditionFilter: TRxSpeedButton
        Left = 181
        Top = 36
        Width = 17
        Height = 17
        DropDownMenu = pmAdditionFilter
        Flat = True
      end
      object sbAdditionFilterLS: TRxSpeedButton
        Left = 103
        Top = 68
        Width = 17
        Height = 17
        DropDownMenu = pmAdditionFilterLS
        Flat = True
      end
      object sbAdditionFilterPopoln: TRxSpeedButton
        Left = 114
        Top = 20
        Width = 17
        Height = 17
        DropDownMenu = pmAdditionFilterPopoln
        Flat = True
      end
      object rbMinus: TRadioButton
        Tag = 2
        Left = 6
        Top = 38
        Width = 172
        Height = 19
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = '"'#1053#1072#1096#1080#1077'" '#1089#1087#1080#1089#1072#1085#1080#1103' '#1069#1050' '#1085#1072' '#1040#1047#1057
        TabOrder = 2
        OnClick = rbMinusClick
      end
      object rbPlus: TRadioButton
        Tag = 1
        Left = 6
        Top = 22
        Width = 107
        Height = 19
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1055#1086#1087#1086#1083#1085#1077#1085#1080#1103' '#1069#1050
        TabOrder = 1
        OnClick = MenuItem1Click
      end
      object rbAll: TRadioButton
        Left = 6
        Top = 6
        Width = 57
        Height = 19
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1042#1089#1077
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = bbSearchClick
      end
      object rbAlien: TRadioButton
        Tag = 3
        Left = 6
        Top = 57
        Width = 174
        Height = 12
        Caption = '"'#1063#1091#1078#1080#1077'" '#1089#1087#1080#1089#1072#1085#1080#1103' '#1069#1050' '#1085#1072' '#1040#1047#1057
        TabOrder = 3
        OnClick = bbSearchClick
      end
      object rbLS: TRadioButton
        Tag = 4
        Left = 6
        Top = 70
        Width = 89
        Height = 19
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1057#1087#1080#1089#1072#1085#1080#1103' '#1051#1057
        TabOrder = 4
        OnClick = rbLSClick
      end
    end
    object edCardNum: TEdit
      Left = 57
      Top = 58
      Width = 71
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 4
    end
    object deDogDate: TDateEdit
      Left = 333
      Top = 58
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 6
    end
    object ceAZSName: TComboEdit
      Left = 483
      Top = 6
      Width = 81
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akTop, akRight]
      NumGlyphs = 1
      TabOrder = 7
      OnButtonClick = ceAZSNameButtonClick
      OnDblClick = ceAZSNameButtonClick
    end
    object chShowGrn: TCheckBox
      Left = 491
      Top = 55
      Width = 92
      Height = 15
      Anchors = [akTop, akRight]
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1075#1088#1085
      TabOrder = 9
      OnClick = chShowGrnClick
    end
  end
  object dbg: TDBGridEh
    Left = 0
    Top = 97
    Width = 797
    Height = 264
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clSilver
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghIncSearch, dghRowHighlight]
    ParentFont = False
    PopupMenu = ppPrintDoc
    ReadOnly = True
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgDblClick
    OnGetCellParams = dbgGetCellParams
    OnSortMarkingChanged = dbgSortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'OPER_DATE'
        Footer.Alignment = taRightJustify
        Footer.Value = #1050#1086#1083'-'#1074#1086' ('#1096#1090'):'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1086#1087#1077#1088#1072#1094#1080#1080
        Title.TitleButton = True
      end
      item
        Alignment = taLeftJustify
        EditButtons = <>
        FieldName = 'GR_CARD_NUM'
        Footer.Alignment = taLeftJustify
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1082#1072#1088#1090#1099
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'NPTYPE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1055
        Title.TitleButton = True
        Width = 26
      end
      item
        EditButtons = <>
        FieldName = 'COUNT_LITR'
        Footer.DisplayFormat = '0.00'
        Footer.FieldName = 'COUNT_LITR'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'. '#1083#1080#1090#1088'.'
        Title.TitleButton = True
        Width = 80
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'PURSE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1063#1077#1084
        Title.TitleButton = True
        Visible = False
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'COUNT_PURSE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072' '#1095#1077#1084
        Title.TitleButton = True
        Visible = False
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'PRICE_DOG_NDS'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Title.TitleButton = True
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = 'PRICE_NDS'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072' '#1090#1077#1088#1084'.'
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'DOC_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1076#1086#1082'.'
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'DOC_DATE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1076#1086#1082'.'
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'DOG_NUM'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1076#1086#1075'.'
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'DOG_DATE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1076#1086#1075'.'
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'DOG_REAL_FOREPAY_NAME'
        Footer.Alignment = taRightJustify
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1083#1072#1090#1072
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'CAUSE_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1095#1080#1085#1072
        Title.TitleButton = True
        Width = 175
      end
      item
        EditButtons = <>
        FieldName = 'TONAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1050#1083#1080#1077#1085#1090
        Title.TitleButton = True
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'ALIEN_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1043#1076#1077' '#1087#1088#1086#1080#1079#1086#1096#1083#1086' '#1089#1087#1080#1089#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'AZS_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1040#1047#1057
        Title.TitleButton = True
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'EMITENT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1069#1084#1080#1090#1077#1085#1090
        Title.TitleButton = True
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'CARD_PRICE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1086#1080#1084'. '#1082#1072#1088#1090#1099
        Title.TitleButton = True
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'SHARE_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1040#1082#1094#1080#1103
        Title.TitleButton = True
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'NB_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1054#1090#1087#1091#1089#1090#1080#1074#1096#1072#1103' '#1053#1041
        Title.TitleButton = True
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'AUTO_NUMB'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1084#1077#1088' '#1040#1074#1090#1086
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOY_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1042#1086#1076#1080#1090#1077#1083#1100
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'DATE_MOD'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1072
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'ORGDB_NAME'
        Footers = <>
        Title.Caption = #1041#1044' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        Width = 256
      end>
  end
  object ppPrintDoc: TPopupMenu
    OnPopup = ppPrintDocPopup
    Left = 288
    Top = 280
    object miDocEC: TMenuItem
      Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1082#1086#1096#1077#1083#1105#1082
      object PrintZ: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1072#1090#1100'/'#1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1079#1072#1103#1074#1082#1091
        OnClick = PrintZClick
      end
      object DelZ: TMenuItem
        Caption = #1054#1090#1074#1103#1079#1072#1090#1100' '#1079#1072#1103#1074#1082#1091
        OnClick = DelZClick
      end
      object miCardPrintEC: TMenuItem
        Tag = 1
        Caption = #1044#1086#1075#1086#1074#1086#1088' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1072#1084' - '#1069#1050
        OnClick = miDopConsentClick
      end
      object miDopConsent: TMenuItem
        Tag = 2
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1077' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1077
        OnClick = miDopConsentClick
      end
    end
    object miDocLS: TMenuItem
      Caption = #1051#1080#1084#1080#1090#1085#1072#1103' '#1089#1093#1077#1084#1072
      object miInvoiceLS: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1072#1090#1100'/'#1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1089#1095#1077#1090'-'#1092#1072#1082#1090#1091#1088#1091
        OnClick = miInvoiceLSClick
      end
      object miInvoiceLSDel: TMenuItem
        Caption = #1054#1090#1074#1103#1079#1072#1090#1100' '#1089#1095#1077#1090'-'#1092#1072#1082#1090#1091#1088#1091
        OnClick = miInvoiceLSDelClick
      end
      object N8: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1086' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1103#1093
        OnClick = N8Click
      end
      object miCardPrintLS: TMenuItem
        Caption = #1044#1086#1075#1086#1074#1086#1088' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1072#1084' - '#1051#1057
        OnClick = miCardPrintLSClick
      end
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object PrintRn: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1093#1086#1076#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      OnClick = PrintRnClick
    end
    object miDeleteRn: TMenuItem
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1088#1072#1089#1093#1086#1076#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      OnClick = miDeleteRnClick
    end
    object PrintReestr: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1088#1077#1077#1089#1090#1088#1072' '#1088#1072#1089#1093#1086#1076#1085#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      OnClick = PrintReestrClick
    end
    object miExchClient: TMenuItem
      Caption = #1047#1072#1084#1077#1085#1072' '#1082#1083#1080#1077#1085#1090#1086#1074
      OnClick = miExchClientClick
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object miRecalc: TMenuItem
      Caption = #1055#1077#1088#1077#1089#1095#1077#1090
      object miRecalcByCard: TMenuItem
        Caption = #1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1082#1072#1088#1090#1077
        OnClick = miRecalcByCardClick
      end
      object miRecalcByCardPeriod: TMenuItem
        Caption = #1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1082#1072#1088#1090#1077' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        Visible = False
        OnClick = miRecalcByCardClick
      end
      object miRecalcByClient: TMenuItem
        Caption = #1074#1089#1077' '#1082#1072#1088#1090#1099' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1082#1083#1080#1077#1085#1090#1072
        OnClick = miRecalcByClientClick
      end
      object miRecalcByClientPeriod: TMenuItem
        Caption = #1074#1089#1077' '#1082#1072#1088#1090#1099' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1082#1083#1080#1077#1085#1090#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        Visible = False
        OnClick = miRecalcByClientClick
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object miRecalcAll: TMenuItem
        Caption = #1087#1086#1083#1085#1099#1081' '#1087#1077#1088#1077#1089#1095#1077#1090
        OnClick = miRecalcAllClick
      end
    end
    object miSeparator: TMenuItem
      Caption = '-'
    end
    object miRefPrint: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      OnClick = miRefPrintClick
    end
  end
  object qWork: TOilQuery
    SQL.Strings = (
      ''
      ''
      ' ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 9
    Top = 290
  end
  object q: TOilQuery
    SQL.Strings = (
      '--> q,PrihCardRefForm'
      
        'select /*+choose ordered use_hash(ct,emitent,oil_org,oil_np_grou' +
        'p,npg,oil_auto,oil_employ,cause,first_dog)*/'
      ' decode(nvl(corr_date, real_date),'
      '        real_date,'
      '        decode(nvl(corr_time, real_time),'
      '               real_time,'
      
        '               decode(nvl(corr_litr, real_litr), real_litr, 0, 1' +
        '),'
      '               1),'
      '        1) as is_corr,'
      ' ct.oil_id,'
      ' ct.time_,'
      ' ct.oil_inst,'
      ' ct.id_'#1089#1093#1077#1084#1099'_'#1086#1073#1089#1083' as cardscheme,'
      ' ct.date_,'
      ' ct.oper_date,'
      ' ct.dog_id,'
      ' ct.dog_inst,'
      ' '
      ' ct.doc_number,'
      ' ct.doc_date,'
      ' ct.dog_num,'
      ' ct.dog_date,'
      ' ct.dog_forepay,'
      ' first_dog.forepay as dog_real_forepay,'
      ' decode(first_dog.Forepay,'
      
        '        0, decode(ov.language, 0, '#39#1087#1086#1089#1083#1077#1086#1087#1083#1072#1090#1072#39', 1, '#39#1087#1110#1089#1083#1103#1074#1080#1087#1083#1072#1090 +
        #1072#39'),'
      
        '        decode(ov.language, 0, '#39#1087#1088#1077#1076#1086#1087#1083#1072#1090#1072#39', 1, '#39#1087#1077#1088#1077#1076#1074#1080#1087#1083#1072#1090#1072#39'))' +
        ' dog_real_forepay_Name,'
      ' ct.chek_number,'
      ' ct.chek_date,'
      ' '
      ' ct.price_nds,'
      ' ct.count_litr,'
      ' ct.to_id,'
      ' ct.to_inst,'
      ' ct.oper_type,'
      ' ct.gr_card_num,'
      ' ct.'#1085#1086#1084#1077#1088'_'#1090#1077#1088#1084#1080#1085#1072#1083#1072','
      ' ct.price_dog_nds,'
      ' ct.card_price,'
      ' ct.dov_ser,'
      ' ct.dov_num,'
      ' ct.dov_date,'
      ' ct.dov_who,'
      ' ct.clean_z_num,'
      ' ct.auto_id,'
      ' ct.auto_inst,'
      ' ct.employ_id,'
      ' ct.employ_inst,'
      ' ct.'#1087#1088#1080#1095#1080#1085#1072'_'#1080#1079#1084#1077#1085#1077#1085#1080#1103' as cause,'
      ' oil_org.name as toname,'
      ' ct.azs_dep_name as alien_name,'
      ' ct.azs_name,'
      ' emitent.name as emitent_name,'
      ' oil_np_group.name as nptype,'
      ' oil_auto.numb as auto_numb,'
      ' oil_employ.f_name || '#39' '#39' ||'
      ' decode(oil_employ.i_name,'
      '        null, '#39#39','
      '        substr(oil_employ.i_name, 1, 1) || '#39'. '#39') ||'
      ' decode(oil_employ.i_name,'
      '        null, '#39#39','
      '        substr(oil_employ.o_name, 1, 1) || '#39'. '#39') as employ_name,'
      ' ct.date_mod as date_mod,'
      ' ct.nn_id,'
      ' ct.nn_inst,'
      ' ct.np_type,'
      ' decode(ct.trans_type,'
      '        70, '#39#1077#1089#1090#1077#1089#1090#1074#1077#1085#1085#1072#1103#39','
      '        71, '#39#1077#1089#1090#1077#1089#1090#1074#1077#1085#1085#1072#1103' '#1072#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#1085#1072#1103#39','
      '        72, '#39#1080#1089#1082#1091#1089#1089#1090#1074#1077#1085#1085#1072#1103#39','
      '        73, '#39#1080#1089#1082#1091#1089#1089#1090#1074#1077#1085#1085#1072#1103' '#1072#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#1085#1072#1103#39') as trans_typestr,'
      ' ct.trans_type,'
      ' npg.name as purse,'
      ' ct.'#1089#1091#1084#1084#1072'_'#1095#1077#1084' as count_purse,'
      ' cause.id as cause_id,'
      ' cause.cause_name,'
      ' ct.corr_litr,'
      ' ct.corr_date,'
      ' ct.corr_time,'
      ' ct.real_litr,'
      ' ct.real_date,'
      ' ct.real_time,'
      ' ct.request_id,'
      ' ct.request_inst,'
      ' sh.id as share_id,'
      ' sh.name as share_name,'
      ' nb.name as nb_name,'
      ' ct.azs_obl_id,'
      ' ct.azs_dep_id,'
      ' ct.card_dep_id,'
      ' ct.card_obl_id,'
      ' ct.id,'
      ' ct.trn_guid,'
      ' orgdb.id as orgdb_id, '
      ' orgdb.inst as orgdb_inst,'
      ' orgdb.name as orgdb_name'
      '  from v_card_transaction ct,'
      '       v_org orgdb,'
      '       v_org emitent,'
      '       v_org oil_org,'
      '       v_oil_np_group oil_np_group,'
      '       v_oil_np_group npg,'
      '       oil_auto,'
      '       oil_employ,'
      '       card_cause cause,'
      '       v_org nb,'
      '       oil_share sh,'
      '       (select *'
      '          from (select dog.*,'
      '                       decode(sub_type, 101, 1, 0) as is_ls,'
      
        '                       row_number() over(partition by to_, to_in' +
        'st, nvl(sub_type, 100) order by dog_date, id, inst) rnum'
      '                  from oil_dog dog'
      '                 where state = '#39'Y'#39
      '                   and dog_type = '#39'K'#39')'
      '         where rnum = 1) first_dog'
      ' where nvl(ct.card_number, 0) > 0'
      '      /*data base*/'
      '   and ct.oil_inst = orgdb.id'
      '   and ct.oil_inst = orgdb.inst'
      '      /*client*/'
      '   and ct.to_id = oil_org.id(+)'
      '   and ct.to_inst = oil_org.inst(+)'
      '      /*emitent*/'
      '   and card_dep_id = emitent.id'
      '   and emitent.id = emitent.inst'
      '      /*np*/'
      '   and ct.np_type = oil_np_group.petrol_id(+)'
      '   and ct.id_'#1082#1086#1096'_'#1095#1077#1084' = npg.petrol_id(+)'
      '      /*cause*/'
      '   and ct.oper_num = cause.id(+)'
      '      /*auto*/'
      '   and ct.auto_id = oil_auto.id(+)'
      '   and ct.auto_inst = oil_auto.inst(+)'
      '      /*first_dog*/'
      '   and ct.to_id = first_dog.to_(+)'
      '   and ct.to_inst = first_dog.to_inst(+)'
      '   and first_dog.sub_type(+) = decode(ct.oper_num, 12, 101, 100)'
      '      /*share*/'
      '   and ct.share_id = sh.id(+)'
      '      /*employ*/'
      '   and ct.employ_id = oil_employ.id(+)'
      '   and ct.employ_inst = oil_employ.inst(+)'
      '   and ct.date_ between :begindate and :enddate'
      '      /*request_nb*/'
      '   and nb.id(+) = nb.inst(+)'
      '   and nb.inst(+) = ct.request_inst'
      '      /*'#1085#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1086#1087#1077#1088#1072#1094#1080#1080' '#1089#1086' '#1089#1095#1077#1090#1086#1084'*/'
      '   and ct.oper_num not in (1, 2)'
      '      /*'#1092#1080#1083#1100#1090#1088' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081'*/'
      '   and (ct.oper_num in (3, 4, 5, 6, 7) or :receipt = 0)'
      '   and (ct.oper_num = 5 or :receipt_in_OC = 0)'
      '   and (ct.oper_num in (3, 4, 7) or :deferred_receipt = 0)'
      '   and (ct.oper_num = 6 or :expense_in_OC = 0)'
      '      /*'#1092#1080#1083#1100#1090#1088' '#1089#1087#1080#1089#1072#1085#1080#1081'*/'
      '   and (ct.oper_num in (9, 10, 11) or :expense = 0)'
      '      /*'#1092#1080#1083#1100#1090#1088' '#1082#1083#1080#1077#1085#1090#1072'*/'
      '   and (ct.to_id = :toid or :toid = 0)'
      '   and (ct.to_inst = :toinst or :toinst = 0)'
      '      /*'#1092#1080#1083#1100#1090#1088' '#1101#1084#1080#1090#1077#1085#1090#1072'*/'
      
        '   and (emitent.name like '#39'%'#39' || :emitent || '#39'%'#39' or :emitent is ' +
        'null)'
      '      /*'#1092#1080#1083#1100#1090#1088' '#1040#1047#1057'*/'
      '   and (ct.'#1085#1086#1084#1077#1088'_'#1090#1077#1088#1084#1080#1085#1072#1083#1072' + 1000000 = :azsid or :azsid = 0)'
      '   and (ct.'#1085#1086#1084#1077#1088'_'#1090#1077#1088#1084#1080#1085#1072#1083#1072' + 1000000 ='
      '        decode(:azsinst, 1, :azsid, :azsinst) or :azsid = 0)'
      '      /*'#1092#1080#1083#1100#1090#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'*/'
      
        '   and (ct.dog_num like '#39'%'#39' || :dog_num || '#39'%'#39' or :dog_num is nu' +
        'll)'
      '   and (ct.dog_date = :dog_date or :dog_date is null)'
      '      /*'#1092#1080#1083#1100#1090#1088' '#1090#1080#1087' '#1085#1087'*/'
      '   and (ct.np_type = :nptype or :nptype = 0)'
      '   and (ct.np_type in'
      
        '        (select value from oil_var where name = '#39'nn_oplat_only'#39')' +
        ' or :dt = 0)'
      '   and (ct.np_type not in'
      
        '        (select value from oil_var where name = '#39'nn_oplat_only'#39')' +
        ' or'
      '        :benz = 0)'
      '      /*'#1092#1080#1083#1100#1090#1088' '#1082#1072#1088#1090#1099'*/'
      '   and (ct.card_number like '#39'%'#39' || :cardnumber || '#39'%'#39' or'
      '        :cardnumber is null)'
      '      /*'#1092#1080#1083#1100#1090#1088' '#1051#1057' '#1045#1050'*/'
      '   and (ct.oper_num = 12 or :ls = 0)'
      '   and (ct.oper_num <> 12 or :ek = 0)'
      '      /*'#1092#1080#1083#1100#1090#1088' '#1089#1074#1086#1080'/'#1095#1091#1078#1080#1077'*/'
      
        '   and ((card_obl_id <> nvl(ct.azs_obl_id, card_obl_id)) or :onl' +
        'yalien = 0)'
      
        '   and ((card_obl_id = nvl(ct.azs_obl_id, card_obl_id)) or :only' +
        'own = 0)'
      '      /*'#1092#1080#1083#1100#1090#1088' '#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1085#1099#1093'/'#1085#1077' '#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074'*/'
      '   and (doc_number is null or :rnnotprinted = 0)'
      '   and (doc_number is not null or :rnprinted = 0)'
      '   and ((chek_number is null and ct.oper_num = 12) or'
      '        :invoicenotprinted = 0)'
      '   and ((chek_number is not null and ct.oper_num = 12) or'
      '        :invoiceprinted = 0)')
    CachedUpdates = True
    UpdateObject = uq
    AfterPost = qAfterPost
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 48
    Top = 156
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'begindate'
      end
      item
        DataType = ftUnknown
        Name = 'enddate'
      end
      item
        DataType = ftUnknown
        Name = 'receipt'
      end
      item
        DataType = ftUnknown
        Name = 'receipt_in_OC'
      end
      item
        DataType = ftUnknown
        Name = 'deferred_receipt'
      end
      item
        DataType = ftUnknown
        Name = 'expense_in_OC'
      end
      item
        DataType = ftUnknown
        Name = 'expense'
      end
      item
        DataType = ftUnknown
        Name = 'toid'
      end
      item
        DataType = ftUnknown
        Name = 'toinst'
      end
      item
        DataType = ftUnknown
        Name = 'emitent'
      end
      item
        DataType = ftUnknown
        Name = 'azsid'
      end
      item
        DataType = ftUnknown
        Name = 'azsinst'
      end
      item
        DataType = ftUnknown
        Name = 'dog_num'
      end
      item
        DataType = ftDateTime
        Name = 'dog_date'
        ParamType = ptInputOutput
      end
      item
        DataType = ftUnknown
        Name = 'nptype'
      end
      item
        DataType = ftUnknown
        Name = 'dt'
      end
      item
        DataType = ftUnknown
        Name = 'benz'
      end
      item
        DataType = ftUnknown
        Name = 'cardnumber'
      end
      item
        DataType = ftUnknown
        Name = 'ls'
      end
      item
        DataType = ftUnknown
        Name = 'ek'
      end
      item
        DataType = ftUnknown
        Name = 'onlyalien'
      end
      item
        DataType = ftUnknown
        Name = 'onlyown'
      end
      item
        DataType = ftUnknown
        Name = 'rnnotprinted'
      end
      item
        DataType = ftUnknown
        Name = 'rnprinted'
      end
      item
        DataType = ftUnknown
        Name = 'invoicenotprinted'
      end
      item
        DataType = ftUnknown
        Name = 'invoiceprinted'
      end>
    object qOIL_ID: TFloatField
      FieldName = 'OIL_ID'
      Required = True
    end
    object qTIME_: TStringField
      FieldName = 'TIME_'
      Size = 6
    end
    object qOIL_INST: TFloatField
      FieldName = 'OIL_INST'
      Required = True
    end
    object qCARDSCHEME: TFloatField
      FieldName = 'CARDSCHEME'
    end
    object qDATE_: TDateTimeField
      FieldName = 'DATE_'
    end
    object qOPER_DATE: TDateTimeField
      FieldName = 'OPER_DATE'
    end
    object qPRICE_NDS: TFloatField
      FieldName = 'PRICE_NDS'
    end
    object qCOUNT_LITR: TFloatField
      FieldName = 'COUNT_LITR'
    end
    object qTO_ID: TFloatField
      FieldName = 'TO_ID'
    end
    object qTO_INST: TFloatField
      FieldName = 'TO_INST'
    end
    object qOPER_TYPE: TFloatField
      FieldName = 'OPER_TYPE'
      Required = True
    end
    object qGR_CARD_NUM: TFloatField
      FieldName = 'GR_CARD_NUM'
    end
    object q_: TStringField
      FieldName = #1053#1054#1052#1045#1056'_'#1058#1045#1056#1052#1048#1053#1040#1051#1040
      Size = 5
    end
    object qPRICE_DOG_NDS: TFloatField
      FieldName = 'PRICE_DOG_NDS'
    end
    object qCARD_PRICE: TFloatField
      FieldName = 'CARD_PRICE'
    end
    object qDOV_SER: TStringField
      FieldName = 'DOV_SER'
      Size = 10
    end
    object qDOV_NUM: TStringField
      FieldName = 'DOV_NUM'
      Size = 15
    end
    object qDOV_DATE: TDateTimeField
      FieldName = 'DOV_DATE'
    end
    object qDOV_WHO: TStringField
      FieldName = 'DOV_WHO'
      Size = 35
    end
    object qCLEAN_Z_NUM: TStringField
      FieldName = 'CLEAN_Z_NUM'
      Size = 10
    end
    object qAUTO_ID: TFloatField
      FieldName = 'AUTO_ID'
    end
    object qAUTO_INST: TFloatField
      FieldName = 'AUTO_INST'
    end
    object qEMPLOY_ID: TFloatField
      FieldName = 'EMPLOY_ID'
    end
    object qEMPLOY_INST: TFloatField
      FieldName = 'EMPLOY_INST'
    end
    object qCAUSE: TFloatField
      FieldName = 'CAUSE'
    end
    object qTONAME: TStringField
      FieldName = 'TONAME'
      Size = 100
    end
    object qALIEN_NAME: TStringField
      FieldName = 'ALIEN_NAME'
      Size = 100
    end
    object qAZS_NAME: TStringField
      FieldName = 'AZS_NAME'
      Size = 100
    end
    object qEMITENT_NAME: TStringField
      FieldName = 'EMITENT_NAME'
      Size = 100
    end
    object qNPTYPE: TStringField
      FieldName = 'NPTYPE'
      Size = 50
    end
    object qAUTO_NUMB: TStringField
      FieldName = 'AUTO_NUMB'
      Size = 12
    end
    object qEMPLOY_NAME: TStringField
      FieldName = 'EMPLOY_NAME'
      Size = 57
    end
    object qDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
    end
    object qNN_ID: TFloatField
      FieldName = 'NN_ID'
    end
    object qNN_INST: TFloatField
      FieldName = 'NN_INST'
    end
    object qNP_TYPE: TFloatField
      FieldName = 'NP_TYPE'
    end
    object qTRANS_TYPESTR: TStringField
      FieldName = 'TRANS_TYPESTR'
      Size = 28
    end
    object qTRANS_TYPE: TFloatField
      FieldName = 'TRANS_TYPE'
    end
    object qPURSE: TStringField
      FieldName = 'PURSE'
      Size = 50
    end
    object qCOUNT_PURSE: TFloatField
      FieldName = 'COUNT_PURSE'
    end
    object qCAUSE_ID: TFloatField
      FieldName = 'CAUSE_ID'
    end
    object qCAUSE_NAME: TStringField
      FieldName = 'CAUSE_NAME'
      Size = 40
    end
    object qREAL_LITR: TFloatField
      FieldName = 'REAL_LITR'
    end
    object qREAL_DATE: TDateTimeField
      FieldName = 'REAL_DATE'
      Required = True
    end
    object qREAL_TIME: TStringField
      FieldName = 'REAL_TIME'
      Required = True
      FixedChar = True
      Size = 6
    end
    object qREQUEST_ID: TFloatField
      FieldName = 'REQUEST_ID'
    end
    object qREQUEST_INST: TFloatField
      FieldName = 'REQUEST_INST'
    end
    object qNB_NAME: TStringField
      FieldName = 'NB_NAME'
      Size = 100
    end
    object qDOG_ID: TFloatField
      FieldName = 'DOG_ID'
    end
    object qDOG_INST: TFloatField
      FieldName = 'DOG_INST'
    end
    object qSHARE_ID: TFloatField
      FieldName = 'SHARE_ID'
    end
    object qSHARE_NAME: TStringField
      FieldName = 'SHARE_NAME'
      Size = 50
    end
    object qDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 10
    end
    object qDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object qDOG_NUM: TStringField
      FieldName = 'DOG_NUM'
      Size = 32
    end
    object qDOG_DATE: TDateTimeField
      FieldName = 'DOG_DATE'
    end
    object qDOG_FOREPAY: TFloatField
      FieldName = 'DOG_FOREPAY'
    end
    object qDOG_REAL_FOREPAY: TFloatField
      FieldName = 'DOG_REAL_FOREPAY'
    end
    object qDOG_REAL_FOREPAY_NAME: TStringField
      FieldName = 'DOG_REAL_FOREPAY_NAME'
      Size = 12
    end
    object qIS_CORR: TFloatField
      FieldName = 'IS_CORR'
    end
    object qID: TFloatField
      FieldName = 'ID'
    end
    object qTRN_GUID: TStringField
      FieldName = 'TRN_GUID'
      Size = 32
    end
    object qORGDB_ID: TFloatField
      FieldName = 'ORGDB_ID'
      Required = True
    end
    object qORGDB_INST: TFloatField
      FieldName = 'ORGDB_INST'
      Required = True
    end
    object qORGDB_NAME: TStringField
      FieldName = 'ORGDB_NAME'
      Size = 100
    end
  end
  object ds: TOraDataSource
    DataSet = q
    Left = 54
    Top = 148
  end
  object uq: TOraUpdateSQL
    ModifySQL.Strings = (
      'update CARD_TRANSACTION'
      '   set CORR_DATE     = DATE_,'
      '       CORR_TIME     = TIME_,'
      '       CORR_LITR     = COUNT_LITR,'
      '       TIME_         = :TIME_,'
      '       DATE_         = :DATE_,'
      '       COUNT_LITR    = :COUNT_LITR,'
      '       PRICE_DOG_NDS = :PRICE_DOG_NDS,'
      '       CARD_PRICE    = :CARD_PRICE,'
      '       DOV_SER       = :DOV_SER,'
      '       DOV_NUM       = :DOV_NUM,'
      '       DOV_DATE      = :DOV_DATE,'
      '       DOV_WHO       = :DOV_WHO,'
      '       CLEAN_Z_NUM   = :CLEAN_Z_NUM,'
      '       AUTO_ID       = :AUTO_ID,'
      '       AUTO_INST     = :AUTO_INST,'
      '       EMPLOY_ID     = :EMPLOY_ID,'
      '       EMPLOY_INST   = :EMPLOY_INST,'
      '       TRANS_TYPE    = :TRANS_TYPE,'
      '       REQUEST_ID    = :REQUEST_ID,'
      '       REQUEST_INST  = :REQUEST_INST,'
      '       DOG_ID        = :DOG_ID,'
      '       DOG_INST      = :DOG_INST'
      ' where OIL_ID = :OLD_OIL_ID'
      '   and OIL_INST = :OLD_OIL_INST')
    Left = 140
    Top = 180
  end
  object qTransit: TOilQuery
    SQL.Strings = (
      'select /*+ORDERED*/'
      ' decode(sum(ctp.litr), null, 0, ct.Litr, 1, 2) as DocExist,'
      ' ct.Oil_Id,'
      ' ct.Oil_Inst,'
      ' ct.Oper_Date,'
      ' ct.Doc_Number,'
      ' ct.Doc_Date,'
      ' ct.Term_Price as Price_NDS,'
      ' ct.Litr as Count_Litr,'
      ' ct.Card_Number as Gr_Card_Num,'
      ' ct.AZS_Id,'
      ' azs.Par_Name AS Alien_Name,'
      ' AZS.Name AS AZS_Name,'
      ' Emitent.OblId as Emitent_Id,'
      ' Emitent.OblName AS Emitent_Name,'
      ' Oil_NP_Group.Name AS NPType,'
      ' ct.Date_Mod as Date_Mod,'
      ' to_Number(null) as CardScheme,'
      ' DECODE(ct.Trans_type,'
      '        70, '#39#1045#1089#1090#1077#1089#1090#1074#1077#1085#1085#1072#1103#39','
      '        71, '#39#1045#1089#1090#1077#1089#1090#1074#1077#1085#1085#1072#1103#39' || '#39' '#1072#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#1085#1072#1103#39', '
      '        72, '#39#1048#1089#1082#1091#1089#1089#1090#1074#1077#1085#1085#1072#1103#39','
      '        73, '#39#1048#1089#1082#1091#1089#1089#1090#1074#1077#1085#1085#1072#1103#39' || '#39' '#1072#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#1085#1072#1103#39','
      '        null) AS TRANS_TYPESTR,'
      ' ct.Trans_type,'
      ' nvl(Emitent.pponId, Emitent.OblId) as Emitent_Dep_Id,'
      ' nvl(Emitent.pponName, Emitent.OblName) as Emitent_Dep_Name'
      '  from Card_Transit ct,'
      '       card_transit_part ctp,'
      '       v_oil_org_norek Emitent,'
      '       v_card_azs AZS,'
      '       Oil_NP_Group'
      
        ' where card.GetDep(ct.card_number, trunc(ct.oper_date)) = Emiten' +
        't.id'
      '   and Emitent.inst = Emitent.id'
      '   and ct.oil_id = ctp.transit_id(+)'
      '   and ct.oil_inst = ctp.transit_inst(+)'
      '   and ctp.state(+) = '#39'Y'#39
      '   and ct.NP_Type = Oil_NP_Group.Petrol_Id(+)'
      '   and ct.AZS_Id = AZS.Id(+)'
      '   and ct.AZS_Id = AZS.Inst(+)'
      '   and trunc(ct.Oper_Date) >= :BeginDate'
      '   and trunc(ct.Oper_Date) <= :EndDate'
      
        '   and (Azs.Par_Name like '#39'%'#39' || :Alien || '#39'%'#39' or :Alien is null' +
        ')'
      
        '   and (Emitent.OblName like '#39'%'#39' || :Emitent || '#39'%'#39' or :Emitent ' +
        'is null)'
      '   and (ct.AZS_Id = :AZSId or :AZSId = 0)'
      
        '   and (ct.Doc_Number like '#39'%'#39' || :Dog_Num || '#39'%'#39' or :Dog_Num is' +
        ' null)'
      '   and (to_date(ct.Doc_Date) = :Dog_Date or :Dog_Date is null)'
      '   and (ct.NP_Type = :NPType or :NPType = 0)'
      '   and (ct.Card_Number like '#39'%'#39' || :CardNumber || '#39'%'#39' or'
      '        :CardNumber is null)'
      ' group by ct.Oil_Inst,'
      '          ct.Oper_Date,'
      '          ct.Oil_Id,'
      '          ct.Doc_Number,'
      '          ct.Doc_Date,'
      '          ct.Term_Price,'
      '          ct.Litr,'
      '          ct.Card_Number,'
      '          ct.AZS_Id,'
      '          azs.Par_Name,'
      '          AZS.Name,'
      '          Emitent.OblId,'
      '          Emitent.OblName,'
      '          Oil_NP_Group.Name,'
      '          ct.Date_Mod,'
      '          ct.Trans_type,'
      '          Emitent.pponId,'
      '          Emitent.pponName')
    AfterPost = qAfterPost
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 48
    Top = 214
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end
      item
        DataType = ftString
        Name = 'Alien'
        Size = 500
        Value = ''
      end
      item
        DataType = ftString
        Name = 'Emitent'
        Size = 500
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'AZSId'
      end
      item
        DataType = ftUnknown
        Name = 'Dog_Num'
      end
      item
        DataType = ftDateTime
        Name = 'Dog_Date'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'NPType'
      end
      item
        DataType = ftString
        Name = 'CardNumber'
        Value = ''
      end>
    object FloatField1: TFloatField
      FieldName = 'OIL_ID'
    end
    object FloatField2: TFloatField
      FieldName = 'OIL_INST'
    end
    object qTransitOPER_DATE: TDateTimeField
      FieldName = 'OPER_DATE'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object StringField1: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 10
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DOC_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object qTransitPRICE_NDS: TFloatField
      FieldName = 'PRICE_NDS'
    end
    object qTransitCOUNT_LITR: TFloatField
      FieldName = 'COUNT_LITR'
    end
    object qTransitALIEN_NAME: TStringField
      FieldName = 'ALIEN_NAME'
      Size = 100
    end
    object StringField10: TStringField
      FieldName = 'AZS_NAME'
      Size = 100
    end
    object StringField12: TStringField
      FieldName = 'NPTYPE'
      Size = 50
    end
    object qTransitGR_CARD_NUM: TFloatField
      FieldName = 'GR_CARD_NUM'
    end
    object qTransitEMITENT_NAME: TStringField
      FieldName = 'EMITENT_NAME'
      Size = 100
    end
    object qTransitAZS_ID: TFloatField
      FieldName = 'AZS_ID'
    end
    object qTransitEMITENT_ID: TFloatField
      FieldName = 'EMITENT_ID'
    end
    object qTransitDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
    end
    object qTransitCARDSCHEME: TFloatField
      FieldName = 'CARDSCHEME'
    end
    object qTransitTRANS_TYPESTR: TStringField
      FieldName = 'TRANS_TYPESTR'
      Size = 28
    end
    object qTransitTRANS_TYPE: TFloatField
      FieldName = 'TRANS_TYPE'
    end
    object qTransitEMITENT_DEP_ID: TFloatField
      FieldName = 'EMITENT_DEP_ID'
    end
    object qTransitEMITENT_DEP_NAME: TStringField
      FieldName = 'EMITENT_DEP_NAME'
      Size = 100
    end
    object qTransitDocExist: TFloatField
      FieldName = 'DOCEXIST'
    end
  end
  object dsTransit: TOraDataSource
    DataSet = qTransit
    Left = 54
    Top = 206
  end
  object pmAdditionFilter: TPopupMenu
    Left = 696
    Top = 168
    object miAll: TMenuItem
      Caption = #1042#1089#1077
      OnClick = miAllClick
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object miOwn: TMenuItem
      Caption = #1053#1072' '#1089#1074#1086#1080#1093' '#1040#1047#1057
      OnClick = miOwnClick
    end
    object miAlien: TMenuItem
      Caption = #1053#1072' '#1095#1091#1078#1080#1093' '#1040#1047#1057
      OnClick = miAlienClick
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object miRnPrinted: TMenuItem
      Caption = #1042#1099#1087#1080#1089#1072#1085#1072' '#1088#1072#1089#1093#1086#1076#1085#1072#1103
      OnClick = miRnPrintedClick
    end
    object miRnNotPrinted: TMenuItem
      Caption = #1053#1077' '#1074#1099#1087#1080#1089#1072#1085#1072' '#1088#1072#1089#1093#1086#1076#1085#1072#1103
      OnClick = miRnNotPrintedClick
    end
  end
  object pmAdditionFilterLS: TPopupMenu
    Left = 696
    Top = 216
    object miLSAll: TMenuItem
      Caption = #1042#1089#1077
      OnClick = miLSAllClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object miLSBenz: TMenuItem
      Caption = #1041#1077#1085#1079#1080#1085#1099
      OnClick = miLSBenzClick
    end
    object miLSDT: TMenuItem
      Caption = #1044#1080#1079#1077#1083#1100#1085#1086#1077' '#1090#1086#1087#1083#1080#1074#1086
      OnClick = miLSDTClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object miLSInvoicePrinted: TMenuItem
      Caption = #1042#1099#1087#1080#1089#1072#1085' '#1089#1095#1077#1090
      OnClick = miLSInvoicePrintedClick
    end
    object miLSInvoiceNotPrinted: TMenuItem
      Caption = #1053#1045' '#1074#1099#1087#1080#1089#1072#1085' '#1089#1095#1077#1090
      OnClick = miLSInvoiceNotPrintedClick
    end
  end
  object miTransType: TPopupMenu
    Left = 696
    Top = 264
    object N1: TMenuItem
      Caption = #1042#1089#1077
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #1045#1089#1090#1077#1089#1090#1074#1077#1085#1085#1072#1103
      OnClick = N4Click
    end
    object N5: TMenuItem
      Tag = 1
      Caption = #1045#1089#1090#1077#1089#1090#1074#1077#1085#1085#1072#1103' '#1072#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#1085#1072#1103
      OnClick = N5Click
    end
    object N6: TMenuItem
      Tag = 2
      Caption = #1048#1089#1082#1091#1089#1089#1090#1074#1077#1085#1085#1072#1103
      OnClick = N6Click
    end
    object N7: TMenuItem
      Tag = 3
      Caption = #1048#1089#1082#1091#1089#1089#1090#1074#1077#1085#1085#1072#1103' '#1072#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#1085#1072#1103
      OnClick = N7Click
    end
  end
  object qReport: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select id, inst'
      '  from Oil_Dog'
      ' where Oil_Dog.State = '#39'Y'#39
      '   and Oil_Dog.Dog_Date ='
      '       (select min(Dog_Date)'
      '          from oil_dog'
      '         where state = '#39'Y'#39
      '           and to_ = :OrgId'
      '           and to_inst = :OrgInst'
      '           and dog_type = '#39'K'#39
      '           and nvl(Sub_Type, 0) <> 101)'
      '   and Oil_Dog.to_ = :OrgId'
      '   and Oil_Dog.to_inst = :OrgInst'
      '   and Oil_Dog.dog_type = '#39'K'#39
      '   and nvl(Oil_Dog.Sub_type, 0) <> 101'
      '   and rownum = 1')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 176
    Top = 180
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end>
  end
  object pmAdditionFilterPopoln: TPopupMenu
    Left = 696
    Top = 120
    object MenuItem1: TMenuItem
      Caption = #1042#1089#1077
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = #1055#1086#1087#1086#1083#1085#1077#1085#1080#1103' '#1069#1050' '#1074' '#1054#1062
      OnClick = MenuItem2Click
    end
    object MenuItem3: TMenuItem
      Caption = #1054#1090#1083#1086#1078#1077#1085#1085#1086#1077' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103' '#1069#1050
      OnClick = MenuItem3Click
    end
    object N13: TMenuItem
      Caption = #1057#1087#1080#1089#1072#1085#1080#1103' '#1069#1050' '#1074' '#1054#1062
      OnClick = N13Click
    end
  end
  object ActionList1: TActionList
    Left = 392
    Top = 232
  end
end
