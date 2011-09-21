inherited NpTypeEditForm: TNpTypeEditForm
  Left = 478
  Top = 439
  Width = 338
  Height = 107
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
  Constraints.MaxHeight = 107
  Constraints.MaxWidth = 338
  Constraints.MinHeight = 107
  Constraints.MinWidth = 338
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object leCodInt: TLabeledEdit [0]
    Left = 0
    Top = 16
    Width = 329
    Height = 21
    EditLabel.Width = 77
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1086#1076' '#1074#1085#1091#1090#1088#1077#1085#1080#1081':'
    TabOrder = 1
    OnKeyPress = leCodIntKeyPress
  end
  inherited pBottom: TPanel
    Top = 47
    Width = 330
    inherited pBtn: TPanel
      Left = 133
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select np.id, el.id as el_id, el.out_code'
      '  from oil_np_type np, exe_link el'
      ' where np.id = :id '
      '   and el.inst(+) = :inst'
      '   and el.oil_id(+) = np.id'
      '   and el.oil_table_name(+) = '#39'OIL_NP_TYPE'#39
      '   and el.inst(+) = :inst'
      '   and el.out_program(+) = ov.GetVal('#39'NP_CODINT'#39')')
    Left = 48
    Top = 16
  end
  object qTest: TOilQuery
    SQL.Strings = (
      'select *'
      '  from exe_link el'
      ' where el.oil_id <> :id '
      '   and el.oil_table_name = '#39'OIL_NP_TYPE'#39
      '   and el.inst = :inst'
      '   and el.out_program(+) = ov.GetVal('#39'NP_CODINT'#39')'
      '   and el.out_code = :cod')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 136
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cod'
      end>
  end
end
