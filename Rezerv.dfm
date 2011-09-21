inherited RezervForm: TRezervForm
  Left = 285
  Top = 253
  Width = 665
  Height = 403
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 337
    Width = 657
    Height = 32
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    DesignSize = (
      657
      32)
    object bbCancel: TBitBtn
      Left = 566
      Top = 4
      Width = 87
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1088
      Anchors = [akTop, akRight]
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      Kind = bkCancel
    end
    object bbOk: TBitBtn
      Left = 477
      Top = 4
      Width = 87
      Height = 25
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102
      Anchors = [akTop, akRight]
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      TabOrder = 1
      OnClick = bbOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCalibr: TBitBtn
      Left = 5
      Top = 4
      Width = 89
      Height = 25
      Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072
      TabOrder = 0
      OnClick = btnCalibrClick
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 290
    Width = 657
    Height = 47
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      657
      47)
    object Label14: TLabel
      Left = 6
      Top = 4
      Width = 63
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object edBrokenState: TEdit
      Left = 5
      Top = 20
      Width = 232
      Height = 21
      TabStop = False
      BiDiMode = bdRightToLeft
      Ctl3D = True
      ParentBiDiMode = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      Text = 'ReadOnly'
      OnEnter = edBrokenStateEnter
    end
    object edComments: TEdit
      Left = 236
      Top = 20
      Width = 415
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 329
    Height = 290
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object Panel3: TPanel
      Left = 0
      Top = 115
      Width = 329
      Height = 175
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label5: TLabel
        Left = 6
        Top = 4
        Width = 84
        Height = 13
        Caption = #1025#1084#1082#1086#1089#1090#1100' ('#1084'.'#1082#1091#1073'.)'
      end
      object Label6: TLabel
        Left = 108
        Top = 4
        Width = 53
        Height = 13
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      end
      object Label7: TLabel
        Left = 6
        Top = 46
        Width = 89
        Height = 13
        Caption = #1052#1105#1088#1090#1074#1099#1081' '#1086#1089#1090#1072#1090#1086#1082
      end
      object Label8: TLabel
        Left = 231
        Top = 4
        Width = 91
        Height = 13
        Caption = #1050#1086#1088#1088#1077#1082#1094#1080#1103' '#1076#1085#1080#1097#1072
      end
      object Label18: TLabel
        Left = 6
        Top = 94
        Width = 88
        Height = 13
        Caption = #1057#1074#1077#1090#1083#1099#1081'/'#1090#1077#1084#1085#1099#1081
      end
      object Label19: TLabel
        Left = 106
        Top = 94
        Width = 147
        Height = 13
        Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1099#1081'/'#1072#1088#1077#1085#1076#1086#1074#1072#1085#1085#1099#1081
      end
      object Label21: TLabel
        Left = 5
        Top = 133
        Width = 72
        Height = 13
        Caption = #1057#1076#1072#1085' '#1074' '#1072#1088#1077#1085#1076#1091
      end
      object calcCapacity: TRxCalcEdit
        Left = 6
        Top = 20
        Width = 94
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 0
      end
      object leUb_Kat: TRxLookupEdit
        Left = 105
        Top = 20
        Width = 120
        Height = 21
        DropDownCount = 9
        DropDownWidth = 200
        ListStyle = lsDelimited
        LookupField = 'NAME'
        LookupSource = dsUb_Kat
        DirectInput = False
        TabOrder = 2
        OnCloseUp = leUb_KatCloseUp
      end
      object calcDead: TRxCalcEdit
        Left = 6
        Top = 62
        Width = 94
        Height = 21
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 1
      end
      object calcDno_Corr: TRxCalcEdit
        Left = 231
        Top = 20
        Width = 92
        Height = 21
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 3
      end
      object cbDarkLight: TComboBox
        Left = 6
        Top = 110
        Width = 93
        Height = 21
        ItemHeight = 13
        TabOrder = 5
        Items.Strings = (
          #1058#1077#1084#1085#1099#1081
          #1057#1074#1077#1090#1083#1099#1081)
      end
      object cbOwnArenda: TComboBox
        Left = 104
        Top = 110
        Width = 149
        Height = 21
        ItemHeight = 13
        TabOrder = 6
        Items.Strings = (
          #1040#1088#1077#1085#1076#1086#1074#1072#1085#1085#1099#1081
          #1057#1086#1073#1089#1090#1074#1077#1085#1085#1099#1081
          '')
      end
      object cbArenda: TComboEdit
        Left = 5
        Top = 148
        Width = 248
        Height = 21
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 7
        OnButtonClick = cbArendaButtonClick
      end
      object gbTubing: TGroupBox
        Left = 105
        Top = 41
        Width = 219
        Height = 52
        Caption = #1058#1088#1091#1073#1086#1087#1088#1086#1074#1086#1076
        TabOrder = 4
        object Label22: TLabel
          Left = 109
          Top = 8
          Width = 84
          Height = 13
          Caption = #1025#1084#1082#1086#1089#1090#1100' ('#1084'.'#1082#1091#1073'.)'
        end
        object rbTubSeparate: TRadioButton
          Left = 7
          Top = 31
          Width = 89
          Height = 17
          Caption = #1056#1072#1079#1076#1077#1083#1100#1085#1099#1081
          TabOrder = 0
          OnClick = rbTubingChange
        end
        object rbTubCommon: TRadioButton
          Left = 7
          Top = 14
          Width = 89
          Height = 17
          Caption = #1054#1073#1097#1080#1081
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = rbTubingChange
        end
        object calcTubCapacity: TRxCalcEdit
          Left = 109
          Top = 24
          Width = 103
          Height = 20
          AutoSize = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 2
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 329
      Height = 115
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label3: TLabel
        Left = 6
        Top = 7
        Width = 73
        Height = 13
        Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' :'
      end
      object Label1: TLabel
        Left = 208
        Top = 8
        Width = 56
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' :'
      end
      object Label2: TLabel
        Left = 6
        Top = 47
        Width = 28
        Height = 13
        Caption = #1058#1080#1087' : '
      end
      object Label4: TLabel
        Left = 105
        Top = 64
        Width = 40
        Height = 13
        Caption = #1053#1086#1084#1077#1088' :'
      end
      object Label11: TLabel
        Left = 105
        Top = 93
        Width = 44
        Height = 13
        Caption = #1058#1080#1087' '#1053#1055': '
      end
      object cbOrg: TComboEdit
        Left = 6
        Top = 24
        Width = 185
        Height = 21
        DirectInput = False
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 0
        OnButtonClick = cbOrgButtonClick
        OnDblClick = cbOrgButtonClick
      end
      object edName: TEdit
        Left = 195
        Top = 24
        Width = 129
        Height = 21
        TabOrder = 1
      end
      object edType: TEdit
        Left = 24
        Top = 63
        Width = 70
        Height = 21
        TabOrder = 2
      end
      object edNum: TEdit
        Left = 151
        Top = 62
        Width = 82
        Height = 21
        TabOrder = 3
        OnKeyPress = edYearKeyPress
      end
      object cbNpType: TComboEdit
        Left = 151
        Top = 89
        Width = 158
        Height = 21
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 4
        OnButtonClick = cbNpTypeButtonClick
        OnDblClick = cbNpTypeButtonClick
      end
      object rbReal: TRadioButton
        Left = 6
        Top = 65
        Width = 17
        Height = 17
        TabOrder = 5
      end
      object rbVirtual: TRadioButton
        Left = 6
        Top = 91
        Width = 91
        Height = 17
        Caption = #1042#1080#1088#1090#1091#1072#1083#1100#1085#1099#1081
        TabOrder = 6
        OnClick = rbVirtualClick
      end
    end
  end
  object Panel8: TPanel
    Left = 329
    Top = 0
    Width = 328
    Height = 290
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel4: TPanel
      Left = 0
      Top = 96
      Width = 328
      Height = 141
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      DesignSize = (
        328
        141)
      object Label9: TLabel
        Left = 6
        Top = 8
        Width = 96
        Height = 13
        Caption = #1043#1086#1076' '#1074#1074#1086#1076#1072' '#1074' '#1101#1082#1089#1087#1083'.'
      end
      object Label10: TLabel
        Left = 118
        Top = 8
        Width = 54
        Height = 13
        Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
      end
      object Label12: TLabel
        Left = 6
        Top = 49
        Width = 98
        Height = 13
        Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083'. '#1086#1073#1089#1083#1077#1076'.'
      end
      object Label13: TLabel
        Left = 118
        Top = 49
        Width = 119
        Height = 13
        Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083'. '#1082#1072#1083#1080#1073#1088#1086#1074#1082#1080
      end
      object cbCondition: TComboBox
        Left = 118
        Top = 24
        Width = 204
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbConditionChange
        Items.Strings = (
          #1048#1089#1087#1088#1072#1074#1077#1085
          #1053#1077' '#1080#1089#1087#1088#1072#1074#1077#1085' ('#1074' '#1088#1077#1084#1086#1085#1090#1077')'
          #1053#1077' '#1079#1072#1074#1077#1088#1096#1077#1085#1086' '#1089#1090#1088#1086#1080#1090#1077#1083#1100#1089#1090#1074#1086
          #1053#1077' '#1087#1086#1076#1083#1077#1078#1080#1090' '#1088#1077#1084#1086#1085#1090#1091)
      end
      object deInspection: TDateEdit
        Left = 6
        Top = 65
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 2
      end
      object deCal: TDateEdit
        Left = 118
        Top = 65
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 3
      end
      object deYear: TDateEdit
        Left = 6
        Top = 24
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
        OnChange = deYearChange
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 328
      Height = 96
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      DesignSize = (
        328
        96)
      object Label15: TLabel
        Left = 6
        Top = 8
        Width = 102
        Height = 13
        Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083'. '#1088#1077#1084#1086#1085#1090#1072
      end
      object Label16: TLabel
        Left = 120
        Top = 8
        Width = 101
        Height = 13
        Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083'. '#1086#1082#1088#1072#1089#1082#1080
      end
      object Label17: TLabel
        Left = 6
        Top = 48
        Width = 101
        Height = 13
        Caption = #1063#1090#1086' '#1088#1077#1084#1086#1085#1090#1080#1088#1086#1074#1072#1083#1080
      end
      object deRepair: TDateEdit
        Left = 6
        Top = 24
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object deColouring: TDateEdit
        Left = 120
        Top = 24
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
      object edRepair: TEdit
        Left = 8
        Top = 64
        Width = 311
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object Panel9: TPanel
      Left = 0
      Top = 237
      Width = 328
      Height = 53
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      DesignSize = (
        328
        53)
      object Label20: TLabel
        Left = 6
        Top = 5
        Width = 51
        Height = 13
        Caption = #1069#1083#1077#1074#1072#1090#1086#1088':'
      end
      object SpeedButton1: TSpeedButton
        Left = 300
        Top = 20
        Width = 23
        Height = 22
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
        OnClick = SpeedButton1Click
      end
      object ceElev: TRxLookupEdit
        Left = 6
        Top = 21
        Width = 292
        Height = 21
        LookupField = 'NAME'
        LookupSource = dsElev
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnCloseUp = ceElevCloseUp
        OnButtonClick = ceElevButtonClick
      end
    end
  end
  object qUb_Kat: TOilQuery
    SQL.Strings = (
      'select *'
      'from oil_rez_types'
      'order by id')
    AfterOpen = qUb_KatAfterOpen
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 374
    Top = 193
    object qUb_KatID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_REZ_TYPES.ID'
    end
    object qUb_KatSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'OIL_REZ_TYPES.STATE'
      Size = 1
    end
    object qUb_KatNAME: TStringField
      FieldName = 'NAME'
      Origin = 'OIL_REZ_TYPES.NAME'
      Size = 70
    end
  end
  object dsUb_Kat: TOraDataSource
    DataSet = qUb_Kat
    Left = 382
    Top = 185
  end
  object qElev: TOilQuery
    SQL.Strings = (
      'select id,name'
      'from v_org'
      'where state='#39'Y'#39'   '
      '          and org_type=29'
      '          and id=inst')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 431
    Top = 192
    object qElevID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_ORG.ID'
    end
    object qElevNAME: TStringField
      FieldName = 'NAME'
      Origin = 'OIL_ORG.NAME'
      Size = 100
    end
  end
  object dsElev: TOraDataSource
    DataSet = qElev
    Left = 439
    Top = 184
  end
  object mt: TMemoryTable
    AfterInsert = mtAfterInsert
    BeforePost = mtBeforePost
    Left = 574
    Top = 193
    object mtID: TFloatField
      FieldName = 'ID'
    end
    object mtSTATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object mtNP_TYPE_NAME: TStringField
      FieldName = 'NP_TYPE_NAME'
      Size = 50
    end
    object mtNP_TYPE: TFloatField
      FieldName = 'NP_TYPE'
    end
    object mtDATE_: TStringField
      FieldName = 'DATE_'
      OnChange = mtDATE_Change
      EditMask = '00.00.0000'
    end
    object mtFIRST_LINE: TStringField
      FieldName = 'FIRST_LINE'
      Size = 1
    end
  end
  object qNp: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select rzn.*,npt.name as np_type_name'
      'from oil_rez_np_type rzn,oil_np_type npt'
      'where rzn.state='#39'Y'#39' and rzn.rez_id=:id'
      '  and rzn.rez_inst=:inst'
      '  and rzn.np_type=npt.id'
      'order by date_')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 534
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end>
  end
  object mtArenda: TMemoryTable
    AfterInsert = mtArendaAfterInsert
    BeforePost = mtArendaBeforePost
    Left = 614
    Top = 193
    object mtArendaID: TFloatField
      FieldName = 'ID'
    end
    object mtArendaSTATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object mtArendaORG_ID: TFloatField
      FieldName = 'ORG_ID'
    end
    object mtArendaORG_INST: TFloatField
      FieldName = 'ORG_INST'
    end
    object mtArendaORG_NAME: TStringField
      FieldName = 'ORG_NAME'
      Size = 100
    end
    object mtArendaDATE_: TDateField
      FieldName = 'DATE_'
    end
    object mtArendaOPER_TYPE: TFloatField
      FieldName = 'OPER_TYPE'
    end
    object mtArendaOPER_TYPE_NAME: TStringField
      FieldName = 'OPER_TYPE_NAME'
      Size = 50
    end
  end
  object qArenda: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select oo.name as org_name,ra.*'
      'from oil_rez_arenda ra,v_org oo'
      'where ra.org_id=oo.id(+) and ra.org_inst=oo.inst(+)'
      '  and ra.state='#39'Y'#39
      '  and ra.rez_id=:id and ra.rez_inst=:inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 494
    Top = 193
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end>
  end
end
