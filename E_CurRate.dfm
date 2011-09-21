inherited E_CurRateForm: TE_CurRateForm
  Left = 564
  Top = 329
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Ввод курса валюты'
  ClientHeight = 118
  ClientWidth = 182
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 88
    Width = 182
    Height = 30
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 5
      Top = 2
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      BiDiMode = bdLeftToRight
      Caption = '&Принять'
      Default = True
      ParentBiDiMode = False
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
      Left = 93
      Top = 2
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      BiDiMode = bdLeftToRight
      Caption = '&Отменить'
      ParentBiDiMode = False
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 182
    Height = 88
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 39
      Width = 41
      Height = 13
      Caption = 'Валюта:'
    end
    object Label2: TLabel
      Left = 6
      Top = 12
      Width = 29
      Height = 13
      Caption = 'Дата:'
    end
    object Label3: TLabel
      Left = 6
      Top = 65
      Width = 27
      Height = 13
      Caption = 'Курс:'
    end
    object deDate: TDateEdit
      Left = 52
      Top = 8
      Width = 123
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object calcRate: TRxCalcEdit
      Left = 52
      Top = 61
      Width = 123
      Height = 21
      Alignment = taLeftJustify
      AutoSize = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 1
    end
    object cbCurrency: TComboBox
      Left = 52
      Top = 35
      Width = 123
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
  end
  object qCurrency: TOilQuery
    SQL.Strings = (
      'select id, name'
      '  from oil_currency'
      ' where state = '#39'Y'#39
      '   and id in (1, 2)'
      ' order by name')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 72
    Top = 8
    object qCurrencyID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_CURRENCY.ID'
    end
    object qCurrencyNAME: TStringField
      FieldName = 'NAME'
      Origin = 'OIL_CURRENCY.NAME'
      Size = 30
    end
  end
  object q: TOilQuery
    SQL.Strings = (
      'select id, inst, date_, currency_id, currency_name, rate'
      '  from ve_currency_rate'
      ' where id = :id'
      '   and inst = :inst')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 40
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end>
  end
  object qWork: TOilQuery
    SQL.Strings = (
      'select *'
      '  from ve_currency_rate'
      ' where currency_id = :currency_id'
      '   and date_ = :date_'
      '   and inst = :inst')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 8
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'currency_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end>
  end
end
