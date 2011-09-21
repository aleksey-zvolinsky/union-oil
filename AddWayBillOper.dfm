inherited AddWayBillOperForm: TAddWayBillOperForm
  Left = 432
  Top = 322
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 161
  ClientWidth = 274
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 78
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072' '#1079#1072#1090#1088#1072#1090' :'
  end
  object Label2: TLabel
    Left = 4
    Top = 44
    Width = 103
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1083#1080#1090#1088#1086#1074' :'
  end
  object Label3: TLabel
    Left = 4
    Top = 84
    Width = 129
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1080#1083#1086#1084#1077#1090#1088#1086#1074' :'
  end
  object RxLookupEdit1: TRxLookupEdit
    Left = 4
    Top = 19
    Width = 257
    Height = 21
    LookupDisplay = 'NAME'
    LookupField = 'ID'
    LookupSource = ds
    AutoSelect = False
    DirectInput = False
    TabOrder = 0
    Text = 'RxLookupEdit1'
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 4
    Top = 59
    Width = 161
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = '0.####'
    TabOrder = 1
  end
  object CurrencyEdit2: TCurrencyEdit
    Left = 4
    Top = 99
    Width = 161
    Height = 21
    AutoSize = False
    DecimalPlaces = 3
    DisplayFormat = '0.###'
    TabOrder = 2
  end
  object pBottom: TPanel
    Left = 0
    Top = 128
    Width = 274
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object pBtn: TPanel
      Left = 77
      Top = 2
      Width = 195
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        195
        29)
      object bbOk2: TBitBtn
        Left = 8
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1055#1088#1080#1085#1103#1090#1100
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
      object bbCancel2: TBitBtn
        Left = 104
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 1
        Kind = bkCancel
      end
    end
  end
  object ds: TOraDataSource
    DataSet = q
    Left = 176
  end
  object q: TOilQuery
    SQL.Strings = (
      'SELECT'
      '  REF1.ID AS ID,'
      '  REF1.AUTO_OPER_NAME AS NAME'
      'FROM OIL_AUTO_OPER_REF REF1'
      'WHERE '
      ' REF1.ID IN (2, 3, 4, 5)')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 144
    object qID: TFloatField
      FieldName = 'ID'
    end
    object qNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
end
