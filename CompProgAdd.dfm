inherited FCompProgAdd: TFCompProgAdd
  Left = 367
  Top = 108
  Width = 309
  Height = 286
  Caption = 'Программа'
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LName: TLabel
    Left = 8
    Top = 16
    Width = 118
    Height = 13
    Caption = 'На&звание программы :'
  end
  object LProduction: TLabel
    Left = 8
    Top = 56
    Width = 85
    Height = 13
    Caption = '&Производитель :'
  end
  object LVersion: TLabel
    Left = 8
    Top = 96
    Width = 43
    Height = 13
    Caption = 'В&ерсия :'
  end
  object Lnote: TLabel
    Left = 8
    Top = 176
    Width = 68
    Height = 13
    Caption = 'Ко&ментарий :'
  end
  object EName: TEdit
    Left = 8
    Top = 32
    Width = 289
    Height = 21
    MaxLength = 40
    TabOrder = 0
  end
  object EProduction: TEdit
    Left = 8
    Top = 72
    Width = 289
    Height = 21
    MaxLength = 40
    TabOrder = 1
  end
  object EVersion: TEdit
    Left = 8
    Top = 112
    Width = 289
    Height = 21
    MaxLength = 15
    TabOrder = 2
  end
  object CBLicense: TCheckBox
    Left = 8
    Top = 152
    Width = 185
    Height = 17
    Caption = 'Лицен&зированная программа'
    State = cbGrayed
    TabOrder = 3
  end
  object pButtons: TPanel
    Left = 0
    Top = 213
    Width = 297
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object bbOK: TBitBtn
      Left = 133
      Top = 8
      Width = 79
      Height = 25
      Caption = '&Принять'
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
      Left = 216
      Top = 8
      Width = 82
      Height = 25
      Caption = '&Отменить'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object eNote: TEdit
    Left = 8
    Top = 192
    Width = 289
    Height = 21
    MaxLength = 40
    TabOrder = 5
  end
  object Query2: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 272
    Top = 152
  end
  object sp1: TOilStoredProc
        Left = 208
    Top = 152
  end
  object Query1: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 240
    Top = 152
  end
end
