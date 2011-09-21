inherited VedForm: TVedForm
  Left = 273
  Top = 156
  BorderStyle = bsDialog
  Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1087#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
  ClientHeight = 326
  ClientWidth = 582
  Constraints.MinHeight = 360
  Constraints.MinWidth = 590
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 3
    Width = 125
    Height = 13
    Caption = #1058#1080#1087' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072' :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 136
    Top = 3
    Width = 84
    Height = 13
    Caption = #1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblOwnGoods: TLabel
    Left = 272
    Top = 2
    Width = 68
    Height = 13
    Caption = #1058#1080#1087' '#1090#1086#1074#1072#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 294
    Width = 582
    Height = 32
    Align = alBottom
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 2
    object sbDel: TSpeedButton
      Left = 4
      Top = 3
      Width = 25
      Height = 25
      Action = actDel
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888000000000000888877777777777788880FFFFFFFFFF
        0888878888888888788880FFFFFFFFFF0888878888888888788880FF00000000
        0088878877777777778880FF09999999908887887FFFFFFFF78880FF09999999
        908887887FFFFFFFF78880FF000000000088878877777777778880FFFFFFFFFF
        0888878888888888788880F0F00F000F0888878787787778788880FFFFFFFFFF
        0888878888888888788880F000F0FFFF0888878777878888788880FFFFFFF000
        0888878888888777788880F000FFF0808888878777888787888880FFFFFFF008
        8888878888888778888880000000008888888777777777888888}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
    object bbOk: TBitBtn
      Left = 408
      Top = 3
      Width = 80
      Height = 25
      Action = actSave
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
    object BitBtn2: TBitBtn
      Left = 496
      Top = 3
      Width = 80
      Height = 25
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object dbgVed: TDBGridEh
    Left = 3
    Top = 19
    Width = 578
    Height = 214
    Hint = '(Enter)'
    DataSource = ds
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnEditButtonClick = dbgVedEditButtonClick
    OnKeyPress = dbgVedKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'Org_Name'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
        Width = 245
      end
      item
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'Dog_Name'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1086#1075#1086#1074#1086#1088
        Width = 60
      end
      item
        ButtonStyle = cbsNone
        EditButtons = <>
        FieldName = 'Dog_Date'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1076#1086#1075'.'
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'Litr'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'Price'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'Amount'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
        Width = 62
      end>
  end
  object Panel2: TPanel
    Left = 70
    Top = 236
    Width = 441
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label5: TLabel
      Left = 66
      Top = 8
      Width = 51
      Height = 13
      Caption = #1054#1090#1087#1091#1097#1077#1085#1086
    end
    object Label6: TLabel
      Left = 240
      Top = 8
      Width = 47
      Height = 13
      Caption = #1085#1072' '#1089#1091#1084#1084#1091
    end
    object Label1: TLabel
      Left = 22
      Top = 33
      Width = 95
      Height = 13
      Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1085#1072#1095#1072#1083#1086
    end
    object Label2: TLabel
      Left = 242
      Top = 33
      Width = 45
      Height = 13
      Caption = #1085#1072' '#1082#1086#1085#1077#1094
    end
    object Edit3: TEdit
      Left = 123
      Top = 5
      Width = 100
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 291
      Top = 5
      Width = 120
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 123
      Top = 30
      Width = 100
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 291
      Top = 30
      Width = 120
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  object Table1: TTable
    AfterOpen = Table1AfterPost
    BeforePost = Table1BeforePost
    AfterPost = Table1AfterPost
    AfterDelete = Table1AfterPost
    OnCalcFields = Table1CalcFields
    TableName = 'Oil_VedomostT.DB'
    Left = 19
    Top = 69
    object Table1Org_id: TIntegerField
      FieldName = 'Org_id'
    end
    object Table1Org_inst: TIntegerField
      FieldName = 'Org_inst'
    end
    object Table1Org_Name: TStringField
      FieldName = 'Org_Name'
      Size = 100
    end
    object Table1Dog_Id: TIntegerField
      FieldName = 'Dog_Id'
    end
    object Table1Dog_Inst: TIntegerField
      FieldName = 'Dog_Inst'
    end
    object Table1Litr: TFloatField
      FieldName = 'Litr'
      OnValidate = Table1LitrValidate
      DisplayFormat = '0.000###'
      EditFormat = '0.######'
      Precision = 3
    end
    object Table1Price: TFloatField
      FieldName = 'Price'
      OnValidate = Table1PriceValidate
      DisplayFormat = '0.00##'
      EditFormat = '0.00##'
      Precision = 2
    end
    object Table1Ttn_Id: TIntegerField
      FieldName = 'Ttn_Id'
    end
    object Table1Ttn_Inst: TIntegerField
      FieldName = 'Ttn_Inst'
    end
    object Table1SubPart: TIntegerField
      FieldName = 'SubPart'
    end
    object Table1CountT: TFloatField
      FieldName = 'CountT'
      DisplayFormat = '0.000000###'
      EditFormat = '0.#########'
      Precision = 6
    end
    object Table1Amount: TFloatField
      FieldName = 'Amount'
      DisplayFormat = '0.00##'
      EditFormat = '0.00##'
    end
    object Table1Dog_Name: TStringField
      FieldKind = fkCalculated
      FieldName = 'Dog_Name'
      ReadOnly = True
      Size = 50
      Calculated = True
    end
    object Table1Dog_Date: TDateField
      FieldKind = fkCalculated
      FieldName = 'Dog_Date'
      ReadOnly = True
      Calculated = True
    end
  end
  object ds: TDataSource
    DataSet = Table1
    Left = 33
    Top = 77
  end
  object Query1: TQuery
    Left = 76
    Top = 76
  end
  object dsDog: TOraDataSource
    Left = 356
    Top = 88
  end
  object qDog: TOilQuery
    SQL.Strings = (
      'select Id, Inst, Dog, Dog_Date'
      '  from Oil_Dog'
      ' where state = '#39'Y'#39
      '   and id = :dog_id and inst = :dog_inst'
      '')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 342
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dog_id'
      end
      item
        DataType = ftUnknown
        Name = 'dog_inst'
      end>
  end
  object qWork: TOilQuery
    SQL.Strings = (
      '')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 12
    Top = 153
  end
  object ActionList: TActionList
    Left = 121
    Top = 77
    object actSave: TAction
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      Hint = #1055#1088#1080#1085#1103#1090#1100
      ShortCut = 16467
      OnExecute = actSaveExecute
    end
    object actE: TAction
      ShortCut = 13
      OnExecute = actEExecute
    end
    object actDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16452
      OnExecute = actDelExecute
    end
  end
end
