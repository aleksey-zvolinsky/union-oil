inherited CardRNAlienPrintForm: TCardRNAlienPrintForm
  Left = 445
  Top = 257
  Width = 617
  Height = 514
  BorderIcons = [biSystemMenu]
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1080' '#1087#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1087#1086' '#1095#1091#1078#1080#1084' '#1089#1087#1080#1089#1072#1085#1080#1103#1084
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 320
    Width = 609
    Height = 135
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object reLog: TRichEdit
      Left = 2
      Top = 2
      Width = 605
      Height = 131
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 609
    Height = 320
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlRight: TPanel
      Left = 391
      Top = 0
      Width = 218
      Height = 320
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object pnlPrint: TPanel
        Left = 2
        Top = 154
        Width = 214
        Height = 128
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 36
          Width = 7
          Height = 13
          Caption = 'C'
        end
        object Label2: TLabel
          Left = 107
          Top = 36
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object Label3: TLabel
          Left = 5
          Top = 8
          Width = 144
          Height = 13
          Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1082#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object deBegin: TDateEdit
          Left = 20
          Top = 32
          Width = 85
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
        object deEnd: TDateEdit
          Left = 123
          Top = 32
          Width = 85
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
        end
        object bbPrint: TBitBtn
          Left = 118
          Top = 93
          Width = 90
          Height = 25
          Caption = #1055#1077#1095#1072#1090#1100
          TabOrder = 2
          OnClick = bbPrintClick
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
        object cbPrint: TCheckBox
          Left = 5
          Top = 64
          Width = 137
          Height = 17
          Caption = #1057' '#1074#1099#1074#1086#1076#1086#1084' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
          TabOrder = 3
          OnClick = cbPrintClick
        end
        object cbOrig: TCheckBox
          Left = 24
          Top = 84
          Width = 90
          Height = 17
          Caption = #1054#1088#1080#1075#1080#1085#1072#1083
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 4
        end
        object cbCopy: TCheckBox
          Left = 24
          Top = 104
          Width = 90
          Height = 17
          Caption = #1050#1086#1087#1080#1103
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 5
        end
      end
      object pnlForm: TPanel
        Left = 2
        Top = 2
        Width = 214
        Height = 89
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Label4: TLabel
          Left = 5
          Top = 8
          Width = 166
          Height = 13
          Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 5
          Top = 32
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object bbCreateDoc: TBitBtn
          Left = 118
          Top = 26
          Width = 90
          Height = 25
          Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
          TabOrder = 0
          OnClick = bbCreateDocClick
        end
        object deForm: TDateEdit
          Left = 20
          Top = 28
          Width = 85
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
        end
        object cbUnion: TCheckBox
          Left = 20
          Top = 51
          Width = 177
          Height = 17
          Hint = 
            #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1086#1076#1085#1080#1084' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074', '#1085#1072' '#1086#1076#1085#1091' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102', '#1079#1072' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' ' +
            #1087#1077#1088#1080#1086#1076
          Caption = #1054#1076#1085#1080#1084' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1084
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = cbUnionClick
        end
        object cbSplitDT: TCheckBox
          Left = 20
          Top = 67
          Width = 189
          Height = 17
          Hint = 
            #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1086#1076#1080#1085' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1089' '#1087#1072#1088#1090#1080#1103' '#1084#1080' '#1058#1044', '#1080' '#1086#1076#1080#1085' '#1085#1072' '#1074#1089#1077' '#1086#1089#1090#1072#1083#1100#1085#1099 +
            #1077' '#1087#1072#1088#1090#1080#1080' ('#1074#1082#1083#1102#1095#1072#1103' '#1058#1044'***/'#1048').'
          Caption = #1056#1072#1079#1076#1077#1083#1103#1090#1100' '#1082#1086#1084#1080#1089#1089#1080#1102' '#1080' '#1089#1086#1073#1089#1090#1074'.'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 91
        Width = 214
        Height = 63
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object Label6: TLabel
          Left = 6
          Top = 8
          Width = 133
          Height = 13
          Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 5
          Top = 36
          Width = 6
          Height = 13
          Caption = #1089
        end
        object sbDel: TBitBtn
          Left = 118
          Top = 30
          Width = 90
          Height = 25
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 0
          OnClick = sbDelClick
        end
        object deDel: TDateEdit
          Left = 20
          Top = 32
          Width = 85
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object Panel1: TPanel
        Left = 2
        Top = 282
        Width = 214
        Height = 36
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 3
        DesignSize = (
          214
          36)
        object bbCancel: TBitBtn
          Left = 118
          Top = 5
          Width = 90
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '&'#1047#1072#1082#1088#1099#1090#1100
          TabOrder = 0
          OnClick = bbCancelClick
          Kind = bkCancel
        end
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 391
      Height = 320
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object gridMain: TDBGridEh
        Left = 2
        Top = 2
        Width = 387
        Height = 316
        Align = alClient
        AllowedOperations = [alopUpdateEh, alopDeleteEh, alopAppendEh]
        AutoFitColWidths = True
        DataSource = dsGrid
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        PopupMenu = pm
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        VertScrollBar.VisibleMode = sbAlwaysShowEh
        OnGetCellParams = gridMainGetCellParams
        OnMouseMove = gridMainMouseMove
        Columns = <
          item
            Checkboxes = False
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #1054#1073#1083#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
            Width = 222
          end
          item
            AutoFitColWidth = False
            Checkboxes = False
            EditButtons = <>
            FieldName = 'START_DATE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1057#1090#1072#1088#1090#1086#1074#1072#1103' '#1076#1072#1090#1072
            Visible = False
            Width = 63
          end
          item
            AutoFitColWidth = False
            Checkboxes = False
            EditButtons = <>
            FieldName = 'NEXT_DATE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1076#1072#1090#1099
            Width = 63
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'NEXT_NUM'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1085#1086#1084#1077#1088#1072
          end>
      end
    end
  end
  object pbDet: TProgressBar
    Left = 0
    Top = 455
    Width = 609
    Height = 16
    Align = alBottom
    Step = 1
    TabOrder = 2
  end
  object pbMain: TProgressBar
    Left = 0
    Top = 471
    Width = 609
    Height = 16
    Align = alBottom
    Step = 1
    TabOrder = 3
  end
  object q: TOilQuery
    SQL.Strings = (
      'select *'
      'from v_card_transit'
      'where oblid=:oblid'
      '      and date_ between :BeginDate and :EndDate'
      'order by date_,ord_num,oplat_only desc'
      ''
      ' '
      ' '
      ' '
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 104
    Top = 89
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oblid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
        ParamType = ptInput
      end>
    object qORD_NUM: TFloatField
      FieldName = 'ORD_NUM'
      Origin = 'V_CARD_TRANSIT.ORD_NUM'
    end
    object qTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Origin = 'V_CARD_TRANSIT.TABLE_NAME'
      Size = 12
    end
    object qID_NAME: TStringField
      FieldName = 'ID_NAME'
      Origin = 'V_CARD_TRANSIT.ID_NAME'
      Size = 6
    end
    object qINST_NAME: TStringField
      FieldName = 'INST_NAME'
      Origin = 'V_CARD_TRANSIT.INST_NAME'
      Size = 8
    end
    object qID: TFloatField
      FieldName = 'ID'
      Origin = 'V_CARD_TRANSIT.ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Origin = 'V_CARD_TRANSIT.INST'
    end
    object qNN_ID: TFloatField
      FieldName = 'NN_ID'
      Origin = 'V_CARD_TRANSIT.NN_ID'
    end
    object qNN_INST: TFloatField
      FieldName = 'NN_INST'
      Origin = 'V_CARD_TRANSIT.NN_INST'
    end
    object qNN_NUM: TStringField
      FieldName = 'NN_NUM'
      Origin = 'V_CARD_TRANSIT.NN_NUM'
      Size = 8
    end
    object qNUM: TFloatField
      FieldName = 'NUM'
      Origin = 'V_CARD_TRANSIT.NUM'
    end
    object qDATE_: TDateTimeField
      FieldName = 'DATE_'
      Origin = 'V_CARD_TRANSIT.DATE_'
    end
    object qOBLID: TFloatField
      FieldName = 'OBLID'
      Origin = 'V_CARD_TRANSIT.OBLID'
    end
    object qNP_GROUP_ID: TFloatField
      FieldName = 'NP_GROUP_ID'
      Origin = 'V_CARD_TRANSIT.NP_GROUP_ID'
    end
    object qDIM_ID: TFloatField
      FieldName = 'DIM_ID'
      Origin = 'V_CARD_TRANSIT.DIM_ID'
    end
    object qCOUNT: TFloatField
      FieldName = 'COUNT'
      Origin = 'V_CARD_TRANSIT.COUNT'
    end
    object qPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = 'V_CARD_TRANSIT.PRICE'
    end
    object qSUMMA: TFloatField
      FieldName = 'SUMMA'
      Origin = 'V_CARD_TRANSIT.SUMMA'
    end
    object qDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Origin = 'V_CARD_TRANSIT.DOC_NUMBER'
      Size = 10
    end
    object qOPLAT_ONLY: TStringField
      FieldName = 'OPLAT_ONLY'
      Origin = 'V_CARD_TRANSIT.OPLAT_ONLY'
      Size = 1
    end
  end
  object mtDT: TMemoryTable
    Left = 64
    Top = 89
    object mtDTNP_GROUP_ID: TFloatField
      FieldName = 'NP_GROUP_ID'
    end
    object mtDTCOUNT: TFloatField
      FieldName = 'COUNT'
    end
    object mtDTPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object mtDTSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
  end
  object mtOpl: TMemoryTable
    Left = 64
    Top = 137
    object mtOplNN_ID: TFloatField
      FieldName = 'NN_ID'
    end
    object mtOplNP_GROUP_ID: TFloatField
      FieldName = 'NP_GROUP_ID'
    end
    object mtOplNN_NUMBER: TStringField
      FieldName = 'NN_NUMBER'
    end
    object mtOplNUMBER: TStringField
      FieldName = 'NUMBER'
    end
    object mtOplDATE_: TDateField
      FieldName = 'DATE_'
    end
    object mtOplCOUNT: TFloatField
      FieldName = 'COUNT'
    end
    object mtOplSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object mtOplPRICE: TFloatField
      FieldName = 'PRICE'
    end
  end
  object qReport: TOilQuery
    SQL.Strings = (
      
        'select /*+ORDERED USE_NL(Oil_Dog, From_Org, From_Org_Det,From_Re' +
        'kv, From_Bank, To_Org, To_Org_Det, To_Rekv, To_Bank)*/'
      ' Oil_Dog.*,'
      ' npt.np_grp as np_group_id,'
      ' nvl(From_Org_Det.Full_Name, From_Org.Name) as From_Name,'
      ' From_Org.Addr as From_Addr,'
      ' From_Org.Svid_Num as From_Svid_Num,'
      ' From_Org.Nal_Num as From_Nal_Num,'
      ' From_Org.Boss as From_Boss,'
      ' From_Org.Id_Num as From_OKPO,'
      ' From_Org.Phone as From_Phone,'
      ' From_Rekv.Rach_Chet as From_Rach_Chet,'
      ' From_Bank.Name as From_Bank_Name,'
      ' From_Bank.MFO as From_MFO,'
      ' nvl(To_Org_Det.Full_Name, To_Org.Name) as To_Name,'
      ' To_Org.Addr as To_Addr,'
      ' To_Org.Svid_Num as To_Svid_Num,'
      ' To_Org.Nal_Num as To_Nal_Num,'
      ' To_Org.Boss as To_Boss,'
      ' To_Org.Id_Num as To_OKPO,'
      ' To_Org.Phone as To_Phone,'
      ' To_Rekv.Rach_Chet as To_Rach_Chet,'
      ' To_Bank.Name as To_Bank_Name,'
      ' To_Bank.MFO as To_MFO,'
      ' To_Org.Face as To_Face,'
      ' To_Org.Passport_ser as Passp_Ser,'
      ' To_Org.Passport_num as Passp_Num,'
      ' To_Org.Passport_whom as Passp_whom,'
      ' To_Org.Passport_when as Passp_when,'
      ' Up_From_Org.Name as Up_From_Name,'
      ' Up_From_Org.Addr as Up_From_Addr,'
      ' Up_From_Org.Phone as Up_From_Phone,'
      ' Up_From_Org.Svid_Num as Up_From_Svid_Num,'
      ' Up_From_Org.Nal_Num as Up_From_Nal_Num'
      '  from Oil_Dog,'
      '       v_Org From_Org,'
      '       Oil_Org_Det From_Org_Det,'
      '       v_Org Up_From_Org,'
      '       v_Oil_Rekvizit From_Rekv,'
      '       v_Oil_Bank From_Bank,'
      '       v_Org To_Org,'
      '       Oil_Org_Det To_Org_Det,'
      '       v_Oil_Rekvizit To_Rekv,'
      '       v_Oil_Bank To_Bank,'
      '       v_Oil_NP_Type npt'
      ' where Oil_Dog.State = '#39'Y'#39
      '   and Oil_Dog.Dog_Date = (select min(Dog_Date)'
      '                             from oil_dog'
      '                            where state = '#39'Y'#39
      '                              and to_ = :OrgId'
      '                              and to_inst = :OrgInst'
      '                              and dog_type = '#39'K'#39')'
      '   and Oil_Dog.to_ = :OrgId'
      '   and Oil_Dog.to_inst = :OrgInst'
      '   and Oil_Dog.dog_type = '#39'K'#39
      '   and Oil_Dog.From_ = From_Org.Id'
      '   and Oil_Dog.From_Inst = From_Org.Inst'
      '   and From_Org.Id = From_Org_Det.Org_Id(+)'
      '   and From_Org.Inst = From_Org_Det.Inst(+)'
      '   and From_Org.Par = Up_From_Org.Id'
      '   and From_Org.Par_Inst = Up_From_Org.Inst'
      '   and Oil_Dog.R_From_ = From_Rekv.Id(+)'
      '   and Oil_Dog.R_From_Inst = From_Rekv.Inst(+)'
      '   and From_Rekv.Id_Bank = From_Bank.Id(+)'
      '   and From_Rekv.Bank_Inst = From_Bank.Inst(+)'
      '   and Oil_Dog.To_ = To_Org.Id'
      '   and Oil_Dog.To_Inst = To_Org.Inst'
      '   and To_Org.Id = To_Org_Det.Org_Id(+)'
      '   and To_Org.Inst = To_Org_Det.Inst(+)'
      '   and Oil_Dog.R_To_ = To_Rekv.Id(+)'
      '   and Oil_Dog.R_To_Inst = To_Rekv.Inst(+)'
      '   and To_Rekv.Id_Bank = To_Bank.Id(+)'
      '   and To_Rekv.Bank_Inst = To_Bank.Inst(+)'
      '   and Oil_Dog.np_type = npt.id(+)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 14
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end>
    object qReportID: TFloatField
      FieldName = 'ID'
    end
    object qReportSTATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object qReportINST: TFloatField
      FieldName = 'INST'
    end
    object qReportDOG: TStringField
      FieldName = 'DOG'
      Size = 15
    end
    object qReportDOG_DATE: TDateTimeField
      FieldName = 'DOG_DATE'
    end
    object qReportEXP_DATE: TDateTimeField
      FieldName = 'EXP_DATE'
    end
    object qReportFROM_: TFloatField
      FieldName = 'FROM_'
    end
    object qReportFROM_INST: TFloatField
      FieldName = 'FROM_INST'
    end
    object qReportTO_: TFloatField
      FieldName = 'TO_'
    end
    object qReportTO_INST: TFloatField
      FieldName = 'TO_INST'
    end
    object qReportCOMM: TStringField
      FieldName = 'COMM'
      Size = 100
    end
    object qReportNP_TYPE: TFloatField
      FieldName = 'NP_TYPE'
    end
    object qReportDIM_ID: TFloatField
      FieldName = 'DIM_ID'
    end
    object qReportNP_GROUP_ID: TFloatField
      FieldName = 'NP_GROUP_ID'
    end
    object qReportPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object qReportCOUNT_: TFloatField
      FieldName = 'COUNT_'
    end
    object qReportDOG_TYPE: TStringField
      FieldName = 'DOG_TYPE'
      Size = 1
    end
    object qReportR_FROM_: TFloatField
      FieldName = 'R_FROM_'
    end
    object qReportR_FROM_INST: TFloatField
      FieldName = 'R_FROM_INST'
    end
    object qReportR_TO_: TFloatField
      FieldName = 'R_TO_'
    end
    object qReportR_TO_INST: TFloatField
      FieldName = 'R_TO_INST'
    end
    object qReportBARTERNP: TFloatField
      FieldName = 'BARTERNP'
    end
    object qReportDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
    end
    object qReportFOREPAY: TFloatField
      FieldName = 'FOREPAY'
    end
    object qReportPAY_TYPE: TFloatField
      FieldName = 'PAY_TYPE'
    end
    object qReportPAY_CORR: TFloatField
      FieldName = 'PAY_CORR'
    end
    object qReportFROM_ADDR: TStringField
      FieldName = 'FROM_ADDR'
      Size = 200
    end
    object qReportFROM_SVID_NUM: TStringField
      FieldName = 'FROM_SVID_NUM'
      Size = 50
    end
    object qReportFROM_NAL_NUM: TStringField
      FieldName = 'FROM_NAL_NUM'
      Size = 50
    end
    object qReportFROM_BOSS: TStringField
      FieldName = 'FROM_BOSS'
      Size = 50
    end
    object qReportFROM_OKPO: TStringField
      FieldName = 'FROM_OKPO'
    end
    object qReportFROM_PHONE: TStringField
      FieldName = 'FROM_PHONE'
      Size = 30
    end
    object qReportFROM_RACH_CHET: TStringField
      FieldName = 'FROM_RACH_CHET'
    end
    object qReportFROM_BANK_NAME: TStringField
      FieldName = 'FROM_BANK_NAME'
      Size = 50
    end
    object qReportFROM_MFO: TStringField
      FieldName = 'FROM_MFO'
    end
    object qReportTO_ADDR: TStringField
      FieldName = 'TO_ADDR'
      Size = 200
    end
    object qReportTO_SVID_NUM: TStringField
      FieldName = 'TO_SVID_NUM'
      Size = 50
    end
    object qReportTO_NAL_NUM: TStringField
      FieldName = 'TO_NAL_NUM'
      Size = 50
    end
    object qReportTO_BOSS: TStringField
      FieldName = 'TO_BOSS'
      Size = 50
    end
    object qReportTO_OKPO: TStringField
      FieldName = 'TO_OKPO'
    end
    object qReportTO_PHONE: TStringField
      FieldName = 'TO_PHONE'
      Size = 30
    end
    object qReportTO_RACH_CHET: TStringField
      FieldName = 'TO_RACH_CHET'
    end
    object qReportTO_BANK_NAME: TStringField
      FieldName = 'TO_BANK_NAME'
      Size = 50
    end
    object qReportTO_MFO: TStringField
      FieldName = 'TO_MFO'
    end
    object qReportTO_FACE: TFloatField
      FieldName = 'TO_FACE'
    end
    object qReportPASSP_SER: TStringField
      FieldName = 'PASSP_SER'
      Size = 2
    end
    object qReportPASSP_NUM: TStringField
      FieldName = 'PASSP_NUM'
      Size = 6
    end
    object qReportPASSP_WHOM: TStringField
      FieldName = 'PASSP_WHOM'
      Size = 100
    end
    object qReportPASSP_WHEN: TDateTimeField
      FieldName = 'PASSP_WHEN'
    end
    object qReportUP_FROM_NAME: TStringField
      FieldName = 'UP_FROM_NAME'
      Size = 100
    end
    object qReportUP_FROM_ADDR: TStringField
      FieldName = 'UP_FROM_ADDR'
      Size = 200
    end
    object qReportUP_FROM_PHONE: TStringField
      FieldName = 'UP_FROM_PHONE'
      Size = 30
    end
    object qReportUP_FROM_SVID_NUM: TStringField
      FieldName = 'UP_FROM_SVID_NUM'
      Size = 50
    end
    object qReportUP_FROM_NAL_NUM: TStringField
      FieldName = 'UP_FROM_NAL_NUM'
      Size = 50
    end
    object qReportSUB_TYPE: TFloatField
      FieldName = 'SUB_TYPE'
    end
    object qReportFROM_NAME: TStringField
      FieldName = 'FROM_NAME'
      Size = 300
    end
    object qReportTO_NAME: TStringField
      FieldName = 'TO_NAME'
      Size = 300
    end
  end
  object qPrilNum: TOilQuery
    SQL.Strings = (
      'select'
      '  nvl(max(doc_number),0)+1 as next_number'
      'from'
      
        '  (select to_number(decode(doc_number,new_doc_number,doc_number,' +
        'null)) as doc_number'
      '   from'
      '     (select'
      '        translate(doc_number,'#39'/\- '#39','#39'@@@@'#39') as new_doc_number,'
      '        doc_number'
      '      from card_transit'
      '      where Card.GetObl(card_number,oper_date)=:obl_id '
      '     )'
      '  )'
      ''
      ' '
      ' '
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 16
    Top = 233
    ParamData = <
      item
        DataType = ftInteger
        Name = 'obl_id'
        ParamType = ptInput
      end>
    object qPrilNumNEXT_NUMBER: TFloatField
      FieldName = 'NEXT_NUMBER'
    end
  end
  object qDates: TOilQuery
    SQL.Strings = (
      'select trunc(oper_date) as date_'
      'from card_transit'
      'where Card.GetObl(card_number,oper_date)=:obl_id'
      '  and trunc(oper_date) between :begindate and :enddate'
      'group by trunc(oper_date)'
      'order by trunc(oper_date)'
      ' '
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 16
    Top = 137
    ParamData = <
      item
        DataType = ftInteger
        Name = 'obl_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'begindate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'enddate'
        ParamType = ptInput
      end>
    object qDatesDATE_: TDateTimeField
      FieldName = 'DATE_'
    end
  end
  object qRN: TOilQuery
    SQL.Strings = (
      'select /*+ORDERED*/'
      '       npg.fullname as np_name,'
      '       nvl(oo.par_name,oo.emitent_name) as filial_name,'
      '       oo.name||'#39' '#39'||oo.par_name as full_azs_name,'
      '       oo.name as azs_name,'
      '       ct.card_number,'
      '       trunc(ct.oper_date) as oper_date,'
      '       to_char(ct.oper_date,'#39'yymmddhh24miss'#39')'
      '         || substr(to_char(ct.azs_id-1000000),2,2)'
      
        '         || lpad(to_char(ct.card_number),10,'#39'0'#39') as check_number' +
        ','
      
        '       ct.azs_id,ct.doc_number,ct.doc_date,ct.litr,decode(ov.lan' +
        'guage,0,'#39#1083#1080#1090#1088#39','#39#1083#1110#1090#1088#39') as dim_name,'
      
        '       NDS.GetNoNds_WithNds(ct.term_price,ct.oper_date,4) as Pri' +
        'ceXNds,'
      
        '       NDS.GetNoNds_WithNds(round(ct.term_price*ct.litr,2),ct.op' +
        'er_date,2) as SumXNDS,'
      
        '       NDS.GetNds_WithNds(round(ct.term_price*ct.litr,2),ct.oper' +
        '_date) as Nds,'
      '       round(ct.term_price,2) as PriceNds,'
      '       round(ct.term_price*ct.litr,2) as SumNds'
      
        'from card_transit ct, v_oil_np_group npg, v_card_azs oo, oil_inf' +
        'o oi'
      'where ct.azs_id = oo.id (+) and ct.azs_id = oo.inst (+)'
      '      and Card.GetObl(ct.card_number, ct.oper_date)=:obl_id'
      '      and trunc(ct.oper_date) between :BeginDate and :EndDate'
      '      and ct.np_type = npg.petrol_id (+)'
      '      and oo.obl_id=oi.main_inst'
      'order by filial_name,azs_name,npg.fullname,ct.oper_date')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 200
    Top = 89
    ParamData = <
      item
        DataType = ftInteger
        Name = 'obl_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
        ParamType = ptInput
      end>
    object qRNNP_NAME: TStringField
      FieldName = 'NP_NAME'
      Size = 40
    end
    object qRNFILIAL_NAME: TStringField
      FieldName = 'FILIAL_NAME'
      Size = 100
    end
    object qRNAZS_NAME: TStringField
      FieldName = 'AZS_NAME'
      Size = 100
    end
    object qRNCARD_NUMBER: TFloatField
      FieldName = 'CARD_NUMBER'
    end
    object qRNOPER_DATE: TDateTimeField
      FieldName = 'OPER_DATE'
    end
    object qRNCHECK_NUMBER: TStringField
      FieldName = 'CHECK_NUMBER'
      Size = 24
    end
    object qRNAZS_ID: TFloatField
      FieldName = 'AZS_ID'
    end
    object qRNDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 10
    end
    object qRNDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object qRNLITR: TFloatField
      FieldName = 'LITR'
    end
    object qRNPRICEXNDS: TFloatField
      FieldName = 'PRICEXNDS'
    end
    object qRNSUMXNDS: TFloatField
      FieldName = 'SUMXNDS'
    end
    object qRNNDS: TFloatField
      FieldName = 'NDS'
    end
    object qRNPRICENDS: TFloatField
      FieldName = 'PRICENDS'
    end
    object qRNSUMNDS: TFloatField
      FieldName = 'SUMNDS'
    end
    object qRNDIM_NAME: TStringField
      FieldName = 'DIM_NAME'
      Size = 4
    end
    object qRNFULL_AZS_NAME: TStringField
      FieldName = 'FULL_AZS_NAME'
      Size = 201
    end
  end
  object qNN: TOilQuery
    SQL.Strings = (
      'select'
      
        '  sb.num,sb.f_doc,sb.frasch,sb.r_date,sbd.tov_id,npg.fullname as' +
        ' np_name,'
      '  dim.name as dim_name,sbd.div_id,'
      '  sum(sbd.kol) as kol,'
      '  sum(sbd.nds_t) as nds_t,'
      '  sum(round(sbd.nds_p_base,2)) as nds_p_base,'
      '  sum(round(sbd.nds_p_20,2)) as nds_p_20,'
      '  NDS.GetNoNds_WithNds(pricends,sb.r_date,4) as pricexnds,'
      '  pricends'
      'from'
      '  oil_sale_book sb,'
      '  (select sbd2.*,'
      
        '     decode(sbd2.kol,0,0,round((round(sbd2.nds_p_base,2)+sbd2.nd' +
        's_p_20)/sbd2.kol,2)) as pricends'
      '   from oil_sale_book_det sbd2'
      '  ) sbd,'
      '  v_oil_np_group npg, v_oil_dimension dim'
      'where'
      '  sb.state='#39'Y'#39' and sbd.state='#39'Y'#39
      '  and sbd.nn_id=sb.id and sbd.nn_inst=sb.inst'
      '  and sb.nal_t=:nal_t'
      '  and sb.s_date=:date_'
      '  and sb.organ=sb.organ_inst and sb.organ=:oblid'
      '  and sb.from_=sb.from_inst and sb.from_=:fromid'
      '  and sbd.tov_id=npg.id(+) and sbd.div_id=dim.id(+)'
      
        'group by sb.num,sb.f_doc,sb.frasch,sb.r_date,npg.fullname,dim.na' +
        'me,sbd.div_id,sbd.tov_id,pricends')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 200
    Top = 137
    ParamData = <
      item
        DataType = ftInteger
        Name = 'nal_t'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oblid'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'fromid'
        ParamType = ptInput
      end>
    object qNNNUM: TStringField
      FieldName = 'NUM'
      Size = 8
    end
    object qNNF_DOC: TStringField
      FieldName = 'F_DOC'
      Size = 200
    end
    object qNNFRASCH: TStringField
      FieldName = 'FRASCH'
      Size = 100
    end
    object qNNR_DATE: TDateTimeField
      FieldName = 'R_DATE'
    end
    object qNNKOL: TFloatField
      FieldName = 'KOL'
    end
    object qNNTOV_ID: TFloatField
      FieldName = 'TOV_ID'
    end
    object qNNNP_NAME: TStringField
      FieldName = 'NP_NAME'
      Size = 40
    end
    object qNNDIM_NAME: TStringField
      FieldName = 'DIM_NAME'
      Size = 50
    end
    object qNNDIV_ID: TFloatField
      FieldName = 'DIV_ID'
    end
    object qNNNDS_T: TFloatField
      FieldName = 'NDS_T'
    end
    object qNNNDS_P_BASE: TFloatField
      FieldName = 'NDS_P_BASE'
    end
    object qNNNDS_P_20: TFloatField
      FieldName = 'NDS_P_20'
    end
    object qNNPRICEXNDS: TFloatField
      FieldName = 'PRICEXNDS'
    end
    object qNNPRICENDS: TFloatField
      FieldName = 'PRICENDS'
    end
  end
  object qGridBase: TOilQuery
    SQL.Strings = (
      '-- '#1084#1077#1078#1076#1091' '#1092#1080#1083#1080#1072#1083#1072#1084#1080' '#1080' '#1085#1077'-'#1092#1080#1083#1080#1072#1083#1072#1084#1080' ('#1074' '#1086#1073#1077' '#1089#1090#1086#1088#1086#1085#1099')'
      'select oo.id,'
      '       oo.name,'
      '       ctr.start_date,'
      '       nvl(aldoc.date_ + 1,'
      
        '           greatest(nvl(cm.maxdate, ctr.start_date), ctr.start_d' +
        'ate)) as next_date,'
      '       to_number(null) as next_num,'
      '       decode(cm.maxdate, null, '#39'N'#39', '#39'Y'#39') as DocsExists,'
      '       '#39'N'#39' as IsBetweenFil,'
      '       to_char(null) as rn_through'
      '  from (select distinct obl_id, start_date'
      '          from oil_ct_rest'
      '         where state = '#39'Y'#39') ctr,'
      '       v_org oo,'
      
        '       (select card.GetObl(ct.card_number, trunc(ct.oper_date)) ' +
        'as oblid,'
      '               max(trunc(ct.oper_date)) + 1 as maxdate'
      '          from card_transit ct'
      '         where ct.doc_number is not null'
      
        '         group by card.GetObl(ct.card_number, trunc(ct.oper_date' +
        '))) cm,'
      '       (select *'
      '          from (select cad.*,'
      
        '                       row_number() over(partition by obl_id ord' +
        'er by id desc) as rnum'
      '                  from card_alien_doc cad'
      '                 where state = '#39'Y'#39')'
      '         where rnum = 1) aldoc,'
      '       v_main_org omain'
      ' where ctr.obl_id = oo.id'
      '   and ctr.obl_id = oo.inst'
      '   and oo.id = cm.oblid(+)'
      '   and oo.inst = cm.oblid(+)'
      '   and omain.org_type = 4'
      '   and not (omain.par = 4587 and oo.par = 4587)'
      '   and not (omain.par = 4000 and oo.par = 4000)'
      '   and aldoc.state(+) = '#39'Y'#39
      '   and aldoc.obl_id(+) = oo.id'
      ''
      'union all'
      '-- '#1084#1077#1078#1076#1091' '#1092#1080#1083#1080#1072#1083#1072#1084#1080
      'select oo.id,'
      '       oo.name,'
      '       cih.date_,'
      
        '       nvl(aldoc.date_ + 1, nvl(rn.date_, cih.date_)) as next_da' +
        'te,'
      '       nvl(rn.num, 1) as next_num,'
      '       decode(rn.num, null, '#39'N'#39', '#39'Y'#39') as DocsExists,'
      '       '#39'Y'#39' as IsBetweenFil,'
      '       odet.rn_through'
      '  from v_org oo,'
      
        '       (select card_id, min(date_) as date_, max(date_to) as dat' +
        'e_to, obl_id '
      '          from card_id_history cih '
      '         where cih.state = '#39'Y'#39
      '         group by card_id, obl_id) cih,'
      '       oil_org_det odet,'
      
        '       (select from_id, to_id, num + 1 as num, date_ + 1 as date' +
        '_'
      '          from (select from_id,'
      '                       to_id,'
      '                       num,'
      '                       date_,'
      
        '                       row_number() over(partition by from_id, t' +
        'o_id order by date_ desc) as rnum'
      '                  from card_alien_rn, oil_info oi'
      '                 where state = '#39'Y'#39
      '                   and from_id = oi.main_inst)'
      '         where rnum = 1) rn,'
      '       (select *'
      '          from (select cad.*,'
      
        '                       row_number() over(partition by obl_id ord' +
        'er by id desc) as rnum'
      '                  from card_alien_doc cad'
      '                 where state = '#39'Y'#39')'
      '         where rnum = 1) aldoc,'
      '       v_main_org omain'
      ' where omain.par = 4587'
      '   and oo.par = 4587'
      '   and trunc(cih.date_to) > sysdate - 90'
      '   and oo.org_type = 4'
      '   and cih.obl_id = oo.id'
      '   and cih.obl_id = oo.inst'
      '   and oo.id = oo.inst'
      '   and oo.id <> omain.id'
      '   and oo.id = rn.to_id(+)'
      '   and oo.id = odet.org_id(+)'
      '   and oo.inst = odet.inst(+)'
      '   and odet.state(+) = '#39'Y'#39
      '   and aldoc.state(+) = '#39'Y'#39
      '   and aldoc.obl_id(+) = oo.id'
      ' order by name')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 224
    Top = 192
    object qGridBaseID: TFloatField
      FieldName = 'ID'
    end
    object qGridBaseNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object qGridBaseSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
    end
    object qGridBaseNEXT_DATE: TDateTimeField
      FieldName = 'NEXT_DATE'
    end
    object qGridBaseNEXT_NUM: TFloatField
      FieldName = 'NEXT_NUM'
    end
    object qGridBaseISBETWEENFIL: TStringField
      FieldName = 'ISBETWEENFIL'
      Size = 1
    end
    object qGridBaseRN_THROUGH: TStringField
      FieldName = 'RN_THROUGH'
      Size = 255
    end
    object qGridBaseDOCSEXISTS: TStringField
      FieldName = 'DOCSEXISTS'
      Size = 1
    end
  end
  object dsGrid: TOraDataSource
    DataSet = qGrid
    OnStateChange = dsGridStateChange
    OnDataChange = dsGridDataChange
    Left = 296
    Top = 144
  end
  object qKorrNum: TOilQuery
    SQL.Strings = (
      'select nvl(max(korr_num),0)+1 as next_number'
      'from'
      
        '(select to_number(substr(num,1,k-1)) as korr_num,substr(num,k+1)' +
        ' as nal_num'
      'from'
      '(select num,instr(num,'#39'/'#39') as k'
      'from oil_sale_book'
      'where state='#39'Y'#39' and nal_t=8'
      ')'
      'where k>0'
      ')'
      'where nal_num=:nal_num')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 72
    Top = 233
    ParamData = <
      item
        DataType = ftString
        Name = 'nal_num'
        ParamType = ptInput
      end>
    object qKorrNumNEXT_NUMBER: TFloatField
      FieldName = 'NEXT_NUMBER'
    end
  end
  object qKorr: TOilQuery
    SQL.Strings = (
      'select *'
      'from oil_sale_book'
      'where nal_t=8 and s_date=:date_ and state='#39'Y'#39
      '      and organ=organ_inst and organ_inst=:oblid')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 120
    Top = 264
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oblid'
        ParamType = ptInput
      end>
    object qKorrS_DATE: TDateTimeField
      FieldName = 'S_DATE'
      Origin = 'OIL_SALE_BOOK.S_DATE'
    end
    object qKorrORGAN: TFloatField
      FieldName = 'ORGAN'
      Origin = 'OIL_SALE_BOOK.ORGAN'
    end
    object qKorrORGAN_INST: TFloatField
      FieldName = 'ORGAN_INST'
      Origin = 'OIL_SALE_BOOK.ORGAN_INST'
    end
    object qKorrNUM2: TStringField
      FieldName = 'NUM'
      Origin = 'OIL_SALE_BOOK.NUM'
      Size = 8
    end
    object qKorrF_DOC: TStringField
      FieldName = 'F_DOC'
      Origin = 'OIL_SALE_BOOK.F_DOC'
      Size = 200
    end
    object qKorrFRASCH: TStringField
      FieldName = 'FRASCH'
      Origin = 'OIL_SALE_BOOK.FRASCH'
      Size = 100
    end
    object qKorrR_DATE: TDateTimeField
      FieldName = 'R_DATE'
      Origin = 'OIL_SALE_BOOK.R_DATE'
    end
    object qKorrSALE_TXT: TStringField
      FieldName = 'SALE_TXT'
      Origin = 'OIL_SALE_BOOK.SALE_TXT'
      Size = 80
    end
    object qKorrTOV_ID: TFloatField
      FieldName = 'TOV_ID'
      Origin = 'OIL_SALE_BOOK.TOV_ID'
    end
    object qKorrDIV_ID: TFloatField
      FieldName = 'DIV_ID'
      Origin = 'OIL_SALE_BOOK.DIV_ID'
    end
    object qKorrKOL: TFloatField
      FieldName = 'KOL'
      Origin = 'OIL_SALE_BOOK.KOL'
    end
    object qKorrFROM_: TFloatField
      FieldName = 'FROM_'
      Origin = 'OIL_SALE_BOOK.FROM_'
    end
    object qKorrFROM_INST: TFloatField
      FieldName = 'FROM_INST'
      Origin = 'OIL_SALE_BOOK.FROM_INST'
    end
    object qKorrNAL_T: TFloatField
      FieldName = 'NAL_T'
      Origin = 'OIL_SALE_BOOK.NAL_T'
    end
    object qKorrAZS_ID: TFloatField
      FieldName = 'AZS_ID'
      Origin = 'OIL_SALE_BOOK.AZS_ID'
    end
    object qKorrAZS_INST: TFloatField
      FieldName = 'AZS_INST'
      Origin = 'OIL_SALE_BOOK.AZS_INST'
    end
    object qKorrDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
      Origin = 'OIL_SALE_BOOK.DATE_MOD'
    end
    object qKorrLOCK_: TFloatField
      FieldName = 'LOCK_'
      Origin = 'OIL_SALE_BOOK.LOCK_'
    end
    object qKorrID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_SALE_BOOK.ID'
    end
    object qKorrINST: TFloatField
      FieldName = 'INST'
      Origin = 'OIL_SALE_BOOK.INST'
    end
  end
  object qKorrOne: TOilQuery
    SQL.Strings = (
      'select npg.fullname as np_group,'
      '       sum(sbd.kol) as kol,'
      '       sum(sbd.k_nds_b) as k_nds_b,'
      '       sum(sbd.k_nds_20) as k_nds_20,'
      
        '       decode(sbd.kol, 0, 0, round(k_nds_b / sbd.kol, 4)) as pri' +
        'ce'
      '  from oil_sale_book_det sbd, v_oil_np_group npg'
      ' where sbd.nn_id = :id'
      '   and sbd.nn_inst = :inst'
      '   and sbd.tov_id = npg.id(+)'
      '   and sbd.state = '#39'Y'#39
      ' group by npg.fullname,'
      '          npg.id,'
      '          decode(sbd.kol, 0, 0, round(k_nds_b / sbd.kol, 4)),'
      '          sign(sbd.k_nds_b)'
      ' order by sign(sbd.k_nds_b)')
    MasterSource = dsKorr
    FetchAll = True
    DataSource = dsKorr
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 224
    Top = 264
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INST'
        ParamType = ptInput
      end>
  end
  object dsKorr: TOraDataSource
    DataSet = qKorr
    Left = 168
    Top = 264
  end
  object qDoc: TOilQuery
    SQL.Strings = (
      
        'select distinct '#39'CARD_TRANSIT'#39' as table_name,trunc(oper_date) as' +
        ' date_,'
      '       to_number(null) as nn_id,to_number(null) as nn_inst'
      'from card_transit'
      'where Card.GetObl(card_number, oper_date)=:oblid'
      '      and trunc(oper_date) between :begindate and :enddate'
      'union all'
      
        'select '#39'OIL_MONEY'#39' as table_name,s_date as date_,id as nn_id,ins' +
        't as nn_inst'
      'from oil_sale_book'
      'where state='#39'Y'#39' and nal_t=9'
      '      and organ=organ_inst and organ=:oblid'
      '      and s_date between :begindate and :enddate'
      'order by date_'
      ''
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 72
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oblid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'begindate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'enddate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oblid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'begindate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'enddate'
        ParamType = ptInput
      end>
    object qDocTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Size = 12
    end
    object qDocDATE_: TDateTimeField
      FieldName = 'DATE_'
    end
    object qDocNN_ID: TFloatField
      FieldName = 'NN_ID'
    end
    object qDocNN_INST: TFloatField
      FieldName = 'NN_INST'
    end
  end
  object qRest: TOilQuery
    SQL.Strings = (
      'select sum(summa) as rest'
      'from v_card_transit'
      'where oblid=:oblid'
      '      and date_<:date_')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 208
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oblid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end>
    object qRestREST: TFloatField
      FieldName = 'REST'
      Origin = 'V_CARD_TRANSIT.SUMMA'
    end
  end
  object qRestDet: TOilQuery
    SQL.Strings = (
      'select *'
      'from v_card_transit'
      'where oblid=:oblid'
      '      and date_<:date_'
      'order by date_,sign(summa)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 280
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oblid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end>
    object qRestDetNUM: TFloatField
      FieldName = 'NUM'
    end
    object qRestDetDATE_: TDateTimeField
      FieldName = 'DATE_'
    end
    object qRestDetSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
  end
  object qCtRest: TOilQuery
    SQL.Strings = (
      'select *'
      'from oil_ct_rest'
      'where obl_id=:oblid and obl_id=obl_inst '
      '      and state='#39'Y'#39
      'order by nn_date,id')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 200
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oblid'
        ParamType = ptInput
      end>
    object qCtRestOBL_ID: TFloatField
      FieldName = 'OBL_ID'
      Origin = 'OIL_CT_REST.OBL_ID'
    end
    object qCtRestOBL_INST: TFloatField
      FieldName = 'OBL_INST'
      Origin = 'OIL_CT_REST.OBL_INST'
    end
    object qCtRestSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
      Origin = 'OIL_CT_REST.START_DATE'
    end
    object qCtRestNP_GROUP_ID: TFloatField
      FieldName = 'NP_GROUP_ID'
      Origin = 'OIL_CT_REST.NP_GROUP_ID'
    end
    object qCtRestCOUNT_: TFloatField
      FieldName = 'COUNT_'
      Origin = 'OIL_CT_REST.COUNT_'
    end
    object qCtRestPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = 'OIL_CT_REST.PRICE'
    end
    object qCtRestSUMMA: TFloatField
      FieldName = 'SUMMA'
      Origin = 'OIL_CT_REST.SUMMA'
    end
    object qCtRestNN_DATE: TDateTimeField
      FieldName = 'NN_DATE'
      Origin = 'OIL_CT_REST.NN_DATE'
    end
    object qCtRestNN_NUM: TFloatField
      FieldName = 'NN_NUM'
      Origin = 'OIL_CT_REST.NN_NUM'
    end
  end
  object qGrid: TMemoryTable
    BeforePost = qGridBeforePost
    AfterPost = qGridAfterPost
    Left = 272
    Top = 168
    object qGridID: TFloatField
      FieldName = 'ID'
    end
    object qGridNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object qGridSTART_DATE: TDateField
      FieldName = 'START_DATE'
    end
    object qGridNEXT_DATE: TDateField
      FieldName = 'NEXT_DATE'
    end
    object qGridNEXT_NUM: TFloatField
      FieldName = 'NEXT_NUM'
    end
    object qGridISBETWEENFIL: TStringField
      FieldName = 'ISBETWEENFIL'
      Size = 1
    end
    object qGridRN_THROUGH: TStringField
      FieldName = 'RN_THROUGH'
      Size = 255
    end
    object qGridDOCSEXISTS: TStringField
      FieldName = 'DOCSEXISTS'
      Size = 1
    end
  end
  object pm: TPopupMenu
    Left = 272
    Top = 88
    object N1: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = N1Click
    end
  end
  object qFilRn: TOilQuery
    SQL.Strings = (
      'select *'
      'from card_alien_rn'
      'where date_ between :BeginDate and :EndDate'
      '  and from_id=from_inst and from_id=:from_id'
      '  and to_id=to_inst and to_id=:to_id'
      '  and state='#39'Y'#39
      'order by date_')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 160
    Top = 48
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'from_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'to_id'
        ParamType = ptInput
      end>
  end
  object qAviso: TOilQuery
    SQL.Strings = (
      'select rn.*,'
      '       ofrom.name from_name,'
      '       oto.name to_name        '
      '  from v_org ofrom,'
      '       v_org oto,'
      '       (select rn.num,'
      '               rn.avizo_num,'
      '               rn.rn_type,'
      '               rn.date_,'
      '               rn.from_id,'
      '               rn.from_inst,'
      '               rn.to_id,'
      '               rn.to_inst,'
      '               rn.begin_date,'
      '               rn.end_date,'
      '               sum(rndet.summ) as summ,'
      '               sum(rndet.count_) as count_'
      '          from card_alien_rn rn,'
      '               card_alien_rn_det rndet'
      '          where rn.id = :rn_id and rn.inst = :rn_inst'
      '           and rn.id = rndet.rn_id and rn.inst = rndet.rn_inst'
      '           and rndet.state = '#39'Y'#39
      '          group by rn.num,'
      '               rn.avizo_num,'
      '               rn.rn_type,'
      '               rn.date_,'
      '               rn.from_id,'
      '               rn.from_inst,'
      '               rn.to_id,'
      '               rn.to_inst,'
      '               rn.begin_date,'
      '               rn.end_date)rn'
      ' where rn.from_id =ofrom.id and rn.from_inst = ofrom.inst'
      '   and rn.to_id = oto.id and rn.to_inst = oto.inst')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 192
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rn_id'
      end
      item
        DataType = ftInteger
        Name = 'rn_inst'
      end>
    object qAvisoNUM: TFloatField
      FieldName = 'NUM'
    end
    object qAvisoDATE_: TDateTimeField
      FieldName = 'DATE_'
    end
    object qAvisoFROM_ID: TFloatField
      FieldName = 'FROM_ID'
    end
    object qAvisoFROM_INST: TFloatField
      FieldName = 'FROM_INST'
    end
    object qAvisoTO_ID: TFloatField
      FieldName = 'TO_ID'
    end
    object qAvisoTO_INST: TFloatField
      FieldName = 'TO_INST'
    end
    object qAvisoSUMM: TFloatField
      FieldName = 'SUMM'
    end
    object qAvisoFROM_NAME: TStringField
      FieldName = 'FROM_NAME'
      Size = 100
    end
    object qAvisoTO_NAME: TStringField
      FieldName = 'TO_NAME'
      Size = 100
    end
    object qAvisoRN_TYPE: TFloatField
      FieldName = 'RN_TYPE'
    end
    object qAvisoAVIZO_NUM: TFloatField
      FieldName = 'AVIZO_NUM'
    end
    object qAvisoBEGIN_DATE: TDateTimeField
      FieldName = 'BEGIN_DATE'
    end
    object qAvisoEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object qAvisoCOUNT_: TFloatField
      FieldName = 'COUNT_'
    end
  end
  object qReestr: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select rn.num,'
      '       rn.avizo_num,'
      '       rn.rn_type,'
      '       rn.date_,'
      '       rn.from_id,'
      '       rn.from_inst,'
      '       rn.to_id,'
      '       rn.to_inst,'
      '       rn.begin_date,'
      '       rn.end_date,'
      '       ofrom.name from_name,'
      '       rndet.date_ as date_det,'
      '       rndet.np_name,'
      '       rndet.dog,'
      '       rndet.count_,'
      '       rndet.price,'
      '       rndet.summ,'
      '       rndet.fullazsname'
      '  from card_alien_rn rn, v_card_alien_rn_det rndet, v_org ofrom'
      ' where rn.id = :rn_id'
      '   and rn.inst = :rn_inst'
      '   and rn.id = rndet.rn_id'
      '   and rn.inst = rndet.rn_inst'
      '   and rn.from_id = ofrom.id'
      '   and rn.from_inst = ofrom.inst'
      'order by np_name, dog, rndet.date_')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 224
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rn_id'
      end
      item
        DataType = ftInteger
        Name = 'rn_inst'
      end>
  end
  object qRnPrintUnion: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      
        'select crn.*, ofrom.name as from_name, oto.name as to_name, crn.' +
        'begin_date '
      '  from card_alien_rn crn, v_org ofrom, v_org oto'
      ' where crn.id = :rn_id'
      '   and crn.inst = :rn_inst'
      '   and crn.from_id = ofrom.id'
      '   and crn.from_inst = ofrom.inst'
      '   and crn.to_id = oto.id'
      '   and crn.to_inst = oto.inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 472
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rn_id'
      end
      item
        DataType = ftInteger
        Name = 'rn_inst'
      end>
  end
  object qRnDetPrintUnion: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      
        'select np_name, dog, dim_name, sum(count_) as count_, sum(summ) ' +
        'as summ, price'
      '  from v_card_alien_rn_det'
      ' where rn_id = :rn_id'
      '   and rn_inst = :rn_inst'
      ' group by npg_order_id, np_name, dog, dim_name, price'
      ' order by npg_order_id, np_name, dog')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 472
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rn_id'
      end
      item
        DataType = ftInteger
        Name = 'rn_inst'
      end>
  end
  object qRnPrint: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select crn.*, ofrom.name as from_name, oto.name as to_name'
      '  from card_alien_rn crn, v_org ofrom, v_org oto'
      ' where crn.id = :rn_id'
      '   and crn.inst = :rn_inst'
      '   and crn.from_id = ofrom.id'
      '   and crn.from_inst = ofrom.inst'
      '   and crn.to_id = oto.id'
      '   and crn.to_inst = oto.inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 392
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rn_id'
      end
      item
        DataType = ftInteger
        Name = 'rn_inst'
      end>
  end
  object qRnDetPrint: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      
        'select dog, cert, np_name, dim_name, count_, price, summ, fullaz' +
        'sname'
      '  from v_card_alien_rn_det'
      ' where rn_id = :rn_id'
      '   and rn_inst = :rn_inst'
      ' order by pponname, fullazsname, npg_order_id, np_name, dog')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 392
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rn_id'
      end
      item
        DataType = ftInteger
        Name = 'rn_inst'
      end>
  end
end
