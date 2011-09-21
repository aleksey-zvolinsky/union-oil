inherited SRepForm: TSRepForm
  Left = 253
  Top = 219
  BorderStyle = bsSingle
  Caption = #1057#1084#1077#1085#1085#1099#1081' '#1086#1090#1095#1077#1090
  ClientHeight = 466
  ClientWidth = 737
  Constraints.MinHeight = 480
  Constraints.MinWidth = 745
  OldCreateOrder = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 0
    Top = 288
    Width = 737
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Color = clActiveBorder
    MinSize = 50
    ParentColor = False
    Visible = False
  end
  object pLog: TPanel
    Left = 0
    Top = 291
    Width = 737
    Height = 25
    Align = alBottom
    BevelInner = bvSpace
    BevelOuter = bvLowered
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Visible = False
    object mLog: TMemo
      Left = 2
      Top = 2
      Width = 733
      Height = 21
      Align = alClient
      Lines.Strings = (
        #1051#1086#1075' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090)
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object nb: TNotebook
    Left = 0
    Top = 30
    Width = 737
    Height = 258
    Align = alClient
    TabOrder = 1
    object TPage
      Left = 0
      Top = 0
      Caption = 'Prihod'
      object gbPrih: TGroupBox
        Left = 0
        Top = 0
        Width = 737
        Height = 226
        Align = alClient
        Caption = #1055#1088#1080#1093#1086#1076' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object dbgPrihod: TDBGridEh
          Left = 2
          Top = 15
          Width = 733
          Height = 209
          Align = alClient
          DataGrouping.GroupLevels = <>
          DataSource = dsPrih
          Flat = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterColor = clSilver
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clBlack
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = [fsBold]
          FooterRowCount = 1
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          RowDetailPanel.Color = clBtnFace
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlue
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnColEnter = dbgPrihodColEnter
          OnEditButtonClick = dbgPrihodEditButtonClick
          OnExit = dbgPrihodExit
          OnGetCellParams = dbgPrihodGetCellParams
          Columns = <
            item
              ButtonStyle = cbsEllipsis
              EditButtons = <>
              FieldName = 'TTN_NUM'
              Footer.Value = #1048#1090#1086#1075#1080':'
              Footer.ValueType = fvtStaticText
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103
              Title.Color = 13014532
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clYellow
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'TTN_DATE'
              Footer.ValueType = fvtCount
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1044#1072#1090#1072
              Title.Color = 13014532
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'PR_LITR'
              Footer.ValueType = fvtSum
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083'.'
              Title.Color = 13014532
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'PR_UD_WEIG'
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1055#1083#1086#1090#1085'.'
              Title.Color = 13014532
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'PR_COUNT'
              Footer.ValueType = fvtSum
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1042#1077#1089'.'
              Title.Color = 13014532
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'DOG'
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1055#1072#1088#1090#1080#1103
              Title.Color = 8421440
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'SUB_PART'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1055#1086#1076#1087#1072#1088#1090#1080#1103
              Title.Color = 8421440
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clYellow
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'NP_NAME'
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1058#1080#1087' '#1053#1055
              Title.Color = 8421440
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 160
            end
            item
              EditButtons = <>
              FieldName = 'EDIZM'
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1045#1076'. '#1048#1079#1084'.'
              Title.Color = 8421440
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'S_PRICE'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' ('#1075#1088#1085'.)'
              Title.Color = 8421440
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 60
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object pPrih: TPanel
        Left = 0
        Top = 226
        Width = 737
        Height = 32
        Align = alBottom
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          737
          32)
        object sbSumPrih: TSpeedButton
          Left = 498
          Top = 3
          Width = 25
          Height = 25
          Hint = #1042#1082#1083'/'#1086#1090#1082#1083'. '#1087#1086#1076#1089#1095#1077#1090' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
          AllowAllUp = True
          Anchors = [akRight, akBottom]
          GroupIndex = 12
          Down = True
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
          OnClick = sbSumPrihClick
        end
        object bbRealization: TBitBtn
          Left = 528
          Top = 3
          Width = 110
          Height = 25
          Action = actRash
          Anchors = [akTop, akRight]
          Caption = '&'#1056#1077#1072#1083#1080#1079#1072#1094#1080#1103
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333FF3333333333333003333
            3333333333773FF3333333333309003333333333337F773FF333333333099900
            33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
            99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
            33333333337F3F77333333333309003333333333337F77333333333333003333
            3333333333773333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          Layout = blGlyphRight
          NumGlyphs = 2
        end
        object bbCancel: TBitBtn
          Left = 643
          Top = 3
          Width = 90
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
          TabOrder = 1
          Kind = bkCancel
        end
        object p2: TPanel
          Left = 2
          Top = 2
          Width = 73
          Height = 28
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 2
          object sbDel: TSpeedButton
            Left = 45
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
          object sbAdd: TRxSpeedButton
            Left = 2
            Top = 2
            Width = 37
            Height = 25
            DropDownMenu = pmLoadPrih
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
          end
        end
        object pLoadFromFile: TPanel
          Left = 75
          Top = 2
          Width = 161
          Height = 28
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 3
          Visible = False
          object bbLoadFromFile: TBitBtn
            Left = 3
            Top = 2
            Width = 154
            Height = 25
            Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089' '#1092#1072#1081#1083#1072
            TabOrder = 0
            OnClick = bbLoadFromFileClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330FFFFF
              FFF03333337F3FFFF3F73333330F0000F0F03333337F777737373333330FFFFF
              FFF033FFFF7FFF33FFF77000000007F00000377777777FF777770BBBBBBBB0F0
              FF037777777777F7F3730B77777BB0F0F0337777777777F7F7330B7FFFFFB0F0
              0333777F333377F77F330B7FFFFFB0009333777F333377777FF30B7FFFFFB039
              9933777F333377F777FF0B7FFFFFB0999993777F33337777777F0B7FFFFFB999
              9999777F3333777777770B7FFFFFB0399933777FFFFF77F777F3070077007039
              99337777777777F777F30B770077B039993377FFFFFF77F777330BB7007BB999
              93337777FF777777733370000000073333333777777773333333}
            NumGlyphs = 2
          end
        end
        object pSectionsButton: TPanel
          Left = 258
          Top = 2
          Width = 22
          Height = 28
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 4
          Visible = False
          object sbSections: TSpeedButton
            Left = 3
            Top = 2
            Width = 15
            Height = 25
            Hint = #1042#1082#1083'/'#1086#1090#1082#1083'. '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103' '#1089#1077#1082#1094#1080#1081' '#1089' '#1087#1072#1082#1077#1090#1072
            AllowAllUp = True
            GroupIndex = 12
            Glyph.Data = {
              F6040000424DF604000000000000360400002800000009000000100000000100
              080000000000C000000000000000000000000001000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00090909001212
              12001F1F1F002C2C2C003939390045454500525252005F5F5F006C6C6C007878
              780085858500929292009F9F9F00ABABAB00B8B8B800C5C5C500D2D2D200DEDE
              DE00EBEBEB00F8F8F800F0FBFF00A4A0A000C0DCC000F0CAA60000003E000000
              5D0000007C0000009B000000BA000000D9000000F0002424FF004848FF006C6C
              FF009090FF00B4B4FF0000143E00001E5D0000287C0000329B00003CBA000046
              D9000055F000246DFF004885FF006C9DFF0090B5FF00B4CDFF00002A3E00003F
              5D0000547C0000699B00007EBA000093D90000AAF00024B6FF0048C2FF006CCE
              FF0090DAFF00B4E6FF00003E3E00005D5D00007C7C00009B9B0000BABA0000D9
              D90000F0F00024FFFF0048FFFF006CFFFF0090FFFF00B4FFFF00003E2A00005D
              3F00007C5400009B690000BA7E0000D9930000F0AA0024FFB60048FFC2006CFF
              CE0090FFDA00B4FFE600003E1400005D1E00007C2800009B320000BA3C0000D9
              460000F0550024FF6D0048FF85006CFF9D0090FFB500B4FFCD00003E0000005D
              0000007C0000009B000000BA000000D9000000F0000024FF240048FF48006CFF
              6C0090FF9000B4FFB400143E00001E5D0000287C0000329B00003CBA000046D9
              000055F000006DFF240085FF48009DFF6C00B5FF9000CDFFB4002A3E00003F5D
              0000547C0000699B00007EBA000093D90000AAF00000B6FF2400C2FF4800CEFF
              6C00DAFF9000E6FFB4003E3E00005D5D00007C7C00009B9B0000BABA0000D9D9
              0000F0F00000FFFF2400FFFF4800FFFF6C00FFFF9000FFFFB4003E2A00005D3F
              00007C5400009B690000BA7E0000D9930000F0AA0000FFB62400FFC24800FFCE
              6C00FFDA9000FFE6B4003E1400005D1E00007C2800009B320000BA3C0000D946
              0000F0550000FF6D2400FF854800FF9D6C00FFB59000FFCDB4003E0000005D00
              00007C0000009B000000BA000000D9000000F0000000FF242400FF484800FF6C
              6C00FF909000FFB4B4003E0014005D001E007C0028009B003200BA003C00D900
              4600F0005500FF246D00FF488500FF6C9D00FF90B500FFB4CD003E002A005D00
              3F007C0054009B006900BA007E00D9009300F000AA00FF24B600FF48C200FF6C
              CE00FF90DA00FFB4E6003E003E005D005D007C007C009B009B00BA00BA00D900
              D900F000F000FF24FF00FF48FF00FF6CFF00FF90FF00FFB4FF002A003E003F00
              5D0054007C0069009B007E00BA009300D900AA00F000B624FF00C248FF00CE6C
              FF00DA90FF00E6B4FF0014003E001E005D0028007C0032009B003C00BA004600
              D9005500F0006D24FF008548FF009D6CFF00B590FF00CDB4FF00030303030003
              03030300000003030303000303030300000003030300DA000303030000000303
              0300DA00030303000000030300DADADA000303000000030300DADADA00030300
              00000300DADADADADA00030000000300DADADADADA000300000000DADADADADA
              DADA0000000000000000DA0000000000000003030300DA000303030000000303
              0300DA0003030300000003030300DA0003030300000003030300DA0003030300
              000003030300DA00030303000000030303000000030303000000}
            ParentShowHint = False
            ShowHint = True
            OnClick = sbSectionsClick
          end
        end
        object pLogButton: TPanel
          Left = 236
          Top = 2
          Width = 22
          Height = 28
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 5
          Visible = False
          object sbLog: TSpeedButton
            Left = 3
            Top = 2
            Width = 15
            Height = 25
            Hint = #1042#1082#1083'/'#1086#1090#1082#1083'. '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103' '#1083#1086#1075#1072
            AllowAllUp = True
            GroupIndex = 12
            Glyph.Data = {
              F6010000424DF601000000000000360000002800000009000000100000000100
              180000000000C001000000000000000000000000000000000000008080008080
              0080800080800000000080800080800080800080800000808000808000808000
              8080000000008080008080008080008080000080800080800080800000000000
              FF000000008080008080008080000080800080800080800000000000FF000000
              008080008080008080000080800080800000000000FF0000FF0000FF00000000
              8080008080000080800080800000000000FF0000FF0000FF0000000080800080
              80000080800000000000FF0000FF0000FF0000FF0000FF000000008080000080
              800000000000FF0000FF0000FF0000FF0000FF000000008080000000000000FF
              0000FF0000FF0000FF0000FF0000FF0000FF0000000000000000000000000000
              00000000FF000000000000000000000000000080800080800080800000000000
              FF000000008080008080008080000080800080800080800000000000FF000000
              008080008080008080000080800080800080800000000000FF00000000808000
              8080008080000080800080800080800000000000FF0000000080800080800080
              80000080800080800080800000000000FF000000008080008080008080000080
              8000808000808000000000000000000000808000808000808000}
            ParentShowHint = False
            ShowHint = True
            OnClick = sbLogClick
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Rashod'
      object gbRash: TGroupBox
        Left = 0
        Top = 0
        Width = 737
        Height = 226
        Align = alClient
        Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object lAutoCalc: TLabel
          Left = 205
          Top = 0
          Width = 378
          Height = 13
          Caption = 
            '* '#1044#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1080' '#1072#1074#1090#1086#1082#1072#1083#1100#1082#1091#1083#1103#1094#1080#1080' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1087#1088#1072#1074#1091#1102' '#1082#1083#1072#1074#1080#1096#1091' '#1084#1099 +
            #1096#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbgRashod: TDBGridEh
          Left = 2
          Top = 15
          Width = 733
          Height = 209
          Hint = '(Enter)'
          Align = alClient
          DataGrouping.GroupLevels = <>
          DataSource = dsRash
          Flat = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          FooterColor = clSilver
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clBlack
          FooterFont.Height = -9
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = [fsBold]
          FooterRowCount = 3
          FrozenCols = 4
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ParentShowHint = False
          PopupMenu = pmRash
          RowDetailPanel.Color = clBtnFace
          RowHeight = 4
          RowLines = 1
          ShowHint = True
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlue
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          OnEditButtonClick = dbgRashodEditButtonClick
          OnExit = dbgRashodExit
          OnGetCellParams = dbgRashodGetCellParams
          OnKeyPress = dbgRashodKeyPress
          OnMouseMove = dbgRashodMouseMove
          Columns = <
            item
              EditButtons = <>
              FieldName = 'Part_name'
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1055#1072#1088#1090#1080#1103
              Title.Color = 8421440
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'SubPart_Name'
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1055#1086#1076#1087#1072#1088#1090#1080#1103
              Title.Color = 8421440
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'NPType_Name'
              Footers = <
                item
                  Value = #1048#1090#1086#1075#1080' '#1074#1089#1077':'
                  ValueType = fvtStaticText
                end
                item
                  Value = #1048#1090#1086#1075#1080' '#1053#1055':'
                  ValueType = fvtStaticText
                end
                item
                  Value = #1048#1090#1086#1075#1080' '#1089#1086#1087'.'#1090#1086#1074#1072#1088#1086#1074':'
                  ValueType = fvtStaticText
                end>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1058#1080#1087' '#1053#1055
              Title.Color = 8421440
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 135
            end
            item
              DisplayFormat = '0.00'
              EditButtons = <>
              FieldName = 'N_Price'
              Footers = <
                item
                  ValueType = fvtCount
                end
                item
                end
                item
                end>
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' ('#1075#1088#1085'.)'
              Title.Color = 8421440
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clYellow
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 60
            end
            item
              DisplayFormat = ',0.000'
              EditButtons = <>
              FieldName = 'Litr'
              Footers = <
                item
                  FieldName = 'Litr'
                  ValueType = fvtSum
                end
                item
                end
                item
                end>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1054#1089#1090'. ('#1083'.)'
              Title.Color = 12615808
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 70
            end
            item
              DisplayFormat = '0.0000'
              EditButtons = <>
              FieldName = 'Ud_weig'
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1055#1083#1086#1090#1085'.'
              Title.Color = 12615808
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 40
            end
            item
              DisplayFormat = ',0.000000'
              EditButtons = <>
              FieldName = 'CCount'
              Footers = <
                item
                  FieldName = 'CCount'
                  ValueType = fvtSum
                end
                item
                end
                item
                end>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1042#1077#1089' ('#1090'.)'
              Title.Color = 12615808
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 70
            end
            item
              DisplayFormat = '0.000'
              EditButtons = <>
              FieldName = 'NAL'
              Footers = <
                item
                  FieldName = 'NAL'
                  ValueType = fvtSum
                end
                item
                end
                item
                end>
              Title.Alignment = taCenter
              Title.Caption = #1047#1072' '#1085#1072#1083#1080#1095#1085#1099#1077
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 70
            end
            item
              DisplayFormat = '0.00##'
              EditButtons = <>
              FieldName = 'Nal_Money'
              Footers = <
                item
                  FieldName = 'Nal_Money'
                  ValueType = fvtSum
                end
                item
                end
                item
                end>
              Title.Alignment = taCenter
              Title.Caption = #1085#1072' '#1089#1091#1084#1084#1091
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 70
            end
            item
              ButtonStyle = cbsEllipsis
              DisplayFormat = '0.000'
              EditButtons = <>
              FieldName = 'VED'
              Footers = <
                item
                  FieldName = 'VED'
                  ValueType = fvtSum
                end
                item
                end
                item
                end>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 70
            end
            item
              ButtonStyle = cbsEllipsis
              DisplayFormat = '0.000'
              EditButtons = <>
              FieldName = 'TALON'
              Footers = <
                item
                  FieldName = 'TALON'
                  ValueType = fvtSum
                end
                item
                end
                item
                end>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1058#1072#1083#1086#1085#1099
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 70
            end
            item
              DisplayFormat = '0.000'
              EditButtons = <>
              FieldName = 'SN'
              Footers = <
                item
                  FieldName = 'SN'
                  ValueType = fvtSum
                end
                item
                end
                item
                end>
              Title.Alignment = taCenter
              Title.Caption = #1057#1086#1073'. '#1085#1091#1078#1076'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 70
            end
            item
              ButtonStyle = cbsEllipsis
              DisplayFormat = '0.000'
              EditButtons = <>
              FieldName = 'Other'
              Footers = <
                item
                  FieldName = 'Other'
                  ValueType = fvtSum
                end
                item
                end
                item
                end>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1055#1088#1086#1095#1080#1081
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 70
            end
            item
              DisplayFormat = ',0.000'
              EditButtons = <>
              FieldName = 'C_Litr'
              Footers = <
                item
                  FieldName = 'C_Litr'
                  ValueType = fvtSum
                end
                item
                end
                item
                end>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1054#1089#1090'. ('#1083'.)'
              Title.Color = 12615808
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 70
            end
            item
              DisplayFormat = ',0.000000'
              EditButtons = <>
              FieldName = 'C_count'
              Footers = <
                item
                  FieldName = 'C_count'
                  ValueType = fvtSum
                end
                item
                end
                item
                end>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1042#1077#1089' ('#1090'.)'
              Title.Color = 12615808
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 70
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object pRash: TPanel
        Left = 0
        Top = 226
        Width = 737
        Height = 32
        Hint = #1051#1086#1075' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1087#1072#1082#1077#1090#1072
        Align = alBottom
        BevelInner = bvSpace
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        DesignSize = (
          737
          32)
        object sbDelRash: TSpeedButton
          Left = 48
          Top = 3
          Width = 25
          Height = 25
          Action = actDelRash
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
        end
        object l6: TLabel
          Left = 183
          Top = 8
          Width = 24
          Height = 13
          Caption = 'N/A'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object l7: TLabel
          Left = 85
          Top = 8
          Width = 84
          Height = 13
          Caption = #1054#1073#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082' :'
        end
        object sbSumRash: TSpeedButton
          Left = 383
          Top = 3
          Width = 25
          Height = 25
          Hint = #1042#1082#1083'/'#1086#1090#1082#1083'. '#1087#1086#1076#1089#1095#1077#1090' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
          AllowAllUp = True
          Anchors = [akRight, akBottom]
          GroupIndex = 12
          Down = True
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
          OnClick = sbSumRashClick
        end
        object sbHod: TRxSpinButton
          Left = 353
          Top = 3
          Width = 25
          Height = 25
          DownGlyph.Data = {
            56000000424D56000000000000003E0000002800000006000000060000000100
            010000000000180000000000000000000000020000000200000000000000FFFF
            FF00CC0000008400000000000000CC000000CC000000CC000000}
          UpGlyph.Data = {
            56000000424D56000000000000003E0000002800000006000000060000000100
            010000000000180000000000000000000000020000000200000000000000FFFF
            FF00CC000000CC000000CC0000000000000084000000CC000000}
          Anchors = [akRight, akBottom]
          OnBottomClick = sbHodBottomClick
          OnTopClick = sbHodTopClick
        end
        object sbLoadPrihTalon: TRxSpeedButton
          Left = 5
          Top = 3
          Width = 37
          Height = 25
          DropDownMenu = pmLoadRash
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
        end
        object bbIncas: TBitBtn
          Left = 528
          Top = 3
          Width = 110
          Height = 25
          Action = actIncas
          Anchors = [akTop, akRight]
          Caption = '&'#1048#1085#1082#1072#1089#1072#1094#1080#1103
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333FF3333333333333003333
            3333333333773FF3333333333309003333333333337F773FF333333333099900
            33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
            99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
            33333333337F3F77333333333309003333333333337F77333333333333003333
            3333333333773333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          Layout = blGlyphRight
          NumGlyphs = 2
        end
        object bbPrevious: TBitBtn
          Left = 643
          Top = 3
          Width = 90
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
          TabOrder = 1
          Kind = bkCancel
        end
        object bbPrihPrev: TBitBtn
          Left = 413
          Top = 3
          Width = 110
          Height = 25
          Action = actPrih
          Anchors = [akTop, akRight]
          Caption = '&'#1055#1088#1080#1093#1086#1076
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333FF3333333333333003333333333333F77F33333333333009033
            333333333F7737F333333333009990333333333F773337FFFFFF330099999000
            00003F773333377777770099999999999990773FF33333FFFFF7330099999000
            000033773FF33777777733330099903333333333773FF7F33333333333009033
            33333333337737F3333333333333003333333333333377333333333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Money'
      object gbIncas: TGroupBox
        Left = 0
        Top = 0
        Width = 737
        Height = 226
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object sbCloseDetails: TSpeedButton
          Left = 16
          Top = 204
          Width = 180
          Height = 19
          AllowAllUp = True
          GroupIndex = 1
          Caption = 'C '#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077#1084' '#1087#1086' '#1090#1080#1087#1072#1084' '#1090#1086#1074#1072#1088#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = sbCloseDetailsClick
        end
        object gbBezNal: TGroupBox
          Left = 496
          Top = 16
          Width = 231
          Height = 182
          Caption = ' '#1044#1074#1080#1078#1077#1085#1080#1077' '#1073#1077#1079#1085#1072#1083#1080#1095#1085#1099#1093' '#1076#1077#1085#1077#1075' '
          TabOrder = 2
          object Label12: TLabel
            Left = 14
            Top = 18
            Width = 121
            Height = 13
            Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1087#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lMoneyTal: TLabel
            Left = 14
            Top = 97
            Width = 109
            Height = 13
            Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label14: TLabel
            Left = 14
            Top = 58
            Width = 164
            Height = 13
            Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1087#1086' '#1087#1088#1086#1095#1077#1081' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 14
            Top = 135
            Width = 120
            Height = 13
            Caption = #1042#1089#1077#1075#1086' '#1086#1090#1087#1091#1097#1077#1085#1086' '#1083#1080#1090#1088#1086#1074
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object CurrencyEdit5: TCurrencyEdit
            Left = 14
            Top = 34
            Width = 192
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            ZeroEmpty = False
            OnChange = ceSTARTChange
            OnKeyPress = ceSTARTKeyPress
          end
          object ceMoneyTal: TCurrencyEdit
            Left = 14
            Top = 113
            Width = 192
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            Visible = False
            ZeroEmpty = False
            OnChange = ceSTARTChange
            OnKeyPress = ceSTARTKeyPress
          end
          object CurrencyEdit7: TCurrencyEdit
            Left = 14
            Top = 74
            Width = 192
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            ZeroEmpty = False
            OnChange = ceSTARTChange
            OnKeyPress = ceSTARTKeyPress
          end
          object curAmountLitr: TCurrencyEdit
            Left = 14
            Top = 149
            Width = 192
            Height = 21
            AutoSize = False
            DecimalPlaces = 4
            DisplayFormat = ',0.0000'#39#39';-,0.0000'#39#39
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            Visible = False
            ZeroEmpty = False
            OnChange = ceSTARTChange
            OnKeyPress = ceSTARTKeyPress
          end
        end
        object gbAll: TGroupBox
          Left = 14
          Top = 15
          Width = 338
          Height = 183
          Caption = #1042#1089#1077#1075#1086' '#1087#1086' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072#1084' '#1080' '#1096#1090#1091#1095#1085#1086#1084#1091' '#1090#1086#1074#1072#1088#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label5: TLabel
            Left = 14
            Top = 18
            Width = 158
            Height = 13
            Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1089#1084#1077#1085#1099' ('#1075#1088#1085')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 14
            Top = 58
            Width = 135
            Height = 13
            Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1086#1090' '#1087#1088#1086#1076#1072#1078#1080' ('#1075#1088#1085')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 14
            Top = 98
            Width = 131
            Height = 13
            Caption = #1057#1076#1072#1085#1086' '#1074' '#1073#1072#1085#1082' ('#1082#1072#1089#1089#1091') ('#1075#1088#1085')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 14
            Top = 138
            Width = 153
            Height = 13
            Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1082#1086#1085#1077#1094' '#1089#1084#1077#1085#1099' ('#1075#1088#1085')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lRealRest: TLabel
            Left = 220
            Top = 37
            Width = 56
            Height = 13
            Caption = 'lRealRest'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object lRealKassa: TLabel
            Left = 220
            Top = 118
            Width = 64
            Height = 13
            Caption = 'lRealKassa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object lOstCapt: TLabel
            Left = 220
            Top = 21
            Width = 103
            Height = 13
            Caption = #1054#1089#1090' '#1087#1088#1086#1096#1083#1086#1081' '#1089#1084#1077#1085#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object lKassaCapt: TLabel
            Left = 220
            Top = 101
            Width = 74
            Height = 13
            Caption = #1044#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object ceSTART: TCurrencyEdit
            Left = 14
            Top = 34
            Width = 192
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ZeroEmpty = False
            OnChange = ceSTARTChange
            OnKeyPress = ceSTARTKeyPress
          end
          object ceGET: TCurrencyEdit
            Left = 14
            Top = 74
            Width = 192
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ZeroEmpty = False
            OnChange = ceSTARTChange
          end
          object ceOUT: TCurrencyEdit
            Left = 14
            Top = 114
            Width = 192
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ZeroEmpty = False
            OnChange = ceSTARTChange
          end
          object ceEND: TCurrencyEdit
            Left = 14
            Top = 154
            Width = 192
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            ZeroEmpty = False
          end
        end
        object gbSM: TGroupBox
          Left = 358
          Top = 228
          Width = 370
          Height = 170
          Caption = #1042' '#1090'.'#1095'. '#1096#1090#1091#1095#1085#1099#1081' '#1090#1086#1074#1072#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          Visible = False
          object Label17: TLabel
            Left = 14
            Top = 92
            Width = 131
            Height = 13
            Caption = #1057#1076#1072#1085#1086' '#1074' '#1073#1072#1085#1082' ('#1082#1072#1089#1089#1091') ('#1075#1088#1085')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 14
            Top = 55
            Width = 138
            Height = 13
            Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1086#1090' '#1087#1088#1086#1076#1072#1078#1080' ('#1075#1088#1085'):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label22: TLabel
            Left = 14
            Top = 126
            Width = 156
            Height = 13
            Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1082#1086#1085#1077#1094' '#1089#1084#1077#1085#1099' ('#1075#1088#1085'):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label23: TLabel
            Left = 14
            Top = 18
            Width = 158
            Height = 13
            Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1089#1084#1077#1085#1099' ('#1075#1088#1085')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object OilHelpButton: TOilHelpButton
            Left = 337
            Top = 138
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
              
                '{12}{RED}\B'#1042#1077#1076#1077#1085#1080#1077' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1087#1086' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072#1084' '#1080' '#1096#1090#1091#1095#1085#1086#1084#1091' '#1090#1086#1074#1072#1088#1091' ' +
                '\D{10}'
              ''
              '    '#1056#1077#1078#1080#1084' '#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074'  '#1080' '#1080#1085#1082#1072#1089#1089#1072#1094#1080#1081' '#1074' '#1073#1072#1085#1082' '#1087#1086
              
                #1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072#1084' '#1080' '#1096#1090#1091#1095#1085#1086#1084#1091' '#1090#1086#1074#1072#1088#1091' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1080#1089#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086' '#1080#1089#1093#1086 +
                #1076#1103
              
                #1080#1079' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1074#1099#1087#1086#1083#1085#1103#1090#1100' '#1090#1072#1082#1091#1102' '#1086#1087#1077#1088#1072#1094#1080#1102'. '#1042' '#1076#1072#1085#1085#1086 +
                #1084
              
                #1089#1083#1091#1095#1072#1077' '#1082#1085#1086#1087#1082#1072' "'#1089' '#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077#1084' '#1087#1086' '#1090#1080#1087#1072#1084' '#1090#1086#1074#1072#1088#1072'" '#1076#1086#1083#1078#1085#1072' '#1073#1099#1090#1100' '#1086#1090#1078#1072#1090#1072 +
                '.'
              ''
              
                '    '#1042' '#1089#1083#1091#1095#1072#1077', '#1077#1089#1083#1080' '#1080#1085#1082#1072#1089#1089#1072#1094#1080#1103' '#1076#1077#1085#1077#1075' '#1080#1079' '#1082#1072#1089#1089#1099' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1089#1103' '#1086#1090#1076#1077#1083#1100 +
                #1085#1086
              
                #1087#1086' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072#1084' '#1080' '#1096#1090'. '#1090#1086#1074#1072#1088#1091', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074' '#1082#1072#1078#1076#1086#1084' '#1089#1084#1077#1085#1085#1086#1084' '#1086#1090#1095#1077 +
                #1090#1077
              '('#1087#1086#1089#1083#1077' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' '#1074#1077#1088#1089#1080#1080' 100) '#1087#1086#1076#1089#1095#1080#1090#1099#1074#1072#1090#1100' '#1080' '#1074#1085#1086#1089#1080#1090#1100' '#1080#1085#1082#1072#1089#1089#1072#1094#1080#1102' '#1089
              
                #1086#1089#1090#1072#1090#1082#1072#1084#1080'. '#1042' '#1076#1072#1085#1085#1086#1084' '#1089#1083#1091#1095#1072#1077' '#1082#1085#1086#1087#1082#1072' "'#1089' '#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077#1084' '#1087#1086' '#1090#1080#1087#1072#1084' '#1090#1086#1074#1072#1088#1072 +
                '"'
              #1076#1086#1083#1078#1085#1072' '#1073#1099#1090#1100' '#1085#1072#1078#1072#1090#1072'.'
              ''
              '    '#1042' '#1086#1090#1095#1077#1090#1072#1093' '#1080' '#1087#1088#1086#1074#1077#1088#1082#1072#1093' '#1080#1089#1087#1086#1083#1100#1079#1091#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1086#1073#1097#1080#1077' '#1080#1090#1086#1075#1080
              '('#1073#1077#1079' '#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103'). '#1053#1077#1074#1077#1076#1077#1085#1080#1077' '#1086#1090#1076#1077#1083#1100#1085#1086' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1087#1086' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072#1084
              #1080' '#1096#1090'. '#1090#1086#1074#1072#1088#1091' '#1085#1077' '#1087#1088#1080#1074#1077#1076#1077#1090' '#1082' '#1080#1089#1082#1072#1078#1077#1085#1080#1102' '#1086#1090#1095#1077#1090#1086#1074' '#1080' '#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085#1080#1102
              #1087#1088#1086#1074#1077#1088#1086#1082'.')
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
          object cedShtukiKassa: TCurrencyEdit
            Left = 14
            Top = 106
            Width = 192
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ZeroEmpty = False
            OnChange = cedOstBeginShtChange
          end
          object cedShtukiSum: TCurrencyEdit
            Left = 14
            Top = 69
            Width = 192
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            ZeroEmpty = False
          end
          object cedOstEndSht: TCurrencyEdit
            Left = 14
            Top = 140
            Width = 192
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            ZeroEmpty = False
          end
          object cedOstBeginSht: TCurrencyEdit
            Left = 14
            Top = 31
            Width = 193
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ZeroEmpty = False
            OnChange = cedOstBeginShtChange
          end
        end
        object gbNp: TGroupBox
          Left = 14
          Top = 228
          Width = 338
          Height = 170
          Caption = #1042' '#1090'.'#1095'. '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1099
          TabOrder = 3
          Visible = False
          object Label20: TLabel
            Left = 14
            Top = 16
            Width = 158
            Height = 13
            Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1089#1084#1077#1085#1099' ('#1075#1088#1085')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label21: TLabel
            Left = 14
            Top = 91
            Width = 131
            Height = 13
            Caption = #1057#1076#1072#1085#1086' '#1074' '#1073#1072#1085#1082' ('#1082#1072#1089#1089#1091') ('#1075#1088#1085')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label19: TLabel
            Left = 14
            Top = 55
            Width = 138
            Height = 13
            Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1086#1090' '#1087#1088#1086#1076#1072#1078#1080' ('#1075#1088#1085'):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label15: TLabel
            Left = 14
            Top = 126
            Width = 156
            Height = 13
            Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1082#1086#1085#1077#1094' '#1089#1084#1077#1085#1099' ('#1075#1088#1085'):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cedOstBeginNp: TCurrencyEdit
            Left = 14
            Top = 29
            Width = 193
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ZeroEmpty = False
            OnChange = cedOstBeginNpChange
          end
          object cedNPKassa: TCurrencyEdit
            Left = 14
            Top = 105
            Width = 193
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ZeroEmpty = False
            OnChange = cedOstBeginNpChange
          end
          object cedNpSum: TCurrencyEdit
            Left = 14
            Top = 70
            Width = 192
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            ZeroEmpty = False
          end
          object cedOstEndNp: TCurrencyEdit
            Left = 14
            Top = 139
            Width = 192
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            ZeroEmpty = False
          end
        end
        object gbStrPol: TGroupBox
          Left = 358
          Top = 16
          Width = 133
          Height = 182
          Caption = #1057#1090#1088#1072#1093#1086#1074#1099#1077' '#1087#1086#1083#1080#1089#1099
          TabOrder = 1
          object Label24: TLabel
            Left = 14
            Top = 18
            Width = 75
            Height = 13
            Caption = #1042#1099#1088#1091#1095#1077#1085#1086' ('#1075#1088#1085')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cedAddMoney: TCurrencyEdit
            Left = 14
            Top = 34
            Width = 104
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ZeroEmpty = False
            OnChange = cedAddMoneyChange
          end
        end
      end
      object pSave: TPanel
        Left = 0
        Top = 226
        Width = 737
        Height = 32
        Hint = #1051#1086#1075' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1087#1072#1082#1077#1090#1072
        Align = alBottom
        BevelInner = bvSpace
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        DesignSize = (
          737
          32)
        object bbRashPrev: TBitBtn
          Left = 413
          Top = 3
          Width = 110
          Height = 25
          Action = actRash
          Anchors = [akTop, akRight]
          Caption = '&'#1056#1077#1072#1083#1080#1079#1072#1094#1080#1103
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333FF3333333333333003333333333333F77F33333333333009033
            333333333F7737F333333333009990333333333F773337FFFFFF330099999000
            00003F773333377777770099999999999990773FF33333FFFFF7330099999000
            000033773FF33777777733330099903333333333773FF7F33333333333009033
            33333333337737F3333333333333003333333333333377333333333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
        end
        object bbCloseSR: TBitBtn
          Left = 643
          Top = 3
          Width = 90
          Height = 25
          Anchors = [akTop, akRight]
          Cancel = True
          Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
          ModalResult = 2
          TabOrder = 1
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
        object bbOk: TBitBtn
          Left = 528
          Top = 3
          Width = 110
          Height = 25
          Action = actSave
          Anchors = [akTop, akRight]
          Caption = '&'#1055#1088#1080#1085#1103#1090#1100
          ModalResult = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
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
      end
    end
  end
  object pData: TPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 30
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object l1: TLabel
      Left = 4
      Top = 7
      Width = 73
      Height = 13
      Caption = #1044#1072#1090#1072'/'#1042#1088#1077#1084#1103' '#1089
    end
    object l3: TLabel
      Left = 289
      Top = 7
      Width = 21
      Height = 13
      Caption = #1040#1047#1057
    end
    object l4: TLabel
      Left = 541
      Top = 7
      Width = 49
      Height = 13
      Caption = #1054#1087#1077#1088#1072#1090#1086#1088
    end
    object l5: TLabel
      Left = 475
      Top = 7
      Width = 33
      Height = 13
      Caption = 'C'#1084#1077#1085#1072
    end
    object l2: TLabel
      Left = 400
      Top = 7
      Width = 43
      Height = 13
      Caption = #1054#1090#1095#1077#1090' '#8470
    end
    object l8: TLabel
      Left = 174
      Top = 7
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object dbeSmenaNum: TDBEdit
      Left = 511
      Top = 4
      Width = 21
      Height = 21
      DataField = 'SMENA_NUM'
      DataSource = SRepRefForm.ds
      TabOrder = 4
      OnKeyPress = dbeSmenaNumKeyPress
    end
    object dbceAZSName: TRxDBComboEdit
      Left = 313
      Top = 4
      Width = 80
      Height = 21
      DataField = 'AZS_NAME'
      DataSource = SRepRefForm.ds
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = dbceAZSNameDblClick
      OnDblClick = dbceAZSNameDblClick
    end
    object dbceEmpName: TRxDBComboEdit
      Left = 593
      Top = 4
      Width = 141
      Height = 21
      DataField = 'EMP_NAME'
      DataSource = SRepRefForm.ds
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = dbceEmpNameDblClick
      OnDblClick = dbceEmpNameDblClick
    end
    object dbeRepNum: TDBEdit
      Left = 445
      Top = 4
      Width = 21
      Height = 21
      DataField = 'REP_NUM'
      DataSource = SRepRefForm.ds
      TabOrder = 3
    end
    object dbdeRepDateEnd: TDBDateTimeEditEh
      Left = 189
      Top = 4
      Width = 92
      Height = 21
      Hint = 'Alt+Down'
      DataField = 'REP_DATE_END_REAL'
      DataSource = SRepRefForm.ds
      EditButton.Visible = False
      EditButtons = <>
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnEnter = dbdeRepDateEndEnter
      OnExit = dbdeRepDateEndExit
      EditFormat = 'DD.MM.YYYY HH:NN'
    end
    object dbdeRepDate: TDBDateTimeEditEh
      Left = 80
      Top = 4
      Width = 92
      Height = 21
      Hint = 'Alt+Down'
      DataField = 'REP_DATE'
      DataSource = SRepRefForm.ds
      EditButton.Visible = False
      EditButtons = <>
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnEnter = dbdeRepDateEnter
      OnExit = dbdeRepDateExit
      EditFormat = 'DD.MM.YYYY HH:NN'
    end
  end
  object pSections: TPanel
    Left = 0
    Top = 316
    Width = 737
    Height = 150
    Align = alBottom
    BevelInner = bvSpace
    BevelOuter = bvLowered
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Visible = False
    object p1: TPanel
      Left = 148
      Top = 2
      Width = 587
      Height = 146
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      object dbgSections: TDBGridEh
        Left = 1
        Top = 1
        Width = 585
        Height = 144
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = dsSectionsSQL
        Flat = False
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
        FooterRowCount = 1
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
        ParentFont = False
        ReadOnly = True
        RowDetailPanel.Color = clBtnFace
        RowHeight = 4
        RowLines = 1
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object bbSectionPrint: TBitBtn
      Left = 6
      Top = 32
      Width = 140
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 1
      OnClick = bbSectionPrintClick
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
    object dblcSections: TRxDBLookupCombo
      Left = 6
      Top = 6
      Width = 140
      Height = 21
      DropDownCount = 20
      LookupField = 'SECTION_NAME'
      LookupSource = dsSections
      TabOrder = 0
      OnChange = dblcSectionsCloseUp
    end
  end
  object Table2: TVirtualTable
    AfterEdit = Table2AfterEdit
    BeforePost = Table2BeforePost
    AfterPost = Table2AfterPost
    OnCalcFields = Table2CalcFields
    OnFilterRecord = Table2FilterRecord
    FieldDefs = <
      item
        Name = 'IsShtuki'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TTN_Date'
        DataType = ftDate
      end
      item
        Name = 'TTN_ID'
        DataType = ftInteger
      end
      item
        Name = 'TTN_INST'
        DataType = ftInteger
      end
      item
        Name = 'Part_name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SubPart_Name'
        DataType = ftInteger
      end
      item
        Name = 'NPType_Name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NP_GRP'
        DataType = ftInteger
      end
      item
        Name = 'NP_TYPE_ID'
        DataType = ftInteger
      end
      item
        Name = 'Goal_Part_Type'
        DataType = ftInteger
      end
      item
        Name = 'Us_SubGroup_Id'
        DataType = ftInteger
      end
      item
        Name = 'bSkidka'
        DataType = ftBoolean
      end
      item
        Name = 'bEdited'
        DataType = ftBoolean
      end
      item
        Name = 'Own_good'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Ud_weig'
        DataType = ftFloat
      end
      item
        Name = 'N_Price'
        DataType = ftFloat
      end
      item
        Name = 'NAL'
        DataType = ftFloat
      end
      item
        Name = 'Nal_Money'
        DataType = ftCurrency
      end
      item
        Name = 'VED'
        DataType = ftFloat
      end
      item
        Name = 'TALON'
        DataType = ftFloat
      end
      item
        Name = 'SN'
        DataType = ftFloat
      end
      item
        Name = 'Other'
        DataType = ftFloat
      end
      item
        Name = 'Other_Weight'
        DataType = ftFloat
      end
      item
        Name = 'Litr'
        DataType = ftFloat
      end
      item
        Name = 'Base'
        DataType = ftFloat
      end
      item
        Name = 'CCount'
        DataType = ftFloat
      end>
    Left = 504
    Top = 331
    Data = {
      03001A0008004973536874756B690100010000000000080054544E5F44617465
      0900000000000000060054544E5F49440300000000000000080054544E5F494E
      535403000000000000000900506172745F6E616D6501003200000000000C0053
      7562506172745F4E616D6503000000000000000B004E50547970655F4E616D65
      010032000000000006004E505F47525003000000000000000A004E505F545950
      455F494403000000000000000E00476F616C5F506172745F5479706503000000
      000000000E0055735F53756247726F75705F4964030000000000000007006253
      6B69646B61050000000000000007006245646974656405000000000000000800
      4F776E5F676F6F640100010000000000070055645F7765696706000000000000
      0007004E5F5072696365060000000000000003004E414C060000000000000009
      004E616C5F4D6F6E657907000000000000000300564544060000000000000005
      0054414C4F4E06000000000000000200534E060000000000000005004F746865
      7206000000000000000C004F746865725F576569676874060000000000000004
      004C69747206000000000000000400426173650600000000000000060043436F
      756E740600000000000000000000000000}
    object Table2IsShtuki: TStringField
      FieldName = 'IsShtuki'
      Size = 1
    end
    object Table2TTN_Date: TDateField
      FieldName = 'TTN_Date'
    end
    object Table2TTN_ID: TIntegerField
      FieldName = 'TTN_ID'
    end
    object Table2TTN_INST: TIntegerField
      FieldName = 'TTN_INST'
    end
    object Table2Part_name: TStringField
      FieldName = 'Part_name'
      Size = 50
    end
    object Table2SubPart_Name: TIntegerField
      FieldName = 'SubPart_Name'
    end
    object Table2NPType_Name: TStringField
      FieldName = 'NPType_Name'
      Size = 50
    end
    object Table2NP_GRP: TIntegerField
      FieldName = 'NP_GRP'
    end
    object Table2NP_TYPE_ID: TIntegerField
      FieldName = 'NP_TYPE_ID'
    end
    object Table2Goal_Part_Type: TIntegerField
      FieldName = 'Goal_Part_Type'
    end
    object Table2Us_SubGroup_Id: TIntegerField
      FieldName = 'Us_SubGroup_Id'
    end
    object Table2bSkidka: TBooleanField
      FieldName = 'bSkidka'
    end
    object Table2bEdited: TBooleanField
      FieldName = 'bEdited'
    end
    object Table2Own_good: TStringField
      FieldName = 'Own_good'
      Size = 1
    end
    object Table2Ud_weig: TFloatField
      FieldName = 'Ud_weig'
      DisplayFormat = '0.0000'
    end
    object Table2N_Price: TFloatField
      FieldName = 'N_Price'
      DisplayFormat = '0.00'
    end
    object Table2NAL: TFloatField
      FieldName = 'NAL'
      OnValidate = Table2NALValidate
      DisplayFormat = '0.000'
      EditFormat = '0.######'
    end
    object Table2Nal_Money: TCurrencyField
      FieldName = 'Nal_Money'
      DisplayFormat = '0.00##'
      currency = False
    end
    object Table2VED: TFloatField
      FieldName = 'VED'
      DisplayFormat = '0.000'
    end
    object Table2TALON: TFloatField
      FieldName = 'TALON'
      DisplayFormat = '0.000'
    end
    object Table2SN: TFloatField
      FieldName = 'SN'
      DisplayFormat = '0.000'
    end
    object Table2Other: TFloatField
      FieldName = 'Other'
      DisplayFormat = '0.000'
    end
    object Table2Other_Weight: TFloatField
      FieldName = 'Other_Weight'
      DisplayFormat = '0.000'
    end
    object Table2Litr: TFloatField
      FieldName = 'Litr'
      DisplayFormat = ',0.000'
    end
    object Table2Base: TFloatField
      FieldName = 'Base'
    end
    object Table2C_count: TFloatField
      FieldKind = fkCalculated
      FieldName = 'C_count'
      DisplayFormat = ',0.000000'
      Calculated = True
    end
    object Table2C_Litr: TFloatField
      FieldKind = fkCalculated
      FieldName = 'C_Litr'
      DisplayFormat = ',0.000'
      Calculated = True
    end
    object Table2CCount: TFloatField
      FieldName = 'CCount'
      DisplayFormat = ',0.000000'
    end
  end
  object dsRash: TDataSource
    DataSet = Table2
    Left = 518
    Top = 323
  end
  object pmRash: TPopupMenu
    OnPopup = pmRashPopup
    Left = 370
    Top = 74
    object N1: TMenuItem
      Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1089' '#1085#1086#1074#1086#1081' '#1094#1077#1085#1086#1081
      Visible = False
    end
    object N2: TMenuItem
      Action = actFilter
    end
    object N3: TMenuItem
      Caption = #1040#1074#1090#1086#1082#1072#1083#1100#1082#1091#1083#1103#1094#1080#1103
      OnClick = N3Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object miOnlyRash: TMenuItem
      Caption = #1058#1086#1083#1100#1082#1086' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1103
      OnClick = miOnlyRashClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object Excel1: TMenuItem
      Caption = #1042#1099#1074#1077#1089#1090#1080' '#1074' Excel'
      OnClick = Excel1Click
    end
  end
  object Table3: TTable
    TableName = 'Oil_Vedomost.DB'
    Left = 120
    Top = 115
  end
  object Table4: TTable
    TableName = 'Oil_SRTalon.DB'
    Left = 176
    Top = 115
  end
  object Table5: TTable
    TableName = 'OIL_SROther.db'
    Left = 240
    Top = 115
  end
  object qPriv: TQuery
    Left = 24
    Top = 69
  end
  object qRashAddPART: TOilQuery
    ParamCheck = False
    SQL.Strings = (
      'select /*+ORDERED*/'
      ' Q.ttn_id,'
      ' Q.ttn_inst,'
      ' p.dog as ttn_dog,'
      ' dim.IsShtuki,'
      ' Q.sub_part,'
      ' 0 as s_price,'
      ' p.own_goods,'
      ' p.goal_part_type,'
      ' r.ttn_date,'
      ' npt.np_grp as ttn_np_grp_id,'
      ' dim.name as ttn_edizm,'
      ' decode(dim.IsShtuki, '#39'Y'#39', 1, 0) as Base_,'
      ' npt.id as np_type_id,'
      ' npt.us_subgroup_id,'
      ' npt.name as ttn_np_name,'
      ' Q.ostatok_L,'
      ' r.ud_weig,'
      ' Q.ostatok_T'
      '  from (select dr.ttn_id,'
      '               dr.ttn_inst,'
      '               dr.sub_part,'
      '               sum(dr.pr_litr) -'
      
        '               sum(nvl(dr.out_nal_litr, 0) + nvl(dr.out_ved_litr' +
        ', 0) +'
      
        '                   nvl(dr.out_talon_litr, 0) + nvl(dr.out_sn_lit' +
        'r, 0) +'
      '                   nvl(dr.out_litr, 0)) as ostatok_L,'
      '               sum(dr.pr_count) -'
      
        '               sum(nvl(dr.out_nal_count, 0) + nvl(dr.out_ved_cou' +
        'nt, 0) +'
      
        '                   nvl(dr.out_talon_count, 0) + nvl(dr.out_sn_co' +
        'unt, 0) +'
      '                   nvl(dr.out_count, 0)) as ostatok_T'
      '          from oil_dr_data dr, oil_daily_rep drep'
      '         where dr.state = '#39'Y'#39
      '           and drep.state = '#39'Y'#39
      '           and dr.rep_id = drep.id'
      '           and dr.rep_inst = drep.inst'
      '           and drep.azs_id = :p_azs_id'
      '           and drep.azs_inst = :p_azs_id'
      
        '           and (dr.oper_type in (0, 1) and drep.rep_date < :p_re' +
        'p_date or'
      '               dr.oper_type = 0 and drep.rep_date = :p_rep_date)'
      '         group by dr.ttn_id, dr.ttn_inst, dr.sub_part) Q,'
      '       oil_rashod r,'
      '       oil_part p,'
      '       v_oil_np_type npt,'
      '       v_oil_dim dim'
      ' where Q.ttn_id = r.id'
      '   and Q.ttn_inst = r.inst'
      '   and (Q.ostatok_L <> 0 or Q.ostatok_T <> 0)'
      '   and r.part_id = p.id'
      '   and r.part_inst = p.inst'
      '   and p.np_type = npt.id'
      '   and p.dim_id = dim.id'
      '   and r.state = '#39'Y'#39
      '   and p.state = '#39'Y'#39
      ' order by dim.IsShtuki, r.ttn_date')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 508
    Top = 377
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_azs_id'
      end
      item
        DataType = ftDateTime
        Name = 'p_rep_date'
      end>
  end
  object qRashEditPART: TOilQuery
    ParamCheck = False
    SQL.Strings = (
      'select /*+ORDERED*/'
      ' Q.ttn_id,'
      ' Q.ttn_inst,'
      ' p.dog as ttn_dog,'
      ' dim.IsShtuki,'
      ' Q.sub_part,'
      ' Q.s_price,'
      ' p.own_goods,'
      ' p.goal_part_type,'
      ' r.ttn_date,'
      ' npt.np_grp as ttn_np_grp_id,'
      ' npt.us_subgroup_id,'
      ' dim.name as ttn_edizm,'
      ' decode(dim.IsShtuki, '#39'Y'#39', 1, 0) as Base_,'
      ' npt.id as np_type_id,'
      ' npt.name as ttn_np_name,'
      ' r.ud_weig,'
      ' Ostatok_L,'
      ' Ostatok_T,'
      ' out_nal_litr,'
      ' out_nal_money,'
      ' out_ved_litr,'
      ' out_ved_money,'
      ' out_talon_litr,'
      ' out_sn_litr,'
      ' out_litr,'
      ' out_count'
      '  from (select ttn_id,'
      '               ttn_inst,'
      '               sub_part,'
      '               sum(IsCurDay * s_price) as s_price,'
      
        '               sum((1 - IsCurDay) * (pr_litr - out_nal_litr - ou' +
        't_ved_litr -'
      
        '                   out_talon_litr - out_sn_litr - out_litr)) as ' +
        'Ostatok_L,'
      '               sum((1 - IsCurDay) *'
      '                   (pr_count - out_nal_count - out_ved_count -'
      
        '                   out_talon_count - out_sn_count - out_count)) ' +
        'as Ostatok_T,'
      '               sum(IsCurDay * out_nal_litr) as out_nal_litr,'
      '               sum(IsCurDay * out_nal_money) as out_nal_money,'
      '               sum(IsCurDay * out_ved_litr) as out_ved_litr,'
      '               sum(IsCurDay * out_ved_money) as out_ved_money,'
      '               sum(IsCurDay * out_talon_litr) as out_talon_litr,'
      '               sum(IsCurDay * out_sn_litr) as out_sn_litr,'
      '               sum(IsCurDay * out_litr) as out_litr,'
      '               sum(IsCurDay * out_count) as out_count'
      '          from (select dr.id,'
      '                       dr.inst,'
      '                       dr.ttn_id,'
      '                       dr.ttn_inst,'
      '                       dr.sub_part,'
      '                       dr.s_price,'
      
        '                       decode(drep.rep_date, :p_rep_date, 1, 0) ' +
        '*'
      '                       sign(dr.oper_type) as IsCurDay,'
      '                       nvl(dr.pr_litr, 0) as pr_litr,'
      '                       nvl(dr.out_nal_litr, 0) as out_nal_litr,'
      '                       nvl(dr.out_ved_litr, 0) as out_ved_litr,'
      
        '                       nvl(dr.out_talon_litr, 0) as out_talon_li' +
        'tr,'
      '                       nvl(out_sn_litr, 0) as out_sn_litr,'
      '                       nvl(out_litr, 0) as out_litr,'
      '                       nvl(dr.pr_count, 0) as pr_count,'
      
        '                       nvl(dr.out_nal_count, 0) as out_nal_count' +
        ','
      
        '                       nvl(dr.out_ved_count, 0) as out_ved_count' +
        ','
      
        '                       nvl(dr.out_talon_count, 0) as out_talon_c' +
        'ount,'
      '                       nvl(out_sn_count, 0) as out_sn_count,'
      '                       nvl(out_count, 0) as out_count,'
      '                       nvl(out_nal_money, 0) as out_nal_money,'
      '                       nvl(out_ved_money, 0) as out_ved_money'
      '                  from oil_dr_data dr, oil_daily_rep drep'
      '                 where dr.state = '#39'Y'#39
      '                   and drep.state = '#39'Y'#39
      '                   and dr.rep_id = drep.id'
      '                   and dr.rep_inst = drep.inst'
      '                   and drep.azs_id = :p_azs_id'
      '                   and drep.azs_inst = :p_azs_id'
      '                   and (dr.oper_type in (0, 1) and'
      '                       drep.rep_date <= :p_rep_date or'
      
        '                       dr.oper_type = 2 and drep.rep_date = :p_r' +
        'ep_date))'
      '         group by ttn_id, ttn_inst, sub_part) Q,'
      '       oil_rashod r,'
      '       oil_part p,'
      '       v_oil_np_type npt,'
      '       v_oil_dim dim'
      ' where Q.ttn_id = r.id'
      '   and Q.ttn_inst = r.inst'
      '   and r.part_id = p.id'
      '   and r.part_inst = p.inst'
      '   and p.np_type = npt.id'
      '   and p.dim_id = dim.id'
      '   and r.state = '#39'Y'#39
      '   and p.state = '#39'Y'#39
      '   and s_price <> -1'
      '   and (Ostatok_L <> 0 or Ostatok_T <> 0 or out_nal_litr <> 0 or'
      
        '       out_nal_money <> 0 or out_ved_litr <> 0 or out_ved_money ' +
        '<> 0 or'
      
        '       out_talon_litr <> 0 or out_sn_litr <> 0 or out_litr <> 0 ' +
        'or'
      '       out_count <> 0)'
      ' order by dim.IsShtuki, r.ttn_date')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 425
    Top = 377
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_rep_date'
      end
      item
        DataType = ftUnknown
        Name = 'p_azs_id'
      end>
  end
  object qRashTalon: TOilQuery
    ParamCheck = False
    SQL.Strings = (
      'select /*+ORDERED USE_MERGE(TalPrih, DRData)*/'
      ' DrData.TTN_Id,'
      ' DrData.TTN_Inst,'
      ' DrData.Sub_Part,'
      ' DrData.Ser,'
      ' DrData.Num,'
      ' DrData.Litr,'
      ' DrData.Count_T,'
      ' DrData.Price,'
      ' nvl(TalPrih.NPGrp_Id, DrData.NPGrp_Id) as NPGrp_Id,'
      ' TalPrih.Auto_Id,'
      ' TalPrih.Auto_Inst,'
      ' TalPrih.Employ_Id,'
      ' TalPrih.Employ_Inst,'
      ' DrData.InTheWay'
      '  from (select /*+ORDERED NO_MERGE USE_NL(drd, srt, r, p) */'
      '         drd.TTN_Id,'
      '         drd.TTN_Inst,'
      '         drd.Sub_Part,'
      '         srt.Ser,'
      '         srt.Num,'
      '         decode(substr(srt.Ser, 1, 1),'
      '                '#39'A'#39', decode(length(srt.Num), 9, 5, 4),'
      '                '#39'B'#39', 6,'
      '                '#39'C'#39', 7,'
      '                '#39'E'#39', 10,'
      '                '#39'D'#39', 3,'
      '                '#39'F'#39', 62) as NPGrp_Id,'
      '         srt.Litr,'
      '         srt.InTheWay,'
      '         srt.count_t,'
      '         Round((p.SS * r.Ud_Weig) / 1000, 2) as Price'
      
        '          FROM Oil_DR_Data drd, Oil_SRTalon srt, Oil_Rashod r, O' +
        'il_Part p'
      '         WHERE drd.State = '#39'Y'#39
      '           and srt.State = '#39'Y'#39
      '           and drd.Rep_Id = :Rep_id'
      '           and drd.Rep_Inst = :Rep_inst'
      '           and drd.Id = srt.SRep_Id'
      '           and drd.Inst = srt.SRep_Inst'
      '           and r.Id = drd.Ttn_Id'
      '           and r.Inst = drd.Ttn_Inst'
      '           and p.Id = r.Part_Id'
      '           and p.Inst = r.Part_Inst) DrData,'
      '       (select TD.Ser,'
      '               TD.Num,'
      '               to_number(null) as auto_id,'
      '               to_number(null) as auto_inst,'
      '               TD.Employ_Id,'
      '               TD.Employ_Inst,'
      '               TD.Npgrp_Id'
      '          from Oil_Talon_Prih T, Oil_Talon_Data TD'
      '         where T.State = '#39'Y'#39
      '           and TD.State = '#39'Y'#39
      '           and T.Id = TD.Head_Id'
      '           and T.Inst = TD.Head_Inst'
      '           and T.SRep_Id = :Rep_id'
      '           and T.SRep_Inst = :Rep_inst) TalPrih'
      ' where DRData.Ser = TalPrih.Ser(+)'
      '   and DRData.Num = TalPrih.Num(+)')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 179
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep_id'
      end
      item
        DataType = ftUnknown
        Name = 'Rep_inst'
      end>
  end
  object qRashOther: TOilQuery
    ParamCheck = False
    SQL.Strings = (
      'select /*+ORDERED*/'
      ' dr.ttn_id,'
      ' dr.ttn_inst,'
      ' sr.oper_id,'
      ' op.name        as oper_name,'
      ' sr.litr,'
      ' sr.price,'
      ' sr.count_t,'
      ' sr.org_id,'
      ' sr.org_inst,'
      ' org.name       as org_name,'
      ' sr.Auto_Id,'
      ' sr.Auto_Inst,'
      ' sr.Employ_Id,'
      ' sr.Employ_Inst,'
      ' sr.SC_Number,'
      ' sr.SC_Rest,'
      ' sr.SC_Cheque,'
      ' sr.Dog_Id,'
      ' sr.Amount,'
      ' sr.Dog_Inst'
      
        '  from oil_dr_data dr, oil_srother sr, v_org org, oil_oper_type ' +
        'op'
      ' where dr.State = '#39'Y'#39
      '   and dr.rep_id = :Rep_id'
      '   and dr.rep_inst = :Rep_inst'
      '   and dr.oper_type = 1'
      '   and sr.State = '#39'Y'#39
      '   and sr.srep_id = dr.id'
      '   and sr.srep_inst = dr.inst'
      '   and sr.org_id = org.id(+)'
      '   and sr.org_inst = org.inst(+)'
      '   and sr.oper_id = op.id'
      ' order by sr.oper_id')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 240
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep_id'
      end
      item
        DataType = ftUnknown
        Name = 'Rep_inst'
      end>
  end
  object qWork: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 24
    Top = 161
  end
  object qPrih: TOilQuery
    SQL.Strings = (
      'select /*+ordered use_nl(b)*/'
      ' drd.*,'
      ' p.dog,'
      ' p.own_goods,'
      ' r.ttn_num,'
      ' r.ttn_date,'
      ' decode(r.group_num,'
      '        null,'
      '        npt.name,'
      
        '        decode(npt.codavias, null, '#39#39', npt.codavias || '#39': '#39') || ' +
        'npt.name) as np_name,'
      ' dim.name as edizm,'
      ' decode(dim.isshtuki, '#39'Y'#39', 1, 0) as base_,'
      ' p.own_goods,'
      ' npt.grp_id as np_grp_id,'
      ' npt.us_subgroup_id'
      '  from oil_dr_data drd,'
      '       oil_rashod  r,'
      '       oil_part    p,'
      '       oil_np_type npt,'
      '       v_oil_dim   dim'
      ' where drd.rep_id = :id'
      '   and drd.rep_inst = :inst'
      '   and drd.state = '#39'Y'#39
      '   and drd.oper_type = 0'
      '   and r.id = drd.ttn_id'
      '   and r.inst = drd.ttn_inst'
      '   and r.part_id = p.id'
      '   and r.part_inst = p.inst'
      '   and p.np_type = npt.id'
      '   and p.dim_id = dim.id')
    CachedUpdates = True
    UpdateObject = uPrih
    AfterPost = qPrihAfterPost
    BeforeDelete = qPrihBeforeDelete
    AfterDelete = qPrihAfterPost
    OnFilterRecord = qPrihFilterRecord
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 603
    Top = 180
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
      end
      item
        DataType = ftInteger
        Name = 'INST'
      end>
  end
  object dsPrih: TOraDataSource
    DataSet = qPrih
    Left = 617
    Top = 164
  end
  object qCheckDoublePrih: TOilQuery
    SQL.Strings = (
      'select /*+ORDERED USE_NL(r)*/'
      ' r.TTN_Num'
      '  from (select /*+ORDERED NO_MERGE USE_NL(drd)*/'
      '         CurPrih.TTN_Id, CurPrih.TTN_Inst'
      '          from (select /*+NO_MERGE*/'
      '                 TTN_Id, TTN_Inst'
      '                  from Oil_DR_Data'
      '                 where State = '#39'Y'#39
      '                   and Oper_Type = 0'
      '                   and Rep_Id = :Id'
      '                   and Rep_Inst = :Inst) CurPrih,'
      '               Oil_DR_Data drd'
      '         where drd.State = '#39'Y'#39
      '           and CurPrih.TTN_Id = drd.TTN_Id'
      '           and CurPrih.TTN_Inst = drd.TTN_Inst'
      '           and drd.Oper_Type = 0'
      '         group by CurPrih.TTN_Id, CurPrih.TTN_Inst'
      '        having count(*) > 1) DoublePrih,'
      '       Oil_Rashod r'
      ' where r.Id = DoublePrih.TTN_Id'
      '   and r.Inst = DoublePrih.TTN_Inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 669
    Top = 117
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
      end
      item
        DataType = ftInteger
        Name = 'INST'
      end>
  end
  object qPrevRest: TOilQuery
    SQL.Strings = (
      'select /*+ORDERED USE_HASH(dr, m)*/'
      ' m.Sm_End,'
      ' dr.Rep_Date,'
      ' dr.Smena_Num,'
      ' m.Sm_End_Sht,'
      ' m.Sm_End_Np,'
      ' m.Sm_Polis_Get'
      '  from Oil_Daily_Rep dr, Oil_DR_Money m'
      ' where dr.State = '#39'Y'#39
      '   and m.State = '#39'Y'#39
      '   and dr.AZS_Id = :p_azs_id'
      '   and dr.AZS_Inst = :p_azs_id'
      '   and dr.Id = m.Rep_Id'
      '   and dr.Inst = m.Rep_Inst'
      '   and (to_date(dr.Rep_Date, '#39'DD.MM.YYYY HH24:MI:SS'#39') <'
      '       to_date(:p_date, '#39'DD.MM.YYYY HH24:MI:SS'#39') or'
      
        '       (trunc(dr.Rep_Date) = trunc(:p_date) and dr.Smena_Num < :' +
        'p_smena))'
      ' order by dr.Rep_Date desc, dr.Smena_Num')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 668
    Top = 71
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_azs_id'
      end
      item
        DataType = ftUnknown
        Name = 'p_date'
      end
      item
        DataType = ftUnknown
        Name = 'p_smena'
      end>
  end
  object odPacket: TOpenDialog
    Filter = 
      #1055#1072#1082#1077#1090#1099' '#1074' '#1072#1088#1093#1080#1074#1077' (*.zip)|*.zip|'#1060#1072#1081#1083#1099' '#1089#1084#1077#1085#1085#1099#1093' '#1086#1090#1095#1077#1090#1086#1074'|*.oil|'#1042#1089#1077' '#1092#1072 +
      #1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 433
    Top = 166
  end
  object pmLoadPrih: TPopupMenu
    Images = MainForm.il
    Left = 370
    Top = 120
    object N4: TMenuItem
      Caption = #1042#1077#1089#1100' '#1087#1088#1080#1093#1086#1076
      ImageIndex = 1
      OnClick = N6Click
    end
    object N5: TMenuItem
      Tag = 1
      Caption = #1058#1086#1083#1100#1082#1086' '#1096#1090#1091#1095#1085#1099#1081' '#1090#1086#1074#1072#1088
      ImageIndex = 1
      OnClick = N6Click
    end
    object N6: TMenuItem
      Tag = 2
      Caption = #1058#1086#1083#1100#1082#1086' '#1084#1077#1088#1085#1099#1081' '#1090#1086#1074#1072#1088
      ImageIndex = 1
      OnClick = N6Click
    end
  end
  object qRashSop: TOilQuery
    SQL.Strings = (
      'select *'
      '  from (select /*+ORDERED USE_NL(r,dr,p,npt,dim)*/'
      '         r.id,'
      '         r.inst,'
      '         r.ttn_num,'
      '         p.dog,'
      '         r.ttn_date,'
      '         r.litr,'
      '         r.ud_weig,'
      '         r.count_,'
      '         npt.codavias || '#39': '#39' || npt.name as np_type_name,'
      '         dim.name as dim_name,'
      '         r.price,'
      '         p.own_goods,'
      '         dim.IsShtuki,'
      '         r.group_num,'
      '         dr.id as dr_id'
      '          from oil_rashod    r,'
      '               oil_dr_data   dr,'
      '               oil_part      p,'
      '               v_oil_np_type npt,'
      '               v_oil_dim     dim'
      '         where r.state = '#39'Y'#39
      '           and p.state = '#39'Y'#39
      '           and r.part_id = p.id'
      '           and r.part_inst = p.inst'
      '           and p.np_type = npt.id'
      '           and p.dim_id = dim.id'
      '           and dr.state(+) = '#39'Y'#39
      '           and dr.oper_type(+) = 0'
      '           and dr.ttn_id(+) = r.id'
      '           and dr.ttn_inst(+) = r.inst'
      '           and r.group_num = :group_num'
      '           and r.inst = :inst)'
      ' where dr_id is null')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 670
    Top = 164
    ParamData = <
      item
        DataType = ftInteger
        Name = 'group_num'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end>
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'sbCloseDetails.Down')
    StoredValues = <>
    Left = 434
    Top = 119
  end
  object uPrih: TOraUpdateSQL
    InsertSQL.Strings = (
      'insert into OIL_DR_DATA'
      '  (ID,'
      '   INST,'
      '   STATE,'
      '   REP_ID,'
      '   REP_INST,'
      '   OPER_TYPE,'
      '   TTN_ID,'
      '   TTN_INST,'
      '   PR_LITR,'
      '   PR_UD_WEIG,'
      '   PR_COUNT,'
      '   SUB_PART,'
      '   S_PRICE)'
      'values'
      '  (:ID,'
      '   :INST,'
      '   '#39'Y'#39','
      '   :REP_ID,'
      '   :REP_INST,'
      '   :OPER_TYPE,'
      '   :TTN_ID,'
      '   :TTN_INST,'
      '   :PR_LITR,'
      '   :PR_UD_WEIG,'
      '   :PR_COUNT,'
      '   :SUB_PART,'
      '   :S_PRICE)')
    DeleteSQL.Strings = (
      'update OIL_DR_DATA'
      '   set STATE = '#39'N'#39
      ' where ID = :OLD_ID'
      '   and INST = :OLD_INST')
    ModifySQL.Strings = (
      'update OIL_DR_DATA'
      '   set REP_ID     = :REP_ID,'
      '       REP_INST   = :REP_INST,'
      '       OPER_TYPE  = :OPER_TYPE,'
      '       TTN_ID     = :TTN_ID,'
      '       TTN_INST   = :TTN_INST,'
      '       PR_LITR    = :PR_LITR,'
      '       PR_UD_WEIG = :PR_UD_WEIG,'
      '       PR_COUNT   = :PR_COUNT,'
      '       SUB_PART   = :SUB_PART,'
      '       S_PRICE    = :S_PRICE'
      ' where ID = :OLD_ID'
      '   and INST = :OLD_INST')
    Left = 605
    Top = 117
  end
  object mtSkidka: TMemoryTable
    Left = 607
    Top = 71
    object mtSkidkaSTYPE: TIntegerField
      FieldName = 'STYPE'
    end
    object mtSkidkaORG_ID: TIntegerField
      FieldName = 'ORG_ID'
    end
    object mtSkidkaNP_ID: TIntegerField
      FieldName = 'NP_ID'
    end
    object mtSkidkaZAKAZ: TFloatField
      FieldName = 'ZAKAZ'
    end
    object mtSkidkaLITR: TFloatField
      FieldName = 'LITR'
    end
    object mtSkidkaPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object mtSkidkaSUMM: TFloatField
      FieldName = 'SUMM'
    end
    object mtSkidkaSKIDKA: TFloatField
      FieldName = 'SKIDKA'
    end
  end
  object qRashVed: TOilQuery
    ParamCheck = False
    SQL.Strings = (
      'select /*+ORDERED USE_NL(dr, v, o)*/'
      ' dr.TTN_Id,'
      ' dr.TTN_Inst,'
      ' v.Org_Id,'
      ' v.Org_Inst,'
      ' o.Name as Org_Name,'
      ' v.Dog_Id,'
      ' v.Dog_Inst,'
      ' v.Litr,'
      ' v.Count_T,'
      ' v.Price,'
      ' v.Amount'
      '  from Oil_DR_Data dr, Oil_Vedomost v, v_org o'
      ' where dr.State = '#39'Y'#39
      '   and v.State = '#39'Y'#39
      '   and o.state(+) = '#39'Y'#39
      '   and dr.Rep_id = :Rep_id'
      '   and dr.Rep_inst = :Rep_inst'
      '   and dr.Id = v.SRep_Id'
      '   and dr.Inst = v.SRep_Inst'
      '   and v.Org_Id = o.Id(+)'
      '   and v.Org_Inst = o.Inst(+)')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 118
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep_id'
      end
      item
        DataType = ftUnknown
        Name = 'Rep_inst'
      end>
  end
  object pmLoadRash: TPopupMenu
    Images = MainForm.il
    Left = 370
    Top = 166
    object miLoadPrihTalon: TMenuItem
      Caption = #1055#1088#1080#1074#1103#1079#1072#1090#1100'/'#1055#1077#1088#1077#1087#1088#1080#1074#1103#1079#1072#1090#1100' '#1087#1088#1080#1093#1086#1076' '#1090#1072#1083#1086#1085#1086#1074
      ImageIndex = 1
      OnClick = miLoadPrihTalonClick
    end
  end
  object qRashEditAVERAGE: TOilQuery
    SQL.Strings = (
      '--> qRashEditAVERAGE,SRepForm'
      'select /*+ORDERED*/'
      ' c.ttn_id,'
      ' c.ttn_inst,'
      ' decode(c.np_grp,'
      '        null,'
      
        '        decode(npt.codavias, null, '#39#39', npt.codavias || '#39': '#39') || ' +
        'npt.name,'
      '        npt.np_grp_fullname) as ttn_dog,'
      ' decode(c.np_grp, null, '#39'Y'#39', '#39'N'#39') as IsShtuki,'
      
        ' decode(npp.price, null, c.IsEdit, '#39'Y'#39') as IsEdit, -- '#1079#1072#1087#1080#1089' '#1082#1086#1088#1077 +
        #1075#1091#1074#1072#1074#1089#1103
      ' npt.id as sub_part,'
      ' nvl(npp.price, c.s_price) as s_price, -- '#1094#1110#1085#1072' '#1088#1077#1072#1083#1110#1079#1072#1094#1110#1111
      ' '#39'O'#39' as own_goods,'
      ' 9 as goal_part_type,'
      ' to_date(ov.getval('#39'DR_AVERAGE_DATE'#39')) as ttn_date,'
      ' npt.np_grp as ttn_np_grp_id,'
      ' npt.us_subgroup_id,'
      ' decode(c.np_grp, null, 1, 0) as Base_,'
      ' npt.id as np_type_id,'
      ' decode(c.np_grp,'
      '        null,'
      
        '        decode(npt.codavias, null, '#39#39', npt.codavias || '#39': '#39') || ' +
        'npt.name,'
      '        npt.np_grp_fullname) as ttn_np_name,'
      ' '
      ' decode(c.np_grp,'
      '        null,'
      '        1, -- '#1089#1091#1087#1091#1090#1085#1110#1081' '#1090#1086#1074#1072#1088
      '        round(decode(IsCalcWeig,'
      '                     0,'
      
        '                     c.c_pr_ud_weig, -- '#1075#1091#1089#1090#1080#1085#1072' '#1110#1079' '#1087#1086#1087#1077#1088#1077#1076#1085#1100#1086#1111' '#1088 +
        #1077#1072#1083#1110#1079#1072#1094#1110#1111
      '                     c.Ostatok_T * 1000 /'
      
        '                     decode(c.Ostatok_L, 0, 1, c.Ostatok_L) -- '#1088 +
        #1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1072' '#1075#1091#1089#1090#1080#1085#1072
      '                     ),'
      '              4) -- '#1085#1072#1092#1090#1086#1087#1088#1086#1076#1091#1082#1090
      '        ) as ud_weig, -- '#1085#1086#1074#1072' '#1075#1091#1089#1090#1080#1085#1072' '#1076#1083#1103' '#1088#1077#1072#1083#1110#1079#1072#1094#1110#1111
      ' '
      ' c.Ostatok_L, -- '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1083#1110#1090#1088#1110#1074' '#1085#1072' '#1088#1077#1072#1083#1110#1079#1072#1094#1110#1102
      
        ' decode(c.np_grp, null, c.Ostatok_L, c.Ostatok_T) as Ostatok_T, ' +
        '-- '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1090#1086#1085#1085' '#1085#1072' '#1088#1077#1072#1083#1110#1079#1072#1094#1110#1102
      ' '
      ' c.out_nal_litr,'
      ' c.out_ved_litr,'
      ' c.out_talon_litr,'
      ' c.out_sn_litr,'
      ' c.out_litr,'
      ' '
      ' c.out_nal_money,'
      ' c.out_ved_money,'
      ' '
      ' c.out_count,'
      ' '
      
        ' c.Ostatok_L - c.pr_litr as Ostatok_Lp, -- '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1083#1110#1090#1088#1110#1074' '#1085#1072' '#1087 +
        #1088#1080#1093#1110#1076
      
        ' decode(c.np_grp, null, c.Ostatok_L, c.Ostatok_T) - c.pr_count a' +
        's Ostatok_Tp -- '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1090#1086#1085#1085' '#1085#1072' '#1087#1088#1080#1093#1110#1076
      '  from (select np_grp,'
      '               np_type,'
      '               min(np_type_id) as np_type_id,'
      '               '
      
        '               min(decode(inst, ttn_inst, ttn_id, 1e7)) as ttn_i' +
        'd,'
      
        '               max(decode(inst, ttn_inst, ttn_inst, inst)) as tt' +
        'n_inst,'
      '               '
      
        '               to_number(substr(max(to_char(rep_date, '#39'YYYYMMDDH' +
        'H24MISS'#39') ||'
      '                                    s_price),'
      
        '                                15)) as s_price, -- '#1094#1110#1085#1072' '#1088#1077#1072#1083#1110#1079#1072 +
        #1094#1110#1111
      
        '               to_number(substr(max((1 - IsPrih) * (1 - IsRash) ' +
        '*'
      
        '                                    decode(pr_ud_weig, 0, 0, 1) ' +
        '*'
      
        '                                    to_char(rep_date, '#39'YYYYMMDDH' +
        'H24MISS'#39') ||'
      '                                    pr_ud_weig),'
      
        '                                15)) as c_pr_ud_weig, -- '#1075#1091#1089#1090#1080#1085#1072 +
        ' '#1091' '#1087#1086#1087#1077#1088#1077#1076#1085#1110#1081' '#1088#1077#1072#1083#1110#1079#1072#1094#1110#1111
      '               '
      
        '               decode(max(IsFirstDate) + /*'#1094#1077' '#1087#1077#1088#1096#1072' '#1076#1072#1090#1072' '#1085#1086#1074#1086#1075#1086' ' +
        #1086#1073#1083#1110#1082#1091'*/'
      
        '                      max(decode(IsRashPrev * count_278, 0, 0, 1' +
        ')) + /*'#1094#1077' '#1082#1086#1088#1077#1075#1091#1074#1072#1085#1085#1103' '#1079#1072#1083#1080#1096#1082#1110#1074'*/'
      '                      max(IsPrih) + /*'#1094#1077' '#1087#1088#1080#1093#1110#1076'*/'
      
        '                      decode(sum(IsRashPrev) /*'#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1079#1072#1087#1080#1089#1110#1074 +
        ' '#1091' '#1087#1086#1087#1077#1088#1077#1076#1085#1110#1081' '#1088#1077#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1110#1083#1100#1096#1077' 1-'#1094#1110'*/,'
      '                             0,'
      '                             0,'
      '                             1,'
      '                             0,'
      '                             1),'
      '                      0,'
      '                      0,'
      '                      1) as IsCalcWeig, -- '#1082#1072#1083#1100#1082#1091#1083#1103#1094#1110#1103' '#1075#1091#1089#1090#1080#1085#1080
      
        '               decode(sum(IsRash) /*'#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1079#1072#1087#1080#1089#1110#1074' '#1091' '#1088#1077#1072#1083#1110#1079#1072#1094 +
        #1110#1111'*/,'
      '                      0,'
      '                      '#39'N'#39','
      '                      '#39'Y'#39') as IsEdit, -- '#1079#1072#1087#1080#1089' '#1082#1086#1088#1077#1075#1091#1074#1072#1074#1089#1103
      '               '
      
        '               sum((1 - IsRash) * (pr_litr - out_nal_litr - out_' +
        'ved_litr -'
      
        '                   out_talon_litr - out_sn_litr - out_litr)) as ' +
        'Ostatok_L, -- '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1083#1110#1090#1088#1110#1074' '#1085#1072' '#1088#1077#1072#1083#1110#1079#1072#1094#1110#1102
      '               sum((1 - IsRash) *'
      '                   (pr_count - out_nal_count - out_ved_count -'
      
        '                   out_talon_count - out_sn_count - out_count)) ' +
        'as Ostatok_T, -- '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1090#1086#1085#1085' '#1085#1072' '#1088#1077#1072#1083#1110#1079#1072#1094#1110#1102
      '               '
      
        '               round(sum(IsPrih * pr_litr), 3) as pr_litr, -- '#1082#1110 +
        #1083#1100#1082#1110#1089#1090#1100' '#1083#1110#1090#1088#1110#1074' '#1091' '#1087#1088#1080#1093#1086#1076#1110
      
        '               round(sum(IsPrih * pr_count), 3) as pr_count, -- ' +
        #1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1090#1086#1085#1085' '#1091' '#1087#1088#1080#1093#1086#1076#1110
      '               '
      '               sum(IsRash * out_nal_litr) as out_nal_litr,'
      '               sum(IsRash * out_ved_litr) as out_ved_litr,'
      '               sum(IsRash * out_talon_litr) as out_talon_litr,'
      '               sum(IsRash * out_sn_litr) as out_sn_litr,'
      '               sum(IsRash * out_litr) as out_litr,'
      '               '
      '               sum(IsRash * out_nal_money) as out_nal_money,'
      '               sum(IsRash * out_ved_money) as out_ved_money,'
      '               '
      '               sum(IsRash * out_count) as out_count'
      
        '          from (select /*+ORDERED INDEX(drep IDX_OIL_DAYLY_REP_A' +
        'ZS) INDEX(dr I_DR_DATA) INDEX(p OIL_PART_IN1)*/'
      '                 drep.inst,'
      '                 drep.rep_date,'
      '                 dr.ttn_id,'
      '                 dr.ttn_inst,'
      '                 '
      
        '                 decode(npt.grp_id, 4, 48, npt.id) as np_type_id' +
        ','
      '                 decode(npt.us_subgroup_id,'
      '                        null,'
      '                        decode(npt.grp_id, 4, 5, npt.grp_id),'
      '                        npt.id) as np_type,'
      '                 decode(npt.us_subgroup_id,'
      '                        null,'
      '                        decode(npt.grp_id, 4, 5, npt.grp_id),'
      '                        null) as np_grp,'
      '                 '
      '                 decode(drep.rep_date, :p_rep_date, 1, 0) *'
      
        '                 decode(dr.oper_type, 0, 1, 0) as IsPrih, -- '#1087#1088#1080 +
        #1093#1086#1076#1080' '#1089#1100#1086#1075#1086#1076#1085#1110
      '                 '
      '                 decode(drep.rep_date, :p_rep_date, 1, 0) *'
      
        '                 decode(dr.oper_type, 1, 1, 2, 1, 0) as IsRash, ' +
        '-- '#1074#1110#1076#1087#1091#1089#1082#1080' '#1089#1100#1086#1075#1086#1076#1085#1110
      '                 '
      
        '                 decode(drep.rep_date, drep_prev.rep_date, 1, 0)' +
        ' *'
      
        '                 decode(dr.oper_type, 1, 1, 2, 1, 0) as IsRashPr' +
        'ev, -- '#1087#1086#1087#1077#1088#1077#1076#1085#1110' '#1074#1110#1076#1087#1091#1089#1082#1080
      '                 '
      
        '                 decode(to_date(ov.getval('#39'DR_AVERAGE_DATE'#39'), '#39'D' +
        'D.MM.YYYY'#39'),'
      '                        to_date(:p_rep_date, '#39'DD.MM.YYYY'#39'),'
      '                        1,'
      
        '                        0) as IsFirstDate, -- '#1094#1077' '#1087#1077#1088#1096#1072' '#1076#1072#1090#1072' '#1085#1086#1074#1086 +
        #1075#1086' '#1086#1073#1083#1110#1082#1091
      '                 '
      '                 sr.count_278, -- '#1094#1077' '#1082#1086#1088#1077#1075#1091#1074#1072#1085#1085#1103' '#1079#1072#1083#1080#1096#1082#1110#1074
      '                 '
      '                 nvl(dr.s_price, 0) as s_price,'
      '                 nvl(dr.pr_ud_weig, 0) as pr_ud_weig,'
      '                 nvl(dr.pr_litr, 0) as pr_litr,'
      '                 nvl(dr.pr_count, 0) as pr_count,'
      '                 '
      '                 nvl(dr.out_nal_litr, 0) as out_nal_litr,'
      '                 nvl(dr.out_ved_litr, 0) as out_ved_litr,'
      '                 nvl(dr.out_talon_litr, 0) as out_talon_litr,'
      '                 nvl(dr.out_sn_litr, 0) as out_sn_litr,'
      '                 nvl(dr.out_litr, 0) as out_litr,'
      '                 '
      '                 nvl(dr.out_nal_count, 0) as out_nal_count,'
      '                 nvl(dr.out_ved_count, 0) as out_ved_count,'
      '                 nvl(dr.out_talon_count, 0) as out_talon_count,'
      '                 nvl(dr.out_sn_count, 0) as out_sn_count,'
      '                 nvl(dr.out_count, 0) as out_count,'
      '                 '
      '                 nvl(dr.out_nal_money, 0) as out_nal_money,'
      '                 nvl(dr.out_ved_money, 0) as out_ved_money,'
      '                 nvl(dr.out_talon_money, 0) as out_talon_money,'
      '                 nvl(dr.out_sn_money, 0) as out_sn_money,'
      '                 nvl(dr.out_money, 0) as out_money'
      '                  from oil_daily_rep drep,'
      '                       oil_dr_data dr,'
      '                       oil_rashod r,'
      '                       oil_part p,'
      '                       oil_np_type npt,'
      '                       ( /*'#1094#1077' '#1076#1072#1090#1072' '#1087#1086#1087#1077#1088#1077#1076#1085#1100#1086#1075#1086' '#1079#1084#1110#1085#1085#1086#1075#1086' '#1079#1074#1110#1090#1091'*/'
      '                        select nvl(max(rep_date),'
      
        '                                    to_date('#39'01.01.2000'#39', '#39'DD.MM' +
        '.YYYY'#39')) as rep_date'
      '                          from oil_daily_rep'
      '                         where state = '#39'Y'#39
      '                           and rep_date < :p_rep_date'
      '                           and azs_id = :p_azs_id'
      '                           and azs_inst = :p_azs_id) drep_prev,'
      '                       ( /*'#1094#1077' '#1082#1086#1088#1077#1075#1091#1074#1072#1085#1085#1103' '#1079#1072#1083#1080#1096#1082#1110#1074'*/'
      
        '                        select srep_id, srep_inst, count(*) as c' +
        'ount_278'
      '                          from oil_srother'
      '                         where state = '#39'Y'#39
      '                           and oper_id = 278'
      '                         group by srep_id, srep_inst) sr,'
      '                       ( /*'#1094#1077' '#1076#1072#1090#1072' '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082' '#1103#1082#1086#1111' '#1108' '#1079#1072#1083#1080#1096#1082#1080'*/'
      '                        select max(date_) as date_'
      '                          from (select date_'
      '                                   from oil_np_rest'
      '                                  where state = '#39'Y'#39
      '                                    and price is not null'
      
        '                                    and date_ < trunc(:p_rep_dat' +
        'e)'
      '                                    and azs_id = :p_azs_id'
      '                                 union all'
      
        '                                 select to_date('#39'01.01.1900'#39', '#39'D' +
        'D.MM.YYYY'#39')'
      '                                   from dual)) npr'
      '                 where drep.state = '#39'Y'#39
      '                   and dr.state = '#39'Y'#39
      '                   and r.state = '#39'Y'#39
      '                   and p.state = '#39'Y'#39
      '                      '
      '                   and drep.id = dr.rep_id'
      '                   and drep.inst = dr.rep_inst'
      '                      '
      '                   and dr.ttn_id = r.id'
      '                   and dr.ttn_inst = r.inst'
      '                      '
      '                   and r.part_id = p.id'
      '                   and r.part_inst = p.inst'
      '                      '
      '                   and p.np_type = npt.id'
      '                      '
      '                   and dr.id = sr.srep_id(+)'
      '                   and dr.inst = sr.srep_inst(+)'
      '                      '
      '                   and trunc(drep.rep_date) >= npr.date_'
      '                      '
      '                   and drep.azs_id = :p_azs_id'
      '                   and drep.azs_inst = :p_azs_id'
      '                      '
      '                   and ((dr.oper_type in (0, 1) and'
      '                       drep.rep_date <= :p_rep_date) or'
      '                       (dr.oper_type = 2 and'
      
        '                       drep.rep_date in (drep_prev.rep_date, :p_' +
        'rep_date)))'
      '                union all'
      '                /*'#1094#1077' '#1079#1072#1083#1080#1096#1082#1080'*/'
      '                select npr.inst,'
      '                       npr.rep_date,'
      '                       npr.ttn_id,'
      '                       npr.ttn_inst,'
      '                       '
      '                       npr.np_type_id,'
      '                       npr.np_type,'
      '                       npr.np_grp,'
      '                       '
      '                       0 as IsPrih, -- '#1087#1088#1080#1093#1086#1076#1080' '#1089#1100#1086#1075#1086#1076#1085#1110'       '
      '                       0 as IsRash, -- '#1074#1110#1076#1087#1091#1089#1082#1080' '#1089#1100#1086#1075#1086#1076#1085#1110'       '
      
        '                       0 as IsRashPrev, -- '#1087#1086#1087#1077#1088#1077#1076#1085#1110' '#1074#1110#1076#1087#1091#1089#1082#1080'   ' +
        '    '
      
        '                       decode(to_date(ov.getval('#39'DR_AVERAGE_DATE' +
        #39'),'
      '                                      '#39'DD.MM.YYYY'#39'),'
      
        '                              to_date(:p_rep_date, '#39'DD.MM.YYYY'#39')' +
        ','
      '                              1,'
      
        '                              0) as IsFirstDate, -- '#1094#1077' '#1087#1077#1088#1096#1072' '#1076#1072#1090 +
        #1072' '#1085#1086#1074#1086#1075#1086' '#1086#1073#1083#1110#1082#1091'    '
      
        '                       to_number(null) as count_278, -- '#1094#1077' '#1082#1086#1088#1077#1075 +
        #1091#1074#1072#1085#1085#1103' '#1079#1072#1083#1080#1096#1082#1110#1074
      '                       '
      '                       npr.s_price,'
      '                       npr.pr_ud_weig,'
      '                       npr.pr_litr,'
      '                       npr.pr_count,'
      '                       '
      '                       0 as out_nal_litr,'
      '                       0 as out_ved_litr,'
      '                       0 as out_talon_litr,'
      '                       0 as out_sn_litr,'
      '                       0 as out_litr,'
      '                       '
      '                       0 as out_nal_count,'
      '                       0 as out_ved_count,'
      '                       0 as out_talon_count,'
      '                       0 as out_sn_count,'
      '                       0 as out_count,'
      '                       '
      '                       0 as out_nal_money,'
      '                       0 as out_ved_money,'
      '                       0 as out_talon_money,'
      '                       0 as out_sn_money,'
      '                       0 as out_money'
      '                  from (select npr.*,'
      
        '                               row_number() over(partition by az' +
        's_id, np_grp, np_type order by rep_date desc, manual desc, id de' +
        'sc) as rnum'
      '                          from (select npr.id,'
      '                                       npr.inst,'
      '                                       npr.manual,'
      '                                       npr.date_ as rep_date,'
      '                                       npr.azs_id,'
      '                                       '
      
        '                                       decode(npt.grp_id, 4, 48,' +
        ' npt.id) as np_type_id,'
      
        '                                       decode(npt.us_subgroup_id' +
        ','
      '                                              null,'
      '                                              decode(npt.grp_id,'
      '                                                     4,'
      '                                                     5,'
      
        '                                                     npt.grp_id)' +
        ','
      
        '                                              npt.id) as np_type' +
        ','
      
        '                                       decode(npt.us_subgroup_id' +
        ','
      '                                              null,'
      '                                              decode(npt.grp_id,'
      '                                                     4,'
      '                                                     5,'
      
        '                                                     npt.grp_id)' +
        ','
      '                                              null) as np_grp,'
      '                                       '
      '                                       npr.ttn_id,'
      '                                       npr.ttn_inst,'
      '                                       npr.price     as s_price,'
      
        '                                       npr.ud_weight as pr_ud_we' +
        'ig,'
      '                                       npr.rest_litr as pr_litr,'
      '                                       npr.rest_kg   as pr_count'
      
        '                                  from oil_np_rest npr, oil_np_t' +
        'ype npt'
      '                                 where npr.state = '#39'Y'#39
      '                                   and price is not null'
      '                                   and np_type_id = npt.id'
      
        '                                   and date_ < trunc(:p_rep_date' +
        ')'
      
        '                                   and azs_id = :p_azs_id) npr) ' +
        'npr'
      '                 where rnum = 1)'
      '         group by np_grp, np_type) c,'
      '       '
      '       v_oil_np_type npt,'
      '       '
      '       ( /*'#1062#1110#1085#1080' '#1085#1072' '#1089#1086#1087'.'#1090#1086#1074#1072#1088'*/'
      '        select *'
      '          from (select npp.*,'
      
        '                        row_number() over(partition by npp.org_i' +
        'd, npp.org_inst, npp.np_id order by npp.date_on desc, id desc) a' +
        's rnum'
      '                   from oil_np_price npp'
      '                  where npp.state = '#39'Y'#39
      '                    and npp.date_on between'
      '                        trunc(:p_rep_date) -'
      
        '                        to_number(nvl(ov.GetVal('#39'DR_NP_PRICE_DAY' +
        #39'), '#39'0'#39')) and'
      '                        trunc(:p_rep_date)'
      '                    and ov.GetVal('#39'DR_NP_PRICE'#39') = '#39'Y'#39
      '                    and npp.org_id = ov.GetVal('#39'INST'#39')'
      '                    and npp.org_inst = ov.GetVal('#39'INST'#39'))'
      '         where rnum = 1) npp'
      ' where c.np_type_id = npt.id'
      
        '   and (c.ostatok_L <> 0 or c.ostatok_T <> 0 or c.out_nal_litr <' +
        '> 0 or'
      
        '       c.out_ved_litr <> 0 or c.out_talon_litr <> 0 or c.out_sn_' +
        'litr <> 0 or'
      '       c.out_litr <> 0)'
      '   and c.np_type_id = npp.np_id(+)'
      ' order by decode(c.np_grp, null, '#39'Y'#39', '#39'N'#39'),'
      '          decode(c.np_grp,'
      '                 null,'
      
        '                 decode(npt.codavias, null, '#39#39', npt.codavias || ' +
        #39': '#39') ||'
      '                 npt.name,'
      '                 npt.np_grp_fullname),'
      '          npt.np_grp,'
      '          npt.id')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 425
    Top = 331
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p_rep_date'
      end
      item
        DataType = ftInteger
        Name = 'p_azs_id'
      end>
  end
  object qPrivAdd: TQuery
    Left = 24
    Top = 115
  end
  object qOstAVERAGE: TOilQuery
    ParamCheck = False
    SQL.Strings = (
      'select /*+ORDERED*/'
      ' c.Ostatok_T'
      
        '  from (select decode(np_grp, null, np_type_id, np_grp) as np_ty' +
        'pe_id,'
      '               np_grp,'
      '               '
      '               sum((pr_count - out_nal_count - out_ved_count -'
      
        '                   out_talon_count - out_sn_count - out_count)) ' +
        'as Ostatok_T'
      
        '          from (select /*+ORDERED INDEX(drep IDX_OIL_DAYLY_REP_A' +
        'ZS) INDEX(dr I_DR_DATA)*/'
      '                 dr.ttn_inst,'
      '                 npt.id as np_type_id,'
      
        '                 decode(npt.us_subgroup_id, null, npt.np_grp, nu' +
        'll) as np_grp,'
      '                 '
      '                 nvl(dr.pr_count, 0) as pr_count,'
      '                 nvl(dr.out_nal_count, 0) as out_nal_count,'
      '                 nvl(dr.out_ved_count, 0) as out_ved_count,'
      '                 nvl(dr.out_talon_count, 0) as out_talon_count,'
      '                 nvl(out_sn_count, 0) as out_sn_count,'
      '                 nvl(out_count, 0) as out_count'
      '                  from oil_daily_rep drep,'
      '                       oil_dr_data   dr,'
      '                       oil_rashod    r,'
      '                       oil_part      p,'
      '                       v_oil_np_type npt'
      '                 where drep.state = '#39'Y'#39
      '                   and dr.state = '#39'Y'#39
      '                   and r.state = '#39'Y'#39
      '                   and p.state = '#39'Y'#39
      '                      '
      '                   and drep.id = dr.rep_id'
      '                   and drep.inst = dr.rep_inst'
      '                      '
      '                   and dr.ttn_id = r.id'
      '                   and dr.ttn_inst = r.inst'
      '                      '
      '                   and r.part_id = p.id'
      '                   and r.part_inst = p.inst'
      '                      '
      '                   and p.np_type = npt.id'
      '                      '
      '                   and drep.azs_id = :p_azs_id'
      '                   and drep.azs_inst = :p_azs_id'
      '                      '
      '                   and dr.oper_type in (0, 1)'
      '                   and drep.rep_date <= :p_rep_date)'
      
        '         group by decode(np_grp, null, np_type_id, np_grp), np_g' +
        'rp) c,'
      '       '
      '       (select min(id) as np_type_id, np_grp'
      '          from v_oil_np_type'
      '         where us_subgroup_id is null'
      '         group by np_grp'
      '        union all'
      '        select id, np_grp'
      '          from v_oil_np_type'
      '         where us_subgroup_id is not null) np,'
      '       '
      '       v_oil_np_type npt'
      ' where ((c.np_grp is not null and c.np_grp = np.np_grp) or'
      '       (c.np_grp is null and c.np_type_id = np.np_type_id))'
      '   and np.np_type_id = npt.id'
      '      '
      '   and ((c.np_grp is not null and c.np_grp = :p_np) or'
      '       (c.np_grp is null and c.np_type_id = :p_np))'
      '   and decode(c.np_grp, null, '#39'Y'#39', '#39'N'#39') = :p_IsShtuki')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 671
    Top = 211
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_azs_id'
      end
      item
        DataType = ftUnknown
        Name = 'p_rep_date'
      end
      item
        DataType = ftUnknown
        Name = 'p_np'
      end
      item
        DataType = ftUnknown
        Name = 'p_IsShtuki'
      end>
  end
  object ActionList: TActionList
    Left = 433
    Top = 74
    object actOther: TAction
      ShortCut = 16464
      OnExecute = actOtherExecute
    end
    object actNal: TAction
      ShortCut = 16462
      OnExecute = actNalExecute
    end
    object actVed: TAction
      ShortCut = 16470
      OnExecute = actVedExecute
    end
    object actPrih: TAction
      Caption = '&'#1055#1088#1080#1093#1086#1076
      Hint = #1055#1088#1080#1093#1086#1076
      ShortCut = 16433
      OnExecute = actPrihExecute
    end
    object actRash: TAction
      Caption = '&'#1056#1077#1072#1083#1080#1079#1072#1094#1080#1103
      Hint = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103
      ShortCut = 16434
      OnExecute = actRashExecute
    end
    object actIncas: TAction
      Caption = '&'#1048#1085#1082#1072#1089#1072#1094#1080#1103
      Hint = #1048#1085#1082#1072#1089#1072#1094#1080#1103
      ShortCut = 16435
      OnExecute = actIncasExecute
    end
    object actSave: TAction
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      Hint = #1055#1088#1080#1085#1103#1090#1100
      ShortCut = 16467
      OnExecute = actSaveExecute
    end
    object actE: TAction
      ShortCut = 13
      OnExecute = dbgRashodEditButtonClick
    end
    object actDelRash: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16452
      OnExecute = actDelRashExecute
    end
    object actFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103
      ShortCut = 16454
      OnExecute = actFilterExecute
    end
  end
  object vTable3: TVirtualTable
    Left = 120
    Top = 70
    Data = {03000000000000000000}
  end
  object vTable4: TVirtualTable
    Left = 176
    Top = 70
    Data = {03000000000000000000}
  end
  object vTable5: TVirtualTable
    Left = 240
    Top = 70
    Data = {03000000000000000000}
  end
  object qAddRash: TOilQuery
    ParamCheck = False
    SQL.Strings = (
      'select /*+ORDERED*/'
      ' ttn_id,'
      ' ttn_inst,'
      ' decode(us_subgroup_id, null, '#39'N'#39', '#39'Y'#39') as IsShtuki,'
      ' price,'
      ' to_date(ov.getval('#39'DR_AVERAGE_DATE'#39')) as ttn_date,'
      ' np_grp,'
      ' us_subgroup_id,'
      ' decode(us_subgroup_id, null, 0, 1) as Base_,'
      ' np_type_id,'
      ' decode(us_subgroup_id,'
      '        null,'
      '        np_grp_fullname,'
      
        '        decode(codavias, null, '#39#39', codavias || '#39': '#39') || name) as' +
        ' np_name,'
      ' ud_weig'
      '  from (select row_number() over(order by r.date_) as rnum,'
      '               '
      '               r.id   as ttn_id,'
      '               r.inst as ttn_inst,'
      '               '
      '               r.date_,'
      
        '               to_number(substr(max(to_char(r.date_, '#39'YYYYMMDD'#39')' +
        ' || r.price),'
      '                                9)) as price,'
      '               npt.np_grp,'
      '               npt.us_subgroup_id,'
      '               npt.id as np_type_id,'
      '               npt.np_grp_fullname,'
      '               npt.codavias,'
      '               npt.name,'
      '               '
      
        '               to_number(substr(max(to_char(r.date_, '#39'YYYYMMDD'#39')' +
        ' ||'
      '                                    r.ud_weig),'
      '                                9)) as ud_weig'
      '          from oil_rashod r, oil_part p, v_oil_np_type npt'
      '         where r.state = '#39'Y'#39
      '           and p.state = '#39'Y'#39
      '              '
      '           and r.part_id = p.id'
      '           and r.part_inst = p.inst'
      '              '
      '           and p.np_type = npt.id'
      '              '
      '           and r.to_id = :p_azs_id'
      '           and r.to_inst = :p_azs_id'
      '              '
      '           and ((npt.id = :p_np_type_id and :p_np_grp_id = 0) or'
      
        '               (npt.np_grp = :p_np_grp_id and :p_np_type_id = 0)' +
        ')'
      '         group by r.id,'
      '                  r.inst,'
      '                  r.date_,'
      '                  r.price,'
      '                  npt.np_grp,'
      '                  npt.us_subgroup_id,'
      '                  npt.id,'
      '                  npt.np_grp_fullname,'
      '                  npt.codavias,'
      '                  npt.name)'
      ' where rnum = 1')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 509
    Top = 277
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_azs_id'
      end
      item
        DataType = ftUnknown
        Name = 'p_np_type_id'
      end
      item
        DataType = ftUnknown
        Name = 'p_np_grp_id'
      end>
  end
  object qSections: TOilQuery
    SQL.Strings = (
      'select *'
      '  from oil_azs_sections'
      ' where state = '#39'Y'#39
      '   and table_name is not null'
      '   and table_fields is not null'
      '   and section_name is not null'
      '   and section_fields is not null'
      ' order by section_name')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 62
    Top = 367
  end
  object dsSections: TOraDataSource
    DataSet = qSections
    Left = 80
    Top = 357
  end
  object qSectionsSQL: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 198
    Top = 343
  end
  object dsSectionsSQL: TOraDataSource
    DataSet = qSectionsSQL
    Left = 216
    Top = 333
  end
end
