inherited RezRashBaseForm: TRezRashBaseForm
  Left = 369
  Top = 333
  Caption = #1054#1090#1075#1088#1091#1079#1082#1072' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072
  ClientHeight = 531
  ClientWidth = 964
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 498
    Width = 964
    Visible = False
    inherited Panel3: TPanel
      Left = 767
    end
    inherited Panel4: TPanel
      inherited bbClear: TBitBtn
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
    inherited pShowDetail: TPanel
      Width = 399
    end
  end
  inherited Panel2: TPanel
    Width = 964
    Height = 37
    Visible = False
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = #1052#1077#1089#1103#1094
    end
    object cbMonth: TComboBox
      Left = 56
      Top = 8
      Width = 145
      Height = 21
      Style = csDropDownList
      DropDownCount = 13
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #1042#1089#1077
      OnChange = cbMonthChange
      Items.Strings = (
        #1042#1089#1077
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
  end
  inherited pBase: TPanel
    Top = 57
    Width = 814
    Height = 441
    inherited SplitterDetail: TSplitter
      Top = 386
      Width = 814
    end
    inherited DBGrid1: TDBGridEh
      Width = 814
      Height = 386
      IndicatorTitle.ShowDropDownSign = True
      IndicatorTitle.TitleButton = True
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghColumnResize, dghColumnMove]
      ReadOnly = True
      RowDetailPanel.Active = True
      RowDetailPanel.Width = 830
      RowDetailPanel.Height = 400
      RowDetailPanel.ActiveControl = gDetailDoc
      STFilter.InstantApply = True
      STFilter.Local = True
      STFilter.Visible = True
      SumList.Active = True
      UseMultiTitle = True
      OnApplyFilter = DBGrid1ApplyFilter
      OnCheckRowHaveDetailPanel = DBGrid1CheckRowHaveDetailPanel
      OnGetCellParams = DBGrid1GetCellParams
      OnRowDetailPanelHide = DBGrid1RowDetailPanelHide
      OnRowDetailPanelShow = DBGrid1RowDetailPanelShow
      Columns = <
        item
          EditButtons = <>
          FieldName = 'MON'
          Footers = <>
          Title.Caption = #1052#1077#1089#1103#1094
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'NP_NAME'
          Footers = <>
          Title.Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
          Width = 100
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'LITR_TTN'
          Footers = <>
          STFilter.Visible = False
          Title.Caption = #1058#1058#1053'|'#1054#1073#1098#1077#1084', '#1083
          Width = 94
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'WEIGHT_TTN'
          Footers = <>
          STFilter.Visible = False
          Title.Caption = #1058#1058#1053'|'#1052#1072#1089#1089#1072', '#1082#1075
          Width = 97
        end
        item
          EditButtons = <>
          FieldName = 'DENSITY_TTN'
          Footers = <>
          STFilter.Visible = False
          Title.Caption = #1058#1058#1053'|'#1055#1083#1086#1090#1085'.'
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'TEMPERATURE_TTN'
          Footer.DisplayFormat = '0.0'
          Footers = <>
          STFilter.Visible = False
          Title.Caption = #1058#1058#1053'|'#1058#1077#1084#1087#1077#1088'.'
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'PR_DENSITY_TTN'
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
          FieldName = 'GAUGING_PR_DENSITY'
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
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'OVERESTIMATE_WEIGHT'
          Footer.ValueType = fvtSum
          Footers = <>
          STFilter.Visible = False
          Title.Caption = #1047#1072#1074#1099#1096'., '#1082#1075
        end
        item
          EditButtons = <>
          FieldName = 'DIFFERENCE_TTN_GAUGING'
          Footers = <>
          STFilter.Visible = False
          Title.Caption = #1056#1072#1079#1085#1080#1094#1072' '#1087#1088'.'#1087#1083'. ('#1058#1058#1053'-'#1079#1072#1084#1077#1088')'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 4210816
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 70
        end>
      inherited RowDetailData: TRowDetailPanelControlEh
        object gDetailDoc: TDBGridEh
          Left = 0
          Top = 20
          Width = 778
          Height = 266
          Align = alClient
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
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
          ParentFont = False
          RowDetailPanel.Active = True
          RowDetailPanel.Width = 765
          RowDetailPanel.Height = 400
          RowDetailPanel.ActiveControl = gDetailTank
          RowDetailPanel.Color = clBtnFace
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnDblClick = gDetailDocDblClick
          OnRowDetailPanelHide = gDetailDocRowDetailPanelHide
          OnRowDetailPanelShow = gDetailDocRowDetailPanelShow
          Columns = <
            item
              DisplayFormat = 'dd.mm.yyyy'
              EditButtons = <>
              FieldName = 'DATE_RASH_T'
              Footer.Alignment = taCenter
              Footer.Value = #1048#1090#1086#1075#1086
              Footer.ValueType = fvtStaticText
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #1058#1058#1053'|'#1044#1072#1090#1072
              Width = 85
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
              Width = 68
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
              Width = 67
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
              Title.Caption = #1047#1072#1074#1099#1096'.,%'
              Width = 53
            end
            item
              EditButtons = <>
              FieldName = 'OVERESTIMATE_WEIGHT'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              STFilter.Visible = False
              Title.Caption = #1047#1072#1074#1099#1096'., '#1082#1075
              Width = 62
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
            end>
          object RowDetailData: TRowDetailPanelControlEh
            object gDetailTank: TDBGridEh
              Left = 0
              Top = 20
              Width = 736
              Height = 151
              Align = alClient
              DataGrouping.GroupLevels = <>
              DataSource = dsDetailTank
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
                  Title.Caption = #1058#1058#1053'|'#8470
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
            object pDetailTank: TPanel
              Left = 0
              Top = 0
              Width = 736
              Height = 20
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object sbBackToAct: TSpeedButton
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
                OnClick = sbBackToActClick
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
                OnClick = sbFirstD2Click
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
          end
        end
        object pDetailDoc: TPanel
          Left = 0
          Top = 0
          Width = 778
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
          object sbFirstD1: TSpeedButton
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
            OnClick = sbFirstD1Click
          end
          object lDetailDoc: TLabel
            Left = 180
            Top = 4
            Width = 60
            Height = 13
            Caption = 'lDetailDoc'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
    inherited pDetail: TPanel
      Top = 389
      Width = 814
      inherited DBGridDetail: TDBGridEh
        Width = 814
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 964
    inherited sbFilterPosition: TSpeedButton
      Visible = False
    end
    inherited pnlTuneGridBtn: TPanel
      Left = 935
    end
  end
  inherited PanelCol: TPanel
    Left = 814
    Top = 57
    Height = 441
    inherited cbCol: TRxCheckListBox
      Height = 413
    end
    inherited pRefresh: TPanel
      Top = 415
    end
  end
  object pGridRow: TPanel [5]
    Left = 0
    Top = 47
    Width = 964
    Height = 5
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    Visible = False
  end
  object pGridRowDoc: TPanel [6]
    Left = 0
    Top = 52
    Width = 964
    Height = 5
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    Visible = False
  end
  inherited ds: TOraDataSource
    Left = 760
    Top = 64
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select *'
      '  from (select MON,'
      '               NP_ID,'
      '               NP_NAME,'
      '               decode(is_have_det,'
      '                      1,'
      '                      LITR_TTN,'
      '                      decode(NP_ID,'
      '                             -1,'
      '                             decode(MM,'
      '                                    '#39'13'#39','
      '                                    sum(LITR_TTN) over(),'
      
        '                                    sum(LITR_TTN) over(partition' +
        ' by MM)),'
      
        '                             sum(LITR_TTN) over(partition by NP_' +
        'ID))) as LITR_TTN,'
      '               decode(is_have_det,'
      '                      1,'
      '                      WEIGHT_TTN,'
      '                      decode(NP_ID,'
      '                             -1,'
      '                             decode(MM,'
      '                                    '#39'13'#39','
      '                                    sum(WEIGHT_TTN) over(),'
      
        '                                    sum(WEIGHT_TTN) over(partiti' +
        'on by MM)),'
      
        '                             sum(WEIGHT_TTN) over(partition by N' +
        'P_ID))) as WEIGHT_TTN,'
      '               round(decode(is_have_det,'
      '                            1,'
      '                            DENSITY_TTN,'
      '                            decode(NP_ID,'
      '                                   -1,'
      '                                   to_number(null),'
      
        '                                   avg(DENSITY_TTN) over(partiti' +
        'on by NP_ID))),'
      '                     4) as DENSITY_TTN,'
      '                     '
      '               round(decode(is_have_det,'
      '                            1,'
      '                            TEMPERATURE_TTN,'
      '                            decode(NP_ID,'
      '                                   -1,'
      '                                   to_number(null),'
      '                                   avg(TEMPERATURE_TTN)'
      '                                   over(partition by NP_ID))),'
      '                     1) as TEMPERATURE_TTN,'
      '               round(decode(is_have_det,'
      '                            1,'
      '                            PR_DENSITY_TTN,'
      '                            decode(NP_ID,'
      '                                   -1,'
      '                                   to_number(null),'
      '                                   avg(PR_DENSITY_TTN)'
      '                                   over(partition by NP_ID))),'
      '                     4) as PR_DENSITY_TTN,'
      '               round(decode(is_have_det,'
      '                            1,'
      '                            GAUGING_DENSITY,'
      '                            decode(NP_ID,'
      '                                   -1,'
      '                                   to_number(null),'
      '                                   avg(GAUGING_DENSITY)'
      '                                   over(partition by NP_ID))),'
      '                     4) as GAUGING_DENSITY,'
      '               round(decode(is_have_det,'
      '                            1,'
      '                            GAUGING_TEMPERATURE,'
      '                            decode(NP_ID,'
      '                                   -1,'
      '                                   to_number(null),'
      '                                   avg(GAUGING_TEMPERATURE)'
      '                                   over(partition by NP_ID))),'
      '                     1) as GAUGING_TEMPERATURE,'
      '               round(decode(is_have_det,'
      '                            1,'
      '                            GAUGING_PR_DENSITY,'
      '                            decode(NP_ID,'
      '                                   -1,'
      '                                   to_number(null),'
      '                                   avg(GAUGING_PR_DENSITY)'
      '                                   over(partition by NP_ID))),'
      '                     4) as GAUGING_PR_DENSITY,'
      '                     '
      '               round(decode(is_have_det,'
      '                      1,'
      '                      OVERESTIMATE_WEIGHT,'
      '                      decode(NP_ID,'
      '                             -1,'
      '                             decode(MM,'
      '                                    '#39'13'#39','
      
        '                                    sum(OVERESTIMATE_WEIGHT) ove' +
        'r(),'
      
        '                                    sum(OVERESTIMATE_WEIGHT) ove' +
        'r(partition by MM)),'
      
        '                             sum(OVERESTIMATE_WEIGHT) over(parti' +
        'tion by NP_ID))),'
      '                     0) as OVERESTIMATE_WEIGHT,'
      '                     '
      '                     '
      '               round(decode(is_have_det,'
      '                      1,'
      '                      DIFFERENCE_TTN_GAUGING,'
      '                      decode(NP_ID,'
      '                             -1,'
      '                             to_number(null),'
      '                             avg(DIFFERENCE_TTN_GAUGING)'
      '                             over(partition by NP_ID))),'
      '                     4) as DIFFERENCE_TTN_GAUGING,'
      '               is_have_det,'
      '               MM'
      '          from (select MON,'
      '                       NP_ID,'
      '                       NP_NAME,'
      '                       sum(LITR_TTN) as LITR_TTN,'
      '                       sum(WEIGHT_TTN) as WEIGHT_TTN,'
      
        '                       round(avg(DENSITY_TTN), 4) as DENSITY_TTN' +
        ','
      
        '                       round(avg(TEMPERATURE_TTN), 1) as TEMPERA' +
        'TURE_TTN,'
      
        '                       round(avg(PR_DENSITY_TTN), 4) as PR_DENSI' +
        'TY_TTN,'
      
        '                       round(avg(GAUGING_DENSITY_CONT), 4) as GA' +
        'UGING_DENSITY,'
      
        '                       round(avg(GAUGING_TEMPERATURE_CONT), 1) a' +
        's GAUGING_TEMPERATURE,'
      
        '                       round(avg(GAUGING_PR_DENSITY_CONT), 4) as' +
        ' GAUGING_PR_DENSITY,'
      
        '                       round(avg(round((PR_DENSITY_TTN * LITR_TT' +
        'N -'
      
        '                                       GAUGING_PR_DENSITY_CONT *' +
        ' LITR_TTN) /'
      '                                       WEIGHT_TTN * 100,'
      '                                       2)),'
      
        '                             2) as OVERESTIMATE, -- % '#1079#1072#1074#1099#1096#1077#1085#1080#1103' ' +
        '                      '
      
        '                       round(sum(round(PR_DENSITY_TTN * LITR_TTN' +
        ' -'
      
        '                                       GAUGING_PR_DENSITY_CONT *' +
        ' LITR_TTN,'
      '                                       0)),'
      
        '                             0) as OVERESTIMATE_WEIGHT, -- '#1047#1072#1074#1099#1096 +
        #1077#1085#1080#1077', '#1082#1075
      '                       round(avg(round(PR_DENSITY_TTN -'
      '                                       GAUGING_PR_DENSITY_CONT,'
      '                                       4)),'
      
        '                             4) as DIFFERENCE_TTN_GAUGING, -- '#1056#1072 +
        #1079#1085#1080#1094#1072' '#1087#1088'.'#1087#1083'. ('#1058#1058#1053'-'#1079#1072#1084#1077#1088')'
      '                       is_have_det,'
      '                       MM'
      '                  from ('
      
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
        'M'
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
      '                                 to_char(null) as MM'
      '                                  from v_oil_rez_fact_rest'
      
        '                                 where trunc(mdate) between :Beg' +
        'inDate - 10 and'
      '                                       :EndDate) t) t) t) t'
      ' where typ = 0'
      
        '--*************************** // '#1044#1045#1058#1040#1051#1030#1047#1040#1062#1030#1071' *******************' +
        '******************'
      '                        )'
      '                 group by MON, NP_ID, NP_NAME, is_have_det, MM'
      '                union all'
      
        '                select INITCAP(trim(to_char(to_date(lpad(rownum,' +
        ' 2, '#39'0'#39'),'
      '                                                    '#39'MM'#39'),'
      '                                            '#39'month'#39','
      
        '                                            '#39'nls_date_language=r' +
        'ussian'#39'))) ||'
      '                       to_char(sysdate, '#39' YYYY'#39') as MON,'
      '                       -1 as NP_ID,'
      '                       '#39#1048#1058#1054#1043#1054#39' as NP_NAME,'
      '                       to_number(null) as LITR_TTN,'
      '                       to_number(null) as WEIGHT_TTN,'
      '                       to_number(null) as DENSITY_TTN,'
      '                       to_number(null) as TEMPERATURE_TTN,'
      '                       to_number(null) as PR_DENSITY_TTN,'
      '                       to_number(null) as GAUGING_DENSITY,'
      '                       to_number(null) as GAUGING_TEMPERATURE,'
      '                       to_number(null) as GAUGING_PR_DENSITY,'
      '                       to_number(null) as OVERESTIMATE,'
      '                       to_number(null) as OVERESTIMATE_WEIGHT,'
      
        '                       to_number(null) as DIFFERENCE_TTN_GAUGING' +
        ','
      '                       0 as is_have_det,'
      '                       lpad(rownum, 2, '#39'0'#39') as MM'
      '                  from all_objects'
      '                 where rownum <= 12'
      '                union all'
      '                select '#39'C '#1085#1072#1095#1072#1083#1072' '#1075#1086#1076#1072#39' as MON,'
      '                       id as NP_ID,'
      '                       name as NP_NAME,'
      '                       to_number(null) as LITR_TTN,'
      '                       to_number(null) as WEIGHT_TTN,'
      '                       to_number(null) as DENSITY_TTN,'
      '                       to_number(null) as TEMPERATURE_TTN,'
      '                       to_number(null) as PR_DENSITY_TTN,'
      '                       to_number(null) as GAUGING_DENSITY,'
      '                       to_number(null) as GAUGING_TEMPERATURE,'
      '                       to_number(null) as GAUGING_PR_DENSITY,'
      '                       to_number(null) as OVERESTIMATE,'
      '                       to_number(null) as OVERESTIMATE_WEIGHT,'
      
        '                       to_number(null) as DIFFERENCE_TTN_GAUGING' +
        ','
      '                       0 as is_have_det,'
      '                       '#39'13'#39' as MM'
      '                  from oil_np_group'
      '                union all'
      '                select '#39'C '#1085#1072#1095#1072#1083#1072' '#1075#1086#1076#1072#39' as MON,'
      '                       -1 as NP_ID,'
      '                       '#39#1048#1058#1054#1043#1054#39' as NP_NAME,'
      '                       to_number(null) as LITR_TTN,'
      '                       to_number(null) as WEIGHT_TTN,'
      '                       to_number(null) as DENSITY_TTN,'
      '                       to_number(null) as TEMPERATURE_TTN,'
      '                       to_number(null) as PR_DENSITY_TTN,'
      '                       to_number(null) as GAUGING_DENSITY,'
      '                       to_number(null) as GAUGING_TEMPERATURE,'
      '                       to_number(null) as GAUGING_PR_DENSITY,'
      '                       to_number(null) as OVERESTIMATE,'
      '                       to_number(null) as OVERESTIMATE_WEIGHT,'
      
        '                       to_number(null) as DIFFERENCE_TTN_GAUGING' +
        ','
      '                       0 as is_have_det,'
      '                       '#39'13'#39' as MM'
      '                  from dual)'
      '         order by MM, is_have_det desc, NP_NAME)'
      ' where LITR_TTN is not null')
    FetchAll = True
    Left = 744
    Top = 80
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
  inherited ActionList: TActionList
    Left = 304
    Top = 119
  end
  inherited qDetail: TOilQuery
    SQL.Strings = (
      'select MON,'
      '       NP_ID,'
      '       NP_NAME,'
      '       trunc(DATE_RASH) as DATE_RASH_T,'
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
      '       MM'
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
        'M, '
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
      ' group by MON, NP_ID, NP_NAME, trunc(DATE_RASH), is_have_det, MM')
    MasterSource = nil
    MasterFields = ''
    FetchAll = True
    Left = 744
    Top = 144
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
  inherited dsDetail: TOraDataSource
    Left = 760
    Top = 128
  end
  object qDetailTank: TOilQuery
    SQL.Strings = (
      'select MON,'
      '       NP_ID,'
      '       NP_NAME,'
      '       trunc(DATE_RASH) as DATE_RASH_T,'
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
      
        ' group by MON, NP_ID, NP_NAME, trunc(DATE_RASH), TTN_NUM, RRA_NU' +
        'M, is_have_det, MM, customer_name, delivery_name')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 744
    Top = 208
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
  object dsDetailTank: TOraDataSource
    DataSet = qDetailTank
    Left = 760
    Top = 192
  end
end
