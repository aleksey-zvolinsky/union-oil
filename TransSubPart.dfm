inherited TransSubPartForm: TTransSubPartForm
  Left = 642
  Top = 144
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1073#1088#1086#1089#1082#1072' '#1087#1086#1076#1087#1072#1088#1090#1080#1081
  ClientHeight = 337
  ClientWidth = 592
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 290
    Top = 35
    Width = 13
    Height = 73
    Alignment = taCenter
    AutoSize = False
    Caption = '=>'#13#10'=>'#13#10'=>'#13#10'=>'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SrcLabel: TLabel
    Left = 2
    Top = 105
    Width = 142
    Height = 16
    AutoSize = False
    Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1087#1086#1076#1087#1072#1088#1090#1080#1080':'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object DstLabel: TLabel
    Left = 310
    Top = 104
    Width = 247
    Height = 16
    AutoSize = False
    Caption = #1055#1086#1076#1087#1072#1088#1090#1080#1080', '#1074#1099#1073#1088#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1087#1077#1088#1077#1073#1088#1086#1089#1082#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object IncludeBtn: TSpeedButton
    Left = 284
    Top = 168
    Width = 24
    Height = 24
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = IncludeBtnClick
  end
  object ExcludeBtn: TSpeedButton
    Left = 284
    Top = 208
    Width = 24
    Height = 24
    Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077
    Caption = '<'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = ExcludeBtnClick
  end
  object LblLeftName: TLabel
    Left = 310
    Top = 286
    Width = 122
    Height = 14
    AutoSize = False
    Caption = #1054#1089#1090#1072#1090#1086#1082' '#1087#1086' '#1087#1072#1088#1090#1080#1080':'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object LblLeft: TLabel
    Left = 433
    Top = 286
    Width = 100
    Height = 14
    AutoSize = False
    Caption = '0'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object lDate: TLabel
    Left = 6
    Top = 10
    Width = 262
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089' '#1082#1086#1090#1086#1088#1086#1081' '#1073#1091#1076#1091#1090' '#1072#1085#1072#1083#1080#1079#1086#1074#1072#1090#1089#1103' '#1086#1090#1087#1091#1089#1082#1080' '#1089' '#1040#1047#1057':'
  end
  object Panel1: TPanel
    Left = 0
    Top = 304
    Width = 592
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel3: TPanel
      Left = 381
      Top = 2
      Width = 209
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbApply: TBitBtn
        Left = 6
        Top = 2
        Width = 95
        Height = 25
        Caption = '&'#1055#1088#1080#1084#1077#1085#1080#1090#1100
        Default = True
        TabOrder = 0
        OnClick = bbApplyClick
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
      object bbClose: TBitBtn
        Left = 112
        Top = 2
        Width = 95
        Height = 25
        Caption = '&'#1047#1072#1082#1088#1099#1090#1100
        TabOrder = 1
        OnClick = bbCloseClick
        Kind = bkCancel
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 2
    Top = 32
    Width = 280
    Height = 67
    Caption = #1055#1072#1088#1090#1080#1103' '#8470'1'
    TabOrder = 1
    object lPart: TLabel
      Left = 6
      Top = 20
      Width = 37
      Height = 13
      Caption = #1055#1072#1088#1090#1080#1103
    end
    object Label8: TLabel
      Left = 154
      Top = 20
      Width = 23
      Height = 13
      Caption = #1044#1086#1075'.'
    end
    object lnpg1: TLabel
      Left = 6
      Top = 44
      Width = 48
      Height = 13
      Caption = #1043#1088#1091#1087#1072' '#1053#1055
    end
    object Label9: TLabel
      Left = 154
      Top = 44
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object edPart: TComboEdit
      Left = 58
      Top = 16
      Width = 90
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = edPartButtonClick
      OnDblClick = edPartButtonClick
      OnKeyPress = edPartKeyPress
    end
    object edDog: TEdit
      Left = 183
      Top = 16
      Width = 90
      Height = 21
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 1
    end
    object edNPG_Type1: TEdit
      Left = 58
      Top = 40
      Width = 90
      Height = 21
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 2
    end
    object edDogDate: TDateEdit
      Left = 183
      Top = 40
      Width = 90
      Height = 21
      TabStop = False
      Color = clSilver
      ButtonWidth = 0
      NumGlyphs = 2
      ReadOnly = True
      YearDigits = dyFour
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 310
    Top = 32
    Width = 280
    Height = 67
    Caption = #1055#1072#1088#1090#1080#1103' '#8470'2'
    TabOrder = 2
    object lPart2: TLabel
      Left = 6
      Top = 20
      Width = 37
      Height = 13
      Caption = #1055#1072#1088#1090#1080#1103
    end
    object Label28: TLabel
      Left = 154
      Top = 20
      Width = 23
      Height = 13
      Caption = #1044#1086#1075'.'
    end
    object lnpg2: TLabel
      Left = 6
      Top = 44
      Width = 48
      Height = 13
      Caption = #1043#1088#1091#1087#1072' '#1053#1055
    end
    object Label30: TLabel
      Left = 154
      Top = 44
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object edPart2: TComboEdit
      Left = 58
      Top = 16
      Width = 90
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = edPart2ButtonClick
      OnDblClick = edPart2ButtonClick
      OnKeyPress = edPartKeyPress
    end
    object edDog2: TEdit
      Left = 183
      Top = 18
      Width = 90
      Height = 21
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 1
    end
    object edNPG_Type2: TEdit
      Left = 58
      Top = 40
      Width = 90
      Height = 21
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 2
    end
    object edDogDate2: TDateEdit
      Left = 183
      Top = 40
      Width = 90
      Height = 21
      TabStop = False
      Color = clSilver
      ButtonWidth = 0
      NumGlyphs = 2
      ReadOnly = True
      YearDigits = dyFour
      TabOrder = 3
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 2
    Top = 126
    Width = 280
    Height = 155
    DataGrouping.GroupLevels = <>
    DataSource = dsSubPartFrom
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clSilver
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = [fsBold]
    FooterRowCount = 1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    RowDetailPanel.Color = clBtnFace
    SumList.Active = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Date_'
        Footer.Value = #1048#1090#1086#1075#1086
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'SUB_PART'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1076#1087#1072#1088#1090#1080#1103
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'COUNT_'
        Footers = <
          item
            ValueType = fvtStaticText
          end>
        Title.Alignment = taCenter
        Title.Caption = #1054#1090#1075#1088'. '#1085#1072' '#1040#1047#1057
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'S'
        Footers = <
          item
            ValueType = fvtStaticText
          end>
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1086#1076#1072#1085#1086
        Width = 60
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object DBGridEh2: TDBGridEh
    Left = 310
    Top = 126
    Width = 280
    Height = 155
    DataGrouping.GroupLevels = <>
    DataSource = dsSubPartTo
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clSilver
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = [fsBold]
    FooterRowCount = 1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    RowDetailPanel.Color = clBtnFace
    SumList.Active = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DATE_'
        Footer.Value = #1048#1090#1086#1075#1086
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'SUB_PART'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1076#1087#1072#1088#1090#1080#1103
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'COUNT_'
        Footers = <
          item
            ValueType = fvtStaticText
          end>
        Title.Alignment = taCenter
        Title.Caption = #1054#1090#1075#1088'. '#1085#1072' '#1040#1047#1057
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'S'
        Footers = <
          item
            ValueType = fvtStaticText
          end>
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1086#1076#1072#1085#1086
        Width = 60
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object deDateRash: TDateEdit
    Left = 280
    Top = 6
    Width = 100
    Height = 21
    NumGlyphs = 2
    TabOrder = 5
    OnChange = deDateRashChange
  end
  object qUpd: TOilQuery
    SQL.Strings = (
      'update oil_rashod'
      '   set part_id = :p_part_id, part_inst = :p_part_inst'
      ' where id = :p_id'
      '   and inst = :p_inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 244
    Top = 262
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_part_id'
      end
      item
        DataType = ftUnknown
        Name = 'p_part_inst'
      end
      item
        DataType = ftUnknown
        Name = 'p_id'
      end
      item
        DataType = ftUnknown
        Name = 'p_inst'
      end>
  end
  object dsSubPartFrom: TOraDataSource
    DataSet = mdSubPartFrom
    Left = 31
    Top = 165
  end
  object mdSubPartFrom: TRxMemoryData
    FieldDefs = <>
    Left = 41
    Top = 175
  end
  object qMain: TOilQuery
    SQL.Strings = (
      'select R.id, R.inst, R.date_, R.count_, SubSumm.*'
      '  from oil_rashod R,'
      '       (select DR.ttn_id,'
      '               DR.ttn_inst,'
      '               DR.sub_part,'
      '               sum(DR.out_nal_count) + sum(DR.out_ved_count) +'
      '               sum(DR.out_talon_count) + sum(DR.out_sn_count) +'
      '               sum(DR.out_ved_count) as S'
      '          from oil_dr_data DR, oil_daily_rep D'
      '         where DR.state = '#39'Y'#39
      '           and DR.rep_id = D.id'
      '           and DR.rep_inst = D.inst'
      '           and trunc(D.rep_date) >= :p_first_day'
      '           and DR.Start_sm >= DR.End_sm'
      '         group by ttn_id, ttn_inst, sub_part) SubSumm'
      ' where SubSumm.ttn_id = R.id'
      '   and SubSumm.ttn_inst = R.inst'
      '   and R.date_ >= :p_first_day'
      '   and R.part_id = :p_part_id'
      '   and R.part_inst = :p_part_inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 95
    Top = 262
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_first_day'
      end
      item
        DataType = ftUnknown
        Name = 'p_part_id'
      end
      item
        DataType = ftUnknown
        Name = 'p_part_inst'
      end>
    object qMainID: TFloatField
      FieldName = 'ID'
    end
    object qMainINST: TFloatField
      FieldName = 'INST'
    end
    object qMainDATE_: TDateTimeField
      FieldName = 'DATE_'
    end
    object qMainCOUNT_: TFloatField
      FieldName = 'COUNT_'
      DisplayFormat = '0.000000'
      EditFormat = '0.000000'
    end
    object qMainTTN_ID: TFloatField
      FieldName = 'TTN_ID'
    end
    object qMainTTN_INST: TFloatField
      FieldName = 'TTN_INST'
    end
    object qMainSUB_PART: TStringField
      FieldName = 'SUB_PART'
    end
    object qMainS: TFloatField
      FieldName = 'S'
      DisplayFormat = '0.000000'
      EditFormat = '0.000000'
    end
  end
  object dsMain: TOraDataSource
    DataSet = qMain
    Left = 135
    Top = 262
  end
  object dsSubPartTo: TOraDataSource
    DataSet = mdSubPartTo
    Left = 353
    Top = 165
  end
  object mdSubPartTo: TRxMemoryData
    FieldDefs = <>
    Left = 360
    Top = 178
  end
  object qMainKharkov: TOilQuery
    SQL.Strings = (
      'select R.id, R.inst, R.date_, R.count_, SubSumm.*'
      '  from oil_rashod R,'
      '       (select DR.ttn_id,'
      '               DR.ttn_inst,'
      '               DR.sub_part,'
      
        '               sum(DR.out_nal_count) + sum(DR.out_ved_count) as ' +
        'S'
      '          from oil_dr_data DR, oil_daily_rep D'
      '         where DR.state = '#39'Y'#39
      '           and DR.rep_id = D.id'
      '           and DR.rep_inst = D.inst'
      '           and trunc(D.rep_date) >= :p_first_day'
      '           and not exists (select *'
      '                  from oil_srtalon SR'
      '                 where SR.state = '#39'Y'#39
      '                   and SR.srep_id = DR.id'
      '                   and SR.srep_inst = DR.inst)'
      '           and not exists (select *'
      '                  from oil_srother SR'
      '                 where SR.state = '#39'Y'#39
      '                   and SR.srep_id = DR.id'
      '                   and SR.srep_inst = DR.inst)'
      '         group by ttn_id, ttn_inst, sub_part'
      
        '        having sum(out_nal_count) + sum(out_ved_count) > 0) SubS' +
        'umm'
      ' where SubSumm.ttn_id = R.id'
      '   and SubSumm.ttn_inst = R.inst'
      '   and R.date_ >= :p_first_day'
      '   and R.part_id = :p_part_id'
      '   and R.part_inst = :p_part_inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 38
    Top = 262
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_first_day'
      end
      item
        DataType = ftUnknown
        Name = 'p_part_id'
      end
      item
        DataType = ftUnknown
        Name = 'p_part_inst'
      end>
  end
end
