inherited SynchroPartForm: TSynchroPartForm
  Left = 338
  Top = 194
  BorderStyle = bsDialog
  Caption = #1047#1072#1084#1077#1085#1072' '#1087#1072#1088#1090#1080#1081
  ClientHeight = 370
  ClientWidth = 492
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grid1: TDBGridEh
    Left = 0
    Top = 0
    Width = 492
    Height = 204
    Align = alClient
    AllowedOperations = [alopUpdateEh, alopDeleteEh, alopAppendEh]
    DataSource = ds
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnGetCellParams = grid1GetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID_FROM'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1086#1076
        Width = 104
      end
      item
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'DOG_FROM'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1055#1072#1088#1090#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 118
        OnEditButtonClick = grid1Columns1EditButtonClick
      end
      item
        Alignment = taCenter
        Color = clGray
        EditButtons = <>
        FieldName = 'SEPARATOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        ReadOnly = True
        Title.Caption = '=>'
        Title.Color = clGray
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 18
      end
      item
        EditButtons = <>
        FieldName = 'ID_TO'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1086#1076
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 96
      end
      item
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'DOG_TO'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1055#1072#1088#1090#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 116
        OnEditButtonClick = grid1Columns6EditButtonClick
      end>
  end
  object gridDet: TDBGridEh
    Left = 0
    Top = 228
    Width = 492
    Height = 112
    Align = alBottom
    Color = clBtnFace
    DataSource = dsDet
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    HorzScrollBar.Visible = False
    Options = [dgTitles, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbNeverShowEh
    OnGetCellParams = gridDetGetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TEXT_FROM'
        Footers = <>
        Title.Caption = #1042#1074#1077#1076#1077#1085#1085#1072#1103' '#1079#1076#1077#1089#1100
        Width = 225
      end
      item
        Color = clGray
        EditButtons = <>
        Footers = <>
        Title.Caption = '=>'
        Title.Color = clGray
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 20
      end
      item
        Alignment = taRightJustify
        EditButtons = <>
        FieldName = 'TEXT_TO'
        Footers = <>
        Title.Alignment = taRightJustify
        Title.Caption = #1055#1088#1080#1089#1083#1072#1085#1085#1072#1103' '#1080#1079' '#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1099
        Width = 232
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 204
    Width = 492
    Height = 24
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1080#1085#1093#1088#1086#1085#1080#1079#1080#1088#1091#1077#1084#1099#1093' '#1087#1072#1088#1090#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 0
    Top = 340
    Width = 492
    Height = 30
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    DesignSize = (
      492
      30)
    object OilHelpButton1: TOilHelpButton
      Left = 4
      Top = 4
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
        '{12}{RED}\B'#1060#1086#1088#1084#1072' '#1079#1072#1084#1077#1085#1099' '#1087#1072#1088#1090#1080#1081'\D{10}'
        ''
        #1060#1086#1088#1084#1072' '#1089#1086#1089#1090#1086#1080#1090' '#1080#1079' '#1076#1074#1091#1093' '#1095#1072#1089#1090#1077#1081'. '#1042' \B'#1074#1077#1088#1093#1085#1077#1081'\D '#1085#1072#1093#1086#1076#1080#1090#1089#1103
        #1089#1087#1080#1089#1086#1082' '#1087#1072#1088#1090#1080#1081', '#1082#1086#1090#1086#1088#1099#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1089#1080#1085#1093#1088#1086#1085#1080#1079#1080#1088#1086#1074#1072#1090#1100'.'
        #1042' \B'#1085#1080#1078#1085#1077#1081'\D - '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086#1073' '#1101#1090#1080#1093' '#1087#1072#1088#1090#1080#1103#1093'.'
        ''
        #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1089#1072#1084#1072' '#1085#1072#1093#1086#1076#1080#1090' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1080#1077' '#1087#1072#1088#1090#1080#1080', '#1087#1088#1080#1089#1083#1072#1085#1085#1099#1077
        #1080#1079' '#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1099', '#1080' '#1077#1089#1083#1080' '#1085#1077' '#1073#1099#1083#1086' '#1085#1080#1082#1072#1082#1080#1093' '#1086#1096#1080#1073#1086#1082' '#1087#1088#1080' '#1074#1074#1086#1076#1077
        
          #1076#1072#1085#1085#1099#1093', '#1090#1086' '#1042#1072#1084' '#1086#1089#1090#1072#1085#1077#1090#1089#1103' '#1083#1080#1096#1100' '#1085#1072#1078#1072#1090#1100' '#1085#1072' '#1082#1085#1086#1087#1082#1091' \B{BLUE}'#1047#1072#1084#1077#1085#1080#1090#1100' ' +
          #1074#1089#1077'\D'
        ''
        #1042' '#1089#1083#1091#1095#1072#1077', '#1077#1089#1083#1080' '#1087#1088#1080' '#1074#1074#1086#1076#1077' '#1087#1072#1088#1090#1080#1081' '#1073#1099#1083#1080' '#1076#1086#1087#1091#1097#1077#1085#1099' '#1086#1096#1080#1073#1082#1080','
        #1087#1086#1103#1074#1103#1090#1089#1103' '#1085#1077#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' '#1084#1077#1078#1076#1091' '#1074#1074#1077#1076#1077#1085#1099#1084#1080' '#1042#1072#1084#1080' '#1087#1072#1088#1090#1080#1103#1084#1080' '#1080
        #1087#1088#1080#1089#1083#1072#1085#1085#1099#1084#1080' '#1080#1079' '#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1099'. '#1047#1072' '#1090#1072#1082#1080#1077' '#1085#1077#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' '#1089#1095#1080#1090#1072#1102#1090#1089#1103
        
          #1085#1077#1089#1086#1074#1087#1072#1076#1077#1085#1080#1103' \B'#1058#1080#1087#1072' '#1090#1086#1074#1072#1088#1072', '#1058#1080#1087#1072' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072'\D '#1080' \B'#1055#1086#1089#1090#1072#1074#1097#1080#1082#1072'\' +
          'D.'
        #1057#1090#1088#1086#1082#1080' '#1089' '#1085#1077#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103#1084#1080' '#1086#1090#1086#1073#1088#1072#1078#1072#1102#1090#1089#1103' {RED}'#1082#1088#1072#1089#1085#1099#1084'\D '#1094#1074#1077#1090#1086#1084', '#1080
        #1090#1072#1082#1080#1077' '#1087#1072#1088#1090#1080#1080' '#1085#1077' '#1079#1072#1084#1077#1085#1103#1102#1090#1089#1103' '#1087#1088#1080' '#1085#1072#1078#1072#1090#1080#1080' \B{BLUE}'#1047#1072#1084#1077#1085#1080#1090#1100' '#1074#1089#1077'\D. '
        #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1089#1085#1072#1095#1072#1083#1072' '#1080#1089#1087#1088#1072#1074#1080#1090#1100' '#1074#1086#1079#1085#1080#1082#1096#1091#1102' '#1089#1080#1090#1091#1072#1094#1080#1102', '#1072' '#1079#1072#1090#1077#1084
        #1087#1088#1086#1074#1077#1089#1090#1080' '#1079#1072#1084#1077#1085#1091' '#1087#1072#1088#1090#1080#1081'.'
        ''
        #1045#1089#1083#1080' '#1076#1072#1085#1085#1099#1077' '#1085#1077#1074#1077#1088#1085#1099' '#1074' '#1087#1072#1088#1090#1080#1080', '#1087#1088#1080#1089#1083#1072#1085#1085#1086#1081' '#1080#1079' '#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1099', '#1090#1086' '#1042#1072#1084
        
          #1085#1091#1078#1085#1086' '#1087#1077#1088#1077#1079#1074#1086#1085#1080#1090#1100' '#1074' '#1086#1090#1076#1077#1083' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080' '#1080' '#1087#1086#1089#1090#1072#1074#1080#1090#1100' '#1080#1093' '#1074' '#1080#1079#1074#1077#1089#1090#1085#1086#1089#1090 +
          #1100
        #1086' '#1076#1086#1087#1091#1097#1077#1085#1085#1086#1081' '#1086#1096#1080#1073#1082#1077'. '#1041#1086#1083#1100#1096#1072#1103' '#1087#1088#1086#1089#1100#1073#1072' - '#1085#1077' '#1086#1073#1088#1072#1097#1072#1081#1090#1077#1089#1100' '#1089' '#1101#1090#1080#1084
        
          #1074#1086#1087#1088#1086#1089#1072#1084' '#1082' '#1087#1088#1086#1075#1088#1072#1084#1084#1080#1089#1090#1072#1084', '#1090#1072#1082' '#1082#1072#1082' '#1086#1085#1080' '#1085#1077' '#1080#1084#1077#1102#1090' '#1087#1086#1083#1085#1086#1084#1086#1095#1080#1081' '#1077#1075#1086' '#1088#1077 +
          #1096#1080#1090#1100'.'
        ''
        ''
        ' ')
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'MS Sans Serif'
      HeaderFont.Style = []
      Animate = False
      UseCurrentDir = False
      FormOrientation = fBottomToTop
      Images = MainForm.il
      ImageIndex = 0
    end
    object btnClose: TBitBtn
      Left = 400
      Top = 4
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCloseClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnAll: TBitBtn
      Left = 292
      Top = 4
      Width = 105
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1084#1077#1085#1080#1090#1100' &'#1074#1089#1077
      TabOrder = 1
      OnClick = btnAllClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object btnOne: TBitBtn
      Left = 136
      Top = 4
      Width = 153
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1084#1077#1085#1080#1090#1100' &'#1074#1099#1073#1088#1072#1085#1085#1091#1102
      TabOrder = 2
      OnClick = btnOneClick
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
  object ds: TOraDataSource
    DataSet = mt
    OnDataChange = dsDataChange
    Left = 248
    Top = 96
  end
  object mt: TMemoryTable
    BeforePost = mtBeforePost
    Left = 232
    Top = 112
    object mtID_FROM: TFloatField
      FieldName = 'ID_FROM'
    end
    object mtINST_FROM: TFloatField
      FieldName = 'INST_FROM'
    end
    object mtDOG_FROM: TStringField
      FieldName = 'DOG_FROM'
    end
    object mtDOG_DATE_FROM: TStringField
      FieldName = 'DOG_DATE_FROM'
    end
    object mtNP_TYPE_ID_FROM: TFloatField
      FieldName = 'NP_TYPE_ID_FROM'
    end
    object mtNP_TYPE_FROM: TStringField
      FieldName = 'NP_TYPE_FROM'
      Size = 50
    end
    object mtID_TO: TFloatField
      FieldName = 'ID_TO'
    end
    object mtINST_TO: TFloatField
      FieldName = 'INST_TO'
    end
    object mtDOG_TO: TStringField
      FieldName = 'DOG_TO'
    end
    object mtDOG_DATE_TO: TStringField
      FieldName = 'DOG_DATE_TO'
    end
    object mtNP_TYPE_ID_TO: TFloatField
      FieldName = 'NP_TYPE_ID_TO'
    end
    object mtNP_TYPE_TO: TStringField
      FieldName = 'NP_TYPE_TO'
      Size = 50
    end
    object mtPOST_ID_FROM: TFloatField
      FieldName = 'POST_ID_FROM'
    end
    object mtPOST_ID_TO: TFloatField
      FieldName = 'POST_ID_TO'
    end
    object mtPOST_INST_FROM: TFloatField
      FieldName = 'POST_INST_FROM'
    end
    object mtPOST_INST_TO: TFloatField
      FieldName = 'POST_INST_TO'
    end
    object mtSEPARATOR: TStringField
      FieldName = 'SEPARATOR'
      Size = 10
    end
    object mtPOST_NAME_FROM: TStringField
      FieldName = 'POST_NAME_FROM'
      Size = 100
    end
    object mtPOST_NAME_TO: TStringField
      FieldName = 'POST_NAME_TO'
      Size = 100
    end
    object mtOWN_GOODS_FROM: TStringField
      FieldName = 'OWN_GOODS_FROM'
      Size = 1
    end
    object mtOWN_GOODS_TO: TStringField
      FieldName = 'OWN_GOODS_TO'
      Size = 1
    end
    object mtPLAN_ID_TO: TFloatField
      FieldName = 'PLAN_ID_TO'
    end
    object mtMAY_SYNCHR: TBooleanField
      FieldName = 'MAY_SYNCHR'
    end
  end
  object qLoad: TOilQuery
    SQL.Strings = (
      '--> qLoad,SynchroPart'
      'select /*+ORDERED USE_HASH(p,p1,oo,npt,ov,poss)*/'
      
        '  distinct p.*,'#39'=>'#39' as separator,oo.name as from_name,npt.name a' +
        's np_type_name'
      'from '
      '  oil_part p,oil_part p1,v_org oo,oil_np_type npt,'
      '  oil_var ov,adm_possible_inst poss'
      'where p.state='#39'Y'#39' and p.plan_id is null'
      '  and p1.state='#39'Y'#39' and p1.plan_id is not null'
      '  and upper(p.dog)=upper(p1.dog)'
      '  and p.from_=oo.id and p.from_inst=oo.inst'
      '  and p.np_type=npt.id'
      '  and ov.name='#39'INST'#39
      '  and poss.id(+)=ov.value and poss.inst(+)=poss.id(+)'
      
        '  and instr('#39','#39'||nvl(poss.poss_inst,ov.value)||'#39','#39','#39','#39'||p.inst||' +
        #39','#39')>0')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 120
    Top = 88
  end
  object mtDet: TMemoryTable
    Left = 216
    Top = 280
    object mtDetTEXT_FROM: TStringField
      FieldName = 'TEXT_FROM'
      Size = 50
    end
    object mtDetTEXT_TO: TStringField
      FieldName = 'TEXT_TO'
      Size = 50
    end
    object mtDetIS_EQUAL: TBooleanField
      FieldName = 'IS_EQUAL'
    end
  end
  object dsDet: TOraDataSource
    DataSet = mtDet
    Left = 232
    Top = 264
  end
  object sp: TOraStoredProc
    StoredProcName = 'FIND_SYNCHRO_PART'
    Session = frmStart.OraSession1
    SQL.Strings = (
      'begin'
      '  FIND_SYNCHRO_PART(:P_ID, :P_INST, :PP_ID, :PP_INST);'
      'end;')
    Left = 168
    Top = 48
    ParamData = <
      item
        DataType = ftFloat
        Name = 'P_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_INST'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PP_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PP_INST'
        ParamType = ptOutput
      end>
  end
  object qMatch: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '--> qMatch,SynchroPart'
      'select p.*,oo.name as from_name,npt.name as np_type_name'
      'from oil_part p,v_org oo,oil_np_type npt'
      'where p.state='#39'Y'#39' and p.plan_id is not null'
      '  and p.from_=oo.id and p.from_inst=oo.inst'
      '  and p.np_type=npt.id'
      '  and p.id=:id and p.inst=:inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 224
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end>
  end
end
