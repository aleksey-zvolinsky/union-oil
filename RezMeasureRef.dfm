inherited RezMeasureRefForm: TRezMeasureRefForm
  Caption = #1047#1072#1084#1077#1088#1099' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited PAdd: TPanel
      Visible = True
      inherited sbAdd: TSpeedButton
        OnClick = sbAddClick
      end
    end
    inherited PEdit: TPanel
      Visible = True
    end
    inherited pDel: TPanel
      Visible = True
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
  end
  inherited Panel2: TPanel
    Height = 45
    object Label1: TLabel
      Left = 5
      Top = 3
      Width = 41
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089' :'
    end
    object Label2: TLabel
      Left = 109
      Top = 3
      Width = 18
      Height = 13
      Caption = #1087#1086' :'
    end
    object lblNumb: TLabel
      Left = 213
      Top = 3
      Width = 66
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1072#1082#1090#1072' :'
    end
    object deBeginDate: TDateEdit
      Left = 5
      Top = 19
      Width = 97
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
    end
    object deEndDate: TDateEdit
      Left = 109
      Top = 19
      Width = 97
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
    end
    object eNumb: TEdit
      Left = 213
      Top = 19
      Width = 121
      Height = 21
      TabOrder = 2
    end
  end
  inherited pBase: TPanel
    Top = 55
    Height = 316
    inherited SplitterDetail: TSplitter
      Top = 261
    end
    inherited DBGrid1: TDBGridEh
      Height = 261
      FooterRowCount = 1
      SumList.Active = True
      UseMultiTitle = True
      OnRowDetailPanelHide = DBGrid1RowDetailPanelHide
      OnRowDetailPanelShow = DBGrid1RowDetailPanelShow
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DATE_ON'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1072#1082#1090#1072
          Title.SortIndex = 1
          Title.SortMarker = smUpEh
          Width = 110
        end
        item
          EditButtons = <>
          FieldName = 'NUMB'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1072#1082#1090#1072
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'OPER_NAME'
          Footers = <>
          Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
          Width = 160
        end
        item
          EditButtons = <>
          FieldName = 'F_NAME'
          Footers = <>
          Title.Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081
          Width = 160
        end>
      inherited RowDetailData: TRowDetailPanelControlEh
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 0
          Width = 0
          Height = 0
          Align = alClient
          DataGrouping.GroupLevels = <>
          DataSource = dsDetail
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          RowDetailPanel.Color = clBtnFace
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
              FieldName = 'NUMB'
              Footers = <>
              Title.Caption = #1053#1086#1084#1077#1088
              Width = 61
            end
            item
              EditButtons = <>
              FieldName = 'TEMPER'
              Footers = <>
              Title.Caption = #1058#1077#1084#1087#1077#1088'.'
            end
            item
              EditButtons = <>
              FieldName = 'DENSITY'
              Footers = <>
              Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
            end
            item
              EditButtons = <>
              FieldName = 'FUEL_QUANTITY'
              Footers = <>
              Title.Caption = #1058#1086#1087#1083#1080#1074#1086'|'#1054#1073#1098#1077#1084
            end
            item
              EditButtons = <>
              FieldName = 'FUEL_WEIGHT'
              Footers = <>
              Title.Caption = #1058#1086#1087#1083#1080#1074#1086'|'#1042#1077#1089
            end
            item
              EditButtons = <>
              FieldName = 'WATER_QUANTITY'
              Footers = <>
              Title.Caption = #1042#1086#1076#1072'|'#1054#1073#1098#1077#1084
            end
            item
              EditButtons = <>
              FieldName = 'WATER_WEIGHT'
              Footers = <>
              Title.Caption = #1042#1086#1076#1072'|'#1042#1077#1089
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    inherited pDetail: TPanel
      Top = 264
    end
  end
  inherited PanelCol: TPanel
    Top = 55
    Height = 316
    inherited cbCol: TRxCheckListBox
      Height = 288
    end
    inherited pRefresh: TPanel
      Top = 290
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select t.id,'
      '       t.inst,'
      '       t.date_on,'
      '       t.numb,       '
      '       o.id as oper_id,'
      '       o.name as oper_name,'
      '       t.user_id,'
      '       emp.id as emp_id,'
      '       emp.inst as emp_inst,'
      '       emp.f_name'
      '  from oil_rez_measure t, oil_oper_type o, oil_employ emp'
      ' where t.state = '#39'Y'#39
      '   and t.oper_id = o.id(+)'
      '   and o.state(+) = '#39'Y'#39
      '   and t.emp_id = emp.id(+)'
      '   and t.emp_inst = emp.inst(+)'
      '   and emp.state(+) = '#39'Y'#39
      '   and (trunc(t.date_on) between :begin_date and :end_date)'
      '   and (t.numb like '#39'%'#39'||:numb||'#39'%'#39' or :numb is null)')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'begin_date'
      end
      item
        DataType = ftUnknown
        Name = 'end_date'
      end
      item
        DataType = ftUnknown
        Name = 'numb'
      end>
    object qID: TFloatField
      FieldName = 'ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
    end
    object qNUMB: TStringField
      FieldName = 'NUMB'
      Size = 255
    end
    object qDATE_ON: TDateTimeField
      FieldName = 'DATE_ON'
    end
    object qOPER_ID: TFloatField
      FieldName = 'OPER_ID'
    end
    object qOPER_NAME: TStringField
      FieldName = 'OPER_NAME'
      Size = 50
    end
    object qUSER_ID: TFloatField
      FieldName = 'USER_ID'
    end
    object qEMP_ID: TFloatField
      FieldName = 'EMP_ID'
    end
    object qEMP_INST: TFloatField
      FieldName = 'EMP_INST'
    end
    object qF_NAME: TStringField
      FieldName = 'F_NAME'
      Size = 50
    end
  end
  inherited qDetail: TOilQuery
    SQL.Strings = (
      'select r.name as numb,'
      '       md.temper,'
      '       md.density,'
      '       md.fuel_quantity,'
      '       md.fuel_weight,'
      '       md.water_quantity,'
      '       md.water_weight'
      '  from oil_rez_measure_det md, oil_rezervuar r'
      ' where md.head_id = :id'
      '   and md.head_inst = :inst'
      '   and md.state = '#39'Y'#39
      '   and md.rez_id = r.id'
      '   and md.rez_inst = r.inst'
      '   and r.state = '#39'Y'#39)
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
    object qDetailNUMB: TStringField
      FieldName = 'NUMB'
      Size = 50
    end
    object qDetailTEMPER: TFloatField
      FieldName = 'TEMPER'
    end
    object qDetailDENSITY: TFloatField
      FieldName = 'DENSITY'
    end
    object qDetailFUEL_QUANTITY: TFloatField
      FieldName = 'FUEL_QUANTITY'
    end
    object qDetailFUEL_WEIGHT: TFloatField
      FieldName = 'FUEL_WEIGHT'
    end
    object qDetailWATER_QUANTITY: TFloatField
      FieldName = 'WATER_QUANTITY'
    end
    object qDetailWATER_WEIGHT: TFloatField
      FieldName = 'WATER_WEIGHT'
    end
  end
end
