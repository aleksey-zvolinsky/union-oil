inherited RezRestsForm: TRezRestsForm
  Left = 245
  Top = 210
  BorderStyle = bsDialog
  Caption = 'Остатки товара в резервуаре'
  ClientHeight = 260
  ClientWidth = 492
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 67
    Height = 13
    Caption = 'Организация'
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 54
    Height = 13
    Caption = 'Резервуар'
  end
  object Label3: TLabel
    Left = 248
    Top = 38
    Width = 105
    Height = 25
    AutoSize = False
    Caption = 'Дата (до всех операций этого дня)'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 8
    Top = 72
    Width = 38
    Height = 13
    Caption = 'Тип НП'
  end
  object Label5: TLabel
    Left = 8
    Top = 112
    Width = 38
    Height = 13
    Caption = 'Уд. вес'
  end
  object Label6: TLabel
    Left = 264
    Top = 112
    Width = 67
    Height = 13
    Caption = 'Температура'
  end
  object Label7: TLabel
    Left = 8
    Top = 144
    Width = 94
    Height = 13
    Caption = 'Общая высота мм'
  end
  object Label8: TLabel
    Left = 264
    Top = 144
    Width = 86
    Height = 13
    Caption = 'Высота воды мм'
  end
  object Label9: TLabel
    Left = 8
    Top = 176
    Width = 121
    Height = 13
    Caption = 'Объем продукта м. куб.'
  end
  object Label10: TLabel
    Left = 264
    Top = 176
    Width = 98
    Height = 13
    Caption = 'Объем воды м. куб'
  end
  object Label11: TLabel
    Left = 8
    Top = 208
    Width = 96
    Height = 13
    Caption = 'Масса продукта  т.'
  end
  object P: TPanel
    Left = 0
    Top = 228
    Width = 492
    Height = 32
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 9
    object bbOk: TBitBtn
      Left = 308
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
      Left = 405
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
    Left = 80
    Top = 8
    Width = 409
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 0
    OnButtonClick = edFromButtonClick
  end
  object DateEdit1: TDateEdit
    Left = 368
    Top = 40
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object edNPType: TComboEdit
    Left = 80
    Top = 72
    Width = 409
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 3
    OnButtonClick = edNPTypeButtonClick
  end
  object RxCalcEdit1: TRxCalcEdit
    Left = 136
    Top = 104
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 5
    DisplayFormat = ',0.####'
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 4
  end
  object RxCalcEdit2: TRxCalcEdit
    Left = 136
    Top = 136
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 5
    DisplayFormat = ',0.'
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 6
    OnExit = RxCalcEdit2Exit
  end
  object RxCalcEdit3: TRxCalcEdit
    Left = 136
    Top = 168
    Width = 121
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    DecimalPlaces = 10
    DisplayFormat = ',0.######'
    Enabled = False
    ButtonWidth = 0
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 10
    OnChange = RxCalcEdit3Change
  end
  object RxCalcEdit4: TRxCalcEdit
    Left = 136
    Top = 200
    Width = 121
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    DecimalPlaces = 10
    DisplayFormat = ',0.######'
    Enabled = False
    ButtonWidth = 0
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 11
  end
  object RxCalcEdit5: TRxCalcEdit
    Left = 368
    Top = 104
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.'
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 5
  end
  object RxCalcEdit6: TRxCalcEdit
    Left = 368
    Top = 136
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 5
    DisplayFormat = ',0.'
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 7
    OnExit = RxCalcEdit6Exit
  end
  object RxCalcEdit7: TRxCalcEdit
    Left = 368
    Top = 168
    Width = 121
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    DecimalPlaces = 10
    DisplayFormat = ',0.######'
    Enabled = False
    ButtonWidth = 0
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 12
  end
  object EdRez: TComboBox
    Left = 80
    Top = 40
    Width = 89
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = EdRezChange
  end
  object BitBtn1: TBitBtn
    Left = 264
    Top = 200
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
    Left = 176
    Top = 40
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
  object sp: TOilStoredProc
        Left = 280
    Top = 200
  end
  object GetSeqQuery: TOilQuery
    SQL.Strings = (
      'select s_oil_rests_phys.nextval as nv from sys.dual')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 64
    Top = 104
    object GetSeqQueryNV: TFloatField
      FieldName = 'NV'
    end
  end
  object vzlivQ: TOilQuery
    SQL.Strings = (
      
        'select rez_vzliv(:rez_id, :rez_inst, :hgt) as vzliv from sys.dua' +
        'l')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 280
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rez_id'
      end
      item
        DataType = ftInteger
        Name = 'rez_inst'
      end
      item
        DataType = ftFloat
        Name = 'hgt'
      end>
    object vzlivQVZLIV: TFloatField
      FieldName = 'VZLIV'
    end
  end
end
