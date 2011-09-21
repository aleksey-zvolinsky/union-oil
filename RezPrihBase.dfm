inherited RezPrihBaseForm: TRezPrihBaseForm
  Top = 204
  Caption = #1055#1088#1080#1093#1086#1076' '#1085#1072' '#1085#1077#1092#1090#1077#1073#1072#1079#1091
  ClientHeight = 508
  ClientWidth = 857
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 475
    Width = 857
    Visible = False
    inherited Panel3: TPanel
      Left = 660
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
      Width = 292
    end
  end
  inherited Panel2: TPanel
    Width = 857
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
    Width = 707
    Height = 418
    inherited SplitterDetail: TSplitter
      Top = 363
      Width = 707
    end
    inherited DBGrid1: TDBGridEh
      Width = 707
      Height = 363
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
          Width = 130
        end
        item
          EditButtons = <>
          FieldName = 'FUEL_NAME'
          Footers = <>
          Title.Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
          Width = 110
        end
        item
          DisplayFormat = ',#'
          EditButtons = <>
          FieldName = 'MASS_DOC'
          Footer.DisplayFormat = ',#'
          Footers = <>
          STFilter.Visible = False
          Title.Caption = #1055#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084', '#1082#1075
          Width = 100
        end
        item
          DisplayFormat = ',#'
          EditButtons = <>
          FieldName = 'MASS_FACT'
          Footer.DisplayFormat = ',#'
          Footers = <>
          STFilter.Visible = False
          Title.Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080', '#1082#1075
          Width = 100
        end
        item
          DisplayFormat = ',#'
          EditButtons = <>
          FieldName = 'RAIL_LOSS_NED'
          Footer.DisplayFormat = ',#'
          Footers = <>
          STFilter.Visible = False
          Title.Caption = #1056#1072#1079#1085#1080#1094#1072'|'#1053#1077#1076#1086#1089#1090#1072#1095#1072
          Visible = False
          Width = 94
        end
        item
          DisplayFormat = ',#'
          EditButtons = <>
          FieldName = 'RAIL_LOSS_IZL'
          Footer.DisplayFormat = ',#'
          Footers = <>
          STFilter.Visible = False
          Title.Caption = #1056#1072#1079#1085#1080#1094#1072'|'#1048#1079#1083#1080#1096#1077#1082
          Visible = False
          Width = 95
        end
        item
          DisplayFormat = ',#'
          EditButtons = <>
          FieldName = 'RAIL_LOSS'
          Footers = <>
          STFilter.Visible = False
          Title.Caption = #1056#1072#1079#1085#1080#1094#1072', '#1082#1075'|'#1080#1079#1083#1080#1096#1077#1082'/'#1085#1077#1076#1086#1089#1090#1072#1095#1072' (+/-)'
          Width = 130
        end
        item
          DisplayFormat = '0.0000'
          EditButtons = <>
          FieldName = 'rail_loss_to_doc_ratio'
          Footers = <>
          STFilter.Visible = False
          Title.Caption = #1056#1072#1079#1085#1080#1094#1072', '#1082#1075'|% '#1086#1090#1085#1086#1096#1077#1085#1080#1077
          Width = 80
        end
        item
          DisplayFormat = ',#'
          EditButtons = <>
          FieldName = 'RAIL_LOSS_RATIO'
          Footer.DisplayFormat = '#'
          Footers = <>
          STFilter.Visible = False
          Title.Caption = #1056#1072#1079#1085#1080#1094#1072', '#1082#1075'|'#1042#1077#1089#1086#1074#1086#1081' '#1082#1086#1101#1092'., %'
          Width = 80
        end>
      inherited RowDetailData: TRowDetailPanelControlEh
        object gDetailDoc: TDBGridEh
          Left = 0
          Top = 20
          Width = 673
          Height = 249
          Align = alClient
          DataGrouping.GroupLevels = <>
          DataSource = dsDetail
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
          OnCheckRowHaveDetailPanel = gDetailDocCheckRowHaveDetailPanel
          OnDblClick = gDetailDocDblClick
          OnRowDetailPanelHide = gDetailDocRowDetailPanelHide
          OnRowDetailPanelShow = gDetailDocRowDetailPanelShow
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ACT_NO'
              Footer.Alignment = taCenter
              Footer.Value = #1048#1090#1086#1075#1086
              Footer.ValueType = fvtStaticText
              Footers = <>
              Title.Caption = #1040#1082#1090'|'#1053#1086#1084#1077#1088
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'ACT_DATE'
              Footers = <>
              Title.Caption = #1040#1082#1090'|'#1044#1072#1090#1072
              Width = 60
            end
            item
              DisplayFormat = ',#'
              EditButtons = <>
              FieldName = 'MASS_DOC'
              Footer.DisplayFormat = ',#'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1055#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084', '#1082#1075
              Width = 70
            end
            item
              DisplayFormat = ',#'
              EditButtons = <>
              FieldName = 'MASS_FACT'
              Footer.DisplayFormat = ',#'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080', '#1082#1075
              Width = 70
            end
            item
              DisplayFormat = ',#'
              EditButtons = <>
              FieldName = 'RAIL_LOSS_NED'
              Footer.DisplayFormat = ',#'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1056#1072#1079#1085#1080#1094#1072'|'#1053#1077#1076#1086#1089#1090#1072#1095#1072
              Visible = False
            end
            item
              DisplayFormat = ',#'
              EditButtons = <>
              FieldName = 'RAIL_LOSS_IZL'
              Footer.DisplayFormat = ',#'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1056#1072#1079#1085#1080#1094#1072'|'#1048#1079#1083#1080#1096#1077#1082
              Visible = False
            end
            item
              DisplayFormat = ',#'
              EditButtons = <>
              FieldName = 'RAIL_LOSS'
              Footer.DisplayFormat = ',#'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1056#1072#1079#1085#1080#1094#1072', '#1082#1075'|'#1080#1079#1083#1080#1096#1077#1082'/'#1085#1077#1076#1086#1089#1090#1072#1095#1072' (+/-)'
              Width = 130
            end
            item
              DisplayFormat = '0.0000'
              EditButtons = <>
              FieldName = 'rail_loss_to_doc_ratio'
              Footer.DisplayFormat = '0.0000'
              Footers = <>
              Title.Caption = #1056#1072#1079#1085#1080#1094#1072', '#1082#1075'|% '#1086#1090#1085#1086#1096#1077#1085#1080#1077
              Width = 70
            end
            item
              DisplayFormat = ',#'
              EditButtons = <>
              FieldName = 'RAIL_LOSS_RATIO'
              Footer.DisplayFormat = '#'
              Footers = <>
              Title.Caption = #1056#1072#1079#1085#1080#1094#1072', '#1082#1075'|'#1042#1077#1089#1086#1074#1086#1081' '#1082#1086#1101#1092'., %'
              Title.Hint = 
                '='#13#10'('#1086#1090#1082#1083#1086#1085#1077#1085#1080#1077' '#1074' '#1089#1090#1088#1086#1082#1077')'#13#10'--------------------------------------' +
                '-----------------'#13#10'('#1089#1091#1084#1084#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1087#1086' '#1084#1086#1076#1091#1083#1102')'
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'NOTE'
              Footers = <>
              Title.Caption = #1054#1090#1082#1091#1076#1072
              Width = 200
            end>
          object RowDetailData: TRowDetailPanelControlEh
            object gDetailTank: TDBGridEh
              Left = 0
              Top = 20
              Width = 631
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
                  Width = 80
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
                  Width = 70
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
                  Width = 72
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
              Left = 0
              Top = 0
              Width = 631
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
          Width = 673
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
      Top = 366
      Width = 707
      inherited DBGridDetail: TDBGridEh
        Width = 707
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 857
    inherited sbFilterPosition: TSpeedButton
      Visible = False
    end
    inherited pnlTuneGridBtn: TPanel
      Left = 828
    end
  end
  inherited PanelCol: TPanel
    Left = 707
    Top = 57
    Height = 418
    inherited cbCol: TRxCheckListBox
      Height = 390
    end
    inherited pRefresh: TPanel
      Top = 392
    end
  end
  object pGridRow: TPanel [5]
    Left = 0
    Top = 47
    Width = 857
    Height = 5
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    Visible = False
  end
  object pGridRowDoc: TPanel [6]
    Left = 0
    Top = 52
    Width = 857
    Height = 5
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    Visible = False
  end
  inherited ds: TOraDataSource
    Left = 576
    Top = 72
  end
  inherited q: TOilQuery
    SQL.Strings = (
      
        'select Q.*, round(rail_loss / mass_doc * 100, 4) as rail_loss_to' +
        '_doc_ratio '
      '  from (select mon,'
      '               fuel_id,'
      '               fuel_name,'
      '               decode(is_have_det, '
      '                 1, mass_doc, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(mass_doc)over(),sum(ma' +
        'ss_doc)over(partition by MM)),'
      
        '                   sum(mass_doc)over(partition by fuel_id))) as ' +
        'mass_doc,'
      '               decode(is_have_det, '
      '                 1, mass_fact, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(mass_fact)over(),sum(m' +
        'ass_fact)over(partition by MM)),'
      
        '                   sum(mass_fact)over(partition by fuel_id))) as' +
        ' mass_fact,'
      '               decode(is_have_det, '
      '                 1, rail_loss, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(rail_loss)over(),sum(r' +
        'ail_loss)over(partition by MM)),'
      
        '                   sum(rail_loss)over(partition by fuel_id))) as' +
        ' rail_loss,'
      '               least(decode(is_have_det, '
      '                 1, rail_loss, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(rail_loss)over(),sum(r' +
        'ail_loss)over(partition by MM)),'
      
        '                   sum(rail_loss)over(partition by fuel_id))),0)' +
        ' as rail_loss_ned,'
      '               greatest(decode(is_have_det, '
      '                 1, rail_loss, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(rail_loss)over(),sum(r' +
        'ail_loss)over(partition by MM)),'
      
        '                   sum(rail_loss)over(partition by fuel_id))),0)' +
        ' as rail_loss_izl,'
      '                   '
      '               decode(is_have_det, '
      '                 1, rail_loss_ratio, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',100,round(100*sum(rail_los' +
        's)over(partition by MM)/sum(rail_loss)over(),1)),'
      
        '                   round(100*sum(rail_loss)over(partition by fue' +
        'l_id)/sum(rail_loss)over(),1))) as rail_loss_ratio,'
      '                   '
      '               is_have_det,'
      '               MM '
      
        '          from (select INITCAP(trim(to_char(nvl(TF.TR_DATE, T.TR' +
        '_DATE), '#39'month'#39', '#39'nls_date_language=russian'#39')))||to_char(nvl(TF.' +
        'TR_DATE, T.TR_DATE),'#39' YYYY'#39') as mon,'
      '                       nvl(-dg.id, npg.id) as fuel_id,'
      '                       nvl(dg.name, npg.name) as fuel_name,'
      '                       sum(ri.wb_mass) as mass_doc,'
      '                       sum(ri.mass) as mass_fact, '
      
        '                       sum(ri.mass - ri.wb_mass) as rail_loss /*' +
        ' '#1053#1077#1076#1086#1089#1090#1072#1095#1072' '#1087#1086' '#1087#1088#1080#1093#1086#1076#1072#1084' '#1046#1044' */,'
      
        '                       least(sum(ri.mass - ri.wb_mass),0) as rai' +
        'l_loss_ned,'
      
        '                       greatest(sum(ri.mass - ri.wb_mass),0) as ' +
        'rail_loss_izl,'
      '                       round(100 * sum(ri.mass - ri.wb_mass) /'
      
        '                         sum(sum(ri.mass - ri.wb_mass))over(part' +
        'ition by to_char(nvl(TF.TR_DATE, T.TR_DATE),'#39'MM'#39')), 1) as rail_l' +
        'oss_ratio,'
      '                       1 as is_have_det,'
      
        '                       to_char(nvl(TF.TR_DATE, T.TR_DATE), '#39'MM'#39')' +
        ' as MM'
      '                  from P_TRANS&base_name T,'
      '                       TRAN_REF&base_name TR,'
      '                       TRANSFER&base_name TF,'
      '                       V_PRODUCT&base_name P,'
      '                       OIL_NP_GROUP&base_name NPG,'
      '                       VM_OIL_NP_DOP_GROUP&base_name DG,'
      '                       ACT_RAIL_ITEM&base_name RI'
      '                 where TR.P_TRANS_ID = T.P_TRANS_ID'
      '                   and TF.TRANSFER_ID = TR.TRANSFER_ID'
      '                   and P.PRODUCT_ID = T.PRODUCT_ID'
      '                   and npg.id = p.oil_npg_id'
      '                   and dg.super_group_id(+) = 2'
      '                   and dg.np_id(+) = p.oil_np_id'
      '                   and T.p_trans_id = ri.p_trans(+)'
      '                   and T.TR_DATE between :BeginDate and :EndDate'
      '                   and T.tr_kind not in (4,15,7)'
      '                   and T.tr_kind in (8)   /*and 1=0*/'
      
        '                 group by to_char(nvl(TF.TR_DATE, T.TR_DATE),'#39'MM' +
        #39'),'
      
        '                          INITCAP(trim(to_char(nvl(TF.TR_DATE, T' +
        '.TR_DATE), '#39'month'#39', '#39'nls_date_language=russian'#39')))||to_char(nvl(' +
        'TF.TR_DATE, T.TR_DATE),'#39' YYYY'#39'),'
      '                          nvl(-dg.id, npg.id),'
      '                          nvl(dg.name, npg.name)'
      '                 union all'
      
        '                select INITCAP(trim(to_char(to_date(lpad(rownum,' +
        '2,'#39'0'#39'),'#39'MM'#39'), '#39'month'#39', '#39'nls_date_language=russian'#39')))||to_char(s' +
        'ysdate,'#39' YYYY'#39') as mon,'
      '                       -1 as fuel_id,'
      '                       '#39#1048#1058#1054#1043#1054#39' as fuel_name,'
      '                       to_number(null) as mass_doc,'
      '                       to_number(null) as mass_fact,'
      '                       to_number(null) as rail_loss,'
      '                       to_number(null) as rail_loss_ned,'
      '                       to_number(null) as rail_loss_izl,'
      '                       to_number(null) as rail_loss_ratio,'
      '                       0 as is_have_det,'
      '                       lpad(rownum,2,'#39'0'#39') as MM'
      '                  from all_objects'
      '                 where rownum <= 12'
      '                 union all'
      '                select '#39'C '#1085#1072#1095#1072#1083#1072' '#1075#1086#1076#1072#39' as mon,'
      '                       id as fuel_id,'
      '                       name as fuel_name,'
      '                       to_number(null) as mass_doc,'
      '                       to_number(null) as mass_fact,'
      '                       to_number(null) as rail_loss,'
      '                       to_number(null) as rail_loss_ned,'
      '                       to_number(null) as rail_loss_izl,'
      '                       to_number(null) as rail_loss_ratio,'
      '                       0 as is_have_det,'
      '                       '#39'13'#39' as MM'
      '                  from oil_np_group'
      '                 union all'
      '                select '#39'C '#1085#1072#1095#1072#1083#1072' '#1075#1086#1076#1072#39' as mon,'
      '                       -1 as fuel_id,'
      '                       '#39#1048#1058#1054#1043#1054#39' as fuel_name,'
      '                       to_number(null) as mass_doc,'
      '                       to_number(null) as mass_fact,'
      '                       to_number(null) as rail_loss,'
      '                       to_number(null) as rail_loss_ned,'
      '                       to_number(null) as rail_loss_izl,'
      '                       to_number(null) as rail_loss_ratio,'
      '                       0 as is_have_det,'
      '                       '#39'13'#39' as MM'
      '                  from dual )'
      '        order by MM, is_have_det desc, fuel_name'
      '        )Q'
      'where mass_doc is not null')
    FetchAll = True
    Left = 512
    Top = 72
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
    MacroData = <
      item
        Name = 'base_name'
      end>
  end
  inherited ActionList: TActionList
    Left = 304
    Top = 119
  end
  inherited qDetail: TOilQuery
    SQL.Strings = (
      'select T.tr_kind,'
      '       nvl(-dg.id, npg.id) as fuel_id,'
      '       nvl(dg.name, npg.name) as fuel_name,'
      '       nvl(sum(ri.wb_mass),sum(ai.wb_mass)) as mass_doc,'
      '       nvl(sum(ri.mass),sum(ai.mass)) as mass_fact,'
      
        '       nvl(sum(ri.mass - ri.wb_mass),sum(ai.mass - ai.wb_mass)) ' +
        'as rail_loss /* '#1053#1077#1076#1086#1089#1090#1072#1095#1072' '#1087#1086' '#1087#1088#1080#1093#1086#1076#1072#1084' '#1046#1044' */,'
      
        '       decode(sign(nvl(sum(ri.mass - ri.wb_mass),sum(ai.mass - a' +
        'i.wb_mass))),'
      '              -1,'
      
        '              nvl(sum(ri.mass - ri.wb_mass),sum(ai.mass - ai.wb_' +
        'mass)),'
      '              0) as rail_loss_ned,'
      
        '       decode(sign(nvl(sum(ri.mass - ri.wb_mass),sum(ai.mass - a' +
        'i.wb_mass))),'
      '              1,'
      
        '              nvl(sum(ri.mass - ri.wb_mass),sum(ai.mass - ai.wb_' +
        'mass)),'
      '              0) as rail_loss_izl,'
      
        '       round(100 * nvl(sum(ri.mass - ri.wb_mass),sum(ai.mass - a' +
        'i.wb_mass)) /'
      
        '             sum(abs(nvl(sum(ri.mass - ri.wb_mass),greatest(sum(' +
        'ai.mass - ai.wb_mass),0.0001))))'
      '             over(partition by to_char(TF.TR_DATE, '#39'MM'#39'),'
      '                  nvl(-dg.id, npg.id)),'
      '             1) as rail_loss_ratio,'
      '       nvl(to_char(rh.act_no), ai.act_no) as act_no,'
      '       nvl(rh.act_date, t.tr_date) as act_date,'
      '       case'
      '         when (instr(lower(rh.note) || '#39' '#39', '#39#1082#1072#1075#1072#39')>0) then'
      '              '#39#1089#1090'.'#1050#1072#1075#1072#1084#1083#1080#1094#1100#1082#1072' - '#39' ||'
      '              translate(trim(substr(substr(rh.note,'
      
        '                                 instr(lower(rh.note) || '#39' '#39', '#39#1082 +
        #1072#1075#1072#39')),'
      '                          instr(substr(rh.note || '#39' '#39','
      
        '                                       instr(lower(rh.note) || '#39 +
        ' '#39', '#39#1082#1072#1075#1072#39')),'
      '                                '#39' '#39'))),'#39',.\/-'#1075#39','#39'......'#39')'
      '         when (instr(lower(rh.note) || '#39' '#39', '#39#1091#1079#1077#1083#39')>0) then'
      '              '#39#1089#1090'.'#1053#1080#1078#1085#1077#1076#1085#1077#1087#1088#1086#1074#1089#1082#1080#1081' '#1091#1079#1077#1083' - '#39' ||'
      '              translate(trim(substr(substr(rh.note,'
      
        '                                 instr(lower(rh.note) || '#39' '#39', '#39#1091 +
        #1079#1077#1083#39')),'
      '                          instr(substr(rh.note || '#39' '#39','
      
        '                                       instr(lower(rh.note) || '#39 +
        ' '#39', '#39#1091#1079#1077#1083#39')),'
      '                                '#39' '#39'))),'#39',.\/-'#1075#39','#39'......'#39')'
      '         else'
      '           rh.note '
      '       end as note,'
      '       to_char(TF.TR_DATE, '#39'MM'#39') as MM,'
      '       rh.act_hdr_id,'
      
        '       round(nvl(sum(ri.mass - ri.wb_mass),sum(ai.mass - ai.wb_m' +
        'ass)) / sum(ri.wb_mass) * 100, 4) as rail_loss_to_doc_ratio'
      '  from P_TRANS             &base_name T,'
      '       TRAN_REF            &base_name TR,'
      '       TRANSFER            &base_name TF,'
      '       V_PRODUCT           &base_name P,'
      '       OIL_NP_GROUP        &base_name NPG,'
      '       VM_OIL_NP_DOP_GROUP &base_name DG,'
      '       ACT_RAIL_ITEM       &base_name RI,'
      '       act_rail_hdr        &base_name rh,'
      '       act_auto            &base_name ai'
      ' where TR.P_TRANS_ID = T.P_TRANS_ID'
      '   and TF.TRANSFER_ID = TR.TRANSFER_ID'
      '   and P.PRODUCT_ID = T.PRODUCT_ID'
      '   and npg.id = p.oil_npg_id'
      '   and dg.super_group_id(+) = 2'
      '   and dg.np_id(+) = p.oil_np_id'
      '   and T.p_trans_id = ri.p_trans(+)'
      '   and ri.act_hdr_id = rh.act_hdr_id(+)'
      '   and T.p_Trans_Id = ai.p_trans(+)'
      '   and T.TR_DATE between :BeginDate and :EndDate'
      '   and T.tr_kind in (7, 8)'
      ' group by to_char(TF.TR_DATE, '#39'MM'#39'),'
      '          nvl(-dg.id, npg.id),'
      '          nvl(dg.name, npg.name),'
      '          nvl(to_char(rh.act_no), ai.act_no),'
      '          nvl(rh.act_date, t.tr_date),'
      '          rh.note,'
      '          nvl(rh.note, ai.note),'
      '          rh.act_hdr_id,'
      '          T.tr_kind')
    MasterSource = nil
    MasterFields = ''
    FetchAll = True
    Left = 512
    Top = 120
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
    MacroData = <
      item
        Name = 'base_name'
      end>
  end
  inherited dsDetail: TOraDataSource
    Left = 576
    Top = 120
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
      '   and TF.TRANSFER_ID = TR.TRANSFER_ID'
      '   and P.PRODUCT_ID = T.PRODUCT_ID'
      '   and npg.id = p.oil_npg_id'
      '   and dg.super_group_id(+) = 2'
      '   and dg.np_id(+) = p.oil_np_id'
      '   and T.p_trans_id = ri.p_trans(+)'
      '   and ri.act_hdr_id = rh.act_hdr_id'
      '   and T.TR_DATE between :BeginDate and :EndDate'
      '   and T.tr_kind not in (4, 15, 7)'
      '   and T.tr_kind in (8)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 512
    Top = 168
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
    MacroData = <
      item
        Name = 'base_name'
      end>
  end
  object dsDetailTank: TOraDataSource
    DataSet = qDetailTank
    Left = 576
    Top = 168
  end
end
