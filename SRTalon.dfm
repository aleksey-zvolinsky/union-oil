inherited SRTalonForm: TSRTalonForm
  Left = 320
  Top = 201
  ActiveControl = Edit6
  BorderStyle = bsDialog
  Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084
  ClientHeight = 457
  ClientWidth = 572
  Constraints.MinHeight = 450
  Constraints.MinWidth = 530
  Font.Color = clBlack
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 50
    Top = 330
    Width = 3
    Height = 13
  end
  object sp: TSplitter
    Left = 364
    Top = 29
    Width = 2
    Height = 396
    Align = alRight
    Color = clActiveBorder
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 425
    Width = 572
    Height = 32
    Align = alBottom
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      572
      32)
    object sbDel: TSpeedButton
      Left = 4
      Top = 4
      Width = 26
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
    object bbOk: TBitBtn
      Left = 395
      Top = 4
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
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
    object bbClose: TBitBtn
      Left = 483
      Top = 4
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      Kind = bkCancel
    end
    object Edit6: TEdit
      Left = 96
      Top = 6
      Width = 296
      Height = 21
      Hint = #1044#1083#1103' '#1074#1074#1086#1076#1072' '#1090#1072#1083#1086#1085#1086#1074' '#1089#1082#1072#1085#1077#1088#1086#1084' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1082#1091#1088#1089#1086#1088' '#1074' '#1101#1090#1086' '#1087#1086#1083#1077
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
      Text = #1044#1083#1103' '#1074#1074#1086#1076#1072' '#1090#1072#1083#1086#1085#1086#1074' '#1089#1082#1072#1085#1077#1088#1086#1084' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1082#1091#1088#1089#1086#1088' '#1074' '#1101#1090#1086' '#1087#1086#1083#1077
      OnKeyPress = Edit6KeyPress
    end
    object Import: TBitBtn
      Left = 33
      Top = 4
      Width = 28
      Height = 25
      Hint = #1048#1084#1087#1086#1088#1090' '#1090#1072#1083#1086#1085#1086#1074
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ImportClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000008080008080
        0080800080800000000080800080800080800080800080800080800000000080
        8000808000808000808000808000808000808000808000000000808000808000
        8080008080008080008080000000008080008080008080008080008080008080
        0080800000000000FF0000000080800080800080800080800000000000FF0000
        000080800080800080800080800080800080800000000000FF00000000808000
        80800080800080800000000000FF000000008080008080008080008080008080
        0000000000FF0000FF0000FF0000000080800080800000000000FF0000FF0000
        FF0000000080800080800080800080800000000000FF0000FF0000FF00000000
        80800080800000000000FF0000FF0000FF000000008080008080008080000000
        0000FF0000FF0000FF0000FF0000FF0000000000000000FF0000FF0000FF0000
        FF0000FF0000000080800080800000000000FF0000FF0000FF0000FF0000FF00
        00000000000000FF0000FF0000FF0000FF0000FF0000000080800000000000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000000000000000000000000000000000FF00000000000000
        00000000000000000000000000FF000000000000000000000000008080008080
        0080800000000000FF0000000080800080800080800080800000000000FF0000
        000080800080800080800080800080800080800000000000FF00000000808000
        80800080800080800000000000FF000000008080008080008080008080008080
        0080800000000000FF0000000080800080800080800080800000000000FF0000
        000080800080800080800080800080800080800000000000FF00000000808000
        80800080800080800000000000FF000000008080008080008080008080008080
        0080800000000000FF0000000080800080800080800080800000000000FF0000
        0000808000808000808000808000808000808000000000000000000000808000
        8080008080008080000000000000000000008080008080008080}
    end
    object Export: TBitBtn
      Left = 64
      Top = 4
      Width = 28
      Height = 25
      Hint = #1042#1099#1075#1088#1091#1079#1082#1072' '#1090#1072#1083#1086#1085#1086#1074
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ExportClick
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
  object dbgTalon: TDBGridEh
    Left = 0
    Top = 29
    Width = 364
    Height = 396
    Hint = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1087#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
    Align = alClient
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
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
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnExit = dbgTalonExit
    OnGetCellParams = dbgTalonGetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Ser'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1057#1077#1088#1080#1103
        Width = 41
      end
      item
        EditButtons = <>
        FieldName = 'Num'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'Litr'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1053#1086#1084#1080#1085#1072#1083
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'CountT'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Caption = #1042#1077#1089
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'NPGrpName'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1058#1080#1087' '#1053#1055
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'bInTheWay'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Caption = #1042' '#1087#1091#1090#1080
        Width = 37
      end>
  end
  object p1: TPanel
    Left = 366
    Top = 29
    Width = 206
    Height = 396
    Align = alRight
    Constraints.MinHeight = 393
    Constraints.MinWidth = 206
    TabOrder = 2
    object GroupBox3: TGroupBox
      Left = 1
      Top = 1
      Width = 204
      Height = 176
      Align = alClient
      Caption = #1054#1087#1077#1088'. '#1087#1086' '#1090#1072#1083#1086#1085#1091
      TabOrder = 0
      object DBText4: TDBText
        Left = 100
        Top = 0
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'SER'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 132
        Top = 0
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'NUM'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBGrid3: TDBGridEh
        Left = 2
        Top = 15
        Width = 200
        Height = 159
        Align = alClient
        DataSource = dsTalonDetail
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clBlack
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        VertScrollBar.VisibleMode = sbAlwaysShowEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'TITLE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
            Width = 59
          end
          item
            EditButtons = <>
            FieldName = 'PRIH_DATE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072
            Width = 59
          end
          item
            EditButtons = <>
            FieldName = 'PRIH_NUM'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 59
          end>
      end
      object eCodeTalon: TEdit
        Left = 8
        Top = 148
        Width = 171
        Height = 21
        TabOrder = 1
        Visible = False
        OnKeyPress = eCodeTalonKeyPress
      end
    end
    object v: TGroupBox
      Left = 1
      Top = 265
      Width = 204
      Height = 130
      Align = alBottom
      Caption = #1055#1086' '#1087'/'#1087#1072#1088#1090#1080#1080
      TabOrder = 1
      DesignSize = (
        204
        130)
      object Label5: TLabel
        Left = 6
        Top = 35
        Width = 54
        Height = 13
        Caption = #1054#1090#1087#1091#1097#1077#1085#1086':'
      end
      object Label1: TLabel
        Left = 6
        Top = 50
        Width = 98
        Height = 13
        Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1085#1072#1095#1072#1083#1086':'
      end
      object Label2: TLabel
        Left = 51
        Top = 65
        Width = 48
        Height = 13
        Caption = #1085#1072' '#1082#1086#1085#1077#1094':'
      end
      object lOut: TLabel
        Left = 74
        Top = 35
        Width = 19
        Height = 13
        Caption = 'lOut'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 6
        Top = 80
        Width = 41
        Height = 13
        Caption = #1058#1080#1087' '#1053#1055':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 6
        Top = 111
        Width = 76
        Height = 13
        Caption = #1059#1076#1077#1083#1100#1085#1099#1081' '#1074#1077#1089':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbtNPType: TDBText
        Left = 6
        Top = 95
        Width = 195
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        DataField = 'NPType_Name'
        DataSource = dsSubPart
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnMouseMove = dbtNPTypeMouseMove
      end
      object dbtUd_weig: TDBText
        Left = 97
        Top = 111
        Width = 100
        Height = 13
        DataField = 'Ud_weig'
        DataSource = dsSubPart
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lEndRest: TLabel
        Left = 120
        Top = 65
        Width = 43
        Height = 13
        Caption = 'lEndRest'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbtBeginRest: TDBText
        Left = 120
        Top = 50
        Width = 80
        Height = 13
        DataField = 'BeginRest'
        DataSource = dsSubPart
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object leSubPart: TRxLookupEdit
        Left = 6
        Top = 16
        Width = 194
        Height = 18
        LookupField = 'SubPartName'
        LookupSource = dsSubPart
        Ctl3D = False
        DirectInput = False
        Anchors = [akLeft, akTop, akRight]
        ParentCtl3D = False
        TabOrder = 0
        Text = 'leSubPart'
        OnCloseUp = leSubPartCloseUp
      end
    end
    object gbFilterTest: TGroupBox
      Left = 1
      Top = 177
      Width = 204
      Height = 88
      Align = alBottom
      Caption = #1060#1080#1083#1100#1090#1088
      TabOrder = 2
      Visible = False
      object lNP: TLabel
        Left = 6
        Top = 21
        Width = 41
        Height = 13
        Caption = #1058#1080#1087' '#1053#1055':'
      end
      object l1: TLabel
        Left = 6
        Top = 40
        Width = 181
        Height = 39
        Caption = 
          #1044#1083#1103' '#1073#1099#1089#1090#1088#1086#1075#1086' '#1087#1077#1088#1077#1093#1086#1076#1072' '#1084#1077#1078#1076#1091' '#1053#1055' '#13#10#1079#1072#1078#1084#1080#1090#1077' '#1082#1083#1072#1074#1080#1096#1091' Alt '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1085 +
          #1072' '#13#10#1082#1083#1072#1074#1080#1096#1091' 0, 1, 2, 3, 4, 5 '#1080' 6'
      end
      object cbFilterNP: TComboBox
        Left = 62
        Top = 16
        Width = 137
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = #1042#1089#1077
        OnChange = cbFilterNPChange
        Items.Strings = (
          #1042#1089#1077
          #1040'-76/A-80'
          #1040'-92'
          #1040'-95'
          #1040'-98'
          #1044#1058
          #1043#1072#1079)
      end
    end
  end
  object pDep: TPanel
    Left = 0
    Top = 0
    Width = 572
    Height = 29
    Align = alTop
    TabOrder = 3
    object Label16: TLabel
      Left = 6
      Top = 8
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1086#1084#1091
    end
    object ceDep: TComboEdit
      Left = 48
      Top = 4
      Width = 521
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ceDepButtonClick
      OnDblClick = ceDepButtonClick
    end
  end
  object Table1: TTable
    BeforePost = Table1BeforePost
    AfterPost = Table1AfterPost
    AfterDelete = Table1AfterPost
    OnCalcFields = Table1CalcFields
    DefaultIndex = False
    TableName = 'Oil_SRTalonT.DB'
    Left = 25
    Top = 51
    object Table1Ttn_Id: TIntegerField
      FieldName = 'Ttn_Id'
    end
    object Table1Ttn_Inst: TIntegerField
      FieldName = 'Ttn_Inst'
    end
    object Table1Ser: TStringField
      FieldName = 'Ser'
      Size = 3
    end
    object Table1Num: TIntegerField
      FieldName = 'Num'
      OnValidate = Table1NumValidate
      DisplayFormat = '0000000'
    end
    object Table1Auto_Id: TIntegerField
      FieldName = 'Auto_Id'
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
    object Table1SubPart: TIntegerField
      FieldName = 'SubPart'
    end
    object Table1NPGrp_Id: TIntegerField
      FieldName = 'NPGrp_Id'
    end
    object Table1NPGrpName: TStringField
      FieldKind = fkLookup
      FieldName = 'NPGrpName'
      LookupDataSet = qNPGroup
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'NPGrp_Id'
      Lookup = True
    end
    object Table1Price: TFloatField
      FieldName = 'Price'
      DisplayFormat = '0.00##'
    end
    object Table1Count: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Count'
      DisplayFormat = '0.00##'
      Precision = 6
      Calculated = True
    end
    object Table1CountT: TFloatField
      FieldName = 'CountT'
      DisplayFormat = '0.000000##'
      Precision = 6
    end
    object Table1Litr: TFloatField
      FieldName = 'Litr'
      DisplayFormat = '0.#####'
      Precision = 3
    end
    object Table1Nominal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'nominal'
      DisplayFormat = '0.#####'
      Precision = 3
      Calculated = True
    end
    object Table1InTheWay: TIntegerField
      FieldName = 'InTheWay'
    end
    object Table1bInTheWay: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'bInTheWay'
      Calculated = True
    end
  end
  object ds: TDataSource
    DataSet = Table1
    Left = 35
    Top = 43
  end
  object qPriv: TQuery
    Left = 24
    Top = 167
  end
  object dsTalonDetail: TOraDataSource
    DataSet = qTalonDetail
    OnDataChange = dsTalonDetailDataChange
    Left = 445
    Top = 105
  end
  object qTalonDetail: TOilQuery
    SQL.Strings = (
      'select o.*, npg.name as NPGrpName'
      '  from (select '#39#1069#1084#1080#1089#1080#1103#39' as Title,'
      '               date_ + 0.1 as prih_date,'
      '               1,'
      '               '#39'1'#39' as Prih_Num,'
      '               nominal,'
      '               npgrp_id'
      '          from oil_talon_em'
      '         where oil_talon_em.state = '#39'Y'#39
      '           and ser = :ser'
      '           and :num between num_from and num_to'
      '        union all'
      '        select decode(Tip, '#39'P'#39', '#39#1055#1088#1080#1093#1086#1076#39', '#39#1054#1090#1087#1091#1089#1082#39') as Title,'
      '               Date_,'
      '               decode(Tip, '#39'P'#39', 2, 1),'
      '               Head_Num,'
      '               Nominal,'
      '               NPGrp_Id'
      '          from V_Oil_Talon_Op'
      '         where Ser = :Ser'
      '           and Num = :Num) o,'
      '       Oil_NP_Group npg'
      ' where o.NPGrp_Id = npg.Id(+)'
      ' order by 2 desc, 3 desc')
    MasterSource = ds
    AutoCalcFields = False
    DataSource = ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 434
    Top = 121
    ParamData = <
      item
        DataType = ftString
        Name = 'Ser'
      end
      item
        DataType = ftInteger
        Name = 'Num'
      end>
  end
  object qCheckUp: TOilQuery
    SQL.Strings = (
      'select decode(Tip, '#39'P'#39', Date_ + 0.1, Date_) as Prih_Date,'
      '       decode(Tip, '#39'P'#39', 1, 2)'
      '  from V_Oil_Talon_Op'
      ' where Dep_Id = :Inst'
      '   and Ser = :Ser'
      '   and Num = :Num'
      '   and Date_ > :Date_'
      ' order by Prih_Date desc')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 123
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Inst'
      end
      item
        DataType = ftString
        Name = 'ser'
      end
      item
        DataType = ftInteger
        Name = 'num'
      end
      item
        DataType = ftUnknown
        Name = 'Date_'
      end>
  end
  object qCheckDown: TOilQuery
    SQL.Strings = (
      'select Date_ + 0.1 as Prih_Date, 1'
      '  from V_Oil_Talon_Op'
      ' where Tip = '#39'P'#39
      '   and Dep_Id = :Inst'
      '   and Ser = :Ser'
      '   and Num = :Num'
      
        '   and not ((nvl(SRep_Id, 0) = :MainId) and (nvl(SRep_Inst, 0) =' +
        ' :MainInst))'
      '   and Date_ <= :Date_'
      'union'
      'select Date_, 2'
      '  from V_Oil_Talon_Op'
      ' where Tip = '#39'O'#39
      '   and Dep_Id = :Inst'
      '   and Ser = :Ser'
      '   and Num = :Num'
      '   and Date_ <= :Date_'
      ' order by Prih_Date desc')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 123
    Top = 87
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Inst'
      end
      item
        DataType = ftString
        Name = 'ser'
      end
      item
        DataType = ftInteger
        Name = 'num'
      end
      item
        DataType = ftInteger
        Name = 'MainId'
      end
      item
        DataType = ftInteger
        Name = 'MainInst'
      end
      item
        DataType = ftUnknown
        Name = 'Date_'
      end>
  end
  object qSubPart: TQuery
    OnCalcFields = qSubPartCalcFields
    SQL.Strings = (
      'select TTN_Id,'
      '       TTN_Inst,'
      
        '       Part_Name || '#39'/'#39' || cast(SubPart_Name as char(20)) as Sub' +
        'PartName,'
      '       Litr,'
      '       Nal,'
      '       Ved,'
      '       SN,'
      '       Other,'
      '       NPType_Name,'
      '       Ud_weig'
      '  from Oil_SR_Rashod.db'
      '/*11*/')
    Left = 24
    Top = 108
    object qSubPartTTN_Id: TIntegerField
      FieldName = 'TTN_Id'
    end
    object qSubPartTTN_Inst: TIntegerField
      FieldName = 'TTN_Inst'
    end
    object qSubPartSubPartName: TStringField
      FieldName = 'SubPartName'
      Size = 71
    end
    object qSubPartLitr: TFloatField
      FieldName = 'Litr'
    end
    object qSubPartNal: TFloatField
      FieldName = 'Nal'
    end
    object qSubPartVed: TFloatField
      FieldName = 'Ved'
    end
    object qSubPartSN: TFloatField
      FieldName = 'SN'
    end
    object qSubPartOther: TFloatField
      FieldName = 'Other'
    end
    object qSubPartNPType_Name: TStringField
      FieldName = 'NPType_Name'
      Size = 50
    end
    object qSubPartUd_weig: TFloatField
      FieldName = 'Ud_weig'
      DisplayFormat = '0.000000'
    end
    object qSubPartBeginRest: TFloatField
      FieldKind = fkCalculated
      FieldName = 'BeginRest'
      DisplayFormat = '0.000'
      Calculated = True
    end
  end
  object dsSubPart: TDataSource
    DataSet = qSubPart
    Left = 35
    Top = 100
  end
  object SD: TSaveDialog
    Filter = 'dbf|*.dbf*|All files|* *'
    Left = 192
    Top = 40
  end
  object qNPGroup: TOilQuery
    SQL.Strings = (
      'select * from OIL_NP_GROUP where STATE = '#39'Y'#39)
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 123
    Top = 132
  end
  object ActionList: TActionList
    Left = 240
    Top = 280
    object ActNP0: TAction
      Caption = 'ActNP0'
      ShortCut = 32816
      OnExecute = ActNP1Execute
    end
    object ActNP1: TAction
      Tag = 1
      Caption = 'ActNP1'
      ShortCut = 32817
      OnExecute = ActNP1Execute
    end
    object ActNP2: TAction
      Tag = 2
      Caption = 'ActNP2'
      ShortCut = 32818
      OnExecute = ActNP1Execute
    end
    object ActNP3: TAction
      Tag = 3
      Caption = 'ActNP3'
      ShortCut = 32819
      OnExecute = ActNP1Execute
    end
    object ActNP4: TAction
      Tag = 4
      Caption = 'ActNP4'
      ShortCut = 32820
      OnExecute = ActNP1Execute
    end
    object ActNP5: TAction
      Tag = 5
      Caption = 'ActNP5'
      ShortCut = 32821
      OnExecute = ActNP1Execute
    end
    object ActNP6: TAction
      Tag = 6
      Caption = 'ActNP6'
      ShortCut = 32822
      OnExecute = ActNP1Execute
    end
  end
end
