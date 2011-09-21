inherited frmTestLaunch: TfrmTestLaunch
  Left = 443
  Top = 120
  Width = 769
  Height = 492
  Caption = #1055#1088#1086#1074#1077#1088#1082#1080
  Constraints.MinWidth = 585
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 300
    Width = 761
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 300
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Constraints.MinHeight = 300
    TabOrder = 0
    object Panel2: TPanel
      Left = 617
      Top = 2
      Width = 142
      Height = 296
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Constraints.MinHeight = 223
      Constraints.MinWidth = 130
      TabOrder = 0
      object pnlPassword: TPanel
        Left = 2
        Top = 204
        Width = 138
        Height = 90
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        DesignSize = (
          138
          90)
        object Label1: TLabel
          Left = 9
          Top = 47
          Width = 93
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = #1042#1074#1077#1089#1090#1080' '#1087#1072#1088#1086#1083#1100':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 7
          Top = 3
          Width = 112
          Height = 39
          Anchors = [akLeft, akBottom]
          Caption = #1044#1083#1103' '#1087#1088#1086#1076#1086#1083#1078#1077#1085#1080#1103#13#10#1088#1072#1073#1086#1090#1099' '#1090#1088#1077#1073#1091#1077#1090#1089#1103' '#13#10#1074#1074#1086#1076' '#1087#1072#1088#1086#1083#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtPassword: TEdit
          Left = 8
          Top = 63
          Width = 122
          Height = 21
          Anchors = [akLeft, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 2
        Width = 138
        Height = 119
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel2: TBevel
          Left = 9
          Top = 41
          Width = 121
          Height = 2
        end
        object OilHelpButton1: TOilHelpButton
          Left = 6
          Top = 85
          Width = 127
          Height = 32
          AllowAllUp = True
          GroupIndex = 1001
          Caption = #1057#1087#1088#1072#1074#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333337000073
            3333333338777783333333370044440073333338773333778333337044444444
            07333387333333337833370444BBBB44407338733388883337833044444BB444
            440337333338833333737044444BB444440787333338833333780444444BB444
            444073333338833333370444444BB444444073333338833333370444444BB444
            44407333333883333337044444BBB44444407333338883333337704444444444
            440787333333333333783044444BB444440337333338833333733704444BB444
            4073387333388333378333704444444407333387333333337833333700444400
            7333333877333377833333333700007333333333387777833333}
          Layout = blGlyphRight
          NumGlyphs = 2
          ParentFont = False
          AnimateTime = 200
          Lines.Strings = (
            '{12}{RED}'#1056#1072#1073#1086#1090#1072' '#1089' '#1087#1088#1086#1074#1077#1088#1082#1072#1084#1080'\D{10}'
            ''
            
              '  '#1042' '#1089#1083#1091#1095#1072#1077' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080' '#1073#1086#1083#1077#1077' '#1086#1076#1085#1086#1081' '#1087#1086#1079#1080#1094#1080#1080' '#1087#1088#1086#1074#1077#1088#1086#1082', '#1042#1072#1084' '#1085#1077#1086#1073#1093#1086#1076#1080 +
              #1084#1086
            #1080#1089#1087#1088#1072#1074#1083#1103#1090#1100' '#1086#1096#1080#1073#1082#1080' '#1087#1086#1089#1083#1077#1076#1086#1074#1072#1090#1077#1083#1100#1085#1086'.'
            ''
            
              '  '#1055#1088#1080#1084#1077#1088': '#1085#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1099' '#1087#1072#1082#1077#1090#1099' OIL '#1080' '#1085#1077' '#1087#1086#1089#1090#1088#1086#1077#1085#1072' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1077#1073#1080 +
              #1090#1086#1088#1086#1074'.'
            
              #1042' '#1089#1083#1091#1095#1072#1077', '#1077#1089#1083#1080' '#1090#1086#1083#1100#1082#1086' '#1085#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1099' '#1087#1072#1082#1077#1090#1099' OIL, '#1074#1089#1077' '#1087#1088#1072#1074#1072' '#1073#1083#1086#1082#1080#1088 +
              #1091#1102#1090#1089#1103' '#1073#1077#1079#1086#1075#1086#1074#1086#1088#1086#1095#1085#1086'.'
            
              #1045#1089#1083#1080' '#1078#1077' '#1090#1086#1083#1100#1082#1086' '#1085#1077' '#1087#1086#1089#1090#1088#1086#1077#1085#1072' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1077#1073#1080#1090#1086#1088#1086#1074', '#1090#1086' '#1076#1086#1089#1090#1091#1087' '#1082' '#1086#1090#1095 +
              #1077#1090#1072#1084' '#1086#1090#1082#1088#1099#1090'.'
            
              #1055#1088#1080' '#1085#1072#1083#1080#1095#1080#1080' '#1086#1073#1077#1080#1093' '#1086#1096#1080#1073#1086#1082' '#1073#1091#1076#1077#1090' '#1074#1099#1073#1088#1072#1085#1072' '#1089#1072#1084#1072#1103' '#1089#1091#1088#1086#1074#1072#1103' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1072' ' +
              #1080#1079' '#1076#1074#1091#1093
            #1087#1077#1088#1077#1095#1080#1089#1083#1077#1085#1085#1099#1093' ('#1079#1072#1073#1083#1086#1082#1080#1088#1091#1102#1090#1089#1103' '#1042#1057#1045' '#1087#1088#1072#1074#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103').'
            
              #1058#1072#1082#1080#1084' '#1086#1073#1088#1072#1079#1086#1084', '#1095#1090#1086#1073#1099' '#1080#1089#1087#1088#1072#1074#1080#1090#1100' '#1101#1090#1080' '#1076#1074#1077' '#1086#1096#1080#1073#1082#1080' '#1074#1099' '#1076#1086#1083#1078#1085#1099' '#1089#1087#1077#1088#1074#1072' '#1074 +
              #1099#1075#1088#1091#1079#1080#1090#1100' '#1087#1072#1082#1077#1090' OIL'
            
              #1080' '#1090#1086#1083#1100#1082#1086' '#1087#1086#1089#1083#1077' '#1101#1090#1086#1075#1086' '#1073#1091#1076#1077#1090' '#1086#1090#1082#1088#1099#1090' '#1076#1086#1089#1090#1091#1087' '#1082' '#1086#1090#1095#1077#1090#1072#1084' '#1076#1083#1103' '#1087#1086#1089#1090#1088#1086#1077#1085#1080 +
              #1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
            #1076#1077#1073#1080#1090#1086#1088#1086#1074'.'
            ''
            
              #1042' '#1089#1083#1091#1095#1072#1077' '#1085#1077' '#1089#1080#1085#1093#1088#1086#1085#1080#1079#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1087#1072#1088#1090#1080#1081', '#1085#1077' '#1074#1074#1077#1076#1077#1085#1085#1099#1093' '#1089#1084#1077#1085#1085#1099#1093' '#1086#1090#1095#1077 +
              #1090#1072#1093' '#1080' '#1094#1077#1085#1072#1093
            
              #1082#1086#1085#1082#1091#1088#1077#1085#1090#1086#1074' '#1076#1086#1089#1090#1091#1087' '#1073#1091#1076#1077#1090' '#1086#1090#1082#1088#1099#1090' '#1090#1086#1083#1100#1082#1086' '#1082' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1080#1084' '#1089#1087#1088#1072#1074#1086#1095 +
              #1085#1080#1082#1072#1084'.'
            ''
            #1053#1077#1083#1100#1079#1103' '#1074#1074#1077#1089#1090#1080' '#1089#1073#1086#1080' '#1085#1072' '#1089#1083#1077#1076#1091#1102#1097#1080#1077' '#1087#1088#1086#1074#1077#1088#1082#1080':'
            '- \BVERSION_KEY\D'
            '  '#1056#1077#1096#1077#1085#1080#1077': '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1074#1077#1088#1089#1080#1102' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
            '- \B'#1057#1080#1085#1093#1088#1086#1085#1080#1079#1072#1094#1080#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081'\D'
            '  '#1056#1077#1096#1077#1085#1080#1077': '#1057#1080#1085#1093#1088#1086#1085#1080#1079#1080#1088#1086#1074#1072#1090#1100' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
            '- \B'#1056#1077#1079#1077#1088#1074#1085#1086#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077'\D'
            '  '#1056#1077#1096#1077#1085#1080#1077': '#1055#1088#1086#1080#1079#1074#1077#1089#1090#1080' '#1088#1077#1079#1077#1088#1074#1085#1086#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
            '- \B'#1054#1096#1080#1073#1082#1080' '#1074' '#1087#1088#1086#1074#1077#1088#1082#1072#1093' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084'/'#1082#1072#1088#1090#1072#1084'\D'
            '  '#1056#1077#1096#1077#1085#1080#1077': '#1048#1089#1087#1088#1072#1074#1080#1090#1100' '#1086#1096#1080#1073#1082#1080
            '- \B'#1042#1099#1075#1088#1091#1079#1082#1072' '#1087#1072#1082#1077#1090#1086#1074' '#1080#1079' OIL-a\D'
            '  '#1056#1077#1096#1077#1085#1080#1077': '#1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1087#1072#1082#1077#1090#1099
            '- \B'#1055#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1087#1088#1086#1074#1077#1088#1086#1082' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084'/'#1082#1072#1088#1090#1072#1084'\D'
            '  '#1056#1077#1096#1077#1085#1080#1077': '#1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1080
            '- \B'#1057#1080#1085#1093#1088#1086#1085#1080#1079#1072#1094#1080#1103' '#1087#1072#1088#1090#1080#1081'\D'
            '  '#1056#1077#1096#1077#1085#1080#1077': '#1057#1080#1085#1093#1088#1086#1085#1080#1079#1080#1088#1086#1074#1072#1090#1100' '#1087#1072#1088#1090#1080#1080
            '- \B'#1044#1072#1085#1085#1099#1077' '#1087#1086' '#1076#1077#1073#1077#1090#1086#1088#1072#1084'\D'
            '  '#1056#1077#1096#1077#1085#1080#1077': '#1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1077#1073#1077#1090#1086#1088#1086#1074
            ''
            
              '  '#1054#1073#1088#1072#1097#1072#1077#1084' '#1042#1072#1096#1077' '#1074#1085#1080#1084#1072#1085#1080#1077', '#1095#1090#1086' '#1076#1088#1091#1075#1086#1075#1086' '#1088#1072#1079#1091#1084#1085#1086#1075#1086' '#1088#1077#1096#1077#1085#1080#1103' '#1086#1073#1086#1081#1090#1080' '#1087 +
              #1088#1086#1074#1077#1088#1082#1080','
            #1086#1087#1080#1089#1072#1085#1085#1099#1077' '#1074#1099#1096#1077', '#1085#1077#1090'.'
            ''
            '  '#1055#1086' '#1074#1089#1077#1084' '#1086#1089#1090#1072#1083#1100#1085#1099#1084' '#1087#1088#1086#1074#1077#1088#1082#1072#1084' '#1077#1089#1090#1100' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1074#1074#1077#1089#1090#1080' '#1089#1073#1086#1081'.'
            '  '
            '  '#1053#1072#1095#1080#1085#1072#1103' '#1089' '#1074#1077#1088#1089#1080#1080' 100 '#1080#1089#1082#1083#1102#1095#1077#1085#1072' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1074#1074#1077#1089#1090#1080' '#1087#1072#1088#1086#1083#1100' '#1087#1086
            #1082#1086#1084#1073#1080#1085#1072#1094#1080#1080' '#1082#1083#1072#1074#1080#1096' Ctrl-Shift+dblClick.'
            ''
            ''
            ' ')
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'MS Sans Serif'
          HeaderFont.Style = []
          Animate = False
          UseCurrentDir = False
          FormOrientation = fBottomToTop
          ImageIndex = -1
        end
        object bbtContinue: TBitBtn
          Left = 6
          Top = 4
          Width = 127
          Height = 32
          BiDiMode = bdRightToLeft
          Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 0
          OnClick = bbtContinueClick
          Glyph.Data = {
            36090000424D3609000000000000360000002800000018000000180000000100
            2000000000000009000000000000000000000000000000000000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000000D0000
            00240000003D0000004A0000004B0000003F0000002B00000013C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000C0C0C00000000014000000500F0707932510
            10BE311212D5330F0FDF2D0A09DE210403D50F0000BF00000096000000580000
            001FC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C00000000046322020AA694141E98C5453FF9854
            57FF95484EFF8D3942FF842B33FF781D22FF650D0FFF4D0404FD2E0606E70704
            04AC000000530000000DC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000C0C0C000130E0E63775757DFBD8D8CFFC28D90FFAD7177FF9A55
            58FF934840FF8F4232FF8B392DFF812B2AFF791C26FF761018FF750B0BFF6011
            11FF220B0BDC0000006F00000012C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C0002B24246BAA8C8CECDFBBBBFFC2989CFF9E5D57FFA04D20FFBB67
            07FFD38700FFDD9900FFDB9700FFC98103FFA8580BFF802813FF6C0D12FF760A
            0DFF7B1818FF351212E9000000770000000DC0C0C000C0C0C000C0C0C000C0C0
            C0002B262652C8B3B3F1F5E3E3FFBA9196FF863325FF9E4400FFDF7C00FFFFA0
            00FFFFA800FFFFAA00FFFFAE00FFFFB200FFFCB100FFDE8C00FF963D05FF690C
            0CFF71080BFF871E1EFF351313ED0000005DC0C0C000C0C0C000C0C0C0000909
            091BB2A9A9CCFFFFFFFFCDB0B5FF882819FF962F00FF9D4300FFB95700FFE06A
            00FFF87600FFFF7E00FFFF8200FFFF8600FFFF8E00FFFF9900FFEB8500FF9A3A
            02FF670907FF750A0DFF822323FF1B0C0BC200000024C0C0C000C0C0C0007372
            7283FFFFFFFFE7D9DCFF8B2C25FF9C2B00FF5F3014FF422019FF771F00FFA432
            00FFC94500FFFA5A00FFFF6100FFFF6400FFFF6700FFFF6A00FFFF7300FFD964
            00FF8B2902FF660508FF801213FF5E1D1CFA03020273C0C0C00026262623D9DA
            DADEFFFFFFFF9E5D61FF901200FFA62A00FF726E70FFACB8BEFF40211FFF4908
            01FF971A00FFDD3100FFF73B00FFFF4100FFFF4600FFFF4800FFFF4C00FFEB58
            00FFAE4100FF741206FF6D070AFF7F1C1BFF220C0CBC000000186B6B6B66FFFF
            FFFFDDC5C8FF7B130DFFA82600FFBC1F00FF724B48FFE3F3F4FFDAE1E2FF777F
            83FF530000FFA70B00FFC21300FFE41B00FFED2000FFE92600FFEC3200FFE442
            00FFBE4100FF871D02FF6A0A0AFF7C1112FF471313E50001013EBBB5B5A3FFFE
            FEFFB68185FF790500FFAA2500FFD82300FFAE0800FF6D5D61FFF1FDFEFFF0F6
            F5FF504344FF400000FF7B0000FFA60200FFA40600FFA00F00FFAC1D00FFC02D
            00FFBC3600FF932100FF6F0F0AFF750E0FFF5C1010FB0704045DFBE9E9C4FFED
            EDFFA76264FF7C0200FFA71D00FFC31B00FFE30F00FF9B0001FF7C797BFFF9FF
            FFFFE5E7E7FF727F7FFF260000FF510303FF480908FF490301FF640300FF8B19
            00FFA22600FF951F00FF74100AFF741213FF610909FF0D03036EFFE6E6D4FFDF
            DFFF9D4E4FFF7A0000FFA11500FFB61200FFC70F00FFDB0300FF830000FF7C7E
            7EFFFEFFFFFFEAECECFF727576FF9DA3A5FFB7C0C1FF93999AFF422F31FF4C03
            00FF821700FF8C1600FF76100AFF791B1CFF600808FF0D02026FFFDFDFD2FFD8
            D8FFA15456FF750000FF9A0F00FFAC0D00FFB80900FFC30500FFD10000FF7404
            04FF8A9090FFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2DBDBFF3C2E
            2FFF5D0500FF810F00FF750F0DFF812526FF5F0B0BFE0A00005CFFDEDEC1FFD1
            D1FFB16A6AFF6D0000FF8E0700FF9E0800FFAA0500FFB10000FFBE0000FFC100
            00FF5A1212FFBDCACAFFFFFFFFFFFBFBFBFFACAEAEFFA9ABABFFFFFFFFFF8B92
            94FF3E0100FF790300FF751617FF893132FF580F0FEC05000036FFE8E89AFFC7
            C7FFD08A8AFF6F0908FF8B140FFF9A1510FFA41410FFAB100EFFAC0505FFB900
            00FF5E0000FFA7B4B4FFFFFFFFFFBFC3C3FF130303FF1A0909FFD0D2D3FFB2B8
            B9FF4D100CFF7A0703FF7F2B2DFF903B3BFF440F0FC100000010FFF7F758FFC3
            C3FCF6ABABFF8F3635FF8B2E2DFFA53E3CFFAA3938FFB13A39FFB23434FFB924
            24FF751212FF8D9393FFFFFFFFFFDFE1E1FF685E5EFF716767FFE7ECEDFF9896
            95FF782C28FF7E1E1DFF944A4BFF8B3B3BFF240A0973C0C0C000FFFFFF16FFD6
            D6CAFFB3B3FFD27D7DFF893636FFAC6464FFB46161FFB75E5EFFBB6161FFBF62
            62FFBC5A5AFF8B6262FFC0C5C5FFFCFFFFFFF3F8F8FFEEF4F4FFBDC0C0FF906A
            68FF933E3DFF8D4545FFAA6262FF652C2CCE04010117C0C0C000C0C0C000FFF5
            F55FFFBABAFCFFA7A7FFBB6565FF9F5F60FFC28E8EFFC48888FFC38282FFC483
            83FFCB8585FFC57D7DFFA77E7EFFB1A1A1FFBEB4B4FFB4A6A6FFAA8989FFAB66
            66FF944D4EFFAF7677FF9D5959FA2B131356C0C0C000C0C0C000C0C0C000FFFF
            FF08FFE6E69CFFB1B1FFFAA9A9FFC17474FFAC7272FFCDA9A9FFDAB8B8FFD7B2
            B2FFD5AEAEFFD8AEAEFFD9ABABFFD3A7A7FFD1ADADFFD0A8A8FFB57A7BFFA266
            67FFB98989FFB77D7DFF643D3D83C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000FFFFFF15FFE3E3B4FFB7B7FFFDB5B5FFD79393FFB87D7DFFC39B9BFFD6BC
            BCFFE1CBCBFFE2CECEFFE1CCCCFFDBBEBEFFC9A1A1FFB68484FFBA908FFFCAA6
            A6FFC39494FF7D626292C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000FFFFFF15FFEAEA98FFCBCBF8FFC7C7FFF4BCBCFFD6A0A0FFC794
            94FFCA9F9FFFCFA9A9FFCBA7A7FFC6A0A0FFD1B5B5FFDFCBCBFFDBC4C4FFDBB9
            B9EFB39C9C80C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000FFFAFA58FFE5E5C0FFD9D9FDFFDDDDFFFFE1
            E1FFFAE2E2FFF8E8E8FFF9F2F2FFFFFFFFFFFBF9F9FFEADDDDF6E7D7D7B1F9ED
            ED44C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF13FFFBFB50FFF3F393FFF0
            F0BEFFF3F3D4FFF7F7DBFFFEFED1FFFFFFB7FAF7F788F7F2F245FAF6F60AC0C0
            C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
          Layout = blGlyphRight
        end
        object bbTestDB: TBitBtn
          Left = 6
          Top = 48
          Width = 127
          Height = 32
          BiDiMode = bdRightToLeft
          Caption = #1055#1088#1086#1074#1077#1088#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 1
          OnClick = bbTestDBClick
          Layout = blGlyphBottom
        end
      end
      object pnlWithCloseButton: TPanel
        Left = 2
        Top = 121
        Width = 138
        Height = 44
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Bevel1: TBevel
          Left = 9
          Top = 3
          Width = 121
          Height = 2
        end
        object bbtClose: TBitBtn
          Left = 7
          Top = 9
          Width = 127
          Height = 32
          BiDiMode = bdRightToLeft
          Caption = #1047#1072#1082#1088#1099#1090#1100' OIL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 0
          OnClick = bbtCloseClick
          Glyph.Data = {
            36090000424D3609000000000000360000002800000018000000180000000100
            2000000000000009000000000000000000000000000000000000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000000D0000
            00250000003D000000490000004B0000003F0000002B00000013C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000C0C0C00000000014000000500F0707932510
            10BF311213D5320F0FDE2D0909DE200303D50E0000BF00000095000000580000
            001FC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C00000000046312020AA6A4141E8905350FFA157
            4FFFA14E44FF9B4235FF913226FF832219FF6A0F0AFF4D0404FD2D0606E60704
            04AC000000520000000DC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000C0C0C000130E0E63765858DFC18C89FFCD9087FFB27771FF8B59
            62FF6D405FFF5D325CFF5E2C51FF6C2A3AFF7C261FFF83180CFF7A0B07FF5F10
            11FF200A0BDB0000006F00000012C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C0002B24246BAA8B8BECE7BCB6FFC19C9AFF705778FF2C2084FF0907
            ACFF0000CFFF0000DFFF0000DBFF0503C0FF1A0B8DFF3E134DFF671315FF800C
            05FF7A1717FF331212E9000000760000000DC0C0C000C0C0C000C0C0C000C0C0
            C0002B252652C8B3B3F1FFE3DCFFA895A0FF2B2570FF0000A3FF0000E8FF0000
            F5FF0000E3FF0000D4FF0000D9FF0000EEFF0000FBFF0000D5FF100679FF470C
            23FF7C0C03FF881E1DFF331313EB0000005CC0C0C000C0C0C000C0C0C0000909
            091BB2AAA9CCFFFFFFFFBDB4BDFF19186AFF0000A0FF0000E2FF0000C0FF0000
            81FF181868FF272767FF222265FF0B0B70FF00009DFF0000DEFF0000D3FF0202
            80FF410824FF800D05FF812222FF1A0B0BC000000024C0C0C000C0C0C0007373
            7283FFFFFFFFDCDCE2FF252669FF00008AFF0000CAFF000092FF34345DFF9D9D
            9CFFD3D3C9FFEAEADCFFE3E3D6FFBCBCB7FF686875FF090962FF0000BDFF0000
            B9FF07036DFF510817FF89130EFF5B1C1CF902020272C0C0C00026262623DADA
            D9DEFFFFFFFF616189FF000065FF0000AEFF00008BFF48485FFFE9E9D6FFEFEF
            E4FF8A8A9CFF52526DFF64647DFFBDBDBFFFFDFDEFFFA5A59CFF0C0C5FFF0000
            AEFF000095FF1C064AFF700A07FF811B17FF210C0DBB000000186B6B6B66FFFF
            FFFFCBC8D0FF0D0C5AFF000080FF000091FF2E2E62FFE4E4D2FFBEBEC2FF2828
            77FF0D0D5CFF545462FF323258FF050568FF6A6A94FFF7F7EBFF878788FF0303
            71FF000099FF010169FF4D0B20FF84120BFF461213E40000003DBBB5B5A3FFFE
            FBFF8C859EFF000055FF000087FF010166FFA4A4A4FFE2E2DCFF1B1B72FF0000
            8FFF3B3B80FFFAFAE7FFA6A6AEFF00007FFF000080FF757590FFF4F4E4FF3838
            67FF000080FF000073FF2E0B3BFF7C0E0AFF5A0F0FFA0503035BFBE9E9C4FFEE
            E7FF6E6388FF000057FF00007CFF1F1F64FFECECDCFF85859BFF00007CFF0000
            8EFF393977FFF0F0E6FFA0A0ABFF000071FF000094FF202075FFE9E9E0FF7F7F
            90FF000068FF000072FF1E0A48FF761413FF600808FF0C02026BFFE6E5D4FFDF
            DAFF5C4F7AFF000056FF00006FFF444470FFF3F3E5FF555579FF000079FF0000
            83FF393972FFF0F0E5FF9F9FA9FF000069FF00008CFF0C0C6BFFC1C1C3FFA8A8
            AEFF00005DFF00006CFF180A4CFF771D1EFF610705FF0C00016DFFDFDED2FFD8
            D3FF67567BFF000051FF000067FF41416CFFF5F5E8FF585873FF00006EFF0000
            7CFF39396FFFF0F0E5FF9F9FA8FF000062FF000082FF0E0E5EFFC5C5C4FFA4A4
            AAFF010157FF000064FF1D0D4AFF802627FF600B09FD0900005AFFDEDFC1FFD1
            CCFF846A87FF000049FF000061FF161656FFE2E2DBFF959599FF00004DFF0000
            74FF3B3B6EFFF6F6ECFFA4A4ACFF000060FF00006AFF272751FFF1F1E7FF7272
            86FF000053FF000059FF311847FF8E322EFF570F0EEB04000035FFE8E89AFFC8
            C4FFB68A99FF09084CFF0C0E66FF030458FF91919EFFEDEDE4FF313147FF0000
            3FFF323262FFE6E6DCFF9898A0FF000047FF010138FF969694FFEDEDE5FF2E2E
            63FF070763FF030656FF582D48FF993B36FF430F0EBE0000000FFFF6F658FFC3
            C2FCF2ABABFF473567FF282D71FF32317DFF444474FFDEDEDBFFD1D1CFFF5151
            61FF242441FF4A4A58FF36364BFF32324CFF97979DFFFFFFF8FF89899AFF2C2C
            72FF31357DFF241E58FF8D4B51FF8F3A37FE22090970C0C0C000FFFFFF16FFD6
            D6CAFFB3ADFFBA7E8BFF38356DFF616599FF565690FF707090FFE1E1E0FFF6F6
            F2FFCECECFFFA4A4ADFFB6B6BAFFE6E6E4FFFFFFFAFFABABB5FF545487FF6465
            9CFF3F447BFF68465EFFB1625EFF632B2BCC05010116C0C0C000C0C0C000FFF5
            F560FFBAB9FCFFA7A2FF91647DFF5C608EFF8B8EB5FF7E7DA9FF8585A1FFBFBF
            C7FFECECECFFF5F5F5FFF4F4F3FFD9D9DDFF9E9EAFFF7A7AA0FF8A8BB4FF686C
            9AFF5E4E71FFB27776FF9E5958FA28121255C0C0C000C0C0C000C0C0C000FFFF
            FF08FFE6E69EFFB1AFFFF7A9A7FF99738CFF737299FFA5AAC4FFB2B3CEFFA7A7
            C1FFA9AABFFFB1B1C3FFADADC1FFA7A7BEFFAFAFC9FFAEAECAFF7B7DA2FF7567
            85FFB6898CFFBB7D7BFF603A3B81C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000FFFFFF16FFE3E2B5FFB7B6FFFBB5B2FFBF93A0FF8B7C9AFF9B9BB6FFB9BC
            D1FFC7C8DAFFC9CADCFFC8C8DAFFBCBCD2FFA0A0BBFF8584A4FFA091A3FFCDA7
            A5FFC79492FF795E5F91C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000FFFFFF15FFEAEB98FFCBCAF8FFC7C3FFEEBCBDFFBEA0AFFFA294
            AAFFA8A0B6FFB0AABEFFAAA7BDFFA1A2BBFFB5B6C9FFD8CCD0FFE0C4C0FFDDBA
            B9EEAF9A9A7FC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000FFFAFA58FFE5E5C0FFD8D7FDFFDDDAFFFFE1
            DFFFF7E2E2FFF4E8E8FFF5F2F3FFFFFFFFFFFDF9F6FFECDCDBF6E8D8D9B1F8EB
            EB42C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
            C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF13FFFBFB51FFF3F393FFF0
            F0BFFFF3F2D4FFF7F6DBFFFEFDD2FFFFFFB8FAF6F686F6F1F144FBF8F80AC0C0
            C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
          Layout = blGlyphRight
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 165
        Width = 138
        Height = 39
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 3
        object cbHideGreen: TCheckBox
          Left = 9
          Top = 5
          Width = 125
          Height = 17
          Caption = #1057#1093#1086#1074#1072#1090#1080' '#1087#1088#1086#1081#1076#1077#1085#1110
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = cbHideGreenClick
        end
      end
    end
    object RxSplitter1: TRxSplitter
      Left = 615
      Top = 2
      Width = 2
      Height = 296
      ControlFirst = Panel2
      Align = alRight
    end
    object dbgMain: TDBGridEh
      Left = 2
      Top = 2
      Width = 613
      Height = 296
      Align = alClient
      AutoFitColWidths = True
      BorderStyle = bsNone
      Color = clBtnFace
      DataSource = dsRMD
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FrozenCols = 1
      HorzScrollBar.Tracking = True
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection]
      RowHeight = 6
      RowLines = 1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgMainDrawColumnCell
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Flag'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Footers = <>
          KeyList.Strings = (
            '0'
            '1'
            '2')
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'Comment_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Footers = <>
          Width = 214
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 439
    Width = 761
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 303
    Width = 761
    Height = 136
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'Panel3'
    TabOrder = 2
    object Notebook1: TNotebook
      Left = 2
      Top = 2
      Width = 757
      Height = 132
      Align = alClient
      PageIndex = 5
      PopupMenu = pmToExcel
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Part'
        object dbgPart: TDBGridEh
          Left = 0
          Top = 0
          Width = 757
          Height = 132
          Hint = #1053#1077' '#1089#1080#1085#1093#1088#1086#1085#1110#1079#1086#1074#1072#1085#1110' '#1087#1072#1088#1090#1110#1111
          Align = alClient
          Color = clBtnFace
          DataSource = dsPart
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'DOG_'
              Footers = <>
              Title.Caption = #1055#1072#1088#1090#1080#1103
              Width = 113
            end
            item
              EditButtons = <>
              FieldName = 'TIMES'
              Footers = <>
              Title.Caption = #1044#1085#1077#1081' '#1086#1089#1090#1072#1083#1086#1089#1100
              Width = 92
            end
            item
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              Title.Caption = #1043#1076#1077' '#1074#1074#1077#1076#1077#1085#1072' '#1087#1072#1088#1090#1080#1103
              Width = 310
            end>
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Memo'
        object redComment: TRxRichEdit
          Left = 0
          Top = 0
          Width = 757
          Height = 132
          Align = alClient
          BorderStyle = bsNone
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Pitch = fpVariable
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = False
          TabOrder = 0
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'VagonGrid'
        object dbgVagons: TDBGridEh
          Left = 0
          Top = 0
          Width = 757
          Height = 132
          Hint = #1053#1077' '#1089#1080#1085#1093#1088#1086#1085#1110#1079#1086#1074#1072#1085#1110' '#1074#1072#1075#1086#1085#1080
          Align = alClient
          BorderStyle = bsNone
          Color = clBtnFace
          DataSource = dsVagon
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          ParentShowHint = False
          PopupMenu = pmToExcel
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'VAGON_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1042#1072#1075#1086#1085
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'PART_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1055#1072#1088#1090#1080#1103
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'DATE_RAST'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1044#1072#1090#1072
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'COMMENTS'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'ORG_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1084#1091
              Width = 250
            end
            item
              EditButtons = <>
              FieldName = 'OBL_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1054#1073#1083'. '#1082#1086#1084#1091
              Width = 250
            end
            item
              EditButtons = <>
              FieldName = 'NP_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1058#1080#1087' '#1053#1055
              Width = 170
            end
            item
              EditButtons = <>
              FieldName = 'NP_GRP_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1043#1088#1091#1087#1087#1072' '#1053#1055
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'WEIGHT'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1042#1077#1089
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'RAIL_STAT_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1057#1090#1072#1085#1094#1080#1103' '#1086#1090#1075#1088#1091#1079#1082#1080
              Width = 200
            end>
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'SrTalon'
        object DBGridEh2: TDBGridEh
          Left = 0
          Top = 0
          Width = 757
          Height = 132
          Align = alClient
          AutoFitColWidths = True
          Color = clBtnFace
          DataSource = dsSRTalon
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'txt'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1040#1047#1057
              Width = 30
            end
            item
              EditButtons = <>
              FieldName = 'txt1'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1044#1085#1077#1081' '#1086#1089#1090#1072#1083#1086#1089#1100
              Width = 119
            end
            item
              EditButtons = <>
              FieldName = 'n'
              Footers = <>
              Title.Alignment = taCenter
              Width = 55
            end>
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'TubRez'
        object dbgRez: TDBGridEh
          Left = 0
          Top = 0
          Width = 757
          Height = 132
          Hint = #1053#1077' '#1079#1072#1074#1077#1076#1077#1085#1110' '#1090#1088#1091#1073#1086#1087#1088#1086#1074#1086#1076#1080' '#1074' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072#1093
          Align = alClient
          Color = clBtnFace
          DataSource = dsRez
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ID'
              Footers = <>
              Width = 42
            end
            item
              EditButtons = <>
              FieldName = 'NUM'
              Footers = <>
              Title.Caption = #1053#1086#1084#1077#1088
              Width = 65
            end
            item
              EditButtons = <>
              FieldName = 'REZ_NAME'
              Footers = <>
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Width = 108
            end
            item
              EditButtons = <>
              FieldName = 'INST_ORG'
              Footers = <>
              Title.Caption = 'INST'
              Width = 56
            end
            item
              EditButtons = <>
              FieldName = 'ORG_NAME'
              Footers = <>
              Title.Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
              Width = 370
            end>
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'CheckList'
        object dbgCheck: TDBGridEh
          Left = 0
          Top = 0
          Width = 757
          Height = 132
          Hint = 'Checks'
          Align = alClient
          Color = clBtnFace
          DataSource = dsCheckList
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              Footers = <>
            end>
        end
      end
    end
  end
  object dsRMD: TOraDataSource
    AutoEdit = False
    DataSet = rmd
    OnDataChange = dsRMDDataChange
    Left = 379
    Top = 94
  end
  object rmd: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'Flag'
        DataType = ftInteger
      end
      item
        Name = 'Comment_'
        DataType = ftString
        Size = 20
      end>
    OnFilterRecord = rmdFilterRecord
    Left = 376
    Top = 39
    object rmdFlag: TFloatField
      FieldName = 'Flag'
    end
    object rmdComment_: TStringField
      FieldName = 'Comment_'
      Size = 80
    end
  end
  object ImageList1: TImageList
    Left = 379
    Top = 149
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000084000000
      0000000000000000000000000000000000000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400008484000000530000005300000053000000
      5300000053000000530000005300000053000000530000005300000053000000
      5300000053000000530000005300000053000000000000000000000000000000
      0000008400000084000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000000FF000000FF000000FF000000FF000000FF000000FF000000
      8400000084000000000000000000000000000084840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000848400000053000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000053000000000000000000000000000084
      000000FF000000FF000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000084000000000000000000000000000084840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00008484000000000000000000000053000000FF000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF00000053000000000000000000000000000084000000FF
      000000FF000000FF000000FF0000008400000000000000000000000000000000
      00000000000000000000000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000840000000000000000000084840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00008484000000000000000000000053000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000530000000000000000000084000000FF000000FF
      000000FF000000FF000000FF000000FF00000084000000000000000000000000
      00000000000000000000000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00000084000000000000000000000000000084840000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000084840000000000000000000000000000000000000053000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000530000000000000000000084000000FF000000FF000000FF
      0000C6C6C60000FF000000FF000000FF000000FF000000840000000000000000
      000000000000000000000000000000000000000084000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000840000000000000000000084840000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000084840000000000000000000000000000000000000053000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF0000005300000000000000000000FF000000FF000000FF0000C6C6
      C60000000000C6C6C60000FF000000FF000000FF000000840000000000000000
      000000000000000000000000000000000000000084000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000FF00000084000000000000000000000000000084
      840000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      53000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF0000005300000000000000000000000000C6C6C60000FF0000C6C6C6000000
      00000000000000000000C6C6C60000FF000000FF000000FF0000008400000000
      000000000000000000000000000000000000000084000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000FF00000084000000000000000000000000000084
      840000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      53000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000530000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000C6C6C60000FF000000FF000000FF00000084
      000000000000000000000000000000000000000084000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000FF00000084000000000000000000000000000000
      00000084840000FFFF000000000000000000000000000000000000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000053000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      5300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000FF000000FF000000FF
      000000840000000000000000000000000000000084000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000FF00000084000000000000000000000000000000
      00000084840000FFFF0000FFFF00000000000000000000FFFF0000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000053000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000
      5300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60000FF000000FF
      000000FF0000008400000000000000000000000084000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000084000000000000000000000000000000
      0000000000000084840000FFFF00000000000000000000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000053000000FF00FFFFFF00FFFFFF000000FF00000053000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C60000FF
      000000FF000000FF0000008400000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000008400000000000000000000000000000000000000
      0000000000000084840000FFFF0000FFFF0000FFFF0000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000053000000FF000000FF000000FF000000FF00000053000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000FF000000FF0000008400000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000008400000000000000000000000000000000000000
      000000000000000000000084840000FFFF0000FFFF0000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000053000000FF000000FF0000005300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000FF000000FF0000000000000000000000000000000084000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000840000000000000000000000000000000000000000000000
      000000000000000000000084840000FFFF0000FFFF0000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000053000000FF000000FF0000005300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      8400000084000000FF000000FF000000FF000000FF000000FF000000FF000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008484000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000053000000530000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008484000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000053000000530000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF81F00000000F3FFE00700000000
      E1FFC00380018001C0FF800180018001807F8001C003C003003F0000C003C003
      083F0000E007E0071C1F0000E007E007BE0F0000F00FF00FFF070000F00FF00F
      FF830000F81FF81FFFC18001F81FF81FFFE18001FC3FFC3FFFF1C003FC3FFC3F
      FFFBE007FE7FFE7FFFFFF81FFE7FFE7F00000000000000000000000000000000
      000000000000}
  end
  object dsPart: TOraDataSource
    AutoEdit = False
    DataSet = qPart
    OnDataChange = dsRMDDataChange
    Left = 15
    Top = 249
  end
  object qCard: TOilQuery
    SQL.Strings = (
      '-->qCard,uTestLaunch'
      'select distinct checkup_ID as id,name,WARNING_QUANTITY'
      
        'from CARD_CHECKUPS where Enabled='#39'Y'#39' and inst = :inst ORDER BY c' +
        'heckup_ID'
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 485
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
  object qPart: TOilQuery
    SQL.Strings = (
      '-->qPart,uTestLaunch'
      
        'select DOG_, decode(sign(Times),-1,'#39#1057#1088#1086#1082' '#1080#1089#1090#1077#1082#39',0,'#39#1057#1088#1086#1082' '#1080#1089#1090#1077#1082#39',1' +
        ', trunc(Times)||decode(trunc(Times),1,'#39' '#1076#1077#1085#1100#39',2,'#39' '#1076#1085#1103#39',3,'#39' '#1076#1085#1103#39',' +
        '4,'#39' '#1076#1085#1103#39','#39' '#1076#1085#1077#1081#39')||'#39' '#39'||Trunc((Times-trunc(Times))*24)||'#39' '#1095'.'#39') a' +
        's Times, Times as N, O.name'
      'from'
      'v_org O, oil_part P,'
      '(select DOG_, Times+:p_Days as Times from'
      
        '    (select DOG_, sum(ALL_) All_part, sum(ALF) Alfa, min(Times) ' +
        'as Times'
      
        '       from (select UPPER(dog) DOG_, count(UPPER(dog)) ALL_, 0 A' +
        'LF, min(dog_date-sysdate) as Times from oil_part'
      '             where state = '#39'Y'#39
      '             group by UPPER(dog)'
      '           union all'
      
        '             select UPPER(dog) DOG_ , 0 ALL_, count(plan_id) ALF' +
        ', 5000 as Times from oil_part'
      '             where state = '#39'Y'#39
      '             group by UPPER(dog))'
      '      group by DOG_) A'
      '    where (All_part > 1) and (Alfa > 0) and (Alfa < All_part)'
      ')'
      
        'where DOG_=upper(P.Dog) and P.Plan_Id is null and P.Inst = O.Ins' +
        't and P.Inst = O.id and P.state='#39'Y'#39
      'order by N'
      ''
      ' '
      ' ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 34
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_Days'
        ParamType = ptInput
      end>
    object qPartDOG_: TStringField
      FieldName = 'DOG_'
      Size = 15
    end
    object qPartTIMES: TStringField
      FieldName = 'TIMES'
      Size = 89
    end
    object qPartN: TFloatField
      FieldName = 'N'
    end
    object qPartNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object qVagons: TOilQuery
    SQL.Strings = (
      'select :p_Days - days_past as N,'
      '       name as vagon_name,'
      '       dog as part_name,'
      '       date_rast,'
      '       decode(pr_np_type - w_np_type,'
      '              null,'
      '              decode(sign(:p_Days - days_past),'
      '                     -1,'
      '                     '#39#1057#1088#1086#1082' '#1080#1089#1090#1105#1082#39','
      '                     :p_Days - days_past || '#39' '#39' ||'
      '                     decode(:p_Days - days_past,'
      '                            1,'
      '                            '#39#1076#1077#1085#1100#39','
      '                            2,'
      '                            '#39#1076#1085#1103#39','
      '                            3,'
      '                            '#39#1076#1085#1103#39','
      '                            4,'
      '                            '#39#1076#1085#1103#39','
      '                            '#39#1076#1085#1077#1081#39')),'
      
        '              '#39#1055#1088#1080#1093#1086#1076' '#1089' '#1085#1077#1074#1077#1088#1085#1099#1084' '#1090#1080#1087#1086#1084' '#1053#1055', '#1085#1086#1084#1077#1088' '#1087#1088#1080#1093#1086#1076#1072' '#39' || pr' +
        'ih_id) as comments,'
      '       org_name,'
      '       obl_name,'
      '       np_name,'
      '       np_grp_name,'
      '       weight,'
      '       rail_stat_name'
      '  from v_oil_tsw')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 35
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_Days'
      end>
    object qVagonsN: TFloatField
      FieldName = 'N'
    end
    object qVagonsVAGON_NAME: TStringField
      FieldName = 'VAGON_NAME'
      Size = 16
    end
    object qVagonsPART_NAME: TStringField
      FieldName = 'PART_NAME'
      Size = 15
    end
    object qVagonsDATE_RAST: TDateTimeField
      FieldName = 'DATE_RAST'
    end
    object qVagonsCOMMENTS: TStringField
      FieldName = 'COMMENTS'
      Size = 45
    end
    object qVagonsORG_NAME: TStringField
      FieldName = 'ORG_NAME'
      Size = 100
    end
    object qVagonsOBL_NAME: TStringField
      FieldName = 'OBL_NAME'
      Size = 100
    end
    object qVagonsNP_NAME: TStringField
      FieldName = 'NP_NAME'
      Size = 255
    end
    object qVagonsNP_GRP_NAME: TStringField
      FieldName = 'NP_GRP_NAME'
      Size = 50
    end
    object qVagonsWEIGHT: TFloatField
      FieldName = 'WEIGHT'
    end
    object qVagonsRAIL_STAT_NAME: TStringField
      FieldName = 'RAIL_STAT_NAME'
      Size = 50
    end
  end
  object dsVagon: TOraDataSource
    AutoEdit = False
    DataSet = qVagons
    OnDataChange = dsRMDDataChange
    Left = 63
    Top = 250
  end
  object pmToExcel: TPopupMenu
    Left = 273
    Top = 333
    object miPutToExcel: TMenuItem
      Caption = #1042#1099#1074#1077#1089#1090#1080' '#1074' '#1101#1082#1089#1077#1083#1100
      OnClick = miPutToExcelClick
    end
  end
  object dsSRTalon: TOraDataSource
    DataSet = qSRTalon
    Left = 124
    Top = 250
  end
  object qSRTalon: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '-->qSRTalon,uTestLaunch'
      'select'
      '  txt1,'
      '  days as N,'
      '  decode(sign(days),'
      '    -1,'#39#1057#1088#1086#1082' '#1080#1089#1090#1105#1082#39','
      '    days||decode(days,'
      '      1,'#39#1076#1077#1085#1100#39','
      '      2,'#39#1076#1085#1103#39','
      '      3,'#39#1076#1085#1103#39','
      '      4,'#39#1076#1085#1103#39','
      '      '#39#1076#1085#1077#1081#39')) as txt'
      'from'
      '  (select'
      '     txt1,'
      
        '     nvl(ov.getval('#39'SRD'#39'),3)+(trunc(sysdate,'#39'day'#39')-trunc(rep_dat' +
        'e,'#39'day'#39'))*2/7+trunc(rep_date)-trunc(sysdate) as days'
      '   from'
      '    (select /*+ORDERED*/'
      
        '       azs.name||'#39' '#39'||to_char(drep.rep_date,'#39'DD.MM.YYYY HH24:MI'#39 +
        ')'
      '         ||'#39' '#1089#1084#1077#1085#1072' '#8470#39'||drep.smena_num as txt1,'
      '       drep.rep_date,'
      '       row_number() over (order by drep.rep_date) as rnum'
      
        '     from oil_srtalon srt, oil_dr_data dr, oil_daily_rep drep,oi' +
        'l_org azs, v_oil_info oi'
      '     where srt.state='#39'Y'#39' and dr.state='#39'Y'#39' and drep.state='#39'Y'#39
      '       and srt.srep_id=dr.id and srt.srep_inst=dr.inst'
      '       and dr.rep_id=drep.id and dr.rep_inst=drep.inst'
      '       and drep.azs_id=azs.id and drep.azs_inst=azs.inst'
      
        '       and srt.ser is null and decode(srt.ser, null, 0, 1) = 0 a' +
        'nd litr<>0'
      '       and srt.inst=oi.main_inst'
      '       and oi.main_inst<>118'
      
        '       and trunc(drep.rep_date) >= to_date('#39'01.06.2005'#39','#39'dd.mm.y' +
        'yyy'#39')'
      '    )'
      '  where rnum=1'
      ' )')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 37
    Top = 100
  end
  object dsRez: TOraDataSource
    AutoEdit = False
    DataSet = qRez
    OnDataChange = dsRMDDataChange
    Left = 183
    Top = 249
  end
  object qRez: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '-->qRez,uTestLaunch'
      
        'select r.id, r.name as rez_name, r.num, r.inst_org, oo.name as o' +
        'rg_name'
      '  from v_oil_rezervuar r, v_org oo'
      ' where oo.state = '#39'Y'#39
      '   and r.realvirt = 1'
      '   and (r.tubing is null or r.tubingcapacity is null)'
      '   and r.inst_org = oo.inst'
      '   and oo.id = oo.inst'
      'order by inst_org')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 88
    Top = 4
    object qRezID: TFloatField
      FieldName = 'ID'
    end
    object qRezNUM: TStringField
      DisplayWidth = 20
      FieldName = 'NUM'
      Size = 10
    end
    object qRezREZ_NAME: TStringField
      FieldName = 'REZ_NAME'
      Size = 50
    end
    object qRezINST_ORG: TFloatField
      FieldName = 'INST_ORG'
    end
    object qRezORG_NAME: TStringField
      FieldName = 'ORG_NAME'
      Size = 100
    end
  end
  object qCheckList: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '-->qCheckList,uTestLaunch'
      'select --+ ordered use_nl(f,s,d,d2)'
      '       s.id as sql_id,'
      '       s.name as sql_name,'
      '       f.name as form_name,'
      '       d.text,       '
      '       substr(d.text,9) as test_num,'
      '       substr(d2.text,15) as checkindex'
      ' from exe_forms f,exe_sql s, exe_sql_data d, exe_sql_data d2'
      
        'where f.state='#39'Y'#39' and s.state='#39'Y'#39' and d.state='#39'Y'#39' and d2.state='#39 +
        'Y'#39
      '  and lower(f.name) = '#39'utestlaunch'#39
      '  and f.id = s.form_id'
      '  and d.sql_id = s.id'
      '  and d2.sql_id = s.id'
      '  and d.text = '#39'--$TEST='#39' || :test'
      '  and d2.text like '#39'--$CHECKINDEX=%'#39
      '  order by substr(d2.text,15)')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 240
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'test'
      end>
    object qCheckListSQL_ID: TFloatField
      FieldName = 'SQL_ID'
      Required = True
    end
    object qCheckListSQL_NAME: TStringField
      FieldName = 'SQL_NAME'
      Size = 100
    end
    object qCheckListFORM_NAME: TStringField
      FieldName = 'FORM_NAME'
      Size = 50
    end
    object qCheckListTEST_NUM: TStringField
      FieldName = 'TEST_NUM'
      Size = 248
    end
    object qCheckListCHECKINDEX: TStringField
      FieldName = 'CHECKINDEX'
      Size = 242
    end
  end
  object dsCheckList: TOraDataSource
    DataSet = qCheckList
    Left = 240
    Top = 88
  end
end
