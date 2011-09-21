inherited RezMeasureEditForm: TRezMeasureEditForm
  Left = 274
  Top = 169
  Width = 723
  Height = 410
  Caption = #1042#1074#1086#1076#1072' '#1079#1072#1084#1077#1088#1086#1074' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  object lblDateOn: TLabel [0]
    Left = 6
    Top = 2
    Width = 58
    Height = 13
    Caption = #1044#1072#1090#1072' '#1072#1082#1090#1072' :'
  end
  object lblOper: TLabel [1]
    Left = 279
    Top = 2
    Width = 49
    Height = 13
    Caption = #1055#1088#1080#1095#1080#1085#1072' :'
  end
  object lblNumb: TLabel [2]
    Left = 142
    Top = 2
    Width = 66
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1072#1082#1090#1072' :'
  end
  object lblEmploy: TLabel [3]
    Left = 455
    Top = 2
    Width = 85
    Height = 13
    Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081' :'
  end
  object sbAutoNumb: TSpeedButton [4]
    Left = 248
    Top = 18
    Width = 23
    Height = 20
    Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1085#1086#1084#1077#1088
    AllowAllUp = True
    GroupIndex = 2
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
    OnClick = sbAutoNumbClick
  end
  inherited pBottom: TPanel
    Top = 343
    Width = 715
    object sbDel: TSpeedButton [0]
      Left = 5
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
      Left = 518
      inherited bbOk: TBitBtn
        Left = 13
      end
      inherited bbCancel: TBitBtn
        Left = 105
      end
    end
  end
  object gr: TDBGridEh [6]
    Left = 0
    Top = 43
    Width = 715
    Height = 300
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataGrouping.GroupLevels = <>
    DataSource = ds
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
    OnExit = grExit
    OnGetCellParams = grGetCellParams
    OnKeyPress = grKeyPress
    Columns = <
      item
        DisplayFormat = 'dd.mm.yyyy'
        EditButtons = <>
        FieldName = 'DATE_ON'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '#1079#1072#1084#1077#1088#1072
        Width = 90
      end
      item
        DropDownRows = 15
        DropDownSpecRow.Visible = True
        EditButtons = <>
        FieldName = 'REZ_NUMB'
        Footers = <>
        Title.Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088'/'#1090#1088#1091#1073#1072'|'#1053#1086#1084#1077#1088
        Width = 50
        OnUpdateData = grColumns1UpdateData
      end
      item
        Color = 15658991
        EditButtons = <>
        FieldName = 'NP_NAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088'/'#1090#1088#1091#1073#1072'|'#1058#1086#1087#1083#1080#1074#1086
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'TEMPER'
        Footer.ValueType = fvtAvg
        Footers = <>
        Title.Caption = #1058#1077#1084#1087#1077#1088'.'
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'DENSITY'
        Footer.ValueType = fvtAvg
        Footers = <>
        Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100'|'#1047#1072#1084#1077#1088'.'
        Width = 50
      end
      item
        Color = 15658991
        EditButtons = <>
        FieldName = 'DENSITY_REDUCED'
        Footer.ValueType = fvtAvg
        Footers = <>
        ReadOnly = True
        Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100'|'#1055#1088#1080#1074#1077#1076'.'
        Width = 50
      end
      item
        DisplayFormat = ',0'
        EditButtons = <>
        FieldName = 'FUEL_QUANTITY'
        Footer.DisplayFormat = ',0'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1058#1086#1087#1083#1080#1074#1086'|'#1054#1073#1098#1077#1084
        Width = 60
      end
      item
        Color = 15658991
        DisplayFormat = ',0'
        EditButtons = <>
        FieldName = 'FUEL_WEIGHT'
        Footer.DisplayFormat = ',0'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Caption = #1058#1086#1087#1083#1080#1074#1086'|'#1042#1077#1089
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'FUEL_LEVEL'
        Footers = <>
        Title.Caption = #1058#1086#1087#1083#1080#1074#1086'|'#1059#1088#1086#1074#1077#1085#1100
        Width = 50
      end
      item
        DisplayFormat = ',0'
        EditButtons = <>
        FieldName = 'WATER_QUANTITY'
        Footer.DisplayFormat = ',0'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1042#1086#1076#1072'|'#1054#1073#1098#1077#1084
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'WATER_LEVEL'
        Footers = <>
        Title.Caption = #1042#1086#1076#1072'|'#1059#1088#1086#1074#1077#1085#1100
        Width = 50
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object deDateOn: TDBDateTimeEditEh [7]
    Left = 6
    Top = 18
    Width = 129
    Height = 21
    EditButtons = <>
    Kind = dtkDateTimeEh
    TabOrder = 2
    Visible = True
  end
  object eNumb: TEdit [8]
    Left = 142
    Top = 18
    Width = 105
    Height = 21
    TabOrder = 3
  end
  object edOper: TComboEdit [9]
    Left = 279
    Top = 18
    Width = 169
    Height = 20
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 4
    OnKeyPress = edOperKeyPress
  end
  object ceEmploy: TComboEdit [10]
    Left = 455
    Top = 18
    Width = 255
    Height = 20
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 5
    OnButtonClick = ceEmployButtonClick
    OnDblClick = ceEmployButtonClick
    OnKeyPress = edOperKeyPress
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select m.id as head_id,'
      '       m.inst as head_inst,'
      '       m.oper_id,'
      '       op.name as oper_name,'
      '       m.user_id,'
      '       m.date_on,'
      '       m.emp_id,'
      '       m.emp_inst,'
      '       e.f_name as emp_name,'
      '       m.numb,'
      '       md.id,'
      '       md.inst,'
      '       md.temper,'
      '       md.density,'
      '       md.fuel_level,'
      '       md.fuel_quantity,'
      '       md.fuel_weight,'
      '       md.water_level,'
      '       md.water_quantity,'
      '       md.water_weight,'
      '       md.rez_id,'
      '       md.rez_inst,'
      '       nvl(r.num, r.name) as rez_numb,'
      '       np.id as np_id,'
      '       np.name as np_name,'
      '       md.date_on'
      '  from oil_rez_measure     m,'
      '       oil_rez_measure_det md,'
      '       oil_employ          e,'
      '       oil_rezervuar       r,'
      '       oil_oper_type       op,'
      '       oil_np_type         np'
      ' where m.state = '#39'Y'#39
      '   and md.state = '#39'Y'#39
      '   and m.id = md.head_id'
      '   and m.inst = md.head_inst'
      '   and m.id = :id'
      '   and m.inst = :inst'
      '   and m.emp_id = e.id'
      '   and m.emp_inst = e.inst'
      '   and md.rez_id = r.id'
      '   and md.rez_inst = r.inst'
      '   and m.oper_id = op.id'
      '   and r.np_type_id = np.id(+)'
      ' order by md.date_on, md.id')
    Left = 32
    Top = 112
  end
  object vt: TVirtualTable
    BeforePost = vtBeforePost
    Left = 256
    Top = 168
    Data = {03000000000000000000}
    object vtID: TIntegerField
      FieldName = 'ID'
    end
    object vtINST: TIntegerField
      FieldName = 'INST'
    end
    object vtDATE_ON: TDateTimeField
      FieldName = 'DATE_ON'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object vtREZ_ID: TIntegerField
      FieldName = 'REZ_ID'
      OnChange = vtREZ_IDChange
    end
    object vtREZ_INST: TIntegerField
      FieldName = 'REZ_INST'
    end
    object vtREZ_NUMB: TStringField
      DisplayWidth = 20
      FieldName = 'REZ_NUMB'
      OnSetText = vtREZ_NUMBSetText
      Size = 256
    end
    object vtNP_ID: TIntegerField
      FieldName = 'NP_ID'
    end
    object vtNP_NAME: TStringField
      FieldName = 'NP_NAME'
      Size = 255
    end
    object vtFUEL_QUANTITY: TFloatField
      FieldName = 'FUEL_QUANTITY'
      OnChange = vtFUEL_QUANTITYChange
    end
    object vtFUEL_LEVEL: TFloatField
      FieldName = 'FUEL_LEVEL'
      OnChange = vtFUEL_LEVELChange
    end
    object vtFUEL_LEVEL_TEMP: TFloatField
      FieldName = 'FUEL_LEVEL_TEMP'
    end
    object vtFUEL_WEIGHT: TFloatField
      FieldName = 'FUEL_WEIGHT'
    end
    object vtWATER_QUANTITY: TFloatField
      FieldName = 'WATER_QUANTITY'
    end
    object vtWATER_LEVEL: TFloatField
      FieldName = 'WATER_LEVEL'
    end
    object vtWATER_WEIGHT: TFloatField
      FieldName = 'WATER_WEIGHT'
    end
    object vtTEMPER: TFloatField
      FieldName = 'TEMPER'
    end
    object vtDENSITY: TFloatField
      FieldName = 'DENSITY'
      OnChange = vtDENSITYChange
    end
    object vtDENSITY_REDUCED: TFloatField
      FieldName = 'DENSITY_REDUCED'
    end
  end
  object ds: TOraDataSource
    DataSet = vt
    Left = 272
    Top = 152
  end
  object qRez: TOilQuery
    SQL.Strings = (
      
        'select rez.*, nvl(rez.num, rez.name) as rez_numb, np.name as np_' +
        'name'
      '  from V_OIL_REZERVUAR rez, oil_np_type np'
      ' where id_org = :inst'
      '   and inst_org = :inst'
      '   and rez.np_type_id = np.id(+)'
      ' order by lpad(nvl(rez.num, rez.name), 10, '#39'0'#39')')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 320
    Top = 166
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
  object dsRez: TOraDataSource
    DataSet = qRez
    Left = 336
    Top = 152
  end
end
