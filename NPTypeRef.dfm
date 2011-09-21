inherited NPTypeRefForm: TNPTypeRefForm
  Left = 312
  Top = 224
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' - '#1058#1080#1087' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
  ClientWidth = 792
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 792
    TabOrder = 2
    inherited Panel3: TPanel
      Left = 595
    end
    inherited pDel: TPanel
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      inherited bbClear: TBitBtn
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        Default = False
        OnClick = bbSearchClick
      end
    end
    inherited pShowDetail: TPanel
      Width = 227
    end
  end
  inherited Panel2: TPanel
    Width = 792
    Height = 47
    TabOrder = 0
    object lblName: TLabel
      Left = 65
      Top = 4
      Width = 50
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object sbClearGrp: TSpeedButton
      Left = 362
      Top = 19
      Width = 22
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD88DDDDDDDD
        88DDDDFFDDDDDDDDFFDDDD888DDDDDD888DDDDFFFDDDDDDFFFDDDDD888DDDD88
        8DDDDDDFFFDDDDFFFDDDDDDD888DD888DDDDDDDDFFFDDFFFDDDDDDDDD888888D
        DDDDDDDDDFFFFFFDDDDDDDDDDD8888DDDDDDDDDDDDFFFFDDDDDDDDDDDD8888DD
        DDDDDDDDDDFFFFDDDDDDDDDDD888888DDDDDDDDDDFFFFFFDDDDDDDDD888DD888
        DDDDDDDDFFFDDFFFDDDDDDD888DDDD888DDDDDDFFFDDDDFFFDDDDD888DDDDDD8
        88DDDDFFFDDDDDDFFFDDDD88DDDDDDDD88DDDDFFDDDDDDDDFFDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
      OnClick = sbClearGrpClick
    end
    object lblShortName: TLabel
      Left = 170
      Top = 4
      Width = 73
      Height = 13
      Caption = #1050#1086#1088'. '#1085#1072#1079#1074#1072#1085#1080#1077
    end
    object lblNpGroup: TLabel
      Left = 260
      Top = 4
      Width = 54
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1053#1055
    end
    object lblUsGroup: TLabel
      Left = 592
      Top = 4
      Width = 118
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1089#1086#1087#1091#1090#1089#1090'. '#1090#1086#1074#1072#1088#1072
    end
    object sbClearUsSubgroup: TSpeedButton
      Left = 765
      Top = 19
      Width = 22
      Height = 21
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD88DDDDDDDD
        88DDDDFFDDDDDDDDFFDDDD888DDDDDD888DDDDFFFDDDDDDFFFDDDDD888DDDD88
        8DDDDDDFFFDDDDFFFDDDDDDD888DD888DDDDDDDDFFFDDFFFDDDDDDDDD888888D
        DDDDDDDDDFFFFFFDDDDDDDDDDD8888DDDDDDDDDDDDFFFFDDDDDDDDDDDD8888DD
        DDDDDDDDDDFFFFDDDDDDDDDDD888888DDDDDDDDDDFFFFFFDDDDDDDDD888DD888
        DDDDDDDDFFFDDFFFDDDDDDD888DDDD888DDDDDDFFFDDDDFFFDDDDD888DDDDDD8
        88DDDDFFFDDDDDDFFFDDDD88DDDDDDDD88DDDDFFDDDDDDDDFFDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
      OnClick = sbClearUsSubgroupClick
    end
    object lblId: TLabel
      Left = 6
      Top = 4
      Width = 19
      Height = 13
      Caption = #1050#1086#1076
    end
    object lblCodAvias: TLabel
      Left = 389
      Top = 4
      Width = 45
      Height = 13
      Caption = #1050#1086#1076' '#1053#1053#1041
    end
    object lblCodoptima: TLabel
      Left = 457
      Top = 4
      Width = 61
      Height = 13
      Caption = #1050#1086#1076' Cashtan'
    end
    object lblCodInt: TLabel
      Left = 524
      Top = 4
      Width = 53
      Height = 13
      Caption = #1050#1086#1076' '#1074#1085#1091#1090#1088'.'
    end
    object edName: TEdit
      Left = 65
      Top = 20
      Width = 101
      Height = 21
      TabOrder = 0
      OnChange = edNameChange
      OnKeyDown = edNameKeyDown
      OnKeyPress = edNameKeyPress
    end
    object edShort_Name: TEdit
      Left = 170
      Top = 20
      Width = 85
      Height = 21
      TabStop = False
      TabOrder = 1
      OnChange = edNameChange
    end
    object edNPGroup: TComboEdit
      Left = 259
      Top = 20
      Width = 103
      Height = 21
      TabStop = False
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = edNPGroupButtonClick
      OnDblClick = edNPGroupButtonClick
    end
    object edUsSubgroup: TComboEdit
      Left = 591
      Top = 20
      Width = 174
      Height = 21
      TabStop = False
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = edUsSubgroupButtonClick
      OnDblClick = edUsSubgroupButtonClick
    end
    object eNum: TEdit
      Left = 6
      Top = 20
      Width = 55
      Height = 21
      TabOrder = 4
      OnChange = edNameChange
      OnKeyPress = eNumKeyPress
    end
    object eCodAvias: TEdit
      Left = 389
      Top = 20
      Width = 64
      Height = 21
      TabOrder = 5
      OnChange = edNameChange
      OnKeyPress = eNumKeyPress
    end
    object eCodoptima: TEdit
      Left = 457
      Top = 20
      Width = 64
      Height = 21
      TabOrder = 6
      OnChange = edNameChange
      OnKeyPress = eNumKeyPress
    end
    object eCodInt: TEdit
      Left = 524
      Top = 20
      Width = 64
      Height = 21
      TabOrder = 7
      OnChange = edNameChange
      OnKeyPress = eNumKeyPress
    end
  end
  inherited pBase: TPanel
    Top = 57
    Width = 642
    Height = 314
    inherited SplitterDetail: TSplitter
      Top = 259
      Width = 642
    end
    inherited DBGrid1: TDBGridEh
      Width = 642
      Height = 259
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
      UseMultiTitle = True
      OnDblClick = bbOkClick
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'SHORT_NAME'
          Footers = <>
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'NP_GRP_NAME'
          Footers = <>
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'US_SUBGROUP_NAME'
          Footers = <>
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'NAME_RUS'
          Footers = <>
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'NAME_UKR'
          Footers = <>
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'PRICE'
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'CODAVIAS'
          Footers = <>
          Title.Caption = #1050#1086#1076' '#1053#1053#1041
        end
        item
          EditButtons = <>
          FieldName = 'FISCAL_NAME'
          Footers = <>
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1082#1072#1089#1089#1099
          Width = 142
        end
        item
          EditButtons = <>
          FieldName = 'FISCAL_NAME_TRUNC'
          Footers = <>
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1082#1072#1089#1089#1099' ('#1089#1086#1082#1088'.)'
          Width = 97
        end
        item
          EditButtons = <>
          FieldName = 'PRICEAVS'
          Footers = <>
          Title.Caption = #1062#1077#1085#1099' '#1040#1074#1080#1072#1089#1072'|'#1062#1077#1085#1072
          Width = 55
        end
        item
          EditButtons = <>
          FieldName = 'PRICEAVS_DATE_ON'
          Footers = <>
          Title.Caption = #1062#1077#1085#1099' '#1040#1074#1080#1072#1089#1072'|'#1044#1072#1090#1072
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'CODOPTIMA'
          Footers = <>
          Title.Caption = #1050#1086#1076' Cashtan'
        end
        item
          EditButtons = <>
          FieldName = 'CODINT'
          Footers = <>
          Title.Caption = #1050#1086#1076' '#1074#1085#1091#1090#1088'.'
        end>
    end
    inherited pDetail: TPanel
      Top = 262
      Width = 642
      inherited DBGridDetail: TDBGridEh
        Width = 642
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 792
    inherited pnlTuneGridBtn: TPanel
      Left = 763
    end
  end
  inherited PanelCol: TPanel
    Left = 642
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
    Left = 120
    Top = 120
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select np.id,'
      '       np.name,'
      '       np.short_name,'
      '       np.np_grp,'
      '       np.np_grp_name,'
      '       np.ud_weight,'
      '       np.us_subgroup_id,'
      '       np.us_subgroup_name,'
      '       np.sortname,'
      '       np.np_grp_fullname,'
      '       np.petrol_id,'
      '       np.us_group_id,'
      '       np.npg_order_id,'
      '       np.name_rus,'
      '       np.name_ukr,'
      '       np.codavias,'
      '       np.us_group_name,'
      '       np.fiscal_name,'
      '       np.fiscal_name_trunc,'
      
        '       to_number(substr(max(to_char(np_p.date_on, '#39'YYYYMMDD'#39') ||' +
        ' np_p.price), 9)) as priceavs,'
      
        '       to_number(ov.GetOutLinkVal('#39'OIL_NP_TYPE'#39',2,np.id)) as cod' +
        'optima,'
      
        '       to_number(ov.GetOutLinkVal('#39'OIL_NP_TYPE'#39',ov.GetVal('#39'NP_CO' +
        'DINT'#39'),np.id)) as codint,'
      '       max(np_p.date_on) as priceavs_date_on'
      '       &price'
      '  from v_oil_np_type np, oil_np_price np_p'
      ' where (np.id <= 1112 or np.id >= 1200)'
      '   and np_p.np_id(+) = np.id'
      '   and np_p.org_id(+) = ov.GetVal('#39'INST'#39')'
      '   and np_p.org_inst(+) = ov.GetVal('#39'INST'#39')'
      '   and np_p.price(+) <> 0'
      ' group by np.id,'
      '          np.name,'
      '          np.short_name,'
      '          np.np_grp,'
      '          np.np_grp_name,'
      '          np.ud_weight,'
      '          np.us_subgroup_id,'
      '          np.us_subgroup_name,'
      '          np.sortname,'
      '          np.np_grp_fullname,'
      '          np.petrol_id,'
      '          np.us_group_id,'
      '          np.npg_order_id,'
      '          np.name_rus,'
      '          np.name_ukr,'
      '          np.codavias,'
      '          np.us_group_name,'
      '          np.fiscal_name,'
      '          np.fiscal_name_trunc'
      ' order by np.name')
    OnCalcFields = qCalcFields
    Left = 200
    Top = 104
    MacroData = <
      item
        Name = 'price'
        Value = ', 0 as price'
      end>
    object qID: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'ID'
      Origin = 'V_OIL_NP_TYPE.ID'
    end
    object qNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Origin = 'V_OIL_NP_TYPE.NAME'
      Size = 255
    end
    object qPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      Visible = False
      DisplayFormat = '0.00'
    end
    object qSHORT_NAME: TStringField
      DisplayLabel = #1050#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'SHORT_NAME'
      Origin = 'V_OIL_NP_TYPE.SHORT_NAME'
      Size = 255
    end
    object qNP_GRP: TFloatField
      FieldName = 'NP_GRP'
      Origin = 'V_OIL_NP_TYPE.NP_GRP'
    end
    object qNP_GRP_NAME: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072' '#1053#1055
      FieldName = 'NP_GRP_NAME'
      Origin = 'V_OIL_NP_TYPE.NP_GRP_NAME'
      Size = 50
    end
    object qUD_WEIGHT: TFloatField
      FieldName = 'UD_WEIGHT'
      Origin = 'V_OIL_NP_TYPE.UD_WEIGHT'
    end
    object qUS_SUBGROUP_ID: TFloatField
      FieldName = 'US_SUBGROUP_ID'
      Origin = 'V_OIL_NP_TYPE.US_SUBGROUP_ID'
    end
    object qUS_SUBGROUP_NAME: TStringField
      DisplayLabel = #1055#1086#1076#1075#1088#1091#1087#1087#1072' '#1089#1086#1087'. '#1090#1086#1074#1072#1088#1072
      FieldName = 'US_SUBGROUP_NAME'
      Size = 40
    end
    object qSORTNAME: TStringField
      DisplayLabel = #1050#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'SORTNAME'
      Origin = 'MAINBASE.V_OIL_NP_TYPE.SORTNAME'
      Size = 255
    end
    object qNP_GRP_FULLNAME: TStringField
      FieldName = 'NP_GRP_FULLNAME'
      Origin = 'MAINBASE.V_OIL_NP_TYPE.NP_GRP_FULLNAME'
      Size = 50
    end
    object qPETROL_ID: TFloatField
      FieldName = 'PETROL_ID'
      Origin = 'MAINBASE.V_OIL_NP_TYPE.PETROL_ID'
    end
    object qUS_GROUP_ID: TFloatField
      FieldName = 'US_GROUP_ID'
      Origin = 'MAINBASE.V_OIL_NP_TYPE.US_GROUP_ID'
    end
    object qNPG_ORDER_ID: TFloatField
      FieldName = 'NPG_ORDER_ID'
      Origin = 'MAINBASE.V_OIL_NP_TYPE.NPG_ORDER_ID'
    end
    object qNAME_RUS: TStringField
      DisplayLabel = #1056#1091#1089#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME_RUS'
      Origin = 'MAINBASE.V_OIL_NP_TYPE.NAME_RUS'
      Size = 255
    end
    object qNAME_UKR: TStringField
      DisplayLabel = #1059#1082#1088#1072#1080#1085#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME_UKR'
      Origin = 'MAINBASE.V_OIL_NP_TYPE.NAME_UKR'
      Size = 255
    end
    object qCODAVIAS: TFloatField
      FieldName = 'CODAVIAS'
    end
    object qUS_GROUP_NAME: TStringField
      FieldName = 'US_GROUP_NAME'
      Size = 40
    end
    object qFISCAL_NAME: TStringField
      FieldName = 'FISCAL_NAME'
      Size = 22
    end
    object qFISCAL_NAME_TRUNC: TStringField
      FieldName = 'FISCAL_NAME_TRUNC'
      Size = 12
    end
    object qPRICEAVS: TFloatField
      FieldName = 'PRICEAVS'
      DisplayFormat = '0.00'
    end
    object qPRICEAVS_DATE_ON: TDateTimeField
      FieldName = 'PRICEAVS_DATE_ON'
    end
    object qCODOPTIMA: TFloatField
      FieldName = 'CODOPTIMA'
    end
    object qCODINT: TFloatField
      FieldName = 'CODINT'
    end
  end
  inherited ADMQ: TOilQuery
    Top = 304
  end
  inherited PUM: TPopupMenu
    Left = 192
    Top = 172
  end
  inherited ActionList: TActionList
    Left = 240
    Top = 172
  end
  object SP: TOilStoredProc
    Left = 289
    Top = 171
  end
end
