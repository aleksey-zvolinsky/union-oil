inherited PrihTransForm: TPrihTransForm
  Left = 411
  Top = 253
  Width = 685
  Height = 510
  Caption = #1055#1088#1080#1093#1086#1076' '#1087#1086' '#1087#1077#1088#1077#1074#1072#1083#1082#1077
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pBottom: TPanel
    Top = 443
    Width = 677
    object sbAdd: TSpeedButton [0]
      Left = 4
      Top = 4
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
      Top = 4
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
    object sbMove: TSpeedButton [2]
      Left = 60
      Top = 4
      Width = 33
      Height = 25
      AllowAllUp = True
      GroupIndex = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      OnClick = sbMoveClick
    end
    inherited pBtn: TPanel
      Left = 480
    end
    object pnlMove: TPanel
      Left = 96
      Top = 4
      Width = 117
      Height = 25
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object sbCheckAll: TSpeedButton
        Tag = 1
        Left = 1
        Top = 0
        Width = 25
        Height = 25
        Hint = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077' '#1082#1086#1083#1086#1085#1082#1080
        Flat = True
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333333388F3333333333000033334224333333333333338338F333333333
          0000333422224333333333333833338F33333333000033422222243333333333
          83333338F3333333000034222A22224333333338F33F33338F33333300003222
          A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
          38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
          2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
          0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
          333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
          33333A2224A2233333333338F338F83300003333333333A2224A333333333333
          8F338F33000033333333333A222433333333333338F338F30000333333333333
          A224333333333333338F38F300003333333333333A223333333333333338F8F3
          000033333333333333A3333333333333333383330000}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCheckAllClick
      end
      object sbUncheckAll: TSpeedButton
        Left = 26
        Top = 0
        Width = 25
        Height = 25
        Hint = #1057#1085#1103#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077' '#1089#1086' '#1074#1089#1077#1093' '#1082#1086#1083#1086#1085#1086#1082
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888889088888
          8888888887F88888888888889990888888888888777F88888888888899908888
          88888888777F88888888888999990888888888877777F8888888889999990888
          888888777777F888888887990899908888888877F8777F888888790890899088
          888887F87F877F8888888889990999088888888777F777F88888888999089908
          8888888777F877F888888799990889908888887777F8877F8888899999900879
          08888777777FF877F8887998899990879088877887777F877F88988888999008
          8990788888777FF8877F888888889990888888888888777F8888888888888999
          0888888888888777F88888888888888990888888888888877F88}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCheckAllClick
      end
      object RxSpeedButton1: TRxSpeedButton
        Left = 31
        Top = 0
        Width = 82
        Height = 25
        DropDownMenu = pmMove
        Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080
      end
      object Edit1: TEdit
        Left = 136
        Top = 4
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'Edit1'
      end
    end
    object edSearch: TEdit
      Left = 212
      Top = 6
      Width = 121
      Height = 21
      Hint = #1055#1086#1080#1089#1082' '#1094#1080#1089#1090#1077#1088#1085#1099
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnChange = edSearchChange
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 677
    Height = 201
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 673
      Height = 97
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel5: TPanel
        Left = 2
        Top = 2
        Width = 127
        Height = 93
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          127
          93)
        object Label3: TLabel
          Left = 4
          Top = 4
          Width = 34
          Height = 13
          Caption = #1053#1086#1084#1077#1088
        end
        object Label4: TLabel
          Left = 6
          Top = 44
          Width = 26
          Height = 13
          Caption = #1044#1072#1090#1072
        end
        object edNum: TEdit
          Left = 4
          Top = 20
          Width = 113
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clScrollBar
          Enabled = False
          TabOrder = 0
        end
        object deDate: TDateEdit
          Left = 4
          Top = 60
          Width = 117
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object Panel7: TPanel
        Left = 129
        Top = 2
        Width = 176
        Height = 93
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          176
          93)
        object Label7: TLabel
          Left = 4
          Top = 4
          Width = 22
          Height = 13
          Caption = #1043#1058#1044
        end
        object Label8: TLabel
          Left = 4
          Top = 44
          Width = 44
          Height = 13
          Caption = #1044#1086#1075#1086#1074#1086#1088
        end
        object sbClearGTD: TSpeedButton
          Left = 145
          Top = 20
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
        end
        object sbClearDog: TSpeedButton
          Left = 145
          Top = 60
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
        end
        object ceGTD: TComboEdit
          Left = 4
          Top = 20
          Width = 138
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnButtonClick = ceGTDButtonClick
          OnDblClick = ceGTDButtonClick
        end
        object ceDog: TComboEdit
          Left = 4
          Top = 60
          Width = 138
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnButtonClick = ceDogButtonClick
          OnDblClick = ceDogButtonClick
        end
      end
      object Panel8: TPanel
        Left = 305
        Top = 2
        Width = 366
        Height = 93
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        DesignSize = (
          366
          93)
        object Label9: TLabel
          Left = 4
          Top = 4
          Width = 77
          Height = 13
          Caption = #1047#1072#1074#1086#1076' ('#1086#1090' '#1082#1086#1075#1086')'
        end
        object Label10: TLabel
          Left = 4
          Top = 44
          Width = 114
          Height = 13
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' ('#1082#1086#1084#1091')'
        end
        object Label13: TLabel
          Left = 178
          Top = 4
          Width = 87
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1042#1083#1072#1076#1077#1083#1077#1094' '#1090#1086#1074#1072#1088#1072
        end
        object Label15: TLabel
          Left = 178
          Top = 44
          Width = 110
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1050#1086#1085#1077#1095#1085#1099#1081' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
        end
        object ceZavod: TComboEdit
          Left = 4
          Top = 20
          Width = 167
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnButtonClick = ceZavodButtonClick
          OnDblClick = ceZavodButtonClick
        end
        object ceDep: TComboEdit
          Left = 4
          Top = 60
          Width = 167
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnButtonClick = ceDepButtonClick
          OnDblClick = ceDepButtonClick
        end
        object cePartFrom: TComboEdit
          Left = 178
          Top = 20
          Width = 177
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akTop, akRight]
          NumGlyphs = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnButtonClick = cePartFromButtonClick
          OnDblClick = cePartFromButtonClick
        end
        object cePartTo: TComboEdit
          Left = 178
          Top = 60
          Width = 177
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akTop, akRight]
          NumGlyphs = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnButtonClick = cePartToButtonClick
          OnDblClick = cePartToButtonClick
        end
      end
    end
    object Panel9: TPanel
      Left = 2
      Top = 99
      Width = 673
      Height = 100
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel10: TPanel
        Left = 2
        Top = 2
        Width = 167
        Height = 96
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          167
          96)
        object Label6: TLabel
          Left = 6
          Top = 44
          Width = 131
          Height = 13
          Caption = #1044#1072#1090#1072' '#1087#1088#1080#1093#1086#1076#1072' '#1085#1072' '#1089#1090#1072#1085#1094#1080#1102
        end
        object Label14: TLabel
          Left = 8
          Top = 4
          Width = 45
          Height = 13
          Caption = #1057#1090#1072#1085#1094#1080#1103':'
        end
        object deDateStat: TDateEdit
          Left = 8
          Top = 60
          Width = 153
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 2
          TabOrder = 0
        end
        object ceRailStat: TComboEdit
          Left = 8
          Top = 20
          Width = 150
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnButtonClick = ceRailStatButtonClick
          OnDblClick = ceRailStatButtonClick
        end
      end
      object Panel11: TPanel
        Left = 169
        Top = 2
        Width = 339
        Height = 96
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          339
          96)
        object Label1: TLabel
          Left = 8
          Top = 4
          Width = 37
          Height = 13
          Caption = #1055#1072#1088#1090#1080#1103
        end
        object Label2: TLabel
          Left = 12
          Top = 52
          Width = 29
          Height = 13
          Caption = #1044#1072#1090#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 12
          Top = 72
          Width = 41
          Height = 13
          Caption = #1058#1080#1087' '#1053#1055':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblPartDate: TLabel
          Left = 60
          Top = 52
          Width = 61
          Height = 13
          AutoSize = False
          Caption = 'lblPartDate'
        end
        object lblNpType: TLabel
          Left = 60
          Top = 72
          Width = 271
          Height = 13
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'lblNpType'
          ParentShowHint = False
          ShowHint = True
        end
        object sbPartCreate: TRxSpeedButton
          Left = 258
          Top = 20
          Width = 77
          Height = 21
          Anchors = [akTop, akRight]
          DropDownMenu = pmPart
          Caption = #1057#1086#1079#1076#1072#1090#1100
        end
        object cePart: TComboEdit
          Left = 8
          Top = 20
          Width = 246
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 0
          OnButtonClick = cePartButtonClick
          OnDblClick = cePartButtonClick
        end
      end
      object Panel12: TPanel
        Left = 508
        Top = 2
        Width = 163
        Height = 96
        Align = alRight
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object Label11: TLabel
          Left = 8
          Top = 12
          Width = 69
          Height = 13
          Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099
        end
        object sbCert: TSpeedButton
          Left = 83
          Top = 9
          Width = 26
          Height = 22
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1090#1080#1087#1099' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074' '#1089#1087#1080#1089#1082#1086#1084
          AllowAllUp = True
          GroupIndex = 2
          Flat = True
          Glyph.Data = {
            3E040000424D3E04000000000000760000002800000058000000160000000100
            040000000000C803000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            777777777777777777777777777777777777FFFFFFF777777FFFFFFF77777777
            7777777777777777777777777777777777777000000077777700000007788888
            88F777FF8888888F7000000077777700000007700000007777770000000770FF
            FFF07777970FFFFF0778F77778F77F8F8F77778F70FFFFF07777970FFFFF0770
            FFFFF07777970FFFFF0770888FF07779970FFFFF0778F77778F7F88F8F77778F
            70FFFFF07779970FFFFF0770FFFFF07779970FFFFF0770FFFFF07799970FFFFF
            0778F77778FF878F8F77778F70FFFFF07799970FFFFF0770FFFFF07799970FFF
            FF07708F88F07999970FFFFF0778F77778F8F78F8F77778F70FFFFF07999970F
            FFFF0770FFFFF07999970FFFFF0770FFFFF07799970FFFFF0778F77778F78F8F
            8F77778F70FFFFF07799970CCCCC0770FFFFF07799970CCCCC07708888807779
            970FFFFF0778F77778F7788F8F77778F70FFFFF077799708888C0770FFFFF077
            799708888C0770FFFFF07777970FFFFF0778F77778F777878F77778F70FFFFF0
            7777970FFFFF0770FFFFF07777970FFFFF077088FFF07777770FFFFF0778F777
            78F777778F77778F7088FFF07777770888FF077088FFF07777770888FF0770FF
            FFF07777770FFFFF0778F77778FF77778F77778F70FFFFF07777770FFFFF0770
            FFFFF07777770FFFFF0770888FF07C77770FFFFF0778F77778F8F7778F77778F
            70888FF07C77770888880770888FF07C77770888880770FFFFF07CC7770FFFFF
            0778F77778F88F778F77778F70FFFFF07CC7770FFFFF0770FFFFF07CC7770FFF
            FF0770888FF07CCC770FFFFF0778F77778F8F8F78F77778F70888FF07CCC7708
            888F0770888FF07CCC7708888F0770CCCCC07CCCC70FFFFF0778F77778F8F787
            8F77778F70FFFFF07CCCC70FFFFF0770FFFFF07CCCC70FFFFF07708888C07CCC
            770FFFFF0778F77778F8F8778F77778F708888F07CCC77088FFF07708888F07C
            CC77088FFF0770FFFFF07CC7770FFFFF0778F77778F887778F77778F70FFFFF0
            7CC7770FFFFF0770FFFFF07CC7770FFFFF0770888FF07C77770FFFFF0778FFFF
            F8F877778FFFFF8F7088FFF07C77770888FF077088FFF07C77770888FF077000
            0000777777000000077888888877777788888887700000007777770000000770
            0000007777770000000777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777}
          NumGlyphs = 4
          OnClick = sbCertClick
        end
        object Label12: TLabel
          Left = 8
          Top = 40
          Width = 116
          Height = 13
          Caption = #1055#1086#1083#1103' '#1076#1083#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074': '
        end
        object sbDocuments: TSpeedButton
          Left = 127
          Top = 37
          Width = 26
          Height = 22
          Hint = #1042#1099#1073#1088#1072#1090#1100' '#1090#1080#1087#1099' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074' '#1089#1087#1080#1089#1082#1086#1084
          AllowAllUp = True
          GroupIndex = 2
          Flat = True
          Glyph.Data = {
            3E040000424D3E04000000000000760000002800000058000000160000000100
            040000000000C803000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            777777777777777777777777777777777777FFFFFFF777777FFFFFFF77777777
            7777777777777777777777777777777777777000000077777700000007788888
            88F777FF8888888F7000000077777700000007700000007777770000000770FF
            FFF07777970FFFFF0778F77778F77F8F8F77778F70FFFFF07777970FFFFF0770
            FFFFF07777970FFFFF0770888FF07779970FFFFF0778F77778F7F88F8F77778F
            70FFFFF07779970FFFFF0770FFFFF07779970FFFFF0770FFFFF07799970FFFFF
            0778F77778FF878F8F77778F70FFFFF07799970FFFFF0770FFFFF07799970FFF
            FF07708F88F07999970FFFFF0778F77778F8F78F8F77778F70FFFFF07999970F
            FFFF0770FFFFF07999970FFFFF0770FFFFF07799970FFFFF0778F77778F78F8F
            8F77778F70FFFFF07799970CCCCC0770FFFFF07799970CCCCC07708888807779
            970FFFFF0778F77778F7788F8F77778F70FFFFF077799708888C0770FFFFF077
            799708888C0770FFFFF07777970FFFFF0778F77778F777878F77778F70FFFFF0
            7777970FFFFF0770FFFFF07777970FFFFF077088FFF07777770FFFFF0778F777
            78F777778F77778F7088FFF07777770888FF077088FFF07777770888FF0770FF
            FFF07777770FFFFF0778F77778FF77778F77778F70FFFFF07777770FFFFF0770
            FFFFF07777770FFFFF0770888FF07C77770FFFFF0778F77778F8F7778F77778F
            70888FF07C77770888880770888FF07C77770888880770FFFFF07CC7770FFFFF
            0778F77778F88F778F77778F70FFFFF07CC7770FFFFF0770FFFFF07CC7770FFF
            FF0770888FF07CCC770FFFFF0778F77778F8F8F78F77778F70888FF07CCC7708
            888F0770888FF07CCC7708888F0770CCCCC07CCCC70FFFFF0778F77778F8F787
            8F77778F70FFFFF07CCCC70FFFFF0770FFFFF07CCCC70FFFFF07708888C07CCC
            770FFFFF0778F77778F8F8778F77778F708888F07CCC77088FFF07708888F07C
            CC77088FFF0770FFFFF07CC7770FFFFF0778F77778F887778F77778F70FFFFF0
            7CC7770FFFFF0770FFFFF07CC7770FFFFF0770888FF07C77770FFFFF0778FFFF
            F8F877778FFFFF8F7088FFF07C77770888FF077088FFF07C77770888FF077000
            0000777777000000077888888877777788888887700000007777770000000770
            0000007777770000000777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777}
          NumGlyphs = 4
          OnClick = sbDocumentsClick
        end
      end
    end
  end
  object dbg: TDBGridEh [2]
    Left = 0
    Top = 201
    Width = 677
    Height = 242
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    Color = clWhite
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
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    PopupMenu = pm
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
        Checkboxes = True
        EditButtons = <>
        FieldName = 'CHECKED'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        Title.Caption = ' '
        Visible = False
        Width = 15
      end
      item
        Color = 15658991
        EditButtons = <>
        FieldName = 'TANK_NUM'
        Footer.Value = #1048#1090#1086#1075#1086
        Footer.ValueType = fvtStaticText
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1094#1080#1089#1090#1077#1088#1085#1099
        Width = 78
      end
      item
        Color = 15658991
        EditButtons = <>
        FieldName = 'ZD_NAKL'
        Footer.ValueType = fvtCount
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1046#1044' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
        Width = 84
      end
      item
        Color = 15658991
        EditButtons = <>
        FieldName = 'TANK_TYPE_NAME'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087' '#1094#1080#1089#1090#1077#1088#1085#1099
        Width = 79
      end
      item
        Color = 15658991
        EditButtons = <>
        FieldName = 'ZAVOD_COUNT'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1054#1090#1087#1091#1097#1077#1085#1086' '#1053#1055' '#1073#1088#1091#1090#1090#1086', '#1090#1086#1085#1085
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Serif'
        Title.Font.Style = []
      end
      item
        EditButtons = <>
        FieldName = 'FULL_COUNT'
        Footer.DisplayFormat = '0.000'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1055' '#1073#1088#1091#1090#1090#1086', '#1090#1086#1085#1085
      end
      item
        EditButtons = <>
        FieldName = 'WATER_COUNT'
        Footer.DisplayFormat = '0.000'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1042#1086#1076#1072', '#1090#1086#1085#1085
      end
      item
        Color = 15658991
        DisplayFormat = '0.000'
        EditButtons = <>
        FieldName = 'NP_COUNT'
        Footer.DisplayFormat = '0.000'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1055' '#1085#1077#1090#1090#1086', '#1090#1086#1085#1085
      end
      item
        EditButtons = <>
        FieldName = 'DENSITY'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
      end
      item
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = dbgColumns3EditButtons0Click
          end>
        FieldName = 'REZ_NUM'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'TEMPERATURE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1058#1077#1084#1087'-'#1088#1072
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'INST'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'STATE'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ZRD_ID'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'NP_TYPE_NAME'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087' '#1053#1055
        Visible = False
        Width = 118
      end
      item
        EditButtons = <>
        FieldName = 'ZRD_INST'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'TANK_TYPE'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'NP_TYPE'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'LEVEL_MM'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1059#1088#1086#1074#1077#1085#1100', '#1084#1084'.'
      end
      item
        EditButtons = <>
        FieldName = 'PV'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1087'/'#1074
        Width = 51
      end>
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select *'
      'from v_oil_prihod_transfer_zavod'
      'where id=:id and inst=:inst'
      'order by zrd_id')
    Left = 16
  end
  object mt: TMemoryTable
    AfterInsert = mtAfterInsert
    BeforePost = mtBeforePost
    AfterPost = mtAfterPost
    BeforeDelete = mtBeforeDelete
    Left = 324
    Top = 288
    object mtID: TIntegerField
      FieldName = 'ID'
    end
    object mtINST: TIntegerField
      FieldName = 'INST'
    end
    object mtTANK_NUM: TStringField
      FieldName = 'TANK_NUM'
      Size = 32
    end
    object mtTANK_TYPE: TIntegerField
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
    object mtLEVEL_MM: TFloatField
      FieldName = 'LEVEL_MM'
    end
    object mtPV: TFloatField
      FieldName = 'PV'
    end
    object mtFULL_COUNT: TFloatField
      FieldName = 'FULL_COUNT'
    end
    object mtNP_COUNT: TFloatField
      FieldName = 'NP_COUNT'
    end
    object mtWATER_COUNT: TFloatField
      FieldName = 'WATER_COUNT'
    end
    object mtTANK_TYPE_NAME: TStringField
      FieldName = 'TANK_TYPE_NAME'
      Size = 32
    end
    object mtNP_TYPE_NAME: TStringField
      FieldName = 'NP_TYPE_NAME'
      Size = 50
    end
    object mtZRD_ID: TIntegerField
      FieldName = 'ZRD_ID'
    end
    object mtZRD_INST: TIntegerField
      FieldName = 'ZRD_INST'
    end
    object mtNP_TYPE: TIntegerField
      FieldName = 'NP_TYPE'
    end
    object mtSTATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object mtREZ_ID: TIntegerField
      FieldName = 'REZ_ID'
    end
    object mtREZ_INST: TIntegerField
      FieldName = 'REZ_INST'
    end
    object mtREZ_NUM: TStringField
      FieldName = 'REZ_NUM'
    end
    object mtDET2_ID: TIntegerField
      FieldName = 'DET2_ID'
    end
    object mtDET2_INST: TIntegerField
      FieldName = 'DET2_INST'
    end
    object mtZAVOD_COUNT: TFloatField
      FieldName = 'ZAVOD_COUNT'
      DisplayFormat = '0.000'
    end
    object mtCHECKED: TIntegerField
      FieldName = 'CHECKED'
    end
  end
  object ds: TDataSource
    DataSet = mt
    Left = 336
    Top = 276
  end
  object mtCert: TMemoryTable
    AfterInsert = mtCertAfterInsert
    Left = 570
    Top = 145
    object mtCertID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object mtCertINST: TIntegerField
      FieldName = 'INST'
      Visible = False
    end
    object mtCertSTATE: TStringField
      FieldName = 'STATE'
      Visible = False
      Size = 1
    end
    object mtCertNAME: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NAME'
      Size = 32
    end
    object mtCertDATE_: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATE_'
    end
  end
  object qCert: TOilQuery
    SQL.Strings = (
      'select id,inst,state,name,date_'
      'from oil_prihod_cert'
      'where prih_id=:id and prih_inst=:inst'
      'order by name')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 538
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end>
  end
  object pmPart: TPopupMenu
    Left = 451
    Top = 149
  end
  object qNextPart: TOilQuery
    SQL.Strings = (
      
        'select lpad(nvl(max(to_number(substr(dog, length(:prefix) + 1)))' +
        ' + 1, 1),3,0) as num'
      '  from oil_part'
      ' where dog like :prefix || '#39'%'#39
      '   and state = '#39'Y'#39
      '   and trim(translate(substr(dog, length(:prefix) + 1),'
      '                      '#39'0123456789'#39','
      '                      '#39'          '#39')) is null'
      '   and trunc(dog_date,'#39'YYYY'#39')=trunc(sysdate,'#39'YYYY'#39')'
      '   and inst=ov.GetVal('#39'INST'#39')')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 172
    Top = 268
    ParamData = <
      item
        DataType = ftString
        Name = 'prefix'
        ParamType = ptInput
      end>
  end
  object pm: TPopupMenu
    Left = 500
    Top = 284
    object N1: TMenuItem
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1085#1072' '#1074#1089#1077
      object N2: TMenuItem
        Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1091
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088
        OnClick = N4Click
      end
    end
  end
  object pmMove: TPopupMenu
    Left = 184
    Top = 400
    object miExisting: TMenuItem
      Caption = #1042' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1081' '#1072#1082#1090' '#1089#1083#1080#1074#1072
      OnClick = miExistingClick
    end
    object miSplit: TMenuItem
      Caption = #1042' '#1085#1086#1074#1099#1081' '#1072#1082#1090' '#1089#1083#1080#1074#1072
      OnClick = miSplitClick
    end
  end
end
