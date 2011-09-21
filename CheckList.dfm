inherited CheckListForm: TCheckListForm
  Left = 515
  Top = 224
  Width = 338
  Height = 395
  Caption = #1047#1076#1077#1089#1100' '#1084#1086#1075#1083#1072' '#1073#1099' '#1073#1099#1090#1100' '#1074#1072#1096#1072' '#1088#1077#1082#1083#1072#1084#1072
  OldCreateOrder = True
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 335
    Width = 330
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object sbCheckAll: TSpeedButton
      Tag = 1
      Left = 5
      Top = 4
      Width = 23
      Height = 22
      Hint = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077' '#1082#1086#1083#1086#1085#1082#1080
      Flat = True
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbCheckAllClick
    end
    object SpeedButton4: TSpeedButton
      Left = 29
      Top = 4
      Width = 23
      Height = 22
      Hint = #1057#1085#1103#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077' '#1089#1086' '#1074#1089#1077#1093' '#1082#1086#1083#1086#1085#1086#1082
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888889088888
        8888888887F88888888888889990888888888888777F88888888888899908888
        88888888777F88888888888999990888888888877777F8888888889999990888
        888888777777F888888887990899908888888877F8777F888888790890899088
        888887F87F877F8888888889990999088888888777F777F88888888999089908
        8888888777F877F888888799990889908888887777F8877F8888899999900879
        08888777777FF877F8887998899990879088877887777F877F88988888999008
        8990788888777FF8877F888888889990888888888888777F8888888888888999
        0888888888888777F88888888888888990888888888888877F88}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbCheckAllClick
    end
    object Panel3: TPanel
      Left = 133
      Top = 2
      Width = 195
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        195
        29)
      object bbOk: TBitBtn
        Left = 18
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1055#1088#1080#1085#1103#1090#1100
        Default = True
        ModalResult = 1
        TabOrder = 0
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
        Left = 108
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 1
        Kind = bkCancel
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 330
    Height = 33
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      330
      33)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 32
      Height = 13
      Caption = #1055#1086#1080#1089#1082
    end
    object sbClearSearch: TSpeedButton
      Left = 302
      Top = 3
      Width = 24
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
      OnClick = sbClearSearchClick
    end
    object edSearch: TEdit
      Left = 44
      Top = 4
      Width = 253
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnChange = edSearchChange
    end
  end
  object db: TDBGridEh
    Left = 0
    Top = 33
    Width = 330
    Height = 302
    Align = alClient
    Color = 15658991
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clGreen
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = [fsBold]
    FrozenCols = 1
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ds: TDataSource
    DataSet = q
    Left = 160
    Top = 104
  end
  object q: TOilQuery
    SQLUpdate.Strings = (
      'select 1 from dual')
    Session = frmStart.OraSession1
    FetchAll = True
    OnFilterRecord = qFilterRecord
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 148
    Top = 112
  end
  object qPartRashPvl: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select part_name,gtd_num,'
      '  sum(full_count) as full_count,'
      '  sum(rest_full_tonn) as rest_full_tonn,'
      '  part_id,part_inst, gtd_id,gtd_inst'
      'from v_oil_rashpvl_prihsum'
      'where part_from_id=nvl(:part_from_id,part_from_id)'
      '  and part_from_inst=nvl(:part_from_inst,part_from_inst)'
      '  and part_to_id=nvl(:part_to_id,part_to_id)'
      '  and part_to_inst=nvl(:part_to_inst,part_to_inst)'
      '  and np_type=:np_type'
      '  and date_<=:date_'
      'group by part_id,part_inst,part_name,gtd_id,gtd_inst,gtd_num'
      'having sum(rest_full_tonn)>0')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 84
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'part_from_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'part_from_inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'part_to_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'part_to_inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'np_type'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end>
  end
  object qTank: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select zrd.tank_num, zrd.zd_nakl, zrd.np_type_name,'
      '  zrd.full_count,zrd.water_count,'
      
        '  zrd.density,zrd.temperature,zrd.level_mm,zrd.pv,zrd.tank_type_' +
        'name,'
      '  zrd.np_type,zrd.zrd_id, zrd.zrd_inst,tank_type'
      'from'
      '  (select *'
      '   from'
      '    (select'
      '      v.*,'
      
        '      row_number() over (partition by tank_num order by date_ de' +
        'sc, q_id desc) rnum,'
      
        '      lead(q_id) over (partition by tank_num order by date_, q_i' +
        'd) as next_q_id'
      '    from v_oil_tank_move v'
      '    ) QQ'
      
        '   where q_id=decode(:np_type,0,1,2) and nvl(next_q_id,0)<>q_id+' +
        '1'
      '     and date_<=:date_'
      '  ) Q, v_oil_zavod_rash_full zrd'
      'where Q.zrd_id=zrd.zrd_id and Q.zrd_inst=zrd.zrd_inst'
      '  and (zrd.id=:zr_id or nvl(:zr_id,0)=0)'
      '  and (zrd.inst=:zr_inst or nvl(:zr_inst,0)=0)'
      '  and (zrd.np_type=:np_type or nvl(:np_type,0)=0)'
      '  and (zrd.gtd_id=:gtd_id or nvl(:gtd_id,0)=0)'
      '  and (zrd.gtd_inst=:gtd_inst or nvl(:gtd_inst,0)=0)'
      'order by zrd.id,zrd.inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 20
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'np_type'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'zr_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'zr_inst'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'gtd_id'
      end
      item
        DataType = ftInteger
        Name = 'gtd_inst'
        ParamType = ptInput
      end>
  end
end
