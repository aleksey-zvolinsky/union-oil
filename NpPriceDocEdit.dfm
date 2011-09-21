inherited NpPriceDocEditForm: TNpPriceDocEditForm
  Left = 394
  Top = 504
  Width = 572
  Height = 375
  Caption = #1042#1074#1086#1076' '#1094#1077#1085' '#1085#1072' '#1040#1047#1057
  PixelsPerInch = 96
  TextHeight = 13
  object lblDateOn: TLabel [0]
    Left = 5
    Top = 9
    Width = 32
    Height = 13
    Caption = #1044#1072#1090#1072' :'
  end
  object Label1: TLabel [1]
    Left = 302
    Top = 8
    Width = 56
    Height = 13
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082':'
  end
  object Label3: TLabel [2]
    Left = 168
    Top = 8
    Width = 37
    Height = 13
    Caption = #1053#1086#1084#1077#1088':'
  end
  object Label2: TLabel [3]
    Left = 168
    Top = 35
    Width = 98
    Height = 15
    Caption = #1052#1077#1090#1086#1076' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103':'
  end
  inherited pBottom: TPanel
    Top = 308
    Width = 564
    object sbDel: TSpeedButton [0]
      Left = 4
      Top = 4
      Width = 25
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888000000000000888877777777777788880FFFFFFFFFF
        0888878888888888788880FFFFFFFFFF0888878888888888788880FF00000000
        0088878877777777778880FF09999999908887887FFFFFFFF78880FF09999999
        908887887FFFFFFFF78880FF000000000088878877777777778880FFFFFFFFFF
        0888878888888888788880F0F00F000F0888878787787778788880FFFFFFFFFF
        0888878888888888788880F000F0FFFF0888878777878888788880FFFFFFF000
        0888878888888777788880F000FFF0808888878777888787888880FFFFFFF008
        8888878888888778888880000000008888888777777777888888}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbDelClick
    end
    inherited pBtn: TPanel
      Left = 367
    end
  end
  object deDateOn: TDateEdit [5]
    Left = 39
    Top = 5
    Width = 121
    Height = 21
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 1
  end
  object PageControl1: TPageControl [6]
    Left = 0
    Top = 57
    Width = 564
    Height = 251
    ActivePage = tsState
    Align = alBottom
    MultiLine = True
    TabOrder = 2
    TabPosition = tpLeft
    OnChange = PageControl1Change
    object tsPrice: TTabSheet
      Caption = #1062#1077#1085#1099
      object Grid: TDBGridEh
        Left = 0
        Top = 0
        Width = 537
        Height = 243
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = ds
        Flat = False
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
        OnEditButtonClick = GridEditButtonClick
        OnKeyPress = GridKeyPress
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
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'NP_NAME'
            Footers = <>
            Title.Caption = #1058#1086#1074#1072#1088
            Width = 237
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072
            Width = 62
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsState: TTabSheet
      Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
      ImageIndex = 1
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 537
        Height = 243
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = dsOrderState
        Flat = False
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
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PRICE_ORDER_ID'
            Footers = <>
            Title.Alignment = taCenter
            Width = 103
          end
          item
            EditButtons = <>
            FieldName = 'STATE_ID'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1050#1086#1076' '#1089#1086#1089#1090#1086#1103#1085#1080#1103
            Width = 107
          end
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
            Width = 98
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsAzs: TTabSheet
      Caption = #1040#1047#1057
      ImageIndex = 2
    end
  end
  object edNum: TEdit [7]
    Left = 208
    Top = 4
    Width = 73
    Height = 21
    TabOrder = 3
  end
  object CheckBox1: TCheckBox [8]
    Left = 40
    Top = 34
    Width = 113
    Height = 17
    Caption = #1043#1086#1090#1086#1074' '#1082' '#1086#1090#1087#1088#1072#1074#1082#1077
    TabOrder = 4
  end
  object cbMethod: TComboBox [9]
    Left = 272
    Top = 33
    Width = 284
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = #1053#1077#1084#1077#1076#1083#1077#1085#1085#1086
    Items.Strings = (
      #1053#1077#1084#1077#1076#1083#1077#1085#1085#1086
      #1042' '#1083#1102#1073#1086#1077' '#1074#1088#1077#1084#1103'('#1042#1088#1091#1095#1085#1091#1102')'
      #1055#1086#1089#1083#1077' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1089#1084#1077#1085#1099'('#1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080')'
      #1055#1086#1089#1083#1077' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1089#1084#1077#1085#1099'('#1042#1088#1091#1095#1085#1091#1102')'
      #1055#1088#1080#1085#1091#1076#1080#1090#1077#1083#1100#1085#1086#1077' '#1079#1072#1082#1088#1099#1090#1080#1077' '#1089#1084#1077#1085#1099'('#1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080')')
  end
  object cbEmp: TComboEdit [10]
    Left = 362
    Top = 4
    Width = 149
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 6
    OnButtonClick = cbEmpButtonClick
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select opos.price_order_id,'
      '       opos.state_id,'
      '       opo.numb,'
      '       opo.id as opo_id,'
      '       opo.inst as opo_inst,'
      '       oe.id as emp_id,'
      '       oe.inst as emp_inst,'
      
        '       oe.i_name||'#39' '#39'||oe.f_name||'#39' '#39'||oe.o_name as name_f,     ' +
        '  '
      '       npp.price_order_id,'
      '       np.id as np_type_id,'
      '       np.codavias,'
      
        '       to_number(ov.GetOutLinkVal('#39'OIL_NP_TYPE'#39',2, np.id)) as co' +
        'doptima,'
      
        '       to_number(ov.GetOutLinkVal('#39'OIL_NP_TYPE'#39',ov.GetVal('#39'NP_CO' +
        'DINT'#39'),np.id)) as codint,'
      '       np.name as np_name,'
      '       npp.org_id,'
      '       npp.org_inst,'
      '       npp.date_on,'
      '       npp.price,'
      '       npp.id,'
      '       npp.inst,'
      '       max(opo.numb)over(partition by opo.inst) as max_numb'
      '  from oil_np_type np, OIL_NP_PRICE npp, oil_price_order opo, '
      '       oil_employ oe, oil_price_order_state opos '
      ' where np.id = npp.np_id'
      '   and opo.id(+) = npp.price_order_id'
      '   and opo.inst(+) = npp.price_order_inst   '
      '   and oe.id(+) = opo.emp_id'
      '   and oe.inst(+) = opo.emp_inst'
      '   and opos.price_order_id(+) = opo.id'
      '   and opos.price_order_inst(+) = opo.inst  '
      '   and npp.state = '#39'Y'#39'   '
      '   and npp.inst = :inst'
      '   and npp.date_on = :date_on')
    Left = 120
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'date_on'
      end>
  end
  object ds: TOraDataSource
    DataSet = vt
    Left = 200
    Top = 160
  end
  object vt: TVirtualTable
    Left = 280
    Top = 160
    Data = {03000000000000000000}
  end
  object qOrderState: TOilQuery
    SQL.Strings = (
      'select tt.name,'
      '       t.inst,'
      '       t.price_order_id,'
      '       t.price_order_inst,'
      '       t.state_id,'
      '       t.date_of'
      '  from oil_price_order_state t, oil_oper_type tt'
      ' where tt.id = t.state_id'
      ' -- and t.price_order_id = :price_order_id'
      ' -- and t.inst = :inst')
    MasterSource = ds
    MasterFields = 'ID;INST'
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 200
    Top = 232
  end
  object dsOrderState: TOraDataSource
    DataSet = qOrderState
    Left = 264
    Top = 216
  end
  object qOrderAzs: TOilQuery
    SQL.Strings = (
      'select *'
      ' from oil_price_order_azs opoz'
      'where  '
      ' opoz.price_order_id = :id'
      ' opoz.price_order_inst = :inst')
    MasterSource = ds
    MasterFields = 'ID;INST'
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 352
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
end
