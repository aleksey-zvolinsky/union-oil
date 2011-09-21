inherited OvExpRefForm: TOvExpRefForm
  Left = 265
  Top = 208
  Caption = 'Справочник - Накладные расходы.'
  ClientHeight = 335
  ClientWidth = 562
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 302
    Width = 562
    inherited Panel3: TPanel
      Left = 365
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
  end
  inherited Panel2: TPanel
    Width = 562
    Height = 97
    object Bevel2: TBevel
      Left = 5
      Top = 60
      Width = 179
      Height = 33
      Shape = bsFrame
    end
    object Bevel3: TBevel
      Left = 182
      Top = 5
      Width = 376
      Height = 57
      Shape = bsFrame
    end
    object Bevel4: TBevel
      Left = 182
      Top = 60
      Width = 376
      Height = 33
      Shape = bsFrame
    end
    object sbClearPart: TSpeedButton
      Left = 155
      Top = 65
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
      OnClick = sbClearPartClick
    end
    object lPart: TLabel
      Left = 17
      Top = 69
      Width = 37
      Height = 13
      Caption = 'Партия'
    end
    object sbClearType: TSpeedButton
      Left = 505
      Top = 64
      Width = 23
      Height = 23
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
      OnClick = sbClearTypeClick
    end
    object Label4: TLabel
      Left = 197
      Top = 68
      Width = 63
      Height = 13
      Caption = 'Тип расхода'
    end
    object Label1: TLabel
      Left = 190
      Top = 13
      Width = 67
      Height = 13
      Caption = 'Организация'
    end
    object sbClearFilial: TSpeedButton
      Left = 505
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
      OnClick = sbClearFilialClick
    end
    object Bevel1: TBevel
      Left = 5
      Top = 5
      Width = 179
      Height = 57
      Shape = bsFrame
    end
    object Label3: TLabel
      Left = 42
      Top = 13
      Width = 11
      Height = 13
      Caption = 'от'
    end
    object Label2: TLabel
      Left = 42
      Top = 41
      Width = 12
      Height = 13
      Caption = 'до'
    end
    object sbClearBeginDate: TSpeedButton
      Left = 156
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
      OnClick = sbClearBeginDateClick
    end
    object sbClearEndDate: TSpeedButton
      Left = 156
      Top = 36
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
      OnClick = sbClearEndDateClick
    end
    object Label5: TLabel
      Left = 13
      Top = 26
      Width = 26
      Height = 13
      Caption = 'Дата'
    end
    object edPart: TComboEdit
      Left = 58
      Top = 66
      Width = 95
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = edPartButtonClick
      OnDblClick = edPartButtonClick
    end
    object edType: TComboEdit
      Left = 263
      Top = 65
      Width = 240
      Height = 22
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = edTypeButtonClick
      OnDblClick = edTypeButtonClick
    end
    object cmeFilial: TComboEdit
      Left = 263
      Top = 9
      Width = 240
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = cmeFilialButtonClick
      OnDblClick = cmeFilialButtonClick
    end
    object edBeginDate: TDateEdit
      Left = 58
      Top = 9
      Width = 97
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 3
    end
    object edEndDate: TDateEdit
      Left = 58
      Top = 37
      Width = 97
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 4
    end
    object cbShowOrg: TCheckBox
      Left = 265
      Top = 36
      Width = 276
      Height = 14
      Caption = 'Показывать организацию, где заведена партия'
      TabOrder = 5
      OnClick = cbShowOrgClick
    end
  end
  inherited pBase: TPanel
    Top = 107
    Width = 430
    Height = 195
    inherited DBGrid1: TDBGridEh
      Width = 430
      Height = 195
      AutoFitColWidths = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PART_INST_ORG'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Организация'
          Visible = False
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'PART_NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Партия'
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'DATE_'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Дата'
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'OV_EXP_NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Тип накл. расхода'
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'SUMM'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Сумма'
        end
        item
          EditButtons = <>
          FieldName = 'COMMENT_'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Комментарий'
          Width = 300
        end>
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 562
    inherited pnlTuneGridBtn: TPanel
      Left = 533
    end
  end
  inherited PanelCol: TPanel
    Left = 430
    Top = 107
    Height = 195
    inherited cbCol: TRxCheckListBox
      Height = 167
    end
    inherited pRefresh: TPanel
      Top = 169
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select * from V_OIL_OVERHEAD_EXPENCES'
      'order by part_name, part_inst, date_')
    object qID: TFloatField
      FieldName = 'ID'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.INST'
    end
    object qPART_DATE: TDateTimeField
      FieldName = 'PART_DATE'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.PART_DATE'
    end
    object qNP_TYPE: TFloatField
      FieldName = 'NP_TYPE'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.NP_TYPE'
    end
    object qNP_TYPE_NAME: TStringField
      FieldName = 'NP_TYPE_NAME'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.NP_TYPE_NAME'
      Size = 50
    end
    object qPART_INST_ORG: TStringField
      FieldName = 'PART_INST_ORG'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.ID'
      Size = 100
    end
    object qPART_ID: TFloatField
      FieldName = 'PART_ID'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.INST'
    end
    object qPART_INST: TFloatField
      FieldName = 'PART_INST'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.PART_INST_ORG'
    end
    object qPART_NAME: TStringField
      FieldName = 'PART_NAME'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.PART_ID'
      Size = 15
    end
    object qDATE_: TDateTimeField
      FieldName = 'DATE_'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.PART_INST'
    end
    object qOV_EXP_TYPE: TFloatField
      FieldName = 'OV_EXP_TYPE'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.PART_NAME'
    end
    object qOV_EXP_NAME: TStringField
      FieldName = 'OV_EXP_NAME'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.PART_DATE'
      Size = 200
    end
    object qSUMM: TFloatField
      FieldName = 'SUMM'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.NP_TYPE'
    end
    object qCOMMENT_: TStringField
      FieldName = 'COMMENT_'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.NP_TYPE_NAME'
      Size = 200
    end
    object qREAL_EXP: TStringField
      FieldName = 'REAL_EXP'
      Origin = 'V_OIL_OVERHEAD_EXPENCES.DATE_'
      Size = 1
    end
  end
  inherited ADMQ: TOilQuery
    Left = 13
    Top = 250
  end
end
