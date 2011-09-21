inherited TestDBForm: TTestDBForm
  Left = 317
  Top = 64
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1055#1088#1086#1074#1077#1088#1082#1080' '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1089#1090#1080' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 498
  ClientWidth = 766
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LRecordCount: TLabel
    Left = 468
    Top = 476
    Width = 155
    Height = 16
    Alignment = taRightJustify
    Caption = #1053#1072#1078#1084#1080#1090#1077' "'#1054#1073#1085#1086#1074#1080#1090#1100'"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RxLabel1: TRxLabel
    Left = 256
    Top = 48
    Width = 47
    Height = 13
    Caption = 'RxLabel1'
  end
  object Label15: TLabel
    Left = 256
    Top = 476
    Width = 64
    Height = 13
    Caption = #1055#1088#1086#1074#1077#1088#1103#1090#1100' '#1089
  end
  object BtnRefresh: TBitBtn
    Left = 6
    Top = 471
    Width = 105
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 1
    OnClick = BtnRefreshClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888888888888888888888880F888888888888887F8888888888888800F888888
      888888877F88888888888880B0F888888888888787F88888888888880B0F8888
      88888888787F88888888888803B0F888888888887887F88888888888803B0F88
      8888888887887F8888888FFFF03BB0F888888FFFF78887F8888880000003BB0F
      888887777778887F88888803BBBB3330F888887888888887F88888803BBB0000
      08888887888877777888888803BBB0F888888888788887F888888888803BBB0F
      888888888788887F8888888888033330F888888888788887F888888888800000
      0F888888888777777F8888888888888888888888888888888888}
    NumGlyphs = 2
  end
  object BtnPrint: TBitBtn
    Left = 117
    Top = 471
    Width = 105
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    Enabled = False
    TabOrder = 2
    OnClick = BtnPrintClick
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 766
    Height = 469
    ActivePage = TabSheet7
    Align = alTop
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Hint = 
        #1057#1088#1072#1074#1085#1077#1085#1080#1077' '#1087#1088#1080#1093#1086#1076#1086#1074' '#1085#1072' '#1085#1077#1092#1090#1077#1073#1072#1079#1091' '#1089' '#1040#1047#1057' '#1080' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1093' '#1074#1086#1079#1074#1088#1072#1090#1086 +
        #1074' '#1089' '#1040#1047#1057' '#1085#1072' '#1085#1077#1092#1090#1077#1073#1072#1079#1091'. '
      Caption = #1053#1041' '#1087#1088#1080#1093#1086#1076' - '#1040#1047#1057' '#1088#1072#1089#1093#1086#1076
      object Label2: TLabel
        Left = 0
        Top = 8
        Width = 707
        Height = 16
        Caption = 
          #1057#1088#1072#1074#1085#1077#1085#1080#1077' '#1087#1088#1080#1093#1086#1076#1086#1074' '#1085#1072' '#1085#1077#1092#1090#1077#1073#1072#1079#1091' '#1089' '#1040#1047#1057' '#1080' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1080#1093' '#1074#1086#1079#1074#1088#1072#1090#1086 +
          #1074' '#1089' '#1040#1047#1057' '#1085#1072' '#1085#1077#1092#1090#1077#1073#1072#1079#1091'. '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxDBGrid1: TDBGridEh
        Left = 0
        Top = 40
        Width = 753
        Height = 377
        DataGrouping.GroupLevels = <>
        DataSource = DsNB_Azs
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DOG'
            Footers = <>
            Title.Caption = #1055#1072#1088#1090#1080#1103
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'DATE_'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'SUB_PART'
            Footers = <>
            Title.Caption = #1055#1086#1076#1087#1072#1088#1090#1080#1103
          end
          item
            EditButtons = <>
            FieldName = 'PPON_NAME'
            Footers = <>
            Title.Caption = #1055#1055#1054#1053
            Width = 228
          end
          item
            EditButtons = <>
            FieldName = 'AZS_NAME'
            Footers = <>
            Title.Caption = #1040#1047#1057
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'PRIH_TONN'
            Footers = <>
            Title.Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1085#1072' '#1053#1041' ('#1090'.)'
            Width = 103
          end
          item
            EditButtons = <>
            FieldName = 'DELIV_TONN'
            Footers = <>
            Title.Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1086' '#1089' '#1040#1047#1057' ('#1090'.)'
            Width = 118
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
      ImageIndex = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 485
        Height = 16
        Caption = #1057#1088#1072#1074#1085#1077#1085#1080#1077' '#1087#1083#1086#1090#1085#1086#1089#1090#1080' '#1074' '#1086#1090#1087#1091#1089#1082#1077' '#1089' '#1053#1041' '#1085#1072' '#1040#1047#1057' '#1080' '#1074' '#1089#1084#1077#1085#1085#1086#1084' '#1086#1090#1095#1077#1090#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgDensity: TDBGridEh
        Left = 0
        Top = 41
        Width = 753
        Height = 400
        DataGrouping.GroupLevels = <>
        DataSource = DsDensity
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
        RowDetailPanel.Color = clBtnFace
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'R_DATE'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1088#1072#1089#1093#1086#1076#1072
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'PPON_NAME'
            Footers = <>
            Title.Caption = #1055#1055#1054#1053
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'AZS_NAME'
            Footers = <>
            Title.Caption = #1040#1047#1057
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'REP_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1089#1084'.'#1086#1090#1095#1077#1090#1072
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'SMENA_NUM'
            Footers = <>
            Title.Caption = #1057#1084#1077#1085#1072
            Width = 40
          end
          item
            EditButtons = <>
            FieldName = 'DOG'
            Footers = <>
            Title.Caption = #1055#1072#1088#1090#1080#1103'/'#1053#1055
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'UD_WEIG'
            Footers = <>
            Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' ('#1088#1072#1089#1093#1086#1076')'
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'PR_UD_WEIG'
            Footers = <>
            Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' ('#1089#1084'.'#1086#1090#1095#1077#1090')'
            Width = 60
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1062#1077#1085#1099' '#1085#1072' '#1040#1047#1057
      ImageIndex = 3
      object Label4: TLabel
        Left = 0
        Top = 8
        Width = 407
        Height = 16
        Caption = #1055#1086#1080#1089#1082' '#1087#1086#1076#1086#1079#1088#1080#1090#1077#1083#1100#1085#1099#1093' '#1094#1077#1085' '#1079#1072' '#1083#1080#1090#1088' '#1074' '#1089#1084#1077#1085#1085#1099#1093' '#1086#1090#1095#1077#1090#1072#1093
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxDBGrid4: TDBGridEh
        Left = 0
        Top = 40
        Width = 753
        Height = 377
        DataGrouping.GroupLevels = <>
        DataSource = DsPricesAZS
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'AZS_NAME'
            Footers = <>
            Title.Caption = #1040#1047#1057
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'REP_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Width = 72
          end
          item
            EditButtons = <>
            FieldName = 'SMENA_NUM'
            Footers = <>
            Title.Caption = #1057#1084#1077#1085#1072
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'SUB_PART'
            Footers = <>
            Title.Caption = #1055#1086#1076#1087#1072#1088#1090#1080#1103
            Width = 92
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072' '#1079#1072' '#1083#1080#1090#1088
            Width = 81
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = #1053#1041' '#1088#1072#1089#1093#1086#1076' - '#1040#1047#1057' '#1087#1088#1080#1093#1086#1076
      ImageIndex = 6
      object Label6: TLabel
        Left = 8
        Top = 8
        Width = 676
        Height = 16
        Caption = 
          #1057#1088#1072#1074#1085#1077#1085#1080#1077' '#1086#1090#1087#1091#1089#1082#1086#1074' '#1089' '#1085#1077#1092#1090#1077#1073#1072#1079#1099' '#1085#1072' '#1040#1047#1057' '#1080' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1080#1093' '#1087#1088#1080#1093#1086#1076#1086#1074 +
          ' '#1074' '#1089#1084#1077#1085#1085#1099#1093' '#1086#1090#1095#1077#1090#1072#1093
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgAzs_NB: TDBGridEh
        Left = 0
        Top = 41
        Width = 758
        Height = 400
        Align = alBottom
        DataGrouping.GroupLevels = <>
        DataSource = DSAzs_NB
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
        ReadOnly = True
        RowDetailPanel.Color = clBtnFace
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DOG'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1055#1072#1088#1090#1080#1103
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'PPON_NAME'
            Footers = <>
            Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'RASH_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1086#1090#1087#1091#1089#1082#1072
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'SM_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1087#1088#1080#1093#1086#1076#1072
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'AZS_FROM'
            Footers = <>
            Title.Caption = #1040#1047#1057' '#1086#1090#1087#1091#1089#1082#1072
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'AZS_TO'
            Footers = <>
            Title.Caption = #1040#1047#1057' '#1087#1088#1080#1093#1086#1076#1072
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'SMENA'
            Footers = <>
            Title.Caption = #1057#1084#1077#1085#1072
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'COUNT_'
            Footers = <>
            Title.Caption = #1054#1090#1087#1091#1089#1082' '#1089' '#1053#1041', '#1090#1086#1085#1085
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'PR_COUNT'
            Footers = <>
            Title.Caption = #1055#1088#1080#1093#1086#1076' '#1085#1072' '#1040#1047#1057', '#1090#1086#1085#1085
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'RASH_DOUBLE_IN_SREP'
            Footers = <>
            Title.Caption = #1057#1091#1097#1077#1089#1090#1074#1086#1074#1072#1085#1080#1077' '#1086#1090#1087#1091#1089#1082#1072'/'#1087#1088#1080#1093#1086#1076#1072
            Width = 100
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = #1056#1072#1079#1085#1086#1077
      ImageIndex = 7
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 758
        Height = 441
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Memo: TMemo
          Left = 2
          Top = 2
          Width = 223
          Height = 437
          Align = alLeft
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object Panel2: TPanel
          Left = 225
          Top = 2
          Width = 531
          Height = 437
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          object bbLostNumNN: TBitBtn
            Left = 8
            Top = 88
            Width = 217
            Height = 25
            Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1102#1097#1080#1077' '#1085#1086#1084#1077#1088#1072' '#1085#1072#1083#1086#1075#1086#1074#1099#1093
            TabOrder = 1
            OnClick = bbLostNumNNClick
          end
          object bbLostNumTTN: TBitBtn
            Left = 8
            Top = 120
            Width = 217
            Height = 25
            Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1102#1097#1080#1077' '#1085#1086#1084#1077#1088#1072' '#1058#1058#1053
            TabOrder = 0
            OnClick = bbLostNumTTNClick
          end
          object Panel3: TPanel
            Left = 2
            Top = 2
            Width = 527
            Height = 79
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 2
            object Label7: TLabel
              Left = 32
              Top = 12
              Width = 13
              Height = 13
              Caption = #1054#1090
            end
            object Label8: TLabel
              Left = 180
              Top = 12
              Width = 12
              Height = 13
              Caption = #1087#1086
            end
            object Label9: TLabel
              Left = 16
              Top = 44
              Width = 35
              Height = 13
              Caption = #1055#1055#1054#1053':'
            end
            object DateEdit1: TDateEdit
              Left = 56
              Top = 8
              Width = 105
              Height = 21
              NumGlyphs = 2
              TabOrder = 0
            end
            object DateEdit2: TDateEdit
              Left = 208
              Top = 8
              Width = 105
              Height = 21
              NumGlyphs = 2
              TabOrder = 1
            end
            object CEOrg: TComboEdit
              Left = 56
              Top = 40
              Width = 257
              Height = 21
              GlyphKind = gkDropDown
              NumGlyphs = 1
              TabOrder = 2
              OnButtonClick = CEOrgButtonClick
              OnDblClick = CEOrgButtonClick
            end
          end
          object bbDoubleNumNN: TBitBtn
            Left = 296
            Top = 88
            Width = 217
            Height = 25
            Caption = #1044#1091#1073#1083#1080#1088#1091#1102#1097#1080#1077#1089#1103' '#1085#1086#1084#1077#1088#1072' '#1085#1072#1083#1086#1075#1086#1074#1099#1093
            TabOrder = 3
            OnClick = bbDoubleNumNNClick
          end
          object bbDoubleNumTTN: TBitBtn
            Left = 296
            Top = 120
            Width = 217
            Height = 25
            Caption = #1044#1091#1073#1083#1080#1088#1091#1102#1097#1080#1077#1089#1103' '#1085#1086#1084#1077#1088#1072' '#1058#1058#1053
            TabOrder = 4
            OnClick = bbDoubleNumTTNClick
          end
        end
      end
    end
    object TabSheet9: TTabSheet
      Caption = #1040#1074#1090#1086
      ImageIndex = 8
      object RxDBGrid9: TDBGridEh
        Left = 0
        Top = 0
        Width = 489
        Height = 433
        DataGrouping.GroupLevels = <>
        DataSource = dsAuto
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object GroupBox1: TGroupBox
        Left = 493
        Top = 8
        Width = 265
        Height = 105
        Caption = #1055#1088#1086#1074#1077#1088#1082#1080
        TabOrder = 1
        object Label11: TLabel
          Left = 24
          Top = 31
          Width = 195
          Height = 13
          Caption = #1089' '#1053#1041' '#1080' '#1040#1047#1057' '#1073#1077#1079' '#1091#1082#1072#1079#1072#1085#1080#1103' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103' '
        end
        object Label12: TLabel
          Left = 24
          Top = 80
          Width = 89
          Height = 13
          Caption = #1086#1089#1090#1072#1090#1082#1072#1084' '#1074' '#1073#1072#1082#1072#1093
        end
        object Label10: TLabel
          Left = 24
          Top = 45
          Width = 69
          Height = 13
          Caption = '('#1089' 01.10.2000)'
        end
        object rbAuto1: TRadioButton
          Left = 8
          Top = 16
          Width = 225
          Height = 17
          Caption = #1054#1090#1087#1091#1089#1082#1080' '#1085#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1099#1081' '#1072#1074#1090#1086#1090#1088#1072#1085#1089#1087#1086#1088#1090
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbAuto1Click
        end
        object rbAuto2: TRadioButton
          Left = 8
          Top = 64
          Width = 241
          Height = 17
          Caption = #1055#1091#1090#1077#1074#1099#1077' '#1083#1080#1089#1090#1099', '#1074#1077#1076#1091#1097#1080#1077' '#1082' '#1086#1090#1088#1080#1094#1072#1090#1077#1083#1100#1085#1099#1084
          TabOrder = 1
          OnClick = rbAuto2Click
        end
      end
      object pnlAutoDate: TGroupBox
        Left = 496
        Top = 120
        Width = 261
        Height = 57
        Caption = #1055#1077#1088#1080#1086#1076
        TabOrder = 2
        Visible = False
        object Label13: TLabel
          Left = 8
          Top = 28
          Width = 7
          Height = 13
          Caption = #1057
        end
        object Label14: TLabel
          Left = 118
          Top = 28
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object dateWayBill: TDateEdit
          Left = 24
          Top = 24
          Width = 89
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
          OnChange = dateWayBillChange
        end
        object dateWayBill2: TDateEdit
          Left = 139
          Top = 24
          Width = 89
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
          OnChange = dateWayBill2Change
        end
      end
      object grbOrg: TGroupBox
        Left = 496
        Top = 184
        Width = 261
        Height = 49
        Caption = #1055#1055#1054#1053
        TabOrder = 3
        Visible = False
        object sbClearOrg: TSpeedButton
          Left = 233
          Top = 20
          Width = 22
          Height = 21
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
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
          OnClick = sbClearOrgClick
        end
        object cmeOrg: TComboEdit
          Left = 8
          Top = 20
          Width = 221
          Height = 21
          GlyphKind = gkDropDown
          NumGlyphs = 1
          TabOrder = 0
          OnButtonClick = cmeOrgButtonClick
        end
      end
    end
    object TabTalon: TTabSheet
      Caption = #1058#1072#1083#1086#1085#1099
      ImageIndex = 5
      object Label5: TLabel
        Left = 540
        Top = 230
        Width = 72
        Height = 13
        Caption = #1057#1077#1088#1080#1103' '#1090#1072#1083#1086#1085#1072' '
      end
      object lblBeginT: TLabel
        Left = 538
        Top = 275
        Width = 216
        Height = 52
        Caption = 
          #1055#1088#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1080' '#1085#1072#1095#1072#1083#1100#1085#1086#1081' '#1076#1072#1090#1099' '#13#10#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1088#1086#1074#1077#1088#1086#1082' '#1089#1086#1093#1088#1072#1085#1077#1085#1099' '#1085#1077' ' +
          #1073#1091#1076#1091#1090'.'#13#10#1044#1083#1103' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1076#1072#1090#1072' '#13#10#1076#1086#1083#1078#1085#1072' '#1073#1099#1090#1100' '#1088#1072#1074#1085#1072' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object dbgTalon: TDBGridEh
        Left = 0
        Top = 0
        Width = 531
        Height = 441
        Align = alLeft
        DataGrouping.GroupLevels = <>
        DataSource = dsTalon
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        RowDetailPanel.Color = clBtnFace
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object mGuideTalon: TMemo
        Left = -1
        Top = 4
        Width = 531
        Height = 438
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
        Visible = False
      end
      object rgTalon: TRadioGroup
        Left = 535
        Top = 5
        Width = 221
        Height = 184
        Caption = #1055#1088#1086#1074#1077#1088#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #1055#1088#1080#1093#1086#1076#1099' '#1079#1072' '#1082#1086#1090#1086#1088#1099#1084#1080' '#1087#1088#1080#1093#1086#1076
          #1054#1090#1087#1091#1089#1082#1080' '#1087#1077#1088#1077#1076' '#1082#1086#1090#1086#1088#1099#1084#1080' '#1086#1090#1087#1091#1089#1082
          #1055#1088#1080#1093#1086#1076' '#1080' '#1086#1090#1087#1091#1089#1082' '#1089' '#1076#1088'. '#1060#1080#1083#1080#1072#1083#1072
          #1044#1091#1073#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1072#1083#1086#1085#1072
          #1058#1072#1083#1086#1085#1099' '#1074' c'#1084#1077#1085#1085#1086#1084' '#1086#1090#1095#1077#1090#1077
          #1058#1072#1083#1086#1085#1099' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1102#1097#1080#1077' '#1074' '#1101#1084#1080#1089#1089#1080#1080
          #1053#1077#1087#1088#1072#1074#1080#1083#1100#1085#1099#1077' c'#1077#1088#1080#1080' '#1090#1072#1083#1086#1085#1086#1074
          #1053#1077#1087#1088#1072#1074#1080#1083#1100#1085#1099#1077' '#1085#1086#1084#1080#1085#1072#1083#1099' '#1090#1072#1083#1086#1085#1086#1074
          #1055#1088#1086#1074#1077#1088#1082#1080' '#1060#1080#1083#1080#1072#1083' + '#1054#1040#1054)
        ParentFont = False
        TabOrder = 0
        OnClick = rgTalonClick
      end
      object bbGuideTalon: TBitBtn
        Left = 536
        Top = 397
        Width = 215
        Height = 25
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1085#1089#1090#1088#1091#1082#1094#1080#1102
        TabOrder = 3
        OnClick = bbGuideTalonClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
          33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
          FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
          FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
          FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
          FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
          FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
          3333333773FFFF77333333333FBFBF3333333333377777333333}
        NumGlyphs = 2
      end
      object bbPrintTalon: TBitBtn
        Left = 535
        Top = 364
        Width = 216
        Height = 25
        Caption = #1055#1077#1095#1072#1090#1100' '#1074#1089#1077#1093' '#1087#1088#1086#1074#1077#1088#1086#1082' '#1076#1083#1103' '#1086#1090#1089#1099#1083#1082#1080
        TabOrder = 4
        OnClick = bbPrintTalonClick
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
      object BitBtn7: TBitBtn
        Left = 535
        Top = 245
        Width = 216
        Height = 25
        Caption = #1055#1077#1095#1072#1090#1100' '#1076#1080#1072#1075#1088#1072#1084#1099' '#1085#1072#1088#1091#1096#1077#1085#1080#1081
        TabOrder = 5
        OnClick = BitBtn7Click
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
      object eSer: TEdit
        Left = 615
        Top = 225
        Width = 26
        Height = 21
        TabOrder = 6
        Text = 'A01'
      end
      object bbRefreshTalon: TBitBtn
        Left = 534
        Top = 332
        Width = 216
        Height = 25
        Caption = #1047#1072#1087#1091#1089#1082' '#1074#1089#1077#1093' '#1087#1088#1086#1074#1077#1088#1086#1082' '#1073#1077#1079' '#1087#1077#1095#1072#1090#1080
        TabOrder = 7
        OnClick = bbPrintTalonClick
      end
    end
    object TabCard: TTabSheet
      Caption = #1069#1083'. '#1082#1072#1088#1090#1086#1095#1082#1080
      ImageIndex = 8
      object lblBeginC: TLabel
        Left = 538
        Top = 275
        Width = 216
        Height = 52
        Caption = 
          #1055#1088#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1080' '#1085#1072#1095#1072#1083#1100#1085#1086#1081' '#1076#1072#1090#1099' '#13#10#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1088#1086#1074#1077#1088#1086#1082' '#1089#1086#1093#1088#1072#1085#1077#1085#1099' '#1085#1077' ' +
          #1073#1091#1076#1091#1090'.'#13#10#1044#1083#1103' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1076#1072#1090#1072' '#13#10#1076#1086#1083#1078#1085#1072' '#1073#1099#1090#1100' '#1088#1072#1074#1085#1072' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object mGuideCard: TMemo
        Left = 0
        Top = 0
        Width = 531
        Height = 438
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 3
        Visible = False
      end
      object dbgCard: TDBGridEh
        Left = 0
        Top = 0
        Width = 531
        Height = 441
        Align = alLeft
        DataGrouping.GroupLevels = <>
        DataSource = dsCard
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object rgCard: TRadioGroup
        Left = 535
        Top = 5
        Width = 221
        Height = 211
        Caption = #1055#1088#1086#1074#1077#1088#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #1054#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1077' Petrol '#1080' '#1089#1084'. '#1086#1090#1095'. Oil'
          #1055#1077#1088#1077#1088#1072#1089#1093#1086#1076' '#1087#1086' '#1101#1083'. '#1082#1072#1088#1090#1077
          #1044#1091#1073#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1081
          #1055#1086#1087#1086#1083#1085#1077#1085#1080#1103' '#1089#1086#1073'. '#1072#1074#1090#1086
          #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1082#1072#1088#1090#1077' '#1074' Petrol '#1080' Oil'
          #1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1079#1072#1087#1080#1089#1077#1081' Petrol '#1080' Oil'
          #1053#1077#1087#1088#1072#1074#1080#1083#1100#1085#1072#1103' '#1087#1088#1080#1074#1103#1079#1082#1072' '#1087#1086' '#1082#1083#1080#1077#1085#1090#1091
          #1053#1077#1074#1077#1088#1085#1099#1081' '#1085#1086#1084#1077#1088#1072' '#1090#1077#1088#1084#1080#1085#1072#1083#1072
          #1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1079#1072#1087#1080#1089#1077#1081' Petrol '#1080' '#1055#1062
          #1053#1077#1076#1086#1089#1090#1072#1102#1097#1080#1077' '#1087#1072#1082#1077#1090#1099' Petrol'
          #1059#1095#1077#1090' '#1086#1090#1083#1086#1078#1077#1085#1085#1099#1093' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081)
        ParentFont = False
        TabOrder = 1
        OnClick = rgCardClick
      end
      object bbPrintCard: TBitBtn
        Left = 535
        Top = 364
        Width = 216
        Height = 25
        Caption = #1055#1077#1095#1072#1090#1100' '#1074#1089#1077#1093' '#1087#1088#1086#1074#1077#1088#1086#1082' '#1076#1083#1103' '#1086#1090#1089#1099#1083#1082#1080
        TabOrder = 2
        OnClick = bbPrintCardClick
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
      object bbGuideCard: TBitBtn
        Left = 536
        Top = 397
        Width = 215
        Height = 25
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1085#1089#1090#1088#1091#1082#1094#1080#1102
        TabOrder = 4
        OnClick = bbGuideCardClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
          33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
          FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
          FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
          FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
          FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
          FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
          3333333773FFFF77333333333FBFBF3333333333377777333333}
        NumGlyphs = 2
      end
      object bbRefreshCard: TBitBtn
        Left = 534
        Top = 332
        Width = 216
        Height = 25
        Caption = #1047#1072#1087#1091#1089#1082' '#1074#1089#1077#1093' '#1087#1088#1086#1074#1077#1088#1086#1082' '#1073#1077#1079' '#1087#1077#1095#1072#1090#1080
        TabOrder = 5
        OnClick = bbPrintCardClick
      end
    end
    object TabBlank: TTabSheet
      Caption = #1041#1083#1072#1085#1082#1080
      ImageIndex = 9
      object Label16: TLabel
        Left = 538
        Top = 275
        Width = 216
        Height = 52
        Caption = 
          #1055#1088#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1080' '#1085#1072#1095#1072#1083#1100#1085#1086#1081' '#1076#1072#1090#1099' '#13#10#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1088#1086#1074#1077#1088#1086#1082' '#1089#1086#1093#1088#1072#1085#1077#1085#1099' '#1085#1077' ' +
          #1073#1091#1076#1091#1090'.'#13#10#1044#1083#1103' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1076#1072#1090#1072' '#13#10#1076#1086#1083#1078#1085#1072' '#1073#1099#1090#1100' '#1088#1072#1074#1085#1072' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object dbgBlank: TDBGridEh
        Left = 0
        Top = 0
        Width = 531
        Height = 441
        Align = alLeft
        DataGrouping.GroupLevels = <>
        DataSource = dsBlank
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object bbRefreshBlank: TBitBtn
        Left = 534
        Top = 332
        Width = 216
        Height = 25
        Caption = #1047#1072#1087#1091#1089#1082' '#1074#1089#1077#1093' '#1087#1088#1086#1074#1077#1088#1086#1082' '#1073#1077#1079' '#1087#1077#1095#1072#1090#1080
        TabOrder = 1
        OnClick = bbRefreshBlankClick
      end
      object bbPrintBlank: TBitBtn
        Left = 535
        Top = 364
        Width = 216
        Height = 25
        Caption = #1055#1077#1095#1072#1090#1100' '#1074#1089#1077#1093' '#1087#1088#1086#1074#1077#1088#1086#1082' '#1076#1083#1103' '#1086#1090#1089#1099#1083#1082#1080
        TabOrder = 2
        OnClick = bbRefreshBlankClick
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
      object BitBtn8: TBitBtn
        Left = 536
        Top = 397
        Width = 215
        Height = 25
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1085#1089#1090#1088#1091#1082#1094#1080#1102
        TabOrder = 3
        Visible = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
          33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
          FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
          FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
          FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
          FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
          FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
          3333333773FFFF77333333333FBFBF3333333333377777333333}
        NumGlyphs = 2
      end
      object rgBlank: TRadioGroup
        Left = 535
        Top = 5
        Width = 217
        Height = 73
        Caption = #1055#1088#1086#1074#1077#1088#1082#1080
        ItemIndex = 0
        Items.Strings = (
          '111'
          '222'
          '333')
        TabOrder = 4
        OnClick = rgBlankClick
      end
    end
  end
  object BtnExit: TBitBtn
    Left = 648
    Top = 471
    Width = 115
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 3
    OnClick = BtnExitClick
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
  object deBegin: TDateEdit
    Left = 328
    Top = 472
    Width = 97
    Height = 21
    NumGlyphs = 2
    TabOrder = 4
    OnChange = deBeginChange
  end
  object QNb_Azs: TOilQuery
    SQL.Strings = (
      '--> qNb_Azs,TestDB'
      'select /*+ORDERED USE_HASH(ppon, azs)*/'
      ' dog,'
      ' date_,'
      ' nvl(sub_part, '#39'0'#39') as sub_part,'
      ' max(nvl(ppon.name, '#39#39')) as ppon_name,'
      ' azs.name as azs_name,'
      ' sum(prih_tonn) as prih_tonn,'
      ' sum(deliv_tonn) as deliv_tonn'
      '  from (select /*+ORDERED USE_HASH(p, pd, prt)*/'
      '         p.date_,'
      '         prt.dog,'
      '         to_char(null) as sub_part,'
      '         pd.fact_count as prih_tonn,'
      '         0 as deliv_tonn,'
      '         p.from_ as azs_id,'
      '         p.from_inst as azs_inst,'
      '         p.to_ as ppon_id,'
      '         p.to_inst as ppon_inst'
      '          from oil_prih_det pd, oil_prihod p, oil_part prt'
      '         where p.state = '#39'Y'#39
      '           and pd.state = '#39'Y'#39
      '           and prt.state = '#39'Y'#39
      '           and pd.prihod_id = p.id'
      '           and pd.inst = p.inst'
      '           and prt.id = p.part_id'
      '           and prt.inst = p.part_inst'
      '           and p.oper_id = 54'
      '           and pd.fact_count <> 0'
      '           and p.date_ >= :BeginDate'
      '        '
      '        UNION ALL'
      '        '
      '        select /*+ORDERED USE_HASH(oth, dr, d, r, prt)*/'
      '         trunc(d.rep_date) as date_,'
      '         prt.dog,'
      '         dr.sub_part,'
      '         0 as prih_tonn,'
      '         oth.count_t as deliv_tonn,'
      '         r.to_id as azs_id,'
      '         r.to_inst as azs_inst,'
      '         r.from_id as ppon_id,'
      '         r.from_inst as ppon_inst'
      '          from oil_srother   oth,'
      '               oil_dr_data   dr,'
      '               oil_daily_rep d,'
      '               oil_rashod    r,'
      '               oil_part      prt'
      '         where oth.state = '#39'Y'#39
      '           and dr.state = '#39'Y'#39
      '           and d.state = '#39'Y'#39
      '           and r.state = '#39'Y'#39
      '           and prt.state = '#39'Y'#39
      '           and oth.srep_id = dr.id'
      '           and oth.srep_inst = dr.inst'
      '           and dr.rep_id = d.id'
      '           and dr.rep_inst = d.inst'
      '           and r.id = dr.ttn_id'
      '           and r.inst = dr.ttn_inst'
      '           and r.part_id = prt.id'
      '           and r.part_inst = prt.inst'
      '           and oth.oper_id = 55'
      '           and trunc(d.rep_date) >= :BeginDate) A,'
      '       v_org ppon,'
      '       v_org azs'
      ' where ppon.id = A.ppon_id'
      '   and ppon.inst = A.ppon_inst'
      '   and azs.id = A.azs_id'
      '   and azs.inst = A.azs_inst'
      ' group by date_, dog, nvl(sub_part, '#39'0'#39'), azs.name'
      'having sum(prih_tonn) <> sum(deliv_tonn)'
      ' order by dog, date_')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 82
    Top = 61
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
    object QNb_AzsDOG: TStringField
      FieldName = 'DOG'
      Size = 15
    end
    object QNb_AzsDATE_: TDateTimeField
      FieldName = 'DATE_'
    end
    object QNb_AzsSUB_PART: TStringField
      FieldName = 'SUB_PART'
      Size = 10
    end
    object QNb_AzsPPON_NAME: TStringField
      FieldName = 'PPON_NAME'
      Size = 100
    end
    object QNb_AzsAZS_NAME: TStringField
      FieldName = 'AZS_NAME'
      Size = 100
    end
    object QNb_AzsPRIH_TONN: TFloatField
      FieldName = 'PRIH_TONN'
    end
    object QNb_AzsDELIV_TONN: TFloatField
      FieldName = 'DELIV_TONN'
    end
  end
  object DsNB_Azs: TOraDataSource
    DataSet = QNb_Azs
    Left = 26
    Top = 58
  end
  object QDensity: TOilQuery
    SQL.Strings = (
      '--> qDensity,TestDB'
      'select *'
      '  from (select /*+ORDERED*/'
      '         r.date_ as r_date,'
      '         r.from_id as ppon_id,'
      '         oo.name as ppon_name,'
      '         drep.azs_id,'
      '         azs.name as azs_name,'
      '         trunc(drep.rep_date) as rep_date,'
      '         drep.smena_num,'
      '         p.dog,'
      '         dr.pr_ud_weig,'
      '         r.ud_weig'
      '          from oil_daily_rep drep,'
      '               oil_dr_data   dr,'
      '               oil_rashod    r,'
      '               oil_part      p,'
      '               v_org         oo,'
      '               v_oil_azs     azs'
      '         where drep.state = '#39'Y'#39
      '           and dr.state = '#39'Y'#39
      '           and r.state = '#39'Y'#39
      '           and p.state = '#39'Y'#39
      '              '
      '           and dr.rep_id = drep.id'
      '           and dr.rep_inst = drep.inst'
      '              '
      '           and r.id = dr.ttn_id'
      '           and r.inst = dr.ttn_inst'
      '              '
      '           and p.id = r.part_id'
      '           and p.inst = r.part_inst'
      '              '
      '           and dr.oper_type in (0, 1)'
      '           and pr_ud_weig <> ud_weig'
      '           and trunc(drep.rep_date) <'
      
        '               to_date(nvl(ov.getval('#39'DR_AVERAGE_DATE'#39'), sysdate' +
        '),'
      '                       '#39'dd.mm.yyyy'#39')'
      
        '           and (r.date_ >= :BeginDate or trunc(drep.rep_date) >=' +
        ' :BeginDate)'
      '              '
      '           and oo.id = r.from_id'
      '           and oo.inst = r.from_inst'
      '              '
      '           and azs.id = drep.azs_id'
      '           and azs.inst = drep.azs_inst'
      '        union all'
      '        select /*+ORDERED*/'
      
        '         decode(dr.oper_type, 0, r.date_, to_date(null)) as r_da' +
        'te,'
      
        '         decode(dr.oper_type, 0, r.from_id, to_number(null)) as ' +
        'ppon_id,'
      
        '         decode(dr.oper_type, 0, oo.name, to_char(null)) as ppon' +
        '_name,'
      '         drep.azs_id,'
      '         azs.name as azs_name,'
      '         trunc(drep.rep_date) as rep_date,'
      '         drep.smena_num,'
      '         npt.name as dog,'
      '         dr.pr_ud_weig,'
      
        '         decode(dr.oper_type, 0, r.ud_weig, to_number(null)) as ' +
        'ud_weig'
      '          from oil_daily_rep drep,'
      '               oil_dr_data dr,'
      '               oil_rashod r,'
      '               oil_part p,'
      '               v_oil_np_type npt,'
      '               (select min(density_with) as density_with'
      '                  from oil_np_koef_density'
      '                 where state = '#39'Y'#39') d,'
      '               v_org oo,'
      '               v_oil_azs azs'
      '         where drep.state = '#39'Y'#39
      '           and dr.state = '#39'Y'#39
      '           and r.state = '#39'Y'#39
      '           and p.state = '#39'Y'#39
      '              '
      '           and dr.rep_id = drep.id'
      '           and dr.rep_inst = drep.inst'
      '              '
      '           and r.id = dr.ttn_id'
      '           and r.inst = dr.ttn_inst'
      '              '
      '           and p.id = r.part_id'
      '           and p.inst = r.part_inst'
      '              '
      '           and npt.id = p.np_type'
      '              '
      '           and dr.oper_type in (0, 1)'
      
        '           and ((dr.oper_type <> 0 and (nvl(pr_ud_weig, 0) < den' +
        'sity_with or'
      '               nvl(pr_ud_weig, 0) > 1)) or'
      '               (dr.oper_type = 0 and pr_ud_weig <> ud_weig))'
      '           and ov.getval('#39'DR_DENSITY_CALC'#39') = '#39'AVERAGE'#39
      '           and trunc(drep.rep_date) >='
      
        '               to_date(ov.getval('#39'DR_AVERAGE_DATE'#39'), '#39'dd.mm.yyyy' +
        #39')'
      '           and trunc(drep.rep_date) >= :BeginDate'
      '              '
      '           and oo.id = r.from_id'
      '           and oo.inst = r.from_inst'
      '              '
      '           and azs.id = drep.azs_id'
      '           and azs.inst = drep.azs_inst)'
      ' order by rep_date, azs_name, dog, ppon_name')
    MasterSource = DsNB_Azs
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    DataSource = DsNB_Azs
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 48
    Top = 128
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
  end
  object DsDensity: TOraDataSource
    DataSet = QDensity
    Left = 56
    Top = 112
  end
  object QPricesAZS: TOilQuery
    SQL.Strings = (
      '--> qPriceAZS,TestDB'
      'select distinct azs_name,rep_date,smena_num,sub_part,price'
      'from'
      ''
      
        '(select /*+ORDERED USE_HASH(dr,drep,r,p,npt,oo)*/ oo.name as azs' +
        '_name,trunc(drep.rep_date) as rep_date,drep.smena_num,dr.sub_par' +
        't,s_price as price'
      
        'from oil_dr_data dr,oil_daily_rep drep,oil_rashod r,oil_part p,o' +
        'il_np_type npt,v_org oo'
      'where dr.state='#39'Y'#39' and drep.state='#39'Y'#39
      '      and dr.rep_id=drep.id and dr.rep_inst=drep.inst'
      '      and drep.azs_id=oo.id and drep.azs_inst=oo.inst'
      '      and dr.ttn_id=r.id and dr.ttn_inst=r.inst'
      '      and r.part_id=p.id and r.part_inst=p.inst'
      '      and p.np_type=npt.id and r.state='#39'Y'#39' and p.state='#39'Y'#39
      '      and npt.grp_id in (3,4,5,6,7,10,59) and p.dim_id=2'
      '      and dr.s_price > 100'
      '      and trunc(drep.rep_date)>=:BeginDate'
      ''
      'UNION ALL'
      ''
      
        'select /*+ORDERED USE_HASH(dr,drep,r,p,npt,v,oo)*/ oo.name as az' +
        's_name,trunc(drep.rep_date) as rep_date,drep.smena_num,dr.sub_pa' +
        'rt,v.price'
      
        'from oil_vedomost v,oil_dr_data dr,oil_daily_rep drep,oil_rashod' +
        ' r,oil_part p,oil_np_type npt,v_org oo'
      'where dr.state='#39'Y'#39' and drep.state='#39'Y'#39' and v.state='#39'Y'#39
      '      and v.srep_id=dr.id and v.srep_inst=dr.inst'
      '      and dr.rep_id=drep.id and dr.rep_inst=drep.inst'
      '      and drep.azs_id=oo.id and drep.azs_inst=oo.inst'
      '      and dr.ttn_id=r.id and dr.ttn_inst=r.inst'
      '      and r.part_id=p.id and r.part_inst=p.inst'
      '      and p.np_type=npt.id and r.state='#39'Y'#39' and p.state='#39'Y'#39
      '      and npt.grp_id in (3,4,5,6,7,10,59) and p.dim_id=2'
      '      and v.price > 100'
      '      and trunc(drep.rep_date)>=:BeginDate'
      ''
      'UNION ALL'
      ''
      
        'select /*+ORDERED USE_HASH(dr,drep,r,p,npt,v,oo)*/ oo.name as az' +
        's_name,trunc(drep.rep_date) as rep_date,drep.smena_num,dr.sub_pa' +
        'rt,v.price'
      
        'from oil_srother v,oil_dr_data dr,oil_daily_rep drep,oil_rashod ' +
        'r,oil_part p,oil_np_type npt,v_org oo'
      'where dr.state='#39'Y'#39' and drep.state='#39'Y'#39' and v.state='#39'Y'#39
      '      and v.srep_id=dr.id and v.srep_inst=dr.inst'
      '      and dr.rep_id=drep.id and dr.rep_inst=drep.inst'
      '      and drep.azs_id=oo.id and drep.azs_inst=oo.inst'
      '      and dr.ttn_id=r.id and dr.ttn_inst=r.inst'
      '      and r.part_id=p.id and r.part_inst=p.inst'
      '      and p.np_type=npt.id and r.state='#39'Y'#39' and p.state='#39'Y'#39
      '      and npt.grp_id in (3,4,5,6,7,10,59) and p.dim_id=2'
      '      and v.price > 100'
      '      and trunc(drep.rep_date)>=:BeginDate'
      ''
      'UNION ALL'
      ''
      
        'select /*+ORDERED USE_HASH(dr,drep,r,p,npt,v,oo)*/ oo.name as az' +
        's_name,trunc(drep.rep_date) as rep_date,drep.smena_num,dr.sub_pa' +
        'rt,v.price'
      
        'from oil_srtalon v,oil_dr_data dr,oil_daily_rep drep,oil_rashod ' +
        'r,oil_part p,oil_np_type npt,v_org oo'
      'where dr.state='#39'Y'#39' and drep.state='#39'Y'#39' and v.state='#39'Y'#39
      '      and v.srep_id=dr.id and v.srep_inst=dr.inst'
      '      and dr.rep_id=drep.id and dr.rep_inst=drep.inst'
      '      and drep.azs_id=oo.id and drep.azs_inst=oo.inst'
      '      and dr.ttn_id=r.id and dr.ttn_inst=r.inst'
      '      and r.part_id=p.id and r.part_inst=p.inst'
      '      and p.np_type=npt.id and r.state='#39'Y'#39' and p.state='#39'Y'#39
      '      and npt.grp_id in (3,4,5,6,7,10,59) and p.dim_id=2'
      '      and v.price > 100'
      '      and trunc(drep.rep_date)>=:BeginDate'
      ')'
      ''
      'order by rep_date DESC'
      '')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 88
    Top = 248
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
    object QPricesAZSAZS_NAME: TStringField
      FieldName = 'AZS_NAME'
      Size = 100
    end
    object QPricesAZSREP_DATE: TDateTimeField
      FieldName = 'REP_DATE'
    end
    object QPricesAZSSMENA_NUM: TFloatField
      FieldName = 'SMENA_NUM'
    end
    object QPricesAZSSUB_PART: TStringField
      FieldName = 'SUB_PART'
      Size = 10
    end
    object QPricesAZSPRICE: TFloatField
      FieldName = 'PRICE'
    end
  end
  object DsPricesAZS: TOraDataSource
    DataSet = QPricesAZS
    Left = 24
    Top = 248
  end
  object QNalNumber: TOilQuery
    SQL.Strings = (
      '--> qNalNumber,TestDB'
      'select s_date,organ_name,num'
      'from v_oil_sale_book'
      
        'where (num, inst) in (select num, inst from oil_sale_book where ' +
        'state = '#39'Y'#39' group by num, inst having count(*) > 1)'
      '      and s_date>=:BeginDate'
      ''
      'order by num,s_date'
      ' '
      ' ')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 96
    Top = 304
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
    object QNalNumberS_DATE: TDateTimeField
      FieldName = 'S_DATE'
    end
    object QNalNumberORGAN_NAME: TStringField
      FieldName = 'ORGAN_NAME'
      Size = 100
    end
    object QNalNumberNUM: TStringField
      FieldName = 'NUM'
      Size = 8
    end
  end
  object DsNalNumber: TOraDataSource
    DataSet = QNalNumber
    Left = 24
    Top = 304
  end
  object qDateSN: TOilQuery
    SQL.Strings = (
      '--> qDateSN,TestDb'
      'select decode(tip, '#39'P'#39', '#39#1055#1088#1080#1093#1086#1076#39', '#39#1054#1090#1087#1091#1089#1082#39') as ttype,'
      '       substr(oo.name, 1, 40) as filial,'
      '       date_ as prih_date,'
      '       ser,'
      '       v.num'
      '  from v_oil_talon_op v, oil_org oo'
      ' where oo.id = oo.inst'
      '   and decode(v.tip, '#39'P'#39', to_id, from_id) = oo.id'
      '   and date_ >= :BeginDate'
      ' group by oo.name, tip, date_, ser, v.num'
      'having count(*) > 1')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 378
    Top = 210
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
    object qDateSNTTYPE: TStringField
      DisplayLabel = #1058#1080#1087' '#1086#1087#1077#1088#1072#1094#1080#1080
      FieldName = 'TTYPE'
      Size = 7
    end
    object qDateSNFILIAL: TStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      DisplayWidth = 40
      FieldName = 'FILIAL'
      Size = 40
    end
    object qDateSNPRIH_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'PRIH_DATE'
    end
    object qDateSNSER: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      FieldName = 'SER'
      Size = 3
    end
    object qDateSNNUM: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM'
    end
  end
  object qOutEmission: TOilQuery
    SQL.Strings = (
      '--> qOutEmission,TestDb'
      'select op.ser,'
      '       op.num,'
      '       to_char(op.date_, '#39'dd.mm.yyyy'#39') as date_,'
      '       oo.name as dep_name,'
      '       decode(op.tip, '#39'O'#39', '#39#1054#1090#1087#1091#1089#1082#39', '#39#1055#1088#1080#1093#1086#1076#39') as tip'
      '  from (select *'
      '          from (select op.*,'
      
        '                       row_number() over(partition by op.ser, op' +
        '.num order by op.date_, op.tip) as rnum'
      '                  from v_oil_talon_op op)'
      '         where rnum = 1'
      '           and oper_id <> 183) op,'
      '       v_org oo'
      ' where decode(op.tip, '#39'O'#39', from_id, to_id) = oo.id'
      '   and decode(op.tip, '#39'O'#39', from_inst, to_inst) = oo.inst'
      '   and not exists (select 1'
      '          from oil_talon_em e'
      '         where op.ser = e.ser'
      '           and op.num between e.num_from and e.num_to'
      '           and e.state = '#39'Y'#39')')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 378
    Top = 300
    object qOutEmissionSER: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      FieldName = 'SER'
      Size = 3
    end
    object qOutEmissionNUM: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM'
    end
    object qOutEmissionDATE_: TStringField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATE_'
    end
    object qOutEmissionDEP_NAME: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'DEP_NAME'
      Size = 100
    end
    object qOutEmissionTIP: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'TIP'
    end
  end
  object qBadNominal: TOilQuery
    SQL.Strings = (
      '--> qBadNominal,TestDb'
      'select ser,'
      '       op.num,'
      '       op.date_,'
      '       oo.name as dep_name,'
      '       decode(op.tip, '#39'O'#39', '#39#1054#1090#1087#1091#1089#1082#39', '#39#1055#1088#1080#1093#1086#1076#39') as tip'
      '  from v_oil_talon_op op, oil_org oo'
      ' where decode(op.tip, '#39'O'#39', from_id, to_id) = oo.id'
      '   and decode(op.tip, '#39'O'#39', from_inst, to_inst) = oo.inst'
      
        '   and decode(substr(Ser, 3, 1), '#39'0'#39', 5, '#39'1'#39', 10, '#39'2'#39', 20, '#39'3'#39', ' +
        '50, 0) <>'
      '       Nominal')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 378
    Top = 390
    object qBadNominalSER: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      DisplayWidth = 6
      FieldName = 'SER'
      Size = 3
    end
    object qBadNominalNUM: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM'
    end
    object qBadNominalDATE_: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DATE_'
    end
    object qBadNominalDEP_NAME: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      DisplayWidth = 45
      FieldName = 'DEP_NAME'
      Size = 100
    end
    object qBadNominalTIP: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 10
      FieldName = 'TIP'
    end
  end
  object qBadSer: TOilQuery
    SQL.Strings = (
      '--> qBadSer,TestDB'
      'select ser,'
      '       op.num,'
      '       op.date_,'
      '       oo.name as dep_name,'
      '       decode(op.tip, '#39'O'#39', '#39#1054#1090#1087#1091#1089#1082#39', '#39#1055#1088#1080#1093#1086#1076#39') as tip'
      '  from v_oil_talon_op op, oil_org oo'
      ' where decode(op.tip, '#39'O'#39', from_id, to_id) = oo.id'
      '   and decode(op.tip, '#39'O'#39', from_inst, to_inst) = oo.inst'
      
        '   and not (substr(Ser, 1, 1) in ('#39'A'#39', '#39'B'#39', '#39'C'#39', '#39'D'#39', '#39'E'#39', '#39'F'#39') ' +
        'and'
      
        '            substr(Ser, 2, 2) in ('#39'00'#39', '#39'01'#39', '#39'02'#39', '#39'03'#39') or exi' +
        'sts'
      '            (select *'
      '               from oil_var'
      '              where name = '#39'INST'#39
      '                and value = '#39'394'#39') and'
      '            Ser in ('#39'Q01'#39', '#39'Q02'#39', '#39'Q03'#39', '#39'W01'#39', '#39'W02'#39', '#39'R02'#39'))')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 378
    Top = 345
    object qBadSerSER: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      DisplayWidth = 6
      FieldName = 'SER'
      Size = 3
    end
    object qBadSerNUM: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM'
    end
    object qBadSerDATE_: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DATE_'
    end
    object qBadSerDEP_NAME: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      DisplayWidth = 45
      FieldName = 'DEP_NAME'
      Size = 100
    end
    object qBadSerTIP: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 10
      FieldName = 'TIP'
    end
  end
  object qSRTalon: TOilQuery
    SQL.Strings = (
      '--> qSRTalon,TestDB'
      'select /*+ORDERED USE_NL(Oil_Daily_Rep, Filial, AZS)*/'
      ' LostTalon.Title,'
      ' Filial.Name as Filial,'
      ' AZS.Name as AZS,'
      ' Oil_Daily_Rep.Rep_Date,'
      ' Oil_Daily_Rep.Smena_Num,'
      ' LostTalon.Ser,'
      ' LostTalon.Num,'
      ' abs(LostTalon.Litr) as Nominal'
      '  from (select decode(sign(sum(Litr)),'
      '                      1,'
      '                      '#39#1045#1089#1090#1100' '#1087#1088#1080#1093#1086#1076#1077' '#1085#1086' '#1085#1077#1090' '#1074' '#1089#1084'. '#1086#1090#1095#1077#1090#1077#39','
      
        '                      '#39#1045#1089#1090#1100' '#1089#1084'. '#1086#1090#1095#1077#1090#1077' '#1085#1086' '#1085#1077#1090' '#1074' '#1087#1088#1080#1093#1086#1076#1077#39') as Tit' +
        'le,'
      '               SRep_Id,'
      '               SRep_Inst,'
      '               Ser,'
      '               Num,'
      '               sum(Litr) as Litr'
      
        '          from (select SRep_Id, SRep_Inst, Ser, Num, Nominal as ' +
        'Litr'
      '                  from V_Oil_Talon_Op'
      '                 where Tip = '#39'P'#39
      '                   and Ser is not null'
      '                   and SRep_Id is not null'
      '                union all'
      '                select /*+ORDERED USE_HASH(srt, drd)*/'
      
        '                 drd.Rep_Id, drd.Rep_Inst, srt.Ser, srt.Num, -sr' +
        't.Litr'
      '                  from Oil_SRTalon srt, Oil_DR_Data drd'
      '                 where drd.state = '#39'Y'#39
      '                   and srt.state = '#39'Y'#39
      
        '                   and ((srt.ser is not null and srt.inst = 118)' +
        ' or'
      '                       (srt.inst <> 118))'
      '                   and srt.SRep_Id = drd.Id'
      '                   and srt.SRep_Inst = drd.Inst)'
      '         group by SRep_Id, SRep_Inst, Ser, Num'
      '        having round(sum(Litr), 2) <> 0) LostTalon,'
      '       Oil_Daily_Rep,'
      '       v_org Filial,'
      '       v_org AZS'
      ' where Oil_Daily_Rep.State = '#39'Y'#39
      '   and Oil_Daily_Rep.Inst = Filial.Id'
      '   and Oil_Daily_Rep.AZS_Id = AZS.Id'
      '   and Oil_Daily_Rep.AZS_Inst = AZS.Inst'
      '   and LostTalon.SRep_Id = Oil_Daily_Rep.Id'
      '   and LostTalon.SRep_Inst = Oil_Daily_Rep.Inst'
      '   and trunc(rep_date) >= :BeginDate'
      ' order by Rep_Date')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 378
    Top = 255
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
    object qSRTalonTITLE: TStringField
      DisplayLabel = #1053#1072#1088#1091#1096#1077#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'TITLE'
      Size = 32
    end
    object qSRTalonFILIAL: TStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'FILIAL'
      Size = 100
    end
    object qSRTalonAZS: TStringField
      DisplayLabel = #1040#1047#1057
      FieldName = 'AZS'
      Size = 100
    end
    object qSRTalonREP_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'REP_DATE'
    end
    object qSRTalonSMENA_NUM: TFloatField
      DisplayLabel = #1057#1084#1077#1085#1072
      FieldName = 'SMENA_NUM'
    end
    object qSRTalonSER: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      FieldName = 'SER'
      Size = 3
    end
    object qSRTalonNUM: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM'
    end
    object qSRTalonNOMINAL: TFloatField
      DisplayLabel = #1051#1080#1090#1088#1072#1078
      FieldName = 'NOMINAL'
    end
  end
  object qTreeOut: TOilQuery
    SQL.Strings = (
      '--> qTreeOut,TestDb'
      'select substr(oo.name, 1, 40) as filial,'
      '       v.ser,'
      '       v.num,'
      '       v.prev_date as Begin_Date,'
      '       v.date_ as End_Date,'
      '       substr(oo1.name, 1, 40) as prev_filial'
      '  from v_oil_talon_opl v, oil_org oo, oil_org oo1'
      ' where v.tip = '#39'O'#39
      '   and v.prev_tip = '#39'O'#39
      '   and v.from_id = oo.id'
      '   and v.from_inst = oo.inst'
      '   and v.prev_from_id = oo1.id'
      '   and v.prev_from_inst = oo1.inst'
      '   and v.prev_date >= :BeginDate')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 378
    Top = 120
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
    object qTreeOutFILIAL: TStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      DisplayWidth = 40
      FieldName = 'FILIAL'
      Size = 40
    end
    object qTreeOutSER: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      FieldName = 'SER'
      Size = 3
    end
    object qTreeOutNUM: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM'
    end
    object qTreeOutBEGIN_DATE: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072
      FieldName = 'BEGIN_DATE'
    end
    object qTreeOutEND_DATE: TDateTimeField
      DisplayLabel = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072
      FieldName = 'END_DATE'
    end
    object qTreeOutPREV_FILIAL: TStringField
      DisplayLabel = #1055#1088#1077#1076'. '#1092#1080#1083#1080#1072#1083
      FieldName = 'PREV_FILIAL'
      Size = 40
    end
  end
  object qFilOAO: TOilQuery
    SQL.Strings = (
      '--> qFilOAO,TestDb'
      'select decode(v.tip,'
      '              '#39'P'#39','
      '              '#39#1055#1088#1080#1093#1086#1076' '#1079#1072' '#1087#1088#1080#1093#1086#1076#1086#1084#39','
      '              decode(v.prev_tip,'
      '                     '#39'O'#39','
      '                     '#39#1054#1090#1087#1091#1089#1082' '#1079#1072' '#1086#1090#1087#1091#1089#1082#1086#1084#39','
      '                     '#39#1054#1090#1087#1091#1089#1082' '#1085#1077' '#1089' '#1090#1086#1075#1086' '#1092#1080#1083#1080#1072#1083#1072#39')) as tip,'
      '       v.ser,'
      '       v.num,'
      '       v.date_,'
      '       oo1.name as dep_name,'
      '       v.prev_date,'
      '       oo2.name as prev_dep_name'
      
        '  from v_oil_talon_opl_un v, oil_org oo1, oil_org oo2, v_dual_da' +
        'te ddate'
      ' where (v.tip = v.prev_tip or'
      
        '       v.tip = '#39'O'#39' and v.prev_tip = '#39'P'#39' and v.from_id <> v.prev_' +
        'to_id)'
      '   and decode(v.tip, '#39'P'#39', v.to_id, v.from_id) = oo1.id'
      '   and oo1.id = oo1.inst'
      
        '   and decode(v.prev_tip, '#39'P'#39', v.prev_to_id, v.prev_from_id) = o' +
        'o2.id'
      '   and oo2.id = oo2.inst'
      '   and v.date_ >= greatest(:BeginDate, to_date(ddate.value))'
      '   and user <> '#39'VICTORY'#39)
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 378
    Top = 435
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end>
    object qFilOAOTIP: TStringField
      DisplayLabel = #1058#1080#1087' '#1086#1096#1080#1073#1082#1080
      FieldName = 'TIP'
      Size = 30
    end
    object qFilOAOSER: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      FieldName = 'SER'
      Size = 3
    end
    object qFilOAONUM: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM'
    end
    object qFilOAODATE_: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATE_'
    end
    object qFilOAODEP_NAME: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'DEP_NAME'
      Size = 100
    end
    object qFilOAOPREV_DATE: TDateTimeField
      DisplayLabel = #1055#1088#1077#1076'. '#1076#1072#1090#1072
      FieldName = 'PREV_DATE'
    end
    object qFilOAOPREV_DEP_NAME: TStringField
      DisplayLabel = #1055#1088#1077#1076'. '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'PREV_DEP_NAME'
      Size = 100
    end
  end
  object dsTalon: TOraDataSource
    DataSet = qFilOAO
    Left = 378
    Top = 30
  end
  object QAzs_Nb: TOilQuery
    SQL.Strings = (
      '--> qAzs_Nb,TestDB'
      'select A.dog,'
      '       A.date_ as RASH_DATE,'
      '       trunc(drep.rep_date) as SM_DATE,'
      '       A.PPON_NAME,'
      '       org_dr.name as AZS_TO,'
      '       org_to.name as AZS_FROM,'
      '       drep.smena_num as SMENA,'
      '       A.count_,'
      '       A.pr_count,'
      '       A.rash_double_in_srep'
      '  from (select /*+ORDERED USE_HASH(r,p,oo,dr,rr)*/'
      '         r.date_,'
      '         p.dog,'
      '         r.count_,'
      '         dr.pr_count,'
      '         dr.rep_id,'
      '         dr.rep_inst,'
      '         r.to_inst,'
      '         r.to_id,'
      '         oo.name as PPON_NAME,'
      
        '         decode(sign(rr.id - r.id), null, '#39'N'#39', 0, '#39'N'#39', '#39'Y'#39') as r' +
        'ash_double_in_srep'
      '          from oil_rashod r,'
      '               oil_part p,'
      '               v_org oo,'
      '               (select *'
      '                  from oil_dr_data'
      '                 where state = '#39'Y'#39
      '                   and oper_type = 0) dr,'
      '               (select r.*'
      '                  from oil_rashod r, oil_dr_data dr'
      '                 where r.state = '#39'Y'#39
      '                   and dr.state = '#39'Y'#39
      '                   and dr.oper_type = 0'
      '                   and r.id = dr.ttn_id'
      '                   and r.id = dr.ttn_id) rr'
      '         where r.state = '#39'Y'#39
      '           and p.state = '#39'Y'#39
      '           and r.id = dr.ttn_id(+)'
      '           and r.inst = dr.ttn_inst(+)'
      '              '
      '           and r.oper_id in (7, 10)'
      '              '
      '           and r.date_ >= :BeginDate'
      '              '
      '           and r.part_id = p.id'
      '           and r.part_inst = p.inst'
      '              '
      '           and oo.id = r.from_id'
      '           and oo.inst = r.from_inst'
      '              '
      '           and rr.inst(+) = r.inst'
      '           and rr.date_(+) between r.date_ - 5 and r.date_ + 5'
      '           and rr.from_id(+) = r.from_id'
      '           and rr.from_inst(+) = r.from_inst'
      '           and rr.to_id(+) = r.to_id'
      '           and rr.to_inst(+) = r.to_inst'
      '           and rr.oper_id(+) = r.oper_id'
      '           and rr.litr(+) = r.litr'
      '           and rr.ud_weig(+) = r.ud_weig'
      '           and rr.count_(+) = r.count_'
      '           and rr.part_id(+) = r.part_id'
      '           and rr.part_inst(+) = r.part_inst) A,'
      '       oil_daily_rep drep,'
      '       v_org org_dr,'
      '       v_org org_to'
      ' where (A.count_ <> A.pr_count or A.pr_count is null or'
      '       drep.azs_id <> A.to_id and drep.azs_inst <> A.to_inst)'
      '   and drep.id(+) = A.rep_id'
      '   and drep.inst(+) = A.rep_inst'
      '   and drep.azs_id = org_dr.id(+)'
      '   and drep.azs_inst = org_dr.inst(+)'
      '   and A.to_id = org_to.id(+)'
      '   and A.to_inst = org_to.inst(+)'
      ' order by date_')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 48
    Top = 192
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
  end
  object DSAzs_NB: TOraDataSource
    DataSet = QAzs_Nb
    Left = 64
    Top = 176
  end
  object QNalAbsent: TOilQuery
    SQL.Strings = (
      '--> qNalAbsent,TestDB'
      'select count(*) co, numb'
      '  from (select num numb'
      '          from oil_sale_book'
      '         where state = '#39'Y'#39
      '           and inst = :inst'
      '           and num is not null'
      '           and s_date between :DateBegin and :DateEnd'
      '        union'
      '        select nakl_num numb'
      '          from oil_azs_sbook'
      '         where state = '#39'Y'#39
      '           and inst = :inst'
      '           and nakl_num is not null'
      '           and s_date between :DateBegin and :DateEnd)'
      ' group by numb'
      ' order by to_number(numb)'
      ' '
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 187
    Top = 89
    ParamData = <
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
        ParamType = ptInput
      end>
    object QNalAbsentCO: TFloatField
      FieldName = 'CO'
    end
    object QNalAbsentNUMB: TStringField
      FieldName = 'NUMB'
      Size = 8
    end
  end
  object QTTNAbsent: TOilQuery
    SQL.Strings = (
      '--> qTTNAbsent,TestDb'
      'select count(*) co, ttn_num from oil_rashod'
      'where ttn_num is not null'
      'and state = '#39'Y'#39
      'and inst = :inst'
      'and date_ >= :DateBegin'
      'and date_ <= :DateEnd'
      'group by ttn_num'
      'order by ttn_num')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 259
    Top = 89
    ParamData = <
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
        ParamType = ptInput
      end>
  end
  object QNalDouble: TOilQuery
    SQL.Strings = (
      '--> qNalDouble,TestDB'
      'select count(*) co, numb'
      '  from (select num numb'
      '          from oil_sale_book'
      '         where state = '#39'Y'#39
      '           and inst = :inst'
      '           and num is not null'
      '           and s_date between :DateBegin and :DateEnd'
      '         union all'
      '        select nakl_num numb'
      '          from oil_azs_sbook'
      '         where state = '#39'Y'#39
      '           and inst = :inst'
      '           and nakl_num is not null'
      '           and s_date between :DateBegin and :DateEnd)'
      ' group by numb'
      'having count(*) <> 1'
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 188
    Top = 139
    ParamData = <
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
        ParamType = ptInput
      end>
    object QNalDoubleCO: TFloatField
      FieldName = 'CO'
    end
    object QNalDoubleNUMB: TStringField
      FieldName = 'NUMB'
      Size = 8
    end
  end
  object QTTNDouble: TOilQuery
    SQL.Strings = (
      '--> qTTNDouble,TestDB'
      'select count(*) co, ttn_num as numb'
      'from oil_rashod'
      'where ttn_num is not null'
      'and state = '#39'Y'#39' '
      'and inst = :inst'
      'and date_ >= :DateBegin'
      'and date_ <= :DateEnd'
      'group by ttn_num'
      'having count(*) <> 1')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 260
    Top = 139
    ParamData = <
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
        ParamType = ptInput
      end>
    object QTTNDoubleCO: TFloatField
      FieldName = 'CO'
    end
    object QTTNDoubleNUMB: TStringField
      FieldName = 'NUMB'
    end
  end
  object qBadMove: TOilQuery
    SQL.Strings = (
      '--> qBadMove,TestDb'
      'select substr(oo.name, 1, 40) as prih_org,'
      '       v.prev_date as prih_date,'
      '       v.ser,'
      '       v.num,'
      '       substr(oo1.name, 1, 40) as out_org,'
      '       v.date_ as Out_Date'
      
        '  from v_oil_talon_opl v, oil_org oo, oil_org oo1, v_main_org mo' +
        'rg'
      ' where v.tip = '#39'O'#39
      '   and v.prev_tip = '#39'P'#39
      '   and v.from_id <> v.prev_to_id'
      '   and v.prev_to_id = oo.id'
      '   and v.prev_to_inst = oo.inst'
      '   and v.from_id = oo1.id'
      '   and v.from_inst = oo1.inst'
      '   and v.prev_date >= :BeginDate'
      '   and v.date_ >= :CutDate'
      '   and not(v.prev_to_id = 4000 and v.prev_oper_id = 183)')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 378
    Top = 165
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'CutDate'
        ParamType = ptInput
      end>
    object qBadMovePRIH_ORG: TStringField
      DisplayLabel = #1060#1080#1083#1072#1083' '#1085#1072' '#1082#1086#1090#1086#1088#1099#1081' '#1087#1088#1080#1096#1077#1083' '#1090#1072#1083#1086#1085
      DisplayWidth = 40
      FieldName = 'PRIH_ORG'
      Size = 40
    end
    object qBadMovePRIH_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1080#1093#1086#1076#1072
      FieldName = 'PRIH_DATE'
    end
    object qBadMoveSER: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      FieldName = 'SER'
      Size = 3
    end
    object qBadMoveNUM: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM'
    end
    object qBadMoveOUT_ORG: TStringField
      DisplayLabel = #1060#1080#1083#1072#1083' '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1089#1076#1077#1083#1072#1085' '#1086#1090#1087#1091#1089#1082
      DisplayWidth = 40
      FieldName = 'OUT_ORG'
      Size = 40
    end
    object qBadMoveOUT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1087#1091#1089#1082#1072
      FieldName = 'OUT_DATE'
    end
  end
  object QAuto: TOilQuery
    SQL.Strings = (
      '--> qAuto,TestDB'
      
        'select /*+ORDERED USE_MERGE(A) USE_HASH(p,oofrom)*/A.date_,to_nu' +
        'mber(null) as smena_num,OOFrom.name as from_name,P.dog'
      'from '
      ''
      '     ('
      '      select'
      '          a.id as avto,'
      '          r.*'
      '      from'
      '          oil_rashod r,'
      '          oil_auto a,'
      '          oil_rash_det d'
      '      where '
      '            r.oper_id = 40 '
      '            and d.rash_id = r.id'
      '            and d.rash_inst = r.inst    '
      '            and d.auto_id = a.id(+)'
      '            and d.auto_inst = a.inst(+)'
      '      ) A,'
      '      oil_part P,'
      '      v_org OOFrom'
      ''
      'where A.avto is null'
      '      and A.part_id=P.id and A.part_inst=P.inst'
      '      and A.from_id=OOFrom.id and A.from_inst=OOFrom.inst'
      '      and A.date_>'#39'01.10.2000'#39
      ''
      'UNION ALL'
      ''
      
        'select /*+ORDERED USE_MERGE(A) USE_HASH(dr,drep,r,p,OOAzs,OODep)' +
        '*/'
      '    trunc(drep.rep_date) as rep_date,'
      '    drep.smena_num,'
      '    OOAzs.name||'#39' '#39'||OODep.name as from_name,'
      '    P.dog'
      'from'
      ''
      '(select a.id as avto,sro.*'
      'from oil_srother sro,oil_auto a'
      
        'where sro.oper_id=40 and sro.auto_id=a.id(+) and sro.auto_inst=a' +
        '.inst(+) and sro.state='#39'Y'#39') A,'
      
        'oil_dr_data dr,oil_daily_rep drep,oil_rashod r,oil_part p,oil_or' +
        'g OOAzs,v_org OODep'
      ''
      'where A.avto is null'
      '      and A.srep_id=dr.id and A.srep_inst=dr.inst'
      '      and dr.rep_id=drep.id and dr.rep_inst=drep.inst'
      '      and dr.ttn_id=r.id and dr.ttn_inst=dr.inst'
      '      and r.part_id=p.id and r.part_inst=p.inst'
      '      and drep.azs_id=OOAzs.id and drep.azs_inst=OOAzs.inst'
      '      and OOAzs.par=OODep.id and OOAzs.par_inst=OODep.inst'
      '      and trunc(drep.rep_date)>='#39'01.10.2000'#39
      ''
      'order by date_,from_name'
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 88
    Top = 400
    object QAutoDATE_: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DATE_'
    end
    object QAutoSMENA_NUM: TFloatField
      DisplayLabel = #8470' '#1089#1084#1077#1085#1099
      DisplayWidth = 8
      FieldName = 'SMENA_NUM'
    end
    object QAutoDOG: TStringField
      DisplayLabel = #1055#1072#1088#1090#1080#1103
      FieldName = 'DOG'
      Size = 15
    end
    object QAutoFROM_NAME: TStringField
      DisplayLabel = #1054#1090' '#1082#1086#1075#1086
      DisplayWidth = 100
      FieldName = 'FROM_NAME'
      Size = 201
    end
  end
  object dsAuto: TOraDataSource
    DataSet = QAuto
    Left = 32
    Top = 400
  end
  object qCardSR: TOilQuery
    SQL.Strings = (
      '--> qCardSR,TestDB'
      ' select Title,'
      '        Filial_Name,'
      '        AZS_Name,'
      '        Rep_Date as Rep_Date_,'
      '        NP_Name,'
      '        abs(Litr) as Litr'
      '   from v_Check_Card_SR'
      '   where rep_date>=:BeginDate'
      '  order by Rep_Date,'
      '           Filial_Name,'
      '           AZS_Name,'
      '           NP_Name')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 440
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end>
    object qCardSRTITLE: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 12
      FieldName = 'TITLE'
      Origin = 'V_CHECK_CARD_SR.TITLE'
      Size = 30
    end
    object qCardSRFILIAL_NAME: TStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      DisplayWidth = 22
      FieldName = 'FILIAL_NAME'
      Origin = 'V_CHECK_CARD_SR.FILIAL_NAME'
      Size = 100
    end
    object qCardSRAZS_NAME: TStringField
      DisplayLabel = #1040#1047#1057
      DisplayWidth = 15
      FieldName = 'AZS_NAME'
      Origin = 'V_CHECK_CARD_SR.AZS_NAME'
      Size = 100
    end
    object qCardSRNP_NAME: TStringField
      DisplayLabel = #1053#1055
      DisplayWidth = 5
      FieldName = 'NP_NAME'
      Origin = 'V_CHECK_CARD_SR.NP_NAME'
      Size = 50
    end
    object qCardSRLITR: TFloatField
      DisplayLabel = #1051#1080#1090#1088#1099
      FieldName = 'LITR'
      Origin = 'V_CHECK_CARD_SR.LITR'
    end
    object qCardSRREP_DATE_: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1084'. '#1086#1090#1095#1077#1090#1072
      FieldName = 'REP_DATE_'
    end
  end
  object qTalonChDiag: TOilQuery
    SQL.Strings = (
      '--> qTalonChDiag,TestDB'
      'select Ser,'
      '       Num,'
      '       Trunc(Min_Date, '#39'DD'#39') as Min_Date,'
      '       Trunc(Max_Date, '#39'DD'#39') as Max_Date'
      '  from (select Ser, Num, Max_Date, max(Min_Date) as Min_Date'
      '          from (select TalMin.Ser,'
      '                       TalMin.Num,'
      '                       TalMin.Min_Date,'
      '                       min(TalMax.Max_Date) as Max_Date'
      '                  from (select Ser,'
      '                               Num,'
      
        '                               decode(Tip, '#39'P'#39', Date_ + 1 / 8640' +
        '0, Date_) as Min_Date'
      '                          from V_Oil_Talon_Op'
      
        '                         where (Ser = :Ser or :Ser is null)) Tal' +
        'Min,'
      '                       (select Ser,'
      '                               Num,'
      
        '                               decode(Tip, '#39'P'#39', Date_ + 1 / 8640' +
        '0, Date_) as Max_Date'
      '                          from V_Oil_Talon_Op'
      
        '                         where (Ser = :Ser or :Ser is null)) Tal' +
        'Max'
      '                 where TalMin.Ser = TalMax.Ser'
      '                   and TalMin.Num = TalMax.Num'
      '                   and TalMin.Min_Date < TalMax.Max_Date'
      
        '                 group by TalMin.Ser, TalMin.Num, TalMin.Min_Dat' +
        'e)'
      '         group by Ser, Num, Max_Date)'
      
        ' where Min_Date - Trunc(Min_Date, '#39'DD'#39') = Max_Date - Trunc(Max_D' +
        'ate, '#39'DD'#39')'
      ' order by Ser, Max_Date desc, Min_Date desc')
    FetchAll = True
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 695
    Top = 266
    ParamData = <
      item
        DataType = ftString
        Name = 'Ser'
      end>
  end
  object qTalonHistory: TOilQuery
    SQL.Strings = (
      '--> qTalonHistory,TestDB'
      'select decode(Tip, '#39'P'#39', '#39#1055#39', '#39#1054#39') as Title,'
      '       Date_ as Oper_Date,'
      '       decode(Tip, '#39'P'#39', Date_ + 1 / 86400, Date_) as Real_Date'
      '  from V_Oil_Talon_Op'
      ' where Ser = :Ser'
      '   and Num = :Num'
      ' order by Real_Date desc')
    FetchAll = True
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 625
    Top = 266
    ParamData = <
      item
        DataType = ftString
        Name = 'Ser'
      end
      item
        DataType = ftInteger
        Name = 'Num'
      end>
  end
  object dsCard: TOraDataSource
    DataSet = qCardAuto
    Left = 438
    Top = 30
  end
  object qCardClient: TOilQuery
    SQL.Strings = (
      '--> qCardClient,TestDB'
      
        'select t.to_id, t.to_inst, t.oper_date, t.card_number, np.name a' +
        's np_type'
      '  from v_card_transaction t, oil_np_group np'
      ' where not exists (select id, inst'
      '          from oil_org'
      '         where state = '#39'Y'#39
      '           and id = t.to_id'
      '           and inst = t.to_inst)'
      '   and t.np_type = np.petrol_id(+)'
      '   and t.oper_num > 2'
      '   and user <> '#39'OIL_OLD'#39
      
        '   and not (user = '#39'ANDRIY'#39' and t.date_ > (select date_to from c' +
        'ard_id_history where ov.GetVal('#39'INST'#39') in (dep_id,obl_id)) )'
      
        ' order by t.to_id, t.to_inst, t.oper_date, t.card_number, np.nam' +
        'e')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 438
    Top = 331
    object qCardClientTO_ID: TFloatField
      DisplayLabel = 'ID '#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      FieldName = 'TO_ID'
    end
    object qCardClientTO_INST: TFloatField
      DisplayLabel = 'Inst '#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      FieldName = 'TO_INST'
    end
    object qCardClientOPER_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'OPER_DATE'
    end
    object qCardClientCARD_NUMBER: TFloatField
      DisplayLabel = #1050#1072#1088#1090#1072
      FieldName = 'CARD_NUMBER'
    end
    object qCardClientNP_TYPE: TStringField
      DisplayLabel = #1053#1055
      FieldName = 'NP_TYPE'
      Size = 50
    end
  end
  object qCardTerm: TOilQuery
    SQL.Strings = (
      '--> qCardTerm,TestDB'
      'select '
      '  azs_id,'
      '  oper_num,'
      '  oper_date,'
      '  card_number,'
      '  np_type,'
      '  litr'
      'from '
      '('
      'select'
      '  tr.azs_id,'
      '  org.name as azs_name,'
      '  oper_num,'
      '  oper_date,'
      '  card_number,'
      '  np_type,'
      '  litr'
      'from'
      '  ('
      '  select'
      
        '    to_number(decode(nvl('#1085#1086#1084#1077#1088'_'#1090#1077#1088#1084#1080#1085#1072#1083#1072',0),0, '#1085#1086#1084#1077#1088'_'#1090#1077#1088#1084#1080#1085#1072#1083#1072', ' +
        #1085#1086#1084#1077#1088'_'#1090#1077#1088#1084#1080#1085#1072#1083#1072' + 1000000)) as azs_id,'
      '    oper_date,'
      '    oper_num,'
      '    card_number,'
      '    np_type,'
      '    litr'
      '  from v_card_transaction'
      '  where date_ >= :BeginDate'
      '  union all'
      '  select'
      '    azs_id,'
      '    oper_date,'
      '    9,'
      '    card_number,'
      '    np_type,'
      '    litr'
      '  from card_transit'
      '  where trunc(oper_date) >= :BeginDate'
      '  ) tr,'
      '  v_org org'
      'where'
      'tr.oper_num in (7,9,12)'
      'and tr.azs_id = org.id (+)'
      'and org.id (+)= org.inst (+) and org.state (+)='#39'Y'#39
      'and org.org_type (+) =8'
      ') '
      'where azs_name is null'
      ' '
      ' '
      ' ')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 438
    Top = 375
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end>
    object qCardTermAZS_ID: TFloatField
      DisplayLabel = #1040#1047#1057' ID'
      FieldName = 'AZS_ID'
    end
    object qCardTermOPER_NUM: TFloatField
      DisplayLabel = #1058#1080#1087' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080
      FieldName = 'OPER_NUM'
    end
    object qCardTermOPER_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080
      FieldName = 'OPER_DATE'
    end
    object qCardTermCARD_NUMBER: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1099
      FieldName = 'CARD_NUMBER'
    end
    object qCardTermNP_TYPE: TFloatField
      DisplayLabel = #1058#1080#1087' '#1053#1055
      FieldName = 'NP_TYPE'
    end
    object qCardTermLITR: TFloatField
      DisplayLabel = #1050'-'#1074#1086', '#1083
      FieldName = 'LITR'
    end
  end
  object qCardOver: TOilQuery
    SQL.Strings = (
      '--> qCardOver,TestDB'
      ' select Card_Number,'
      '        Oper_Date,'
      '        Litr'
      '   from v_Card_Equal'
      '  where (Oper_Date < R_Oper_Date or R_Oper_Date is null )'
      '             and Oper_Date>=:BeginDate'
      '             and subq_id=1'
      '  order by Oper_Date, Card_Number'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 440
    Top = 112
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
    object qCardOverCARD_NUMBER: TFloatField
      DisplayLabel = #8470' '#1101#1083'. '#1082#1072#1088#1090#1099
      DisplayWidth = 12
      FieldName = 'CARD_NUMBER'
      Origin = 'V_CARD_EQUAL.CARD_NUMBER'
    end
    object qCardOverOPER_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 16
      FieldName = 'OPER_DATE'
      Origin = 'V_CARD_EQUAL.OPER_DATE'
    end
    object qCardOverLITR: TFloatField
      DisplayLabel = #1051#1080#1090#1088#1099
      FieldName = 'LITR'
      Origin = 'V_CARD_EQUAL.LITR'
    end
  end
  object qCardDouble: TOilQuery
    SQL.Strings = (
      '--> qCardDouble,TestDB'
      '  select'
      '    c.cause_name as Title,'
      '    count(*) as Quantity,'
      '    t.card_number,'
      '    t.Oper_date,'
      '    t.Oper_date as Oper_date_'
      '  from'
      '    ('
      '    select'
      '      card_number,'
      '      oper_date,'
      '      count_litr,'
      '      np_type,'
      '      oper_num'
      '    from v_card_transaction'
      '    union all'
      '    select'
      '      card_number,'
      '      oper_date,'
      '      litr,'
      '      np_type,'
      '      9'
      '    from card_transit'
      '    ) t,'
      '    card_cause c'
      '  where '
      '      trunc(t.Oper_Date) >= :BeginDate'
      '  and t.oper_num > 2'
      '  and t.oper_num = c.id (+)'
      '  group by '
      '    t.oper_date,'
      '    t.card_number, '
      '    t.np_type,'
      '    t.count_litr, '
      '    t.oper_num,'
      '    c.cause_name'
      '  having count(*) > 1'
      ' ')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 441
    Top = 157
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
    object qCardDoubleTITLE: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 15
      FieldName = 'TITLE'
      Size = 10
    end
    object qCardDoubleQUANTITY: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      DisplayWidth = 12
      FieldName = 'QUANTITY'
    end
    object qCardDoubleCARD_NUMBER: TFloatField
      DisplayLabel = #1050#1072#1088#1090#1072
      DisplayWidth = 12
      FieldName = 'CARD_NUMBER'
    end
    object qCardDoubleOPER_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'OPER_DATE'
      Visible = False
    end
    object qCardDoubleOPER_DATE_: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'OPER_DATE_'
    end
  end
  object qPetrol: TOilQuery
    SQL.Strings = (
      '--> qPetrol,TestDB'
      ' select count(*) as Quantity'
      '   from sys.all_objects'
      '  where owner = '#39'DEMO'#39
      '    and object_name = '#39#1058#1056#1040#1053#1047#1040#1050#1062#1048#1048#39)
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 155
    Top = 345
  end
  object qCardAuto: TOilQuery
    SQL.Strings = (
      '--> qCardAuto,TestDB'
      
        '-- '#1055#1088#1086#1074#1077#1088#1103#1077#1090' '#1079#1072#1085#1077#1089#1077#1085#1099' '#1083#1080' '#1040#1074#1090#1086' '#1080' '#1042#1086#1076#1080#1090#1077#1083#1100' '#1077#1089#1083#1080' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1077' '#1054#1073#1083#1091' '#1080#1083 +
        #1080' '#1060#1080#1083#1080#1072#1083#1091
      'select /*+ORDERED USE_NL(Oil_Org)*/'
      ' Oil_Org.Name as Filial,'
      ' v_Card_Receipts.Card_Number,'
      ' v_Card_Receipts.Oper_Date'
      '  from v_Card_Receipts, v_org Oil_Org'
      ' where v_Card_Receipts.To_Id = Oil_Org.Id'
      '   and v_Card_Receipts.CardAlign = 0'
      '   and v_Card_Receipts.To_Inst = Oil_Org.Inst'
      '   and v_Card_Receipts.Auto_Id is null'
      '   and Oil_Org.Org_Type in (3, 4)'
      '   and Oper_Date >= :BeginDate'
      '   and ov.getval('#39'GENERATION'#39') <> 2'
      ' order by Oper_Date')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 438
    Top = 200
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
    object qCardAutoFILIAL: TStringField
      DisplayLabel = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      DisplayWidth = 40
      FieldName = 'FILIAL'
      Size = 100
    end
    object qCardAutoCARD_NUMBER: TFloatField
      DisplayLabel = #8470' '#1101#1083'. '#1082#1072#1088#1090#1099
      FieldName = 'CARD_NUMBER'
    end
    object qCardAutoOPER_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'OPER_DATE'
    end
  end
  object qCardRest: TOilQuery
    SQL.Strings = (
      '--> qCardRest,TestDB'
      '-- '#1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1085#1072' '#1069#1050' '#1074' Petrol '#1080' Oil'
      ' select /*+ORDERED USE_HASH(Petrol, Oil) USE_NL(Oil_NP_Group)*/'
      '        Petrol.Card_Number,'
      '        Oil_NP_Group.Name as NP_Type,'
      '        Petrol.Rest as Petrol_Rest,'
      '        Oil.Rest as Oil_Rest'
      '   from (--'#1042#1099#1073#1086#1088#1082#1072' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1080#1079' Petrol'
      '          select card.gr_nomer as Card_Number,'
      '                kosh.id_koshelka as NP_Type,'
      '                sum(nvl(kosh.razmer_koshelka, 0)) as Rest'
      '           from magicash5.ecfil015 kosh, magicash5.ecfil012 card'
      '          where kosh.id_karty = card.id_karty (+)'
      '          group by card.gr_nomer, kosh.id_koshelka'
      '        ) Petrol,'
      '        (--'#1042#1099#1073#1086#1088#1082#1072' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1080#1079' Oil'
      '         select Card_Number,'
      '                NP_Type,'
      '                sum(Litr) as Rest,'
      '                min(tr_type) as tr_type'
      '           from (--'#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081
      '                 select Card_Number,'
      '                        NP_Type,'
      '                        Litr,'
      '                        tr_type'
      '                   from v_Card_Receipts'
      '                  union all'
      '                 --'#1042#1099#1073#1086#1088#1082#1072' '#1089#1087#1080#1089#1072#1085#1080#1081
      '                 select Card_Number,'
      '                        NP_Type,'
      '                        -Litr,'
      '                        to_number(null)'
      '                   from v_Card_Expense)'
      '          group by Card_Number, NP_Type) Oil, Oil_NP_Group'
      '  where Petrol.Card_Number = Oil.Card_Number (+)'
      '    and Petrol.NP_Type = Oil.NP_Type (+)'
      '    and Petrol.NP_Type = Oil_NP_Group.Petrol_Id'
      '    and (Petrol.rest <> Oil.rest or Oil.rest<0)'
      '    and oil.tr_type <> 3')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 438
    Top = 243
    object qCardRestCARD_NUMBER: TFloatField
      DisplayLabel = #8470' '#1101#1083'. '#1082#1072#1088#1090#1099
      FieldName = 'CARD_NUMBER'
    end
    object qCardRestNP_TYPE: TStringField
      DisplayLabel = #1053#1055
      DisplayWidth = 6
      FieldName = 'NP_TYPE'
      Size = 50
    end
    object qCardRestPETROL_REST: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1087#1086' Petrol'
      DisplayWidth = 15
      FieldName = 'PETROL_REST'
    end
    object qCardRestOIL_REST: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1087#1086' Oil'
      DisplayWidth = 15
      FieldName = 'OIL_REST'
    end
  end
  object qCardId: TOilQuery
    SQL.Strings = (
      '--> qCardId,TestDB'
      'select /*+USE_HASH(i)*/'
      ' i.Title,'
      ' i.id,'
      ' i.Card_Number,'
      ' i.Oper_date,'
      ' to_char('#39' '#39') as np_name,'
      ' to_number(null) as Litr'
      '  from (select '#39#1053#1077#1090' '#1074' OIL, '#1077#1089#1090#1100' '#1074' '#1055#1077#1090#1088#1086#1083#39' as Title,'
      '               DECODE(nvl(oldID, 0), 0, TRN_GUID, oldID) as id,'
      '               gr_nomer as card_number,'
      '               data as oper_date'
      '          from magicash5.ecfil139'
      '         where get_card_oper_num(gr_nomer,'
      '                                 nomer_terminala,'
      '                                 id_prichiny,'
      '                                 operatziya,'
      '                                 nomer_schemy,'
      '                                 trn_guid) > 2'
      '        minus'
      '        select '#39#1053#1077#1090' '#1074' OIL, '#1077#1089#1090#1100' '#1074' '#1055#1077#1090#1088#1086#1083#39' as Title,'
      '               DECODE(nvl(ID, 0), 0, TRN_GUID, ID) as id,'
      '               gr_card_num as card_number,'
      '               real_date as Oper_Date'
      '          from v_card_transaction'
      '         where oper_num > 2'
      '        union all'
      '        select '#39#1053#1077#1090' '#1074' '#1055#1077#1090#1088#1086#1083', '#1077#1089#1090#1100' '#1074' OIL'#39' as Title,'
      '               DECODE(nvl(ID, 0), 0, TRN_GUID, ID) as id,'
      '               gr_card_num as card_number,'
      '               real_date as Oper_Date'
      '          from v_card_transaction'
      '         where oper_num > 2'
      '        minus'
      '        select '#39#1053#1077#1090' '#1074' '#1055#1077#1090#1088#1086#1083', '#1077#1089#1090#1100' '#1074' OIL'#39' as Title,'
      '               DECODE(nvl(oldID, 0), 0, TRN_GUID, oldID) as id,'
      '               gr_nomer as card_number,'
      '               data as oper_date'
      '          from magicash5.ecfil139'
      '         where get_card_oper_num(gr_nomer,'
      '                                 nomer_terminala,'
      '                                 id_prichiny,'
      '                                 operatziya,'
      '                                 nomer_schemy,'
      '                                 trn_guid) > 2) i'
      ' where nvl(i.card_number, 0) <> 0'
      '   and i.oper_date >= :BeginDate'
      ' order by oper_date desc')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 438
    Top = 287
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
    object qCardIdTITLE: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'TITLE'
      FixedChar = True
      Size = 27
    end
    object qCardIdID: TStringField
      FieldName = 'ID'
      Size = 40
    end
    object qCardIdCARD_NUMBER: TFloatField
      DisplayLabel = #1050#1072#1088#1090#1072
      FieldName = 'CARD_NUMBER'
    end
    object qCardIdOPER_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'OPER_DATE'
    end
    object qCardIdNP_NAME: TStringField
      DisplayLabel = #1053#1055
      FieldName = 'NP_NAME'
      Size = 1
    end
    object qCardIdLITR: TFloatField
      DisplayLabel = #1050'-'#1074#1086', '#1083
      FieldName = 'LITR'
    end
  end
  object QWayBill: TOilQuery
    SQL.Strings = (
      '--> qWayBill,TestDB'
      'SELECT /*+ORDERED USE_HASH(tank,auto,org)*/'
      
        '    distinct org.name /* '#1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080', '#1082' '#1082#1086#1090#1086#1088#1086#1081' '#1087#1088#1080#1085#1072#1076#1083 +
        #1077#1078#1080#1090' '#1072#1074#1090#1086' */'
      '    ,auto.numb /* '#1053#1086#1084#1077#1088' '#1072#1074#1090#1086' */'
      '    ,auto.auto_model /* '#1084#1086#1076#1077#1083#1100' '#1072#1074#1090#1086' */'
      
        '    ,tank.waybillnumb /* '#1085#1086#1084#1077#1088' '#1087#1091#1090#1077#1074#1086#1075#1086' '#1083#1080#1089#1090#1072', '#1082#1086#1090#1086#1088#1099#1081' '#1084#1080#1085#1091#1089#1091#1077#1090' ' +
        #1073#1072#1082' */'
      
        '    ,trunc(tank.date_) as waybilldate /* '#1076#1072#1090#1072' '#1087#1091#1090#1077#1074#1086#1075#1086' '#1083#1080#1089#1090#1072', '#1082#1086 +
        #1090#1086#1088#1099#1081' '#1084#1080#1085#1091#1089#1091#1077#1090' '#1073#1072#1082' */'
      'FROM'
      '    v_own_tank tank,'
      '    oil_auto auto,'
      '    v_org org'
      'WHERE'
      '    trunc(tank.rep_date) > trunc(tank.date_)'
      'AND tank.auto_inst = org.id'
      'AND tank.auto_inst = org.inst    '
      'AND tank.auto_id = auto.id    '
      'AND tank.auto_inst = auto.inst'
      'AND trunc(tank.date_) between :date1 and :date2'
      'AND (tank.auto_inst = :p_org OR :p_org = -1)')
    FetchAll = True
    AfterClose = QWayBillAfterClose
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 152
    Top = 400
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_org'
        ParamType = ptInput
        Value = 255
      end
      item
        DataType = ftInteger
        Name = 'p_org'
        ParamType = ptInput
        Value = 255
      end>
    object QWayBillNAME: TStringField
      DisplayLabel = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      DisplayWidth = 20
      FieldName = 'NAME'
      Size = 100
    end
    object QWayBillNUMB: TStringField
      DisplayLabel = #8470#1072#1074#1090#1086
      FieldName = 'NUMB'
      Size = 12
    end
    object QWayBillAUTO_MODEL: TStringField
      DisplayLabel = #1052#1086#1076#1077#1083#1100' '#1072#1074#1090#1086
      DisplayWidth = 15
      FieldName = 'AUTO_MODEL'
      Size = 50
    end
    object QWayBillWAYBILLNUMB: TStringField
      DisplayLabel = #8470' '#1087#1091#1090'.'#1083#1080#1089#1090#1072
      DisplayWidth = 10
      FieldName = 'WAYBILLNUMB'
      Size = 100
    end
    object QWayBillWAYBILLDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1091#1090'.'#1083#1080#1089#1090#1072
      DisplayWidth = 10
      FieldName = 'WAYBILLDATE'
    end
  end
  object qTalonText: TOilQuery
    SQL.Strings = (
      
        #1048#1085#1089#1090#1088#1091#1082#1094#1080#1103' '#1087#1086' '#1087#1088#1086#1074#1077#1088#1082#1077' '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1075#1086' '#1079#1072#1085#1077#1089#1077#1085#1080#1103' '#1090#1072#1083#1086#1085#1086#1074' '#1074' '#1073#1072#1079#1091' '#1076#1072#1085#1085 +
        #1099#1093' OIL v.2.0'
      ''
      
        #1053#1072' '#1089#1077#1075#1086#1076#1085#1103#1096#1085#1080#1081' '#1076#1077#1085#1100' '#1085#1077' '#1090#1088#1077#1073#1091#1077#1090#1089#1103' '#1079#1072#1087#1091#1089#1082#1072#1090#1100' '#1076#1072#1085#1085#1091#1102' '#1087#1088#1086#1074#1077#1088#1082#1091' '#1085#1072' '#1092#1080 +
        #1083#1080#1072#1083#1072#1093', '#1090#1072#1082' '#1082#1072#1082' '
      #1085#1077#1074#1086#1079#1084#1086#1078#1085#1086' '#1087#1086#1083#1085#1086#1089#1090#1100#1102' '#1086#1090#1089#1083#1077#1076#1080#1090#1100' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1090#1072#1083#1086#1085#1086#1074'.'
      ''
      '  '#1055#1088#1086#1074#1077#1088#1082#1072'  '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1075#1086' '#1079#1072#1085#1077#1089#1077#1085#1080#1103' '#1090#1072#1083#1086#1085#1086#1074' '#1089#1086#1089#1090#1086#1080#1090' '#1074' '#1089#1083#1077#1076#1091#1102#1097#1077#1084':'
      '1. '#1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1077#1088#1080#1081' '#1090#1072#1083#1086#1085#1086#1074'.'
      '2. '#1055#1088#1086#1074#1077#1088#1082#1072' '#1087#1086#1088#1103#1076#1082#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1086#1090#1087#1091#1089#1082#1072' '#1080' '#1087#1088#1080#1093#1086#1076#1072'.'
      '3. '#1055#1088#1086#1074#1077#1088#1082#1072' '#1090#1072#1083#1086#1085#1086#1074' '#1085#1072' '#1085#1072#1083#1080#1095#1080#1077' '#1074' '#1101#1084#1080#1089#1089#1080#1080'.'
      '4. '#1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1085#1086#1084#1080#1085#1072#1083#1086#1074' '#1086#1076#1085#1086#1075#1086' '#1080' '#1090#1086#1075#1086' '#1078#1077' '#1090#1072#1083#1086#1085#1072'.'
      '5. '#1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1072' '#1076#1091#1073#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1072#1083#1086#1085#1072' '#1074' '#1086#1090#1087#1091#1089#1082#1077' '#1080#1083#1080' '#1087#1088#1080#1093#1086#1076#1077'.'
      
        '6. '#1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' '#1090#1072#1083#1086#1085#1086#1074' '#1074' '#1089#1084#1077#1085#1085#1086#1084' '#1086#1090#1095#1077#1090#1077' - '#1087#1088#1080#1093#1086#1076#1091' '#1090#1072#1083#1086 +
        #1085#1086#1074
      ''
      #9'1. '#1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1077#1088#1080#1081' '#1090#1072#1083#1086#1085#1086#1074'.'
      
        #1055#1086#1083#1091#1095#1077#1085#1085#1099#1081' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1073#1091#1076#1077#1090' '#1074' '#1074#1080#1076#1077' '#1089#1077#1088#1080#1080' '#1080' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1090#1072#1083#1086#1085#1086#1074' '#1087#1086' ' +
        #1085#1077#1081'. '#1047#1072#1090#1077#1084' '#1087#1086' '#1087#1086#1080#1089#1082#1091' '#1074' '
      
        #1092#1086#1088#1084#1072#1093' '#1055#1088#1080#1093#1086#1076#1072' '#1080' '#1054#1090#1087#1091#1089#1082#1072' '#1090#1072#1083#1086#1085#1086#1074' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1085#1072#1081#1090#1080' '#1080' '#1086#1090#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074 +
        #1072#1090#1100' '#1085#1077#1087#1088#1072#1074#1080#1083#1100#1085#1086' '
      
        #1074#1074#1077#1076#1077#1085#1085#1099#1077' '#1089#1077#1088#1080#1080'. '#1053#1072#1087#1088#1080#1084#1077#1088', '#1085#1077#1087#1088#1072#1074#1080#1083#1100#1085#1072#1103' '#1089#1077#1088#1080#1103' '#1040#1040' '#1074#1074#1077#1076#1077#1085#1072' '#1074' '#1088#1091#1089#1089#1082 +
        #1086#1084' '#1088#1077#1075#1080#1089#1090#1088#1077' '#1074#1084#1077#1089#1090#1086' '
      #1087#1088#1072#1074#1080#1083#1100#1085#1086#1081' '#1089#1077#1088#1080#1080' AA '#1074' '#1083#1072#1090#1080#1085#1089#1082#1086#1084' ('#1072#1085#1075#1083#1080#1081#1089#1082#1086#1084') '#1088#1077#1075#1080#1089#1090#1088#1077'.'
      ''
      #9'2.'#1055#1088#1086#1074#1077#1088#1082#1072' '#1087#1086#1088#1103#1076#1082#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1086#1090#1087#1091#1089#1082#1072' '#1080' '#1087#1088#1080#1093#1086#1076#1072'.'
      
        '  '#1055#1088#1072#1074#1080#1083#1100#1085#1099#1081' '#1087#1086#1088#1103#1076#1086#1082' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1086#1090#1087#1091#1089#1082#1072' '#1080' '#1087#1088#1080#1093#1086#1076#1072' '#1080#1084#1077#1077#1090' '#1089#1090#1088#1086#1075#1091#1102 +
        ' '#1093#1088#1086#1085#1086#1083#1086#1075#1080#1102' '
      #1087#1088#1080#1093#1086#1076#1086#1074' '#1080' '
      
        #1086#1090#1087#1091#1089#1082#1086#1074' '#1090#1072#1083#1086#1085#1086#1074', '#1079#1072' '#1086#1076#1085#1080#1084' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1077#1084', '#1082#1086#1075#1076#1072' '#1076#1072#1090#1072' '#1086#1090#1087#1091#1089#1082#1072' '#1084#1086#1078#1077#1090 +
        ' '#1089#1086#1074#1087#1072#1076#1072#1090#1100' '#1089' '
      #1087#1086#1089#1083#1077#1076#1091#1102#1097#1080#1084' '#1087#1088#1080#1093#1086#1076#1086#1084'. '#1053#1072#1087#1088#1080#1084#1077#1088', '#1090#1072#1083#1086#1085' BB 0007608:'
      '                               . . . . . . . . . . . .'
      #9'5.'#9#1055#1088#1080#1093#1086#1076#9#9'24.09.00 '
      #9'4.'#9#1054#1090#1087#1091#1089#1082#9#9'12.09.00'
      #9'3.'#9#1055#1088#1080#1093#1086#1076#9#9'20.08.00 '
      #9'2.'#9#1054#1090#1087#1091#1089#1082#9#9'20.08.00'
      #9'1.'#9#1069#1084#1080#1089#1089#1080#1103#9#9'02.05.00'
      
        #1042' '#1101#1090#1086#1084' '#1087#1088#1080#1084#1077#1088#1077' '#1087#1088#1072#1074#1080#1083#1100#1085#1086' '#1089#1086#1073#1083#1102#1076#1077#1085#1072' '#1093#1088#1086#1085#1086#1083#1086#1075#1080#1103' '#1087#1088#1080#1093#1086#1076#1086#1074' '#1080' '#1088#1072#1089#1093#1086#1076#1086 +
        #1074'. '#1054#1090#1087#1091#1089#1082' '#1087#1086#1076' '
      #1085#1086#1084#1077#1088#1086#1084' 2 '
      
        #1080' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1088#1080#1093#1086#1076' '#1087#1086#1076' '#1085#1086#1084#1077#1088#1086#1084' 3 '#1086#1090' 20.09.00 '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1090' '#1087#1088#1072#1074#1080 +
        #1083#1072#1084' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '
      #1090#1072#1083#1086#1085#1086#1074'. '
      ''
      '  '#1055#1088#1080' '#1101#1090#1086#1084' '#1083#1102#1073#1072#1103' '#1087#1077#1088#1077#1076#1072#1095#1072'-'#1087#1088#1080#1077#1084' '#1090#1072#1083#1086#1085#1086#1074' '#1090#1072#1082#1080#1077', '#1082#1072#1082' '
      ' '#1072') '#1089' '#1054#1040#1054' '#1085#1072' '#1060#1080#1083#1080#1072#1083'; ('#1085#1072' '#1054#1040#1054' '#1086#1090#1087#1091#1089#1082', '#1085#1072' '#1060#1080#1083#1080#1072#1083#1077' '#1087#1088#1080#1093#1086#1076')'
      ' '#1073') '#1089' '#1060#1080#1083#1080#1072#1083#1072' '#1085#1072' '#1054#1040#1054'; ('#1085#1072' '#1060#1080#1083#1080#1072#1083#1077' '#1086#1090#1087#1091#1089#1082', '#1085#1072' '#1054#1040#1054' '#1087#1088#1080#1093#1086#1076')'
      
        ' '#1074') '#1089' '#1060#1080#1083#1080#1072#1083#1072' '#1085#1072' '#1076#1088#1091#1075#1086#1081' '#1060#1080#1083#1080#1072#1083'; ('#1085#1072' '#1060#1080#1083#1080#1072#1083#1077' '#1086#1090#1087#1091#1089#1082', '#1085#1072' '#1076#1088#1091#1075#1086#1084' '#1060#1080 +
        #1083#1080#1072#1083#1077' '#1087#1088#1080#1093#1086#1076') '#1076#1086#1083#1078#1085#1099' '
      
        #1090#1072#1082#1078#1077' '#1092#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100#1089#1103' '#1089' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' OIL '#1074' '#1092#1086#1088#1084#1072#1093' '#1055#1088#1080#1093#1086#1076#1072' '#1090#1072#1083#1086#1085#1086#1074' ('#1076#1083 +
        #1103' '#1087#1088#1080#1085#1080#1084#1072#1102#1097#1077#1081' '
      
        #1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080') '#1080' '#1054#1090#1087#1091#1089#1082#1072'  '#1090#1072#1083#1086#1085#1086#1074' ('#1076#1083#1103' '#1087#1077#1088#1077#1076#1072#1102#1097#1077#1081' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080') '#1089#1086#1086 +
        #1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086'. '
      ''
      
        '  '#1051#1102#1073#1086#1077' '#1085#1072#1088#1091#1096#1077#1085#1080#1077' '#1087#1086#1088#1103#1076#1082#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1086#1090#1087#1091#1089#1082#1072' '#1080' '#1087#1088#1080#1093#1086#1076#1072' '#1087#1088#1080#1074#1086#1076#1080#1090 +
        ' '#1082' '#1085#1077#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1080' '
      
        #1087#1086#1089#1090#1088#1086#1077#1085#1080#1103' '#1087#1088#1072#1074#1080#1083#1100#1085#1099#1093' '#1086#1090#1095#1077#1090#1086#1074' '#1082#1072#1082' '#1085#1072' '#1091#1088#1086#1074#1085#1077' '#1060#1080#1083#1080#1072#1083#1072' '#1090#1072#1082' '#1080' '#1054#1040#1054'. '#1055 +
        #1088#1080' '#1086#1073#1085#1072#1088#1091#1078#1077#1085#1080#1080' '
      
        #1085#1072#1088#1091#1096#1077#1085#1080#1081' '#1087#1086#1088#1103#1076#1082#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1086#1090#1087#1091#1089#1082#1072' '#1080' '#1087#1088#1080#1093#1086#1076#1072', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1087#1086' '#1087 +
        #1077#1088#1074#1080#1095#1085#1099#1084' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084' '
      
        #1074#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1093#1088#1086#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1091#1102' '#1087#1086#1089#1083#1077#1076#1086#1074#1072#1090#1077#1083#1100#1085#1086#1089#1090#1100'. '#1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' ' +
        #1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '
      #1074#1099#1087#1086#1083#1085#1103#1090#1100' '
      
        #1085#1072' '#1091#1088#1086#1074#1085#1077' '#1092#1080#1083#1080#1072#1083#1072' '#1089' '#1087#1086#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1077#1088#1077#1076#1072#1095#1077#1081' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1085#1086#1081' '#1080#1085#1092#1086#1088#1084#1072#1094#1080 +
        #1080' '#1074' '#1054#1040#1054'.'
      ''
      
        #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1086#1089#1090#1086#1080#1090' '#1080#1079' '#1076#1074#1091#1093' '#1095#1072#1089#1090#1077#1081' - '#1087#1086#1080#1089#1082' '#1087#1088#1080#1093#1086#1076#1086#1074', '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1077#1089#1090 +
        #1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1088#1080#1093#1086#1076' '
      '('#1085#1086' '#1085#1077#1090' '
      
        #1086#1090#1087#1091#1089#1082#1072') '#1080' '#1087#1086#1080#1089#1082' '#1086#1090#1087#1091#1089#1082#1086#1074', '#1082#1086#1090#1086#1088#1099#1084' '#1087#1088#1077#1076#1096#1077#1089#1090#1074#1091#1077#1090' '#1086#1090#1087#1091#1089#1082' ('#1073#1077#1079' '#1087#1088#1080#1093 +
        #1086#1076#1086#1074').'
      ''
      '3. '#1055#1088#1086#1074#1077#1088#1082#1072' '#1090#1072#1083#1086#1085#1086#1074' '#1085#1072' '#1085#1072#1083#1080#1095#1080#1077' '#1074' '#1101#1084#1080#1089#1089#1080#1080'.'
      #1055#1086#1082#1072#1079#1099#1074#1072#1102#1090#1089#1103' '#1090#1072#1083#1086#1085#1099', '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1085#1077#1090' '#1101#1084#1080#1089#1089#1080#1080'. '
      #9
      '4. '#1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1085#1086#1084#1080#1085#1072#1083#1086#1074' '#1086#1076#1085#1086#1075#1086' '#1080' '#1090#1086#1075#1086' '#1078#1077' '#1090#1072#1083#1086#1085#1072'.'
      
        #1053#1072#1093#1086#1076#1103#1090#1089#1103' '#1090#1072#1083#1086#1085#1099', '#1082#1086#1090#1086#1088#1099#1077' '#1080#1084#1077#1102#1090' '#1088#1072#1079#1083#1080#1095#1085#1099#1077' '#1085#1086#1084#1080#1085#1072#1083#1099', '#1090'.'#1077'. '#1090#1072#1083#1086#1085#1099' ' +
        #1073#1099#1083#1080' '#1079#1072#1074#1077#1076#1077#1085#1099' '#1089' '
      #1088#1072#1079#1085#1099#1084#1080' '#1085#1086#1084#1080#1085#1072#1083#1072#1084#1080'.'
      ''
      '5. '#1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1072' '#1076#1091#1073#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1072#1083#1086#1085#1072'.'
      
        #1053#1072#1093#1086#1076#1103#1090#1089#1103' '#1090#1072#1083#1086#1085#1099', '#1082#1086#1090#1086#1088#1099#1077' '#1073#1099#1083#1080' '#1087#1088#1086#1076#1091#1073#1083#1080#1088#1086#1074#1072#1085#1099' '#1074' '#1087#1088#1080#1093#1086#1076#1077' '#1080#1083#1080' '#1074' '#1086#1090 +
        #1087#1091#1089#1082#1077'. '
      ''
      '6. '#1057#1084#1077#1085#1085#1099#1081' '#1086#1090#1095#1077#1090'.'
      
        '  '#1042' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' OIL '#1087#1086' '#1087#1088#1080#1085#1103#1090#1080#1102' '#1089#1084#1077#1085#1085#1086#1075#1086' '#1086#1090#1095#1077#1090#1072', '#1087#1086' '#1074#1085#1077#1089#1077#1085#1085#1099#1084' '#1076#1072#1085#1085 +
        #1099#1084' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '
      #1087#1088#1080#1093#1086#1076' '
      
        #1090#1072#1083#1086#1085#1086#1074' '#1089' '#1040#1047#1057'. '#1044#1072#1085#1085#1072#1103' '#1087#1088#1086#1074#1077#1088#1082#1072' '#1087#1088#1077#1076#1085#1072#1079#1085#1072#1095#1077#1085#1072' '#1076#1083#1103' '#1074#1099#1103#1074#1083#1077#1085#1080#1103' '#1085#1077#1089#1086#1086 +
        #1090#1074#1077#1090#1089#1090#1074#1080#1103
      
        #1076#1072#1085#1085#1099#1093' '#1089#1084#1077#1085#1085#1086#1075#1086' '#1086#1090#1095#1077#1090#1072' '#1080' '#1087#1088#1080#1093#1086#1076#1072' '#1090#1072#1083#1086#1085#1086#1074'. '#1042' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1077' '#1091#1082#1072#1079#1072#1085#1085#1099' ' +
        #1076#1072#1085#1085#1099#1077' '#1086' '#1089#1084#1077#1085#1085#1086#1084#1086#1090#1095#1077#1090#1077' '
      #1080' '
      
        #1076#1074#1072' '#1089#1090#1086#1083#1073#1094#1072' '#1089' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086#1084' '#1090#1072#1083#1086#1085#1086#1074'. '#1055#1077#1088#1074#1099#1081' '#1089#1090#1086#1083#1073#1077#1094' '#1091#1082#1072#1079#1099#1074#1072#1077#1090' '#1082#1086#1083#1080 +
        #1095#1077#1089#1090#1074#1086' '#1090#1072#1083#1086#1085#1086#1074' '#1074' '
      #1089#1084#1077#1085#1085#1086#1084' '#1086#1090#1095#1077#1090#1077' '#1072' '#1076#1088#1091#1075#1086#1081' '#1091#1082#1072#1079#1099#1074#1072#1077#1090' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1072#1083#1086#1085#1086#1074' '#1074' '#1087#1088#1080#1093#1086#1076#1077'.'
      ''
      
        #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1073#1091#1076#1077#1090' '#1091#1089#1087#1077#1096#1085#1099#1084', '#1074#1086' '#1074#1089#1077#1093' '#1087#1088#1086#1074#1077#1088#1082#1072#1093' '#1085#1077' '#1086#1089#1090#1072#1085#1077#1090#1089#1103' '#1085#1080' '#1086#1076#1085#1086 +
        #1081' '#1089#1090#1088#1086#1082#1080'. '#1055#1088#1080' '#1074#1099#1103#1074#1083#1077#1085#1080#1080' '
      #1085#1072#1088#1091#1096#1077#1085#1080#1081' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1080#1093' '#1080#1089#1087#1088#1072#1074#1080#1090#1100' '#1080' '#1087#1088#1086#1074#1077#1089#1090#1080' '#1087#1088#1086#1074#1077#1088#1082#1091' '#1079#1072#1085#1086#1074#1086'. '
      '')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 696
    Top = 220
    ParamData = <
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end>
  end
  object qCardText: TOilQuery
    SQL.Strings = (
      #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1086#1089#1090#1086#1080#1090' '#1074' '#1089#1083#1077#1076#1091#1102#1097#1077#1084':'
      ''
      '   '#1054#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1077' '#1074' Petrol '#1080' '#1074' '#1089#1084#1077#1085#1085#1086#1084' '#1086#1090#1095#1077#1090#1077' Oil.'
      '   '#1055#1077#1088#1077#1088#1072#1089#1093#1086#1076' '#1087#1086' '#1101#1083'. '#1082#1072#1088#1090#1077'.'
      '   '#1044#1091#1073#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1081'.'
      '   '#1055#1086#1087#1086#1083#1085#1077#1085#1080#1103' '#1089#1086#1073'. '#1072#1074#1090#1086'.'
      '   '#1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1082#1072#1088#1090#1077' '#1074' Petrol '#1080' Oil.'
      '   '#1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1079#1072#1087#1080#1089#1077#1081' Petrol '#1080' Oil.'
      '   '#1053#1077#1087#1088#1072#1074#1080#1083#1100#1085#1072#1103' '#1087#1088#1080#1074#1103#1079#1082#1072' '#1082#1083#1080#1077#1085#1090#1072'.'
      '   '#1053#1077#1074#1077#1088#1085#1099#1081' '#1085#1086#1084#1077#1088#1072' '#1090#1077#1088#1084#1080#1085#1072#1083#1072'.'
      ''
      '1. '#1054#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1077' '#1074' Petrol '#1080' '#1074' '#1089#1084#1077#1085#1085#1086#1084' '#1086#1090#1095#1077#1090#1077' Oil.'
      
        '        '#1044#1072#1085#1085#1072#1103' '#1087#1088#1086#1074#1077#1088#1082#1072' '#1087#1086#1082#1072#1079#1099#1074#1072#1077#1090' '#1085#1077#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1086#1073#1097#1077#1075#1086' '#1083#1080#1090#1088#1072#1078#1072 +
        ' '#1089#1084#1077#1085#1085#1086#1075#1086' '#1086#1090#1095#1077#1090#1072
      '        '#1080' '#1086#1073#1097#1077#1075#1086' '#1083#1080#1090#1088#1072#1078#1072' '#1089#1087#1080#1089#1072#1085#1080#1081' '#1069#1050' '#1087#1086' '#1101#1090#1086#1084#1091' '#1089#1084#1077#1085#1085#1086#1084#1091' '#1086#1090#1095#1077#1090#1091'.'
      ''
      '   '#1055#1088#1080#1095#1080#1085#1099' '#1074#1086#1079#1085#1080#1082#1085#1086#1074#1077#1085#1080#1103' '#1086#1096#1080#1073#1082#1080':'
      '        - '#1042' '#1089#1084#1077#1085#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1079#1072#1085#1077#1089#1077#1085#1086' '#1085#1077#1074#1077#1088#1085#1086#1077' '#1074#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1086' '#1089#1084#1077#1085#1099';'
      '        - '#1042' '#1089#1084#1077#1085#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1079#1072#1085#1077#1089#1077#1085#1086' '#1085#1077#1074#1077#1088#1085#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1083#1080#1090#1088#1086#1074
      '          ('#1073#1086#1083#1100#1096#1077#1077', '#1084#1077#1085#1100#1096#1077#1077', '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090');'
      '        - '#1055#1086#1090#1077#1088#1103#1085#1099' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080' '#1089#1087#1080#1089#1072#1085#1080#1081' '#1053#1055';'
      ''
      '   '#1055#1091#1090#1080' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103':'
      
        '        - '#1054#1073#1091#1095#1080#1090#1100' '#1086#1087#1077#1088#1072#1090#1086#1088#1086#1074' '#1040#1047#1057' '#1080' '#1089#1087#1077#1094#1080#1072#1083#1080#1089#1090#1086#1074' '#1087#1086' '#1091#1095#1077#1090#1091' '#1085#1072' '#1092#1080#1083#1072 +
        #1083#1072#1093
      
        '          '#1087#1088#1072#1074#1080#1083#1100#1085#1086' '#1079#1072#1085#1086#1089#1080#1090#1100' '#1074#1088#1077#1084#1103' '#1089#1084#1077#1085#1085#1086#1075#1086' '#1086#1090#1095#1077#1090#1072' ('#1089#1084'. '#1087'.'#1087'.10,1' +
        '1 "'#1048#1085#1089#1090#1088#1091#1082#1094#1080#1103' '#1087#1086' '#1101#1083'. '#1082#1072#1088#1090#1072#1084'").'
      
        '          '#1058#1077#1088#1084#1080#1085#1072#1083#1100#1085#1099#1081' '#1095#1077#1082' '#1076#1086#1083#1078#1077#1085' '#1086#1090#1085#1086#1089#1080#1090#1100#1089#1103' '#1082' '#1090#1086#1084#1091' '#1089#1084#1077#1085#1085#1086#1084#1091' '#1086#1090#1095 +
        #1077#1090#1091', '#1074' '#1090#1077#1095#1077#1085#1080#1077' '#1082#1086#1090#1086#1088#1086#1075#1086
      
        '          '#1087#1088#1086#1080#1079#1086#1096#1083#1086' '#1076#1072#1085#1085#1086#1077' '#1089#1087#1080#1089#1072#1085#1080#1077'. '#1048' '#1095#1077#1082' '#1080' '#1089#1084#1077#1085#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1080#1084#1077#1077#1090 +
        ' '#1074#1088#1077#1084#1103' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1080' '#1086#1085#1080
      '          '#1076#1086#1083#1078#1085#1099' '#1087#1088#1072#1074#1080#1083#1100#1085#1086' '#1089#1086#1086#1090#1085#1086#1089#1080#1090#1100#1089#1103'.'
      
        '        - '#1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1087#1086#1076#1085#1103#1090#1100' '#1095#1077#1082#1080' '#1090#1077#1088#1084#1080#1085#1072#1083#1072', '#1087#1088#1080#1082#1088#1077#1087#1083#1077#1085#1085#1099#1077' '#1082' '#1089#1084#1077 +
        #1085#1085#1086#1084#1091' '#1086#1090#1095#1077#1090#1091' '#1086#1087#1077#1088#1072#1090#1086#1088#1072','
      
        '          '#1080' '#1089#1074#1077#1088#1080#1090#1100' '#1080#1093' '#1089' '#1083#1080#1090#1088#1072#1078#1086#1084' '#1074' '#1089#1084#1077#1085#1085#1086#1084' '#1086#1090#1095#1077#1090#1077' '#1080' '#1089' '#1090#1088#1072#1085#1079#1072#1082#1094#1080 +
        #1103#1084#1080', '#1087#1088#1080#1096#1077#1076#1096#1080#1084#1080' '#1089' '#1040#1047#1057'.'
      '          '#1042#1089#1077' '#1085#1077#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' '#1080#1089#1087#1088#1072#1074#1080#1090#1100' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' Oil.'
      
        '        - '#1055#1086#1090#1077#1088#1103#1085#1085#1099#1077' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080' '#1089#1087#1080#1089#1072#1085#1080#1081' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1074' Petrol. ' +
        #1042#1089#1077' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1087#1086' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' Petrol'
      
        '          '#1089#1086#1075#1083#1072#1089#1086#1074#1099#1074#1072#1090#1100' '#1089#1086' '#1089#1083#1091#1078#1073#1086#1081' '#1087#1086#1076#1076#1077#1088#1078#1082#1080' '#1087#1086' '#1069#1050' ('#1054#1083#1077#1075' '#1050#1086#1079#1072#1095#1086#1082 +
        ' '#1074#1085'. 434).'
      ''
      '2. '#1055#1077#1088#1077#1088#1072#1089#1093#1086#1076' '#1087#1086' '#1101#1083'. '#1082#1072#1088#1090#1077'.'
      
        '        '#1044#1072#1085#1085#1072#1103' '#1087#1088#1086#1074#1077#1088#1082#1072' '#1087#1086#1082#1072#1079#1099#1074#1072#1077#1090' '#1087#1077#1088#1077#1088#1072#1089#1093#1086#1076' '#1087#1086' '#1089#1087#1080#1089#1072#1085#1080#1103#1084' - '#1086#1073#1097 +
        #1080#1081' '#1083#1080#1090#1088#1072#1078' '#1089#1087#1080#1089#1072#1085#1080#1081' '#1087#1086' '#1101#1083'.'#1082#1072#1088#1090#1077
      
        '        '#1073#1086#1083#1100#1096#1077', '#1095#1077#1084' '#1086#1073#1097#1080#1081' '#1083#1080#1090#1088#1072#1078' '#1087#1086#1087#1086#1083#1077#1085#1085#1080#1081' '#1087#1086' '#1101#1090#1086#1081' '#1082#1072#1088#1090#1077'. '#1055#1088#1086#1074#1077 +
        #1088#1082#1072' '#1074#1099#1076#1072#1077#1090' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080','
      
        '        '#1091' '#1082#1086#1090#1086#1088#1099#1093' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103' '#1083#1080#1073#1086' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1102#1090' '#1083#1080#1073#1086' '#1087#1086' '#1074#1088#1077#1084#1077#1085#1080' '#1080#1076 +
        #1091#1090' '#1087#1086#1079#1078#1077' '#1089#1087#1080#1089#1072#1085#1080#1081'.'
      ''
      
        '   '#1055#1088#1080#1095#1080#1085#1099' '#1074#1086#1079#1085#1080#1082#1085#1086#1074#1077#1085#1080#1103' '#1086#1096#1080#1073#1082#1080': '#1055#1086#1090#1077#1088#1103#1085#1099' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081' ' +
        #1069#1050'.'
      ''
      '   '#1055#1091#1090#1080' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103':'
      
        '        - '#1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1087#1086#1076#1085#1103#1090#1100' '#1079#1072#1103#1074#1082#1080' '#1087#1086' '#1076#1072#1085#1085#1086#1081' '#1101#1083'. '#1082#1072#1088#1090#1077' '#1080' '#1074#1086#1089#1089#1090#1072 +
        #1085#1086#1074#1080#1090#1100' '#1087#1088#1086#1087#1072#1074#1096#1077#1077
      
        '          '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1077' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' Petrol. '#1042#1089#1077' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1087#1086' '#1087#1088#1086#1075#1088#1072#1084 +
        #1084#1077' Petrol '#1089#1086#1075#1083#1072#1089#1086#1074#1099#1074#1072#1090#1100
      '          '#1089#1086' '#1089#1083#1091#1078#1073#1086#1081' '#1087#1086#1076#1076#1077#1088#1078#1082#1080' '#1087#1086' '#1069#1050' ('#1054#1083#1077#1075' '#1050#1086#1079#1072#1095#1086#1082' '#1074#1085'. 434).'
      ''
      '3. '#1044#1091#1073#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1081'.'
      
        '        '#1044#1072#1085#1085#1072#1103' '#1087#1088#1086#1074#1077#1088#1082#1072' '#1087#1086#1082#1072#1079#1099#1074#1072#1077#1090' '#1076#1091#1073#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1081'. '#1058#1072#1082#1072 +
        #1103' '#1086#1096#1080#1073#1082#1072' '#1087#1088#1080#1074#1086#1076#1080#1090' '#1082' '#1085#1077#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1080
      
        '        '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1075#1086' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1082#1072#1082#1086#1075#1086' '#1083#1080#1073#1086' '#1086#1090#1095#1077#1090#1072' '#1087#1086' '#1076#1072#1085#1085#1086#1081' '#1082#1072 +
        #1088#1090#1077'.'
      ''
      
        '   '#1055#1088#1080#1095#1080#1085#1099' '#1074#1086#1079#1085#1080#1082#1085#1086#1074#1077#1085#1080#1103' '#1086#1096#1080#1073#1082#1080': '#1042#1089#1077#1074#1086#1079#1084#1086#1078#1085#1099#1077' '#1084#1072#1085#1080#1087#1091#1083#1103#1094#1080#1080' '#1089' '#1076#1072#1085#1085 +
        #1099#1084#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' Petrol;'
      ''
      
        '   '#1055#1091#1090#1080' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103': '#1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1089#1074#1103#1079#1072#1090#1089#1103' '#1089#1086' '#1089#1083#1091#1078#1073#1086#1081' '#1087#1086#1076#1076#1077#1088#1078#1082#1080' '#1087#1086 +
        ' '#1069#1050' '#1076#1083#1103' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1088#1077#1082#1086#1084#1077#1085#1076#1072#1094#1080#1081' ('#1054#1083#1077#1075' '#1050#1086#1079#1072#1095#1086#1082' '#1074#1085'. 432).'
      ''
      '4. '#1055#1086#1087#1086#1083#1085#1077#1085#1080#1103' '#1089#1086#1073'. '#1072#1074#1090#1086'.'
      
        '        '#1044#1072#1085#1085#1072#1103' '#1087#1088#1086#1074#1077#1088#1082#1072' '#1087#1086#1082#1072#1079#1099#1074#1072#1077#1090' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103', '#1082#1086#1090#1086#1088#1099#1077' '#1089#1092#1086#1088#1084#1080#1088#1086#1074 +
        #1072#1085#1099' '#1076#1083#1103' '#1054#1040#1054' '#1080#1083#1080' '#1060#1080#1083#1080#1072#1083#1072', '#1085#1086' '#1085#1072' '#1085#1080#1093
      '        '#1085#1077' '#1087#1088#1086#1089#1090#1072#1074#1083#1077#1085#1099' '#1040#1074#1090#1086#1084#1086#1073#1080#1083#1100' '#1080' '#1042#1086#1076#1080#1090#1077#1083#1100'.'
      ''
      '   '#1055#1088#1080#1095#1080#1085#1099' '#1074#1086#1079#1085#1080#1082#1085#1086#1074#1077#1085#1080#1103' '#1086#1096#1080#1073#1082#1080':'
      
        '        '#1079#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1077#1084' '#1101#1083'. '#1082#1072#1088#1090#1086#1095#1082#1080', '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1072#1097#1077#1081' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1084#1091' ' +
        #1074#1086#1076#1080#1090#1077#1083#1102','
      '        '#1085#1077' '#1079#1072#1082#1088#1077#1087#1083#1077#1085#1099' '#1040#1074#1090#1086#1084#1086#1073#1080#1083#1100' '#1080' '#1042#1086#1076#1080#1090#1077#1083#1100'.'
      ''
      '   '#1055#1091#1090#1080' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103':'
      
        '        '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' Oil '#1087#1077#1088#1077#1089#1084#1086#1090#1088#1077#1090#1100' '#1074#1089#1077' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1086' '#1089#1086#1073#1089#1090#1074#1077#1085#1085 +
        #1099#1084' '#1082#1072#1088#1090#1086#1095#1082#1072#1084' '#1080' '#1079#1072' '#1082#1072#1078#1076#1099#1084' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1077#1084
      '        '#1079#1072#1082#1088#1077#1087#1080#1090#1100' '#1040#1074#1090#1086#1084#1086#1073#1080#1083#1100' '#1080' '#1042#1086#1076#1080#1090#1077#1083#1100
      ''
      '5. '#1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1082#1072#1088#1090#1077' '#1074' Petrol '#1080' Oil.'
      
        '        '#1042#1086#1079#1074#1088#1072#1097#1072#1077#1090' '#1089#1087#1080#1089#1086#1082' '#1082#1072#1088#1090', '#1086#1089#1090#1072#1090#1086#1082' '#1082#1086#1096#1077#1083#1100#1082#1086#1074' '#1082#1086#1090#1086#1088#1099#1093' '#1085#1077' '#1089#1086#1086 +
        #1090#1074#1077#1090#1089#1090#1074#1091#1077#1090' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' Petrol '#1080' Oil.'
      ''
      '   '#1055#1088#1080#1095#1080#1085#1099' '#1074#1086#1079#1085#1080#1082#1085#1086#1074#1077#1085#1080#1103' '#1086#1096#1080#1073#1082#1080':'
      
        '        - '#1055#1088#1080#1095#1080#1085#1091', '#1087#1086' '#1082#1086#1090#1086#1088#1086#1081' '#1084#1086#1078#1077#1090' '#1087#1086#1083#1091#1095#1080#1090#1100#1089#1103' '#1088#1072#1089#1093#1086#1078#1076#1077#1085#1080#1077', '#1085#1091#1078#1085 +
        #1086' '#1085#1072#1093#1086#1076#1080#1090#1100' '#1076#1083#1103
      '          '#1082#1072#1078#1076#1086#1075#1086' '#1086#1090#1076#1077#1083#1100#1085#1086#1075#1086' '#1089#1083#1091#1095#1072#1103' '#1080#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1086'.'
      ''
      '   '#1055#1091#1090#1080' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103':'
      
        '        - '#1044#1083#1103' '#1088#1077#1096#1077#1085#1080#1103' '#1087#1088#1086#1073#1083#1077#1084#1099' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1087#1086' '#1087#1077#1088#1074#1080#1095#1085#1099#1084' '#1076#1086#1082#1091#1084#1077#1085#1090#1072 +
        #1084' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103'/'#1089#1087#1080#1089#1072#1085#1080#1103
      
        '          '#1087#1086' '#1076#1072#1085#1085#1086#1081' '#1082#1072#1088#1090#1077' '#1080' '#1085#1072#1081#1090#1080' '#1074' '#1082#1072#1082#1086#1081' '#1087#1077#1088#1080#1086#1076' '#1087#1088#1086#1080#1079#1086#1096#1083#1086' '#1085#1077#1089#1086#1086 +
        #1090#1074#1077#1090#1089#1074#1080#1077'. '#1042#1089#1077' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1087#1086' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      
        '          Petrol '#1089#1086#1075#1083#1072#1089#1086#1074#1099#1074#1072#1090#1100' '#1089#1086' '#1089#1083#1091#1078#1073#1086#1081' '#1087#1086#1076#1076#1077#1088#1078#1082#1080' '#1087#1086' '#1069#1050' ('#1054#1083#1077#1075' ' +
        #1050#1086#1079#1072#1095#1086#1082' '#1074#1085'. 432).'
      ''
      '6. '#1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1079#1072#1087#1080#1089#1077#1081' Petrol '#1080' Oil.'
      
        '        '#1057#1088#1072#1074#1085#1080#1074#1072#1077#1090' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080' '#1074' Petrol '#1080' Oil '#1080' '#1086#1090#1086#1073#1088#1072#1078#1072#1077#1090' '#1079#1072#1087#1080#1089#1080 +
        ', '#1082#1086#1090#1086#1088#1099#1077' '#1085#1077' '#1089#1086#1074#1087#1072#1076#1072#1102#1090' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1072#1093'.'
      ''
      '   '#1055#1088#1080#1095#1080#1085#1099' '#1074#1086#1079#1085#1080#1082#1085#1086#1074#1077#1085#1080#1103' '#1086#1096#1080#1073#1082#1080':'
      
        '        - '#1055#1088#1080#1095#1080#1085#1091', '#1087#1086' '#1082#1086#1090#1086#1088#1086#1081' '#1084#1086#1078#1077#1090' '#1087#1086#1083#1091#1095#1080#1090#1100#1089#1103' '#1088#1072#1089#1093#1086#1078#1076#1077#1085#1080#1077', '#1085#1091#1078#1085 +
        #1086' '#1085#1072#1093#1086#1076#1080#1090#1100
      '          '#1076#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1086#1090#1076#1077#1083#1100#1085#1086#1075#1086' '#1089#1083#1091#1095#1072#1103' '#1080#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1086'.'
      ''
      '   '#1055#1091#1090#1080' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103':'
      
        '        - '#1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1089#1074#1103#1079#1072#1090#1089#1103' '#1089#1086' '#1089#1083#1091#1078#1073#1086#1081' '#1087#1086#1076#1076#1077#1088#1078#1082#1080' '#1087#1086' '#1069#1050' '#1076#1083#1103' '#1087#1086#1083 +
        #1091#1095#1077#1085#1080#1103' '#1088#1077#1082#1086#1084#1077#1085#1076#1072#1094#1080#1081
      '          ('#1054#1083#1077#1075' '#1050#1086#1079#1072#1095#1086#1082' '#1074#1085'. 432).'
      ''
      '7. '#1053#1077#1087#1088#1072#1074#1080#1083#1100#1085#1072#1103' '#1087#1088#1080#1074#1103#1079#1082#1072' '#1082#1083#1080#1077#1085#1090#1072'.'
      
        '        '#1042#1086#1079#1074#1088#1072#1097#1072#1077#1090' '#1089#1087#1080#1089#1086#1082' '#1082#1083#1080#1077#1085#1090#1086#1074', '#1076#1083#1103' '#1082#1086#1090#1086#1088#1099#1093' '#1085#1077#1087#1088#1072#1074#1080#1083#1100#1085#1086' '#1091#1089#1090#1072 +
        #1085#1086#1074#1083#1077#1085#1072' '#1087#1088#1080#1074#1103#1079#1082#1072'.'
      ''
      
        '   '#1055#1088#1080#1095#1080#1085#1099' '#1074#1086#1079#1085#1080#1082#1085#1086#1074#1077#1085#1080#1103' '#1086#1096#1080#1073#1082#1080': '#1085#1077' '#1074#1099#1087#1086#1083#1085#1077#1085#1072' '#1080#1083#1080' '#1085#1077' '#1087#1088#1072#1074#1080#1083#1100#1085#1086' '#1074 +
        #1099#1087#1086#1083#1085#1077#1085#1072' '#1087#1088#1080#1074#1103#1079#1082#1072' '#1082#1083#1080#1077#1085#1090#1072'.'
      ''
      '   '#1055#1091#1090#1080' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103':'
      
        '        - '#1044#1083#1103' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1086#1096#1080#1073#1082#1080' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1087#1088#1072#1074#1080#1083#1100#1085#1086' '#1087#1088#1080#1074#1103#1079#1072#1090#1100' ' +
        #1082#1083#1080#1077#1085#1090#1072' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' Petrol'
      
        '          '#1074' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1080' '#1089' '#1080#1085#1089#1090#1088#1091#1082#1094#1080#1077#1081' "'#1048'02_1 '#1048#1085#1089#1090#1088#1091#1082#1094#1080#1103'_'#1055#1077#1090#1088#1086#1083'_' +
        #1054#1081#1083'".'
      ''
      '8. '#1053#1077#1074#1077#1088#1085#1099#1081' '#1085#1086#1084#1077#1088#1072' '#1090#1077#1088#1084#1080#1085#1072#1083#1072'.'
      
        '          '#1042#1086#1079#1074#1088#1072#1097#1072#1077#1090' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1040#1047#1057', '#1074' '#1090#1077#1088#1084#1080#1085#1072#1083#1077' '#1082#1086#1090#1086#1088#1086#1081' '#1085#1077#1087#1088#1072#1074#1080#1083#1100 +
        #1085#1086' '#1087#1088#1086#1087#1080#1089#1072#1085' '#1085#1086#1084#1077#1088' '#1090#1077#1088#1084#1080#1085#1072#1083#1072'.'
      ''
      
        '   '#1055#1088#1080#1095#1080#1085#1099' '#1074#1086#1079#1085#1080#1082#1085#1086#1074#1077#1085#1080#1103' '#1086#1096#1080#1073#1082#1080': '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' Oil '#1080' Petrol '#1080#1083#1080' '#1074' ' +
        #1090#1077#1088#1084#1080#1085#1072#1083#1077' '#1079#1072#1087#1080#1089#1072#1085#1099' '#1088#1072#1079#1085#1099#1077' '#1082#1086#1076#1099' (ID) '#1040#1047#1057'.'
      ''
      '   '#1055#1091#1090#1080' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103':'
      
        '         - '#1053#1091#1078#1085#1086' '#1074' Petrol '#1074#1099#1073#1088#1072#1090#1100' '#1087#1091#1085#1082#1090' '#1084#1077#1085#1102' '#1054#1041#1057#1051#1059#1046#1048#1042#1040#1053#1048#1045' / '#1058#1045#1056#1052 +
        #1048#1053#1040#1051#1067' / '#1042#1057#1045' '#1080' '#1074' '#1087#1086#1083#1077' '#1053#1054#1052#1045#1056' '#1087#1088#1086#1087#1080#1089#1072#1090#1100
      
        '           '#1090#1088#1080' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1094#1080#1092#1088#1099' ID '#1040#1047#1057' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081 +
        ' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' Oil. '#1058#1072#1082#1078#1077' '#1085#1091#1078#1085#1086' '#1087#1088#1086#1074#1077#1088#1080#1090#1100
      
        '           '#1101#1090#1086#1090' '#1085#1086#1084#1077#1088' '#1085#1072' '#1089#1072#1084#1086#1084' '#1090#1077#1088#1084#1080#1085#1072#1083#1077'. '#1054#1085#1080' '#1076#1086#1083#1078#1085#1099' '#1073#1099#1090#1100' '#1086#1076#1080#1085#1072#1082 +
        #1086#1074#1099#1084#1080'.')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 623
    Top = 220
    ParamData = <
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end
      item
        DataType = ftUnknown
      end>
  end
  object qCardOP: TOilQuery
    SQL.Strings = (
      'select card.gr_nomer,'
      '       tr.oper_date as data_sozdania,'
      '       op.data_nachala,'
      '       op.data_okonchania,'
      '       op.data_obsl,'
      '       tr.count_litr as summa_za_chto,'
      '       '#39#1053#1077' '#1088#1077#1072#1083#1080#1079#1086#1074#1072#1085#1086#1077' '#1054#1055#39' as desc_'
      '  from magicash5.ecfil148 op,'
      '       magicash5.ECFIL012 card,'
      '       v_card_transaction tr'
      ' where op.id_karti = card.id_karty'
      '   and trim(guid_generated) is not null'
      '   and trim(guid_returned) is null'
      '   and trim(guid_realized) is null'
      '   and data_okonchania < sysdate - 15'
      '   and guid_generated = tr.trn_guid   '
      '   and tr.count_litr <> 0'
      ' union all'
      'select card.gr_nomer,'
      '       fop.oper_date as data_sozdania,'
      '       op.data_nachala,'
      '       op.data_okonchania,'
      '       rop.oper_date as data_obsl,'
      '       fop.count_litr as summa_za_chto,'
      '       '#39#1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1054#1055', '#1087#1086#1079#1078#1077' '#1054#1055#39'  as desc_'
      '  from magicash5.ecfil148 op,'
      '       magicash5.ECFIL012 card,'
      '       v_card_transaction fop,'
      '       v_card_transaction rop'
      ' where op.id_karti = card.id_karty'
      '   and trim(guid_generated) is not null'
      
        '   and (trim(guid_returned) is not null or trim(guid_realized) i' +
        's not null)'
      '   and guid_generated = fop.trn_guid'
      
        '   and nvl(trim(guid_returned), trim(guid_realized)) = rop.trn_g' +
        'uid'
      '   and fop.oper_date >= rop.oper_date')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 440
    Top = 456
    object qCardOPDESC_: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'DESC_'
      Size = 33
    end
    object qCardOPGR_NOMER: TFloatField
      DisplayLabel = #1050#1072#1088#1090#1072
      FieldName = 'GR_NOMER'
    end
    object qCardOPDATA_SOZDANIA: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
      FieldName = 'DATA_SOZDANIA'
    end
    object qCardOPDATA_NACHALA: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      FieldName = 'DATA_NACHALA'
    end
    object qCardOPDATA_OKONCHANIA: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FieldName = 'DATA_OKONCHANIA'
    end
    object qCardOPDATA_OBSL: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
      FieldName = 'DATA_OBSL'
    end
    object qCardOPSUMMA_ZA_CHTO: TFloatField
      DisplayLabel = #1051#1080#1090#1088#1099
      FieldName = 'SUMMA_ZA_CHTO'
    end
  end
  object qCardPC: TOilQuery
    SQL.Strings = (
      '--> qCardPC,TestDB'
      'select Title,'
      '       '#1069#1052#1048#1058#1045#1053#1058'_'#1043#1044#1045' as Gde,'
      '       Oper_Date as Oil_Date,'
      '       gr_card_num as Card_Number,'
      '       np_type as NP,'
      '       id_'#1082#1086#1096'_'#1095#1077#1084' as Purse,'
      '       count_litr,'
      '       '#1089#1091#1084#1084#1072'_'#1095#1077#1084' as Count_Purse,'
      '       price_nds,'
      '       term_number,'
      '       Max(pc.date_mod) date_mod,'
      '       Count(pc.date_mod) Count_'
      '  from ((select '#39#1085#1077#1090' '#1074' '#1055#1062', '#1077#1089#1090#1100' '#1074' '#1055#1077#1090#1088#1086#1083#1077#39' as Title,'
      '                '#1069#1052#1048#1058#1045#1053#1058'_'#1043#1044#1045','
      '                date_ + to_number(substr(time_, 1, 2)) / 24 +'
      '                to_number(substr(time_, 3, 2)) / 1440 +'
      
        '                to_number(substr(time_, 5, 2)) / 86400 as oper_d' +
        'ate,'
      '                gr_card_num,'
      '                np_type,'
      '                id_'#1082#1086#1096'_'#1095#1077#1084','
      '                count_litr,'
      '                '#1089#1091#1084#1084#1072'_'#1095#1077#1084','
      '                price_nds,'
      '                to_number('#1053#1054#1052#1045#1056'_'#1058#1045#1056#1052#1048#1053#1040#1051#1040') as term_number'
      '           from v_card_transaction'
      '          where '#1101#1084#1080#1090#1077#1085#1090'_'#1075#1076#1077' <> substr(gr_card_num, 1, 3)'
      '            and oper_num in (9, 12)'
      '            and date_ >= :BeginDate'
      '         union all'
      '         select '#39#1085#1077#1090' '#1074' '#1055#1062', '#1077#1089#1090#1100' '#1074' '#1055#1077#1090#1088#1086#1083#1077#39','
      '                term_emitent,'
      '                oper_date,'
      '                card_number,'
      '                np_type,'
      '                np_type,'
      '                litr,'
      '                litr,'
      '                term_price,'
      '                azs_id - 1000000'
      '           from card_transit'
      '          where trunc(oper_date) >= '#39'01.12.2004'#39') minus'
      '         select '#39#1085#1077#1090' '#1074' '#1055#1062', '#1077#1089#1090#1100' '#1074' '#1055#1077#1090#1088#1086#1083#1077#39','
      '                pc_em_gde,'
      '                pc_date,'
      '                pc_card_num,'
      '                pc_np_za_chto,'
      '                pc_np_chem,'
      '                pc_summa_za_chto,'
      '                pc_summa_chem,'
      '                pc_term_price,'
      '                pc_term_number'
      '           from card_transaction_pc'
      '          where state = '#39'Y'#39
      '            and pc_date >= :BeginDate'
      '         union all'
      '         select '#39#1077#1089#1090#1100' '#1074' '#1055#1062', '#1085#1077#1090' '#1074' '#1055#1077#1090#1088#1086#1083#1077#39','
      '                pc_em_gde,'
      '                pc_date,'
      '                pc_card_num,'
      '                pc_np_za_chto,'
      '                pc_np_chem,'
      '                pc_summa_za_chto,'
      '                pc_summa_chem,'
      '                pc_term_price,'
      '                pc_term_number'
      '           from card_transaction_pc'
      '          where state = '#39'Y'#39
      '            and pc_date >= :BeginDate'
      '         minus (select '#39#1077#1089#1090#1100' '#1074' '#1055#1062', '#1085#1077#1090' '#1074' '#1055#1077#1090#1088#1086#1083#1077#39','
      '                       '#1069#1052#1048#1058#1045#1053#1058'_'#1043#1044#1045','
      
        '                       date_ + to_number(substr(time_, 1, 2)) / ' +
        '24 +'
      '                       to_number(substr(time_, 3, 2)) / 1440 +'
      
        '                       to_number(substr(time_, 5, 2)) / 86400 as' +
        ' oil_date,'
      '                       gr_card_num,'
      '                       np_type,'
      '                       id_'#1082#1086#1096'_'#1095#1077#1084','
      '                       count_litr,'
      '                       '#1089#1091#1084#1084#1072'_'#1095#1077#1084','
      '                       price_nds,'
      '                       to_number('#1053#1054#1052#1045#1056'_'#1058#1045#1056#1052#1048#1053#1040#1051#1040')'
      '                  from v_card_transaction'
      '                 where '#1101#1084#1080#1090#1077#1085#1090'_'#1075#1076#1077' <> substr(gr_card_num, 1, 3)'
      '                   and oper_num in (9, 12)'
      '                   and date_ >= :BeginDate'
      '                union all'
      '                select '#39#1077#1089#1090#1100' '#1074' '#1055#1062', '#1085#1077#1090' '#1074' '#1055#1077#1090#1088#1086#1083#1077#39','
      '                       term_emitent,'
      '                       oper_date,'
      '                       card_number,'
      '                       np_type,'
      '                       np_type,'
      '                       litr,'
      '                       litr,'
      '                       term_price,'
      '                       azs_id - 1000000'
      '                  from card_transit'
      
        '                 where trunc(oper_date) >= '#39'01.12.2004'#39')), (sele' +
        'ct *'
      
        '                                                              fr' +
        'om card_transaction_pc'
      
        '                                                             whe' +
        're state = '#39'Y'#39
      
        '                                                               a' +
        'nd pc_date >='
      
        '                                                                ' +
        '   :BeginDate) pc'
      '          where trunc(oper_date) >'
      '                nvl(ov.GetVal('#39'inst_move_date'#39'), :BeginDate)'
      '            and '#1069#1052#1048#1058#1045#1053#1058'_'#1043#1044#1045' = pc.pc_em_gde(+)'
      '            and Oper_Date = pc.pc_date(+)'
      '            and gr_card_num = pc.pc_card_num(+)'
      '            and np_type = pc.pc_np_za_chto(+)'
      '            and id_'#1082#1086#1096'_'#1095#1077#1084' = pc.pc_np_chem(+)'
      '            and count_litr = pc.pc_summa_za_chto(+)'
      '            and '#1089#1091#1084#1084#1072'_'#1095#1077#1084' = pc.pc_summa_chem(+)'
      '            and price_nds = pc.pc_term_price(+)'
      '            and term_number = pc.pc_term_number(+)'
      '          group by Title,'
      '                   '#1069#1052#1048#1058#1045#1053#1058'_'#1043#1044#1045','
      '                   Oper_Date,'
      '                   gr_card_num,'
      '                   np_type,'
      '                   id_'#1082#1086#1096'_'#1095#1077#1084','
      '                   count_litr,'
      '                   '#1089#1091#1084#1084#1072'_'#1095#1077#1084','
      '                   price_nds,'
      '                   term_number'
      '          order by 3, 2, 1')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 436
    Top = 417
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end>
    object qCardPCTITLE: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      DisplayWidth = 23
      FieldName = 'TITLE'
      FixedChar = True
      Size = 24
    end
    object qCardPCGDE: TFloatField
      DisplayLabel = #1043#1076#1077' '#1086#1073#1089#1083#1091#1078#1080#1083#1080#1089#1100
      DisplayWidth = 15
      FieldName = 'GDE'
    end
    object qCardPCOIL_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 20
      FieldName = 'OIL_DATE'
    end
    object qCardPCCARD_NUMBER: TFloatField
      DisplayLabel = #1050#1072#1088#1090#1072
      DisplayWidth = 12
      FieldName = 'CARD_NUMBER'
    end
    object qCardPCNP: TFloatField
      DisplayLabel = #1053#1055
      DisplayWidth = 5
      FieldName = 'NP'
    end
    object qCardPCPURSE: TFloatField
      DisplayLabel = #1053#1055'2'
      DisplayWidth = 5
      FieldName = 'PURSE'
    end
    object qCardPCCOUNT_LITR: TFloatField
      DisplayLabel = #1050'-'#1074#1086', '#1083
      DisplayWidth = 7
      FieldName = 'COUNT_LITR'
    end
    object qCardPCCOUNT_PURSE: TFloatField
      DisplayLabel = #1050'-'#1074#1086'2, '#1083
      DisplayWidth = 7
      FieldName = 'COUNT_PURSE'
    end
    object qCardPCPRICE_NDS: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 7
      FieldName = 'PRICE_NDS'
    end
    object qCardPCTERM_NUMBER: TFloatField
      DisplayLabel = #1058#1077#1088#1084#1080#1085#1072#1083
      DisplayWidth = 11
      FieldName = 'TERM_NUMBER'
    end
    object qCardPCDATE_MOD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1074' '#1055#1062
      DisplayWidth = 20
      FieldName = 'DATE_MOD'
    end
    object qCardPCCOUNT_: TFloatField
      DisplayLabel = #1050'-'#1074#1086' '#1079#1072#1087#1080#1089#1077#1081' '#1074' '#1055#1062
      DisplayWidth = 15
      FieldName = 'COUNT_'
    end
  end
  object qCheck: TOilQuery
    SQL.Strings = (
      '--> qCheck,TestDB'
      'select id, inst, DeCoder(Enabled,inst,id) as Enabled,'
      '       to_number(DeCoder(Quantity,inst,id)) as Quantity,'
      '       to_number(DeCoder(Correction,inst,id)) as Correction,'
      
        '       to_number(DeCoder(Errors_allow, inst,id)) as Errors_allow' +
        ','
      
        '       to_number(DeCoder(Silence_period,inst,id)) as Silence_per' +
        'iod,'
      '       Date_fld,'
      
        '       decode(DeCoder(falling_date,inst,inst*id),'#39'01.01.1999'#39',nu' +
        'll,to_date(DeCoder(falling_date,inst,inst*id))) as falling_date'
      'from oil_checkups'
      'where id=:p_id and inst=:p_inst      '
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 209
    Top = 314
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_inst'
        ParamType = ptInput
      end>
  end
  object qSetFallingDate: TOilQuery
    SQL.Strings = (
      '--> qSetFallingDate,TestDB'
      'update oil_checkups'
      
        'set falling_date=EnCoder(to_char(:p_date,'#39'dd.mm.yyyy'#39'),inst,id*i' +
        'nst)'
      'where id = :p_id and inst=:p_inst'
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 214
    Top = 374
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p_date'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_inst'
        ParamType = ptInput
      end>
  end
  object qCardClientDEMO: TOilQuery
    SQL.Strings = (
      '--> qCardClientDemo,TestDB'
      ' select kl.'#1086#1087#1080#1089#1072#1085#1080#1077' as Title,'
      '        substr(lpad(klid.id_'#1080#1093', 10, '#39'0'#39'), 1, 7) as Id,'
      '        substr(lpad(klid.id_'#1080#1093', 10, '#39'0'#39'), 8, 3) as Inst'
      '   from demo.'#1087#1088#1080#1074#1103#1079#1082#1072'_'#1082#1083'id klid, demo.'#1082#1083#1080#1077#1085#1090#1099' kl'
      
        '  where (substr(lpad(klid.id_'#1080#1093',10,'#39'0'#39'),1,7), substr(lpad(klid.i' +
        'd_'#1080#1093',10,'#39'0'#39'),8,3) ) not in'
      '           (select lpad(id,7,'#39'0'#39'), lpad(inst,3,'#39'0'#39')'
      '              from v_org'
      '             where State = '#39'Y'#39')'
      '    and kl.id_'#1082#1083#1080#1077#1085#1090#1072' = klid.id_'#1085#1072#1096
      '    and kl.'#1076#1072#1090#1072'_'#1091#1076#1072#1083#1077#1085#1080#1103' = 0')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 500
    Top = 320
  end
  object qCardTermDEMO: TOilQuery
    SQL.Strings = (
      '--> qCardTermDemo,TestDB'
      ' select azs.'#1085#1072#1079#1074#1072#1085#1080#1077' as azs_name,'
      '        term.'#1085#1072#1079#1074#1072#1085#1080#1077' as term_name,'
      '        term.'#1085#1086#1084#1077#1088'_'#1090#1077#1088#1084#1080#1085#1072#1083#1072' as term_number'
      '   from demo.'#1090#1077#1088#1084#1080#1085#1072#1083#1099' term, demo.'#1090#1086#1095#1082#1080'_'#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103' azs'
      '  where 1000000 + term.'#1085#1086#1084#1077#1088'_'#1090#1077#1088#1084#1080#1085#1072#1083#1072' not in'
      '        (select INST'
      '           from v_oil_org O,'
      '                (select value as ID'
      '                   from oil_var'
      '                  where name = '#39'ID'#39') V,'
      '                (select value as par_ID'
      '                   from oil_var'
      '                  where name='#39'MAIN_PAR'#39') V1'
      '          where org_id = 8'
      
        '            and (PPONID =  V.ID or OBLID = V.ID or PPONID =  V1.' +
        'par_ID or OBLID = V1.par_ID))'
      
        '    and term.id_'#1090#1086#1095#1082#1080'_'#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103' = azs.id_'#1090#1086#1095#1082#1080'_'#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103' (' +
        '+)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 504
    Top = 368
  end
  object qCardRestDEMO: TOilQuery
    SQL.Strings = (
      '--> qCardRestDEMO,TestDB'
      '-- '#1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1085#1072' '#1069#1050' '#1074' Petrol '#1080' Oil'
      ' select /*+ORDERED USE_HASH(Petrol, Oil) USE_NL(Oil_NP_Group)*/'
      '        Petrol.Card_Number,'
      '        Oil_NP_Group.Name as NP_Type,'
      '        Petrol.Rest as Petrol_Rest,'
      '        Oil.Rest as Oil_Rest'
      '   from (--'#1042#1099#1073#1086#1088#1082#1072' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1080#1079' Petrol'
      '         select card.'#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1081'_'#1085#1086#1084#1077#1088' as Card_Number,'
      '                kosh.Id_'#1050#1086#1096#1077#1083#1100#1082#1072' as NP_Type,'
      
        '                sum(nvl(demo.rawtofloat(kosh.'#1088#1072#1079#1084#1077#1088'_'#1082#1086#1096#1077#1083#1100#1082#1072'), 0' +
        ')) as Rest'
      '           from demo.'#1082#1086#1096#1077#1083#1100#1082#1080'_'#1082#1072#1088#1090' kosh, demo.'#1082#1072#1088#1090#1099' card'
      '          where kosh.id_'#1082#1072#1088#1090#1099' = card.id_'#1082#1072#1088#1090#1099' (+)'
      
        '          group by card.'#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1081'_'#1085#1086#1084#1077#1088', kosh.Id_'#1050#1086#1096#1077#1083#1100#1082#1072') Pet' +
        'rol,'
      '        (--'#1042#1099#1073#1086#1088#1082#1072' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1080#1079' Oil'
      '         select Card_Number,'
      '                NP_Type,'
      '                sum(Litr) as Rest'
      '           from (--'#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081
      '                 select Card_Number,'
      '                        NP_Type,'
      '                        Litr'
      '                   from v_Card_Receipts'
      '                  union all'
      '                 --'#1042#1099#1073#1086#1088#1082#1072' '#1089#1087#1080#1089#1072#1085#1080#1081
      '                 select Card_Number,'
      '                        NP_Type, '
      '                        -Litr'
      '                   from v_Card_Expense)'
      '          group by Card_Number, NP_Type) Oil, Oil_NP_Group'
      '  where Petrol.Card_Number = Oil.Card_Number (+)'
      '    and Petrol.NP_Type = Oil.NP_Type (+)'
      '    and Petrol.NP_Type = Oil_NP_Group.Petrol_Id'
      '    and (Petrol.rest <> Oil.rest or Oil.rest<0) ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 508
    Top = 232
    object qCardRestDEMOCARD_NUMBER: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1099
      DisplayWidth = 20
      FieldName = 'CARD_NUMBER'
    end
    object qCardRestDEMONP_TYPE: TStringField
      DisplayLabel = #1058#1080#1087' '#1053#1055
      DisplayWidth = 20
      FieldName = 'NP_TYPE'
      Size = 50
    end
    object qCardRestDEMOPETROL_REST: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1074' Petrol'
      DisplayWidth = 30
      FieldName = 'PETROL_REST'
    end
    object qCardRestDEMOOIL_REST: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1074' OIL'
      FieldName = 'OIL_REST'
    end
  end
  object qCardIdDEMO: TOilQuery
    SQL.Strings = (
      '--> qCardIdDEMO,TestDB'
      '-- '#1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1079#1072#1087#1080#1089#1077#1081' Petrol '#1080' Oil'
      'select Title, id, card_number, oper_date, np_name, litr'
      '  from (select /*+ORDERED USE_HASH(ct,tr,npg)*/'
      '         '#39#1053#1077#1090' '#1074' '#1055#1077#1090#1088#1086#1083', '#39' || '#39#1085#1086' '#1077#1089#1090#1100' '#1074' OIL'#39' as Title,'
      '         ct.id,'
      '         ct.gr_card_num as Card_Number,'
      '         ct.Date_ + to_number(substr(ct.Time_, 1, 2)) / 24 +'
      '         to_number(substr(ct.Time_, 3, 2)) / 1440 +'
      '         to_number(substr(ct.Time_, 5, 2)) / 86400 as Oper_Date,'
      '         npg.name as NP_Name,'
      '         ct.count_litr as Litr,'
      '         tr.id as q_id'
      '          from card_transaction          ct,'
      '               demo.'#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080' tr,'
      '               oil_np_group              npg'
      '         where ct.id = tr.id(+)'
      '           and ct.np_type = npg.petrol_id'
      '           and nvl(gr_card_num, 0) > 0'
      '           and ct.date_ >= :BeginDate'
      '        '
      '        union all'
      '        '
      '        select /*+ORDERED USE_HASH(tr,cards,ct,npg)*/'
      '         '#39#1053#1077#1090' '#1074' OIL, '#39' || '#39#1085#1086' '#1077#1089#1090#1100' '#1074' '#1055#1077#1090#1088#1086#1083#39' as Title,'
      '         tr.id,'
      '         cards.'#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1081'_'#1085#1086#1084#1077#1088' as Card_Number,'
      '         tr.'#1076#1072#1090#1072' + to_number(substr(tr.'#1074#1088#1077#1084#1103', 1, 2)) / 24 +'
      '         to_number(substr(tr.'#1074#1088#1077#1084#1103', 3, 2)) / 1440 +'
      '         to_number(substr(tr.'#1074#1088#1077#1084#1103', 5, 2)) / 86400 as Oper_Date,'
      '         npg.name as NP_Name,'
      '         demo.rawtofloat(tr.'#1089#1091#1084#1084#1072'_'#1079#1072'_'#1095#1090#1086') as Litr,'
      '         ct.id as q_id'
      '          from demo.'#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080' tr,'
      '               card_transaction          ct,'
      '               demo.'#1082#1072#1088#1090#1099'           cards,'
      '               oil_np_group              npg'
      '         where tr.id = ct.id(+)'
      '           and tr.id_'#1082#1072#1088#1090#1099'_'#1086#1073#1089#1083' = cards.id_'#1082#1072#1088#1090#1099'(+)'
      '           and tr.id_'#1082#1086#1096'_'#1079#1072'_'#1095#1090#1086' = npg.petrol_id(+)'
      '           and tr.id_'#1082#1072#1088#1090#1099'_'#1086#1073#1089#1083' <> 0'
      '           and tr.'#1076#1072#1090#1072' >= :BeginDate)'
      ' where q_id is null'
      ' order by Oper_Date')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 507
    Top = 279
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end>
  end
  object qCardLostPack: TOilQuery
    SQL.Strings = (
      'select NumPack_From, NumPack_To, CountNotExist'
      '  from (select (npak - dd) NumPack_From,'
      '               (npak - 1) NumPack_To,'
      '               nvl(dd, 0) CountNotExist'
      '          from (select tr1.id_paketa npak,'
      '                       tr1.id_paketa -'
      '                       (lag(tr1.id_paketa, 1, tr1.id_paketa - 1)'
      '                        over(order by tr1.id_paketa)) - 1 dd'
      '                  from (select tr.id_paketa'
      '                          from magicash5.ecfil153 tr'
      '                         where tr.id_emitenta_ot_kogo = 6000'
      '                           and tr.id_paketa >= 3323'
      '                         group by tr.id_paketa) tr1)'
      '         where dd > 0'
      '        union all'
      '        select decode(count(*), 0, -1, null) NumPack_From,'
      '               decode(count(*), 0, -1, null) NumPack_To,'
      '               decode(count(*), 0, -1, null) CountNotExist'
      '          from (select tr1.id_paketa npak,'
      '                       tr1.id_paketa -'
      '                       (lag(tr1.id_paketa, 1, tr1.id_paketa - 1)'
      '                        over(order by tr1.id_paketa)) - 1 dd'
      '                  from (select tr.id_paketa'
      '                          from magicash5.ecfil153 tr'
      '                         where tr.id_emitenta_ot_kogo = 6000'
      '                           and tr.id_paketa >= 3323'
      '                         group by tr.id_paketa) tr1))'
      ' where CountNotExist is not null'
      '   --  5.7.8.1 - '#1092#1080#1083#1080#1072#1083#1100#1085#1099#1081' '#1087#1077#1090#1088#1086#1083
      '   and '#39'5.7.8'#39' <> (select substr(version, 1, 5)'
      '                     from magicash5.p5config)'
      ' union all'
      'select NumPack_From, NumPack_To, CountNotExist'
      '  from (select (npak - dd) NumPack_From,'
      '               (npak - 1) NumPack_To,'
      '               nvl(dd, 0) CountNotExist'
      '          from (select tr1.id_paketa npak,'
      '                       tr1.id_paketa -'
      '                       (lag(tr1.id_paketa, 1, tr1.id_paketa - 1)'
      '                        over(order by tr1.id_paketa)) - 1 dd'
      '                  from (select tr.id_paketa'
      '                          from magicash5.ecfil153 tr'
      '                         where tr.id_emitenta_ot_kogo  = 6190'
      '                         group by tr.id_paketa) tr1)'
      '         where dd > 0'
      '        union all'
      '        select decode(count(*), 0, -1, null) NumPack_From,'
      '               decode(count(*), 0, -1, null) NumPack_To,'
      '               decode(count(*), 0, -1, null) CountNotExist'
      '          from (select tr1.id_paketa npak,'
      '                       tr1.id_paketa -'
      '                       (lag(tr1.id_paketa, 1, tr1.id_paketa - 1)'
      '                        over(order by tr1.id_paketa)) - 1 dd'
      '                  from (select tr.id_paketa'
      '                          from magicash5.ecfil153 tr'
      '                         where tr.id_emitenta_ot_kogo = 6190'
      '                         group by tr.id_paketa) tr1))'
      ' where CountNotExist is not null'
      '   and '#39'5.7.8'#39' = (select substr(version, 1, 5)'
      '                    from magicash5.p5config)')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 500
    Top = 416
    object qCardLostPackNUMPACK_FROM: TFloatField
      DisplayLabel = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'NUMPACK_FROM'
    end
    object qCardLostPackNUMPACK_TO: TFloatField
      DisplayLabel = #1050#1086#1085#1077#1095#1085#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'NUMPACK_TO'
    end
    object qCardLostPackCOUNTNOTEXIST: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1085#1077#1076#1086#1089#1090#1072#1102#1097#1080#1093
      FieldName = 'COUNTNOTEXIST'
    end
  end
  object qCardLostPackFil: TOilQuery
    SQL.Strings = (
      'select NumPack_From, NumPack_To, CountNotExist, '#39#1055#1062#39' as PC'
      '  from (select (npak - dd) NumPack_From,'
      '               (npak - 1) NumPack_To,'
      '               nvl(dd, 0) CountNotExist'
      '          from (select tr1.id_paketa npak,'
      '                       tr1.id_paketa -'
      '                       (lag(tr1.id_paketa, 1, tr1.id_paketa - 1)'
      '                        over(order by tr1.id_paketa)) - 1 dd'
      '                  from (select tr.id_paketa'
      '                          from magicash5.ecfil153 tr'
      '                         where tr.id_emitenta_ot_kogo = 6000'
      '                           and tr.id_paketa >= 3323'
      '                         group by tr.id_paketa) tr1)'
      '         where dd > 0'
      '        union all'
      '        select decode(count(*), 0, -1, null) NumPack_From,'
      '               decode(count(*), 0, -1, null) NumPack_To,'
      '               decode(count(*), 0, -1, null) CountNotExist'
      '          from (select tr1.id_paketa npak,'
      '                       tr1.id_paketa -'
      '                       (lag(tr1.id_paketa, 1, tr1.id_paketa - 1)'
      '                        over(order by tr1.id_paketa)) - 1 dd'
      '                  from (select tr.id_paketa'
      '                          from magicash5.ecfil153 tr'
      '                         where tr.id_emitenta_ot_kogo = 6000'
      '                           and tr.id_paketa >= 3323'
      '                         group by tr.id_paketa) tr1))'
      ' where CountNotExist is not null'
      ' union all'
      'select NumPack_From, NumPack_To, CountNotExist, '#39#1056#1054#1062#39' as PC'
      '  from (select (npak - dd) NumPack_From,'
      '               (npak - 1) NumPack_To,'
      '               nvl(dd, 0) CountNotExist'
      '          from (select tr1.id_paketa npak,'
      '                       tr1.id_paketa -'
      '                       (lag(tr1.id_paketa, 1, tr1.id_paketa - 1)'
      '                        over(order by tr1.id_paketa)) - 1 dd'
      '                  from (select tr.id_paketa'
      '                          from magicash5fil.ecfil153 tr'
      '                         where tr.id_emitenta_ot_kogo = 6190'
      '                         group by tr.id_paketa) tr1)'
      '         where dd > 0'
      '        union all'
      '        select decode(count(*), 0, -1, null) NumPack_From,'
      '               decode(count(*), 0, -1, null) NumPack_To,'
      '               decode(count(*), 0, -1, null) CountNotExist'
      '          from (select tr1.id_paketa npak,'
      '                       tr1.id_paketa -'
      '                       (lag(tr1.id_paketa, 1, tr1.id_paketa - 1)'
      '                        over(order by tr1.id_paketa)) - 1 dd'
      '                  from (select tr.id_paketa'
      '                          from magicash5fil.ecfil153 tr'
      '                         where tr.id_emitenta_ot_kogo = 6190'
      '                         group by tr.id_paketa) tr1))'
      ' where CountNotExist is not null')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 300
    Top = 408
    object FloatField2: TFloatField
      DisplayLabel = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'NUMPACK_FROM'
    end
    object FloatField3: TFloatField
      DisplayLabel = #1050#1086#1085#1077#1095#1085#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'NUMPACK_TO'
    end
    object FloatField4: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1085#1077#1076#1086#1089#1090#1072#1102#1097#1080#1093
      FieldName = 'COUNTNOTEXIST'
    end
    object qCardLostPackFilPC: TStringField
      FieldName = 'PC'
      Size = 3
    end
  end
  object qCardIdFil: TOilQuery
    SQL.Strings = (
      '--> qCardIdFil,TestDB'
      'select /*+USE_HASH(i)*/'
      ' i.Title,'
      ' i.id,'
      ' i.Card_Number,'
      ' i.Oper_date,'
      ' to_char('#39' '#39') as np_name,'
      ' to_number(null) as Litr,'
      ' '#39#1069#1084#1080#1090#1077#1085#1090#39' as card_user'
      '  from (select '#39#1053#1077#1090' '#1074' OIL, '#1077#1089#1090#1100' '#1074' '#1055#1077#1090#1088#1086#1083#39' as Title,'
      '               DECODE(nvl(oldID, 0), 0, TRN_GUID, oldID) as id,'
      '               gr_nomer as card_number,'
      '               data as oper_date'
      '          from magicash5.ecfil139'
      '         where id_kosh_schem not in (8, 9)'
      '           and get_card_oper_num(gr_nomer,'
      '                                 nomer_terminala,'
      '                                 id_prichiny,'
      '                                 operatziya,'
      '                                 nomer_schemy,'
      '                                 trn_guid) > 2'
      '        minus'
      '        select '#39#1053#1077#1090' '#1074' OIL, '#1077#1089#1090#1100' '#1074' '#1055#1077#1090#1088#1086#1083#39' as Title,'
      '               DECODE(nvl(ID, 0), 0, TRN_GUID, ID) as id,'
      '               gr_card_num as card_number,'
      '               real_date as Oper_Date'
      '          from v_card_transaction'
      '         where np_type not in (8, 9)'
      '           and oper_num > 2'
      '        union all'
      '        select '#39#1053#1077#1090' '#1074' '#1055#1077#1090#1088#1086#1083', '#1077#1089#1090#1100' '#1074' OIL'#39' as Title,'
      '               DECODE(nvl(ID, 0), 0, TRN_GUID, ID) as id,'
      '               gr_card_num as card_number,'
      '               real_date as Oper_Date'
      '          from v_card_transaction'
      '         where np_type not in (8, 9)'
      '           and oper_num > 2'
      '        minus'
      '        select '#39#1053#1077#1090' '#1074' '#1055#1077#1090#1088#1086#1083', '#1077#1089#1090#1100' '#1074' OIL'#39' as Title,'
      '               DECODE(nvl(oldID, 0), 0, TRN_GUID, oldID) as id,'
      '               gr_nomer as card_number,'
      '               data as oper_date'
      '          from magicash5.ecfil139'
      '         where id_kosh_schem not in (8, 9)'
      '           and get_card_oper_num(gr_nomer,'
      '                                 nomer_terminala,'
      '                                 id_prichiny,'
      '                                 operatziya,'
      '                                 nomer_schemy,'
      '                                 trn_guid) > 2) i'
      ' where nvl(i.card_number, 0) <> 0'
      '   and i.oper_date >= :BeginDate'
      'union all'
      'select /*+USE_HASH(i)*/'
      ' i.Title,'
      ' i.id,'
      ' i.Card_Number,'
      ' i.Oper_date,'
      ' to_char('#39' '#39') as np_name,'
      ' to_number(null) as Litr,'
      ' '#39#1060#1080#1083#1080#1072#1083#39' as card_user'
      '  from (select '#39#1053#1077#1090' '#1074' OIL, '#1077#1089#1090#1100' '#1074' '#1055#1077#1090#1088#1086#1083#39' as Title,'
      '               TRN_GUID as id,'
      '               gr_nomer as card_number,'
      '               data as oper_date'
      '          from magicash5fil.ecfil139'
      '         where id_kosh_schem not in (8, 9)'
      '           and get_card_oper_num(gr_nomer,'
      '                                 nomer_terminala,'
      '                                 id_prichiny,'
      '                                 operatziya,'
      '                                 nomer_schemy,'
      '                                 trn_guid) > 2'
      '        minus'
      '        select '#39#1053#1077#1090' '#1074' OIL, '#1077#1089#1090#1100' '#1074' '#1055#1077#1090#1088#1086#1083#39' as Title,'
      '               DECODE(nvl(ID, 0), 0, TRN_GUID, ID) as id,'
      '               gr_card_num as card_number,'
      '               real_date as Oper_Date'
      '          from v_card_transaction'
      '         where np_type not in (8, 9)'
      '           and oper_num > 2'
      '        union all'
      '        select '#39#1053#1077#1090' '#1074' '#1055#1077#1090#1088#1086#1083', '#1077#1089#1090#1100' '#1074' OIL'#39' as Title,'
      '               DECODE(nvl(ID, 0), 0, TRN_GUID, ID) as id,'
      '               gr_card_num as card_number,'
      '               real_date as Oper_Date'
      '          from v_card_transaction'
      '         where np_type not in (8, 9)'
      '           and oper_num > 2'
      '        minus'
      '        select '#39#1053#1077#1090' '#1074' '#1055#1077#1090#1088#1086#1083', '#1077#1089#1090#1100' '#1074' OIL'#39' as Title,'
      '               TRN_GUID as id,'
      '               gr_nomer as card_number,'
      '               data as oper_date'
      '          from magicash5fil.ecfil139'
      '         where id_kosh_schem not in (8, 9)'
      '           and get_card_oper_num(gr_nomer,'
      '                                 nomer_terminala,'
      '                                 id_prichiny,'
      '                                 operatziya,'
      '                                 nomer_schemy,'
      '                                 trn_guid) > 2) i'
      ' where nvl(i.card_number, 0) <> 0'
      '   and i.oper_date >= :BeginDate'
      ' order by oper_date desc')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 302
    Top = 300
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
    object StringField3: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'TITLE'
      FixedChar = True
      Size = 27
    end
    object StringField4: TStringField
      FieldName = 'ID'
      Size = 40
    end
    object FloatField5: TFloatField
      DisplayLabel = #1050#1072#1088#1090#1072
      FieldName = 'CARD_NUMBER'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'OPER_DATE'
    end
    object StringField5: TStringField
      DisplayLabel = #1053#1055
      FieldName = 'NP_NAME'
      Size = 1
    end
    object FloatField6: TFloatField
      DisplayLabel = #1050'-'#1074#1086', '#1083
      FieldName = 'LITR'
    end
    object qCardIdFilCARD_USER: TStringField
      FieldName = 'CARD_USER'
      Size = 7
    end
  end
  object qCardRestFil: TOilQuery
    SQL.Strings = (
      '--> qCardRestFil,TestDB'
      '-- '#1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1085#1072' '#1069#1050' '#1074' Petrol '#1080' Oil'
      ' select /*+ORDERED USE_HASH(Petrol, Oil) USE_NL(Oil_NP_Group)*/'
      '        Petrol.Card_Number,'
      '        Oil_NP_Group.Name as NP_Type,'
      '        Petrol.Rest as Petrol_Rest,'
      '        Oil.Rest as Oil_Rest,'
      '        '#39#1069#1084#1080#1090#1077#1085#1090#39' as card_user'
      '   from (--'#1042#1099#1073#1086#1088#1082#1072' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1080#1079' Petrol'
      '          select card.gr_nomer as Card_Number,'
      '                kosh.id_koshelka as NP_Type,'
      '                sum(nvl(kosh.razmer_koshelka, 0)) as Rest'
      '           from magicash5.ecfil015 kosh, magicash5.ecfil012 card'
      '          where kosh.id_karty = card.id_karty (+)'
      '          group by card.gr_nomer, kosh.id_koshelka'
      '        ) Petrol,'
      '        (--'#1042#1099#1073#1086#1088#1082#1072' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1080#1079' Oil'
      '         select Card_Number,'
      '                NP_Type,'
      '                sum(Litr) as Rest,'
      '                min(tr_type) as tr_type'
      '           from (--'#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081
      '                 select Card_Number,'
      '                        NP_Type,'
      '                        Litr,'
      '                        tr_type'
      '                   from v_Card_Receipts'
      '                  union all'
      '                 --'#1042#1099#1073#1086#1088#1082#1072' '#1089#1087#1080#1089#1072#1085#1080#1081
      '                 select Card_Number,'
      '                        NP_Type,'
      '                        -Litr,'
      '                        to_number(null)'
      '                   from v_Card_Expense)'
      '          group by Card_Number, NP_Type) Oil, Oil_NP_Group'
      '  where Petrol.Card_Number = Oil.Card_Number (+)'
      '    and Petrol.NP_Type = Oil.NP_Type (+)'
      '    and Petrol.NP_Type = Oil_NP_Group.Petrol_Id'
      '    and (Petrol.rest <> Oil.rest or Oil.rest<0)'
      '    and oil.tr_type <> 3'
      'union all'
      ' select /*+ORDERED USE_HASH(Petrol, Oil) USE_NL(Oil_NP_Group)*/'
      '        Petrol.Card_Number,'
      '        Oil_NP_Group.Name as NP_Type,'
      '        Petrol.Rest as Petrol_Rest,'
      '        Oil.Rest as Oil_Rest,'
      '        '#39#1060#1080#1083#1080#1072#1083#39' as card_user'
      '   from (--'#1042#1099#1073#1086#1088#1082#1072' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1080#1079' Petrol'
      '          select card.gr_nomer as Card_Number,'
      '                kosh.id_koshelka as NP_Type,'
      '                sum(nvl(kosh.razmer_koshelka, 0)) as Rest'
      
        '           from magicash5fil.ecfil015 kosh, magicash5fil.ecfil01' +
        '2 card'
      '          where kosh.id_karty = card.id_karty (+)'
      '          group by card.gr_nomer, kosh.id_koshelka'
      '        ) Petrol,'
      '        (--'#1042#1099#1073#1086#1088#1082#1072' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1080#1079' Oil'
      '         select Card_Number,'
      '                NP_Type,'
      '                sum(Litr) as Rest,'
      '                min(tr_type) as tr_type'
      '           from (--'#1042#1099#1073#1086#1088#1082#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1081
      '                 select Card_Number,'
      '                        NP_Type,'
      '                        Litr,'
      '                        tr_type'
      '                   from v_Card_Receipts'
      '                  union all'
      '                 --'#1042#1099#1073#1086#1088#1082#1072' '#1089#1087#1080#1089#1072#1085#1080#1081
      '                 select Card_Number,'
      '                        NP_Type,'
      '                        -Litr,'
      '                        to_number(null)'
      '                   from v_Card_Expense)'
      '          group by Card_Number, NP_Type) Oil, Oil_NP_Group'
      '  where Petrol.Card_Number = Oil.Card_Number (+)'
      '    and Petrol.NP_Type = Oil.NP_Type (+)'
      '    and Petrol.NP_Type = Oil_NP_Group.Petrol_Id'
      '    and (Petrol.rest <> Oil.rest or Oil.rest<0)'
      '    and oil.tr_type <> 3')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 302
    Top = 255
    object FloatField7: TFloatField
      DisplayLabel = #8470' '#1101#1083'. '#1082#1072#1088#1090#1099
      FieldName = 'CARD_NUMBER'
    end
    object StringField6: TStringField
      DisplayLabel = #1053#1055
      DisplayWidth = 6
      FieldName = 'NP_TYPE'
      Size = 50
    end
    object FloatField8: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1087#1086' Petrol'
      DisplayWidth = 15
      FieldName = 'PETROL_REST'
    end
    object FloatField9: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1087#1086' Oil'
      DisplayWidth = 15
      FieldName = 'OIL_REST'
    end
    object qCardRestFilCARD_USER: TStringField
      FieldName = 'CARD_USER'
      Size = 7
    end
  end
  object qTreePrih: TOilQuery
    SQL.Strings = (
      '--> qTreePrih,TestDb'
      'select substr(oo.name, 1, 40) as filial,'
      '       v.ser,'
      '       v.num,'
      '       v.prev_date as Begin_Date,'
      '       v.date_ as End_Date,'
      '       substr(oo1.name, 1, 40) as prev_filial'
      
        '  from v_oil_talon_opl v, oil_org oo, oil_org oo1, v_main_org mo' +
        'rg'
      ' where v.tip = '#39'P'#39
      '   and v.prev_tip = '#39'P'#39
      '   and (morg.org_type = 4 or v.prev_oper_id <> 183 or'
      '       v.prev_to_id = v.prev_to_inst and v.prev_to_id = morg.id)'
      '   and not (v.prev_oper_id = 183 and v.prev_to_id = 4000)'
      '   and v.to_id = oo.id'
      '   and v.to_inst = oo.inst'
      '   and v.prev_to_id = oo1.id'
      '   and v.prev_to_inst = oo1.inst'
      '   and v.prev_date >= :BeginDate')
    FetchAll = True
    BeforeOpen = PutBeginDateParam
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 378
    Top = 75
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      DisplayWidth = 40
      FieldName = 'FILIAL'
      Size = 40
    end
    object StringField2: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      FieldName = 'SER'
      Size = 3
    end
    object FloatField1: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072
      FieldName = 'BEGIN_DATE'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072
      FieldName = 'END_DATE'
    end
    object qTreePrihPREV_FILIAL: TStringField
      DisplayLabel = #1055#1088#1077#1076'. '#1092#1080#1083#1080#1072#1083
      FieldName = 'PREV_FILIAL'
      Size = 40
    end
  end
  object qLoadBlankCheck: TOilQuery
    SQL.Strings = (
      'select sql.id as sql_id,'
      
        '       max(decode(instr(sqd.text,'#39'--$ID='#39'),0,null,substr(sqd.tex' +
        't, 7))) as checkup_id,'
      
        '       max(decode(instr(sqd.text,'#39'--$DESC='#39'),0,null,substr(sqd.t' +
        'ext, 9))) as description'
      '  from exe_sql sql, exe_forms frm, exe_sql_data sqd'
      ' where sql.form_id = frm.id'
      '   and sqd.sql_id = sql.id'
      '   and sql.state = '#39'Y'#39
      '   and sqd.state = '#39'Y'#39
      '   and lower(frm.name) = '#39'testdb'#39
      '   and (substr(sqd.text, 1, 8) = '#39'--$DESC='#39' or'
      '       substr(sqd.text, 1, 6) = '#39'--$ID='#39')'
      ' group by sql.id'
      ' order by to_number(checkup_id)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 496
    Top = 88
  end
  object qBlank: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 488
    Top = 40
  end
  object dsBlank: TOraDataSource
    DataSet = qBlank
    Left = 494
    Top = 30
  end
  object qCardOPFil: TOilQuery
    SQL.Strings = (
      'select card.gr_nomer,'
      '       tr.data + tr.vremya / 86400 as data_sozdania,'
      '       op.data_nachala,'
      '       op.data_okonchania,'
      '       op.data_obsl,'
      '       tr.summa_za_chto,'
      '       '#39#1053#1077' '#1088#1077#1072#1083#1080#1079#1086#1074#1072#1085#1086#1077' '#1054#1055#39' as desc_,'
      '       '#39#1069#1084#1080#1090#1077#1085#1090#39' as card_user'
      '  from magicash5.ecfil148 op,'
      '       magicash5.ECFIL012 card,'
      '       magicash5.ecfil139 tr'
      ' where op.id_karti = card.id_karty'
      '   and trim(guid_generated) is not null'
      '   and trim(guid_returned) is null'
      '   and trim(guid_realized) is null'
      '   and data_okonchania < sysdate - 15'
      '   and guid_generated = tr.trn_guid'
      '   and tr.summa_zaproshenaya_chem <> 0'
      '   and tr.summa_za_chto <> 0'
      '   and tr.summa_chem_realno <> 0'
      ' union all'
      'select card.gr_nomer,'
      '       fop.data + fop.vremya / 86400 as data_sozdania,'
      '       op.data_nachala,'
      '       op.data_okonchania,'
      '       rop.data + rop.vremya / 86400 as data_obsl,'
      '       fop.summa_za_chto,'
      '       '#39#1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1054#1055', '#1087#1086#1079#1078#1077' '#1054#1055#39'  as desc_,'
      '       '#39#1069#1084#1080#1090#1077#1085#1090#39' as card_user'
      '  from magicash5.ecfil148 op,'
      '       magicash5.ECFIL012 card,'
      '       magicash5.ecfil139 fop,'
      '       magicash5.ecfil139 rop'
      ' where op.id_karti = card.id_karty'
      '   and trim(guid_generated) is not null'
      
        '   and (trim(guid_returned) is not null or trim(guid_realized) i' +
        's not null)'
      '   and guid_generated = fop.trn_guid'
      
        '   and nvl(trim(guid_returned), trim(guid_realized)) = rop.trn_g' +
        'uid'
      
        '   and fop.data + fop.vremya / 86400 >= rop.data + rop.vremya / ' +
        '86400'
      ' union all   '
      'select card.gr_nomer,'
      '       tr.data + tr.vremya / 86400 as data_sozdania,'
      '       op.data_nachala,'
      '       op.data_okonchania,'
      '       op.data_obsl,'
      '       tr.summa_za_chto,'
      '       '#39#1053#1077' '#1088#1077#1072#1083#1080#1079#1086#1074#1072#1085#1086#1077' '#1054#1055#39' as desc_,'
      '       '#39#1060#1080#1083#1080#1072#1083#39' as card_user'
      '  from magicash5fil.ecfil148 op,'
      '       magicash5fil.ECFIL012 card,'
      '       magicash5fil.ecfil139 tr'
      ' where op.id_karti = card.id_karty'
      '   and trim(guid_generated) is not null'
      '   and trim(guid_returned) is null'
      '   and trim(guid_realized) is null'
      '   and data_okonchania < sysdate - 15'
      '   and guid_generated = tr.trn_guid'
      '   and tr.summa_zaproshenaya_chem <> 0'
      '   and tr.summa_za_chto <> 0'
      '   and tr.summa_chem_realno <> 0'
      ' union all'
      'select card.gr_nomer,'
      '       fop.data + fop.vremya / 86400 as data_sozdania,'
      '       op.data_nachala,'
      '       op.data_okonchania,'
      '       rop.data + rop.vremya / 86400 as data_obsl,'
      '       fop.summa_za_chto,'
      '       '#39#1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1054#1055', '#1087#1086#1079#1078#1077' '#1054#1055#39'  as desc_,'
      '       '#39#1060#1080#1083#1080#1072#1083#39' as card_user'
      '  from magicash5fil.ecfil148 op,'
      '       magicash5fil.ECFIL012 card,'
      '       magicash5fil.ecfil139 fop,'
      '       magicash5fil.ecfil139 rop'
      ' where op.id_karti = card.id_karty'
      '   and trim(guid_generated) is not null'
      
        '   and (trim(guid_returned) is not null or trim(guid_realized) i' +
        's not null)'
      '   and guid_generated = fop.trn_guid'
      
        '   and nvl(trim(guid_returned), trim(guid_realized)) = rop.trn_g' +
        'uid'
      
        '   and fop.data + fop.vremya / 86400 >= rop.data + rop.vremya / ' +
        '86400')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 296
    Top = 448
    object qCardOPFilDESC_: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'DESC_'
      Size = 33
    end
    object qCardOPFilGR_NOMER: TFloatField
      DisplayLabel = #1050#1072#1088#1090#1072
      FieldName = 'GR_NOMER'
    end
    object qCardOPFilDATA_SOZDANIA: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
      FieldName = 'DATA_SOZDANIA'
    end
    object qCardOPFilDATA_NACHALA: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      FieldName = 'DATA_NACHALA'
    end
    object qCardOPFilDATA_OKONCHANIA: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FieldName = 'DATA_OKONCHANIA'
    end
    object qCardOPFilDATA_OBSL: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
      FieldName = 'DATA_OBSL'
    end
    object qCardOPFilSUMMA_ZA_CHTO: TFloatField
      DisplayLabel = #1051#1080#1090#1088#1099
      FieldName = 'SUMMA_ZA_CHTO'
    end
    object qCardOPFilCARD_USER: TStringField
      FieldName = 'CARD_USER'
    end
  end
end
