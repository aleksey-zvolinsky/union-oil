inherited PrihImportForm: TPrihImportForm
  Left = 479
  Top = 173
  Width = 655
  Height = 502
  Caption = #1048#1084#1087#1086#1088#1090' '#1087#1088#1080#1093#1086#1076#1086#1074
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 214
    Width = 647
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 647
    Height = 214
    Align = alClient
    Caption = #1044#1072#1085#1085#1099#1077' '#1076#1083#1103' Oil'
    TabOrder = 0
    object gOil: TDBGridEh
      Left = 2
      Top = 15
      Width = 643
      Height = 197
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = dsOil
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
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghColumnResize, dghColumnMove]
      ParentFont = False
      RowDetailPanel.Color = clBtnFace
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnCellClick = gOilCellClick
      OnKeyUp = gOilKeyUp
      Columns = <
        item
          EditButtons = <>
          FieldName = 'nb_name'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1053#1077#1092#1090#1077#1073#1072#1079#1072
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'azs_name'
          Footers = <>
          Title.Caption = #1040#1047#1057
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'date_'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'ttn_num'
          Footers = <>
          Title.Caption = #8470' '#1058#1058#1053
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'part_name'
          Footers = <>
          Title.Caption = #1055#1072#1088#1090#1080#1103
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'rez_name'
          Footers = <>
          Title.Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'np_name'
          Footers = <>
          Title.Caption = #1058#1086#1074#1072#1088
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'litr'
          Footer.FieldName = 'litr'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1054#1073#1098#1077#1084', '#1083
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'weigth'
          Footer.FieldName = 'weigth'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1052#1072#1089#1089#1072', '#1082#1075
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'density'
          Footers = <>
          Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'temperature'
          Footers = <>
          Title.Caption = #1058#1077#1084#1087'.'
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'auto_name'
          Footers = <>
          Title.Caption = #1040#1074#1090#1086
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'driver_name'
          Footers = <>
          Title.Caption = #1042#1086#1076#1080#1090#1077#1083#1100
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'warrant'
          Footers = <>
          Title.Caption = #8470' '#1076#1086#1074#1077#1088'.'
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'warrant_date'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1076#1086#1074#1077#1088'.'
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'supplier_name'
          Footers = <>
          Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          Width = 100
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pBottom: TPanel
    Left = 0
    Top = 435
    Width = 647
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object sbDropChoose: TRxSpeedButton
      Left = 125
      Top = 4
      Width = 115
      Height = 25
      DropDownMenu = pmDeleteChoose
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1073#1086#1088
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
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
      Layout = blGlyphLeft
      NumGlyphs = 2
    end
    object pBtn: TPanel
      Left = 416
      Top = 2
      Width = 229
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        229
        29)
      object bbOk: TBitBtn
        Left = 52
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
        Default = True
        TabOrder = 0
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
        Left = 142
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 1
        Kind = bkCancel
      end
    end
    object bbAdapt: TBitBtn
      Left = 8
      Top = 4
      Width = 113
      Height = 25
      Hint = #1042#1099#1075#1088#1091#1079#1082#1072' '#1090#1072#1083#1086#1085#1086#1074
      Caption = #1040#1076#1072#1087#1090#1080#1088#1086#1074#1072#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Button1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00090909001212
        12001F1F1F002C2C2C003939390045454500525252005F5F5F006C6C6C007878
        780085858500929292009F9F9F00ABABAB00B8B8B800C5C5C500D2D2D200DEDE
        DE00EBEBEB00F8F8F800F0FBFF00A4A0A000C0DCC000F0CAA60000003E000000
        5D0000007C0000009B000000BA000000D9000000F0002424FF004848FF006C6C
        FF009090FF00B4B4FF0000143E00001E5D0000287C0000329B00003CBA000046
        D9000055F000246DFF004885FF006C9DFF0090B5FF00B4CDFF00002A3E00003F
        5D0000547C0000699B00007EBA000093D90000AAF00024B6FF0048C2FF006CCE
        FF0090DAFF00B4E6FF00003E3E00005D5D00007C7C00009B9B0000BABA0000D9
        D90000F0F00024FFFF0048FFFF006CFFFF0090FFFF00B4FFFF00003E2A00005D
        3F00007C5400009B690000BA7E0000D9930000F0AA0024FFB60048FFC2006CFF
        CE0090FFDA00B4FFE600003E1400005D1E00007C2800009B320000BA3C0000D9
        460000F0550024FF6D0048FF85006CFF9D0090FFB500B4FFCD00003E0000005D
        0000007C0000009B000000BA000000D9000000F0000024FF240048FF48006CFF
        6C0090FF9000B4FFB400143E00001E5D0000287C0000329B00003CBA000046D9
        000055F000006DFF240085FF48009DFF6C00B5FF9000CDFFB4002A3E00003F5D
        0000547C0000699B00007EBA000093D90000AAF00000B6FF2400C2FF4800CEFF
        6C00DAFF9000E6FFB4003E3E00005D5D00007C7C00009B9B0000BABA0000D9D9
        0000F0F00000FFFF2400FFFF4800FFFF6C00FFFF9000FFFFB4003E2A00005D3F
        00007C5400009B690000BA7E0000D9930000F0AA0000FFB62400FFC24800FFCE
        6C00FFDA9000FFE6B4003E1400005D1E00007C2800009B320000BA3C0000D946
        0000F0550000FF6D2400FF854800FF9D6C00FFB59000FFCDB4003E0000005D00
        00007C0000009B000000BA000000D9000000F0000000FF242400FF484800FF6C
        6C00FF909000FFB4B4003E0014005D001E007C0028009B003200BA003C00D900
        4600F0005500FF246D00FF488500FF6C9D00FF90B500FFB4CD003E002A005D00
        3F007C0054009B006900BA007E00D9009300F000AA00FF24B600FF48C200FF6C
        CE00FF90DA00FFB4E6003E003E005D005D007C007C009B009B00BA00BA00D900
        D900F000F000FF24FF00FF48FF00FF6CFF00FF90FF00FFB4FF002A003E003F00
        5D0054007C0069009B007E00BA009300D900AA00F000B624FF00C248FF00CE6C
        FF00DA90FF00E6B4FF0014003E001E005D0028007C0032009B003C00BA004600
        D9005500F0006D24FF008548FF009D6CFF00B590FF00CDB4FF00030303000000
        0303030300000003030303030300DA000303030300DA0003030303030300DA00
        0303030300DA0003030303030300DA000303030300DA0003030303030300DA00
        0303030300DA0003030303030300DA000303030300DA0003030300000000DA00
        0000000000DA0000000000DADADADADADADADADADADADADADA000300DADADADA
        DA0000DADADADADA00030300DADADADADA0000DADADADADA0003030300DADADA
        00030300DADADA000303030300DADADA00030300DADADA00030303030300DA00
        0303030300DA0003030303030300DA000303030300DA00030303030303030003
        0303030303000303030303030303000303030303030003030303}
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 217
    Width = 647
    Height = 218
    Align = alBottom
    Caption = 'Excel'
    TabOrder = 2
    object gExcel: TDBGridEh
      Left = 2
      Top = 15
      Width = 643
      Height = 174
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = dsExcel
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
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghColumnResize, dghColumnMove]
      ParentFont = False
      RowDetailPanel.Color = clBtnFace
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnCellClick = gExcelCellClick
      OnKeyUp = gExcelKeyUp
      Columns = <
        item
          EditButtons = <>
          FieldName = 'date_'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'ttn_num'
          Footers = <>
          Title.Caption = #1058#1058#1053
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'np_name'
          Footers = <>
          Title.Caption = #1058#1086#1074#1072#1088
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'litr'
          Footers = <>
          Title.Caption = #1054#1073#1098#1077#1084', '#1083
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'weigth'
          Footers = <>
          Title.Caption = #1042#1077#1089', '#1082#1075
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'density'
          Footers = <>
          Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'temperature'
          Footers = <>
          Title.Caption = #1058#1077#1084#1087'.'
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'azs_name'
          Footers = <>
          Title.Caption = #1040#1047#1057
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'customer'
          Footers = <>
          Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'auto'
          Footers = <>
          Title.Caption = #1040#1074#1090#1086
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'driver'
          Footers = <>
          Title.Caption = #1042#1086#1076#1080#1090#1077#1083#1100
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'warrant'
          Footers = <>
          Title.Caption = #8470' '#1076#1086#1074#1077#1088'.'
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'warrant_date'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1076#1086#1074#1077#1088'.'
          Width = 67
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object pnlExcel: TPanel
      Left = 2
      Top = 189
      Width = 643
      Height = 27
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object sbDel: TSpeedButton
        Left = 2
        Top = 2
        Width = 23
        Height = 23
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
    end
  end
  object dsExcel: TOraDataSource
    DataSet = mtExcel
    Left = 408
    Top = 288
  end
  object dsOil: TOraDataSource
    DataSet = mtOil
    Left = 456
    Top = 88
  end
  object OpenDialog: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' Excel|*.xls'
    Left = 328
    Top = 296
  end
  object mtExcel: TMemoryTable
    Left = 392
    Top = 304
    object mtExceldate_: TStringField
      DisplayWidth = 10
      FieldName = 'date_'
    end
    object mtExcelttn_num: TStringField
      DisplayWidth = 10
      FieldName = 'ttn_num'
    end
    object mtExcelnp_name: TStringField
      FieldName = 'np_name'
    end
    object mtExcellitr: TStringField
      DisplayWidth = 8
      FieldName = 'litr'
    end
    object mtExcelweigth: TStringField
      DisplayWidth = 8
      FieldName = 'weigth'
    end
    object mtExceldensity: TStringField
      DisplayWidth = 8
      FieldName = 'density'
    end
    object mtExceltemperature: TStringField
      DisplayWidth = 8
      FieldName = 'temperature'
    end
    object mtExcelazs_name: TStringField
      DisplayWidth = 10
      FieldName = 'azs_name'
      Size = 250
    end
    object mtExcelcustomer: TStringField
      DisplayWidth = 20
      FieldName = 'customer'
      Size = 250
    end
    object mtExcelauto: TStringField
      FieldName = 'auto'
    end
    object mtExceldriver: TStringField
      FieldName = 'driver'
    end
    object mtExcelwarrant: TStringField
      DisplayWidth = 10
      FieldName = 'warrant'
    end
    object mtExcelwarrant_date: TStringField
      DisplayWidth = 10
      FieldName = 'warrant_date'
    end
    object mtExcelid: TIntegerField
      FieldName = 'id'
    end
  end
  object mtOil: TMemoryTable
    Left = 440
    Top = 104
    object mtOildate_: TDateField
      FieldName = 'date_'
    end
    object mtOilttn_num: TStringField
      DisplayWidth = 10
      FieldName = 'ttn_num'
    end
    object mtOilnp_id: TIntegerField
      FieldName = 'np_id'
      Visible = False
    end
    object mtOilnp_name: TStringField
      DisplayWidth = 10
      FieldName = 'np_name'
      Size = 255
    end
    object mtOilweigth: TFloatField
      DisplayWidth = 8
      FieldName = 'weigth'
    end
    object mtOilazs_id: TIntegerField
      FieldName = 'azs_id'
      Visible = False
    end
    object mtOilazs_inst: TIntegerField
      FieldName = 'azs_inst'
      Visible = False
    end
    object mtOilazs_name: TStringField
      DisplayWidth = 10
      FieldName = 'azs_name'
      Size = 255
    end
    object mtOilauto_id: TIntegerField
      FieldName = 'auto_id'
    end
    object mtOilauto_inst: TIntegerField
      FieldName = 'auto_inst'
    end
    object mtOilauto: TStringField
      DisplayWidth = 10
      FieldName = 'auto_name'
      Size = 255
    end
    object mtOilwagon_id: TIntegerField
      FieldName = 'wagon_id'
    end
    object mtOillitr: TFloatField
      DisplayWidth = 8
      FieldName = 'litr'
    end
    object mtOildensity: TFloatField
      DisplayWidth = 8
      FieldName = 'density'
    end
    object mtOildriver_id: TIntegerField
      FieldName = 'driver_id'
    end
    object mtOildriver_inst: TIntegerField
      FieldName = 'driver_inst'
    end
    object mtOildriver: TStringField
      FieldName = 'driver_name'
    end
    object mtOilwarant: TStringField
      FieldName = 'warrant'
    end
    object mtOilwarrant_date: TDateField
      FieldName = 'warrant_date'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object mtOilpart_id: TIntegerField
      FieldName = 'part_id'
    end
    object mtOilpart_inst: TIntegerField
      FieldName = 'part_inst'
    end
    object mtOilpart_name: TStringField
      DisplayWidth = 10
      FieldName = 'part_name'
      Size = 255
    end
    object mtOilss: TFloatField
      FieldName = 'ss'
    end
    object mtOilrez_id: TIntegerField
      FieldName = 'rez_id'
    end
    object mtOilrez_inst: TIntegerField
      FieldName = 'rez_inst'
    end
    object mtOilrez_name: TStringField
      DisplayWidth = 10
      FieldName = 'rez_name'
      Size = 255
    end
    object mtOilnb_id: TIntegerField
      FieldName = 'nb_id'
    end
    object mtOilnb_inst: TIntegerField
      FieldName = 'nb_inst'
    end
    object mtOilnb_name: TStringField
      DisplayWidth = 10
      FieldName = 'nb_name'
      Size = 255
    end
    object mtOilid: TIntegerField
      FieldName = 'id'
    end
    object mtOiltemperature: TStringField
      DisplayWidth = 8
      FieldName = 'temperature'
    end
    object mtOilsupplier_id: TIntegerField
      FieldName = 'supplier_id'
    end
    object mtOilsupplier_inst: TIntegerField
      FieldName = 'supplier_inst'
    end
    object mtOilsupplier_name: TStringField
      DisplayWidth = 10
      FieldName = 'supplier_name'
      Size = 250
    end
  end
  object pmDeleteChoose: TPopupMenu
    Left = 168
    Top = 392
    object N1: TMenuItem
      Caption = #1058#1086#1074#1072#1088
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1040#1047#1057
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1099
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #1055#1072#1088#1090#1080#1103
      OnClick = N1Click
    end
    object N5: TMenuItem
      Caption = #1040#1074#1090#1086
      OnClick = N1Click
    end
    object N6: TMenuItem
      Caption = #1042#1086#1076#1080#1090#1077#1083#1080
      OnClick = N1Click
    end
  end
  object qTestReload: TOilQuery
    SQL.Strings = (
      'select count(*) as cnt'
      '  from oil_prihod p, oil_prih_det pd, oil_rashod r'
      ' where p.state = '#39'Y'#39' and pd.state = '#39'Y'#39
      '   and p.id = pd.prihod_id'
      '   and p.inst = pd.inst'
      
        '   and p.date_ = p.date_otpr and p.date_doc = p.date_doc_rail  a' +
        'nd p.date_ = p.date_doc'
      '   and pd.fact_count = pd.doc_count'
      '   /* '#1056#1072#1089#1093#1086#1076' */'
      
        '   and r.state = '#39'Y'#39' and p.date_ = r.date_ and p.part_id = r.par' +
        't_id and p.part_inst = r.part_inst'
      
        '   and pd.fact_count = r.count_ and p.to_ = r.from_id and p.to_i' +
        'nst = r.from_inst'
      '   and pd.rez = r.rez and pd.rez_inst = r.rez_inst'
      '   /* '#1042#1085#1077#1096#1085#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' */'
      '   and p.np_type=:np_id '
      '   and p.to_ = :to_id and p.to_inst = :to_inst'
      '   and p.date_ = :date_'
      '   and p.part_id = :part_id and p.part_inst = :part_inst'
      '   and r.to_id = :azs_id and r.to_inst = :azs_inst'
      '   and pd.fact_count = :count_')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 128
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'np_id'
      end
      item
        DataType = ftInteger
        Name = 'to_id'
      end
      item
        DataType = ftInteger
        Name = 'to_inst'
      end
      item
        DataType = ftDateTime
        Name = 'date_'
      end
      item
        DataType = ftInteger
        Name = 'part_id'
      end
      item
        DataType = ftInteger
        Name = 'part_inst'
      end
      item
        DataType = ftInteger
        Name = 'azs_id'
      end
      item
        DataType = ftInteger
        Name = 'azs_inst'
      end
      item
        DataType = ftFloat
        Name = 'count_'
      end>
  end
end
