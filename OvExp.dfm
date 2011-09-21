inherited OvExpForm: TOvExpForm
  Left = 328
  Top = 243
  Width = 482
  Height = 222
  Caption = 'Накладные расходы'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object lPart: TLabel
    Left = 18
    Top = 44
    Width = 37
    Height = 13
    Caption = 'Партия'
  end
  object Label8: TLabel
    Left = 190
    Top = 44
    Width = 44
    Height = 13
    Caption = 'Договор'
  end
  object Label23: TLabel
    Left = 18
    Top = 70
    Width = 38
    Height = 13
    Caption = 'Тип НП'
  end
  object Label9: TLabel
    Left = 347
    Top = 44
    Width = 26
    Height = 13
    Caption = 'Дата'
  end
  object Label4: TLabel
    Left = 171
    Top = 12
    Width = 63
    Height = 13
    Caption = 'Тип расхода'
  end
  object lDate: TLabel
    Left = 20
    Top = 12
    Width = 30
    Height = 13
    AutoSize = False
    Caption = 'Дата'
  end
  object Bevel2: TBevel
    Left = 1
    Top = 32
    Width = 468
    Height = 5
    Shape = bsBottomLine
  end
  object Bevel6: TBevel
    Left = 1
    Top = 92
    Width = 468
    Height = 2
    Shape = bsBottomLine
  end
  object Label26: TLabel
    Left = 26
    Top = 137
    Width = 31
    Height = 13
    Caption = 'Прим.'
  end
  object Label19: TLabel
    Left = 21
    Top = 102
    Width = 33
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Сумма'
  end
  object Bevel1: TBevel
    Left = 1
    Top = 125
    Width = 468
    Height = 2
    Shape = bsBottomLine
  end
  object Panel3: TPanel
    Left = 0
    Top = 155
    Width = 474
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 288
      Top = 4
      Width = 87
      Height = 25
      Caption = '&Принять'
      Default = True
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
    object bbCancel: TBitBtn
      Left = 380
      Top = 4
      Width = 87
      Height = 25
      Caption = '&Отменить'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object edPart: TComboEdit
    Left = 66
    Top = 40
    Width = 89
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 1
    OnButtonClick = edPartButtonClick
    OnDblClick = edPartButtonClick
  end
  object edDog: TEdit
    Left = 241
    Top = 40
    Width = 85
    Height = 21
    TabStop = False
    Color = clSilver
    ReadOnly = True
    TabOrder = 2
  end
  object edNP_Type: TEdit
    Left = 66
    Top = 66
    Width = 173
    Height = 21
    TabStop = False
    Color = clSilver
    ReadOnly = True
    TabOrder = 3
  end
  object edDogDate: TDateEdit
    Left = 380
    Top = 40
    Width = 80
    Height = 21
    TabStop = False
    Color = clSilver
    ButtonWidth = 0
    NumGlyphs = 2
    ReadOnly = True
    YearDigits = dyFour
    TabOrder = 4
  end
  object edDate: TDateEdit
    Left = 66
    Top = 8
    Width = 89
    Height = 21
    CheckOnExit = True
    DefaultToday = True
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 5
    Text = '31.10.2002'
  end
  object edType: TComboEdit
    Left = 241
    Top = 8
    Width = 219
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 6
    OnButtonClick = edTypeButtonClick
    OnDblClick = edTypeButtonClick
  end
  object edComm: TEdit
    Left = 66
    Top = 134
    Width = 394
    Height = 21
    TabOrder = 7
  end
  object edSumm: TRxCalcEdit
    Left = 66
    Top = 99
    Width = 137
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00'
    NumGlyphs = 2
    TabOrder = 8
  end
  object SP: TOilStoredProc
        Left = 320
    Top = 100
  end
end
