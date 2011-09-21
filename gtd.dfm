inherited GtdForm: TGtdForm
  Left = 422
  Top = 221
  Width = 268
  Height = 225
  Caption = 'ГТД'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pBottom: TPanel
    Top = 165
    Width = 260
    inherited pBtn: TPanel
      Left = 63
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 260
    Height = 57
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 13
      Caption = 'Дата'
    end
    object Label2: TLabel
      Left = 140
      Top = 8
      Width = 34
      Height = 13
      Caption = 'Номер'
    end
    object deDate: TDateEdit
      Left = 8
      Top = 24
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object edNum: TEdit
      Left = 140
      Top = 24
      Width = 111
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
  object Panel4: TPanel [2]
    Left = 0
    Top = 57
    Width = 260
    Height = 108
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 47
      Height = 13
      Caption = 'Контракт'
    end
    object Label4: TLabel
      Left = 8
      Top = 60
      Width = 51
      Height = 13
      Caption = 'От кого:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 84
      Width = 35
      Height = 13
      Caption = 'Кому:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFrom: TLabel
      Left = 64
      Top = 60
      Width = 189
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'lblFrom'
    end
    object lblTo: TLabel
      Left = 64
      Top = 84
      Width = 189
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'lblTo'
    end
    object ceDog: TComboEdit
      Left = 8
      Top = 28
      Width = 245
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ceDogButtonClick
      OnDblClick = ceDogButtonClick
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select *'
      'from v_oil_gtd'
      'where id=:id and inst=:inst')
    Left = 12
    Top = 4
  end
end
