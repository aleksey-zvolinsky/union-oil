inherited DiapForm: TDiapForm
  Left = 452
  Top = 252
  BorderStyle = bsDialog
  Caption = #1054#1090#1087#1091#1089#1082' '#1090#1072#1083#1086#1085#1086#1074' '#1080#1079' '#1076#1080#1072#1087#1086#1079#1086#1085#1072
  ClientHeight = 236
  ClientWidth = 270
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 43
    Width = 13
    Height = 13
    Caption = 'C :'
  end
  object Label2: TLabel
    Left = 134
    Top = 43
    Width = 20
    Height = 13
    Caption = #1055#1086' :'
  end
  object Label3: TLabel
    Left = 7
    Top = 3
    Width = 37
    Height = 13
    Caption = #1057#1077#1088#1080#1103' :'
  end
  object Label4: TLabel
    Left = 133
    Top = 3
    Width = 32
    Height = 13
    Caption = #1062#1077#1085#1072' :'
  end
  object Panel1: TPanel
    Left = 0
    Top = 198
    Width = 270
    Height = 38
    Align = alBottom
    BevelInner = bvSpace
    BevelOuter = bvLowered
    Caption = 'Panel1'
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 96
      Top = 8
      Width = 83
      Height = 25
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      Default = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
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
    object BitBtn2: TBitBtn
      Left = 184
      Top = 8
      Width = 81
      Height = 25
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Edit1: TEdit
    Left = 6
    Top = 59
    Width = 121
    Height = 21
    MaxLength = 7
    TabOrder = 2
    OnChange = Edit1Change
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 134
    Top = 59
    Width = 121
    Height = 21
    MaxLength = 7
    TabOrder = 1
    OnKeyPress = Edit1KeyPress
  end
  object Edit3: TEdit
    Left = 6
    Top = 19
    Width = 120
    Height = 21
    MaxLength = 3
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 8
    Top = 85
    Width = 254
    Height = 108
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object Label5: TLabel
      Left = 49
      Top = 8
      Width = 39
      Height = 13
      Caption = #1051#1080#1090#1088#1099' :'
    end
    object Label6: TLabel
      Left = 145
      Top = 8
      Width = 52
      Height = 13
      Caption = #1053#1086#1084#1080#1085#1072#1083' :'
    end
    object Label7: TLabel
      Left = 49
      Top = 48
      Width = 65
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' :'
    end
    object Label8: TLabel
      Left = 30
      Top = 90
      Width = 197
      Height = 13
      Caption = #1059#1095#1080#1090#1099#1074#1072#1081#1090#1077' '#1087#1086#1075#1088#1077#1096#1085#1086#1089#1090#1100' '#1086#1082#1088#1091#1075#1083#1077#1085#1080#1103' !'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 49
      Top = 24
      Width = 89
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
      TabOrder = 0
      OnChange = CurrencyEdit1Change
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 145
      Top = 24
      Width = 65
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
      TabOrder = 1
      OnChange = CurrencyEdit1Change
    end
    object CurrencyEdit3: TCurrencyEdit
      Left = 49
      Top = 64
      Width = 161
      Height = 21
      AutoSize = False
      DisplayFormat = ',0'#39#39';-,0'#39#39
      Enabled = False
      TabOrder = 2
    end
  end
  object CE: TCurrencyEdit
    Left = 134
    Top = 19
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
    TabOrder = 5
  end
end
