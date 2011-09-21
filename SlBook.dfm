inherited SlBookForm: TSlBookForm
  Left = 201
  Top = 165
  Width = 789
  Height = 529
  BorderIcons = []
  Caption = #1050#1085#1080#1075#1072' '#1091#1095#1077#1090#1072' '#1087#1088#1086#1076#1072#1078
  DefaultMonitor = dmMainForm
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pBottom: TPanel
    Top = 469
    Width = 781
    TabOrder = 2
    inherited pBtn: TPanel
      Left = 584
      inherited bbOk: TBitBtn
        Left = 8
      end
      inherited bbCancel: TBitBtn
        Left = 104
      end
    end
    object pDown: TPanel
      Left = 2
      Top = 2
      Width = 582
      Height = 29
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object lAutoTax: TLabel
        Left = 64
        Top = 0
        Width = 360
        Height = 29
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = 
          #1069#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1072#1103' '#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1072' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080'. '#1044#1083#1103' '#1077#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1089#1083#1077#1076#1091 +
          #1077#1090' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1080#1081' '#1086#1090#1087#1091#1089#1082' '#1080#1083#1080' '#1087#1083#1072#1090#1077#1078
        Visible = False
        WordWrap = True
      end
      object pDel: TPanel
        Left = 0
        Top = 0
        Width = 32
        Height = 29
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object sbDel: TSpeedButton
          Left = 4
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
      end
      object Panel1: TPanel
        Left = 32
        Top = 0
        Width = 32
        Height = 29
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object OilHelpButton: TOilHelpButton
          Left = 4
          Top = 2
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
          AnimateTime = 200
          Lines.Strings = (
            '{12}{RED}\B '#1050#1085#1080#1075#1072' '#1091#1095#1077#1090#1072' '#1087#1088#1086#1076#1072#1078' \D {10}'
            ''
            '\B '#1055#1086#1076#1089#1095#1077#1090' '#1089#1091#1084#1084'\D'
            #1057#1091#1084#1084#1072' '#1089#1095#1080#1090#1072#1077#1090#1089#1103' '#1086#1090' '#1094#1077#1085#1099' '#1089' '#1053#1044#1057'.'
            ''
            '\B '#1053#1086#1084#1077#1088' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081'\D'
            #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1054#1081#1083' '#1076#1072#1077#1090' '#1090#1088#1080' '#1089#1087#1086#1089#1086#1073#1072' '#1074#1079#1103#1090#1100' '#1085#1086#1084#1077#1088' '#1085#1072#1083#1086#1075#1086#1074#1086#1081
            '1)'#1057#1072#1084#1086#1089#1090#1086#1103#1090#1077#1083#1100#1085#1086' '#1077#1075#1086' '#1074#1074#1077#1089#1090#1080'.'
            '2)'#1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1079#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1085#1099#1093'.'
            '3)'#1044#1072#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' '#1054#1081#1083' '#1089#1072#1084#1086#1089#1090#1086#1103#1090#1077#1083#1100#1085#1086' '#1074#1079#1103#1090#1100' '#1085#1086#1084#1077#1088' '#1074
            #1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1080' '#1089' '#1085#1072#1089#1090#1088#1086#1081#1082#1072#1084#1080'.'
            ''
            '\B '#1053#1072#1083#1086#1075#1086#1074#1072#1103' '#1087#1086' '#1095#1077#1082#1072#1084' \D'
            #1042' '#1082#1085#1080#1075#1077' '#1091#1095#1077#1090#1072' '#1087#1088#1086#1076#1072#1078', '#1074#1086#1079#1084#1086#1078#1085#1086', '#1074#1099#1087#1080#1089#1072#1090#1100' '#1085#1072#1083#1086#1075#1086#1074#1091#1102
            #1085#1072#1082#1083#1072#1076#1085#1091#1102' '#1087#1086' '#1095#1077#1082#1072#1084', '#1076#1083#1103' '#1101#1090#1086#1075#1086' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100
            #1080#1089#1090#1086#1095#1085#1080#1082' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' "'#1095#1077#1082#1080'", '#1087#1086#1089#1083#1077' '#1095#1077#1075#1086' '#1074' '#1087#1086#1083#1077
            #1087#1077#1088#1074#1080#1095#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1079#1072#1087#1080#1096#1077#1090#1089#1103' "'#1092#1110#1089#1082#1072#1083#1100#1085#1080#1081' '#1095#1077#1082'"'
            #1080' '#1087#1086#1103#1074#1080#1090#1100#1089#1103' '#1076#1074#1072' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1093' '#1087#1086#1083#1103' - '#1085#1086#1084#1077#1088' '#1080
            #1076#1072#1090#1072' '#1095#1077#1082#1072', '#1082#1091#1076#1072' '#1084#1086#1078#1085#1086' '#1074#1074#1077#1089#1090#1080' '#1076#1072#1090#1091' '#1080' '#1085#1086#1084#1077#1088
            #1082#1086#1085#1082#1088#1077#1090#1085#1086#1075#1086' '#1095#1077#1082#1072', '#1085#1086' '#1087#1086#1083#1077' '#1085#1086#1084#1077#1088' '#1085#1077' '#1103#1074#1083#1103#1102#1090#1089#1103
            #1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1084'. '#1045#1089#1083#1080' '#1074#1099' '#1074#1089#1077' '#1078#1077' '#1074#1074#1077#1083#1080' '#1101#1090#1080' '#1087#1086#1083#1103','
            #1090#1086' '#1087#1088#1080' '#1088#1072#1089#1087#1077#1095#1072#1090#1082#1077' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' '#1074' '#1087#1086#1083#1077' '#1087#1077#1088#1074#1080#1095#1085#1099#1081
            #1076#1086#1082#1091#1084#1077#1085#1090' '#1073#1091#1076#1077#1090' "'#1060#1110#1089#1082#1072#1083#1100#1085#1080#1081' '#1095#1077#1082' '#8470'0000(01.01.1001),'#8230'".'
            ''
            '\B '#1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' \D'
            #1042' '#1082#1085#1080#1075#1077' '#1091#1095#1077#1090#1072' '#1087#1088#1086#1076#1072#1078', '#1074#1086#1079#1084#1086#1078#1085#1086', '#1074#1099#1087#1080#1089#1072#1090#1100
            #1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1091' '#1082' '#1083#1102#1073#1086#1081' '#1053#1053', '#1077#1089#1083#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1072
            #1085#1077' '#1087#1086#1079#1074#1086#1083#1103#1077#1090' '#1089#1086#1079#1076#1072#1090#1100' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1091', '#1090#1086
            #1087#1077#1088#1077#1089#1086#1079#1076#1072#1081#1090#1077' '#1053#1053' '#1080' '#1087#1086#1087#1088#1086#1073#1091#1081#1090#1077' '#1089#1085#1086#1074#1072'. '#1058#1072#1073#1083#1080#1095#1085#1072#1103
            #1095#1072#1089#1090#1100' '#1092#1086#1088#1084#1099' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1088#1072#1079#1076#1077#1083#1077#1085#1072
            #1085#1072' '#1076#1074#1077' '#1095#1072#1089#1090#1080'. '#1058#1086', '#1095#1090#1086' '#1073#1099#1083#1086'('#1074' '#1083#1077#1074#1086#1081' '#1095#1072#1089#1090#1080') '#1074' '#1053#1053' '#1089
            #1091#1095#1077#1090#1086#1084' '#1074#1099#1087#1080#1089#1072#1085#1085#1099#1093' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1086#1082' '#1080' '#1090#1086', '#1095#1090#1086' '#1073#1091#1076#1077#1090
            '('#1074' '#1087#1088#1072#1074#1086#1081' '#1095#1072#1089#1090#1080') - '#1101#1090#1086' '#1085#1072#1096#1072' '#1085#1086#1074#1072#1103' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072'.'
            #1045#1089#1083#1080' '#1087#1086#1079#1080#1094#1080#1103' '#1085#1077' '#1076#1086#1083#1078#1085#1072' '#1086#1089#1090#1072#1090#1100#1089#1103' '#1090#1072#1082#1086#1081' '#1082#1072#1082' '#1073#1099#1083#1072','
            #1090#1086' '#1077#1077' '#1084#1086#1078#1085#1086' '#1086#1089#1090#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1086#1081'. '#1042' '#1076#1086#1082#1091#1084#1077#1085#1090
            #1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080' '#1073#1091#1076#1077#1090' '#1087#1086#1087#1072#1076#1072#1090#1100' '#1088#1072#1079#1085#1080#1094#1072' '#1083#1077#1074#1086#1081
            #1095#1072#1089#1090#1080' '#1080' '#1087#1088#1072#1074#1086#1081'. '#1055#1088#1080' '#1074#1099#1087#1080#1089#1082#1077' '#1089#1083#1077#1076#1091#1102#1097#1077#1081
            #1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080' '#1085#1072' '#1101#1090#1091' '#1078#1077' '#1053#1053', '#1074' '#1083#1077#1074#1086#1081' '#1095#1072#1089#1090#1080' '#1074#1089#1077
            #1087#1086#1079#1080#1094#1080#1080' '#1073#1091#1076#1091#1090' '#1091#1078#1077' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1086#1074#1072#1090#1100' '#1074#1099#1087#1080#1089#1072#1085#1085#1099#1084
            #1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072#1084'.'
            ''
            '\B '#1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1085#1086#1084#1077#1088#1072' \D'
            #1048#1079#1084#1077#1085#1103#1090#1100' '#1085#1086#1084#1077#1088' '#1084#1086#1078#1085#1086' '#1074#1086' '#1074#1089#1077#1093' '#1053#1053' '#1080' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072#1093','
            #1076#1083#1103' '#1101#1090#1086#1075#1086' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1079#1072#1081#1090#1080' '#1092#1086#1088#1084#1091' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103'.'
            #1042#1086#1079#1083#1077' '#1085#1086#1084#1077#1088#1072' '#1085#1072#1078#1072#1090#1100' '#1082#1088#1077#1089#1090#1080#1082' ('#1086#1085' '#1072#1082#1090#1080#1074#1077#1085' '#1076#1083#1103' '#1083#1102#1073#1086#1075#1086
            #1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1087#1086#1087#1072#1076#1072#1102#1097#1077#1075#1086' '#1074' '#1082#1085#1080#1075#1091' '#1091#1095#1077#1090#1072' '#1087#1088#1086#1076#1072#1078'),'
            #1080#1079#1084#1077#1085#1080#1090#1100' '#1085#1086#1084#1077#1088' '#1085#1072' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1081', '#1085#1072#1078#1072#1090#1100' '#1085#1072' '#1075#1072#1083#1086#1095#1082#1091','
            #1082#1086#1090#1086#1088#1072#1103' '#1087#1086#1103#1074#1080#1083#1072#1089#1100' '#1074#1084#1077#1089#1090#1086' '#1082#1088#1077#1089#1090#1080#1082#1072', '#1087#1086#1089#1083#1077' '#1095#1077#1075#1086
            #1089#1090#1072#1088#1099#1081' '#1085#1086#1084#1077#1088' '#1087#1086#1087#1072#1076#1077#1090' '#1074' '#1088#1077#1079#1077#1088#1074', '#1072' '#1085#1086#1074#1099#1081' '#1091#1076#1072#1083#1080#1090#1100#1089#1103
            #1080#1079' '#1085#1077#1075#1086'. '#1069#1090#1072' '#1095#1072#1089#1090#1100' '#1092#1086#1088#1084#1099' '#1072#1074#1090#1086#1085#1086#1084#1085#1072', '#1090'.'#1077'. '#1085#1077' '#1079#1072#1074#1080#1089#1080#1090
            #1073#1086#1083#1100#1096#1077' '#1085#1080' '#1086#1090' '#1082#1072#1082#1080#1093' '#1076#1088#1091#1075#1080#1093' '#1082#1085#1086#1087#1086#1082' '#1085#1072' '#1092#1086#1088#1084#1077'.')
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'MS Sans Serif'
          HeaderFont.Style = []
          Animate = True
          UseCurrentDir = False
          FormOrientation = fBottomToTop
          Images = MainForm.il
          ImageIndex = 0
        end
      end
    end
  end
  object pTop: TPanel [1]
    Left = 0
    Top = 0
    Width = 781
    Height = 129
    Align = alTop
    TabOrder = 0
    object pStoroni: TPanel
      Left = 401
      Top = 1
      Width = 379
      Height = 127
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      DesignSize = (
        379
        127)
      object lTo: TLabel
        Left = 8
        Top = 41
        Width = 32
        Height = 13
        Caption = #1050#1086#1084#1091' :'
      end
      object lFrom: TLabel
        Left = 8
        Top = 3
        Width = 45
        Height = 13
        Caption = #1054#1090' '#1082#1086#1075#1086' :'
      end
      object lFromAZS: TLabel
        Left = 8
        Top = 80
        Width = 27
        Height = 13
        Caption = #1040#1047#1057' :'
      end
      object sbClearFrom: TSpeedButton
        Left = 351
        Top = 18
        Width = 23
        Height = 22
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
        OnClick = sbClearFromClick
      end
      object sbClearTo: TSpeedButton
        Left = 351
        Top = 56
        Width = 23
        Height = 22
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
        OnClick = sbClearToClick
      end
      object sbClearFromAzs: TSpeedButton
        Left = 351
        Top = 96
        Width = 23
        Height = 22
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
        OnClick = sbClearFromAzsClick
      end
      object ceTo: TComboEdit
        Left = 8
        Top = 57
        Width = 329
        Height = 21
        DirectInput = False
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 1
        OnButtonClick = ceToButtonClick
        OnDblClick = ceToButtonClick
      end
      object ceFrom: TComboEdit
        Left = 8
        Top = 19
        Width = 329
        Height = 21
        DirectInput = False
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 0
        OnButtonClick = ceFromButtonClick
        OnDblClick = ceFromButtonClick
      end
      object ceAZS: TComboEdit
        Left = 8
        Top = 96
        Width = 329
        Height = 21
        DirectInput = False
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 2
        OnButtonClick = ceAZSButtonClick
        OnDblClick = ceAZSButtonClick
      end
    end
    object pTax: TPanel
      Left = 1
      Top = 1
      Width = 400
      Height = 127
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object lTypeTax: TLabel
        Left = 114
        Top = 43
        Width = 25
        Height = 13
        Caption = #1058#1080#1087' :'
      end
      object lRasch: TLabel
        Left = 240
        Top = 4
        Width = 86
        Height = 13
        Caption = #1060#1086#1088#1084#1072' '#1088#1072#1089#1095#1077#1090#1072' :'
      end
      object lDate: TLabel
        Left = 114
        Top = 4
        Width = 32
        Height = 13
        Caption = #1044#1072#1090#1072' :'
      end
      object lcTaxNum: TLabel
        Left = 5
        Top = 4
        Width = 40
        Height = 13
        Caption = #1053#1086#1084#1077#1088' :'
      end
      object lblCause: TLabel
        Left = 240
        Top = 43
        Width = 54
        Height = 13
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082' :'
      end
      object lFirstDoc: TLabel
        Left = 5
        Top = 80
        Width = 202
        Height = 13
        Caption = #1055#1077#1088#1080#1095#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090'('#1091#1089#1083#1086#1074#1080#1077' '#1087#1088#1086#1076#1072#1078#1080') :'
      end
      object LblNNNumDate: TLabel
        Left = 5
        Top = 43
        Width = 69
        Height = 13
        Caption = #1050' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' :'
        Visible = False
      end
      object deTaxDate: TDateEdit
        Left = 114
        Top = 20
        Width = 125
        Height = 21
        NumGlyphs = 2
        TabOrder = 2
        OnChange = deTaxDateChange
      end
      object cbFormRasch: TComboBox
        Left = 240
        Top = 20
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
        Items.Strings = (
          #1054#1087#1083#1072#1090#1072' '#1089' '#1088'/'#1089
          #1053#1072#1083#1080#1095#1085#1099#1077
          #1041#1072#1085#1082#1086#1074#1089#1082#1080#1081' '#1095#1077#1082
          #1042#1079#1072#1080#1084#1086#1079#1072#1095#1077#1090
          #1041#1072#1088#1090#1077#1088
          #1057#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1085#1091#1078#1076#1099)
      end
      object eDoc: TEdit
        Left = 5
        Top = 96
        Width = 388
        Height = 21
        TabOrder = 6
      end
      object dblcTaxNum: TRxDBLookupCombo
        Left = 68
        Top = 20
        Width = 19
        Height = 21
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1085#1086#1084#1077#1088#1072' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' '#1080#1079' '#1079#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1080#1093
        DropDownCount = 15
        DropDownWidth = 100
        IndexSwitch = False
        LookupField = 'NUM'
        LookupDisplay = 'NUM'
        LookupSource = dsReserv
        TabOrder = 1
        OnChange = dblcTaxNumChange
      end
      object eTaxNum: TEdit
        Left = 5
        Top = 20
        Width = 62
        Height = 21
        TabOrder = 0
        OnExit = eTaxNumExit
      end
      object lcCause: TDBLookupComboboxEh
        Left = 240
        Top = 58
        Width = 153
        Height = 21
        EditButtons = <>
        KeyField = 'NAME_'
        ListField = 'NAME_'
        ListSource = dsCause
        TabOrder = 5
        Visible = True
        OnChange = lcCauseChange
      end
      object lcType: TDBLookupComboboxEh
        Left = 114
        Top = 58
        Width = 125
        Height = 21
        EditButtons = <>
        KeyField = 'NAME_'
        ListField = 'NAME_'
        ListSource = dsType
        Style = csDropDownEh
        TabOrder = 4
        Visible = True
        OnChange = lcTypeChange
      end
      object nbNum: TNotebook
        Left = 87
        Top = 16
        Width = 28
        Height = 27
        TabOrder = 7
        object TPage
          Left = 0
          Top = 0
          Caption = 'Auto'
          DesignSize = (
            28
            27)
          object sbAutoNumTax: TSpeedButton
            Left = 2
            Top = 3
            Width = 25
            Height = 20
            Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1085#1086#1084#1077#1088
            AllowAllUp = True
            Anchors = [akTop, akRight]
            GroupIndex = 1
            Down = True
            Glyph.Data = {
              42010000424D4201000000000000760000002800000015000000110000000100
              040000000000CC00000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              777777777000777777777777777777777000788778878877788778877000F087
              F0800087F08780087000F087F080FF08F08F0FF08000F087F0808F08F08F08F0
              8000F08870808F08F08F08F08000F00000808F08F08F08F08000F07FF0808F0F
              F08808F08000F087F08000700000F0087000F087F080087FFFFF7FF77000F087
              F08080877777777770007F087080808777777777700077F0008F0F7777777777
              7000777FFF77F777777777777000777777777777777777777000777777777777
              777777777000}
            ParentShowHint = False
            ShowHint = True
            OnClick = sbAutoNumTaxClick
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Reset'
          DesignSize = (
            28
            27)
          object sbChangeNum: TSpeedButton
            Left = 3
            Top = 3
            Width = 23
            Height = 22
            Anchors = [akTop, akRight]
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD77DDDDDDDD
              77DDDDFFDDDDDDDDFFDDDD777DDDDDD777DDDDFFFDDDDDDFFFDDDDD777DDDD77
              7DDDDDDFFFDDDDFFFDDDDDDD777DD777DDDDDDDDFFFDDFFFDDDDDDDDD777777D
              DDDDDDDDDFFFFFFDDDDDDDDDDD7777DDDDDDDDDDDDFFFFDDDDDDDDDDDD7777DD
              DDDDDDDDDDFFFFDDDDDDDDDDD777777DDDDDDDDDDFFFFFFDDDDDDDDD777DD777
              DDDDDDDDFFFDDFFFDDDDDDD777DDDD777DDDDDDFFFDDDDFFFDDDDD777DDDDDD7
              77DDDDFFFDDDDDDFFFDDDD77DDDDDDDD77DDDDFFDDDDDDDDFFDDDDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
            NumGlyphs = 2
            OnClick = sbChangeNumClick
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Apply'
          DesignSize = (
            28
            27)
          object sbApplyNum: TSpeedButton
            Left = 3
            Top = 3
            Width = 23
            Height = 22
            Anchors = [akTop, akRight]
            Flat = True
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333330000333333333333333333333333F33333333333
              00003333344333333333333333377F3333333333000033334224333333333333
              337337F3333333330000333422224333333333333733337F3333333300003342
              222224333333333373333337F3333333000034222A22224333333337F337F333
              7F33333300003222A3A2224333333337F3737F337F33333300003A2A333A2224
              33333337F73337F337F33333000033A33333A222433333337333337F337F3333
              0000333333333A222433333333333337F337F33300003333333333A222433333
              333333337F337F33000033333333333A222433333333333337F337F300003333
              33333333A222433333333333337F337F00003333333333333A22433333333333
              3337F37F000033333333333333A223333333333333337F730000333333333333
              333A333333333333333337330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
            OnClick = sbApplyNumClick
          end
        end
      end
      object lcNNNumDate: TDBLookupComboboxEh
        Left = 5
        Top = 58
        Width = 108
        Height = 21
        Hint = #1053#1053' '#1082#1086#1090#1086#1088#1099#1077' '#1080#1084#1077#1102#1090' '#1087#1086#1083#1085#1086#1094#1077#1085#1085#1091#1102' '#13#10#1076#1077#1090#1072#1083#1080#1079#1072#1094#1080#1102
        DropDownBox.Columns = <
          item
            FieldName = 'NUM'
          end
          item
            FieldName = 'S_DATE'
          end>
        DropDownBox.Width = -1
        EditButtons = <>
        KeyField = 'NUM_DATE'
        ListSource = dsNNNumDate
        Style = csDropDownEh
        TabOrder = 8
        Visible = False
        OnChange = lcNNNumDateChange
      end
    end
  end
  object pGrid: TPanel [2]
    Left = 0
    Top = 129
    Width = 781
    Height = 340
    Align = alClient
    TabOrder = 1
    object nbGrids: TNotebook
      Left = 1
      Top = 1
      Width = 779
      Height = 338
      Align = alClient
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'NN'
        object dbgSaleDet: TDBGridEh
          Left = 0
          Top = 0
          Width = 779
          Height = 338
          TabStop = False
          Align = alClient
          Color = clWhite
          DataSource = ds
          Flat = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = [fsBold]
          FooterRowCount = 1
          ParentFont = False
          RowDetailPanel.Color = clBtnFace
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnEditButtonClick = dbgSaleDetEditButtonClick
          Columns = <
            item
              ButtonStyle = cbsEllipsis
              EditButtons = <>
              FieldName = 'NP_NAME'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1058#1086#1074#1072#1088'|'#1058#1080#1087
              Width = 136
            end
            item
              ButtonStyle = cbsEllipsis
              EditButtons = <>
              FieldName = 'DIM_NAME'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1058#1086#1074#1072#1088'|'#1045#1076#1080#1085'. '#1080#1079#1084#1077#1088'.'
              Width = 61
            end
            item
              DisplayFormat = '0.####'
              EditButtons = <>
              FieldName = 'PRICE_NO_NDS'
              Footers = <>
              Title.Caption = #1058#1086#1074#1072#1088'|'#1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
              Width = 51
            end
            item
              DisplayFormat = '0.00'
              EditButtons = <>
              FieldName = 'PRICE'
              Footers = <>
              Title.Caption = #1058#1086#1074#1072#1088'|'#1062#1077#1085#1072' '#1089' '#1053#1044#1057
              Width = 50
            end
            item
              DisplayFormat = '0.######'
              EditButtons = <>
              FieldName = 'COUNT'
              Footer.DisplayFormat = '0.######'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1058#1086#1074#1072#1088'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
              Width = 85
            end
            item
              Color = 15658991
              DisplayFormat = '0.####'
              EditButtons = <>
              FieldName = 'NDS_BASE'
              Footer.DisplayFormat = '0.####'
              Footer.ValueType = fvtSum
              Footers = <>
              ReadOnly = True
              Title.Caption = #1058#1086#1074#1072#1088'|'#1057#1091#1084#1084#1072'|'#1073#1077#1079' '#1053#1044#1057
              Width = 82
            end
            item
              Color = 15658991
              DisplayFormat = '0.##'
              EditButtons = <>
              FieldName = 'NDS_20'
              Footer.DisplayFormat = '0.##'
              Footer.ValueType = fvtSum
              Footers = <>
              ReadOnly = True
              Title.Caption = #1058#1086#1074#1072#1088'|'#1057#1091#1084#1084#1072'|'#1053#1044#1057
              Width = 79
            end
            item
              Color = 15658991
              DisplayFormat = '0.##'
              EditButtons = <>
              FieldName = 'SUM'
              Footer.DisplayFormat = '0.##'
              Footer.ValueType = fvtSum
              Footers = <>
              ReadOnly = True
              Title.Caption = #1058#1086#1074#1072#1088'|'#1057#1091#1084#1084#1072'|'#1089' '#1053#1044#1057
              Width = 77
            end
            item
              EditButtons = <>
              EditMask = '00000000'
              FieldName = 'DET_TEXT'
              Footers = <>
              Title.Caption = #1063#1077#1082#1080'|'#1053#1086#1084#1077#1088
              Width = 58
            end
            item
              ButtonStyle = cbsNone
              EditButtons = <>
              EditMask = '00.00.0000'
              FieldName = 'DET_DATE'
              Footers = <>
              Title.Caption = #1063#1077#1082#1080'|'#1044#1072#1090#1072
              Width = 59
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Corr'
        object dbgSaleDetCorr: TDBGridEh
          Left = 0
          Top = 0
          Width = 779
          Height = 337
          TabStop = False
          Align = alClient
          Color = clWhite
          DataSource = dsCorr
          Flat = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = [fsBold]
          FooterRowCount = 1
          ParentFont = False
          PopupMenu = pmSale
          RowDetailPanel.Color = clBtnFace
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnEditButtonClick = dbgSaleDetEditButtonClick
          Columns = <
            item
              Color = 15658991
              EditButtons = <>
              FieldName = 'NP_NAME_JOIN'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1053#1072#1083#1086#1075#1086#1074#1072#1103'|'#1058#1080#1087' '#1090#1086#1074#1072#1088#1072
              Width = 136
            end
            item
              Color = 15658991
              DisplayFormat = '0.####'
              EditButtons = <>
              FieldName = 'PRICE_NO_NDS'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1053#1072#1083#1086#1075#1086#1074#1072#1103'|'#1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
              Width = 45
            end
            item
              Color = 15658991
              DisplayFormat = '0.00'
              EditButtons = <>
              FieldName = 'PRICE'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1053#1072#1083#1086#1075#1086#1074#1072#1103'|'#1062#1077#1085#1072' '#1089' '#1053#1044#1057
              Width = 43
            end
            item
              Color = 15658991
              DisplayFormat = '0.######'
              EditButtons = <>
              FieldName = 'COUNT_'
              Footer.DisplayFormat = '0.######'
              Footer.ValueType = fvtSum
              Footers = <>
              ReadOnly = True
              Title.Caption = #1053#1072#1083#1086#1075#1086#1074#1072#1103'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
              Width = 77
            end
            item
              Color = 15658991
              DisplayFormat = '0.####'
              EditButtons = <>
              FieldName = 'NDS_BASE'
              Footer.DisplayFormat = '0.####'
              Footer.ValueType = fvtSum
              Footers = <>
              ReadOnly = True
              Title.Caption = #1053#1072#1083#1086#1075#1086#1074#1072#1103'|'#1057#1091#1084#1084#1072'|'#1073#1077#1079' '#1053#1044#1057
              Visible = False
              Width = 82
            end
            item
              Color = 15658991
              DisplayFormat = '0.##'
              EditButtons = <>
              FieldName = 'NDS_20'
              Footer.DisplayFormat = '0.##'
              Footer.ValueType = fvtSum
              Footers = <>
              ReadOnly = True
              Title.Caption = #1053#1072#1083#1086#1075#1086#1074#1072#1103'|'#1057#1091#1084#1084#1072'|'#1053#1044#1057
              Visible = False
              Width = 77
            end
            item
              Color = 15658991
              DisplayFormat = '0.##'
              EditButtons = <>
              FieldName = 'SUMM'
              Footer.DisplayFormat = '0.##'
              Footer.ValueType = fvtSum
              Footers = <>
              ReadOnly = True
              Title.Caption = #1053#1072#1083#1086#1075#1086#1074#1072#1103'|'#1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
              Width = 74
            end
            item
              ButtonStyle = cbsEllipsis
              EditButtons = <>
              FieldName = 'NP_NAME'
              Footers = <>
              Title.Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072'|'#1058#1080#1087' '#1090#1086#1074#1072#1088#1072
              Width = 112
            end
            item
              EditButtons = <>
              FieldName = 'PRICE_NO_NDS_CORR_GRID'
              Footers = <>
              Title.Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072'|'#1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
              Width = 43
            end
            item
              EditButtons = <>
              FieldName = 'PRICE_CORR_GRID'
              Footers = <>
              Title.Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072'|'#1062#1077#1085#1072' '#1089' '#1053#1044#1057
              Width = 42
            end
            item
              EditButtons = <>
              FieldName = 'COUNT_CORR_GRID'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
              Width = 77
            end
            item
              Color = 15658991
              EditButtons = <>
              FieldName = 'SUM_CORR_GRID'
              Footer.ValueType = fvtSum
              Footers = <>
              ReadOnly = True
              Title.Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072'|'#1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
              Width = 85
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select b.*,b.nn_id,'
      '       oo.name from_name,'
      '       oazs.name from_azs_name'
      '  from V_OIL_SALE_BOOK b, v_org oo, v_org oazs'
      ' where b.id = :id'
      '   and b.inst = :inst'
      '   and b.from_ = oo.id'
      '   and b.from_inst = oo.inst'
      '   and b.azs_id = oazs.id(+)'
      '   and b.azs_inst = oazs.inst(+)')
    Left = 296
    Top = 256
    object qID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Required = True
    end
    object qS_DATE: TDateTimeField
      FieldName = 'S_DATE'
    end
    object qORGAN: TFloatField
      FieldName = 'ORGAN'
    end
    object qORGAN_INST: TFloatField
      FieldName = 'ORGAN_INST'
    end
    object qORGAN_NAME: TStringField
      FieldName = 'ORGAN_NAME'
      Size = 255
    end
    object qORGAN_NALN: TStringField
      FieldName = 'ORGAN_NALN'
      Size = 50
    end
    object qORGAN_OKPO: TStringField
      FieldName = 'ORGAN_OKPO'
    end
    object qF_DOC: TStringField
      FieldName = 'F_DOC'
      Size = 200
    end
    object qFRASCH: TStringField
      FieldName = 'FRASCH'
      Size = 100
    end
    object qR_DATE: TDateTimeField
      FieldName = 'R_DATE'
    end
    object qSALE_TXT: TStringField
      FieldName = 'SALE_TXT'
      Size = 80
    end
    object qNDS_T: TFloatField
      FieldName = 'NDS_T'
    end
    object qNDS_P_BASE: TFloatField
      FieldName = 'NDS_P_BASE'
    end
    object qNDS_P_20: TFloatField
      FieldName = 'NDS_P_20'
    end
    object qNDS_NP_BASE: TFloatField
      FieldName = 'NDS_NP_BASE'
    end
    object qNDS_NP_20: TFloatField
      FieldName = 'NDS_NP_20'
    end
    object qK_NDS_B: TFloatField
      FieldName = 'K_NDS_B'
    end
    object qK_NDS_20: TFloatField
      FieldName = 'K_NDS_20'
    end
    object qNUM: TStringField
      FieldName = 'NUM'
      Size = 8
    end
    object qTOV_ID: TFloatField
      FieldName = 'TOV_ID'
    end
    object qTOV_NAME: TStringField
      FieldName = 'TOV_NAME'
      Size = 50
    end
    object qDIM_ID: TFloatField
      FieldName = 'DIM_ID'
    end
    object qDIM_NAME: TStringField
      FieldName = 'DIM_NAME'
      Size = 50
    end
    object qKOL: TFloatField
      FieldName = 'KOL'
    end
    object qFROM_: TFloatField
      FieldName = 'FROM_'
    end
    object qFROM_INST: TFloatField
      FieldName = 'FROM_INST'
    end
    object qAZS_ID: TFloatField
      FieldName = 'AZS_ID'
    end
    object qAZS_INST: TFloatField
      FieldName = 'AZS_INST'
    end
    object qNAL_T: TFloatField
      FieldName = 'NAL_T'
    end
    object qLOCK_: TFloatField
      FieldName = 'LOCK_'
    end
    object qFROM_DATE: TDateTimeField
      FieldName = 'FROM_DATE'
    end
    object qNN_TYPE_ID: TFloatField
      FieldName = 'NN_TYPE_ID'
    end
    object qNN_TYPE_NAME: TStringField
      FieldName = 'NN_TYPE_NAME'
      Size = 50
    end
    object qNN_CAUSE_ID2: TFloatField
      FieldName = 'NN_CAUSE_ID'
    end
    object qNN_CAUSE_NAME: TStringField
      FieldName = 'NN_CAUSE_NAME'
      Size = 50
    end
    object qFROM_NAME: TStringField
      FieldName = 'FROM_NAME'
      Size = 100
    end
    object qAZS_NAME: TStringField
      FieldName = 'AZS_NAME'
      Size = 100
    end
    object qFROM_AZS_NAME: TStringField
      FieldName = 'FROM_AZS_NAME'
      Size = 100
    end
    object qNN_ID: TFloatField
      FieldName = 'NN_ID'
    end
    object qNN_CAUSE_ID: TFloatField
      FieldName = 'NN_INST'
    end
  end
  object ds: TOraDataSource
    DataSet = qDetSale
    Left = 264
    Top = 208
  end
  object qDetSale: TOilQuery
    LocalUpdate = True
    Session = frmStart.OraSession1
    SQL.Strings = (
      'SELECT'
      '       b.ID id,'
      '       b.INST inst,'
      '       SB.ID NN_ID,'
      '       SB.INST NN_INST,'
      '       nvl(b.NDS_T,SB.NDS_T) sum,'
      '       nvl(nvl(b.NDS_P_BASE,b.NDS_NP_BASE),'
      '           nvl(SB.NDS_P_BASE,SB.NDS_NP_BASE)) NDS_BASE,'
      '       nvl(nvl(b.NDS_P_20,b.NDS_NP_20),'
      '           nvl(SB.NDS_P_20,SB.NDS_NP_20)) NDS_20,'
      '       nvl(b.TOV_ID,SB.TOV_ID) np_type,'
      '       nvl(b.DIV_ID,SB.DIV_ID) dim_id,'
      '       nvl(b.KOL,SB.KOL) count,'
      '       nvl(b.PRICE_NDS,'
      
        '           round(nvl(b.NDS_T,SB.NDS_T)/nvl(b.KOL,SB.KOL),2) )pri' +
        'ce,'
      '       NDS.GetNoNds_WithNds('
      '         nvl(b.PRICE_NDS,'
      '             round(nvl(b.NDS_T,SB.NDS_T)/nvl(b.KOL,SB.KOL),2) ),'
      '         nvl(b.det_date,SB.s_date),'
      '         4) price_no_nds,'
      '       b.det_text,'
      '       b.det_date,'
      '       nvl(dimDet.name,dim.name)dim_name,'
      '       nvl(b.TOV_NAME, '#39#1058#1086#1074#1072#1088#39')np_name'
      '  FROM V_OIL_SALE_BOOK_DET b,'
      '       OIL_SALE_BOOK SB,'
      '       v_OIL_NP_TYPE np,'
      '       v_OIL_DIMENSION DimDet,v_OIL_DIMENSION dim,'
      '       oil_oper_type Oper'
      ' WHERE b.nn_id(+) = SB.ID'
      '   AND b.nn_inst(+) = SB.INST'
      '   AND SB.ID =  :nn_id'
      '   AND SB.INST = :nn_inst'
      '   AND oper.id(+) = SB.tov_id'
      '   AND dim.id(+) = sb.div_id'
      '   AND dimdet.id(+) = b.div_id   '
      '   AND np.id(+) = sb.tov_id'
      '   AND SB.STATE ='#39'Y'#39
      
        ' Order by decode(sb.nn_cause_id, 11,b.det_date, 12,b.det_date, s' +
        'b.s_Date)'
      ' ')
    BeforeInsert = qDetSaleBeforeInsert
    AfterInsert = qDetSaleAfterInsert
    BeforePost = qDetSaleBeforePost
    AfterPost = qDetSaleAfterPost
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 264
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nn_id'
        Value = Null
      end
      item
        DataType = ftUnknown
        Name = 'nn_inst'
        Value = Null
      end>
    object qDetSaleID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qDetSaleINST: TFloatField
      FieldName = 'INST'
      Required = True
    end
    object qDetSaleNN_ID: TFloatField
      FieldName = 'NN_ID'
    end
    object qDetSaleNN_INST: TFloatField
      FieldName = 'NN_INST'
    end
    object qDetSaleSUM: TFloatField
      FieldName = 'SUM'
      OnChange = qDetSaleSUMChange
      EditFormat = '0.00'
    end
    object qDetSaleNDS_BASE: TFloatField
      FieldName = 'NDS_BASE'
      EditFormat = '0.0000'
    end
    object qDetSaleNDS_20: TFloatField
      FieldName = 'NDS_20'
      EditFormat = '0.00'
    end
    object qDetSaleNP_TYPE: TStringField
      FieldName = 'NP_TYPE'
      Size = 40
    end
    object qDetSaleDIM_ID: TStringField
      FieldName = 'DIM_ID'
      Size = 40
    end
    object qDetSaleCOUNT: TFloatField
      FieldName = 'COUNT'
      OnChange = qDetSaleCOUNTChange
      EditFormat = '0.000000'
    end
    object qDetSalePRICE: TFloatField
      FieldName = 'PRICE'
      OnChange = qDetSalePRICEChange
    end
    object qDetSalePRICE_NO_NDS: TFloatField
      FieldName = 'PRICE_NO_NDS'
      OnChange = qDetSalePRICE_NO_NDSChange
      EditFormat = '0.0000'
    end
    object qDetSaleDET_TEXT: TStringField
      FieldName = 'DET_TEXT'
      Size = 100
    end
    object qDetSaleDET_DATE: TDateTimeField
      FieldName = 'DET_DATE'
      OnChange = qDetSaleDET_DATEChange
    end
    object qDetSaleDIM_NAME: TStringField
      FieldName = 'DIM_NAME'
      Size = 50
    end
    object qDetSaleNP_NAME: TStringField
      FieldName = 'NP_NAME'
      Size = 4000
    end
  end
  object qType: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select t.id, t.name_ '
      '  from OIL_NN_TYPE t'
      ' where ((t.id in (1,2)) and (:type_id = -1))'
      '    or (t.id = :type_id)'
      '    or ( (t.id = 111) and (:type_id = -2) )')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 136
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'type_id'
      end>
  end
  object qCause: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select t.id, t.name_, t.hide,t.tovar_type'
      '  from OIL_NN_CAUSE t'
      ' where (  ( t.hide='#39'N'#39' ) and (:cause_id = -1)  )'
      '    or (t.id = :cause_id)'
      '    or ( (t.id = 111) and (:cause_id = -2) )'
      ''
      ''
      ' ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 184
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cause_id'
      end>
  end
  object dsCause: TOraDataSource
    DataSet = qCause
    Left = 184
    Top = 208
  end
  object dsType: TOraDataSource
    DataSet = qType
    Left = 136
    Top = 208
  end
  object qReserv: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select * from oil_nnum_reserve'
      'where state ='#39'Y'#39
      '  and num is not null'
      '  and date_ = :date_'
      '  AND (nn_type_id = :type_id or :type_id is null)'
      'order by num asc')
    AfterOpen = qReservAfterOpen
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 40
    Top = 257
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date_'
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
      end>
  end
  object dsReserv: TOraDataSource
    DataSet = qReserv
    Left = 40
    Top = 209
  end
  object qCheck: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'SELECT count(num) as n'
      '  FROM v_oil_sale_book'
      ' WHERE inst = :inst'
      '   AND num = :num'
      '   AND s_date between'
      
        '     to_date( to_char( trunc(:date_,nvl(ov.GetVal('#39'NN_NUM_RESET'#39 +
        '),'#39'mon'#39')),'
      '       '#39'DDMMYYYY'#39' ),'#39'DDMMYYYY'#39' )'
      
        '     and trunc(add_months(:date_,1),nvl(ov.GetVal('#39'NN_NUM_RESET'#39 +
        '),'#39'mon'#39'))'
      '   AND not( id = :nn_id)'
      '   AND (nn_type_id = :type_id or :type_id is null)')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 184
    Top = 369
    ParamData = <
      item
        DataType = ftInteger
        Name = 'inst'
      end
      item
        DataType = ftString
        Name = 'num'
        Value = ''
      end
      item
        DataType = ftDateTime
        Name = 'date_'
      end
      item
        DataType = ftUnknown
        Name = 'nn_id'
      end
      item
        DataType = ftUnknown
        Name = 'type_id'
      end>
  end
  object qNNNumDate: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select distinct'
      '       num,'
      '       s_date,'
      '       num||'#39'-'#39'||s_date num_date,'
      '       sb.id nn_id,'
      '       sb.inst nn_inst,'
      '       sb.from_,'
      '       sb.from_inst,'
      '       sb.organ,'
      '       sb.organ_inst,'
      '       sb.azs_id,'
      '       sb.azs_inst,'
      '       sb.nn_cause_id'
      '  from oil_sale_book sb,'
      '       oil_sale_book_det sdet'
      ' where sb.state = '#39'Y'#39' and sdet.state ='#39'Y'#39
      '   and sb.id = sdet.nn_id and sb.inst = sdet.nn_inst'
      '   and trunc(sb.s_date - 356,'#39'YYYY'#39') is not null'
      '   and sb.num is not null'
      
        '   and ((sb.id = :nn_id and sb.inst=:nn_inst) or (:nn_id=-1 and ' +
        ':nn_inst=-1))'
      ' order by sb.s_date desc,sb.num desc')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 40
    Top = 377
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nn_id'
      end
      item
        DataType = ftUnknown
        Name = 'nn_inst'
      end>
  end
  object dsNNNumDate: TOraDataSource
    DataSet = qNNNumDate
    Left = 40
    Top = 329
  end
  object qDetSaleCorr: TOilQuery
    LocalUpdate = True
    Session = frmStart.OraSession1
    SQL.Strings = (
      'SELECT -- GOAL=FIRST_ROWS'
      '       --'#1053#1040#1051#1054#1043#1054#1042#1054#1049' '#1057' '#1042#1067#1055#1048#1057#1040#1053#1067#1052#1048' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1040#1052#1048' '#1041#1045#1047' '#1058#1045#1050#1059#1065#1045#1049
      '       decode(MAX(np_type_join),'
      '         null, null,'
      
        '         Get_NN_Tov_Name(nvl(np_type_corr,np_type_join),cause.id' +
        ')'
      '         ) np_name_join,  '
      '       max(summ_join) summ,'
      '       max(NDS_BASE_join) NDS_BASE,'
      '       max(NDS_20_join) NDS_20,'
      '       max(count_join) count_,'
      '       max(price_join) price,'
      '       max(price_no_nds_join) price_no_nds,'
      '       --'#1058#1045#1050#1059#1065#1040#1071' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1040
      '       max(sum_corr) sum_corr,'
      '       max(NDS_BASE_corr) NDS_BASE_corr,'
      '       max(NDS_20_corr) NDS_20_corr,'
      '       max(count_corr) count_corr,'
      '       max(price_corr) price_corr,'
      '       max(price_no_nds_corr) price_no_nds_corr,'
      '       decode('
      '         MAX(np_type_corr),null,'
      
        '         null,Get_NN_Tov_Name(nvl(np_type_corr,np_type_join),cau' +
        'se.id)'
      '         ) np_name_corr,'
      '       --'#1058#1045#1050#1059#1065#1040#1071' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1040'('#1044#1051#1071' '#1042#1067#1042#1054#1044#1040' '#1042' '#1043#1056#1048#1044')'
      '       nvl(max(sum_corr),0)+nvl(max(summ_join),0) sum_corr_grid,'
      
        '       nvl(max(NDS_BASE_corr),0)+nvl(max(NDS_BASE_join),0) NDS_B' +
        'ASE_corr_grid,'
      
        '       nvl(max(NDS_20_corr),0)+nvl(max(NDS_20_join),0) NDS_20_co' +
        'rr_grid,'
      
        '       decode(max(det_text_corr),'#39'P'#39',0,nvl(max(count_corr),0))+ ' +
        'nvl(max(count_join),0) count_corr_grid,'
      
        '       decode(max(det_text_corr),'#39'C'#39',0,nvl(max(price_corr),0))+n' +
        'vl(max(price_join),0) price_corr_grid,'
      
        '       decode(max(det_text_corr),'#39'C'#39',0,nvl(max(price_no_nds_corr' +
        '),0))+nvl(max(price_no_nds_join),0) price_no_nds_corr_grid,'
      '       --'#1054#1041#1065#1045#1045
      '       nvl(np_type_corr,np_type_join) np_type_corr,'
      '       nvl(dim_id_corr,dim_id_join) dim_id_corr,       '
      '       dim.name dim_name,   '
      
        '       Get_NN_Tov_Name(nvl(np_type_corr,np_type_join),cause.id) ' +
        'np_name'
      '  FROM --'#1057#1055#1056#1040#1042#1054#1063#1053#1067#1045' '#1058#1040#1041#1048#1062#1067
      '       V_OIL_DIMENSION dim,'
      '       OIL_NN_CAUSE cause,'
      '       --'#1047#1040#1055#1056#1054#1057' '#1057' '#1054#1058#1044#1045#1051#1068#1053#1067#1052#1048
      '       --1.'#1053#1040#1051#1054#1043#1054#1042#1054#1049' '#1057' '#1042#1067#1055#1048#1057#1040#1053#1067#1052#1048' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1040#1052#1048' '#1041#1045#1047' '#1058#1045#1050#1059#1065#1045#1049
      '       --2.'#1058#1045#1050#1059#1065#1045#1049' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1054#1049
      
        '       (--'#1047#1040#1055#1056#1054#1057' '#1044#1051#1071' '#1053#1040#1051#1054#1043#1054#1042#1054#1049' '#1057' '#1042#1067#1055#1048#1057#1040#1053#1067#1052#1048' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1040#1052#1048' '#1041#1045#1047' ' +
        #1058#1045#1050#1059#1065#1045#1049
      '        SELECT -- '#1053#1040#1051#1054#1043#1054#1042#1040#1071' + '#1042#1067#1055#1048#1057#1040#1053#1067#1045' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1048
      '               summ_join,'
      '               nds_base_join,'
      '               nds_20_join,'
      '               np_type_join,'
      '               dim_id_join,       '
      '               count_join, '
      '               price_join, '
      '               price_no_nds_join,'
      '               -- '#1058#1045#1050#1059#1065#1040#1071' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1040
      '               to_number(NULL) sum_corr,'
      '               to_number(NULL) NDS_BASE_corr,'
      '               to_number(NULL) NDS_20_corr,'
      '               to_number(NULL) np_type_corr,'
      '               to_number(NULL) dim_id_corr,'
      '               to_number(NULL) count_corr,'
      '               to_number(NULL) price_corr,'
      '               to_number(NULL) price_no_nds_corr,'
      '               NULL det_text_corr         '
      '          FROM (SELECT -- '#1053#1040#1051#1054#1043#1054#1042#1040#1071' + '#1042#1067#1055#1048#1057#1040#1053#1067#1045' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1048
      
        '                       nvl(SUM(summ),0)+nvl(SUM(summ_ec),0) summ' +
        '_join,'
      
        '                       nvl(SUM(nds_base),0)+nvl(SUM(nds_base_ec)' +
        ',0) nds_base_join,'
      
        '                       nvl(SUM(nds_20),0)+nvl(SUM(nds_20_ec),0) ' +
        'nds_20_join,'
      '                       nvl(np_type,np_type_ec) np_type_join,'
      '                       nvl(dim_id,dim_id_ec) dim_id_join,       '
      
        '                       nvl(SUM(count_),0)+decode(max(det_text_ec' +
        '),'#39'P'#39',0,nvl(SUM(count_ec),0)) count_join,'
      
        '                       nvl(max(price),0)+ decode(max(det_text_ec' +
        '),'#39'C'#39',0, nvl(max(price_ec),0)) price_join,'
      
        '                       nvl(max(price_no_nds),0)+decode(max(det_t' +
        'ext_ec),'#39'C'#39',0, nvl(max(price_no_nds_ec),0)) price_no_nds_join,'
      '                       -- '#1053#1040#1051#1054#1043#1054#1042#1040#1071
      '                       SUM(summ) summ,'
      '                       SUM(nds_base) nds_base,'
      '                       SUM(nds_20) nds_20,'
      '                       SUM(count_) count_, '
      '                       max(price) price,'
      '                       max(price_no_nds) price_no_nds,'
      '                       -- '#1042#1067#1055#1048#1057#1040#1053#1067#1045' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1048
      '                       SUM(summ_ec) summ_ec,'
      '                       SUM(nds_base_ec) nds_base_ec,'
      '                       SUM(nds_20_ec) nds_20_ec,'
      '                       SUM(count_ec) count_ec,'
      '                       max(price_ec) price_ec,'
      '                       max(price_no_nds_ec) price_no_nds_ec,'
      '                       -- '#1054#1041#1065#1045#1045
      '                       nvl(np_type,np_type_ec) np_type,'
      '                       nvl(dim_id,dim_id_ec) dim_id   '
      '                  FROM (SELECT --'#1053#1040#1051#1054#1043#1054#1042#1040#1071
      '                               SUM(b.NDS_T) summ,               '
      '                               SUM(decode(nvl(b.NDS_P_BASE,0),'
      '                                 0,b.NDS_NP_BASE,'
      
        '                                 b.NDS_P_BASE)) NDS_BASE,       ' +
        '          '
      '                               SUM(decode(nvl(b.NDS_P_20,0),'
      '                                 0,b.NDS_NP_20,'
      '                                 b.NDS_P_20)) NDS_20,'
      '                               b.TOV_ID np_type,'
      '                               b.DIV_ID dim_id,'
      '                               SUM(b.KOL) count_,'
      
        '                               nvl(b.price_nds,round(SUM(b.NDS_T' +
        ')/SUM(b.KOL),2)) price,'
      
        '                               NDS.GetNoNDS_WithNDS(nvl(b.price_' +
        'nds,round(SUM(b.NDS_T)/SUM(b.KOL),2)),sb.s_date,4) price_no_nds,'
      '                               -- '#1042#1067#1055#1048#1057#1040#1053#1067#1045' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1048
      '                               to_number(NULL) summ_ec,'
      '                               to_number(NULL) nds_base_ec,'
      '                               to_number(NULL) nds_20_ec,'
      '                               to_number(NULL) np_type_ec,'
      '                               to_number(NULL) dim_id_ec,'
      '                               to_number(NULL) count_ec, '
      '                               to_number(NULL) price_ec, '
      '                               to_number(NULL) price_no_nds_ec,'
      '                               null det_text_ec'
      '                          FROM OIL_SALE_BOOK_DET b,'
      '                               OIL_SALE_BOOK SB'
      '                         WHERE b.nn_id(+) = SB.ID'
      '                           AND b.nn_inst(+) = SB.INST'
      '                           AND SB.STATE (+)='#39'Y'#39
      
        '                           AND SB.STATE = b.state(+)            ' +
        '              '
      
        '                           AND sb.id = :nn_id and sb.inst = :nn_' +
        'inst'
      '                         GROUP BY sb.s_date,'
      '                               b.TOV_ID,'
      '                               b.DIV_ID ,'
      '                               b.price_nds'
      '                         UNION ALL   '
      '                        SELECT --'#1053#1040#1051#1054#1043#1054#1042#1040#1071
      '                               to_number(NULL) summ,'
      '                               to_number(NULL) nds_base,'
      '                               to_number(NULL) nds_20,'
      '                               to_number(NULL) np_type,'
      '                               to_number(NULL) dim_id,'
      '                               to_number(NULL) count_, '
      '                               to_number(NULL) price, '
      '                               to_number(NULL) price_no_nds,'
      '                               -- '#1042#1067#1055#1048#1057#1040#1053#1067#1045' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1048
      '                               ecorr_det.nds_t summ_ec,'
      '                               ecorr_det.k_nds_b nds_base_ec,'
      '                               ecorr_det.k_nds_20 nds_20_ec,'
      '                               ecorr_det.tov_id np_type_ec,'
      '                               ecorr_det.div_id dim_id_ec,'
      '                               ecorr_det.KOL count_ec,'
      '                               ecorr_det.PRICE_NDS price_ec, '
      
        '                               NDS.GetNoNDS_WithNDS(ecorr_det.pr' +
        'ice_nds,ecorr.s_date,4) price_no_nds_ec,'
      '                               ecorr_det.det_text det_text_ec'
      '                          FROM Oil_Sale_Book ecorr,'
      '                               oil_sale_book_det ecorr_det'
      
        '                         WHERE ecorr.state= '#39'Y'#39' and ecorr.nn_typ' +
        'e_id(+) = 3 and ecorr_det.state='#39'Y'#39
      
        '                           AND ecorr_det.nn_id(+) = ecorr.id and' +
        ' ecorr_det.nn_inst(+) = ecorr.inst '
      
        '                           AND (ecorr.nn_id = :nn_id and ecorr.n' +
        'n_inst = :nn_inst)'
      
        '                           AND (not(ecorr.id = :corr_id and ecor' +
        'r.inst = :corr_inst) or (:corr_id = -1 and :corr_inst = -1))'
      
        '                           -- '#1091#1089#1083#1086#1074#1080#1077' '#1087#1086' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1085#1077' '#1073#1088#1072#1090#1100' '#1087#1086#1089#1083#1077 +
        #1076#1091#1102#1097#1080#1077' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080' '#1087#1086' '#1085#1086#1084#1077#1088#1091
      
        '                           -- '#1091#1089#1083#1086#1074#1080#1077' '#1087#1086' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1085#1077' '#1073#1088#1072#1090#1100' '#1087#1086#1089#1083#1077 +
        #1076#1091#1102#1097#1080#1077' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080' '#1087#1086' '#1076#1072#1090#1077
      
        '                           AND (ecorr.s_date < :date_ or :date_ ' +
        'is null)'
      '                            )                           '
      '                GROUP BY'
      '                       nvl(np_type,np_type_ec),'
      '                       nvl(dim_id,dim_id_ec),'
      '                       nvl(np_type_ec,np_type),'
      '                       nvl(dim_id_ec,dim_id),'
      '                       nvl(price_ec,price),'
      '                       nvl(price_no_nds_ec,price_no_nds))'
      '         UNION ALL  '
      '        -- '#1047#1040#1055#1056#1054#1057' '#1044#1051#1071' '#1058#1045#1050#1059#1065#1045#1049' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1048
      '        SELECT --'#1053#1040#1051#1054#1043#1054#1042#1040#1071' + '#1042#1067#1055#1048#1057#1040#1053#1067#1045' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1048
      '               to_number(NULL) summ_join,'
      '               to_number(NULL) NDS_BASE_join,'
      '               to_number(NULL) NDS_20_join,'
      '               to_number(NULL) np_type_join,'
      '               to_number(NULL) dim_id_join,'
      '               to_number(NULL) count_join,'
      '               to_number(NULL) price_join,'
      '               to_number(NULL) price_no_nds_join,'
      '               --'#1058#1045#1050#1059#1065#1040#1071' '#1050#1054#1056#1056#1045#1050#1058#1048#1056#1054#1042#1050#1040
      '               b.NDS_T sum_corr,'
      '               b.k_nds_b NDS_BASE_corr,'
      '               b.k_nds_20 NDS_20_corr,'
      '               b.TOV_ID np_type_corr,'
      '               b.DIV_ID dim_id_corr,'
      '               b.KOL count_corr,'
      '               b.PRICE_NDS price_corr,'
      
        '               NDS.GetNoNDS_WithNDS(b.PRICE_NDS,sb.s_date,4) pri' +
        'ce_no_nds_corr,'
      '               b.det_text det_text_corr'
      '          FROM OIL_SALE_BOOK_DET b,'
      '               OIL_SALE_BOOK SB'
      '         WHERE b.nn_id(+) = SB.ID'
      '           AND b.nn_inst(+) = SB.INST'
      '           AND SB.STATE ='#39'Y'#39
      '           AND SB.STATE = b.state(+)'
      '           AND sb.id = :corr_id AND sb.inst = :corr_inst)'
      '       --'#1042#1071#1046#1045#1052' '#1050' '#1058#1048#1055#1059' '#1053#1055' '#1048' '#1045#1044'.'#1048#1047#1052#1045#1056#1045#1053#1048#1071
      ' WHERE dim.id(+) = nvl(dim_id_corr,dim_id_join)   '
      '   AND cause.id = :nn_cause_id'
      ' GROUP BY    '
      '       nvl(np_type_corr,np_type_join),'
      '       nvl(dim_id_corr,dim_id_join),'
      '       dim.name,'
      '       get_nn_tov_name(nvl(np_type_corr,np_type_join),cause.id),'
      '       nvl(price_no_nds_corr,price_no_nds_join),'
      '       nvl(price_corr,price_join)'
      'order by 1')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 481
    Top = 258
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nn_id'
      end
      item
        DataType = ftUnknown
        Name = 'nn_inst'
      end
      item
        DataType = ftUnknown
        Name = 'corr_id'
      end
      item
        DataType = ftUnknown
        Name = 'corr_inst'
      end
      item
        DataType = ftDateTime
        Name = 'date_'
      end
      item
        DataType = ftUnknown
        Name = 'nn_cause_id'
      end>
    object qDetSaleCorrSUMM: TFloatField
      FieldName = 'SUMM'
    end
    object qDetSaleCorrNDS_BASE: TFloatField
      FieldName = 'NDS_BASE'
    end
    object qDetSaleCorrNDS_20: TFloatField
      FieldName = 'NDS_20'
    end
    object qDetSaleCorrCOUNT_: TFloatField
      FieldName = 'COUNT_'
    end
    object qDetSaleCorrPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object qDetSaleCorrPRICE_NO_NDS: TFloatField
      FieldName = 'PRICE_NO_NDS'
    end
    object qDetSaleCorrNP_NAME_JOIN: TStringField
      FieldName = 'NP_NAME_JOIN'
      Size = 50
    end
    object qDetSaleCorrSUM_CORR: TFloatField
      FieldName = 'SUM_CORR'
    end
    object qDetSaleCorrNDS_BASE_CORR: TFloatField
      FieldName = 'NDS_BASE_CORR'
    end
    object qDetSaleCorrNDS_20_CORR: TFloatField
      FieldName = 'NDS_20_CORR'
    end
    object qDetSaleCorrCOUNT_CORR: TFloatField
      FieldName = 'COUNT_CORR'
      OnChange = qDetSaleCorrCOUNT_CORRChange
    end
    object qDetSaleCorrPRICE_CORR: TFloatField
      FieldName = 'PRICE_CORR'
      OnChange = qDetSaleCorrPRICE_CORRChange
    end
    object qDetSaleCorrPRICE_NO_NDS_CORR: TFloatField
      FieldName = 'PRICE_NO_NDS_CORR'
      OnChange = qDetSaleCorrPRICE_NO_NDS_CORRChange
    end
    object qDetSaleCorrNP_NAME_CORR: TStringField
      FieldName = 'NP_NAME_CORR'
      Size = 50
    end
    object qDetSaleCorrNP_TYPE_CORR: TFloatField
      FieldName = 'NP_TYPE_CORR'
    end
    object qDetSaleCorrDIM_ID_CORR: TFloatField
      FieldName = 'DIM_ID_CORR'
    end
    object qDetSaleCorrDIM_NAME: TStringField
      FieldName = 'DIM_NAME'
      Size = 50
    end
    object qDetSaleCorrNP_NAME: TStringField
      FieldName = 'NP_NAME'
      Size = 50
    end
    object qDetSaleCorrSUM_CORR_GRID: TFloatField
      FieldName = 'SUM_CORR_GRID'
    end
    object qDetSaleCorrNDS_BASE_CORR_GRID: TFloatField
      FieldName = 'NDS_BASE_CORR_GRID'
    end
    object qDetSaleCorrNDS_20_CORR_GRID: TFloatField
      FieldName = 'NDS_20_CORR_GRID'
    end
    object qDetSaleCorrPRICE_CORR_GRID: TFloatField
      FieldName = 'PRICE_CORR_GRID'
      OnChange = qDetSaleCorrPRICE_CORRChange
    end
    object qDetSaleCorrPRICE_NO_NDS_CORR_GRID: TFloatField
      FieldName = 'PRICE_NO_NDS_CORR_GRID'
      OnChange = qDetSaleCorrPRICE_NO_NDS_CORRChange
    end
    object qDetSaleCorrCOUNT_CORR_GRID: TFloatField
      FieldName = 'COUNT_CORR_GRID'
      OnChange = qDetSaleCorrCOUNT_CORRChange
    end
  end
  object dsCorr: TOraDataSource
    DataSet = qDetSaleCorr
    Left = 481
    Top = 210
  end
  object pmSale: TPopupMenu
    Left = 513
    Top = 370
    object miClearPos: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      OnClick = miClearPosClick
    end
  end
  object qWork: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 713
    Top = 426
  end
  object qNal: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '--> CreateAZSBook,qNal'
      '/* '#1050#1074#1077#1088#1103' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1100#1089#1103' '#1074' SlBook */'
      'select s.*,'
      '       dr.*,'
      '       money_dr - nvl(s.nds_t, 0) money,'
      
        '       round((money_dr - nvl(s.nds_t, 0)) / dr.s_price, 3) rasch' +
        '_litr'
      '       --DAILY_REPORT'
      '  from (select sum(drd.out_nal_money) money_dr,'
      '               sum(drd.out_nal_litr) litr,'
      
        '               round(sum(drd.out_nal_litr) * drd.s_price, 2) ras' +
        'ch_money,'
      
        '               round(sum(drd.out_nal_money) / drd.s_price, 3) ra' +
        'sch_litr_dr,'
      '               drd.s_price,'
      
        '               decode(p.dim_id, 2, 28, p.dim_id) dim, -- '#1077#1089#1083#1080' '#1090#1086 +
        #1085#1085#1099', '#1090#1086' '#1084#1077#1085#1103#1077#1084' '#1085#1072' '#1083#1080#1090#1088#1099
      '               p.np_type'
      
        '          from oil_dr_data drd, oil_daily_rep dr, oil_rashod ras' +
        ', oil_part p'
      '         where drd.rep_id = dr.id'
      '           and drd.rep_inst = dr.inst'
      '           and drd.ttn_id = ras.id'
      '           and drd.ttn_inst = ras.inst'
      '           and ras.part_id = p.id'
      '           and ras.part_inst = p.inst'
      '           and dr.state = '#39'Y'#39
      '           and drd.state = '#39'Y'#39
      '           and ras.state = '#39'Y'#39
      '           and p.state = '#39'Y'#39
      '           and drd.s_price <> 0'
      '           and drd.out_nal_money <> 0'
      '              --PARAMS'
      '           and (trunc(dr.rep_date) = :date_ or :date_ is null)'
      '           and ((dr.azs_id = :azs_id) or :azs_id is null)'
      '           and (p.np_type = :np_id or :np_id is null)'
      '           and drd.inst = (select main_inst from oil_info)'
      '         group by s_price, p.np_type, p.dim_id) dr,'
      '        --SALE_BOOK'
      
        '       (select sum(sdet.nds_t) nds_t, sdet.tov_id, sdet.price_nd' +
        's'
      '          from oil_sale_book sb, oil_sale_book_det sdet'
      '         where sb.id = sdet.nn_id'
      '           and sb.inst = sdet.nn_inst'
      '           and sb.nn_cause_id = 9'
      '           and sb.state = '#39'Y'#39
      '           and sdet.state = '#39'Y'#39
      '           and sdet.det_date is not null'
      '              -- PARAMS'
      '           and (trunc(sdet.det_date) = :date_ or :date_ is null)'
      '           and ((sb.azs_id = :azs_id) or :azs_id is null)'
      '           and (sdet.tov_id = :np_id or :np_id is null)'
      '           and (:with_nn is null)'
      '           and sb.inst = (select main_inst from oil_info)'
      '         group by sdet.tov_id, sdet.price_nds) s'
      ' where s.tov_id(+) = dr.np_type'
      '   and s.price_nds(+) = dr.s_price'
      'order by dr.np_type')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 376
    Top = 272
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date_'
      end
      item
        DataType = ftInteger
        Name = 'azs_id'
      end
      item
        DataType = ftUnknown
        Name = 'np_id'
      end
      item
        DataType = ftUnknown
        Name = 'with_nn'
      end>
  end
end
