inherited E_PermitForm: TE_PermitForm
  Width = 399
  Height = 173
  Caption = '����������'
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 6
    Top = 8
    Width = 94
    Height = 13
    Caption = '���� ����������:'
  end
  object sb1: TSpeedButton [1]
    Left = 206
    Top = 5
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
    OnClick = sb1Click
  end
  object Label1: TLabel [2]
    Left = 6
    Top = 32
    Width = 102
    Height = 13
    Caption = '����� ����������:'
  end
  object sb2: TSpeedButton [3]
    Left = 364
    Top = 29
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
    OnClick = sb2Click
  end
  object sb3: TSpeedButton [4]
    Left = 364
    Top = 53
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
    OnClick = sb3Click
  end
  object Label5: TLabel [5]
    Left = 6
    Top = 80
    Width = 85
    Height = 13
    Caption = '����� � ������:'
  end
  object Label3: TLabel [6]
    Left = 6
    Top = 56
    Width = 66
    Height = 13
    Caption = '����������:'
  end
  inherited pBottom: TPanel
    Top = 114
    Width = 391
    Height = 32
    TabOrder = 4
    inherited pBtn: TPanel
      Left = 194
      Height = 28
    end
  end
  object DDatePirmit: TDateEdit [8]
    Left = 112
    Top = 5
    Width = 95
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object EPirmit: TEdit [9]
    Left = 112
    Top = 29
    Width = 250
    Height = 21
    MaxLength = 250
    TabOrder = 1
  end
  object EComments: TEdit [10]
    Left = 112
    Top = 53
    Width = 250
    Height = 21
    MaxLength = 250
    TabOrder = 2
  end
  object rcSumm: TRxCalcEdit [11]
    Left = 112
    Top = 77
    Width = 115
    Height = 21
    AutoSize = False
    NumGlyphs = 2
    TabOrder = 3
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select id, inst, date_, name, summ, comments'
      '  from e_permit'
      ' where id = :id'
      '   and inst = :inst')
    Top = 88
  end
end
