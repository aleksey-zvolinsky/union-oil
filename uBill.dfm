inherited BillForm: TBillForm
  Left = 380
  Top = 288
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1042#1099#1087#1080#1089#1082#1072' '#1089#1095#1077#1090#1072
  ClientHeight = 386
  ClientWidth = 689
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pBottom: TPanel
    Top = 353
    Width = 689
    inherited pBtn: TPanel
      Left = 492
    end
    object pMessage: TPanel
      Left = 2
      Top = 2
      Width = 359
      Height = 29
      Align = alLeft
      BevelInner = bvLowered
      Caption = #1057#1095#1077#1090' '#1079#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085' '#1076#1083#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103', '#1087#1086#1089#1083#1077' %d '#1084#1080#1085#1091#1090
      TabOrder = 1
    end
  end
  object grDetail: TDBGridEh [1]
    Left = 0
    Top = 101
    Width = 689
    Height = 252
    Align = alClient
    DataSource = dsDetail
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clSilver
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = [fsBold]
    FooterRowCount = 1
    ParentFont = False
    RowDetailPanel.Color = clBtnFace
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnEditButtonClick = grDetailEditButtonClick
    OnGetCellParams = grDetailGetCellParams
    OnKeyPress = grDetailKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'NP_NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        ReadOnly = True
        Visible = False
        Width = 214
      end
      item
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'OPER_NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        ReadOnly = True
        Width = 214
      end
      item
        EditButtons = <>
        FieldName = 'COUNT_'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'PRICE'
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'PRICE_X_NDS'
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'SUMM_X_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'SUMM_NDS'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'DIM_NAME'
        Footers = <>
        ReadOnly = True
        Width = 85
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pMain: TPanel [2]
    Left = 0
    Top = 0
    Width = 689
    Height = 77
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object LblDate_: TLabel
      Left = 170
      Top = 7
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1072#1090#1072':'
    end
    object Label1: TLabel
      Left = 501
      Top = 7
      Width = 113
      Height = 13
      Caption = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1077#1085' '#1061' '#1076#1085#1077#1081':'
    end
    object Label2: TLabel
      Left = 3
      Top = 32
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082':'
    end
    object Label3: TLabel
      Left = 1
      Top = 58
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
    end
    object Label4: TLabel
      Left = 411
      Top = 32
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = #1041#1072#1085#1082':'
    end
    object Label5: TLabel
      Left = 411
      Top = 58
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = #1041#1072#1085#1082':'
    end
    object Label6: TLabel
      Left = 291
      Top = 32
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = #1056'/'#1057':'
    end
    object Label7: TLabel
      Left = 291
      Top = 58
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = #1056'/'#1057':'
    end
    object Label8: TLabel
      Left = 571
      Top = 32
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = #1052#1060#1054':'
    end
    object Label9: TLabel
      Left = 571
      Top = 58
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = #1052#1060#1054':'
    end
    object Label10: TLabel
      Left = 27
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1086#1084#1077#1088':'
    end
    object sbAuto: TSpeedButton
      Left = 143
      Top = 3
      Width = 25
      Height = 21
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1085#1086#1084#1077#1088
      AllowAllUp = True
      GroupIndex = 1
      Down = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000015000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777777777000777777777777777777777000788778878877788778877000F087
        F0800087F08780087000F087F080FF08F08F0FF08000F087F0808F08F08F08F0
        8000F08870808F08F08F08F08000F00000808F08F08F08F08000F07FF0808F0F
        F08808F08000F087F08000700000F0087000F087F080087FFFFF7FF77000F087
        F08080877777777770007F087080808777777777700077F0008F0F7777777777
        7000777FFF77F777777777777000777777777777777777777000777777777777
        777777777000}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbAutoClick
    end
    object Label11: TLabel
      Left = 314
      Top = 7
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = #1042#1080#1076' '#1076#1086#1075#1086#1074#1086#1088#1072':'
    end
    object deDate_: TDateEdit
      Left = 200
      Top = 3
      Width = 90
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object seValidTime: TRxSpinEdit
      Left = 616
      Top = 3
      Width = 69
      Height = 21
      Value = 1.000000000000000000
      TabOrder = 1
    end
    object ceFrom: TComboEdit
      Left = 64
      Top = 27
      Width = 226
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = ceFromButtonClick
      OnChange = ceFromChange
      OnDblClick = ceFromButtonClick
    end
    object ceTo: TComboEdit
      Left = 64
      Top = 53
      Width = 226
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = ceToButtonClick
      OnChange = ceToChange
      OnDblClick = ceToButtonClick
    end
    object eFromRS: TEdit
      Left = 314
      Top = 32
      Width = 94
      Height = 21
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object eToRS: TEdit
      Left = 314
      Top = 58
      Width = 94
      Height = 21
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object eFromNameBank: TEdit
      Left = 441
      Top = 32
      Width = 128
      Height = 21
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object eFromMfoBank: TEdit
      Left = 605
      Top = 32
      Width = 79
      Height = 21
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object eDocNumber: TEdit
      Left = 64
      Top = 3
      Width = 79
      Height = 21
      TabOrder = 8
    end
    object cbBillType: TComboBox
      Left = 389
      Top = 3
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
      OnChange = cbBillTypeChange
      Items.Strings = (
        #1054#1073#1099#1095#1085#1099#1081
        #1058#1072#1083#1086#1085#1099
        #1050#1072#1088#1090#1086#1095#1082#1080
        #1042#1077#1076#1086#1084#1086#1089#1090#1100
        #1059#1089#1083#1091#1075#1080)
    end
  end
  object eToNameBank: TEdit [3]
    Left = 441
    Top = 58
    Width = 128
    Height = 21
    BorderStyle = bsNone
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object eToMfoBank: TEdit [4]
    Left = 605
    Top = 58
    Width = 79
    Height = 21
    BorderStyle = bsNone
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object pStates: TPanel [5]
    Left = 0
    Top = 77
    Width = 689
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object cbShipped: TCheckBox
      Left = 154
      Top = 2
      Width = 99
      Height = 17
      Caption = #1054#1090#1075#1088#1091#1078#1077#1085
      TabOrder = 0
      OnClick = cbShippedClick
    end
    object cbCashed: TCheckBox
      Left = 64
      Top = 2
      Width = 73
      Height = 17
      Caption = #1054#1087#1083#1072#1095#1077#1085
      TabOrder = 1
      OnClick = cbShippedClick
    end
    object cbCanceled: TCheckBox
      Left = 262
      Top = 2
      Width = 94
      Height = 17
      Caption = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085
      TabOrder = 2
      OnClick = cbCanceledClick
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select *'
      'from v_oil_bill_det'
      'where bill_id = :id and bill_inst = :inst'
      'order by id')
    Left = 24
    Top = 176
  end
  object mtDetail: TMemoryTable
    AfterInsert = mtDetailAfterInsert
    Left = 232
    Top = 180
    object mtDetailID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object mtDetailINST: TFloatField
      FieldName = 'INST'
      Required = True
      Visible = False
    end
    object mtDetailOPER_ID: TIntegerField
      FieldName = 'OPER_ID'
      Visible = False
    end
    object mtDetailOPER_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1091#1089#1083#1091#1075#1080
      FieldName = 'OPER_NAME'
      Size = 50
    end
    object mtDetailNP_ID: TFloatField
      FieldName = 'NP_ID'
      Visible = False
    end
    object mtDetailNP_NAME: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldName = 'NP_NAME'
      Size = 50
    end
    object mtDetailDIM_ID: TFloatField
      FieldName = 'DIM_ID'
      Visible = False
    end
    object mtDetailDIM_NAME: TStringField
      DisplayLabel = #1045#1076'.'#1080#1079#1084#1077#1088'.'
      FieldName = 'DIM_NAME'
      Size = 50
    end
    object mtDetailCOUNT_: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'COUNT_'
      OnChange = mtDetailCOUNT_Change
    end
    object mtDetailPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
      FieldName = 'PRICE'
      OnChange = mtDetailPRICEChange
      DisplayFormat = '0.##########'
    end
    object mtDetailPRICE_X_NDS: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
      FieldName = 'PRICE_X_NDS'
      OnChange = mtDetailPRICE_X_NDSChange
      DisplayFormat = '0.##########'
    end
    object mtDetailSUMM_NDS: TFloatField
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'SUMM_NDS'
      OnChange = mtDetailSUMM_NDSChange
      DisplayFormat = '0.##'
    end
    object mtDetailSUMM_X_NDS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057
      FieldName = 'SUMM_X_NDS'
      OnChange = mtDetailSUMM_X_NDSChange
      DisplayFormat = '0.##'
    end
  end
  object dsDetail: TDataSource
    DataSet = mtDetail
    Left = 244
    Top = 192
  end
  object qTalonCard: TOilQuery
    SQL.Strings = (
      'select decode(npg.Id, 9, npt.Name, npg.FullName) as NP_Name,'
      '       dim.Name as DimName,'
      '       det.COUNT_ as Amount,'
      '       det.Price,'
      '       det.price_x_nds,'
      '       det.summ_nds,'
      '       det.summ_x_nds,'
      '       1 as ordered'
      '  from Oil_Bill_Det    det,'
      '       V_Oil_NP_Type   npt,'
      '       V_Oil_NP_Group  npg,'
      '       V_Oil_DIMENSION dim'
      ' where det.State = '#39'Y'#39
      '   and det.Bill_Id = :BILL_ID'
      '   and det.Bill_Inst = :BILL_INST'
      '   and det.NP_ID = npt.ID(+)'
      '   and npt.np_grp = npg.Id(+)'
      '   and det.DIM_ID = dim.ID(+)'
      ' order by det.id')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 23
    Top = 239
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BILL_ID'
      end
      item
        DataType = ftUnknown
        Name = 'BILL_INST'
      end>
  end
  object qWork: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 24
    Top = 293
  end
end
