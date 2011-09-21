inherited PumpForm: TPumpForm
  Left = 326
  Top = 242
  BorderStyle = bsDialog
  Caption = 'Перекачка данных из PETROLEUM'
  ClientHeight = 249
  ClientWidth = 296
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 166
    Width = 296
    Height = 50
    Align = alBottom
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 72
    Top = 4
    Width = 142
    Height = 16
    Caption = 'Предупреждение!!!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 20
    Top = 24
    Width = 231
    Height = 26
    Caption = 
      'Не запускайте перекачку более одного раза. Т.к. все данные сдубл' +
      'ируются!'
    WordWrap = True
  end
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 296
    Height = 57
    Align = alTop
    Shape = bsBottomLine
  end
  object Panel1: TPanel
    Left = 0
    Top = 216
    Width = 296
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object bBegin: TBitBtn
      Left = 114
      Top = 4
      Width = 83
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Начать'
      TabOrder = 0
      OnClick = bBeginClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bClose: TBitBtn
      Left = 206
      Top = 4
      Width = 83
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Закрыть'
      Default = True
      TabOrder = 1
      OnClick = bCloseClick
      Glyph.Data = {
        06020000424D0602000000000000760000002800000028000000140000000100
        0400000000009001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDD777777777777777DDDD7888888888888888D
        DDD877777777777777FDFD7788888888888888FDFD887777777777777F3F3777
        888888888888887F7888444444077777FFF4444D7777777888888887777DDDDD
        D450777F3FF4DDDDDDDDD78788887887DDDDDDDDD45507FFFFF4DDDDDDDDD788
        78888887DDDDDDDDD45550FFFFF4DDDDDDDDD78887888887DDDDDDD0045550FF
        FFF4DDDDDDD7778887888887DDDDDDD0A05550FFFFF4DDDDDDD7878887888887
        DDDD0000EA0550FFFEF4DDDD7777887887888F87DDDD0EAEAEA050FFFFF4DDDD
        7888888787888887DDDD0AEAEAEA00FEFEF4DDDD78888888778F8F87DDDD0EAE
        AEA050FFFFF4DDDD7888888787888887DDDD0000EA0550FEFEF4DDDD77778878
        878F8F87DDDDDDD0A05550EFEFE4DDDDDDD7878887F8F8F7DDDDDDD0045550FE
        FEF4DDDDDDD77788878F8F87DDDDDDDDD45550EFEFE4DDDDDDDDD78887F8F8F7
        DDDDDDDDD44444444444DDDDDDDDD77777777777DDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
    end
  end
  object chOrg: TCheckBox
    Left = 60
    Top = 120
    Width = 149
    Height = 17
    Caption = 'Перекачать организации'
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = chOrgClick
  end
  object chAuto: TCheckBox
    Left = 60
    Top = 176
    Width = 149
    Height = 17
    Caption = 'Перекачать автомобили'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object PBOrg: TProgressBar
    Left = 4
    Top = 140
    Width = 285
    Height = 16
    Min = 0
    Max = 100
    Step = 1
    TabOrder = 3
  end
  object PBAuto: TProgressBar
    Left = 4
    Top = 196
    Width = 285
    Height = 16
    Min = 0
    Max = 100
    Step = 1
    TabOrder = 4
  end
  object chBank: TCheckBox
    Left = 60
    Top = 68
    Width = 149
    Height = 17
    Caption = 'Перекачать Банки'
    Checked = True
    Enabled = False
    State = cbChecked
    TabOrder = 5
  end
  object PBBank: TProgressBar
    Left = 4
    Top = 88
    Width = 285
    Height = 16
    Min = 0
    Max = 100
    Step = 1
    TabOrder = 6
  end
  object tOrg: TTable
    DatabaseName = 'PETROLEUM_BASE'
    Exclusive = True
    ReadOnly = True
    TableName = 'BU_OR'
    TableType = ttDBase
    Left = 36
    Top = 132
    object tOrgCRT: TStringField
      FieldName = 'CRT'
    end
    object tOrgMDF: TStringField
      FieldName = 'MDF'
    end
    object tOrgOR_A: TStringField
      FieldName = 'OR_A'
      Size = 45
    end
    object tOrgOR_DPK: TDateField
      FieldName = 'OR_DPK'
    end
    object tOrgOR_DTD: TStringField
      FieldName = 'OR_DTD'
      Size = 10
    end
    object tOrgOR_DTKD: TStringField
      FieldName = 'OR_DTKD'
      Size = 10
    end
    object tOrgOR_DVP: TDateField
      FieldName = 'OR_DVP'
    end
    object tOrgOR_FD: TStringField
      FieldName = 'OR_FD'
      Size = 35
    end
    object tOrgOR_FKD: TStringField
      FieldName = 'OR_FKD'
      Size = 35
    end
    object tOrgOR_G: TStringField
      FieldName = 'OR_G'
      Size = 25
    end
    object tOrgOR_K: TFloatField
      FieldName = 'OR_K'
    end
    object tOrgOR_KB: TFloatField
      FieldName = 'OR_KB'
    end
    object tOrgOR_KRS: TStringField
      FieldName = 'OR_KRS'
      Size = 10
    end
    object tOrgOR_N: TFloatField
      FieldName = 'OR_N'
    end
    object tOrgOR_NA: TStringField
      FieldName = 'OR_NA'
      Size = 70
    end
    object tOrgOR_NBKRS: TStringField
      FieldName = 'OR_NBKRS'
      Size = 45
    end
    object tOrgOR_NOM: TFloatField
      FieldName = 'OR_NOM'
    end
    object tOrgOR_NSR: TStringField
      FieldName = 'OR_NSR'
      Size = 10
    end
    object tOrgOR_OB: TStringField
      FieldName = 'OR_OB'
      Size = 25
    end
    object tOrgOR_PI: TFloatField
      FieldName = 'OR_PI'
    end
    object tOrgOR_PR: TFloatField
      FieldName = 'OR_PR'
    end
    object tOrgOR_RAST: TFloatField
      FieldName = 'OR_RAST'
    end
    object tOrgOR_RES: TStringField
      FieldName = 'OR_RES'
      Size = 25
    end
    object tOrgOR_RN: TStringField
      FieldName = 'OR_RN'
      Size = 25
    end
    object tOrgOR_RS: TFloatField
      FieldName = 'OR_RS'
    end
    object tOrgOR_RSL: TFloatField
      FieldName = 'OR_RSL'
    end
    object tOrgOR_RTD: TStringField
      FieldName = 'OR_RTD'
      Size = 10
    end
    object tOrgOR_RTKD: TStringField
      FieldName = 'OR_RTKD'
      Size = 10
    end
    object tOrgOR_S: TStringField
      FieldName = 'OR_S'
      Size = 10
    end
    object tOrgOR_T: TStringField
      FieldName = 'OR_T'
      Size = 10
    end
    object tOrgOR_V: TStringField
      FieldName = 'OR_V'
      Size = 50
    end
    object tOrgOR_VD: TFloatField
      FieldName = 'OR_VD'
    end
    object tOrgOR_ZKPO: TFloatField
      FieldName = 'OR_ZKPO'
    end
  end
  object tBank: TTable
    DatabaseName = 'PETROLEUM_BASE'
    TableName = 'BU_B'
    TableType = ttDBase
    Left = 112
    Top = 80
    object tBankB_AD: TStringField
      FieldName = 'B_AD'
      Size = 45
    end
    object tBankB_KB: TFloatField
      FieldName = 'B_KB'
    end
    object tBankB_NB: TStringField
      FieldName = 'B_NB'
      Size = 45
    end
    object tBankCRT: TStringField
      FieldName = 'CRT'
    end
    object tBankMDF: TStringField
      FieldName = 'MDF'
    end
  end
  object tAuto: TTable
    DatabaseName = 'PETROLEUM_BASE'
    TableName = 'AZ_AU'
    TableType = ttDBase
    Left = 232
    Top = 156
    object tAutoAU_ATP: TStringField
      FieldName = 'AU_ATP'
      Size = 13
    end
    object tAutoAU_LIT: TFloatField
      FieldName = 'AU_LIT'
    end
    object tAutoAU_NUM: TStringField
      FieldName = 'AU_NUM'
      Size = 9
    end
    object tAutoAU_WOD: TStringField
      FieldName = 'AU_WOD'
    end
  end
  object SP: TOilStoredProc
        Left = 188
    Top = 144
  end
  object q2: TOilQuery
    SQL.Strings = (
      'select s_oil_org.nextval from sys.dual')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 248
    Top = 100
  end
  object q1: TOilQuery
    SQL.Strings = (
      'select s_oil_bank.nextval from sys.dual')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 200
    Top = 88
  end
  object DB: TDatabase
    AliasName = 'PETROLEUM'
    DatabaseName = 'PETROLEUM_BASE'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 60
    Top = 72
  end
end
