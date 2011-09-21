inherited FCompOutDeviceAdd: TFCompOutDeviceAdd
  Left = 263
  Top = 101
  Width = 313
  Height = 341
  Caption = 'Внешнее устройство'
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 25
    Height = 13
    Caption = 'Тип :'
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 56
    Height = 13
    Caption = 'Название :'
  end
  object Label4: TLabel
    Left = 8
    Top = 128
    Width = 37
    Height = 13
    Caption = 'Отдел :'
  end
  object Label5: TLabel
    Left = 8
    Top = 88
    Width = 86
    Height = 13
    Caption = 'Подразделение :'
  end
  object Label6: TLabel
    Left = 8
    Top = 168
    Width = 69
    Height = 13
    Caption = 'Примечание :'
  end
  object ceType: TComboEdit
    Left = 8
    Top = 24
    Width = 289
    Height = 21
    DirectInput = False
    Glyph.Data = {
      D6000000424DD60000000000000076000000280000000C0000000C0000000100
      0400000000006000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      0000777777777777000077777777777700007777777777770000777770777777
      0000777700077777000077700000777700007700000007770000777777777777
      0000777777777777000077777777777700007777777777770000}
    ButtonWidth = 16
    NumGlyphs = 1
    TabOrder = 0
    OnButtonClick = ceTypeButtonClick
    OnDblClick = ceTypeButtonClick
  end
  object eName: TEdit
    Left = 8
    Top = 64
    Width = 289
    Height = 21
    MaxLength = 50
    TabOrder = 1
  end
  object eDep: TEdit
    Left = 8
    Top = 144
    Width = 289
    Height = 21
    MaxLength = 50
    TabOrder = 2
  end
  object ceOrg: TComboEdit
    Left = 8
    Top = 104
    Width = 289
    Height = 21
    DirectInput = False
    Glyph.Data = {
      D6000000424DD60000000000000076000000280000000C0000000C0000000100
      0400000000006000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      0000777777777777000077777777777700007777777777770000777770777777
      0000777700077777000077700000777700007700000007770000777777777777
      0000777777777777000077777777777700007777777777770000}
    ButtonWidth = 16
    NumGlyphs = 1
    TabOrder = 3
    OnButtonClick = ceOrgButtonClick
    OnDblClick = ceOrgButtonClick
  end
  object rgState: TRadioGroup
    Left = 0
    Top = 205
    Width = 297
    Height = 63
    Align = alBottom
    Caption = 'Состояние :'
    ItemIndex = 0
    Items.Strings = (
      'Рабочий'
      'Не рабочий'
      'Списанный')
    TabOrder = 5
  end
  object pButtons: TPanel
    Left = 0
    Top = 268
    Width = 297
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 6
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
    Top = 184
    Width = 289
    Height = 21
    MaxLength = 50
    TabOrder = 4
  end
  object Query1: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 168
    Top = 232
  end
  object Query2: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 200
    Top = 232
  end
  object sp1: TOilStoredProc
        Left = 232
    Top = 232
  end
end
