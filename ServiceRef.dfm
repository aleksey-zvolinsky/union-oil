inherited ServiceRefForm: TServiceRefForm
  Left = 239
  Top = 300
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' : '#1059#1089#1083#1091#1075#1080
  ClientHeight = 414
  ClientWidth = 693
  Constraints.MinHeight = 441
  Constraints.MinWidth = 674
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 381
    Width = 693
    TabOrder = 2
    object lTotal: TLabel [0]
      Left = 397
      Top = 11
      Width = 3
      Height = 13
    end
    inherited Panel4: TPanel [1]
      inherited bbClear: TBitBtn
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
    inherited Panel3: TPanel [2]
      Left = 496
    end
    inherited PAdd: TPanel [3]
      inherited sbAdd: TSpeedButton
        OnClick = sbAddClick
      end
    end
    inherited PEdit: TPanel [4]
    end
    inherited pDel: TPanel [5]
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited pPrint: TPanel
      Visible = True
    end
    inherited pTotal: TPanel
      Visible = True
    end
    inherited pShowDetail: TPanel
      Width = 128
    end
  end
  inherited Panel2: TPanel
    Width = 693
    Height = 96
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 40
      Height = 13
      Caption = #1053#1086#1084#1077#1088' :'
    end
    object Label2: TLabel
      Left = 72
      Top = 9
      Width = 13
      Height = 13
      Caption = #1057' :'
    end
    object Label3: TLabel
      Left = 8
      Top = 49
      Width = 73
      Height = 13
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' :'
    end
    object Label12: TLabel
      Left = 280
      Top = 50
      Width = 86
      Height = 13
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' :'
    end
    object Label5: TLabel
      Left = 280
      Top = 9
      Width = 50
      Height = 13
      Caption = #1044#1086#1075#1086#1074#1086#1088' :'
    end
    object Label11: TLabel
      Left = 520
      Top = 10
      Width = 43
      Height = 13
      Caption = #1055#1072#1088#1090#1080#1103' :'
    end
    object SpeedButton1: TSpeedButton
      Left = 252
      Top = 64
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
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 492
      Top = 63
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
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 661
      Top = 24
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
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 492
      Top = 24
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
      OnClick = SpeedButton4Click
    end
    object Label4: TLabel
      Left = 176
      Top = 9
      Width = 20
      Height = 13
      Caption = #1055#1086' :'
    end
    object SpeedButton6: TSpeedButton
      Left = 662
      Top = 63
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
      OnClick = SpeedButton6Click
    end
    object Label6: TLabel
      Left = 520
      Top = 50
      Width = 56
      Height = 13
      Caption = #1054#1087#1077#1088#1072#1094#1080#1103' :'
    end
    object Edit1: TEdit
      Left = 8
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
    end
    object DateEdit1: TDateEdit
      Left = 72
      Top = 24
      Width = 99
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
    end
    object ComboEdit1: TComboEdit
      Left = 8
      Top = 64
      Width = 241
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = ComboEdit1ButtonClick
      OnDblClick = ComboEdit1ButtonClick
    end
    object ComboEdit5: TComboEdit
      Left = 280
      Top = 64
      Width = 209
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 6
      OnButtonClick = ComboEdit5ButtonClick
      OnDblClick = ComboEdit5ButtonClick
    end
    object ComboEdit2: TComboEdit
      Left = 280
      Top = 24
      Width = 209
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = ComboEdit2ButtonClick
      OnDblClick = ComboEdit2ButtonClick
    end
    object ComboEdit4: TComboEdit
      Left = 520
      Top = 24
      Width = 137
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = ComboEdit4ButtonClick
      OnDblClick = ComboEdit4ButtonClick
    end
    object DateEdit2: TDateEdit
      Left = 176
      Top = 24
      Width = 100
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 2
    end
    object ComboEdit3: TComboEdit
      Left = 520
      Top = 64
      Width = 137
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 7
      OnButtonClick = ComboEdit3ButtonClick
      OnDblClick = ComboEdit3ButtonClick
    end
  end
  inherited pBase: TPanel
    Top = 106
    Width = 543
    Height = 275
    inherited SplitterDetail: TSplitter
      Top = 220
      Width = 543
    end
    inherited DBGrid1: TDBGridEh
      Width = 543
      Height = 220
      RowSizingAllowed = True
      SumList.Active = True
      Columns = <
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'S_NUM'
          Footer.Value = #1059#1089#1083#1091#1075':'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
          Title.SortIndex = 1
          Title.SortMarker = smDownEh
          Title.TitleButton = True
          Title.ToolTips = True
          ToolTips = True
          Width = 63
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'S_DATE'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Title.TitleButton = True
          Title.ToolTips = True
          ToolTips = True
          Width = 73
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'ORG_NAME'
          Footers = <>
          Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          Width = 207
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'NN_NUM'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1053#1053
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'NN_SUM'
          Footer.FieldName = 'NN_SUM'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1053#1053
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'TOTAL'
          Footer.FieldName = 'TOTAL'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 68
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'DOG'
          Footers = <>
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088
          Width = 73
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'PART_NAME'
          Footers = <>
          Title.Caption = #1055#1072#1088#1090#1080#1103
          Width = 69
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'DEP_NAME'
          Footers = <>
          Title.Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
          Width = 133
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'OPER_NAME'
          Footers = <>
          Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
          Width = 99
        end>
    end
    inherited pDetail: TPanel
      Top = 223
      Width = 543
      inherited DBGridDetail: TDBGridEh
        Width = 543
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 693
    inherited pnlTuneGridBtn: TPanel
      Left = 664
    end
  end
  inherited PanelCol: TPanel
    Left = 543
    Top = 106
    Height = 275
    inherited cbCol: TRxCheckListBox
      Height = 247
    end
    inherited pRefresh: TPanel
      Top = 249
    end
  end
  inherited ds: TOraDataSource
    Left = 188
    Top = 148
  end
  inherited q: TOilQuery
    SQL.Strings = (
      '--'#1044#1083#1103' '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1075#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080' '#1087#1086#1089#1083#1077#1076#1085#1103#1103' '#1089#1090#1088#1086#1082#1072' '
      '--'#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1076#1086#1083#1078#1085#1072' '#1089#1086#1076#1077#1088#1078#1072#1090#1100' '#1086#1087#1094#1080#1102' ORDER BY'
      'select * '
      'from  v_oil_service'
      'order by s_date desc ')
    FetchAll = True
    Left = 152
    Top = 148
    object qID: TFloatField
      FieldName = 'ID'
      Origin = 'V_OIL_SERVICE.ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Origin = 'V_OIL_SERVICE.INST'
    end
    object qS_NUM: TFloatField
      FieldName = 'S_NUM'
      Origin = 'V_OIL_SERVICE.S_NUM'
    end
    object qS_DATE: TDateTimeField
      FieldName = 'S_DATE'
      Origin = 'V_OIL_SERVICE.S_DATE'
    end
    object qORG_ID: TFloatField
      FieldName = 'ORG_ID'
      Origin = 'V_OIL_SERVICE.ORG_ID'
    end
    object qORG_INST: TFloatField
      FieldName = 'ORG_INST'
      Origin = 'V_OIL_SERVICE.ORG_INST'
    end
    object qORG_NAME: TStringField
      FieldName = 'ORG_NAME'
      Origin = 'V_OIL_SERVICE.ORG_NAME'
      Size = 100
    end
    object qRASC_CHET: TStringField
      FieldName = 'RASC_CHET'
      Origin = 'V_OIL_SERVICE.RASC_CHET'
    end
    object qDOG_ID: TFloatField
      FieldName = 'DOG_ID'
      Origin = 'V_OIL_SERVICE.DOG_ID'
    end
    object qDOG_INST: TFloatField
      FieldName = 'DOG_INST'
      Origin = 'V_OIL_SERVICE.DOG_INST'
    end
    object qDOG: TStringField
      FieldName = 'DOG'
      Origin = 'V_OIL_SERVICE.DOG'
      Size = 15
    end
    object qNP_ID: TFloatField
      FieldName = 'NP_ID'
      Origin = 'V_OIL_SERVICE.NP_ID'
    end
    object qNP_NAME: TStringField
      FieldName = 'NP_NAME'
      Origin = 'V_OIL_SERVICE.NP_NAME'
      Size = 50
    end
    object qPART_ID: TFloatField
      FieldName = 'PART_ID'
      Origin = 'V_OIL_SERVICE.PART_ID'
    end
    object qPART_INST: TFloatField
      FieldName = 'PART_INST'
      Origin = 'V_OIL_SERVICE.PART_INST'
    end
    object qPART_NAME: TStringField
      FieldName = 'PART_NAME'
      Origin = 'V_OIL_SERVICE.PART_NAME'
      Size = 15
    end
    object qDEP_ID: TFloatField
      FieldName = 'DEP_ID'
      Origin = 'V_OIL_SERVICE.DEP_ID'
    end
    object qDEP_INST: TFloatField
      FieldName = 'DEP_INST'
      Origin = 'V_OIL_SERVICE.DEP_INST'
    end
    object qDEP_NAME: TStringField
      FieldName = 'DEP_NAME'
      Origin = 'V_OIL_SERVICE.DEP_NAME'
      Size = 100
    end
    object qOPER_ID: TFloatField
      FieldName = 'OPER_ID'
      Origin = 'V_OIL_SERVICE.OPER_ID'
    end
    object qOPER_NAME: TStringField
      FieldName = 'OPER_NAME'
      Origin = 'V_OIL_SERVICE.OPER_NAME'
      Size = 50
    end
    object qBASE: TFloatField
      FieldName = 'BASE'
      Origin = 'V_OIL_SERVICE.BASE'
    end
    object qNDS: TFloatField
      FieldName = 'NDS'
      Origin = 'V_OIL_SERVICE.NDS'
    end
    object qTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'V_OIL_SERVICE.TOTAL'
    end
    object qTEXT: TStringField
      FieldName = 'TEXT'
      Origin = 'V_OIL_SERVICE.TEXT'
      Size = 100
    end
    object qNN_ID: TFloatField
      FieldName = 'NN_ID'
      Origin = 'V_OIL_SERVICE.NN_ID'
    end
    object qNN_INST: TFloatField
      FieldName = 'NN_INST'
      Origin = 'V_OIL_SERVICE.NN_INST'
    end
    object qNN_NUM: TStringField
      FieldName = 'NN_NUM'
      Origin = 'V_OIL_SERVICE.ID'
      Size = 8
    end
    object qSERVICE_T: TFloatField
      FieldName = 'SERVICE_T'
      Origin = 'V_OIL_SERVICE.SERVICE_T'
    end
    object qFRASCH: TStringField
      FieldName = 'FRASCH'
      Size = 100
    end
    object qNN_SUM: TFloatField
      FieldName = 'NN_SUM'
    end
  end
  inherited ADMQ: TOilQuery
    Left = 96
    Top = 16
  end
  inherited PUM: TPopupMenu
    Left = 248
    Top = 248
    object miPerinNN: TMenuItem [0]
      Caption = '&'#1053#1072#1083#1086#1075#1086#1074#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
      OnClick = miPerinNNClick
    end
    object N2: TMenuItem [1]
      Caption = #1056#1077#1077#1089#1090#1088' '#1086#1082#1072#1079#1072#1085#1085#1099#1093' '#1091#1089#1083#1091#1075
      OnClick = N2Click
    end
    object Talon_Menu: TMenuItem [2]
      Caption = #1058#1072#1083#1086#1085' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
      OnClick = Talon_MenuClick
    end
    object N4: TMenuItem [3]
      Caption = '-'
    end
    object N1: TMenuItem [4]
      Tag = 1
      Caption = #1044#1086#1075#1086#1074#1086#1088#1072
      OnClick = N1Click
    end
    object N3: TMenuItem [5]
      Tag = 2
      Caption = #1040#1082#1090#1072
      OnClick = N1Click
    end
    object miDopConsent: TMenuItem [6]
      Tag = 3
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1077' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1077
      OnClick = N1Click
    end
    object N6: TMenuItem [7]
      Caption = '-'
    end
  end
  inherited ActionList: TActionList
    Left = 176
    Top = 247
  end
  object sp1: TOilStoredProc
        Left = 56
    Top = 16
  end
  object q2: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 226
    Top = 149
  end
  object qParent: TOilQuery
    SQL.Strings = (
      'select P.*,'
      '       C.BOSS C_BOSS,'
      '       C.DOV C_DOV,'
      '       C.DOV_DATE C_DOV_DATE'
      'from v_Oil_Org C, v_Oil_Org P'
      'where C.ID = :Id'
      '  and C.Inst = :Inst'
      '  and C.PAR = P.ID (+)'
      '  and C.PAR_INST = P.INST (+)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 177
    Top = 17
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
  object qServiceDetail: TOilQuery
    SQL.Strings = (
      'select Round(dt.Price, 4) as Price,'
      '       Round(dt.Price2, 2) as Price2,'
      '       ot.name as service_name'
      '  from oil_dog_detail dt, v_oil_oper_type ot'
      ' where dt.state = '#39'Y'#39
      '   and dt.dog_id = :id'
      '   and dt.dog_inst = :inst'
      '   and dt.np_type = ot.id(+)')
    MasterSource = ds
        DataSource = ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 532
    Top = 189
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
end
