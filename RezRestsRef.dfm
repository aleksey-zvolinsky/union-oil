inherited RezRestsRefForm: TRezRestsRefForm
  Left = 270
  Top = 178
  Caption = 'Физические остатки продуктов в резервуарах'
  ClientWidth = 520
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 520
    TabOrder = 3
    inherited Panel3: TPanel
      Left = 323
      TabOrder = 3
    end
    inherited PAdd: TPanel
      TabOrder = 1
      Visible = True
      inherited sbAdd: TSpeedButton
        OnClick = sbAddClick
      end
    end
    inherited PEdit: TPanel
      TabOrder = 2
      Visible = True
    end
    inherited pDel: TPanel
      TabOrder = 4
      Visible = True
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      TabOrder = 0
      inherited bbClear: TBitBtn
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
  end
  inherited Panel2: TPanel
    Width = 520
    Height = 88
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 67
      Height = 13
      Caption = 'Организация'
    end
    object Label2: TLabel
      Left = 8
      Top = 37
      Width = 54
      Height = 13
      Caption = 'Резервуар'
    end
    object Label3: TLabel
      Left = 8
      Top = 61
      Width = 38
      Height = 13
      Caption = 'Тип НП'
    end
    object Label4: TLabel
      Left = 312
      Top = 13
      Width = 49
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Дата нач.'
    end
    object Label5: TLabel
      Left = 312
      Top = 37
      Width = 50
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Дата кон.'
    end
    object sbClearID: TSpeedButton
      Left = 169
      Top = 32
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
    object SpeedButton1: TSpeedButton
      Left = 490
      Top = 8
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
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 490
      Top = 32
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
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 490
      Top = 56
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
      OnClick = SpeedButton3Click
    end
    object DateEdit1: TDateEdit
      Left = 368
      Top = 8
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 1
    end
    object DateEdit2: TDateEdit
      Left = 368
      Top = 32
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 3
    end
    object EdRez: TComboBox
      Left = 80
      Top = 32
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = EdRezChange
    end
    object edFrom: TComboEdit
      Left = 80
      Top = 8
      Width = 225
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = edFromButtonClick
    end
    object edNPType: TComboEdit
      Left = 80
      Top = 56
      Width = 409
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = edNPTypeChange
    end
  end
  inherited pBase: TPanel
    Top = 98
    Width = 370
    Height = 273
    TabOrder = 0
    inherited DBGrid1: TDBGridEh
      Width = 370
      Height = 273
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 520
    inherited pnlTuneGridBtn: TPanel
      Left = 491
    end
  end
  inherited PanelCol: TPanel
    Left = 370
    Top = 98
    Height = 273
    inherited cbCol: TRxCheckListBox
      Height = 245
    end
    inherited pRefresh: TPanel
      Top = 247
    end
  end
  inherited ds: TOraDataSource
    Left = 172
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select'
      '   orp.*,'
      '   orr.*,'
      '   ont.name,'
      '   rez_vzliv(rez_id,rez_inst, all_height) as all_vol,'
      '   rez_vzliv(rez_id,rez_inst, water_height) as wat_vol,'
      
        '   rez_vzliv(rez_id,rez_inst, all_height) - rez_vzliv(rez_id,rez' +
        '_inst, water_height) as prod_vol,'
      
        '   (rez_vzliv(rez_id,rez_inst, all_height) - rez_vzliv(rez_id,re' +
        'z_inst, water_height)) * ud_veight as mass_ '
      'from'
      '   oil_rests_phys orp,'
      '   oil_rezervuar orr,'
      '   oil_np_type ont'
      'where'
      '   orp.state = '#39'Y'#39' and'
      '    orr.state = '#39'Y'#39' and'
      '    ont.state = '#39'Y'#39' and'
      '    orp.rez_id = orr.id and'
      '    orp.rez_inst = orr.inst and'
      '    ont.id = orp.np_type ')
    object qDATE_: TDateTimeField
      DisplayLabel = 'Дата измер.'
      DisplayWidth = 11
      FieldName = 'DATE_'
      Origin = 'OIL_RESTS_PHYS.DATE_'
    end
    object qNAME_1: TStringField
      DisplayLabel = 'Тип НП'
      DisplayWidth = 20
      FieldName = 'NAME_1'
      Origin = 'OIL_NP_TYPE.NAME'
      Size = 50
    end
    object qNAME: TStringField
      DisplayLabel = 'Рез. '
      DisplayWidth = 10
      FieldName = 'NAME'
      Origin = 'OIL_REZERVUAR.NAME'
      Size = 50
    end
    object qNUM: TStringField
      DisplayLabel = 'Рез. №'
      DisplayWidth = 10
      FieldName = 'NUM'
      Origin = 'OIL_REZERVUAR.NUM'
    end
    object qALL_HEIGHT: TFloatField
      DisplayLabel = 'Общая высота мм'
      FieldName = 'ALL_HEIGHT'
      Origin = 'OIL_RESTS_PHYS.ALL_HEIGHT'
      DisplayFormat = '0.'
    end
    object qALL_VOL: TFloatField
      DisplayLabel = 'Общий объем м. куб.'
      FieldName = 'ALL_VOL'
      DisplayFormat = '0.000'
    end
    object qWATER_HEIGHT: TFloatField
      DisplayLabel = 'Подтоварной воды мм.'
      FieldName = 'WATER_HEIGHT'
      Origin = 'OIL_RESTS_PHYS.WATER_HEIGHT'
      DisplayFormat = '0.'
    end
    object qWAT_VOL: TFloatField
      DisplayLabel = 'Объем воды м. куб.'
      FieldName = 'WAT_VOL'
      DisplayFormat = '0.000'
    end
    object qPROD_VOL: TFloatField
      DisplayLabel = 'Объем продукта м. куб.'
      FieldName = 'PROD_VOL'
      DisplayFormat = '0.000'
    end
    object qUD_VEIGHT: TFloatField
      DisplayLabel = 'Уд. вес. (т/м. куб.)'
      FieldName = 'UD_VEIGHT'
      Origin = 'OIL_RESTS_PHYS.UD_VEIGHT'
      DisplayFormat = '0.0000'
    end
    object qTEMPERATURE: TFloatField
      DisplayLabel = 'Температура'
      FieldName = 'TEMPERATURE'
      Origin = 'OIL_RESTS_PHYS.TEMPERATURE'
      DisplayFormat = '0.'
    end
    object qMASS_: TFloatField
      DisplayLabel = 'Масса продукта т.'
      FieldName = 'MASS_'
      DisplayFormat = '0.000000'
    end
    object qID_ORG: TFloatField
      FieldName = 'ID_ORG'
      Origin = 'OIL_REZERVUAR.ID_ORG'
      Visible = False
    end
    object qSTATE_1: TStringField
      FieldName = 'STATE_1'
      Origin = 'OIL_REZERVUAR.STATE'
      Visible = False
      Size = 1
    end
    object qINST_1: TFloatField
      FieldName = 'INST_1'
      Origin = 'OIL_REZERVUAR.INST'
      Visible = False
    end
    object qCAPACITY: TStringField
      FieldName = 'CAPACITY'
      Origin = 'OIL_REZERVUAR.CAPACITY'
      Visible = False
      Size = 50
    end
    object qDEAD: TFloatField
      FieldName = 'DEAD'
      Origin = 'OIL_REZERVUAR.DEAD'
      Visible = False
    end
    object qINST_ORG: TFloatField
      FieldName = 'INST_ORG'
      Origin = 'OIL_REZERVUAR.INST_ORG'
      Visible = False
    end
    object qDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
      Origin = 'OIL_REZERVUAR.DATE_MOD'
      Visible = False
    end
    object qUB_KAT: TFloatField
      FieldName = 'UB_KAT'
      Origin = 'OIL_REZERVUAR.UB_KAT'
      Visible = False
    end
    object qDNO_CORR: TFloatField
      FieldName = 'DNO_CORR'
      Origin = 'OIL_REZERVUAR.DNO_CORR'
      Visible = False
    end
    object qLAST_CAL_DATE: TDateTimeField
      FieldName = 'LAST_CAL_DATE'
      Origin = 'OIL_REZERVUAR.LAST_CAL_DATE'
      Visible = False
    end
    object qID_1: TFloatField
      FieldName = 'ID_1'
      Origin = 'OIL_REZERVUAR.ID'
      Visible = False
    end
    object qNP_TYPE: TFloatField
      FieldName = 'NP_TYPE'
      Origin = 'OIL_RESTS_PHYS.NP_TYPE'
      Visible = False
    end
    object qREZ_INST: TFloatField
      FieldName = 'REZ_INST'
      Origin = 'OIL_RESTS_PHYS.REZ_INST'
      Visible = False
    end
    object qREZ_ID: TFloatField
      FieldName = 'REZ_ID'
      Origin = 'OIL_RESTS_PHYS.REZ_ID'
      Visible = False
    end
    object qSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'OIL_RESTS_PHYS.STATE'
      Visible = False
      Size = 1
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Origin = 'OIL_RESTS_PHYS.INST'
      Visible = False
    end
    object qID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_RESTS_PHYS.ID'
      Visible = False
    end
  end
  inherited PUM: TPopupMenu
    Top = 104
  end
  object rezQ: TOilQuery
    SQL.Strings = (
      'select * from oil_rezervuar '
      'where'
      '   state = '#39'Y'#39' and'
      '   id_org = :org_id and'
      '   inst_org = :org_inst and'
      '   (id, inst) in '
      '     (select distinct rez_id, rez_inst from'
      '      oil_rc_belts)')
    OnFilterRecord = rezQFilterRecord
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 192
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'org_id'
      end
      item
        DataType = ftInteger
        Name = 'org_inst'
      end>
    object rezQID: TFloatField
      FieldName = 'ID'
    end
    object rezQID_ORG: TFloatField
      FieldName = 'ID_ORG'
    end
    object rezQSTATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object rezQINST: TFloatField
      FieldName = 'INST'
    end
    object rezQNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object rezQCAPACITY: TStringField
      FieldName = 'CAPACITY'
      Size = 50
    end
    object rezQDEAD: TFloatField
      FieldName = 'DEAD'
    end
    object rezQNUM: TStringField
      FieldName = 'NUM'
    end
    object rezQINST_ORG: TFloatField
      FieldName = 'INST_ORG'
    end
    object rezQDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
    end
    object rezQUB_KAT: TFloatField
      FieldName = 'UB_KAT'
    end
    object rezQDNO_CORR: TFloatField
      FieldName = 'DNO_CORR'
    end
    object rezQLAST_CAL_DATE: TDateTimeField
      FieldName = 'LAST_CAL_DATE'
    end
  end
  object DelQ: TOilQuery
    SQL.Strings = (
      'update oil_rests_phys set state = '#39'N'#39' '
      'where '
      '  id = :id and'
      '  inst = :inst')
    MasterSource = ds
        DataSource = ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 144
    Top = 193
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
end
