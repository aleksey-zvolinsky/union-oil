inherited KpFaultRefForm: TKpFaultRefForm
  Left = 367
  Top = 221
  Caption = 'Сбои по вводу цен конкурентов и Петролу'
  ClientHeight = 435
  ClientWidth = 559
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 402
    Width = 559
    inherited Panel3: TPanel
      Left = 362
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
    Width = 559
    Height = 97
    object Label3: TLabel
      Left = 20
      Top = 14
      Width = 26
      Height = 13
      Caption = 'Дата'
    end
    object sbClearDate: TSpeedButton
      Left = 154
      Top = 10
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
    object Label4: TLabel
      Left = 240
      Top = 12
      Width = 80
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Подразделение'
    end
    object sbClearFilial: TSpeedButton
      Left = 527
      Top = 7
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
      OnClick = sbClearFilialClick
    end
    object Label1: TLabel
      Left = 269
      Top = 40
      Width = 49
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Фамилия'
    end
    object sbClearRespondent: TSpeedButton
      Left = 527
      Top = 36
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
      OnClick = sbClearRespondentClick
    end
    object sbClearGroups: TSpeedButton
      Left = 178
      Top = 40
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
      OnClick = sbClearGroupsClick
    end
    object sbClearTypes: TSpeedButton
      Left = 178
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
      OnClick = sbClearTypesClick
    end
    object Label2: TLabel
      Left = 12
      Top = 44
      Width = 35
      Height = 13
      Caption = 'Группа'
    end
    object Label5: TLabel
      Left = 28
      Top = 68
      Width = 19
      Height = 13
      Caption = 'Тип'
    end
    object xdeDate: TDateEdit
      Left = 56
      Top = 10
      Width = 95
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
    end
    object cmeFilial: TComboEdit
      Left = 331
      Top = 8
      Width = 194
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akTop, akRight]
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = cmeFilialButtonClick
    end
    object edRespondent: TEdit
      Left = 331
      Top = 36
      Width = 193
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object leGroups: TRxLookupEdit
      Left = 56
      Top = 40
      Width = 121
      Height = 21
      LookupField = 'NAME'
      LookupSource = dsGroups
      TabOrder = 3
      OnCloseUp = leGroupsCloseUp
    end
    object leTypes: TRxLookupEdit
      Left = 56
      Top = 64
      Width = 121
      Height = 21
      LookupField = 'NAME'
      LookupSource = dsTypes
      TabOrder = 4
      OnCloseUp = leTypesCloseUp
      OnButtonClick = leTypesButtonClick
    end
  end
  inherited pBase: TPanel
    Top = 107
    Width = 427
    Height = 295
    inherited DBGrid1: TDBGridEh
      Width = 427
      Height = 295
      Columns = <
        item
          EditButtons = <>
          FieldName = 'GROUP_NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Группа'
          Width = 109
        end
        item
          EditButtons = <>
          FieldName = 'TYPE_NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Тип сбоя'
        end
        item
          EditButtons = <>
          FieldName = 'PODR_NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Подразделение'
          Width = 125
        end
        item
          EditButtons = <>
          FieldName = 'PODR_ID'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'START_DATE'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Начало сбоя'
          Width = 77
        end
        item
          EditButtons = <>
          FieldName = 'END_DATE'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Конец сбоя'
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'COMMENTS'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Причина сбоя'
          Width = 116
        end
        item
          EditButtons = <>
          FieldName = 'RESPONDENT'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Лицо, внесшее запись'
          Width = 100
        end>
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 559
    inherited pnlTuneGridBtn: TPanel
      Left = 530
    end
  end
  inherited PanelCol: TPanel
    Left = 427
    Top = 107
    Height = 295
    inherited cbCol: TRxCheckListBox
      Height = 267
    end
    inherited pRefresh: TPanel
      Top = 269
    end
  end
  inherited ds: TOraDataSource
    Left = 180
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select crash.id,crash.inst,'
      
        '       decode(crash.crash_type,1,'#39'Глобальный сбой'#39',2,'#39'Сбой по не' +
        'фтебазе'#39') as crash_cause,'
      '       oo.name as podr_name,'
      '       oo.id as podr_id,'
      '       crash_type,start_date,end_date,comments,respondent'
      'from oil_kp_crash crash,v_org oo'
      'where crash.dep_id=oo.id(+) and crash.dep_id=oo.inst(+)')
    object qPODR_NAME: TStringField
      FieldName = 'PODR_NAME'
      Size = 100
    end
    object qPODR_ID: TFloatField
      FieldName = 'PODR_ID'
    end
    object qSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
    end
    object qEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object qCOMMENTS: TStringField
      FieldName = 'COMMENTS'
      Size = 200
    end
    object qRESPONDENT: TStringField
      FieldName = 'RESPONDENT'
      Size = 100
    end
    object qID: TFloatField
      FieldName = 'ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
    end
    object qTYPE_NAME: TStringField
      FieldName = 'TYPE_NAME'
      Size = 50
    end
    object qGROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 50
    end
    object qTYPE_ID: TFloatField
      FieldName = 'TYPE_ID'
    end
    object qGROUP_ID: TFloatField
      FieldName = 'GROUP_ID'
    end
    object qOPTIONS: TStringField
      FieldName = 'OPTIONS'
      Size = 50
    end
  end
  object qGroups: TOilQuery
    SQL.Strings = (
      'select id,name'
      'from oil_crash_group'
      'where state='#39'Y'#39
      'order by id')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 208
    Top = 8
    object qGroupsID: TFloatField
      FieldName = 'ID'
      Origin = 'MAINBASE.OIL_CRASH_GROUP.ID'
    end
    object qGroupsNAME: TStringField
      FieldName = 'NAME'
      Origin = 'MAINBASE.OIL_CRASH_GROUP.NAME'
      Size = 50
    end
  end
  object dsGroups: TOraDataSource
    DataSet = qGroups
    Left = 264
    Top = 8
  end
  object qTypes: TOilQuery
    SQL.Strings = (
      'select id,name'
      'from oil_crash_type'
      'where state='#39'Y'#39
      '          and (crash_group_id=:id or :id is null)'
      'order by id')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 208
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
    object qTypesID: TFloatField
      FieldName = 'ID'
      Origin = 'MAINBASE.OIL_CRASH_TYPE.ID'
    end
    object qTypesNAME: TStringField
      FieldName = 'NAME'
      Origin = 'MAINBASE.OIL_CRASH_TYPE.NAME'
      Size = 50
    end
  end
  object dsTypes: TOraDataSource
    DataSet = qTypes
    Left = 264
    Top = 56
  end
end
