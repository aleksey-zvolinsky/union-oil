inherited AzsFaultRefForm: TAzsFaultRefForm
  Left = 251
  Top = 165
  Width = 613
  Height = 354
  BorderStyle = bsSizeable
  Caption = #1057#1073#1086#1080' '#1074' '#1088#1072#1073#1086#1090#1077' '#1040#1047#1057' '#1076#1083#1103' '#1089#1084#1077#1085#1085#1099#1093' '#1086#1090#1095#1077#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 294
    Width = 605
    inherited Panel3: TPanel
      Left = 408
    end
    inherited PAdd: TPanel
      inherited sbAdd: TSpeedButton
        OnClick = sbAddClick
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
    inherited pShowDetail: TPanel
      Width = 40
    end
  end
  inherited Panel2: TPanel
    Width = 605
    Height = 62
    object Label3: TLabel
      Left = 12
      Top = 38
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object sbClearDate: TSpeedButton
      Left = 146
      Top = 34
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
    object Label2: TLabel
      Left = 209
      Top = 38
      Width = 21
      Height = 13
      Caption = #1040#1047#1057
    end
    object sbClearAZS: TSpeedButton
      Left = 468
      Top = 33
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
      OnClick = sbClearAZSClick
    end
    object Label1: TLabel
      Left = 9
      Top = 12
      Width = 34
      Height = 13
      Caption = #1053#1086#1084#1077#1088
    end
    object sbClearID: TSpeedButton
      Left = 109
      Top = 8
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
    object Label4: TLabel
      Left = 149
      Top = 12
      Width = 80
      Height = 13
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    end
    object sbClearFilial: TSpeedButton
      Left = 468
      Top = 7
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
      OnClick = sbClearFilialClick
    end
    object xdeDate: TDateEdit
      Left = 49
      Top = 34
      Width = 95
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
    end
    object cmeAZS: TComboEdit
      Left = 236
      Top = 34
      Width = 230
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = cmeAZSButtonClick
      OnDblClick = cmeAZSButtonClick
    end
    object edID: TRxCalcEdit
      Left = 49
      Top = 8
      Width = 60
      Height = 21
      AutoSize = False
      Color = clWhite
      DecimalPlaces = 0
      DisplayFormat = ',#'
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 2
    end
    object cmeFilial: TComboEdit
      Left = 236
      Top = 8
      Width = 230
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = cmeFilialButtonClick
      OnDblClick = cmeFilialButtonClick
    end
  end
  inherited pBase: TPanel
    Top = 72
    Width = 455
    Height = 222
    inherited SplitterDetail: TSplitter
      Top = 167
      Width = 455
    end
    inherited DBGrid1: TDBGridEh
      Width = 455
      Height = 167
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      RowHeight = 4
      RowLines = 1
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
        end
        item
          EditButtons = <>
          FieldName = 'AZS_NAME'
          Footers = <>
          Title.Caption = #1040#1047#1057
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'BEGIN_DATE'
          Footers = <>
          Title.Caption = #1053#1072#1095#1072#1083#1086' '#1089#1073#1086#1103
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'END_DATE'
          Footers = <>
          Title.Caption = #1050#1086#1085#1077#1094' '#1089#1073#1086#1103
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = 'COMMENT_'
          Footers = <>
          Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          Width = 250
        end
        item
          EditButtons = <>
          FieldName = 'FILIALNAME'
          Footers = <>
          Title.Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
          Width = 250
        end>
    end
    inherited pDetail: TPanel
      Top = 170
      Width = 455
      inherited DBGridDetail: TDBGridEh
        Width = 455
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 605
    inherited pnlTuneGridBtn: TPanel
      Left = 576
    end
  end
  inherited PanelCol: TPanel
    Left = 455
    Top = 72
    Height = 222
    inherited cbCol: TRxCheckListBox
      Height = 194
    end
    inherited pRefresh: TPanel
      Top = 196
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select * from v_oil_dr_summary'
      'order by id')
    Left = 141
    Top = 113
    object qID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_DR_SUMMARY.ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Origin = 'OIL_DR_SUMMARY.INST'
    end
    object qSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'OIL_DR_SUMMARY.STATE'
      Size = 1
    end
    object qAZS_ID: TFloatField
      FieldName = 'AZS_ID'
      Origin = 'OIL_DR_SUMMARY.AZS_ID'
    end
    object qREP_ID: TFloatField
      FieldName = 'REP_ID'
      Origin = 'OIL_DR_SUMMARY.REP_ID'
    end
    object qREP_INST: TFloatField
      FieldName = 'REP_INST'
      Origin = 'OIL_DR_SUMMARY.REP_INST'
    end
    object qBEGIN_DATE: TDateTimeField
      FieldName = 'BEGIN_DATE'
      Origin = 'OIL_DR_SUMMARY.BEGIN_DATE'
    end
    object qEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
      Origin = 'OIL_DR_SUMMARY.END_DATE'
    end
    object qDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
      Origin = 'OIL_DR_SUMMARY.DATE_MOD'
    end
    object qAZS_NAME: TStringField
      FieldName = 'AZS_NAME'
      Origin = 'OIL_ORG.NAME'
      Size = 100
    end
    object qFILIALNAME: TStringField
      FieldName = 'FILIALNAME'
      Origin = 'V_OIL_DR_SUMMARY.FILIALNAME'
      Size = 100
    end
    object qCOMMENT_: TStringField
      FieldName = 'COMMENT_'
      Origin = 'V_OIL_DR_SUMMARY.COMMENT_'
      Size = 250
    end
    object qFILIALID: TFloatField
      FieldName = 'FILIALID'
      Origin = 'V_OIL_DR_SUMMARY.FILIALID'
    end
  end
  inherited ADMQ: TOilQuery
    Left = 163
    Top = 200
  end
end
