inherited BaseEditKoefUdWeightRefForm: TBaseEditKoefUdWeightRefForm
  Left = 473
  Top = 491
  Width = 276
  Height = 181
  Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
  PixelsPerInch = 96
  TextHeight = 13
  object lblBeginDate: TLabel [0]
    Left = 4
    Top = 4
    Width = 38
    Height = 13
    Caption = #1044#1072#1090#1072' c:'
  end
  object lblEndDate: TLabel [1]
    Left = 4
    Top = 36
    Width = 15
    Height = 13
    Caption = #1087#1086':'
  end
  object lblkoef: TLabel [2]
    Left = 128
    Top = 40
    Width = 73
    Height = 13
    Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090':'
  end
  object lblProduct: TLabel [3]
    Left = 128
    Top = 4
    Width = 76
    Height = 13
    Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090':'
  end
  inherited pBottom: TPanel
    Top = 114
    Width = 268
    inherited pBtn: TPanel
      Left = 71
    end
  end
  object cbNPG: TComboBox [5]
    Left = 128
    Top = 16
    Width = 125
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      #1044#1058
      #1040'-80'
      #1040'-92'
      #1040'-95'
      #1060#1088#1072#1082#1094#1080#1103' '#1083#1105#1075#1082#1072#1103)
  end
  object koefudweight: TEdit [6]
    Left = 128
    Top = 52
    Width = 125
    Height = 21
    TabOrder = 2
    Text = '0.0002'
  end
  object deBeginDate: TDateEdit [7]
    Left = 4
    Top = 16
    Width = 90
    Height = 21
    CheckOnExit = True
    DefaultToday = True
    DirectInput = False
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 3
    Text = '01.04.2010'
  end
  object deEndDate: TDateEdit [8]
    Left = 4
    Top = 52
    Width = 92
    Height = 21
    CheckOnExit = True
    DefaultToday = True
    DirectInput = False
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 4
    Text = '01.04.2010'
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select * from oil_koef_ud_weight t'
      'where t.id=:id and t.inst=:inst')
    Left = 20
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
    object qID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qNP_GROUP_ID: TFloatField
      FieldName = 'NP_GROUP_ID'
      Required = True
    end
    object qDATE_FROM: TDateTimeField
      FieldName = 'DATE_FROM'
    end
    object qDATE_TO: TDateTimeField
      FieldName = 'DATE_TO'
    end
    object qKOEF: TFloatField
      FieldName = 'KOEF'
      Required = True
    end
    object qDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Required = True
    end
  end
end
