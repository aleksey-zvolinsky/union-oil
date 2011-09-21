object OrgChangeDetails: TOrgChangeDetails
  Left = 548
  Top = 145
  Width = 640
  Height = 496
  Caption = #1055#1077#1088#1077#1087#1086#1076#1095#1080#1085#1077#1085#1080#1077' '#1040#1047#1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grMain: TDBGridEh
    Left = 0
    Top = 0
    Width = 632
    Height = 434
    Align = alClient
    DataSource = ds
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    PopupMenu = pm
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DEP_ID'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1040#1047#1057
        Width = 156
      end
      item
        EditButtons = <>
        FieldName = 'PAR_NAME'
        Footers = <>
        Title.Caption = #1055#1086#1076#1095#1080#1085#1077#1085#1080#1077
        Width = 328
      end
      item
        EditButtons = <>
        FieldName = 'TO_CHANGE'
        Footers = <>
        Title.Caption = #1052#1077#1085#1103#1090#1100
        Width = 45
      end>
  end
  object pBottom: TPanel
    Left = 0
    Top = 434
    Width = 632
    Height = 35
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object OilHelpButton1: TOilHelpButton
      Left = 6
      Top = 5
      Width = 25
      Height = 25
      AllowAllUp = True
      GroupIndex = 1001
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B000000FF007B7B7B00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000FF000000FF0000FF
        FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF007B7B7B000000FF007B7B7B00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF0000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000FF007B7B7B0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000FF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFF
        FF0000FFFF00FFFFFF007B7B7B007B7B7B0000FFFF00FFFFFF007B7B7B000000
        FF000000FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF000000FF000000FF00FFFFFF0000FFFF007B7B7B000000
        FF000000FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000FFFF00FFFFFF000000FF000000FF007B7B7B00FFFFFF007B7B7B000000
        FF000000FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF000000FF000000FF000000FF000000FF000000
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000FF000000FF000000FF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      AnimateTime = 200
      Lines.Strings = (
        '{12}{RED}\B'#1055#1077#1088#1077#1087#1086#1076#1095#1080#1085#1077#1085#1080#1077' '#1040#1047#1057'\D'
        ''
        '  '#1042' '#1076#1072#1085#1085#1086#1081' '#1092#1086#1088#1084#1077' '#1084#1086#1078#1085#1086' '#1089#1084#1077#1085#1080#1090#1100' '#1087#1086#1076#1095#1080#1085#1077#1085#1080#1077' '#1082#1086#1085#1082#1088#1077#1090#1085#1086#1081' '#1040#1047#1057'.'
        #1055#1086#1076#1095#1080#1085#1077#1085#1080#1077' '#1084#1077#1085#1103#1077#1090#1089#1103' '#1074' '#1076#1074#1077' '#1089#1090#1086#1088#1086#1085#1099': '
        '  - '#1074' '#1087#1086#1076#1095#1080#1085#1077#1085#1080#1077' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103';'
        '  - '#1074' '#1087#1086#1076#1095#1080#1085#1077#1085#1080#1077' '#1085#1077#1092#1090#1077#1073#1072#1079#1099'.'
        ''
        
          #1042' '#1090#1072#1073#1083#1080#1094#1077' '#1087#1086#1082#1072#1079#1072#1085#1086' '#1090#1077#1082#1091#1097#1077#1077' '#1087#1086#1076#1095#1080#1085#1077#1085#1080#1077' '#1040#1047#1057'. '#1044#1083#1103' '#1090#1086#1075#1086' '#1095#1090#1086#1073#1099' '#1089#1084#1077#1085#1080#1090 +
          #1100
        #1087#1086#1076#1095#1080#1085#1077#1085#1080#1077', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086':'
        
          '  1. '#1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1075#1072#1083#1086#1095#1082#1091' '#1074' '#1082#1086#1083#1086#1085#1082#1077' "'#1052#1077#1085#1103#1090#1100'" '#1085#1072#1087#1088#1086#1090#1080#1074' '#1040#1047#1057', '#1082#1086#1090#1086#1088#1099#1084 +
          ' '#1085#1091#1078#1085#1086' '#1089#1084#1077#1085#1080#1090#1100' '#1087#1086#1076#1095#1080#1085#1077#1085#1080#1077'.'
        '  2. '#1053#1072#1078#1072#1090#1100' '#1082#1085#1086#1087#1082#1091' "'#1055#1086#1084#1077#1085#1103#1090#1100'".')
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'MS Sans Serif'
      HeaderFont.Style = []
      Animate = True
      UseCurrentDir = False
      FormOrientation = fBottomToTop
      Images = MainForm.il
      ImageIndex = 0
    end
    object pBtn: TPanel
      Left = 445
      Top = 2
      Width = 185
      Height = 31
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        185
        31)
      object bbChange: TBitBtn
        Left = 5
        Top = 3
        Width = 87
        Height = 25
        Action = actChange
        Anchors = [akTop, akRight]
        Caption = #1055#1086#1084#1077#1085#1103#1090#1100
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
        Left = 96
        Top = 3
        Width = 85
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 1
        OnClick = bbCancelClick
        Kind = bkCancel
      end
    end
  end
  object q: TOilQuery
    SQL.Strings = (
      'select c.dep_id,'
      '       c.table_name,'
      '       c.field_name,'
      '       c.value1,'
      '       c.value2,'
      
        '       decode(field_name,'#39'PAR'#39',a.par,'#39'PAR_INST'#39',a.par_inst) as c' +
        'urrent_value,'
      
        '       decode(decode(field_name,'#39'PAR'#39',a.par,'#39'PAR_INST'#39',a.par_ins' +
        't),'
      '         c.value1,1,'
      '         c.value2,2) as current_value_num,'
      '       a.name,       '
      '       a.par,'
      '       a.par_inst,'
      '       a.par_name,'
      '       a.obl_id,'
      '       a.obl_name'
      '  from oil_org_change c, v_card_azs a'
      ' where c.dep_id = a.id'
      '   and c.dep_id = a.inst'
      '   and c.compare = 1'
      '   and a.obl_id in (ov.GetVal('#39'INST'#39'), ov.GetVal('#39'MAIN_PAR'#39'))'
      '   and c.state = '#39'Y'#39)
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 56
    Top = 40
  end
  object ds: TOraDataSource
    DataSet = vt
    Left = 120
    Top = 40
  end
  object ac: TActionList
    Left = 56
    Top = 96
    object actChange: TAction
      Caption = #1055#1086#1084#1077#1085#1103#1090#1100
      OnExecute = actChangeExecute
    end
    object actSelectAll: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      OnExecute = actSelectAllExecute
    end
    object actUnselectAll: TAction
      Caption = #1059#1073#1088#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      OnExecute = actUnselectAllExecute
    end
    object actInvertSelect: TAction
      Caption = #1048#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      OnExecute = actInvertSelectExecute
    end
  end
  object vt: TVirtualTable
    FieldDefs = <
      item
        Name = 'DEP_ID'
        DataType = ftFloat
      end
      item
        Name = 'TABLE_NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FIELD_NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VALUE1'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VALUE2'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CURRENT_VALUE'
        DataType = ftFloat
      end
      item
        Name = 'CURRENT_VALUE_NUM'
        DataType = ftFloat
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PAR'
        DataType = ftFloat
      end
      item
        Name = 'PAR_INST'
        DataType = ftFloat
      end
      item
        Name = 'PAR_NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'OBL_ID'
        DataType = ftFloat
      end
      item
        Name = 'OBL_NAME'
        DataType = ftString
        Size = 100
      end>
    Left = 88
    Top = 40
    Data = {
      02000D0006004445505F4944060000000A005441424C455F4E414D4501006400
      0A004649454C445F4E414D4501006400060056414C5545310100640006005641
      4C554532010064000D0043555252454E545F56414C5545060000001100435552
      52454E545F56414C55455F4E554D0600000004004E414D450100640003005041
      520600000008005041525F494E53540600000008005041525F4E414D45010064
      0006004F424C5F49440600000008004F424C5F4E414D45010064000000000000
      00}
  end
  object qOilOrgChange: TOilQuery
    SQL.Strings = (
      
        'select * from oil_org_change where dep_id = :ADepId and state = ' +
        #39'Y'#39)
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 392
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ADepId'
      end>
  end
  object pm: TPopupMenu
    Left = 88
    Top = 96
    object miSelectAll: TMenuItem
      Action = actSelectAll
    end
    object miUnselectAll: TMenuItem
      Action = actUnselectAll
    end
    object miInvertSelect: TMenuItem
      Action = actInvertSelect
    end
  end
end
