inherited CloseDateForm: TCloseDateForm
  Left = 410
  Top = 427
  BorderStyle = bsDialog
  Caption = #1047#1072#1082#1088#1099#1090#1080#1077' '#1087#1077#1088#1080#1086#1076#1072
  ClientHeight = 148
  ClientWidth = 153
  Font.Height = -10
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 4
    Width = 78
    Height = 26
    Caption = #1055#1077#1088#1080#1086#1076' '#1079#1072#1082#1088#1099#1090#13#10#1062#1077#1085#1090#1088#1086#1084' '#1087#1086
  end
  object Label1: TLabel
    Left = 8
    Top = 64
    Width = 98
    Height = 13
    Caption = #1047#1072#1082#1088#1099#1090#1100' '#1087#1077#1088#1080#1086#1076' '#1087#1086
  end
  object deHere: TDateEdit
    Left = 8
    Top = 81
    Width = 104
    Height = 20
    ButtonWidth = 17
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 110
    Width = 153
    Height = 38
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      153
      38)
    object bbCancel: TBitBtn
      Left = 61
      Top = 6
      Width = 87
      Height = 27
      Anchors = [akTop, akRight]
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 0
      Kind = bkCancel
    end
    object bbOk: TBitBtn
      Left = 6
      Top = 6
      Width = 53
      Height = 27
      Anchors = [akTop, akRight]
      Caption = '&'#1054'K'
      Default = True
      TabOrder = 1
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
  end
  object deAlfa: TDateEdit
    Left = 8
    Top = 36
    Width = 104
    Height = 20
    Enabled = False
    ButtonWidth = 17
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 2
  end
end
