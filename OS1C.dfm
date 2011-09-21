inherited OS1CForm: TOS1CForm
  Left = 323
  Top = 206
  Width = 447
  Height = 404
  Caption = #1048#1084#1087#1086#1088#1090' '#1086#1089#1085#1086#1074#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074' '#1080#1079' 1'#1057
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PB1: TProgressBar
    Left = 0
    Top = 361
    Width = 439
    Height = 16
    Align = alBottom
    Step = 1
    TabOrder = 0
  end
  object OS1CForm: TPanel
    Left = 0
    Top = 0
    Width = 439
    Height = 361
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 63
      Height = 13
      Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072' :'
    end
    object BitBtn1: TBitBtn
      Left = 152
      Top = 36
      Width = 91
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 248
      Top = 36
      Width = 97
      Height = 25
      Caption = #1048#1084#1087#1086#1088#1090
      TabOrder = 1
      OnClick = BitBtn2Click
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
    object Edit1: TEdit
      Left = 80
      Top = 8
      Width = 353
      Height = 21
      TabOrder = 2
      OnKeyPress = Edit1KeyPress
    end
    object BitBtn3: TBitBtn
      Left = 352
      Top = 36
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 3
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
    object RE1: TRichEdit
      Left = 2
      Top = 72
      Width = 435
      Height = 287
      Align = alBottom
      ScrollBars = ssVertical
      TabOrder = 4
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'dbf'
    Filter = #1060#1072#1081#1083#1099' dbf|*.dbf'
    Left = 392
    Top = 8
  end
  object OSTable: TTable
    TableName = 'OSTemp'
    TableType = ttFoxPro
    Left = 224
    Top = 112
  end
  object q: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 160
    Top = 104
  end
  object SP1: TOilStoredProc
    StoredProcName = 'OIL.INSORUPDOIL_OS'
        Left = 160
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'ID#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INST#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATE#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'GROUP1#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'GROUP2#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'GROUP3#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'GROUP4#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'GROUP5#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NAME#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'BEGIN_COST#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'END_COST#'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATE_#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANTITY#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INV_NUMBER#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'POR_NUMBER#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STORAGE_#'
        ParamType = ptInput
      end>
  end
  object txtInstruction: TOilQuery
    SQL.Strings = (
      #1048#1085#1089#1090#1088#1091#1082#1094#1080#1103' '#1087#1086' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1102' '#1082#1086#1076#1080#1088#1086#1074#1082#1080
      ''
      
        '1. '#1045#1089#1083#1080' '#1074#1099' '#1085#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1080#1089#1090', '#1087#1086#1079#1086#1074#1080#1090#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1080#1089#1090#1072' '#1080' '#1076#1072#1081#1090#1077' '#1077#1084#1091' '#1087#1086#1095 +
        #1080#1090#1072#1090#1100' '#1101#1090#1091' '#1080#1085#1089#1090#1088#1091#1082#1094#1080#1102
      '2. '#1047#1072#1087#1091#1089#1090#1080#1090#1077' BDE Administrator'
      '3. '#1047#1072#1081#1076#1080#1090#1077' '#1085#1072' '#1079#1072#1082#1083#1072#1076#1082#1091' "Configuration"'
      '4. '#1053#1072#1081#1076#1080#1090#1077' '#1088#1072#1079#1076#1077#1083' Drivers -> Native -> FOXPRO.'
      '5. '#1042' '#1089#1090#1088#1086#1082#1077' LANGDRIVER '#1074#1099#1073#1077#1088#1080#1090#1077' '#39'ascii'#39' ANSI.'
      '6. '#1053#1072#1078#1084#1080#1090#1077' Ctrl+A '#1076#1083#1103' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1081'.'
      '7. '#1055#1077#1088#1077#1089#1090#1072#1088#1090#1091#1081#1090#1077' OIL.')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 56
    Top = 168
  end
  object qGroupList: TOilQuery
    SQL.Strings = (
      'select name '
      'from oil_pattern'
      'where state='#39'Y'#39' and type_id=1'
      'order by name')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 160
    Top = 216
  end
end
