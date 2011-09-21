inherited frmDiscountAdd: TfrmDiscountAdd
  Left = 360
  Top = 240
  BorderStyle = bsDialog
  Caption = 'Скидки'
  ClientHeight = 249
  ClientWidth = 309
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pButtons: TPanel
    Left = 0
    Top = 208
    Width = 309
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object bbOK: TBitBtn
      Left = 137
      Top = 8
      Width = 79
      Height = 25
      Anchors = [akRight, akBottom]
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
      Left = 220
      Top = 8
      Width = 82
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Отменить'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 309
    Height = 208
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label6: TLabel
      Left = 8
      Top = 163
      Width = 54
      Height = 13
      Caption = 'Скидка, %:'
    end
    object Label2: TLabel
      Left = 7
      Top = 125
      Width = 73
      Height = 13
      Caption = 'Организация :'
    end
    object Label3: TLabel
      Left = 7
      Top = 85
      Width = 86
      Height = 13
      Caption = 'Подразделение :'
    end
    object Label4: TLabel
      Left = 6
      Top = 6
      Width = 65
      Height = 13
      Caption = 'Дата скидки'
    end
    object Label1: TLabel
      Left = 10
      Top = 45
      Width = 61
      Height = 13
      Caption = 'Тип скидки:'
    end
    object Label5: TLabel
      Left = 172
      Top = 45
      Width = 38
      Height = 13
      Caption = 'Тип НП'
    end
    object edDiscount: TRxCalcEdit
      Left = 8
      Top = 178
      Width = 108
      Height = 21
      AutoSize = False
      NumGlyphs = 2
      TabOrder = 0
    end
    object ceOrgName: TComboEdit
      Left = 8
      Top = 141
      Width = 295
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = ceOrgNameButtonClick
      OnDblClick = ceOrgNameButtonClick
    end
    object ceDepName: TComboEdit
      Left = 8
      Top = 101
      Width = 295
      Height = 21
      DirectInput = False
      Enabled = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = ceDepNameButtonClick
      OnDblClick = ceDepNameButtonClick
    end
    object deDiscountDate: TDateEdit
      Left = 8
      Top = 21
      Width = 121
      Height = 21
      DirectInput = False
      NumGlyphs = 2
      TabOrder = 3
    end
    object ceDiscountType: TComboEdit
      Left = 9
      Top = 60
      Width = 154
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = ceDiscountTypeButtonClick
      OnDblClick = ceDiscountTypeButtonClick
    end
    object ceNpType: TComboEdit
      Left = 171
      Top = 59
      Width = 130
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = ceNpTypeButtonClick
      OnDblClick = ceNpTypeButtonClick
    end
  end
end
