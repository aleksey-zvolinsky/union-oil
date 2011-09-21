inherited PipeRestsRefForm: TPipeRestsRefForm
  Caption = 'Остатки НП в технических нефтепроводах'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    TabOrder = 3
    inherited Panel3: TPanel
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
    Height = 111
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 67
      Height = 13
      Caption = 'Организация'
    end
    object Label4: TLabel
      Left = 8
      Top = 35
      Width = 38
      Height = 13
      Caption = 'Тип НП'
    end
    object Label6: TLabel
      Left = 8
      Top = 59
      Width = 66
      Height = 13
      Caption = 'Трубопровод'
    end
    object Label3: TLabel
      Left = 8
      Top = 86
      Width = 73
      Height = 19
      AutoSize = False
      Caption = 'Дата нач.'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 280
      Top = 86
      Width = 73
      Height = 19
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Дата кон.'
      WordWrap = True
    end
    object SpeedButton1: TSpeedButton
      Left = 470
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
    object SpeedButton3: TSpeedButton
      Left = 470
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
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 470
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
      OnClick = SpeedButton4Click
    end
    object SpeedButton5: TSpeedButton
      Left = 470
      Top = 80
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
      OnClick = SpeedButton5Click
    end
    object SpeedButton6: TSpeedButton
      Left = 222
      Top = 80
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
    object edFrom: TComboEdit
      Left = 96
      Top = 8
      Width = 369
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = edFromButtonClick
    end
    object edNPType: TComboEdit
      Left = 96
      Top = 32
      Width = 369
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = edNPTypeButtonClick
    end
    object edPipe: TComboEdit
      Left = 96
      Top = 56
      Width = 369
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = edPipeButtonClick
    end
    object DateEdit1: TDateEdit
      Left = 96
      Top = 80
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object DateEdit2: TDateEdit
      Left = 344
      Top = 80
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 4
    end
  end
  inherited pBase: TPanel
    Top = 121
    Height = 250
    TabOrder = 0
    inherited DBGrid1: TDBGridEh
      Height = 250
    end
  end
  inherited PanelCol: TPanel
    Top = 121
    Height = 250
    inherited cbCol: TRxCheckListBox
      Height = 222
    end
    inherited pRefresh: TPanel
      Top = 224
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select '
      '   orp.*,'
      '   op.*,'
      '   ont.name as ntype,'
      '   op.diameter*op.diameter*length_*3.14159265/4000000 as vol,'
      
        '   (op.diameter*op.diameter*length_*3.14159265/4000000)*ud_veigh' +
        't as mass,'
      '   oo.name as oname'
      'from '
      '  oil_rests_pipe orp,'
      '  oil_pipe  op,'
      '  oil_np_type ont,'
      '  v_org oo'
      'where'
      '  orp.state = '#39'Y'#39' and'
      '  op.state = '#39'Y'#39' and'
      '  ont.state = '#39'Y'#39' and'
      '  oo.state = '#39'Y'#39' and'
      '  orp.pipe_id = op.id and'
      '  orp.pipe_inst  = op.inst and'
      '  orp.np_type = ont.id and'
      '  oo.id = op.org_id and'
      '  oo.inst = op.org_inst'
      '  ')
    object qNTYPE: TStringField
      DisplayLabel = 'Нефтепродукт'
      DisplayWidth = 20
      FieldName = 'NTYPE'
      Origin = 'OIL_NP_TYPE.NAME'
      Size = 50
    end
    object qDATE_: TDateTimeField
      DisplayLabel = 'Дата'
      DisplayWidth = 10
      FieldName = 'DATE_'
      Origin = 'OIL_RESTS_PIPE.DATE_'
    end
    object qBOUNDS: TStringField
      DisplayLabel = 'Трубопровод'
      DisplayWidth = 50
      FieldName = 'BOUNDS'
      Origin = 'OIL_PIPE.BOUNDS'
      Size = 80
    end
    object qDIAMETER: TFloatField
      DisplayLabel = 'Диаметр мм'
      FieldName = 'DIAMETER'
      Origin = 'OIL_PIPE.DIAMETER'
      DisplayFormat = '0.'
    end
    object qLENGTH_: TFloatField
      DisplayLabel = 'Длина м.'
      FieldName = 'LENGTH_'
      Origin = 'OIL_PIPE.LENGTH_'
      DisplayFormat = '0.000'
    end
    object qVOL: TFloatField
      DisplayLabel = 'Объем м.куб.'
      FieldName = 'VOL'
      Origin = 'OIL_PIPE.DIAMETER'
      DisplayFormat = '0.000'
    end
    object qUD_VEIGHT: TFloatField
      DisplayLabel = 'Уд. вес'
      FieldName = 'UD_VEIGHT'
      Origin = 'OIL_RESTS_PIPE.UD_VEIGHT'
      DisplayFormat = '0.0000'
    end
    object qTEMPERATURE: TFloatField
      DisplayLabel = 'Температура'
      FieldName = 'TEMPERATURE'
      Origin = 'OIL_RESTS_PIPE.TEMPERATURE'
      DisplayFormat = '###.'
    end
    object qMASS: TFloatField
      DisplayLabel = 'Масса т.'
      FieldName = 'MASS'
      Origin = 'OIL_PIPE.DIAMETER'
      DisplayFormat = '0.000000'
    end
    object qORG_INST: TFloatField
      FieldName = 'ORG_INST'
      Origin = 'OIL_PIPE.ORG_INST'
      Visible = False
    end
    object qORG_ID: TFloatField
      FieldName = 'ORG_ID'
      Origin = 'OIL_PIPE.ORG_ID'
      Visible = False
    end
    object qSTATE_1: TStringField
      FieldName = 'STATE_1'
      Origin = 'OIL_PIPE.STATE'
      Visible = False
      Size = 1
    end
    object qINST_1: TFloatField
      FieldName = 'INST_1'
      Origin = 'OIL_PIPE.INST'
      Visible = False
    end
    object qID_1: TFloatField
      FieldName = 'ID_1'
      Origin = 'OIL_PIPE.ID'
      Visible = False
    end
    object qNP_TYPE: TFloatField
      FieldName = 'NP_TYPE'
      Origin = 'OIL_RESTS_PIPE.NP_TYPE'
      Visible = False
    end
    object qPIPE_INST: TFloatField
      FieldName = 'PIPE_INST'
      Origin = 'OIL_RESTS_PIPE.PIPE_INST'
      Visible = False
    end
    object qPIPE_ID: TFloatField
      FieldName = 'PIPE_ID'
      Origin = 'OIL_RESTS_PIPE.PIPE_ID'
      Visible = False
    end
    object qSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'OIL_RESTS_PIPE.STATE'
      Visible = False
      Size = 1
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Origin = 'OIL_RESTS_PIPE.INST'
      Visible = False
    end
    object qID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_RESTS_PIPE.ID'
      Visible = False
    end
    object qONAME: TStringField
      FieldName = 'ONAME'
      Origin = 'OIL_ORG.NAME'
      Visible = False
      Size = 100
    end
  end
  object DelQ: TOilQuery
    SQL.Strings = (
      'update oil_rests_pipe set state = '#39'N'#39' '
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
