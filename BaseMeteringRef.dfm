inherited BaseMeteringRefForm: TBaseMeteringRefForm
  Left = 289
  Top = 326
  Caption = #1047#1072#1084#1077#1088#1099
  ClientHeight = 395
  ClientWidth = 787
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 362
    Width = 787
    inherited Panel3: TPanel
      Left = 590
    end
    inherited Panel4: TPanel
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
    inherited pPrint: TPanel
      Visible = True
    end
    inherited pSpeedUp: TPanel
      inherited sbSpeedUp: TSpeedButton
        Visible = False
      end
    end
    inherited pShowDetail: TPanel
      Width = 222
      Visible = True
    end
  end
  inherited Panel2: TPanel
    Width = 787
    Height = 45
    object Label1: TLabel
      Left = 6
      Top = 3
      Width = 38
      Height = 13
      Caption = #1044#1072#1090#1072' c:'
    end
    object Label7: TLabel
      Left = 102
      Top = 3
      Width = 15
      Height = 13
      Caption = #1087#1086':'
    end
    object deBeginDate: TDateEdit
      Left = 6
      Top = 19
      Width = 94
      Height = 21
      CheckOnExit = True
      DefaultToday = True
      DirectInput = False
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
      Text = '10.03.2010'
      OnChange = deBeginDateChange
    end
    object deEndDate: TDateEdit
      Left = 102
      Top = 19
      Width = 95
      Height = 21
      CheckOnExit = True
      DefaultToday = True
      DirectInput = False
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
      Text = '31.03.2010'
    end
  end
  inherited pBase: TPanel
    Top = 55
    Width = 637
    Height = 307
    inherited SplitterDetail: TSplitter
      Top = 252
      Width = 637
    end
    inherited DBGrid1: TDBGridEh
      Width = 637
      Height = 252
      RowSizingAllowed = True
      SumList.Active = True
      UseMultiTitle = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'METERING_ACT_ID'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1072#1082#1090#1072
          Width = 115
        end
        item
          EditButtons = <>
          FieldName = 'ACT_TYPE_NAME'
          Footers = <>
          Title.Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Width = 102
        end
        item
          EditButtons = <>
          FieldName = 'ACT_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1072#1082#1090#1072
        end
        item
          EditButtons = <>
          FieldName = 'LOCKED_TEXT'
          Footers = <>
          Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
          Width = 120
        end>
    end
    inherited pDetail: TPanel
      Top = 255
      Width = 637
      inherited DBGridDetail: TDBGridEh
        Width = 637
        UseMultiTitle = True
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'DATAZAMERA'
            Footers = <>
            Width = 115
          end
          item
            EditButtons = <>
            FieldName = 'TANK_ID'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Width = 110
          end
          item
            DisplayFormat = '0,'
            EditButtons = <>
            FieldName = 'UROVEN_MM'
            Footers = <>
            Width = 77
          end
          item
            DisplayFormat = '0,'
            EditButtons = <>
            FieldName = 'LITR'
            Footers = <>
            Title.Caption = #1054#1073#1098#1077#1084', '#1083
          end
          item
            DisplayFormat = '0.0000#'
            EditButtons = <>
            FieldName = 'DENSITY'
            Footers = <>
          end
          item
            DisplayFormat = '0,'
            EditButtons = <>
            FieldName = 'WEIGHT'
            Footers = <>
            Title.Caption = #1042#1077#1089', '#1082#1075
          end
          item
            DisplayFormat = '0.0#'
            EditButtons = <>
            FieldName = 'TEMPER'
            Footers = <>
            Width = 73
          end
          item
            EditButtons = <>
            FieldName = 'UROVEN_VODI_MM'
            Footers = <>
            Width = 103
          end>
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 787
    inherited pnlTuneGridBtn: TPanel
      Left = 758
    end
  end
  inherited PanelCol: TPanel
    Left = 637
    Top = 55
    Height = 307
    inherited cbCol: TRxCheckListBox
      Height = 279
    end
    inherited pRefresh: TPanel
      Top = 281
    end
  end
  inherited ds: TOraDataSource
    Left = 47
    Top = 135
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select metering_act_id, '
      '       '#39#1057#1084#1077#1085#1085#1099#1081' '#1088#1072#1087#1086#1088#1090#39' as act_type_name, '
      '       act.act_date,'
      
        '       decode(act.locked, 0, '#39#1042#1074#1086#1076#1080#1090#1089#1103#39', 1, '#39#1047#1072#1092#1080#1082#1089#1080#1088#1086#1074#1072#1085#1086#39') as ' +
        'locked_text'
      '  from base.metering_act act'
      ' where trunc(act.act_date) between :BeginDate and :EndDate'
      ' order by act_date desc')
    Left = 16
    Top = 135
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end>
    object qMETERING_ACT_ID: TFloatField
      FieldName = 'METERING_ACT_ID'
      Required = True
    end
    object qACT_TYPE_NAME: TStringField
      FieldName = 'ACT_TYPE_NAME'
      FixedChar = True
      Size = 14
    end
    object qACT_DATE: TDateTimeField
      FieldName = 'ACT_DATE'
      Required = True
    end
    object qLOCKED_TEXT: TStringField
      FieldName = 'LOCKED_TEXT'
      Size = 13
    end
  end
  inherited ADMQ: TOilQuery
    Top = 240
  end
  inherited PUM: TPopupMenu
    AutoPopup = False
    Left = 193
    Top = 277
    object miPrintTax: TMenuItem [0]
      Caption = #1055#1077#1095#1072#1090#1100' &'#1053#1072#1083#1086#1075#1086#1074#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
    end
    object N2: TMenuItem [1]
      Caption = '-'
    end
  end
  inherited qDetail: TOilQuery
    SQL.Strings = (
      'select t.metering_date   as datazamera,'
      '       t.metering_act_id as act,'
      '       ta.tank_name as tank_id,'
      '       p.name,'
      '       t.levl            as uroven_mm,'
      '       t.levl_water      as uroven_vodi_mm,'
      '       t.volume as litr,'
      '       t.density as density,'
      '       t.mass as weight,'
      '       t.temper'
      '  from base.metering t, base.product p, base.tank ta'
      ' where p.product_id = t.product_id'
      '   and ta.tank_id = t.tank_id'
      '  -- and trunc(t.metering_date) between :BeginDate and :EndDate'
      '   and t.metering_act_id = :metering_act_id ')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'metering_act_id'
      end>
    object qDetailDATAZAMERA: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1084#1077#1088#1072
      FieldName = 'DATAZAMERA'
    end
    object qDetailACT: TFloatField
      DisplayLabel = #1040#1082#1090
      DisplayWidth = 8
      FieldName = 'ACT'
    end
    object qDetailTANK_ID: TStringField
      DisplayLabel = #1056#1077#1079#1077#1088#1074#1091#1072#1088
      FieldName = 'TANK_ID'
      Required = True
      Size = 15
    end
    object qDetailNAME: TStringField
      DisplayLabel = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
      DisplayWidth = 18
      FieldName = 'NAME'
      Size = 16
    end
    object qDetailUROVEN_MM: TFloatField
      DisplayLabel = #1059#1088#1086#1074#1077#1085#1100', '#1084#1084
      DisplayWidth = 12
      FieldName = 'UROVEN_MM'
    end
    object qDetailUROVEN_VODI_MM: TFloatField
      DisplayLabel = #1059#1088#1086#1074#1077#1085#1100' '#1074#1086#1076#1099', '#1084#1084
      DisplayWidth = 12
      FieldName = 'UROVEN_VODI_MM'
    end
    object qDetailLITR: TFloatField
      DisplayLabel = #1051#1080#1090#1088
      FieldName = 'LITR'
      Required = True
    end
    object qDetailDENSITY: TFloatField
      DisplayLabel = #1055#1083#1086#1090#1085#1086#1089#1090#1100
      FieldName = 'DENSITY'
      Required = True
    end
    object qDetailWEIGHT: TFloatField
      DisplayLabel = #1042#1077#1089
      FieldName = 'WEIGHT'
      Required = True
    end
    object qDetailTEMPER: TFloatField
      DisplayLabel = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
      FieldName = 'TEMPER'
    end
  end
  object qChecker: TOilQuery
    SQL.Strings = (
      'select * from OIL_MONEY M  '
      'where M.DOG_ID = :dog_id '
      '  and M.DOG_INST = :dog_inst '
      '  and M.NN_INST = :nn_inst'
      '  and M.NN_ID > :nn_id')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 72
    Top = 244
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dog_id'
      end
      item
        DataType = ftUnknown
        Name = 'dog_inst'
      end
      item
        DataType = ftUnknown
        Name = 'nn_inst'
      end
      item
        DataType = ftUnknown
        Name = 'nn_id'
      end>
  end
end
