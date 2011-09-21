inherited NpPriceRefForm: TNpPriceRefForm
  Left = 352
  Top = 273
  Caption = #1062#1077#1085#1099' '#1085#1072' '#1089#1086#1087#1091#1090#1089#1090#1074#1091#1102#1097#1080#1081' '#1090#1086#1074#1072#1088
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited PAdd: TPanel
      inherited sbAdd: TSpeedButton
        OnClick = sbAddClick
      end
    end
    inherited pDel: TPanel
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
    inherited pShowDetail: TPanel
      Visible = True
    end
  end
  inherited Panel2: TPanel
    Height = 31
    object lblDateOn: TLabel
      Left = 9
      Top = 9
      Width = 35
      Height = 13
      Caption = #1044#1072#1090#1072' c'
    end
    object lblDateOnEnd: TLabel
      Left = 174
      Top = 9
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object deDateBegin: TDateEdit
      Left = 48
      Top = 5
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object deDateEnd: TDateEdit
      Left = 192
      Top = 5
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  inherited pBase: TPanel
    Top = 41
    Height = 330
    inherited SplitterDetail: TSplitter
      Top = 275
    end
    inherited DBGrid1: TDBGridEh
      Height = 275
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DATE_ON'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
        end
        item
          EditButtons = <>
          FieldName = 'TO_NAME'
          Footers = <>
          Title.Caption = #1050#1086#1084#1091' '#1087#1088#1077#1076#1085#1072#1079#1085#1072#1095#1077#1085#1099
          Width = 173
        end
        item
          EditButtons = <>
          FieldName = 'FROM_NAME'
          Footers = <>
          Title.Caption = #1050#1090#1086' '#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1083
          Width = 207
        end
        item
          EditButtons = <>
          FieldName = 'CNT'
          Footers = <>
          Title.Caption = #1055#1086#1079#1080#1094#1080#1081
        end>
    end
    inherited pDetail: TPanel
      Top = 278
      inherited DBGridDetail: TDBGridEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NP_TYPE_ID'
            Footers = <>
            Title.Caption = #1050#1086#1076' Oil'
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'CODAVIAS'
            Footers = <>
            Title.Caption = #1050#1086#1076' '#1053#1053#1041
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'CODINT'
            Footers = <>
            Title.Caption = #1050#1086#1076' '#1074#1085#1091#1090'.'
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'CODOPTIMA'
            Footers = <>
            Title.Caption = #1050#1086#1076' Cashtan'
            Width = 50
          end
          item
            EditButtons = <>
            FieldName = 'NP_NAME'
            Footers = <>
            Title.Caption = #1058#1086#1074#1072#1088
            Width = 226
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072
          end>
      end
    end
  end
  inherited PanelCol: TPanel
    Top = 41
    Height = 330
    inherited cbCol: TRxCheckListBox
      Height = 302
    end
    inherited pRefresh: TPanel
      Top = 304
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select npp.org_id,'
      '       npp.org_inst,'
      '       npp.date_on,'
      '       org.name as to_name,'
      '       o.inst,'
      '       decode(o.inst, 1, '#39#1062#1077#1085#1090#1088#39', o.name) as from_name,'
      '       count(*) as cnt'
      '  from OIL_NP_PRICE npp, v_org org, v_org o'
      ' where npp.state = '#39'Y'#39
      '   and npp.date_on between :DateBegin and :DateEnd'
      '   and npp.org_id = org.id'
      '   and npp.org_inst = org.inst'
      '   and npp.inst = o.id'
      '   and npp.inst = o.inst'
      'group by npp.org_id,'
      '         npp.org_inst,'
      '         npp.date_on,'
      '         org.name,'
      '         o.inst,'
      '         decode(o.inst, 1, '#39#1062#1077#1085#1090#1088#39', o.name)'
      'order by date_on desc')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateBegin'
      end
      item
        DataType = ftUnknown
        Name = 'DateEnd'
      end>
  end
  inherited qDetail: TOilQuery
    SQL.Strings = (
      'select np.id as np_type_id,'
      '       np.codavias,'
      
        '       to_number(ov.GetOutLinkVal('#39'OIL_NP_TYPE'#39',2,np.id)) as cod' +
        'optima,'
      
        '       to_number(ov.GetOutLinkVal('#39'OIL_NP_TYPE'#39',ov.GetVal('#39'NP_CO' +
        'DINT'#39'),np.id)) as codint,    '
      '       np.name as np_name,'
      '       npp.org_id,'
      '       npp.org_inst,'
      '       npp.date_on,'
      '       npp.price,'
      '       npp.id,'
      '       npp.inst'
      '  from oil_np_type np, OIL_NP_PRICE npp'
      ' where np.id = npp.np_id'
      '   and npp.state = '#39'Y'#39
      '   and npp.inst = :inst'
      '   and npp.date_on = :date_on')
    MasterFields = 'DATE_ON;INST'
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'inst'
      end
      item
        DataType = ftUnknown
        Name = 'date_on'
      end>
  end
end
