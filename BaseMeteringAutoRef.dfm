inherited BaseMeteringAutoRefForm: TBaseMeteringAutoRefForm
  Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103' '#1091#1088#1086#1074#1085#1077#1084#1077#1088#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel4: TPanel
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
      Width = 32
      Height = 13
      Caption = #1044#1072#1090#1072' :'
    end
    object dteDate: TDBDateTimeEditEh
      Left = 6
      Top = 19
      Width = 123
      Height = 21
      Ctl3D = True
      EditButtons = <>
      Kind = dtkDateTimeEh
      ParentCtl3D = False
      TabOrder = 0
      Visible = True
      OnChange = dteDateChange
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
      RowDetailPanel.Active = True
      RowDetailPanel.Width = 10000
      RowDetailPanel.Height = 10000
      RowDetailPanel.ActiveControl = GridChoose
      OnRowDetailPanelShow = DBGrid1RowDetailPanelShow
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
          FieldName = 'weight'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086', '#1082#1075
          Width = 89
        end>
      inherited RowDetailData: TRowDetailPanelControlEh
        object GridChoose: TDBGridEh
          Left = 0
          Top = 0
          Width = 477
          Height = 218
          Align = alClient
          DataGrouping.GroupLevels = <>
          DataSource = dsIn
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          RowDetailPanel.Color = clBtnFace
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = GridChooseDblClick
          OnGetCellParams = GridChooseGetCellParams
          Columns = <
            item
              EditButtons = <>
              FieldName = 'DATETIME'
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103
              Width = 109
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'LITR'
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086', '#1083
              Width = 92
            end
            item
              DisplayFormat = ',0'
              EditButtons = <>
              FieldName = 'weight'
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086', '#1082#1075
              Width = 89
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
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
  inherited ds: TOraDataSource
    DataSet = vt
    Left = 176
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select oil_id, oil_inst, '
      '       rez_numb as rez_name, '
      '       datetime, '
      '       litr, weight,'
      '       decode('
      '         sign(:datetime-datetime),1,  '
      
        '         row_number() over(partition by oil_id, oil_inst,sign(da' +
        'tetime-:datetime) order by datetime desc),'
      
        '         row_number() over(partition by oil_id, oil_inst,sign(da' +
        'tetime-:datetime) order by datetime asc)) '
      '         as rn,       '
      '       sign(:datetime-datetime) '
      '         as diff_datetime,'
      '       decode(sign(:datetime-datetime), '
      '         decode('
      '           sign(:datetime-datetime),1,  '
      
        '           row_number() over(partition by oil_id, oil_inst,sign(' +
        'datetime-:datetime) order by datetime desc),'
      
        '           row_number() over(partition by oil_id, oil_inst,sign(' +
        'datetime-:datetime) order by datetime asc)), 1,0) '
      '         as is_checked'
      '  from V_ZAMER_FUEL_WEIGHT t'
      ' where trunc(datetime) = :date_'
      ' order by rez_numb, datetime')
    Left = 112
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'datetime'
      end
      item
        DataType = ftDateTime
        Name = 'date_'
      end>
  end
  inherited qDetail: TOilQuery
    Top = 256
  end
  inherited dsDetail: TOraDataSource
    Top = 256
  end
  object vt: TVirtualTable
    Left = 144
    Top = 113
    Data = {03000000000000000000}
  end
  object dsIn: TOraDataSource
    DataSet = q
    Left = 110
    Top = 164
  end
end
