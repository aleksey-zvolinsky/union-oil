inherited BaseKoefUdWeightRefForm: TBaseKoefUdWeightRefForm
  Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099' '#1087#1088#1080#1088#1086#1089#1090#1086#1074' '#1085#1072' '#1091#1076#1077#1083#1072#1093
  ClientHeight = 439
  ClientWidth = 694
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 406
    Width = 694
    inherited Panel3: TPanel
      Left = 497
    end
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
      inherited bbClear: TBitBtn
        Visible = False
      end
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
    inherited pShowDetail: TPanel
      Width = 129
    end
  end
  inherited Panel2: TPanel
    Width = 694
    Height = 31
    object lblEndDate: TLabel
      Left = 119
      Top = 8
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object lblBeginDate: TLabel
      Left = 6
      Top = 8
      Width = 7
      Height = 13
      Caption = 'C'
    end
    object lblProduct: TLabel
      Left = 236
      Top = 8
      Width = 76
      Height = 13
      Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090':'
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
    object Product: TEdit
      Left = 320
      Top = 4
      Width = 125
      Height = 21
      TabOrder = 2
      OnChange = ProductChange
    end
  end
  inherited pBase: TPanel
    Top = 41
    Width = 607
    Height = 365
    inherited SplitterDetail: TSplitter
      Top = 310
      Width = 607
    end
    inherited DBGrid1: TDBGridEh
      Width = 607
      Height = 310
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Visible = False
          Width = 43
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Width = 119
        end
        item
          EditButtons = <>
          FieldName = 'DATE_FROM'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DATE_TO'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOEF'
          Footers = <>
        end>
    end
    inherited pDetail: TPanel
      Top = 313
      Width = 607
      inherited DBGridDetail: TDBGridEh
        Width = 607
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 694
    inherited pnlTuneGridBtn: TPanel
      Left = 665
    end
  end
  inherited PanelCol: TPanel
    Left = 607
    Top = 41
    Width = 87
    Height = 365
    inherited cbCol: TRxCheckListBox
      Width = 83
      Height = 337
    end
    inherited pRefresh: TPanel
      Top = 339
      Width = 83
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      
        'select t.id,t.inst,m.name,t.date_from,t.date_to,t.koef from oil_' +
        'koef_ud_weight t, oil_np_group m'
      'where t.np_group_id=m.id'
      'and (t.date_from >= :BeginDate'
      'and t.date_to <= :EndDate'
      'or :BeginDate is null or :EndDate is null)'
      'and t.state='#39'Y'#39
      'union all'
      
        'select t.id,t.inst,'#39#1060#1088#1072#1082#1094#1080#1103' '#1083#1077#1075#1082#1072#1103#39' name,t.date_from,t.date_to,t' +
        '.koef from oil_koef_ud_weight t'
      'where (t.np_group_id='#39'-28'#39')'
      'and (t.date_from >= :BeginDate'
      'and t.date_to <= :EndDate'
      'or :BeginDate is null or :EndDate is null)'
      'and t.state='#39'Y'#39
      'order by date_to desc,date_from desc,name')
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
    object qID: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'ID'
      Required = True
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Required = True
    end
    object qNAME: TStringField
      DisplayLabel = #1053'/'#1087
      FieldName = 'NAME'
      Size = 50
    end
    object qDATE_FROM: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089
      FieldName = 'DATE_FROM'
    end
    object qDATE_TO: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086
      FieldName = 'DATE_TO'
    end
    object qKOEF: TFloatField
      DisplayLabel = #1050#1086#1077#1092
      FieldName = 'KOEF'
      Required = True
    end
  end
end
