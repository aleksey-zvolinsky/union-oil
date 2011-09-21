inherited AddOrgForm: TAddOrgForm
  Left = 467
  Top = 289
  BorderStyle = bsDialog
  Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
  ClientHeight = 426
  ClientWidth = 479
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel6: TPanel
    Left = 0
    Top = 393
    Width = 479
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      479
      33)
    object bbCancel: TBitBtn
      Left = 385
      Top = 4
      Width = 87
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      Anchors = [akTop, akRight]
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 0
      OnClick = bbCancelClick
      Kind = bkCancel
    end
    object bbOk: TBitBtn
      Left = 295
      Top = 4
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
      TabOrder = 1
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
    object BitBtn1: TBitBtn
      Left = 4
      Top = 4
      Width = 113
      Height = 25
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888F8F8F8F8F8888888F8F8F8F8F8888F8F8F8F8F8
        F8F888F8F8F8F8F8F8F88F8F800000077F8F8F8F877777777F8FF8F00EEEFFF7
        78F8F8F77FFFFFF778F88F04E400E0007F8F8F77F777F7777F8FF800E000E007
        F8F8F877F777F777F8F88F000000007F8F8F8F777777778F8F8FF87700077778
        F8F8F88877788888F8F88F777777778F8F888F888888888F8F8888F77778F8F8
        F88888F88888F8F8F888888F8F8F8F888888888F8F8F8F888888888888888888
        8888888888888888888888888888888888888888888888888888}
      NumGlyphs = 2
    end
    object btnUkr: TBitBtn
      Left = 120
      Top = 4
      Width = 129
      Height = 25
      Caption = #1060#1086#1088#1084#1099' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080
      TabOrder = 3
      OnClick = btnUkrClick
      NumGlyphs = 2
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 479
    Height = 123
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      479
      123)
    object Label1: TLabel
      Left = 6
      Top = 4
      Width = 82
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' :'
    end
    object Label7: TLabel
      Left = 6
      Top = 80
      Width = 122
      Height = 13
      Caption = #1043#1086#1083#1086#1074#1085#1086#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077' :'
    end
    object Label2: TLabel
      Left = 320
      Top = 4
      Width = 25
      Height = 13
      Caption = #1058#1080#1087' :'
    end
    object Label8: TLabel
      Left = 320
      Top = 80
      Width = 25
      Height = 13
      Caption = #1042#1080#1076' :'
    end
    object sbClearD_E: TSpeedButton
      Left = 285
      Top = 94
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
      OnClick = sbClearD_EClick
    end
    object Label10: TLabel
      Left = 6
      Top = 42
      Width = 111
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' ('#1091#1082#1088'.) :'
    end
    object Edit1: TEdit
      Left = 6
      Top = 18
      Width = 300
      Height = 21
      Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      AutoSize = False
      MaxLength = 100
      TabOrder = 0
    end
    object CEParOrg: TComboEdit
      Left = 6
      Top = 94
      Width = 280
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 3
      Text = #1053#1077#1090
      OnButtonClick = CEParOrgButtonClick
    end
    object ceOrgType: TComboEdit
      Left = 320
      Top = 18
      Width = 153
      Height = 21
      Hint = #1058#1080#1087' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = ceOrgTypeButtonClick
      OnDblClick = ceOrgTypeButtonClick
    end
    object ComboBox2: TComboBox
      Left = 320
      Top = 94
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnChange = ComboBox2Change
      Items.Strings = (
        #1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
        #1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
        #1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085)
    end
    object edNameUkr: TEdit
      Left = 6
      Top = 56
      Width = 300
      Height = 21
      Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      MaxLength = 100
      TabOrder = 2
    end
  end
  object Panel9: TPanel
    Left = 0
    Top = 123
    Width = 479
    Height = 122
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel10: TPanel
      Left = 0
      Top = 0
      Width = 140
      Height = 122
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label3: TLabel
        Left = 6
        Top = 4
        Width = 99
        Height = 13
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094'. '#1082#1086#1076' :'
      end
      object Label4: TLabel
        Left = 6
        Top = 42
        Width = 98
        Height = 13
        Caption = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#1085#1086#1084#1077#1088' :'
      end
      object Label5: TLabel
        Left = 6
        Top = 80
        Width = 93
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1089#1074#1080#1076#1077#1090'-'#1074#1072' :'
      end
      object sbFakeIdNum: TSpeedButton
        Left = 106
        Top = 18
        Width = 23
        Height = 22
        AllowAllUp = True
        GroupIndex = 1
        Caption = #1060
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbFakeIdNumClick
      end
      object edIdNum: TEdit
        Left = 6
        Top = 18
        Width = 94
        Height = 21
        TabOrder = 0
      end
      object Edit3: TEdit
        Left = 6
        Top = 56
        Width = 121
        Height = 21
        Hint = #1048#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1081' '#1085#1072#1083#1086#1075#1086#1074#1099#1081' '#1085#1086#1084#1077#1088' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        MaxLength = 12
        TabOrder = 1
      end
      object Edit4: TEdit
        Left = 6
        Top = 94
        Width = 121
        Height = 21
        Hint = #1053#1086#1084#1077#1088' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
        MaxLength = 50
        TabOrder = 2
      end
    end
    object Panel11: TPanel
      Left = 140
      Top = 0
      Width = 339
      Height = 122
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label6: TLabel
        Left = 4
        Top = 4
        Width = 314
        Height = 13
        Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099'  ('#1087#1088#1072#1074#1072#1103' '#1082#1085#1086#1087#1082#1072' - '#1074#1099#1073#1086#1088' '#1088#1077#1082#1074#1080#1079#1080#1090#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102')'
      end
      object RxDBGrid1: TDBGridEh
        Left = 2
        Top = 23
        Width = 335
        Height = 97
        Hint = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        Align = alBottom
        DataSource = DataSource1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEditButtonClick = RxDBGrid1EditButtonClick
        OnGetCellParams = RxDBGrid1GetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'Def'
            Footers = <>
            Title.Caption = #1054#1089#1085'.'
            Width = 31
          end
          item
            EditButtons = <>
            FieldName = 'Rach_chet'
            Footers = <>
            Title.Caption = #1056#1072#1089#1095'.'#1089#1095#1077#1090
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'RACH_CHET_NDS'
            Footers = <>
            Title.Caption = #1056#1072#1089#1095'.'#1089#1095#1077#1090' '#1053#1044#1057
            Width = 86
          end
          item
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'MFO'
            Footers = <>
            PickList.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7')
            ReadOnly = True
            Title.Caption = #1052#1060#1054
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'Face_chet'
            Footers = <>
            Title.Caption = #1051#1080#1094#1077#1074'.'#1089#1095#1077#1090
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'Check_book'
            Footers = <>
            Title.Caption = #1063#1077#1082#1086#1074'.'#1082#1085#1080#1078#1082'.'
            Width = 74
          end>
      end
    end
  end
  object panel12: TPanel
    Left = 0
    Top = 245
    Width = 479
    Height = 64
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object pnlAnketa: TPanel
      Left = 0
      Top = 0
      Width = 95
      Height = 64
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object lblBlagoText: TLabel
        Left = 6
        Top = 4
        Width = 56
        Height = 13
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103':'
      end
      object lblBlago: TLabel
        Left = 72
        Top = 4
        Width = 9
        Height = 13
        Caption = 'E'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblRatingText: TLabel
        Left = 6
        Top = 20
        Width = 44
        Height = 13
        Caption = #1056#1077#1081#1090#1080#1085#1075':'
      end
      object lblRating: TLabel
        Left = 56
        Top = 20
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = '2.45'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel15: TPanel
        Left = 6
        Top = 36
        Width = 82
        Height = 24
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 0
          Top = 0
          Width = 82
          Height = 22
          Caption = #1040#1085#1082#1077#1090#1080#1088#1086#1074#1072#1090#1100
          Flat = True
          OnClick = SpeedButton1Click
        end
      end
    end
    object Panel14: TPanel
      Left = 95
      Top = 0
      Width = 384
      Height = 64
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object sbInfo: TSpeedButton
        Left = 328
        Top = 20
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333337000073
          3333333338777783333333370044440073333338773333778333337044444444
          07333387333333337833370444BBBB44407338733388883337833044444BB444
          440337333338833333737044444BB444440787333338833333780444444BB444
          444073333338833333370444444BB444444073333338833333370444444BB444
          44407333333883333337044444BBB44444407333338883333337704444444444
          440787333333333333783044444BB444440337333338833333733704444BB444
          4073387333388333378333704444444407333387333333337833333700444400
          7333333877333377833333333700007333333333387777833333}
        NumGlyphs = 2
        OnClick = sbInfoClick
      end
      object lblBlackListOther: TLabel
        Left = 26
        Top = 24
        Width = 278
        Height = 13
        Caption = #1042#1085#1077#1089#1077#1085#1072' '#1074' "'#1095#1077#1088#1085#1099#1081' '#1089#1087#1080#1089#1086#1082'" '#1085#1072' '#1076#1088#1091#1075#1080#1093' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1093
      end
      object cbBlackList: TCheckBox
        Left = 8
        Top = 6
        Width = 169
        Height = 17
        Caption = #1042#1085#1077#1089#1077#1085#1072' '#1074' "'#1095#1077#1088#1085#1099#1081' '#1089#1087#1080#1089#1086#1082'" '
        TabOrder = 0
        OnClick = cbBlackListClick
      end
      object cbBlackListOther: TCheckBox
        Left = 8
        Top = 23
        Width = 17
        Height = 17
        Enabled = False
        TabOrder = 1
      end
      object cbSvoy: TCheckBox
        Left = 8
        Top = 40
        Width = 177
        Height = 17
        Caption = #1042#1085#1077#1089#1077#1085#1072' '#1074' '#1089#1087#1080#1089#1086#1082' "'#1089#1074#1086#1080#1093'"'
        TabOrder = 2
        OnClick = SetBlModes
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 309
    Width = 479
    Height = 84
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    DesignSize = (
      479
      84)
    object Label11: TLabel
      Left = 6
      Top = 4
      Width = 37
      Height = 13
      Caption = #1040#1076#1088#1077#1089' :'
    end
    object Label9: TLabel
      Left = 6
      Top = 42
      Width = 51
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085' :'
    end
    object Label18: TLabel
      Left = 344
      Top = 42
      Width = 125
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1077#1088#1074#1086#1075#1086' '#1082#1086#1085#1090#1072#1082#1090#1072' :'
    end
    object Label13: TLabel
      Left = 248
      Top = 4
      Width = 66
      Height = 13
      Caption = #1040#1076#1088#1077#1089' ('#1091#1082#1088'.) :'
    end
    object Memo1: TMemo
      Left = 6
      Top = 18
      Width = 225
      Height = 20
      Hint = #1040#1076#1088#1077#1089' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      MaxLength = 200
      TabOrder = 0
    end
    object Edit6: TEdit
      Left = 6
      Top = 56
      Width = 323
      Height = 21
      MaxLength = 30
      TabOrder = 2
    end
    object DateEdit1: TDateEdit
      Left = 344
      Top = 56
      Width = 129
      Height = 21
      Hint = #1042#1088#1077#1084#1103' '#1087#1077#1088#1074#1086#1075#1086' '#1076#1077#1083#1086#1074#1086#1075#1086' '#1082#1086#1085#1090#1072#1082#1090#1072' '#1089' '#1101#1090#1086#1081' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1077#1081
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 3
    end
    object edAddrUkr: TEdit
      Left = 246
      Top = 18
      Width = 225
      Height = 21
      Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      MaxLength = 200
      TabOrder = 1
    end
  end
  object DataSource1: TOraDataSource
    DataSet = tblRek
    Left = 313
    Top = 182
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 344
    Top = 272
    object N1: TMenuItem
      Caption = #1057#1076#1077#1083#1072#1090#1100' '#1086#1089#1085#1086#1074#1085#1099#1084
      OnClick = N1Click
    end
    object miDelRek: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1077#1082#1074#1080#1079#1080#1090
      OnClick = miDelRekClick
    end
  end
  object tblRek: TRxMemoryData
    FieldDefs = <>
    AfterInsert = tblRekAfterInsert
    Left = 365
    Top = 181
    object tblRekRach_chet: TStringField
      FieldName = 'Rach_chet'
    end
    object tblRekFace_chet: TStringField
      FieldName = 'Face_chet'
    end
    object tblRekCheck_book: TStringField
      FieldName = 'Check_book'
    end
    object tblRekMFO: TStringField
      FieldName = 'MFO'
    end
    object tblRekID: TFloatField
      FieldName = 'ID'
    end
    object tblRekINST: TFloatField
      FieldName = 'INST'
    end
    object tblRekBank_Inst: TFloatField
      FieldName = 'Bank_Inst'
    end
    object tblRekId_Bank: TFloatField
      FieldName = 'Id_Bank'
    end
    object tblRekDef: TStringField
      CustomConstraint = 'def in ('#39#39','#39' '#39','#39'*'#39') or def is null'
      FieldName = 'Def'
      Size = 1
    end
    object tblRekSTATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object tblRekRACH_CHET_NDS: TStringField
      FieldName = 'RACH_CHET_NDS'
    end
  end
  object qExt: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select oo.id,'
      '       oo.inst,'
      '       oo.name,'
      '       oo.id_num,'
      '       oo.nal_num,'
      '       oo.svid_num,'
      '       oo.addr,'
      '       odet.real_address,'
      '       oo.date_begin as start_date,'
      '       oo.phone,'
      '       oo.e_mail,'
      '       oo.boss,'
      '       oo.boss_post_rus,'
      '       oo.boss_post_ukr,'
      '       oo.boss_tel_h,'
      '       oo.boss_tel_w,'
      '       oo.gbuh,'
      '       oo.gbuh_tel_h,'
      '       oo.gbuh_tel_w,'
      '       oo.par,'
      '       oo.par_inst,'
      '       oo.face,'
      '       oo.num,'
      '       oo.org_type as org_id,'
      '       ot.name as org_type,'
      '       nvl(odet.shortname,'#39'---'#39') as shortname,'
      '       anketa,'
      '       dogovor,'
      '       rek.id as rek_id,'
      '       rek.inst as rek_inst,'
      '       rek.rach_chet,'
      '       b.mfo,'
      '       b.name as bank_name,'
      '       rek.def,'
      '       bl.black_here,'
      '       bl.black_there,'
      '       nvl(bl.co, 0) as black_list_count,'
      '       nvl(odet.svoy, '#39'N'#39') as svoy,'
      '       odet.id as org_det_id,'
      '       bl.date_mod as bl_date_mod,'
      '       odet.full_name,'
      '       odet2.id as det2_id,'
      '       odet2.fake_id_num,'
      '       nvl(odet2.deb_days_allowed, 0) as deb_days_allowed,'
      '       nvl(odet2.deb_summa_allowed, 0) as deb_summa_allowed,'
      '       odet.rn_through,'
      '       odet2.akt_sverki,'
      '       oo.name_ukr,'
      '       oo.addr_ukr,'
      '       oo.dogovor_ukr,'
      '       odet.full_name_ukr,'
      '       odet.real_address_ukr,'
      '       odet.rn_through_ukr,'
      '       odet2.akt_sverki_ukr,'
      '       odet.mail,'
      '       odet.pass,'
      '       odet.icq,'
      '       odet.website,'
      '       oo.person,'
      '       oo.person_tel_h'
      '  from v_org oo,'
      '       oil_org_rekvizit rek,'
      '       oil_bank b,'
      '       (select bl.okpo,'
      
        '               max(decode(bl.inst, oi.main_inst, '#39'Y'#39', '#39'N'#39')) as b' +
        'lack_here,'
      
        '               max(decode(bl.inst, oi.main_inst, '#39'N'#39', '#39'Y'#39')) as b' +
        'lack_there,'
      '               max(date_mod) as date_mod,'
      '               count(*) as co'
      '          from oil_black_list bl, v_oil_info oi'
      '         where bl.state = '#39'Y'#39
      '         group by bl.okpo) bl,'
      '       oil_org_det odet,'
      '       oil_org_det2 odet2,'
      '       oil_org_type ot'
      ' where oo.org_type = ot.id'
      '   and rek.id_org(+) = oo.id'
      '   and rek.inst(+) = oo.inst'
      '   and rek.state(+) = '#39'Y'#39
      '   and rek.id_bank = b.id(+)'
      '   and rek.bank_inst = b.inst(+)'
      '   and bl.okpo(+) = oo.id_num'
      '   and odet.org_id(+) = oo.id'
      '   and odet.inst(+) = oo.inst'
      '   and odet.state(+) = '#39'Y'#39
      '   and oo.id = :id'
      '   and oo.inst = :inst'
      '   and odet2.org_id(+) = oo.id'
      '   and odet2.org_inst(+) = oo.inst'
      '   and odet2.state(+) = '#39'Y'#39
      ' order by def desc')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 440
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
