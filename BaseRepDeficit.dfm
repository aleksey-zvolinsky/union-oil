inherited BaseRepDeficitForm: TBaseRepDeficitForm
  Left = 231
  Top = 169
  Caption = #1040#1085#1072#1083#1080#1079' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1085'/'#1087
  ClientHeight = 697
  ClientWidth = 1035
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 664
    Width = 1035
    inherited Panel3: TPanel
      Left = 838
    end
    inherited Panel4: TPanel
      inherited bbClear: TBitBtn
        Visible = False
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
    inherited pShowDetail: TPanel
      Width = 73
      Align = alNone
    end
    object KoefUdWeightButton: TButton
      Left = 652
      Top = 2
      Width = 165
      Height = 25
      Caption = #1050#1086#1101#1092'. '#1087#1088#1080#1088#1086#1089#1090#1072' '#1085#1072' '#1091#1076#1077#1083#1072#1093
      TabOrder = 9
      OnClick = KoefUdWeightButtonClick
    end
  end
  inherited Panel2: TPanel
    Width = 1035
    Height = 31
    object lblBeginDate: TLabel
      Left = 6
      Top = 8
      Width = 7
      Height = 13
      Caption = 'C'
    end
    object lblEndDate: TLabel
      Left = 119
      Top = 8
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object deBeginDate: TDateEdit
      Left = 21
      Top = 4
      Width = 87
      Height = 21
      DefaultToday = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object deEndDate: TDateEdit
      Left = 138
      Top = 4
      Width = 90
      Height = 21
      CheckOnExit = True
      DefaultToday = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  inherited pBase: TPanel
    Top = 50
    Width = 885
    Height = 614
    inherited SplitterDetail: TSplitter
      Top = 559
      Width = 885
    end
    inherited DBGrid1: TDBGridEh
      Width = 885
      Height = 559
      Flat = True
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghColumnResize, dghColumnMove]
      ReadOnly = True
      RowDetailPanel.Active = True
      RowDetailPanel.Height = 2000
      RowDetailPanel.ActiveControl = gDetailDoc
      SumList.Active = True
      UseMultiTitle = True
      OnCheckRowHaveDetailPanel = DBGrid1CheckRowHaveDetailPanel
      OnGetCellParams = DBGrid1GetCellParams
      OnRowDetailPanelHide = DBGrid1RowDetailPanelHide
      OnRowDetailPanelShow = DBGrid1RowDetailPanelShow
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Mon'
          Footers = <>
          Width = 128
        end
        item
          EditButtons = <>
          FieldName = 'FUEL_NAME'
          Footers = <>
          Width = 104
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'FIRST_DIFF'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1056#1072#1079#1085#1080#1094#1072' '#1084#1077#1078#1076#1091' '#1082#1085#1080#1078#1085#1099#1084' '#1086#1089#1090#1072#1090#1082#1086#1084' '#1080' '#1079#1072#1084#1077#1088#1072#1084#1080'|'#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072', '#1082#1075
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'LAST_DIFF'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1056#1072#1079#1085#1080#1094#1072' '#1084#1077#1078#1076#1091' '#1082#1085#1080#1078#1085#1099#1084' '#1086#1089#1090#1072#1090#1082#1086#1084' '#1080' '#1079#1072#1084#1077#1088#1072#1084#1080'|'#1085#1072' '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072', '#1082#1075
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'DIFF_OF_DIFF'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1072' '#1087#1077#1088#1080#1086#1076', '#1082#1075
          Width = 65
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'INCOME'
          Footer.ValueType = fvtSum
          Footers = <>
          Visible = False
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'MIXING'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'|'#1055#1086#1090#1077#1088#1080'|'#1087#1088#1080' '#1089#1084#1077#1096#1077#1085#1080#1080', '#1082#1075
          Width = 69
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'LACK'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'|'#1055#1086#1090#1077#1088#1080'|'#1087#1088#1080' '#1087#1088#1080#1093#1086#1076#1077' '#1072#1074#1090#1086', '#1082#1075
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'RAIL_LOSS_SUM'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'|'#1055#1086#1090#1077#1088#1080'|'#1087#1088#1080' '#1087#1088#1080#1105#1084#1077' '#1078'/'#1076', '#1082#1075
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'DELTAWEIGHT'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'|'#1055#1088#1080#1088#1086#1089#1090' '#1085#1072' '#1091#1076#1077#1083#1072#1093', '#1082#1075
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'LOSTSUM'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1079#1072' '#1084#1080#1085#1091#1089#1086#1084' '#1087#1086#1090#1077#1088#1100' '#1086#1087#1077#1088#1072#1094#1080#1081', '#1082#1075
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'VOLUME2'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1040#1074#1090#1086#1085#1072#1083#1080#1074'|'#1054#1090#1087#1091#1089#1082#1080', '#1083
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'LOADING_LOSS'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1040#1074#1090#1086#1085#1072#1083#1080#1074'|'#1055#1086#1090#1077#1088#1080', '#1082#1075
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'COUNT_REZ'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtAvg
          Footers = <>
          Title.Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1085#1099#1081' '#1087#1072#1088#1082'|'#1050#1086#1083#1080#1095#1077#1090#1074#1086' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1086#1074', '#1096#1090
          Width = 71
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'LOSTFROMONE'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1085#1099#1081' '#1087#1072#1088#1082'|'#1055#1086#1090#1077#1088#1080' '#1089' '#1086#1076#1085#1086#1075#1086' '#1088#1077#1079#1091#1088#1074#1091#1072#1088#1072', '#1082#1075
          Width = 79
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'LOSTFROMONEDAY'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1085#1099#1081' '#1087#1072#1088#1082'|'#1055#1086#1090#1077#1088#1080' '#1089' '#1086#1076#1085#1086#1075#1086' '#1088#1077#1079#1091#1088#1074#1091#1072#1088#1072' '#1074' '#1076#1077#1085#1100', '#1082#1075
        end>
      inherited RowDetailData: TRowDetailPanelControlEh
        object gDetailDoc: TDBGridEh
          Left = 0
          Top = 21
          Width = 850
          Height = 407
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
          FooterFont.Color = clBlack
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = [fsBold]
          FooterRowCount = 1
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          ParentFont = False
          PopupMenu = PUM
          RowDetailPanel.Height = 300
          RowDetailPanel.ActiveControl = gDetailDoc
          RowDetailPanel.Color = clBtnFace
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnColumnMoved = DBGrid1ColumnMoved
          OnDrawColumnCell = DBGrid1DrawColumnCell
          OnGetCellParams = DBGrid1GetCellParams
          OnSortMarkingChanged = DBGrid1SortMarkingChanged
          Columns = <
            item
              EditButtons = <>
              FieldName = 'MDATE'
              Footer.Alignment = taRightJustify
              Footer.ValueType = fvtCount
              Footers = <>
              Title.Caption = #1044#1072#1090#1072
              Width = 73
            end
            item
              EditButtons = <>
              FieldName = 'FUEL_NAME'
              Footers = <>
              Title.Caption = #1055#1088#1086#1076#1091#1082#1090
              Width = 104
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'FIRST_DIFF'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1056#1072#1079#1085#1080#1094#1072' '#1084#1077#1078#1076#1091' '#1082#1085#1080#1078#1085#1099#1084' '#1086#1089#1090#1072#1090#1082#1086#1084' '#1080' '#1079#1072#1084#1077#1088#1072#1084#1080' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1076#1085#1103', '#1082#1075
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'LAST_DIFF'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1056#1072#1079#1085#1080#1094#1072' '#1084#1077#1078#1076#1091' '#1082#1085#1080#1078#1085#1099#1084' '#1086#1089#1090#1072#1090#1082#1086#1084' '#1080' '#1079#1072#1084#1077#1088#1072#1084#1080'|'#1087#1088#1077#1076' '#1079#1085#1072#1095#1077#1085#1080#1077','#1083
              Visible = False
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'DIFF_OF_DIFF'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1072' '#1089#1091#1090#1082#1080' '#1087#1086' '#1089#1088#1072#1074#1085#1077#1085#1080#1102' '#1089#1086' '#1074#1095#1077#1088#1072', '#1082#1075
              Width = 65
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'INCOME'
              Footer.ValueType = fvtSum
              Footers = <>
              Visible = False
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'MIXING'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'|'#1055#1086#1090#1077#1088#1080'|'#1087#1088#1080' '#1089#1084#1077#1096#1077#1085#1080#1080', '#1082#1075
              Width = 69
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'LACK'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'|'#1055#1086#1090#1077#1088#1080'|'#1087#1088#1080' '#1087#1088#1080#1093#1086#1076#1077' '#1072#1074#1090#1086', '#1082#1075
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'RAIL_LOSS_SUM'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'|'#1055#1086#1090#1077#1088#1080'|'#1087#1088#1080' '#1087#1088#1080#1105#1084#1077' '#1078'/'#1076', '#1082#1075
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'DELTAWEIGHT'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'|'#1055#1088#1080#1088#1086#1089#1090' '#1085#1072' '#1091#1076#1077#1083#1072#1093', '#1082#1075
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'LOSTSUM'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1079#1072' '#1084#1080#1085#1091#1089#1086#1084' '#1087#1086#1090#1077#1088#1100' '#1086#1087#1077#1088#1072#1094#1080#1081', '#1082#1075
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'VOLUME2'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1040#1074#1090#1086#1085#1072#1083#1080#1074'|'#1054#1090#1087#1091#1089#1082#1080', '#1083
              Width = 76
            end
            item
              EditButtons = <>
              FieldName = 'LOADING_LOSS'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1040#1074#1090#1086#1085#1072#1083#1080#1074'|'#1055#1086#1090#1077#1088#1080','#1082#1075
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'COUNT_REZ'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtAvg
              Footers = <>
              Title.Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1085#1099#1081' '#1087#1072#1088#1082'|'#1050#1086#1083#1080#1095#1077#1090#1074#1086' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1086#1074', '#1096#1090
              Width = 71
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'LOSTFROMONE'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1085#1099#1081' '#1087#1072#1088#1082'|'#1055#1086#1090#1077#1088#1080' '#1089' '#1086#1076#1085#1086#1075#1086' '#1088#1077#1079#1091#1088#1074#1091#1072#1088#1072','#1082#1075
              Width = 79
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'LOSTFROMONEDAY'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1085#1099#1081' '#1087#1072#1088#1082'|'#1055#1086#1090#1077#1088#1080' '#1089' '#1086#1076#1085#1086#1075#1086' '#1088#1077#1079#1091#1088#1074#1091#1072#1088#1072' '#1074' '#1076#1077#1085#1100', '#1082#1075
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pDetailDoc: TPanel
          Left = 0
          Top = 0
          Width = 850
          Height = 21
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
          object Label1: TLabel
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
      Top = 562
      Width = 885
      inherited DBGridDetail: TDBGridEh
        Width = 885
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 1035
    inherited pnlTuneGridBtn: TPanel
      Left = 1006
      inherited sbCol: TSpeedButton
        Visible = False
      end
    end
  end
  inherited PanelCol: TPanel
    Left = 885
    Top = 50
    Height = 614
    inherited cbCol: TRxCheckListBox
      Height = 586
    end
    inherited pRefresh: TPanel
      Top = 588
    end
  end
  object pGridRow: TPanel [5]
    Left = 0
    Top = 41
    Width = 1035
    Height = 9
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    Visible = False
  end
  inherited ds: TOraDataSource
    Left = 188
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select * '
      '  from (select mon,'
      '               fuel_id,'
      '               fuel_name,      '
      '               decode(is_have_det, '
      '                 1, first_diff, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(first_diff)over(),sum(' +
        'first_diff)over(partition by MM)),'
      
        '                   first_value(first_diff)over(partition by fuel' +
        '_id))) as first_diff,'
      '               decode(is_have_det, '
      '                 1, last_diff, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(last_diff)over(),sum(l' +
        'ast_diff)over(partition by MM)),'
      
        '                   last_value(last_diff)over(partition by fuel_i' +
        'd))) as last_diff,'
      '               decode(is_have_det, '
      '                 1, diff_of_diff, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(diff_of_diff)over(),su' +
        'm(diff_of_diff)over(partition by MM)),'
      
        '                   sum(diff_of_diff)over(partition by fuel_id)))' +
        ' as diff_of_diff,'
      '               decode(is_have_det, '
      '                 1, mixing, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(mixing)over(),sum(mixi' +
        'ng)over(partition by MM)),'
      
        '                   sum(mixing)over(partition by fuel_id))) as mi' +
        'xing,'
      '               decode(is_have_det, '
      '                 1, income, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(income)over(),sum(inco' +
        'me)over(partition by MM)),'
      
        '                   sum(income)over(partition by fuel_id))) as in' +
        'come,'
      '                decode(is_have_det, '
      '                 1, lack, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(lack)over(),sum(lack)o' +
        'ver(partition by MM)),'
      
        '                   sum(lack)over(partition by fuel_id))) as lack' +
        ','
      '               decode(is_have_det, '
      '                 1, rail_loss_sum, '
      '               decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(rail_loss_sum)over(),s' +
        'um(rail_loss_sum)over(partition by MM)),'
      
        '                   sum(rail_loss_sum)over(partition by fuel_id))' +
        ') as rail_loss_sum,'
      '               decode(is_have_det, '
      '                 1, deltaweight, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(deltaweight)over(),sum' +
        '(deltaweight)over(partition by MM)),'
      
        '                   sum(deltaweight)over(partition by fuel_id))) ' +
        'as deltaweight,'
      '               decode(is_have_det, '
      '                 1, volume2, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(volume2)over(),sum(vol' +
        'ume2)over(partition by MM)),'
      
        '                   sum(volume2)over(partition by fuel_id))) as v' +
        'olume2,'
      '              decode(is_have_det, '
      '                 1, loading_loss, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(loading_loss)over(),su' +
        'm(loading_loss)over(partition by MM)),'
      
        '                   sum(loading_loss)over(partition by fuel_id)))' +
        ' as loading_loss,'
      '               decode(is_have_det,'
      '                 1, LOSTSUM, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(LOSTSUM)over(),sum(LOS' +
        'TSUM)over(partition by MM)),'
      
        '                   sum(LOSTSUM)over(partition by fuel_id))) as L' +
        'OSTSUM,'
      '               decode(is_have_det,'
      '                 1, count_rez,                          '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39', round(sum(count_rez)over(' +
        ')/(to_number(to_char(:end_date, '#39'MM'#39'))-to_number(to_char(:begin_' +
        'date,'#39'MM'#39'))+1),0),sum(count_rez)over(partition by MM)),'
      
        '                   round(avg(count_rez)over(partition by fuel_id' +
        '),0))) as count_rez,'
      '               decode(is_have_det,'
      '                 1, LOSTFROMONE,'
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(LOSTFROMONE)over(),sum' +
        '(LOSTFROMONE)over(partition by MM)),'
      
        '                   sum(LOSTFROMONE)over(partition by fuel_id))) ' +
        'as LOSTFROMONE,                   '
      '               decode(is_have_det,                   '
      '                 1, LOSTFROMONEDAY, '
      '                 decode(fuel_id, '
      
        '                   -1, decode(MM,'#39'13'#39',sum(LOSTFROMONEDAY)over(),' +
        'sum(LOSTFROMONEDAY)over(partition by MM)),'
      
        '                   sum(LOSTFROMONEDAY)over(partition by fuel_id)' +
        ')) as LOSTFROMONEDAY,                   '
      '               nvl(is_have_det,0) is_have_det,'
      '               MM '
      '          from  '
      '('
      'select'
      '       mon,'
      '       fuel_id,          '
      '       fuel_name,'
      '       first_diff,'
      
        '       decode(mm,to_char(:end_date,'#39'MM'#39'),last_diff1,lead(first_d' +
        'iff) over(order by fuel_id,mm))  last_diff,'
      
        '       decode(mm,to_char(:end_date,'#39'MM'#39'),last_diff1,lead(first_d' +
        'iff) over(order by fuel_id,mm)) - first_diff as diff_of_diff,   ' +
        '   '
      '       mixing, '
      '       income,'
      '       lack,'
      '       rail_loss_sum,     '
      '       deltaweight,'
      '       volume2,    '
      '       loading_loss,       '
      '       LOSTSUM,'
      '       count_rez,'
      '       LOSTFROMONE,'
      '       LOSTFROMONEDAY,'
      '       is_have_det,'
      '       mm'
      'from (select distinct'
      '       mon,'
      '       fuel_id,          '
      '       fuel_name,'
      
        '       first_value(first_diff) over(partition by fuel_id,mm) fir' +
        'st_diff, '
      
        '       last_value(first_diff) over(partition by fuel_id,mm)  las' +
        't_diff1,'
      '--       lead(first_diff) over(order by fuel_id,mm)  last_diff,'
      '--       last_value(last_diff) over(partition by fuel_id,mm)  '
      
        '--         - first_value(first_diff) over(partition by fuel_id,m' +
        'm) as diff_of_diff,'
      '       sum(mixing) over(partition by fuel_id,mm) mixing, '
      '       sum(income) over(partition by fuel_id,mm) income,'
      '       sum(lack) over(partition by fuel_id,mm) lack,'
      
        '       sum(rail_loss_sum)over(partition by fuel_id,mm) rail_loss' +
        '_sum,'
      
        '       sum(deltaweight)over(partition by fuel_id,mm) deltaweight' +
        ','
      '       sum(volume2)over(partition by fuel_id,mm) volume2,    '
      
        '       sum(loading_loss)over(partition by fuel_id,mm) loading_lo' +
        'ss,'
      '       sum(LOSTSUM)over(partition by fuel_id,mm) LOSTSUM,'
      '       max(count_rez)over(partition by fuel_id,mm) count_rez,'
      
        '       sum(LOSTFROMONE)over(partition by fuel_id,mm) LOSTFROMONE' +
        ','
      
        '       sum(LOSTFROMONEDAY)over(partition by fuel_id,mm) LOSTFROM' +
        'ONEDAY,'
      '       1 as is_have_det,'
      '       mm'
      'from'
      '('
      'select    '
      
        '       decode(Y.fuel_name,'#39#1060#1088'.'#1083#1077#1075'.'#39','#39#1060#1088#1072#1082#1094#1080#1103' '#1083#1077#1075#1082#1072#1103#39',Y.fuel_name' +
        ') as fuel_name,'
      '       decode(Y.fuel_id,'#39'-28'#39',-28,Y.fuel_id) as fuel_id,'
      '       Y.mdate as mdate,'
      
        '       INITCAP(trim(to_char(nvl(MDATE,:begin_date), '#39'month'#39', '#39'nl' +
        's_date_language=russian'#39')))||to_char(nvl(MDATE,:begin_date),'#39' YY' +
        'YY'#39') as mon,       '
      '       to_char(nvl(MDATE,:begin_date),'#39'MM'#39') as MM,'
      '       Y.first_diff first_diff, '
      
        '       nvl(Y.last_diff,0) as last_diff, --'#1085#1072' '#1089#1072#1084#1086#1084' '#1076#1077#1083#1077' '#1101#1090#1086' '#1087#1088#1077#1076 +
        ' '#1088#1072#1079#1085#1080#1094#1072
      '       nvl(Y.diff_of_diff,0) as diff_of_diff,'
      '       nvl(Y.mixing,0) as mixing, '
      '       nvl(Y.income,0) as income,'
      '       nvl(Y.rail_loss_sum,0) as rail_loss_sum,'
      '       nvl(Y.lack,0) as lack,           '
      '       nvl(Y.volume2,0) as volume2,       '
      
        '       nvl((round(volume2 * nvl(koef,0.002),0)),0) as deltaweigh' +
        't,'
      
        '       nvl((round(volume2/1e3*decode(fuel_id,3,0.02,0.2),0)),0) ' +
        '   as loading_loss,'
      
        '       round(nvl(Y.diff_of_diff,0) - nvl(Y.mixing,0) - nvl(Y.inc' +
        'ome,0) - nvl(Y.lack,0) - nvl(Y.rail_loss_sum,0) - nvl(round(volu' +
        'me2 * nvl(koef,0.002),0),0),0) as LOSTSUM,'
      '       nvl(Z.count_rez,1) count_rez,'
      
        '       round(-1*(nvl(Y.diff_of_diff,0) - nvl(Y.mixing,0) - nvl(Y' +
        '.income,0) - nvl(Y.lack,0) - nvl(Y.rail_loss_sum,0) - nvl(round(' +
        'volume2 *nvl(koef,0.002),0),0)+nvl(round(volume2/1e3*decode(fuel' +
        '_id,3,0.02,0.2),2),0))/nvl(Z.count_rez,1),0) as LOSTFROMONE,'
      
        '       round(-1*(nvl(Y.diff_of_diff,0) - nvl(Y.mixing,0) - nvl(Y' +
        '.income,0) - nvl(Y.lack,0) - nvl(Y.rail_loss_sum,0) - nvl(round(' +
        'volume2 *nvl(koef,0.002),0),0)+nvl(round(volume2/1e3*decode(fuel' +
        '_id,3,0.02,0.2),2),0))/nvl(Z.count_rez,1)/31,0) as LOSTFROMONEDA' +
        'Y'
      'from'
      '('
      'select '
      'to_char(nvl(MDATE,'#39'01.01.2010'#39'),'#39'MM'#39') as MM,'
      'MDATE,FUEL_ID,FUEL_NAME,'
      
        '(select max(t.koef) from oil_koef_ud_weight t where fuel_id=t.np' +
        '_group_id and trunc(mdate) between t.date_from and t.date_to) as' +
        ' koef,'
      'first_diff,'
      'lag(first_diff) over(order by fuel_id,  mdate) last_diff,'
      
        'first_diff - lag(first_diff) over(order by fuel_id, mdate) diff_' +
        'of_diff,'
      '0 mixing,'
      '0 income,'
      'rail_loss_sum,'
      'volume2,'
      'lack'
      'from(select MDATE, '
      'typ,'
      'FUEL_ID,FUEL_NAME,DIFF  first_diff,'
      'rail_loss_sum,'
      'volume2,'
      'lack'
      'from'
      '(select trunc(MDATE) mdate, '
      '--mdate,'
      'typ,'
      'FUEL_ID,FUEL_NAME,'
      'DIFF,'
      
        '-sum(rail_loss)over(partition by fuel_id,trunc(mdate)) rail_loss' +
        '_sum,'
      'sum(VOLUME)over(partition by fuel_id,trunc(mdate))volume2,'
      '-sum(LACK)over(partition by fuel_id,trunc(mdate))lack'
      '--,RAIL_LOSS,VOLUME,LACK,q5.*'
      'from('
      
        'select nvl(LITRES_ALL_POINTS, trunc(Q4.fact_diff_date_ratio * Q4' +
        '.fact_diff_litres) + LITRES_ALL_CONTINUOS) as LITRES_ALL,'
      
        '       nvl(CURAMOUNT_POINTS, trunc(Q4.book_diff_date_ratio * Q4.' +
        'book_diff_litres) + CURAMOUNT_CONTINUOS) as CURAMOUNT,'
      
        '       max(DIFF_ON_FACT)over(partition by fuel_id, fact_typ_sum)' +
        ' as DIFF,'
      
        '       max(CURAMOUNT_ON_FACT)over(partition by fuel_id, fact_typ' +
        '_sum) as CURAMOUNT_ON_FACT_CONTINUOS,'
      
        '       (nvl(LITRES_ALL_POINTS, trunc(Q4.fact_diff_date_ratio * Q' +
        '4.fact_diff_litres) + LITRES_ALL_CONTINUOS)) /*as LITRES_ALL*/ '
      
        '         - (nvl(CURAMOUNT_POINTS, trunc(Q4.book_diff_date_ratio ' +
        '* Q4.book_diff_litres) + CURAMOUNT_CONTINUOS)) /*as CURAMOUNT*/ ' +
        'as DIFF_APROX,'
      
        '       trunc(row_number()over(partition by fuel_id ORDER BY Q4.M' +
        'DATE)/greatest(count(*)over(partition by fuel_id),1)*100) as rn,'
      '       case '
      '         when trunc(MDATE) between :begin_date and :end_date '
      '           then 1 '
      '           else 0'
      '        end as is_chart,       '
      '       Q4.*'
      '  from ('
      'select Q3.*,'
      
        '       max(LITRES_ALL_) over(partition by fuel_id, fact_typ_sum)' +
        ' as LITRES_ALL_CONTINUOS,'
      
        '       LITRES_ALL_ - max(CURAMOUNT_) over(partition by fuel_id, ' +
        'book_typ_num) as DIFF_ON_FACT,'
      
        '       decode(LITRES_ALL_,null,null, max(CURAMOUNT_) over(partit' +
        'ion by fuel_id, book_typ_num)) as CURAMOUNT_ON_FACT,'
      
        '       max(product_name_) over(partition by fuel_id, fact_typ_su' +
        'm) as PRODUCT_NAME,       '
      
        '       max(TEMPER) over(partition by fuel_id, fact_typ_sum) as T' +
        'EMPER_CONTINUOS,'
      
        '       max(CURAMOUNT_) over(partition by fuel_id, book_typ_num) ' +
        'as CURAMOUNT_CONTINUOS,'
      
        '       nvl((-max(LITRES_ALL_) over(partition by fuel_id, fact_ty' +
        'p_sum) /*as LITRES_ALL*/ + max(FACT_ALL_LEAD) over(partition by ' +
        'fuel_id, fact_typ_sum)),0)'
      '         as fact_diff_litres,   '
      
        '       nvl((-max(CURAMOUNT_) over(partition by fuel_id, book_typ' +
        '_num) /*as LITRES_ALL*/ + max(BOOK_ALL_LEAD) over(partition by f' +
        'uel_id, book_typ_num)),0)'
      '         as book_diff_litres,                '
      
        '       nvl(round((mdate - min(mdate) over(partition by fuel_id, ' +
        'fact_typ_sum)/* as MDATE_FACT*/ + 1e-10) /'
      
        '         (min(FACT_MDATE_LEAD) over(partition by fuel_id, fact_t' +
        'yp_sum) /*as MDATE_LEAD*/ - min(mdate) over(partition by fuel_id' +
        ', fact_typ_sum) + 1e-10)/* as MDATE_FACT*/,4),0) '
      '         as fact_diff_date_ratio,     '
      
        '       nvl(round((mdate - min(mdate) over(partition by fuel_id, ' +
        'book_typ_num)/* as MDATE_FACT*/ + 1e-10) /'
      
        '         (min(BOOK_MDATE_LEAD) over(partition by fuel_id, book_t' +
        'yp_num) /*as MDATE_LEAD*/ - min(mdate) over(partition by fuel_id' +
        ', book_typ_num) + 1e-10)/* as MDATE_FACT*/,4),0) '
      '         as book_diff_date_ratio,   '
      '       mdate as mdate2,'
      
        '       min(mdate) over(partition by fuel_id, book_typ_num)/* as ' +
        'MDATE_FACT*/ as min_mdate_,'
      
        '       min(BOOK_MDATE_LEAD) over(partition by fuel_id, book_typ_' +
        'num) /*as MDATE_LEAD*/as min_BOOK_MDATE_LEAD_,          '
      '       LITRES_ALL_ as LITRES_ALL_POINTS,'
      '       CURAMOUNT_ as CURAMOUNT_POINTS'
      
        '  from (select sum(typ) over(partition by fuel_id order by numc)' +
        ' as fact_typ_sum,'
      
        '               sum(1 - typ) over(partition by fuel_id order by n' +
        'umc) as book_typ_num,'
      
        '               trunc(sysdate - max(MDATE_Valid) over(partition b' +
        'y fuel_id)) as valid,'
      '               Q2.*'
      '          from (select Q1.*,'
      
        '                       row_number() over(partition by fuel_id or' +
        'der by MDATE, book_rn) as numc           '
      '                  from (select /*+ORDERED*/ '
      '                               f.fuel_id,'
      '                               f.fuel_name,'
      '                               f.MDATE,'
      '                               to_date(null) as MDATE_Valid,'
      '                               f.MDATE_OUT,'
      '                               to_char(null) as numb,'
      '                               to_number(null) as CURAMOUNT_,'
      '                               sum(f.LITRES_ALL) as LITRES_ALL_,'
      '                               round(avg(f.temper),1) as temper,'
      
        '                               lead(sum(f.LITRES_ALL)) over(part' +
        'ition by f.fuel_id order by f.MDATE) as FACT_ALL_LEAD,'
      
        '                               lead(f.MDATE) over(partition by f' +
        '.fuel_id order by f.MDATE) as FACT_MDATE_LEAD,'
      '                               to_number(null) as BOOK_ALL_LEAD,'
      
        '                               to_date(null) as BOOK_MDATE_LEAD,' +
        '                              '
      '                               0 as diff_,'
      '                               0 as is_book_rests,'
      
        '                               decode(row_number() over(partitio' +
        'n by f.fuel_id order by f.MDATE desc), 1, 1, 0) as is_gauged,   ' +
        '                            '
      '                               1 as typ,'
      '                               to_number(null) as book_in_out,'
      '                               to_number(null) as book_amount, '
      '                               to_number(null) as book_rn,'
      
        '                               substr(max(to_char(f.MDATE, '#39'yyyy' +
        'mmdd'#39') || f.product_name),9) as product_name_,'
      
        '                               sum(f.is_tube*f.LITRES_ALL) as LI' +
        'TRES_ALL_TUBES,'
      '                               to_number(null) rail_loss,'
      '                               to_number(null) volume,'
      
        '                               to_number(null) lack             ' +
        '                  '
      '                          from v_oil_rez_fact_rest f'
      
        '                         where /*trunc(f.MDATE) between :begin_d' +
        'ate and :end_date'
      '                           and*/ trunc(f.MDATE) < :end_date    '
      '/*                           and f.org_inst = org_inst'
      '                           and f.inst = org_inst*/'
      
        '                           and (f.fuel_id = :fuel_id or :fuel_id' +
        ' = 0)'
      
        '                         group by f.fuel_id, f.fuel_name, f.MDAT' +
        'E, f.MDATE_OUT                                        '
      '                        union all'
      '                        select f.fuel_id  as fuel_id,'
      '                               f.fuel_name  as fuel_name,'
      '                               f.mdate as MDATE,'
      '                               f.mdate as MDATE_Valid,'
      
        '                               to_char(MDATE, '#39'dd.mm   hh24:mi'#39')' +
        ' as MDATE_OUT,'
      '                               to_char(null) as numb,'
      '                               sum(f.litres_all) as CURAMOUNT,'
      '                               to_number(null) as LITRES_ALL,'
      '                               to_number(null) as temper,'
      '                               to_number(null) as FACT_ALL_LEAD,'
      '                               to_date(null) as FACT_MDATE_LEAD,'
      
        '                               sum(f.litres_all) - lead(sum(f.li' +
        'tres_all)) over(partition by fuel_id order by MDATE) as BOOK_ALL' +
        '_LEAD,                                                          ' +
        '    '
      
        '                               lead(MDATE) over(partition by fue' +
        'l_id order by MDATE) as BOOK_MDATE_LEAD,                        ' +
        '      '
      '                               0 as diff_,'
      '                               decode(row_number()'
      
        '                                              over(partition by ' +
        'FUEL_ID order by MDATE desc),'
      '                                              1,'
      '                                              1,'
      
        '                                              0) as is_book_rest' +
        's,'
      
        '                               0 as is_gauged,                  ' +
        '             '
      '                               0 as typ,'
      '                               to_number(null) as book_in_out,'
      '                               to_number(null) as book_amount,'
      
        '                               row_number() over(partition by f.' +
        'fuel_id order by f.MDATE) as book_rn,'
      '                               to_char(null) as product_name_,'
      
        '                               to_number(null) as LITRES_ALL_TUB' +
        'ES,'
      '                               to_number(null) rail_loss,'
      '                               to_number(null) volume,'
      
        '                               to_number(null) lack             ' +
        '                  '
      '                          from v_oil_rez_fact_rest f'
      
        '                         where ((numb in ('#39'87'#39','#39'88'#39') and inst = ' +
        '624)or(inst <> 624))  '
      
        '--                           and trunc(f.MDATE) between :begin_d' +
        'ate and :end_date'
      
        '                           and trunc(f.MDATE) < :end_date       ' +
        '                    '
      '/*                           and f.org_inst = org_inst'
      '                           and f.inst = org_inst*/'
      
        '                           and (f.fuel_id = :fuel_id or :fuel_id' +
        ' = 0)                                '
      
        '                         group by f.mdate, f.fuel_id, f.fuel_nam' +
        'e'
      '                         '
      '                        union all'
      '                        select fuel_id,'
      '                               fuel_name,'
      '                               MDATE as MDATE,'
      '                               MDATE as MDATE_Valid,'
      
        '                               to_char(MDATE, '#39'dd.mm   hh24:mi'#39')' +
        ' as MDATE_OUT,'
      '                               to_char(null) as numb,'
      '                               CURAMOUNT,'
      '                               to_number(null) as LITRES_ALL,'
      '                               to_number(null) as temper,'
      '                               to_number(null) as FACT_ALL_LEAD,'
      '                               to_date(null) as FACT_MDATE_LEAD,'
      
        '                               lead(CURAMOUNT) over(partition by' +
        ' FUEL_ID order by RN) as BOOK_ALL_LEAD,                         ' +
        '                                     '
      
        '                               lead(MDATE) over(partition by FUE' +
        'L_ID order by RN) as BOOK_MDATE_LEAD,'
      '                               diff,'
      '                               is_book_rests,'
      '                               0 as is_gauged,'
      '                               typ,'
      '                               book_in_out,'
      '                               book_amount, '
      '                               RN as book_rn,'
      '                               to_char(null) as product_name,'
      
        '                               to_number(null) as LITRES_ALL_TUB' +
        'ES,'
      '                               rail_loss,'
      '                               volume,'
      
        '                               lack                             ' +
        '  '
      '                          from (select Q.fuel_id,'
      '                                       Q.fuel_name,'
      '                                       Q.MDATE as MDATE,'
      '                                       Q.numb as numb,'
      
        '                                       row_number() over(partiti' +
        'on by Q.FUEL_ID order by Q.MDATE, Q.IN_OUT, Q.P_TRANS_ID) as RN,' +
        '                                       '
      
        '                                       sum(AMOUNT * IN_OUT) over' +
        '(partition by Q.FUEL_ID order by Q.MDATE, Q.IN_OUT, Q.P_TRANS_ID' +
        ') as CURAMOUNT,'
      '                                       0 as diff,'
      '                                       decode(row_number()'
      
        '                                              over(partition by ' +
        'Q.FUEL_ID order by Q.MDATE desc, Q.IN_OUT desc, Q.P_TRANS_ID des' +
        'c),'
      '                                              1,'
      '                                              1,'
      
        '                                              0) as is_book_rest' +
        's,'
      '                                       0 as typ,'
      '                                       in_out as book_in_out,'
      
        '                                       in_out*AMOUNT as book_amo' +
        'unt,'
      
        '                                       rail_prih_loss rail_loss,' +
        ' /* '#1053#1077#1076#1086#1089#1090#1072#1095#1072' '#1087#1086' '#1087#1088#1080#1093#1086#1076#1072#1084' '#1046#1044' */'
      
        '                                       auto_out_volume volume, /' +
        '*'#1051#1080#1090#1088#1099' '#1058#1058#1053'*/'
      
        '                                       auto_prih_loss lack      ' +
        '                                 '
      '                                  from v_oil_rez_book_rest Q'
      
        '                                 where Q.UnionNum in (0, 6, 7/*,' +
        ' 8*/)'
      
        '                                   and (trunc(MDATE) <= :end_dat' +
        'e or MDATE is null)'
      '                          /*         and Q.org_inst = org_inst'
      '                                   and Q.inst = org_inst*/'
      
        '                                   and (Q.fuel_id = :fuel_id or ' +
        ':fuel_id = 0)) Q0) Q1) Q2) Q3'
      
        ')Q4 where (trunc(MDATE) between :begin_date and :end_date or is_' +
        'book_rests = 1 or is_gauged = 1 or MDATE is null)'
      ' ORDER BY Q4.fuel_id, Q4.MDATE'
      ')Q5'
      ') '
      ' where typ=1'
      '))Y,'
      '(select        count(TANK_FROM) count_rez, oil_npg_id,mm from'
      '(select distinct tanks.TANK_FROM, vp.oil_npg_id,mm from'
      '(select distinct *'
      '  from (SELECT distinct TF.TANK_NAME TANK_FROM,'
      '                        p.product_group,'
      
        '                        to_char(nvl(t.tr_date,:begin_date),'#39'MM'#39')' +
        ' as MM'
      '          FROM TRANSFER T, TANK TF, TANK TT, PRODUCT P'
      
        '         WHERE trunc(T.TR_DATE) between :begin_date and :end_dat' +
        'e AND '
      '           T.PARENT_ID IS NULL'
      '           AND TF.TANK_ID = T.TANK_FROM'
      '           AND TT.TANK_ID = T.TANK_TO'
      '           AND P.PRODUCT_ID = T.PRODUCT_FROM'
      '        union all'
      '        SELECT distinct TT.TANK_NAME TANK_TO,'
      '                        p.product_group,'
      
        '                        to_char(nvl(t.tr_date,:begin_date),'#39'MM'#39')' +
        ' as MM'
      '          FROM TRANSFER T, TANK TF, TANK TT, PRODUCT P'
      
        '         WHERE trunc(T.TR_DATE) between :begin_date and :end_dat' +
        'e AND '
      '           T.PARENT_ID IS NULL'
      '           AND TF.TANK_ID = T.TANK_FROM'
      '           AND TT.TANK_ID = T.TANK_TO'
      '           AND P.PRODUCT_ID = T.PRODUCT_FROM)) tanks,'
      '       v_product vp'
      ' where TANK_from <> '#39#1073#1077#1085#1079#1086#1074#1086#1079#1099#39
      '   and TANK_from <> '#39#1078#1076' '#1087#1088#1080#1093#1086#1076#39
      '   and TANK_from <> '#39'22'#39
      '   and TANK_from <> '#39'24'#39
      '   and TANK_from <> '#39'23'#39
      '   and TANK_from <> '#39'25'#39
      '   and tanks.product_group= vp.product_group_id'
      'group by   vp.oil_npg_id, tanks.TANK_FROM,mm)'
      'group by oil_npg_id,mm)Z'
      'where Y.fuel_id = Z.oil_npg_id(+)'
      ' and Y.mm = Z.mm(+)'
      ' and (sign(fuel_id)=1 or fuel_id='#39'-28'#39')'
      '-- and not(last_diff=0 and diff_of_diff=0)'
      ' and (last_diff<>0 or diff_of_diff<>0)'
      'order by fuel_id,MDATE'
      ')'
      ')'
      ''
      '      union all'
      
        '                (select INITCAP(trim(to_char(to_date(lpad(rownum' +
        ',2,'#39'0'#39'),'#39'MM'#39'), '#39'month'#39', '#39'nls_date_language=russian'#39')))||to_char(' +
        'sysdate,'#39' YYYY'#39') as mon,'
      '                       -1 as fuel_id,'
      '                       '#39#1048#1058#1054#1043#1054#39' as fuel_name,'
      '                       to_number(null) as first_diff, '
      '                       to_number(null) as       last_diff,'
      '                       to_number(null) as       diff_of_diff,'
      '                       to_number(null) as       mixing, '
      '                       to_number(null) as       income,'
      '                       to_number(null) as       lack,'
      
        '                       to_number(null) as       rail_loss_sum,  ' +
        '   '
      '                       to_number(null) as       deltaweight,'
      '                       to_number(null) as       volume2,    '
      '                       to_number(null) as       loading_loss,'
      '                       to_number(null) as       LOSTSUM,'
      '                       to_number(null) as count_rez,'
      '                       to_number(null) as LOSTFROMONE,'
      '                       to_number(null) as LOSTFROMONEDAY,  '
      '                       0 as is_have_det,'
      '                       lpad(rownum,2,'#39'0'#39') as MM'
      '                  from all_objects'
      '                 where rownum <= 12'
      '                 union all'
      '                select '#39'C '#1085#1072#1095#1072#1083#1072' '#1075#1086#1076#1072#39' as mon,'
      '                       id as fuel_id,'
      
        '                       decode(name,'#39#1087#1088#1086#1095#1077#1077#39','#39#1060#1088#1072#1082#1094#1080#1103' '#1083#1077#1075#1082#1072#1103#39',nam' +
        'e) as fuel_name,'
      '--                       name as fuel_name,'
      '                       to_number(null) as first_diff, '
      '                       to_number(null) as       last_diff,'
      '                       to_number(null) as       diff_of_diff,'
      '                       to_number(null) as       mixing, '
      '                       to_number(null) as       income,'
      '                       to_number(null) as       lack,'
      
        '                       to_number(null) as       rail_loss_sum,  ' +
        '   '
      '                       to_number(null) as       deltaweight,'
      '                       to_number(null) as       volume2,    '
      '                       to_number(null) as       loading_loss,'
      '                       to_number(null) as       LOSTSUM,'
      '                       to_number(null) as count_rez,'
      '                       to_number(null) as LOSTFROMONE,'
      '                       to_number(null) as LOSTFROMONEDAY,  '
      '                       0 as is_have_det,'
      '                       '#39'13'#39' as MM'
      '                  from oil_np_group'
      '                 union all'
      '                select '#39'C '#1085#1072#1095#1072#1083#1072' '#1075#1086#1076#1072#39' as mon,'
      '                       -1 as fuel_id,'
      '                       '#39#1048#1058#1054#1043#1054#39' as fuel_name,'
      '                       to_number(null) as first_diff, '
      '                       to_number(null) as       last_diff,'
      '                       to_number(null) as       diff_of_diff,'
      '                       to_number(null) as       mixing, '
      '                       to_number(null) as       income,'
      '                       to_number(null) as       lack,'
      
        '                       to_number(null) as       rail_loss_sum,  ' +
        '   '
      '                       to_number(null) as       deltaweight,'
      '                       to_number(null) as       volume2,    '
      '                       to_number(null) as       loading_loss,'
      '                       to_number(null) as       LOSTSUM,'
      '                       to_number(null) as count_rez,'
      '                       to_number(null) as LOSTFROMONE,'
      '                       to_number(null) as LOSTFROMONEDAY,  '
      '                       0 as is_have_det,'
      '                       '#39'13'#39' as MM'
      '                  from dual )'
      '))'
      'where first_diff is not null'
      
        'order by MM, is_have_det desc nulls last, decode(fuel_id, -1,-1,' +
        ' 0) desc, fuel_name')
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'end_date'
      end
      item
        DataType = ftDateTime
        Name = 'begin_date'
      end
      item
        DataType = ftInteger
        Name = 'fuel_id'
      end>
    object qMON: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094
      DisplayWidth = 30
      FieldName = 'Mon'
      Size = 89
    end
    object qFUEL_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      DisplayWidth = 30
      FieldName = 'FUEL_NAME'
      Size = 89
    end
    object qFIRST_DIFF: TFloatField
      DisplayLabel = #1044#1072#1085#1085#1099#1077' '#1086#1090#1095#1077#1090#1072' '#1056'-1|'#1085#1072' '#1085#1072#1095#1072#1083#1086
      FieldName = 'FIRST_DIFF'
    end
    object qLAST_DIFF: TFloatField
      DisplayLabel = #1044#1072#1085#1085#1099#1077' '#1086#1090#1095#1077#1090#1072' '#1056'-1|'#1085#1072' '#1082#1086#1085#1077#1094
      FieldName = 'LAST_DIFF'
    end
    object qDIFF_OF_DIFF: TFloatField
      DisplayLabel = #1056#1072#1079#1085#1080#1094#1072' '#1087#1086' '#1086#1090#1095#1077#1090#1091' '#1056'-1'
      FieldName = 'DIFF_OF_DIFF'
    end
    object qMIXING: TFloatField
      DisplayLabel = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'|'#1055#1077#1088#1077#1075#1088#1091#1087#1080#1088#1086#1074#1082#1072
      DisplayWidth = 20
      FieldName = 'MIXING'
    end
    object qINCOME: TFloatField
      FieldName = 'INCOME'
      Visible = False
    end
    object qLACK: TFloatField
      DisplayLabel = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'|'#1055#1088#1080#1093#1086#1076' '#1040#1074#1090#1086
      FieldName = 'LACK'
    end
    object qRAIL_LOSS_SUM: TFloatField
      DisplayLabel = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'|'#1056#1072#1079#1085#1080#1094#1072' '#1087#1088#1080' '#1087#1088#1080#1105#1084#1077
      FieldName = 'RAIL_LOSS_SUM'
    end
    object qDELTAWEIGHT: TFloatField
      DisplayLabel = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'|'#1055#1088#1080#1088#1086#1089#1090' '#1085#1072' '#1091#1076#1077#1083#1072#1093
      FieldName = 'DELTAWEIGHT'
    end
    object qVOLUME2: TFloatField
      DisplayLabel = #1051#1080#1090#1088#1099
      FieldName = 'VOLUME2'
    end
    object qLOADING_LOSS: TFloatField
      DisplayLabel = #1055#1086#1090#1077#1088#1080' '#1072#1074#1090#1086#1085#1072#1083#1080#1074
      FieldName = 'LOADING_LOSS'
    end
    object qLOSTSUM: TFloatField
      FieldName = 'LOSTSUM'
    end
    object qCOUNT_REZ: TFloatField
      FieldName = 'COUNT_REZ'
    end
    object qLOSTFROMONE: TFloatField
      FieldName = 'LOSTFROMONE'
    end
    object qLOSTFROMONEDAY: TFloatField
      FieldName = 'LOSTFROMONEDAY'
    end
    object qMM: TStringField
      FieldName = 'MM'
      Size = 2
    end
    object qFUEL_ID: TFloatField
      FieldName = 'FUEL_ID'
    end
    object qIS_HAVE_DET: TFloatField
      FieldName = 'IS_HAVE_DET'
    end
  end
  inherited qDetail: TOilQuery
    SQL.Strings = (
      '--29.09.2010'
      'select    '
      
        '       decode(Y.fuel_name,'#39#1060#1088'.'#1083#1077#1075'.'#39','#39#1060#1088#1072#1082#1094#1080#1103' '#1083#1077#1075#1082#1072#1103#39',Y.fuel_name' +
        ') as fuel_name,'
      '       decode(Y.fuel_id,'#39'-28'#39',-28,Y.fuel_id) as fuel_id,'
      '       Y.mm,'
      '       Y.mdate as mdate,'
      '       Y.first_diff first_diff, '
      
        '       nvl(Y.last_diff,0) as last_diff, --'#1085#1072' '#1089#1072#1084#1086#1084' '#1076#1077#1083#1077' '#1101#1090#1086' '#1087#1088#1077#1076 +
        ' '#1088#1072#1079#1085#1080#1094#1072
      '       nvl(Y.diff_of_diff,0) as diff_of_diff,'
      '       nvl(Y.mixing,0) as mixing, '
      '       nvl(Y.income,0) as income,'
      '       nvl(Y.rail_loss_sum,0) as rail_loss_sum,'
      
        '--       nvl(sum(rail_loss_sum) over(partition by mdate, fuel_id' +
        '),0) as rail_loss_sum_new,'
      '       nvl(Y.lack,0) as lack,           '
      '       nvl(Y.volume2,0) as volume2,    '
      
        '--       nvl((round(volume2 *nvl(koef,0.002),0)),0) as deltaweig' +
        'ht,    '
      
        '       nvl((round(volume2 * nvl(koef,0.002),0)),0) as deltaweigh' +
        't,'
      
        '       nvl((round(volume2/1e3*decode(fuel_id,3,0.02,0.2),0)),0) ' +
        '   as loading_loss,'
      
        '       round(nvl(Y.diff_of_diff,0) - nvl(Y.mixing,0) - nvl(Y.inc' +
        'ome,0) - nvl(Y.lack,0) - nvl(Y.rail_loss_sum,0) - nvl(round(volu' +
        'me2 * nvl(koef,0.002),0),0),0) as LOSTSUM,'
      '       nvl(Z.count_rez,1) count_rez,'
      
        '       round(-1*(nvl(Y.diff_of_diff,0) - nvl(Y.mixing,0) - nvl(Y' +
        '.income,0) - nvl(Y.lack,0) - nvl(Y.rail_loss_sum,0) - nvl(round(' +
        'volume2 *nvl(koef,0.002),0),0)+nvl(round(volume2/1e3*decode(fuel' +
        '_id,3,0.02,0.2),2),0))/nvl(Z.count_rez,1),0) as LOSTFROMONE,'
      
        '       round(-1*(nvl(Y.diff_of_diff,0) - nvl(Y.mixing,0) - nvl(Y' +
        '.income,0) - nvl(Y.lack,0) - nvl(Y.rail_loss_sum,0) - nvl(round(' +
        'volume2 *nvl(koef,0.002),0),0)+nvl(round(volume2/1e3*decode(fuel' +
        '_id,3,0.02,0.2),2),0))/nvl(Z.count_rez,1)/31,0) as LOSTFROMONEDA' +
        'Y'
      'from'
      '('
      'select '
      'to_char(nvl(MDATE,'#39'01.01.2010'#39'),'#39'MM'#39') as MM,'
      'MDATE,FUEL_ID,FUEL_NAME,'
      
        '(select max(t.koef) from oil_koef_ud_weight t where fuel_id=t.np' +
        '_group_id and trunc(mdate) between t.date_from and t.date_to) as' +
        ' koef,'
      'first_diff,'
      'lag(first_diff) over(order by fuel_id,  mdate) last_diff,'
      
        'first_diff - lag(first_diff) over(order by fuel_id, mdate) diff_' +
        'of_diff,'
      '0 mixing,'
      '0 income,'
      'rail_loss_sum,'
      'volume2,'
      'lack'
      'from('
      '--'
      'select MDATE, '
      'typ,'
      'FUEL_ID,FUEL_NAME,'
      'DIFF first_diff,'
      'rail_loss_sum,'
      'volume2,'
      'lack'
      'from'
      '(select trunc(MDATE) mdate, '
      '--mdate,'
      'typ,'
      'FUEL_ID,FUEL_NAME,DIFF,'
      
        '-sum(rail_loss)over(partition by fuel_id,trunc(mdate)) rail_loss' +
        '_sum,'
      'sum(VOLUME)over(partition by fuel_id,trunc(mdate))volume2,'
      '-sum(LACK)over(partition by fuel_id,trunc(mdate))lack'
      '--,RAIL_LOSS,VOLUME,LACK,q5.*'
      'from('
      
        'select nvl(LITRES_ALL_POINTS, trunc(Q4.fact_diff_date_ratio * Q4' +
        '.fact_diff_litres) + LITRES_ALL_CONTINUOS) as LITRES_ALL,'
      
        '       nvl(CURAMOUNT_POINTS, trunc(Q4.book_diff_date_ratio * Q4.' +
        'book_diff_litres) + CURAMOUNT_CONTINUOS) as CURAMOUNT,'
      
        '       max(DIFF_ON_FACT)over(partition by fuel_id, fact_typ_sum)' +
        ' as DIFF,'
      
        '       max(CURAMOUNT_ON_FACT)over(partition by fuel_id, fact_typ' +
        '_sum) as CURAMOUNT_ON_FACT_CONTINUOS,'
      
        '       (nvl(LITRES_ALL_POINTS, trunc(Q4.fact_diff_date_ratio * Q' +
        '4.fact_diff_litres) + LITRES_ALL_CONTINUOS)) /*as LITRES_ALL*/ '
      
        '         - (nvl(CURAMOUNT_POINTS, trunc(Q4.book_diff_date_ratio ' +
        '* Q4.book_diff_litres) + CURAMOUNT_CONTINUOS)) /*as CURAMOUNT*/ ' +
        'as DIFF_APROX,'
      
        '       trunc(row_number()over(partition by fuel_id ORDER BY Q4.M' +
        'DATE)/greatest(count(*)over(partition by fuel_id),1)*100) as rn,'
      '       case '
      '         when trunc(MDATE) between :begin_date and :end_date '
      '           then 1 '
      '           else 0'
      '        end as is_chart,       '
      '       Q4.*'
      '  from ('
      'select Q3.*,'
      
        '       max(LITRES_ALL_) over(partition by fuel_id, fact_typ_sum)' +
        ' as LITRES_ALL_CONTINUOS,'
      
        '       LITRES_ALL_ - max(CURAMOUNT_) over(partition by fuel_id, ' +
        'book_typ_num) as DIFF_ON_FACT,'
      
        '       decode(LITRES_ALL_,null,null, max(CURAMOUNT_) over(partit' +
        'ion by fuel_id, book_typ_num)) as CURAMOUNT_ON_FACT,'
      
        '       max(product_name_) over(partition by fuel_id, fact_typ_su' +
        'm) as PRODUCT_NAME,       '
      
        '       max(TEMPER) over(partition by fuel_id, fact_typ_sum) as T' +
        'EMPER_CONTINUOS,'
      
        '       max(CURAMOUNT_) over(partition by fuel_id, book_typ_num) ' +
        'as CURAMOUNT_CONTINUOS,'
      
        '       nvl((-max(LITRES_ALL_) over(partition by fuel_id, fact_ty' +
        'p_sum) /*as LITRES_ALL*/ + max(FACT_ALL_LEAD) over(partition by ' +
        'fuel_id, fact_typ_sum)),0)'
      '         as fact_diff_litres,   '
      
        '       nvl((-max(CURAMOUNT_) over(partition by fuel_id, book_typ' +
        '_num) /*as LITRES_ALL*/ + max(BOOK_ALL_LEAD) over(partition by f' +
        'uel_id, book_typ_num)),0)'
      '         as book_diff_litres,                '
      
        '       nvl(round((mdate - min(mdate) over(partition by fuel_id, ' +
        'fact_typ_sum)/* as MDATE_FACT*/ + 1e-10) /'
      
        '         (min(FACT_MDATE_LEAD) over(partition by fuel_id, fact_t' +
        'yp_sum) /*as MDATE_LEAD*/ - min(mdate) over(partition by fuel_id' +
        ', fact_typ_sum) + 1e-10)/* as MDATE_FACT*/,4),0) '
      '         as fact_diff_date_ratio,     '
      
        '       nvl(round((mdate - min(mdate) over(partition by fuel_id, ' +
        'book_typ_num)/* as MDATE_FACT*/ + 1e-10) /'
      
        '         (min(BOOK_MDATE_LEAD) over(partition by fuel_id, book_t' +
        'yp_num) /*as MDATE_LEAD*/ - min(mdate) over(partition by fuel_id' +
        ', book_typ_num) + 1e-10)/* as MDATE_FACT*/,4),0) '
      '         as book_diff_date_ratio,   '
      '       mdate as mdate2,'
      
        '       min(mdate) over(partition by fuel_id, book_typ_num)/* as ' +
        'MDATE_FACT*/ as min_mdate_,'
      
        '       min(BOOK_MDATE_LEAD) over(partition by fuel_id, book_typ_' +
        'num) /*as MDATE_LEAD*/as min_BOOK_MDATE_LEAD_,          '
      '       LITRES_ALL_ as LITRES_ALL_POINTS,'
      '       CURAMOUNT_ as CURAMOUNT_POINTS'
      
        '  from (select sum(typ) over(partition by fuel_id order by numc)' +
        ' as fact_typ_sum,'
      
        '               sum(1 - typ) over(partition by fuel_id order by n' +
        'umc) as book_typ_num,'
      
        '               trunc(sysdate - max(MDATE_Valid) over(partition b' +
        'y fuel_id)) as valid,'
      '               Q2.*'
      '          from (select Q1.*,'
      
        '                       row_number() over(partition by fuel_id or' +
        'der by MDATE, book_rn) as numc           '
      '                  from (select /*+ORDERED*/ '
      '                               f.fuel_id,'
      '                               f.fuel_name,'
      '                               f.MDATE,'
      '                               to_date(null) as MDATE_Valid,'
      '                               f.MDATE_OUT,'
      '                               to_char(null) as numb,'
      '                               to_number(null) as CURAMOUNT_,'
      '                               sum(f.LITRES_ALL) as LITRES_ALL_,'
      '                               round(avg(f.temper),1) as temper,'
      
        '                               lead(sum(f.LITRES_ALL)) over(part' +
        'ition by f.fuel_id order by f.MDATE) as FACT_ALL_LEAD,'
      
        '                               lead(f.MDATE) over(partition by f' +
        '.fuel_id order by f.MDATE) as FACT_MDATE_LEAD,'
      '                               to_number(null) as BOOK_ALL_LEAD,'
      
        '                               to_date(null) as BOOK_MDATE_LEAD,' +
        '                              '
      '                               0 as diff_,'
      '                               0 as is_book_rests,'
      
        '                               decode(row_number() over(partitio' +
        'n by f.fuel_id order by f.MDATE desc), 1, 1, 0) as is_gauged,   ' +
        '                            '
      '                               1 as typ,'
      '                               to_number(null) as book_in_out,'
      '                               to_number(null) as book_amount, '
      '                               to_number(null) as book_rn,'
      
        '                               substr(max(to_char(f.MDATE, '#39'yyyy' +
        'mmdd'#39') || f.product_name),9) as product_name_,'
      
        '                               sum(f.is_tube*f.LITRES_ALL) as LI' +
        'TRES_ALL_TUBES,'
      '                               to_number(null) rail_loss,'
      '                               to_number(null) volume,'
      
        '                               to_number(null) lack             ' +
        '                  '
      '                          from v_oil_rez_fact_rest f'
      
        '                         where /*trunc(f.MDATE) between :begin_d' +
        'ate and :end_date'
      '                           and*/ trunc(f.MDATE) < :end_date    '
      '/*                           and f.org_inst = org_inst'
      '                           and f.inst = org_inst*/'
      
        '                           and (f.fuel_id = :fuel_id or :fuel_id' +
        ' = 0)'
      
        '                         group by f.fuel_id, f.fuel_name, f.MDAT' +
        'E, f.MDATE_OUT                                        '
      '                        union all'
      '                        select f.fuel_id  as fuel_id,'
      '                               f.fuel_name  as fuel_name,'
      '                               f.mdate as MDATE,'
      '                               f.mdate as MDATE_Valid,'
      
        '                               to_char(MDATE, '#39'dd.mm   hh24:mi'#39')' +
        ' as MDATE_OUT,'
      '                               to_char(null) as numb,'
      '                               sum(f.litres_all) as CURAMOUNT,'
      '                               to_number(null) as LITRES_ALL,'
      '                               to_number(null) as temper,'
      '                               to_number(null) as FACT_ALL_LEAD,'
      '                               to_date(null) as FACT_MDATE_LEAD,'
      
        '                               sum(f.litres_all) - lead(sum(f.li' +
        'tres_all)) over(partition by fuel_id order by MDATE) as BOOK_ALL' +
        '_LEAD,                                                          ' +
        '    '
      
        '                               lead(MDATE) over(partition by fue' +
        'l_id order by MDATE) as BOOK_MDATE_LEAD,                        ' +
        '      '
      '                               0 as diff_,'
      '                               decode(row_number()'
      
        '                                              over(partition by ' +
        'FUEL_ID order by MDATE desc),'
      '                                              1,'
      '                                              1,'
      
        '                                              0) as is_book_rest' +
        's,'
      
        '                               0 as is_gauged,                  ' +
        '             '
      '                               0 as typ,'
      '                               to_number(null) as book_in_out,'
      '                               to_number(null) as book_amount,'
      
        '                               row_number() over(partition by f.' +
        'fuel_id order by f.MDATE) as book_rn,'
      '                               to_char(null) as product_name_,'
      
        '                               to_number(null) as LITRES_ALL_TUB' +
        'ES,'
      '                               to_number(null) rail_loss,'
      '                               to_number(null) volume,'
      
        '                               to_number(null) lack             ' +
        '                  '
      '                          from v_oil_rez_fact_rest f'
      
        '                         where ((numb in ('#39'87'#39','#39'88'#39') and inst = ' +
        '624)or(inst <> 624))  '
      
        '--                           and trunc(f.MDATE) between :begin_d' +
        'ate and :end_date'
      
        '                           and trunc(f.MDATE) < :end_date       ' +
        '                    '
      '/*                           and f.org_inst = org_inst'
      '                           and f.inst = org_inst*/'
      
        '                           and (f.fuel_id = :fuel_id or :fuel_id' +
        ' = 0)                                '
      
        '                         group by f.mdate, f.fuel_id, f.fuel_nam' +
        'e'
      '                         '
      '                        union all'
      '                        select fuel_id,'
      '                               fuel_name,'
      '                               MDATE as MDATE,'
      '                               MDATE as MDATE_Valid,'
      
        '                               to_char(MDATE, '#39'dd.mm   hh24:mi'#39')' +
        ' as MDATE_OUT,'
      '                               to_char(null) as numb,'
      '                               CURAMOUNT,'
      '                               to_number(null) as LITRES_ALL,'
      '                               to_number(null) as temper,'
      '                               to_number(null) as FACT_ALL_LEAD,'
      '                               to_date(null) as FACT_MDATE_LEAD,'
      
        '                               lead(CURAMOUNT) over(partition by' +
        ' FUEL_ID order by RN) as BOOK_ALL_LEAD,                         ' +
        '                                     '
      
        '                               lead(MDATE) over(partition by FUE' +
        'L_ID order by RN) as BOOK_MDATE_LEAD,'
      '                               diff,'
      '                               is_book_rests,'
      '                               0 as is_gauged,'
      '                               typ,'
      '                               book_in_out,'
      '                               book_amount, '
      '                               RN as book_rn,'
      '                               to_char(null) as product_name,'
      
        '                               to_number(null) as LITRES_ALL_TUB' +
        'ES,'
      '                               rail_loss,'
      '                               volume,'
      
        '                               lack                             ' +
        '  '
      '                          from (select Q.fuel_id,'
      '                                       Q.fuel_name,'
      '                                       Q.MDATE as MDATE,'
      '                                       Q.numb as numb,'
      
        '                                       row_number() over(partiti' +
        'on by Q.FUEL_ID order by Q.MDATE, Q.IN_OUT, Q.P_TRANS_ID) as RN,' +
        '                                       '
      
        '                                       sum(AMOUNT * IN_OUT) over' +
        '(partition by Q.FUEL_ID order by Q.MDATE, Q.IN_OUT, Q.P_TRANS_ID' +
        ') as CURAMOUNT,'
      '                                       0 as diff,'
      '                                       decode(row_number()'
      
        '                                              over(partition by ' +
        'Q.FUEL_ID order by Q.MDATE desc, Q.IN_OUT desc, Q.P_TRANS_ID des' +
        'c),'
      '                                              1,'
      '                                              1,'
      
        '                                              0) as is_book_rest' +
        's,'
      '                                       0 as typ,'
      '                                       in_out as book_in_out,'
      
        '                                       in_out*AMOUNT as book_amo' +
        'unt,'
      
        '                                       rail_prih_loss rail_loss,' +
        ' /* '#1053#1077#1076#1086#1089#1090#1072#1095#1072' '#1087#1086' '#1087#1088#1080#1093#1086#1076#1072#1084' '#1046#1044' */'
      
        '                                       auto_out_volume volume, /' +
        '*'#1051#1080#1090#1088#1099' '#1058#1058#1053'*/'
      
        '                                       auto_prih_loss lack      ' +
        '                                 '
      '                                  from v_oil_rez_book_rest Q'
      
        '                                 where Q.UnionNum in (0, 6, 7/*,' +
        ' 8*/)'
      
        '                                   and (trunc(MDATE) <= :end_dat' +
        'e or MDATE is null)'
      '                          /*         and Q.org_inst = org_inst'
      '                                   and Q.inst = org_inst*/'
      
        '                                   and (Q.fuel_id = :fuel_id or ' +
        ':fuel_id = 0)) Q0) Q1) Q2) Q3'
      
        ')Q4 where (trunc(MDATE) between :begin_date and :end_date or is_' +
        'book_rests = 1 or is_gauged = 1 or MDATE is null)'
      ' ORDER BY Q4.fuel_id, Q4.MDATE'
      ')Q5'
      ') '
      ' where typ=1'
      '--'
      '))Y,'
      '(select        count(TANK_FROM) count_rez, oil_npg_id,mm from'
      '(select distinct tanks.TANK_FROM, vp.oil_npg_id,mm from'
      '(select distinct *'
      '  from (SELECT distinct TF.TANK_NAME TANK_FROM,'
      '                        p.product_group,'
      
        '                        to_char(nvl(t.tr_date,:begin_date),'#39'MM'#39')' +
        ' as MM'
      '          FROM TRANSFER T, TANK TF, TANK TT, PRODUCT P'
      
        '         WHERE trunc(T.TR_DATE) between :begin_date and :end_dat' +
        'e AND '
      '           T.PARENT_ID IS NULL'
      '           AND TF.TANK_ID = T.TANK_FROM'
      '           AND TT.TANK_ID = T.TANK_TO'
      '           AND P.PRODUCT_ID = T.PRODUCT_FROM'
      '        union all'
      '        SELECT distinct TT.TANK_NAME TANK_TO,'
      '                        p.product_group,'
      
        '                        to_char(nvl(t.tr_date,:begin_date),'#39'MM'#39')' +
        ' as MM'
      '          FROM TRANSFER T, TANK TF, TANK TT, PRODUCT P'
      
        '         WHERE trunc(T.TR_DATE) between :begin_date and :end_dat' +
        'e AND '
      '           T.PARENT_ID IS NULL'
      '           AND TF.TANK_ID = T.TANK_FROM'
      '           AND TT.TANK_ID = T.TANK_TO'
      '           AND P.PRODUCT_ID = T.PRODUCT_FROM)) tanks,'
      '       v_product vp'
      ' where TANK_from <> '#39#1073#1077#1085#1079#1086#1074#1086#1079#1099#39
      '   and TANK_from <> '#39#1078#1076' '#1087#1088#1080#1093#1086#1076#39
      '   and TANK_from <> '#39'22'#39
      '   and TANK_from <> '#39'24'#39
      '   and TANK_from <> '#39'23'#39
      '   and TANK_from <> '#39'25'#39
      '   and tanks.product_group= vp.product_group_id'
      'group by   vp.oil_npg_id, tanks.TANK_FROM,mm)'
      'group by oil_npg_id,mm)Z'
      'where Y.fuel_id = Z.oil_npg_id(+)'
      ' and Y.mm = Z.mm(+)'
      ' and (sign(fuel_id)=1 or fuel_id='#39'-28'#39')'
      ' and not(last_diff=0 and diff_of_diff=0)'
      '-- and (last_diff<>0 or diff_of_diff<>0)'
      ' and mdate>=:begin_date+1'
      'order by fuel_id,MDATE')
    MasterSource = nil
    MasterFields = ''
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'begin_date'
      end
      item
        DataType = ftDateTime
        Name = 'end_date'
      end
      item
        DataType = ftInteger
        Name = 'fuel_id'
      end>
    object qDetailFUEL_NAME: TStringField
      FieldName = 'FUEL_NAME'
      Size = 89
    end
    object qDetailFUEL_ID: TFloatField
      FieldName = 'FUEL_ID'
    end
    object qDetailMDATE: TDateTimeField
      FieldName = 'MDATE'
    end
    object qDetailMM: TStringField
      FieldName = 'MM'
      Size = 2
    end
    object qDetailFIRST_DIFF: TFloatField
      FieldName = 'FIRST_DIFF'
    end
    object qDetailLAST_DIFF: TFloatField
      FieldName = 'LAST_DIFF'
    end
    object qDetailDIFF_OF_DIFF: TFloatField
      FieldName = 'DIFF_OF_DIFF'
    end
    object qDetailMIXING: TFloatField
      FieldName = 'MIXING'
    end
    object qDetailINCOME: TFloatField
      FieldName = 'INCOME'
    end
    object qDetailRAIL_LOSS_SUM: TFloatField
      FieldName = 'RAIL_LOSS_SUM'
    end
    object qDetailLACK: TFloatField
      FieldName = 'LACK'
    end
    object qDetailVOLUME2: TFloatField
      FieldName = 'VOLUME2'
    end
    object qDetailDELTAWEIGHT: TFloatField
      FieldName = 'DELTAWEIGHT'
    end
    object qDetailLOADING_LOSS: TFloatField
      FieldName = 'LOADING_LOSS'
    end
    object qDetailLOSTSUM: TFloatField
      FieldName = 'LOSTSUM'
    end
    object qDetailCOUNT_REZ: TFloatField
      FieldName = 'COUNT_REZ'
    end
    object qDetailLOSTFROMONE: TFloatField
      FieldName = 'LOSTFROMONE'
    end
    object qDetailLOSTFROMONEDAY: TFloatField
      FieldName = 'LOSTFROMONEDAY'
    end
  end
  inherited dsDetail: TOraDataSource
    Left = 196
  end
end
