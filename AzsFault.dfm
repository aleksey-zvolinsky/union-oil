inherited AzsFaultForm: TAzsFaultForm
  Left = 328
  Top = 333
  Width = 421
  Height = 198
  Caption = 'Сбой на АЗС'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 40
    Width = 64
    Height = 13
    Alignment = taRightJustify
    Caption = 'Начало сбоя'
  end
  object Label2: TLabel
    Left = 220
    Top = 40
    Width = 58
    Height = 13
    Caption = 'Конец сбоя'
  end
  object lblAZS: TLabel
    Left = 51
    Top = 10
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = 'АЗС:'
  end
  object Label4: TLabel
    Left = 26
    Top = 70
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Описание:'
  end
  object Label5: TLabel
    Left = 23
    Top = 98
    Width = 113
    Height = 13
    Alignment = taRightJustify
    Caption = 'Фимилия  сотрудника'
  end
  object Panel1: TPanel
    Left = 0
    Top = 131
    Width = 413
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel3: TPanel
      Left = 216
      Top = 2
      Width = 195
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbOk: TBitBtn
        Left = 8
        Top = 2
        Width = 87
        Height = 25
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
      object bbCancel: TBitBtn
        Left = 104
        Top = 2
        Width = 87
        Height = 25
        Caption = '&Отменить'
        TabOrder = 1
        Kind = bkCancel
      end
    end
  end
  object xdeBegin: TDateEdit
    Left = 85
    Top = 35
    Width = 120
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object xdeEnd: TDateEdit
    Left = 285
    Top = 35
    Width = 120
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
    OnAcceptDate = xdeEndAcceptDate
  end
  object edtComment: TEdit
    Left = 85
    Top = 65
    Width = 320
    Height = 21
    TabOrder = 3
    OnChange = edtCommentChange
  end
  object cmeAZS: TComboEdit
    Left = 85
    Top = 5
    Width = 320
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 4
    OnButtonClick = cmeAZSButtonClick
    OnDblClick = cmeAZSButtonClick
  end
  object edtRespondent: TEdit
    Left = 142
    Top = 95
    Width = 262
    Height = 21
    TabOrder = 5
    OnChange = edtCommentChange
  end
  object SP: TOilStoredProc
    Left = 21
    Top = 5
  end
end
