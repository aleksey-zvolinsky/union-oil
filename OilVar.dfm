inherited OilVarForm: TOilVarForm
  Left = 371
  Top = 266
  BorderStyle = bsDialog
  Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  ClientHeight = 426
  ClientWidth = 569
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 394
    Width = 569
    Height = 32
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      569
      32)
    object BitBtn1: TBitBtn
      Left = 475
      Top = 3
      Width = 90
      Height = 25
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1085#1072#1089#1090#1088#1086#1077#1082
      Anchors = [akTop, akRight]
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      Kind = bkCancel
    end
    object bbOk: TBitBtn
      Left = 379
      Top = 3
      Width = 90
      Height = 25
      Hint = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1074#1085#1077#1089#1077#1085#1080#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      Anchors = [akTop, akRight]
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      ModalResult = 1
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
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 569
    Height = 394
    ActivePage = tsRash
    Align = alClient
    HotTrack = True
    TabOrder = 0
    object tsCommon: TTabSheet
      Caption = #1054#1073#1097#1080#1077
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 134
        Height = 13
        Caption = #1044#1072#1085#1085#1072#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 54
        Width = 89
        Height = 13
        Caption = #1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1072' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 94
        Width = 138
        Height = 13
        Caption = #1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1086#1055#1088#1086#1076#1091#1082#1090' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ComboEdit1: TComboEdit
        Left = 8
        Top = 28
        Width = 270
        Height = 21
        Hint = 
          #1042' '#1101#1090#1086#1084' '#1087#1086#1083#1077' '#1091#1082#1072#1079#1099#1074#1072#1077#1090#1100#1089#1103' '#1090#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1085#1072' '#1082#1086#1090#1086#1088#1086#1081' '#1074' '#1076#1072#1085#1085#1099#1081' '#1084#1086#1084#1077 +
          #1085#1090' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1072
        DirectInput = False
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 0
        OnButtonClick = ComboEdit1ButtonClick
        OnDblClick = ComboEdit1ButtonClick
        OnKeyPress = ceDR_OperKeyPress
      end
      object ComboEdit2: TComboEdit
        Left = 8
        Top = 70
        Width = 270
        Height = 21
        Hint = 
          #1042' '#1101#1090#1086#1084' '#1087#1086#1083#1077' '#1091#1082#1072#1079#1099#1074#1072#1077#1090#1100#1089#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1082#1086#1090#1086#1088#1072#1103' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1077#1090' '#1086#1088#1075#1072#1085 +
          #1080#1079#1072#1094#1080#1080' '#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1072
        DirectInput = False
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 1
        OnButtonClick = ComboEdit2ButtonClick
        OnDblClick = ComboEdit2ButtonClick
        OnKeyPress = ceDR_OperKeyPress
      end
      object ComboEdit3: TComboEdit
        Left = 8
        Top = 110
        Width = 270
        Height = 21
        Hint = 
          #1042' '#1101#1090#1086#1084' '#1087#1086#1083#1077' '#1091#1082#1072#1079#1099#1074#1072#1077#1090#1100#1089#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1082#1086#1090#1086#1088#1072#1103' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1077#1090' '#1086#1088#1075#1072#1085 +
          #1080#1079#1072#1094#1080#1080' '#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1086#1055#1088#1086#1076#1091#1082#1090
        DirectInput = False
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 2
        OnButtonClick = ComboEdit3ButtonClick
        OnDblClick = ComboEdit3ButtonClick
        OnKeyPress = ceDR_OperKeyPress
      end
      object Panel4: TPanel
        Left = 296
        Top = 0
        Width = 265
        Height = 366
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 3
        object GroupBox6: TGroupBox
          Left = 5
          Top = 12
          Width = 250
          Height = 40
          Caption = #1044#1077#1073#1077#1090#1086#1088#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object cbDebetLastYear: TCheckBox
            Left = 8
            Top = 16
            Width = 236
            Height = 17
            Caption = #1055#1088#1086#1096#1083#1099#1081' '#1075#1086#1076' '#1074' '#1082#1072#1090#1077#1075#1086#1088#1080' "'#1055#1088#1086#1096#1083#1099#1081' '#1075#1086#1076'"'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object GroupBox3: TGroupBox
          Left = 5
          Top = 54
          Width = 250
          Height = 40
          Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1072#1083#1086#1085#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object cbDoubleScan: TCheckBox
            Left = 8
            Top = 16
            Width = 220
            Height = 17
            Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1090#1072#1083#1086#1085#1099' '#1076#1074#1072' '#1088#1072#1079#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object GroupBox8: TGroupBox
          Left = 5
          Top = 94
          Width = 250
          Height = 55
          Caption = #1071#1079#1099#1082' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object rbLangRus: TRadioButton
            Left = 8
            Top = 16
            Width = 113
            Height = 17
            Caption = #1056#1091#1089#1089#1082#1080#1081
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TabStop = True
          end
          object rbLangUkr: TRadioButton
            Left = 8
            Top = 33
            Width = 113
            Height = 17
            Caption = #1059#1082#1088#1072#1080#1085#1089#1082#1080#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1043#1088#1091#1087#1087#1099' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
      ImageIndex = 1
      TabVisible = False
    end
    object TabSheet5: TTabSheet
      Caption = #1043#1088#1091#1087#1087#1099' '#1086#1087#1077#1088#1072#1094#1080#1081
      ImageIndex = 4
      TabVisible = False
    end
    object TabSheet3: TTabSheet
      Caption = #1058#1080#1087#1099' '#1086#1087#1077#1088#1072#1094#1080#1081
      ImageIndex = 2
      TabVisible = False
    end
    object TabSheet4: TTabSheet
      Caption = #1058#1080#1087#1099' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
      ImageIndex = 3
      TabVisible = False
    end
    object TabSheet6: TTabSheet
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      ImageIndex = 5
      object Panel3: TPanel
        Left = 259
        Top = 0
        Width = 302
        Height = 365
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          302
          365)
        object GroupBox2: TGroupBox
          Left = 4
          Top = 0
          Width = 297
          Height = 100
          Caption = #1044#1083#1103' '#1087#1077#1095#1072#1090#1080' '#1076#1086#1075#1086#1074#1086#1088#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object CBPrintDogFilial: TCheckBox
            Left = 6
            Top = 14
            Width = 285
            Height = 17
            Caption = #1055#1077#1095#1072#1090#1100' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1085#1072' '#1091#1088#1086#1074#1085#1077' '#1092#1080#1083#1080#1072#1083#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = CBPrintDogFilialClick
          end
          object CBPrintRS: TCheckBox
            Left = 6
            Top = 80
            Width = 285
            Height = 17
            Caption = #1055#1077#1095#1072#1090#1100' '#1056'/'#1057' '#1053#1044#1057
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object RBInshe: TRadioButton
            Left = 25
            Top = 31
            Width = 260
            Height = 17
            Caption = #1057#1074#1086#1080' '#1088#1077#1082#1074#1080#1079#1080#1090#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object RBRekvizitControl: TRadioButton
            Left = 25
            Top = 46
            Width = 260
            Height = 17
            Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object RBRekvizitFilialaNK: TRadioButton
            Left = 25
            Top = 61
            Width = 260
            Height = 17
            Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1092#1080#1083#1080#1072#1083#1072' '#1053#1050' "'#1040#1083#1100#1092#1072' - '#1053#1072#1092#1090#1072'"'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
        object GroupBox7: TGroupBox
          Left = 4
          Top = 100
          Width = 297
          Height = 82
          Anchors = [akRight, akBottom]
          Caption = #1059#1089#1083#1086#1074#1080#1077' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1074' '#1076#1086#1075#1086#1074#1086#1088#1077' '#1087#1086' '#1086#1090#1087#1091#1089#1082#1091' '#1089' '#1053#1041
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object edDogPostCond: TEdit
            Left = 6
            Top = 18
            Width = 285
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cbDogPostCond: TCheckBox
            Left = 6
            Top = 42
            Width = 285
            Height = 17
            Caption = #1041#1088#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = cbDogPostCondClick
          end
          object cbDogPostCondFromWhom: TCheckBox
            Left = 6
            Top = 60
            Width = 285
            Height = 17
            Caption = #1041#1088#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1089' '#1087#1086#1083#1103' "'#1054#1090' '#1082#1086#1075#1086'"'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = cbDogPostCondFromWhomClick
          end
        end
        object GroupBox5: TGroupBox
          Left = 4
          Top = 183
          Width = 297
          Height = 57
          Anchors = [akRight, akBottom]
          Caption = #1044#1083#1103' '#1058#1058#1053
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object cbTTNRealAddress: TCheckBox
            Left = 6
            Top = 17
            Width = 285
            Height = 17
            Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1074' '#1058#1058#1053' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cbPrintTTNFilNK: TCheckBox
            Left = 6
            Top = 36
            Width = 285
            Height = 17
            Caption = #1055#1077#1095#1072#1090#1100' '#1058#1058#1053' '#1092#1080#1083#1080#1072#1083#1072' '#1053#1050' "'#1040#1083#1100#1092#1072' - '#1053#1072#1092#1090#1072'"'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object gbPost: TGroupBox
          Left = 4
          Top = 299
          Width = 297
          Height = 66
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object lblManagerShip: TLabel
            Left = 33
            Top = 17
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = #1059#1087#1088#1072#1074#1083#1103#1102#1097#1080#1081':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblBuhShip: TLabel
            Left = 18
            Top = 41
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = #1043#1083#1072#1074#1085#1099#1081' '#1087#1086' '#1091#1095#1105#1090#1091':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object eManagerShip: TEdit
            Left = 113
            Top = 13
            Width = 178
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object eBuhShip: TEdit
            Left = 113
            Top = 38
            Width = 178
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
        object GroupBox9: TGroupBox
          Left = 4
          Top = 241
          Width = 297
          Height = 56
          Caption = #1044#1083#1103' '#1087#1077#1095#1072#1090#1080' '#1056#1053
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object cbRN_FilNK: TCheckBox
            Left = 6
            Top = 17
            Width = 285
            Height = 17
            Caption = #1056#1053' '#1092#1080#1083#1080#1072#1083#1072' '#1053#1050' "'#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1072'" ('#1086#1090#1087#1091#1089#1082' '#1089' '#1053#1041')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cbRN_FilNK_CT: TCheckBox
            Left = 6
            Top = 36
            Width = 285
            Height = 17
            Caption = #1056#1053' '#1092#1080#1083#1080#1072#1083#1072' '#1053#1050' "'#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1072'" ('#1090#1072#1083#1086#1085#1099' '#1080' '#1082#1072#1088#1090'.)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 259
        Height = 330
        Caption = #1044#1083#1103' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label4: TLabel
          Left = 65
          Top = 20
          Width = 79
          Height = 13
          Caption = #1085#1086#1084#1077#1088' '#1092#1080#1083#1080#1072#1083#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object EFilialNumber: TEdit
          Left = 6
          Top = 16
          Width = 51
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
          ParentFont = False
          TabOrder = 0
        end
        object cbReserv: TCheckBox
          Left = 6
          Top = 209
          Width = 245
          Height = 17
          Caption = #1041#1088#1072#1090#1100' '#1085#1086#1084#1077#1088#1072' '#1085#1072#1083#1086#1075#1086#1074#1099#1093' '#1080#1079' '#1088#1077#1079#1077#1088#1074#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object cbManual: TCheckBox
          Left = 6
          Top = 228
          Width = 245
          Height = 17
          Caption = #1055#1088#1077#1076#1083#1072#1075#1072#1090#1100' '#1088#1091#1095#1085#1086#1081' '#1074#1074#1086#1076' '#1085#1086#1084#1077#1088#1072' '#1085#1072#1083#1086#1075#1086#1074#1086#1081
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object gbProvider: TGroupBox
          Left = 3
          Top = 37
          Width = 253
          Height = 136
          Caption = #1044#1083#1103' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object LblNNRekvizit: TLabel
            Left = 24
            Top = 15
            Width = 65
            Height = 26
            Caption = #13#10#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 24
            Top = 74
            Width = 65
            Height = 26
            Caption = #13#10#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object pNNRekvizit: TPanel
            Left = 25
            Top = 42
            Width = 177
            Height = 35
            TabOrder = 0
            object rgNNWithUpperRekvizit: TRadioGroup
              Left = -8
              Top = -12
              Width = 193
              Height = 49
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Items.Strings = (
                #1059#1087#1088#1072#1074#1083#1077#1085#1080#1103
                #1053#1050' "'#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1072'"')
              ParentFont = False
              TabOrder = 0
            end
          end
          object cbNNWithUpperRekvizit: TCheckBox
            Left = 6
            Top = 15
            Width = 245
            Height = 17
            Caption = #1055#1077#1095#1072#1090#1100' '#1089' '#1088#1077#1082#1074#1080#1079#1080#1090#1072#1084#1080' '#1074#1099#1096#1077#1089#1090#1086#1103#1097#1077#1081' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = cbNNWithUpperRekvizitClick
          end
          object CBAdress: TCheckBox
            Left = 6
            Top = 74
            Width = 245
            Height = 17
            Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1072#1076#1088#1077#1089' '#1074#1099#1096#1077#1089#1090#1086#1103#1097#1077#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = CBAdressClick
          end
          object pNNAdress: TPanel
            Left = 25
            Top = 101
            Width = 177
            Height = 31
            TabOrder = 3
            object rgNNAdress: TRadioGroup
              Left = -8
              Top = -12
              Width = 193
              Height = 49
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Items.Strings = (
                #1059#1087#1088#1072#1074#1083#1077#1085#1080#1103
                #1053#1050' "'#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1072'"')
              ParentFont = False
              TabOrder = 0
            end
          end
        end
        object gbClient: TGroupBox
          Left = 3
          Top = 173
          Width = 253
          Height = 35
          Caption = #1044#1083#1103' '#1082#1083#1080#1077#1085#1090#1072' - '#1092#1080#1083#1080#1072#1083#1072' '#1053#1050' '#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object cbNNClientAdress: TCheckBox
            Left = 6
            Top = 15
            Width = 245
            Height = 17
            Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1072#1076#1088#1077#1089' '#1080' '#1090#1077#1083'. '#1053#1050' '#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1099
            TabOrder = 0
          end
        end
        object Panel5: TPanel
          Left = 2
          Top = 295
          Width = 127
          Height = 30
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 6
          object sbEditCause: TSpeedButton
            Left = 3
            Top = 3
            Width = 121
            Height = 24
            Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1074#1099#1074#1086#1076#1072
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = sbEditCauseClick
          end
        end
        object rgPrintTypeDailyTax: TRadioGroup
          Left = 3
          Top = 246
          Width = 253
          Height = 45
          Caption = #1057#1087#1086#1089#1086#1073' '#1087#1077#1095#1072#1090#1080' '#1077#1078#1077#1076#1085#1077#1074#1085#1086#1081' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Items.Strings = (
            #1055#1086#1076#1088#1086#1073#1085#1072#1103
            #1057#1074#1086#1076#1085#1072#1103)
          ParentFont = False
          TabOrder = 5
        end
      end
      object Panel1: TPanel
        Left = 129
        Top = 295
        Width = 128
        Height = 30
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object sbPrintSettings: TSpeedButton
          Left = 3
          Top = 3
          Width = 122
          Height = 24
          Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1087#1077#1095#1072#1090#1100
          Flat = True
          OnClick = sbPrintSettingsClick
        end
      end
      object gbBill: TGroupBox
        Left = 0
        Top = 330
        Width = 259
        Height = 35
        Caption = #1044#1083#1103' '#1089#1095#1077#1090#1086#1074' ('#1082#1072#1088#1090#1086#1095#1085#1099#1077')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object cbBillNumForCard: TCheckBox
          Left = 6
          Top = 15
          Width = 245
          Height = 17
          Caption = #1041#1088#1072#1090#1100' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1085#1086#1084#1077#1088' '#1087#1086' '#1082#1083#1080#1077#1085#1090#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object tsCard: TTabSheet
      Caption = #1069#1083'. '#1082#1072#1088#1090#1099
      ImageIndex = 6
      object GroupBox4: TGroupBox
        Left = 8
        Top = 8
        Width = 273
        Height = 185
        Caption = #1057#1084#1072#1088#1090'-'#1082#1072#1088#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label5: TLabel
          Left = 8
          Top = 93
          Width = 161
          Height = 13
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080' - '#1072#1075#1077#1085#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LblAvizoSyffix: TLabel
          Left = 72
          Top = 20
          Width = 119
          Height = 13
          Caption = #1089#1091#1092#1092#1080#1082#1089' '#1085#1086#1084#1077#1088#1072' '#1072#1074#1080#1079#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblCardUser: TLabel
          Left = 8
          Top = 133
          Width = 60
          Height = 13
          Caption = #1057#1093#1077#1084#1072' '#1074' '#1041#1044
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object chLSEnable: TCheckBox
          Left = 8
          Top = 46
          Width = 163
          Height = 17
          Caption = #1042#1082#1083#1102#1095#1077#1085#1072' '#1083#1080#1084#1080#1090#1085#1072#1103' '#1089#1093#1077#1084#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object chAgentEnable: TCheckBox
          Left = 8
          Top = 69
          Width = 169
          Height = 17
          Caption = #1042#1082#1083#1102#1095#1077#1085#1099' '#1092#1091#1085#1082#1094#1080#1080' '#1072#1075#1077#1085#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object ceAgentName: TComboEdit
          Left = 8
          Top = 109
          Width = 255
          Height = 21
          Hint = 
            #1042' '#1101#1090#1086#1084' '#1087#1086#1083#1077' '#1091#1082#1072#1079#1099#1074#1072#1077#1090#1100#1089#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1082#1086#1090#1086#1088#1072#1103' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1077#1090' '#1086#1088#1075#1072#1085 +
            #1080#1079#1072#1094#1080#1080' '#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1072
          DirectInput = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          GlyphKind = gkDropDown
          NumGlyphs = 1
          ParentFont = False
          TabOrder = 3
          OnButtonClick = ceAgentNameButtonClick
          OnDblClick = ceAgentNameButtonClick
          OnKeyPress = ceDR_OperKeyPress
        end
        object EAvizoSyffix: TEdit
          Left = 8
          Top = 16
          Width = 51
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
          ParentFont = False
          TabOrder = 0
        end
        object cbCardUser: TComboBox
          Left = 8
          Top = 148
          Width = 255
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 4
          OnKeyPress = ceDR_OperKeyPress
        end
      end
    end
    object tsTalon: TTabSheet
      Caption = #1058#1072#1083#1086#1085#1099
      ImageIndex = 7
      object GroupBox10: TGroupBox
        Left = 0
        Top = 0
        Width = 561
        Height = 57
        Align = alTop
        Caption = #1055#1088#1080#1093#1086#1076' '#1090#1072#1083#1086#1085#1086#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object cbTalonDevideAlfaAvias: TCheckBox
          Left = 8
          Top = 34
          Width = 505
          Height = 17
          Caption = 
            #1053#1077' '#1087#1088#1080#1085#1080#1084#1072#1090#1100' '#1074' '#1086#1076#1080#1085' '#1087#1088#1080#1093#1086#1076' '#1090#1072#1083#1086#1085#1099' '#1087#1088#1086#1076#1072#1085#1099#1077' '#1054#1054#1054' "'#1055#1058#1060' '#1040#1074#1080#1072#1089'" '#1080'  '#1054#1054 +
            #1054' "'#1053#1050' '#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1072'"'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cbTalonCheckReturn: TCheckBox
          Left = 8
          Top = 16
          Width = 241
          Height = 17
          Caption = #1055#1088#1086#1074#1077#1088#1103#1090#1100' '#1090#1072#1083#1086#1085#1099' '#1082#1083#1080#1077#1085#1090#1072' '#1087#1088#1080' '#1074#1086#1079#1074#1088#1072#1090#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = cbTalonCheckReturnClick
        end
      end
    end
    object tsDR: TTabSheet
      Caption = #1057#1084#1077#1085#1085#1099#1077' '#1086#1090#1095#1077#1090#1099
      ImageIndex = 8
      object lDR_RashAddNalFromTalon: TLabel
        Left = 24
        Top = 156
        Width = 459
        Height = 52
        Caption = 
          #1055#1088#1080#1084#1077#1088':'#13#10'    '#1047#1072#1082#1072#1079' - 150 '#1083'.'#13#10'    '#1053#1072#1083#1080#1090#1086' - 149,45 '#1083'.'#13#10#1042' '#1087#1088#1086#1095#1077#1102' '#1088#1077 +
          #1072#1083#1080#1079#1072#1094#1080#1102' '#1073#1091#1076#1077#1090' '#1074#1085#1077#1089#1077#1085#1086' 150 '#1083'., '#1072' '#1074' '#1085#1072#1083#1080#1095#1085#1086#1081' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1073#1091#1076#1077#1090' '#1086#1090#1085 +
          #1103#1090#1086' 0,55 '#1083'.'
      end
      object lDR_NotLoadLittlePrih: TLabel
        Left = 272
        Top = 246
        Width = 148
        Height = 13
        Caption = #1083#1080#1090#1088#1086#1074' ('#1076#1083#1103' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074')'
      end
      object lDR_GetPriceFromPriceRef: TLabel
        Left = 23
        Top = 290
        Width = 71
        Height = 13
        Caption = #1074#1074#1077#1076#1077#1085#1085#1099#1077' '#1079#1072
      end
      object lday: TLabel
        Left = 183
        Top = 291
        Width = 24
        Height = 13
        Caption = #1076#1085#1077#1081
      end
      object gbDR_RashAdd: TGroupBox
        Left = 0
        Top = 0
        Width = 561
        Height = 78
        Align = alTop
        Caption = 
          #1056#1072#1079#1085#1080#1094#1072' '#1084#1077#1078#1076#1091' '#1079#1072#1075#1088#1091#1078#1077#1085#1085#1086#1081' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1077#1081' '#1080' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1077#1081' '#1087#1086' '#1089#1095#1077#1090#1095#1080#1082#1072#1084 +
          ' '#1085#1072' '#1040#1047#1057
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object ceDR_Oper: TComboEdit
          Left = 264
          Top = 51
          Width = 292
          Height = 20
          DirectInput = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          GlyphKind = gkDropDown
          NumGlyphs = 1
          ParentFont = False
          TabOrder = 3
          OnButtonClick = ceDR_OperButtonClick
          OnDblClick = ceDR_OperButtonClick
          OnKeyPress = ceDR_OperKeyPress
        end
        object rbDR_RashAddNot: TRadioButton
          Left = 6
          Top = 18
          Width = 256
          Height = 17
          Caption = #1053#1080#1095#1077#1075#1086' '#1085#1077' '#1076#1077#1083#1072#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = rbDR_RashAddOtherClick
        end
        object rbDR_RashAddNal: TRadioButton
          Left = 6
          Top = 36
          Width = 256
          Height = 17
          Caption = #1047#1072#1085#1086#1089#1080#1090#1100' '#1074' '#1085#1072#1083#1080#1095#1085#1091#1102' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1102
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TabStop = True
          OnClick = rbDR_RashAddOtherClick
        end
        object rbDR_RashAddOther: TRadioButton
          Left = 6
          Top = 54
          Width = 256
          Height = 17
          Caption = #1047#1072#1085#1086#1089#1080#1090#1100' '#1074' '#1087#1088#1086#1095#1077#1102' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1102' '#1089' '#1086#1087#1077#1088#1072#1094#1080#1077#1081
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = rbDR_RashAddOtherClick
        end
      end
      object cbDR_RashAddNalFromTalon: TCheckBox
        Left = 6
        Top = 140
        Width = 529
        Height = 17
        Caption = 
          #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1083#1080#1095#1085#1091#1102' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1102', '#1077#1089#1083#1080' '#1079#1072#1082#1072#1079' '#1085#1077' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1077#1090' ' +
          #1085#1072#1083#1080#1090#1086#1084#1091' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084' '#1040#1074#1080#1072#1089#1072
        TabOrder = 2
      end
      object gbDR_RashVisibleParts: TGroupBox
        Left = 0
        Top = 78
        Width = 561
        Height = 59
        Align = alTop
        Caption = #1053#1077' '#1089#1082#1088#1099#1074#1072#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object cbDR_RashVisibleTal: TCheckBox
          Left = 6
          Top = 18
          Width = 200
          Height = 17
          Caption = #1058#1072#1083#1086#1085#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cbDR_RashVisibleSN: TCheckBox
          Left = 6
          Top = 36
          Width = 200
          Height = 17
          Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1099#1077' '#1085#1091#1078#1076#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object cbDR_NotLoadTwoPrih: TCheckBox
        Left = 6
        Top = 220
        Width = 529
        Height = 17
        Caption = #1053#1077' '#1079#1072#1075#1088#1091#1078#1072#1090#1100' '#1087#1086#1074#1090#1086#1088#1103#1102#1097#1080#1077' '#1087#1088#1080#1093#1086#1076#1099' ('#1076#1083#1103' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074')'
        TabOrder = 3
      end
      object cbDR_NotLoadLittlePrih: TCheckBox
        Left = 6
        Top = 246
        Width = 195
        Height = 17
        Caption = #1053#1077' '#1079#1072#1075#1088#1091#1078#1072#1090#1100' '#1087#1088#1080#1093#1086#1076#1099' '#1084#1077#1085#1100#1096#1077
        TabOrder = 4
        OnClick = cbDR_NotLoadLittlePrihClick
      end
      object eDR_NotLoadLittlePrih: TEdit
        Left = 192
        Top = 244
        Width = 73
        Height = 21
        Color = clScrollBar
        MaxLength = 5
        TabOrder = 5
        OnKeyPress = eDR_NotLoadLittlePrihKeyPress
      end
      object cbDR_GetPriceFromPriceRef: TCheckBox
        Left = 6
        Top = 271
        Width = 338
        Height = 17
        Caption = #1062#1077#1085#1099' '#1073#1088#1072#1090#1100' '#1089#1086' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' "'#1062#1077#1085#1099' '#1085#1072' '#1089#1086#1087#1091#1090#1089#1090#1074#1091#1102#1097#1080#1081' '#1090#1086#1074#1072#1088'"'
        TabOrder = 6
        OnClick = cbDR_GetPriceFromPriceRefClick
      end
      object eDR_DayPeriodPriceRef: TEdit
        Left = 102
        Top = 289
        Width = 73
        Height = 21
        Color = clScrollBar
        MaxLength = 5
        TabOrder = 7
        OnKeyPress = eDR_NotLoadLittlePrihKeyPress
      end
    end
    object tsRash: TTabSheet
      Caption = #1054#1090#1087#1091#1089#1082' '#1089' '#1053#1041
      ImageIndex = 9
      object gbRashTTN: TGroupBox
        Left = 0
        Top = 0
        Width = 561
        Height = 121
        Align = alTop
        Caption = #1055#1077#1095#1072#1090#1100' '#1058#1058#1053
        TabOrder = 0
        object lRash1: TLabel
          Left = 6
          Top = 20
          Width = 133
          Height = 13
          Caption = #1055#1088#1077#1092#1080#1082'c '#1076#1083#1103' '#1044#1058' ('#1085#1072#1095#1072#1083#1086'):'
        end
        object lRash2: TLabel
          Left = 6
          Top = 44
          Width = 128
          Height = 13
          Caption = #1055#1088#1077#1092#1080#1082'c '#1076#1083#1103' '#1044#1058' ('#1082#1086#1085#1077#1094'):'
        end
        object lRash3: TLabel
          Left = 6
          Top = 68
          Width = 159
          Height = 13
          Caption = #1055#1088#1077#1092#1080#1082'c '#1076#1083#1103' '#1073#1077#1085#1079#1080#1085#1072' ('#1085#1072#1095#1072#1083#1086'):'
        end
        object lRash4: TLabel
          Left = 6
          Top = 92
          Width = 154
          Height = 13
          Caption = #1055#1088#1077#1092#1080#1082'c '#1076#1083#1103' '#1073#1077#1085#1079#1080#1085#1072' ('#1082#1086#1085#1077#1094'):'
        end
        object eRashTTN_DT_FIRST: TEdit
          Left = 180
          Top = 16
          Width = 250
          Height = 21
          TabOrder = 0
        end
        object eRashTTN_DT_LAST: TEdit
          Left = 180
          Top = 40
          Width = 250
          Height = 21
          TabOrder = 1
        end
        object eRashTTN_NP_FIRST: TEdit
          Left = 180
          Top = 64
          Width = 250
          Height = 21
          TabOrder = 2
        end
        object eRashTTN_NP_LAST: TEdit
          Left = 180
          Top = 88
          Width = 250
          Height = 21
          TabOrder = 3
        end
      end
    end
  end
end
