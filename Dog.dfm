inherited DogForm: TDogForm
  Left = 307
  Top = 276
  BorderStyle = bsDialog
  Caption = #1044#1086#1075#1086#1074#1086#1088
  ClientHeight = 303
  ClientWidth = 724
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 270
    Width = 724
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Panel3: TPanel
      Left = 527
      Top = 2
      Width = 195
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbOk: TBitBtn
        Left = 8
        Top = 2
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
        Left = 104
        Top = 2
        Width = 87
        Height = 25
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 1
        OnClick = bbCancelClick
        Kind = bkCancel
      end
    end
    object pnlHelpButton: TPanel
      Left = 2
      Top = 2
      Width = 31
      Height = 29
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 1
      object OilHelpButton1: TOilHelpButton
        Left = 3
        Top = 2
        Width = 25
        Height = 25
        AllowAllUp = True
        GroupIndex = 1001
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B000000FF007B7B7B00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000FF000000FF0000FF
          FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0000FFFF00FFFFFF0000FFFF00FFFFFF007B7B7B000000FF007B7B7B00FFFF
          FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
          FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
          FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF0000FFFF00FFFF
          FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
          FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000FF007B7B7B0000FF
          FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFF
          FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000FF00FFFF
          FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FF
          FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000
          FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFF
          FF0000FFFF00FFFFFF007B7B7B007B7B7B0000FFFF00FFFFFF007B7B7B000000
          FF000000FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FF
          FF00FFFFFF0000FFFF000000FF000000FF00FFFFFF0000FFFF007B7B7B000000
          FF000000FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0000FFFF00FFFFFF000000FF000000FF007B7B7B00FFFFFF007B7B7B000000
          FF000000FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
          FF00FFFFFF0000FFFF00FFFFFF000000FF000000FF000000FF000000FF000000
          FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000FF000000FF000000FF00FFFF
          FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
          FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        AnimateTime = 200
        Lines.Strings = (
          '{12}{RED}\B'#1057#1054#1047#1044#1040#1053#1048#1045' '#1044#1054#1055'. '#1044#1054#1043#1054#1042#1054#1056#1054#1042' '#1055#1054' '#1051#1057'\D{10}'
          ''
          #1044#1083#1103' '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1081' '#1088#1072#1087#1077#1095#1072#1090#1082#1080' '#1085#1086#1084#1077#1088#1086#1074' '#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1093' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1081
          #1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1072#1084' '#1051#1057', '#1087#1086#1083#1100#1079#1091#1081#1090#1077#1089#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1084#1080' '#1087#1088#1072#1074#1080#1083#1072#1084#1080':'
          ''
          
            '- {GREEN}\B'#1087#1077#1088#1074#1099#1081' '#1076#1086#1075#1086#1074#1086#1088'\D '#1089' '#1082#1083#1080#1077#1085#1090#1086#1084' '#1086#1073#1086#1079#1085#1072#1095#1072#1081#1090#1077' '#1073#1077#1079' '#1080#1089#1087#1086#1083#1100#1079#1086#1074 +
            #1072#1085#1080#1103' '#1085#1072#1082#1083#1086#1085#1085#1086#1081' '#1095#1077#1088#1090#1099' ("\B/\b");'
          ''
          
            '- {GREEN}\B'#1074#1089#1077' '#1087#1086#1089#1083#1077#1076#1091#1102#1097#1080#1077'\D \B'#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103'\b '#1085#1072' '#1087#1086 +
            #1082#1091#1087#1082#1091' '#1053#1055
          '  '#1080#1083#1080' '#1073#1083#1072#1085#1082#1086#1074' '#1089#1084#1072#1088#1090'-'#1082#1072#1088#1090' '#1079#1072#1074#1086#1076#1080#1090#1077' '#1089' {BLUE}\B'#1085#1086#1084#1077#1088#1086#1084' '#1076#1086#1075#1086#1074#1086#1088#1072'\D'
          '  '#1080' '#1095#1077#1088#1077#1079' '#1085#1072#1082#1083#1086#1085#1085#1091#1102' '#1095#1077#1088#1090#1091' {BLUE}\B'#1085#1086#1084#1077#1088#1086#1084' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103'\D.'
          ''
          '{RED}\B'#1053#1072#1087#1088#1080#1084#1077#1088':\D'
          ' \B8879-'#1051#1057'\b    - '#1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072' {BLUE}\B8879-'#1051#1057'\D,'
          
            ' \B8879-'#1051#1057'/1\b - '#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1077' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1077' {BLUE}\B'#8470'1\D '#1082' '#1076#1086#1075#1086#1074#1086 +
            #1088#1091' {BLUE}\B8879-'#1051#1057'\D,'
          
            ' \B8879-'#1051#1057'/2\b - '#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1077' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1077' {BLUE}\B'#8470'2\D '#1082' '#1076#1086#1075#1086#1074#1086 +
            #1088#1091' {BLUE}\B8879-'#1051#1057'\D '#1080' '#1090'.'#1076'.')
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        Animate = False
        UseCurrentDir = False
        FormOrientation = fBottomToTop
        Images = MainForm.il
        ImageIndex = 0
      end
    end
    object pnlEditButton: TPanel
      Left = 33
      Top = 2
      Width = 31
      Height = 29
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 2
      object sbAdd: TSpeedButton
        Left = 3
        Top = 2
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
        Visible = False
        OnClick = sbAddClick
      end
      object sbDel: TSpeedButton
        Left = 3
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
  object nbDog: TNotebook
    Left = 0
    Top = 114
    Width = 724
    Height = 156
    Align = alClient
    PageIndex = 1
    TabOrder = 1
    object TPage
      Left = 0
      Top = 0
      Caption = 'pDogVed'
      DesignSize = (
        724
        156)
      object gbDogCard: TGroupBox
        Left = 107
        Top = 8
        Width = 449
        Height = 143
        Anchors = [akBottom]
        Caption = #1044#1086#1075#1086#1074#1086#1088#1072
        TabOrder = 0
        object Label1: TLabel
          Left = 148
          Top = 84
          Width = 108
          Height = 13
          Caption = #1076#1085#1077#1081' '#1087#1086#1089#1083#1077' '#1086#1090#1075#1088#1091#1079#1082#1080'.'
        end
        object rb0: TRadioButton
          Left = 32
          Top = 54
          Width = 93
          Height = 17
          Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099':'
          TabOrder = 0
          OnClick = rb0Click
        end
        object rb1: TRadioButton
          Left = 32
          Top = 82
          Width = 57
          Height = 17
          Caption = #1063#1077#1088#1077#1079
          TabOrder = 1
          OnClick = rb1Click
        end
        object rb2: TRadioButton
          Left = 32
          Top = 110
          Width = 241
          Height = 17
          Caption = #1042' '#1087#1077#1088#1074#1099#1081' '#1076#1077#1085#1100' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072'.'
          TabOrder = 2
          OnClick = rb2Click
        end
        object dbed1: TDBEdit
          Left = 96
          Top = 81
          Width = 38
          Height = 21
          Ctl3D = True
          DataField = 'PAY_CORR'
          DataSource = DogRefForm.ds
          Enabled = False
          MaxLength = 4
          ParentCtl3D = False
          TabOrder = 3
        end
        object dbde0: TDBDateEdit
          Left = 125
          Top = 52
          Width = 121
          Height = 21
          DataField = 'EXP_DATE'
          DataSource = DogRefForm.ds
          DirectInput = False
          NumGlyphs = 2
          TabOrder = 4
        end
        object rb3: TRadioButton
          Left = 32
          Top = 26
          Width = 113
          Height = 17
          Caption = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1072
          Checked = True
          TabOrder = 5
          TabStop = True
          OnClick = rb3Click
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'pDogTalon'
      object dbgDogDetail: TDBGridEh
        Left = 0
        Top = 0
        Width = 724
        Height = 156
        Align = alClient
        DataSource = dsDogDetail
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
        HorzScrollBar.Visible = False
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
        VertScrollBar.VisibleMode = sbAlwaysShowEh
        OnEditButtonClick = dbgDogDetailEditButtonClick
        OnExit = dbgDogDetailExit
        Columns = <
          item
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'NPNAME'
            Footer.FieldName = 'NPNAME'
            Footer.ValueType = fvtCount
            Footers = <>
            ReadOnly = True
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'COUNT_'
            Footer.FieldName = 'COUNT_'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'PRICE2'
            Footers = <>
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            Width = 55
          end
          item
            Color = 15658991
            EditButtons = <>
            FieldName = 'SUMM_X_NDS'
            Footer.FieldName = 'SUMM_X_NDS'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 80
          end
          item
            Color = 15658991
            EditButtons = <>
            FieldName = 'SUMM_NDS'
            Footer.FieldName = 'SUMM_NDS'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 80
          end
          item
            Color = 15658991
            EditButtons = <>
            FieldName = 'SUM_NN'
            Footer.FieldName = 'SUM_NN'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 80
          end
          item
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'DIM_NAME'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1045#1076'. '#1080#1079#1084'.'
            Width = 50
          end
          item
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'NPBNAME'
            Footers = <>
            ReadOnly = True
            Width = 100
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'pDogService'
      object dbgDogService: TDBGridEh
        Left = 0
        Top = 0
        Width = 724
        Height = 156
        Align = alClient
        DataSource = dsDogService
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
        HorzScrollBar.Visible = False
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
        VertScrollBar.VisibleMode = sbAlwaysShowEh
        OnEditButtonClick = dbgDogServiceEditButtonClick
        OnExit = dbgDogServiceExit
        Columns = <
          item
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'NAME'
            Footer.ValueType = fvtCount
            Footers = <>
            ReadOnly = True
            Width = 212
          end
          item
            EditButtons = <>
            FieldName = 'COUNT_'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'PRICE2'
            Footers = <>
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            Width = 55
          end
          item
            Color = 15658991
            EditButtons = <>
            FieldName = 'SUMM_X_NDS'
            Footer.FieldName = 'SUMM_X_NDS'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 80
          end
          item
            Color = 15658991
            EditButtons = <>
            FieldName = 'SUMM_NDS'
            Footer.FieldName = 'SUMM_NDS'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 80
          end
          item
            Color = 15658991
            EditButtons = <>
            FieldName = 'SUM_NN'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Width = 80
          end
          item
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'DIMNAME'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1045#1076'. '#1080#1079#1084'.'
            Width = 50
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object pData: TPanel
    Left = 0
    Top = 0
    Width = 724
    Height = 114
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 136
      Top = 12
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object Label3: TLabel
      Left = 272
      Top = 12
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1072#1090#1072
    end
    object lFrom: TLabel
      Left = 8
      Top = 46
      Width = 61
      Height = 13
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082':'
    end
    object lTo: TLabel
      Left = 8
      Top = 69
      Width = 62
      Height = 13
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100':'
    end
    object lFrom_RS: TLabel
      Left = 359
      Top = 46
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = #1056#1072#1089'.'#1089#1095#1077#1090
    end
    object MFO: TLabel
      Left = 502
      Top = 46
      Width = 28
      Height = 13
      Caption = #1052#1060#1054
    end
    object lTo_Rs: TLabel
      Left = 359
      Top = 69
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = #1056#1072#1089'.'#1089#1095#1077#1090
      Transparent = True
      Layout = tlCenter
    end
    object Label8: TLabel
      Left = 502
      Top = 69
      Width = 28
      Height = 13
      Caption = #1052#1060#1054
    end
    object dbtFromRS: TDBText
      Left = 405
      Top = 46
      Width = 94
      Height = 13
      DataField = 'From_Rach_Chet'
      DataSource = DogRefForm.ds
    end
    object dbtToRS: TDBText
      Left = 405
      Top = 69
      Width = 94
      Height = 13
      DataField = 'To_Rach_Chet'
      DataSource = DogRefForm.ds
    end
    object dbtFromMFO: TDBText
      Left = 533
      Top = 46
      Width = 61
      Height = 13
      AutoSize = True
      DataField = 'From_MFO'
      DataSource = DogRefForm.ds
    end
    object dbtToMFO: TDBText
      Left = 533
      Top = 69
      Width = 51
      Height = 13
      AutoSize = True
      DataField = 'To_MFO'
      DataSource = DogRefForm.ds
    end
    object sbAuto: TSpeedButton
      Left = 246
      Top = 9
      Width = 24
      Height = 21
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1085#1086#1084#1077#1088
      AllowAllUp = True
      GroupIndex = 1
      Down = True
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
      OnClick = sbAutoClick
    end
    object LblPayDays: TLabel
      Left = 389
      Top = 12
      Width = 74
      Height = 13
      Caption = #1044#1085#1077#1081' '#1082' '#1086#1087#1083#1072#1090#1077
    end
    object IBill: TLabel
      Left = 8
      Top = 93
      Width = 26
      Height = 13
      Caption = #1057#1095#1077#1090':'
    end
    object sbBillAuto: TSpeedButton
      Left = 201
      Top = 89
      Width = 24
      Height = 21
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1085#1086#1084#1077#1088
      AllowAllUp = True
      GroupIndex = 1
      Enabled = False
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
    end
    object Label4: TLabel
      Left = 229
      Top = 93
      Width = 11
      Height = 13
      Alignment = taRightJustify
      Caption = #1086#1090
    end
    object gbDogType: TGroupBox
      Left = 2
      Top = 1
      Width = 127
      Height = 33
      Caption = #1042#1080#1076' '#1076#1086#1075#1086#1074#1086#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      object lMode: TLabel
        Left = 11
        Top = 14
        Width = 29
        Height = 13
        Caption = 'lMode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object gbForePay: TGroupBox
      Left = 621
      Top = 48
      Width = 99
      Height = 40
      Caption = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1072
      TabOrder = 9
      object rbForePayYes: TRadioButton
        Left = 10
        Top = 21
        Width = 41
        Height = 13
        Caption = #1044#1072
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbForePayYesClick
      end
      object rbForePayNo: TRadioButton
        Left = 55
        Top = 21
        Width = 41
        Height = 13
        Caption = #1053#1077#1090
        TabOrder = 1
        OnClick = rbForePayNoClick
      end
    end
    object dbeDog: TDBEdit
      Left = 189
      Top = 9
      Width = 56
      Height = 21
      Color = clBtnFace
      DataField = 'DOG'
      DataSource = DogRefForm.ds
      TabOrder = 4
      OnChange = dbeDogChange
    end
    object dbdeDogDate: TDBDateEdit
      Left = 301
      Top = 9
      Width = 86
      Height = 21
      DataField = 'DOG_DATE'
      DataSource = DogRefForm.ds
      NumGlyphs = 2
      TabOrder = 5
      OnChange = dbdeDogDateChange
    end
    object dbdePayDate: TDBDateEdit
      Left = 526
      Top = 9
      Width = 86
      Height = 21
      DataField = 'EXP_DATE'
      DataSource = DogRefForm.ds
      Enabled = False
      NumGlyphs = 2
      TabOrder = 7
      OnChange = dbdePayDateChange
    end
    object dbceToName: TRxDBComboEdit
      Left = 76
      Top = 66
      Width = 253
      Height = 21
      DataField = 'To_Name'
      DataSource = DogRefForm.ds
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = dbceToNameButtonClick
      OnChange = dbceToNameChange
      OnDblClick = dbceToNameButtonClick
      OnKeyPress = dbceShareKeyPress
    end
    object dbceFromName: TRxDBComboEdit
      Left = 76
      Top = 42
      Width = 253
      Height = 21
      DataField = 'From_Name'
      DataSource = DogRefForm.ds
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = dbceFromNameButtonClick
      OnDblClick = dbceFromNameButtonClick
      OnKeyPress = dbceShareKeyPress
    end
    object nbAdditionType: TNotebook
      Left = 615
      Top = 1
      Width = 109
      Height = 49
      TabOrder = 8
      object TPage
        Left = 0
        Top = 0
        Caption = 'atCardTypes'
        object gbCardScheme: TGroupBox
          Left = 6
          Top = 0
          Width = 99
          Height = 41
          Caption = #1057#1093#1077#1084#1072
          TabOrder = 0
          object rbEK: TRadioButton
            Left = 10
            Top = 19
            Width = 41
            Height = 13
            Caption = #1069#1050
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = rbEKClick
          end
          object rbLS: TRadioButton
            Left = 52
            Top = 19
            Width = 41
            Height = 13
            Caption = #1051#1057
            TabOrder = 1
            OnClick = rbLSClick
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'atTransportTypes'
        object gbTransportType: TGroupBox
          Left = 6
          Top = -3
          Width = 99
          Height = 49
          TabOrder = 0
          object rbSelfTransport: TRadioButton
            Left = 7
            Top = 8
            Width = 85
            Height = 13
            Caption = #1057#1072#1084#1086#1074#1099#1074#1086#1079
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = rbSelfTransportClick
          end
          object rbDelivery: TRadioButton
            Left = 7
            Top = 21
            Width = 85
            Height = 13
            Caption = #1044#1086#1089#1090#1072#1074#1082#1072
            TabOrder = 1
            OnClick = rbDeliveryClick
          end
          object rbBetweenFil: TRadioButton
            Left = 7
            Top = 34
            Width = 84
            Height = 13
            Caption = #1047#1072#1103#1074#1082#1072
            TabOrder = 2
            OnClick = rbBetweenFilClick
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'atEmpty'
      end
    end
    object sePayDays: TRxSpinEdit
      Left = 467
      Top = 9
      Width = 57
      Height = 21
      TabOrder = 6
      OnChange = sePayDaysChange
    end
    object dbceBill: TRxDBComboEdit
      Left = 76
      Top = 90
      Width = 125
      Height = 21
      DataField = 'BILL_DOG'
      DataSource = DogRefForm.ds
      DirectInput = False
      Enabled = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
      OnKeyPress = dbceShareKeyPress
    end
    object pShare: TPanel
      Left = 359
      Top = 89
      Width = 362
      Height = 24
      BevelOuter = bvNone
      TabOrder = 10
      Visible = False
      object lShare: TLabel
        Left = 0
        Top = 3
        Width = 34
        Height = 13
        Caption = #1040#1082#1094#1080#1103':'
      end
      object sbShare: TSpeedButton
        Left = 337
        Top = 0
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
        OnClick = sbShareClick
      end
      object dbceShare: TRxDBComboEdit
        Left = 44
        Top = 1
        Width = 292
        Height = 21
        DataField = 'SHARE_NAME'
        DataSource = DogRefForm.ds
        DirectInput = False
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 0
        OnButtonClick = dbceShareButtonClick
        OnDblClick = dbceShareButtonClick
        OnKeyPress = dbceShareKeyPress
      end
    end
    object dbdeBillDate: TDBDateEdit
      Left = 243
      Top = 89
      Width = 86
      Height = 21
      DataField = 'BILL_DATE'
      DataSource = DogRefForm.ds
      Enabled = False
      NumGlyphs = 2
      TabOrder = 3
      OnChange = dbdeDogDateChange
    end
  end
  object dsDogDetail: TOraDataSource
    DataSet = qDogDetail
    Left = 37
    Top = 141
  end
  object qDogDetail: TOilQuery
    SQL.Strings = (
      'select dog_det.*,'
      '       nn_sum as sum_nn,'
      '       nn_count as count_,'
      '       nn_sum as nds_t,'
      '       nnAll.np_id as np_id'
      '  from (select d.*,'
      '               NP.NAME as NPNAME,'
      '               NP.NP_GRP as NPGRP_ID,'
      '               NPB.NAME as NPBNAME,'
      '               DM.NAME DIM_NAME,'
      '               np.petrol_id,'
      '               np.id np_id'
      '          from OIL_DOG_DETAIL  d,'
      '               v_OIL_NP_TYPE   NP,'
      '               v_OIL_NP_TYPE   NPB,'
      '               v_OIL_DIMENSION DM'
      '         where d.STATE = '#39'Y'#39
      '           and d.DOG_ID = :id'
      '           and d.DOG_INST = :inst'
      '           and d.NP_TYPE = NP.ID(+)'
      '           and d.BARTERNP = NPB.ID(+)'
      '           and d.DIM_ID = DM.ID(+)) dog_det,'
      '       (select sum(b.nds_t) as nn_sum,'
      '               sum(b.kol) as nn_count,'
      '               b.tov_id as np_id,'
      '               c.tovar_type'
      
        '          from v_oil_sale_book_det b, v_oil_sale_book_link l, oi' +
        'l_nn_cause c'
      '         where l.nn_id = b.nn_id'
      '           and l.nn_inst = b.nn_inst'
      '           and l.dog_id = :id'
      '           and l.dog_inst = :inst'
      '           and c.id = b.nn_cause_id'
      '         group by b.tov_id, c.tovar_type) nnAll,'
      '       oil_dog d'
      
        ' where decode(nnAll.tovar_type(+), 1, dog_det.npgrp_id, dog_det.' +
        'np_id) ='
      '       nnAll.np_id(+)'
      '   and d.id = dog_det.dog_id'
      '   and d.inst = dog_det.dog_inst'
      ' order by dog_det.id')
    MasterSource = DogRefForm.ds
    CachedUpdates = True
    UpdateObject = uDogDetail
    BeforePost = qDogDetailBeforePost
    AfterPost = qDogDetailAfterPost
    BeforeDelete = qDogDetailBeforeDelete
    AfterDelete = qDogDetailAfterPost
    DataSource = DogRefForm.ds
    RequestLive = False
    UpdateMode = upWhereChanged
    Left = 32
    Top = 157
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
      end
      item
        DataType = ftFloat
        Name = 'INST'
      end>
    object qDogDetailID: TFloatField
      FieldName = 'ID'
    end
    object qDogDetailDOG_ID: TFloatField
      FieldName = 'DOG_ID'
    end
    object qDogDetailDOG_INST: TFloatField
      FieldName = 'DOG_INST'
      Visible = False
    end
    object qDogDetailNP_TYPE: TFloatField
      FieldName = 'NP_TYPE'
    end
    object QDOGDETAILNPNAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1053#1055
      DisplayWidth = 20
      FieldName = 'NPNAME'
      Size = 50
    end
    object qDogDetailBARTERNP: TFloatField
      FieldName = 'BARTERNP'
      Visible = False
    end
    object qDogDetailNPBNAME: TStringField
      DisplayLabel = #1041#1072#1088#1090#1077#1088#1085#1099#1081' '#1090#1086#1074#1072#1088
      FieldName = 'NPBNAME'
      Size = 50
    end
    object qDogDetailDIM_ID: TFloatField
      FieldName = 'DIM_ID'
    end
    object qDogDetailDIM_NAME: TStringField
      DisplayLabel = #1045#1076'.'#1080#1079#1084
      FieldName = 'DIM_NAME'
      Size = 50
    end
    object qDogDetailPETROL_ID: TFloatField
      FieldName = 'PETROL_ID'
    end
    object qDogDetailPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
      DisplayWidth = 13
      FieldName = 'PRICE'
      OnChange = qDogDetailPRICEChange
      DisplayFormat = '0.##########'
    end
    object qDogDetailPRICE2: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
      FieldName = 'PRICE2'
      OnChange = qDogDetailPRICE2Change
      DisplayFormat = '0.##########'
    end
    object qDogDetailCOUNT_: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'COUNT_'
      OnChange = qDogDetailCOUNT_Change
    end
    object qDogDetailSUM_NN: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1053#1053
      FieldName = 'SUM_NN'
      DisplayFormat = '0.##'
    end
    object qDogDetailSUMM_NDS: TFloatField
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'SUMM_NDS'
      OnChange = qDogDetailSUMM_NDSChange
      DisplayFormat = '0.##'
    end
    object qDogDetailSUMM_X_NDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057
      FieldName = 'SUMM_X_NDS'
      OnChange = qDogDetailSUMM_X_NDSChange
      DisplayFormat = '0.##'
    end
  end
  object uDogDetail: TOraUpdateSQL
    ModifySQL.Strings = (
      'update OIL_DOG_DETAIL'
      '   set NP_TYPE    = :NP_TYPE,'
      '       DIM_ID     = :DIM_ID,'
      '       PRICE      = :PRICE,'
      '       PRICE2     = :PRICE2,'
      '       COUNT_     = :COUNT_,'
      '       BARTERNP   = :BARTERNP,'
      '       SUMM_NDS   = :SUMM_NDS,'
      '       SUMM_X_NDS = :SUMM_X_NDS'
      ' where ID = :OLD_ID'
      '   and DOG_INST = :OLD_DOG_INST')
    InsertSQL.Strings = (
      'insert into OIL_DOG_DETAIL'
      '  (ID,'
      '   DOG_ID,'
      '   STATE,'
      '   DOG_INST,'
      '   NP_TYPE,'
      '   DIM_ID,'
      '   PRICE,'
      '   PRICE2,'
      '   COUNT_,'
      '   BARTERNP,'
      '   SUMM_NDS,'
      '   SUMM_X_NDS)'
      'values'
      '  (:ID,'
      '   :DOG_ID,'
      '   '#39'Y'#39','
      '   :DOG_INST,'
      '   :NP_TYPE,'
      '   :DIM_ID,'
      '   :PRICE,'
      '   :PRICE2,'
      '   :COUNT_,'
      '   :BARTERNP,'
      '   :SUMM_NDS,'
      '   :SUMM_X_NDS)')
    DeleteSQL.Strings = (
      'update OIL_DOG_DETAIL'
      '   set STATE = '#39'N'#39
      ' where ID = :OLD_ID'
      '   and DOG_INST = :OLD_DOG_INST')
    Left = 106
    Top = 150
  end
  object qWork: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 664
    Top = 221
  end
  object dsDogService: TOraDataSource
    DataSet = qDogService
    Left = 40
    Top = 205
  end
  object qDogService: TOilQuery
    SQL.Strings = (
      'select dog_det.*, nn.sum_nn, nn.s_date'
      '  from (select oil_dog_detail.*,'
      '               v_oil_oper_type.name,'
      '               v_oil_dimension.name as DimName'
      '          from oil_dog_detail, v_oil_oper_type, v_oil_dimension'
      '         where OIL_DOG_DETAIL.State = '#39'Y'#39
      '           and OIL_DOG_DETAIL.Dog_Id = :id'
      '           and OIL_DOG_DETAIL.Dog_Inst = :inst'
      '           and OIL_DOG_DETAIL.np_type = v_oil_oper_type.id(+)'
      
        '           and oil_dog_detail.dim_id = v_oil_dimension.id(+)) do' +
        'g_det,'
      
        '       (select sum(SM.sum_nn) sum_nn, max(SM.s_date) s_date, SM.' +
        'tov_id'
      '          from (select nvl(sbd.nds_t, 0) sum_nn,'
      '                       sbd.tov_id tov_id,'
      '                       sbd.kol count_,'
      '                       sb.s_date s_date'
      '                  from Oil_Sale_Book     sb,'
      '                       Oil_sale_book_det sbd,'
      '                       oil_dog           dog,'
      '                       oil_service       s'
      '                 where sb.id = sbd.nn_id(+)'
      '                   and sb.inst = sbd.nn_inst(+)'
      '                   and sb.state = '#39'Y'#39
      '                   and sbd.state(+) = '#39'Y'#39
      '                   and dog.id = :id'
      '                   and dog.inst = :inst'
      '                   and sb.id = s.nn_id'
      '                   and sb.inst = s.nn_inst'
      '                   and dog.id = s.dog_id'
      '                   and dog.inst = s.dog_inst'
      '                Union all'
      '                select nvl(sbd.nds_t, 0) sum_nn,'
      '                       sbd.tov_id tov_id,'
      '                       sbd.kol count_,'
      '                       sb.s_date s_date'
      '                  from Oil_Sale_Book     sb,'
      '                       Oil_sale_book_det sbd,'
      '                       oil_dog           dog,'
      '                       oil_money         m'
      '                 where sb.id = sbd.nn_id(+)'
      '                   and sb.inst = sbd.nn_inst(+)'
      '                   and sb.state = '#39'Y'#39
      '                   and sbd.state(+) = '#39'Y'#39
      '                   and dog.id = :id'
      '                   and dog.inst = :inst'
      '                   and sb.id = m.nn_id'
      '                   and sb.inst = m.nn_inst'
      '                   and dog.id = m.dog_id'
      '                   and dog.inst = m.dog_inst) SM'
      '         group by SM.tov_id) nn'
      ' where dog_det.np_type = nn.tov_id(+)'
      ' order by dog_det.id')
    MasterSource = DogRefForm.ds
    CachedUpdates = True
    UpdateObject = uDogService
    BeforePost = qDogServiceBeforePost
    AfterPost = qDogServiceAfterPost
    AfterDelete = qDogServiceAfterPost
    DataSource = DogRefForm.ds
    RequestLive = False
    UpdateMode = upWhereChanged
    Left = 32
    Top = 221
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id'
      end
      item
        DataType = ftUnknown
        Name = 'Inst'
      end
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
    object qDogServiceID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_DOG_DETAIL.ID'
    end
    object qDogServiceDOG_ID: TFloatField
      FieldName = 'DOG_ID'
      Origin = 'OIL_DOG_DETAIL.DOG_ID'
    end
    object qDogServiceDOG_INST: TFloatField
      FieldName = 'DOG_INST'
      Origin = 'OIL_DOG_DETAIL.DOG_INST'
    end
    object qDogServiceNP_TYPE: TFloatField
      FieldName = 'NP_TYPE'
      Origin = 'OIL_DOG_DETAIL.NP_TYPE'
    end
    object qDogServiceNAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1091#1089#1083#1091#1075#1080
      FieldName = 'NAME'
      Origin = 'OIL_OPER_TYPE.NAME'
      Size = 50
    end
    object qDogServiceDIM_ID: TFloatField
      FieldName = 'DIM_ID'
      Origin = 'OIL_DOG_DETAIL.DIM_ID'
    end
    object qDogServiceDIMNAME: TStringField
      FieldName = 'DIMNAME'
      Size = 50
    end
    object qDogServicePRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
      FieldName = 'PRICE'
      Origin = 'OIL_DOG_DETAIL.PRICE'
      OnChange = qDogServicePRICEChange
      DisplayFormat = '0.##########'
    end
    object qDogServicePRICE2: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
      FieldName = 'PRICE2'
      Origin = 'OIL_DOG_DETAIL.PRICE2'
      OnChange = qDogServicePRICE2Change
      DisplayFormat = '0.##########'
    end
    object qDogServiceCOUNT_: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'COUNT_'
      Origin = 'OIL_DOG_DETAIL.COUNT_'
      OnChange = qDogServiceCOUNT_Change
    end
    object qDogServiceSUM_NN: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1053#1053
      FieldName = 'SUM_NN'
      DisplayFormat = '0.##'
    end
    object qDogServiceSUMM_NDS: TFloatField
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'SUMM_NDS'
      DisplayFormat = '0.##'
    end
    object qDogServiceSUMM_X_NDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057
      FieldName = 'SUMM_X_NDS'
      DisplayFormat = '0.##'
    end
  end
  object uDogService: TOraUpdateSQL
    ModifySQL.Strings = (
      'update OIL_DOG_DETAIL'
      '   set NP_TYPE    = :NP_TYPE,'
      '       PRICE      = :PRICE,'
      '       PRICE2     = :PRICE2,'
      '       COUNT_     = :COUNT_,'
      '       DIM_ID     = :DIM_ID,'
      '       SUMM_NDS   = :SUMM_NDS,'
      '       SUMM_X_NDS = :SUMM_X_NDS'
      ' where ID = :OLD_ID'
      '   and DOG_INST = :OLD_DOG_INST')
    InsertSQL.Strings = (
      'insert into OIL_DOG_DETAIL'
      '  (ID,'
      '   DOG_ID,'
      '   STATE,'
      '   DOG_INST,'
      '   NP_TYPE,'
      '   PRICE,'
      '   PRICE2,'
      '   COUNT_,'
      '   DIM_ID,'
      '   SUMM_NDS,'
      '   SUMM_X_NDS)'
      'values'
      '  (:ID,'
      '   :DOG_ID,'
      '   '#39'Y'#39','
      '   :DOG_INST,'
      '   :NP_TYPE,'
      '   :PRICE,'
      '   :PRICE2,'
      '   :COUNT_,'
      '   :DIM_ID,'
      '   :SUMM_NDS,'
      '   :SUMM_X_NDS)')
    DeleteSQL.Strings = (
      'update OIL_DOG_DETAIL'
      '   set STATE = '#39'N'#39
      ' where ID = :OLD_ID'
      '   and DOG_INST = :OLD_DOG_INST')
    Left = 108
    Top = 212
  end
  object qryCardRecalc: TOilQuery
    SQLInsert.Strings = (
      'INSERT INTO CARD_TO_RECALC'
      '     ('
      '      CARD_NUMBER,'
      '      INST,'
      '      NP_TYPE,'
      '      DATE_,'
      '      TIME_,'
      '      SHEMA_TYPE'
      '     )'
      '     VALUES'
      '     ('
      '      :TO_ID,'
      '      :To_INST,'
      '      :NP_TYPE,'
      '       NULL,'
      '       NULL,'
      '      1'
      '     )')
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select'
      '  CARD_NUMBER as To_id,'
      '  INST as TO_Inst,'
      '  NP_TYPE'
      'from card_to_recalc')
    CachedUpdates = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 608
    Top = 221
  end
end
