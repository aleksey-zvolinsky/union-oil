inherited OperTypeRefForm: TOperTypeRefForm
  Left = 302
  Top = 229
  Caption = 'Справочник- Типы операций'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    TabOrder = 2
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
    Height = 35
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 10
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Название'
    end
    object Label2: TLabel
      Left = 382
      Top = 10
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Группа'
    end
    object SpeedButton1: TSpeedButton
      Left = 607
      Top = 6
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
    object edName: TEdit
      Left = 64
      Top = 7
      Width = 265
      Height = 21
      TabOrder = 0
      OnChange = bbSearchClick
    end
    object ComboEdit1: TComboEdit
      Left = 424
      Top = 7
      Width = 185
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = ComboEdit1ButtonClick
      OnDblClick = ComboEdit1ButtonClick
    end
  end
  inherited pBase: TPanel
    Top = 45
    Height = 326
    inherited DBGrid1: TDBGridEh
      Height = 326
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Width = 220
        end
        item
          EditButtons = <>
          FieldName = 'GRP_NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Width = 159
        end
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
        end>
    end
  end
  inherited PanelCol: TPanel
    Top = 45
    Height = 326
    inherited cbCol: TRxCheckListBox
      Height = 298
    end
    inherited pRefresh: TPanel
      Top = 300
    end
  end
  inherited ds: TOraDataSource
    OnDataChange = dsDataChange
    Left = 148
    Top = 100
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'Select * from V_OIL_OPER_TYPE'
      'Order By name')
    object qID: TFloatField
      DisplayLabel = 'Номер'
      FieldName = 'ID'
      Origin = 'V_OIL_OPER_TYPE.ID'
    end
    object qNAME: TStringField
      DisplayLabel = 'Название'
      FieldName = 'NAME'
      Origin = 'V_OIL_OPER_TYPE.NAME'
      Size = 50
    end
    object qGRP_ID: TFloatField
      FieldName = 'GRP_ID'
      Origin = 'V_OIL_OPER_TYPE.GRP_ID'
    end
    object qGRP_NAME: TStringField
      DisplayLabel = 'Группа'
      FieldName = 'GRP_NAME'
      Origin = 'V_OIL_OPER_TYPE.GRP_NAME'
      Size = 50
    end
  end
  inherited ADMQ: TOilQuery
    Left = 16
  end
  inherited PUM: TPopupMenu
    Left = 136
    Top = 208
  end
  inherited ActionList: TActionList
    Left = 208
    Top = 208
  end
  object SP: TOilStoredProc
        Left = 172
    Top = 208
  end
  object Query1: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 368
    Top = 208
  end
  object ModifyQuery: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 416
    Top = 208
  end
end
