inherited LogSaleDeadbeatForm: TLogSaleDeadbeatForm
  Left = 452
  Top = 307
  Width = 424
  Height = 303
  Caption = #1046#1091#1088#1085#1072#1083' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1086#1090#1087#1091#1089#1082#1086#1074' '#1076#1086#1083#1078#1085#1080#1082#1072#1084
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 10
    Top = 42
    Width = 62
    Height = 13
    Caption = #1058#1080#1087' '#1086#1090#1087#1091#1089#1082#1072
  end
  object Label1: TLabel
    Left = 47
    Top = 67
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object Label2: TLabel
    Left = 10
    Top = 93
    Width = 67
    Height = 13
    Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
  end
  object Label5: TLabel
    Left = 12
    Top = 116
    Width = 119
    Height = 26
    Caption = #1060#1080#1084#1080#1083#1080#1103'  '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072', '#13#10#1082#1086#1090#1086#1088#1099#1081' '#1074#1074#1077#1083' '#1079#1072#1087#1080#1089#1100
  end
  object Label3: TLabel
    Left = 12
    Top = 144
    Width = 102
    Height = 26
    Caption = #1055#1086' '#1095#1100#1077#1084#1091' '#1091#1082#1072#1079#1072#1085#1080#1102','#13#10#1092#1080#1084#1080#1083#1080#1103
  end
  object lblWarning: TLabel
    Left = 36
    Top = 178
    Width = 342
    Height = 52
    Caption = 
      #1042#1053#1048#1052#1040#1053#1048#1045' !'#13#10#1044#1072#1085#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1073#1091#1076#1077#1090' '#13#10#1088#1077#1075#1091#1083#1103#1088#1085#1086' '#1072#1085#1072#1083#1080#1079#1080#1088#1086#1074#1072#1090#1100#1089#1103',' +
      ' '#1087#1086#1101#1090#1086#1084#1091' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1086#1090#1087#1091#1089#1082#1072#13#10#1076#1077#1073#1077#1090#1086#1088#1091' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1080#1084#1077#1090#1100' '#1074#1077#1089#1082#1080#1077' '#1086#1089#1085 +
      #1086#1074#1072#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 50
    Top = 6
    Width = 310
    Height = 26
    Caption = 
      #1042#1074#1077#1076#1080#1090#1077' '#1089#1074#1086#1102' '#1092#1072#1084#1080#1083#1080#1102' '#1080' '#1092#1072#1084#1080#1083#1080#1102' '#1083#1080#1094#1072', '#1087#1086' '#1095#1100#1077#1084#1091' '#13#10'         '#1088#1072#1089#1087#1086#1088#1103 +
      #1078#1077#1085#1080#1102' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1089#1103' '#1086#1090#1087#1091#1089#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtSaleType: TEdit
    Left = 85
    Top = 37
    Width = 320
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Text = #1054#1090#1087#1091#1089#1082' '#1090#1072#1083#1086#1085#1086#1074' '#8470'1212 '#1086#1090' 21,10,2003'
  end
  object xdeSaleDate: TDateEdit
    Left = 85
    Top = 62
    Width = 91
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    NumGlyphs = 2
    ParentFont = False
    ReadOnly = True
    Weekends = [Sun, Sat]
    TabOrder = 3
    Text = '21.10.2003'
  end
  object edtOrg: TEdit
    Left = 85
    Top = 88
    Width = 320
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = #1047#1083#1086#1089#1090#1085#1099#1081' '#1076#1077#1073#1077#1090#1086#1088
  end
  object edtRespondent: TEdit
    Left = 142
    Top = 119
    Width = 262
    Height = 21
    TabOrder = 0
  end
  object edtInstructor: TEdit
    Left = 142
    Top = 147
    Width = 262
    Height = 21
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 243
    Width = 416
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    object Panel3: TPanel
      Left = 219
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
        Caption = '&'#1055#1088#1080#1085#1103#1090#1100
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
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 1
        Kind = bkCancel
      end
    end
  end
end
