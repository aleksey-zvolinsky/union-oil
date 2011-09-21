inherited FCompOsAdd: TFCompOsAdd
  Left = 413
  Top = 103
  Width = 297
  Height = 121
  Caption = 'Операционная система'
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 179
    Height = 13
    Caption = 'Название операционной системы :'
  end
  object EOs: TEdit
    Left = 8
    Top = 24
    Width = 273
    Height = 21
    TabOrder = 0
  end
  object pButtons: TPanel
    Left = 0
    Top = 46
    Width = 289
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bbCancel: TBitBtn
      Left = 192
      Top = 8
      Width = 82
      Height = 25
      Caption = '&Отменить'
      TabOrder = 0
      Kind = bkCancel
    end
    object bbOK: TBitBtn
      Left = 101
      Top = 8
      Width = 79
      Height = 25
      Caption = '&Принять'
      TabOrder = 1
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
  end
  object Query1: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 56
    Top = 56
  end
  object Query2: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 96
    Top = 56
  end
  object sp1: TOilStoredProc
        Left = 136
    Top = 56
  end
end
