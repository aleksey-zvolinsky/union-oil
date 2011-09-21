inherited ubMonthForm: TubMonthForm
  Left = 289
  Top = 176
  BorderStyle = bsSingle
  Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1077' '#1077#1089#1090#1077#1089#1090#1074#1077#1085#1085#1086#1081' '#1091#1073#1099#1083#1080' '#1079#1072' '#1084#1077#1089#1103#1094
  ClientHeight = 357
  ClientWidth = 501
  OldCreateOrder = True
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 324
    Width = 501
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel3: TPanel
      Left = 175
      Top = 2
      Width = 324
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbOk: TBitBtn
        Left = 119
        Top = 2
        Width = 95
        Height = 25
        Caption = '&'#1053#1072#1095#1080#1089#1083#1080#1090#1100
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
      object bbCancel: TBitBtn
        Left = 223
        Top = 2
        Width = 95
        Height = 25
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 2
        OnClick = bbCancelClick
        Kind = bkCancel
      end
      object bbCalc: TBitBtn
        Left = 15
        Top = 2
        Width = 95
        Height = 25
        Caption = '&'#1056#1072#1089#1089#1095#1080#1090#1072#1090#1100
        TabOrder = 0
        OnClick = bbCalcClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00338000000000
          83333338888888883F333307777777770333338F3F3F3FFF8F33330707079997
          0333338F838388838F333307777777770333338F3F3F3F3F8F33330707070707
          0333338F838383838F333307777777770333338F3F3F3F3F8F33330707070707
          0333338F838383838F333307777777770333338F3F3F3F3F8F33330707070707
          0333338F838383838F333307777777770333338F3FFFFFFF8F33330700000007
          0333338F8888888F8F333307000E0E070333338F8FFFFF8F8F33330700000007
          0333338F888888838F333307777777770333338F333333338F33330777777777
          03333383FFFFFFFF833333800000000083333338888888883333}
        NumGlyphs = 2
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 501
    Height = 38
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 120
      Height = 13
      Caption = #1045#1089#1090#1077#1089#1090#1074#1077#1085#1085#1072#1103' '#1091#1073#1099#1083#1100' '#1079#1072
    end
    object Label2: TLabel
      Left = 301
      Top = 12
      Width = 138
      Height = 13
      Caption = #1073#1091#1076#1077#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1072' '#1074' '#1086#1073#1098#1077#1084#1077':'
    end
    object cbMonth: TComboBox
      Left = 149
      Top = 8
      Width = 105
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbMonthChange
      Items.Strings = (
        #1103#1085#1074#1072#1088#1100
        #1092#1077#1074#1088#1072#1083#1100
        #1084#1072#1088#1090
        #1072#1087#1088#1077#1083#1100
        #1084#1072#1081
        #1080#1102#1085#1100
        #1080#1102#1083#1100
        #1072#1074#1075#1091#1089#1090
        #1089#1077#1085#1090#1103#1073#1088#1100
        #1086#1082#1090#1103#1073#1088#1100
        #1085#1086#1103#1073#1088#1100
        #1076#1077#1082#1072#1073#1088#1100)
    end
    object meYear: TMaskEdit
      Left = 261
      Top = 8
      Width = 33
      Height = 21
      EditMask = '0000;1;_'
      MaxLength = 4
      TabOrder = 1
      Text = '2001'
      OnChange = meYearChange
    end
  end
  object pBase: TPanel
    Left = 0
    Top = 38
    Width = 501
    Height = 286
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pBase'
    TabOrder = 2
    object DBGrid1: TDBGridEh
      Left = 0
      Top = 0
      Width = 501
      Height = 286
      Align = alClient
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = PUM
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object ds: TOraDataSource
    DataSet = q
    Left = 228
    Top = 108
  end
  object q: TOilQuery
    SQL.Strings = (
      'select'
      '  rez_id,'
      '  rez_inst,'
      '  rez_num,'
      '  rez_name,'
      '  np_type,'
      '  np_name,'
      
        '  sum(start_rest)                                               ' +
        '              st_rest,'
      '  decode(sum(month_prih),0,'
      '     nvl(getubil(3,np_type, rez_id,rez_inst, :month),0),'
      
        '     nvl(getubil(2,np_type, rez_id,rez_inst, :month),0))        ' +
        '              norm_hran,'
      '  decode(sum(month_prih),0,'
      
        '     nvl(getubil(3,np_type, rez_id,rez_inst, :month),0) * sum(st' +
        'art_rest),'
      
        '     nvl(getubil(2,np_type, rez_id,rez_inst, :month),0) * sum(st' +
        'art_rest))    ub_hran,'
      
        '  sum(month_prih)                                               ' +
        '              mo_prih,'
      '  nvl(getubil(1,np_type, rez_id,rez_inst, :month ),0) +'
      
        '        nvl(getubil(2,np_type, rez_id,rez_inst, :month ),0)     ' +
        '              norm_prih,'
      
        '  nvl(getubil(1,np_type, rez_id,rez_inst, :month ),0) * sum(mont' +
        'h_prih) +'
      
        '        nvl(getubil(2,np_type, rez_id,rez_inst, :month ),0) * su' +
        'm(month_prih) ub_prih,'
      
        '  sum(month_rash)                                               ' +
        '              mo_rash, '
      
        '  nvl(getubil(5,np_type, rez_id,rez_inst, :month),0)            ' +
        '              norm_rash,'
      
        '  nvl(getubil(5,np_type, rez_id,rez_inst, :month),0) * sum(month' +
        '_rash)        ub_rash,'
      '  decode(sum(month_prih),0,'
      
        '     nvl(getubil(3,np_type, rez_id,rez_inst, :month),0) * sum(st' +
        'art_rest),'
      
        '     nvl(getubil(2,np_type, rez_id,rez_inst, :month),0) * sum(st' +
        'art_rest))+'
      
        '     nvl(getubil(1,np_type, rez_id,rez_inst, :month ),0) * sum(m' +
        'onth_prih) +'
      
        '     nvl(getubil(2,np_type, rez_id,rez_inst, :month ),0) * sum(m' +
        'onth_prih)+'
      
        '     nvl(getubil(5,np_type, rez_id,rez_inst, :month),0) * sum(mo' +
        'nth_rash)     ub_all'
      'from'
      '('
      '  select '
      
        '    oro.id                                                      ' +
        '         rez_id,'
      
        '    oro.inst                                                    ' +
        '         rez_inst,'
      
        '    oro.num                                                     ' +
        '         rez_num,'
      
        '    oro.name                                                    ' +
        '         rez_name,'
      
        '    start_rest                                                  ' +
        '         start_rest,'
      
        '    month_prih                                                  ' +
        '         month_prih,'
      
        '    month_rash                                                  ' +
        '         month_rash,'
      
        '    vop.id                                                      ' +
        '         part_id,'
      
        '    vop.inst                                                    ' +
        '         part_inst,'
      
        '    vop.np_type                                                 ' +
        '         np_type,'
      
        '    vop.np_type_name                                            ' +
        '         np_name   '
      '  from '
      '    oil_rezervuar oro,'
      '    v_oil_part vop,'
      '    ('
      '    select '
      '      sum(s) start_rest,'
      '      0      month_prih,'
      '      0      month_rash,'
      '      rez_id,'
      '      rez_inst,'
      '      part_id,'
      '      part_inst,'
      '      np_type'
      '    from'
      '      v_oil_left'
      '    where'
      '      date_ < :start_date ----------'
      '    group by'
      '      rez_id,rez_inst, part_id, part_inst, np_type'
      '    having '
      '      sum (s) <> 0 '
      '    union'
      '    select '
      '      0      start_rest,'
      '      sum(s) month_prih,'
      '      0      month_rash,'
      '      rez_id,'
      '      rez_inst,'
      '      part_id,'
      '      part_inst,'
      '      np_type'
      '    from'
      '      v_oil_left'
      '    where'
      '      date_ >= :start_date and ----------'
      '      date_ <= :end_date   and ----------'
      '      s > 0'
      '    group by'
      '      rez_id,rez_inst, part_id, part_inst, np_type'
      '    having sum(s) > 0 '
      '    union'
      '    select '
      '      0       start_rest,'
      '      0       month_prih,'
      '      -sum(s) month_rash,'
      '      rez_id,'
      '      rez_inst,'
      '      part_id,'
      '      part_inst,'
      '      np_type'
      '    from'
      '      v_oil_left'
      '    where'
      '      date_ >= :start_date and ----------'
      '      date_ <= :end_date   and ----------'
      '      s < 0'
      '    group by'
      '      rez_id,rez_inst, part_id, part_inst, np_type'
      '    having sum(s) < 0 '
      '    )restQ'
      '  where'
      '    oro.state = '#39'Y'#39' and'
      '    oro.inst_org = :inst and '
      '    restQ.rez_id   (+)= oro.id       and'
      '    restQ.rez_inst (+)= oro.inst     and'
      '    (start_rest is not null or'
      '    month_prih is not null or'
      '    month_rash is not null)         and   '
      '    vop.base_ = 0                    and -- '#1085#1077' '#1092#1072#1089#1086#1074#1072#1085#1099#1081' '#1090#1086#1074#1072#1088
      
        '    vop.dim_id = 2                   and -- '#1090#1086#1074#1072#1088', '#1091#1095#1080#1090#1099#1074#1072#1077#1084#1099#1081' '#1074 +
        ' '#1090#1086#1085#1085#1072#1093
      '    vop.id        (+)= part_id       and'
      '    vop.inst      (+)= part_inst     '
      ')'
      'group by'
      '  rez_id, rez_inst, rez_num, rez_name, np_type, np_name'
      'order by rez_num'
      ' ')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 136
    Top = 108
    ParamData = <
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftInteger
        Name = 'month'
      end
      item
        DataType = ftDateTime
        Name = 'start_date'
      end
      item
        DataType = ftDateTime
        Name = 'start_date'
      end
      item
        DataType = ftDateTime
        Name = 'end_date'
      end
      item
        DataType = ftDateTime
        Name = 'start_date'
      end
      item
        DataType = ftDateTime
        Name = 'end_date'
      end
      item
        DataType = ftInteger
        Name = 'inst'
      end>
    object qREZ_ID: TFloatField
      FieldName = 'REZ_ID'
      ReadOnly = True
      Visible = False
    end
    object qREZ_INST: TFloatField
      FieldName = 'REZ_INST'
      ReadOnly = True
      Visible = False
    end
    object qREZ_NUM: TStringField
      DisplayLabel = #1056#1077#1079'. '#8470
      DisplayWidth = 8
      FieldName = 'REZ_NUM'
      ReadOnly = True
    end
    object qREZ_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074'. '#1088#1077#1079'.'
      DisplayWidth = 15
      FieldName = 'REZ_NAME'
      ReadOnly = True
      Size = 50
    end
    object qNP_TYPE: TFloatField
      FieldName = 'NP_TYPE'
      ReadOnly = True
      Visible = False
    end
    object qNP_NAME: TStringField
      DisplayLabel = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
      FieldName = 'NP_NAME'
      ReadOnly = True
      Size = 50
    end
    object qST_REST: TFloatField
      DisplayLabel = #1054#1089#1090'. '#1085#1072' '#1085#1072#1095'. '#1084#1077#1089'. '#1090'.'
      FieldName = 'ST_REST'
      ReadOnly = True
      DisplayFormat = '0.######'
    end
    object qNORM_HRAN: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1091#1073#1099#1083#1080
      FieldName = 'NORM_HRAN'
      ReadOnly = True
      DisplayFormat = '0.######'
    end
    object qUB_HRAN: TFloatField
      DisplayLabel = #1053#1072#1095'. '#1091#1073'. '#1085#1072' '#1093#1088#1072#1085'. '#1090'.'
      FieldName = 'UB_HRAN'
      ReadOnly = True
      DisplayFormat = '0.######'
    end
    object qMO_PRIH: TFloatField
      DisplayLabel = #1055#1088#1080#1093'. '#1079#1072' '#1084#1077#1089'. '#1090'.'
      FieldName = 'MO_PRIH'
      ReadOnly = True
      DisplayFormat = '0.######'
    end
    object qNORM_PRIH: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1091#1073#1099#1083#1080
      FieldName = 'NORM_PRIH'
      ReadOnly = True
      DisplayFormat = '0.######'
    end
    object qUB_PRIH: TFloatField
      DisplayLabel = #1053#1072#1095'. '#1091#1073'. '#1085#1072' '#1087#1088#1080#1093'. '#1090'.'
      FieldName = 'UB_PRIH'
      ReadOnly = True
      DisplayFormat = '0.######'
    end
    object qMO_RASH: TFloatField
      DisplayLabel = #1056#1072#1089#1093'. '#1079#1072' '#1084#1077#1089'. '#1090'.'
      FieldName = 'MO_RASH'
      ReadOnly = True
      DisplayFormat = '0.######'
    end
    object qNORM_RASH: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1091#1073#1099#1083#1080
      FieldName = 'NORM_RASH'
      ReadOnly = True
      DisplayFormat = '0.######'
    end
    object qUB_RASH: TFloatField
      DisplayLabel = #1053#1072#1095'. '#1091#1073'. '#1085#1072' '#1088#1072#1089#1093'. '#1090'.'
      FieldName = 'UB_RASH'
      ReadOnly = True
      DisplayFormat = '0.######'
    end
    object qUB_ALL: TFloatField
      DisplayLabel = #1042#1089#1077#1075#1086' '#1091#1073#1099#1083#1080' '#1090'.'
      FieldName = 'UB_ALL'
      DisplayFormat = '0.######'
    end
  end
  object ADMQ: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 8
    Top = 280
  end
  object PUM: TPopupMenu
    Left = 384
    Top = 144
    object MI1: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      OnClick = MI1Click
    end
  end
  object ExistQ: TOilQuery
    SQL.Strings = (
      'select count(*) co'
      '  from oil_ub_month'
      ' where month_ = :date_'
      '   and inst = :inst')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 136
    Top = 142
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'date_'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
  object sp: TOilStoredProc
        Left = 192
    Top = 222
  end
  object GetSeqQuery: TOilQuery
    SQL.Strings = (
      'select s_oil_ub_month.nextval as nv from sys.dual')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 192
    Top = 192
    object GetSeqQueryNV: TFloatField
      FieldName = 'NV'
    end
  end
  object DelQ: TOilQuery
    SQL.Strings = (
      'update oil_ub_month'
      '   set state = '#39'N'#39
      ' where month_ = :date_'
      '   and inst = :inst')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 304
    Top = 118
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'date_'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
end
