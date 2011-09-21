inherited BaseTovarOperRefForm: TBaseTovarOperRefForm
  Left = 355
  Top = 223
  Caption = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
  ClientHeight = 440
  ClientWidth = 717
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 407
    Width = 717
    inherited Panel3: TPanel
      Left = 520
    end
    inherited Panel4: TPanel
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
    inherited pPrint: TPanel
      Visible = True
    end
    inherited pTotal: TPanel
      Visible = True
      inherited sbTotal: TSpeedButton
        Down = True
      end
    end
    inherited pSpeedUp: TPanel
      inherited sbSpeedUp: TSpeedButton
        Visible = False
      end
    end
    inherited pShowDetail: TPanel
      Width = 152
    end
  end
  inherited Panel2: TPanel
    Width = 717
    Height = 45
    object Label1: TLabel
      Left = 6
      Top = 3
      Width = 41
      Height = 13
      Caption = #1044#1072#1090#1072' c :'
    end
    object Label7: TLabel
      Left = 106
      Top = 3
      Width = 18
      Height = 13
      Caption = #1087#1086' :'
    end
    object lblFrom: TLabel
      Left = 338
      Top = 3
      Width = 42
      Height = 13
      Caption = #1054#1090#1082#1091#1076#1072' :'
    end
    object lblTo: TLabel
      Left = 469
      Top = 3
      Width = 30
      Height = 13
      Caption = #1050#1091#1076#1072' :'
    end
    object lblProduct: TLabel
      Left = 207
      Top = 3
      Width = 79
      Height = 13
      Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090' :'
    end
    object deBeginDate: TDateEdit
      Left = 6
      Top = 18
      Width = 92
      Height = 21
      CheckOnExit = True
      DefaultToday = True
      DirectInput = False
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
      Text = '02.08.2010'
    end
    object deEndDate: TDateEdit
      Left = 106
      Top = 18
      Width = 93
      Height = 21
      CheckOnExit = True
      DefaultToday = True
      DirectInput = False
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
      Text = '02.12.2010'
    end
    object eFrom: TEdit
      Left = 338
      Top = 18
      Width = 125
      Height = 21
      TabOrder = 2
      OnChange = eProductChange
    end
    object eTo: TEdit
      Left = 469
      Top = 18
      Width = 125
      Height = 21
      TabOrder = 3
      OnChange = eProductChange
    end
    object eProduct: TEdit
      Left = 207
      Top = 18
      Width = 125
      Height = 21
      TabOrder = 4
      OnChange = eProductChange
    end
  end
  inherited pBase: TPanel
    Top = 60
    Width = 567
    Height = 347
    inherited SplitterDetail: TSplitter
      Top = 292
      Width = 567
    end
    inherited DBGrid1: TDBGridEh
      Top = 5
      Width = 567
      Height = 287
      Font.Color = clBlack
      FooterColor = clMoneyGreen
      FooterRowCount = 1
      ReadOnly = True
      RowDetailPanel.Active = True
      RowDetailPanel.Width = 400
      RowDetailPanel.Height = 200
      SumList.Active = True
      UseMultiTitle = True
      OnCellClick = DBGrid1CellClick
      OnCheckRowHaveDetailPanel = DBGrid1CheckRowHaveDetailPanel
      OnRowDetailPanelHide = DBGrid1RowDetailPanelHide
      OnRowDetailPanelShow = DBGrid1RowDetailPanelShow
      Columns = <
        item
          EditButtons = <>
          FieldName = 'TR_DATE'
          Footer.Alignment = taRightJustify
          Footer.Value = #1050#1086#1083'-'#1074#1086' :'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Width = 157
        end
        item
          EditButtons = <>
          FieldName = 'TANK_FROM'
          Footers = <>
          Title.Caption = #1054#1090#1082#1091#1076#1072
          Width = 141
        end
        item
          EditButtons = <>
          FieldName = 'TANK_TO'
          Footers = <>
          Title.Caption = #1050#1091#1076#1072
          Width = 140
        end
        item
          EditButtons = <>
          FieldName = 'PRODUCT_NAME'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072' ('#1054#1090#1082#1091#1076#1072')'
          Width = 161
        end
        item
          EditButtons = <>
          FieldName = 'PRODUCT_NAME_TO'
          Footers = <>
          Title.Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072' ('#1050#1091#1076#1072')'
        end
        item
          Alignment = taRightJustify
          DisplayFormat = '0,'
          EditButtons = <>
          FieldName = 'VOLUME'
          Footer.DisplayFormat = '0,'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1054#1073#1098#1105#1084', '#1083
          Width = 131
        end
        item
          Alignment = taRightJustify
          DisplayFormat = '0,'
          EditButtons = <>
          FieldName = 'MASS'
          Footer.DisplayFormat = '0,'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1042#1077#1089', '#1082#1075
          Width = 132
        end>
      inherited RowDetailData: TRowDetailPanelControlEh
        HorzScrollBar.Position = 255
        object grDetailTank: TDBGridEh
          Left = 25
          Top = 15
          Width = 529
          Height = 162
          DataGrouping.GroupLevels = <>
          DataSource = dsDetailTank
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterColor = clActiveBorder
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = [fsBold]
          FooterRowCount = 1
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghShowRecNo, dghColumnResize, dghExtendVertLines]
          ParentFont = False
          RowDetailPanel.Color = clBtnFace
          RowPanel.Active = True
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          Columns = <
            item
              EditButtons = <>
              FieldName = 'VAN_NO'
              Footer.Alignment = taCenter
              Footer.Value = #1048#1090#1086#1075#1086
              Footer.ValueType = fvtStaticText
              Footers = <>
              Title.Caption = #1042#1072#1075#1086#1085
              Width = 69
              InRowLineHeight = 2
            end
            item
              EditButtons = <>
              FieldName = 'WAYBILL_NO'
              Footers = <>
              Title.Caption = #1046'/'#1076' '#1085#1072#1082#1083'.'
              InRowLineHeight = 2
            end
            item
              DisplayFormat = ',#'
              EditButtons = <>
              FieldName = 'SUM_FREIGHT'
              Footer.DisplayFormat = ',#'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1055#1088#1086#1074#1086#1079#1085#1072#1103' '#1087#1083#1072#1090#1072', '#1075#1088#1085
              InRowLineHeight = 2
            end
            item
              DisplayFormat = ',#'
              EditButtons = <>
              FieldName = 'rail_loss'
              Footer.DisplayFormat = ',#'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1080#1079#1083#1080#1096#1077#1082'/ '#1085#1077#1076#1086#1089#1090#1072#1095#1072' (+/-)'
              Width = 72
              WordWrap = True
              InRowLineHeight = 2
            end
            item
              DisplayFormat = ',#'
              EditButtons = <>
              FieldName = 'rail_loss_ned'
              Footers = <>
              Title.Caption = #1053#1077#1076#1086#1089#1090#1072#1095#1072
              Visible = False
              InRowLineHeight = 2
            end
            item
              DisplayFormat = ',#'
              EditButtons = <>
              FieldName = 'rail_loss_izl'
              Footers = <>
              Title.Caption = #1048#1079#1083#1080#1096#1077#1082
              Visible = False
              InRowLineHeight = 2
            end
            item
              DisplayFormat = '0.0000'
              EditButtons = <>
              FieldName = 'rail_loss_to_doc_ratio'
              Footer.DisplayFormat = '0.0000'
              Footers = <>
              Title.Caption = '% '#1086#1090#1085#1086#1096#1077#1085#1080#1077
              Width = 77
              InRowLineHeight = 2
            end
            item
              DisplayFormat = ',#'
              EditButtons = <>
              FieldName = 'rail_loss_ratio'
              Footer.DisplayFormat = '#'
              Footers = <>
              Title.Caption = #1042#1077#1089#1086#1074#1086#1081' '#1082#1086#1101#1092'., %'
              Title.Hint = 
                '='#13#10'('#1086#1090#1082#1083#1086#1085#1077#1085#1080#1077' '#1074' '#1089#1090#1088#1086#1082#1077')'#13#10'--------------------------------------' +
                '-----------------'#13#10'('#1089#1091#1084#1084#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1087#1086' '#1084#1086#1076#1091#1083#1102')'
              Width = 67
              InRowLineHeight = 2
            end
            item
              EditButtons = <>
              FieldName = 'TD'
              Footers = <>
              Title.Caption = #1044#1086#1082'.'
              Width = 34
            end
            item
              EditButtons = <>
              FieldName = 'TF'
              Footers = <>
              Title.Caption = #1060#1072#1082#1090
              Width = 34
              InRowLinePos = 1
            end
            item
              DisplayFormat = ',#'
              EditButtons = <>
              FieldName = 'wb_mass'
              Footer.DisplayFormat = ',#'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1042#1077#1089', '#1082#1075
              Width = 68
            end
            item
              DisplayFormat = ',#'
              EditButtons = <>
              FieldName = 'mass'
              Footer.DisplayFormat = ',#'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1042#1077#1089', '#1082#1075
              Width = 68
              InRowLinePos = 1
            end
            item
              DisplayFormat = '0.0000'
              EditButtons = <>
              FieldName = 'wb_density'
              Footer.DisplayFormat = '0.0000'
              Footer.ValueType = fvtAvg
              Footers = <>
              Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
              Width = 60
            end
            item
              DisplayFormat = '0.0000'
              EditButtons = <>
              FieldName = 'density'
              Footer.DisplayFormat = '0.0000'
              Footer.ValueType = fvtAvg
              Footers = <>
              Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
              Width = 60
              InRowLinePos = 1
            end
            item
              DisplayFormat = '#'
              EditButtons = <>
              FieldName = 'wb_temperature'
              Footer.DisplayFormat = '#'
              Footer.ValueType = fvtAvg
              Footers = <>
              Title.Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
              Width = 70
            end
            item
              DisplayFormat = '#'
              EditButtons = <>
              FieldName = 'temperature'
              Footer.DisplayFormat = '#'
              Footer.ValueType = fvtAvg
              Footers = <>
              Title.Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
              Width = 70
              InRowLinePos = 1
            end
            item
              EditButtons = <>
              FieldName = 'wb_van_type'
              Footers = <>
              Title.Caption = #1058#1080#1087' '#1074#1072#1075#1086#1085#1072
              Width = 65
            end
            item
              EditButtons = <>
              FieldName = 'van_type'
              Footers = <>
              Title.Caption = #1058#1080#1087' '#1074#1072#1075#1086#1085#1072
              Width = 65
              InRowLinePos = 1
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pDetailTank: TPanel
          Left = -255
          Top = 0
          Width = 809
          Height = 20
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object sbBackToMonth: TSpeedButton
            Left = 0
            Top = -1
            Width = 70
            Height = 22
            Caption = #1053#1072#1079#1072#1076
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFCCCCCCCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCB88444BB894EFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC
              CCCCB68141FCCD87B88343FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFCCCCCCB68140F3CB8BF1C684B68242FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCB68141E6
              C38CE4B265ECC488B68241FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFCCCCCCB78140E6C493DFAB5FDDAA5EEAC58EB78241FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB98442D8BE96DCAC64D7
              A457D6A356E8C694B78241FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFB98442DBC29ED6A65FD19D4ED19C4DE6C89AB78241FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB88140E0C8A3CA
              9444CA9343E7CBA3B78240FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFB78140E3CEAAC28A36E6CEA9B7813FFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7
              813FE5CEABE7D3B2B8813FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7803DEBDDC3B88241FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFB98442CFAA7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = sbBackToMonthClick
          end
          object sbFirstD2: TSpeedButton
            Left = 70
            Top = -1
            Width = 90
            Height = 22
            Caption = #1053#1072' '#1085#1072#1095#1072#1083#1086
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFBB894EB88343B68242B68241B78241B7
              8241B78241B78240B7813FB8813FB88241CFAA7DFFFFFFFFFFFFFFFFFFCCCCCC
              B88444FCCD87F1C684ECC488EAC58EE8C694E6C89AE7CBA3E6CEA9E7D3B2EBDD
              C3B98442FFFFFFFFFFFFFFFFFFFFFFFFCCCCCCB68141F3CB8BE4B265DDAA5ED6
              A356D19C4DCA9343C28A36E5CEABB7803DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFCCCCCCB68140E6C38CDFAB5FD7A457D19D4ECA9444E3CEAAB7813FFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCB68141E6C493DC
              AC64D6A65FE0C8A3B78140FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFCCCCCCB78140D8BE96DBC29EB88140FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCB9
              8442B98442FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Visible = False
          end
          object lDetailTank: TLabel
            Left = 180
            Top = 4
            Width = 66
            Height = 13
            Caption = 'lDetailTank'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object grDetailAuto: TDBGridEh
          Left = 22
          Top = 8
          Width = 304
          Height = 123
          DataGrouping.GroupLevels = <>
          DataSource = dsDetail
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterColor = clSilver
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = [fsBold]
          FooterRowCount = 1
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghShowRecNo, dghColumnResize, dghExtendVertLines]
          ParentFont = False
          RowDetailPanel.Color = clBtnFace
          SumList.Active = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          Columns = <
            item
              EditButtons = <>
              FieldName = 'RRA_NUM'
              Footer.Alignment = taCenter
              Footer.Value = #1048#1090#1086#1075#1086
              Footer.ValueType = fvtStaticText
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #8470' '#1088'-'#1088#1072
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'TTN_NUM'
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #1058#1058#1053' '#8470
              Width = 50
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'LITR_TTN'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #1058#1058#1053'|'#1054#1073#1098#1077#1084', '#1083
              Width = 58
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'WEIGHT_TTN'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #1058#1058#1053'|'#1052#1072#1089#1089#1072', '#1082#1075
              Width = 61
            end
            item
              DisplayFormat = '0.0000'
              EditButtons = <>
              FieldName = 'DENSITY_TTN'
              Footer.DisplayFormat = '0.0000'
              Footer.ValueType = fvtAvg
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #1058#1058#1053'|'#1055#1083#1086#1090#1085'.'
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'TEMPERATURE_TTN'
              Footer.DisplayFormat = '0.0'
              Footer.ValueType = fvtAvg
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #1058#1058#1053'|'#1058#1077#1084#1087#1077#1088'.'
              Width = 50
            end
            item
              DisplayFormat = '0.0000'
              EditButtons = <>
              FieldName = 'PR_DENSITY_TTN'
              Footer.DisplayFormat = '0.0000'
              Footer.ValueType = fvtAvg
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #1058#1058#1053'|'#1055#1088#1080#1074#1077#1076'. '#1087#1083#1086#1090#1085'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = 8404992
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 55
            end
            item
              EditButtons = <>
              FieldName = 'GAUGING_DENSITY'
              Footer.ValueType = fvtAvg
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #1047#1072#1084#1077#1088'|'#1055#1083#1086#1090#1085'.'
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'GAUGING_TEMPERATURE'
              Footer.DisplayFormat = '0.0'
              Footer.ValueType = fvtAvg
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #1047#1072#1084#1077#1088'|'#1058#1077#1084#1087#1077#1088'.'
              Width = 50
            end
            item
              DisplayFormat = '0.0000'
              EditButtons = <>
              FieldName = 'GAUGING_PR_DENSITY'
              Footer.DisplayFormat = '0.0000'
              Footer.ValueType = fvtAvg
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #1047#1072#1084#1077#1088'|'#1055#1088#1080#1074#1077#1076'. '#1087#1083#1086#1090#1085'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = 8404992
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 55
            end
            item
              DisplayFormat = '0.0000#'
              EditButtons = <>
              FieldName = 'OVERESTIMATE'
              Footer.DisplayFormat = '0.0000#'
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #1047#1072#1074#1099#1096'., %'
              Width = 46
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'OVERESTIMATE_WEIGHT'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #1047#1072#1074#1099#1096'., '#1082#1075
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'DIFFERENCE_TTN_GAUGING'
              Footer.ValueType = fvtAvg
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #1056#1072#1079#1085#1080#1094#1072' '#1087#1088'.'#1087#1083'. ('#1058#1058#1053'-'#1079#1072#1084#1077#1088')'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = 4210816
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'customer_name'
              Footers = <>
              Title.Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'delivery_name'
              Footers = <>
              Title.Caption = #1055#1091#1085#1082#1090' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
              Width = 120
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    inherited pDetail: TPanel
      Top = 295
      Width = 567
      inherited DBGridDetail: TDBGridEh
        Width = 567
        FooterColor = clMoneyGreen
        FooterFont.Style = [fsBold]
        FooterRowCount = 1
        ParentFont = False
        SumList.Active = True
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DATE_RASH_T'
            Footer.Alignment = taRightJustify
            Footer.Value = #1050#1086#1083'-'#1074#1086' :'
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'DENSITY_TTN'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088' '#1087#1091#1090#1077#1074#1082#1080
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'GAUGING_TEMPERATURE'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088' '#1089#1077#1082#1094#1080#1080
            Width = 87
          end
          item
            DisplayFormat = '0,'
            EditButtons = <>
            FieldName = 'IS_HAVE_DET'
            Footer.DisplayFormat = '0,'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1042#1077#1089', '#1082#1075
            Width = 84
          end>
      end
    end
    object pGridRowDoc: TPanel
      Left = 0
      Top = 0
      Width = 567
      Height = 5
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 717
    inherited pnlTuneGridBtn: TPanel
      Left = 688
    end
  end
  inherited PanelCol: TPanel
    Left = 567
    Top = 60
    Height = 347
    inherited cbCol: TRxCheckListBox
      Height = 319
    end
    inherited pRefresh: TPanel
      Top = 321
    end
  end
  object pGridRow: TPanel [5]
    Left = 0
    Top = 55
    Width = 717
    Height = 5
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    Visible = False
  end
  inherited ds: TOraDataSource
    Left = 47
    Top = 135
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'SELECT /*+ORDERED*/'
      ' T.TR_DATE,'
      ' T.DOC_NO,'
      ' T.PRODUCT_FROM,'
      ' P.NAME PRODUCT_NAME,'
      
        ' decode(tt.tank_kind, 1, decode(tf.tank_kind, 1, PT.NAME, '#39#39'), '#39 +
        #39') as PRODUCT_NAME_TO,'
      ' TF.TANK_NAME TANK_FROM,'
      ' TT.TANK_NAME TANK_TO,'
      ' T.VOLUME,'
      ' T.MASS,'
      ' t.transfer_id,'
      ' decode(count(tr.tran_ref_id), 0, 0, 1) as is_have_det,'
      ' to_char(T.TR_DATE, '#39'month'#39', '#39'nls_date_language=russian'#39') ||'
      ' to_char(T.TR_DATE, '#39'YYYY'#39') as MONYEAR,'
      ' to_char(T.TR_DATE, '#39'MM'#39') as MM'
      
        '  FROM TRANSFER T, TANK TF, TANK TT, PRODUCT P, PRODUCT PT, tran' +
        '_ref tr'
      ' WHERE trunc(T.TR_DATE) between :BeginDate AND :EndDate'
      '   AND T.PARENT_ID IS NULL'
      '   AND TF.TANK_ID = T.TANK_FROM'
      '   AND TF.TANK_NAME not in ('#39#1073#1077#1085#1079#1086#1074#1086#1079#1099#39')'
      '   AND TT.TANK_ID = T.TANK_TO'
      '   AND P.PRODUCT_ID = T.PRODUCT_FROM'
      '   AND PT.PRODUCT_ID = T.PRODUCT_TO'
      '   AND T.TRANSFER_ID = tr.transfer_id(+)'
      ' GROUP BY T.TR_DATE,'
      '          T.DOC_NO,'
      '          T.PRODUCT_FROM,'
      '          P.NAME,'
      
        '          decode(tt.tank_kind, 1, decode(tf.tank_kind, 1, PT.NAM' +
        'E, '#39#39'), '#39#39'),'
      '          TF.TANK_NAME,'
      '          TT.TANK_NAME,'
      '          T.VOLUME,'
      '          T.MASS,'
      '          t.transfer_id'
      ' ORDER BY T.TR_DATE desc, T.DOC_NO')
    OnFilterRecord = qFilterRecord
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
  end
  inherited ADMQ: TOilQuery
    Top = 240
  end
  inherited PUM: TPopupMenu
    Left = 193
    Top = 277
    object N2: TMenuItem [0]
      Caption = '-'
    end
  end
  inherited qDetail: TOilQuery
    SQL.Strings = (
      'select MON,'
      '       NP_ID,'
      '       NP_NAME,'
      '       DATE_RASH,'
      '       TTN_NUM,'
      '       RRA_NUM,'
      '       sum(LITR_TTN) as LITR_TTN,'
      '       sum(WEIGHT_TTN) as WEIGHT_TTN,'
      '       round(avg(DENSITY_TTN), 4) as DENSITY_TTN,'
      '       round(avg(TEMPERATURE_TTN), 1) as TEMPERATURE_TTN,'
      '       round(avg(PR_DENSITY_TTN), 4) as PR_DENSITY_TTN,'
      '       round(avg(GAUGING_DENSITY_CONT), 4) as GAUGING_DENSITY,'
      
        '       round(avg(GAUGING_TEMPERATURE_CONT), 1) as GAUGING_TEMPER' +
        'ATURE,'
      
        '       round(avg(GAUGING_PR_DENSITY_CONT), 4) as GAUGING_PR_DENS' +
        'ITY,'
      '       round(avg(round((PR_DENSITY_TTN * LITR_TTN -'
      
        '                       GAUGING_PR_DENSITY_CONT * LITR_TTN) / WEI' +
        'GHT_TTN * 100,'
      '                       2)),'
      
        '             2) as OVERESTIMATE, -- % '#1079#1072#1074#1099#1096#1077#1085#1080#1103'                 ' +
        '      '
      '       round(sum(round(PR_DENSITY_TTN * LITR_TTN -'
      '                       GAUGING_PR_DENSITY_CONT * LITR_TTN,'
      '                       0)),'
      '             0) as OVERESTIMATE_WEIGHT, -- '#1047#1072#1074#1099#1096#1077#1085#1080#1077', '#1082#1075
      
        '       round(avg(round(PR_DENSITY_TTN - GAUGING_PR_DENSITY_CONT,' +
        ' 4)), 4) as DIFFERENCE_TTN_GAUGING, -- '#1056#1072#1079#1085#1080#1094#1072' '#1087#1088'.'#1087#1083'. ('#1058#1058#1053'-'#1079#1072#1084#1077#1088 +
        ')'
      '       is_have_det,'
      '       MM,'
      '       customer_name,'
      '       delivery_name'
      '  from ('
      
        '--*************************** '#1044#1045#1058#1040#1051#1030#1047#1040#1062#1030#1071' // *******************' +
        '******************'
      'select *'
      
        '  from (select max(GAUGING_DENSITY) over(partition by TANK_ID, t' +
        'yp_sum) as GAUGING_DENSITY_CONT,'
      
        '               max(GAUGING_TEMPERATURE) over(partition by TANK_I' +
        'D, typ_sum) as GAUGING_TEMPERATURE_CONT,'
      
        '               max(GAUGING_PR_DENSITY) over(partition by TANK_ID' +
        ', typ_sum) as GAUGING_PR_DENSITY_CONT,'
      '               1 as is_have_det,'
      '               t.*'
      
        '          from (select sum(typ) over(partition by TANK_ID order ' +
        'by numc) as typ_sum,'
      '                       t.*'
      '                  from (select t.*,'
      
        '                               row_number() over(partition by TA' +
        'NK_ID order by DATE_RASH) as numc,'
      
        '                               decode(GAUGING_DENSITY, null, 0, ' +
        '1) as typ'
      
        '                          from (select INITCAP(trim(to_char(mdat' +
        'e,'
      
        '                                                            '#39'mon' +
        'th'#39','
      
        '                                                            '#39'nls' +
        '_date_language=russian'#39'))) ||'
      
        '                                       to_char(mdate, '#39' YYYY'#39') a' +
        's MON, -- '#1052#1077#1089#1103#1094
      '                                       fuel_id as NP_ID,'
      
        '                                       fuel_name as NP_NAME, -- ' +
        #1053'/'#1087#1088#1086#1076#1091#1082#1090
      '                                       mdate as DATE_RASH,'
      '                                       TANK_ID,'
      '                                       TTN_NUM, -- '#8470' '#1058#1058#1053
      
        '                                       numb as RRA_NUM, -- '#8470' '#1088'-'#1088 +
        #1072
      
        '                                       LITR as LITR_TTN, -- '#1054#1073#1098#1077 +
        #1084', '#1083
      
        '                                       round(LITR * DENSITY, 0) ' +
        'as WEIGHT_TTN, -- '#1052#1072#1089#1089#1072', '#1082#1075
      
        '                                       DENSITY as DENSITY_TTN, -' +
        '- '#1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1086' '#1058#1058#1053
      
        '                                       TEMPER as TEMPERATURE_TTN' +
        ', -- '#1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1087#1086' '#1058#1058#1053
      
        '                                       PR_DENSITY as PR_DENSITY_' +
        'TTN, -- '#1055#1088#1080#1074#1077#1076'.'#1087#1083#1086#1090#1085'. '#1087#1086' '#1058#1058#1053
      
        '                                       to_number(null) as GAUGIN' +
        'G_DENSITY, -- '#1055#1083#1086#1090#1085'. '#1087#1086' '#1079#1072#1084#1077#1088#1072#1084
      
        '                                       to_number(null) as GAUGIN' +
        'G_TEMPERATURE, -- '#1058#1077#1084#1087'. '#1087#1086' '#1079#1072#1084#1077#1088#1072#1084
      
        '                                       to_number(null) as GAUGIN' +
        'G_PR_DENSITY, -- '#1055#1088#1080#1074#1077#1076'.'#1087#1083#1086#1090#1085'. '#1087#1086' '#1079#1072#1084#1077#1088#1072#1084
      
        '                                       to_char(mdate, '#39'MM'#39') as M' +
        'M,'
      '                                       customer_name,'
      '                                       delivery_name'
      '                                  from V_OIL_REZ_BOOK_REST'
      '                                 where UnionNum = 10'
      
        '                                   and trunc(mdate) between :Beg' +
        'inDate and :EndDate'
      '                                union all'
      '                                select /*+ORDERED*/'
      '                                 to_char(null) as MON,'
      '                                 fuel_id as NP_ID,'
      '                                 fuel_name as NP_NAME,'
      '                                 MDATE as DATE_RASH,'
      '                                 TANK_ID,'
      '                                 to_char(null) as TTN_NUM,'
      '                                 to_char(null) as RRA_NUM,'
      '                                 to_number(null) as LITR_TTN,'
      '                                 to_number(null) as WEIGHT_TTN,'
      '                                 to_number(null) as DENSITY_TTN,'
      
        '                                 to_number(null) as TEMPERATURE_' +
        'TTN,'
      
        '                                 to_number(null) as PR_DENSITY_T' +
        'TN,'
      '                                 Density as GAUGING_DENSITY,'
      '                                 temper as GAUGING_TEMPERATURE,'
      
        '                                 PR_DENSITY as GAUGING_PR_DENSIT' +
        'Y,'
      '                                 to_char(null) as MM,'
      '                                 to_char(null) as customer_name,'
      '                                 to_char(null) as delivery_name'
      '                                  from v_oil_rez_fact_rest'
      
        '                                 where trunc(mdate) between :Beg' +
        'inDate - 10 and'
      '                                       :EndDate) t) t) t) t'
      ' where typ = 0'
      
        '--*************************** // '#1044#1045#1058#1040#1051#1030#1047#1040#1062#1030#1071' *******************' +
        '******************'
      '       )'
      
        ' group by MON, NP_ID, NP_NAME, DATE_RASH, TTN_NUM, RRA_NUM, is_h' +
        'ave_det, MM, customer_name, delivery_name')
    MasterSource = nil
    MasterFields = ''
    Left = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end>
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
    Left = 96
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
  object dsDetailTank: TOraDataSource
    DataSet = qDetailTank
    Left = 624
    Top = 136
  end
  object qDetailTank: TOilQuery
    SQL.Strings = (
      
        'select decode(sign((ri.mass - ri.wb_mass)), -1, (ri.mass - ri.wb' +
        '_mass), 0) as rail_loss_ned,'
      
        '       decode(sign((ri.mass - ri.wb_mass)), 1, (ri.mass - ri.wb_' +
        'mass), 0) as rail_loss_izl,'
      '       (ri.mass - ri.wb_mass) as rail_loss,'
      
        '       round(100 * (ri.mass - ri.wb_mass) / sum(abs(ri.mass - ri' +
        '.wb_mass))'
      '             over(partition by ri.act_hdr_id),'
      '             1) as rail_loss_ratio,'
      '       rh.act_no,'
      '       rh.act_date,'
      '       rh.note,'
      '       ri.van_no,'
      '       ri.waybill_no,'
      '       ri.mass,'
      '       ri.van_type,'
      '       ri.density,'
      '       ri.temperature, /* '#1092#1072#1082#1090' */'
      '       ri.wb_mass,'
      '       ri.wb_van_type,'
      '       ri.wb_density,'
      '       ri.wb_temperature, /* '#1076#1086#1082#1091#1084#1077#1085#1090#1099' */'
      '       ri.sum_freight,'
      '       ri.act_hdr_id,'
      '       '#39#1044#1086#1082'.'#39' as td,'
      '       '#39#1060#1072#1082#1090#39' as tf,'
      
        '       round((ri.mass - ri.wb_mass) / (ri.wb_mass) * 100, 4) as ' +
        'rail_loss_to_doc_ratio'
      '  from P_TRANS             &base_name T,'
      '       TRAN_REF            &base_name TR,'
      '       TRANSFER            &base_name TF,'
      '       V_PRODUCT           &base_name P,'
      '       OIL_NP_GROUP        &base_name NPG,'
      '       VM_OIL_NP_DOP_GROUP &base_name DG,'
      '       ACT_RAIL_ITEM       &base_name RI,'
      '       act_rail_hdr        &base_name rh'
      ' where TR.P_TRANS_ID = T.P_TRANS_ID'
      '    and tr.transfer_id =   :trans_id'
      '   and TF.TRANSFER_ID = TR.TRANSFER_ID'
      '   and P.PRODUCT_ID = T.PRODUCT_ID'
      '   and npg.id = p.oil_npg_id'
      '   and dg.super_group_id(+) = 2'
      '   and dg.np_id(+) = p.oil_np_id'
      '   and T.p_trans_id = ri.p_trans(+)'
      '   and ri.act_hdr_id = rh.act_hdr_id'
      ' --  and T.TR_DATE between :BeginDate and :EndDate'
      '   and T.tr_kind not in (4, 15, 7)'
      '   and T.tr_kind in (8)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 592
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'trans_id'
        ParamType = ptInputOutput
      end>
    MacroData = <
      item
        Name = 'base_name'
      end>
  end
end
