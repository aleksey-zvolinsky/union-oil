inherited MoneyForm: TMoneyForm
  Left = 366
  Top = 139
  BorderStyle = bsDialog
  Caption = #1054#1087#1083#1072#1090#1072
  ClientHeight = 520
  ClientWidth = 416
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lNum: TLabel
    Left = 8
    Top = 11
    Width = 40
    Height = 13
    Caption = #1053#1086#1084#1077#1088' :'
  end
  object lDate: TLabel
    Left = 144
    Top = 11
    Width = 32
    Height = 13
    Caption = #1044#1072#1090#1072' :'
  end
  object lExchange: TLabel
    Left = 248
    Top = 377
    Width = 98
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1041#1072#1088#1090#1077#1088#1085#1072#1103' '#1087#1072#1088#1090#1080#1103' :'
    Enabled = False
  end
  object lDepartment: TLabel
    Left = 8
    Top = 32
    Width = 86
    Height = 13
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' :'
  end
  object lOperation: TLabel
    Left = 8
    Top = 168
    Width = 56
    Height = 13
    Caption = #1054#1087#1077#1088#1072#1094#1080#1103' :'
  end
  object lComent: TLabel
    Left = 8
    Top = 417
    Width = 68
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1050#1086#1084#1077#1085#1090#1072#1088#1080#1081' :'
  end
  object lSum: TLabel
    Left = 304
    Top = 168
    Width = 40
    Height = 13
    Caption = #1057#1091#1084#1084#1072' :'
  end
  object sbExchange: TSpeedButton
    Left = 386
    Top = 392
    Width = 23
    Height = 22
    Anchors = [akLeft, akBottom]
    Enabled = False
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
    OnClick = sbExchangeClick
  end
  object lGoalPart: TLabel
    Left = 8
    Top = 377
    Width = 102
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1058#1080#1087' '#1094#1077#1083#1077#1074#1086#1081' '#1087#1072#1088#1090#1080#1080
  end
  object sbGoalPart: TSpeedButton
    Left = 218
    Top = 392
    Width = 23
    Height = 22
    Anchors = [akLeft, akBottom]
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
    OnClick = sbGoalPartClick
  end
  object sbOperation: TSpeedButton
    Left = 259
    Top = 183
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
    Visible = False
    OnClick = sbOperationClick
  end
  object pButtons: TPanel
    Left = 0
    Top = 488
    Width = 416
    Height = 32
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 12
    object bbOK: TBitBtn
      Left = 247
      Top = 4
      Width = 79
      Height = 25
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      Default = True
      TabOrder = 0
      OnClick = bbOKClick
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
      Left = 330
      Top = 4
      Width = 82
      Height = 25
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      Kind = bkCancel
    end
    object bbEditTax: TBitBtn
      Left = 4
      Top = 4
      Width = 117
      Height = 25
      Caption = '&'#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1053#1053
      TabOrder = 2
      OnClick = bbEditTaxClick
    end
  end
  object eNum: TEdit
    Left = 56
    Top = 8
    Width = 73
    Height = 21
    TabOrder = 0
    OnKeyPress = eNumKeyPress
  end
  object deDate: TDateEdit
    Left = 184
    Top = 8
    Width = 97
    Height = 21
    CheckOnExit = True
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 1
    OnChange = deDateChange
    OnExit = deDateExit
  end
  object ceSum: TCurrencyEdit
    Left = 304
    Top = 184
    Width = 105
    Height = 21
    AutoSize = False
    TabOrder = 5
    OnChange = ceSumChange
    OnExit = ceSumExit
  end
  object mComent: TMemo
    Left = 8
    Top = 433
    Width = 401
    Height = 41
    Anchors = [akLeft, akBottom]
    MaxLength = 100
    TabOrder = 11
  end
  object gbClient: TGroupBox
    Left = 8
    Top = 72
    Width = 401
    Height = 88
    Caption = ' '#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '
    TabOrder = 3
    object lAccount: TLabel
      Left = 245
      Top = 40
      Width = 25
      Height = 13
      Caption = #1056'/'#1057' :'
    end
    object lBank: TLabel
      Left = 24
      Top = 40
      Width = 31
      Height = 13
      Caption = #1041#1072#1085#1082' :'
    end
    object ceClient: TComboEdit
      Left = 8
      Top = 16
      Width = 385
      Height = 21
      Hint = #1050#1083#1080#1077#1085#1090' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1087#1088#1086#1076#1072#1083#1080' '#1090#1072#1083#1086#1085#1099
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ceClientButtonClick
      OnChange = ceClientChange
      OnDblClick = ceClientButtonClick
    end
    object dbgProperties: TDBGridEh
      Left = 8
      Top = 56
      Width = 385
      Height = 21
      Hint = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1082#1083#1080#1077#1085#1090#1072
      TabStop = False
      DataSource = dsProperties
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgPropertiesDblClick
      OnExit = dbgPropertiesExit
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Width = 220
        end
        item
          EditButtons = <>
          FieldName = 'RACH_CHET'
          Footers = <>
          Width = 130
        end>
    end
  end
  object ceOperation: TComboEdit
    Left = 8
    Top = 184
    Width = 249
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 4
    OnButtonClick = ceOperationButtonClick
    OnDblClick = ceOperationButtonClick
  end
  object ceExchange: TComboEdit
    Left = 248
    Top = 393
    Width = 136
    Height = 21
    DirectInput = False
    Enabled = False
    GlyphKind = gkDropDown
    Anchors = [akLeft, akBottom]
    NumGlyphs = 1
    TabOrder = 10
    OnButtonClick = ceExchangeButtonClick
    OnDblClick = ceExchangeButtonClick
  end
  object ceDepartment: TComboEdit
    Left = 8
    Top = 48
    Width = 400
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 2
    OnButtonClick = ceDepartmentButtonClick
    OnDblClick = ceDepartmentButtonClick
  end
  object rgGoods: TRadioGroup
    Left = 8
    Top = 333
    Width = 401
    Height = 40
    Anchors = [akLeft, akBottom]
    Caption = ' '#1058#1080#1087' '#1090#1086#1074#1072#1088#1072' '
    Columns = 3
    ItemIndex = 1
    Items.Strings = (
      #1050#1086#1084#1080#1089#1089#1080#1086#1085#1085#1072#1103
      #1057#1086#1073#1089#1090#1074#1077#1085#1085#1072#1103
      #1055#1088#1086#1095#1072#1103)
    TabOrder = 8
    OnClick = rgGoodsClick
  end
  object gbContract: TGroupBox
    Left = 8
    Top = 208
    Width = 254
    Height = 125
    Caption = ' '#1044#1086#1075#1086#1074#1086#1088' '#1082#1091#1087#1083#1080'-'#1087#1088#1086#1076#1072#1078#1080' '
    TabOrder = 6
    object sbContract: TSpeedButton
      Left = 218
      Top = 15
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
      OnClick = sbContractClick
    end
    object lContractType: TLabel
      Left = 8
      Top = 44
      Width = 25
      Height = 13
      Caption = #1058#1080#1087' :'
    end
    object lvContractType: TLabel
      Left = 40
      Top = 44
      Width = 72
      Height = 13
      Caption = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1072
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object ceContract: TComboEdit
      Left = 8
      Top = 16
      Width = 208
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ceContractButtonClick
      OnChange = ceContractChange
      OnDblClick = ceContractButtonClick
    end
    object gbSum: TGroupBox
      Left = 2
      Top = 67
      Width = 250
      Height = 56
      Align = alBottom
      Caption = #1057#1091#1084#1084#1099
      TabOrder = 1
      object LabelDog: TLabel
        Left = 8
        Top = 15
        Width = 64
        Height = 13
        Caption = #1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091':'
      end
      object LabelMoney: TLabel
        Left = 88
        Top = 15
        Width = 61
        Height = 13
        Caption = #1087#1086' '#1086#1087#1083#1072#1090#1072#1084':'
      end
      object LabelNN: TLabel
        Left = 168
        Top = 15
        Width = 75
        Height = 13
        Caption = #1087#1086' '#1085#1072#1083#1086#1075#1086#1074#1099#1084':'
      end
      object LabelDogSum: TLabel
        Left = 8
        Top = 33
        Width = 3
        Height = 13
      end
      object LabelMoneySum: TLabel
        Left = 88
        Top = 33
        Width = 3
        Height = 13
      end
      object LabelNNSum: TLabel
        Left = 168
        Top = 33
        Width = 3
        Height = 13
      end
    end
  end
  object gbTax: TGroupBox
    Left = 264
    Top = 208
    Width = 144
    Height = 71
    Caption = ' '#1053#1072#1083#1086#1075#1086#1074#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103' '
    Enabled = False
    TabOrder = 7
    object lTax: TLabel
      Left = 8
      Top = 16
      Width = 40
      Height = 13
      Caption = #1053#1086#1084#1077#1088' :'
    end
    object Label5: TLabel
      Left = 28
      Top = 96
      Width = 34
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086
      Visible = False
    end
    object eTax: TEdit
      Left = 56
      Top = 14
      Width = 72
      Height = 18
      AutoSize = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object cbNoTax: TCheckBox
      Left = 8
      Top = 47
      Width = 130
      Height = 16
      Caption = #1053#1077' '#1089#1086#1079#1076#1072#1074#1072#1090#1100' '#1053#1053
      TabOrder = 1
      OnClick = cbNoTaxClick
    end
    object clcSumma: TRxCalcEdit
      Left = 76
      Top = 92
      Width = 57
      Height = 21
      AutoSize = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 2
      Visible = False
    end
    object clcKolVo: TRxCalcEdit
      Left = 68
      Top = 92
      Width = 57
      Height = 21
      AutoSize = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 3
      Visible = False
    end
  end
  object ceGoalPart: TComboEdit
    Left = 8
    Top = 393
    Width = 208
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    Anchors = [akLeft, akBottom]
    NumGlyphs = 1
    TabOrder = 9
    OnButtonClick = ceGoalPartButtonClick
    OnChange = ceGoalPartChange
    OnDblClick = ceGoalPartButtonClick
  end
  object gbPayType: TGroupBox
    Left = 264
    Top = 280
    Width = 144
    Height = 53
    Caption = #1062#1077#1083#1100' '#1087#1083#1072#1090#1077#1078#1072':'
    TabOrder = 13
    Visible = False
    object lPayType: TLabel
      Left = 8
      Top = 24
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dsProperties: TOraDataSource
    DataSet = qProperties
    Left = 336
  end
  object qProperties: TOilQuery
    SQL.Strings = (
      'SELECT *'
      'FROM v_oil_rekvizit'
      'WHERE id_org = :p_OrgId'
      '  AND inst = :p_OrgInst'
      'ORDER BY def DESC  ')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 336
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_OrgId'
      end
      item
        DataType = ftInteger
        Name = 'p_OrgInst'
      end>
  end
  object sp1: TOilStoredProc
        Left = 384
    Top = 1
  end
  object Query1: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 139
    Top = 473
  end
  object Query2: TOilQuery
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 177
    Top = 473
  end
  object Query3: TOilQuery
    SQL.Strings = (
      '')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 217
    Top = 473
  end
  object qGetSumNN: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select sum(b.nds_t) sum_nn,'
      '       max(b.s_date) s_date'
      '  from v_oil_sale_book b, v_oil_sale_book_link l'
      ' where l.nn_id = b.id'
      '   and l.nn_inst = b.inst'
      '   and l.dog_id = :dog_id'
      '   and l.dog_inst = :dog_inst'
      '   and not (b.id = :nn_id and b.inst = :nn_inst)')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 336
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dog_id'
      end
      item
        DataType = ftUnknown
        Name = 'dog_inst'
      end
      item
        DataType = ftUnknown
        Name = 'nn_id'
      end
      item
        DataType = ftUnknown
        Name = 'nn_inst'
      end>
  end
  object qWork: TOilQuery
    Session = frmStart.OraSession1
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 146
    Top = 235
  end
end
