inherited KpFaultForm: TKpFaultForm
  Left = 419
  Top = 289
  BorderStyle = bsDialog
  Caption = 'Сбой'
  ClientHeight = 216
  ClientWidth = 430
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 86
    Top = 336
    Width = 304
    Height = 39
    Anchors = [akLeft, akBottom]
    Caption = 
      'ВНИМАНИЕ !'#13#10'Описания сбоев будут регулярно анализироваться, '#13#10'по' +
      'этому для их ввода необходимо иметь веские основания'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 75
    Top = 98
    Width = 64
    Height = 13
    Alignment = taRightJustify
    Caption = 'Начало сбоя'
  end
  object Label2: TLabel
    Left = 254
    Top = 98
    Width = 58
    Height = 13
    Caption = 'Конец сбоя'
  end
  object Label4: TLabel
    Left = 86
    Top = 126
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Описание:'
  end
  object Label5: TLabel
    Left = 26
    Top = 153
    Width = 113
    Height = 13
    Alignment = taRightJustify
    Caption = 'Фимилия  сотрудника'
  end
  object Label6: TLabel
    Left = 93
    Top = 42
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Тип сбоя'
  end
  object Label7: TLabel
    Left = 33
    Top = 69
    Width = 106
    Height = 13
    Alignment = taRightJustify
    Caption = 'Подразделение/АЗС'
  end
  object Label8: TLabel
    Left = 77
    Top = 12
    Width = 62
    Height = 13
    Alignment = taRightJustify
    Caption = 'Группа сбоя'
  end
  object Panel1: TPanel
    Left = 0
    Top = 183
    Width = 430
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 7
    object Panel3: TPanel
      Left = 233
      Top = 2
      Width = 195
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
    object bbOk: TBitBtn
      Left = 246
      Top = 4
      Width = 86
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Принять'
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
      Left = 338
      Top = 4
      Width = 86
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Отменить'
      TabOrder = 1
      OnClick = bbCancelClick
      Kind = bkCancel
    end
  end
  object deBegin: TDateEdit
    Left = 149
    Top = 93
    Width = 92
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
  end
  object deEnd: TDateEdit
    Left = 319
    Top = 93
    Width = 100
    Height = 21
    NumGlyphs = 2
    TabOrder = 4
  end
  object edComment: TEdit
    Left = 149
    Top = 121
    Width = 273
    Height = 21
    TabOrder = 5
  end
  object edRespondent: TEdit
    Left = 149
    Top = 151
    Width = 273
    Height = 21
    TabOrder = 6
  end
  object cePodrazd: TComboEdit
    Left = 149
    Top = 65
    Width = 270
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 2
    OnButtonClick = cePodrazdButtonClick
    OnDblClick = cePodrazdButtonClick
  end
  object leGroups: TRxLookupEdit
    Left = 149
    Top = 8
    Width = 158
    Height = 21
    LookupField = 'NAME'
    LookupSource = dsGroups
    TabOrder = 0
    OnCloseUp = leGroupsCloseUp
  end
  object leTypes: TRxLookupEdit
    Left = 149
    Top = 36
    Width = 270
    Height = 21
    LookupField = 'NAME'
    LookupSource = dsTypes
    TabOrder = 1
    OnCloseUp = leTypesCloseUp
    OnButtonClick = leTypesButtonClick
  end
  object qTest: TOilQuery
    SQL.Strings = (
      'select count(*) as co'
      'from oil_kp_crash'
      'where crash_type=:crash_type'
      '      and state='#39'Y'#39
      '      and dep_id=:dep_id'
      '      and (:start_date between start_date and end_date'
      '           or :end_date between start_date and end_date)')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 386
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'crash_type'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'dep_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'start_date'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'end_date'
        ParamType = ptInput
      end>
    object qTestCO: TFloatField
      FieldName = 'CO'
    end
  end
  object qGroups: TOilQuery
    SQL.Strings = (
      'select id,name'
      'from oil_crash_group'
      'where state='#39'Y'#39
      'order by id')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 274
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
    Left = 330
    Top = 8
  end
  object dsTypes: TOraDataSource
    DataSet = qTypes
    Left = 330
    Top = 56
  end
  object qTypes: TOilQuery
    SQL.Strings = (
      'select id,name,options'
      'from v_oil_crash_type'
      'where (group_id=:id or :id is null)'
      'order by id')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 274
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
    object qTypesOPTIONS: TStringField
      FieldName = 'OPTIONS'
      Origin = 'MAINBASE.V_OIL_CRASH_TYPE.OPTIONS'
      Size = 50
    end
  end
end
