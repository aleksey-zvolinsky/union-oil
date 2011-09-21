inherited NpPriceDocRefForm: TNpPriceDocRefForm
  Left = 255
  Top = 271
  Caption = #1062#1077#1085#1099' '#1085#1072' '#1040#1047#1057
  ClientHeight = 521
  ClientWidth = 719
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 488
    Width = 719
    inherited Panel3: TPanel
      Left = 522
      Visible = False
    end
    inherited PAdd: TPanel
      Width = 31
      Visible = True
      inherited sbAdd: TSpeedButton
        OnClick = sbAddClick
      end
    end
    inherited PEdit: TPanel
      Left = 33
      Visible = True
    end
    inherited pDel: TPanel
      Left = 63
      Visible = True
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      Left = 143
      Width = 163
      inherited bbSearch: TBitBtn
        Width = 79
        OnClick = bbSearchClick
      end
    end
    inherited pPrint: TPanel
      Left = 93
      Visible = True
    end
    inherited pTotal: TPanel
      Left = 306
    end
    inherited pSpeedUp: TPanel
      Left = 336
    end
    inherited pShowDetail: TPanel
      Left = 366
      Width = 156
      Visible = True
    end
  end
  inherited Panel2: TPanel
    Width = 719
    Height = 36
    object lblDateOnEnd: TLabel
      Left = 198
      Top = 9
      Width = 18
      Height = 13
      Caption = #1087#1086' :'
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 41
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089' :'
    end
    object deDateBegin: TDateEdit
      Left = 64
      Top = 5
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object deDateEnd: TDateEdit
      Left = 224
      Top = 5
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  inherited pBase: TPanel
    Top = 46
    Width = 569
    Height = 442
    inherited SplitterDetail: TSplitter
      Top = 387
      Width = 569
    end
    inherited DBGrid1: TDBGridEh
      Width = 569
      Height = 387
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NUMB'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1044#1086#1082'.'
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'DATE_ON'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '
          Width = 66
        end
        item
          EditButtons = <>
          FieldName = 'DATE_OFF'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
          Width = 95
        end
        item
          EditButtons = <>
          FieldName = 'STATE_ID'
          Footers = <>
          Title.Caption = #1057#1090#1072#1090#1091#1089' '#1075#1086#1090#1086#1074#1085'.'
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'APPLY_METHOD'
          Footers = <>
          Title.Caption = #1052#1077#1090#1086#1076' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'F_NAME'
          Footers = <>
          Title.Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1083
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'ORG_NAME'
          Footers = <>
          Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          Width = 84
        end
        item
          EditButtons = <>
          FieldName = 'CNT'
          Footers = <>
          Title.Caption = #1055#1086#1079#1080#1094#1080#1081
          Width = 56
        end>
    end
    inherited pDetail: TPanel
      Top = 390
      Width = 569
      inherited DBGridDetail: TDBGridEh
        Width = 569
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CODAVIAS'
            Footers = <>
            Title.Caption = #1050#1086#1076' '#1053#1053#1041
          end
          item
            EditButtons = <>
            FieldName = 'NP_NAME'
            Footers = <>
            Title.Caption = #1058#1086#1074#1072#1088
            Width = 225
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072
          end
          item
            EditButtons = <>
            FieldName = 'CODOPTIMA'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'CODINT'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'NP_TYPE_ID'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            Footers = <>
            Visible = False
          end>
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 719
    inherited pnlTuneGridBtn: TPanel
      Left = 690
    end
  end
  inherited PanelCol: TPanel
    Left = 569
    Top = 46
    Height = 442
    inherited cbCol: TRxCheckListBox
      Height = 414
    end
    inherited pRefresh: TPanel
      Top = 416
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select opo.id,'
      '       opo.numb,'
      '       opo.apply_method,'
      '       npp.org_id,'
      '       npp.org_inst,'
      '       npp.date_on,'
      '       trunc(opos.date_of) as date_off,'
      '       opos.state_id,'
      '       opt.name as oper_name,'
      '       org.name as org_name,'
      '       org.inst,'
      '       count(*) as cnt,'
      '       oe.f_name'
      '  from OIL_NP_PRICE          npp,'
      '       v_org                 org,'
      '       oil_price_order       opo,'
      '       oil_price_order_state opos,'
      '       oil_oper_type         opt,'
      '       oil_employ            oe'
      ' where npp.state = '#39'Y'#39
      '   and npp.date_on between :DateBegin and :DateEnd'
      '   and npp.org_id = org.id'
      '   and npp.org_inst = org.inst'
      '   and npp.price_order_id = opo.id(+)'
      '   and opo.id = opos.price_order_id(+)'
      '   and opo.inst = opos.price_order_inst(+)'
      '   and opt.id(+) = opos.state_id'
      '   and opo.emp_id = oe.id(+)'
      '   and opo.emp_inst = oe.inst(+)'
      '   and npp.inst <> 1'
      ' group by npp.org_id,'
      '          npp.org_inst,'
      '          npp.date_on,'
      '          org.inst,'
      '          org.name,'
      '          opo.id,'
      '          opo.numb,'
      '          opo.apply_method,'
      '          opos.date_of,'
      '          opos.state_id,'
      '          opt.name,'
      '          oe.f_name'
      ' order by date_on desc')
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
  inherited ADMQ: TOilQuery
    Left = 24
    Top = 272
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
