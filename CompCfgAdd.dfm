inherited FCompCfgAdd: TFCompCfgAdd
  Left = 288
  Top = 50
  Width = 451
  Height = 542
  Caption = 'Конфигурация компьютера'
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 224
    Top = 184
    Width = 141
    Height = 13
    Caption = 'Емкость &видео карты (Мб) :'
  end
  object Label2: TLabel
    Left = 8
    Top = 184
    Width = 112
    Height = 13
    Caption = 'Модель &видео карты :'
  end
  object Label3: TLabel
    Left = 224
    Top = 224
    Width = 86
    Height = 13
    Caption = '&Звуковая карта :'
  end
  object Label4: TLabel
    Left = 272
    Top = 0
    Width = 50
    Height = 13
    Caption = '&ОЗУ (Мб):'
  end
  object Label9: TLabel
    Left = 8
    Top = 0
    Width = 149
    Height = 13
    Caption = '&Модель материнской платы :'
  end
  object Label10: TLabel
    Left = 224
    Top = 304
    Width = 219
    Height = 13
    Caption = '&Внутренний магнитооптический дисковод :'
  end
  object Label11: TLabel
    Left = 8
    Top = 304
    Width = 134
    Height = 13
    Caption = '&Внутренний Zip дисковод :'
  end
  object Label12: TLabel
    Left = 8
    Top = 224
    Width = 80
    Height = 13
    Caption = 'Се&тевая карта :'
  end
  object Label13: TLabel
    Left = 8
    Top = 432
    Width = 103
    Height = 13
    Caption = 'Другие у&cтройства :'
  end
  object Label15: TLabel
    Left = 8
    Top = 264
    Width = 102
    Height = 13
    Caption = '&Внутренний модем :'
  end
  object Label18: TLabel
    Left = 8
    Top = 392
    Width = 97
    Height = 13
    Caption = 'Модель &монитора :'
  end
  object CBFloppy: TCheckBox
    Left = 8
    Top = 368
    Width = 113
    Height = 17
    Caption = '&Флопи дисковод'
    State = cbGrayed
    TabOrder = 12
  end
  object CBSpeaker: TCheckBox
    Left = 8
    Top = 352
    Width = 113
    Height = 17
    Caption = '&Колонки'
    State = cbGrayed
    TabOrder = 11
  end
  object EMother: TEdit
    Left = 8
    Top = 16
    Width = 257
    Height = 21
    MaxLength = 50
    TabOrder = 0
  end
  object ERam: TEdit
    Left = 272
    Top = 16
    Width = 169
    Height = 21
    TabOrder = 1
    OnKeyPress = ERamKeyPress
  end
  object ELocal: TEdit
    Left = 8
    Top = 240
    Width = 209
    Height = 21
    MaxLength = 50
    TabOrder = 6
  end
  object EModelVideo: TEdit
    Left = 8
    Top = 200
    Width = 209
    Height = 21
    MaxLength = 50
    TabOrder = 4
  end
  object ERamVideo: TEdit
    Left = 224
    Top = 200
    Width = 217
    Height = 21
    TabOrder = 5
    OnKeyPress = ERamVideoKeyPress
  end
  object EMonitor: TEdit
    Left = 8
    Top = 408
    Width = 209
    Height = 21
    MaxLength = 50
    TabOrder = 13
  end
  object EZip: TEdit
    Left = 8
    Top = 320
    Width = 209
    Height = 21
    MaxLength = 50
    TabOrder = 9
  end
  object EMagnit: TEdit
    Left = 224
    Top = 320
    Width = 217
    Height = 21
    MaxLength = 50
    TabOrder = 10
  end
  object ESound: TEdit
    Left = 224
    Top = 240
    Width = 217
    Height = 21
    MaxLength = 50
    TabOrder = 7
  end
  object EModem: TEdit
    Left = 8
    Top = 280
    Width = 433
    Height = 21
    MaxLength = 50
    TabOrder = 8
  end
  object EOther: TEdit
    Left = 8
    Top = 448
    Width = 433
    Height = 21
    MaxLength = 50
    TabOrder = 14
  end
  object pButtons: TPanel
    Left = 0
    Top = 469
    Width = 443
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 17
    object bbOK: TBitBtn
      Left = 261
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
      Left = 352
      Top = 8
      Width = 82
      Height = 25
      Caption = '&Отменить'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object rgRom: TRadioGroup
    Left = 224
    Top = 352
    Width = 107
    Height = 89
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Диск'
    ItemIndex = 3
    Items.Strings = (
      'CD-ROM'
      'CD-RW'
      'DVD-ROM'
      'Нет')
    TabOrder = 15
  end
  object rgState: TRadioGroup
    Left = 336
    Top = 352
    Width = 105
    Height = 89
    Caption = 'Состояние'
    ItemIndex = 0
    Items.Strings = (
      'Рабочий'
      'Не рабочий'
      'Списанный')
    TabOrder = 16
  end
  object gbProc: TGroupBox
    Left = 0
    Top = 40
    Width = 443
    Height = 65
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Процесcор'
    TabOrder = 2
    object Label7: TLabel
      Left = 272
      Top = 16
      Width = 74
      Height = 13
      Caption = 'Частота (Мгц):'
    end
    object Label8: TLabel
      Left = 83
      Top = 16
      Width = 45
      Height = 13
      Caption = 'Модель :'
    end
    object Label14: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 13
      Caption = 'Количество :'
    end
    object EModelProc: TEdit
      Left = 80
      Top = 32
      Width = 185
      Height = 21
      MaxLength = 50
      TabOrder = 1
    end
    object ERamProc: TEdit
      Left = 272
      Top = 32
      Width = 169
      Height = 21
      TabOrder = 2
      OnKeyPress = ERamProcKeyPress
    end
    object seProc: TRxSpinEdit
      Left = 8
      Top = 32
      Width = 65
      Height = 21
      EditorEnabled = False
      MaxValue = 10
      MinValue = 1
      Value = 1
      MaxLength = 2
      TabOrder = 0
    end
  end
  object gbHard: TGroupBox
    Left = 0
    Top = 112
    Width = 443
    Height = 65
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Винчестер'
    TabOrder = 3
    object Label5: TLabel
      Left = 208
      Top = 20
      Width = 94
      Height = 13
      Caption = 'Общий обьём (Гб):'
    end
    object Label6: TLabel
      Left = 80
      Top = 20
      Width = 45
      Height = 13
      Caption = 'Модель :'
    end
    object Label19: TLabel
      Left = 320
      Top = 20
      Width = 63
      Height = 13
      Caption = '&Интерфейс :'
    end
    object Label16: TLabel
      Left = 8
      Top = 20
      Width = 65
      Height = 13
      Caption = 'Количество :'
    end
    object EModelHard: TEdit
      Left = 80
      Top = 36
      Width = 121
      Height = 21
      MaxLength = 50
      TabOrder = 1
    end
    object ECapacity: TEdit
      Left = 208
      Top = 36
      Width = 105
      Height = 21
      TabOrder = 2
      OnKeyPress = ECapacityKeyPress
    end
    object CEIFace: TComboEdit
      Left = 320
      Top = 36
      Width = 121
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
      OnButtonClick = CEIFaceButtonClick
      OnDblClick = CEIFaceButtonClick
    end
    object seHard: TRxSpinEdit
      Left = 8
      Top = 36
      Width = 65
      Height = 21
      EditorEnabled = False
      MaxValue = 10
      MinValue = 1
      Value = 1
      MaxLength = 2
      TabOrder = 0
    end
  end
  object Query1: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 128
    Top = 352
  end
  object Query2: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 160
    Top = 352
  end
  object sp1: TOilStoredProc
        Left = 192
    Top = 352
  end
end
