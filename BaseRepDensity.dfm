inherited BaseRepDensityForm: TBaseRepDensityForm
  Left = 231
  Top = 169
  Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1080
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
      Width = 470
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
          Footers = <>
          Width = 19
        end
        item
          EditButtons = <>
          FieldName = 'NP_NAME'
          Footers = <>
          Title.Caption = #1055#1088#1086#1076#1091#1082#1090
          Width = 101
        end
        item
          DisplayFormat = ',0.000'
          EditButtons = <>
          FieldName = 'PRIH'
          Footer.DisplayFormat = ',0.000'
          Footers = <>
          Title.Caption = #1055#1088#1080#1093#1086#1076', '#1090
          Width = 100
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'LITR_20_PRIH'
          Footers = <>
          Title.Caption = #1055#1088#1080#1093#1086#1076' '#1087#1088#1080' 20'#1057', '#1083
        end
        item
          DisplayFormat = ',0.0000'
          EditButtons = <>
          FieldName = 'DENSITY_PRIH'
          Footers = <>
          Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080#1093#1086#1076#1072
        end
        item
          DisplayFormat = ',0.000'
          EditButtons = <>
          FieldName = 'RASH'
          Footer.DisplayFormat = ',0.000'
          Footers = <>
          Title.Caption = #1056#1072#1089#1093#1086#1076', '#1090
          Width = 100
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'LITR_20_RASH'
          Footers = <>
          Title.Caption = #1056#1072#1089#1093#1086#1076' '#1087#1088#1080' 20'#1057', '#1083
        end
        item
          DisplayFormat = ',0.0000'
          EditButtons = <>
          FieldName = 'DENSITY_RASH'
          Footers = <>
          Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1088#1072#1089#1093#1086#1076#1072
        end
        item
          DisplayFormat = ',0.000'
          EditButtons = <>
          FieldName = 'DELTA_MASS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Footers = <>
          Title.Caption = #1047#1072#1074#1099#1096#1077#1085#1080#1077', '#1090
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 92
        end
        item
          DisplayFormat = ',0.0000'
          EditButtons = <>
          FieldName = 'DELTA_DENSITY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Footers = <>
          Title.Caption = #1047#1072#1074#1099#1096#1077#1085#1080#1077' '#1087#1083#1086#1090#1085#1086#1089#1090#1100
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 79
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'DELTA_LITR_PRIH'
          Footers = <>
          Title.Caption = #1056#1072#1089#1093#1086#1076' '#1074' '#1083' '#1087#1086' '#1087#1083#1086#1090#1085#1086#1089#1090#1080' '#1087#1088#1080#1093#1086#1076#1086#1074
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'DELTA_LITR_RASH'
          Footers = <>
          Title.Caption = #1056#1072#1089#1093#1086#1076' '#1074' '#1083' '#1087#1086' '#1087#1083#1086#1090#1085#1086#1089#1090#1080' '#1088#1072#1089#1093#1086#1076#1086#1074
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'DELTA_LITR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Footers = <>
          Title.Caption = #1047#1072#1074#1099#1096#1077#1085#1080#1077', '#1083
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 92
        end>
      inherited RowDetailData: TRowDetailPanelControlEh
        object gDetailDoc: TDBGridEh
          Left = 0
          Top = 21
          Width = 850
          Height = 457
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
          OnGetCellParams = gDetailDocGetCellParams
          OnSortMarkingChanged = DBGrid1SortMarkingChanged
          OnSumListRecalcAll = gDetailDocSumListRecalcAll
          Columns = <
            item
              EditButtons = <>
              FieldName = 'NP_NAME'
              Footer.Value = #1048#1090#1086#1075#1086
              Footer.ValueType = fvtStaticText
              Footers = <>
              Title.Caption = #1055#1088#1086#1076#1091#1082#1090
              Width = 58
            end
            item
              EditButtons = <>
              FieldName = 'MON'
              Footers = <>
              Title.Caption = #1052#1077#1089#1103#1094
              Width = 94
            end
            item
              EditButtons = <>
              FieldName = 'ACT_DATE'
              Footer.ValueType = fvtCount
              Footers = <>
              Title.Caption = #1044#1072#1090#1072
            end
            item
              DisplayFormat = ',0.000'
              EditButtons = <>
              FieldName = 'MASS_PRIH'
              Footer.DisplayFormat = ',0.000'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1055#1088#1080#1093#1086#1076'|'#1055#1088#1080#1093#1086#1076', '#1090
              Width = 80
            end
            item
              DisplayFormat = ',0.0000'
              EditButtons = <>
              FieldName = 'DENSITY_PRIH'
              Footer.DisplayFormat = ',0'
              Footers = <>
              Title.Caption = #1055#1088#1080#1093#1086#1076'|'#1055#1083#1086#1090#1085#1086#1089#1090#1100
            end
            item
              DisplayFormat = ',0.0'
              EditButtons = <>
              FieldName = 'TEMP_PRIH'
              Footer.DisplayFormat = ',0'
              Footers = <>
              Title.Caption = #1055#1088#1080#1093#1086#1076'|'#1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
              Width = 70
            end
            item
              DisplayFormat = ',0.0000'
              EditButtons = <>
              FieldName = 'DENSITY_20_PRIH'
              Footer.DisplayFormat = ',0'
              Footers = <>
              Title.Caption = #1055#1088#1080#1093#1086#1076'|'#1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080' 20'#1057
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'LITR_20_PRIH'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1055#1088#1080#1093#1086#1076'|'#1055#1088#1080#1093#1086#1076' '#1087#1088#1080' 20'#1057', '#1083
              Width = 78
            end
            item
              DisplayFormat = ',0.000'
              EditButtons = <>
              FieldName = 'MASS_RASH'
              Footer.DisplayFormat = ',0.000'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1056#1072#1089#1093#1086#1076'|'#1054#1090#1075#1088#1091#1079#1082#1072', '#1090
              Width = 80
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'LITR_RASH'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1056#1072#1089#1093#1086#1076'|'#1054#1090#1075#1088#1091#1079#1082#1072', '#1083
              Width = 78
            end
            item
              DisplayFormat = ',0.0000'
              EditButtons = <>
              FieldName = 'DENSITY_RASH'
              Footers = <>
              Title.Caption = #1056#1072#1089#1093#1086#1076'|'#1055#1083#1086#1090#1085#1086#1089#1090#1100
            end
            item
              DisplayFormat = ',0.0'
              EditButtons = <>
              FieldName = 'TEMP_RASH'
              Footers = <>
              Title.Caption = #1056#1072#1089#1093#1086#1076'|'#1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
              Width = 70
            end
            item
              DisplayFormat = ',0.0000'
              EditButtons = <>
              FieldName = 'DENSITY_20_RASH'
              Footers = <>
              Title.Caption = #1056#1072#1089#1093#1086#1076'|'#1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080' 20'#1057
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'LITR_20_RASH'
              Footer.DisplayFormat = ',0'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1056#1072#1089#1093#1086#1076'|'#1054#1090#1075#1088#1091#1079#1082#1072' '#1087#1088#1080' 20'#1057', '#1083
              Width = 78
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
    Left = 192
    Top = 124
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select NP_NAME,'
      '       prih,'
      '       litr_20_prih,'
      '       density_prih,'
      '       rash,'
      '       litr_20_rash,'
      '       density_rash,'
      
        '       round(density_prih * (rash / density_prih - rash / densit' +
        'y_rash), 3) delta_mass,'
      '       delta_density,'
      '       round(rash / density_prih * 1e3, 0) delta_litr_prih,'
      '       round(rash / density_rash * 1e3, 0) delta_litr_rash,'
      '       round(rash / density_prih * 1e3, 0) -'
      '       round(rash / density_rash * 1e3, 0) delta_litr,'
      '       1 is_have_det,'
      
        '       decode(np_name, '#39#1040'-80'#39', 5, '#39#1040'-92'#39', 6, '#39#1040'-95'#39', 7, '#39#1044#1058#39', 3,' +
        ' 3) as fuel_id'
      '  from (select NP_NAME,'
      '               sum(mass_prih) prih,'
      '               sum(litr_20_prih) litr_20_prih,'
      
        '               round(sum(mass_prih) / sum(litr_20_prih) * 1000, ' +
        '4) density_prih,'
      '               sum(mass_rash) rash,'
      '               sum(litr_20_rash) litr_20_rash,'
      
        '               round(sum(mass_rash) / sum(litr_20_rash) * 1000, ' +
        '4) density_rash,'
      
        '               round(sum(mass_rash) / sum(litr_20_rash) * 1000, ' +
        '4) -'
      
        '               round(sum(mass_prih) / sum(litr_20_prih) * 1000, ' +
        '4) delta_density'
      '          from ('
      '          ---------------------------------------'
      '          select NP_NAME,'
      '       mon,'
      '       act_date,'
      '       fuel_id,'
      '       max(mass_prih) mass_prih,'
      '       max(density_prih) density_prih,'
      '       max(temp_prih) temp_prih,'
      '       max(density_20_prih) density_20_prih,'
      '       max(litr_20_prih) litr_20_prih,'
      '       max(litr_rash) litr_rash,'
      '       max(mass_rash) mass_rash,'
      '       max(DENSITY_rash) DENSITY_rash,'
      '       max(TEMP_rash) TEMP_rash,'
      '       max(density_20_rash) density_20_rash,'
      '       max(litr_20_rash) litr_20_rash,'
      '       is_have_det,'
      '       MM'
      '  from ('
      '          select t.* from baserepdensity1 t'
      
        '           where mm between to_number(to_char(:begindate, '#39'MM'#39'))' +
        ' and to_number(to_char(:enddate, '#39'MM'#39'))'
      
        '                    and ((act_date between :begindate and :endda' +
        'te) or act_date is null )'
      '        )  '
      
        '        where mm between to_number(to_char(:begindate, '#39'MM'#39')) an' +
        'd to_number(to_char(:enddate, '#39'MM'#39'))'
      ' group by NP_NAME, mon, act_date, fuel_id, MM, is_have_det'
      ' order by fuel_id, MM, act_date, is_have_det'
      ' )'
      ' group by NP_NAME)'
      ' order by NP_NAME')
    Left = 140
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'begindate'
      end
      item
        DataType = ftUnknown
        Name = 'enddate'
      end>
  end
  inherited qDetail: TOilQuery
    SQL.Strings = (
      'select NP_NAME,'
      '       mon,'
      '       act_date,'
      '       fuel_id,'
      '       max(mass_prih) mass_prih,'
      '       max(density_prih) density_prih,'
      '       max(temp_prih) temp_prih,'
      '       max(density_20_prih) density_20_prih,'
      '       max(litr_20_prih) litr_20_prih,'
      '       max(litr_rash) litr_rash,'
      '       max(mass_rash) mass_rash,'
      '       max(DENSITY_rash) DENSITY_rash,'
      '       max(TEMP_rash) TEMP_rash,'
      '       max(density_20_rash) density_20_rash,'
      '       max(litr_20_rash) litr_20_rash,'
      '       is_have_det,'
      '       MM'
      '  from (select NP_NAME,'
      '               mon,'
      '               act_date,'
      '               fuel_id,'
      '               decode(is_have_det,'
      '                      1,'
      '                      mass_prih,'
      
        '                      sum(mass_prih) over(partition by mm, fuel_' +
        'id)) mass_prih,'
      '               density_prih,'
      '               temp_prih,'
      '               density_20_prih,'
      '               decode(is_have_det,'
      '                      1,'
      '                      litr_20_prih,'
      
        '                      sum(litr_20_prih) over(partition by mm, fu' +
        'el_id)) litr_20_prih,'
      '               decode(is_have_det,'
      '                      1,'
      '                      LITR_rash,'
      
        '                      sum(LITR_rash) over(partition by mm, fuel_' +
        'id)) litr_rash,'
      '               decode(is_have_det,'
      '                      1,'
      '                      mass_rash,'
      
        '                      sum(mass_rash) over(partition by mm, fuel_' +
        'id)) mass_rash,'
      '               DENSITY_rash,'
      '               TEMP_rash,'
      '               density_20_rash,'
      '               decode(is_have_det,'
      '                      1,'
      '                      litr_20_rash,'
      
        '                      sum(litr_20_rash) over(partition by mm, fu' +
        'el_id)) litr_20_rash,'
      '               nvl(is_have_det, 0) is_have_det,'
      '               MM'
      '          from ('
      '          select t.* from baserepdensity1 t'
      
        '           where mm between to_number(to_char(:begindate, '#39'MM'#39'))' +
        ' and to_number(to_char(:enddate, '#39'MM'#39'))'
      
        '                    and ((act_date between :begindate and :endda' +
        'te) or act_date is null )'
      '              union all'
      '                select '#39#1048#1058#1054#1043#1054#39' as np_name,'
      
        '                       INITCAP(trim(to_char(to_date(lpad(rownum,' +
        ' 2, '#39'0'#39'),'
      '                                                    '#39'MM'#39'),'
      '                                            '#39'month'#39','
      
        '                                            '#39'nls_date_language=r' +
        'ussian'#39'))) ||'
      '                       to_char(sysdate, '#39' YYYY'#39') as mon,'
      '                       to_date(null) as act_date,'
      '                       to_number(3) as fuel_id,'
      '                       to_number(null) as mass_prih,'
      '                       to_number(null) as density_prih,'
      '                       to_number(null) as temp_prih,'
      '                       to_number(null) as density_20_prih,'
      '                       to_number(null) as litr_20_prih,'
      '                       to_number(null) as LITR_rash,'
      '                       to_number(null) as mass_rash,'
      '                       to_number(null) as DENSITY_rash,'
      '                       to_number(null) as TEMP_rash,'
      '                       to_number(null) as density_20_rash,'
      '                       to_number(null) as litr_20_rash,'
      '                       to_number(0) as is_have_det,'
      '                       lpad(rownum, 2, '#39'0'#39') as MM'
      '                  from all_objects'
      
        '                 where rownum <= to_number(to_char(:enddate, '#39'MM' +
        #39'))'
      '                union all'
      '                select '#39#1048#1058#1054#1043#1054#39' as np_name,'
      
        '                       INITCAP(trim(to_char(to_date(lpad(rownum,' +
        ' 2, '#39'0'#39'),'
      '                                                    '#39'MM'#39'),'
      '                                            '#39'month'#39','
      
        '                                            '#39'nls_date_language=r' +
        'ussian'#39'))) ||'
      '                       to_char(sysdate, '#39' YYYY'#39') as mon,'
      '                       to_date(null) as act_date,'
      '                       to_number(5) as fuel_id,'
      '                       to_number(null) as mass_prih,'
      '                       to_number(null) as density_prih,'
      '                       to_number(null) as temp_prih,'
      '                       to_number(null) as density_20_prih,'
      '                       to_number(null) as litr_20_prih,'
      '                       to_number(null) as LITR_rash,'
      '                       to_number(null) as mass_rash,'
      '                       to_number(null) as DENSITY_rash,'
      '                       to_number(null) as TEMP_rash,'
      '                       to_number(null) as density_20_rash,'
      '                       to_number(null) as litr_20_rash,'
      '                       to_number(0) as is_have_det,'
      '                       lpad(rownum, 2, '#39'0'#39') as MM'
      '                  from all_objects'
      
        '                 where rownum <= to_number(to_char(:enddate, '#39'MM' +
        #39'))'
      '                union all'
      '                select '#39#1048#1058#1054#1043#1054#39' as np_name,'
      
        '                       INITCAP(trim(to_char(to_date(lpad(rownum,' +
        ' 2, '#39'0'#39'),'
      '                                                    '#39'MM'#39'),'
      '                                            '#39'month'#39','
      
        '                                            '#39'nls_date_language=r' +
        'ussian'#39'))) ||'
      '                       to_char(sysdate, '#39' YYYY'#39') as mon,'
      '                       to_date(null) as act_date,'
      '                       to_number(6) as fuel_id,'
      '                       to_number(null) as mass_prih,'
      '                       to_number(null) as density_prih,'
      '                       to_number(null) as temp_prih,'
      '                       to_number(null) as density_20_prih,'
      '                       to_number(null) as litr_20_prih,'
      '                       to_number(null) as LITR_rash,'
      '                       to_number(null) as mass_rash,'
      '                       to_number(null) as DENSITY_rash,'
      '                       to_number(null) as TEMP_rash,'
      '                       to_number(null) as density_20_rash,'
      '                       to_number(null) as litr_20_rash,'
      '                       to_number(0) as is_have_det,'
      '                       lpad(rownum, 2, '#39'0'#39') as MM'
      '                  from all_objects'
      
        '                 where rownum <= to_number(to_char(:enddate, '#39'MM' +
        #39'))'
      '                union all'
      '                select '#39#1048#1058#1054#1043#1054#39' as np_name,'
      
        '                       INITCAP(trim(to_char(to_date(lpad(rownum,' +
        ' 2, '#39'0'#39'),'
      '                                                    '#39'MM'#39'),'
      '                                            '#39'month'#39','
      
        '                                            '#39'nls_date_language=r' +
        'ussian'#39'))) ||'
      '                       to_char(sysdate, '#39' YYYY'#39') as mon,'
      '                       to_date(null) as act_date,'
      '                       to_number(7) as fuel_id,'
      '                       to_number(null) as mass_prih,'
      '                       to_number(null) as density_prih,'
      '                       to_number(null) as temp_prih,'
      '                       to_number(null) as density_20_prih,'
      '                       to_number(null) as litr_20_prih,'
      '                       to_number(null) as LITR_rash,'
      '                       to_number(null) as mass_rash,'
      '                       to_number(null) as DENSITY_rash,'
      '                       to_number(null) as TEMP_rash,'
      '                       to_number(null) as density_20_rash,'
      '                       to_number(null) as litr_20_rash,'
      '                       to_number(0) as is_have_det,'
      '                       lpad(rownum, 2, '#39'0'#39') as MM'
      '                  from all_objects'
      
        '                 where rownum <= to_number(to_char(:enddate, '#39'MM' +
        #39'))'
      '        --order by fuel_id, MM, act_date, is_have_det     '
      '        )  )'
      
        '        where mm between to_number(to_char(:begindate, '#39'MM'#39')) an' +
        'd to_number(to_char(:enddate, '#39'MM'#39'))'
      ' group by NP_NAME, mon, act_date, fuel_id, MM, is_have_det'
      ' order by fuel_id, MM, act_date, is_have_det')
    MasterSource = nil
    MasterFields = ''
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'begindate'
      end
      item
        DataType = ftUnknown
        Name = 'enddate'
      end>
    object qDetailNP_NAME: TStringField
      FieldName = 'NP_NAME'
      Size = 89
    end
    object qDetailMON: TStringField
      FieldName = 'MON'
      Size = 13
    end
    object qDetailACT_DATE: TDateTimeField
      FieldName = 'ACT_DATE'
    end
    object qDetailFUEL_ID: TFloatField
      FieldName = 'FUEL_ID'
    end
    object qDetailMASS_PRIH: TFloatField
      FieldName = 'MASS_PRIH'
    end
    object qDetailDENSITY_PRIH: TFloatField
      FieldName = 'DENSITY_PRIH'
    end
    object qDetailTEMP_PRIH: TFloatField
      FieldName = 'TEMP_PRIH'
    end
    object qDetailDENSITY_20_PRIH: TFloatField
      FieldName = 'DENSITY_20_PRIH'
    end
    object qDetailLITR_20_PRIH: TFloatField
      FieldName = 'LITR_20_PRIH'
    end
    object qDetailLITR_RASH: TFloatField
      FieldName = 'LITR_RASH'
    end
    object qDetailMASS_RASH: TFloatField
      FieldName = 'MASS_RASH'
    end
    object qDetailDENSITY_RASH: TFloatField
      FieldName = 'DENSITY_RASH'
    end
    object qDetailTEMP_RASH: TFloatField
      FieldName = 'TEMP_RASH'
    end
    object qDetailDENSITY_20_RASH: TFloatField
      FieldName = 'DENSITY_20_RASH'
    end
    object qDetailLITR_20_RASH: TFloatField
      FieldName = 'LITR_20_RASH'
    end
    object qDetailIS_HAVE_DET: TFloatField
      FieldName = 'IS_HAVE_DET'
    end
    object qDetailMM: TStringField
      FieldName = 'MM'
      Size = 2
    end
  end
  inherited dsDetail: TOraDataSource
    Left = 196
  end
end
