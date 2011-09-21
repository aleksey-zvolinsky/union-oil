inherited BaseAutoZamerRefForm: TBaseAutoZamerRefForm
  Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103' '#1091#1088#1086#1074#1085#1077#1084#1077#1088#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel4: TPanel
      inherited bbClear: TBitBtn
        Visible = False
      end
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
  end
  inherited Panel2: TPanel
    Height = 47
    object lblDate: TLabel
      Left = 6
      Top = 3
      Width = 29
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object lblEndDate: TLabel
      Left = 140
      Top = 3
      Width = 15
      Height = 13
      Caption = #1087#1086':'
    end
    object lblRez: TLabel
      Left = 276
      Top = 3
      Width = 57
      Height = 13
      Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088':'
    end
    object dteBeginDate: TDBDateTimeEditEh
      Left = 6
      Top = 19
      Width = 125
      Height = 21
      EditButtons = <>
      Kind = dtkDateTimeEh
      TabOrder = 0
      Visible = True
      OnChange = dteBeginDateChange
    end
    object dteEndDate: TDBDateTimeEditEh
      Left = 138
      Top = 19
      Width = 125
      Height = 21
      EditButtons = <>
      Kind = dtkDateTimeEh
      TabOrder = 1
      Visible = True
      OnChange = dteBeginDateChange
    end
    object Rez: TEdit
      Left = 276
      Top = 19
      Width = 125
      Height = 21
      TabOrder = 2
      OnChange = RezChange
    end
  end
  inherited pBase: TPanel
    Top = 57
    Height = 314
    inherited SplitterDetail: TSplitter
      Top = 259
    end
    inherited DBGrid1: TDBGridEh
      Height = 259
      Columns = <
        item
          EditButtons = <>
          FieldName = 'REZ_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088
          Width = 94
        end
        item
          EditButtons = <>
          FieldName = 'DATETIME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103
          Width = 109
        end
        item
          DisplayFormat = ',0.00'
          EditButtons = <>
          FieldName = 'FUEL_LEVEL'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1042#1079#1083#1080#1074', '#1084#1084
          Width = 92
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'LITR'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086', '#1083
          Width = 92
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'WEIGHT'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086', '#1082#1075
          Width = 89
        end
        item
          DisplayFormat = ',0.000000'
          EditButtons = <>
          FieldName = 'DENSITY'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100', '#1075'/'#1089#1084'3'
          Width = 92
        end>
    end
    inherited pDetail: TPanel
      Top = 262
    end
  end
  inherited PanelCol: TPanel
    Top = 57
    Height = 314
    inherited cbCol: TRxCheckListBox
      Height = 286
    end
    inherited pRefresh: TPanel
      Top = 288
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select rez_name, datetime, litr, weight, fuel_level, density'
      
        '  from VM_ZAMER_FINISH t where datetime between :BeginDate and :' +
        'EndDate'
      ' order by rez_name, datetime')
    OnFilterRecord = qFilterRecord
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end>
    object qREZ_NAME: TStringField
      FieldName = 'REZ_NAME'
      Size = 50
    end
    object qDATETIME: TDateTimeField
      FieldName = 'DATETIME'
    end
    object qLITR: TFloatField
      FieldName = 'LITR'
    end
    object qWEIGHT: TFloatField
      FieldName = 'WEIGHT'
    end
    object qFUEL_LEVEL: TFloatField
      FieldName = 'FUEL_LEVEL'
    end
    object qDENSITY: TFloatField
      FieldName = 'DENSITY'
    end
  end
end
