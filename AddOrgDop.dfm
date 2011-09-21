inherited AddOrgDopForm: TAddOrgDopForm
  Left = 347
  Top = 312
  AutoSize = True
  BorderStyle = bsDialog
  Caption = #1044#1086#1087#1086#1083#1085'. '#1089#1074#1077#1076#1077#1085#1080#1103' '#1086#1073' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
  ClientHeight = 463
  ClientWidth = 290
  OldCreateOrder = True
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object p1: TPanel
    Left = 0
    Top = 430
    Width = 290
    Height = 33
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      290
      33)
    object bbOk: TBitBtn
      Left = 197
      Top = 4
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      ModalResult = 1
      TabOrder = 0
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 290
    Height = 64
    Align = alTop
    Caption = #1054#1087#1094#1080#1080' '#1076#1077#1073#1077#1090#1086#1088#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object l2: TLabel
      Left = 6
      Top = 18
      Width = 189
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1076#1086#1087#1091#1089#1090#1080#1084#1099#1093' '#1076#1085#1077#1081' '#1073#1077#1079' '#1086#1087#1083#1072#1090#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l10: TLabel
      Left = 6
      Top = 42
      Width = 167
      Height = 13
      Caption = #1057#1091#1084#1084#1072', '#1076#1086#1087#1091#1089#1090#1080#1084#1072#1103' '#1073#1077#1079' '#1086#1087#1083#1072#1090#1099': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object clcDebDays: TRxCalcEdit
      Left = 208
      Top = 14
      Width = 75
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ButtonWidth = 0
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
    end
    object clcDebSumm: TRxCalcEdit
      Left = 208
      Top = 38
      Width = 75
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ButtonWidth = 0
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
    end
  end
  object gbWebService: TGroupBox
    Left = 0
    Top = 329
    Width = 290
    Height = 58
    Align = alTop
    Caption = #1042#1077#1073'-'#1091#1089#1083#1091#1075#1080' www.anp.ua'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
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
      Left = 154
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
      Top = 32
      Width = 130
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
      Left = 154
      Top = 32
      Width = 130
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
  object GroupBox2: TGroupBox
    Left = 0
    Top = 64
    Width = 290
    Height = 75
    Align = alTop
    Caption = #1044#1080#1088#1077#1082#1090#1086#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object l3: TLabel
      Left = 6
      Top = 18
      Width = 30
      Height = 13
      Caption = #1060#1048#1054':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l5: TLabel
      Left = 6
      Top = 36
      Width = 91
      Height = 13
      Caption = #1056#1072#1073#1086#1095#1080#1081' '#1090#1077#1083#1077#1092#1086#1085':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l6: TLabel
      Left = 154
      Top = 36
      Width = 104
      Height = 13
      Caption = #1044#1086#1084#1072#1096#1085#1080#1081' '#1090#1077#1083#1077#1092#1086#1085':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object eBOSS: TEdit
      Left = 43
      Top = 14
      Width = 241
      Height = 21
      Hint = #1060#1072#1084#1080#1083#1080#1103', '#1048#1084#1103', '#1054#1090#1095#1077#1089#1080#1074#1086' '#1076#1080#1088#1077#1082#1090#1086#1088#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 0
    end
    object eBOSS_TEL_W: TEdit
      Left = 6
      Top = 49
      Width = 130
      Height = 21
      Hint = #1044#1086#1084#1072#1096#1085#1080#1081' '#1090#1077#1083#1077#1092#1086#1085' '#1076#1080#1088#1077#1082#1090#1086#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 1
    end
    object eBOSS_TEL_H: TEdit
      Left = 154
      Top = 49
      Width = 130
      Height = 21
      Hint = #1056#1072#1073#1086#1095#1080#1081' '#1090#1077#1083#1077#1092#1086#1085' '#1076#1080#1088#1077#1082#1090#1086#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 139
    Width = 290
    Height = 75
    Align = alTop
    Caption = #1043#1083#1072#1074#1085#1099#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object l8: TLabel
      Left = 154
      Top = 36
      Width = 104
      Height = 13
      Caption = #1044#1086#1084#1072#1096#1085#1080#1081' '#1090#1077#1083#1077#1092#1086#1085':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l7: TLabel
      Left = 6
      Top = 36
      Width = 91
      Height = 13
      Caption = #1056#1072#1073#1086#1095#1080#1081' '#1090#1077#1083#1077#1092#1086#1085':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l4: TLabel
      Left = 6
      Top = 18
      Width = 30
      Height = 13
      Caption = #1060#1048#1054':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object eGBUH_TEL_W: TEdit
      Left = 6
      Top = 49
      Width = 130
      Height = 21
      Hint = #1044#1086#1084#1072#1096#1085#1080#1081' '#1090#1077#1083#1077#1092#1086#1085' '#1075#1083#1072#1074#1085#1086#1075#1086' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 1
    end
    object eGBUH_TEL_H: TEdit
      Left = 154
      Top = 49
      Width = 130
      Height = 21
      Hint = #1056#1072#1073#1086#1095#1080#1081' '#1090#1077#1083#1077#1092#1086#1085' '#1075#1083#1072#1074#1085#1086#1075#1086' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 2
    end
    object eGBUH: TEdit
      Left = 43
      Top = 14
      Width = 241
      Height = 21
      Hint = #1060#1072#1084#1080#1083#1080#1103', '#1048#1084#1103', '#1054#1090#1095#1077#1089#1090#1074#1086' '#1075#1083#1072#1074#1085#1086#1075#1086' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 214
    Width = 290
    Height = 115
    Align = alTop
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object l11: TLabel
      Left = 6
      Top = 18
      Width = 30
      Height = 13
      Caption = #1060#1048#1054':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l1: TLabel
      Left = 6
      Top = 36
      Width = 21
      Height = 13
      Caption = 'ICQ:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l12: TLabel
      Left = 6
      Top = 71
      Width = 48
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l9: TLabel
      Left = 154
      Top = 71
      Width = 35
      Height = 13
      Caption = 'E-Mail :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l13: TLabel
      Left = 154
      Top = 36
      Width = 27
      Height = 13
      Caption = #1057#1072#1081#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ePERSON: TEdit
      Left = 43
      Top = 14
      Width = 241
      Height = 21
      Hint = #1060#1072#1084#1080#1083#1080#1103', '#1048#1084#1103', '#1054#1090#1095#1077#1089#1090#1074#1086' '#1082#1086#1085#1090#1072#1082#1090#1085#1086#1075#1086' '#1083#1080#1094#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 0
    end
    object eICQ: TEdit
      Left = 6
      Top = 49
      Width = 130
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 1
    end
    object ePERSON_TEL_H: TEdit
      Left = 6
      Top = 84
      Width = 130
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 100
      ParentFont = False
      TabOrder = 3
    end
    object eMailMan: TEdit
      Left = 154
      Top = 84
      Width = 130
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 100
      ParentFont = False
      TabOrder = 4
    end
    object eWEBSITE: TEdit
      Left = 154
      Top = 49
      Width = 130
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 2
    end
  end
  object gbShrotName: TGroupBox
    Left = 0
    Top = 387
    Width = 290
    Height = 43
    Align = alTop
    Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object LblShortName: TLabel
      Left = 4
      Top = 17
      Width = 147
      Height = 13
      Align = alCustom
      Alignment = taRightJustify
      Caption = #1057#1086#1082#1088'. '#1085#1072#1079#1074#1072#1085#1080#1077' ('#1076#1083#1103' '#1087#1072#1088#1090#1080#1081'):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object eShortName: TMaskEdit
      Left = 154
      Top = 14
      Width = 130
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 3
      TabOrder = 0
    end
  end
end
