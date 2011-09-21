inherited AutoForm: TAutoForm
  Top = 349
  Width = 425
  Height = 323
  Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1080' '#1080' '#1090#1077#1093'. '#1089#1088#1077#1076#1089#1090#1074#1072
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited pBottom: TPanel
    Top = 256
    Width = 417
    TabOrder = 2
    object sbDel: TSpeedButton [0]
      Left = 4
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
      Left = 220
    end
  end
  object pnlBase: TPanel [1]
    Left = 0
    Top = 0
    Width = 417
    Height = 129
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label7: TLabel
      Left = 19
      Top = 5
      Width = 35
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072
    end
    object dbtGroupName: TDBText
      Left = 60
      Top = 5
      Width = 349
      Height = 13
      DataField = 'GROUP_NAME'
      DataSource = dsType
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 35
      Top = 28
      Width = 19
      Height = 13
      Caption = #1058#1080#1087
    end
    object Label1: TLabel
      Left = 20
      Top = 53
      Width = 34
      Height = 13
      Caption = #1053#1086#1084#1077#1088
    end
    object Label6: TLabel
      Left = 149
      Top = 53
      Width = 33
      Height = 13
      Caption = #1052#1072#1088#1082#1072
    end
    object Label5: TLabel
      Left = 306
      Top = 53
      Width = 35
      Height = 13
      Caption = #1054#1073#1098#1077#1084
    end
    object lEmploy: TLabel
      Left = 6
      Top = 78
      Width = 48
      Height = 13
      Caption = #1042#1086#1076#1080#1090#1077#1083#1100
    end
    object Label3: TLabel
      Left = 32
      Top = 103
      Width = 22
      Height = 13
      Caption = #1040#1058#1055
    end
    object cbType: TDBLookupComboBox
      Left = 60
      Top = 24
      Width = 350
      Height = 21
      DataField = 'AUTO_TYPE_ID'
      DataSource = AutoRefForm.ds
      KeyField = 'ID'
      ListField = 'TYPE_NAME'
      ListSource = dsType
      TabOrder = 0
      OnClick = cbTypeClick
    end
    object eNumber: TDBEdit
      Left = 60
      Top = 49
      Width = 76
      Height = 21
      DataField = 'NUMB'
      DataSource = AutoRefForm.ds
      TabOrder = 1
    end
    object eMark: TDBEdit
      Left = 189
      Top = 49
      Width = 104
      Height = 21
      DataField = 'AUTO_MODEL'
      DataSource = AutoRefForm.ds
      TabOrder = 2
    end
    object dbeV: TDBEdit
      Left = 348
      Top = 49
      Width = 61
      Height = 21
      DataField = 'CAPACITY'
      DataSource = AutoRefForm.ds
      TabOrder = 3
      OnChange = dbeVChange
    end
    object dbceDriver: TRxDBComboEdit
      Left = 60
      Top = 74
      Width = 350
      Height = 21
      DataField = 'FULLNAME'
      DataSource = AutoRefForm.ds
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = dbceDriverButtonClick
      OnDblClick = dbceDriverButtonClick
    end
    object dbeATP: TDBEdit
      Left = 60
      Top = 99
      Width = 350
      Height = 21
      DataField = 'ATP'
      DataSource = AutoRefForm.ds
      TabOrder = 5
    end
  end
  object gbSections: TGroupBox [2]
    Left = 0
    Top = 129
    Width = 417
    Height = 127
    Align = alClient
    Caption = #1057#1077#1082#1094#1080#1080' ('#1088#1077#1079#1077#1088#1074#1091#1072#1088#1099')'
    Enabled = False
    TabOrder = 1
    object grSections: TDBGridEh
      Left = 2
      Top = 15
      Width = 413
      Height = 110
      Align = alClient
      DataSource = dsSections
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      RowDetailPanel.Color = clBtnFace
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnExit = grSectionsExit
      Columns = <
        item
          EditButtons = <>
          FieldName = 'POSITION'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
          Width = 59
        end
        item
          EditButtons = <>
          FieldName = 'CAPACITY'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1054#1073#1098#1077#1084
          Width = 91
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object qType: TOilQuery
    SQL.Strings = (
      'select Oil_Auto_Type.Id,'
      '       Oil_Auto_Type.Name as Type_Name,'
      '       Oil_Auto_Group.Name as Group_Name,'
      '       oil_auto_group.id as group_id'
      '  from Oil_Auto_Type, Oil_Auto_Group'
      ' where Oil_Auto_Type.State = '#39'Y'#39
      '   and Oil_Auto_Type.Auto_Group = Oil_Auto_Group.Id'
      ' order by Oil_Auto_Type.Id')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 204
    Top = 8
  end
  object dsType: TOraDataSource
    DataSet = qType
    Left = 218
  end
  object qCheckNumber: TOilQuery
    SQL.Strings = (
      'select Numb'
      '  from Oil_Auto'
      ' where State = '#39'Y'#39
      '   and Numb = :Numb'
      '   and not (Id = :Id and Inst = :Inst)')
    MasterSource = AutoRefForm.ds
    DataSource = AutoRefForm.ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 287
    Top = 11
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMB'
      end
      item
        DataType = ftFloat
        Name = 'ID'
      end
      item
        DataType = ftFloat
        Name = 'INST'
      end>
  end
  object qSections: TOraQuery
    SQL.Strings = (
      'select id, inst, state, POSITION, capacity'
      '  from oil_auto_detail'
      ' where state = '#39'Y'#39
      '   and auto_id = :id'
      '   and auto_inst = :inst'
      ' order by POSITION')
    Left = 192
    Top = 161
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
  object dsSections: TOraDataSource
    DataSet = vtSections
    Left = 120
    Top = 177
  end
  object vtSections: TVirtualTable
    BeforePost = vtSectionsBeforePost
    AfterPost = vtSectionsAfterPost
    AfterDelete = vtSectionsAfterDelete
    Left = 136
    Top = 161
    Data = {02000000000000000000}
    object vtSectionsID: TIntegerField
      FieldName = 'ID'
    end
    object vtSectionsINST: TIntegerField
      FieldName = 'INST'
    end
    object vtSectionsPOSITION: TIntegerField
      FieldName = 'POSITION'
    end
    object vtSectionsCAPACITY: TFloatField
      FieldName = 'CAPACITY'
    end
  end
end
