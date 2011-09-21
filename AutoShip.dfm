inherited AutoShipForm: TAutoShipForm
  Left = 471
  Top = 290
  Width = 287
  Height = 167
  Caption = 'Водный транспорт'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pBottom: TPanel
    Top = 100
    Width = 279
    TabOrder = 1
    inherited pBtn: TPanel
      Left = 82
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 279
    Height = 100
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 8
      Width = 250
      Height = 13
      Caption = 'Название'
    end
    object Label2: TLabel
      Left = 6
      Top = 52
      Width = 250
      Height = 13
      Caption = 'Тип'
    end
    object edName: TEdit
      Left = 6
      Top = 24
      Width = 270
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object ceType: TComboEdit
      Left = 6
      Top = 68
      Width = 270
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = ceTypeButtonClick
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select a.*, atp.name as auto_type_name'
      'from oil_auto a, oil_auto_type atp'
      'where a.auto_type_id=atp.id'
      '  and a.id=:id and a.inst=:inst')
    Left = 188
    Top = 16
  end
end
