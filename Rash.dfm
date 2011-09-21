inherited RashForm: TRashForm
  Left = 314
  Top = 254
  ActiveControl = edActDate
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1090#1087#1091#1089#1082' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
  ClientHeight = 584
  ClientWidth = 711
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBtn: TPanel
    Left = 0
    Top = 552
    Width = 711
    Height = 32
    Align = alBottom
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 5
    object bOkAdd: TRxSpeedButton
      Left = 604
      Top = 4
      Width = 14
      Height = 25
      DropDownMenu = pmSave
    end
    object pPartLeft: TPanel
      Left = 2
      Top = 2
      Width = 160
      Height = 28
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object lPartLeft: TLabel
        Left = 76
        Top = 8
        Width = 77
        Height = 13
        AutoSize = False
        Caption = 'lPartLeft'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPartLeft: TLabel
        Left = 8
        Top = 8
        Width = 63
        Height = 13
        Caption = #1054#1089#1090'. '#1087#1072#1088#1090#1080#1080':'
      end
    end
    object pRezLeft: TPanel
      Left = 162
      Top = 2
      Width = 148
      Height = 28
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object lblRezLeft: TLabel
        Left = 8
        Top = 8
        Width = 46
        Height = 13
        Caption = #1054#1089#1090'. '#1088#1077#1079':'
      end
      object lRezLeft: TLabel
        Left = 58
        Top = 8
        Width = 83
        Height = 13
        AutoSize = False
        Caption = 'lRezLeft'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object pPartRezLeft: TPanel
      Left = 310
      Top = 2
      Width = 201
      Height = 28
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 4
      object lblPartRezLeft: TLabel
        Left = 8
        Top = 8
        Width = 93
        Height = 13
        Caption = #1054#1089#1090'. '#1087#1072#1088#1090#1080#1080' '#1074' '#1088#1077#1079':'
      end
      object lPartRezLeft: TLabel
        Left = 107
        Top = 8
        Width = 86
        Height = 13
        AutoSize = False
        Caption = 'lPartRezLeft'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object bbOk: TBitBtn
      Left = 517
      Top = 4
      Width = 87
      Height = 25
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      Default = True
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
      Left = 621
      Top = 4
      Width = 87
      Height = 25
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = bbCancelClick
      Kind = bkCancel
    end
  end
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 711
    Height = 205
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      711
      205)
    object lblID: TLabel
      Left = 9
      Top = 9
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1086#1084#1077#1088
    end
    object Label3: TLabel
      Left = 168
      Top = 9
      Width = 15
      Height = 13
      AutoSize = False
      Caption = #1086#1090
    end
    object Label4: TLabel
      Left = 283
      Top = 9
      Width = 50
      Height = 13
      Caption = #1054#1087#1077#1088#1072#1094#1080#1103
    end
    object sbClearOper: TSpeedButton
      Left = 682
      Top = 5
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
      OnClick = sbClearOperClick
    end
    object sbAutoTTN: TSpeedButton
      Left = 139
      Top = 30
      Width = 23
      Height = 20
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1085#1086#1084#1077#1088
      AllowAllUp = True
      GroupIndex = 2
      Glyph.Data = {
        42010000424D4201000000000000760000002800000015000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
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
      OnClick = sbAutoTTNClick
    end
    object lPerson: TLabel
      Left = 48
      Top = 159
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1090#1074'. '#1083#1080#1094#1086
    end
    object lHardware: TLabel
      Left = 58
      Top = 183
      Width = 39
      Height = 13
      Caption = #1058#1077#1093'. '#1089#1088'.'
    end
    object lDriver: TLabel
      Left = 285
      Top = 33
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = #1042#1086#1076#1080#1090#1077#1083#1100
    end
    object LblTTN: TLabel
      Left = 21
      Top = 33
      Width = 22
      Height = 13
      Hint = #1046#1044#1053
      Caption = #1058#1058#1053
    end
    object LblSumNNByDog: TLabel
      Left = 509
      Top = 135
      Width = 117
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1057#1091#1084#1084#1072' '#1053#1053' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
    end
    object LblNNSum: TLabel
      Left = 592
      Top = 111
      Width = 34
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1057#1091#1084#1084#1072
      Visible = False
    end
    object LblNN_Num: TLabel
      Left = 454
      Top = 111
      Width = 53
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1053#1086#1084#1077#1088' '#1053#1053
      Visible = False
    end
    object LblDov: TLabel
      Left = 5
      Top = 81
      Width = 38
      Height = 13
      Hint = #1062#1080#1089#1090'.'#8470
      Caption = #1044#1086#1074'. '#8470
    end
    object lAutoAdd: TLabel
      Left = 295
      Top = 57
      Width = 38
      Height = 13
      Caption = #1055#1088#1080#1094#1077#1087
    end
    object lAuto: TLabel
      Left = 19
      Top = 57
      Width = 24
      Height = 13
      Caption = #1040#1074#1090#1086
    end
    object Label6: TLabel
      Left = 506
      Top = 57
      Width = 44
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1055#1091#1090'.'#1083#1080#1089#1090
    end
    object Label5: TLabel
      Left = 168
      Top = 33
      Width = 11
      Height = 13
      AutoSize = False
      Caption = #1086#1090
    end
    object Label22: TLabel
      Left = 11
      Top = 111
      Width = 86
      Height = 13
      Alignment = taRightJustify
      Caption = #1060#1086#1088#1084#1072' '#1088#1072#1089#1095#1077#1090#1086#1074
    end
    object Label21: TLabel
      Left = 167
      Top = 81
      Width = 11
      Height = 13
      AutoSize = False
      Caption = #1086#1090
    end
    object Label12: TLabel
      Left = 53
      Top = 135
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1072#1082#1086#1074#1082#1072
    end
    object Label11: TLabel
      Left = 414
      Top = 81
      Width = 39
      Height = 13
      Caption = #1042#1099#1076#1072#1085#1072
    end
    object Label10: TLabel
      Left = 302
      Top = 81
      Width = 31
      Height = 13
      Caption = #1057#1077#1088#1080#1103
    end
    object Bevel9: TBevel
      Left = 449
      Top = 148
      Width = 255
      Height = 10
      Anchors = [akTop, akRight]
      Shape = bsBottomLine
    end
    object Bevel8: TBevel
      Left = 441
      Top = 105
      Width = 9
      Height = 96
      Anchors = [akTop, akRight]
      Shape = bsRightLine
    end
    object Bevel5: TBevel
      Left = 7
      Top = 99
      Width = 701
      Height = 5
      Shape = bsBottomLine
    end
    object Bevel4: TBevel
      Left = 273
      Top = 104
      Width = 9
      Height = 99
      Anchors = [akTop, akRight]
      Shape = bsRightLine
    end
    object sbAuto: TSpeedButton
      Left = 244
      Top = 53
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
      OnClick = sbAutoClick
    end
    object sbAutoAdd: TSpeedButton
      Left = 475
      Top = 53
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
      OnClick = sbAutoAddClick
    end
    object edID: TEdit
      Left = 46
      Top = 6
      Width = 115
      Height = 21
      TabStop = False
      Color = 15658991
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      OnChange = edIDChange
    end
    object edActDate: TDateEdit
      Left = 185
      Top = 6
      Width = 84
      Height = 20
      CheckOnExit = True
      DefaultToday = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
      Text = '04.11.2008'
      OnChange = edActDateChange
    end
    object edOper: TComboEdit
      Left = 336
      Top = 6
      Width = 344
      Height = 20
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = edOperButtonClick
      OnDblClick = edOperButtonClick
      OnKeyPress = edOperKeyPress
    end
    object cbRasch: TComboBox
      Left = 102
      Top = 108
      Width = 167
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 13
      Text = #1054#1087#1083#1072#1090#1072' '#1089' '#1088'/'#1089
      OnKeyPress = edOperKeyPress
      Items.Strings = (
        #1054#1087#1083#1072#1090#1072' '#1089' '#1088'/'#1089
        #1053#1072#1083#1080#1095#1085#1099#1077
        #1041#1072#1085#1082#1086#1074#1089#1082#1080#1081' '#1095#1077#1082
        #1042#1079#1072#1080#1084#1086#1079#1072#1095#1077#1090
        #1041#1072#1088#1090#1077#1088)
    end
    object edWayList: TEdit
      Left = 553
      Top = 54
      Width = 152
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 8
    end
    object edTTNDate: TDateEdit
      Left = 185
      Top = 30
      Width = 84
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 4
    end
    object edTTN: TEdit
      Left = 46
      Top = 30
      Width = 91
      Height = 21
      MaxLength = 20
      TabOrder = 3
      OnChange = edTTNChange
    end
    object edPerson: TComboEdit
      Left = 102
      Top = 156
      Width = 167
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 15
      OnButtonClick = edPersonButtonClick
      OnDblClick = edPersonButtonClick
      OnKeyPress = edOperKeyPress
    end
    object edPack: TComboBox
      Left = 102
      Top = 132
      Width = 167
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 14
      OnChange = edPackChange
      OnKeyPress = edOperKeyPress
      Items.Strings = (
        #1041#1077#1085#1079#1086#1074#1086#1079
        #1041#1086#1095#1082#1080
        #1041#1091#1090#1099#1083#1082#1072
        #1050#1072#1085#1080#1089#1090#1088#1072
        #1055#1086' '#1089#1082#1083#1072#1076#1091
        #1062#1080#1089#1090#1077#1088#1085#1072
        #1064#1058'.'
        #1055#1088#1086#1087#1072#1085#1086#1074#1086#1079)
    end
    object edNNSumDog: TCurrencyEdit
      Left = 632
      Top = 132
      Width = 73
      Height = 21
      TabStop = False
      AutoSize = False
      Color = 15658991
      DisplayFormat = ',0.00;-,0.00'
      FormatOnEditing = True
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 23
    end
    object edNNSum: TCurrencyEdit
      Left = 632
      Top = 108
      Width = 73
      Height = 21
      TabStop = False
      AutoSize = False
      Color = 15658991
      DisplayFormat = ',0.00;-,0.00'
      FormatOnEditing = True
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 22
      Visible = False
    end
    object edNN_Num: TEdit
      Left = 509
      Top = 108
      Width = 73
      Height = 22
      Anchors = [akTop, akRight]
      AutoSize = False
      Color = 15658991
      ReadOnly = True
      TabOrder = 21
      Visible = False
    end
    object edHardware: TComboEdit
      Left = 102
      Top = 179
      Width = 167
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 16
      OnButtonClick = edHardwareButtonClick
      OnDblClick = edHardwareButtonClick
      OnKeyPress = edOperKeyPress
    end
    object edDriver: TComboEdit
      Left = 336
      Top = 30
      Width = 163
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = edDriverButtonClick
      OnDblClick = edDriverButtonClick
      OnKeyPress = edOperKeyPress
    end
    object edDovSer: TEdit
      Left = 336
      Top = 78
      Width = 68
      Height = 21
      TabOrder = 11
    end
    object edDovNum: TEdit
      Left = 46
      Top = 78
      Width = 115
      Height = 21
      TabOrder = 9
    end
    object edDovGive: TEdit
      Left = 456
      Top = 78
      Width = 249
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 12
    end
    object edDovDate: TDateEdit
      Left = 184
      Top = 78
      Width = 84
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 10
    end
    object edAutoAdd: TComboEdit
      Left = 336
      Top = 54
      Width = 138
      Height = 21
      DirectInput = False
      Enabled = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 7
      OnButtonClick = edAutoAddButtonClick
      OnDblClick = edAutoAddButtonClick
      OnKeyPress = edOperKeyPress
    end
    object edAuto: TComboEdit
      Left = 46
      Top = 54
      Width = 197
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 6
      OnButtonClick = edAutoButtonClick
      OnDblClick = edAutoButtonClick
      OnKeyPress = edOperKeyPress
    end
    object chUchPrice: TCheckBox
      Left = 289
      Top = 112
      Width = 113
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1055#1086' '#1091#1095#1077#1090#1085#1086#1081' '#1094#1077#1085#1077
      TabOrder = 17
      OnClick = chUchPriceClick
    end
    object chSborPost: TCheckBox
      Left = 289
      Top = 136
      Width = 151
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1044#1086#1088'. '#1089#1073#1086#1088' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      Checked = True
      State = cbChecked
      TabOrder = 18
    end
    object chSborNDS: TCheckBox
      Left = 289
      Top = 184
      Width = 151
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1044#1086#1088'. '#1089#1073#1086#1088' '#1073#1077#1079' '#1053#1044#1057
      TabOrder = 20
    end
    object chSborNac: TCheckBox
      Left = 289
      Top = 160
      Width = 151
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1044#1086#1088'. '#1089#1073#1086#1088' '#1089' '#1085#1072#1094#1077#1085#1082#1080
      TabOrder = 19
    end
    object chDebet: TCheckBox
      Left = 463
      Top = 160
      Width = 217
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1053#1077' '#1074#1082#1083#1102#1095#1072#1090#1100' '#1074' '#1076#1077#1073#1080#1090#1086#1088#1082#1091
      TabOrder = 24
    end
    object cbNotNN: TCheckBox
      Left = 463
      Top = 184
      Width = 221
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1053#1077' '#1089#1086#1079#1076#1072#1074#1072#1090#1100' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      TabOrder = 25
      OnClick = cbNotNNClick
      OnEnter = cbNotNNEnter
      OnExit = cbNotNNExit
    end
  end
  object gbSections: TGroupBox
    Left = 0
    Top = 344
    Width = 711
    Height = 208
    Align = alClient
    Caption = #1057#1077#1082#1094#1080#1080' ('#1088#1077#1079#1077#1088#1074#1091#1072#1088#1099')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    DesignSize = (
      711
      208)
    object sbCol: TSpeedButton
      Left = 681
      Top = 2
      Width = 23
      Height = 8
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      AllowAllUp = True
      Anchors = [akRight, akBottom]
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
      OnClick = sbColClick
    end
    object PanelCol: TPanel
      Left = 583
      Top = 15
      Width = 126
      Height = 191
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'PanelCol'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cbCol: TRxCheckListBox
        Left = 2
        Top = 2
        Width = 122
        Height = 163
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        OnClickCheck = cbColClickCheck
        InternalVersion = 202
      end
      object pRefresh: TPanel
        Left = 2
        Top = 165
        Width = 122
        Height = 24
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object spbCloseTunePanel: TSpeedButton
          Left = 93
          Top = 1
          Width = 25
          Height = 22
          Hint = #1047#1072#1082#1088#1099#1090#1100' '#1087#1072#1085#1077#1083#1100
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
          ParentShowHint = False
          ShowHint = True
          OnClick = spbCloseTunePanelClick
        end
        object spbSelectAll: TSpeedButton
          Left = 66
          Top = 1
          Width = 25
          Height = 22
          Hint = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
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
          OnClick = spbSelectAllClick
        end
        object spbClearColConfig: TSpeedButton
          Left = 120
          Top = 1
          Width = 25
          Height = 22
          Hint = #1057#1073#1088#1086#1089' '#1085#1072#1089#1090#1088#1086#1077#1082' '#1082#1086#1083#1086#1085#1086#1082
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = spbClearColConfigClick
        end
      end
    end
    object pnlSections: TPanel
      Left = 2
      Top = 15
      Width = 581
      Height = 191
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlSections'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object pnlSubSections: TPanel
        Left = 0
        Top = 163
        Width = 581
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          581
          28)
        object l1: TLabel
          Left = 95
          Top = 8
          Width = 63
          Height = 13
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object sbCorrectPrice: TSpeedButton
          Left = 33
          Top = 2
          Width = 25
          Height = 25
          Hint = #1040#1074#1090#1086#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1062#1077#1085#1099' '#1073#1077#1079' '#1053#1044#1057' '#1080#1079' '#1057#1090#1086#1080#1084#1086#1089#1090#1080
          AllowAllUp = True
          GroupIndex = 3
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
            73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
            0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
            0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
            0333337F777777737F333308888888880333337F333333337F33330888888888
            03333373FFFFFFFF733333700000000073333337777777773333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbCorrectPriceClick
        end
        object sbRezShow: TSpeedButton
          Left = 62
          Top = 2
          Width = 25
          Height = 25
          Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1089#1077' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1099
          AllowAllUp = True
          GroupIndex = 1
          Glyph.Data = {
            6E020000424D6E0200000000000076000000280000002A000000150000000100
            040000000000F801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00770000007777
            7777777777777777777777777777770000007099999907777777777777777777
            7777777777777700000009999999900077777777777777777000000777777700
            00000999999990CC07777777777777770CCCCCC07777770000000900000090CC
            C000077777777770CCCCCCCC0777770000000099999900CCC0AAA07777777770
            CCCCCCCC077777000000099999999000C0AAAA0777777770C000000C07777700
            00000999999990CC00AAAA07777777700CCCCCC00777770000000900000090CC
            C0000A0777777770CCCCCCCC0777770000000099999900CCC0AAA00777777770
            CCCCCCCC077777000000099999999000C0AAAA0777777770C000000C07777700
            00000999999990CC00AAAA07777777700CCCCCC00777770000000900000090CC
            C0000A0777777770CCCCCCCC0777770000000088888800CCC0AAA00777777770
            CCCCCCCC077777000000088888888000C0AAAA0777777770C000000C07777700
            000070888888088800AAAA077777777007777770077777000000770000008888
            80000A0777777770777777770777770000007777708888880888800777777777
            0777777077777700000077777700000088888807777777777000000777777700
            0000777777777708888880777777777777777777777777000000777777777770
            000007777777777777777777777777000000}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbRezShowClick
        end
        object edComm: TEdit
          Left = 163
          Top = 4
          Width = 415
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 1000
          TabOrder = 0
        end
        object pDel: TPanel
          Left = 0
          Top = 0
          Width = 32
          Height = 28
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
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
      end
      object dbgSections: TDBGridEh
        Left = 0
        Top = 0
        Width = 581
        Height = 163
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = dsAutoDet
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
        ParentFont = False
        ParentShowHint = False
        RowDetailPanel.Color = clBtnFace
        ShowHint = True
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        VertScrollBar.VisibleMode = sbAlwaysShowEh
        OnColumnMoved = dbgSectionsColumnMoved
        OnEditButtonClick = dbgSectionsEditButtonClick
        OnExit = dbgSectionsExit
        OnMouseMove = dbgSectionsMouseMove
        Columns = <
          item
            DropDownRows = 12
            EditButtons = <>
            FieldName = 'ReisNum'
            Footer.ValueType = fvtCount
            Footers = <>
            Width = 60
          end
          item
            Color = 15658991
            EditButtons = <>
            FieldName = 'CapaCity'
            Footers = <>
            ReadOnly = True
            Width = 60
          end
          item
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'To_name'
            Footers = <>
            ReadOnly = True
            Width = 150
          end
          item
            DropDownRows = 12
            EditButtons = <>
            FieldName = 'Rez_name'
            Footers = <>
            Width = 60
          end
          item
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'Part_name'
            Footers = <>
            ReadOnly = True
            Width = 60
          end
          item
            Color = 15658991
            EditButtons = <>
            FieldName = 'NP_name'
            Footers = <>
            ReadOnly = True
            Width = 60
          end
          item
            Color = 15658991
            EditButtons = <>
            FieldName = 'Cert_name'
            Footers = <>
            ReadOnly = True
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'Litr'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'Count'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'Price'
            Footers = <>
            Width = 50
          end
          item
            Color = 15658991
            EditButtons = <>
            FieldName = 'PriceNoNDS'
            Footers = <>
            ReadOnly = True
            Width = 50
          end
          item
            Color = 15658991
            EditButtons = <>
            FieldName = 'Summ'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 60
          end
          item
            Color = 15658991
            EditButtons = <>
            FieldName = 'SummNoNDS'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'Temper'
            Footers = <>
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'UD_Weig'
            Footers = <>
            Width = 50
          end
          item
            Color = 15658991
            EditButtons = <>
            FieldName = 'Temper_20'
            Footers = <>
            ReadOnly = True
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'UD_Weig_20'
            Footers = <>
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'Stamp'
            Footers = <>
            Width = 90
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object gbTo: TGroupBox
    Left = 0
    Top = 243
    Width = 711
    Height = 63
    Align = alTop
    Caption = #1050#1086#1084#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      711
      63)
    object lblTo_Place: TLabel
      Left = 39
      Top = 16
      Width = 62
      Height = 13
      Caption = #1052#1077#1089#1090#1086' '#1085#1072#1079#1085'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lTo_Rs: TLabel
      Left = 376
      Top = 16
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1056#1072#1089'.'#1089#1095#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblTo_MFO: TLabel
      Left = 546
      Top = 16
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1052#1060#1054
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblToOwner: TLabel
      Left = 5
      Top = 40
      Width = 96
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1086#1084#1091' '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1080#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edTo_Place: TEdit
      Left = 102
      Top = 13
      Width = 261
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 100
      ParentFont = False
      TabOrder = 0
      OnExit = edTo_PlaceExit
    end
    object edTo_Rs: TEdit
      Left = 425
      Top = 13
      Width = 101
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = 15658991
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edTo_MFO: TEdit
      Left = 580
      Top = 13
      Width = 125
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = 15658991
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object leToOwner: TRxLookupEdit
      Left = 102
      Top = 37
      Width = 262
      Height = 21
      DropDownCount = 10
      LookupDisplay = 'NAME'
      LookupField = 'ID'
      LookupSource = dsToOwner
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = edOperKeyPress
    end
  end
  object gbFrom: TGroupBox
    Left = 0
    Top = 205
    Width = 711
    Height = 38
    Align = alTop
    Caption = #1054#1090' '#1082#1086#1075#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      711
      38)
    object lFrom: TLabel
      Left = 54
      Top = 14
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1090' '#1082#1086#1075#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lFrom_RS: TLabel
      Left = 376
      Top = 14
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1056#1072#1089'.'#1089#1095#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object MFO: TLabel
      Left = 546
      Top = 14
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1052#1060#1054
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edFrom: TComboEdit
      Left = 102
      Top = 11
      Width = 262
      Height = 21
      DirectInput = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      ParentFont = False
      TabOrder = 0
      OnButtonClick = edFromButtonClick
      OnDblClick = edFromButtonClick
      OnKeyPress = edOperKeyPress
    end
    object edFrom_RS: TEdit
      Left = 425
      Top = 11
      Width = 101
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = 15658991
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edFrom_MFO: TEdit
      Left = 580
      Top = 11
      Width = 125
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = 15658991
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object gbDog: TGroupBox
    Left = 0
    Top = 306
    Width = 711
    Height = 38
    Align = alTop
    Caption = #1044#1086#1075#1086#1074#1086#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    DesignSize = (
      711
      38)
    object lKP_DogNumb: TLabel
      Left = 6
      Top = 16
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1086#1084#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sbClearDog: TSpeedButton
      Left = 132
      Top = 12
      Width = 23
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      ParentFont = False
      OnClick = sbClearDogClick
    end
    object lblKP_Date: TLabel
      Left = 160
      Top = 16
      Width = 26
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1044#1072#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblPayDate: TLabel
      Left = 256
      Top = 16
      Width = 57
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1055#1086#1075#1072#1096#1077#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblKP_Count: TLabel
      Left = 383
      Top = 16
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akTop, akRight]
      Caption = #1050#1086#1083'-'#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblKP_Price: TLabel
      Left = 487
      Top = 16
      Width = 26
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1062#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblKP_Summ: TLabel
      Left = 582
      Top = 16
      Width = 34
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1057#1091#1084#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edKP_Dog: TComboEdit
      Left = 46
      Top = 13
      Width = 86
      Height = 21
      DirectInput = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      ParentFont = False
      TabOrder = 0
      OnButtonClick = edKP_DogButtonClick
      OnChange = edKP_DogChange
      OnDblClick = edKP_DogButtonClick
      OnKeyPress = edOperKeyPress
    end
    object edKP_Date: TDateEdit
      Left = 189
      Top = 13
      Width = 62
      Height = 21
      TabStop = False
      Color = 15658991
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ButtonWidth = 0
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 2
      ParentFont = False
      ReadOnly = True
      YearDigits = dyFour
      TabOrder = 1
    end
    object edPayDate: TDateEdit
      Left = 316
      Top = 13
      Width = 62
      Height = 21
      CheckOnExit = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ButtonWidth = 0
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 2
      ParentFont = False
      YearDigits = dyFour
      TabOrder = 2
    end
    object edKP_Count: TEdit
      Left = 420
      Top = 13
      Width = 60
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = 15658991
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edKPXPrice: TEdit
      Left = 517
      Top = 13
      Width = 60
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = 15658991
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edKP_Summ: TEdit
      Left = 620
      Top = 13
      Width = 85
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = 15658991
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object SP: TOilStoredProc
    Left = 604
    Top = 3
  end
  object qFrom: TOilQuery
    SQL.Strings = (
      'Select a.name,a.bank_name, a.RACH_CHET, a.MFO, '
      'a.rek_Id r_id, a.rek_Inst r_inst '
      'from v_oil_org a'
      'where'
      '  a.id   = :a           And'
      '  a.inst = a.id '
      'order by def desc '
      ' ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 13
    Top = 147
    ParamData = <
      item
        DataType = ftInteger
        Name = 'a'
      end>
    object qFromNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object qFromBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Size = 50
    end
    object qFromRACH_CHET: TStringField
      FieldName = 'RACH_CHET'
    end
    object qFromMFO: TStringField
      FieldName = 'MFO'
    end
    object qFromR_ID: TFloatField
      FieldName = 'R_ID'
    end
    object qFromR_INST: TFloatField
      FieldName = 'R_INST'
    end
  end
  object qLeft: TOilQuery
    SQL.Strings = (
      'SELECT SUM(C.FACT_COUNT) - SUM(B.COUNT_) S'
      '  FROM OIL_PRIHOD A, OIL_RASHOD B, OIL_PRIH_DET C'
      ' Where C.PRIHOD_ID = A.ID'
      '   AND C.REZ = :ID'
      '   AND C.REZ_INST = :IN'
      '   AND B.REZ = C.REZ'
      '   AND B.REZ_INST = C.REZ_INST'
      '   AND A.STATE = '#39'Y'#39
      '   AND B.STATE = '#39'Y'#39
      '   AND C.STATE = '#39'Y'#39)
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 403
    Top = 437
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
      end
      item
        DataType = ftInteger
        Name = 'IN'
      end>
    object qLeftS: TFloatField
      FieldName = 'S'
      Origin = 'OIL_PRIH_DET.FACT_COUNT'
    end
  end
  object qNN: TOilQuery
    SQL.Strings = (
      'SELECT oas.id as nn_id, oas.inst as nn_inst, oas.num'
      '  FROM OIL_SALE_BOOK oas, OIL_RASHOD orr'
      ' WHERE orr.ID = :rash_id'
      '   AND orr.INST = :rash_inst'
      '   and orr.nn_id = oas.id'
      '   and orr.nn_inst = oas.inst'
      '   and oas.state = '#39'Y'#39
      '   and orr.state = '#39'Y'#39)
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 411
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rash_id'
      end
      item
        DataType = ftUnknown
        Name = 'rash_inst'
      end>
    object qNNNN_ID: TFloatField
      FieldName = 'NN_ID'
      Origin = 'OIL_RASHOD.NN_ID'
    end
    object qNNNN_INST: TFloatField
      FieldName = 'NN_INST'
      Origin = 'OIL_RASHOD.NN_INST'
    end
    object qNNNUM: TStringField
      FieldName = 'NUM'
      Origin = 'OIL_SALE_BOOK.NUM'
      Size = 8
    end
  end
  object BalanceQuery: TOilQuery
    SQL.Strings = (
      'select id, inst, balanceofcontract_a(id, inst) baco from oil_dog'
      'where state = '#39'Y'#39' and id = :id and inst = :inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 658
    Top = 150
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
      end
      item
        DataType = ftInteger
        Name = 'inst'
      end>
    object BalanceQueryID: TFloatField
      FieldName = 'ID'
    end
    object BalanceQueryINST: TFloatField
      FieldName = 'INST'
    end
    object BalanceQueryBACO: TFloatField
      FieldName = 'BACO'
    end
  end
  object AuxQuery: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 299
    Top = 437
  end
  object qHardware: TOilQuery
    SQL.Strings = (
      'select RD.*,'
      '       A.numb as Numb,'
      
        '       E.F_NAME||decode(substr(E.I_NAME,1,1),null,'#39#39','#39'_'#39','#39#39','#39' '#39'|' +
        '|substr(E.I_NAME,1,1)||'#39'.'#39'||decode(substr(E.O_NAME,1,1),null,'#39#39',' +
        #39'_'#39','#39#39','#39' '#39'||substr(E.O_NAME,1,1)||'#39'.'#39')) as DrvName'
      '  from oil_rash_det RD,'
      '       oil_auto A,'
      '       oil_employ E'
      ' where RD.state = '#39'Y'#39' and'
      '       RD.rash_id=:p_id and'
      '       RD.rash_inst = :p_inst and'
      '       RD.auto_id = A.id and'
      '       RD.auto_inst = A.inst and'
      '       RD.employ_id = E.id and'
      '       RD.employ_inst = E.inst'
      ''
      ' ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 356
    Top = 437
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_id'
      end
      item
        DataType = ftUnknown
        Name = 'p_inst'
      end>
  end
  object qCorrSumm: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      
        'select decode(nvl(kp_summ,0), 0, save_summ, kp_summ) - save_summ' +
        ' as result_summ,'
      
        '       decode(nvl(kp_summ,0), 0, save_summ, kp_summ) - save_summ' +
        ' - :in_summ as result_diff_summ,'
      '       KP_date,'
      '       KP_SUMM,'
      '       kp_count,'
      '       date_ as MAX_DATE,'
      '       count_ as rash_count,'
      '       price,'
      '       save_summ,'
      '       calc_summ,'
      '       sign((count_ + :in_count) - kp_count) as DIFF_COUNT,'
      '       sign((calc_summ + :in_summ) - kp_summ) as DIFF_SUMM,'
      '       last_id,'
      '       last_inst'
      '  from (select r.KP_PRICE,'
      '               r.KP_DATE,               '
      '               r.kp_count,'
      '               round(r.kp_price*r.kp_count,2) as kp_summ,'
      '               max(r.date_) as date_,'
      '               sum(r.COUNT_) as count_,'
      '               max(r.PRICE) as price,'
      '               sum(round(r.COUNT_ * r.PRICE,2)) as calc_summ,'
      '               sum(r.summa) as save_summ,'
      '               max(id) as last_id,'
      '               max(inst) as last_inst'
      '          from v_oil_rashod r'
      '         where r.KP_ID = :dog_id'
      '           and r.KP_INST = :dog_inst'
      '           and r.NP_TYPE = :np_type'
      '           and not(r.id in (&ras_ids) and r.inst = :ras_inst)'
      '         group by r.KP_PRICE,'
      '                  r.kp_date,'
      '                  r.kp_count)')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 544
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'in_summ'
      end
      item
        DataType = ftFloat
        Name = 'in_count'
      end
      item
        DataType = ftInteger
        Name = 'dog_id'
      end
      item
        DataType = ftInteger
        Name = 'dog_inst'
      end
      item
        DataType = ftInteger
        Name = 'np_type'
      end
      item
        DataType = ftInteger
        Name = 'ras_inst'
      end>
    MacroData = <
      item
        Name = 'ras_ids'
        Value = '0'
      end>
  end
  object qAllNNSum: TOilQuery
    SQL.Strings = (
      'select /*goal=first_rows*/'
      ' sum(g.sum_nn) sum_nn,'
      ' max(g.s_date) s_date'
      '  from (select nvl(sum(bd.nds_t),0) sum_nn,'
      '               bd.tov_id,'
      '               bd.kol count_,'
      '               bd.nds_t,'
      '               MAX(sb.s_date) s_date'
      '          from Oil_Sale_Book     sb,'
      '               Oil_sale_book_det bd,'
      '               oil_dog           d,'
      '               oil_talon_out     t'
      '         where sb.id = bd.nn_id(+)'
      '           and sb.inst = bd.nn_inst(+)'
      '           and sb.state = '#39'Y'#39' '
      '           and bd.state = '#39'Y'#39
      '           and sb.id = t.nn_id '
      '           and sb.inst = t.nn_inst'
      '           and d.id(+) = t.dog_id'
      '           and d.inst(+) = t.dog_inst '
      '           and d.id = :dog_id'
      '           and d.inst = :dog_inst'
      '         group by bd.id,'
      '                  bd.tov_id,'
      '                  bd.kol,'
      '                  bd.nds_t'
      '        Union ALL'
      '        select nvl(sum(bd.nds_t),0) sum_nn,'
      '               bd.tov_id,'
      '               bd.kol count_,'
      '               bd.nds_t,'
      '               MAX(sb.s_date) s_date'
      '          from Oil_Sale_Book     sb,'
      '               Oil_sale_book_det bd,'
      '               oil_dog           d,'
      '               oil_money         m'
      '         where sb.id = bd.nn_id(+) '
      '           and sb.inst = bd.nn_inst(+) '
      '           and sb.state = '#39'Y'#39' '
      '           and bd.state = '#39'Y'#39' '
      '           and d.id = :dog_id '
      '           and d.inst = :dog_inst'
      '           and sb.id = m.nn_id '
      '           and sb.inst = m.nn_inst '
      '           and d.id = m.dog_id '
      '           and d.inst = m.dog_inst '
      '           and not (sb.id = :nn_id and sb.inst = :nn_inst)'
      '         group by bd.id,'
      '                  bd.tov_id,'
      '                  bd.kol,'
      '                  bd.nds_t'
      '        Union ALL'
      '        select nvl(sum(sb.nds_t),0) sum_nn,'
      '               nvl(sb.tov_id, 0) tov_id,'
      '               nvl(sb.kol, 0) count_,'
      '               nvl(sb.nds_t,0) nds_t,'
      '               MAX(sb.s_date) s_date'
      '          from V_Oil_Sale_Book sb,'
      '               oil_dog       d,'
      '               Oil_Rashod    r'
      '         where /*sb.state = '#39'Y'#39' '
      '           and */d.id = :dog_id '
      '           and d.inst = :dog_inst '
      '           and sb.id = r.nn_id '
      '           and sb.inst = r.nn_inst '
      '           and d.id = r.dog '
      '           and d.inst = r.dog_inst '
      '           and not (sb.id = :nn_id and sb.inst = :nn_inst)'
      '         group by sb.tov_id,'
      '                  sb.kol,'
      '                  sb.nds_t) g'
      ' ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 460
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'dog_id'
      end
      item
        DataType = ftInteger
        Name = 'dog_inst'
      end
      item
        DataType = ftInteger
        Name = 'dog_id'
      end
      item
        DataType = ftInteger
        Name = 'dog_inst'
      end
      item
        DataType = ftInteger
        Name = 'nn_id'
      end
      item
        DataType = ftInteger
        Name = 'nn_inst'
      end
      item
        DataType = ftInteger
        Name = 'dog_id'
      end
      item
        DataType = ftInteger
        Name = 'dog_inst'
      end
      item
        DataType = ftInteger
        Name = 'nn_id'
      end
      item
        DataType = ftInteger
        Name = 'nn_inst'
      end>
  end
  object qTestDogNN: TOilQuery
    SQL.Strings = (
      'select decode(sign(rest_dog_NN - rash_nn),'
      '              -1,'
      '              rest_dog_NN,'
      '              1,'
      '              rash_nn,'
      '              0,'
      '              rest_dog_NN) NN,'
      '       round(decode(sign(rest_dog_NN - rash_nn),'
      '                    -1,'
      '                    rest_dog_NN,'
      '                    1,'
      '                    rash_nn,'
      '                    0,'
      '                    rest_dog_NN) /'
      '             decode(nvl(aaa.dprice, 0), 0, 1, aaa.dprice),'
      '             3) count_NN,'
      '       decode(sign(rest_dog_NN), 1, '#39'Y'#39', '#39'N'#39') will_nn_dog,'
      '       decode(sign(rash_nn), 1, '#39'Y'#39', '#39'N'#39') will_nn_rash,'
      '       aaa.*'
      '  from (select round(decode(sign(mnds_t - (rnds_t - rNNnds_t)),'
      '                            -1,'
      '                            :rash_sum,'
      '                            1,'
      
        '                            :rash_sum - (mnds_t - (rnds_t - rNNn' +
        'ds_t)),'
      '                            0,'
      '                            :rash_sum),'
      '                     2) rash_nn,'
      
        '               round(mnds_t - (rnds_t - rNNnds_t), 2) as rest_mo' +
        'ney,'
      '               mcount_ - (rcount_ - rNNcount_) as rest_count,'
      
        '               round(dnds_t - (mnds_t + rNNnds_t), 2) as rest_do' +
        'g_NN,'
      
        '               dcount_ - (mcount_ + rNNcount_) as rest_count_dog' +
        ','
      '               round(dnds_t - rnds_t, 2) as rest_dog,'
      '               dCount_ - rCount_ as rest_dog_count,'
      '               aa.*'
      '          from (select np_id,'
      '                       dim_id,'
      '                       max(dnds_t) dnds_t,'
      '                       max(dcount_) dcount_,'
      '                       max(dprice) dprice,'
      '                       max(mnds_t) mnds_t,'
      '                       max(mcount_) mcount_,'
      '                       max(mprice) mprice,'
      '                       max(rNNnds_t) rNNnds_t,'
      '                       max(rNNcount_) rNNcount_,'
      '                       max(rNNprice) rNNprice,'
      '                       max(rnds_t) rnds_t,'
      '                       max(rcount_) rcount_,'
      '                       max(rprice) rprice'
      '                  from ( -- NN from rashod'
      
        '                         select nvl(det.tov_id, b.tov_id) as np_' +
        'id,'
      
        '                                nvl(det.div_id, b.div_id) as dim' +
        '_id,'
      '                                0 dnds_t,'
      '                                0 dcount_,'
      '                                0 dprice,'
      '                                0 mnds_t,'
      '                                0 mcount_,'
      '                                0 mprice,'
      
        '                                nvl(sum(det.nds_t), sum(b.nds_t)' +
        ') rNNnds_t,'
      
        '                                nvl(sum(det.kol), sum(b.kol)) rN' +
        'Ncount_,'
      '                                nvl(det.price_nds,'
      
        '                                    round(sum(b.nds_t) / sum(b.k' +
        'ol), 2)) rNNprice,'
      '                                0 rnds_t,'
      '                                0 rcount_,'
      '                                0 rprice'
      
        '                          from OIL_SALE_BOOK_DET det, OIL_SALE_B' +
        'OOK b'
      '                         where det.nn_id = b.id'
      '                           and det.nn_inst = b.inst'
      '                           and det.state = '#39'Y'#39
      '                           and b.state = '#39'Y'#39
      
        '                           and nvl(det.tov_id, b.tov_id) = :np_i' +
        'd'
      '                           and (b.id, b.inst) in'
      '                               (select m.NN_ID, m.NN_INST'
      '                                  from OIL_RASHOD m'
      '                                 where m.state = '#39'Y'#39
      '                                   and m.dog = :dog_id'
      '                                   and m.dog_inst = :dog_inst'
      
        '                                   and not (m.id  in (&ras_ids) ' +
        'and m.inst = :ras_inst))'
      '                         group by nvl(det.tov_id, b.tov_id),'
      '                                   nvl(det.div_id, b.div_id),'
      '                                   det.price_nds'
      '                        union all -- NN from money'
      
        '                        Select nvl(det.tov_id, b.tov_id) as np_i' +
        'd,'
      
        '                               nvl(det.div_id, b.div_id) as dim_' +
        'id,'
      '                               0 dnds_t,'
      '                               0 dcount_,'
      '                               0 dprice,'
      
        '                               nvl(sum(det.nds_t), sum(b.nds_t))' +
        ' mnds_t,'
      
        '                               nvl(sum(det.kol), sum(b.kol)) mco' +
        'unt_,'
      '                               nvl(det.price_nds,'
      
        '                                   round(sum(b.nds_t) / sum(b.ko' +
        'l), 2)) mprice,'
      '                               0 rNNnds_t,'
      '                               0 rNNcount_,'
      '                               0 rNNprice,'
      '                               0 rnds_t,'
      '                               0 rcount_,'
      '                               0 rprice'
      
        '                          from OIL_SALE_BOOK_DET det, OIL_SALE_B' +
        'OOK b'
      '                         where det.nn_id = b.id'
      '                           and det.nn_inst = b.inst'
      '                           and det.state = '#39'Y'#39
      '                           and b.state = '#39'Y'#39
      
        '                           and nvl(det.tov_id, b.tov_id) = :np_i' +
        'd'
      '                           and (b.id, b.inst) in'
      '                               (select m.NN_ID, m.NN_INST'
      '                                  from OIL_MONEY m'
      '                                 where m.state = '#39'Y'#39
      '                                   and m.dog_id = :dog_id'
      '                                   and m.dog_inst = :dog_inst)'
      '                         group by nvl(det.tov_id, b.tov_id),'
      '                                  nvl(det.div_id, b.div_id),'
      '                                  det.price_nds'
      '                        union all -- dogovor'
      '                        Select ddet.np_type as np_id,'
      '                               ddet.dim_id as dim_id,'
      
        '                               NDS.GetWithNDS_NoNDS(ddet.count_ ' +
        '* ddet.price,'
      
        '                                                    d.dog_date) ' +
        'dnds_t,'
      '                               ddet.count_ dcount_,'
      '                               ddet.price2 dprice,'
      '                               0 mnds_t,'
      '                               0 mcount_,'
      '                               0 mprice,'
      '                               0 rNNnds_t,'
      '                               0 rNNcount_,'
      '                               0 rNNprice,'
      '                               0 rnds_t,'
      '                               0 rcount_,'
      '                               0 rprice'
      '                          from OIL_DOG_DETAIL ddet, OIL_DOG d'
      '                         where ddet.dog_id = d.id'
      '                           and ddet.dog_inst = d.inst'
      '                           and ddet.state = '#39'Y'#39
      '                           and d.state = '#39'Y'#39
      '                           and d.id = :dog_id'
      '                           and d.inst = :dog_inst'
      '                           and ddet.np_type = :np_id'
      '                        Union all -- otpysk from NB'
      '                        Select p.np_type as np_id,'
      '                               p.dim_id as dim_id,'
      '                               0 dnds_t,'
      '                               0 dcount_,'
      '                               0 dprice,'
      '                               0 mnds_t,'
      '                               0 mcount_,'
      '                               0 mprice,'
      '                               0 rNNnds_t,'
      '                               0 rNNcount_,'
      '                               0 rNNprice,'
      
        '                               sum(NDS.GetWithNDS_NoNDS(r.summa,' +
        ' d.dog_date)) rnds_t,'
      '                               sum(r.count_) rcount,'
      
        '                               NDS.GetWithNDS_NoNDS(r.price, d.d' +
        'og_date) rprice'
      
        '                          from OIL_RASHOD r, OIL_DOG d, OIL_PART' +
        ' p'
      '                         where r.part_id = p.id(+)'
      '                           and r.part_inst = p.inst(+)'
      '                           and r.dog(+) = d.id'
      '                           and r.dog_inst(+) = d.inst'
      '                           and d.id = :dog_id'
      '                           and d.inst = :dog_inst'
      '                           and p.np_type = :np_id'
      '                           and r.state = '#39'Y'#39
      '                           and r.date_ <= :date_'
      
        '                           and not (r.id in (&ras_ids) and r.ins' +
        't = :ras_inst)'
      '                         group by p.np_type,'
      '                                  p.dim_id,'
      
        '                                  NDS.GetWithNDS_NoNDS(r.price, ' +
        'd.dog_date)) a'
      '                 group by np_id, dim_id) aa) aaa')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 644
    Top = 40
    ParamData = <
      item
        DataType = ftFloat
        Name = 'rash_sum'
      end
      item
        DataType = ftUnknown
        Name = 'np_id'
      end
      item
        DataType = ftUnknown
        Name = 'dog_id'
      end
      item
        DataType = ftUnknown
        Name = 'dog_inst'
      end
      item
        DataType = ftUnknown
        Name = 'ras_inst'
      end
      item
        DataType = ftUnknown
        Name = 'date_'
      end>
    MacroData = <
      item
        Name = 'ras_ids'
        Value = '0'
      end>
  end
  object qTestPartRest: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '--  date_ - '#1085#1086#1074#1072' '#1076#1072#1090#1072' '#1074#1110#1076#1087#1091#1089#1082#1091', '#1103#1082#1080#1081' '#1084#1080' '#1088#1077#1076#1072#1075#1091#1108#1084#1086
      
        '--  fact_count - '#1092#1072#1082#1090#1080#1095#1085#1072' '#1084#1072#1089#1072' '#1087#1072#1083#1080#1074#1072' '#1074' '#1074#1110#1076#1087#1091#1089#1082#1091', '#1103#1082#1080#1081' '#1084#1080' '#1088#1077#1076#1072#1075#1091 +
        #1108#1084#1086
      'select res.*'
      
        '  from (select res.*, sum(res.count_) over(order by res.rnum) as' +
        ' summ'
      '          from (select res.*,'
      
        '                       row_number() over(order by res.data_oper,' +
        ' sign(res.count_) desc) as rnum'
      '                  from ('
      '                        -- '#1087#1088#1080#1093#1086#1076#1080
      '                        select p.date_ as data_oper,'
      '                                p.id,'
      '                                p.inst,'
      '                                p.oper_id,'
      '                                p.part_id,'
      '                                p.part_inst,'
      '                                pd.fact_count as count_'
      '                          from oil_prih_det pd, oil_prihod p'
      '                         where (pd.prihod_id, pd.inst) in'
      '                               (select p.id, p.inst'
      '                                  from oil_prihod p'
      '                                 where p.state = '#39'Y'#39')'
      '                           and pd.state = '#39'Y'#39
      '                           and p.id = pd.prihod_id'
      '                           and pd.inst = p.inst'
      '                        union all'
      '                        -- '#1074#1110#1076#1087#1091#1089#1082#1080' '#1073#1077#1079' '#1074#1110#1076#1082#1088#1080#1090#1086#1075#1086' '#1074#1110#1076#1087#1091#1089#1082#1091' '
      '                        select r.date_ as data_oper,'
      '                               r.id,'
      '                               r.inst,'
      '                               r.oper_id,'
      '                               r.part_id,'
      '                               r.part_inst,'
      '                               -r.count_'
      '                          from oil_rashod r'
      '                         where r.state = '#39'Y'#39') res'
      '                '
      '                 where res.part_id = :part_id'
      '                   and res.part_inst = :part_inst'
      
        '                 order by res.data_oper, sign(res.count_) desc) ' +
        'res) res'
      ' where summ < 0')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 567
    Top = 46
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'part_id'
      end
      item
        DataType = ftUnknown
        Name = 'part_inst'
      end>
  end
  object qCert: TOilQuery
    SQL.Strings = (
      'select distinct d.cert_id, d.cert_name'
      '  from oil_prihod p, v_oil_prih_det d'
      ' where p.id = d.PRIHOD_ID'
      '   and p.inst = d.inst'
      '   and p.state = '#39'Y'#39
      '   and d.cert_id is not null'
      '   and p.part_id = :PartId'
      '   and p.part_inst = :PartInst'
      '   and d.rez = :RezId'
      '   and d.rez_inst = :RezInst'
      'union all'
      'select distinct c.id as cert_id, c.name as cert_name'
      '  from oil_part pt, oil_cert c'
      ' where pt.cert_id is not null'
      '   and pt.id = :PartId'
      '   and pt.inst = :PartInst'
      '   and pt.cert_id = c.id'
      '   and pt.state = '#39'Y'#39
      '   and c.state = '#39'Y'#39)
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 248
    Top = 460
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PartId'
      end
      item
        DataType = ftUnknown
        Name = 'PartInst'
      end
      item
        DataType = ftUnknown
        Name = 'RezId'
      end
      item
        DataType = ftUnknown
        Name = 'RezInst'
      end>
  end
  object pmSave: TPopupMenu
    Left = 460
    Top = 468
    object N1: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1089#1086#1079#1076#1072#1090#1100' '#1082#1086#1087#1080#1102
      OnClick = N1Click
    end
  end
  object qToOwner: TOilQuery
    SQL.Strings = (
      'select 0 as id, 0 as inst, '#39#1042#1089#1077#39' as name'
      '  from dual'
      'union'
      
        'select distinct o.par as id, o.par_inst as inst, o.par_name as n' +
        'ame'
      '  from oil_org_link ool, v_oil_azs o'
      ' where ool.link_type_id = 9'
      '   and ool.state = '#39'Y'#39
      '   and from_id = ov.GetVal('#39'INST'#39')'
      '   and from_inst = ov.GetVal('#39'INST'#39')'
      '   and o.id = ool.to_id'
      '   and o.inst = ool.to_inst'
      'union'
      'select id, inst, name'
      '  from v_org'
      ' where id = ov.GetVal('#39'MAIN_PAR'#39')'
      '   and inst = ov.GetVal('#39'MAINPAR_INST'#39')'
      ' order by name')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 288
    Top = 254
  end
  object dsToOwner: TOraDataSource
    DataSet = qToOwner
    Left = 304
    Top = 238
  end
  object vAutoDet: TVirtualTable
    BeforeInsert = vAutoDetBeforeInsert
    BeforePost = vAutoDetBeforePost
    Left = 96
    Top = 430
    Data = {03000000000000000000}
    object vAutoDetRash_id: TIntegerField
      FieldName = 'Rash_id'
    end
    object vAutoDetRash_inst: TIntegerField
      FieldName = 'Rash_inst'
    end
    object vAutoDetAuto_Det_id: TIntegerField
      FieldName = 'Auto_Det_id'
    end
    object vAutoDetAuto_Det_inst: TIntegerField
      FieldName = 'Auto_Det_inst'
    end
    object vAutoDetReisNum: TStringField
      DisplayLabel = #8470' '#1089#1077#1082#1094#1080#1080
      DisplayWidth = 5
      FieldName = 'ReisNum'
      OnChange = vAutoDetReisNumChange
      Size = 250
    end
    object vAutoDetCapaCity: TFloatField
      DisplayLabel = #1054#1073#1098#1077#1084
      DisplayWidth = 8
      FieldName = 'CapaCity'
      DisplayFormat = ',0.000'
    end
    object vAutoDetTo_id: TIntegerField
      FieldName = 'To_id'
    end
    object vAutoDetTo_inst: TIntegerField
      FieldName = 'To_inst'
    end
    object vAutoDetTo_name: TStringField
      DisplayLabel = #1050#1086#1084#1091
      DisplayWidth = 20
      FieldName = 'To_name'
      Size = 250
    end
    object vAutoDetTo_addr: TStringField
      FieldName = 'To_addr'
      Size = 250
    end
    object vAutoDetTo_mfo: TStringField
      FieldName = 'To_mfo'
      Size = 250
    end
    object vAutoDetTo_rach_chet: TStringField
      FieldName = 'To_rach_chet'
      Size = 250
    end
    object vAutoDetTo_rek_id: TIntegerField
      FieldName = 'To_rek_id'
    end
    object vAutoDetTo_rek_inst: TIntegerField
      FieldName = 'To_rek_inst'
    end
    object vAutoDetRez_id: TIntegerField
      FieldName = 'Rez_id'
    end
    object vAutoDetRez_inst: TIntegerField
      FieldName = 'Rez_inst'
    end
    object vAutoDetRez_name: TStringField
      DisplayLabel = #1056#1077#1079#1077#1088#1074#1091#1072#1088
      DisplayWidth = 10
      FieldName = 'Rez_name'
      OnChange = vAutoDetRez_nameChange
      Size = 250
    end
    object vAutoDetPart_id: TIntegerField
      FieldName = 'Part_id'
    end
    object vAutoDetPart_inst: TIntegerField
      FieldName = 'Part_inst'
    end
    object vAutoDetPart_name: TStringField
      DisplayLabel = #1055#1072#1088#1090#1080#1103
      DisplayWidth = 10
      FieldName = 'Part_name'
      Size = 250
    end
    object vAutoDetPart_date: TDateField
      FieldName = 'Part_date'
    end
    object vAutoDetPart_Price: TFloatField
      FieldName = 'Part_Price'
    end
    object vAutoDetPart_Price_KP: TFloatField
      FieldName = 'Part_Price_KP'
    end
    object vAutoDetPart_Dim_id: TIntegerField
      FieldName = 'Part_Dim_id'
    end
    object vAutoDetPart_Own_Good: TStringField
      FieldName = 'Part_Own_Good'
      Size = 1
    end
    object vAutoDetPart_IsShtuki: TBooleanField
      FieldName = 'Part_IsShtuki'
    end
    object vAutoDetNP_id: TIntegerField
      FieldName = 'NP_id'
    end
    object vAutoDetNP_Grp_id: TIntegerField
      FieldName = 'NP_Grp_id'
      OnChange = vAutoDetNP_Grp_idChange
    end
    object vAutoDetNP_name: TStringField
      DisplayLabel = #1058#1080#1087' '#1053#1055
      DisplayWidth = 10
      FieldName = 'NP_name'
      Size = 250
    end
    object vAutoDetCert_id: TIntegerField
      FieldName = 'Cert_id'
    end
    object vAutoDetCert_name: TStringField
      DisplayLabel = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
      DisplayWidth = 10
      FieldName = 'Cert_name'
      OnChange = vAutoDetCert_nameChange
      Size = 250
    end
    object vAutoDetLitr: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086'|'#1051#1080#1090#1088#1099
      DisplayWidth = 10
      FieldName = 'Litr'
      OnChange = vAutoDetLitrChange
    end
    object vAutoDetPrice: TFloatField
      DisplayLabel = #1062#1077#1085#1072'|'#1057' '#1053#1044#1057
      FieldName = 'Price'
      OnChange = vAutoDetPriceChange
    end
    object vAutoDetCount: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086'|'#1058#1086#1085#1085#1099
      DisplayWidth = 10
      FieldName = 'Count'
      OnChange = vAutoDetCountChange
    end
    object vAutoDetSumm: TFloatField
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'Summ'
      DisplayFormat = ',0.00'
    end
    object vAutoDetPriceNoNDS: TFloatField
      DisplayLabel = #1062#1077#1085#1072'|'#1041#1077#1079' '#1053#1044#1057
      FieldName = 'PriceNoNDS'
      OnChange = vAutoDetPriceNoNDSChange
      DisplayFormat = ',0.00##'
    end
    object vAutoDetSummNoNDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057
      FieldName = 'SummNoNDS'
      DisplayFormat = ',0.00##'
    end
    object vAutoDetUD_Weig: TFloatField
      DisplayLabel = #1059#1076'. '#1074#1077#1089
      DisplayWidth = 8
      FieldName = 'UD_Weig'
      OnChange = vAutoDetUD_WeigChange
      DisplayFormat = ',0.0000'
    end
    object vAutoDetTemper: TFloatField
      DisplayLabel = 't'#176'C'
      DisplayWidth = 8
      FieldName = 'Temper'
      OnChange = vAutoDetTemperChange
    end
    object vAutoDetUD_Weig_20: TFloatField
      DisplayLabel = #1059#1076'. '#1074#1077#1089' '#1087#1088#1080' 20'#176'C'
      DisplayWidth = 8
      FieldName = 'UD_Weig_20'
      DisplayFormat = ',0.0000'
    end
    object vAutoDetTemper_20: TFloatField
      DisplayLabel = 't'#176'C'
      DisplayWidth = 8
      FieldName = 'Temper_20'
      MaxValue = 20.000000000000000000
      MinValue = 20.000000000000000000
    end
    object vAutoDetStamp: TStringField
      DisplayLabel = #1055#1083#1086#1084#1073#1099
      DisplayWidth = 10
      FieldName = 'Stamp'
      Size = 250
    end
  end
  object dsAutoDet: TOraDataSource
    DataSet = vAutoDet
    OnDataChange = dsAutoDetDataChange
    Left = 80
    Top = 448
  end
  object qAutoDet: TOraQuery
    SQL.Strings = (
      'select /*+ORDERED*/'
      ' *'
      
        '  from (select max(Rash_id) over(order by Rash_inst) as IsEdited' +
        ', r.*'
      '          from ('
      '                /*'#1084#1072#1096#1080#1085#1072' '#1110' '#1087#1088#1080#1095#1077#1087'*/'
      '                select to_number(null) as Rash_id,'
      
        '                        to_number(ov.GetVal('#39'INST'#39')) as Rash_ins' +
        't,'
      '                        a.id as auto_id,'
      '                        a.inst as auto_inst,'
      '                        ad.id as auto_det_id,'
      '                        ad.inst as auto_det_inst,'
      '                        nvl(ad.position, a.id) as ReisNum,'
      
        '                        nvl(ad.capacity, a.capacity) as CapaCity' +
        ','
      '                        to_number(null) as To_id,'
      '                        to_number(null) as To_inst,'
      '                        to_char(null) as To_name,'
      '                        to_char(null) as to_place,'
      '                        to_char(null) as To_mfo,'
      '                        to_char(null) as To_rach_chet,'
      '                        to_number(null) as To_rek_id,'
      '                        to_number(null) as To_rek_inst,'
      '                        to_number(null) as Rez_id,'
      '                        to_number(null) as Rez_inst,'
      '                        to_char(null) as Rez_name,'
      '                        to_number(null) as Part_id,'
      '                        to_number(null) as Part_inst,'
      '                        to_char(null) as Part_name,'
      '                        to_date(null) as Part_date,'
      '                        to_number(null) as Part_Price,'
      '                        to_number(null) as Part_Price_KP,'
      '                        to_number(null) as Part_Dim_id,'
      '                        to_char(null) as Part_Own_Good,'
      '                        '#39'N'#39' as Part_IsShtuki,'
      '                        to_number(null) as NP_id,'
      '                        to_number(null) as NP_Grp_id,'
      '                        to_char(null) as NP_name,'
      '                        to_number(null) as cert_id,'
      '                        to_char(null) as cert_name,'
      '                        to_char(null) as stamp,'
      '                        nvl(ad.capacity, a.capacity) as Litr,'
      '                        to_number(null) as Price,'
      '                        to_number(null) as sum_nds,'
      '                        to_number(null) as sum_x_nds,'
      '                        to_number(null) as Count,'
      '                        to_number(null) as UD_Weig,'
      '                        to_number(null) as Temper,'
      '                        to_number(null) as UD_Weig_20,'
      '                        20 as Temper_20'
      '                  from oil_auto a, oil_auto_detail ad'
      '                 where a.state = '#39'Y'#39
      '                   and ad.state(+) = '#39'Y'#39
      '                   and ad.auto_id(+) = a.id'
      '                   and ad.auto_inst(+) = a.inst'
      '                      '
      
        '                   and ((a.id in :auto_id and a.inst = :auto_ins' +
        't) or'
      
        '                       (a.id = :auto_add_id and a.inst = :auto_a' +
        'dd_inst))'
      '                      '
      '                   and 0 = :rash_id'
      '                union all'
      '                /*'#1088#1072#1085#1110#1096#1077' '#1079#1073#1077#1088#1077#1078#1077#1085#1110' '#1076#1072#1085#1110'*/'
      '                select r.id as Rash_id,'
      '                       r.inst as Rash_inst,'
      '                       r.AUTO_ID,'
      '                       r.AUTO_INST,'
      '                       r.AUTO_DET_ID,'
      '                       r.AUTO_DET_INST,'
      
        '                       nvl(r.TANK_POSITION, r.AUTO_POSITION) as ' +
        'ReisNum,'
      '                       r.AUTO_CAPACITY as CapaCity,'
      '                       r.To_id,'
      '                       r.To_inst,'
      '                       r.To_name,'
      '                       nvl(r.to_place, r.To_addr) as to_place,'
      '                       r.To_mfo,'
      '                       r.To_rach_chet,'
      '                       r.R_TO_ as To_rek_id,'
      '                       r.R_TO_INST as To_rek_inst,'
      '                       r.Rez_id,'
      '                       r.Rez_inst,'
      '                       r.Rez_name,'
      '                       r.Part_id,'
      '                       r.Part_inst,'
      '                       r.DOG as Part_name,'
      '                       r.DOG_DATE as Part_date,'
      '                       r.SS as Part_Price,'
      
        '                       nvl(r.Price, r.Price_kp) as Part_Price_KP' +
        ','
      '                       r.Dim_id as Part_Dim_id,'
      '                       r.OWN_GOODS as Part_Own_Good,'
      '                       r.IsShtuki as Part_IsShtuki,'
      '                       r.NP_TYPE as NP_id,'
      '                       r.NP_GRP as NP_Grp_id,'
      '                       r.NP_TYPE_NAME as NP_name,'
      '                       r.cert_id,'
      '                       r.cert_name,'
      '                       r.stamp,'
      '                       r.Litr,'
      '                       r.Price,'
      '                       r.Summ as sum_nds,'
      '                       r.summa as sum_x_nds,'
      '                       r.COUNT_ as Count,'
      '                       r.UD_Weig,'
      
        '                       to_number(replace(replace(r.Temper, '#39'+'#39', ' +
        #39#39'), '#39','#39', '#39'.'#39')) as Temper,'
      '                       decode(nvl(r.UD_Weig_20, 0),'
      '                              0,'
      
        '                              GetDensityForTemperature(r.UD_Weig' +
        ', r.Temper, 20),'
      '                              r.UD_Weig_20) as UD_Weig_20,'
      '                       20 as Temper_20'
      '                  from v_oil_rashod r'
      '                 where r.date_ = :date_'
      '                      '
      '                   and r.from_id = :from_id'
      '                   and r.from_inst = :from_inst'
      '                      '
      '                   and r.ttn_num = :ttn_num'
      '                      '
      
        '                   and ((r.auto_id = :auto_id and r.auto_inst = ' +
        ':auto_inst) or'
      '                       (:auto_id = 0 and :auto_inst = 0))'
      
        '                   and ((r.id = :rash_id and r.inst = :rash_inst' +
        ' and'
      '                       :auto_id = 0 and :auto_inst = 0) or'
      '                       not (:auto_id = 0 and :auto_inst = 0))'
      '                      '
      '                   and 0 <> :rash_id) r) r'
      ' where (IsEdited is not null and Rash_id is not null)'
      '    or (IsEdited is null and Rash_id is null)'
      ' order by ReisNum, rash_id')
    Left = 144
    Top = 430
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'auto_id'
      end
      item
        DataType = ftUnknown
        Name = 'auto_inst'
      end
      item
        DataType = ftUnknown
        Name = 'auto_add_id'
      end
      item
        DataType = ftUnknown
        Name = 'auto_add_inst'
      end
      item
        DataType = ftUnknown
        Name = 'rash_id'
      end
      item
        DataType = ftUnknown
        Name = 'date_'
      end
      item
        DataType = ftUnknown
        Name = 'from_id'
      end
      item
        DataType = ftUnknown
        Name = 'from_inst'
      end
      item
        DataType = ftUnknown
        Name = 'ttn_num'
      end
      item
        DataType = ftUnknown
        Name = 'rash_inst'
      end>
  end
  object qRez: TOilQuery
    SQL.Strings = (
      'select rez.*, nvl(rez.num, rez.name) as num_name'
      '  from V_OIL_REZERVUAR rez'
      ' where id_org = :a'
      '   and inst_org = :a'
      ' order by name')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 248
    Top = 414
    ParamData = <
      item
        DataType = ftInteger
        Name = 'a'
      end>
    object qRezID: TFloatField
      FieldName = 'ID'
      Origin = 'V_OIL_REZERVUAR.ID'
    end
    object qRezINST: TFloatField
      FieldName = 'INST'
      Origin = 'V_OIL_REZERVUAR.INST'
    end
    object qRezNAME: TStringField
      FieldName = 'NAME'
      Origin = 'V_OIL_REZERVUAR.NAME'
      Size = 50
    end
    object qRezID_ORG: TFloatField
      FieldName = 'ID_ORG'
      Origin = 'V_OIL_REZERVUAR.ID_ORG'
    end
    object qRezCAPACITY: TStringField
      FieldName = 'CAPACITY'
      Origin = 'V_OIL_REZERVUAR.CAPACITY'
      Size = 50
    end
    object qRezDEAD: TFloatField
      FieldName = 'DEAD'
      Origin = 'V_OIL_REZERVUAR.DEAD'
    end
    object qRezNUM: TStringField
      FieldName = 'NUM'
      Origin = 'V_OIL_REZERVUAR.NUM'
    end
    object qRezNUM_NAME: TStringField
      FieldName = 'NUM_NAME'
      Size = 50
    end
  end
  object ActionList: TActionList
    Left = 144
    Top = 482
    object actSave: TAction
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      Hint = #1055#1088#1080#1085#1103#1090#1100
      ShortCut = 16467
      OnExecute = actSaveExecute
    end
    object actE: TAction
      Caption = 'actE'
      ShortCut = 13
      OnExecute = actEExecute
    end
  end
  object qDog: TOilQuery
    SQL.Strings = (
      'select * from v_oil_dog_full'
      ' where dog_id = :dog_id and dog_inst = :dog_inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 456
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dog_id'
      end
      item
        DataType = ftUnknown
        Name = 'dog_inst'
      end>
  end
  object qAutoNum: TOilQuery
    SQL.Strings = (
      'select *'
      '  from oil_auto_detail a'
      ' where a.state = '#39'Y'#39
      '   and a.auto_id = :p_auto_id'
      '   and a.auto_inst = :p_auto_inst'
      ' order by a.position')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 248
    Top = 371
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_auto_id'
      end
      item
        DataType = ftUnknown
        Name = 'p_auto_inst'
      end>
    object qAutoNumID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qAutoNumINST: TFloatField
      FieldName = 'INST'
      Required = True
    end
    object qAutoNumPOSITION: TFloatField
      FieldName = 'POSITION'
    end
    object qAutoNumCAPACITY: TFloatField
      FieldName = 'CAPACITY'
    end
  end
end
