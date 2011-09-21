inherited ExchCardClientForm: TExchCardClientForm
  Left = 303
  Top = 243
  BorderStyle = bsDialog
  Caption = #1047#1072#1084#1077#1085#1072' '#1082#1083#1080#1077#1085#1090#1086#1074
  ClientHeight = 293
  ClientWidth = 484
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbOld: TGroupBox
    Left = 0
    Top = 73
    Width = 242
    Height = 186
    Align = alLeft
    TabOrder = 1
    DesignSize = (
      242
      186)
    object lblOldClient: TLabel
      Left = 2
      Top = 15
      Width = 238
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = #1057#1090#1072#1088#1099#1081' '#1082#1083#1080#1077#1085#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 181
      Top = 8
      Width = 58
      Height = 14
      Alignment = taRightJustify
      AutoSize = False
      Caption = '===='
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object l4: TLabel
      Left = 6
      Top = 64
      Width = 57
      Height = 13
      Caption = #1043#1076#1077' '#1074#1074#1077#1076#1077#1085
    end
    object l5: TLabel
      Left = 6
      Top = 89
      Width = 56
      Height = 13
      Caption = 'ID '#1050#1083#1080#1077#1085#1090#1072
    end
    object l6: TLabel
      Left = 6
      Top = 113
      Width = 70
      Height = 13
      Caption = 'INST '#1050#1083#1080#1077#1085#1090#1072
    end
    object l7: TLabel
      Left = 6
      Top = 138
      Width = 89
      Height = 13
      Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1074' Petrol'
    end
    object l8: TLabel
      Left = 6
      Top = 162
      Width = 97
      Height = 13
      Caption = #1057#1089#1099#1083#1082#1080' '#1074' '#1090#1072#1073#1083#1080#1094#1072#1093
    end
    object edtOldClient: TComboEdit
      Left = 6
      Top = 34
      Width = 230
      Height = 20
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = edtOldClientButtonClick
      OnDblClick = edtOldClientButtonClick
      OnKeyPress = edtOldClientKeyPress
    end
    object edtFromOld: TEdit
      Left = 74
      Top = 59
      Width = 162
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtIDOld: TEdit
      Left = 126
      Top = 84
      Width = 110
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtINSTOld: TEdit
      Left = 126
      Top = 109
      Width = 110
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtBindOld: TEdit
      Left = 126
      Top = 134
      Width = 110
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtDependOld: TEdit
      Left = 126
      Top = 159
      Width = 110
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 259
    Width = 484
    Height = 34
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      484
      34)
    object bbOk: TBitBtn
      Left = 265
      Top = 4
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1047#1072#1084#1077#1085#1080#1090#1100
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
      Left = 377
      Top = 4
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047'&'#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      Kind = bkCancel
    end
    object btnRefreshLink: TBitBtn
      Left = 9
      Top = 4
      Width = 244
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 2
      OnClick = btnRefreshLinkClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000084000000840000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF000084000000840000008400000084
        000000840000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000084000000840000FFFF
        FF00FFFFFF0000840000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFF
        FF00FFFFFF0000840000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000840000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF0000840000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF00008400000084
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF000084000000840000008400000084
        000000840000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008400000084
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFF
        FF00FFFFFF0000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object gbNew: TGroupBox
    Left = 242
    Top = 73
    Width = 242
    Height = 186
    Align = alClient
    TabOrder = 2
    DesignSize = (
      242
      186)
    object lblNewClient: TLabel
      Left = 2
      Top = 15
      Width = 238
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = #1053#1086#1074#1099#1081' '#1082#1083#1080#1077#1085#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object lNew: TLabel
      Left = 1
      Top = 8
      Width = 58
      Height = 14
      AutoSize = False
      Caption = '===>'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object l9: TLabel
      Left = 6
      Top = 64
      Width = 57
      Height = 13
      Caption = #1043#1076#1077' '#1074#1074#1077#1076#1077#1085
    end
    object l10: TLabel
      Left = 6
      Top = 89
      Width = 56
      Height = 13
      Caption = 'ID '#1050#1083#1080#1077#1085#1090#1072
    end
    object l11: TLabel
      Left = 6
      Top = 113
      Width = 70
      Height = 13
      Caption = 'INST '#1050#1083#1080#1077#1085#1090#1072
    end
    object l12: TLabel
      Left = 6
      Top = 138
      Width = 89
      Height = 13
      Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1074' Petrol'
    end
    object l13: TLabel
      Left = 6
      Top = 162
      Width = 97
      Height = 13
      Caption = #1057#1089#1099#1083#1082#1080' '#1074' '#1090#1072#1073#1083#1080#1094#1072#1093
    end
    object edtNewClient: TComboEdit
      Left = 6
      Top = 34
      Width = 230
      Height = 20
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = edtNewClientButtonClick
      OnDblClick = edtNewClientButtonClick
      OnKeyPress = edtOldClientKeyPress
    end
    object edtFromNew: TEdit
      Left = 74
      Top = 59
      Width = 162
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtIDNew: TEdit
      Left = 126
      Top = 84
      Width = 110
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtINSTNew: TEdit
      Left = 126
      Top = 109
      Width = 110
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtBindNew: TEdit
      Left = 126
      Top = 134
      Width = 110
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtDependNew: TEdit
      Left = 126
      Top = 159
      Width = 110
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 484
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object l1: TLabel
      Left = 120
      Top = 30
      Width = 7
      Height = 13
      Caption = 'C'
    end
    object l2: TLabel
      Left = 230
      Top = 30
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object l3: TLabel
      Left = 120
      Top = 54
      Width = 60
      Height = 13
      Caption = #8470' '#1082#1072#1088#1090#1086#1095#1082#1080
    end
    object deS: TDateEdit
      Left = 136
      Top = 26
      Width = 89
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object dePo: TDateEdit
      Left = 250
      Top = 26
      Width = 89
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object cbDate: TCheckBox
      Left = 8
      Top = 28
      Width = 110
      Height = 17
      Caption = #1042#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072
      TabOrder = 2
      OnClick = cbDateClick
    end
    object cbAllCards: TCheckBox
      Left = 8
      Top = 52
      Width = 110
      Height = 17
      Caption = #1042#1089#1077
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 3
      OnClick = cbAllCardsClick
    end
    object eCardNumber: TEdit
      Left = 194
      Top = 50
      Width = 145
      Height = 21
      Color = clWhite
      TabOrder = 4
    end
    object cbRefreshLink: TCheckBox
      Left = 8
      Top = 4
      Width = 273
      Height = 17
      Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1087#1086' '#1087#1088#1080#1074#1103#1079#1082#1077
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = cbRefreshLinkClick
    end
  end
  object qFindClient: TOilQuery
    SQL.Strings = (
      'select petrol_id, petrol_type, link_id, link_inst'
      '  from (select id_nashego_klienta as petrol_id,'
      '               id_prinadlejnosti as petrol_type,'
      
        '               to_number(substr(LPAD(to_char(ID_klienta_importa)' +
        ', 12, '#39'0'#39'),'
      '                                1,'
      
        '                                12 - ANDRIY.ov.GetVal('#39'INST_MAX_' +
        'LENGTH'#39'))) as link_id,'
      
        '               to_number(substr(LPAD(to_char(ID_klienta_importa)' +
        ', 12, '#39'0'#39'),'
      
        '                                12 - ANDRIY.ov.GetVal('#39'INST_MAX_' +
        'LENGTH'#39') + 1,'
      
        '                                ANDRIY.ov.GetVal('#39'INST_MAX_LENGT' +
        'H'#39'))) as link_inst'
      '          from &card_user.ecfil108) l,'
      '       (select id_from, id_to'
      '          from adm_inst_change'
      '         where type_name = '#39'PPON'#39
      '        union all'
      '        select to_number(:org_inst) as id_from,'
      '               to_number(:org_inst) as id_to'
      '          from dual'
      '         where not exists'
      '         (select id_from, id_to'
      '                  from adm_inst_change'
      '                 where type_name = '#39'PPON'#39
      
        '                   and (:org_inst = id_from or :org_inst = id_to' +
        '))) a'
      ' where l.link_inst in (a.id_from, a.id_to)'
      '   and l.link_id = :org_id')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 435
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'org_inst'
      end
      item
        DataType = ftUnknown
        Name = 'org_id'
      end>
    MacroData = <
      item
        Name = 'card_user'
      end>
  end
end
