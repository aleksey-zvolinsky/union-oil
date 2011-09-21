inherited FCompUserAdd: TFCompUserAdd
  Left = 420
  Top = 89
  Width = 254
  Height = 348
  Caption = 'Пользователь'
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 48
    Width = 64
    Height = 13
    Caption = 'До&лжность :'
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 80
    Height = 13
    Caption = '&Фамилия И.О. :'
  end
  object Label3: TLabel
    Left = 16
    Top = 88
    Width = 37
    Height = 13
    Caption = 'О&тдел :'
  end
  object Label4: TLabel
    Left = 16
    Top = 128
    Width = 50
    Height = 13
    Caption = 'Ко&мната :'
  end
  object Label5: TLabel
    Left = 16
    Top = 208
    Width = 71
    Height = 13
    Caption = 'Сетевое &имя :'
  end
  object Label6: TLabel
    Left = 16
    Top = 168
    Width = 79
    Height = 13
    Caption = 'Сетевая г&рупа :'
  end
  object eAssigment: TEdit
    Left = 16
    Top = 64
    Width = 225
    Height = 21
    Color = clMenu
    Enabled = False
    TabOrder = 1
  end
  object EDepartment: TEdit
    Left = 16
    Top = 104
    Width = 225
    Height = 21
    MaxLength = 30
    TabOrder = 2
  end
  object ERoom: TEdit
    Left = 16
    Top = 144
    Width = 225
    Height = 21
    MaxLength = 20
    TabOrder = 3
    OnKeyPress = ERoomKeyPress
  end
  object ELocalGroup: TEdit
    Left = 16
    Top = 184
    Width = 225
    Height = 21
    MaxLength = 15
    TabOrder = 4
  end
  object ELocalName: TEdit
    Left = 16
    Top = 224
    Width = 225
    Height = 21
    MaxLength = 15
    TabOrder = 5
  end
  object pButtons: TPanel
    Left = 0
    Top = 273
    Width = 246
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 6
    object bbOK: TBitBtn
      Left = 69
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
      Left = 160
      Top = 8
      Width = 82
      Height = 25
      Caption = '&Отменить'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object ceName: TComboEdit
    Left = 16
    Top = 24
    Width = 225
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
    OnButtonClick = ceNameButtonClick
    OnDblClick = ceNameButtonClick
  end
  object Query1: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 32
    Top = 248
  end
  object Query2: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 64
    Top = 248
  end
  object sp1: TOilStoredProc
        Left = 96
    Top = 248
  end
end
