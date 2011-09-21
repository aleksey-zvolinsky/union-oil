inherited DogRefForm: TDogRefForm
  Left = 246
  Top = 309
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' - '#1044#1086#1075#1086#1074#1086#1088#1072' '#1082#1091#1087#1083#1080'-'#1087#1088#1086#1076#1072#1078#1080
  ClientHeight = 392
  ClientWidth = 752
  Constraints.MinHeight = 418
  Constraints.MinWidth = 760
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 359
    Width = 752
    TabOrder = 1
    inherited Panel3: TPanel
      Left = 555
    end
    inherited PAdd: TPanel
      Width = 47
      inherited sbAdd: TSpeedButton
        OnClick = sbAddClick
      end
      object sbAddDog: TRxSpeedButton
        Left = 29
        Top = 2
        Width = 14
        Height = 25
        DropDownMenu = pmAddDog
      end
    end
    inherited PEdit: TPanel
      Left = 49
    end
    inherited pDel: TPanel
      Left = 79
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      Left = 159
      inherited bbClear: TBitBtn
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
    inherited pPrint: TPanel
      Left = 109
      Visible = True
    end
    inherited pTotal: TPanel
      Left = 325
    end
    inherited pSpeedUp: TPanel
      Left = 355
    end
    inherited pShowDetail: TPanel
      Left = 385
      Width = 170
    end
  end
  inherited Panel2: TPanel
    Width = 752
    Height = 83
    ParentBiDiMode = False
    TabOrder = 0
    object Label2: TLabel
      Left = 606
      Top = 11
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1044#1086#1075#1086#1074#1086#1088
    end
    object lFrom: TLabel
      Left = 312
      Top = 10
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    end
    object lTo: TLabel
      Left = 311
      Top = 35
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
    end
    object sbFromClear: TSpeedButton
      Left = 578
      Top = 5
      Width = 21
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
      OnClick = sbFromClearClick
    end
    object sbToClear: TSpeedButton
      Left = 578
      Top = 30
      Width = 21
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
      OnClick = sbToClearClick
    end
    object lblPay: TLabel
      Left = 613
      Top = 36
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1054#1087#1083#1072#1090#1072
    end
    object sbPayClear: TSpeedButton
      Left = 729
      Top = 31
      Width = 22
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
      OnClick = sbPayClearClick
    end
    object Label1: TLabel
      Left = 332
      Top = 61
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = #1058#1080#1087' '#1053#1055
    end
    object sbNPTypeClear: TSpeedButton
      Left = 578
      Top = 55
      Width = 21
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
      OnClick = sbNPTypeClearClick
    end
    object Label3: TLabel
      Left = 194
      Top = 36
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = #1087#1086
    end
    object Label5: TLabel
      Left = 171
      Top = 11
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1072#1090#1072' '#1089
    end
    object edDog: TEdit
      Left = 653
      Top = 7
      Width = 74
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
    end
    object eFrom: TComboEdit
      Left = 372
      Top = 7
      Width = 205
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = eFromButtonClick
      OnDblClick = eFromButtonClick
    end
    object eTo: TComboEdit
      Left = 372
      Top = 31
      Width = 205
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = eToButtonClick
      OnDblClick = eToButtonClick
    end
    object eDate: TDateEdit
      Left = 209
      Top = 7
      Width = 87
      Height = 21
      CheckOnExit = True
      ButtonWidth = 15
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
    end
    object Panel5: TPanel
      Left = 5
      Top = 3
      Width = 164
      Height = 73
      BevelOuter = bvNone
      TabOrder = 0
      object gbDogType: TGroupBox
        Left = 0
        Top = 0
        Width = 160
        Height = 71
        Caption = #1042#1080#1076' '#1076#1086#1075#1086#1074#1086#1088#1072':'
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        object rbYes: TRadioButton
          Left = 7
          Top = 34
          Width = 66
          Height = 13
          Caption = #1058#1072#1083#1086#1085#1099
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnClick = rbYesClick
        end
        object rbNo: TRadioButton
          Left = 7
          Top = 18
          Width = 73
          Height = 13
          Caption = #1054#1073#1099#1095#1085#1099#1081
          Checked = True
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = rbNoClick
        end
        object rbKart: TRadioButton
          Left = 7
          Top = 49
          Width = 72
          Height = 16
          Caption = #1050#1072#1088#1090#1086#1095#1082#1080
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          OnClick = rbKartClick
        end
        object rbVed: TRadioButton
          Left = 79
          Top = 19
          Width = 78
          Height = 13
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          OnClick = rbVedClick
        end
        object rbService: TRadioButton
          Left = 79
          Top = 36
          Width = 69
          Height = 15
          Caption = #1059#1089#1083#1091#1075#1080
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
          OnClick = rbServiceClick
        end
      end
    end
    object cbPay: TComboBox
      Left = 653
      Top = 31
      Width = 77
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 6
      Items.Strings = (
        #1055#1086#1089#1083#1077#1086#1087#1083#1072#1090#1072
        #1055#1088#1077#1076#1086#1087#1083#1072#1090#1072)
    end
    object eNPType: TComboEdit
      Left = 372
      Top = 56
      Width = 205
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 7
      OnButtonClick = eNPTypeButtonClick
      OnDblClick = eNPTypeButtonClick
    end
    object eToDate: TDateEdit
      Left = 209
      Top = 32
      Width = 87
      Height = 21
      CheckOnExit = True
      ButtonWidth = 15
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 2
    end
    object NotebookSubType: TNotebook
      Left = 613
      Top = 54
      Width = 138
      Height = 26
      Anchors = [akTop, akRight]
      PageIndex = 1
      TabOrder = 8
      object TPage
        Left = 0
        Top = 0
        Caption = 'CardShema'
        object lblScheme: TLabel
          Left = 5
          Top = 6
          Width = 32
          Height = 13
          Caption = #1057#1093#1077#1084#1072
        end
        object sbSchemeClear: TSpeedButton
          Left = 116
          Top = 2
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
          OnClick = sbSchemeClearClick
        end
        object cbScheme: TComboBox
          Left = 40
          Top = 2
          Width = 77
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            #1069#1050
            #1051#1057)
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'NDogType'
        object LblNType: TLabel
          Left = 17
          Top = 6
          Width = 19
          Height = 13
          Caption = #1058#1080#1087
        end
        object sbClearNType: TSpeedButton
          Left = 116
          Top = 2
          Width = 21
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
          OnClick = sbClearNTypeClick
        end
        object cbNType: TComboBox
          Left = 40
          Top = 2
          Width = 77
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            #1044#1086#1089#1090#1072#1074#1082#1072
            #1057#1072#1084#1086#1074#1099#1074#1086#1079
            #1047#1072#1103#1074#1082#1072)
        end
      end
    end
  end
  inherited pBase: TPanel
    Top = 93
    Width = 602
    Height = 266
    inherited SplitterDetail: TSplitter
      Top = 136
      Width = 602
    end
    inherited DBGrid1: TDBGridEh
      Width = 602
      Height = 136
      ParentCtl3D = False
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DOG'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'DOG_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Title.SortIndex = 1
          Title.SortMarker = smDownEh
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'FROM_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1054#1090' '#1082#1086#1075#1086
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'TO_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1084#1091
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'EXP_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'FOREPAY_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1072
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'SUB_TYPE_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1072
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'SHARE_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1040#1082#1094#1080#1103
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'RN_NUM'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1056#1053
          Width = 50
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'RN_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1056#1053
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'BILL_DOG'
          Footers = <>
          Title.Alignment = taCenter
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'BILL_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Width = 70
        end>
    end
    inherited pDetail: TPanel
      Top = 214
      Width = 602
      TabOrder = 2
      inherited DBGridDetail: TDBGridEh
        Width = 602
      end
    end
    object nbDetail: TNotebook
      Left = 0
      Top = 139
      Width = 602
      Height = 75
      Align = alBottom
      TabOrder = 1
      object TPage
        Left = 0
        Top = 0
        Caption = 'TalonDetail'
        object dbgDogDetail: TDBGridEh
          Left = 0
          Top = 0
          Width = 602
          Height = 75
          Align = alClient
          DataSource = dsDogDetail
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          ReadOnly = True
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
              FieldName = 'NPNAME'
              Footers = <>
              Title.Alignment = taCenter
              Width = 110
            end
            item
              EditButtons = <>
              FieldName = 'COUNT_'
              Footers = <>
              Title.Alignment = taCenter
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'PRICE2'
              Footers = <>
              Title.Alignment = taCenter
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'PRICE'
              Footers = <>
              Title.Alignment = taCenter
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'SUMM_X_NDS'
              Footers = <>
              Title.Alignment = taCenter
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'SUMM_NDS'
              Footers = <>
              Title.Alignment = taCenter
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'DIM_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1045#1076'. '#1080#1079#1084'.'
              Width = 50
            end
            item
              ButtonStyle = cbsEllipsis
              EditButtons = <>
              FieldName = 'NPBNAME'
              Footers = <>
              Title.Alignment = taCenter
              Width = 100
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'ServiceDetail'
        object dbgServiceDetail: TDBGridEh
          Left = 0
          Top = 0
          Width = 602
          Height = 75
          Align = alClient
          DataSource = dsServiceDetail
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          ReadOnly = True
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
              FieldName = 'SERVICE_NAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1042#1080#1076' '#1091#1089#1083#1091#1075#1080
              Width = 212
            end
            item
              EditButtons = <>
              FieldName = 'COUNT_'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'PRICE2'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'PRICE'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'SUMM_X_NDS'
              Footers = <>
              Title.Alignment = taCenter
              Width = 88
            end
            item
              EditButtons = <>
              FieldName = 'SUMM_NDS'
              Footers = <>
              Title.Alignment = taCenter
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'DIMNAME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1045#1076'. '#1080#1079#1084'.'
              Width = 50
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 752
    TabOrder = 2
    inherited pnlTuneGridBtn: TPanel
      Left = 723
      inherited sbCol: TSpeedButton
        Left = 4
      end
    end
  end
  inherited PanelCol: TPanel
    Left = 602
    Top = 93
    Height = 266
    inherited cbCol: TRxCheckListBox
      Height = 238
    end
    inherited pRefresh: TPanel
      Top = 240
    end
  end
  inherited ds: TOraDataSource
    OnDataChange = dsDataChange
    Left = 25
    Top = 135
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select dog.Id,'
      '       dog.State,'
      '       dog.Inst,'
      '       dog.Dog,'
      '       dog.Dog_Date,'
      '       dog.Exp_Date,'
      '       dog.From_,'
      '       dog.From_Inst,'
      '       From_Org.par as from_par_id,'
      '       From_Org.par_inst as from_par_inst,'
      '       dog.To_,'
      '       dog.To_Inst,'
      '       dog.Comm,'
      '       dog.Dog_Type,'
      '       dog.r_From_,'
      '       dog.r_From_Inst,'
      '       dog.r_To_,'
      '       dog.r_To_Inst,'
      '       dog.Date_Mod,'
      '       dog.Forepay,'
      '       decode(dog.Forepay,'
      
        '              0, decode(ov.language, 0, '#39#1087#1086#1089#1083#1077#1086#1087#1083#1072#1090#1072#39', 1, '#39#1087#1110#1089#1083#1103 +
        #1074#1080#1087#1083#1072#1090#1072#39'),'
      
        '              decode(ov.language, 0, '#39#1087#1088#1077#1076#1086#1087#1083#1072#1090#1072#39', 1, '#39#1087#1077#1088#1077#1076#1074#1080#1087#1083 +
        #1072#1090#1072#39')) Forepay_Name,'
      '       dog.Pay_Type,'
      '       dog.Pay_Corr,'
      '       dog.Sub_Type,'
      '       decode(dog.Dog_Type,'
      
        '              '#39'K'#39', decode(dog.Sub_Type, 101, '#39#1051#1057#39', decode(ov.lan' +
        'guage, 0, '#39#1069#1050#39', 1, '#39#1045#1050#39')),'
      '              decode(dog.Sub_Type,'
      
        '                     10, decode(ov.language, 0, '#39#1089#1072#1084#1086#1074#1099#1074#1086#1079#39', 1, ' +
        #39#1089#1072#1084#1086#1074#1080#1074#1110#1079#39'),'
      '                     11, '#39#1076#1086#1089#1090#1072#1074#1082#1072#39','
      '                     12, '#39#1079#1072#1103#1074#1082#1072#39','
      '                     dog.Sub_Type)) Sub_Type_Name,'
      '       From_Org.Name as From_Name,'
      '       From_Org.Addr as From_Addr,'
      '       From_Org.Svid_Num as From_Svid_Num,'
      '       From_Org.Nal_Num as From_Nal_Num,'
      '       From_Org.Boss as From_Boss,'
      '       From_Org.Boss_Post as From_Boss_Post,'
      '       From_Org.Id_Num as From_OKPO,'
      '       From_Org.Phone as From_Phone,'
      '       From_Org.org_type as From_Type,'
      '       From_Rekv.Rach_Chet as From_Rach_Chet,'
      '       From_Rekv.Rach_Chet_NDS as From_Rach_Chet_NDS,'
      '       From_Bank.Name as From_Bank_Name,'
      '       From_Bank.MFO as From_MFO,'
      '       To_Org.Name as To_Name,'
      '       To_Org.Addr as To_Addr,'
      '       To_Org.Svid_Num as To_Svid_Num,'
      '       To_Org.Nal_Num as To_Nal_Num,'
      '       To_Org.Boss as To_Boss,'
      '       To_Org.Boss_Post as To_Boss_Post,'
      '       To_Org.Id_Num as To_OKPO,'
      '       To_Org.Phone as To_Phone,'
      '       To_Rekv.Rach_Chet as To_Rach_Chet,'
      '       To_Rekv.Rach_Chet_NDS as To_Rach_Chet_NDS,'
      '       To_Bank.Name as To_Bank_Name,'
      '       To_Bank.MFO as To_MFO,'
      '       To_Org.Face as To_Face,'
      '       To_Org.Passport_ser as Passp_Ser,'
      '       To_Org.Passport_num as Passp_Num,'
      '       To_Org.Passport_whom as Passp_whom,'
      '       To_Org.Passport_when as Passp_when,'
      '       From_Org.Dogovor as From_Dogovor,'
      '       To_Org.Dogovor as To_Dogovor,'
      '       rn.var_text as rn_num,'
      '       rn.var_date as rn_date,'
      '       rn.dov_ser,'
      '       rn.dov_date,'
      '       rn.dov_num,'
      '       rn.dov_who,'
      '       rn.var_number as card_price,'
      '       rn.id as rn_id,'
      '       rn.inst as rn_inst,'
      '       dog.share_id,'
      '       s.name as share_name,'
      '       bill.Id as Bill_Id,'
      '       bill.Inst as Bill_Inst,'
      '       bill.doc_number as bill_dog,'
      '       bill.date_ as bill_date,'
      
        '       trunc((sysdate - bill.date_create) * 24 * 60) as bill_min' +
        'ute'
      '  from OIL_DOG        dog,'
      '       V_Org          From_Org,'
      '       V_Oil_Rekvizit From_Rekv,'
      '       V_Oil_Bank     From_Bank,'
      '       V_Org          To_Org,'
      '       V_Oil_Rekvizit To_Rekv,'
      '       Oil_Rash_Nak   rn,'
      '       V_Oil_Bank     To_Bank,'
      '       Oil_Share      s,'
      '       Oil_Bill       bill'
      ' where dog.State = '#39'Y'#39
      '   and dog.From_ = From_Org.Id'
      '   and dog.From_Inst = From_Org.Inst'
      '   and dog.R_From_ = From_Rekv.Id(+)'
      '   and dog.R_From_Inst = From_Rekv.Inst(+)'
      '   and From_Rekv.Id_Bank = From_Bank.Id(+)'
      '   and From_Rekv.Bank_Inst = From_Bank.Inst(+)'
      '   and dog.To_ = To_Org.Id'
      '   and dog.To_Inst = To_Org.Inst'
      '   and dog.R_To_ = To_Rekv.Id(+)'
      '   and dog.R_To_Inst = To_Rekv.Inst(+)'
      '   and To_Rekv.Id_Bank = To_Bank.Id(+)'
      '   and To_Rekv.Bank_Inst = To_Bank.Inst(+)'
      '   and To_Rekv.Bank_Inst = To_Bank.Inst(+)'
      '   and dog.id = rn.source_id(+)'
      '   and dog.inst = rn.source_inst(+)'
      '   and to_number(rn.rash_nak_type(+)) = 1'
      '   and rn.state(+) = '#39'Y'#39
      '   and s.state(+) = '#39'Y'#39
      '   and dog.share_id = s.id(+)'
      '   and bill.state(+) = '#39'Y'#39
      '   and dog.bill_id = bill.id(+)'
      '   and dog.bill_inst = bill.inst(+)'
      '   and (sub_type = :sub_type or :sub_type is null)'
      '   and (forepay = :forepay or :forepay is null)'
      '   and (upper(dog) like '#39'%'#39' || upper(:dog) || '#39'%'#39')'
      '   and ((dog.from_ = :from_ and dog.from_inst = :from_inst) or'
      '       (:from_ is null and :from_inst is null))'
      '   and ((dog.to_ = :to_ and dog.to_inst = :to_inst) or'
      '       (:to_ is null and :to_inst is null))'
      '   and ((dog_date between :BeginDate and :EndDate) or'
      '       (:BeginDate is null and :EndDate is null))'
      '   and (dog_type = :dog_type or :dog_type is null)'
      '   and ((:np_type is null) or'
      '       (dog.Id, dog.Inst) in'
      '       (select /*+NO_MERGE*/'
      '          dogd.Dog_Id, dogd.Dog_Inst'
      '           from OIL_DOG_DETAIL dogd'
      '          where dogd.State = '#39'Y'#39
      '            and dogd.NP_Type = :np_type))'
      '   and (dog.Id = :id or :id is null)'
      '   and (dog.Inst = :Inst or :Inst is null)'
      ' order by dog.dog_date desc, dog.id desc')
    CachedUpdates = True
    UpdateObject = u
    AfterPost = qAfterPost
    AfterDelete = qAfterPost
    OnCalcFields = qCalcFields
    Left = 16
    Top = 151
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sub_type'
      end
      item
        DataType = ftInteger
        Name = 'forepay'
      end
      item
        DataType = ftString
        Name = 'dog'
      end
      item
        DataType = ftInteger
        Name = 'from_'
      end
      item
        DataType = ftInteger
        Name = 'from_inst'
      end
      item
        DataType = ftInteger
        Name = 'to_'
      end
      item
        DataType = ftInteger
        Name = 'to_inst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end
      item
        DataType = ftString
        Name = 'dog_type'
      end
      item
        DataType = ftInteger
        Name = 'np_type'
      end
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'Inst'
      end>
    object qID: TFloatField
      FieldName = 'ID'
    end
    object qSTATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object qINST: TFloatField
      FieldName = 'INST'
    end
    object qDOG: TStringField
      FieldName = 'DOG'
      Size = 15
    end
    object qDOG_DATE: TDateTimeField
      FieldName = 'DOG_DATE'
    end
    object qEXP_DATE: TDateTimeField
      FieldName = 'EXP_DATE'
    end
    object qCOMM: TStringField
      FieldName = 'COMM'
      Size = 100
    end
    object qDOG_TYPE: TStringField
      FieldName = 'DOG_TYPE'
      Size = 1
    end
    object qFROM_: TFloatField
      FieldName = 'FROM_'
    end
    object qFROM_INST: TFloatField
      FieldName = 'FROM_INST'
    end
    object qFROM_PAR_ID: TFloatField
      FieldName = 'FROM_PAR_ID'
    end
    object qFROM_PAR_INST: TFloatField
      FieldName = 'FROM_PAR_INST'
    end
    object qFROM_NAME: TStringField
      FieldName = 'FROM_NAME'
      Size = 100
    end
    object qFROM_ADDR: TStringField
      FieldName = 'FROM_ADDR'
      Size = 200
    end
    object qFROM_SVID_NUM: TStringField
      FieldName = 'FROM_SVID_NUM'
      Size = 50
    end
    object qFROM_NAL_NUM: TStringField
      FieldName = 'FROM_NAL_NUM'
      Size = 50
    end
    object qFROM_BOSS: TStringField
      FieldName = 'FROM_BOSS'
      Size = 50
    end
    object qFROM_BOSS_POST: TStringField
      FieldName = 'FROM_BOSS_POST'
      Size = 50
    end
    object qFROM_OKPO: TStringField
      FieldName = 'FROM_OKPO'
    end
    object qFROM_PHONE: TStringField
      FieldName = 'FROM_PHONE'
      Size = 30
    end
    object qFROM_RACH_CHET: TStringField
      FieldName = 'FROM_RACH_CHET'
    end
    object qFROM_RACH_CHET_NDS: TStringField
      FieldName = 'FROM_RACH_CHET_NDS'
    end
    object qFROM_BANK_NAME: TStringField
      FieldName = 'FROM_BANK_NAME'
      Size = 50
    end
    object qFROM_MFO: TStringField
      FieldName = 'FROM_MFO'
    end
    object qFROM_TYPE: TFloatField
      FieldName = 'FROM_TYPE'
    end
    object qFROM_DOGOVOR: TStringField
      FieldName = 'FROM_DOGOVOR'
      Size = 512
    end
    object qTO_: TFloatField
      FieldName = 'TO_'
    end
    object qTO_INST: TFloatField
      FieldName = 'TO_INST'
    end
    object qTO_NAME: TStringField
      FieldName = 'TO_NAME'
      Size = 100
    end
    object qTO_ADDR: TStringField
      FieldName = 'TO_ADDR'
      Size = 200
    end
    object qTO_SVID_NUM: TStringField
      FieldName = 'TO_SVID_NUM'
      Size = 50
    end
    object qTO_NAL_NUM: TStringField
      FieldName = 'TO_NAL_NUM'
      Size = 50
    end
    object qTO_BOSS: TStringField
      FieldName = 'TO_BOSS'
      Size = 50
    end
    object qTO_BOSS_POST: TStringField
      FieldName = 'TO_BOSS_POST'
      Size = 50
    end
    object qTO_OKPO: TStringField
      FieldName = 'TO_OKPO'
    end
    object qTO_PHONE: TStringField
      FieldName = 'TO_PHONE'
      Size = 30
    end
    object qTO_RACH_CHET: TStringField
      FieldName = 'TO_RACH_CHET'
    end
    object qTO_RACH_CHET_NDS: TStringField
      FieldName = 'TO_RACH_CHET_NDS'
    end
    object qTO_BANK_NAME: TStringField
      FieldName = 'TO_BANK_NAME'
      Size = 50
    end
    object qTO_MFO: TStringField
      FieldName = 'TO_MFO'
    end
    object qTO_FACE: TFloatField
      FieldName = 'TO_FACE'
    end
    object qTO_DOGOVOR: TStringField
      FieldName = 'TO_DOGOVOR'
      Size = 512
    end
    object qR_FROM_: TFloatField
      FieldName = 'R_FROM_'
    end
    object qR_FROM_INST: TFloatField
      FieldName = 'R_FROM_INST'
    end
    object qR_TO_: TFloatField
      FieldName = 'R_TO_'
    end
    object qR_TO_INST: TFloatField
      FieldName = 'R_TO_INST'
    end
    object qDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
    end
    object qFOREPAY: TFloatField
      FieldName = 'FOREPAY'
    end
    object qPAY_TYPE: TFloatField
      FieldName = 'PAY_TYPE'
    end
    object qPAY_CORR: TFloatField
      FieldName = 'PAY_CORR'
    end
    object qSUB_TYPE: TFloatField
      FieldName = 'SUB_TYPE'
    end
    object qPASSP_NUM: TStringField
      FieldName = 'PASSP_NUM'
      Size = 6
    end
    object qPASSP_SER: TStringField
      FieldName = 'PASSP_SER'
      Size = 2
    end
    object qPASSP_WHOM: TStringField
      FieldName = 'PASSP_WHOM'
      Size = 100
    end
    object qPASSP_WHEN: TDateTimeField
      FieldName = 'PASSP_WHEN'
    end
    object qRN_NUM: TStringField
      FieldName = 'RN_NUM'
      Size = 30
    end
    object qRN_DATE: TDateTimeField
      FieldName = 'RN_DATE'
    end
    object qDOV_SER: TStringField
      FieldName = 'DOV_SER'
      Size = 10
    end
    object qDOV_DATE: TDateTimeField
      FieldName = 'DOV_DATE'
    end
    object qDOV_NUM: TStringField
      FieldName = 'DOV_NUM'
    end
    object qDOV_WHO: TStringField
      FieldName = 'DOV_WHO'
      Size = 40
    end
    object qCARD_PRICE: TFloatField
      FieldName = 'CARD_PRICE'
    end
    object qRN_ID: TFloatField
      FieldName = 'RN_ID'
    end
    object qRN_INST: TFloatField
      FieldName = 'RN_INST'
    end
    object qFOREPAY_NAME: TStringField
      FieldName = 'FOREPAY_NAME'
      Size = 2
    end
    object qSUB_TYPE_NAME: TStringField
      FieldName = 'SUB_TYPE_NAME'
      Size = 2
    end
    object qSHARE_ID: TFloatField
      FieldName = 'SHARE_ID'
    end
    object qSHARE_NAME: TStringField
      FieldName = 'SHARE_NAME'
      Size = 50
    end
    object qBILL_ID: TFloatField
      FieldName = 'BILL_ID'
    end
    object qBILL_INST: TFloatField
      FieldName = 'BILL_INST'
    end
    object qBILL_DOG: TStringField
      DisplayLabel = #8470' '#1089#1095#1105#1090#1072
      FieldName = 'BILL_DOG'
      Size = 10
    end
    object qBILL_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
      FieldName = 'BILL_DATE'
    end
    object qBILL_MINUTE: TFloatField
      FieldName = 'BILL_MINUTE'
    end
  end
  inherited ADMQ: TOilQuery
    Left = 160
    Top = 126
  end
  inherited PUM: TPopupMenu
    Left = 176
    Top = 216
    object miKPPred: TMenuItem [0]
      Caption = #1044#1086#1075#1086#1074#1086#1088' ('#1087#1088#1077#1076#1086#1087#1083#1072#1090#1072')'
      OnClick = miKPPredClick
    end
    object miKPPosle: TMenuItem [1]
      Caption = #1044#1086#1075#1086#1074#1086#1088' ('#1087#1086#1089#1083#1077#1086#1087#1083#1072#1090#1072')'
      OnClick = miKPPosleClick
    end
    object miDogFacilityPred: TMenuItem [2]
      Caption = #1044#1086#1075#1086#1074#1086#1088' '#1083#1100#1075#1086#1090#1085#1099#1081' ('#1087#1088#1077#1076#1086#1087#1083#1072#1090#1072')'
      Visible = False
      OnClick = miDogFacilityPredClick
    end
    object miAktService: TMenuItem [3]
      Caption = #1040#1082#1090' ('#1085#1072' '#1091#1089#1083#1091#1075#1080')'
      OnClick = miAktServiceClick
    end
    object miCardEC: TMenuItem [4]
      Caption = #1050#1072#1088#1090#1086#1095#1082#1080' - '#1069#1050
      object miCardPrintEC: TMenuItem
        Caption = #1044#1086#1075#1086#1074#1086#1088' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1072#1084' - '#1069#1050
        OnClick = miCardECClick
      end
      object miDopConsentEC: TMenuItem
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1077' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1077' '#1087#1086#1082#1091#1087#1082#1080' '#1053#1055
        OnClick = miDopConsentClick
      end
    end
    object miCardLS: TMenuItem [5]
      Caption = #1050#1072#1088#1090#1086#1095#1082#1080' - '#1051#1057
      object miCardPrintLSPosle: TMenuItem
        Caption = #1044#1086#1075#1086#1074#1086#1088' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1072#1084' - '#1051#1057' ('#1087#1086#1089#1083#1077#1086#1087#1083#1072#1090#1072')'
        OnClick = miCardLSPosleClick
      end
      object miCardPrintLSPred: TMenuItem
        Caption = #1044#1086#1075#1086#1074#1086#1088' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1072#1084' - '#1051#1057' ('#1087#1088#1077#1076#1086#1087#1083#1072#1090#1072')'
        OnClick = miCardLSPredClick
      end
      object miDopSmartCard: TMenuItem
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1077' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1077' '#1087#1086#1082#1091#1087#1082#1080' '#1057#1084#1072#1088#1090#1082#1072#1088#1090' '#1051#1057
        OnClick = miDopSmartCardClick
      end
      object miDopConsentLS: TMenuItem
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1077' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1077' '#1087#1086#1082#1091#1087#1082#1080' '#1053#1055
        OnClick = miDopConsentClick
      end
    end
    object miTalRep: TMenuItem [6]
      Caption = #1044#1086#1075#1086#1074#1086#1088' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084
      OnClick = miTalRepClick
    end
    object miTalRepANP: TMenuItem [7]
      Caption = #1044#1086#1075#1086#1074#1086#1088' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084' (ANP)'
      OnClick = miTalRepANPClick
    end
    object miTalRepBudget: TMenuItem [8]
      Caption = #1044#1086#1075#1086#1074#1086#1088' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084' ('#1073#1102#1076#1078#1077#1090')'
      OnClick = miTalRepBudgetClick
    end
    object miTalAdd: TMenuItem [9]
      Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077' '#1082' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084
      OnClick = miTalAddClick
    end
    object miTalAddOwn: TMenuItem [10]
      Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077' '#1082' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084' ('#1089#1074#1086#1081')'
      OnClick = miTalAddOwnClick
    end
    object miDopConsent: TMenuItem [11]
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1077' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1077
      OnClick = miDopConsentClick
    end
    object nPrintAZSList: TMenuItem [12]
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1040#1047#1057
      OnClick = nPrintAZSListClick
    end
    object miCardRnLs: TMenuItem [13]
      Caption = #1055#1077#1095#1072#1090#1100' '#1056#1053' '#1085#1072' '#1087#1088#1086#1076#1072#1078#1091' '#1089#1084#1072#1088#1090'-'#1082#1072#1088#1090
      OnClick = miCardRnLsClick
    end
    object miCardRnLsDelete: TMenuItem [14]
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1056#1053' '#1085#1072' '#1087#1088#1086#1076#1072#1078#1091' '#1089#1084#1072#1088#1090'-'#1082#1072#1088#1090
      OnClick = miCardRnLsDeleteClick
    end
    object N5: TMenuItem [15]
      Caption = '-'
    end
    object Order: TMenuItem [16]
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1095#1077#1090'-'#1092#1072#1082#1090#1091#1088#1099
      OnClick = OrderClick
    end
    object N2: TMenuItem [17]
      Caption = '-'
    end
    object N6: TMenuItem [18]
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083' '#1087#1088#1080#1074#1103#1079#1082#1080' '#1076#1083#1103' '#1055#1077#1090#1088#1086#1083
      OnClick = N6Click
    end
  end
  inherited ActionList: TActionList
    Left = 136
  end
  object qDogDetail: TOilQuery
    SQL.Strings = (
      'select OIL_DOG_DETAIL.*,'
      '       NP.NAME as NPNAME,'
      '       NP.NP_GRP as NPGRP_ID,'
      '       NPB.NAME as NPBNAME,'
      '       DM.NAME DIM_NAME'
      '  from OIL_DOG_DETAIL,'
      '       V_OIL_NP_TYPE NP,'
      '       V_OIL_NP_TYPE NPB,'
      '       V_OIL_DIMENSION DM'
      ' where OIL_DOG_DETAIL.STATE = '#39'Y'#39
      '   and OIL_DOG_DETAIL.DOG_ID = :id'
      '   and OIL_DOG_DETAIL.DOG_INST = :inst'
      '   and OIL_DOG_DETAIL.NP_TYPE = NP.ID(+)'
      '   and OIL_DOG_DETAIL.BARTERNP = NPB.ID(+)'
      '   and OIL_DOG_DETAIL.DIM_ID = DM.ID(+)'
      ' order by OIL_DOG_DETAIL.ID')
    MasterSource = ds
    CachedUpdates = True
    AfterScroll = qDogDetailAfterScroll
    DataSource = ds
    RequestLive = False
    UpdateMode = upWhereChanged
    Left = 544
    Top = 152
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
      Origin = 'OIL_DOG_DETAIL.DOG_INST'
      Visible = False
    end
    object qDogDetailNP_TYPE: TFloatField
      FieldName = 'NP_TYPE'
      Origin = 'OIL_DOG_DETAIL.NP_TYPE'
    end
    object qDogDetailNPGRP_ID: TFloatField
      FieldName = 'NPGRP_ID'
    end
    object qDogDetailNPNAME: TStringField
      DisplayLabel = #1058#1080#1087' '#1053#1055
      FieldName = 'NPNAME'
      Size = 255
    end
    object qDogDetailBARTERNP: TFloatField
      FieldName = 'BARTERNP'
      Origin = 'OIL_DOG_DETAIL.BARTERNP'
      Visible = False
    end
    object qDogDetailNPBNAME: TStringField
      DisplayLabel = #1041#1072#1088#1090#1077#1088#1085#1099#1081' '#1090#1086#1074#1072#1088
      FieldName = 'NPBNAME'
      Size = 50
    end
    object qDogDetailDIM_ID: TFloatField
      DisplayLabel = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084'.'
      FieldName = 'DIM_ID'
      Origin = 'OIL_DOG_DETAIL.DIM_ID'
    end
    object qDogDetailDIM_NAME: TStringField
      DisplayLabel = #1045#1076'.'#1080#1079#1084
      FieldName = 'DIM_NAME'
      Size = 50
    end
    object qDogDetailPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
      DisplayWidth = 13
      FieldName = 'PRICE'
      Origin = 'OIL_DOG_DETAIL.PRICE'
      DisplayFormat = '0.##########'
    end
    object qDogDetailPRICE2: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
      FieldName = 'PRICE2'
      DisplayFormat = '0.##########'
    end
    object qDogDetailCOUNT_: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'COUNT_'
      Origin = 'OIL_DOG_DETAIL.COUNT_'
    end
    object qDogDetailSUMM_NDS: TFloatField
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'SUMM_NDS'
      DisplayFormat = '0.##'
    end
    object qDogDetailSUMM_X_NDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057
      FieldName = 'SUMM_X_NDS'
      DisplayFormat = '0.##'
    end
  end
  object dsDogDetail: TOraDataSource
    DataSet = qDogDetail
    Left = 552
    Top = 136
  end
  object qWork: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 343
    Top = 173
  end
  object u: TOraUpdateSQL
    ModifySQL.Strings = (
      'update Oil_Dog'
      '   set DOG         = :DOG,'
      '       DOG_DATE    = :DOG_DATE,'
      '       EXP_DATE    = :EXP_DATE,'
      '       FOREPAY     = :FOREPAY,'
      '       FROM_       = :FROM_,'
      '       FROM_INST   = :FROM_INST,'
      '       TO_         = :TO_,'
      '       TO_INST     = :TO_INST,'
      '       DOG_TYPE    = :DOG_TYPE,'
      '       R_FROM_     = :R_FROM_,'
      '       R_FROM_INST = :R_FROM_INST,'
      '       R_TO_       = :R_TO_,'
      '       R_TO_INST   = :R_TO_INST,'
      '       PAY_CORR    = :PAY_CORR,'
      '       PAY_TYPE    = :PAY_TYPE,'
      '       SUB_TYPE    = :SUB_TYPE,'
      '       SHARE_ID    = :SHARE_ID'
      ' where ID = :OLD_ID'
      '   and INST = :OLD_INST')
    InsertSQL.Strings = (
      'insert into Oil_Dog'
      '  (ID,'
      '   INST,'
      '   STATE,'
      '   DOG,'
      '   DOG_DATE,'
      '   EXP_DATE,'
      '   FOREPAY,'
      '   FROM_,'
      '   FROM_INST,'
      '   TO_,'
      '   TO_INST,'
      '   DOG_TYPE,'
      '   R_FROM_,'
      '   R_FROM_INST,'
      '   R_TO_,'
      '   R_TO_INST,'
      '   PAY_CORR,'
      '   PAY_TYPE,'
      '   SUB_TYPE,'
      '   SHARE_ID)'
      'values'
      '  (:ID,'
      '   :INST,'
      '   '#39'Y'#39','
      '   :DOG,'
      '   :DOG_DATE,'
      '   :EXP_DATE,'
      '   :FOREPAY,'
      '   :FROM_,'
      '   :FROM_INST,'
      '   :TO_,'
      '   :TO_INST,'
      '   :DOG_TYPE,'
      '   :R_FROM_,'
      '   :R_FROM_INST,'
      '   :R_TO_,'
      '   :R_TO_INST,'
      '   :PAY_CORR,'
      '   :PAY_TYPE,'
      '   :SUB_TYPE,'
      '   :SHARE_ID)')
    DeleteSQL.Strings = (
      'update Oil_Dog'
      '   set State = '#39'N'#39
      ' where ID = :OLD_ID'
      '   and INST = :OLD_INST')
    Left = 63
    Top = 135
  end
  object qServiceDetail: TOilQuery
    SQL.Strings = (
      'select dt.Price as Price,'
      '       dt.Price2 as Price2,'
      '       ot.name as SERVICE_NAME,'
      '       dm.name as DimName,'
      '       dt.summ_nds,'
      '       dt.summ_x_nds,'
      '       dt. count_,'
      '       ot.id as oper_id'
      '  from oil_dog_detail dt, v_oil_oper_type ot, v_oil_dimension dm'
      ' where dt.state = '#39'Y'#39
      '   and dt.dog_id = :id'
      '   and dt.dog_inst = :inst'
      '   and dt.np_type = ot.id(+)'
      '   and dt.dim_id = dm.id(+)'
      ' order by dt.id')
    MasterSource = ds
    CachedUpdates = True
    DataSource = ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 544
    Top = 216
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
      end
      item
        DataType = ftFloat
        Name = 'INST'
      end>
    object qServiceDetailOPER_ID: TFloatField
      FieldName = 'OPER_ID'
    end
    object qServiceDetailSERVICE_NAME: TStringField
      FieldName = 'SERVICE_NAME'
      Size = 50
    end
    object qServiceDetailPRICE: TFloatField
      FieldName = 'PRICE'
      DisplayFormat = '0.##########'
    end
    object qServiceDetailPRICE2: TFloatField
      FieldName = 'PRICE2'
      DisplayFormat = '0.##########'
    end
    object qServiceDetailCOUNT_: TFloatField
      FieldName = 'COUNT_'
    end
    object qServiceDetailSUMM_NDS: TFloatField
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'SUMM_NDS'
      DisplayFormat = '0.##'
    end
    object qServiceDetailSUMM_X_NDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057
      FieldName = 'SUMM_X_NDS'
      DisplayFormat = '0.##'
    end
    object qServiceDetailDIMNAME: TStringField
      FieldName = 'DIMNAME'
      Size = 50
    end
  end
  object dsServiceDetail: TOraDataSource
    DataSet = qServiceDetail
    Left = 552
    Top = 200
  end
  object qSavePoint: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 341
    Top = 127
  end
  object qReportTalon: TOilQuery
    SQL.Strings = (
      'select decode(npg.Id, 9, np.Name, npg.FullName) as NP_Name,'
      '       dm.Name as DimName,'
      '       dd.COUNT_ as Amount,'
      '       dd.Price as Price_X_Nds,'
      '       dd.Price2 as Price_Nds,'
      '       dd.Summ_X_Nds,'
      '       dd.Summ_Nds,'
      '       1 as ordered'
      '  from Oil_Dog_Detail  dd,'
      '       V_Oil_NP_Type   np,'
      '       V_Oil_NP_Group  npg,'
      '       V_Oil_DIMENSION dm'
      ' where dd.State = '#39'Y'#39
      '   and dd.Dog_Id = :ID'
      '   and dd.Dog_Inst = :INST'
      '   and dd.NP_TYPE = np.ID(+)'
      '   and np.np_grp = npg.Id(+)'
      '   and dd.DIM_ID = dm.ID(+)'
      ' order by dd.id')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 415
    Top = 127
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
      end
      item
        DataType = ftInteger
        Name = 'INST'
      end>
  end
  object qReport: TOilQuery
    SQL.Strings = (
      'select np.Name as NP_Name,'
      '       dm.Name as DimName,'
      '       dd.Count_ as Amount,'
      '       dd.Price,'
      '       dd.Price2,'
      '       dd.summ_x_nds,'
      '       dd.summ_nds,'
      '       1 as ordered'
      '  from Oil_Dog_Detail dd, V_Oil_NP_Type np, V_Oil_Dimension dm'
      ' where dd.State = '#39'Y'#39
      '   and dd.Dog_Id = :Id'
      '   and dd.Dog_Inst = :Inst'
      '   and dd.NP_TYPE = np.ID(+)'
      '   and dd.DIM_ID = dm.ID(+)'
      ' order by dd.id')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 416
    Top = 174
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
      end
      item
        DataType = ftFloat
        Name = 'INST'
      end>
  end
  object pmAddDog: TPopupMenu
    Left = 16
    Top = 309
    object AddDogWithBill: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1076#1086#1075#1086#1074#1086#1088' '#1089#1086#1075#1083#1072#1089#1085#1086' '#1089#1095#1105#1090#1072
      OnClick = AddDogWithBillClick
    end
  end
end
