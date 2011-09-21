inherited AddFizfaceForm: TAddFizfaceForm
  Left = 442
  Top = 255
  Width = 342
  Height = 446
  Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
  OldCreateOrder = True
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object l12: TLabel
    Left = 6
    Top = 149
    Width = 98
    Height = 13
    Caption = #1040#1076#1088#1077#1089' '#1087#1086' '#1087#1072#1089#1087#1086#1088#1090#1091':'
  end
  object p1: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 386
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object l5: TLabel
      Left = 6
      Top = 5
      Width = 126
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103', '#1080#1084#1103', '#1086#1090#1095#1077#1089#1090#1074#1086
    end
    object l6: TLabel
      Left = 6
      Top = 42
      Width = 122
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1077#1088#1074#1086#1075#1086' '#1082#1086#1085#1090#1072#1082#1090#1072':'
    end
    object l11: TLabel
      Left = 6
      Top = 77
      Width = 131
      Height = 13
      Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1082#1086#1076':'
    end
    object l4: TLabel
      Left = 6
      Top = 125
      Width = 98
      Height = 13
      Caption = #1040#1076#1088#1077#1089' '#1087#1086' '#1087#1072#1089#1087#1086#1088#1090#1091':'
    end
    object l1: TLabel
      Left = 6
      Top = 169
      Width = 173
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085' ('#1076#1086#1084#1072#1096#1085#1080#1081', '#1084#1086#1073#1080#1083#1100#1085#1099#1081'):'
    end
    object l14: TLabel
      Left = 176
      Top = 42
      Width = 90
      Height = 13
      Caption = #1058#1080#1087' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080':'
    end
    object sbFakeIdNum: TSpeedButton
      Left = 108
      Top = 91
      Width = 23
      Height = 22
      AllowAllUp = True
      GroupIndex = 1
      Caption = #1060
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbFakeIdNumClick
    end
    object l3: TLabel
      Left = 168
      Top = 210
      Width = 32
      Height = 13
      Caption = 'E-Mail:'
    end
    object l2: TLabel
      Left = 6
      Top = 210
      Width = 21
      Height = 13
      Caption = 'ICQ:'
    end
    object l13: TLabel
      Left = 6
      Top = 149
      Width = 99
      Height = 13
      Caption = #1040#1076#1088#1077#1089' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103':'
    end
    object edFIO: TEdit
      Left = 6
      Top = 19
      Width = 323
      Height = 21
      TabOrder = 0
    end
    object DEBegin: TDateEdit
      Left = 6
      Top = 56
      Width = 125
      Height = 21
      Hint = #1042#1088#1077#1084#1103' '#1087#1077#1088#1074#1086#1075#1086' '#1076#1077#1083#1086#1074#1086#1075#1086' '#1082#1086#1085#1090#1072#1082#1090#1072' '#1089' '#1101#1090#1086#1081' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1077#1081
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 237
      Width = 330
      Height = 91
      Align = alBottom
      Caption = #1055#1072#1089#1087#1086#1088#1090' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      object l7: TLabel
        Left = 6
        Top = 16
        Width = 31
        Height = 13
        Caption = #1057#1077#1088#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object l8: TLabel
        Left = 69
        Top = 16
        Width = 11
        Height = 13
        Caption = #8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object l9: TLabel
        Left = 6
        Top = 52
        Width = 59
        Height = 13
        Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object l10: TLabel
        Left = 219
        Top = 16
        Width = 69
        Height = 13
        Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edSer: TEdit
        Left = 6
        Top = 30
        Width = 33
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edWhom: TEdit
        Left = 6
        Top = 66
        Width = 317
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DEWhen: TDateEdit
        Left = 219
        Top = 30
        Width = 105
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 2
      end
      object edNum: TEdit
        Left = 69
        Top = 30
        Width = 124
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object edAddress: TEdit
      Left = 112
      Top = 122
      Width = 217
      Height = 21
      TabOrder = 6
    end
    object edPhone: TEdit
      Left = 6
      Top = 183
      Width = 323
      Height = 21
      TabOrder = 8
    end
    object CEType: TComboEdit
      Left = 176
      Top = 56
      Width = 153
      Height = 21
      Hint = #1058#1080#1087' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = CETypeButtonClick
    end
    object edIdNum: TEdit
      Left = 6
      Top = 92
      Width = 100
      Height = 21
      TabOrder = 3
    end
    object CBFace: TComboBox
      Left = 176
      Top = 80
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnChange = CBFaceChange
      Items.Strings = (
        #1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
        #1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
        #1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085)
    end
    object cbSvoy: TCheckBox
      Left = 176
      Top = 103
      Width = 155
      Height = 17
      Caption = #1042#1085#1077#1089#1077#1085' '#1074' '#1089#1087#1080#1089#1086#1082' "'#1089#1074#1086#1080#1093'"'
      TabOrder = 5
    end
    object gbWebService: TGroupBox
      Left = 2
      Top = 328
      Width = 330
      Height = 56
      Align = alBottom
      Caption = #1042#1077#1073'-'#1091#1089#1083#1091#1075#1080' www.anp.ua'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      object LblMail: TLabel
        Left = 6
        Top = 16
        Width = 73
        Height = 13
        Caption = 'E-mail / '#1051#1086#1075#1080#1085':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LblPass: TLabel
        Left = 174
        Top = 16
        Width = 41
        Height = 13
        Caption = #1055#1072#1088#1086#1083#1100':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object eMail: TEdit
        Left = 6
        Top = 30
        Width = 150
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object ePass: TEdit
        Left = 174
        Top = 30
        Width = 150
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object eMailMan: TEdit
      Left = 204
      Top = 207
      Width = 125
      Height = 21
      MaxLength = 100
      TabOrder = 10
    end
    object eICQ: TEdit
      Left = 31
      Top = 207
      Width = 125
      Height = 21
      MaxLength = 100
      TabOrder = 9
    end
    object edAddressReal: TEdit
      Left = 112
      Top = 146
      Width = 217
      Height = 21
      TabOrder = 7
    end
  end
  object p2: TPanel
    Left = 0
    Top = 386
    Width = 334
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 151
      Top = 4
      Width = 87
      Height = 25
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
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
      Left = 242
      Top = 4
      Width = 87
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1088
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object qOrg: TOilQuery
    SQL.Strings = (
      'select oo.*,'
      '       odet.svoy,'
      '       odet.id as det_id,'
      '       odet2.id as det2_id,'
      '       odet2.fake_id_num,'
      '       odet.pass as pass,'
      '       odet.mail as mail,'
      '       odet.real_address,'
      '       odet.icq'
      '  from v_org oo, oil_org_det odet, oil_org_det2 odet2'
      ' where oo.id = :id'
      '   and oo.inst = :inst'
      '   and odet.state(+) = '#39'Y'#39
      '   and odet.org_id(+) = oo.id'
      '   and odet.inst(+) = oo.inst'
      '   and odet2.state(+) = '#39'Y'#39
      '   and odet2.org_id(+) = oo.id'
      '   and odet2.org_inst(+) = oo.inst'
      '   and odet2.inst(+) = oo.inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 299
    Top = 3
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
end
