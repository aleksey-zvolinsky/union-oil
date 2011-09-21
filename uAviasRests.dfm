inherited AviasRestsForm: TAviasRestsForm
  Left = 380
  Top = 288
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = ''
  ClientHeight = 205
  ClientWidth = 330
  PixelsPerInch = 96
  TextHeight = 13
  inherited pBottom: TPanel
    Top = 172
    Width = 330
    inherited pBtn: TPanel
      Left = 133
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 330
    Height = 172
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object lDate_: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object lAZS: TLabel
      Left = 8
      Top = 34
      Width = 21
      Height = 13
      Caption = #1040#1047#1057
    end
    object lnpg: TLabel
      Left = 8
      Top = 60
      Width = 54
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1053#1055
    end
    object l4: TLabel
      Left = 8
      Top = 138
      Width = 59
      Height = 26
      Caption = #1044#1072#1090#1072' '#13#10#1087#1086#1089#1090#1088#1086#1077#1085#1080#1103
    end
    object l1: TLabel
      Left = 8
      Top = 86
      Width = 33
      Height = 13
      Caption = #1051#1080#1090#1088#1099
    end
    object l3: TLabel
      Left = 8
      Top = 112
      Width = 54
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086', '#1082#1075'.'
    end
    object deDate_: TDateEdit
      Left = 76
      Top = 4
      Width = 90
      Height = 21
      Color = clScrollBar
      NumGlyphs = 2
      ReadOnly = True
      TabOrder = 0
    end
    object ceAZS: TComboEdit
      Left = 76
      Top = 30
      Width = 250
      Height = 21
      Color = clScrollBar
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ReadOnly = True
      TabOrder = 1
      OnButtonClick = ceAZSButtonClick
      OnDblClick = ceAZSButtonClick
      OnKeyPress = ceAZSKeyPress
    end
    object ceNPG: TComboEdit
      Left = 76
      Top = 56
      Width = 250
      Height = 21
      Color = clScrollBar
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ReadOnly = True
      TabOrder = 2
      OnButtonClick = ceNPGButtonClick
      OnDblClick = ceNPGButtonClick
      OnKeyPress = ceAZSKeyPress
    end
    object deBuild: TDateEdit
      Left = 76
      Top = 144
      Width = 90
      Height = 21
      Color = clScrollBar
      NumGlyphs = 2
      ReadOnly = True
      TabOrder = 5
    end
    object edLitr: TRxCalcEdit
      Left = 76
      Top = 82
      Width = 90
      Height = 20
      Hint = #1051#1080#1090#1088#1072#1078
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = ',0.000'
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object edCount_: TRxCalcEdit
      Left = 76
      Top = 108
      Width = 90
      Height = 20
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = '0.000'
      GlyphKind = gkCustom
      Glyph.Data = {
        4E000000424D4E000000000000003E000000280000000A000000040000000100
        010000000000100000000000000000000000020000000200000000000000FFFF
        FF00FFEBBE813325BE8133021D03FFCABD81}
      ButtonWidth = 0
      NumGlyphs = 1
      TabOrder = 4
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select r.date_,'
      '       r.azs_id,'
      '       azs.name as azs_name,'
      '       r.np_group_id,'
      '       npg.name as npg_name,'
      '       r.rest_litr,'
      '       r.rest_kg,'
      '       r.rep_build_date'
      '  from oil_rests_avias r, v_oil_azs azs, v_oil_np_group npg'
      ' where r. state = '#39'Y'#39
      '   and r.azs_id = azs.id'
      '   and r.azs_id = azs.inst'
      '   and r.np_group_id = npg.id'
      '   and r.id = :ID'
      '   and r.inst = :INST')
    Left = 248
  end
end
