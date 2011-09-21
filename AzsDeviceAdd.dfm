inherited AzsDeviceAddForm: TAzsDeviceAddForm
  Left = 444
  Top = 307
  BorderStyle = bsDialog
  Caption = #1059#1089#1090#1088#1086#1081#1089#1090#1074#1086
  ClientHeight = 259
  ClientWidth = 269
  OldCreateOrder = True
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pButtons: TPanel
    Left = 0
    Top = 223
    Width = 269
    Height = 36
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      269
      36)
    object bbOK: TBitBtn
      Left = 98
      Top = 6
      Width = 79
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      TabOrder = 0
      OnClick = bbOKClick
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
      Left = 181
      Top = 6
      Width = 82
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object pnlClient: TPanel
    Left = 0
    Top = 0
    Width = 269
    Height = 223
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object lblAzs: TLabel
      Left = 12
      Top = 6
      Width = 24
      Height = 13
      Caption = #1040#1047#1057':'
    end
    object lblDevNum: TLabel
      Left = 12
      Top = 92
      Width = 74
      Height = 13
      Caption = #8470' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072':'
    end
    object lblFrom: TLabel
      Left = 12
      Top = 132
      Width = 77
      Height = 13
      Caption = #1044#1072#1090#1072' '#1084#1086#1085#1090#1072#1078#1072':'
    end
    object lblTo: TLabel
      Left = 142
      Top = 132
      Width = 89
      Height = 13
      Caption = #1044#1072#1090#1072' '#1076#1077#1084#1086#1085#1090#1072#1078#1072':'
    end
    object lblDevType: TLabel
      Left = 12
      Top = 47
      Width = 82
      Height = 13
      Caption = #1058#1080#1087' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072':'
    end
    object lblDevText: TLabel
      Left = 12
      Top = 176
      Width = 113
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072':'
    end
    object ceAzs: TComboEdit
      Left = 12
      Top = 21
      Width = 241
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ceAzsButtonClick
      OnDblClick = ceAzsButtonClick
    end
    object edDeviceNum: TEdit
      Left = 12
      Top = 107
      Width = 241
      Height = 21
      TabOrder = 1
    end
    object deFrom: TDateEdit
      Left = 12
      Top = 147
      Width = 113
      Height = 21
      DirectInput = False
      NumGlyphs = 2
      TabOrder = 2
    end
    object deTo: TDateEdit
      Left = 138
      Top = 147
      Width = 114
      Height = 21
      DirectInput = False
      NumGlyphs = 2
      TabOrder = 3
    end
    object edDeviceType: TComboEdit
      Left = 12
      Top = 62
      Width = 241
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = edDeviceTypeButtonClick
      OnDblClick = edDeviceTypeButtonClick
    end
    object edDeviceText: TEdit
      Left = 12
      Top = 191
      Width = 241
      Height = 21
      TabOrder = 5
    end
  end
end
