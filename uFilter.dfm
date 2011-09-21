object FilterForm: TFilterForm
  Left = 394
  Top = 408
  Width = 272
  Height = 108
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1085#1085#1099#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBtn: TPanel
    Left = 0
    Top = 40
    Width = 264
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object pBtn: TPanel
      Left = 72
      Top = 2
      Width = 190
      Height = 37
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        190
        37)
      object bbOk: TBitBtn
        Left = 10
        Top = 7
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1055#1088#1080#1085#1103#1090#1100
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
        Left = 100
        Top = 7
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 1
        OnClick = bbCancelClick
        Kind = bkCancel
      end
    end
  end
  object pnlDate: TPanel
    Left = 0
    Top = 0
    Width = 264
    Height = 40
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object LblBeginDate: TLabel
      Left = 6
      Top = 12
      Width = 35
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089
    end
    object LblEndDate: TLabel
      Left = 149
      Top = 12
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object deBeginDate: TDateEdit
      Left = 55
      Top = 8
      Width = 90
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object deEndDate: TDateEdit
      Left = 167
      Top = 8
      Width = 90
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
  end
end
