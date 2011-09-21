inherited OneSImportForm: TOneSImportForm
  Left = 223
  Top = 251
  BorderIcons = [biMinimize]
  BorderStyle = bsSingle
  Caption = #1048#1084#1087#1086#1088#1090' '#1073#1072#1083#1072#1085#1089#1072' '#1080#1079' 1'#1057
  ClientHeight = 208
  ClientWidth = 637
  Constraints.MaxHeight = 242
  Constraints.MaxWidth = 645
  Constraints.MinHeight = 235
  Constraints.MinWidth = 645
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 150
    Width = 637
    Height = 42
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object ImportButton: TBitBtn
      Left = 434
      Top = 8
      Width = 97
      Height = 25
      Caption = #1048#1084#1087#1086#1088#1090
      TabOrder = 0
      OnClick = ImportButtonClick
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
    object CloseButton: TBitBtn
      Left = 538
      Top = 8
      Width = 89
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = CloseButtonClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object pb1: TProgressBar
    Left = 0
    Top = 192
    Width = 637
    Height = 16
    Align = alBottom
    Step = 1
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 77
    Width = 637
    Height = 73
    Align = alTop
    Caption = 'Cres****.dbf'
    TabOrder = 2
    object Label4: TLabel
      Left = 3
      Top = 20
      Width = 73
      Height = 13
      Caption = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091' :'
    end
    object Label2: TLabel
      Left = 2
      Top = 44
      Width = 83
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' :'
    end
    object DateLabel2: TLabel
      Left = 88
      Top = 44
      Width = 23
      Height = 13
      Caption = 'Date'
    end
    object fCres: TFilenameEdit
      Left = 88
      Top = 12
      Width = 537
      Height = 21
      Filter = #1060#1072#1081#1083' '#1089' '#1076#1072#1085#1085#1099#1084#1080' (Cres****.dbf)|Cres*.dbf'
      NumGlyphs = 1
      TabOrder = 0
      OnChange = fCresChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 637
    Height = 77
    Align = alTop
    Caption = 'Cbal****.dbf'
    TabOrder = 3
    object Label5: TLabel
      Left = 3
      Top = 24
      Width = 73
      Height = 13
      Caption = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091' :'
    end
    object Label1: TLabel
      Left = 2
      Top = 48
      Width = 83
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' :'
    end
    object DateLabel1: TLabel
      Left = 88
      Top = 49
      Width = 23
      Height = 13
      Caption = 'Date'
    end
    object fCbal: TFilenameEdit
      Left = 88
      Top = 24
      Width = 537
      Height = 21
      Filter = #1060#1072#1081#1083' '#1089' '#1076#1072#1085#1085#1099#1084#1080' (Cbal****.dbf)|Cbal*.dbf'
      NumGlyphs = 1
      TabOrder = 0
      OnChange = fCbalChange
    end
  end
  object Table1: TTable
    TableName = 
      'C:\Documents and Settings\frendos\Desktop\DBF\1.06.03-30.06.03/c' +
      'bal0603.DBF'
    TableType = ttFoxPro
    Left = 178
    Top = 12
  end
  object Table2: TTable
    ReadOnly = True
    TableType = ttFoxPro
    Left = 210
    Top = 12
  end
  object sp1: TOilStoredProc
    StoredProcName = 'OIL.INSORUPDOIL_1C_BAL'
        Left = 242
    Top = 12
  end
  object q1: TOilQuery
    SQL.Strings = (
      'Select cbal.* '
      
        'from '#39'C:\Documents and Settings\frendos\Desktop\DBF\cbal0603.DBF' +
        #39' cbal')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 178
    Top = 44
  end
  object q2: TOilQuery
    SQL.Strings = (
      'Select cbal.* '
      
        'from '#39'C:\Documents and Settings\frendos\Desktop\DBF\cres0603.DBF' +
        #39' cbal')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 210
    Top = 44
  end
  object qGetSQ: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 274
    Top = 12
  end
  object sp3: TOilStoredProc
    StoredProcName = 'OIL.INSORUPDOIL_1C_BAL_DET2'
        Left = 243
    Top = 77
  end
  object sp2: TOilStoredProc
    StoredProcName = 'OIL.INSORUPDOIL_1C_BAL_DET'
        Left = 242
    Top = 44
  end
  object qUp: TOilQuery
    SQL.Strings = (
      'SELECT Oil_1c_bal.*'
      'FROM OIL_1C_BAL Oil_1c_bal'
      'where state='#39'Y'#39' and inst=:inst'
      'ORDER BY DATE_BEGIN')
    UpdateObject = UpdSQL
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 306
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
  object UpdSQL: TOraUpdateSQL
    ModifySQL.Strings = (
      'update OIL_1C_BAL set state='#39'N'#39)
    DeleteSQL.Strings = (
      'update OIL_1C_BAL'
      'set STATE = '#39'N'#39
      'where'
      '  ID = :OLD_ID and'
      '  INST = :OLD_INST')
    Left = 306
    Top = 44
  end
  object qDec: TOilQuery
    SQL.Strings = (
      'select Oil_1c_bal_det.val'
      'from Oil_1c_bal_det'
      'where Oil_1c_bal_det.STATE='#39'Y'#39
      'and Oil_1c_bal_det.decode='#39'N'#39
      '')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 338
    Top = 12
  end
  object DataSource1: TOraDataSource
    DataSet = Table2
    Left = 136
    Top = 72
  end
end
