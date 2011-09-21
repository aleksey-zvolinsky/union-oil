inherited PipeRestsForm: TPipeRestsForm
  Left = 291
  Top = 133
  BorderStyle = bsDialog
  Caption = 'Остаток НП в трубопроводе'
  ClientHeight = 272
  ClientWidth = 493
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 67
    Height = 13
    Caption = 'Организация'
  end
  object Label3: TLabel
    Left = 156
    Top = 77
    Width = 205
    Height = 28
    AutoSize = False
    Caption = 'Дата (до всех операций этого дня)'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 8
    Top = 152
    Width = 38
    Height = 13
    Caption = 'Тип НП'
  end
  object Label5: TLabel
    Left = 8
    Top = 183
    Width = 85
    Height = 13
    Caption = 'Уд. вес т/м. куб.'
  end
  object Label2: TLabel
    Left = 288
    Top = 183
    Width = 67
    Height = 13
    Caption = 'Температура'
  end
  object Label6: TLabel
    Left = 8
    Top = 47
    Width = 66
    Height = 13
    Caption = 'Трубопровод'
  end
  object Label7: TLabel
    Left = 288
    Top = 209
    Width = 72
    Height = 13
    Caption = 'Объем м. куб.'
  end
  object Label8: TLabel
    Left = 8
    Top = 215
    Width = 44
    Height = 13
    Caption = 'Масса т.'
  end
  object Bevel1: TBevel
    Left = 280
    Top = 117
    Width = 208
    Height = 7
    Shape = bsTopLine
  end
  object Panel2: TPanel
    Left = 0
    Top = 239
    Width = 493
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 9
    object bbOk: TBitBtn
      Left = 306
      Top = 4
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Принять'
      Default = True
      TabOrder = 0
      OnClick = bbOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbCancel: TBitBtn
      Left = 396
      Top = 4
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Отменить'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object edFrom: TComboEdit
    Left = 96
    Top = 8
    Width = 393
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 0
    OnButtonClick = edFromButtonClick
  end
  object DateEdit1: TDateEdit
    Left = 368
    Top = 72
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object edNPType: TComboEdit
    Left = 96
    Top = 144
    Width = 393
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 5
    OnButtonClick = edNPTypeButtonClick
  end
  object RxCalcEdit1: TRxCalcEdit
    Left = 96
    Top = 175
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 6
    DisplayFormat = ',0.####'
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 6
    OnExit = RxCalcEdit1Exit
  end
  object RxCalcEdit5: TRxCalcEdit
    Left = 368
    Top = 175
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.'
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 7
  end
  object edPipe: TComboEdit
    Left = 96
    Top = 40
    Width = 393
    Height = 20
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 1
    OnButtonClick = edPipeButtonClick
  end
  object RxCalcEdit2: TRxCalcEdit
    Left = 96
    Top = 207
    Width = 121
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    DecimalPlaces = 9
    DisplayFormat = ',0.######'
    Enabled = False
    ButtonWidth = 0
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 10
  end
  object RxCalcEdit3: TRxCalcEdit
    Left = 368
    Top = 207
    Width = 121
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    DecimalPlaces = 9
    DisplayFormat = ',0.######'
    Enabled = False
    ButtonWidth = 0
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 11
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 207
    Width = 25
    Height = 25
    TabOrder = 8
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
      73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
      0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
      0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
      0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
      0333337F777777737F333308888888880333337F333333337F33330888888888
      03333373FFFFFFFF733333700000000073333337777777773333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 7
    Top = 104
    Width = 131
    Height = 25
    Caption = 'Как в прошлый раз'
    Enabled = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 143
    Top = 104
    Width = 131
    Height = 25
    Caption = 'Как в резервуаре...'
    Enabled = False
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object sp: TOilStoredProc
        Left = 256
    Top = 176
  end
  object GetSeqQuery: TOilQuery
    SQL.Strings = (
      'select s_oil_rests_pipe.nextval as nv from sys.dual')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 256
    Top = 144
    object GetSeqQueryNV: TFloatField
      FieldName = 'NV'
    end
  end
  object OldQ: TOilQuery
    SQL.Strings = (
      'select '
      '  orp.*,'
      '  ont.name '
      'from '
      '  oil_rests_pipe orp,'
      '  oil_np_type ont'
      'where '
      '  orp.state  = '#39'Y'#39' and'
      '  orp.pipe_id = :pipe_id and'
      '  orp.pipe_inst  = :pipe_inst and'
      '  orp.date_ <= :date_ and'
      '  ont.id  = orp.np_type'
      'order by '
      '   orp.date_  desc ')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 88
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pipe_id'
      end
      item
        DataType = ftInteger
        Name = 'pipe_inst'
      end
      item
        DataType = ftDateTime
        Name = 'date_'
      end>
    object OldQID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_RESTS_PIPE.ID'
    end
    object OldQINST: TFloatField
      FieldName = 'INST'
      Origin = 'OIL_RESTS_PIPE.INST'
    end
    object OldQSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'OIL_RESTS_PIPE.STATE'
      Size = 1
    end
    object OldQPIPE_ID: TFloatField
      FieldName = 'PIPE_ID'
      Origin = 'OIL_RESTS_PIPE.PIPE_ID'
    end
    object OldQPIPE_INST: TFloatField
      FieldName = 'PIPE_INST'
      Origin = 'OIL_RESTS_PIPE.PIPE_INST'
    end
    object OldQNP_TYPE: TFloatField
      FieldName = 'NP_TYPE'
      Origin = 'OIL_RESTS_PIPE.NP_TYPE'
    end
    object OldQDATE_: TDateTimeField
      FieldName = 'DATE_'
      Origin = 'OIL_RESTS_PIPE.DATE_'
    end
    object OldQTEMPERATURE: TFloatField
      FieldName = 'TEMPERATURE'
      Origin = 'OIL_RESTS_PIPE.TEMPERATURE'
    end
    object OldQUD_VEIGHT: TFloatField
      FieldName = 'UD_VEIGHT'
      Origin = 'OIL_RESTS_PIPE.UD_VEIGHT'
    end
    object OldQNAME: TStringField
      FieldName = 'NAME'
      Origin = 'OIL_NP_TYPE.NAME'
      Size = 50
    end
  end
  object TestQ: TOilQuery
    SQL.Strings = (
      'select count(*) co'
      '  from oil_rests_phys'
      ' where state = '#39'Y'#39
      '   and np_type = :np_type'
      '   and date_ = :date_'
      '   and temperature = :temp'
      '   and ud_veight = :uv')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 312
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'np_type'
      end
      item
        DataType = ftUnknown
        Name = 'date_'
      end
      item
        DataType = ftUnknown
        Name = 'temp'
      end
      item
        DataType = ftUnknown
        Name = 'uv'
      end>
  end
end
