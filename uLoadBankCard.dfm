inherited LoadBankCardForm: TLoadBankCardForm
  Left = 311
  Top = 287
  Width = 740
  Height = 415
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object gbChooseFile: TGroupBox
    Left = 0
    Top = 0
    Width = 201
    Height = 347
    Align = alLeft
    Caption = #1055#1072#1087#1082#1072
    TabOrder = 0
    object pChooseDir: TPanel
      Left = 2
      Top = 15
      Width = 197
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object dedFiles: TDirectoryEdit
        Left = 0
        Top = -1
        Width = 197
        Height = 21
        OnAfterDialog = dedFilesAfterDialog
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 1
        ParentFont = False
        TabOrder = 0
      end
    end
    object pnlDeleteFile: TPanel
      Left = 2
      Top = 315
      Width = 197
      Height = 30
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object sbDelFile: TSpeedButton
        Left = 2
        Top = 2
        Width = 25
        Height = 25
        Hint = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1090#1100' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1102
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
      object cbFilters: TCheckBox
        Left = 56
        Top = 6
        Width = 97
        Height = 17
        Caption = #1060#1080#1083#1100#1090#1088#1099
        TabOrder = 0
        OnClick = cbFiltersClick
      end
    end
    object pfiles: TPanel
      Left = 2
      Top = 41
      Width = 197
      Height = 63
      Align = alClient
      TabOrder = 2
      object lbfiles: TListBox
        Left = 1
        Top = 1
        Width = 195
        Height = 61
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        OnClick = lbfilesClick
      end
    end
    object pFilters: TPanel
      Left = 2
      Top = 104
      Width = 197
      Height = 211
      Align = alBottom
      TabOrder = 3
      Visible = False
      object tvFilters: TTreeView
        Left = 1
        Top = 1
        Width = 195
        Height = 209
        Align = alClient
        Images = ImageTree
        Indent = 19
        PopupMenu = pmFilters
        SortType = stText
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 347
    Width = 732
    Height = 34
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel2: TPanel
      Left = 394
      Top = 2
      Width = 336
      Height = 30
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        336
        30)
      object bbLoad: TBitBtn
        Left = 162
        Top = 2
        Width = 91
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        TabOrder = 0
        OnClick = bbLoadClick
        Kind = bkOK
      end
      object bbCancel: TBitBtn
        Left = 257
        Top = 2
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        TabOrder = 1
        OnClick = bbCancelClick
        Kind = bkCancel
      end
      object cbReload: TCheckBox
        Left = 7
        Top = 7
        Width = 146
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = #1055#1077#1088#1077#1075#1088#1091#1078#1072#1090#1100' '#1087#1086#1074#1090#1086#1088#1085#1099#1077
        TabOrder = 2
      end
    end
  end
  object gbData: TGroupBox
    Left = 201
    Top = 0
    Width = 531
    Height = 347
    Align = alClient
    Caption = #1044#1072#1085#1085#1099#1077
    TabOrder = 2
    object dbgFileContent: TDBGridEh
      Left = 2
      Top = 15
      Width = 527
      Height = 284
      Align = alClient
      AllowedOperations = []
      DataGrouping.GroupLevels = <>
      DataSource = dsFile
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu
      RowDetailPanel.Color = clBtnFace
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'date'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'id_term'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1058#1077#1088#1084#1080#1085#1072#1083
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'issuer'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1069#1084#1080#1090#1077#1085#1090
          Width = 69
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'summ_op'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072', '#1075#1088#1085
          Width = 68
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'summ_vozvr'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1042#1086#1079#1074#1088#1072#1090', '#1075#1088#1085
          Width = 80
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'n_card'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1099
          Width = 74
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'komiss'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1084#1080#1089#1089#1080#1103
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 299
      Width = 527
      Height = 30
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object spDelTrans: TSpeedButton
        Left = 3
        Top = 2
        Width = 25
        Height = 25
        Hint = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1090#1100' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1102
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
        OnClick = spDelTransClick
      end
    end
    object ProgressBar: TProgressBar
      Left = 2
      Top = 329
      Width = 527
      Height = 16
      Align = alBottom
      TabOrder = 2
      Visible = False
    end
  end
  object tblFile: TTable
    Left = 88
    Top = 176
  end
  object dsFile: TOraDataSource
    DataSet = tblFile
    Left = 136
    Top = 176
  end
  object qryIns: TOilQuery
    SQL.Strings = (
      '-->qryIns,LoadBankCardForm'
      'insert into bank_card_transaction'
      '('
      'ID,'
      'INST,'
      'STATE,'
      'OPER_DATE,'
      'TERMINAL_ID,'
      'ISSUER,'
      'CARD_NUMBER,'
      'AMOUNT,'
      'AMOUNT_RET,'
      'COMMISSION, '
      'CURRENCY,'
      'NPG_ID,'
      'CURRENCY_ID,'
      'OPER_ID'
      ')'
      'values'
      '('
      's_bank_card_transaction.nextval,'
      'ov.getval('#39'inst'#39'),'
      #39'Y'#39','
      ':oper_date,'
      ':terminal_id ,'
      ':issuer,'
      ':card_number,'
      ':amount ,'
      ':amount_ret ,'
      ':commission,'
      ':currency,'
      'ov.GetOilLinkId('#39'OIL_NP_GROUP'#39', 3, :currency),'
      'ov.GetOilLinkId('#39'OIL_CURRENCY'#39', 3, :currency),'
      'ov.GetOilLinkId('#39'OIL_OPER_TYPE'#39', 3, :card_number)'
      ')'
      ' '
      ' '
      ' '
      ' '
      ' ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 336
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'oper_date'
      end
      item
        DataType = ftUnknown
        Name = 'terminal_id'
      end
      item
        DataType = ftUnknown
        Name = 'issuer'
      end
      item
        DataType = ftUnknown
        Name = 'card_number'
      end
      item
        DataType = ftUnknown
        Name = 'amount'
      end
      item
        DataType = ftUnknown
        Name = 'amount_ret'
      end
      item
        DataType = ftUnknown
        Name = 'commission'
      end
      item
        DataType = ftUnknown
        Name = 'currency'
      end>
  end
  object qryReload: TOilQuery
    SQL.Strings = (
      '-->qryReload,LoadBankCardForm'
      'begin'
      '  update bank_card_transaction'
      '     set state = '#39'N'#39
      '   where oper_date = :oper_date'
      '     and TERMINAL_ID = :terminal_id'
      '     and INST = ov.getval('#39'inst'#39');'
      '  return;'
      '  -- '#1047#1072#1075#1083#1091#1096#1082#1072
      
        '  :q := :oper_date || :terminal_id || :issuer || :card_number ||' +
        ' :amount '
      '    || :amount_ret || :commission || :currency;'
      'end;')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 408
    Top = 168
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'oper_date'
      end
      item
        DataType = ftInteger
        Name = 'terminal_id'
      end
      item
        DataType = ftUnknown
        Name = 'q'
      end
      item
        DataType = ftString
        Name = 'issuer'
      end
      item
        DataType = ftString
        Name = 'card_number'
      end
      item
        Name = 'amount'
        Value = Null
        ExtDataType = 107
      end
      item
        Name = 'amount_ret'
        Value = Null
        ExtDataType = 107
      end
      item
        Name = 'commission'
        Value = Null
        ExtDataType = 107
      end
      item
        DataType = ftString
        Name = 'currency'
      end>
  end
  object mtXmlFile: TMemoryTable
    Left = 88
    Top = 120
    object mtXmlFiledate: TDateTimeField
      FieldName = 'date'
    end
    object mtXmlFileid_term: TStringField
      FieldName = 'id_term'
    end
    object mtXmlFileissuer: TStringField
      FieldName = 'issuer'
    end
    object mtXmlFilesumm_op: TCurrencyField
      FieldName = 'summ_op'
    end
    object mtXmlFilesumm_vozvr: TCurrencyField
      FieldName = 'summ_vozvr'
    end
    object mtXmlFilen_card: TStringField
      FieldName = 'n_card'
    end
    object mtXmlFilekomiss: TCurrencyField
      FieldName = 'komiss'
    end
    object mtXmlFilecurr2: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
      DisplayWidth = 60
      FieldName = 'curr'
      Size = 50
    end
    object mtXmlFileretailer2: TStringField
      DisplayLabel = #1058#1086#1095#1082#1072
      DisplayWidth = 100
      FieldName = 'retailer'
      Size = 40
    end
    object mtXmlFileretailer: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089#1089' '#1090#1086#1095#1082#1080
      DisplayWidth = 100
      FieldName = 'retailer_addres'
      Size = 100
    end
  end
  object PopupMenu: TPopupMenu
    Left = 512
    Top = 176
    object Excel1: TMenuItem
      Caption = #1042#1099#1074#1077#1089#1090#1080' '#1074' Excel'
      OnClick = Excel1Click
    end
  end
  object qryUpdateInfFields: TOraQuery
    SQL.Strings = (
      'update bank_card_transaction b'
      '   set npg_id = ov.GetOilLinkId('#39'OIL_NP_GROUP'#39', 3, b.currency),'
      
        '       currency_id = ov.GetOilLinkId('#39'OIL_CURRENCY'#39', 3,  b.curre' +
        'ncy),'
      
        '       oper_id = ov.GetOilLinkId('#39'OIL_OPER_TYPE'#39', 3, b.card_numb' +
        'er)'
      
        ' where ((npg_id is null and currency_id is null and oper_id is n' +
        'ull) or (currency_id is null and (oper_id is null or npg_id is n' +
        'ull)))'
      '   and b.inst = ov.GetVal('#39'INST'#39')')
    Left = 264
    Top = 168
  end
  object ActionList1: TActionList
    Left = 441
    Top = 72
    object Action1: TAction
      Caption = 'Action1'
    end
  end
  object qDevice: TOilQuery
    SQL.Strings = (
      'select bd.device_num, azs.name as azs_name, azs.azs_num'
      '  from v_bank_device bd, v_oil_azs azs'
      ' where bd.azs_id = azs.id'
      '   and bd.azs_inst = azs.inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 336
    Top = 232
  end
  object ImageTree: TImageList
    Left = 598
    Top = 88
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C60084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C60084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400000000009494
      9400949494009494940094949400949494009494940094949400949494009494
      940094949400C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400000000009494
      9400949494009494940094949400949494009494940094949400949494009494
      940094949400C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400000000009494
      9400949494008484840000000000848484009494940094949400949494009494
      940094949400C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00DEDEDE0000000000DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400000000009494
      9400848484000000000000000000000000008484840094949400949494009494
      940094949400C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00DEDEDE00000000000000000000000000DEDEDE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400000000009494
      9400000000000000000000000000000000000000000084848400949494009494
      940094949400C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF000000000000000000000000000000000000000000DEDEDE00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400000000009494
      9400000000000000000084848400848484000000000000000000848484009494
      940094949400C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF000000000000000000DEDEDE00DEDEDE000000000000000000DEDEDE00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400000000009494
      9400000000008484840094949400949494008484840000000000000000008484
      840094949400C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF0000000000DEDEDE00FFFFFF00FFFFFF00DEDEDE000000000000000000DEDE
      DE00FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400000000009494
      9400848484009494940094949400949494009494940084848400000000008484
      840094949400C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE0000000000DEDE
      DE00FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400000000009494
      9400949494009494940094949400949494009494940094949400848484008484
      840094949400C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00DEDE
      DE00FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400000000009494
      9400949494009494940094949400949494009494940094949400949494009494
      940094949400C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00C6C6C600C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00C6C6C600C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400FFFFFF00C6C6C600C6C6C60084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400FFFFFF00C6C6C600C6C6C60084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object pmFilters: TPopupMenu
    Left = 598
    Top = 136
    object miFiltersAll: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      OnClick = miFiltersAllClick
    end
    object miFiltersNoAll: TMenuItem
      Caption = #1059#1073#1088#1072#1090#1100' '#1074#1089#1077
      OnClick = miFiltersNoAllClick
    end
  end
end
