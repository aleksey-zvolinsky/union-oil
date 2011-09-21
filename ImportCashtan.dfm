inherited ImportCashtanForm: TImportCashtanForm
  Left = 399
  Top = 346
  Width = 566
  Height = 263
  Caption = #1048#1084#1087#1086#1088#1090' '#1080#1079' Cashtan'
  OldCreateOrder = True
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object gbChooseFile: TGroupBox
    Left = 0
    Top = 0
    Width = 558
    Height = 203
    Align = alClient
    Caption = #1042#1099#1073#1086#1088' '#1092#1072#1081#1083#1072' Cashtan (*.dbf)'
    TabOrder = 0
    DesignSize = (
      558
      203)
    object sbClearTo: TSpeedButton
      Left = 526
      Top = 58
      Width = 23
      Height = 22
      Anchors = [akRight]
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
      OnClick = sbClearToClick
    end
    object lTo: TLabel
      Left = 8
      Top = 63
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = #1040#1047#1057':'
    end
    object FilenameEdit: TFilenameEdit
      Left = 8
      Top = 16
      Width = 542
      Height = 21
      Filter = 'All files (*.*)|*.*|Cashtan files (*.dbf)|*.dbf'
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 0
    end
    object ProgressBar: TProgressBar
      Left = 8
      Top = 40
      Width = 542
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object gbChoose: TGroupBox
      Left = 2
      Top = 83
      Width = 554
      Height = 118
      Align = alBottom
      Caption = #1042#1099#1073#1086#1088' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
      TabOrder = 2
      object rbRest: TRadioButton
        Left = 16
        Top = 13
        Width = 473
        Height = 17
        Caption = #1054#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1040#1047#1057
        TabOrder = 0
      end
      object rbComing: TRadioButton
        Left = 16
        Top = 29
        Width = 473
        Height = 17
        Caption = #1055#1088#1080#1093#1086#1076#1099' '#1085#1072' '#1089#1082#1083#1072#1076
        Enabled = False
        TabOrder = 1
      end
      object rbMotion: TRadioButton
        Left = 16
        Top = 45
        Width = 473
        Height = 17
        Caption = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' '#1085#1072' '#1040#1047#1057
        Checked = True
        TabOrder = 2
        TabStop = True
      end
      object rbSelling: TRadioButton
        Left = 16
        Top = 77
        Width = 473
        Height = 17
        Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1085#1072' '#1040#1047#1057
        Enabled = False
        TabOrder = 3
      end
      object rbPrice: TRadioButton
        Left = 16
        Top = 93
        Width = 473
        Height = 17
        Caption = #1058#1086#1083#1100#1082#1086' '#1094#1077#1085#1099
        TabOrder = 4
      end
      object rbReturn: TRadioButton
        Left = 16
        Top = 61
        Width = 473
        Height = 17
        Caption = #1042#1086#1079#1074#1088#1072#1090#1099' '#1089' '#1040#1047#1057
        TabOrder = 5
      end
    end
    object edTo: TComboEdit
      Left = 40
      Top = 59
      Width = 484
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = edToButtonClick
      OnDblClick = edToButtonClick
    end
  end
  object pBottom: TPanel
    Left = 0
    Top = 203
    Width = 558
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object sbLog: TSpeedButton
      Left = 6
      Top = 3
      Width = 25
      Height = 25
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1083#1086#1075
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF007B7B
        7B00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
        BD00BDBDBD00BDBDBD00BDBDBD0000000000FF00FF00FF00FF00FF00FF007B7B
        7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BDBDBD0000000000FF00FF00FF00FF00FF00FF007B7B
        7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BDBDBD0000000000FF00FF00FF00FF00FF00FF007B7B
        7B00FF00FF00FF00FF0000000000000000000000000000000000000000000000
        0000FF00FF00FF00FF00BDBDBD0000000000FF00FF00FF00FF00FF00FF007B7B
        7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BDBDBD0000000000FF00FF00FF00FF00FF00FF007B7B
        7B00FF00FF00FF00FF0000000000000000000000000000000000000000000000
        0000FF00FF00FF00FF00BDBDBD0000000000FF00FF00FF00FF00FF00FF007B7B
        7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BDBDBD0000000000FF00FF00FF00FF00FF00FF007B7B
        7B00FF00FF00FF00FF0000000000000000000000000000000000000000000000
        0000FF00FF00FF00FF00BDBDBD0000000000FF00FF00FF00FF00FF00FF007B7B
        7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BDBDBD0000000000FF00FF00FF00FF00FF00FF007B7B
        7B00FF00FF00FF00FF00000000000000000000000000FF00FF00000000000000
        0000FF00FF00FF00FF00BDBDBD0000000000FF00FF00FF00FF00FF00FF007B7B
        7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BDBDBD0000000000FF00FF00FF00FF00FF00FF007B7B
        7B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BDBDBD0000000000FF00FF00FF00FF00FF00FF007B7B
        7B00FF00FF0000000000FF00FF0000000000FF00FF0000000000FF00FF000000
        0000FF00FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000FF00FF007B7B7B00FF00FF007B7B7B00FF00FF007B7B7B00FF00
        FF007B7B7B00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FF00FF0000000000FF00FF0000000000FF00FF000000
        0000FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbLogClick
    end
    object pBtn: TPanel
      Left = 361
      Top = 2
      Width = 195
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        195
        29)
      object bbCancel: TBitBtn
        Left = 107
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1047#1072#1082#1088#1099#1090#1100
        TabOrder = 0
        Kind = bkCancel
      end
      object bbOk: TBitBtn
        Left = 18
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1047#1072#1075#1088#1091#1079#1080#1090#1100
        Default = True
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
    end
  end
  object qDBF: TQuery
    Left = 232
    Top = 8
  end
  object qPrices: TOraQuery
    SQL.Strings = (
      'select np.id as np_id,'
      
        '       to_number(substr(max(to_char(np_p.date_on, '#39'YYYYMMDD'#39') ||' +
        ' np_p.price), 9)) as price,'
      '       max(np_p.date_on) as date_on'
      '  from oil_np_type np, oil_np_price np_p'
      ' where np_p.np_id = np.id'
      '   and np_p.org_id = ov.GetVal('#39'INST'#39')'
      '   and np_p.org_inst = ov.GetVal('#39'INST'#39')'
      '   and np_p.price <> 0'
      '   /*and np.id = :np_id*/'
      ' group by np.id')
    Left = 296
    Top = 8
  end
  object qGoods: TOraQuery
    SQL.Strings = (
      
        'select min(np.id) as oil_id, to_number(el.out_code) as c1_id, to' +
        '_number(null) as nnb_id'
      '  from oil_np_type np, exe_link el '
      
        ' where (np.id = el.oil_id and el.OIL_TABLE_NAME = '#39'OIL_NP_TYPE'#39' ' +
        'and el.out_program = 2) '
      ' group by to_number(el.out_code)'
      ' union all'
      
        'select min(np.id) as oil_id, to_number(null) as c1_id, np.codavi' +
        'as as nnb_id'
      '  from oil_np_type np '
      ' group by np.codavias ')
    FetchAll = True
    Left = 296
    Top = 72
  end
  object qTestReload: TOraQuery
    SQL.Strings = (
      'select state, ttn_num, ttn_date, count_, np_id'
      '  from (select /*+ORDERED USE_HASH(r, p)*/'
      
        '         r.state, r.ttn_num, r.ttn_date, r.count_, p.np_type as ' +
        'np_id'
      '          from oil_rashod r, oil_part p'
      '         where r.group_num is not null'
      '           and r.oper_id in (10, 44, 7)'
      '           and p.id = r.part_id'
      '           and p.inst = r.part_inst'
      '           and r.state = '#39'Y'#39
      
        '           and r.ttn_num = :vDocNum and r.ttn_date = :vDate and ' +
        'r.date_ = :vDate '
      '           and r.to_id = :vAzsId and r.to_inst = :vAzsInst '
      '           and p.np_type = :vNpId)'
      ' where :vMotion = 1'
      ' group by state, ttn_num, ttn_date, count_, np_id'
      ' union all'
      
        'select p.state, p.number_doc as ttn_num, p.date_ as ttn_date, pd' +
        '.fact_count as count_, pt.np_type as np_id '
      '  from oil_prihod p,  '
      '       oil_prih_det pd, '
      '       oil_part pt'
      ' where p.id = pd.prihod_id'
      '   and p.inst = pd.inst'
      '   and p.state = '#39'Y'#39
      '   and pd.state = '#39'Y'#39
      '   and p.group_num is not null'
      '   and p.number_doc = :vDocNum and  p.date_ = :vDate'
      '   and p.from_ = :vAzsId and p.from_inst = :vAzsInst  '
      '   and pt.np_type = :vNpId'
      '   and :vReturn = 1')
    Left = 360
    Top = 72
    ParamData = <
      item
        Name = 'vDocNum'
        Value = ''
        ExtDataType = 107
      end
      item
        DataType = ftDateTime
        Name = 'vDate'
      end
      item
        Name = 'vAzsId'
        Value = ''
        ExtDataType = 107
      end
      item
        Name = 'vAzsInst'
        Value = ''
        ExtDataType = 107
      end
      item
        Name = 'vNpId'
        Value = ''
        ExtDataType = 107
      end
      item
        Name = 'vMotion'
        Value = ''
        ExtDataType = 107
      end
      item
        Name = 'vReturn'
        Value = ''
        ExtDataType = 107
      end>
  end
  object qRest: TOraQuery
    SQL.Strings = (
      'select nvl(PponName, OblName) as PodrName,'
      '       AzsName,'
      '       np_type,'
      '       np_typeid,'
      '       np_group,'
      '       np_groupid,'
      '       dog,'
      '       sub_part,'
      '       ud_weig,'
      '       sum(-shtuki) as shtuki,'
      '       codavias,'
      '       el.out_code as ext_id'
      '  from v_oil_npmove m, exe_link el'
      ' where NbAzs = 1'
      '   and IsSummary <> '#39'N'#39
      '   and date_ < :ABeginDate'
      '   and m.np_typeid = el.oil_id(+)'
      '   and el.oil_table_name(+) = '#39'OIL_NP_TYPE'#39
      '   and el.out_program(+) = 2'
      '   and m.AzsId = :AAzsId'
      '   and m.AzsInst = :AAzsInst'
      '   and shtuki <> 0'
      ' group by nvl(PponName, OblName),'
      '          AzsName,'
      '          np_type,'
      '          np_typeid,'
      '          np_group,'
      '          np_groupid,'
      '          dog,'
      '          sub_part,'
      '          ud_weig,'
      '          codavias,'
      '          el.out_code')
    FetchAll = True
    Left = 226
    Top = 125
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'ABeginDate'
      end
      item
        DataType = ftInteger
        Name = 'AAzsId'
      end
      item
        DataType = ftInteger
        Name = 'AAzsInst'
      end>
  end
end
