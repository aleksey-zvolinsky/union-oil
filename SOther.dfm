inherited SOtherForm: TSOtherForm
  Left = 275
  Top = 280
  Width = 783
  Height = 375
  Caption = #1055#1088#1086#1095#1072#1103' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1103
  Constraints.MinHeight = 355
  Constraints.MinWidth = 619
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 309
    Width = 775
    Height = 32
    Align = alBottom
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      775
      32)
    object sbDel: TSpeedButton
      Left = 5
      Top = 3
      Width = 25
      Height = 25
      Action = actDel
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
    end
    object bbOk: TBitBtn
      Left = 597
      Top = 3
      Width = 85
      Height = 25
      Action = actSave
      Anchors = [akTop, akRight]
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      ParentShowHint = False
      ShowHint = True
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
    object bbClose: TBitBtn
      Left = 686
      Top = 3
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 248
    Width = 775
    Height = 61
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Panel2: TPanel
      Left = 74
      Top = 3
      Width = 455
      Height = 56
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label5: TLabel
        Left = 54
        Top = 10
        Width = 51
        Height = 13
        Caption = #1054#1090#1087#1091#1097#1077#1085#1086
      end
      object Label6: TLabel
        Left = 261
        Top = 10
        Width = 47
        Height = 13
        Caption = #1085#1072' '#1089#1091#1084#1084#1091
      end
      object Label1: TLabel
        Left = 10
        Top = 35
        Width = 95
        Height = 13
        Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1085#1072#1095#1072#1083#1086
      end
      object Label2: TLabel
        Left = 261
        Top = 35
        Width = 45
        Height = 13
        Caption = #1085#1072' '#1082#1086#1085#1077#1094
      end
      object Edit3: TEdit
        Left = 115
        Top = 5
        Width = 110
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object Edit4: TEdit
        Left = 316
        Top = 5
        Width = 110
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 115
        Top = 30
        Width = 110
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 316
        Top = 30
        Width = 110
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 248
    Align = alClient
    TabOrder = 0
    object Panel5: TPanel
      Left = 610
      Top = 1
      Width = 164
      Height = 246
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object gbAuto: TGroupBox
        Left = 2
        Top = 2
        Width = 160
        Height = 127
        Hint = '(Ctrl+A)'
        Align = alTop
        Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label7: TLabel
          Left = 4
          Top = 20
          Width = 76
          Height = 13
          Caption = #8470' '#1040#1074#1090#1086#1084#1086#1073#1080#1083#1103
        end
        object Label8: TLabel
          Left = 4
          Top = 60
          Width = 78
          Height = 13
          Caption = #1060#1048#1054' '#1042#1086#1076#1080#1090#1077#1083#1103
        end
        object sbDelAuto: TSpeedButton
          Left = 132
          Top = 34
          Width = 23
          Height = 22
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
          OnClick = sbDelAutoClick
        end
        object sbDelDriver: TSpeedButton
          Left = 132
          Top = 74
          Width = 23
          Height = 22
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
          OnClick = sbDelDriverClick
        end
        object dbceDriver: TRxDBComboEdit
          Left = 4
          Top = 75
          Width = 128
          Height = 21
          DataField = 'FullName'
          DataSource = ds
          DirectInput = False
          GlyphKind = gkEllipsis
          ButtonWidth = 16
          NumGlyphs = 1
          TabOrder = 1
          OnButtonClick = dbceDriverButtonClick
        end
        object dbceAutoNumb: TRxDBComboEdit
          Left = 4
          Top = 35
          Width = 128
          Height = 21
          DataField = 'Numb'
          DataSource = ds
          DirectInput = False
          GlyphKind = gkEllipsis
          ButtonWidth = 16
          NumGlyphs = 1
          TabOrder = 0
          OnButtonClick = dbceAutoNumbButtonClick
          OnDblClick = dbceAutoNumbButtonClick
        end
        object cbByCard: TCheckBox
          Left = 4
          Top = 103
          Width = 97
          Height = 17
          Caption = #1055#1086' '#1082#1072#1088#1090#1086#1095#1082#1077
          TabOrder = 2
          Visible = False
        end
      end
      object gbSmartCard: TGroupBox
        Left = 2
        Top = 129
        Width = 160
        Height = 115
        Hint = 'K'
        Align = alClient
        Caption = #1050#1072#1088#1090#1086#1095#1082#1072
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Visible = False
        object Label9: TLabel
          Left = 4
          Top = 20
          Width = 60
          Height = 13
          Caption = #8470' '#1082#1072#1088#1090#1086#1095#1082#1080
        end
        object Label10: TLabel
          Left = 4
          Top = 45
          Width = 42
          Height = 13
          Caption = #1054#1089#1090#1072#1090#1086#1082
        end
        object Label11: TLabel
          Left = 4
          Top = 70
          Width = 37
          Height = 13
          Caption = #8470' '#1095#1077#1082#1072
        end
        object dbeSCNumber: TDBEdit
          Left = 70
          Top = 15
          Width = 85
          Height = 21
          DataField = 'SC_Number'
          DataSource = ds
          TabOrder = 0
        end
        object dbeSCRest: TDBEdit
          Left = 70
          Top = 40
          Width = 85
          Height = 21
          DataField = 'SC_Rest'
          DataSource = ds
          TabOrder = 1
        end
        object dbeSCCheque: TDBEdit
          Left = 4
          Top = 85
          Width = 151
          Height = 21
          DataField = 'SC_Cheque'
          DataSource = ds
          TabOrder = 2
        end
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 609
      Height = 246
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label3: TLabel
        Left = 10
        Top = 3
        Width = 121
        Height = 13
        Caption = #1058#1080#1087' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 135
        Top = 3
        Width = 84
        Height = 13
        Caption = #1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgOther: TDBGridEh
        Left = 2
        Top = 19
        Width = 605
        Height = 225
        Hint = '(Enter)'
        Align = alBottom
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
        FooterFont.Color = clBlack
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        FooterRowCount = 1
        ParentFont = False
        ParentShowHint = False
        RowDetailPanel.Color = clBtnFace
        ShowHint = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        VertScrollBar.VisibleMode = sbAlwaysShowEh
        OnKeyPress = dbgOtherKeyPress
        Columns = <
          item
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'Oper_name'
            Footer.ValueType = fvtCount
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1072
            Width = 115
            OnEditButtonClick = dbgOtherColumns0EditButtonClick
          end
          item
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'Org_name'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
            Width = 115
            OnEditButtonClick = dbgOtherColumns1EditButtonClick
          end
          item
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'Dog_Name'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1086#1075#1086#1074#1086#1088
            Width = 60
            OnEditButtonClick = dbgOtherColumns2EditButtonClick
          end
          item
            ButtonStyle = cbsNone
            Color = clSilver
            EditButtons = <>
            FieldName = 'Dog_Date'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072' '#1076#1086#1075'.'
            Width = 60
          end
          item
            DisplayFormat = '0.#####'
            EditButtons = <>
            FieldName = 'Litr'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1051#1080#1090#1088#1099
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'CountT'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1058#1086#1085#1085#1099
            Width = 60
          end
          item
            Color = clSilver
            EditButtons = <>
            FieldName = 'Price'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #1062#1077#1085#1072
            Width = 35
          end
          item
            DisplayFormat = '0.#####'
            EditButtons = <>
            FieldName = 'Amount'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1057#1091#1084#1084#1072
            Width = 57
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object Table1: TTable
    AfterOpen = Table1AfterPost
    BeforeEdit = Table1BeforeEdit
    BeforePost = Table1BeforePost
    AfterPost = Table1AfterPost
    BeforeDelete = Table1BeforeDelete
    AfterDelete = Table1AfterPost
    OnCalcFields = Table1CalcFields
    TableName = 'OIL_SROtherT.db'
    Left = 24
    Top = 119
    object Table1Ttn_Id: TIntegerField
      FieldName = 'Ttn_Id'
    end
    object Table1Ttn_Inst: TIntegerField
      FieldName = 'Ttn_Inst'
    end
    object Table1Oper_ID: TIntegerField
      FieldName = 'Oper_ID'
    end
    object Table1Oper_name: TStringField
      FieldName = 'Oper_name'
      Size = 100
    end
    object Table1Litr: TFloatField
      FieldName = 'Litr'
      Required = True
      OnChange = Table1LitrChange
      DisplayFormat = '0.000###'
      EditFormat = '0.######'
      Precision = 3
    end
    object Table1Price: TFloatField
      FieldName = 'Price'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 2
    end
    object Table1SubPart: TIntegerField
      FieldName = 'SubPart'
    end
    object Table1CountT: TFloatField
      FieldName = 'CountT'
      DisplayFormat = '0.000000###'
      EditFormat = '0.#########'
      Precision = 6
    end
    object Table1Org_id: TIntegerField
      FieldName = 'Org_id'
    end
    object Table1Org_inst: TIntegerField
      FieldName = 'Org_inst'
    end
    object Table1Org_name: TStringField
      FieldName = 'Org_name'
      Size = 100
    end
    object Table1Auto_id: TIntegerField
      FieldName = 'Auto_id'
    end
    object Table1Auto_Inst: TIntegerField
      FieldName = 'Auto_Inst'
    end
    object Table1Employ_Id: TIntegerField
      FieldName = 'Employ_Id'
    end
    object Table1Employ_Inst: TIntegerField
      FieldName = 'Employ_Inst'
    end
    object Table1Numb: TStringField
      DisplayLabel = #1040#1074#1090#1086
      FieldKind = fkCalculated
      FieldName = 'Numb'
      Calculated = True
    end
    object Table1FullName: TStringField
      DisplayLabel = #1042#1086#1076#1080#1090#1077#1083#1100
      FieldKind = fkCalculated
      FieldName = 'FullName'
      Calculated = True
    end
    object Table1SC_Number: TStringField
      FieldName = 'SC_Number'
      Size = 10
    end
    object Table1SC_Rest: TFloatField
      FieldName = 'SC_Rest'
      DisplayFormat = '0.000###'
      EditFormat = '0.000###'
    end
    object Table1SC_Cheque: TStringField
      FieldName = 'SC_Cheque'
      Size = 24
    end
    object Table1Dog_Id: TIntegerField
      FieldName = 'Dog_Id'
    end
    object Table1Dog_Inst: TIntegerField
      FieldName = 'Dog_Inst'
    end
    object Table1Dog_Name: TStringField
      FieldKind = fkCalculated
      FieldName = 'Dog_Name'
      ReadOnly = True
      Size = 50
      Calculated = True
    end
    object Table1Dog_Date: TDateField
      FieldKind = fkCalculated
      FieldName = 'Dog_Date'
      ReadOnly = True
      DisplayFormat = 'dd.mm.yyyy'
      Calculated = True
    end
    object Table1Amount: TFloatField
      FieldName = 'Amount'
      DisplayFormat = '0.######'
      EditFormat = '0.######'
      Precision = 3
    end
  end
  object ds: TDataSource
    DataSet = Table1
    OnDataChange = dsDataChange
    Left = 38
    Top = 127
  end
  object Query1: TQuery
    Left = 24
    Top = 66
  end
  object qAuto: TOilQuery
    SQL.Strings = (
      'select ID, INST, NUMB'
      '  from OIL_AUTO'
      ' where state = '#39'Y'#39'  '
      '   and id = :auto_id and inst = :auto_inst')
    MasterSource = ds
    DataSource = ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 463
    Top = 89
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'auto_id'
      end
      item
        DataType = ftUnknown
        Name = 'auto_inst'
      end>
  end
  object dsAuto: TOraDataSource
    DataSet = qAuto
    Left = 477
    Top = 97
  end
  object qEmploy: TOilQuery
    SQL.Strings = (
      'select ID, INST, '
      
        '       F_NAME || '#39' '#39' || DECODE(SUBSTR(I_NAME, 1, 1), '#39' '#39', '#39#39', '#39'_' +
        #39', '#39#39', SUBSTR(I_NAME, 1, 1) || '#39'.'#39') || DECODE(SUBSTR(O_NAME, 1, ' +
        '1), '#39' '#39', '#39#39', '#39'_'#39', '#39#39', SUBSTR(O_NAME, 1, 1) || '#39'.'#39') '
      '         as FULLNAME'
      '  from OIL_EMPLOY'
      ' where state = '#39'Y'#39
      '   and id = :employ_id and inst = :employ_inst'
      ''
      ''
      '')
    MasterSource = ds
    DataSource = ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 463
    Top = 150
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'employ_id'
      end
      item
        DataType = ftUnknown
        Name = 'employ_inst'
      end>
  end
  object dsEmploy: TOraDataSource
    DataSet = qEmploy
    Left = 477
    Top = 158
  end
  object dsDog: TOraDataSource
    Left = 477
    Top = 36
  end
  object qDog: TOilQuery
    SQL.Strings = (
      'select Id, Inst, Dog, Dog_Date'
      '  from Oil_Dog'
      ' where state = '#39'Y'#39
      '   and id = :dog_id and inst = :dog_inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 456
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dog_id'
      end
      item
        DataType = ftUnknown
        Name = 'dog_inst'
      end>
  end
  object qWork: TOilQuery
    SQL.Strings = (
      '')
    DatabaseName = 'MainBase'
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 35
    Top = 194
  end
  object ActionList: TActionList
    Left = 81
    Top = 201
    object actSave: TAction
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      Hint = #1055#1088#1080#1085#1103#1090#1100
      ShortCut = 16467
      OnExecute = actSaveExecute
    end
    object actA: TAction
      ShortCut = 16449
      OnExecute = actAExecute
    end
    object actE: TAction
      ShortCut = 13
      OnExecute = actEExecute
    end
    object actDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16452
      OnExecute = actDelExecute
    end
  end
end
