inherited RailStatForm: TRailStatForm
  Left = 347
  Top = 182
  Height = 115
  Caption = 'ЖД станция'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 4
    Top = 8
    Width = 50
    Height = 13
    Caption = 'Название'
  end
  inherited pBottom: TPanel
    Top = 55
  end
  object edName: TEdit [2]
    Left = 4
    Top = 24
    Width = 321
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select *'
      'from oil_rail_stat'
      'where id=:id and inst=:inst')
    Left = 288
    Top = 4
  end
end
