inherited TalonOutRefForm: TTalonOutRefForm
  Left = 245
  Top = 272
  Caption = #1054#1090#1087#1091#1089#1082' '#1090#1072#1083#1086#1085#1086#1074
  ClientHeight = 371
  ClientWidth = 717
  Constraints.MinHeight = 24
  Constraints.MinWidth = 160
  PixelsPerInch = 96
  TextHeight = 13
  inherited pBase: TPanel [0]
    Top = 89
    Width = 567
    Height = 249
    object Splitter1: TSplitter [0]
      Left = 0
      Top = 91
      Width = 567
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    inherited SplitterDetail: TSplitter
      Top = 94
      Width = 567
    end
    inherited DBGrid1: TDBGridEh
      Width = 567
      Height = 91
      TabOrder = 2
      Columns = <
        item
          EditButtons = <>
          FieldName = 'OUT_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'OUT_NUM'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
          Width = 45
        end
        item
          EditButtons = <>
          FieldName = 'DEP_NAME'
          Footers = <>
          Title.Caption = #1054#1090' '#1050#1086#1075#1086
          Width = 180
        end
        item
          EditButtons = <>
          FieldName = 'OPER_NAME'
          Footers = <>
          Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'DOG'
          Footers = <>
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088
          Width = 55
        end
        item
          EditButtons = <>
          FieldName = 'DOG_DATE'
          Footers = <>
          Title.Caption = #1085#1072' '#1076#1072#1090#1091
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'NN_NUM'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1053#1053
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'NN_SUM'
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1053#1053
        end
        item
          EditButtons = <>
          FieldName = 'ORG_NAME'
          Footers = <>
          Title.Caption = #1050#1086#1084#1091
          Width = 235
        end>
    end
    inherited pDetail: TPanel
      Top = 197
      Width = 567
      inherited DBGridDetail: TDBGridEh
        Width = 567
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 97
      Width = 567
      Height = 100
      Align = alBottom
      TabOrder = 0
      Visible = False
      object lAmountTalon: TLabel
        Left = 105
        Top = 80
        Width = 5
        Height = 13
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 636
        Top = 22
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'ALLAMOUNT'
        DataSource = dsTalonTotal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 636
        Top = 42
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'LITR'
        DataSource = dsTalonTotal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 636
        Top = 62
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'WHOLE'
        DataSource = dsTalonTotal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 569
        Top = 62
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = #1048#1090#1086#1075#1086' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 569
        Top = 22
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 569
        Top = 42
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = #1051#1080#1090#1088#1072#1078' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBGrid2: TDBGridEh
        Left = 1
        Top = 1
        Width = 367
        Height = 98
        Align = alLeft
        Constraints.MinHeight = 30
        DataSource = dsTalon
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'SER'
            Footers = <>
            Title.Caption = #1057#1077#1088#1080#1103
            Width = 35
          end
          item
            EditButtons = <>
            FieldName = 'NUM'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'NPGRP_NAME'
            Footers = <>
            Title.Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
            Width = 123
          end
          item
            EditButtons = <>
            FieldName = 'NOMINAL'
            Footers = <>
            Title.Caption = #1053#1086#1084#1080#1085#1072#1083
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072
            Width = 48
          end>
      end
      object GroupBox3: TGroupBox
        Left = 368
        Top = 1
        Width = 181
        Height = 98
        Align = alLeft
        Caption = #1054#1087#1077#1088'. '#1087#1086' '#1090#1072#1083#1086#1085#1091
        TabOrder = 1
        object DBText4: TDBText
          Left = 95
          Top = 0
          Width = 42
          Height = 13
          AutoSize = True
          DataField = 'SER'
          DataSource = dsTalon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBText5: TDBText
          Left = 120
          Top = 0
          Width = 42
          Height = 13
          AutoSize = True
          DataField = 'NUM'
          DataSource = dsTalon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBGrid3: TDBGridEh
          Left = 2
          Top = 15
          Width = 177
          Height = 81
          Align = alClient
          DataSource = dsTalonDetail
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'TITLE'
              Footers = <>
              Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'PRIH_DATE'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072
              Width = 57
            end
            item
              EditButtons = <>
              FieldName = 'PRIH_NUM'
              Footers = <>
              Title.Caption = #1053#1086#1084#1077#1088
              Width = 38
            end>
        end
      end
    end
  end
  inherited Panel1: TPanel [1]
    Top = 338
    Width = 717
    TabOrder = 2
    inherited Panel3: TPanel
      Left = 520
      TabOrder = 8
    end
    inherited PAdd: TPanel
      inherited sbAdd: TSpeedButton
        OnClick = sbAddClick
      end
    end
    inherited pDel: TPanel
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      inherited bbClear: TBitBtn
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
    inherited pPrint: TPanel
      TabOrder = 4
      Visible = True
    end
    inherited pTotal: TPanel
      TabOrder = 5
    end
    inherited pSpeedUp: TPanel
      TabOrder = 6
    end
    inherited pShowDetail: TPanel
      Width = 152
      TabOrder = 7
      Visible = True
      inherited cbShowDetail: TCheckBox
        OnClick = CheckBox1Click
      end
    end
  end
  inherited Panel2: TPanel [2]
    Width = 717
    Height = 79
    TabOrder = 0
    object lFromDate: TLabel
      Left = 11
      Top = 9
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1072#1090#1072' c'
    end
    object lTo: TLabel
      Left = 208
      Top = 32
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1086#1084#1091
    end
    object lFrom: TLabel
      Left = 195
      Top = 55
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1090' '#1082#1086#1075#1086
    end
    object sbClearTo: TSpeedButton
      Left = 589
      Top = 29
      Width = 23
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
      OnClick = sbClearToClick
    end
    object sbClearFrom: TSpeedButton
      Left = 589
      Top = 53
      Width = 23
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
      OnClick = sbClearFromClick
    end
    object sbClearDate: TSpeedButton
      Left = 147
      Top = 4
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
      OnClick = sbClearDateClick
    end
    object lNumOtp: TLabel
      Left = 12
      Top = 55
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1086#1084#1077#1088
    end
    object sbClearID: TSpeedButton
      Left = 147
      Top = 53
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
      OnClick = sbClearIDClick
    end
    object sbClearOper: TSpeedButton
      Left = 589
      Top = 4
      Width = 23
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
      OnClick = sbClearOperClick
    end
    object lOper: TLabel
      Left = 184
      Top = 9
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1087#1077#1088#1072#1094#1080#1103
    end
    object lToDate: TLabel
      Left = 34
      Top = 32
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = #1087#1086
    end
    object deOutDateFrom: TDateEdit
      Left = 51
      Top = 5
      Width = 94
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
    end
    object ceOrg: TComboEdit
      Left = 240
      Top = 29
      Width = 348
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = ceOrgButtonClick
      OnDblClick = ceOrgButtonClick
    end
    object ceDep: TComboEdit
      Left = 240
      Top = 53
      Width = 348
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = ceDepButtonClick
      OnDblClick = ceDepButtonClick
    end
    object edOper: TComboEdit
      Left = 240
      Top = 5
      Width = 348
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = edOperButtonClick
      OnDblClick = edOperButtonClick
    end
    object gbTalon: TGroupBox
      Left = 618
      Top = 2
      Width = 97
      Height = 75
      Align = alRight
      Caption = #1058#1072#1083#1086#1085
      TabOrder = 6
      object lSeriaTal: TLabel
        Left = 8
        Top = 22
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = #1057#1077#1088#1080#1103
      end
      object lNumTal: TLabel
        Left = 8
        Top = 47
        Width = 11
        Height = 13
        Alignment = taRightJustify
        Caption = #8470
      end
      object eTalonNum: TEdit
        Left = 24
        Top = 45
        Width = 68
        Height = 21
        MaxLength = 9
        TabOrder = 1
        OnKeyPress = eTalonNumKeyPress
      end
      object eTalonSer: TEdit
        Left = 42
        Top = 20
        Width = 50
        Height = 21
        MaxLength = 3
        TabOrder = 0
      end
    end
    object deOutDateTo: TDateEdit
      Left = 51
      Top = 29
      Width = 94
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object edNum: TEdit
      Left = 51
      Top = 53
      Width = 94
      Height = 21
      MaxLength = 100
      TabOrder = 2
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 717
    inherited pnlTuneGridBtn: TPanel
      Left = 688
    end
  end
  inherited PanelCol: TPanel
    Left = 567
    Top = 89
    Height = 249
    inherited cbCol: TRxCheckListBox
      Height = 221
    end
    inherited pRefresh: TPanel
      Top = 223
    end
  end
  inherited ds: TOraDataSource
    OnDataChange = dsDataChange
    Left = 125
    Top = 150
  end
  inherited q: TOilQuery
    SQL.Strings = (
      
        'SELECT /*+ORDERED  USE_HASH(OIL_TALON_OUT,ORG, DEP, OIL_DOG, OIL' +
        '_SALE_BOOK)*/'
      '      /* '#1055#1086#1088#1103#1076#1086#1082' '#1089#1090#1088#1086#1082' '#1085#1077' '#1084#1077#1085#1103#1090#1100' '#1079#1072#1087#1088#1086#1089' '#1084#1077#1085#1103#1077#1090#1100#1089#1103' '#1085#1072' '#1083#1077#1090#1091' */'
      '      OIL_TALON_OUT.*, OPER_TYPE.NAME as OPER_NAME,'
      
        '      OIL_DOG.DOG,   Oil_Dog.id as Dog_id,   Oil_Dog.inst as Dog' +
        '_inst, OIL_DOG.DOG_DATE,'
      '      ORG.ORG_TYPE,  ORG.ID as ORG_ID, ORG.INST as ORG_INST,'
      '      ORG.NAME AS ORG_NAME,      ORG.ADDR as ORG_ADDR,'
      '      ORG.SVID_NUM as ORG_SVID_NUM,'
      '      ORG.NAL_NUM as ORG_NAL_NUM,'
      '      ORG.BOSS as ORG_BOSS,'
      '      ORG.ID_NUM as ORG_OKPO,'
      '      ORG.PHONE as ORG_PHONE,'
      '      DEP.ORG_TYPE as DEP_TYPE,'
      '      DEP.NAME AS DEP_NAME,'
      '      DEP.ADDR AS DEP_ADDR,'
      '      DEP.SVID_NUM as DEP_SVID_NUM,'
      '      DEP.NAL_NUM as DEP_NAL_NUM,'
      '      DEP.BOSS as DEP_BOSS,'
      '      DEP.ID_NUM as DEP_OKPO,'
      '      DEP.PHONE as DEP_PHONE,'
      '      OIL_SALE_BOOK.NUM as NN_NUM, OIL_SALE_BOOK.FRASCH,'
      '      OIL_SALE_BOOK.NAL_T NN_PRICE, OIL_SALE_BOOK.NAL_T, '
      '      nvl(SNN.SUM_NN,OIL_SALE_BOOK.NDS_T) NN_SUM,'
      
        '      OIL_DOG.FROM_ as DOG_FROM_ID, OIL_DOG.FROM_INST as DOG_FRO' +
        'M_INST'
      
        '  FROM OIL_TALON_OUT, v_ORG ORG, v_ORG DEP, OIL_DOG, OIL_SALE_BO' +
        'OK, V_OIL_OPER_TYPE OPER_TYPE,'
      '        (SELECT'
      '              SUM(SD.NDS_T) SUM_NN, SD.NN_ID, SD.NN_INST'
      '          FROM'
      '              OIL_SALE_BOOK_DET SD'
      '         WHERE'
      '              SD.STATE = '#39'Y'#39
      '         GROUP BY SD.NN_ID, SD.NN_INST ) SNN'
      ' WHERE OIL_TALON_OUT.STATE = '#39'Y'#39
      '   AND OIL_DOG.STATE (+) = '#39'Y'#39
      
        '   AND OIL_SALE_BOOK.STATE (+) = '#39'Y'#39' AND OIL_TALON_OUT.OPER_ID =' +
        ' OPER_TYPE.ID(+)'
      '   AND OIL_TALON_OUT.ORG_ID = ORG.ID (+)'
      '   AND OIL_TALON_OUT.ORG_INST = ORG.INST (+)'
      '   AND OIL_TALON_OUT.DEP_ID = DEP.ID (+)'
      '   AND OIL_TALON_OUT.DEP_INST = DEP.INST (+)'
      '   AND OIL_TALON_OUT.DOG_ID = OIL_DOG.ID (+)'
      '   AND OIL_TALON_OUT.DOG_INST = OIL_DOG.INST (+)'
      '   AND OIL_TALON_OUT.NN_ID = OIL_SALE_BOOK.ID (+)'
      '   AND OIL_TALON_OUT.NN_INST = OIL_SALE_BOOK.INST (+)'
      '   AND (SNN.NN_ID(+) = OIL_TALON_OUT.NN_ID)'
      '   AND (SNN.NN_INST(+) = OIL_TALON_OUT.NN_INST)'
      '-- STRING 45, PLACE FOR OUTDATE QUERY'
      '-- STRING 46, PLACE FOR FILIAL QUERY'
      '-- STRING 47, PLACE FOR EMPLOY QUERY'
      '-- STRING 48, PLACE FOR PART QUERY'
      '-- STRING 49, PLACE FOR OUTNUM QUERY'
      '-- STRING 50, PLACE FOR OPER QUERY'
      
        ' ORDER BY OIL_TALON_OUT.OUT_DATE DESC, OIL_TALON_OUT.OUT_NUM DES' +
        'C')
    CachedUpdates = True
    UpdateObject = u
    AfterPost = qAfterPost
    AfterDelete = qAfterPost
    Left = 95
    Top = 150
    object qID: TFloatField
      FieldName = 'ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
    end
    object qSTATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object qOUT_NUM: TStringField
      FieldName = 'OUT_NUM'
      Size = 100
    end
    object qOUT_DATE: TDateTimeField
      FieldName = 'OUT_DATE'
    end
    object qORG_ID: TFloatField
      FieldName = 'ORG_ID'
    end
    object qORG_INST: TFloatField
      FieldName = 'ORG_INST'
    end
    object qDEP_ID: TFloatField
      FieldName = 'DEP_ID'
    end
    object qDEP_INST: TFloatField
      FieldName = 'DEP_INST'
    end
    object qREKV_ID: TFloatField
      FieldName = 'REKV_ID'
    end
    object qREKV_INST: TFloatField
      FieldName = 'REKV_INST'
    end
    object qDOV_NAME: TStringField
      FieldName = 'DOV_NAME'
      Size = 50
    end
    object qDOV_SER: TStringField
      FieldName = 'DOV_SER'
      Size = 3
    end
    object qDOV_NUM: TStringField
      FieldName = 'DOV_NUM'
    end
    object qDOV_DATE: TDateTimeField
      FieldName = 'DOV_DATE'
    end
    object qDOG_ID: TFloatField
      FieldName = 'DOG_ID'
    end
    object qDOG_INST: TFloatField
      FieldName = 'DOG_INST'
    end
    object qRASH_ID: TFloatField
      FieldName = 'RASH_ID'
    end
    object qRASH_INST: TFloatField
      FieldName = 'RASH_INST'
    end
    object qNN_ID: TFloatField
      FieldName = 'NN_ID'
    end
    object qNN_INST: TFloatField
      FieldName = 'NN_INST'
    end
    object qDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
    end
    object qDOG: TStringField
      FieldName = 'DOG'
      Size = 15
    end
    object qDOG_DATE: TDateTimeField
      FieldName = 'DOG_DATE'
    end
    object qORG_TYPE: TFloatField
      FieldName = 'ORG_TYPE'
    end
    object qORG_NAME: TStringField
      FieldName = 'ORG_NAME'
      Size = 100
    end
    object qORG_ADDR: TStringField
      FieldName = 'ORG_ADDR'
      Size = 200
    end
    object qORG_SVID_NUM: TStringField
      FieldName = 'ORG_SVID_NUM'
      Size = 50
    end
    object qORG_NAL_NUM: TStringField
      FieldName = 'ORG_NAL_NUM'
      Size = 50
    end
    object qORG_BOSS: TStringField
      FieldName = 'ORG_BOSS'
      Size = 50
    end
    object qORG_OKPO: TStringField
      FieldName = 'ORG_OKPO'
    end
    object qORG_PHONE: TStringField
      FieldName = 'ORG_PHONE'
      Size = 30
    end
    object qDEP_TYPE: TFloatField
      FieldName = 'DEP_TYPE'
    end
    object qDEP_NAME: TStringField
      FieldName = 'DEP_NAME'
      Size = 100
    end
    object qDEP_ADDR: TStringField
      FieldName = 'DEP_ADDR'
      Size = 200
    end
    object qDEP_SVID_NUM: TStringField
      FieldName = 'DEP_SVID_NUM'
      Size = 50
    end
    object qDEP_NAL_NUM: TStringField
      FieldName = 'DEP_NAL_NUM'
      Size = 50
    end
    object qDEP_BOSS: TStringField
      FieldName = 'DEP_BOSS'
      Size = 50
    end
    object qDEP_OKPO: TStringField
      FieldName = 'DEP_OKPO'
    end
    object qDEP_PHONE: TStringField
      FieldName = 'DEP_PHONE'
      Size = 30
    end
    object qNN_NUM: TStringField
      FieldName = 'NN_NUM'
      Size = 8
    end
    object qFRASCH: TStringField
      FieldName = 'FRASCH'
      Size = 100
    end
    object qNPGRP_ID: TFloatField
      FieldName = 'NPGRP_ID'
    end
    object qOPER_ID: TFloatField
      FieldName = 'OPER_ID'
    end
    object qOPER_NAME: TStringField
      FieldName = 'OPER_NAME'
      Size = 50
    end
    object qNN_PRICE: TFloatField
      FieldName = 'NN_PRICE'
      Origin = 'OIL.OIL_SALE_BOOK.NDS_T'
    end
    object qNN_SUM: TFloatField
      FieldName = 'NN_SUM'
    end
  end
  inherited ADMQ: TOilQuery
    Left = 319
    Top = 124
  end
  inherited PUM: TPopupMenu
    object N2: TMenuItem [0]
      Caption = #1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
      OnClick = N2Click
    end
    object N3: TMenuItem [1]
      Caption = #1056#1077#1077#1089#1090#1088' '#1087#1088#1080#1077#1084#1072'-'#1087#1077#1088#1077#1076#1072#1095#1080
      OnClick = N3Click
    end
    object NNN: TMenuItem [2]
      Caption = #1053#1072#1083#1086#1075#1086#1074#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
      OnClick = NNNClick
    end
    object N1: TMenuItem [3]
      Caption = '-'
    end
    object NDog: TMenuItem [4]
      Caption = #1044#1086#1075#1086#1074#1086#1088
      OnClick = NDogClick
    end
    object miDopConsent: TMenuItem [5]
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1077' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1077
      OnClick = miDopConsentClick
    end
    object miTalonExch: TMenuItem [6]
      Caption = #1054#1073#1084#1077#1085' '#1090#1072#1083#1086#1085#1086#1074
      object miTalonExch_Dop: TMenuItem
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1077' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1077' '#1087#1086' '#1086#1073#1084#1077#1085#1091' '#1090#1072#1083#1086#1085#1086#1074
        OnClick = miTalonExch_DopClick
      end
      object miTalonExch_Sverka: TMenuItem
        Caption = #1040#1082#1090' '#1089#1074#1077#1088#1082#1080
        OnClick = miTalonExch_SverkaClick
      end
      object miTalonExch_PrPer: TMenuItem
        Caption = #1040#1082#1090' '#1087#1088#1080#1077#1084#1072'-'#1087#1077#1088#1077#1076#1072#1095#1080
        OnClick = miTalonExch_PrPerClick
      end
    end
    object N4: TMenuItem [7]
      Caption = '-'
    end
  end
  inherited ActionList: TActionList
    Top = 207
  end
  object sp1: TOilStoredProc
        Left = 319
    Top = 182
  end
  object qTalon: TOilQuery
    SQL.Strings = (
      '/* '#1047#1072#1087#1088#1086#1089' '#1080#1079#1084#1077#1085#1103#1077#1090#1089#1103' '#1085#1072' '#1083#1077#1090#1091' - '#1085#1077' '#1084#1077#1085#1103#1090#1100' '#1087#1086#1088#1103#1076#1086#1082' '#1089#1090#1088#1086#1082' */'
      ' select /*+ORDERED INDEX(a TALON_DATA_HEAD)*/'
      '        a.ser,        a.num,'
      '        a.price,'
      '        a.nominal,'
      '        a.head_id,'
      '        a.head_inst,'
      '        a.npgrp_id,'
      '        a.code_obl,'
      '        b.FullName as npgrp_name'
      '   from oil_talon_data a,v_oil_np_group b'
      '  where a.state = '#39'Y'#39
      '    and a.head_id = :id'
      '    and a.head_inst = :inst'
      '    and b.id (+) = a.npgrp_id'
      '  order by a.ser, a.num'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    MasterSource = ds
        DataSource = ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 145
    Top = 295
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
  object dsTalon: TOraDataSource
    DataSet = qTalon
    Left = 190
    Top = 295
  end
  object qSumTalon: TOilQuery
    SQL.Strings = (
      'select b.FullName as NPGrp_Name,'
      '       date_ as data,'
      '       NDS.GetNoNds_WithNds(Price, date_) as Price1,'
      '       Price as Price,'
      '       sum(Nominal) as SumNominal,'
      
        '       NDS.GetNoNds_WithNds(sum(Nominal * Round(Price, 4)), date' +
        '_, 2) as WholeXNDS,'
      '       Round(sum(Nominal * Price), 2) as SumNDS'
      '  from v_oil_talon_op, v_oil_np_group b'
      ' where tip = '#39'O'#39
      '   and head_id = :id'
      '   and head_inst = :inst'
      '   and b.id(+) = npgrp_id'
      ' group by b.FullName, price, date_'
      ' order by b.FullName')
    MasterSource = ds
        DataSource = ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 254
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
  end
  object dsTalonTotal: TOraDataSource
    DataSet = qTalonTotal
    Left = 665
    Top = 251
  end
  object qTalonTotal: TOilQuery
    SQL.Strings = (
      'select count(*) as AllAmount,'
      '       date_ as data,'
      '       sum(Nominal) as Litr,'
      '       sum(Nominal * Round(Price, 4)) as Whole,'
      
        '       NDS.GetNds_WithNds(sum(Nominal * Round(Price, 4)), date_)' +
        ' as NDS,'
      
        '       NDS.GetNoNds_WithNds(sum(Nominal * Round(Price, 4)), date' +
        '_, 2) as WholeXNDS'
      '  from V_Oil_Talon_Op'
      ' where Tip = '#39'O'#39
      '   and Head_Id = :id'
      '   and Head_Inst = :inst'
      ' group by Head_id, Head_inst, date_')
    MasterSource = ds
        DataSource = ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 659
    Top = 259
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
  object dsTalonDetail: TOraDataSource
    DataSet = qTalonDetail
    Left = 478
    Top = 274
  end
  object qSCRashNakl: TOilQuery
    SQL.Strings = (
      
        'select /*+ORDERED USE_NL(Oil_SROther, Oil_Rashod, Oil_Part, Oil_' +
        'NP_Type, Oil_NP_Group)*/'
      
        '       Oil_NP_Group.Name as NPGrp_Name,       Oil_SROther.SCNumb' +
        'er,'
      '       Oil_SROther.SCCheque,'
      '       Oil_SROther.Litr,'
      '       Oil_SROther.Price'
      
        '  from Oil_DR_Data, Oil_SROther, Oil_Rashod, Oil_Part, Oil_NP_Ty' +
        'pe, Oil_NP_Group'
      ' where Oil_DR_Data.State = '#39'Y'#39
      '   and Oil_SROther.State = '#39'Y'#39
      '   and Oil_DR_Data.Rep_Id = :Id'
      '   and Oil_DR_Data.Rep_Inst = :Inst'
      '   and Oil_DR_Data.Id = Oil_SROther.SRep_Id'
      '   and Oil_DR_Data.Inst = Oil_SROther.SRep_Inst'
      '   and Oil_SROther.Oper_Id = 153'
      '   and Oil_DR_Data.TTN_Id = Oil_Rashod.Id'
      '   and Oil_DR_Data.TTN_Inst = Oil_Rashod.Inst'
      '   and Oil_Rashod.Part_Id = Oil_Part.Id'
      '   and Oil_Rashod.Part_Inst = Oil_Part.Inst'
      '   and Oil_Part.NP_Type = Oil_NP_Type.Id'
      '   and Oil_NP_Type.Grp_Id = Oil_NP_Group.Id'
      ' order by Oil_NP_Group.Name'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
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
    AutoCalcFields = False
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 545
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Id'
      end
      item
        DataType = ftInteger
        Name = 'Inst'
      end>
  end
  object u: TOraUpdateSQL
    ModifySQL.Strings = (
      'update OIL_TALON_OUT'
      'set'
      '  OUT_DATE = :OUT_DATE,'
      '  OUT_NUM = :OUT_NUM,'
      '  DOG_ID = :DOG_ID,'
      '  DOG_INST = :DOG_INST,'
      '  ORG_ID = :ORG_ID,'
      '  ORG_INST = :ORG_INST,'
      '  DEP_ID = :DEP_ID,'
      '  DEP_INST = :DEP_INST,'
      '  DOV_NAME = :DOV_NAME,'
      '  DOV_SER = :DOV_SER,'
      '  DOV_NUM = :DOV_NUM,'
      '  DOV_DATE = :DOV_DATE,'
      '  NN_ID = :NN_ID,'
      '  NN_INST = :NN_INST,'
      '  OPER_ID = :OPER_ID'
      'where'
      '  ID = :OLD_ID and'
      '  INST = :OLD_INST'
      ' ')
    InsertSQL.Strings = (
      'insert into OIL_TALON_OUT'
      '  (ID, INST, STATE, OUT_DATE, OUT_NUM, DOG_ID, DOG_INST, ORG_ID,'
      'ORG_INST,'
      
        '   DEP_ID, DEP_INST, DOV_NAME, DOV_SER, DOV_NUM, DOV_DATE, NN_ID' +
        ','
      'NN_INST, OPER_ID)'
      'values'
      '  (:ID, :INST, '#39'Y'#39', :OUT_DATE, :OUT_NUM, :DOG_ID,'
      ':DOG_INST, :ORG_ID,'
      '   :ORG_INST, :DEP_ID, :DEP_INST, :DOV_NAME, :DOV_SER, :DOV_NUM,'
      ':DOV_DATE, :NN_ID, :NN_INST, :OPER_ID)')
    DeleteSQL.Strings = (
      'update OIL_TALON_OUT'
      'set STATE = '#39'N'#39
      'where ID = :OLD_ID '
      '  and INST = :OLD_INST'
      ''
      '')
    Left = 155
    Top = 150
  end
  object qWork: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 205
    Top = 80
  end
  object qNextPrih: TOilQuery
    SQL.Strings = (
      'select min(Date_)'
      '  from (select Ser, Num'
      '          from V_Oil_Talon_Op'
      '         where Tip = '#39'O'#39
      '           and Head_Id = :MainId'
      '           and Head_Inst = :MainInst) CurSerNum,'
      '       V_Oil_Talon_Op p'
      ' where p.Tip = '#39'P'#39
      '   and p.Ser = CurSerNum.Ser'
      '   and p.Num = CurSerNum.Num'
      '   and p.Date_ >= :CurDate')
    AutoCalcFields = False
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 30
    Top = 86
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MainId'
      end
      item
        DataType = ftInteger
        Name = 'MainInst'
      end
      item
        DataType = ftDateTime
        Name = 'CurDate'
      end>
  end
  object qTalonDetail: TOilQuery
    SQL.Strings = (
      '/* '#1047#1072#1087#1088#1086#1089' '#1084#1077#1085#1103#1077#1090#1089#1103' '#1085#1072' '#1083#1077#1090#1091' - '#1085#1077' '#1084#1077#1085#1103#1090#1100' '#1087#1086#1088#1103#1076#1086#1082' '#1089#1090#1088#1086#1082'! */'
      'select decode(Tip, '#39'P'#39', '#39#1055#1088#1080#1093#1086#1076#39', '#39#1054#1090#1087#1091#1089#1082#39') as Title,'
      '       Date_ as Prih_Date,'
      '       decode(Tip, '#39'P'#39', 2, 1),'
      '       Head_Num as Prih_Num,'
      '       Nominal,'
      '       NPGrp_Id,'
      '       NP_Group.Name as NPGrpName'
      '  from V_Oil_Talon_Op, v_Oil_NP_Group NP_Group'
      ' where Ser = :Ser'
      '   and Num = :Num'
      '   and Code_Obl = :code_obl'
      '   and NPGrp_Id = NP_Group.Id(+)'
      ' order by 2 desc, 3 desc')
    MasterSource = dsTalon
    AutoCalcFields = False
        DataSource = dsTalon
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 472
    Top = 282
    ParamData = <
      item
        DataType = ftString
        Name = 'Ser'
      end
      item
        DataType = ftInteger
        Name = 'Num'
      end
      item
        DataType = ftInteger
        Name = 'code_obl'
      end>
  end
  object qPriorPrih: TOilQuery
    SQL.Strings = (
      'select max(Date_)'
      '  from (select Ser, Num'
      '          from V_Oil_Talon_Op'
      '         where Tip = '#39'O'#39
      '           and Head_Id = :MainId'
      '           and Head_Inst = :MainInst) CurSerNum,'
      '       V_Oil_Talon_Op p'
      ' where p.Tip = '#39'P'#39
      '   and p.Ser = CurSerNum.Ser'
      '   and p.Num = CurSerNum.Num'
      '   and p.Date_ < :CurDate')
    AutoCalcFields = False
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 30
    Top = 147
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MainId'
      end
      item
        DataType = ftInteger
        Name = 'MainInst'
      end
      item
        DataType = ftDateTime
        Name = 'CurDate'
      end>
  end
  object qNNpoOut: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 481
    Top = 116
  end
  object qTExchSverka: TOilQuery
    SQL.Strings = (
      '-->qTExchSverka,TalonOutRefForm'
      'select dog.dog,'
      '       dog.dog_date,'
      '       npg.name as np_group,'
      '       tal.nominal,'
      '       tal.ser,'
      '       tal.num,'
      '       1 as shtuki'
      '  from (select v.*,'
      
        '               row_number() over(partition by ser, num order by ' +
        'date_ desc, tip desc) as rnum'
      '          from v_oil_talon_op v'
      '         where date_ <= to_date(:p_date,'#39'dd.mm.yyyy'#39')'
      '           and inst = :org_inst'
      '           and 5e8 > v.num   --'#1090#1072#1083#1086#1085#1080' '#1089#1090#1072#1088#1086#1075#1086' '#1079#1088#1072#1079#1082#1072'         '
      '           ) tal,'
      '       v_oil_np_group npg, oil_dog dog'
      ' where tal.rnum = 1'
      '   and tal.tip = '#39'O'#39
      '   and tal.oper_id in (190,245)'
      '   and tal.dog_id = dog.id'
      '   and tal.to_id = :org_id'
      '   and tal.to_inst = :org_inst'
      '   and tal.dog_inst = dog.inst'
      '   and tal.npgrp_id = npg.id'
      'order by npg.id, dog.dog_date, dog.dog')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 651
    Top = 97
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_date'
      end
      item
        DataType = ftUnknown
        Name = 'org_inst'
      end
      item
        DataType = ftUnknown
        Name = 'org_id'
      end>
    object qTExchSverkaDOG: TStringField
      FieldName = 'DOG'
      Size = 35
    end
    object qTExchSverkaDOG_DATE: TDateTimeField
      FieldName = 'DOG_DATE'
    end
    object qTExchSverkaNP_GROUP: TStringField
      FieldName = 'NP_GROUP'
      Size = 50
    end
    object qTExchSverkaNOMINAL: TFloatField
      FieldName = 'NOMINAL'
    end
    object qTExchSverkaSER: TStringField
      FieldName = 'SER'
      Size = 3
    end
    object qTExchSverkaNUM: TFloatField
      FieldName = 'NUM'
    end
    object qTExchSverkaSHTUKI: TFloatField
      FieldName = 'SHTUKI'
    end
  end
  object qTExch_MinPrihMaxOut: TOilQuery
    SQL.Strings = (
      '-->qTExch_MinPrihMaxOut,TalonOutRefForm'
      'select min(p.prih_date) as min_prih_date,'
      '       max(o.out_date) as max_out_date'
      '  from oil_talon_prih p, oil_talon_out o, dual x'
      ' where o.state(+)='#39'Y'#39' and p.state(+)='#39'Y'#39
      '   and p.oper_id(+) = 243   -- '#1087#1086#1074#1077#1088#1085#1077#1085#1085#1103' '#1087#1086' '#1086#1073#1084#1110#1085#1091
      '   and o.oper_id(+) = 244   -- '#1074#1110#1076#1087#1091#1089#1082' '#1087#1086' '#1086#1073#1084#1110#1085#1091
      '   and o.org_id(+) = :org_id'
      '   and p.org_id(+) = :org_id'
      '   and o.org_inst(+) = :org_inst'
      '   and p.org_inst(+) = :org_inst'
      '   and nvl('#39'X'#39', x.dummy) = nvl('#39'X'#39', p.rowid(+))'
      '   and nvl('#39'X'#39', x.dummy) = nvl('#39'X'#39', o.rowid(+))')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 587
    Top = 209
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'org_id'
      end
      item
        DataType = ftUnknown
        Name = 'org_inst'
      end>
  end
  object qTExchPrih: TOilQuery
    SQL.Strings = (
      '-->qTExchPrih,TalonOutRefForm'
      'select npg.name as np_group,'
      '       tal.nominal,'
      '       tal.ser,'
      '       tal.num,'
      '       1 as shtuki'
      '  from v_oil_talon_op tal,'
      '       v_oil_np_group npg'
      ' where tal.tip = '#39'P'#39
      '   and oper_id = 243'
      '   and date_ <= to_date(:p_date, '#39'dd.mm.yyyy'#39')'
      '   and tal.org_id = :org_id'
      '   and tal.org_inst = :org_inst'
      '   and tal.npgrp_id = npg.id'
      '   and (tal.Ser, tal.num) in (select distinct ser, num'
      '                                from v_oil_talon_op'
      '                               where tip = '#39'O'#39
      '                                 and dog_id = :dog_id'
      
        '                                 and dog_inst = :dog_inst)      ' +
        '     '
      'order by npg.id, tal.Date_           ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 651
    Top = 141
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_date'
      end
      item
        DataType = ftUnknown
        Name = 'org_id'
      end
      item
        DataType = ftUnknown
        Name = 'org_inst'
      end
      item
        DataType = ftUnknown
        Name = 'dog_id'
      end
      item
        DataType = ftUnknown
        Name = 'dog_inst'
      end>
    object qTExchPrihNP_GROUP: TStringField
      FieldName = 'NP_GROUP'
      Size = 50
    end
    object qTExchPrihNOMINAL: TFloatField
      FieldName = 'NOMINAL'
    end
    object qTExchPrihSER: TStringField
      FieldName = 'SER'
      Size = 3
    end
    object qTExchPrihNUM: TFloatField
      FieldName = 'NUM'
    end
    object qTExchPrihSHTUKI: TFloatField
      FieldName = 'SHTUKI'
    end
  end
  object qTExchOut: TOilQuery
    SQL.Strings = (
      '-->qTExchOut,TalonOutRefForm'
      'select npg.name as np_group,'
      '       tal.nominal,'
      '       tal.ser,'
      '       tal.num,'
      '       1 as shtuki'
      '  from v_oil_talon_op tal,'
      '       v_oil_np_group npg'
      ' where tal.oper_id = 244'
      '   and tal.tip = '#39'O'#39
      '   and tal.head_id = :head_id'
      '   and tal.head_inst = :head_inst'
      '   and tal.npgrp_id = npg.id'
      'order by npg.id, tal.Date_')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 651
    Top = 189
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'head_id'
      end
      item
        DataType = ftUnknown
        Name = 'head_inst'
      end>
    object qTExchOutNP_GROUP: TStringField
      FieldName = 'NP_GROUP'
      Size = 50
    end
    object qTExchOutNOMINAL: TFloatField
      FieldName = 'NOMINAL'
    end
    object qTExchOutSER: TStringField
      FieldName = 'SER'
      Size = 3
    end
    object qTExchOutNUM: TFloatField
      FieldName = 'NUM'
    end
    object qTExchOutSHTUKI: TFloatField
      FieldName = 'SHTUKI'
    end
  end
end
