inherited PrihTransDocForm: TPrihTransDocForm
  Left = 351
  Top = 266
  BorderStyle = bsDialog
  Caption = 'Поля для документов'
  ClientHeight = 211
  ClientWidth = 436
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 177
    Width = 436
    Height = 34
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object bbCancel: TBitBtn
      Left = 345
      Top = 4
      Width = 87
      Height = 25
      Hint = 'Закрыть окнр'
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Закрыть'
      ModalResult = 1
      TabOrder = 0
      OnClick = bbCancelClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 436
    Height = 177
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label12: TLabel
      Left = 8
      Top = 52
      Width = 108
      Height = 13
      Caption = 'Нижеподписавшиеся'
    end
    object Label13: TLabel
      Left = 8
      Top = 92
      Width = 59
      Height = 13
      Caption = 'Документы'
    end
    object Label15: TLabel
      Left = 8
      Top = 132
      Width = 78
      Height = 13
      Caption = 'Представитель'
    end
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 37
      Height = 13
      Caption = '№ акта'
    end
    object edUnderSigned: TEdit
      Left = 8
      Top = 68
      Width = 422
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object edDocuments: TEdit
      Left = 8
      Top = 108
      Width = 422
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object cePred: TComboEdit
      Left = 8
      Top = 148
      Width = 422
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = cePredButtonClick
    end
    object edActNum: TEdit
      Left = 8
      Top = 28
      Width = 109
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
  end
end
