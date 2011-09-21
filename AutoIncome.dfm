inherited AutoIncomeForm: TAutoIncomeForm
  Left = 305
  Top = 203
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Данные по заправке на сторонней АЗС (нефтебазе)'
  ClientHeight = 373
  ClientWidth = 386
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 338
    Width = 386
    Height = 35
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object bbOk: TBitBtn
      Left = 216
      Top = 5
      Width = 79
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Принять'
      TabOrder = 0
      OnClick = bbOkClick
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
      Left = 299
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Отменить'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 49
    Width = 386
    Height = 65
    Align = alTop
    Caption = 'Общие данные'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 97
      Height = 13
      Caption = 'Номер документа :'
    end
    object Label2: TLabel
      Left = 216
      Top = 16
      Width = 89
      Height = 13
      Caption = 'Дата документа :'
    end
    object Edit1: TEdit
      Left = 8
      Top = 32
      Width = 161
      Height = 21
      TabOrder = 0
    end
    object deDate: TDateEdit
      Left = 216
      Top = 32
      Width = 161
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnChange = deDateChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 226
    Width = 386
    Height = 112
    Align = alBottom
    Caption = 'Данные по техническому средству'
    TabOrder = 2
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 121
      Height = 13
      Caption = 'Техническое средство :'
    end
    object SpeedButton5: TSpeedButton
      Left = 175
      Top = 31
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD88DDDDDDDD
        88DDDDFFDDDDDDDDFFDDDD888DDDDDD888DDDDFFFDDDDDDFFFDDDDD888DDDD88
        8DDDDDDFFFDDDDFFFDDDDDDD888DD888DDDDDDDDFFFDDFFFDDDDDDDDD888888D
        DDDDDDDDDFFFFFFDDDDDDDDDDD8888DDDDDDDDDDDDFFFFDDDDDDDDDDDD8888DD
        DDDDDDDDDDFFFFDDDDDDDDDDD888888DDDDDDDDDDFFFFFFDDDDDDDDD888DD888
        DDDDDDDDFFFDDFFFDDDDDDD888DDDD888DDDDDDFFFDDDDFFFDDDDD888DDDDDD8
        88DDDDFFFDDDDDDFFFDDDD88DDDDDDDD88DDDDFFDDDDDDDDFFDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
      OnClick = SpeedButton5Click
    end
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 54
      Height = 13
      Caption = 'Водитель :'
    end
    object SpeedButton3: TSpeedButton
      Left = 175
      Top = 79
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD88DDDDDDDD
        88DDDDFFDDDDDDDDFFDDDD888DDDDDD888DDDDFFFDDDDDDFFFDDDDD888DDDD88
        8DDDDDDFFFDDDDFFFDDDDDDD888DD888DDDDDDDDFFFDDFFFDDDDDDDDD888888D
        DDDDDDDDDFFFFFFDDDDDDDDDDD8888DDDDDDDDDDDDFFFFDDDDDDDDDDDD8888DD
        DDDDDDDDDDFFFFDDDDDDDDDDD888888DDDDDDDDDDFFFFFFDDDDDDDDD888DD888
        DDDDDDDDFFFDDFFFDDDDDDD888DDDD888DDDDDDFFFDDDDFFFDDDDD888DDDDDD8
        88DDDDFFFDDDDDDFFFDDDD88DDDDDDDD88DDDDFFDDDDDDDDFFDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
      OnClick = SpeedButton3Click
    end
    object ceAuto: TComboEdit
      Left = 8
      Top = 32
      Width = 161
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ceAutoButtonClick
      OnDblClick = ceAutoButtonClick
    end
    object ceEmploy: TComboEdit
      Left = 8
      Top = 80
      Width = 161
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = ceEmployButtonClick
      OnDblClick = ceEmployButtonClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 114
    Width = 386
    Height = 112
    Align = alClient
    Caption = 'Данные по нефтепродукту'
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 79
      Height = 13
      Caption = 'Нефтепродукт :'
    end
    object SpeedButton4: TSpeedButton
      Left = 175
      Top = 31
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD88DDDDDDDD
        88DDDDFFDDDDDDDDFFDDDD888DDDDDD888DDDDFFFDDDDDDFFFDDDDD888DDDD88
        8DDDDDDFFFDDDDFFFDDDDDDD888DD888DDDDDDDDFFFDDFFFDDDDDDDDD888888D
        DDDDDDDDDFFFFFFDDDDDDDDDDD8888DDDDDDDDDDDDFFFFDDDDDDDDDDDD8888DD
        DDDDDDDDDDFFFFDDDDDDDDDDD888888DDDDDDDDDDFFFFFFDDDDDDDDD888DD888
        DDDDDDDDFFFDDFFFDDDDDDD888DDDD888DDDDDDFFFDDDDFFFDDDDD888DDDDDD8
        88DDDDFFFDDDDDDFFFDDDD88DDDDDDDD88DDDDFFDDDDDDDDFFDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
      OnClick = SpeedButton4Click
    end
    object Label8: TLabel
      Left = 216
      Top = 16
      Width = 78
      Height = 13
      Caption = 'Цена за тонну :'
    end
    object Label6: TLabel
      Left = 8
      Top = 64
      Width = 103
      Height = 13
      Caption = 'Количество литров :'
    end
    object Label7: TLabel
      Left = 216
      Top = 64
      Width = 91
      Height = 13
      Caption = 'Количество тонн :'
    end
    object ceNPGroup: TComboEdit
      Left = 8
      Top = 32
      Width = 162
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ceNPGroupButtonClick
      OnDblClick = ceNPGroupButtonClick
    end
    object CurrencyEdit3: TCurrencyEdit
      Left = 216
      Top = 32
      Width = 161
      Height = 21
      AutoSize = False
      DisplayFormat = '0.##'
      TabOrder = 1
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 8
      Top = 80
      Width = 161
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '0.###'
      TabOrder = 2
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 216
      Top = 80
      Width = 161
      Height = 21
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = '0.######'
      TabOrder = 3
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 386
    Height = 49
    Align = alTop
    Caption = 'Внимание'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label9: TLabel
      Left = 2
      Top = 15
      Width = 382
      Height = 32
      Align = alClient
      AutoSize = False
      Caption = 
        '   В данной форме НЕЛЬЗЯ заводить приходы в баки ТС по ТАЛОНАМ и' +
        ' SMART-КАРТАМ.'
      WordWrap = True
    end
  end
  object qTemp: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 344
    Top = 197
  end
end
