inherited Import1CDebForm: TImport1CDebForm
  Left = 469
  Top = 170
  Width = 366
  Height = 429
  Caption = #1048#1084#1087#1086#1088#1090' '#1076#1077#1073#1077#1090#1086#1088#1082#1080' '#1080#1079' 1'#1057
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 340
    Width = 358
    Height = 46
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      358
      46)
    object bbCancel: TBitBtn
      Left = 261
      Top = 10
      Width = 87
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&'#1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
    end
    object btnImport: TBitBtn
      Left = 8
      Top = 10
      Width = 87
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&'#1048#1084#1087#1086#1088#1090
      TabOrder = 1
      OnClick = btnImportClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000000000D
        DDDD77777777777DDDDD003333333330DDDD778888888887DDDD0B0333333333
        0DDD7878888888887DDD0FB03333333330DD78878888888887DD0BFB03333333
        330D788878888888887D0FBFB0000000000778888777777777770BFBFBFBFB0D
        DDDD78888888887DDDDD0FBFBFBFBF0DDDDD78888888887DDDDD0BFB0000000D
        DDDD78887777777DDDDDD000DDDDDDDD000DD777DDDDDDDD777DDDDDDDDDDDDD
        D00DDDDDDDDDDDDDD77DDDDDDDDD0DDD0D0DDDDDDDDD7DDD7D7DDDDDDDDDD000
        DDDDDDDDDDDDD777DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 104
      Top = 10
      Width = 153
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&'#1055#1088#1086#1089#1090#1072#1074#1080#1090#1100' ORG_ID'
      TabOrder = 2
      Visible = False
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333003333
        3333333333773FF3333333333309003333333333337F773FF333333333099900
        33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
        99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
        33333333337F3F77333333333309003333333333337F77333333333333090033
        33333333337F7733333333333309990033333FFFFF7F33773FF3000000099999
        0033777777733333773F09999999999999007FFFFFFF33333F77000000099999
        00337777777F333F773333333309990033333333337F3F773333333333090033
        33333333337F7733333333333300333333333333337733333333}
      NumGlyphs = 2
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 358
    Height = 340
    Align = alClient
    DataSource = ds
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DATE_'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1076#1077#1073#1077#1090#1086#1088#1082#1080
        Width = 158
      end
      item
        EditButtons = <>
        FieldName = 'DATE_CR'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1074#1099#1075#1088#1091#1079#1082#1080
        Width = 164
      end>
  end
  object pb1: TProgressBar
    Left = 0
    Top = 386
    Width = 358
    Height = 16
    Align = alBottom
    Step = 1
    TabOrder = 2
  end
  object tbl: TTable
    DatabaseName = 'D:\'
    TableName = '1CCardI.DBF'
    TableType = ttFoxPro
    Left = 88
    Top = 184
  end
  object q: TOilQuery
    SQL.Strings = (
      'select id,inst,date_,date_cr'
      'from oil_deb_1c'
      'where state='#39'Y'#39
      'order by date_ desc')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 192
    Top = 184
    object qDATE_: TDateTimeField
      FieldName = 'DATE_'
    end
    object qDATE_CR: TDateTimeField
      FieldName = 'DATE_CR'
    end
    object qID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Required = True
    end
  end
  object ds: TOraDataSource
    DataSet = q
    Left = 232
    Top = 184
  end
  object od1: TOpenDialog
    DefaultExt = 'dbf'
    Filter = #1060#1072#1081#1083#1099' dbf|*.dbf|'#1042#1089#1077' '#1092#1072#1081#1083#1099' |*.*'
    Left = 32
    Top = 352
  end
end
