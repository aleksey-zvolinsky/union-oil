inherited TalonPrihForm: TTalonPrihForm
  Left = 353
  Top = 325
  BorderStyle = bsDialog
  Caption = #1055#1088#1080#1093#1086#1076' '#1090#1072#1083#1086#1085#1086#1074
  ClientHeight = 483
  ClientWidth = 613
  Constraints.MinHeight = 510
  Constraints.MinWidth = 475
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 449
    Width = 613
    Height = 34
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object sbDel: TSpeedButton
      Left = 35
      Top = 5
      Width = 25
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
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
    object sbAdd: TSpeedButton
      Left = 5
      Top = 5
      Width = 25
      Height = 25
      Hint = #1042#1086#1079#1074#1088#1072#1090#1080#1090#1100' '#1090#1072#1083#1086#1085' '#1089' '#39#1053#1086#1084#1077#1088' + 1'#39
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
    object Panel3: TPanel
      Left = 416
      Top = 2
      Width = 195
      Height = 30
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        195
        30)
      object bbOk: TBitBtn
        Left = 8
        Top = 3
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1055#1088#1080#1085#1103#1090#1100
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
        Left = 104
        Top = 3
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 1
        Kind = bkCancel
      end
    end
    object import: TBitBtn
      Left = 65
      Top = 5
      Width = 28
      Height = 25
      Hint = #1048#1084#1087#1086#1088#1090' '#1090#1072#1083#1086#1085#1086#1074
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = importClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000008080008080
        0080800080800000000080800080800080800080800080800080800000000080
        8000808000808000808000808000808000808000808000000000808000808000
        8080008080008080008080000000008080008080008080008080008080008080
        0080800000000000FF0000000080800080800080800080800000000000FF0000
        000080800080800080800080800080800080800000000000FF00000000808000
        80800080800080800000000000FF000000008080008080008080008080008080
        0000000000FF0000FF0000FF0000000080800080800000000000FF0000FF0000
        FF0000000080800080800080800080800000000000FF0000FF0000FF00000000
        80800080800000000000FF0000FF0000FF000000008080008080008080000000
        0000FF0000FF0000FF0000FF0000FF0000000000000000FF0000FF0000FF0000
        FF0000FF0000000080800080800000000000FF0000FF0000FF0000FF0000FF00
        00000000000000FF0000FF0000FF0000FF0000FF0000000080800000000000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000000000000000000000000000000000FF00000000000000
        00000000000000000000000000FF000000000000000000000000008080008080
        0080800000000000FF0000000080800080800080800080800000000000FF0000
        000080800080800080800080800080800080800000000000FF00000000808000
        80800080800080800000000000FF000000008080008080008080008080008080
        0080800000000000FF0000000080800080800080800080800000000000FF0000
        000080800080800080800080800080800080800000000000FF00000000808000
        80800080800080800000000000FF000000008080008080008080008080008080
        0080800000000000FF0000000080800080800080800080800000000000FF0000
        0000808000808000808000808000808000808000000000000000000000808000
        8080008080008080000000000000000000008080008080008080}
    end
    object Export: TBitBtn
      Left = 98
      Top = 5
      Width = 28
      Height = 25
      Hint = #1042#1099#1075#1088#1091#1079#1082#1072' '#1090#1072#1083#1086#1085#1086#1074
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ExportClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
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
        D9005500F0006D24FF008548FF009D6CFF00B590FF00CDB4FF00030303000000
        0303030300000003030303030300DA000303030300DA0003030303030300DA00
        0303030300DA0003030303030300DA000303030300DA0003030303030300DA00
        0303030300DA0003030303030300DA000303030300DA0003030300000000DA00
        0000000000DA0000000000DADADADADADADADADADADADADADA000300DADADADA
        DA0000DADADADADA00030300DADADADADA0000DADADADADA0003030300DADADA
        00030300DADADA000303030300DADADA00030300DADADA00030303030300DA00
        0303030300DA0003030303030300DA000303030300DA00030303030303030003
        0303030303000303030303030303000303030303030003030303}
    end
    object cbLog: TCheckBox
      Left = 144
      Top = 8
      Width = 160
      Height = 17
      Caption = #1051#1086#1075' '#1087#1088#1080' '#1074#1074#1086#1076#1077' '#1090#1072#1083#1086#1085#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
  object pTop: TPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 77
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      613
      77)
    object Label16: TLabel
      Left = 178
      Top = 32
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1086#1084#1091
    end
    object Label12: TLabel
      Left = 165
      Top = 56
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1090' '#1082#1086#1075#1086
    end
    object Label4: TLabel
      Left = 154
      Top = 8
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1087#1077#1088#1072#1094#1080#1103
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1086#1084#1077#1088
    end
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1072#1090#1072
    end
    object lSmenaNum: TLabel
      Left = 9
      Top = 56
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = #1057#1084#1077#1085#1072
      Visible = False
    end
    object dbePrihNum: TDBEdit
      Left = 45
      Top = 4
      Width = 90
      Height = 21
      DataField = 'PRIH_NUM'
      DataSource = TalonPrihRefForm.ds
      TabOrder = 0
    end
    object dbdePrihDate: TDBDateEdit
      Left = 45
      Top = 28
      Width = 90
      Height = 21
      DataField = 'PRIH_DATE'
      DataSource = TalonPrihRefForm.ds
      NumGlyphs = 2
      TabOrder = 1
      OnChange = dbdePrihDateChange
    end
    object dbeSrepNum: TDBEdit
      Left = 45
      Top = 52
      Width = 90
      Height = 21
      DataField = 'SMENA_NUM'
      DataSource = TalonPrihRefForm.ds
      TabOrder = 2
      Visible = False
      OnKeyPress = dbeSrepNumKeyPress
    end
    object dbceEdOper: TRxDBComboEdit
      Left = 208
      Top = 4
      Width = 402
      Height = 21
      DataField = 'OPER_NAME'
      DataSource = TalonPrihRefForm.ds
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = dbceEdOperButtonClick
      OnDblClick = dbceEdOperButtonClick
    end
    object dbceOrgName: TRxDBComboEdit
      Left = 208
      Top = 52
      Width = 402
      Height = 21
      DataField = 'ORG_NAME'
      DataSource = TalonPrihRefForm.ds
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = dbceOrgNameDblClick
      OnDblClick = dbceOrgNameDblClick
    end
    object dbceDepName: TRxDBComboEdit
      Left = 208
      Top = 28
      Width = 402
      Height = 21
      DataField = 'DEP_NAME'
      DataSource = TalonPrihRefForm.ds
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = dbceDepNameDblClick
      OnDblClick = dbceDepNameDblClick
    end
  end
  object pScanInput: TPanel
    Left = 0
    Top = 424
    Width = 613
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      613
      25)
    object Edit3: TEdit
      Left = 3
      Top = 2
      Width = 609
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = #1044#1083#1103' '#1074#1074#1086#1076#1072' '#1090#1072#1083#1086#1085#1086#1074' '#1089#1082#1072#1085#1077#1088#1086#1084' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1082#1091#1088#1089#1086#1088' '#1074' '#1101#1090#1086' '#1087#1086#1083#1077
      OnKeyPress = Edit3KeyPress
    end
  end
  object pCenter: TPanel
    Left = 0
    Top = 77
    Width = 613
    Height = 347
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object dbgTalon: TDBGridEh
      Left = 0
      Top = 0
      Width = 377
      Height = 347
      Align = alLeft
      DataSource = dsTalon
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      PopupMenu = pm
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnExit = dbgTalonExit
      OnKeyPress = dbgTalonKeyPress
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SER'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1057#1077#1088#1080#1103
          Width = 39
        end
        item
          EditButtons = <>
          FieldName = 'NUM'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084#1077#1088
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = 'NPGRP_NAME'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1043#1088#1091#1087#1087#1072' '#1053#1055
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'NOMINAL'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084#1080#1085#1072#1083
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'PRICE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Width = 35
        end
        item
          EditButtons = <>
          FieldName = 'DEP_NAME'
          Footers = <>
          Title.Caption = #1054#1090#1087#1091#1089#1090#1080#1074#1096#1072#1103' '#1086#1088#1075'.'
        end>
    end
    object pInfo: TPanel
      Left = 377
      Top = 0
      Width = 236
      Height = 347
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object pTalon: TPanel
        Left = 0
        Top = 49
        Width = 236
        Height = 265
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          236
          265)
        object Label3: TLabel
          Left = 11
          Top = 1
          Width = 102
          Height = 13
          Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1087#1086' '#1090#1072#1083#1086#1085#1091
        end
        object DBText6: TDBText
          Left = 111
          Top = 1
          Width = 42
          Height = 13
          AutoSize = True
          DataField = 'NUM'
          DataSource = dsTalon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBText5: TDBText
          Left = 167
          Top = 1
          Width = 42
          Height = 13
          AutoSize = True
          DataField = 'SER'
          DataSource = dsTalon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBGrid1: TDBGridEh
          Left = 0
          Top = 16
          Width = 236
          Height = 249
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dsTalonDetail
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'TITLE'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'PRIH_DATE'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1044#1072#1090#1072
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'PRIH_NUM'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1053#1086#1084#1077#1088
              Width = 65
            end>
        end
      end
      object pItog: TPanel
        Left = 0
        Top = 314
        Width = 236
        Height = 33
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          236
          33)
        object DBText2: TDBText
          Left = 178
          Top = 18
          Width = 42
          Height = 13
          Anchors = [akTop, akRight]
          AutoSize = True
          DataField = 'LITR'
          DataSource = dsSum
        end
        object DBText1: TDBText
          Left = 178
          Top = 2
          Width = 42
          Height = 13
          Anchors = [akTop, akRight]
          AutoSize = True
          DataField = 'AMOUNT'
          DataSource = dsSum
        end
        object Label13: TLabel
          Left = 107
          Top = 2
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 127
          Top = 18
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = #1051#1080#1090#1088#1072#1078' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
      object gbPrice: TGroupBox
        Left = 0
        Top = 0
        Width = 236
        Height = 49
        Align = alTop
        Caption = #1062#1077#1085#1099
        DockSite = True
        TabOrder = 2
        object sbPrice: TSpeedButton
          Left = 3
          Top = 25
          Width = 18
          Height = 18
          Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1094#1077#1085#1099
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
          NumGlyphs = 2
          OnClick = sbPriceClick
        end
        object lPrice: TLabel
          Left = 27
          Top = 12
          Width = 198
          Height = 13
          Caption = #1040'-76  A-80   '#1040'-92   '#1040'-95  '#1040'-98    '#1044#1058'    '#1043#1072#1079
        end
        object ce76: TCurrencyEdit
          Left = 23
          Top = 25
          Width = 29
          Height = 18
          AutoSize = False
          Ctl3D = False
          DisplayFormat = '0.00'
          ParentCtl3D = False
          TabOrder = 0
        end
        object ce80: TCurrencyEdit
          Left = 53
          Top = 25
          Width = 29
          Height = 18
          AutoSize = False
          Ctl3D = False
          DisplayFormat = '0.00'
          ParentCtl3D = False
          TabOrder = 1
        end
        object ce92: TCurrencyEdit
          Left = 83
          Top = 25
          Width = 29
          Height = 18
          AutoSize = False
          Ctl3D = False
          DisplayFormat = '0.00'
          ParentCtl3D = False
          TabOrder = 2
        end
        object ce95: TCurrencyEdit
          Left = 113
          Top = 25
          Width = 29
          Height = 18
          AutoSize = False
          Ctl3D = False
          DisplayFormat = '0.00'
          ParentCtl3D = False
          TabOrder = 3
        end
        object ce98: TCurrencyEdit
          Left = 143
          Top = 25
          Width = 29
          Height = 18
          AutoSize = False
          Ctl3D = False
          DisplayFormat = '0.00'
          ParentCtl3D = False
          TabOrder = 4
        end
        object ceDT: TCurrencyEdit
          Left = 173
          Top = 25
          Width = 29
          Height = 18
          AutoSize = False
          Ctl3D = False
          DisplayFormat = '0.00'
          ParentCtl3D = False
          TabOrder = 5
        end
        object ceGaz: TCurrencyEdit
          Left = 203
          Top = 25
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
  end
  object SP: TOilStoredProc
    Left = 104
    Top = 232
  end
  object qTalon: TOilQuery
    SQL.Strings = (
      'select td.*, '
      '       npg.name as npgrp_name/*, '
      '       to_char(null) as dep_name*/'
      '  from oil_talon_data td, oil_np_group npg'
      ' where td.state = '#39'Y'#39
      '   and td.head_id = :id'
      '   and td.head_inst = :inst'
      '   and td.npgrp_id = npg.id'
      ' order by td.ser, td.num')
    MasterSource = TalonPrihRefForm.ds
    CachedUpdates = True
    UpdateObject = uTalon
    BeforePost = qTalonBeforePost
    AfterPost = qTalonAfterPost
    BeforeDelete = qTalonBeforeDelete
    AfterDelete = qTalonAfterPost
    DataSource = TalonPrihRefForm.ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 176
    Top = 128
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
      end
      item
        DataType = ftFloat
        Name = 'INST'
      end>
    object qTalonID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_TALON_DATA.ID'
    end
    object qTalonINST: TFloatField
      FieldName = 'INST'
      Origin = 'OIL_TALON_DATA.INST'
    end
    object qTalonSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'OIL_TALON_DATA.STATE'
      Size = 1
    end
    object qTalonHEAD_ID: TFloatField
      FieldName = 'HEAD_ID'
      Origin = 'OIL_TALON_DATA.HEAD_ID'
    end
    object qTalonHEAD_INST: TFloatField
      FieldName = 'HEAD_INST'
      Origin = 'OIL_TALON_DATA.HEAD_INST'
    end
    object qTalonNPGRP_ID: TFloatField
      FieldName = 'NPGRP_ID'
      Origin = 'OIL_TALON_DATA.NPGRP_ID'
    end
    object qTalonSER: TStringField
      FieldName = 'SER'
      Origin = 'OIL_TALON_DATA.SER'
      Size = 3
    end
    object qTalonNUM: TFloatField
      FieldName = 'NUM'
      Origin = 'OIL_TALON_DATA.NUM'
      DisplayFormat = '#'
      EditFormat = '#'
    end
    object qTalonNOMINAL: TFloatField
      FieldName = 'NOMINAL'
      Origin = 'OIL_TALON_DATA.NOMINAL'
      DisplayFormat = '#'
      EditFormat = '#'
    end
    object qTalonPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = 'OIL_TALON_DATA.PRICE'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object qTalonAUTO_ID: TFloatField
      FieldName = 'AUTO_ID'
      Origin = 'OIL_TALON_DATA.AUTO_ID'
    end
    object qTalonAUTO_INST: TFloatField
      FieldName = 'AUTO_INST'
      Origin = 'OIL_TALON_DATA.AUTO_INST'
    end
    object qTalonEMPLOY_ID: TFloatField
      FieldName = 'EMPLOY_ID'
      Origin = 'OIL_TALON_DATA.EMPLOY_ID'
    end
    object qTalonEMPLOY_INST: TFloatField
      FieldName = 'EMPLOY_INST'
      Origin = 'OIL_TALON_DATA.EMPLOY_INST'
    end
    object qTalonDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
      Origin = 'OIL_TALON_DATA.DATE_MOD'
    end
    object qTalonNPGRP_NAME: TStringField
      FieldName = 'NPGRP_NAME'
      Origin = 'OIL_NP_GROUP.NAME'
      Size = 50
    end
    object qTalonCODE_OBL: TFloatField
      FieldName = 'CODE_OBL'
    end
    object qTalonDEP_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'DEP_NAME'
      LookupDataSet = vtAddition
      LookupKeyFields = 'SER;NUM'
      LookupResultField = 'DEP_NAME'
      KeyFields = 'SER;NUM'
      ReadOnly = True
      Lookup = True
    end
  end
  object dsTalon: TOraDataSource
    DataSet = qTalon
    Left = 208
    Top = 128
  end
  object uTalon: TOraUpdateSQL
    ModifySQL.Strings = (
      'update OIL_TALON_DATA'
      'set'
      '  NPGRP_ID = :NPGRP_ID,'
      '  SER = :SER,'
      '  NUM = :NUM,'
      '  NOMINAL = :NOMINAL,'
      '  PRICE = :PRICE,'
      '  CODE_OBL = :CODE_OBL'
      'where'
      '  ID = :OLD_ID and'
      '  INST = :OLD_INST')
    InsertSQL.Strings = (
      'insert into OIL_TALON_DATA'
      
        '  (ID, INST, STATE, HEAD_ID, HEAD_INST, NPGRP_ID, SER, NUM, NOMI' +
        'NAL, PRICE, CODE_OBL)'
      'values'
      
        '  (:ID, :INST, '#39'Y'#39', :HEAD_ID, :HEAD_INST, :NPGRP_ID, :SER, :NUM,' +
        ' :NOMINAL,  :PRICE, :CODE_OBL)')
    DeleteSQL.Strings = (
      'update OIL_TALON_DATA'
      'set STATE = '#39'N'#39
      'where'
      '  ID = :OLD_ID and'
      '  INST = :OLD_INST')
    Left = 240
    Top = 128
  end
  object qNPGroup: TOilQuery
    SQL.Strings = (
      'select *'
      'from OIL_NP_GROUP'
      'where STATE = '#39'Y'#39)
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 112
    Top = 128
  end
  object qSum: TOilQuery
    SQL.Strings = (
      
        'select count(*) as Amount, sum(Nominal) as Litr, sum(Price * Nom' +
        'inal) as Whole '
      '  from Oil_Talon_Data'
      ' where State = '#39'Y'#39
      '   and Head_Id = :Id'
      '   and Head_Inst = :Inst'
      ' ')
    MasterSource = TalonPrihRefForm.ds
    AutoCalcFields = False
    DataSource = TalonPrihRefForm.ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 328
    Top = 304
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
      end
      item
        DataType = ftFloat
        Name = 'INST'
      end>
  end
  object dsSum: TOraDataSource
    DataSet = qSum
    Left = 360
    Top = 304
  end
  object dsTalonDetail: TOraDataSource
    DataSet = qTalonDetail
    OnDataChange = dsTalonDetailDataChange
    Left = 368
    Top = 176
  end
  object qWork: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 152
    Top = 360
  end
  object qCheckUp: TOilQuery
    SQL.Strings = (
      'select decode(Tip, '#39'P'#39', Date_ + 0.1, Date_) as Prih_Date,'
      '       decode(Tip, '#39'P'#39', 1, 2)'
      '  from V_Oil_Talon_Op'
      ' where Dep_Id = :Inst'
      '   and Ser = :Ser'
      '   and Num = :Num'
      '   and Date_ > :Date_'
      ' order by Prih_Date desc')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 32
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Inst'
      end
      item
        DataType = ftString
        Name = 'ser'
      end
      item
        DataType = ftInteger
        Name = 'num'
      end
      item
        DataType = ftUnknown
        Name = 'Date_'
      end>
  end
  object qCheckDown: TOilQuery
    SQL.Strings = (
      'select Date_ + 0.1 as Prih_Date, 1'
      '  from V_Oil_Talon_Op'
      ' where Tip = '#39'P'#39
      '   and Dep_Id = :Inst'
      '   and Ser = :Ser'
      '   and Num = :Num'
      '   and not ((head_id = :MainId) and (head_Inst = :MainInst))'
      '   and Date_ <= :Date_'
      'union'
      'select Date_, 2'
      '  from V_Oil_Talon_Op'
      ' where Tip = '#39'O'#39
      '   and Dep_Id = :Inst'
      '   and Ser = :Ser'
      '   and Num = :Num'
      '   and Date_ <= :Date_'
      ' order by Prih_Date desc')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 32
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Inst'
      end
      item
        DataType = ftString
        Name = 'ser'
      end
      item
        DataType = ftInteger
        Name = 'num'
      end
      item
        DataType = ftInteger
        Name = 'MainId'
      end
      item
        DataType = ftInteger
        Name = 'MainInst'
      end
      item
        DataType = ftUnknown
        Name = 'Date_'
      end>
  end
  object qTalonDetail: TOilQuery
    SQL.Strings = (
      '/* '#1047#1072#1087#1088#1086#1089' '#1080#1079#1084#1077#1085#1103#1077#1090#1089#1103' '#1085#1072' '#1083#1077#1090#1091' - '#1085#1077' '#1084#1077#1085#1103#1090#1100' '#1087#1086#1088#1103#1076#1086#1082' '#1089#1090#1088#1086#1082'! */'
      'select decode(Tip, '#39'P'#39', '#39#1055#1088#1080#1093#1086#1076#39', '#39#1054#1090#1087#1091#1089#1082#39') as Title,'
      '       Date_ as Prih_Date,'
      '       decode(Tip, '#39'P'#39', 2, 1),'
      '       Head_Num as Prih_Num,'
      '       Nominal,'
      '       NPGrp_Id,'
      '       NP_Group.Name as NPGrpName'
      '  from V_Oil_Talon_Op, v_Oil_NP_Group NP_Group'
      ' where Ser = :Ser'
      '   and Num = :Num'
      '   and Code_Obl = :code_obl'
      '   and NPGrp_Id = NP_Group.Id(+)'
      ' order by 2 desc, 3 desc')
    MasterSource = dsTalon
    AutoCalcFields = False
    DataSource = dsTalon
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 360
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'SER'
      end
      item
        DataType = ftFloat
        Name = 'NUM'
      end
      item
        DataType = ftUnknown
        Name = 'code_obl'
      end>
  end
  object qCheckDouble: TOilQuery
    SQL.Strings = (
      'select Id, Inst'
      '  from Oil_Talon_Data'
      ' where State = '#39'Y'#39
      '   and Head_Id = :Head_Id'
      '   and Head_Inst = :Head_Inst'
      '   and Ser = :Ser'
      '   and Num = :Num'
      '   and not(Id = :Id and Inst = :Inst)'
      ' ')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 32
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Head_Id'
      end
      item
        DataType = ftInteger
        Name = 'Head_Inst'
      end
      item
        DataType = ftString
        Name = 'Ser'
      end
      item
        DataType = ftInteger
        Name = 'Num'
      end
      item
        DataType = ftInteger
        Name = 'Id'
      end
      item
        DataType = ftInteger
        Name = 'Inst'
      end>
  end
  object qExistsReturn: TOilQuery
    SQL.Strings = (
      'select o.*'
      '  from V_Oil_Talon_Op o'
      ' where Tip = '#39'O'#39
      '   and Dep_Id = :Inst'
      '   and Org_Id = :Org_id'
      '   and Org_Inst = :Org_Inst'
      '   and Ser = :Ser'
      '   and Num = :Num'
      ' order by date_ desc')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 88
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Inst'
      end
      item
        DataType = ftUnknown
        Name = 'Org_id'
      end
      item
        DataType = ftUnknown
        Name = 'Org_Inst'
      end
      item
        DataType = ftString
        Name = 'ser'
      end
      item
        DataType = ftInteger
        Name = 'num'
      end>
  end
  object qCheckEmission: TOilQuery
    SQL.Strings = (
      'select Id, Inst'
      '  from V_Oil_Talon_Op'
      ' where Tip = '#39'P'#39
      '   and oper_id = 183'
      '   and Ser = :Ser'
      '   and Num = :Num'
      '   and not (Id = :Id and Inst = :Inst)')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 32
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Ser'
      end
      item
        DataType = ftUnknown
        Name = 'Num'
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
  object qPrice: TOilQuery
    SQL.Strings = (
      
        'select decode(npt.np_grp,5,4,npt.np_grp) as np_grp,max(dr.s_pric' +
        'e) as price'
      
        'from oil_dr_data dr,oil_daily_rep drep,oil_rashod r,oil_part p,v' +
        '_oil_np_type npt'
      
        'where dr.state='#39'Y'#39' and drep.state='#39'Y'#39' and r.state='#39'Y'#39' and p.stat' +
        'e='#39'Y'#39
      '  and dr.rep_id=drep.id and dr.rep_inst=drep.inst'
      '  and dr.ttn_id=r.id and dr.ttn_inst=r.inst'
      '  and r.part_id=p.id and r.part_inst=p.inst'
      '  and p.np_type=npt.id'
      '  and trunc(drep.rep_date)=:date_'
      '  and drep.azs_id=:azs_id and drep.azs_id=drep.azs_inst'
      '  and npt.np_grp in (3,4,5,6,7,10)'
      'group by decode(npt.np_grp,5,4,npt.np_grp)')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 104
    Top = 296
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'azs_id'
        ParamType = ptInput
      end>
  end
  object qCheckSpis: TOilQuery
    SQL.Strings = (
      'select count(*) as co'
      '  from v_oil_talon_op'
      ' where tip = '#39'O'#39
      '   and oper_id = 192'
      '   and ser = :ser'
      '   and num = :num'
      '   and inst = :inst'
      '   and head_inst = :inst'
      '   and date_ < :date_')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 32
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'ser'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'num'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'date_'
      end>
  end
  object SD: TSaveDialog
    Filter = 'dbf|*.dbf*|All files|* *'
    Left = 176
    Top = 176
  end
  object qLastPrice: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select npgrp_id,'
      '       to_number(ltrim(substr(max(to_char(date_, '#39'YYYYMMDD'#39') ||'
      '                                  lpad(to_char(price), 6)),'
      '                              9))) price'
      '  from v_oil_talon_op'
      ' where date_ between :date_ - 10 and :date_'
      ' group by npgrp_id')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 32
    Top = 88
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date_'
      end>
  end
  object qTalonOnHands: TOilQuery
    SQL.Strings = (
      'select odep.id as from_id,'
      '       odep.name as from_name,'
      '       oo.id,'
      '       oo.name as org_name,'
      '       oo.id_num as org_okpo,'
      '       dog.dog,'
      '       tal.date_,'
      '       npg.name as np_group,'
      '       tal.nominal,'
      '       tal.ser,'
      '       tal.num,'
      '       tal.nominal as litr,'
      '       tal.price,'
      '       1 as shtuki,'
      '       round(tal.nominal * tal.price, 2) as summa,'
      '       tal.is_filial as generation'
      '  from (select v.*,'
      
        '               row_number() over(partition by ser, num order by ' +
        'date_ desc, tip desc) as rnum'
      '          from v_oil_talon_op_un v, v_dual_date ddate'
      '         where date_ < :BeginDate'
      
        '           and not ((is_filial in (1, 2) and oper_id = 183 and d' +
        'ate_ <= ddate.value) or'
      '                 (oper_id = 200 and date_ = ddate.value))) tal,'
      '       (select id, inst, '
      '               max(name) as name, '
      '               max(id_num) as id_num'
      '          from (select id, inst, name, id_num'
      '                  from andriy.oil_org'
      '                 union'
      '                select id, inst, name, id_num'
      '                  from victory.oil_org'
      '                ) group by id, inst) oo,'
      '       (select id, inst, dog'
      '          from andriy.oil_dog'
      '         union all'
      '        select id, inst, dog '
      '          from victory.oil_dog) dog,'
      '       oil_org odep,'
      '       oil_np_group npg'
      ' where tal.rnum = 1'
      '   and tal.tip = '#39'O'#39
      '   and tal.oper_id in (190, 245, 244)'
      '   and tal.from_id = odep.id'
      '   and tal.from_inst = odep.inst'
      '   and tal.to_id = oo.id'
      '   and tal.to_inst = oo.inst'
      '   and tal.dog_id = dog.id(+)'
      '   and tal.dog_inst = dog.inst(+)'
      '   and tal.npgrp_id = npg.id'
      '   and tal.is_filial in (1,2)'
      '   and oo.id = :ClientId')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 232
    Top = 232
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftInteger
        Name = 'ClientId'
      end>
  end
  object qTalonOnHandsSerNum: TOilQuery
    SQL.Strings = (
      'select odep.id as from_id,'
      '       odep.name as from_name,'
      '       oo.id,'
      '       oo.name as org_name,'
      '       oo.id_num as org_okpo,'
      '       dog.dog,'
      '       tal.date_,'
      '       npg.name as np_group,'
      '       tal.nominal,'
      '       tal.ser,'
      '       tal.num,'
      '       tal.nominal as litr,'
      '       tal.price,'
      '       1 as shtuki,'
      '       round(tal.nominal * tal.price, 2) as summa,'
      '       tal.is_filial as generation'
      '  from (select v.*,'
      
        '               row_number() over(partition by ser, num order by ' +
        'date_ desc, tip desc) as rnum'
      '          from v_oil_talon_op_un v, v_dual_date ddate'
      '         where date_ < :BeginDate'
      '           and ser = :ser and num = :num'
      
        '           and not ((is_filial in (1, 2) and oper_id = 183 and d' +
        'ate_ <= ddate.value) or'
      '                 (oper_id = 200 and date_ = ddate.value))) tal,'
      '       (select id, inst, '
      '               max(name) as name, '
      '               max(id_num) as id_num'
      '          from (select id, inst, name, id_num'
      '                  from andriy.oil_org'
      '                 union'
      '                select id, inst, name, id_num'
      '                  from victory.oil_org'
      '                ) group by id, inst) oo,'
      '       (select id, inst, dog'
      '          from andriy.oil_dog'
      '         union all'
      '        select id, inst, dog '
      '          from victory.oil_dog) dog,'
      '       oil_org odep,'
      '       oil_np_group npg'
      ' where tal.rnum = 1'
      '   and tal.tip = '#39'O'#39
      '   and tal.oper_id in (190, 245, 244)'
      '   and tal.from_id = odep.id'
      '   and tal.from_inst = odep.inst'
      '   and tal.to_id = oo.id'
      '   and tal.to_inst = oo.inst'
      '   and tal.dog_id = dog.id(+)'
      '   and tal.dog_inst = dog.inst(+)'
      '   and tal.npgrp_id = npg.id'
      '   and tal.is_filial in (1,2)'
      '   and oo.id = :ClientId')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 232
    Top = 280
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftString
        Name = 'ser'
      end
      item
        DataType = ftInteger
        Name = 'num'
      end
      item
        DataType = ftInteger
        Name = 'ClientId'
      end>
  end
  object pm: TPopupMenu
    Left = 208
    Top = 176
    object miRefreshPrice: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1094#1077#1085#1099' '#1080' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      OnClick = miRefreshPriceClick
    end
  end
  object vtAddition: TVirtualTable
    Options = [voStored]
    FieldDefs = <
      item
        Name = 'SER'
        DataType = ftString
        Size = 57
      end
      item
        Name = 'NUM'
        DataType = ftInteger
      end
      item
        Name = 'DEP_NAME'
        DataType = ftString
        Size = 57
      end>
    Left = 232
    Top = 325
    Data = {
      0200030003005345520100390003004E554D0300000008004445505F4E414D45
      01003900000000000000}
    object vtAdditionSER: TStringField
      FieldName = 'SER'
      Size = 80
    end
    object vtAdditionNUM: TIntegerField
      FieldName = 'NUM'
    end
    object vtAdditionDEP_NAME: TStringField
      FieldName = 'DEP_NAME'
      Size = 80
    end
  end
end
