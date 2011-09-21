inherited RulezReportForm: TRulezReportForm
  Left = 327
  Top = 267
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  ClientHeight = 210
  ClientWidth = 353
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelGrp: TPanel
    Left = 0
    Top = 105
    Width = 353
    Height = 64
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 86
      Height = 13
      Caption = #1058#1080#1087' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1080
    end
    object SB1: TSpeedButton
      Tag = 1
      Left = 104
      Top = 34
      Width = 18
      Height = 18
      Caption = '1'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBConfClick
    end
    object SB2: TSpeedButton
      Tag = 2
      Left = 128
      Top = 34
      Width = 18
      Height = 18
      Caption = '2'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBConfClick
    end
    object SB3: TSpeedButton
      Tag = 3
      Left = 152
      Top = 34
      Width = 18
      Height = 18
      Caption = '3'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBConfClick
    end
    object SB4: TSpeedButton
      Tag = 4
      Left = 176
      Top = 34
      Width = 18
      Height = 18
      Caption = '4'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBConfClick
    end
    object SB5: TSpeedButton
      Tag = 5
      Left = 200
      Top = 34
      Width = 18
      Height = 18
      Caption = '5'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBConfClick
    end
    object SB6: TSpeedButton
      Tag = 6
      Left = 224
      Top = 34
      Width = 18
      Height = 18
      Caption = '6'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBConfClick
    end
    object SB7: TSpeedButton
      Tag = 7
      Left = 248
      Top = 34
      Width = 18
      Height = 18
      Caption = '7'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBConfClick
    end
    object SB8: TSpeedButton
      Tag = 8
      Left = 272
      Top = 34
      Width = 18
      Height = 18
      Caption = '8'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBConfClick
    end
    object SB9: TSpeedButton
      Tag = 9
      Left = 296
      Top = 34
      Width = 18
      Height = 18
      Caption = '9'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBConfClick
    end
    object SBConstr: TSpeedButton
      Left = 8
      Top = 34
      Width = 89
      Height = 18
      Caption = #1050#1086#1085#1089#1090#1088#1091#1082#1090#1086#1088
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBConstrClick
    end
    object CBTypes: TComboBox
      Left = 104
      Top = 8
      Width = 241
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = CBTypesChange
      OnKeyDown = CBTypesKeyDown
      OnKeyPress = CBTypesKeyPress
    end
  end
  object PanelDate: TPanel
    Left = 0
    Top = 0
    Width = 353
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    Visible = False
    object lblDate1: TLabel
      Left = 16
      Top = 12
      Width = 7
      Height = 13
      Caption = #1057
    end
    object lblDate2: TLabel
      Left = 144
      Top = 12
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object deBegin: TDateEdit
      Left = 40
      Top = 8
      Width = 97
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
      OnChange = deBeginChange
    end
    object deEnd: TDateEdit
      Left = 168
      Top = 8
      Width = 97
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnChange = DateEditChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 169
    Width = 353
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    OnDblClick = Panel2DblClick
    DesignSize = (
      353
      41)
    object LabelDebug: TLabel
      Left = 2
      Top = 24
      Width = 38
      Height = 13
      Caption = 'Debug'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object sbListPicture: TSpeedButton
      Left = 128
      Top = 8
      Width = 25
      Height = 25
      Hint = #1042#1089#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
      AllowAllUp = True
      GroupIndex = 1
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
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object cbSymbols: TCheckBox
      Left = 8
      Top = 8
      Width = 117
      Height = 17
      Caption = #1057#1080#1084#1074#1086#1083#1099' '#1088#1072#1079#1084#1077#1090#1082#1080
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = cbSymbolsClick
    end
    object BitBtn1: TBitBtn
      Left = 160
      Top = 8
      Width = 89
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 256
      Top = 8
      Width = 91
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
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
  end
  object PanelOrg: TPanel
    Left = 0
    Top = 41
    Width = 353
    Height = 64
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    Visible = False
    object LabelOrg1: TLabel
      Left = 8
      Top = 12
      Width = 52
      Height = 13
      Caption = 'LabelOrg1:'
    end
    object LabelOrg2: TLabel
      Left = 8
      Top = 36
      Width = 52
      Height = 13
      Caption = 'LabelOrg2:'
    end
    object sbClearOrg2: TSpeedButton
      Tag = 1
      Left = 314
      Top = 36
      Width = 22
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
      OnClick = SBClearClick
    end
    object sbClearOrg1: TSpeedButton
      Left = 314
      Top = 8
      Width = 22
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
      OnClick = SBClearClick
    end
    object CEOrg1: TComboEdit
      Left = 128
      Top = 8
      Width = 185
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      Text = 'CEOrg1'
      OnButtonClick = ComboEditClick
      OnDblClick = ComboEditClick
    end
    object CEOrg2: TComboEdit
      Left = 128
      Top = 36
      Width = 185
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      Text = 'CEOrg2'
      OnButtonClick = ComboEditClick
      OnDblClick = ComboEditClick
    end
  end
end