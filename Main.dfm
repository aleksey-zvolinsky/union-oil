inherited MainForm: TMainForm
  Left = 380
  Top = 147
  Width = 898
  Height = 605
  Caption = 'OIL'
  Color = clBtnShadow
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = True
  WindowMenu = miWindows
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imRezPark: TImage
    Left = 40
    Top = 56
    Width = 150
    Height = 150
    Center = True
    Proportional = True
    Visible = False
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 525
    Width = 890
    Height = 26
    Panels = <>
    SimplePanel = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 890
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 827
      Top = 0
      Width = 63
      Height = 53
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 63
        Height = 53
        Align = alClient
        BorderWidth = 2
        ButtonHeight = 41
        ButtonWidth = 42
        Caption = 'ToolBar1'
        Color = clBtnFace
        EdgeBorders = [ebTop, ebBottom]
        Flat = True
        HotImages = HotImage
        Images = Image
        Indent = 5
        ParentColor = False
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 5
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton5: TToolButton
          Left = 13
          Top = 0
          Hint = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1088#1072#1073#1086#1090#1091' '#1089' '#1087#1088#1086#1075#1088#1072#1084#1084#1086#1081
          AllowAllUp = True
          Caption = 'ToolButton5'
          ImageIndex = 14
          ParentShowHint = False
          ShowHint = True
          OnClick = miExitClick
        end
      end
    end
    object ToolBar2: TToolBar
      Left = 0
      Top = 0
      Width = 827
      Height = 53
      Align = alClient
      BorderWidth = 2
      ButtonHeight = 41
      ButtonWidth = 42
      Caption = 'ToolBar1'
      Color = clBtnFace
      EdgeBorders = [ebTop, ebBottom]
      Flat = True
      HotImages = HotImage
      Images = Image
      Indent = 5
      ParentColor = False
      TabOrder = 1
      object bPrih: TToolButton
        Left = 5
        Top = 0
        Hint = #1055#1088#1080#1093#1086#1076' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
        AllowAllUp = True
        Caption = 'ToolButton5'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = miPrihRefClick
      end
      object bRash: TToolButton
        Left = 47
        Top = 0
        Hint = #1054#1090#1087#1091#1089#1082' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
        Caption = 'bRash'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = miRashRefClick
      end
      object ToolButton2: TToolButton
        Left = 89
        Top = 0
        Hint = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1085#1099#1081' '#1087#1072#1088#1082
        Caption = 'ToolButton2'
        ImageIndex = 23
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton2Click
      end
      object ToolButton4: TToolButton
        Left = 131
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object bPartRef: TToolButton
        Left = 139
        Top = 0
        Hint = #1055#1072#1088#1090#1080#1080' '#1053#1055
        Caption = 'bPartRef'
        ImageIndex = 11
        ParentShowHint = False
        ShowHint = True
        OnClick = miPartRefClick
      end
      object ToolButton9: TToolButton
        Left = 181
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbSminRep: TToolButton
        Left = 189
        Top = 0
        Hint = #1040#1088#1093#1080#1074' '#1089#1084#1077#1085#1085#1099#1093' '#1086#1090#1095#1077#1090#1086#1074' '#1089' '#1040#1047#1057
        Caption = 'tbSminRep'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = tbSminRepClick
      end
      object bMoney: TToolButton
        Left = 231
        Top = 0
        Hint = #1059#1095#1077#1090' '#1087#1088#1086#1080#1079#1074#1077#1076#1077#1085#1085#1099#1093' '#1086#1087#1083#1072#1090
        Caption = 'bMoney'
        ImageIndex = 15
        ParentShowHint = False
        ShowHint = True
        OnClick = bMoneyClick
      end
      object bSaleBook: TToolButton
        Left = 273
        Top = 0
        Hint = #1050#1085#1080#1075#1072' '#1091#1095#1077#1090#1072' '#1087#1088#1086#1076#1072#1078
        Caption = 'bSaleBook'
        ImageIndex = 18
        ParentShowHint = False
        ShowHint = True
        OnClick = bSaleBookClick
      end
      object bService: TToolButton
        Left = 315
        Top = 0
        Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1091#1089#1083#1091#1075
        Caption = 'bService'
        ImageIndex = 21
        ParentShowHint = False
        ShowHint = True
        OnClick = bServiceClick
      end
      object ToolButton6: TToolButton
        Left = 357
        Top = 0
        Hint = #1054#1087#1077#1088#1072#1094#1080#1080' '#1089' '#1090#1072#1083#1086#1085#1072#1084#1080' - ['#1055#1088#1080#1093#1086#1076']'
        Caption = 'ToolButton1'
        DropdownMenu = pmTalon
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = ToolButton6Click
      end
      object ToolButton3: TToolButton
        Left = 412
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 420
        Top = 0
        Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080' - ['#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080']'
        Caption = 'ToolButton2'
        DropdownMenu = pmRef
        Grouped = True
        ImageIndex = 12
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = ToolButton7Click
      end
      object ToolButton8: TToolButton
        Left = 475
        Top = 0
        Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1090#1091#1082#1090#1091#1088#1099' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
        Caption = 'ToolButton8'
        ImageIndex = 13
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton8Click
      end
      object ToolButton11: TToolButton
        Left = 517
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 14
        Style = tbsSeparator
      end
      object bExchPart: TToolButton
        Left = 525
        Top = 0
        Hint = #1047#1072#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1090#1080#1102
        Caption = 'bExchPart'
        DropdownMenu = pmExch
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = miExchPartClick
      end
      object ToolButton14: TToolButton
        Left = 580
        Top = 0
        Width = 8
        Caption = 'ToolButton14'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object bSQL: TToolButton
        Left = 588
        Top = 0
        Caption = 'bSQL'
        ImageIndex = 17
        Visible = False
        OnClick = bSQLClick
      end
      object bRezPartLeft: TToolButton
        Left = 630
        Top = 0
        Hint = #1054#1089#1090#1072#1090#1082#1080' '#1087#1072#1088#1090#1080#1081' '#1074' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072#1093
        Caption = 'bRezPartLeft'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
    end
  end
  object pmTalon: TPopupMenu
    Left = 192
    Top = 64
    object N110: TMenuItem
      Caption = #1055#1088#1080#1093#1086#1076' '#1090#1072#1083#1086#1085#1086#1074
      Checked = True
      RadioItem = True
      OnClick = N110Click
    end
    object N21: TMenuItem
      Caption = #1055#1077#1088#1077#1086#1094#1077#1085#1082#1072' '#1090#1072#1083#1086#1085#1086#1074
      RadioItem = True
      Visible = False
    end
    object N31: TMenuItem
      Caption = #1054#1090#1087#1091#1089#1082' '#1090#1072#1083#1086#1085#1086#1074
      RadioItem = True
      OnClick = N31Click
    end
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    OnChange = MainMenu1Change
    Left = 80
    Top = 176
    object miFile: TMenuItem
      Tag = 11
      Caption = '&'#1060#1072#1081#1083
      object mi1C: TMenuItem
        Tag = 11
        Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' 1'#1057
        OnClick = mi1CClick
      end
      object N119: TMenuItem
        Tag = 11
        Caption = #1048#1084#1087#1086#1088#1090' '#1076#1077#1073#1077#1090#1086#1088#1082#1080' '#1080#1079' 1'#1057
        OnClick = N119Click
      end
      object miOs: TMenuItem
        Tag = 11
        Caption = #1048#1084#1087#1086#1088#1090' '#1086#1089#1085#1086#1074#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074' '#1080#1079' 1'#1057
        OnClick = miOsClick
      end
      object miBalImp: TMenuItem
        Tag = 11
        Caption = #1048#1084#1087#1086#1088#1090' '#1073#1072#1083#1072#1085#1089#1072' '#1080#1079' 1'#1057
        OnClick = miBalImpClick
      end
      object miImportCashTan: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090' '#1080#1079' CashTan'
        OnClick = miImportCashTanClick
      end
      object N30: TMenuItem
        Caption = '-'
      end
      object miImpCreditCard: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103' '#1073#1072#1085#1082#1086#1074#1089#1082#1080#1093' '#1082#1072#1088#1090' '#1085#1072' '#1040#1047#1057
        OnClick = miImpCreditCardClick
      end
      object N32: TMenuItem
        Caption = '-'
      end
      object miSQL: TMenuItem
        Tag = 11
        Caption = #1042'&'#1099#1087#1086#1083#1085#1080#1090#1100' SQL...'
        ShortCut = 32849
        OnClick = miSQLClick
      end
      object N19: TMenuItem
        Caption = '-'
      end
      object miFullScreen: TMenuItem
        Tag = 11
        Caption = #1055#1086#1083#1085#1086#1101#1082#1088#1072#1085#1085#1099#1081' '#1088#1077#1078#1080#1084
        ShortCut = 123
        OnClick = miFullScreenClick
      end
      object N133: TMenuItem
        Caption = '-'
      end
      object miPrintSetup: TMenuItem
        Tag = 11
        Caption = '&'#1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1080#1085#1090#1077#1088#1072'...'
        OnClick = miPrintSetupClick
      end
      object N24: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Tag = 11
        Caption = '&'#1042#1099#1093#1086#1076
        OnClick = miExitClick
      end
    end
    object miUchet: TMenuItem
      Tag = 11
      Caption = '&'#1059#1095#1077#1090
      object miPrihRef: TMenuItem
        Tag = 11
        Caption = '&'#1055#1088#1080#1093#1086#1076' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
        ShortCut = 32848
        OnClick = miPrihRefClick
      end
      object miRashRef: TMenuItem
        Tag = 11
        Caption = '&'#1054#1090#1087#1091#1089#1082' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
        ShortCut = 32850
        OnClick = miRashRefClick
      end
      object miSminRep: TMenuItem
        Tag = 11
        Caption = '&'#1057#1084#1077#1085#1085#1099#1081' '#1086#1090#1095#1077#1090
        ShortCut = 32833
        OnClick = tbSminRepClick
      end
      object miService: TMenuItem
        Tag = 11
        Caption = '&'#1059#1089#1083#1091#1075#1080
        ShortCut = 32853
        OnClick = bServiceClick
      end
      object miMoney: TMenuItem
        Tag = 1
        Caption = #1054#1087'&'#1083#1072#1090#1072
        ShortCut = 32845
        OnClick = bMoneyClick
      end
      object N111: TMenuItem
        Tag = 1
        Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077' '#1088#1072#1089'&'#1093#1086#1076#1099
        OnClick = N111Click
      end
      object miNpPriceRef: TMenuItem
        Caption = #1062'&'#1077#1085#1099' '#1085#1072' '#1089#1086#1087#1091#1090#1089#1090#1074#1091#1102#1097#1080#1081' '#1090#1086#1074#1072#1088
        OnClick = miNpPriceRefClick
      end
      object miAzsNpPriceRef: TMenuItem
        Caption = '&'#1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1094#1077#1085' '#1085#1072' '#1040#1047#1057
        OnClick = miAzsNpPriceRefClick
      end
      object miKonkPrice: TMenuItem
        Tag = 1
        Caption = '&'#1062#1077#1085#1099' '#1082#1086#1085#1082#1091#1088#1077#1085#1090#1086#1074
        OnClick = miKonkPriceClick
      end
      object N36: TMenuItem
        Caption = '-'
      end
      object miSaleBook: TMenuItem
        Tag = 1
        Caption = #1050#1085#1080#1075#1072' '#1091#1095#1077#1090#1072' '#1087#1088#1086#1076#1072'&'#1078
        OnClick = MenuItem1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object miAddTalon: TMenuItem
        Tag = 1
        Caption = #1054'&'#1090#1087#1091#1089#1082' '#1090#1072#1083#1086#1085#1086#1074
        ShortCut = 32852
        OnClick = N31Click
      end
      object miPrihTalon: TMenuItem
        Tag = 1
        Caption = #1055'&'#1088#1080#1093#1086#1076' '#1090#1072#1083#1086#1085#1086#1074
        ShortCut = 32857
        OnClick = N110Click
      end
      object nRefreshTalonAE: TMenuItem
        Caption = #1055#1077#1088#1077#1089#1095#1105#1090' '#1090#1072#1083#1086#1085#1086#1074' '#1087#1086' '#1084#1077#1078#1092#1080#1083#1080#1072#1083#1100#1085#1099#1084' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103#1084
        OnClick = nRefreshTalonAEClick
      end
      object N86: TMenuItem
        Caption = '-'
      end
      object N96: TMenuItem
        Tag = 1
        Caption = #1055'&'#1091#1090#1077#1074#1099#1077' '#1083#1080#1089#1090#1099' ('#1072#1082#1090#1099' '#1085#1072' '#1089#1087#1080#1089#1072#1085#1080#1077')'
        OnClick = N96Click
      end
      object N15: TMenuItem
        Tag = 1
        Caption = '&'#1047#1072#1087#1088#1072#1074#1082#1080' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1072#1084'/'#1090#1072#1083#1086#1085#1072#1084' '#1085#1072' '#1085#1077#1092#1090#1077#1073#1072#1079#1077
        OnClick = N15Click
      end
      object N97: TMenuItem
        Tag = 1
        Caption = #1047#1072#1087#1088#1072#1074#1082#1080' '#1085#1072' '#1089#1090#1086#1088#1086#1085#1085#1080#1093' '#1040#1047#1057' ('#1053#1041')'
        OnClick = N97Click
      end
      object miSep3: TMenuItem
        Caption = '-'
      end
      object miPartRef: TMenuItem
        Tag = 1
        Caption = #1055'&'#1072#1088#1090#1080#1080' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
        ShortCut = 32858
        OnClick = miPartRefClick
      end
      object miKP_Dog: TMenuItem
        Tag = 1
        Caption = #1044#1086'&'#1075#1086#1074#1086#1088#1072' '#1082#1091#1087#1083#1080'-'#1087#1088#1086#1076#1072#1078#1080
        ShortCut = 32836
        OnClick = miKP_DogClick
      end
      object miSep2: TMenuItem
        Caption = '-'
      end
      object miExchPart: TMenuItem
        Tag = 1
        Caption = #1055#1086'&'#1084#1077#1085#1103#1090#1100' '#1087#1072#1088#1090#1080#1080
        ShortCut = 32835
        OnClick = miExchPartClick
      end
      object miPerevalka: TMenuItem
        Caption = #1055#1077#1088#1077#1074#1072#1083#1082#1072
      end
      object miSep1: TMenuItem
        Caption = '-'
      end
      object miMeteringRef: TMenuItem
        Caption = #1047#1072#1084#1077#1088#1099' (Base)'
        OnClick = miMeteringRefClick
      end
      object BaseDocsRef: TMenuItem
        Caption = #1044#1074#1080#1078#1077#1085#1080#1077' (Base)'
        OnClick = BaseDocsRefClick
      end
      object BaseTovarOperRef: TMenuItem
        Caption = #1058#1086#1074#1072#1088#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080' (Base)'
        OnClick = BaseTovarOperRefClick
      end
      object misep4: TMenuItem
        Caption = '-'
      end
      object miRezMeasureRef: TMenuItem
        Caption = #1047#1072#1084#1077#1088#1099
        OnClick = miRezMeasureRefClick
      end
      object miTubes: TMenuItem
        Caption = #1058#1088#1091#1073#1099
        OnClick = miTubesClick
      end
      object miRepDeficit: TMenuItem
        Caption = #1053#1077#1076#1086#1089#1090#1072#1095#1080
        OnClick = miRepDeficitClick
      end
      object miRezRashBase: TMenuItem
        Caption = #1054#1090#1075#1088#1091#1079#1082#1072' Base'
        OnClick = miRezRashBaseClick
      end
      object miRezPrihBase: TMenuItem
        Caption = #1055#1088#1080#1093#1086#1076' Base'
        OnClick = miRezPrihBaseClick
      end
    end
    object N134: TMenuItem
      Tag = 1
      Caption = #1057'&'#1084#1072#1088#1090'-'#1082#1072#1088#1090#1099
      object N87: TMenuItem
        Tag = 1
        Caption = '&'#1044#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1101#1083'. '#1082#1072#1088#1090#1086#1095#1082#1072#1084' '
        ShortCut = 32851
        OnClick = N87Click
      end
      object miTransMoveInst: TMenuItem
        Tag = 1
        Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1087#1086' '#1089#1084#1072#1088#1090'-'#1082#1072#1088#1090#1072#1084
        ShortCut = 32855
        OnClick = miTransMoveInstClick
      end
      object miLSNN: TMenuItem
        Tag = 1
        Caption = '&'#1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1053#1053' '#1076#1083#1103' '#1082#1083#1080#1077#1085#1090#1086#1074' '#1087#1086' '#1083#1080#1084#1080#1090#1085#1086#1081' '#1089#1093#1077#1084#1077
        ShortCut = 32844
        OnClick = miLSNNClick
      end
      object N130: TMenuItem
        Caption = #1055#1048#1053'-'#1082#1086#1085#1074#1077#1088#1090#1099' '#1076#1083#1103' '#1089#1084#1072#1088#1090'-'#1082#1072#1088#1090
        OnClick = N130Click
      end
      object N137: TMenuItem
        Caption = '-'
      end
      object N114: TMenuItem
        Tag = 1
        Caption = '&'#1042#1085#1077#1089#1077#1085#1080#1077' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1087#1086' '#1095#1091#1078#1080#1084' '#1101#1084#1080#1090#1077#1085#1090#1072#1084
        OnClick = N114Click
      end
      object N115: TMenuItem
        Tag = 1
        Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1087#1086' &'#1095#1091#1078#1080#1084' '#1089#1087#1080#1089#1072#1085#1080#1103#1084
        ShortCut = 32856
        OnClick = N115Click
      end
      object miLSSeparator: TMenuItem
        Caption = '-'
      end
      object miThirdPartyTranz: TMenuItem
        Tag = 1
        Caption = '&'#1058#1088#1072#1085#1079#1072#1082#1094#1080#1080' '#1089#1090#1086#1088#1086#1085#1085#1080#1093' '#1101#1084#1080#1090#1077#1085#1090#1086#1074
        OnClick = miThirdPartyTranzClick
      end
      object miMoneyOut: TMenuItem
        Tag = 1
        Caption = '&'#1048#1089#1093#1086#1076#1103#1097#1080#1077' '#1086#1087#1083#1072#1090#1099
        OnClick = miMoneyOutClick
      end
      object miDiscount: TMenuItem
        Tag = 1
        Caption = '&'#1057#1082#1080#1076#1082#1080
        OnClick = miDiscountClick
      end
      object N136: TMenuItem
        Caption = '-'
      end
      object G1: TMenuItem
        Tag = 1
        Caption = '&'#1055#1077#1088#1077#1089#1095#1077#1090' '#1101#1083'.'#1082#1072#1088#1090#1086#1095#1077#1082
        OnClick = G1Click
      end
      object miCountBetweenFilCard: TMenuItem
        Caption = #1055#1077#1088#1077#1089#1095#1077#1090' '#1087#1086' '#1084#1077#1078#1092#1080#1083#1080#1072#1083#1100#1085#1099#1084' '#1095#1091#1078#1080#1084' '#1089#1087#1080#1089#1072#1085#1080#1103#1084
        OnClick = miCountBetweenFilCardClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
    end
    object miInventar: TMenuItem
      Tag = 1
      Caption = '&'#1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103
      object N66: TMenuItem
        Tag = 1
        Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1080#1077' '#1086#1089#1090#1072#1090#1082#1080' '#1087#1088#1086#1076#1091#1082#1090#1086#1074' '#1074' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072#1093
        OnClick = N66Click
      end
      object N67: TMenuItem
        Tag = 1
        Caption = #1054#1089#1090#1072#1090#1082#1080' '#1053#1055' '#1074' '#1090#1077#1093#1085#1080#1095#1077#1089#1082#1080#1093' '#1085#1077#1092#1090#1077#1087#1088#1086#1074#1086#1076#1072#1093
        OnClick = N67Click
      end
      object N68: TMenuItem
        Tag = 1
        Caption = #1056#1072#1089#1095#1077#1090' '#1077#1089#1090#1077#1089#1090#1074#1077#1085#1085#1086#1081' '#1091#1073#1099#1083#1080
        OnClick = N68Click
      end
    end
    object miRef: TMenuItem
      Tag = 1
      Caption = '&'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object miOrgRef: TMenuItem
        Tag = 1
        Caption = #1054'&'#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        ShortCut = 32847
        OnClick = N3Click
      end
      object N91: TMenuItem
        Tag = 1
        Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088#1099
        OnClick = N91Click
      end
      object miAutoRef: TMenuItem
        Tag = 1
        Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1080' '#1080' '#1090#1077#1093'. '#1089#1088#1077#1076#1089#1090#1074#1072
        OnClick = miAutoRefClick
      end
      object miEmpRef: TMenuItem
        Tag = 1
        Caption = #1057'&'#1086#1090#1088#1091#1076#1085#1080#1082#1080
        OnClick = miEmpRefClick
      end
      object miBankRef: TMenuItem
        Tag = 1
        Caption = '&'#1041#1072#1085#1082
        OnClick = miBankRefClick
      end
      object N69: TMenuItem
        Tag = 1
        Caption = #1058#1077#1093#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1090#1088#1091#1073#1086#1087#1088#1086#1074#1086#1076#1099
        OnClick = N69Click
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object N18: TMenuItem
        Tag = 1
        Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
        OnClick = ToolButton8Click
      end
      object miOSRef: TMenuItem
        Tag = 1
        Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1089#1088#1077#1076#1089#1090#1074#1072
        OnClick = miOSRefClick
      end
      object miAzsDevice: TMenuItem
        Tag = 1
        Caption = #1059#1089#1090#1088#1086#1081#1089#1090#1074#1072' '#1085#1072' '#1040#1047#1057
        OnClick = miAzsDeviceClick
      end
    end
    object miCommon: TMenuItem
      Tag = 11
      Caption = #1054'&'#1073#1097#1080#1077
      object miNPTypeRef: TMenuItem
        Caption = #1058#1080#1087#1099' &'#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
        ShortCut = 32846
        OnClick = miNPTypeRefClick
      end
      object miOperType: TMenuItem
        Caption = #1058#1080#1087#1099' '#1086'&'#1087#1077#1088#1072#1094#1080#1081
        OnClick = miOperTypeClick
      end
      object N70: TMenuItem
        Caption = #1058#1080#1087#1099' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1086#1074
        OnClick = N70Click
      end
      object miDiscountType: TMenuItem
        Caption = #1058#1080#1087#1099' '#1089#1082#1080#1076#1086#1082
        OnClick = miDiscountTypeClick
      end
    end
    object miReports: TMenuItem
      Caption = #1054'&'#1090#1095#1077#1090#1099
      object N25: TMenuItem
        Caption = #1054#1090#1095#1077#1090#1099' '#1087#1086' '#1053#1077#1092#1090#1077#1073#1072#1079#1077
        object miRepKomNB: TMenuItem
          Caption = '&'#1050#1086#1084#1080#1089#1089#1080#1086#1085#1077#1088#1072' '#1087#1086' '#1088#1077#1072#1083'. '#1089' '#1053#1041
          OnClick = miRepKomNBClick
        end
        object miPertReezRep: TMenuItem
          Caption = '&'#1054#1089#1090#1072#1090#1082#1080' '#1087#1072#1088#1090#1080#1081' '#1074' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072#1093
          OnClick = miPertReezRepClick
        end
        object miUd_WeigRep: TMenuItem
          Caption = '&'#1057#1088#1077#1076#1085#1080#1081' '#1091#1076#1077#1083#1100#1085#1099#1081' '#1074#1077#1089
          OnClick = miUd_WeigRepClick
        end
        object miMoveNBRep: TMenuItem
          Caption = '&'#1042#1085#1091#1090#1088#1077#1085#1085#1077#1077' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077' '#1082#1086#1084'. '#1090#1086#1074#1072#1088#1072
          Visible = False
          OnClick = miMoveNBRepClick
        end
        object N47: TMenuItem
          Caption = #1044#1085#1077#1074#1085#1086#1081' '#1086#1090#1095#1077#1090' '#1087#1086' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
          Visible = False
          OnClick = N47Click
        end
        object N2: TMenuItem
          Caption = #1055#1077#1088#1077#1073#1088#1086#1089#1082#1072' '#1089' '#1082#1072#1088#1090#1086#1095#1082#1080' '#1085#1072' '#1082#1072#1088#1090#1086#1095#1082#1091
          OnClick = N2Click
        end
      end
      object N26: TMenuItem
        Caption = #1054#1090#1095#1077#1090#1099' '#1087#1086' '#1040#1047#1057
        object miRezAZSRep: TMenuItem
          Caption = '&'#1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1089' '#1040#1047#1057
          OnClick = miRezAZSRepClick
        end
        object N64: TMenuItem
          Caption = #1048#1085#1082#1072#1089#1089#1072#1094#1080#1103' '#1089' '#1040#1047#1057
          OnClick = N64Click
        end
      end
      object N28: TMenuItem
        Caption = #1054#1090#1095#1077#1090#1099' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084
        object miTalonPotrReport: TMenuItem
          Caption = '&'#1055#1086' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1103#1084
          OnClick = miTalonPotrReportClick
        end
        object N41: TMenuItem
          Caption = '&'#1057#1074#1086#1076#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
          OnClick = N41Click
        end
        object N63: TMenuItem
          Caption = #1044#1077#1083#1100#1090#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
          OnClick = N63Click
        end
        object N50: TMenuItem
          Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1053#1055' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1072#1084
          OnClick = N50Click
        end
        object N120: TMenuItem
          Caption = #1057#1074#1086#1076#1085#1099#1081' '#1087#1086' '#1076#1074#1080#1078#1077#1085#1080#1102' '#1090#1072#1083#1086#1085#1086#1074
          OnClick = N120Click
        end
      end
      object N98: TMenuItem
        Caption = #1054#1090#1095#1077#1090#1099' '#1087#1086' '#1101#1083'. '#1082#1072#1088#1090#1086#1095#1082#1072#1084
        object N99: TMenuItem
          Caption = '&'#1055#1086' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1103#1084
          OnClick = N99Click
        end
        object N1: TMenuItem
          Caption = #1044#1077#1083#1100#1090#1072' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
          OnClick = N1Click
        end
      end
      object miMoveRep: TMenuItem
        Caption = '&'#1044#1074#1080#1078#1077#1085#1080#1077' '#1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
        object N35: TMenuItem
          Caption = #1050#1086#1084#1080#1089#1089#1080#1103' '#1053#1041
          Visible = False
          OnClick = N35Click
        end
        object N37: TMenuItem
          Caption = #1057#1090#1072#1088#1072#1103' '#1089#1074#1086#1076#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1040#1047#1057
          Visible = False
          OnClick = N37Click
        end
        object N51: TMenuItem
          Caption = #1057#1074#1086#1076#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1040#1047#1057
          OnClick = N51Click
        end
        object N38: TMenuItem
          Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1082#1086#1084#1080#1089#1089#1080#1080
          Visible = False
          OnClick = N38Click
        end
        object N42: TMenuItem
          Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1082#1086#1084'. '#1089#1091#1084#1084'. '#1075#1088#1085'.'
          Visible = False
          OnClick = N42Click
        end
        object N58: TMenuItem
          Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1053#1055' '#1087#1086' '#1073#1072#1088#1090#1077#1088#1091
          Visible = False
          OnClick = N58Click
        end
        object N60: TMenuItem
          Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1099#1081' '#1053#1041'+'#1040#1047#1057
          OnClick = N60Click
        end
        object Ngksu_opt: TMenuItem
          Caption = #1054#1090#1095#1105#1090' '#1076#1083#1103' '#1043#1050#1057#1059' - '#1086#1087#1090
          OnClick = Ngksu_optClick
        end
      end
      object N71: TMenuItem
        Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103
        object N72: TMenuItem
          Caption = #1046#1091#1088#1085#1072#1083' '#1086#1087#1077#1088#1072#1090#1080#1074#1085#1086#1075#1086' '#1082#1086#1085#1090#1088#1086#1083#1103
          OnClick = N72Click
        end
        object N73: TMenuItem
          Caption = #1053#1072#1083#1080#1095#1080#1077' '#1053#1055' '#1074' '#1090#1088#1091#1073#1086#1087#1088#1086#1074#1086#1076#1072#1093
          OnClick = N72Click
        end
        object N74: TMenuItem
          Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1086#1085#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
          OnClick = N72Click
        end
        object N75: TMenuItem
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1077#1089#1090#1077#1089#1090#1074#1077#1085#1085#1086#1081' '#1091#1073#1099#1083#1080
          OnClick = N72Click
        end
        object N76: TMenuItem
          Caption = #1057#1083#1080#1095#1080#1090#1077#1083#1100#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
          OnClick = N72Click
        end
      end
      object N92: TMenuItem
        Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1090#1086#1087#1083#1080#1074#1072' '#1074' '#1073#1072#1082#1072#1093' '#1058#1057
        object N93: TMenuItem
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1079#1072#1087#1088#1072#1074#1082#1080' '#1058#1057
          OnClick = N93Click
        end
        object N94: TMenuItem
          Caption = #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1043#1057#1052
          OnClick = N94Click
        end
        object N210: TMenuItem
          Caption = #1056#1072#1089#1093#1086#1076' '#1043#1057#1052' '#1085#1072' '#1088#1072#1073#1086#1090#1091' '#1058#1057' '#1075#1088#1091#1087#1087#1099' '#8470'2'
          OnClick = N210Click
        end
        object N112: TMenuItem
          Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1091#1095#1105#1090#1072' '#1088#1072#1073#1086#1090#1099' '#1058#1057' '#1075#1088#1091#1087#1087#1099' '#8470'1'
          OnClick = N112Click
        end
        object N211: TMenuItem
          Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1091#1095#1105#1090#1072' '#1088#1072#1073#1086#1090#1099' '#1058#1057' '#1075#1088#1091#1087#1087#1099' '#8470'2'
          OnClick = N211Click
        end
        object N310: TMenuItem
          Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1091#1095#1105#1090#1072' '#1088#1072#1073#1086#1090#1099' '#1058#1057' '#1075#1088#1091#1087#1087#1099' '#8470'3'
          OnClick = N310Click
        end
        object N311: TMenuItem
          Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1091#1095#1105#1090#1072' '#1088#1072#1073#1086#1090#1099' '#1058#1057' '#1075#1088#1091#1087#1087#1099' '#8470'4'
          OnClick = N311Click
        end
        object N56: TMenuItem
          Caption = '-'
        end
        object N55: TMenuItem
          Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1090#1086#1087#1083#1080#1074#1072' '#1074' '#1073#1072#1082#1072#1093' '#1058#1057' '#1085#1072' '#1085#1077#1092#1090#1077#1073#1072#1079#1077
          OnClick = N55Click
        end
      end
      object N22: TMenuItem
        Caption = '-'
      end
      object miDebKred: TMenuItem
        Caption = #1044#1077#1073#1077#1090' '#1080' '#1050#1088#1077#1076#1080#1090
        object miDeb: TMenuItem
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1077#1073#1077#1090#1086#1088#1086#1074' '#1080' '#1082#1088#1077#1076#1080#1090#1086#1088#1086#1074
          OnClick = miDebClick
        end
        object miDebitors: TMenuItem
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1077#1073#1077#1090#1086#1088#1086#1074
          OnClick = miDebitorsClick
        end
        object miKreditors: TMenuItem
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1082#1088#1077#1076#1080#1090#1086#1088#1086#1074
          OnClick = miKreditorsClick
        end
        object N85: TMenuItem
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1077#1073#1077#1090#1086#1088#1086#1074' '#1080' '#1082#1088#1077#1076#1080#1090#1086#1088#1086#1074' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084
          OnClick = N85Click
        end
        object N88: TMenuItem
          Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1077#1073#1077#1090#1086#1088#1086#1074
          OnClick = N88Click
        end
        object miAktSverki: TMenuItem
          Caption = #1040#1082#1090' '#1057#1074#1077#1088#1082#1080
          OnClick = miAktSverkiClick
        end
        object N33: TMenuItem
          Caption = #1050'&'#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072
          OnClick = N33Click
        end
      end
      object miTaxBillReports: TMenuItem
        Caption = #1053#1072#1083#1086#1075#1086#1074#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
        object N34: TMenuItem
          Caption = #1050#1085#1080#1075#1072' '#1091#1095#1077#1090#1072' '#1087#1088#1086#1076#1072#1078
          OnClick = N34Click
        end
      end
      object miRestOAO: TMenuItem
        Caption = #1054#1089#1090#1072#1090#1082#1080' '#1054#1040#1054
        OnClick = miRestOAOClick
      end
      object N49: TMenuItem
        Caption = #1047#1072#1087#1088#1072#1074#1082#1072' '#1089#1086#1073'. '#1072#1074#1090#1086#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
        OnClick = N49Click
      end
      object N48: TMenuItem
        Caption = #1054#1090#1095#1077#1090#1099' '#1087#1086' '#1086#1090#1087#1091#1089#1082#1091' ('#1053#1041'+'#1040#1047#1057')'
        OnClick = N48Click
      end
      object miAvias: TMenuItem
        Caption = #1054#1090#1095#1077#1090#1099' '#1076#1083#1103' '#1040#1074#1080#1072#1089#1072
        object miSvodFilAZS: TMenuItem
          Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1040#1047#1057
          OnClick = miSvodFilAZSClick
        end
        object miSvodFilAZSNew: TMenuItem
          Caption = #1054#1087#1077#1088#1072#1090#1080#1074#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1076#1083#1103' '#1040#1074#1080#1072#1089#1072' (4 '#1075#1088#1091#1087#1087#1099')'
          Hint = #1041#1069#1060' '#1085#1072' 4 '#1075#1088#1091#1087#1087#1099' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
          OnClick = miSvodFilAZSNewClick
        end
        object miSvodFilAZS6NPG: TMenuItem
          Caption = #1054#1087#1077#1088#1072#1090#1080#1074#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1076#1083#1103' '#1040#1074#1080#1072#1089#1072' (6 '#1075#1088#1091#1087#1087')'
          Hint = #1041#1069#1060' '#1085#1072' 6 '#1075#1088#1091#1087#1087' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
          OnClick = miSvodFilAZS6NPGClick
        end
        object miBasicElectronFormReport: TMenuItem
          Caption = #1054#1087#1077#1088#1072#1090#1080#1074#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1076#1083#1103' '#1040#1074#1080#1072#1089#1072' ('#1091#1085#1080#1074#1077#1088#1089#1072#1083#1100#1085#1099#1081')'
          Hint = #1041#1069#1060' '#1074' '#1086#1090#1082#1088#1099#1090#1091#1102' '#1101#1082#1089#1077#1083#1100#1085#1091#1102' '#1082#1085#1080#1075#1091
          OnClick = miBasicElectronFormReportClick
        end
      end
    end
    object miSettings: TMenuItem
      Caption = '&'#1053#1072#1089#1090#1088#1086#1081#1082#1080
      object miSystem: TMenuItem
        Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1077' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
        Hint = #1054#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1086#1089#1085#1086#1074#1085#1099#1093' '#1089#1080#1089#1090#1077#1084#1085#1099#1093' '#1091#1089#1090#1072#1085#1086#1074#1086#1082' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        Visible = False
        OnClick = miSystemClick
      end
      object miUsers: TMenuItem
        Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103#1084#1080
        Hint = #1047#1072#1087#1091#1089#1082' '#1089#1080#1089#1090#1077#1084#1099' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081' '#1089#1080#1089#1090#1077#1084#1099
        Visible = False
        OnClick = miUsersClick
      end
      object miOneOilInstance: TMenuItem
        Caption = #1047#1072#1087#1091#1089#1082#1072#1090#1100' '#1085#1072' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1077' '#1090#1086#1083#1100#1082#1086' '#1086#1076#1080#1085' OIL'
        Checked = True
        OnClick = miOneOilInstanceClick
      end
      object miOperNNList: TMenuItem
        Caption = #1042#1099#1073#1086#1088' '#1086#1087#1077#1088#1072#1094#1080#1081' '#1076#1083#1103' '#1085#1072#1083#1086#1075#1086#1074#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
        OnClick = miOperNNListClick
      end
      object N46: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1085#1086#1084#1077#1088#1086#1074
        OnClick = N46Click
      end
      object miClosePeriod: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1080#1077' '#1087#1077#1088#1080#1086#1076#1072
        Visible = False
        OnClick = miClosePeriodClick
      end
      object N109: TMenuItem
        Caption = #1057#1073#1086#1080' '#1074' '#1088#1072#1073#1086#1090#1077' '#1040#1047#1057' '#1076#1083#1103' '#1089#1084#1077#1085#1085#1099#1093' '#1086#1090#1095#1077#1090#1086#1074
        OnClick = N109Click
      end
      object N118: TMenuItem
        Caption = #1057#1073#1086#1080' '#1087#1086' '#1074#1074#1086#1076#1091' '#1094#1077#1085' '#1082#1086#1085#1082#1091#1088#1077#1085#1090#1086#1074' '#1080' '#1055#1077#1090#1088#1086#1083#1091
        OnClick = N118Click
      end
      object N9: TMenuItem
        Caption = #1057#1073#1086#1080' '#1087#1086' '#1094#1080#1089#1090#1077#1088#1085#1072#1084
        OnClick = N9Click
      end
    end
    object miServ: TMenuItem
      Caption = #1057#1077'&'#1088#1074#1080#1089
      object miTestDb: TMenuItem
        Caption = #1055#1088#1086#1074#1077#1088#1082#1080
        OnClick = miTestDbClick
      end
      object N61: TMenuItem
        Caption = #1057#1084#1077#1085#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        OnClick = N61Click
      end
      object N11: TMenuItem
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1080#1089#1090#1077#1084#1077
        OnClick = N11Click
      end
      object N29: TMenuItem
        Caption = #1042#1099#1073#1086#1088' '#1103#1079#1099#1082#1072
        OnClick = N29Click
      end
      object miChangeOrgNameDual: TMenuItem
        Caption = #1055#1086#1076#1084#1077#1085#1080#1090#1100' '#1088#1077#1082#1074#1080#1079#1080#1090#1099
        OnClick = miChangeOrgNameDualClick
      end
      object miChangeAzsParent: TMenuItem
        Caption = #1055#1077#1088#1077#1087#1086#1076#1095#1080#1085#1077#1085#1080#1077' '#1040#1047#1057
        OnClick = miChangeAzsParentClick
      end
    end
    object miFinance: TMenuItem
      Caption = '&'#1060#1080#1085#1072#1085#1089#1099
      object N77: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
        object N103: TMenuItem
          Caption = #1050#1091#1088#1089#1099' '#1074#1072#1083#1102#1090
          OnClick = N103Click
        end
      end
      object N39: TMenuItem
        Caption = '-'
      end
      object N102: TMenuItem
        Caption = #1055#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077
        OnClick = N102Click
      end
      object N40: TMenuItem
        Caption = '-'
      end
      object N81: TMenuItem
        Caption = #1054#1087#1083#1072#1090#1099' '#1080' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
        OnClick = N81Click
      end
      object N43: TMenuItem
        Caption = '-'
      end
      object N82: TMenuItem
        Caption = #1054#1090#1095#1077#1090#1099
      end
      object N84: TMenuItem
        Caption = #1054#1087#1094#1080#1080
        OnClick = N84Click
      end
      object N113: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090
        OnClick = N113Click
      end
    end
    object miComp: TMenuItem
      Caption = '&'#1050#1086#1084#1087#1100#1102#1090#1077#1088#1099
      object N121: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
        object N127: TMenuItem
          Caption = #1054#1087#1077#1088#1072#1094#1080#1086#1085#1085#1099#1077' '#1089#1080#1089#1090#1077#1084#1099
          OnClick = N127Click
        end
        object N128: TMenuItem
          Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1099
          OnClick = N128Click
        end
        object N129: TMenuItem
          Caption = #1048#1085#1090#1077#1088#1092#1077#1081#1089#1099
          OnClick = N129Click
        end
      end
      object N122: TMenuItem
        Caption = '-'
      end
      object N123: TMenuItem
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
        OnClick = N123Click
      end
      object N124: TMenuItem
        Caption = #1050#1086#1084#1087#1100#1102#1090#1077#1088#1099
        OnClick = N124Click
      end
      object N125: TMenuItem
        Caption = #1042#1085#1077#1096#1085#1080#1077' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
        OnClick = N125Click
      end
      object N126: TMenuItem
        Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1086#1074
        OnClick = N126Click
      end
    end
    object miWindows: TMenuItem
      Caption = '&'#1054#1082#1085#1072
      object miCascade: TMenuItem
        Caption = '&'#1050#1072#1089#1082#1072#1076
        OnClick = miCascadeClick
      end
      object N17: TMenuItem
        Caption = '&'#1052#1086#1079#1072#1080#1082#1072
        OnClick = N17Click
      end
      object miArrangeIcons: TMenuItem
        Caption = '&'#1042#1099#1088#1086#1074#1085#1103#1090#1100' '#1080#1082#1086#1085#1082#1080
        OnClick = miArrangeIconsClick
      end
    end
    object N16: TMenuItem
      Caption = '&'#1055#1086#1084#1086#1097#1100
      object miAbout: TMenuItem
        Caption = #1054' &'#1087#1088#1086#1075#1088#1072#1084#1084#1077' ...'
        OnClick = miAboutClick
      end
      object miChangeOrg: TMenuItem
        Caption = #1057#1084#1077#1085#1080#1090#1100' '#1086#1089#1085#1086#1074#1085#1091#1102' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102
        Visible = False
        OnClick = miChangeOrgClick
      end
      object nOilTest: TMenuItem
        Caption = 'OilAutoTest'
        Visible = False
        OnClick = nOilTestClick
      end
      object miParseExcelTest: TMenuItem
        Caption = 'ParseExcelTest'
        OnClick = miParseExcelTestClick
      end
    end
  end
  object About: TAboutBoxBank
    SHeader = #1057#1080#1089#1090#1077#1084#1072' '#1091#1095#1077#1090#1072' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
    CopyRight.Strings = (
      ''
      'Copyright'
      ''
      'by'
      ''
      #1052#1072#1079#1091#1088' '#1040#1085#1076#1088#1077#1081' '#1053#1080#1082#1086#1083#1072#1077#1074#1080#1095
      #1053#1072#1079#1072#1088#1086#1074' '#1053#1080#1082#1086#1083#1072#1081' '#1040#1083#1077#1082#1089#1077#1077#1074#1080#1095
      #1040#1083#1077#1082#1089#1072#1085#1076#1088#1086#1074' '#1044#1084#1080#1090#1088#1080#1081' '#1040#1083#1077#1082#1089#1072#1085#1076#1088#1086#1074#1080#1095
      #1044#1086#1083#1078#1080#1082#1086#1074' '#1070#1088#1080#1081' '#1042#1080#1082#1090#1086#1088#1086#1074#1080#1095
      #1044#1086#1084#1073#1088#1086#1074#1089#1082#1080#1081' '#1040#1083#1077#1082#1089#1077#1081' '#1040#1083#1077#1082#1089#1072#1085#1076#1088#1086#1074#1080#1095
      #1051#1077#1089#1077#1085#1082#1086' '#1040#1083#1077#1082#1089#1072#1085#1076#1088' '#1052#1080#1093#1072#1081#1083#1086#1074#1080#1095
      #1051#1091#1075#1086#1074#1086#1081' '#1040#1083#1077#1082#1089#1077#1081' '#1054#1083#1077#1075#1086#1074#1080#1095
      #1050#1086#1079#1072#1095#1086#1082' '#1054#1083#1077#1075' '#1057#1077#1088#1075#1077#1077#1074#1080#1095
      #1050#1088#1072#1074#1094#1086#1074' '#1070#1088#1080#1081' '#1042#1083#1072#1076#1080#1084#1080#1088#1086#1074#1080#1095
      #1054#1089#1072#1076#1095#1080#1081' '#1040#1083#1077#1082#1089#1077#1081' '#1055#1077#1090#1088#1086#1074#1080#1095
      #1063#1077#1093#1091#1085' '#1070#1088#1080#1081' '#1042#1080#1082#1090#1086#1088#1086#1074#1080#1095
      ''
      ''
      #1047#1072#1088#1077#1084#1073#1072' '#1040#1083#1077#1082#1089#1072#1085#1076#1088' '#1055#1072#1074#1083#1086#1074#1080#1095
      'prl1@alfanafta.kiev.ua'
      ''
      #1047#1074#1086#1083#1080#1085#1089#1082#1080#1081' '#1040#1083#1077#1082#1089#1077#1081' '#1043#1077#1085#1085#1072#1076#1080#1077#1074#1080#1095
      'frendos@alfanafta.kiev.ua'
      ''
      #1047#1080#1085#1095#1077#1085#1082#1086' '#1040#1083#1077#1082#1089#1072#1085#1076#1088' '#1051#1077#1086#1085#1080#1076#1086#1074#1080#1095
      'oxygen@alfanafta.kiev.ua'
      ''
      #1051#1072#1074#1088#1077#1085#1102#1082' '#1042#1080#1090#1072#1083#1080#1081' '#1040#1085#1072#1090#1086#1083#1080#1077#1074#1080#1095
      'vitaliy@alfanafta.kiev.ua'
      ''
      #1052#1091#1076#1088#1080#1082' '#1040#1083#1077#1082#1089#1072#1085#1076#1088' '#1044#1084#1080#1090#1088#1080#1077#1074#1080#1095
      'adm@alfanafta.kiev.ua'
      ''
      #1050#1080#1077#1074'.'
      ''
      #1059#1082#1088#1072#1080#1085#1072'.'
      ''
      '1999 - 2008')
    Picture.Data = {
      07544269746D6170462B0000424D462B00000000000036040000280000006400
      0000640000000100080000000000102700000000000000000000000100000001
      0000FFFFFF002194FF00D6F7F700CEEFEF00B5D6D600B5FFFF009CF7F7007BF7
      F70073EFEF006BEFEF0063EFEF0073E7DE0063D6CE0052C6BD005AE7DE0094EF
      E700B5FFF700A5EFE700428C84006BCEBD0073DECE0052BDAD004AAD9C00C6EF
      E700B5E7DE00A5C6BD008CDEC6004A9C8400ADDECE0063C6A500102921008CD6
      BD006BB59C009CDEC6008CCEB50084C6AD007BBDA50073B59C005A9C84004284
      6B00397B6300BDE7D60073C6A50063B59400315A4A005AAD8C002952420052A5
      840042947300639C8400427B6300214A39009CD6BD00528C7300529C7B003973
      5A00316B52006BAD8C0031634A00183929000818100010312100102118000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000020202020202020502100610060610100606100605050605051105111005
      1010101010101010051010100510050510050506060606060606060606060606
      0605060606060606060606060606060606050606060605060606060606020202
      1717171702020202020202020202000506101006060605100605110505110505
      100510101005101005100510101005100505050505060F1A0F0B0F0F06111111
      0606060606060605060605060506050605061006060605060606060606060606
      0602020201010317170202020501010417020210060606061006100605060505
      11050511051010051010100510101005101005020502181A3127322F202A1F1A
      1A1A0F1111111105060606060606060606060610060606061006060605060606
      0606060606100217031717170202020202021702020502050610060506050610
      0605051105051010100510100510051005100502050502050431333337323123
      3434212118111C0F111111111806060606050606060605060610061006060610
      0606060606060606060202021703170302020202020203030202020210061010
      060605060511050511101010051005100510101010051005050504312E2C2522
      342121212134181834181C181811111111100506060606050610060610060606
      0610060606060506060606060610021717171717020202050217040417020205
      0606060605110505050510100510051010050510100505100510050229393832
      232121211C1C212134211C1C1C29291C1C292918111118100606060605061006
      0610061006060606060606060606060606020202171703171702020202181919
      290202100510050506100511051105051010101005051705051010051005021F
      3531231C1F223419211C1C211C1C1C1818181829341C29032918111810060610
      0610061006061006060506050606060506060606061002020101171702020202
      0201010403020205060610110505100505101010051005100510101010100510
      10021A312418342323232322341921192121041C292929292929292902171811
      1018050610060606061006060506060605060606060606060602021717171703
      0202020202021702050202050510100506050511100510051010100510100510
      05101010101C22211923253939392424223421343434211C341C292929032903
      0303171811100606060610061006061006061006060506050606060606020202
      0317031702020202050203170202020206060505051110051005101005050510
      05101005101005101C21342325352C33332C35252322223422341921211C1C1C
      2929292903031717181810060506061006100606100606100606060605060606
      0610021703171717170202020217040417020205100510110505051010101005
      10110505100510101010101C212225322E1E1E3E3E3E3E3B37352524231F2121
      19211C1C1C1C2929032903031710180606061006060610060610060610060606
      0606060606020202171717170202020202291919180202051006101010101105
      10050510051010110510051005101C1A2335331E3E3C3C3C3C3C3C3C3C3E3B2E
      373539241F1F1921041C1C292929030317171110060606100610061010060610
      0606050606060606061003170101031702020202050101041702020505051005
      0605051005111010101010051005100518112339381E3E3C3C3E3C3C3E3C3C3E
      3C3E3C3C3E3E3B3337262434341C1C1C29292903031717060510060610060606
      0606100610060606050606060602020217171717020202020202020302020202
      06101010051110101010051005100510051006100F24373B3E3C3C3C3C3C3C3E
      3C3C3E3C3E3C3E3C3E3C3E3E3E3B2E3523341C1C290429290303101806061006
      0610060610060606060506060606060606020202170317170202020202021703
      02050210050606050510051010101010100510050606050B39333C3C3C3C3C3E
      3C3E3C3C3E3C3C3E3C3E3C3E3C3C3C3E3C3E1E3B322522041C29292929031710
      1105061006060610061006100606050606050606061002170317171717020202
      050304041702020510051010110510100510100505101005060614271E3C3E3C
      3C3C3E3C3E3C3C3E3C3E3C3E3C3E3C3C3C3C3E3E3E3E3E1E3B2C262321042929
      2917171810110606100610060606100606050606050606060602020217171703
      02020202022919192902020506100605051005101005051010050606070D2C3C
      3C3E3C3C3E3C3C3C3C3C3E3C3C3C3E3C3E3C3E3E3E3E3E3C3E3C3E3E3E3E3B32
      24341C2929291710110505060610061006100610060606060606060606100217
      0101031702020202020101040305020205060511051010051010051005060608
      123B3C3C3E3E3C3E3C3E3C3E3C3E3C3E3C3E3C3C3E3E3E3E3E3E3E3E3E3E3E3C
      3E3E3E3B372B221C1C2929100511061006060606100606061006050606060606
      0602020217171717170202020502021702020205100610051010051005051005
      050708281E3C3C3C3C3C3E3C3E3C3E3C3E3C3C3C3E3C3E3C3C3C3E3E3E3E3E3E
      3E3E3E3E3E3E3E1E3B3826221C1C291711051006100610060610061006060506
      0506060606100202170317030202020202021703020202050505101010051010
      05100506070C2C1E3C3E3C3C3E3C3C3C3C3E3C3E3C3E3C3E3C3C3C3E3C3E3C3C
      3E3C3C3E3C3E3E3E1E3E3E3E3E1E2C3623212918101106060506060610060606
      1006060606060606060202171717170317020202021704040305020210101005
      10100510050606070D333E3C3E3C3E3C3C3C3C3E3C3C3E3C3C3C3E3C3C3E3C3C
      3E3E3E3E3C3C3E3C3E3C3E3E3E1E3E3E3E3E3E2E35231C291810061006100610
      0610061006060606060606060602020203171717020202020229191929020210
      10051005100510050606070E2E3C3C3E3C3C3C3C3E3C3C3C3C3E3C3E3C3E3C3C
      3E3C3E3C3C3C3C3E3E3C3C3C3C3C3C3C3E3E1E1E3E3E3E1E2C311F1818100606
      1006060610061006100605060606060606100217010103171702020205010104
      17020205101005101005060506070D2E3E3C3E3C3C3E3C3C3C3C3E3C3C3C3E3C
      3C3C3C3C3C3E3E3B333735363532333C3C3C3C3E3C3C3E1E1E3E3E3E1E38251C
      1818100606100610060606060606060606060606060202021717171702020202
      02020202020502021005101005060506070D3B3E3E3E3C3C3C3C3C3C3E3C3C3C
      3C3E3C3C3C3C3C3E1E332E2839242234341F202E1E3E3C3C3C3E3C3E1E3B1E3E
      3E1E27221C110610100606060605060606050606060606060602020217031703
      02020202020203170202020510101010100606070D333C3C3E3C3E3C3E3C3E3C
      3C3C3C3E3C3C3C3C3C3E1E333A3226242334341C1C1F202D373D3E3C3C3C3E3C
      3E1E3B3E3E3E3B261F1811060606100606060605060606060606060606100217
      17171717020202050217040417020202100510050506070C333C3E3E3C3E3C3E
      3C3E3C3E3C3C3E3C3C3C3C3E1E333A3226392423343434342223202D3638331E
      3C3E3C3C3C3E1E1E3E3E3E2E251C110610060606050606060605060606060606
      06020202171703171702020202181919290202051010050606070C2E3E3E3E3C
      3E3C3E3C3C3C3C3C3C3E3C3C3C3C3C3B2E272D24232323222323243936302730
      1B1B372E3D3C3E3C3C3C1E1E1E3E3E1E321F1111060606100606050605060606
      06060606061002020101171702020202020101041705020210061006070C383E
      3C3E3C3C3C3C3E3C3E3C3E3C3E3C3C3C3C1E2C26252222222224253935383737
      2E332C3A2E37361B3A3D3E3E3C3C3E1E1E3E3C3E3B2521110610060606050606
      0606060606060606060202171717170302020202020202030202020510050608
      0A383E3C3E3C3E3C3C3E3C3E3C3E3C3C3C3C3C3E2C2D23222324253135382C2C
      331E3B3B3B3B3B33332E302F1B3A3D3C3C3E3C3E1E3E3E3C3E271A0F06061006
      0606060606050606060606060610020203170317020202020502170202020210
      10050709121E3C3E3E3C3E3E3C3E3C3E3C3C3C3E3C3C3E3A26313935322C2C3B
      332E3B333B1E3E1E33333D3E2E3837362F36373E3C3C3C3E3E3E3C3C3C2E230F
      0606061006050606060606060606060606020217031717171702020202170404
      29050205060609283C3E3E3C3C3E3C3C3E3C3E3C3E3C3E3C3E3E1E3B3B3B3B1E
      3E1E1E3E1E1E3E3C1E3D3B333B3D1E33383A2E322D2B20333C3C3C3C3E3E3E3C
      3C1E311A06060606060606060606060606060606061002021717171702020202
      02291919290202050608273C3E3E3C3E3C3C3C3E3C3C3C3E3E3C3E3E3E1E3E1E
      3E3E1E3E3E3E3E1E1E1E1E1E1E1E3E3D2E382E2B32333338262422353C3C3C3C
      3C3E3E3C3C3E351A060606060506060606060606060706060602021701011703
      0202020205010104170202050716333E3E3E3E3C3E3C3E3C3E3C3E3C3E3E3E3E
      1E3E1E3E3E3E3E3E3E3C3E3E3E1E3B332E3A3737373036353333333338232225
      3B3C3C3C3C3E3E3C3C3E2E240606050606060606060606060606060706020202
      171717170202020202020217020202050C16272E1E3E3E3C3E3E3E3E3C3E3E3E
      3E1E1E1E1E3E3E3E3E3E3E1E3E3B3B333A3A3732322738333B351B333B333333
      2E221F232C3C3C3E3C3E3E3E3C3C3B2511060606060606060606060606060606
      06100202030317170202020202021702020502060E0E131B2E3D3E3E3C3E3C3E
      3E3E1E2E38372C333D1E3B3B3B1E1E3B332E2C2C2C2C33332E3B38333E27323B
      2C2E331E37212222273C3C3C3C3C3E3E3C3C1E310F0606060606060606060606
      06060706060202171717171717020202050304042902020F0908090D302E331E
      1E1E3E3E3E1E37202A203137332E3A33333B3B3B3B1E3E1E3B3B3B1E333D272E
      3D36381E2C2E3B3B39343422353C3C3C3C3E3E3C3E3E1E311C11050606060606
      060606060606060606100202171717030202020202291919290202060707080B
      0D162F3028331E3C3B322A1A1A22243135383A2E333B3B3B1E1E3B3B3B333E3E
      2E3E323230363A3B3B2C2E332521341F313E3C3C3C3C3E3E3C3C3B3511110606
      0606060606060606060606070602021701010317020202020201010417020210
      0607080B08080B0B0D302E382F142121211F23252D372E333D1E3B1E1E3B383E
      3E2C3A3D3B2E30322E3737333B3B3B38223419212B3E3C3C3C3C3E3C3C3E3B35
      1111060606060606060606060606060606100202171717171702020205020202
      02050210060607070706070F0B0C0D0E081118181C212225363A3A2E3E3E3E3E
      3B3B38333B3B323D3B351B2E3C321B32283A3B3222342121393E3C3C3C3E3C3E
      3C3E3B2621110606060606060606060606060606060202021703170302020202
      02021703020202050606070606060607080808070F112918181C2224393A3737
      3B3C3E1E3B3B3A3B333D323A303A372E3B321B2D32331E371F1C0434313C3C3C
      3C3C3C3C3E3E3B361C1111060606060506060606060606060602021717171703
      1702020202170404290202050606060605060606060607061106291729213423
      25372832333E3E3B3B3B383B3B2E283A2E3E2C37321B36263B3B33361F1C1C21
      353C3C3C3C3E3C3C3C3E3B311A11110606060606060606060606060606100202
      0317171702020202022919192902021006061006051105050606060606171029
      181C222325372727333E1E3B3B33283D3E333D3C3B2E37301B3036373B1E2E24
      341C041F2C3C3C3C3E3C3C3C3C3C33311F111110060606050606060606060706
      0602021701010317170202020501010417020205060510051010051105050605
      101718171821342325323630333E1E3B3B33272E333B2E3A32303036272C3D3E
      3B3E3234211C21243B3C3C3E3C3C3E3C3C3E2E20222111060606060606060606
      0606060606100202171717170202020202020217020500100510050605050610
      05110505111017181121343425373627333E3C1E3B3337383832283032303027
      333E3E1E1E3B31211C1C34313C3C3C3C3C3C3C3C3C1E3724341C0F0606060506
      0506060607060606060202021703170302020202020203030202021005061005
      1010051010100510101018171C1C342225373A2E3D3B2E3A3738383838373728
      27322C3B1E3E1E3D1E2823211C2122383C3C3C3C3E3E3C3C3C3B2624211C1806
      0506060606060606060607060602021717171717020202050217040417020210
      05050605060506100505111010101718181C21342239363A3730323A33322828
      373732372E3B3E3E3E3E3E1E332D22211C34253B3C3C3C3E3E3E3C3C3C332524
      341C111806060606060606060606060606100202171703171702020202181919
      2902021006100610100605100610051006101017181C342323232B30372E3B3B
      33382E3B2E382E1E3C3E3B3B3B3E333B3823211C3423383C3C3C3C1E3E3E3C3E
      3E37242334041C11060606060606060606070607060202020101171702020202
      020101042905020505061006060610060605100610101818181C213422243237
      332E383737333C3C3E3E3E3C1E1E3B3B3E2E32333134212122273E3C3C3E1E1E
      3E3C3C3C1E352323191C1C111106060606060606060606060610021717031703
      02020202020202020202021006100610061006051006101006101018181C1C34
      2225361B1B32372E3B3B3E1E3E3E3E3C3E3E3E1E3D2E282623212122353E3C3C
      3C1E1E3E3C3E3E3E3B26242322341C1C11060606060606060606070606020202
      1717031702020202050203170202021006100606060506100605060510061018
      291C1C342222202D272E1E1E3E3E3E3E3C3E3E3C3E3E3C3C3E333523221F2226
      3B3C3C3E3E3B3E3E3C3E3C3E3331242223221C1C111106060606060706070607
      0610020203171717170202020217040417020210060606100606061006100605
      0610111818181C193422252C3B1E3E3E3E3E3C3E3C3E3B2C3B1E3E3E2C352522
      2223353B3C3C3C3E3B1E3E3C3E3E3E1E383124221923211C1C11110606060606
      0607060606020217171717170202020202291919180205050606060606060506
      0606050606061018181C1C342224373B1E3E3E3E3C3E3E1E2C1E3B381E1E3337
      2620242325323E3C3C3E3E3B1E3E3C3C3E3C3E33373124222223191C1C111106
      0606070607060607060202020101031702020202050101041702021006060606
      060606060506061006051111181C1C342225373B3C3E3E3E33371E3B2E3E3E3B
      333A3526262039312C1E3E3E3E3E1E1E1E3E3C3C3C3C3E333225242219232321
      211C110606060607060706070610021717171717020202020202020202020205
      06060606060606060606060606050611111C34222431331E3D2C3B3C3B333E3E
      1E3B333835353526353535331E1E1E3E1E1E3E3E3E3C3C3C3C3E1E2E35242424
      232323341C212106060606060607060706020202170317170202020202021703
      0205020606060606060606060606060606061811111C1F23253232322C333E3E
      3E3E3B33383235273532372C2E333B1E1E1E3E1E1E3E3E3E3C3E3C3C3E1E2E37
      392323252434242334211C0606060706070F06070F0502021717171717020202
      05030404170202050606060606060606060606060606061111211F2324262B32
      3D3E3B3B2C383232353532372C333B1E3E3E1E1E3E3E3E3E3E3E3E3E3E3C3C3E
      3E3337352522232524232223341C1A110F060607060706070602021717171703
      02020202022919192902021006060706060F07060606070606060611211A3423
      2526303A333A383732353535322C2E3B1E3E3E3E3E3E1E3E3E3E3E3C3E3E3E3C
      3C3E3C3E3B2C272523233424252319232319340F060706060707070707020202
      0101031702020202020101040305020606060F0606060606070606060606110F
      0F21212239263126303035323737372C333B1E3E3C3E3E3C3E1E3E1E3E3E3E3E
      3E3E3E3E3C3C3E1E2E2E3524232322232524232323341921060F070606060F07
      0605021703171717170202020502021702020205070606070607060706070607
      0606060F211A21233925222A31263527372E333B1E3E3E3E3C3E3C3E3E1E1E3E
      3E3E3C3E3E3C3E3C3C3E3E3B2E333723232323342525242324232121210F0607
      070707070F0202021703170302020202020217030202020606070606070F0706
      070F06070606060F1A1A1922232323243935372E3B1E3E3E3E3C3E3C3E3E3E1E
      1E1E3E3E3E3C3E3E3C3E3C3E3E3C3337373B3324232423232325242324243434
      1A060F0706070F07060502171717170317020202021704040305020607060706
      070706070607070607060F0F0F0F213422242425262C3B3E3E3C3E3E3E3E3C3E
      3C3E3E1E3E3E3C3E3C3E3E3C3E3C3C3C3E333A3A333B3E352323232323252523
      2325231C21210F0F070F07070F02020217171717020202020229191929020206
      06070607060F07070706070707060F0F1A1A212122253135333E3C3C3C3E3C3E
      3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3C3C3C3E3E3B3A3A3D332E3E2C24232323
      2324252422242419212106070F070F0707020202010103171702020205010104
      1702020607060706070707070F07070F0707070F0F0F211A22312E3E3E3C3E3E
      3E3C3E3E3C3E3E3E3E3E3C3C3E3E3E3E3E3C3C3C3C3E3D2E302B2030333B3E1E
      3924232424243924231925222134210F0F0707070F0503021717171702020202
      0202020202050206070707070707070F07070807070F0F080F1A1A1F353B3C3C
      3E3E1E3E3E3E3C3C3E3E3E3E3E3E3C3E3E3E3C3C3C3C3C3E33322D201B372D2B
      372E333C32242425242425252423252519341A0F0F070F070602020217031703
      02020202020203170202020607070F070F070807070807080707070F0F0F1A39
      3B3C3C3E1E1E3E3E3C3E3C3E1E3B3E3E3E3E3E3E3E3E3C3C3C3C3E382014221F
      2A2E3720353B323E3B252325252425252424253923341F210F07070707020217
      1717171702020205021704041702021107060707070F0708070708070F070707
      0F0F25333C3E1E1E3B3E3C3E3E3C3C1E3B3E3E3E3E3E3E3C3E3C3C3C3C332D23
      2222222224303D37382E373D3C35242525252539252524252419221A0F080F07
      0710020217170317170202020218191929020506070808070807070708080708
      08070F0F0F232C3C3C3B3B1E3E3E3E3C3C3C3D3B1E3C3E1E3E3E3E3C3E3C3C3D
      3224221F1F2222232A2D333738333A3B3C2E2525252525313925252525341F22
      1A0808070F020202010117170202020202010104290202060707070707080708
      07080808070706071A353E3C3B333E3E3E3E3E3C3E333B3E3C3E3E3E3E3C3C3E
      3C3E3720221F1F221F2222232036372B3A3D2E262E3D31393939253135313925
      252319231A1A07070F0502171717170302020202020202020202050608080708
      070708070807070807070F07163B3C1E333E3E3E3C3E3C3E2E2E3E3C3E3E3E3C
      3C3E3C3C3B36231F1F1F341F222223202D2D202B332C3327363B32392D312525
      3535312539253422221A0B0F0702020203170317020202020502031702020207
      07070807080708080708070707070708383C3E3B1E3E3E3C3E3C3C2E2C3E3E3E
      1E3C3C3C3E3C3C2E20222134221F1F1F22232A2F362A2A1B3727332C26383B26
      393939253137313939393419221F0F080F100217031717171702020202170404
      170202060808080808080708080708070F06070C3D3C1E3B3E3E3E3C3E3C2E37
      3E3E1E1E3C3C3E3E3C3C322422231F1F1F221F1F23232B362B2A202D2D3A2C33
      35322E27313939392532373539312521221F1A0B070202021717171702020202
      0229191929020207070808080808080807080706070707151E3C1E1E3E3E3C3C
      3C3B323B3C1E1E3E3C3E3E3C3C321C18342334341F1F1F22222A3630242A2F36
      323A2E332732333A31393931243132353135251934221A0B0F02021701011703
      02020202050101041705020F080808080808080707070707070607163E3E1E1E
      3E3E3C3C3E382E3C3E1E3E3C3C3C3C3D35341717181834341F341F22242D3039
      39262738331E3D2C363738332726313125253232353139221F221F1A0F050202
      17171717020202020202020202020207090809080808070F070F070607070712
      3C3E3B1E3E3C3E3C2E371E1E1E3E3E3C3E3C3D261802030317291C1C211F2223
      273A3A3727272C3D3A353E32313837333826313131253137373135251922231A
      1A02170203031717020202020202170302020207080808070807070707070707
      060708283E3E1E3E3E3C3C3B373D3C3B1E3C3C3E3E3B361C020303170317181C
      21212437373227273A3B3A3525223333353835333B3526313131253737353539
      23192322211002021717171717020202050304041702050F080807080707070F
      0706070F070708283E1E1E3E3E3E3E382C3C1E1E3E3E3E3E3E36220302032918
      031718183425382726382C33333323313A22323E2C2C27333E38263135352535
      3835353524342324340303031717030302020202022919192902020708080707
      0807070707070707070708283E1E1E3E3E3C3B373E3E3B1E3E3E1E3E37232903
      020317290317291822202023373E3327223526233A20203E3C3A2C333C332726
      353535392C323535392322241902020301011717020202020201010417020207
      0808080707070F07070F07070707081B1E1E3B3E3E3E33333C1E3B1E3E1E3E33
      2A1C030203020303030329212124353A38321F3125253722312723333C3A2E2E
      3B2E372735353525353735313524192423030302170317171702020202050217
      0202050F07080707070F07070F07070F070807163D3B3B3E3E3E3B1E3E3B3B3E
      3E1E1E32221702030303020303031C34223A3223223A223935223A252B38223A
      1E2C32323A38332735352631312C352535252223240302030317170302020202
      0202170302020206070707070807080707070807070707153B3B3B3E3E1E3B3E
      3E1E1E3E3E3B1E2621170303020203030317181C3132262A342C392332223226
      2235371E3838262E3D3B2C352626313125373525313519232303020317171703
      17020205021704040305020707080708070707070708070F070707133A333B3E
      3E1E3B3C3E3E3E3E3E3D3D2B3429181717171729171718212435383121353234
      372A393835333C1E372E2E3C3B372D3131313125253539253931252425030302
      1717171702020202021819192902020F0708070708070808070707070807070B
      283B331E3E1E1E3E3E1E1E3C1E3B3B2A18292903343418290317293411223537
      1F23381F392D373C3C3C3B2C3B3C3D3726313131312524353731393925313232
      3503030201010317170202020201010417020207070808080708070808070807
      0707070B2F33333D3E1E1E3E3E1E1E3C1E3B3A2318171729223417030317291C
      341C3937221C3231352E3A33332E373B3E38262D313931392539372C35353237
      2E3B3B332C030302171717170202020202020202020502070708070708070807
      070807080708070813372E333E1E3E3E3E1E3E3E1E3B38221803031729171717
      29181C341F3424372620303A3B2E1B3732352E2E3639393131312539352C2C37
      2E3B1E3E3E3E1E3D270202021703170302020202050203170202020F07070807
      0708070807070707080708070B2B382E3D1E1E3E3E1E3E3E1E2C26231C291717
      17172929181C111C21221F393A33333B33372836303727392539313131313132
      372C2E3B3E3C3C3C3E3E1E2C1310021717171717020202020217040417020207
      080708080708080708080708070807070B131B38333B1E3E3E1E1E3E3E372422
      341C181C1C1C18211C1C341F34111F222A39263636362B363539252525393131
      3135372C333B1E3C3C3E3C1E1E1E380C08020202171717171702020202291919
      2902050F08070807080708080708080707070708080B2B272E3B1E1E1E1E3B1E
      1E37241929291C1C1C34211F21211F232A221F232324242B2D2B392524252539
      393131322C2C2C3B1E3E3C3E3E1E1E3E3B270E09081002020101030302020202
      05010104170202070708080808080808070807080708070808081F2D32333D3B
      1E1E3B3B1E37242129292929291C3434222222232324242A2B20202524232324
      2525253931322C2E333B1E3E3E3E3E1E3B1E33271D090A0A0802021717171717
      1702020202021702020502070807080808080808080808080808080807080B2A
      2D37333B3B1E3B333B38393429032929032929291C0421343422222222221F22
      22222424252525352C2E3B3B3B1E3E3E3E3E1E1E2E1B0C0B090A0A0A09020202
      0317031702020202020203170202020708080808080908090808080808080808
      080808141D36373B3B333B3B333335221C290329292903292929292929292929
      1C1C341F192323252539322E333B3B1E3E3E3E3E3E1E2E160C09090A090A0E0A
      0910021703171717020202020503040417020207080708090808080808090808
      08080808080807081A2B1B3A3B3B2E333333382D221C29290329290329292929
      29292929041C193422232539312C3B3B3B1E3E3E3E3E3E1E2C16140909090A0A
      0A0A0A0E09020202171717171702020202291919290205070808090809080908
      0908080808090808080808080814201B3A3B3D3333332E372D22341C29292929
      292903292929291C1C2134222439352C333B1E3E3E3E3C3E3E3B2C1508090909
      09090A0A0A0E0E0A090202170101170302020202020101041702020708080809
      080908090809080908080808080808080808142B1B38333D3333332E38302023
      34211C04041C1C0429291C1C1C192224392C3B1E3E3E3E3E3C3E1E1E371D0B07
      09090909090A0A0A0A0A0A0E0B10020217031717020202020502020302050207
      0909090909090909090909090909090808090809090808141D2F37333B333333
      2E2C381B3125231F1A34211919211921192325312E3B3E3E3E3C3C3E1E33272D
      0B0709090909090909090A0A0E0A0E0E09020202171717021702020202021703
      020202070909090909090909090909090909090909080908090808080B141D1B
      372E33332E2C2E333B333A32353131393931313135322C331E3E3C3E3E1E3327
      2D14080808090909090909090A0A0A0A0E0E0A0E091002170217171702020202
      021704041702050F0A090909090909090A0A090A090A09090909090809080909
      09080B131D2D30372C33333B3D1E1E1E1E3B3B3B333B3B3B3B1E1E1E1E3B2E37
      271D14080708080809080909090A0A0A0A0A0A0A0E0A0E0E0902020217031703
      02020205022919191802100709090A090A090A0A0A0A0A090909090909090909
      08090809090908080914131D2D303A333B3D1E1E1E1E1E3C3C1E3C3C1E3B3338
      1215130B080809090809090909090909090A0A0A0A0A0A0E0E0E0E0E09020202
      010103020202020202010104170202080A090A0A090A0A0A0A0A0A0A0A0A0A09
      090909090909090909090909090809080E140C15161B122738382C38382C2812
      160D0E0E090909090809090909090909090A090A090A0A0A0A0A0A0A0E0A0E0E
      09050202020202020502020202050202020202080A090A0A0A0A0A0A0A0A0A0A
      0A0A0A0A0A0909090909090909090909090909090909090909090E0E0E0E0E0E
      0E0E0A0A0A090909080808090909090909090909090909090A0A0A0A0A0A0E0E
      0E0E0E0E080202050202050202020202020202020202050709090A0909090A0A
      0A0A090909090909090909090809080908090909090809080908090809080807
      09070908090808080808080808080808080808090909090909090909090A0A0A
      0A0A0A0A0A0E0E0A09050202020202020202}
    Left = 32
    Top = 176
  end
  object pmRef: TPopupMenu
    Images = il
    Left = 240
    Top = 64
    object N3: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
      Checked = True
      RadioItem = True
      OnClick = N3Click
    end
    object N5: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      RadioItem = True
      OnClick = miEmpRefClick
    end
    object N7: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1077#1081' '#1080' '#1090#1077#1093'. '#1089#1088#1077#1076#1089#1090#1074
      RadioItem = True
      OnClick = N7Click
    end
    object N8: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1073#1072#1085#1082#1086#1074
      RadioItem = True
      OnClick = N8Click
    end
  end
  object dQuery: TOilQuery
    SQL.Strings = (
      'select * from oil_var')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 32
    Top = 232
  end
  object qOrg: TOilQuery
    SQL.Strings = (
      'select distinct o1.name,'
      '                o1.par,'
      '                o1.par_inst,'
      '                o1.org_type,'
      '                o1.id as org_id,'
      '                o2.name as par_name,'
      '                o1.talon_code,'
      '                o1.card_id'
      '  from v_org o1, v_org o2'
      ' where o1.state = '#39'Y'#39
      '   and o1.id = :a'
      '   And o1.inst = o1.id'
      '   and o1.par = o2.id'
      '   and o1.par_inst = o2.inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 344
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'a'
      end>
    object qOrgNAME: TStringField
      FieldName = 'NAME'
      Origin = 'OIL_ORG.NAME'
      Size = 100
    end
    object qOrgPAR: TFloatField
      FieldName = 'PAR'
      Origin = 'OIL_ORG.PAR'
    end
    object qOrgPAR_INST: TFloatField
      FieldName = 'PAR_INST'
      Origin = 'OIL_ORG.PAR_INST'
    end
    object qOrgORG_TYPE: TFloatField
      FieldName = 'ORG_TYPE'
      Origin = 'OIL_ORG.ORG_TYPE'
    end
    object qOrgORG_ID: TFloatField
      FieldName = 'ORG_ID'
      Origin = 'OIL_ORG.ID'
    end
    object qOrgPAR_NAME: TStringField
      FieldName = 'PAR_NAME'
      Origin = 'OIL_ORG.NAME'
      Size = 100
    end
    object qOrgTALON_CODE: TFloatField
      FieldName = 'TALON_CODE'
      Origin = 'OIL_ORG.TALON_CODE'
    end
    object qOrgCARD_ID: TFloatField
      FieldName = 'CARD_ID'
      Origin = 'OIL_ORG.CARD_ID'
    end
  end
  object admq: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 80
    Top = 232
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 312
    Top = 176
  end
  object pmRash: TPopupMenu
    Left = 80
    Top = 64
    object miRash: TMenuItem
      Caption = #1054'&'#1090#1087#1091#1089#1082' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074
      ImageIndex = 3
      OnClick = miRashClick
    end
    object miRashPP: TMenuItem
      Caption = '&'#1055#1077#1088#1077#1073#1088#1086#1089#1082#1072' '#1089' '#1087#1072#1088#1090#1080#1080' '#1085#1072' '#1087#1072#1088#1090#1080#1102
      ImageIndex = 4
      OnClick = miRashPPClick
    end
    object miRashOut: TMenuItem
      Caption = '&'#1057#1087#1080#1089#1072#1085#1080#1077' '#1089' '#1087#1072#1088#1090#1080#1080
      ImageIndex = 5
      OnClick = miRashOutClick
    end
  end
  object pmPrih: TPopupMenu
    Images = il
    Left = 32
    Top = 64
    object miAddPrih: TMenuItem
      Caption = '&'#1055#1088#1080#1093#1086#1076
      ImageIndex = 1
      OnClick = miAddPrihClick
    end
    object miAzsRet: TMenuItem
      Caption = '&'#1042#1086#1079#1074#1088#1072#1090' '#1089' '#1040#1047#1057
      ImageIndex = 2
      OnClick = miAzsRetClick
    end
  end
  object il: TImageList
    Left = 128
    Top = 120
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000848484008484
      84008484840000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000FFFF0000FFFF0000FFFF00C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400000000000000000084848400848484008484
      84000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400C6C6C600C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C60000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C60000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400000000000000000084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000084000000000000000000
      0000840000000084000000840000008400000084000000840000008400008400
      00008400000000000000000000000000000000000000000000000000FF000000
      8400000084008484840000000000000000000000000000000000000000000000
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000840000008400
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000084000000000000000000000000000000000000000000FF000000
      84000000840000008400848484000000000000000000000000000000FF000000
      8400000084008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000084000000FF000000FF000000FF000000FF000000FF00000084
      00000084000000840000840000000000000000000000000000000000FF000000
      840000008400000084000000840084848400000000000000FF00000084000000
      8400000084000000840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      00000084000000FF0000000000000000000000000000000000000000000000FF
      0000008400000084000000840000840000000000000000000000000000000000
      FF00000084000000840000008400000084008484840000008400000084000000
      84000000840000008400848484000000000000000000FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      000000FF00000084000000840000840000000000000000000000000000000000
      00000000FF000000840000008400000084000000840000008400000084000000
      84000000840084848400000000000000000000000000C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000000000000000
      000000FF00008400000084000000840000000000000000000000000000000000
      0000000000000000FF0000008400000084000000840000008400000084000000
      84008484840000000000000000000000000000000000FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000008400000084008484
      84000000000000000000000000000000000000000000C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      000000000000000000000000FF00000084000000840000008400000084008484
      84000000000000000000000000000000000000000000FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000000FF0000008400000084
      0000008400000084000000840000840000000000000000000000000000000000
      0000000000000000FF0000008400000084000000840000008400000084008484
      84000000000000000000000000000000000000000000C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000840000000000
      000000000000000000000000000000000000000000000000000000FF00000084
      0000008400000084000000840000840000000000000000000000000000000000
      00000000FF000000840000008400000084008484840000008400000084000000
      84008484840000000000000000000000000000000000FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000840000008400008400
      0000000000000000000000000000000000000000000084000000840000000084
      0000008400000084000000840000840000000000000000000000000000000000
      FF0000008400000084000000840084848400000000000000FF00000084000000
      84000000840084848400000000000000000000000000C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000840000008400000084
      0000840000008400000084000000840000008400000000840000008400000084
      0000008400000084000000840000840000000000000000000000000000000000
      FF000000840000008400848484000000000000000000000000000000FF000000
      8400000084000000840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF0000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      000000FF000000FF000000840000840000000000000000000000000000000000
      00000000FF000000840000000000000000000000000000000000000000000000
      FF000000840000008400000084000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000840000008400000084000000840000008400000084000000FF000000FF
      0000000000000000000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00000084000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF007B7B7B000000FF007B7B7B00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF000000FF000000FF000000FF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF007B7B7B000000FF007B7B7B00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF000000FF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF000000FF007B7B7B0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000008400000000008400000084000000
      840000008400000084000000FF00000000000000000000000000000000000000
      0000000000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF000000FF000000FF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000008400000000008400000084000000
      8400000084000000FF0000000000000000000000000000000000000000000000
      0000000000008400000000008400000084000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      000000000000000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000FF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000008400000000008400000084000000
      8400000084008400000084000000000000000000000000000000000000000000
      00008400000000008400000084000000FF000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      00000000000000000000000000000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF007B7B7B007B7B7B0000FFFF00FFFFFF007B7B7B000000FF000000FF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000008400000000008400000084000000
      8400000084000000840000008400840000008400000084000000840000008400
      00000000840000008400000084000000FF000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      000000000000000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF000000FF000000FF00FFFFFF0000FFFF007B7B7B000000FF000000FF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000084000000000084000000FF000000
      FF00000084000000840000008400000084000000840000008400000084000000
      840000008400000084000000FF00000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF000000FF000000FF007B7B7B00FFFFFF007B7B7B000000FF000000FF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      00000000FF000000FF0000008400000084000000840000008400000084000000
      84000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF000000FF000000FF000000FF000000FF000000FF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF000000FF000000FF000000FF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFC00700000000
      CFF3800300000000C7E3000100000000E3C7000100000000F18F000100000000
      F81F000000000000FC3F000000000000FC3F800000000000F81FC00000000000
      F18FE00100000000E3C7E00700000000C7E3F00700000000CFF3F00300000000
      FFFFF80300000000FFFFFFFF00000000F81FE7FFFFFFFFFF3007C3E7FFFFFFFF
      0003C1C3FFFFFFFF0001C0810000FFFF03E0E0010000FFFF07F0F0030000FFFF
      03F0F8070000FEFF01FFFC0F0000FC7FFFC0FC0F0000F83F1F80F80F0000F01F
      1FC0F0070000FFFF0F80E0830000FFFF0000E1C10000FFFF8000F3E10000FFFF
      C00DFFF10000FFFFF03FFFFFFFFFFFFFFFFFFEFFFFFFFC7FF83FFEFFFFFFFC7F
      E00FFC7FFFFFFC7FC007FC7FFFFFFC7F8003F83FFFFFFC7F8003F83F03FFFC7F
      0001F01F01F8E00F0001F01F03F8E00F0001E00F01F0F01F0001E00F0000F01F
      0001FC7F0001F83F8003FC7FB003F83F8003FC7FFC0FFC7FC007FC7FFFFFFC7F
      E00FFC7FFFFFFEFFF83FFC7FFFFFFEFF00000000000000000000000000000000
      000000000000}
  end
  object Image: TImageList
    DrawingStyle = dsSelected
    Height = 35
    ImageType = itMask
    Width = 35
    Left = 80
    Top = 120
    Bitmap = {
      494C010118001D00040023002300FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008C0000001801000001002000000000008064
      0200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00D2D2D200ECECEC00DBDBDB007878
      7800E2E2E200DDDDDD00A1A1A100F8F8F800CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF000000000000000000CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF0000000000CFCF
      CF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CFCFCF00CFCFCF00CFCFCF00CFCFCF0000000000F6F6F600CFCF
      CF00A9A9A900E8E8E800F1F1F1004E4E4E0088888800E0E0E000DADADA005656
      560086868600CFCFCF000000000000000000CFCFCF0000000000CFCFCF000000
      0000CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00B4B4B4009B9B9B007878780099999900E3E3E300E7E7E7008D8D
      8D00DFDFDF00DDDDDD008F8F8F00414141004A4A4A00CFCFCF00D5D5D5008D8D
      8D009393930095959500939393008F8F8F0098989800D6D6D600E8E8E800CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CFCFCF00CFCFCF00CFCFCF00D3D3D300D1D1D100D5D5D5006464
      6400D9D9D900DEDEDE00DFDFDF00DFDFDF00DCDCDC00D9D9D900474747004141
      41008181810077777700636363005D5D5D0058585800525252004F4F4F007070
      70007777770078787800868686008A8A8A00717171005C5C5C00B7B7B7000000
      0000CFCFCF00CFCFCF00CFCFCF00CFCFCF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00CFCFCF000000
      000000000000D7D7D700D1D1D100D4D4D400D7D7D700D9D9D900D8D8D800D9D9
      D900D7D7D700D5D5D500D8D8D800B2B2B200C8C8C800CACACA00424242006868
      68006666660062626200616161008585850077777700696969006F6F6F007777
      77008080800074747400747474006767670075757500CFCFCF00CFCFCF00CFCF
      CF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      00000000000000000000CFCFCF00FCFCFC00CFCFCF00B7B7B700CACACA00CCCC
      CC00DFDFDF00DDDDDD00DEDEDE00DDDDDD00E8E8E800CCCCCC00CBCBCB00C7C7
      C700C3C3C3006B6B6B009C9C9C006E6E6E006E6E6E0068686800606060007C7C
      7C006A6A6A0061616100666666006F6F6F007B7B7B0072727200676767005B5B
      5B005B5B5B006464640064646400CFCFCF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      00000000000000000000C6C6C6000000000000000000C6C6C600000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000C6C6C6000000000000000000C6C6C6000000
      0000C6C6C60000000000000000000000000000000000CFCFCF00AAAAAA00B9B9
      B900AEAEAE00C1C1C100C4C4C400D6D6D600D8D8D800D9D9D900D9D9D900D9D9
      D900D8D8D800DBDBDB00C5C5C500C2C2C200959595008A8A8A00696969007373
      7300707070006868680060606000585858004D4D4D0059595900616161006969
      6900747474006C6C6C00616161005656560058585800676767006B6B6B007070
      7000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      000000000000CFCFCF00BCBCBC00B4B4B400B8B8B800BBBBBB00CECECE00D2D2
      D200D4D4D400E0E0E000E6E6E600D4D4D400D4D4D400D9D9D900BFBFBF00BCBC
      BC00828282006666660078787800747474007171710068686800606060005757
      57004D4D4D00525252005B5B5B00646464006E6E6E00676767005B5B5B005151
      5100545454006262620079797900757575000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C6000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000C6C6C60000000000C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000C6C6C60000000000C6C6C6000000000000000000000000000000
      0000C6C6C60000000000000000000000000000000000CFCFCF009C9C9C00B3B3
      B300B4B4B400BABABA00CDCDCD00CFCFCF00BDBDBD00D8D8D800ECECEC00D5D5
      D500CFCFCF00CECECE00BCBCBC00B8B8B800B4B4B400B1B1B1005D5D5D004D4D
      4D0070707000696969005F5F5F00565656005C5C5C0051515100565656005F5F
      5F006969690062626200575757004C4C4C004F4F4F0062626200787878008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C60000000000C6C6C600C6C6C6008484
      8400848484008484840000000000848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      000000000000CFCFCF00CFCFCF009E9E9E00AEAEAE00B2B2B200C8C8C800B2B2
      B2007D7D7D008E8E8E005F5F5F006E6E6E00CCCCCC00CBCBCB00C2C2C200B1B1
      B100AEAEAE00ABABAB006B6B6B004A4A4A006D6D6D00686868005E5E5E006666
      6600595959004D4D4D00515151005A5A5A00646464005D5D5D00525252004B4B
      4B00575757006868680077777700888888000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C60000000000C6C6C60000000000848484000000000000000000848484000000
      0000848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000C6C6C6000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000C6C6C60000000000C6C6C6000000
      0000C6C6C60000000000000000000000000000000000F7F7F7009F9F9F00A3A3
      A300A8A8A800B5B5B500C1C1C1004545450041414100444444005F5F5F006A6A
      6A00C4C4C400C2C2C200B6B6B600AAAAAA00AAAAAA00BBBBBB00D4D4D400C6C6
      C6008B8B8B008888880082828200888888009292920091919100888888007D7D
      7D0082828200676767005A5A5A004949490040404000515151006A6A6A008787
      8700000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C6000000000000000000000000008484
      8400000000000000000084848400000000008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000009C9C9C009C9C9C009E9E9E00A4A4A400B2B2B200BEBEBE003C3C
      3C00282828004A4A4A006262620085858500BFBFBF00BEBEBE00A6A6A600A4A4
      A4009E9E9E009999990093939300929292008E8E8E00868686007E7E7E007575
      75006C6C6C006D6D6D0070707000757575007B7B7B0071717100717171006D6D
      6D00464646004D4D4D0069696900888888000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000008484840000000000848484000000
      0000848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60000000000000000000000000000000000C6C6
      C60000000000C6C6C600000000000000000000000000C6C6C600000000000000
      0000C6C6C60000000000000000000000000000000000ABABAB00969696009A9A
      9A009F9F9F009E9E9E00BABABA0080808000202020003B3B3B0055555500BBBB
      BB00BCBCBC00C2C2C200A0A0A0009F9F9F004A4A4A00424242009F9F9F009A9A
      9A00969696008D8D8D0082828200757575006C6C6C00666666006A6A6A007373
      73007F7F7F00767676006B6B6B00616161005A5A5A006C6C6C00626262008888
      8800000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000848484008484
      8400848484008484840084848400000000008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      000000000000AFAFAF0091919100A4A4A400969696007A7A7A00B4B4B400B5B5
      B5007E7E7E005E5E5E00B3B3B300B7B7B700B6B6B600B1B1B1009B9B9B009999
      99009797970044444400949494009B9B9B00959595008B8B8B00898989007878
      78006C6C6C005E5E5E00636363006C6C6C007878780070707000646464005858
      58005E5E5E006F6F6F006E6E6E00797979000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C60000000000C6C6C60000000000000000008484840000000000000000008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000CFCFCF009999
      9900A3A3A30094949400B0B0B000B1B1B100B2B2B200B3B3B300B2B2B200B3B3
      B300B9B9B900969696009494940094949400A0A0A000B6B6B600767676008F8F
      8F009090900090909000848484007575750066666600595959005E5E5E006666
      6600727272006A6A6A005E5E5E005353530056565600656565007A7A7A007878
      7800000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C600000000008484
      8400000000000000000000000000000000008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      000000000000CFCFCF009E9E9E00B5B5B500B3B3B300AFAFAF00ADADAD009393
      9300C0C0C000C0C0C000BABABA00AAAAAA00ABABAB00ABABAB00C8C8C800E5E5
      E500DCDCDC009B9B9B0092929200909090008A8A8A007F7F7F007A7A7A006C6C
      6C005E5E5E0051515100565656005D5D5D006868680061616100555555004B4B
      4B005252520061616100757575008B8B8B000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C60000000000C6C6C60084848400848484000000000000000000848484000000
      0000848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000737373000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008484840000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60000000000000000000000000000000000C6C6
      C600000000000000000000000000C6C6C6000000000000000000C6C6C6000000
      0000C6C6C60000000000000000000000000000000000CFCFCF00C4C4C400BEBE
      BE0000000000B9B9B900B7B7B700B9B9B900B3B3B300B4B4B400B3B3B300B2B2
      B200B3B3B300B5B5B50086868600EBEBEB009D9D9D00A0A0A0008D8D8D009191
      9100868686007B7B7B007373730065656500575757004B4B4B00515151005858
      5800636363005C5C5C00525252004D4D4D0055555500636363006D6D6D008888
      8800000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C6008484
      8400848484008484840084848400000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      730073737300000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      000000000000CFCFCF00C1C1C100B5B5B500A7A7A700CFCFCF00C0C0C000BEBE
      BE00BDBDBD00BBBBBB00BCBCBC00BCBCBC00BDBDBD00BDBDBD00B7B7B7007D7D
      7D00A0A0A0009E9E9E00949494008C8C8C0084848400797979006D6D6D006060
      600053535300484848004C4C4C0055555500606060005D5D5D00585858004949
      4900414141005151510069696900888888000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7E7E7007373730073737300000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00000000008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00CFCFCF00DCDC
      DC009F9F9F00C4C4C400C9C9C900C8C8C800C6C6C600C6C6C600C5C5C500D3D3
      D300CECECE00C8C8C800DFDFDF007F7F7F008080800099999900959595009898
      98009B9B9B00969696008D8D8D0082828200737373005E5E5E004F4F4F004C4C
      4C00595959005353530047474700393939003F3F3F0050505000696969008787
      8700000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60084848400C6C6C600C6C6C600C6C6C6008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007373730000000000E7E7
      E700737373007373730073737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF0000000000FFFFFF00FFFFFF00000000008484
      8400000000008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CFCFCF00CFCFCF00CFCFCF00F0F0F000D4D4D400D4D4D400CFCF
      CF00EEEEEE00CECECE00DEDEDE00919191009292920000000000C8C8C800E4E4
      E40095959500A6A6A600A3A3A300A2A2A200A0A0A000979797008B8B8B007D7D
      7D006E6E6E0061616100646464006F6F6F00909090008F8F8F00707070004141
      41003C3C3C005151510069696900888888000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C6000000000084848400C6C6C600000000000000000084848400848484008484
      8400000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000073737300737373007373730000000000E7E7E70073737300737373007373
      7300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000084848400000000008484840000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000C6C6C60000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00B2B2B20077777700B8B8B80091919100DCDCDC00EFEFEF00EAEA
      EA0097979700C1C1C10000000000DCDCDC00D7D7D700C8C8C800B7B7B700B1B1
      B100AAAAAA009D9D9D0090909000808080007171710062626200686868007272
      72007C7C7C0075757500686868005F5F5F006060600068686800696969008787
      8700000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000000084848400C6C6
      C600000000000000000084848400000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373730073737300737373007373
      730000000000E7E7E70073737300737373007373730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000008484
      8400000000008484840000000000848484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00E2E2
      E200CFCFCF008C8C8C00BDBDBD00CBCBCB0095959500C0C0C000D2D2D200E1E1
      E100D5D5D500C6C6C600B3B3B300AAAAAA00A3A3A30096969600888888007A7A
      7A006A6A6A005D5D5D00626262006B6B6B00777777006E6E6E00626262005757
      57005C5C5C006C6C6C0076767600787878000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000848484000000000084848400000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000737373007373730073737300737373007373730000000000E7E7E700E7E7
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000FFFFFF000000000000000000000000008484840000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00CFCFCF00CFCF
      CF0000000000CFCFCF0000000000CFCFCF00CFCFCF00888888009B9B9B00A4A4
      A400AFAFAF00BEBEBE00CBCBCB00D9D9D900CECECE00BEBEBE00ABABAB00A3A3
      A3009C9C9C0090909000828282007474740065656500575757005C5C5C006565
      650070707000686868005C5C5C00525252005555550064646400797979007E7E
      7E00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000008484
      8400000000008484840000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373730073737300737373007373
      7300737373007373730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF0000000000FFFFFF00000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      000000000000CFCFCF00CFCFCF000000000000000000CFCFCF00CFCFCF00CFCF
      CF00000000007D7D7D00959595009D9D9D00A9A9A900B5B5B500C5C5C500D1D1
      D100C5C5C500B6B6B600A4A4A4009B9B9B0095959500898989007B7B7B006E6E
      6E005F5F5F005252520057575700606060006A6A6A0063636300585858004E4E
      4E005252520061616100767676008A8A8A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C6008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000737373007373730073737300737373007373730073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      00000000000000000000000000000000000000000000CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00000000000000000066666600848484009696
      9600A1A1A100AEAEAE00BDBDBD00CACACA00BEBEBE00AFAFAF009D9D9D009595
      95008F8F8F008383830076767600686868005A5A5A004E4E4E00525252005A5A
      5A00656565005E5E5E00545454004D4D4D005555550065656500727272008888
      8800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373730073737300737373007373
      7300737373007373730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000CFCFCF0000000000CFCFCF00CFCFCF000000000000000000CFCF
      CF00CFCFCF0065656500797979008888880099999900AEAEAE00BABABA00BFBF
      BF00B3B3B300A5A5A500949494008A8A8A0083838300777777006B6B6B005E5E
      5E0052525200494949004E4E4E00585858006565650062626200535353003D3D
      3D003F3F3F005151510069696900888888000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007373730073737300737373007373730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF0000000000CFCF
      CF00CFCFCF00CFCFCF000000000000000000CFCFCF0066666600797979008888
      880099999900AFAFAF00C2C2C200DFDFDF00D7D7D700BFBFBF00C8C8C800CACA
      CA00C6C6C600C1C1C100B9B9B900B3B3B300ABABAB00989898007E7E7E006C6C
      6C006B6B6B0051515100444444003A3A3A003F3F3F0050505000696969008888
      8800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073737300737373007373
      7300737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000CFCFCF0000000000CFCFCF0000000000CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00666666007A7A7A008080800093939300C9C9C900D4D4D400CBCB
      CB00BDBDBD00BCBCBC00B8B8B800B6B6B600B5B5B500B2B2B200AEAEAE00AAAA
      AA00A5A5A5009F9F9F009B9B9B00979797009696960091919100828282006868
      6800414141004F4F4F0069696900878787000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C60000000000C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007373730073737300737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00CFCFCF000000
      000000000000CFCFCF00CFCFCF00CFCFCF00CFCFCF00656565007C7C7C00AAAA
      AA00A1A1A100AAAAAA00B1B1B100B8B8B800B5B5B500B2B2B200ADADAD00ABAB
      AB00A9A9A900A5A5A500A1A1A1009D9D9D0097979700929292008E8E8E008B8B
      8B00888888008282820076767600717171005F5F5F006D6D6D00616161008888
      8800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60000000000C6C6
      C60000000000C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000737373007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF007C7C7C007B7B7B0088888800959595009F9F9F00A8A8A800B0B0
      B000ADADAD00A8A8A800A1A1A1009D9D9D009B9B9B0098989800949494009090
      90008A8A8A0084848400818181007E7E7E007D7D7D0076767600696969006060
      6000686868007676760063636300787878000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF0055555500646464007373
      7300828282008E8E8E009A9A9A00A5A5A5009F9F9F00999999008E8E8E008989
      890086868600838383007F7F7F007B7B7B0075757500707070006E6E6E006B6B
      6B006B6B6B0069696900636363005E5E5E00616161006F6F6F00808080006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000CFCFCF00CFCFCF000000000000000000CFCFCF00CFCFCF00CFCF
      CF00000000007A7A7A0055555500656565007373730082828200909090009C9C
      9C00969696008D8D8D00818181007B7B7B007878780075757500717171006D6D
      6D0067676700626262006161610064646400686868006A6A6A00646464006060
      6000696969007979790083838300727272000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00939393006060
      6000686868007777770086868600949494008C8C8C0082828200737373006E6E
      6E006A6A6A006767670063636300606060005D5D5D005C5C5C005F5F5F006464
      640068686800696969006B6B6B00727272007D7D7D00696969009D9D9D00CFCF
      CF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00A9A9A900707070007F7F7F008F8F
      8F00858585007A7A7A006A6A6A00656565006363630060606000606060005F5F
      5F005D5D5D005D5D5D00636363006C6C6C007A7A7A0082828200707070005A5A
      5A00AAAAAA00CFCFCF00CFCFCF00CFCFCF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CFCF
      CF00CFCFCF0000000000CFCFCF00CFCFCF00CFCFCF0000000000CFCFCF000000
      0000CFCFCF00CFCFCF00CFCFCF00DFDFDF00ABABAB007C7C7C00616161006060
      60005F5F5F00606060005F5F5F005E5E5E005B5B5B0058585800595959006D6D
      6D00A0A0A000E1E1E100CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEDEDE00DEDEDE0073737300181818001818180010101000CECECE00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEDEDE00CECECE00A5A5A5000000000018181800000000003131
      31004A4A4A004A4A4A0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00B5B5B500ADADAD00ADADAD0010101000080808000808
      0800292929006B6B6B0042424200313131006B6B6B00ADADAD0073737300D6D6
      D600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C008C8C8C00949494004A4A4A00000000001010
      10000000000008080800212121005A5A5A006B6B6B008C8C8C00ADADAD00D6D6
      D60000000000EFEFEF00A5A5A500393939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B5B5B5007B7B7B0073737300000000001010
      10000808080010101000101010004242420073737300A5A5A50084848400C6C6
      C600DEDEDE00DEDEDE00F7F7F700BDBDBD007B7B7B00FFFFFF00BDBDBD004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFEFEF005A5A5A005A5A5A005A5A5A000808
      0800101010001818180021212100212121006B6B6B00A5A5A500ADADAD00B5B5
      B500E7E7E7000000000000000000FFFFFF00DEDEDE008C8C8C00848484005252
      52001818180073737300BDBDBD008C8C8C008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000525252002929
      290000000000292929002121210029292900181818006363630094949400BDBD
      BD00E7E7E700FFFFFF000000000000000000F7F7F700ADADAD007B7B7B005A5A
      5A00525252003131310018181800424242006B6B6B0029292900B5B5B500ADAD
      AD00525252000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      000000000000C6C6C6000000000000000000C6C6C60000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      00000000000000000000C6C6C6000000000000000000C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF008484840084848400C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000080808004A4A4A00424242002929290052525200D6D6
      D600CECECE00E7E7E700FFFFFF000000000000000000F7F7F700B5B5B5007373
      730052525200393939002929290021212100393939006B6B6B006B6B6B007B7B
      7B00848484006B6B6B005A5A5A00ADADAD009494940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400C6C6C6000000
      000000000000FFFFFF00C6C6C600C6C6C6008484840000000000C6C6C6008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000212121007373
      730052525200ADADAD00F7F7F700000000000000000000000000F7F7F700BDBD
      BD00737373004A4A4A003939390031313100292929006B6B6B00949494007373
      7300737373007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B0042424200BDBD
      BD00848484005A5A5A00F7F7F700000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000C6C6C60000000000C6C6C60000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF00C6C6
      C600C6C6C6008484840000000000848484000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      00000000000000000000212121006B6B6B008484840000000000F7F7F700E7E7
      E700BDBDBD0073737300424242003131310039393900313131005A5A5A009494
      94008C8C8C00949494008C8C8C009C9C9C007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B006B6B6B0052525200B5B5B500212121007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000084848400848484008484
      8400000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60000000000C6C6C60000000000FFFFFF00C6C6C600C6C6C600848484000000
      0000C6C6C600C6C6C600C6C6C600000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000080808005A5A
      5A0094949400DEDEDE006B6B6B00212121003939390042424200424242004A4A
      4A009494940094949400949494008C8C8C00949494008C8C8C00949494007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B00737373004242
      4200C6C6C600848484009C9C9C00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      00000000000000000000C6C6C60000000000C6C6C60000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000C6C6C60000000000C6C6C60000000000C6C6
      C600000000000000000000000000000000008484840084848400848484008484
      8400000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C6000000
      0000FFFFFF00C6C6C600C6C6C6008484840000000000C6C6C600000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00000000005A5A5A004A4A4A00424242005252
      5200737373008C8C8C009C9C9C0094949400949494008C8C8C008C8C8C009494
      94008C8C8C00949494007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B008484
      8400848484007B7B7B00737373004A4A4A00848484009C9C9C006B6B6B00D6D6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000848484008484840084848400848484000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000848484008484
      8400000000008484840000000000848484000000000084848400000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000C6C6C60000000000FFFFFF00C6C6C600C6C6
      C6008484840000000000FFFFFF00000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005252
      520000000000737373008C8C8C009C9C9C008C8C8C009C9C9C00848484009C9C
      9C0084848400949494008C8C8C008C8C8C008C8C8C007B7B7B007B7B7B007B7B
      7B0084848400848484006B6B6B00525252004A4A4A0073737300848484006B6B
      6B0052525200CECECE0039393900949494000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C60000000000C6C6
      C600000000000000000000000000C6C6C6000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000C6C6C600000000000000000000000000C6C6C6000000000000000000C6C6
      C600000000000000000000000000000000008484840084848400848484008484
      8400000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C60000000000FFFFFF00C6C6C600C6C6C60084848400000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CECECE00101010009C9C9C00949494008C8C
      8C00949494008C8C8C00949494008C8C8C00949494008C8C8C00949494008484
      84007B7B7B00848484008C8C8C007B7B7B004A4A4A004A4A4A00525252005A5A
      5A000000000063636300848484006B6B6B0042424200BDBDBD009C9C9C005A5A
      5A00CECECE000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C60000000000FFFF
      FF00C6C6C600C6C6C6008484840000000000C6C6C60000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFEF
      EF00737373005252520094949400949494008C8C8C00949494008C8C8C009494
      94008C8C8C009494940084848400848484005252520042424200212121002929
      29005A5A5A00525252006B6B6B008C8C8C006363630031313100737373007B7B
      7B005252520073737300CECECE0042424200ADADAD0000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      00000000000000000000C6C6C600000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000C6C6C600000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000C6C6C60000000000FFFFFF00C6C6C600C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0018181800A5A5A5008C8C
      8C00949494008C8C8C00949494008C8C8C009C9C9C006B6B6B00393939004242
      42005A5A5A0063636300525252005A5A5A008484840084848400848484007B7B
      7B008C8C8C00101010006B6B6B0084848400636363005A5A5A00DEDEDE008C8C
      8C00CECECE000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6
      C60000000000FFFFFF00C6C6C600C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F7006B6B6B00393939009C9C9C008C8C8C00949494007B7B7B004242
      420042424200525252006B6B6B00636363007B7B7B00848484008C8C8C006B6B
      6B00101010001818180010101000101010006363630073737300212121007373
      73007B7B7B005252520084848400ADADAD0031313100CECECE00000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      000000000000C6C6C6000000000000000000C6C6C60000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      00000000000000000000C6C6C6000000000000000000C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      000000000000C6C6C6000000000000000000C6C6C60000000000FFFFFF00C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094949400424242009494
      9400949494008484840021212100737373007373730042424200101010001818
      1800636363008C8C8C006B6B6B00101010000000000000000000000000004A4A
      4A008484840084848400101010007B7B7B0084848400525252006B6B6B00D6D6
      D6005A5A5A00C6C6C60000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400000000008484840000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      000000000000000000000000000000000000C6C6C600C6C6C600000000000000
      000000000000C6C6C60000000000FFFFFF0000000000C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0063636300525252009C9C9C008C8C8C00393939008484
      84005A5A5A0000000000525252009C9C9C00636363005A5A5A00000000001818
      18008C8C8C00080808002929290073737300636363005A5A5A00424242006B6B
      6B0084848400636363004A4A4A00ADADAD00A5A5A50063636300EFEFEF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400000000000000000000000000000000008484840084848400848484000000
      0000000000008484840084848400000000008484840000000000848484000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600000000000000
      000000000000C6C6C6000000000000000000C6C6C60000000000C6C6C6000000
      0000FFFFFF00C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949494003939
      39008C8C8C008C8C8C004A4A4A007373730063636300181818005A5A5A00BDBD
      BD0052525200181818001818180031313100BDBDBD0084848400101010000000
      00001010100021212100636363001010100084848400848484004A4A4A006B6B
      6B00D6D6D60031313100E7E7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000084848400848484008484840084848400000000000000
      0000848484008484840000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000C6C6C60000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000C6C6C60000000000FFFFFF00C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004242420052525200A5A5A500848484003131
      310084848400848484008C8C8C006B6B6B009C9C9C00949494008C8C8C008484
      84004A4A4A009494940063636300181818007B7B7B008C8C8C00737373003131
      31005A5A5A0084848400636363004A4A4A00A5A5A50073737300CECECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000848484000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C6000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C60000000000FFFFFF0000000000C6C6C60084848400000000000000
      000000000000000000000000000000000000000000000000000000000000A5A5
      A50052525200848484008C8C8C00636363006B6B6B0063636300424242000000
      0000101010004242420042424200292929000808080052525200212121001818
      1800393939006B6B6B00848484006B6B6B002121210084848400848484004242
      42008C8C8C00B5B5B50042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400000000008484840000000000000000008484840000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000008484840084848400000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000C6C6C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6008484840000000000C6C6C60000000000C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      000000000000000000000000000000000000292929006B6B6B009C9C9C007B7B
      7B00424242007373730008080800292929006363630000000000000000003939
      39006B6B6B00949494004242420039393900393939006B6B6B00848484007373
      73004A4A4A0084848400848484004242420073737300CECECE00393939000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000008484840084848400848484000000
      00000000000000000000C6C6C600C6C6C6000000000000000000000000000000
      0000C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C6000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C6000000000084848400FFFFFF00C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60039393900848484008C8C8C0052525200636363006B6B6B007373
      7300B5B5B5007B7B7B005A5A5A0084848400848484009C9C9C00B5B5B5009494
      94008C8C8C00848484004A4A4A0042424200313131005A5A5A00848484007373
      730042424200A5A5A50084848400000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484000000000084848400848484008484
      8400000000008484840000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000084848400000000000000000000000000C6C6C6000000
      000000000000C6C6C600C6C6C6000000000000000000C6C6C600000000000000
      0000C6C6C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000008484840000000000000000008484
      8400FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029292900848484009494
      94007B7B7B00424242008C8C8C007B7B7B007B7B7B00ADADAD008C8C8C007B7B
      7B007B7B7B007B7B7B008C8C8C005A5A5A003939390042424200424242004242
      4200393939004A4A4A0084848400848484004242420073737300C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484000000000000000000848484008484
      8400848484008484840084848400848484000000000084848400000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      000000000000C6C6C6000000000000000000C6C6C600C6C6C600C6C6C6000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6D6D60031313100949494008C8C8C006B6B6B00525252008484
      84007B7B7B007B7B7B007B7B7B006B6B6B003939390039393900393939004242
      42004A4A4A004A4A4A0094949400949494004A4A4A00424242005A5A5A008484
      84007373730042424200BDBDBD00000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000848484008484
      8400000000008484840000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C6000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00313131007373
      73009C9C9C005A5A5A004A4A4A007B7B7B007373730039393900313131003939
      39004A4A4A00525252004A4A4A00848484008C8C8C008C8C8C00636363007373
      7300424242003131310052525200848484007B7B7B0042424200737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      00000000000000000000C6C6C600C6C6C6000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEDEDE00080808009C9C9C009C9C9C00525252002929
      29003939390052525200636363004A4A4A006B6B6B00A5A5A5008C8C8C008C8C
      8C00636363004242420042424200393939003939390039393900737373009494
      94007B7B7B007B7B7B0042424200000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840000000000000000008484
      8400848484008484840000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000C6C6C6000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E7005252
      52007B7B7B00949494007B7B7B0042424200424242009C9C9C008C8C8C005A5A
      5A007B7B7B005252520052525200393939003939390042424200424242005A5A
      5A007B7B7B0094949400949494009C9C9C009494940084848400292929000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484000000000000000000000000008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      00000000000000000000C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CECECE0008080800A5A5A5009C9C9C005252
      5200393939007B7B7B004A4A4A00393939003131310039393900525252005252
      5200525252007B7B7B00949494009C9C9C009C9C9C009C9C9C00A5A5A5006363
      6300313131003131310063636300000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      000000000000C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7E7
      E700636363005A5A5A009C9C9C006B6B6B003939390029292900393939005252
      5200636363006B6B6B009C9C9C00949494009C9C9C009C9C9C009C9C9C006363
      6300313131002929290039393900525252007373730073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C6000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0018181800A5A5A5009C9C
      9C006B6B6B006B6B6B00636363009C9C9C00949494009C9C9C009C9C9C009C9C
      9C00737373003939390018181800181818008C8C8C008C8C8C0084848400DEDE
      DE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7E7E700737373005A5A5A00949494009C9C9C009C9C9C00A5A5A5009494
      940094949400424242001818180021212100080808008C8C8C00ADADAD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009494940021212100A5A5
      A500737373002121210021212100181818001818180052525200C6C6C600C6C6
      C600CECECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7F7007B7B7B002121210010101000BDBDBD00DEDEDE00DEDE
      DE00DEDEDE00F7F7F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840000000000848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000084848400848484000000
      0000000000000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000181818000000
      0000000000001818180018181800000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000848484008484
      8400000000000000000000000000848484008484840000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001818180018181800181818001818180000000000181818001818
      1800181818000000000000000000000000000000000000000000000000000000
      0000000000008484840039393900000000008484840039393900393939000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000008484840084848400000000000000
      0000000000008484840084848400000000000000000000000000848484000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018181800181818001818
      1800181818000000000018181800181818001818180000000000000000000000
      0000000000000000000000000000000000000000000084848400393939000000
      0000848484003939390039393900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000848484008484840000000000000000000000000084848400848484000000
      0000000000000000000084848400848484000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000848484008484
      8400000000008484840084848400000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B
      7B00FFFFFF007B7B7B007B7B7B007B7B7B007B7B7B0000000000000000000000
      000000000000FFFFFF00FFFFFF007B7B7B00FFFFFF007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001818180018181800181818001818180000000000181818001818
      1800181818000000000000000000000000000000000000000000000000000000
      0000000000000000000039393900000000000000000039393900393939000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000848484008484840000000000000000000000
      0000848484008484840000000000000000000000000084848400848484000000
      0000000000000000000084848400848484008484840000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF007B7B7B00FFFFFF007B7B7B00FFFF
      FF007B7B7B00FFFFFF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B00000000007B7B7B0000000000FFFFFF00FFFFFF007B7B7B007B7B
      7B00000000007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018181800181818001818
      1800181818000000000018181800181818001818180000000000000000000000
      0000000000000000000000000000000000000000000039393900393939000000
      0000393939003939390039393900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000848484000000000000000000000000000000
      0000848484000000000000000000000000008484840084848400000000000000
      0000000000008484840084848400000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000848484008484
      8400848484008484840000000000000000000000000084848400848484000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B0000000000FFFF
      FF00FFFFFF0000000000FFFFFF007B7B7B00FFFFFF007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000001818180018181800181818001818180000000000181818001818
      1800181818000000000000000000000000000000000000000000000000000000
      0000000000003939390039393900000000003939390039393900393939000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B007B7B7B007B7B7B00FFFFFF00C6C6
      C600FFFFFF00C6C6C6007B7B7B00C6C6C6007B7B7B007B7B7B007B7B7B007B7B
      7B00000000007B7B7B007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000018181800181818001818
      1800181818000000000018181800181818001818180000000000000000000000
      0000000000000000000000000000000000000000000084848400393939000000
      0000848484003939390039393900000000000000000039393900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000084848400000000000000000000000000848484008484
      8400848484008484840084848400000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B0000000000FFFFFF007B7B7B00FFFFFF007B7B
      7B00FFFFFF00FFFFFF007B7B7B007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B
      7B00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000001818180018181800181818001818180000000000181818001818
      1800181818000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000003939390000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF007B7B7B00FFFFFF007B7B
      7B00FFFFFF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B000000
      0000FFFFFF007B7B7B00FFFFFF007B7B7B007B7B7B00FFFFFF007B7B7B00FFFF
      FF00FFFFFF00FFFFFF007B7B7B007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000018181800181818001818
      1800181818000000000018181800181818001818180000000000000000000000
      0000000000000000000000000000000000008484840018181800181818001818
      1800181818001818180018181800848484000000000039393900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400000000008484840084848400000000000000
      00000000000000000000000000000000000000000000FFFFFF007B7B7B00FFFF
      FF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B0000000000FFFFFF007B7B7B00FFFFFF007B7B
      7B007B7B7B007B7B7B00FFFFFF00FFFFFF00FFFFFF007B7B7B007B7B7B007B7B
      7B00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000001818180018181800181818001818180000000000181818001818
      1800181818000000000000000000000000000000000000000000000000000000
      0000848484001818180018181800181818001818180018181800181818008484
      8400000000003939390000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000008484840084848400848484008484840084848400848484000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000848484008484840000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF007B7B7B00FFFFFF007B7B7B007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007B7B7B00FFFFFF007B7B7B0000000000000000000000
      0000000000000000000000000000393939000000000084848400181818001818
      1800181818008484840018181800181818001818180000000000000000000000
      0000000000000000000000000000393939008484840018181800181818001818
      1800181818001818180018181800848484000000000039393900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B00000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000848484008484
      8400848484008484840084848400000000008484840084848400000000000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      00000000000000000000FFFFFF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B
      7B007B7B7B007B7B7B007B7B7B0000000000FFFFFF007B7B7B00FFFFFF007B7B
      7B007B7B7B007B7B7B00FFFFFF00FFFFFF0000000000FFFFFF007B7B7B007B7B
      7B00FFFFFF000000000000000000000000000000000000000000393939003939
      3900848484001818180018181800181818001818180018181800181818001818
      1800181818008484840000000000393939000000000000000000393939003939
      3900848484001818180018181800181818001818180018181800181818000000
      0000848484003939390000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF007B7B7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000FFFFFF007B7B7B00FFFFFF007B7B7B00FFFF
      FF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B007B7B7B007B7B7B000000
      0000FFFFFF007B7B7B00FFFFFF007B7B7B007B7B7B007B7B7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007B7B7B00FFFFFF007B7B7B0000000000000000000000
      0000000000000000000000000000000000008484840018181800181818001818
      1800181818001818180018181800181818001818180084848400393939003939
      3900848484000000000000000000848484004242420042424200424242004242
      4200424242004242420042424200000000008484840000000000000000003939
      3900000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000848484000000
      0000000000008484840084848400000000008484840084848400000000000000
      0000000000000000000000000000000000007B7B7B00000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B0000000000FFFFFF007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B00FFFFFF00FFFFFF00FFFFFF007B7B7B00FFFFFF007B7B
      7B00FFFFFF000000000000000000000000000000000000000000181818001818
      1800848484001818180018181800181818001818180018181800181818001818
      1800181818008484840000000000848484000000000000000000000000000000
      0000424242004242420042424200181818004242420042424200424242000000
      0000848484000000000039393900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B0000000000FFFF
      FF00FFFFFF000000000000000000000000007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840000000000000000008484
      8400848484000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000848484000000000084848400848484000000
      0000848484008484840000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000FFFFFF00C6C6
      C600C6C6C600C6C6C6007B7B7B00C6C6C6007B7B7B00C6C6C6007B7B7B000000
      0000FFFFFF00FFFFFF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000018181800181818008484840018181800181818001818
      1800181818001818180018181800181818001818180084848400181818001818
      1800000000000000000042424200424242001818180042424200424242004242
      4200424242004242420042424200181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484000000000000000000000000008484840084848400000000008484
      840084848400848484008484840000000000000000000000000000000000FFFF
      FF00000000008484840084848400000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF007B7B7B007B7B
      7B00FFFFFF007B7B7B007B7B7B007B7B7B007B7B7B00FFFFFF00FFFFFF007B7B
      7B00000000000000000000000000000000000000000000000000181818001818
      1800848484001818180018181800181818001818180042424200181818001818
      1800181818000000000018181800181818000000000000000000424242004242
      4200181818004242420042424200424242004242420042424200424242001818
      1800424242000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B0000000000FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000008484840084848400848484000000
      0000000000000000000084848400000000000000000084848400848484000000
      0000848484008484840000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B00000000000000000000000000FFFF
      FF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B00FFFF
      FF0000000000FFFFFF00FFFFFF007B7B7B007B7B7B007B7B7B007B7B7B000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000018181800181818001818180018181800181818008484
      8400848484004242420084848400181818001818180084848400181818001818
      1800000000000000000042424200424242001818180042424200424242000000
      0000424242004242420042424200181818004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000848484008484
      8400000000008484840084848400000000000000000000000000848484008484
      8400848484008484840084848400000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B
      7B00FFFFFF007B7B7B00FFFFFF007B7B7B00FFFFFF0000000000FFFFFF00FFFF
      FF007B7B7B007B7B7B00FFFFFF007B7B7B00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000848484001818
      1800181818001818180018181800000000000000000042424200000000001818
      1800181818001818180018181800181818000000000000000000424242004242
      4200181818004242420042424200000000004242420042424200424242004242
      4200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000848484000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000848484008484840000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B000000000000000000FFFFFF007B7B7B007B7B7B007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818001818180018181800181818000000
      0000000000004242420000000000181818001818180018181800181818008484
      8400000000000000000042424200424242001818180042424200000000000000
      0000000000004242420042424200424242000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000848484000000000084848400000000000000000000000000848484008484
      8400848484008484840084848400000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00C6C6C6007B7B
      7B00C6C6C6007B7B7B00C6C6C6007B7B7B00C6C6C6007B7B7B00000000000000
      0000000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001818
      1800181818001818180018181800000000000000000042424200000000001818
      1800181818001818180018181800000000000000000000000000424242004242
      4200424242004242420084848400000000008484840000000000000000004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0042424200424242004242
      4200424242004242420018181800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000848484000000000084848400848484000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818001818180018181800181818000000
      0000000000004242420000000000181818001818180018181800181818000000
      0000000000000000000042424200424242004242420000000000000000004242
      4200000000000000000000000000424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000848484000000
      0000848484008484840084848400000000000000000000000000848484008484
      8400848484008484840084848400000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B00C6C6C600000000000000000000000000FFFFFF007B7B
      7B00FFFFFF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B
      7B00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001818
      1800181818001818180018181800000000000000000042424200000000001818
      1800181818001818180084848400000000000000000000000000848484004242
      4200424242000000000000000000424242000000000000000000000000004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00424242004242420042424200424242004242420042424200424242004242
      4200FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000848484008484840084848400848484000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B0000000000FFFF
      FF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B00FFFF
      FF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001818180018181800000000000000
      0000000000000000000000000000181818001818180084848400000000000000
      0000000000000000000000000000848484004242420000000000424242000000
      0000424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009494940094949400949494009494
      940094949400949494009494940042424200FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000848484008484
      8400848484008484840084848400000000000000000000000000848484008484
      8400848484008484840084848400000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B007B7B7B007B7B7B00000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000393939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840084848400848484008484840084848400848484000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000848484008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B00FFFF
      FF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B0000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000393939003939
      3900393939000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF004242
      4200424242004242420042424200424242004242420042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000084848400848484008484
      8400848484008484840084848400848484000000000000000000000000008484
      8400848484008484840084848400000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B00FFFFFF007B7B
      7B00FFFFFF007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400393939003939390039393900393939008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000039393900393939003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00949494009494940094949400949494009494
      94009494940042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000008484840084848400848484000000
      0000848484008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003939
      3900393939003939390039393900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003939
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000008484840084848400000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B007B7B7B007B7B7B00FFFFFF007B7B
      7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00181818001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000848484000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B00FFFF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF004242
      4200424242004242420042424200424242004242420042424200424242004242
      42004242420018181800FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084A5A50084848400426363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084A5A5008484840084848400426363000021
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000212121002121210021212100212121002121210021212100212121002121
      2100212121002121210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084A5A50084848400848484004263
      6300426363004263630042636300426363000021210042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADADAD0000000000ADADAD00ADADAD00A5A5A50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021212100000000002121
      2100212121002121210021212100212121002121210021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084A5A5008484
      8400848484004263630042636300426363004263630042636300426363004263
      6300424242000021210084A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5A5A50029292900292929007B7B7B007B7B7B007B7B7B005A5A5A002929
      2900292929002929290029292900292929003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000212121000000000021212100000000002121210021212100212121002121
      2100212121002121210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084A5A5008484
      8400426363004263630042636300426363008484840042636300426363004263
      6300426363004263630042636300426363004263630042636300002121008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400424242005A5A5A0029292900424242006363
      6300848484005A5A5A0039393900424242002929290029292900292929002929
      2900292929005A5A5A0039393900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009494940000000000949494000000000094949400CECECE00CECECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084A5A5008484840084848400426363004263630042636300848484008484
      8400000000004263630042636300426363004242420042636300426363004263
      6300426363004263630042424200002121000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C005A5A5A005A5A
      5A0042424200393939006B6B6B008C8C8C00424242005A5A5A00292929002929
      29005A5A5A002929290039393900424242003939390029292900292929006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000949494000000000000000000949494000000000094949400000000009494
      9400000000009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084A5A50084A5A50084848400426363008484840042636300426363008484
      8400000000000000000000000000000000000000000084A5A5008484840084A5
      A50084A5A5004242420042636300426363004263630042636300426363004263
      63004242420084A5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A00424242007B7B7B00A5A5A5006B6B6B00393939004242
      4200101010001010100000000000000000000000000000000000101010002929
      2900000000000000000029292900101010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094949400000000009494940000000000CECE
      CE00949494000000000094949400CECECE009494940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084A5A5008484840084848400426363004263
      6300426363004263630084848400000000000000000000000000000000000000
      00000000000084A5A50084A5A50084A5A50084A5A50042424200424242004263
      630042636300426363004263630042636300424242004242420084A5A5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840029292900424242007B7B
      7B00D6D6D600A5A5A50042424200292929002929290010101000000000000000
      0000000000001010100029292900292929000000000000000000101010002929
      2900393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009494940094949400949494000000
      00000000000000000000CECECE0094949400CECECE0094949400949494009494
      9400000000009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400426363004263630042636300426363004263630042636300848484000000
      000084A5A5000000000000000000000000000000000084A5A50084A5A50084A5
      A50084A5A5004242420042424200426363004263630042636300426363004242
      4200426363004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B6B6B0010101000292929007B7B7B00D6D6D600A5A5A500424242002929
      2900292929001010100000000000000000001010100010101000101010001010
      1000000000000000000000000000292929001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000094949400949494009494940094949400949494000000000000000000CECE
      CE00949494009494940094949400949494009494940000000000636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484004263630042636300426363004263
      6300426363008484840084848400000000004263630042424200424242004263
      63004263630084A5A50084A5A5000000000084A5A50000212100424242004242
      4200426363008484840042636300424242004263630042636300426363004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ADADAD002929290010101000424242003939
      3900D6D6D600ADADAD008C8C8C007B7B7B007B7B7B005A5A5A006B6B6B006B6B
      6B006B6B6B005A5A5A0029292900101010000000000000000000292929000000
      000000000000A5A5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009494940094949400949494009494
      9400949494009494940094949400949494000000000094949400949494000000
      0000000000006363630063636300636363006363630094949400949494009494
      9400949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484004263630042636300426363004263630084A5A50084A5A50084A5
      A500426363004242420042636300424242004263630084A5A50084A5A50084A5
      A50084A5A5000021210042424200424242004263630084848400426363004242
      42004242420042636300424242004242420084A5A50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000101010006B6B6B00A5A5A5007B7B7B0000000000D6D6D600A5A5
      A500ADADAD007B7B7B007B7B7B007B7B7B006B6B6B0042424200424242002929
      2900393939005A5A5A0010101000000000001010100039393900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009494940000000000CECECE00949494009494940094949400949494009494
      9400949494000000000000000000636363006363630063636300636363006363
      6300636363006363630084848400FFFFFF008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000000000000000000000000000000000007B7B
      7B0000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B0000000000000000007B7B7B007B7B7B000000
      0000000000000000000000000000000000007B7B7B007B7B7B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000004242
      42004263630084A5A50084A5A500000000004263630042424200426363004263
      63004263630084A5A50084A5A50084A5A5000000000042424200424242004242
      4200424242008484840042636300426363008484840042636300424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      00000000000000000000000000005A5A5A007B7B7B00000000005A5A5A00A5A5
      A5005A5A5A00A5A5A500ADADAD008C8C8C007B7B7B005A5A5A00424242006B6B
      6B005A5A5A0029292900424242006B6B6B004242420029292900292929006363
      63006B6B6B001010100000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009494940000000000CECE
      CE00000000009494940094949400949494009494940094949400949494000000
      0000636363006363630063636300636363006363630063636300FFFFFF008484
      8400FFFFFF008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00848484000000000000000000000000008484
      8400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084A5A50084A5A50084A5
      A500426363004242420042636300426363004263630084A5A50084A5A50084A5
      A50084A5A5004242420042424200424242004242420042424200424242004263
      630084848400426363004242420042636300424242004242420084A5A5000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B005A5A5A00A5A5A500292929008C8C8C002929290000000000ADADAD000000
      00005A5A5A0063636300636363008C8C8C0042424200292929005A5A5A007B7B
      7B00A5A5A5002929290029292900292929001010100039393900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000949494000000000094949400CECECE009494940094949400949494009494
      9400000000009494940094949400636363000000000063636300636363006363
      6300636363006363630063636300636363006363630063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400848484000000000000000000FFFFFF00000000000000
      00008484840084848400848484000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084A5A5000000000084A5A5004263630000212100002121004242
      4200426363000000000084A5A50084A5A5000000000042424200424242004242
      4200424242004242420042424200424242008484840042636300424242004263
      6300426363004242420042424200002121000000000000000000000000000000
      00000000000000000000000000005A5A5A00393939007B7B7B0029292900A5A5
      A50029292900ADADAD0000000000C6C6C6007B7B7B007B7B7B00424242008C8C
      8C003939390039393900636363007B7B7B008484840029292900292929001010
      1000101010002929290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094949400949494009494
      940094949400949494009494940094949400949494009494940084848400FFFF
      FF00848484000000000063636300636363006363630063636300636363006363
      6300636363006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000084848400000000000000000000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084A5A50084A5A50084A5
      A500426363000021210000212100002121004263630084A5A5000000000084A5
      A500000000004242420042636300424242004242420042424200424242004242
      4200848484004263630042424200426363004263630042636300426363004242
      420084A5A5000000000000000000000000000000000000000000000000007B7B
      7B00292929007B7B7B00393939008C8C8C00393939008C8C8C0000000000D6D6
      D6007B7B7B007B7B7B00ADADAD007B7B7B005A5A5A00424242005A5A5A006363
      63008C8C8C003939390029292900292929000000000029292900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000094949400CECECE0000000000CECECE009494940094949400949494009494
      940094949400949494009494940084848400FFFFFF0084848400000000006363
      6300636363006363630063636300636363006363630063636300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003939390039393900393939003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      39003939390039393900393939000000000000000000FFFFFF00000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084A5A50084A5A50084A5A5004263630000212100424242004263
      630084A5A50000000000000000000000000084A5A50042424200424242004263
      6300424242004242420042424200424242004242420042424200424242004263
      6300426363004263630042424200424242008484840000000000000000000000
      00000000000000000000000000006363630029292900A5A5A500424242008C8C
      8C002929290000000000D6D6D60000000000ADADAD00A5A5A500A5A5A5007B7B
      7B00424242005A5A5A00424242005A5A5A00EFEFEF0029292900292929002929
      2900000000002929290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE009494
      9400000000009494940094949400949494009494940094949400949494009494
      940094949400FFFFFF0084848400000000006363630063636300636363006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084A5A50084A5A5000000
      000084A5A5000000000000000000000000000000000042636300426363000000
      0000000000004242420042424200424242004242420042424200424242004242
      4200424242004242420042424200848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C8C
      8C00393939000000000039393900A5A5A500393939000000000000000000ADAD
      AD00C6C6C6008C8C8C00C6C6C6007B7B7B002929290042424200424242006B6B
      6B007B7B7B002929290029292900292929000000000039393900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CECECE0000000000CECECE009494940000000000949494009494
      9400949494009494940094949400000000000000000094949400949494009494
      9400000000006363630063636300636363006363630063636300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484009494
      9400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084A5A50000000000000000000000000084A5
      A500000000000021210042424200000000000000000042424200424242004263
      6300424242004242420042636300002121004242420042424200424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484005A5A5A00000000005A5A5A00EFEF
      EF0039393900D6D6D60000000000A5A5A500A5A5A500C6C6C6008C8C8C005A5A
      5A00393939006363630042424200424242008C8C8C0029292900292929002929
      29000000000039393900ADADAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE000000
      0000CECECE009494940094949400949494009494940094949400000000000000
      0000949494009494940094949400949494009494940000000000636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084A5A50084A5A5004242
      4200000000000000000084A5A500000000000000000000212100426363000000
      000084A5A5004242420042636300426363004242420042424200426363004242
      4200424242004242420042424200000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A5A5
      A5005A5A5A00C6C6C60039393900D6D6D6005A5A5A000000000000000000A5A5
      A500A5A5A50000000000A5A5A5007B7B7B008C8C8C005A5A5A00424242005A5A
      5A007B7B7B002929290029292900292929001010100042424200C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CECECE0000000000CECECE00949494009494
      9400949494000000000000000000949494009494940094949400949494009494
      9400000000000000000000000000636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484009494
      9400000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00848484000000000000000000FFFFFF00000000008484
      8400FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004242420000000000000000000000000084A5
      A5000000000042636300426363000000000084A5A50042424200424242004263
      6300424242000021210042424200424242004242420042636300424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C8C8C008C8C8C00C6C6C600393939000000
      00006B6B6B00D6D6D6000000000000000000000000007B7B7B00A5A5A5006363
      630039393900424242007B7B7B005A5A5A007B7B7B0042424200292929002929
      2900000000004242420000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE00000000000000000094949400949494009494940094949400848484009494
      9400949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400949494000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004263
      63000000000000000000000000000000000000000000000000000000000084A5
      A500000000000000000084A5A500848484004242420000212100426363004242
      4200424242008484840042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005A5A
      5A0000000000D6D6D60039393900D6D6D6007B7B7B00D6D6D600ADADAD000000
      0000A5A5A5008C8C8C0084848400ADADAD0039393900636363008C8C8C005A5A
      5A005A5A5A004242420029292900292929002929290029292900ADADAD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949494009494
      9400FFFFFF0084848400FFFFFF00949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484009494
      94000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000426363000000000000000000000000000000
      00000000000000000000000000000000000000000000426363008484840084A5
      A500424242000021210042636300424242004242420084848400424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000002929290000000000ADADAD0042424200FFFF
      FF0000000000FFFFFF00D6D6D600D6D6D600A5A5A500A5A5A500ADADAD008C8C
      8C007B7B7B008C8C8C00A5A5A500292929006B6B6B0042424200000000002929
      2900292929002929290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0084848400FFFFFF00636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094949400949494009494
      9400949494009494940094949400949494000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084A5A5000000000084A5
      A50084A5A500000000000000000000000000000000000000000084A5A5000000
      00000000000000212100424242004263630084A5A50084848400426363004242
      4200002121008484840042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      420000000000000000006B6B6B0039393900EFEFEF00ADADAD005A5A5A002929
      29002929290029292900101010004242420010101000101010007B7B7B000000
      000000000000292929002929290039393900292929005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300FFFFFF0084848400FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084A5A50084A5A5000000000084A5A5000000000084A5A500000000000000
      00000000000084A5A5000000000084A5A5004242420042424200002121000021
      210000212100424242008484840084A5A5004242420084848400424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C8C8C00393939002929290042424200ADAD
      AD00ADADAD008C8C8C007B7B7B00393939001010100039393900101010002929
      2900101010002929290029292900292929002929290000000000000000000000
      0000292929008C8C8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0063636300FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084A5A5000000000084A5A50084A5A5000000
      00000000000084A5A50000000000000000000000000000000000000000004242
      4200002121000021210000212100002121004242420000212100424242008484
      840084A5A5008484840042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002929
      2900292929005A5A5A0042424200A5A5A500EFEFEF0000000000ADADAD004242
      4200292929002929290010101000101010000000000010101000101010003939
      3900292929000000000000000000292929001010100039393900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084A5A50084A5A5000000000000000000000000000000
      000084A5A5000000000042636300002121004242420000212100002121000021
      2100002121000021210000212100002121000021210042636300848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006B6B6B002929290029292900A5A5A500A5A5
      A500FFFFFF00C6C6C600A5A5A500393939002929290039393900292929003939
      39001010100042424200292929005A5A5A002929290000000000101010002929
      290029292900A5A5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000094949400949494000000000000000000FFFFFF00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084A5
      A500000000000000000084A5A50084A5A5000000000084848400002121000021
      2100002121000021210000212100002121000021210000212100002121000021
      2100424242000021210000212100848484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ADAD
      AD0000000000292929005A5A5A00A5A5A500EFEFEF008C8C8C006B6B6B00ADAD
      AD00C6C6C600D6D6D600EFEFEF00D6D6D600D6D6D6006B6B6B00A5A5A5004242
      42001010100042424200393939005A5A5A001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009494940094949400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084A5A500848484000000000084A5A5000000000084A5A5000000
      0000000000000021210000212100002121000021210000212100002121000021
      2100002121000021210000212100002121000021210000212100424242000021
      2100000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000029292900393939008C8C8C000000
      0000FFFFFF005A5A5A00EFEFEF000000000000000000EFEFEF00D6D6D600D6D6
      D600D6D6D6007B7B7B005A5A5A00424242005A5A5A00ADADAD00393939002929
      2900424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009494940094949400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000084A5A50084A5A50000000000000000000021210000212100002121000021
      2100002121000021210000212100002121000021210000212100002121000021
      2100002121000021210000212100426363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C8C8C007B7B7B000000000000000000FFFFFF005A5A5A00000000000000
      0000ADADAD00A5A5A50000000000A5A5A5000000000084848400393939007B7B
      7B0039393900A5A5A50029292900848484003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0094949400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084A5A5000000000084A5A500000000000000
      0000002121000021210000212100424242000021210000212100002121000021
      2100002121000021210000212100002121000021210000212100002121000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000393939008C8C8C000000
      00008C8C8C008C8C8C00ADADAD00C6C6C600ADADAD000000000000000000ADAD
      AD00C6C6C6008C8C8C008C8C8C00D6D6D600424242005A5A5A00424242002929
      2900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084A5A500002121000021210042424200002121000021
      2100002121000021210000212100002121000021210000212100002121000021
      2100002121000021210084A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500A5A5A500393939005A5A5A0000000000D6D6D600C6C6
      C600D6D6D600EFEFEF00EFEFEF00FFFFFF00FFFFFF0000000000000000000000
      0000EFEFEF00A5A5A500C6C6C6007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000002121000021
      2100002121000021210042424200002121000021210000212100002121000021
      2100002121000021210000212100002121000021210084A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5001010
      1000101010005A5A5A008C8C8C00A5A5A500A5A5A5008C8C8C0000000000C6C6
      C600EFEFEF005A5A5A008C8C8C008C8C8C00ADADAD00D6D6D6008C8C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400426363000021210000212100002121000021
      2100002121000021210042424200002121000021210000212100002121000021
      2100426363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500A5A5A5006B6B6B006363
      63005A5A5A006B6B6B00393939006B6B6B00000000003939390063636300A5A5
      A50000000000A5A5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840042424200002121000021210000212100002121000021
      2100002121000021210000212100002121000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00ADAD
      AD00C6C6C600ADADAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840042424200424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003131310018181800181818001818180031313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242000808
      08005A5A5A00ADADAD00BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00ADADAD005A5A5A0008080800424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B6B6B00313131000000000000000000313131006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B0031313100313131000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000424242000000000042424200000000004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004242420008080800000000000808080042424200BDBD
      BD00BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000424242000000000042424200000000004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042424200BDBDBD00ADADAD00424242000808080000000000080808004242
      4200000000000000000000000000000000000000000000000000000000004242
      4200000000004242420000000000424242000000000000000000000000000000
      0000000000000000000000000000000000006B6B6B006B6B6B00313131003131
      31006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B00313131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000042424200000000004242
      4200000000004242420000000000424242000000000042424200000000000000
      0000000000000000000000000000000000004242420000000000181818004242
      42004A4A4A0000000000000000005A5A5A00B5B5B500BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242000000000042424200000000004242420000000000424242000000
      0000424242000000000000000000000000000000000000000000000000004242
      420000000000424242000000000042424200BDBDBD004A4A4A00212121000000
      0000000000004A4A4A0042424200525252000000000000000000000000000000
      0000000000000000000000000000000000004242420000000000424242000000
      0000424242000000000042424200000000004242420000000000000000000000
      00006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B0052525200DEDEDE00CECE
      CE00DEDEDE00DEDEDE00525252006B6B6B006B6B6B0031313100000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242000000
      0000424242000000000042424200000000000000000042424200000000004242
      420000000000424242005252520042424200636363005A5A5A00393939000000
      0000212121005A5A5A00B5B5B500BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004242420000000000424242000000000042424200000000000000
      00004242420000000000424242000000000042424200000000004A4A4A00B5B5
      B5005A5A5A002121210000000000393939005A5A5A0063636300424242005252
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200000000004242
      4200000000004242420042424200000000006B6B6B006B6B6B006B6B6B006B6B
      6B0052525200DEDEDE0042424200000000004242420042424200DEDEDE00A5A5
      A5006B6B6B006B6B6B0031313100000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200000000004242
      4200424242000000000042424200000000004242420000000000000000005252
      520073737300636363005A5A5A0021212100000000000000000029292900A5A5
      A500BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242000000000042424200424242000000000042424200000000004242
      4200000000000808080018181800292929000000000000000000525252005A5A
      5A00636363007373730052525200525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420000000000000000004242
      42006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B0000000000000000000000
      0000000000000000000042424200DEDEDE006B6B6B006B6B6B00313131000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484008484840084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840000000000848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000525252007373730063636300636363005252
      52004A4A4A0018181800000000000808080094949400BDBDBD00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000808080000000000000000000000000018181800080808000000
      0000181818004A4A4A005A5A5A00636363006363630073737300525252005252
      5200000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B000000000000000000424242004242420000000000DEDE
      DE00313131003131310031313100000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484000000000084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7E7E700FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      63008C8C8C0073737300636363005A5A5A005A5A5A0052525200393939004242
      420052525200000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000018181800000000000808
      080000000000000000000000000039393900525252005A5A5A00636363006363
      6300737373008C8C8C0063636300525252000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7E7E700FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000042424200000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242004242420042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E7E700FFFFFF00FFFFFF00E7E7E700FFFFFF00E7E7
      E700FFFFFF00848484001010100063636300B5B5B50073737300737373004A4A
      4A005252520052525200B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000424242004242420042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700FFFFFF00FFFF
      FF00E7E7E700EFEFEF00E7E7E700EFEFEF008484840000000000000000004A4A
      4A005252520021212100737373007373730073737300B5B5B500636363007373
      7300000000000000000000000000000000000000000000000000FFFFFF004242
      42004242420042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7E7E700E7E7E700FFFFFF00E7E7E700FFFFFF00E7E7E700FFFF
      FF00848484000000000000000000424242000000000000000000212121003131
      3100313131003131310031313100313131000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420042424200424242004242
      42004242420042424200FFFFFF00FFFFFF008484840084848400848484008484
      840084848400FFFFFF00E7E7E700FFFFFF00E7E7E70084848400101010007B7B
      7B00B5B5B500949494008C8C8C00424242007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      42004242420042424200424242004242420042424200FFFFFF00FFFFFF008484
      840084848400848484008484840084848400EFEFEF00CECECE00FFFFFF00CECE
      CE007B7B7B00080808000000000000000000424242007B7B7B00424242008C8C
      8C0094949400B5B5B5007B7B7B00737373000000000000000000000000000000
      00000000000000000000FFFFFF00424242004242420042424200424242004242
      420042424200FFFFFF00FFFFFF00848484008484840084848400848484008484
      8400E7E7E7006B6B6B006B6B6B00313131008484840000000000000000000000
      000042424200CECECE00A5A5A5006B6B6B006B6B6B006B6B6B006B6B6B001818
      1800000000000000000000000000848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00424242004242420042424200FFFFFF00FFFF
      FF0084848400848484008484840084848400848484008484840084848400E7E7
      E700FFFFFF0084848400101010007B7B7B00B5B5B5007373730018181800BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00424242004242
      420042424200FFFFFF00FFFFFF00848484008484840084848400848484008484
      84008484840084848400E7E7E700FFFFFF007B7B7B0000000000000000004242
      42000000000042424200525252005252520073737300B5B5B5007B7B7B007373
      7300000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00424242004242420042424200FFFFFF00FFFFFF008484
      840084848400848484008484840084848400D6D6D6006B6B6B006B6B6B003939
      3900848484000000000000000000424242000000000000000000DEDEDE006B6B
      6B006B6B6B006B6B6B006B6B6B00181818000000000000000000000000008484
      84008484840084848400848484008484840000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFF
      FF00848484008484840084848400FFFFFF00E7E7E70000000000101010007B7B
      7B00525252001818180094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      420042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      840084848400FFFFFF00FFFFFF00848484008484840084848400EFEFEF00E7E7
      E700000000000000000000000000000000004242420000000000000000009494
      940052525200525252007B7B7B00737373000000000000000000000000000000
      00000000000000000000FFFFFF004242420042424200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFFFF008484
      840084848400D6D6D6006B6B6B006B6B6B001818180000000000000000000000
      00004242420021212100313131006B6B6B006B6B6B006B6B6B006B6B6B001818
      1800000000000000000000000000848484008484840084848400848484000000
      0000FFFFFF000000000084848400FFFFFF0084848400FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00FFFFFF000000000084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242004242420042424200424242004242420042424200FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF008484840084848400E7E7
      E700FFFFFF0000000000181818007373730029292900BDBDBD00424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000424242004242420042424200424242004242
      420042424200FFFFFF00FFFFFF008484840084848400FFFFFF00FFFFFF00FFFF
      FF008484840084848400CECECE00FFFFFF000000000000000000000000004242
      42000000000042424200B5B5B50000000000B5B5B50073737300737373009494
      9400000000000000000000000000000000000000000000000000FFFFFF004242
      42004242420042424200424242004242420042424200FFFFFF00FFFFFF008484
      840084848400FFFFFF00FFFFFF00FFFFFF0084848400D6D6D6006B6B6B006B6B
      6B006B6B6B00181818003131310021212100313131006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B00181818000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000084848400FFFFFF008484
      8400FFFFFF008484840000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00424242004242
      42004242420042424200FFFFFF00FFFFFF008484840084848400FFFFFF00FFFF
      FF00FFFFFF008484840084848400FFFFFF00E7E7E70000000000101010004242
      4200000000004242420000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0042424200424242004242420042424200FFFFFF00FFFFFF008484
      840084848400FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF00E7E7
      E700000000000000000042424200000000004242420000000000ADADAD000000
      00000000000000000000ADADAD00B5B5B5000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0042424200424242004242
      420042424200FFFFFF00FFFFFF008484840084848400FFFFFF00FFFFFF00FFFF
      FF008484840084848400E7E7E7006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B00A5A5A500DEDEDE00DEDEDE00A5A5A5003131
      3100000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000084848400FFFFFF0084848400FFFFFF008484840000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF008484840084848400E7E7
      E700FFFFFF000000000000000000000000004242420000000000424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000042424200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFFFF00FFFF
      FF008484840084848400E7E7E700FFFFFF000000000000000000000000004242
      42000000000042424200B5B5B500B5B5B5009C9C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF004242
      4200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      840084848400FFFFFF00FFFFFF00FFFFFF008484840084848400E7E7E700E7E7
      E700000000006B6B6B006B6B6B006B6B6B006B6B6B00A5A5A500DEDEDE00DEDE
      DE000000000000000000DEDEDE00000000000000000000000000000000000000
      0000FFFFFF008484840084848400848484000000000084848400FFFFFF008484
      8400000000000000000084848400848484008484840084848400848484000000
      00000000000000000000FFFFFF0000000000FFFFFF0084848400000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484004242420042424200424242004242
      42004242420042424200FFFFFF00FFFFFF00848484008484840084848400FFFF
      FF00FFFFFF008484840084848400FFFFFF00E7E7E70000000000000000004242
      4200000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484004242
      42004242420042424200424242004242420042424200FFFFFF00FFFFFF008484
      84008484840084848400FFFFFF00FFFFFF008484840084848400FFFFFF00E7E7
      E700000000000000000042424200000000004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00424242004242420042424200424242004242
      420042424200FFFFFF00FFFFFF00848484008484840084848400FFFFFF00FFFF
      FF008484840084848400FFFFFF00E7E7E7000000000000000000CECECE00DEDE
      DE00CECECE00CECECE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084848400848484000000
      0000000000000000000084848400FFFFFF000000000000000000FFFFFF000000
      00000000000000000000848484000000000000000000FFFFFF0000000000FFFF
      FF0000000000848484000000000084848400FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF004242420042424200424242004242420042424200FFFFFF00FFFF
      FF0084848400848484008484840084848400848484008484840084848400E7E7
      E700FFFFFF000000000000000000000000004242420000000000424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF004242420042424200424242004242
      420042424200FFFFFF00FFFFFF00848484008484840084848400848484008484
      84008484840084848400E7E7E700FFFFFF000000000000000000000000004242
      4200B5B5B5004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF004242420042424200424242004242420042424200FFFFFF00FFFFFF008484
      8400848484008484840084848400848484008484840084848400E7E7E700FFFF
      FF00000000000000000000000000424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0084848400848484008484840000000000FFFFFF008484
      84000000000000000000FFFFFF00000000000000000000000000848484000000
      00000000000000000000FFFFFF0000000000848484000000000084848400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400848484008484840084848400FFFFFF00E7E7E70000000000000000004242
      4200000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400848484008484840084848400FFFFFF00E7E7
      E700000000000000000042424200000000004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400848484008484
      84008484840084848400FFFFFF00E7E7E7000000000000000000424242000000
      0000424242004242420000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00848484008484
      8400000000000000000084848400FFFFFF000000000000000000FFFFFF000000
      00000000000000000000848484000000000000000000FFFFFF00000000008484
      8400848484008484840000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700FFFFFF000000000000000000000000004242420000000000424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00848484008484840084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E7E700FFFFFF000000000000000000000000004242
      4200000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      84008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700FFFF
      FF00000000000000000000000000424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00848484008484840000000000000000008484
      84000000000000000000FFFFFF00000000000000000000000000848484000000
      0000000000000000000084848400848484000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7E7E7008484840084848400848484008484
      84008484840084848400FFFFFF00FFFFFF004242420042424200424242004242
      4200FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E70000000000000000004242
      4200000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E7008484
      84008484840084848400848484008484840084848400FFFFFF00FFFFFF004242
      4200424242004242420042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700000000000000000042424200000000004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00848484008484840084848400848484008484
      840084848400FFFFFF00FFFFFF0042424200424242004242420042424200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7E7E7000000000000000000424242000000
      0000424242004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400848484000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000084848400000000000000000000000000000000000000
      00000000000084848400FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0084848400FFFFFF00FFFFFF00848484008484840084848400FFFFFF00FFFF
      FF0042424200424242004242420042424200424242004242420042424200E7E7
      E700FFFFFF000000000000000000000000004242420000000000424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF00424242004242420042424200424242004242
      42004242420042424200E7E7E700FFFFFF000000000000000000000000004242
      4200000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400FFFFFF00FFFFFF00848484008484840084848400FFFFFF00FFFFFF004242
      4200424242004242420042424200424242004242420042424200E7E7E700FFFF
      FF00000000000000000000000000424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000848484000000
      00000000000084848400848484008484840000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400E7E7E70084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00424242004242420042424200FFFFFF00E7E7E70000000000000000004242
      4200000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E7008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00424242004242420042424200FFFFFF00E7E7
      E700000000000000000042424200000000004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004242
      42004242420042424200FFFFFF00E7E7E7000000000000000000424242000000
      0000424242004242420000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000008484840084848400848484000000000000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E700FFFF
      FF00848484008484840084848400FFFFFF00FFFFFF0084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700FFFFFF000000000000000000000000004242420000000000424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7E7E700FFFFFF00848484008484840084848400FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E7E700FFFFFF000000000000000000000000004242
      4200000000004242420000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E7E700FFFFFF008484
      84008484840084848400FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700FFFF
      FF00000000000000000000000000424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000848484000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00E7E7E7008484840084848400848484008484
      84008484840084848400FFFFFF00FFFFFF004242420042424200424242004242
      420042424200FFFFFF00FFFFFF00FFFFFF00E7E7E70000000000000000004242
      4200000000004242420000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00E7E7E7008484
      84008484840084848400848484008484840084848400FFFFFF00FFFFFF004242
      420042424200424242004242420042424200FFFFFF00FFFFFF00FFFFFF00E7E7
      E700000000000000000042424200000000004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00848484008484840084848400848484008484
      840084848400FFFFFF00FFFFFF00424242004242420042424200424242004242
      4200FFFFFF00FFFFFF00FFFFFF00E7E7E7000000000000000000424242000000
      0000424242004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700FFFF
      FF00FFFFFF00FFFFFF0084848400848484008484840084848400FFFFFF00FFFF
      FF0042424200424242004242420042424200424242004242420042424200E7E7
      E700FFFFFF000000000000000000000000004242420000000000424242004242
      4200000000000000000000000000000000000000000000000000000000000000
      000084848400E7E7E700FFFFFF00FFFFFF00FFFFFF0084848400848484008484
      840084848400FFFFFF00FFFFFF00424242004242420042424200424242004242
      42004242420042424200E7E7E700FFFFFF000000000000000000000000004242
      4200000000004242420042424200000000000000000000000000000000000000
      00000000000000000000000000000000000084848400E7E7E700FFFFFF00FFFF
      FF00FFFFFF0084848400848484008484840084848400FFFFFF00FFFFFF004242
      4200424242004242420042424200424242004242420042424200E7E7E700FFFF
      FF00000000000000000000000000424242000000000000000000424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7E7E700FFFFFF00E7E7E70042424200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00424242004242420042424200FFFFFF00E7E7E70000000000000000000000
      0000000000004242420000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7E7E700FFFFFF00E7E7E7004242
      4200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00424242004242420042424200FFFFFF00E7E7
      E700000000000000000000000000000000004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7E7E700FFFFFF00FFFFFF0042424200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004242
      42004242420042424200FFFFFF00E7E7E7000000000000000000000000000000
      0000424242004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E7E700FFFFFF00E7E7
      E700FFFFFF004242420042424200424242004242420042424200FFFFFF00FFFF
      FF00424242004242420042424200424242004242420042424200FFFFFF00FFFF
      FF00E7E7E7008484840000000000000000000000000042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7E7E700FFFFFF00E7E7E700FFFFFF004242420042424200424242004242
      420042424200FFFFFF00FFFFFF00424242004242420042424200424242004242
      420042424200FFFFFF00FFFFFF00E7E7E7008484840000000000000000000000
      0000424242000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7E7E700FFFFFF00FFFFFF00FFFF
      FF004242420042424200424242004242420042424200FFFFFF00FFFFFF004242
      42004242420042424200424242004242420042424200FFFFFF00FFFFFF00E7E7
      E700848484000000000000000000000000004242420042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042424200424242004242
      4200424242004242420042424200E7E7E700FFFFFF00E7E7E700000000000000
      0000424242000000000042424200424242000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E7E700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00424242004242420042424200424242004242420042424200E7E7E700FFFF
      FF00E7E7E7000000000000000000424242000000000042424200424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7E7E700E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004242420042424200424242004242
      42004242420042424200E7E7E700FFFFFF00E7E7E70000000000000000004242
      4200000000000000000042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042424200FFFF
      FF00E7E7E700FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0042424200FFFFFF00E7E7E700FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042424200FFFFFF00E7E7
      E700FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7E7E700FFFFFF00E7E7E700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700FFFF
      FF00E7E7E7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E7E700FFFFFF00E7E7E70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DBDBDB00D8D8D80000000000DDDDDD00E2E2E200E3E3E300E3E3
      E300E0E0E000E2E2E200E1E1E100DEDEDE00DDDDDD00E1E1E100E2E2E200DEDE
      DE00DBDBDB00DCDCDC00DFDFDF00E0E0E000DFDFDF00E0E0E000E3E3E300DFDF
      DF00DBDBDB00DCDCDC00DFDFDF00E0E0E000DFDFDF00E1E1E100E3E3E300E2E2
      E200DADADA00D4D4D400DADADA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDDDDD0000000000EBEBEB00FAFA
      FA00FAFAFA00F7F7F700F7F7F700F7F7F700F8F8F800F6F6F600F5F5F500F7F7
      F700FBFBFB00FAFAFA00FBFBFB00F9F9F900FAFAFA00F9F9F900F9F9F900F9F9
      F900FBFBFB00FAFAFA00FBFBFB00FAFAFA00F8F8F800F6F6F600F6F6F600F6F6
      F600F9F9F900F7F7F700F6F6F600F5F5F500FBFBFB00F6F6F600E1E1E1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEDEDE00DBDBDB00F9F9F900D2D2D20079797900545454004D4D4D004D4D
      4D004F4F4F00515151004F4F4F00545454005454540053535300525252005252
      5200535353005252520052525200535353005252520054545400515151005151
      51005555550058585800575757005656560055555500595959005D5D5D006969
      69009F9F9F00F3F3F300F0F0F000000000000000000000000000848484008484
      8400848484008484840084848400848484000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242004242420042424200424242004242420042424200424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDDDDD00E4E4E400D1D1D1004747
      470000000000000000000D0D0D000E0E0E001111110011111100121212000F0F
      0F00131313001414140014141400161616001414140014141400151515001313
      130013131300131313001616160016161600191919001B1B1B001B1B1B001B1B
      1B001B1B1B001E1E1E00191919000C0C0C00111111008D8D8D00DDDDDD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018181800000000000000
      0000181818001818180000000000848484000000000000000000000000000000
      0000000000000000000000000000000000003939390039393900000000000000
      0000000000000000000000000000000000004242420042424200000000004242
      4200424242004242420000000000000000000000000073737300737373007373
      7300737373007373730000000000000000000000000000000000000000000000
      0000737373007373730073737300737373000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000DDDDDD00E5E5E500C5C5C5003D3D3D002121210074747400989898009797
      97009B9B9B009C9C9C009A9A9A009B9B9B00A3A3A300A7A7A700A9A9A900AAAA
      AA00A8A8A800AAAAAA00ADADAD00A9A9A900AAAAAA00AFAFAF00AFAFAF00AEAE
      AE00AAAAAA00A9A9A900ABABAB00AEAEAE00ADADAD00AEAEAE00ACACAC006F6F
      6F00272727007D7D7D00DDDDDD00000000000000000000000000000000000000
      0000181818001818180018181800181818000000000018181800181818001818
      1800000000000000000000000000000000000000000000000000000000000000
      0000848484003939390000000000848484003939390039393900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840039393900000000000000000039393900393939000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007373730000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B000000000000000000000000007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400848484000000000000000000DFDFDF00E3E3E300C8C8C8004848
      480057575700B1B1B100B9B9B900B9B9B900BABABA00BCBCBC00BEBEBE00C0C0
      C000B2B2B200AFAFAF00A5A5A5009A9A9A00B6B6B600A8A8A8009D9D9D00BABA
      BA00B9B9B900A8A8A800AFAFAF00BCBCBC00C7C7C700CACACA00C8C8C800CDCD
      CD00D1D1D10000000000E1E1E100BDBDBD004C4C4C0086868600DEDEDE000000
      0000000000000000000000000000000000001818180018181800181818001818
      1800000000001818180018181800181818000000000000000000000000000000
      0000000000000000000000000000000000008484840039393900000000008484
      8400393939003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400393939000000
      00003939390084848400848484000000000000000000E7E7E700737373000000
      0000FFFFFF00FFFFFF00000000000000000000000000000000007B7B7B007B7B
      7B00FFFFFF007B7B7B0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000008484840000000000000000000000
      0000E1E1E100E4E4E400C9C9C9004A4A4A005B5B5B00A5A5A500B0B0B000B2B2
      B200AEAEAE00AEAEAE00B0B0B000B6B6B6008A8A8A0073737300686868005D5D
      5D00767676006C6C6C005D5D5D00858585006B6B6B00434343004B4B4B007E7E
      7E00B3B3B300C3C3C300BFBFBF00C4C4C400CECECE00D6D6D600D8D8D800BEBE
      BE00585858008C8C8C00DCDCDC00000000000000000000000000000000000000
      0000181818001818180018181800181818000000000018181800181818001818
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000003939390000000000000000003939390039393900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400000000008484840084848400393939000000
      00000000000000000000E7E7E7007373730000000000FFFFFF00E7E7E7000000
      0000000000007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      000000000000000000000000000000000000E5E5E500E7E7E700C7C7C7004949
      490055555500A5A5A500B3B3B300B1B1B100B1B1B100B0B0B000B1B1B100A2A2
      A200555555004D4D4D005C5C5C00575757005A5A5A0060606000555555007C7C
      7C006B6B6B0064646400555555007E7E7E00BBBBBB00C7C7C700C8C8C800CBCB
      CB00D5D5D500D7D7D700D6D6D600BBBBBB00595959008D8D8D00E3E3E3000000
      0000000000000000000000000000000000001818180018181800181818001818
      1800000000001818180018181800181818000000000000000000000000000000
      0000000000000000000000000000000000003939390039393900000000003939
      3900393939003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484000000
      0000848484003939390000000000000000000000000000000000000000007373
      73000000000000000000FFFFFF00E7E7E70000000000000000007B7B7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007B7B7B000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000E5E5E500ECECEC00CACACA004A4A4A0059595900AAAAAA00B4B4B400B0B0
      B000AFAFAF00B2B2B200B3B3B300A4A4A4006E6E6E00767676007E7E7E007171
      71008A8A8A007C7C7C006A6A6A009E9E9E00B5B5B500BDBDBD00B7B7B700B9B9
      B900C4C4C400C4C4C400CACACA00CCCCCC00CDCDCD00D3D3D300D7D7D700BABA
      BA005B5B5B008D8D8D00E1E1E100000000000000000000000000000000000000
      0000181818001818180018181800181818000000000018181800181818001818
      1800000000000000000000000000000000000000000000000000000000000000
      0000393939003939390000000000393939003939390039393900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400000000003939390000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E7E7E700FFFF
      FF000000000000000000000000007B7B7B00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      000000000000000000000000000000000000E4E4E400EBEBEB00CACACA004C4C
      4C005F5F5F00ABABAB00B3B3B300AFAFAF00B2B2B200B7B7B700B4B4B400BBBB
      BB00C5C5C500C6C6C600C5C5C500C1C1C100C6C6C600C5C5C500C2C2C200CCCC
      CC00D2D2D200D5D5D500D2D2D200CBCBCB00C7C7C700C8C8C800CBCBCB00CCCC
      CC00CCCCCC00D3D3D300D6D6D600BABABA00606060008E8E8E00E0E0E0000000
      0000000000000000000000000000000000001818180018181800181818001818
      1800000000001818180018181800181818000000000000000000000000000000
      0000000000000000000000000000000000008484840039393900000000008484
      8400393939003939390000000000000000003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073737300FFFF
      FF00FFFFFF00E7E7E700FFFFFF00000000000000000000000000000000000000
      00007B7B7B00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000E5E5E500E9E9E900C8C8C8004C4C4C005D5D5D00ABABAB00B4B4B400B2B2
      B200B6B6B600B7B7B700B7B7B700B7B7B700A0A0A0008C8C8C008A8A8A008F8F
      8F008C8C8C009090900096969600919191008D8D8D0093939300ADADAD00C3C3
      C300CACACA00CECECE00CBCBCB00CECECE00D3D3D300D5D5D500D5D5D500B9B9
      B9006060600092929200E2E2E200000000000000000000000000000000000000
      0000181818001818180018181800181818000000000018181800181818001818
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000393939000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF007B7B7B000000000000000000000000000000
      00000000000073737300FFFFFF00FFFFFF00E7E7E700FFFFFF00000000000000
      0000000000000000000000000000000000007B7B7B00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      000000000000000000000000000000000000E7E7E700EDEDED00CACACA004C4C
      4C005E5E5E00AAAAAA00B2B2B200B5B5B500B7B7B700B5B5B500B7B7B700A8A8
      A8004949490016161600171717001B1B1B001D1D1D001D1D1D00212121002323
      2300212121001F1F1F0070707000C8C8C800D0D0D000CACACA00CDCDCD00D3D3
      D300D5D5D500D3D3D300D7D7D700BCBCBC006060600095959500E2E2E2000000
      0000000000000000000000000000000000001818180018181800181818001818
      1800000000001818180018181800181818000000000000000000000000000000
      0000000000000000000000000000848484001818180018181800181818001818
      1800181818001818180084848400000000003939390000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000007B7B
      7B000000000000000000000000000000000073737300FFFFFF00FFFFFF00E7E7
      E700FFFFFF000000000000000000000000000000000000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000E7E7E700EEEEEE00CBCBCB004C4C4C005D5D5D00ADADAD00B6B6B600B5B5
      B500B6B6B600B7B7B700BCBCBC00A8A8A800525252001E1E1E00262626002A2A
      2A00272727002B2B2B002D2D2D002C2C2C002F2F2F002C2C2C0085858500D1D1
      D100D3D3D300CCCCCC00D1D1D100D5D5D500D4D4D400D3D3D300DADADA00C1C1
      C1006464640093939300E6E6E600000000000000000000000000000000000000
      0000181818001818180018181800181818000000000018181800181818001818
      1800000000000000000000000000000000000000000000000000000000008484
      8400181818001818180018181800181818001818180018181800848484000000
      0000393939000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B007B7B7B00000000003939
      3900393939003939390039393900393939003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      84008484840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400848484008484840084848400848484000000
      000000000000000000000000000000000000E9E9E900EEEEEE00CBCBCB004B4B
      4B005B5B5B00AEAEAE00BBBBBB00B5B5B500B7B7B700BCBCBC00BEBEBE00BBBB
      BB007777770031313100282828002D2D2D002C2C2C002F2F2F00323232003131
      3100343434005353530092929200A5A5A500B8B8B800D0D0D000D4D4D400D5D5
      D500D4D4D400D6D6D600DBDBDB00BEBEBE006666660095959500E5E5E5000000
      0000000000000000000039393900000000008484840018181800181818001818
      1800848484001818180018181800181818000000000000000000000000000000
      0000000000000000000039393900848484001818180018181800181818001818
      1800181818001818180084848400000000003939390000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF007B7B7B007B7B
      7B00FFFFFF00FFFFFF007B7B7B00393939009494940084848400848484008484
      8400393939000000000000000000000000000000000000000000000000007B7B
      7B000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400848484008484840000000000FFFFFF00000000008484
      8400FFFFFF0084848400FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000EBEBEB00EFEFEF00CACACA004D4D4D005E5E5E00AFAFAF00BBBBBB00B8B8
      B800BBBBBB00BDBDBD00BCBCBC00C4C4C4009A9A9A0045454500272727002A2A
      2A002C2C2C002F2F2F0030303000313131003B3B3B0074747400818181007272
      72008A8A8A00C2C2C200D6D6D600D3D3D300D1D1D100D6D6D600DCDCDC00BFBF
      BF006666660095959500E3E3E300000000000000000039393900393939008484
      8400181818001818180018181800181818001818180018181800181818001818
      1800848484000000000039393900000000000000000039393900393939008484
      8400181818001818180018181800181818001818180018181800000000008484
      8400393939000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF007B7B7B007B7B7B007B7B7B00FFFFFF003939
      3900949494008484840084848400FFFFFF003939390000000000393939003939
      39003939390039393900393939000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000084848400FFFFFF0084848400FFFFFF0084848400FFFF
      FF00848484000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED00EDEDED00C9C9C9005151
      510067676700B1B1B100B8B8B800BABABA00BCBCBC00BCBCBC00BEBEBE00C0C0
      C0009999990044444400252525002C2C2C002B2B2B002E2E2E002F2F2F003A3A
      3A004A4A4A006B6B6B007D7D7D00B1B1B1009A9A9A00ADADAD00D4D4D400D8D8
      D800D7D7D700D8D8D800DCDCDC00C0C0C0006464640094949400EAEAEA000000
      0000000000000000000000000000848484001818180018181800181818001818
      1800181818001818180018181800181818008484840039393900393939008484
      8400000000000000000084848400424242004242420042424200424242004242
      4200424242004242420000000000848484000000000000000000393939000000
      000000000000000000000000000000000000FFFFFF007B7B7B007B7B7B000000
      000000000000000000007B7B7B00393939009494940084848400848484008484
      840039393900393939008484840084848400848484008484840039393900FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFFFF008484
      8400FFFFFF0084848400FFFFFF00848484000000000084848400000000000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000EDEDED00F4F4F400CCCCCC005050500062626200B2B2B200BCBCBC00B9B9
      B900BBBBBB00BDBDBD00BCBCBC00C1C1C1009797970044444400272727002C2C
      2C002A2A2A002C2C2C003838380045454500484848006E6E6E0086868600B3B3
      B300A5A5A500B6B6B600D3D3D300D6D6D600DADADA00DADADA00DCDCDC00BEBE
      BE006565650097979700E7E7E700000000000000000018181800181818008484
      8400181818001818180018181800181818001818180018181800181818001818
      1800848484000000000084848400000000000000000000000000000000004242
      4200424242004242420018181800424242004242420042424200000000008484
      8400000000003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003939
      3900949494008484840084848400FFFFFF000000000084848400848484009494
      94003939390039393900FFFFFF00000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00848484008484
      840084848400FFFFFF0084848400FFFFFF0084848400FFFFFF00848484000000
      0000FFFFFF0084848400848484000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF00848484000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000ECECEC00F3F3F300CCCCCC005050
      500063636300B2B2B200BEBEBE00BDBDBD00BDBDBD00BCBCBC00BEBEBE00C3C3
      C3009696960043434300282828002A2A2A002B2B2B0033333300454545004E4E
      4E00484848007373730087878700A6A6A600A3A3A300BBBBBB00D5D5D500D4D4
      D400D8D8D800DADADA00DCDCDC00BDBDBD00696969009B9B9B00E9E9E9000000
      0000000000001818180018181800848484001818180018181800181818001818
      1800181818001818180018181800181818008484840018181800181818000000
      0000000000004242420042424200181818004242420042424200424242004242
      4200424242004242420018181800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000393939009494940084848400848484000000
      0000848484008484840094949400393939000000000000000000737373000000
      0000E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0084848400848484000000000000000000FFFFFF008484
      8400FFFFFF008484840000000000FFFFFF00FFFFFF0000000000848484008484
      84000000000000000000FFFFFF0000000000FFFFFF0000000000848484000000
      000084848400FFFFFF0000000000000000000000000000000000000000000000
      0000EFEFEF00F0F0F000CBCBCB005050500061616100AEAEAE00BDBDBD00BFBF
      BF00BDBDBD00B9B9B900C0C0C000C1C1C1009696960044444400272727002A2A
      2A0030303000454545004F4F4F004D4D4D0049494900787878008B8B8B009595
      95009D9D9D00C2C2C200D4D4D400D8D8D800DADADA00DADADA00DADADA00BEBE
      BE006B6B6B009B9B9B00E8E8E800000000000000000018181800181818008484
      8400181818001818180018181800181818004242420018181800181818001818
      1800000000001818180018181800000000000000000042424200424242001818
      1800424242004242420042424200424242004242420042424200181818004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003939
      3900FFFFFF008484840000000000848484008484840094949400393939000000
      000000000000737373007373730000000000E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400848484008484840000000000FFFFFF008484840000000000FFFFFF00FFFF
      FF0000000000000000000000000084848400848484000000000000000000FFFF
      FF0000000000848484000000000084848400FFFFFF0000000000000000000000
      000000000000000000000000000000000000EEEEEE00F6F6F600CDCDCD005050
      500066666600B5B5B500C1C1C100BCBCBC00BEBEBE00C1C1C100C3C3C300C6C6
      C6009C9C9C0045454500232323002F2F2F003E3E3E004B4B4B004D4D4D004D4D
      4D004D4D4D007B7B7B008C8C8C008A8A8A00AAAAAA00CFCFCF00D7D7D700D7D7
      D700DADADA0000000000DDDDDD00C3C3C3006D6D6D009A9A9A00E8E8E8000000
      0000000000001818180018181800181818001818180018181800848484008484
      8400424242008484840018181800181818008484840018181800181818000000
      0000000000004242420042424200181818004242420042424200000000004242
      4200424242004242420018181800424242000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000003939390084848400848484008484
      84009494940039393900000000000000000073737300FFFFFF00E7E7E7007373
      7300E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00848484008484840000000000FFFFFF008484
      840000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000848484008484840000000000000000008484840084848400848484000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000F2F2F200F6F6F600CDCDCD00505050006A6A6A00B8B8B800C0C0C000BBBB
      BB00BEBEBE00C6C6C600C6C6C600CBCBCB009D9D9D0044444400292929003A3A
      3A00494949004E4E4E004E4E4E00515151004C4C4C007B7B7B008F8F8F009090
      9000B7B7B700D2D2D20000000000DADADA0000000000D7D7D700DFDFDF00C4C4
      C4006C6C6C0099999900ECECEC00000000000000000084848400181818001818
      1800181818001818180000000000000000004242420000000000181818001818
      1800181818001818180018181800000000000000000042424200424242001818
      1800424242004242420000000000424242004242420042424200424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000039393900FFFFFF0084848400949494003939390000000000000000000000
      000073737300FFFFFF007373730073737300E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E7000000000000000000737373007373730073737300737373007373
      730000000000000000000000000000000000000000000000000000000000FFFF
      FF0084848400848484008484840000000000FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000F3F3F300F7F7F700CDCDCD004E4E
      4E0069696900BBBBBB00BFBFBF00BDBDBD00C3C3C300C2C2C200C4C4C400C8C8
      C8009B9B9B004646460033333300414141004444440045454500484848004C4C
      4C004F4F4F007B7B7B008989890090909000B1B1B100CFCFCF00D8D8D8000000
      0000D8D8D80000000000E0E0E000C4C4C4006E6E6E009D9D9D00ECECEC000000
      0000000000000000000018181800181818001818180018181800000000000000
      0000424242000000000018181800181818001818180018181800848484000000
      0000000000004242420042424200181818004242420000000000000000000000
      0000424242004242420042424200000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039393900424242004242
      4200FFFFFF0000000000000000000000000073737300FFFFFF00E7E7E7007373
      7300E7E7E700E7E7E700E7E7E700E7E7E7000000000073737300E7E7E7007373
      7300E7E7E70073737300E7E7E700737373000000000000000000000000000000
      0000000000000000000000000000FFFFFF008484840084848400000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000008484
      840000000000000000000000000000000000000000008484840084848400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000F2F2F200F6F6F600CDCDCD005050500069696900B6B6B600C0C0C000C3C3
      C300C6C6C600C3C3C300C4C4C400C7C7C7009C9C9C0052525200383838004545
      45004A4A4A004D4D4D004E4E4E004E4E4E005454540064646400898989009696
      9600A0A0A000CCCCCC00DBDBDB00D7D7D700DADADA00E0E0E000E1E1E100C3C3
      C30070707000A1A1A100EBEBEB00000000000000000000000000181818001818
      1800181818001818180000000000000000004242420000000000181818001818
      1800181818001818180000000000000000000000000042424200424242004242
      4200424242008484840000000000848484000000000000000000424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000737373007373730073737300E7E7E700E7E7E700E7E7E7000000
      0000E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000848484000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000F4F4F400F7F7F700CBCBCB005252
      520069696900B9B9B900C7C7C700C2C2C200C2C2C200C6C6C600C4C4C400C7C7
      C700A4A4A40062626200707070009B9B9B00A8A8A800A7A7A700ABABAB00A5A5
      A500757575006D6D6D00B1B1B1009494940087878700C7C7C700DADADA00DBDB
      DB00DFDFDF00E0E0E000E0E0E000C3C3C30070707000A0A0A000F2F2F2000000
      0000000000000000000018181800181818001818180018181800000000000000
      0000424242000000000018181800181818001818180018181800000000000000
      0000000000004242420042424200424242000000000000000000424242000000
      0000000000000000000042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000737373007373
      7300E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7007373
      7300737373007373730073737300000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000848484008484
      8400848484000000000000000000FFFFFF000000000000000000000000008484
      8400000000000000000084848400848484008484840000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F6F600FDFDFD00CFCFCF00515151006A6A6A00BBBBBB00C9C9C900C4C4
      C400C4C4C400C4C4C400C4C4C400CACACA00A9A9A900646464009E9E9E00D8D8
      D800D5D5D500D2D2D20000000000000000009595950089898900C6C6C6008A8A
      8A0089898900CCCCCC0000000000DADADA00DEDEDE00DEDEDE00DFDFDF00C2C2
      C2006F6F6F009D9D9D00EEEEEE00000000000000000000000000181818001818
      1800181818001818180000000000000000004242420000000000181818001818
      1800181818008484840000000000000000000000000084848400424242004242
      4200000000000000000042424200000000000000000000000000424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000073737300E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E70073737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF008484840084848400848484000000000000000000FFFF
      FF00000000000000000000000000848484000000000000000000848484008484
      840084848400FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700FAFAFA00CFCFCF005151
      51006B6B6B00B5B5B500C1C1C100C3C3C300C5C5C500C4C4C400C6C6C600D0D0
      D000A9A9A90065656500A1A1A100D7D7D700D5D5D500D2D2D200D5D5D500D4D4
      D4009A9A9A008D8D8D00BABABA0093939300A5A5A500D6D6D600DCDCDC00DADA
      DA00DCDCDC00DEDEDE00E1E1E100C4C4C4006F6F6F009D9D9D00EDEDED000000
      0000000000000000000000000000181818001818180000000000000000000000
      0000000000000000000018181800181818008484840000000000000000000000
      0000000000000000000084848400424242000000000042424200000000004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000737373007373730073737300000000000000000073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF000000000000000000000000008484
      84000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F800FAFAFA00CDCDCD00515151006B6B6B00B5B5B500BABABA00BEBE
      BE00C3C3C300C5C5C500CACACA00D0D0D000A9A9A90069696900A4A4A400D7D7
      D700D7D7D700D6D6D600D5D5D500D5D5D5009F9F9F008F8F8F009D9D9D00A3A3
      A300C8C8C80000000000DDDDDD00E0E0E000DFDFDF00DDDDDD00E5E5E500C6C6
      C6006F6F6F00A0A0A000F0F0F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000039393900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073737300E7E7E700E7E7E7007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F6F600FCFCFC00D0D0D0005050
      50006A6A6A00B9B9B900C3C3C300C1C1C100C5C5C500CACACA00CDCDCD00D0D0
      D000A9A9A900626262009B9B9B00D8D8D800D8D8D800D8D8D800D8D8D800DBDB
      DB009595950084848400AFAFAF00D2D2D20000000000DADADA00DDDDDD00DEDE
      DE00DEDEDE00DDDDDD00E0E0E000C3C3C3006D6D6D00A1A1A100EDEDED000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000039393900393939003939
      3900000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000737373007373730073737300848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F900FFFFFF00D0D0D000505050006B6B6B00BEBEBE00C9C9C900C6C6
      C600CCCCCC00CDCDCD00CBCBCB00CFCFCF00BCBCBC0074747400666666008888
      88009797970099999900A0A0A00094949400747474009797970000000000DEDE
      DE00DADADA00DDDDDD00DFDFDF00DDDDDD00DDDDDD00E0E0E000E0E0E000C1C1
      C100717171009D9D9D00F2F2F200000000000000000000000000000000000000
      0000000000008484840039393900393939003939390039393900848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003939390039393900393939000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00FFFFFF00D0D0D0005050
      50006F6F6F00C3C3C300CCCCCC00CFCFCF00D0D0D000D0D0D000D1D1D100D4D4
      D400D6D6D600B9B9B9008B8B8B00868686008E8E8E0090909000979797009191
      9100A0A0A000C9C9C900DCDCDC0000000000DEDEDE00E0E0E000DFDFDF00DFDF
      DF00DEDEDE00E2E2E200E9E9E900CFCFCF007272720098989800F1F1F1000000
      0000000000000000000000000000000000000000000000000000393939003939
      3900393939003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000393939000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00FEFEFE00C8C8C8004242420056565600C6C6C600E0E0E000E2E2
      E200E1E1E100E4E4E400E6E6E600E6E6E600E5E5E500E5E5E500E8E8E800E7E7
      E700E5E5E500E9E9E900EAEAEA00E8E8E800ECECEC00EDEDED00E9E9E900E8E8
      E800EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00C4C4
      C4005C5C5C0090909000ECECEC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFBFB00FEFEFE00000000005A5A
      5A001313130031313100575757005A5A5A005F5F5F0062626200636363006363
      6300646464006868680071717100767676007575750074747400727272007272
      72006F6F6F006B6B6B006C6C6C0072727200717171006F6F6F006F6F6F006F6F
      6F007272720075757500696969003D3D3D003D3D3D00A1A1A100F8F8F8000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FFFFFF00F9F9F900B4B4B4006A6A6A0054545400585858005D5D
      5D005F5F5F006262620062626200626262006767670069696900696969006969
      69006969690069696900696969006969690069696900696969006C6C6C006F6F
      6F00707070006F6F6F006F6F6F006F6F6F006E6E6E006E6E6E006E6E6E007070
      700092929200DBDBDB00FCFCFC00000000000000000000000000000000000000
      0000000000000000000084848400848484000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1F1F100E9E9E900E7E7E700E9E9E900EAEAEA00E9E9E900E9E9E900EAEA
      EA00EBEBEB00EBEBEB00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EBEBEB00EDEDED00EDEDED00EDEDED00EDED
      ED00EDEDED00EDEDED00EEEEEE00ECECEC00F8F8F800FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      280000008C000000180100000100010000000000E01500000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF80000180200000FFFFFFFF
      FFFFFFFFFFFFFFFFFF84003500100000FFFFFFFFFFFFFFFFFFFFFFFFFFC00000
      00000000FFFFFFFFFFFFFFFFFF000F800780000001000000FFFFFFFFFFC7FFE3
      FF0007800398000000000000FFFE0FFFFFBFFFFDFF00078003C0000000000000
      FFF001FFFF73FFCEFF000F800380000000000000FFE000FFFFEFC1F7FF001F80
      0380000000000000FFC0007FFFFF20FFFF007F800380000000000000FF80003F
      FFFC903FFF007F800380000000000000FF00001FFFF24B1FFF007C8003800000
      00000000FE00001FFFE1240FFF007C800380000000000000FE00001FFFE088C7
      FF03F0800380000000000000FE00001FFFE12107FF03F0800380000000000000
      FE00001FFFC002F7FF03F08003C0000000000000FE00001FFF208D10FF0FF080
      0380000000000000FE00001FFE2012083F0F80800388000000000000FF00001F
      FC3000031F0F80800380000000000000FF00003FF81800000F8F00C003800000
      00000000FF80003FF00C00008FFC00FFFF80040000000000FFC0007FF003FF81
      4FFC00FCFF80020000000000FFE000FFF003FF86AFFC00F87F80000000000000
      FFF003FFF007FF875FFC00F03F8A000000000000FFF003FFF00FFF8BBFFFC1E0
      1F98800000000000FFF807FFF01FFFD5DFFFC0C00F81800000000000FFF807FF
      F01FFFCAFFFFC0F03FA6000000000000FFF80FFFF83FFFE57FFFC0F03FA30000
      00000000FFF80FFFF83FFFEAFFFFC0F03FA8000000000000FFF80FFFF87FFFF5
      FFFFC0F03F98000000000000FFF007FFFC7FFFF2FFFFC0003FC0000000000000
      FFF003FFFCFFFFF9FFFFC0003FC0000000000000FFFA47FFFCFFFFFBFFFFC000
      3F98800000000000FFFFFFFFFFFFFFFFFFFFE0003F80000000000000FFFFFFFF
      FFFFFFFFFFFFFFFFFF80000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFE45000
      00000000000000001FFFFFFFFFFFFF00FFFFFFFFFFF00000000000001FFFFFFF
      FFFFF801FFFFFFFFFFF00000000000001FF3FFFFFFFF8000FFFFFFFFFFF00000
      000000001FF0FFFFFFFC0008FFE001F000F00000000000001FF83FFFFFE00000
      FFE000F000700000000000001FF81FFFFE0006007FE000F00070000055555555
      5FFC0FFFFC0030007FE000F000700000000000001FFC07FFFC0180007FE000F0
      007000001FC3C71FFC000007FC1C00001FE000F000700000E03C38E0F8000007
      FC4000001FE000F00070000006240001F8000007FC0000001FE000F000700000
      063C0003F8000007FC0000000FE000F00070000006000007F8000007FE000000
      0FE000F00070000006000007F8000007FE00000007E000F0007000000600FF1F
      F8000007FE00000007E000F000700000DEDBFE0FF8000007FF00000007E000F0
      00700000DEDBFF1FF8000003FF00000003E000F0007000000C01FF1F38000001
      FF80000003E000F000700000FFFFFFF8B8000000FF80000001F000F800700000
      FFFE0F19580000007FC0000001FFFFFFFFF00000FFFEC33AF80000003FE00000
      01FC1FFF9FF00000F0087FFAF80000001FE0000001FC0FFF0FF00000F0B47F3F
      980000000FF0000001FC0FFE07F00000F009FE3F180000000FF0000001FC0FFC
      03F0000088AFFFFC580000041FF8000001FC0FF801F00000F0FFF8C0B8000006
      3FF8000001FC0FFE07F00000FFFFFCFCB8000007FFF8000001FC0FFE07F00000
      FFFF8F8078000007FFFC000001FC0FFE07F00000FFFF063AF800000FFFFC0000
      01FC0FFE07F00000FC071FE0F800001FFFFE000001FC000007F00000F80FFF81
      F800003FFFFE000003FC000007F00000C01FF81FF800007FFFFF00000FFC0000
      07F00000FFFF43FFF80000FFFFFF0000FFFE000007F00000FFFFFFFFF80001FF
      FFFF8007FFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFFF803FFFFFFFFFFFF00000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFF00000E040F863FF8000000FF39CE33FFFFFFFFFF00000F061F907
      FF0000000FDCE72DCFFFFFFFFFF00000F847F90FFF00007FCFE739CC73FFC007
      83F00000F847F91FF80003004F39CE6C1DFE000001F00000F847F91FF0000000
      4FCE738C07FC000000F00000F847F91FF70002004F739CEC01F8000000700000
      F844F91FF70002004F00072C01F8000000700000F844F919F400027FCFFFF1CC
      03F8000000300000F844F819F70003004FFFF06C03F8000000300000F844F009
      F70000004FFFD00C03F0000000300000F844F009F41FF2004FFF800C03E00000
      00300000E804E009F7001A004FFF800C03E0000000300000C000C001F700027F
      CFFF800C03E0000000300000F0006000F40013004FFF800C03E0000000300000
      C002C005F70000004FF0200C03F0000000700000C000C003F70000004FE0300C
      03F8000000700000C004C003F40000000FC0380C03F8000000F00000C000C003
      F70000000F803C0C03FC000001F00000C1A0C003F70000000FBFFE0C03FC0000
      03F00000E1A0C103F40000001FB0030C03FC00001FF00000E1A1C107F7F00000
      FFBFF60C03FC00001FF00000E1A1C287F7F00000FFC02C0C03FC00000FF00000
      E1A1C287F4100000FFFFB80C03FE000007F00000F3E3E00FF7F00000FFFFB00C
      03FF03F003F00000FFBFFC7FF7F00000FFFFA00C03FF800003F00000FE1FF00F
      F4300000FFFF800603FF800003F00000FC0FF00FF7F00000FFFF900303FF8000
      03F00000FC0FF81FF7F00000FFFFF00183FFC00007F00000FC0FF81FF4100000
      FFFFF000C3FFE00F0FF00000FC0FFC7FF7F00000FFFFF00067FFFC007FF00000
      FE1FFC7FF7F00000FFFFF0000FFFFFFFFFF00000FFFFFFFFF0000001FFFFFFFF
      FFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000FFFFFFFF
      FFFFFFFFFFFFFF8FFFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFFFFE0FFFFFFFFF
      FFF00000FE001FFFFFFFFFFFFFFFF003FFFFFF47FFF00000FE001FFFFFFFFFFF
      FFFFC001FFFFF0007FF00000FE001FFFFFFFFFFFFFFC0000FFFFC0001FF00000
      FE001FFFFFFFFFFFFFF00800FFFF80000FF00000FE001FFFFFFFFFFFFF00F800
      3FFF80000FF00000F0001FFFFFFFFFFFFE01F8001FFF000007F00000E0000FFF
      FE38FFF1FC0178001FFF000007F00000E000007FFC927FE4FE0101000FFE0000
      03F00000E000003FF145000A0F00000007FE040003F00000E000003FF0820004
      0FE1008003FE400003F00000E000001FF00000000FF0000001FE050003F00000
      E000001FF00000000FFA048000FE020003F00000E000001FF00000000FF80280
      007E020003F00000E000000FF00000000FF80700007E050003F00000F0000007
      F00000000FF979800FFE460003F00000F0000007F00FFE001FFEE9801FFE4200
      01F00000F800000FF00800003FF8D9001FFE064001F00000FC00003FF0080000
      7FFEE9001FFE138003F00000FE000EFFF0080001FFFEFEC01FFE810001F00000
      FF007FFFF0080003FFFEFF801FFE880003F00000FFC0FFFFF0080003FFFA7D80
      1FFEC00003F00000FF807FFFF7F800FFFFF2BA001FFE000003F00000FF807FFF
      F00001FFFFE9BE001FFE040003F00000FF007FFFFFFFFFFFFFF4F4001FFE0000
      03F00000FF003FFFFFFFFFFFFFFEC8000FFE000007F00000FF001FFFFFFFFFFF
      FFF958000FFF118007F00000FF003FFFFFFFFFFFFFFD30000FFF332807F00000
      FF807FFFFFFFFFFFFFFEB0001FFF90600FF00000FF80FFFFFFFFFFFFFFFFC000
      1FFF84070FF00000FFC1FFFFFFFFFFFFFFFF40003FFFC0201FF00000FFFFFFFF
      FFFFFFFFFFFFC0007FFFF008BFF00000FFFFFFFFFFFFFFFFFFFFF800FFFFFFC3
      FFF00000FFFFFFFFFFFFFFFFFFFFFFF1FFFFFFFFFFF00000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF00000FFFFFFFFFFFFFFC3FFFFFFFFF0FFFFFF83F00000
      FFFFFFFFFFFFFFC1FFFFFFFFC0FFFFF300F00000F00000003C57FFC07F8AFFFF
      00FAAFF000700000C00000007CAABF401F9557EA00F9557000300000C0000000
      FC055A800F80AB5400F80A9010100000C00FFC01FC002500078004A000F80060
      0C100000C0000401FC0000000380000000F8000002100000C0000401FC000000
      0780000000F8000FEDF00000C0000401FC0000001F80000000F800000C000000
      C0000001FC0000007F80000100F8000010000000C0000001FC000000FF800000
      80F800000C000000C0000001FC000001FF80000160F8000010000000C042AA01
      FC000001FF80000290F8000000000000C083F501F800000BFF0000015CF00000
      00000000C1041A81F8000015FF00000287F0000080D00000E0880D13F800000B
      FF0000017FF0000043F00000E0C9CAA3F9000015FF2000023FF000002FF00000
      F049CD07F800000BFF0000017FF0000013F00000F049CA27F8000015FF000002
      BFF000002FF00000F829CC4FF000000BFE0000017FE0000013F00000F809C80F
      F0000015FE000002BFE000002FF00000FC09C81FF000000BFE0000017FE00000
      13F00000FC09C81FF0000015FE000002BFE000002FF00000FE79CF3FE000000B
      FC0000017FC0000013F00000FE01C03FE0000014FC0000029FC000002DF00000
      FF53E17FE000000BFC0000017FC0000013F00000FFE7F3FFE000000BFC000001
      7FC0000013F00000FFF3E7FFE0000004FC0000009FC000000DF00000FFF9CFFF
      E000000FFC000001FFC000001FF00000FFFC9FFFFC00000FFF800001FFF80000
      1FF00000FFFE3FFFFFC0000FFFF80001FFFF80001FF00000FFFF7FFFFFFF800F
      FFFFF001FFFFFF001FF00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000900000001FFFFFFFFFFFFFFF
      FFFFFFFFFFF00000400000001FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000
      1C081F0C7F00000000FFFFFFFFF00000000000001E0C3F20FF3E0183F0F80000
      00100000000000001F08FF21FF180387E0E0000000300000000000041F08FF23
      FF008183E3E0000000700000000000001F08FF23FF01C081E3E007FE00F00000
      000000001F08FF23FF03E040E3E0000200F00000000000001F089F23FF078062
      E3E0000200F00000000000001F089F233F0F80F2E3E0000200F0000000000000
      1F089F033F0F01F2C3E0000000F00000000000001F089E013F0E03F607E00000
      00F00000000000001F089E013F0207F10FE0000000F00000000000001D009C01
      3F0007EC1FE0215500F0000000000000180018003F0004183FE0402A80F00000
      000000001E000C001F1C00003FE0801540F000000000000018005800BFEE000F
      7FF0000A89F0000000000000180018007F7600C03FF0404551F0000000000000
      180098007F6601803FF820E283F0000000000004180018007F0703003FF801F1
      13F0000000000028183418007F8F070000FC01F027F00000000000141C341820
      7FFF810000FC00E007F00000000000001C343820FFFFC08000FE3CE78FF00000
      000000001C343850FFFFC0C001FE04E40FF00000000030201C343850FFFFC0E0
      1FFF04E41FF00000000000001E7C7C01FFFF80F03FFF04E41FF0000000000040
      1FF7FF8FFFFFE1F07FFF84E43FF00000000000801FC3FE01FFFFFFF0FFFFFCE7
      FFF00000000002001F81FE01FFFFFFF87FFFFCE7FFF00000000001001F81FF03
      FFFFFFF01FFFFCE7FFF00000000000001F81FF03FFFFFFF03FFFFC07FFF00000
      200000001F81FF8FFFFFFFF07FFFFE0FFFF00000000000001FC3FF8FFFFFFFF0
      3FFFFFFFFFF00000000000001FFFFFFFFFFFFFF07FFFFFFFFFF0000000000000
      1FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000
      000000000000}
  end
  object HotImage: TImageList
    Height = 35
    ShareImages = True
    Width = 35
    Left = 32
    Top = 120
    Bitmap = {
      494C010118001D00040023002300FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008C0000001801000001002000000000008064
      0200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D3D3D300ECECEC00DCDCDC007979
      7900E3E3E300DEDEDE00A3A3A300F8F8F8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F7F7000000
      0000AAAAAA00E8E8E800F1F1F1004D4D4D0089898900E1E1E100DBDBDB005656
      5600878787000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B5009C9C9C00797979009A9A9A00E4E4E400E8E8E8008E8E
      8E00E0E0E000DEDEDE00919191003F3F3F004848480000000000D8D5DA00918B
      98009A8DA7009D8DAF009C8BAE009786AB00A588C300DCD1E800EBE5F2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D4D4D400D2D2D200D6D6D6006565
      6500DADADA00DFDFDF00E0E0E000DFDFDF00DDDDDD00DADADA00454545003F3F
      3F008382840077777700725189006C47860067408300603A7D005A3777008158
      A3008660AA008661AA009670B8009D72BF00854FAE0069359A00C1AED6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8D8D800D2D2D200D5D5D500D8D8D800DADADA00DADADA00DADA
      DA00D8D8D800D6D6D600D9D9D900B3B3B300CACACA00CCCCCC00413F43007D51
      95007B509400754B8E00724A8D009B6EBA00885FAA0077509C008156A3008F5D
      AD009F64B7008C57AC008658AE007645A400835AAB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000FCFCFC0000000000B8B8B800CBCBCB00CECE
      CE00E0E0E000DEDEDE00DEDEDE00DEDEDE00E9E9E900CECECE00CCCCCC00C8C8
      C800C4C4C4006D6A6E00A19BA300835A980085579D007C50970072488E009262
      B3007A4E9F006D43970077489E008851A8009B5CB5008E53AD007B46A1006939
      9400683895007442A1007742A000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000ABABAB00BBBB
      BB00B0B0B000C2C2C200C6C6C600D7D7D700D9D9D900DADADA00DADADA00DADA
      DA00D9D9D900DCDCDC00C6C6C600C3C3C300979597008E898F0074627C008B5B
      A4008757A1007E4F9A0073479100663D870058327B0065389100713F9A008148
      A5009453B100884AA900753D9D0062309100663294007B43A6007F46AB008656
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF00008484000084840000848400008484000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000BDBDBD00B6B6B600BABABA00BDBDBD00D0D0D000D3D3
      D300D5D5D500E0E0E100E7E6E700D6D6D600D5D5D500DADADA00C0C0C000BEBE
      BE0083838300676567009061AA008D5AA8008856A5007F4D9D00734494006639
      8900572E7D005C2E89006B3696007B3FA1008E49AE008141A6006F3499005C27
      8D005F2A9100743AA2009355BB008D4FB9000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF00000000000000000000FF00000000000000000000008484000084
      8400008484000084840000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000000000009E9E9E00B4B4
      B400B5B5B500BCBCBC00CECECE00D0D0D000C6BACB00E1D4E600F2E8F600DAD4
      DC00D1D1D100D0D0D000BDBDBD00B9B9B900B5B5B500B2B2B2005D5D5D005841
      64008953A8007F4BA0007341960066368B006B3698005A288C00642C93007536
      9E008840AA007B38A200692B9600561E8A0059218E007539A4009254BA00A261
      C900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000FF000000FF00000084
      0000008400000084000000840000008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000009F9F9F00B0B0B000B3B3B300CACACA00B4B3
      B50085798B00998AA0006B488C007C52A500CDCDCD00CCCCCC00C3C3C300B3B3
      B300B0B0B000ADADAD006B6B6B0049494900854FA5007F48A200723D98007B3F
      A800672E9700551F89005E248F006F2D9A008238A700762F9F00632293005319
      8900652A97007B41A8008F55B800AF61CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF000000000000FF000000000000008400000000000000000000008400000000
      0000008484000084840000848400008484000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000000000000000000000000000F7F7F700A1A1A100A4A4
      A400A9A9A900B7B7B700C3C3C30045434700413D44004B3163006A37A0007946
      AB00C6C6C600C4C4C400B8B8B800ABABAB00ACACAC00BEBCBF00DAD2DD00CBC6
      CD009A7BB3009776B300916FAF009775B700A17EC300A07DC3009972BE009260
      B700A262C0007F41A6006A319700511A8300450D780061238E008540AC00AF61
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000000000000000000084
      0000000000000000000000840000000000000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000009E9E9E009D9D9D00A0A0A000A6A6A600B4B4B400BFBFBF003A3A
      3A0024232500512A79006E39A500936EB900C1C1C100C0C0C000A8A8A800A6A6
      A6009F9F9F009C9A9D009E8DA600AC7CC400A777C1009D6FB9009366B100875D
      A7007B549D007B53A1008156A4008B5AAA00985FB2008954A9008254A9007C4F
      A8004C1C7D005C2089008540AC00AF61CE000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000084000000000000008400000000
      0000008484000084840000848400008484000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF0000000000FFFFFF00000000000000000000000000FFFFFF00000000000000
      0000FFFFFF0000000000000000000000000000000000ACACAC00989898009B9B
      9B00A0A0A000A0A0A000BBBBBB00818181001B1B1B003F245B005E2F9000BDBD
      BD00BDBDBD00C4C4C400A2A2A200A0A0A0004949490040404000BA8BCF00B683
      CD00B27FCA00A776C000996BB400895DA7007D53A000724A9A007C4EA0008C57
      AB009F62B8009259AF00804CA40070419A00663992007D4BAA00783AA300AF61
      CE00000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008400000084
      0000008400000084000000840000000000000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000B0B0B00092929200A6A6A600989898007B7B7B00B6B6B600B7B7
      B7007F7F7F005E5E5E00B4B4B400B9B9B900B8B8B800B3B3B3009C9C9C009A9A
      9A009898980042424200AC82BF00B883D000B27CCC00A672C100A36FC2008D5D
      B0007D4FA4006B3F960075449C00854DA7009858B4008B4FAC0079429F006534
      93006D399A00844EAC00834BAD009652BE000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF000000000000FF000000000000000000000084000000000000000000000084
      8400008484000084840000848400008484000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000009A9A
      9A00A4A4A40095959500B1B1B100B3B3B300B4B4B400B4B4B400B4B4B400B4B4
      B400BABABA00979797009696960096969600A2A2A200B8B8B80076767600AA78
      C100AF76CB00AD74CD009E67C0008B56B1007745A000643592006E3A98007E43
      A300914EB0008445A70071389B005E2B8F00622D9300783FA5009457BB009154
      BB00000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000000000FF0000000000000084
      0000000000000000000000000000000000000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000009F9F9F00B7B7B700B4B4B400B1B1B100AEAEAE009494
      9400C2C2C200C1C1C100BCBCBC00ACACAC00ACACAC00ADADAD00CAC9CA00ECE2
      EF00E2DBE4009D9C9D0094939400B073CE00A96BCA009B60BE009358BA008048
      AB006C379B005A278C00642C920074349D00873FAA007B36A20068299500551C
      89005D2391007437A3008F4FB900B065D0000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF000000000000FF000000840000008400000000000000000000008400000000
      0000008484000084840000848400008484000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848400000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008484840000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000C6C6C600C0C0
      C000D1D1D100BABABA00B8B8B800BBBBBB00B5B5B500B5B5B500B4B4B400B4B4
      B400B5B5B500B6B6B60088868900F1E8F400B091BF00B98BD200A875C200B170
      D300A564C8009758BC008D4EB600793EA700662D9700531D88005D228F006D2B
      9A008136A600742D9E0062219300571C8C0062269500783BA5008945AF00AF61
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF000000000000FF00000084
      0000008400000084000000840000000000000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      000084840000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000C2C2C200B6B6B600A9A9A900D0D0D000C1C1C100BFBF
      BF00BEBEBE00BDBDBD00BDBDBD00BDBDBD00BEBEBE00BFBFBF00B8B8B8007E7E
      7E00B590C900B985D600B474D600AE68D300A35FCA009753BF008645B2007334
      A3005F2493004D14840057198B00682397007C30A400762EA1006C2A9A00531B
      8400470F780061238E008540AC00AF61CE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00008400000000000000000000008484000084
      8400008484000084840000848400008484000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00008484000084840000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF00000000008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DDDD
      DD00A1A1A100C5C5C500CACACA00C9C9C900C7C7C700C7C7C700C7C7C700D7D2
      D900D0CFD100C9C9C900E0E0E00080808000897C8F00B57FD300AE7BCF00B080
      D000B085D000AB81CB00A077C3009369B9008356AC006A3D98005A2788005E1F
      86007B2D98006F249000571481003C046E00430C760061238E008540AC00AF61
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000084840000FFFF0000FFFF0000FFFF000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484000000000000FFFF
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF000000000000FFFF0000FFFF00000000008484
      8400000000008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0F0F000D5D5D500D5D5D500D5CD
      D800F3EBF600D0D0D000DFDFDF009590970096929700D1D1D100CCC7CE00EAE1
      ED0099949B00BD93D700C08BDB00C089DB00BD86D900B27ED000A373C2009164
      B3007E55A3006D469400744999008453A500AF76C700A975C6008152A9004415
      75003E0A710061238E008540AC00AF61CE000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000084840000FFFF00000000000000000000848400008484000084
      8400000000000084840000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084840000848400008484000000000000FFFF000084840000848400008484
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000084848400000000008484840000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B4B4B40079767B00BFB7C10093939300DDDDDD00F0EEF100F1E7
      F3009D94A400D4B0ED00E2C4F100EBD3F300ECCCF600E2B9F000D6A3E900D19A
      E600CA92E100BA85D500A977C7009667B7008256A700704698007A4B9F008A54
      AA009D5FB6009056AE007D48A2006E3D99006E3F99007746A5007D43A900AE60
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000848400000000000084840000FF
      FF00000000000000000000848400000000000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000084840000848400008484
      000000000000FFFF000084840000848400008484000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000008484
      8400000000008484840000000000848484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E3E3
      E30000000000918A9600C3BCC500D0CBD100A18CB100D4B0ED00E4C6F400F2D8
      FA00EACAF500DFB6EF00D29DE600CB91E300C289DD00B37CD100A26DC3008F5D
      B3007B4CA300693D950073419B00834AA6009655B3008A4CAB00773F9E006432
      9200693698008049AA008E55B5009252BC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000008484000000000000848400000000000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848400008484000084840000848400008484000000000000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000FFFFFF000000000000000000000000008484840000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000986EC300AC80D800B68B
      E000C29AE500D1ACEB00DFBEF100ECCFF700E4C0F200D9ACEB00CB93E300C388
      DF00BC7FD900AD73CE009C64BF008954B00075439F00633391006C3898007D41
      A200904CAF008343A70071369A005D298E00612C9200783EA4009356BA00985B
      C100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000084
      8400000000000084840000000000008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000084840000848400008484
      0000848400008484000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF0000000000FFFFFF00000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008E5EBD00A678D500B082DC00BC91E100CAA2E700D9B5ED00E5C5
      F300DDB6EE00D2A3E700C48ADF00BD7EDB00B576D600A769CA00955BBB00824B
      AC006E3A9C005C2A8D00662F940076389F008A43AB007D3AA3006A2D97005720
      8A005E2591007539A3009151B900AE66CF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000840000008400000084000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848400008484000084840000848400008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007437AE00955DCD00A979
      D800B587DD00C398E300D2ACEA00DFBBEF00D7ADEA00CC99E400BD81DB00B675
      D800AF6DD200A060C6008F52B7007C42A8006831980056218A0060269000702F
      9B00833AA8007731A00064249400571D8C0062289500793CA7008E4DB400AF61
      CE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      8400000084000000840000008400000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000084840000848400008484
      0000848400008484000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007437AE008A4BC9009C5FD600B079DF00C796E800D2A7EA00D6AE
      EA00CD9FE500C18CDE00B473D600AB66D100A25DCA009350BD008242AF007032
      A0005E2392004F1686005A1C8E006C289A008137A9007C35A500662592004008
      7200430C760061238E008540AC00AF61CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000084000000840000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400008484000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007437AE008A4BC9009C5F
      D600B079DF00C896E900D9B1EE00EDD7F500E6CEF100D8B0E800DCBBEA00E0BF
      EC00DEB9EB00D9B1E800D3A9E400CDA1E000C298DA00AF83CC009264B400844C
      A6008E46A8006A248C0053137D003B046E00430C760061238E008540AC00AF61
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000008484000000000000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084840000848400008484
      0000848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007437AE008A4BC9009256CD00A675D300DCBDED00EDC7F400EEBB
      F400EAA7F100E8A4F000E5A0EE00E39DED00E29BEC00DF98EA00DB94E700D78E
      E500D188E100CA82DC00C27DD800BC7AD400BA7AD200B075CC009A65BF007847
      A400451476005E218B008540AC00AF61CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007337AD008D58C300C495
      DD00C687DA00D091E100D999E700DFA1EB00DE9EEA00DB9AE800D794E400D491
      E300D28EE100CF8ADF00CB85DD00C680DA00BF79D600B873D100B26FCD00AC6C
      CA00A76AC5009E63BF008F54B700874CB3006D32A3007E48AE007638A200AF61
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400008484
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C5BBC00985AB900A76BC400B579CF00C186D700CC90DE00D499
      E400D196E200CD90DF00C687D900C383D700C07FD600BD7BD400B976D200B470
      CF00AE69CB00A762C500A15FC1009C5DBE00975DBA008E56B4007C44AA006F35
      A3007B40AC008D52B800773AA6009651BE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000000000000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063279400783EA3008A52
      B1009B64BD00A974C800B682D100C08ED900BC88D500B680D000AB73C800A76D
      C500A568C300A263C2009E5DBF009957BC00924FB8008B49B3008647B0008246
      AC007E47A9007B46A800733CA5006C32A1007236A5008548B2009B61BF007A3F
      A100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008961B000622A94007641A3008855B0009867BC00A778C700B386
      D000AE7ECC00A674C5009964BB00945DB8009258B7008E52B5008B4BB3008645
      B0007F3CAB007736A6007436A300763CA5007B44A7007B46A800733CA5006F35
      A3007C41AD009055BA009A67BD008257AA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A282C1006E3C
      9D007747A500875AB100976DBD00A67EC8009F74C2009568BA008655AE00804D
      AB007E47A9007B40A8007739A5007333A300702EA1006E2DA0007134A200763C
      A5007B44A7007B46A8007E45AC00884FB400945DBD007B45A900AA8EC5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B69DCE007F52A9008F66B7009E7A
      C300956EBC00895FB300784AA5007342A200723DA2007238A2007234A2007131
      A300702EA1006F2FA1007639A5008247AD00905AB7009964BD00834FAF006631
      9800B69ECD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E4DBED00B79FCE008A64B0006F3E9E006E3C
      9E006E399E007038A0007037A1006F33A0006C309D00672D9900652F97007C50
      A600AD92C700E5DDEE0000000000000000000000000000000000000000000000
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEDEDE00D6DEDE006B737300100808001810080008080000C6CECE00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEDEDE00C6CECE00A5A5AD000000000029181000000000004A31
      21007B4A3900844A390031212100FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF00ADB5B500ADADAD00ADADB50010101000180808001008
      000039291800A56B4A006B422900393129007B6B6B00E7AD9400B5735A00E7D6
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9CA5008C8C94008C949400424A4A00000000002110
      0800100000002108000039211000945A3900A57352009C8C7B00DEAD9400EFD6
      CE00F7FFFF00E7EFF700D6A59400523931000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B5B5B500737B7B0073737300000000002910
      08001808000021100800211008006B422900BD735200C6A5940084848400E7C6
      B500FFDECE00D6DEE700EFF7FF00C6BDBD00947B7300FFFFFF00BDBDC6005242
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFEFEF005A5A5A005A5A5A005A5A63000808
      080021100000311810003121180039211800B56B4A00DEA58C00ADADA500BDB5
      AD00FFE7D6000000000000000000F7FFFF00E7DEDE00AD8C7B009C847B006B52
      42004221080084736300C6BDBD009C8C84008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000084000000000000008400000000000000840000000000000084
      0000000000000084000000000000008400000000000000840000000000000084
      0000000000000084000000000000008400000000000000840000000000000084
      0000000000000084000000000000008400000000000000840000000000000084
      0000000000000084000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000084840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242002929
      2900000000004A291800422110004A2921002918100094634200D6947300BDBD
      BD00F7E7D600FFFFF7000000000000000000EFF7F700CEAD94009C7B6B006B5A
      4A006B5242005A392100391810006B4A31009C7352004A291800B5B5B500ADAD
      A5006B524A000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00008484008484840000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000735239006B423100422921007B523900EFD6
      C600CECECE00EFE7DE00FFFFF7000000000000000000EFF7FF00CEB5A5009C73
      63006B524A00523921004A291800392110005A3921009C7352009C6B4A00AD7B
      5A00BD8463009C7352006B5A4A00B5ADA500BD9C840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400C6C6C6000000
      000000000000FFFFFF0000FFFF0000FFFF000084840000000000C6C6C6008484
      8400848484008484840084848400848484008484840000000000000000000000
      000000000000000000000000000000000000000000000000000018101000AD73
      5A0084523900C6AD9C00F7F7EF00000000000000000000000000F7F7F700C6BD
      B500A5735A00634A4200523929005A3121004A2918009C6B4A00D6946B00AD7B
      5A00AD7B5A00B5845A00B5845A00B57B5A00AD7B5A00B57B5A005A423100BDBD
      BD008C8484005A5A5A00F7F7F700000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000FFFF0000000000FFFFFF0000FF
      FF0000FFFF000084840000000000848484000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000018101000A56B4A009C847B0000000000F7F7F700E7E7
      DE00C6BDBD009C7B6300634231004A3121005A39290052392100845A4200DE9C
      7300C68C6300DE947300CE946B00E79C7300AD7B5A00AD7B5A00AD7B5A00AD7B
      5A00AD7B5A00B57B5A00A57352006B524A00BDB5B500392110007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000008400000000000000000000000000000000
      00000084000000000000C6C6C6000000000000000000C6C6C600000000008484
      8400848484008484840000000000000000000000000084848400848484008484
      8400000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000000000FFFFFF0000FFFF0000FFFF00008484000000
      0000FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000845A
      3900B5948400E7DEDE007B6B630042211000523921005A4229006B4231006B4A
      3100D6946B00D6946B00D6946B00D6946B00DE947300CE8C6B00DE947300B57B
      5A00AD7B5A00AD7B5A00AD7B5A00AD7B5A00AD7B5A00B57B5A00A57352005A42
      3100CEC6C60094847B00B59C9400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000084000000840000008400000084
      0000000000000000000000000000000000000084000000000000C6C6C600C6C6
      C600C6C6C600C6C6C60000000000008400000084000000840000008400000084
      0000008400000084000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF000000
      0000FFFFFF0000FFFF0000FFFF000084840000000000C6C6C600840000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000042424200000000008C634200734A31005A4229007352
      3900AD7B5A00CE946B00E79C7300D6946B00D6946B00CE946B00D6946B00D694
      6B00D6946B00DE947300B57B5A00AD7B5A00AD7B5A00AD7B5A00B5845A00BD84
      6300BD8C6300B5845A00AD7B5A00734A31009C846B00AD9C9400846B5A00D6D6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000008400000084000000840000008400000000000000000000000000000000
      0000008400000084000000000000000000000000000000000000008400000084
      0000000000000084000000000000008400000000000000840000000000000084
      0000000000000084000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF0000000000FFFFFF0000FFFF0000FF
      FF000084840000000000FFFFFF00000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A52
      520008000000AD7B5A00C68C6B00EFA57B00C68C6300EF9C7300BD846300E79C
      7300C68C6300DE946B00D6946B00D6946B00CE8C6B00B5845A00AD7B5A00B57B
      5A00BD846300BD8C63009C6B520073523900634A31009C735200BD8463009C6B
      4A0063524A00D6D6CE005A3929009C9494000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00000000000000000000000000FFFFFF000000000000000000FFFF
      FF00000000000000000000000000000000000084000000840000008400000084
      0000000000000000000000000000000000000084000000840000008400000084
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF0000000000FFFFFF0000FFFF0000FFFF0000848400000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CECECE0021100000DE9C7300DE946B00CE94
      6B00D6946B00CE8C6B00D6946B00CE8C6B00D6946B00D6946B00DE947300BD84
      6300AD7B5A00B5846300C68C6300B57B5A006B4A39007352390073523900845A
      4200000000008C634A00BD8C63009C6B4A005A423100CEC6B500B59C8C00735A
      4A00CECECE000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000000000FFFF
      FF0000FFFF0000FFFF000084840000000000C6C6C60000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7EF
      EF00737373007B523900DE9C7300D6946B00CE8C6B00D6946B00CE8C6B00D694
      6B00CE8C6B00DE947300C68C6300B58463007B5A420063423100312918004231
      2100845A42007B5A42009C735200C68C63008C634A0042312100A5735200AD7B
      5A007B5231008C736300D6D6CE005A423900B5ADA50000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF0000000000000000000000000000000000FFFF0000FFFF0000000000000000
      000000000000000000000000000000000000FFFF0000FFFF000000000000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000FFFF0000000000FFFFFF0000FFFF0000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5ADAD0031181000EFA57B00CE8C
      6B00D6946B00CE8C6B00DE947300CE946B00E79C73009C6B4A00523929006342
      3100845A4200946B4A007352390084634200BD8C6300BD846300B5846300B57B
      5A00C68C630018100800946B4A00BD8C6300946342006B5A5200D6DEDE00AD8C
      7B00E7D6C6000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF000000000000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000000000FFFFFF0000FFFF0000FFFF000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFF7F7006B7373005A392100EFA57B00CE8C6B00DE947300B57B5A005A42
      290063423100735239009C6B4A008C634A00AD7B5A00BD846300C68C63009C73
      5200181008002118100018101000181008008C634A009C73520031211800AD7B
      5A00B57B5A007B5A39008C848400CEB59C004A392900CECECE00000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000084840000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      000084000000FFFFFF00840000000000000000FFFF0000000000FFFFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C94940063422900DE94
      6B00DE947300BD84630029211800A5735200A57B5A0063423100211010002118
      10008C634A00C68C6300946B5200101008000800000000000000000000006B4A
      3100BD8C6300BD84630018101000AD7B5A00BD84630084523900736B6300D6D6
      D6007B5A4A00D6C6BD00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084840000848400008484
      0000000000008484000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      000084000000840000008400000084000000FFFFFF00FFFFFF00840000008400
      00000000000000FFFF0000000000FFFFFF000000000000FF0000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF005A63630084523100E79C7300D6946B005A392900C68C
      63007B5A4200000000007B523900E79C73008C634A00845A4200000000002918
      1000CE8C6B001008080042312100A57352008C634A008463420063423100946B
      4A00B58463008C634A00734A3100BDADA500BDA59400946B4A00EFEFE7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848400008484000084840000848400008484
      0000000000000000000000000000000000000084840000848400008484000000
      0000000000008484000084840000000000008484000000000000848400000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF00840000008400
      000084000000FFFFFF008400000084000000FFFFFF0000000000C6C6C6000000
      0000FFFFFF0000FF000000FF0000008400000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C9494005239
      2900D68C6B00CE8C63006B4A3100A57352008C634A0029181000845A4200FFBD
      94007B52390029181000211810004A312900FFBD8C00C6846300181008000000
      00001010080031211800946B4A0018101000BD8C6300BD846300734A31008473
      6300D6D6D60039313100DEE7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      0000000000000000000084840000848400008484000084840000000000000000
      0000008484000084840000000000000000000000000084840000000000008484
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000008400
      0000FFFFFF0084000000840000008400000084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FF000000000000FFFFFF0000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000039424A0084523900EFA57B00BD8463004A39
      2100BD8C6300C68C6300C68C6B00A5735200E79C7300D69C7300CE946B00BD84
      630073523900D694730094634A0021181000AD7B5A00C6946B00A57B5A004231
      21007B5A4200BD8463008C634A00734A3100B5AD9C009C736300E7C6B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848400008484000084840000848400008484000084840000848400008484
      0000000000008484000084840000848400008484000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000000000000848400000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF00FFFFFF008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FF000000000000FFFFFF0000000000FF00FF0084008400000000000000
      000000000000000000000000000000000000000000000000000000000000A5A5
      A5007B524A00CE846300D6946B0094634A00946B4A008C634A00634231000000
      00001810100063423100634A310039291800080808007B523900312118002118
      10005A4229009C735200BD8463009C73520039291800BD846300BD8C63006B4A
      29008C8C9400CEB5AD005A392900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000084840000848400008484
      0000000000008484000000000000000000008484000000000000848400008484
      0000848400000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000008484000084840000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000008400
      0000FFFFFF00FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000FF000000000000FF00
      FF00FF00FF00FF00FF0084008400000000000000000000000000000000000000
      00000000000000000000000000000000000021292900AD6B4A00EFA57B00B57B
      5A0063422900A573520008080000422921008C634A0000000000000000005239
      29009C6B5200E79473006342310052392900523929009C735200BD8C6300A573
      52006B4A3100BD846300BD8463006B4231008C736300CECEC600423131000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848400008484000084840000848400008484000084840000848400008484
      0000000000008484000084840000000000000000000000000000000000000000
      0000000000000000000000000000008484000084840000848400000000000000
      0000000000000000000000000000000000008484000084840000848400000000
      00000000000000000000FFFFFF00FFFFFF008400000084000000840000008400
      0000FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF00FFFFFF008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C600000000000000FF0000FFFF00FF00FF00FF00FF00FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60042393100C6846300D6946B0073523900946B4A009C6B5200AD7B
      5A00FFB58C00BD7B5A007B5A4200BD846300BD846300E79C7300FFB58400D694
      6B00C68C6300B584630073523900634229004A312100845A4200BD846300A573
      52006B422900ADA5A500AD846B00000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400000000000084840000848400008484
      0000000000008484000000000000848400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400008484
      0000848400000000000084840000000000000000000000000000FFFFFF008400
      000084000000FFFFFF00FFFFFF008400000084000000FFFFFF00840000008400
      0000FFFFFF00FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000000000
      FF0000FFFF00FF00FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021292900C6845A00DE9C
      7300B57B5A0063423100C68C6300B5845A00B5845A00FFAD8400C68C6300AD7B
      5A00AD7B5A00B57B5A00CE946B008C6342005239290063422900634231006342
      31005A3929006B4A3100BD846300BD8C63006342310094735A00CEBDB5000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848400008484000084840000848400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000848400008484000000000000000000848400008484
      0000848400008484000084840000848400000000000084840000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      000084000000FFFFFF008400000084000000FFFFFF00FFFFFF00FFFFFF008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6D6D60042312900DE946B00D6946B009C6B4A007B523900BD84
      6300AD7B5A00B5845A00AD7B5A009C7352005A39290052392900523929006342
      31006B4A39006B4A3900DE946B00D6946B00734A3900634231007B5A4200B584
      6300AD7B5A0063422900BDBDBD00000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000848400008484
      0000000000008484000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF008400
      000084000000840000008400000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0031312900AD7B
      5A00E79C73008C634200734A3900AD7B5A00A57B52005A4229004A3121005A39
      29006B4A3900845242006B4A3900C6846300C68C6300D68C6B0094634A00A573
      52006B4239005231290073523900BD846300B5845A00634A3100946B52000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400008484000084
      8400000000000000000000000000000000000000000084840000848400008484
      0000848400008484000084840000848400008484000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF008400000084000000840000008400
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEDEDE0018100800DE9C7300E79C73007B5239004229
      1800523929008452420094634A00734A3900AD735200EFA57B00C68C6300CE8C
      6B009C63520063423100634231005A3931005A4229005A392900AD735200DE9C
      7300B5845A00AD7B5A005A392900000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000848400008484000084840000000000000000008484
      0000848400008484000000000000000000000000000084840000000000008484
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7EF005A52
      4A00BD7B5A00DE947300B57B5A006B4231006B423900EF9C7B00D68C6B008C5A
      4A00BD7B63007B52420073523900523929005A3929006342310063423100845A
      4200B5845A00DE946B00D6946B00E79C7300D6946B00BD8C6300312110000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000008484
      0000848400008484000084840000848400000000000000000000000000000000
      00000000000000000000FFFFFF008400000084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6CECE0021080000F7AD7B00E79C73007B52
      39005A392900BD7B63007B4A3900523929004A3121005A3929007B5239007B52
      39007B523900AD7B5A00D6946B00EFA57300E79C7300E79C7300F7A57B009C63
      4A004A311800523921005A5A5A00000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400008484000084
      8400008484000084840000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400008484000084840000848400000000
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      000084000000FFFFFF00FFFFFF008400000084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7E7
      E70063635A00845A4200E79C73009C6B52005A39290042292100523929007B5A
      42008C6342009C6B4A00E7A57300DE9C7300E79C7300EFA57B00E79C73009463
      4A005A3121004A3118006339210052524A007373730073737B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400008484000084840000848400000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF008400000084000000840000008400
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5ADB50031180800EFA57B00E79C
      73009C6B4A009C6B4A008C634A00DE9C7300DE9C7300EFA57300E79C7300EFA5
      7300AD7352005A3929003121100029181800848C8C00848C8C0084848C00DEDE
      DE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848400000000000084840000848400008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7E7E7007B736B008C5A4200DE9C7300E79C7300E79C7300EFA57B00DE94
      6B00DE9473006B423100311810003121180010080000848C8C00A5ADAD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C94940039211000EFA5
      7B00AD735A002921180029211800291810002918100052525200BDC6C600C6C6
      C600C6C6CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700737373002110100010080800B5B5B500D6D6DE00D6DE
      DE00D6D6DE00EFEFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840000000000848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000084848400848484000000
      0000000000000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000008400000084000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000848484008484
      8400000000000000000000000000848484008484840000000000000000000000
      000084848400848484000000000000000000FFFF0000FFFF0000000000000000
      0000000000000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008484840000008400000000008484840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000008484840084848400000000000000
      0000000000008484840084848400000000000000000000000000848484000000
      0000FFFF0000FFFF000084840000000000008484840000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000000000000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000084848400000084000000
      0000848484000000840000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000848484008484840000000000000000000000000084848400848484000000
      0000000000000000000084848400848484000000000000000000000000008484
      840084848400000000000000000000000000FFFF0000FFFF0000848400008484
      0000000000008484840084848400000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000084840000FFFF000084840000FFFF000084
      840000FFFF000084840000848400008484000084840000000000000000000000
      00000000000000FFFF0000FFFF000084840000FFFF0000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000000000000000000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000084840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000848484008484840000000000000000000000
      0000848484008484840000000000000000000000000084848400848484000000
      0000FFFF0000FFFF000084840000848400008484000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000084840000FFFF000084840000FF
      FF000084840000FFFF0000848400008484000084840000848400008484000084
      84000084840000000000008484000000000000FFFF0000FFFF00008484000084
      8400000000000084840000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000000000000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000008400000084000000
      0000000084000000840000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000848484000000000000000000000000000000
      0000848484000000000000000000000000008484840084848400000000000000
      0000000000008484840084848400000000000000000000000000848484008484
      840000000000000000000000000000000000FFFF0000FFFF0000848400008484
      0000848400008484000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000008484000000000000FF
      FF0000FFFF000000000000FFFF000084840000FFFF0000848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000000000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF000084840000848400008484000084
      8400008484000084840000848400008484000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000FFFF0000FFFF000084840000848400008484000084840000848400000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000084840000848400008484000084840000FFFF00C6C6
      C60000FFFF00C6C6C60000848400C6C6C6000084840000848400008484000084
      840000000000008484000084840000FFFF0000FFFF0000FFFF0000FFFF000084
      8400008484000084840000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000000000000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000084848400000084000000
      0000848484000000840000008400000000000000000000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000000000000000008484840000000000FFFF0000FFFF0000848400008484
      0000848400008484000084840000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000848400008484000000000000FFFF000084840000FFFF000084
      840000FFFF0000FFFF00008484000084840000FFFF000084840000FFFF000084
      840000FFFF000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000FFFF0000FFFF000084840000848400008484000084840000848400000000
      0000848484008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF000084840000FFFF000084
      840000FFFF000084840000848400008484000084840000848400008484000000
      000000FFFF000084840000FFFF00008484000084840000FFFF000084840000FF
      FF0000FFFF0000FFFF0000848400008484000084840000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000000000000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000008484840084000000840000008400
      0000840000008400000084000000848484000000000000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000848400008484
      0000848400008484000084840000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000FFFF000084840000FF
      FF000084840000FFFF000084840000FFFF000084840000FFFF00008484000084
      84000084840000848400008484000000000000FFFF000084840000FFFF000084
      8400008484000084840000FFFF0000FFFF0000FFFF0000848400008484000084
      840000FFFF000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008400000084000000840000008400000084000000840000008484
      8400000000000000840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000084840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000008484840084848400848484008484840084848400848484000000
      0000FFFF0000FFFF000084840000848400008484000084840000848400000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000008484000084840000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000084840000FFFF00008484000084840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000084840000FFFF000084840000000000000000000000
      0000000000000000000000000000000084000000000084848400840000008400
      0000840000008484840084000000840000008400000000000000000000000000
      0000000000000000000000000000000084008484840084000000840000008400
      0000840000008400000084000000848484000000000000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400848484008484
      840084848400848484008484840000000000FFFF0000FFFF0000848400008484
      0000848400008484000084840000000000008484840084848400000000000000
      0000000000000000000000000000000000000084840000000000000000000000
      0000000000000000000000FFFF000084840000FFFF000084840000FFFF000084
      84000084840000848400008484000000000000FFFF000084840000FFFF000084
      8400008484000084840000FFFF0000FFFF000000000000FFFF00008484000084
      840000FFFF000000000000000000000000000000000000000000000084000000
      8400848484008400000084000000840000008400000084000000840000008400
      0000840000008484840000000000000084000000000000000000000084000000
      8400848484008400000084000000840000008400000084000000840000000000
      0000848484000000840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF000084840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848400000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000FFFF0000FFFF000084840000848400008484000084840000848400000000
      0000848484008484840000000000000000000000000000000000000000000000
      000000000000008484000000000000FFFF000084840000FFFF000084840000FF
      FF000084840000FFFF000084840000FFFF000084840000848400008484000000
      000000FFFF000084840000FFFF0000848400008484000084840000FFFF0000FF
      FF0000FFFF0000FFFF000084840000FFFF000084840000000000000000000000
      0000000000000000000000000000000000008484840084000000840000008400
      0000840000008400000084000000840000008400000084848400000084000000
      840084848400000000000000000084848400FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000008484840000000000000000000000
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000848400000000000084848400848484008484
      840084848400848484008484840000000000FFFF0000FFFF0000848400000000
      0000000000008484000084840000000000008484840084848400000000000000
      0000000000000000000000000000000000000084840000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000848400008484000000000000FFFF0000848400008484000084
      8400008484000084840000FFFF0000FFFF0000FFFF000084840000FFFF000084
      840000FFFF000000000000000000000000000000000000000000840000008400
      0000848484008400000084000000840000008400000084000000840000008400
      0000840000008484840000000000848484000000000000000000000000000000
      0000FF000000FF000000FF00000084000000FF000000FF000000FF0000000000
      0000848484000000000000008400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00008484000084
      840000848400008484000084840000848400008484000084840000000000FFFF
      FF00FFFFFF000000000000000000000000000084840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840000000000FFFF00008484
      0000848400000000000084848400848484008484840084848400848484000000
      0000FFFF0000FFFF000000000000848484000000000084840000848400000000
      0000848484008484840000000000000000000000000000000000000000000000
      000000000000000000000084840000000000000000000000000000FFFF00C6C6
      C600C6C6C600C6C6C60000848400C6C6C60000848400C6C6C600008484000000
      000000FFFF0000FFFF0000848400008484000084840000848400008484000084
      8400008484000084840000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000084000000840000008484840084000000840000008400
      0000840000008400000084000000840000008400000084848400840000008400
      00000000000000000000FF000000FF00000084000000FF000000FF000000FF00
      0000FF000000FF000000FF000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      84008484840000000000FFFF0000FFFF00008484000084840000000000008484
      840084848400848484008484840000000000FFFF0000FFFF000000000000FFFF
      FF00000000008484000084840000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400008484000084840000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00008484000084
      840000FFFF000084840000848400008484000084840000FFFF0000FFFF000084
      8400000000000000000000000000000000000000000000000000840000008400
      0000848484008400000084000000840000008400000084008400840000008400
      0000840000000000000084000000840000000000000000000000FF000000FF00
      000084000000FF000000FF000000FF000000FF000000FF000000FF0000008400
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000084840000848400008484000084
      84000084840000848400008484000084840000000000FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00008484000084840000000000008484840084848400848484000000
      0000FFFF0000FFFF000084840000000000000000000084840000848400000000
      0000848484008484840000000000000000000000000000000000000000000000
      00000000000000000000008484000084840000000000000000000000000000FF
      FF000084840000FFFF000084840000FFFF000084840000FFFF000084840000FF
      FF000000000000FFFF0000FFFF00008484000084840000848400008484000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008484
      8400848484008400840084848400840000008400000084848400840000008400
      00000000000000000000FF000000FF00000084000000FF000000FF0000000000
      0000FF000000FF000000FF00000084000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000084840000848400008484000084840000848400008484
      00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000848400008484
      000000000000848484008484840000000000FFFF0000FFFF0000848400008484
      0000848400008484000084840000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000084840000FFFF000084840000FFFF000084840000FFFF000084
      840000FFFF000084840000FFFF000084840000FFFF000000000000FFFF0000FF
      FF00008484000084840000FFFF000084840000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084000000000000000000000084008400000000008400
      0000840000008400000084000000840000000000000000000000FF000000FF00
      000084000000FF000000FF00000000000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000848400008484000000000000848484000000
      0000FFFF0000FFFF000084840000848400008484000084840000848400000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000008484000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000FFFF0000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000840000008400000084000000FFFF
      FF00FFFFFF0084008400FFFFFF00840000008400000084000000840000008484
      84000000000000000000FF000000FF00000084000000FF000000000000000000
      000000000000FF000000FF000000FF0000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF0000FFFF
      000084840000000000008484840000000000FFFF0000FFFF0000848400008484
      0000848400008484000084840000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      840000000000000000000000000000FFFF0000FFFF0000FFFF00C6C6C6000084
      8400C6C6C60000848400C6C6C60000848400C6C6C60000848400000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000FFFFFF00FFFFFF0084008400FFFFFF008400
      0000840000008400000084000000000000000000000000000000FF000000FF00
      0000FF000000FF00000084848400FFFFFF00848484000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FF000000FF00000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF00FFFF0000FFFF0000848400000000000084848400848484000000
      0000FFFF0000FFFF000084840000848400008484000084840000848400000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400008484000084
      840000848400C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000840000008400000084000000FFFF
      FF00FFFFFF0084008400FFFFFF00840000008400000084000000840000000000
      00000000000000000000FF000000FF000000FF00000000000000FFFFFF00FF00
      0000FFFFFF000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFFFF00FFFF0000FFFF0000848400000000
      000084848400848484008484840000000000FFFF0000FFFF0000848400008484
      0000848400008484000084840000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      84000084840000848400C6C6C60000000000000000000000000000FFFF000084
      840000FFFF000084840000FFFF000084840000FFFF000084840000FFFF000084
      840000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000FFFFFF00FFFFFF0084008400FFFFFF008400
      000084000000840000008484840000000000000000000000000084848400FF00
      0000FF00000000000000FFFFFF00FF000000FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840084008400840084008400840084008400840084008400840084008400
      8400FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00008484000000000000848484008484840084848400848484000000
      0000FFFF0000FFFF000084840000848400008484000084840000848400000000
      0000848484008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000848400008484000000000000FF
      FF000084840000FFFF000084840000FFFF000084840000FFFF000084840000FF
      FF000084840000FFFF000084840000FFFF000084840000FFFF00008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000840000008400000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000008400000084848400000000000000
      000000000000000000000000000084848400FF00000000000000FF0000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0084008400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF00008484000000000000848484008484
      840084848400848484008484840000000000FFFF0000FFFF0000848400008484
      0000848400008484000084840000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400008484000084840000848400000000000000
      0000000000000000000000000000000000000084840000848400008484000084
      8400008484000084840000848400008484000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00008484
      0000000000008484840084848400848484008484840084848400848484000000
      0000FFFF0000FFFF000084840000848400008484000084840000848400000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C60000FFFF0000FFFF0000FFFF0000FFFF000084840000FF
      FF000084840000FFFF000084840000FFFF000084840000000000000000000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000084000000
      8400000084000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF008400
      8400840084008400840084008400840084008400840084008400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000000000000000000084848400848484008484
      84008484840084848400848484008484840000000000FFFF0000FFFF00008484
      0000848400008484000084840000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008484000084840000848400008484000084
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084840000FFFF000084
      840000FFFF000084840000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000084000000840000008400000084008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0084008400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      84008484840000000000FFFF0000FFFF00008484000084840000848400000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      84000084840000FFFF000084840000FFFF000084840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000084840000FFFF000084840000FFFF00008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000000840000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840084848400848484008484840084848400848484008484840000000000FFFF
      0000FFFF00008484000084840000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000848400008484000084840000FFFF000084
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084
      8400008484000084840000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00840000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000FFFF0000FFFF0000848400000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000084840000FFFF000084840000FFFF000084840000FF
      FF000000000000000000000000000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840000000000FFFF0000FFFF0000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084C6840042A56300426363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084C6840042A5630042844200006321000021
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C0000009C0000009C0000009C0000009C0000009C0000009C0000009C00
      00009C0000009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084C6A50042A5630042A56300428442000084
      2100008421000063210000842100008442000021000000422100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5ADB50000000000B5ADB500B5ADB5009CA5AD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C000000000000009C00
      00009C0000009C0000009C0000009C0000009C0000009C000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084C6A50042A5630042A5
      6300428442000084210000842100008421000063210000842100006321000084
      2100004200000021000084C68400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009CA5AD000821390008213900637394006373940063739400315A6B000821
      39000821390008213900082139000821390010394A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C000000000000009C000000000000009C0000009C0000009C0000009C00
      00009C0000009C00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084C6A50084C6840042A5
      6300008421000084210000632100006321004284420000842100008421000063
      2100006321000084210000842100008421000084210000842100002100008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840018396300315A6B000821390018396300315A
      840084848400315A6B0010394A00183963000821390008213900082139000821
      390008213900315A6B0010394A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009C9C0000000000009C9C0000000000009C9C00CECECE00CECECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084C6840042A56300428442000084210000632100006321004284420042A5
      630084C6A5000084210000634200006342000042420000632100008421000063
      2100008421000063210000422100002100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000738C9400315A6B00315A
      6B001839630010394A0052637B00738C940018396300315A6B00082139000821
      3900315A6B000821390010394A001839630010394A000821390008213900315A
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009C9C000000000000000000009C9C0000000000009C9C0000000000009C
      9C0000000000009C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084C6840042A5630042A56300008421004284420000842100006321004284
      6300000000000000000000000000000000000000000042A5A5004284840042A5
      C60042A5C6000042420000844200008421000084210000632100006321000063
      21000042000084C6840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000315A6B0018396300637394009CA5AD0052637B0010394A001839
      6300000818000008180000000000000000000000000000000000000818000821
      3900000000000000000008213900000818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000009C9C0000000000009C9C0000000000CECE
      CE00009C9C0000000000009C9C00CECECE00009C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084C6A50042A5630042A5630042844200008421000063
      2100008421000084210042844200000000000000000000000000000000000000
      000084A5FF0042A5C60000A5C60042A5C60042A5C60000424200004221000084
      210000632100006321000063210000842100004221000042000084C684000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840008213900183963006373
      9400CED6DE009CA5AD0018396300082139000821390000081800000000000000
      0000000000000008180008213900082139000000000000000000000818000821
      390010394A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000009C9C00009C9C00009C9C000000
      00000000000000000000CECECE00009C9C00CECECE00009C9C00009C9C00009C
      9C0000000000009C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000428442004284
      42000063210000632100008421000084210000632100008442000084630084A5
      FF0084A5A50000000000000000000000000084A5FF0000A5C60000A5C60000A5
      C60000A5FF000042420000422100006321000063210000842100008421000042
      0000006321000042000000420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000052637B00000818000821390063739400CED6DE009CA5AD00183963000821
      3900082139000008180000000000000000000008180000081800000818000008
      1800000000000000000000000000082139000008180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009C9C00009C9C00009C9C00009C9C00009C9C000000000000000000CECE
      CE00009C9C00009C9C00009C9C00009C9C00009C9C00000000000000CE000000
      CE000000CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000042A563000084420000842100008421000084
      210000842100008463004284840042A5FF004263840000426300424242004263
      63004263840000A5C60000A5FF0042A5FF0042A5C60000214200004263000042
      42000084420042A5630000632100004200000063210000632100008421000042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B5ADB5000821390000081800183963001039
      4A00CED6DE009CA5C600738C94006373940063739400315A6B0052637B005263
      7B0052637B00315A6B0008213900000818000000000000000000082139000000
      0000000000009CA5AD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000009C9C00009C9C00009C9C00009C
      9C00009C9C00009C9C00009C9C00009C9C0000000000009C9C00009C9C000000
      0000000000000000CE000000CE000000CE000000CE00009C9C00009C9C00009C
      9C00009C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000428463000063210000842100006321000063210042A5A50042A5A50000A5
      C6000063A5000042630042636300424242004263840000A5FF0000A5C60000A5
      FF0042A5C6000021420000426300004263000084420042A56300006321000042
      00000042000000632100004200000042000042A5630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000008180052637B009CA5AD006373940000000000CED6DE009CA5
      AD00B5ADB50063739400637394006373940052637B0018396300183963000821
      390010394A00315A6B0000081800000000000008180010394A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009C9C0000000000CECECE00009C9C00009C9C00009C9C00009C9C00009C
      9C00009C9C0000000000000000000000CE000000CE000000CE000000CE000000
      CE000000CE000000CE000000FF00FFFFFF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000084
      8400000000000000000000000000000000000000000000848400008484000084
      8400008484000084840000848400000000000000000000848400008484000000
      0000000000000000000000000000000000000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000042
      21000084420042A5A50000A5C60042A5FF000063A50000426300426363004263
      63004263840000A5C60000A5FF0000A5C60042A5FF0000426300004263000042
      6300004242004284630000632100008421004284420000632100004200000042
      0000004200000042000000000000000000000000000000000000000000000000
      0000000000000000000000000000315A6B006373940000000000315A6B009CA5
      AD00315A6B009CA5AD009CA5C600738C940063739400315A6B00183963005263
      7B00315A6B00082139001839630052637B00183963000821390008213900315A
      840052637B000008180000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000009C9C0000000000CECE
      CE0000000000009C9C00009C9C00009C9C00009C9C00009C9C00009C9C000000
      00000000CE000000CE000000CE000000CE000000CE000000CE00FFFFFF000000
      FF00FFFFFF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      00000000000000FFFF0000FFFF00848484000000000000000000000000008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004284630000A5C60000A5C60000A5
      C6000063A5000042420042636300426363004263840000A5FF0000A5FF0000A5
      C60042A5C6000042630000426300004263000042420000424200004221000084
      420042A56300008421000042000000632100004200000042000042A563000000
      0000000000000000000000000000000000000000000000000000000000006373
      9400315A6B009CA5AD0008213900738C940008213900000000009CA5C6000000
      0000315A6B00315A8400315A8400738C94001839630008213900315A6B006373
      94009CA5AD000821390008213900082139000008180010394A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009C9C0000000000009C9C00CECECE00009C9C00009C9C00009C9C00009C
      9C0000000000009C9C00009C9C000000CE00000000000000CE000000CE000000
      CE000000CE000000CE000000CE000000CE000000CE000000CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000FFFF00000000000000
      0000848484008484840084848400000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042A5C60042A5FF0000A5C6000063A50000214200002121000042
      42004263840042A5FF0000A5FF0000A5FF0042A5FF0000426300424242000042
      63000042630000426300004242000042210042A5630000842100004200000063
      2100006321000042000000420000002100000000000000000000000000000000
      0000000000000000000000000000315A6B0010394A0063739400082139009CA5
      AD00082139009CA5C60000000000ADC6CE00637394006373940018396300738C
      940010394A0010394A00315A8400637394008484840008213900082139000008
      1800000818000821390000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000009C9C00009C9C00009C
      9C00009C9C00009C9C00009C9C00009C9C00009C9C00009C9C000000FF00FFFF
      FF000000FF00000000000000CE000000CE000000CE000000CE000000CE000000
      CE000000CE000000CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00000000008484840000000000000000000000000000FF
      FF000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000A5C60000A5C60000A5
      FF00006384000021420000210000002100000063840000A5FF0042A5FF0042A5
      C60042A5FF000042630042638400424242000042630000426300004263000042
      4200008463000063210000420000006321000084000000842100008442000042
      210042A563000000000000000000000000000000000000000000000000006373
      9400082139006373940010394A00738C940010394A00738C940000000000CED6
      DE006373940063739400B5ADB50063739400315A6B0018396300315A6B00315A
      8400738C940010394A0008213900082139000000000008213900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009C9C00CECECE0000000000CECECE00009C9C00009C9C00009C9C00009C
      9C00009C9C00009C9C00009C9C000000FF00FFFFFF000000FF00000000000000
      CE000000CE000000CE000000CE000000CE000000CE000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000084000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000084000000840000008400000000000000000000FFFF00000000008484
      840000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042A5C60000A5FF0000A5FF000063A50000214200004263000063
      84004284A50042A5FF0042A5FF0042A5FF0042A5C60000426300424242004263
      8400004263000042630000426300004242000042210000424200004221000084
      2100006321000084210000422100004221004284630000000000000000000000
      0000000000000000000000000000315A8400082139009CA5AD0018396300738C
      94000821390000000000CED6DE00000000009CA5C6009CA5AD009CA5AD006373
      940018396300315A6B0018396300315A6B00EFEFEF0008213900082139000821
      3900000000000821390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE00009C
      9C0000000000009C9C00009C9C00009C9C00009C9C00009C9C00009C9C00009C
      9C00009C9C00FFFFFF000000FF00000000000000CE000000CE000000CE000000
      CE000000CE000000CE000000CE000000CE000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      00000000000000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000A5C60000A5FF0042A5
      FF0000A5C60042A5FF0042A5FF0042A5FF0042A5FF00006384000063840042A5
      FF0042A5FF000042420042424200424242000042420000426300424242000042
      42000042630000426300004242004284630084C6A50000000000000000000000
      000000000000000000000000000000000000000000000000000000000000738C
      940010394A000000000010394A009CA5AD0010394A000000000000000000B5AD
      B500ADC6CE00738C9400ADC6CE00637394000821390018396300183963005263
      7B00637394000821390008213900082139000000000010394A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CECECE0000000000CECECE00009C9C0000000000009C9C00009C
      9C00009C9C00009C9C00009C9C000000000000000000009C9C00009C9C00009C
      9C00000000000000CE000000CE000000CE000000CE000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF00FF00
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042A5FF0042A5FF0000A5C60042A5FF0042A5FF0042A5FF0000A5
      FF0042A5FF00002142000042630042A5FF0042A5FF0000426300426321004263
      6300004242000042630042636300002142000042630000424200004263000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400315A6B0000000000315A6B00EFEF
      EF0010394A00CED6DE00000000009CA5AD009CA5AD00ADC6CE00738C9400315A
      6B0010394A00315A84001839630018396300738C940008213900082139000821
      39000000000010394A009CA5C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE000000
      0000CECECE00009C9C00009C9C00009C9C00009C9C00009C9C00000000000000
      0000009C9C00009C9C00009C9C00009C9C00009C9C00000000000000CE000000
      CE000000CE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042A5C60000A5FF000042
      630042A5FF0042A5FF0000A5C60042A5FF0042A5FF00002142000063840042A5
      FF0042A5C6000042630084636300008442000042420042424200846363000042
      6300004263004242420000424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009CA5
      AD00315A6B00ADC6CE0010394A00CED6DE00315A6B0000000000000000009CA5
      AD009CA5AD00000000009CA5AD0063739400738C9400315A6B0018396300315A
      6B00637394000821390008213900082139000008180018396300ADC6CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CECECE0000000000CECECE00009C9C00009C
      9C00009C9C000000000000000000009C9C00009C9C00009C9C00009C9C00009C
      9C000000000000000000000000000000CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF00FF00
      FF00000000000000000084848400FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0084848400000000000000000000FFFF00000000008484
      8400FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042A5FF0042A5FF000042630042A5FF0042A5FF0042A5FF0000A5
      FF0042A5FF00006384000063840042A5FF0042A5C60000424200424242004263
      6300004242004221210042424200004263000042630042638400004263000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000738C9400738C9400ADC6CE0010394A000000
      000052637B00CED6DE00000000000000000000000000637394009CA5AD00315A
      840010394A001839630063739400315A6B006373940018396300082139000821
      3900000000001839630000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE000000000000000000009C9C00009C9C00009C9C00009C9C000000FF00009C
      9C00009C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00FF00FF00000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042A5FF0042A5FF000063
      840042A5FF0042A5FF0042A5FF0042A5FF0042A5FF0042A5FF0042A5FF0042A5
      C60084A5FF000000000084A5A5004263A5000042420042212100846363000042
      6300424242008484840042424200000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000315A
      6B0000000000CED6DE0010394A00CED6DE0063739400CED6DE00B5ADB5000000
      00009CA5AD00738C940084848400B5ADB50010394A00315A8400738C9400315A
      6B00315A6B001839630008213900082139000821390008213900B5ADB5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000009C9C00009C
      9C00FFFFFF000000FF00FFFFFF00009C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF00FF00
      FF00000000000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042A5FF0042A5FF000063A50042A5FF0042A5FF0042A5FF0042A5
      FF0042A5FF0042A5FF0042A5FF0084A5FF0000000000424284008484840084A5
      A500424242004221210084636300004263004242420084848400424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000008213900000000009CA5C60018396300FFFF
      FF0000000000FFFFFF00CED6DE00CED6DE009CA5AD009CA5AD00B5ADB500738C
      940063739400738C94009CA5AD000821390052637B0018396300000000000821
      3900082139000821390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000FF00FFFFFF000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042A5C60042A5FF0042A5
      C60000A5FF0042A5FF0042A5FF0042A5FF0042A5FF0042A5FF0042A5C6000000
      00000000000000210000424242004263630084A5A50084848400846363000042
      6300422121008484840042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001839
      6300000000000000000052637B0010394A00EFEFEF00B5ADB500315A6B000821
      3900082139000821390000081800183963000008180000081800637394000000
      000000000000082139000821390010394A0008213900315A6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      CE00FFFFFF000000FF00FFFFFF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084A5A50042A5C60042A5FF0000A5C60042A5FF0042A5C60042A5FF0042A5
      FF0042A5FF0042A5C60084C6FF0084A5A5000042420000422100002121004221
      210000212100004221008484840084A5A5004242420084848400424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000738C940010394A0008213900183963009CA5
      C600B5ADB500738C94006373940010394A000008180010394A00000818000821
      3900000818000821390008213900082139000821390000000000000000000000
      000008213900738C940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000CE00FFFFFF000000FF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084A5A5000000000042A5C60042A5C60042A5
      FF0042A5FF0042A5C60042A5FF0042A5FF0042A5FF0084A5FF00000000004242
      4200002121000021210000212100002121000042210000212100004242008484
      840084A5A5008484840042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000821
      390008213900315A6B00183963009CA5AD00EFEFEF00000000009CA5C6001839
      6300082139000821390000081800000818000000000000081800000818001039
      4A00082139000000000000000000082139000008180010394A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00FFFFFF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084C6FF004284A50042A5C60042A5FF0042A5FF0042A5FF0042A5
      FF0042A5C6000000000042636300002121000042210042212100002121000021
      2100002121000021210000212100002121000021210042636300848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000052637B0008213900082139009CA5AD009CA5
      AD00FFFFFF00ADC6CE009CA5AD0010394A000821390010394A00082139001039
      4A00000818001839630008213900315A6B000821390000000000000818000821
      3900082139009CA5AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C00009C9C000000000000000000FFFFFF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084C6FF0042A5
      C60042A5FF0042A5FF0042A5C60042A5C6000000000084848400002121000021
      2100002121000021210000212100422121004221210000212100002121000021
      2100004221000021210000212100848484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5AD
      B5000000000008213900315A6B009CA5AD00EFEFEF00738C940052637B00B5AD
      B500ADC6CE00CED6DE00EFEFEF00CED6DE00CED6DE0052637B009CA5AD001839
      6300000818001839630010394A00315A6B000008180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000009C9C00009C9C0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084A5A5008484840084A5FF0042A5C60042A5FF0042A5C60084C6
      FF00000000000021210000212100002121000021210000212100422121000021
      2100422121004221210000212100422121000021210000212100004221000021
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000821390010394A00738C94000000
      0000FFFFFF00315A6B00EFEFEF000000000000000000EFEFEF00CED6DE00CED6
      DE00CED6DE0063739400315A6B0018396300315A6B00B5ADB50010394A000821
      3900183963000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C00009C9C0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00009C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000042A5C60042A5C60084A5FF00000000004221210000212100002121000021
      2100422121004221210042212100002121000021210042212100422121000021
      2100002121000021210000212100426363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000738C9400637394000000000000000000FFFFFF00315A6B00000000000000
      0000B5ADB5009CA5AD00000000009CA5AD00000000008484840010394A006373
      940010394A009CA5AD00082139008484840010394A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00009C9C0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084A5A50084A5FF0042A5C600000000000000
      0000002121000021210000212100004242004221210000212100002121004221
      2100002121000021210000212100422121000021210000212100002121000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010394A00738C94000000
      0000738C9400738C9400B5ADB500ADC6CE00B5ADB5000000000000000000B5AD
      B500ADC6CE00738C9400738C9400CED6DE0018396300315A6B00183963000821
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084A5A500002121000021210000424200422121004221
      2100002121004221210042212100002121000021210000212100422121004221
      2100002121004221210084A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009CA5AD009CA5AD0010394A00315A6B0000000000CED6DE00ADC6
      CE00CED6DE00EFEFEF00EFEFEF00FFFFFF00FFFFFF0000000000000000000000
      0000EFEFEF009CA5AD00ADC6CE00637394000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000422121000021
      2100002121004221210000422100002121000021210000212100002121000021
      2100002121004221210000212100002121000021210084A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009CA5AD000008
      180000081800315A6B00738C94009CA5AD009CA5AD00738C940000000000ADC6
      CE00EFEFEF00315A6B00738C9400738C9400B5ADB500CED6DE00738C94000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400426363000021210000212100422121000021
      2100002121000021210000422100002121000021210000212100422121004221
      2100426363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009CA5AD009CA5AD0052637B00315A
      8400315A6B0052637B0010394A0052637B000000000010394A00315A84009CA5
      AD00000000009CA5AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840042424200422121000021210000212100422121000021
      2100422121000021210000212100002121000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5ADB500B5AD
      B500ADC6CE00B5ADB50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840042424200424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C1818008400000084000000840000008C181800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242000808
      10005A5A5A00ADADAD00BDBDBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00ADADAD005A5A5A0008081000424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008400008C18180000000000000000008C18180000840000008400000084
      000000840000008400008C1818008C1818000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000FF00000000000000FF00000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004242420008081000000000000808100042424200BDBD
      BD00BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00000000000000FF00000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000BDBDBD00ADADAD00424242000808100000000000080810004242
      420000000000000000000000000000000000000000000000000000000000FF00
      000000000000FF00000000000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000000840000008400008C1818008C18
      1800008400000084000000840000008400000084000000840000008400000084
      00008C18180000000000000000000000000000000000000000006B634A006B63
      4A006B634A006B634A006B634A006B634A006B634A006B634A006B634A006B63
      4A006B634A006B634A006B634A006B634A006B634A006B634A006B634A006B63
      4A006B634A006B634A006B634A006B634A006B634A006B634A006B634A006B63
      4A006B634A006B634A006B634A00848484008484840000000000000000000000
      00000000000000000000000000000000000000000000FF00000000000000FF00
      000000000000FF00000000000000FF00000000000000FF000000000000000000
      000000000000000000000000000000000000FF000000000000006B0008003929
      730021009C0000000000000000005A5A5A00B5B5B500BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000000000000FF00000000000000FF00000000000000FF0000000000
      0000FF000000000000000000000000000000000000000000000000000000FF00
      000000000000FF00000000000000FF000000BDBDBD00E7101000212121000000
      00000000000021009C0039297300525252000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000FF0000000000
      0000FF00000000000000FF00000000000000FF00000000000000000000000000
      000000840000008400000084000000840000008400009C31000018F7180021DE
      000018F7180018F718009C31000000840000008400008C181800000000000000
      000000000000000000006B634A00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD006B634A008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000FF00000000000000FF0000000000000000000000FF00000000000000FF00
      000000000000FF00000052525200392973002100C6001800B50008007B000000
      0000212121005A5A5A00B5B5B500BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000FF00000000000000FF000000000000000000
      0000FF00000000000000FF00000000000000FF00000000000000F7080800B5B5
      B5005A5A5A00212121000000000008007B001800B5002100C600392973005252
      5200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00000000000000FF00
      000000000000FF000000FF000000000000000084000000840000008400000084
      00009C31000018F71800FF00000000000000FF000000FF00000018F718007BAD
      7B0000840000008400008C1818000000000000000000000000006B634A00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD000000
      0000EFD6B500EFD6B500EFD6B500EFD6B500EFD6B500EFD6B500EFD6B500EFD6
      B500EFD6B500EFD6B500F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD006B634A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00000000000000FF00
      0000FF00000000000000FF00000000000000FF00000000000000000008004A42
      7B003910DE002100C6001800B50008005200000000000000000029292900A5A5
      A500BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000000000000FF000000FF00000000000000FF00000000000000FF00
      00000000000008080800181818002929290000000000000000000800A5001800
      B5002100C6003910DE004A427B00525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF0000000000000000000000FF00
      0000008400000084000000840000008400000084000000000000000000000000
      00000000000000000000FF00000018F7180000840000008400008C1818000000
      000000000000000000006B634A00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00000000008484840084848400848484008484
      84008484840084848400848484008484840084848400EFD6B500F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD006B634A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000008004A427B003910DE002100C6002100C6000800
      A50000009C0000003900000000000808100094949400BDBDBD00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018181800080810000000
      00000000390000009C001800B5002100C6002100C6003910DE004A427B005252
      5200000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      000000840000008400000000000000000000FF000000FF0000000000000018F7
      18008C1818008C1818008C1818000000000000000000000000006B634A00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD000000
      0000848484008484840084848400848484008484840084848400848484008484
      840084848400EFD6B500F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD006B634A00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFF0000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000008005A52
      8C005A39FF003910DE002100C6001800B5001800B5000800A50008007B004242
      420052525200000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF0000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000008000000000008007B000800A5001800B5002100C6002100
      C6003910DE005A39FF005A528C00525252000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFF0000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000DE000000DE000000DE000000DE000000DE000000DE000000DE00000000
      00000000000000000000FF000000000000000000000000000000000000000000
      000000000000000000006B634A00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFD6B500F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD006B634A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFF0000FFFFFF00FFFFFF00FFFF0000FFFFFF00FFFF
      0000FFFFFF0084848400101010005A528C00BD94FF006339CE003910DE002100
      9C005252520052525200B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF0000FFFFFF00FFFF
      FF00FFFF0000FFFFFF00FFFF0000FFFFFF00848484000000000000000000E710
      1000525252006B0008003910DE003910DE006339CE00BD94FF005A528C007373
      7300000000000000000000000000000000000000000000000000FFFFFF00FF00
      0000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFF0000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFF
      FF00848484000000000000000000FF0000000000000000000000940000008C18
      18008C1818008C1818008C1818008C18180000000000000000006B634A00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD006B634A00000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FFFFFF00FFFFFF000000FF000000FF000000FF000000
      FF000000FF00FFFFFF00FFFF0000FFFFFF00FFFF00008484840010101000736B
      A500BD94FF007B52F7005A39FF00424242007B7B7B0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF00FFFFFF00FFFF0000FFFFFF00FFFF
      000084848400000000000000000000000000FF0000007B7B7B00392973005A39
      FF007B52F700BD94FF00736BA500737373000000000000000000000000000000
      00000000000000000000FFFFFF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF0021FF21000084000000840000942100008484840000000000000000000000
      0000FF00000021DE00007BAD7B00008400000084000000840000008400008400
      000000000000000000006B634A00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00847B6B00847B6B00847B6B00847B6B00847B6B00847B6B00847B
      6B00847B6B00847B6B00847B6B00847B6B00847B6B00847B6B00847B6B00847B
      6B00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD006B634A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00FFFF
      0000FFFFFF008484840010101000736BA500BD94FF006339CE006B000800BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF000000FF00
      0000FF000000FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00FFFF0000FFFFFF00848484000000000000000000FF00
      000000000000FF00000052525200525252006339CE00BD94FF00736BA5007373
      7300000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF0000DE210000840000008400009421
      2100848484000000000000000000FF000000000000000000000018F718000084
      00000084000000840000008400008400000000000000000000006B634A00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD006B634A00FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E7006B634A00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD006B634A00000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFF
      FF000000FF000000FF000000FF00FFFFFF00FFFF00000000000010101000736B
      A5004A427B006B00080094949400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      000000000000000000000000000000000000FF00000000000000000000009494
      9400525252004A427B00736BA500737373000000000000000000000000000000
      00000000000000000000FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF000000
      FF000000FF0000DE210000840000008400007300000000000000000000000000
      0000FF000000940000008C181800008400000084000000840000008400008400
      000000000000000000006B634A00F7D6AD00F7D6AD00F7D6AD00F7D6AD006B63
      4A00FFEFDE00F7EFDE0000000000FFF7E70000000000FFF7E70000000000FFF7
      E70000000000FFF7E70000000000FFF7E70000000000FFF7E70000000000FFF7
      E700FFEFDE006B634A00F7D6AD00F7D6AD00F7D6AD00F7D6AD006B634A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFF
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFF
      0000FFFFFF000000000018181800737373008C101000BDBDBD00FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF00FFFF0000FFFFFF00000000000000000000000000FF00
      000000000000FF0000000000000000000000BDBDBD0073737300737373009494
      9400000000000000000000000000000000000000000000000000FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF0000DE2100008400000084
      000000840000730000008C181800940000008C18180000840000008400000084
      00000084000000840000008400008400000000000000000000006B634A006B63
      4A006B634A006B634A006B634A00FFEFDE00F7EFDE00B5B5AD00FFF7E7000000
      0000FFF7E700B5B5AD00FFF7E700CEC6C600FFF7E70000000000F7EFE7000000
      0000FFF7E70000000000FFF7E70000000000FFFFFF00FFEFDE006B634A006B63
      4A006B634A006B634A006B634A00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FF000000FF00
      0000FF000000FF000000FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFF00000000000010101000E710
      100000000000FF00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFF
      00000000000000000000FF00000000000000FF00000000000000000000000000
      00000000000000000000ADADAD00B5B5B5000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF0021FF2100008400000084000000840000008400000084
      00000084000000840000008400007BAD7B0018F7180018F718007BAD7B008C18
      1800000000000000000000000000FFFFFF00CEB5A500CEB5A500CEB5A5009463
      42008C4A2100FFF7E700FFF7E700FFF7E700FFF7E70000000000000000000000
      000000000000000000000000000000000000C6C6C600FFF7E700CECEC600FFF7
      E70000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFF
      0000FFFFFF00000000000000000000000000FF00000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF00FFFF0000FFFFFF00000000000000000000000000FF00
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FF00
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFF000021FF
      210000DE0000008400000084000000840000008400007BAD7B0018F7180018F7
      1800000000000000000018F71800000000000000000000000000000000000000
      0000CEB5A5008C4A21008C4A21008C4A2100EFDECE00B5B5AD00FFF7E700B5B5
      AD00FFF7E700212121006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF000000
      0000FFFFFF00CECEC600FFF7E700CECEC600FFFFFF0084523900000000008C4A
      21008C4A21000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FF000000FF000000FF000000FF00
      0000FF000000FF000000FFFFFF00FFFFFF000000FF000000FF000000FF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFF00000000000000000000FF00
      000000000000FF00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FF00
      0000FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFFFF000000
      FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFF
      00000000000000000000FF00000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF000000FF000000FF00FFFFFF00FFFF00000000000000DE000021DE000018F7
      180021DE000021DE000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEB5A5008C4A21008C4A21003918
      100094634200EFDECE00B5B5AD00FFF7E700F7F7EF00000000003131CE000000
      FF000000FF000000FF006B6BFF0000000000C6C6C600FFF7E700CECEC600F7EF
      E7009C6B52008C4A21008C4A210084523900CEB5A50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFF
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00FFFF
      0000FFFFFF00000000000000000000000000FF00000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00FFFF0000FFFFFF00000000000000000000000000FF00
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00FFFF0000FFFF
      FF00000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000039181000CEB5A5008C4A21008C4A21008C4A210094634200FFF7E700FFF7
      E700FFF7E700000000003131CE000000FF000000FF000000FF006B6BFF000000
      0000D6D6D600C6C6C600EFDED6009C6B52008C4A2100211008008C4A2100A56B
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF000000FF00FFFFFF00FFFF00000000000000000000FF00
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF000000FF000000FF000000FF00FFFFFF00FFFF
      00000000000000000000FF00000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFF00000000000000000000FF0000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEB5A5008C4A21008C4A
      210039181000CEB5A500FFF7E700ADADB500ADADB500313131003131CE000000
      FF000000FF000000FF006B6BFF0000000000FFFFFF00ADADB500FFF7E7008C4A
      21008C4A21008C4A21009C6B5200CEB5A5000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      0000FFFFFF00000000000000000000000000FF00000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFF0000FFFFFF00000000000000000000000000FF00
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF0000FFFF
      FF00000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000039181000CEB5A5008C4A21008C4A21008C4A2100C6BDC600FFFF
      FF00FFF7E700424242003131CE000000FF000000FF000000FF006B6BFF000000
      0000ADADB500FFF7E7009C9CA5008C4A2100180800009C6B5200CEB5A5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000FF000000FF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF00000000000000000000FF00
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF00000000
      FF000000FF000000FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FF00
      0000FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      00000000000000000000FF00000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFF00000000000000000000FF0000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB5A5008C4A
      21008C4A21008C4A2100FFF7E700ADADB500FFF7E700000000003131CE000000
      FF000000FF000000FF006B6BFF0000000000FFF7E700ADADB5008C4A2100524A
      42008C4A210084848400CEB5A500000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      0000FFFFFF00000000000000000000000000FF00000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000FF00FFFFFF00FFFFFF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FFFF0000FFFFFF00000000000000000000000000FF00
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FFFF0000FFFF
      FF00000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000039181000CEB5A500522918008C52310094634A009463
      4A0094634A00000000003131CE000000FF000000FF000000FF006B6BFF000000
      0000AD847300AD847300AD8473009C735A0021100800CEB5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFF00000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FF000000FF000000FF000000FFFFFF00FFFF00000000000000000000FF00
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFF00000000
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      00000000000000000000FF00000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF000000FF000000FFFFFF00FFFF00000000000000000000FF0000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00211008008C4A21008C4A21008C4A210094634A00080808003131CE000000
      FF000000FF000000FF006B6BFF000000000094634A008C4A21008C4A21008C4A
      210021100800CEB5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      0000FFFFFF00000000000000000000000000FF00000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFF0000FFFFFF00000000000000000000000000FF00
      000000000000FF00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFFFF000000
      FF000000FF000000FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF0000FFFF
      FF00000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7CEC6008C4A29008C5229008C52
      290094634A00292929003131CE000000FF000000FF000000FF006B6BFF000000
      000094634A008C4A21008C4A21008C4A2100E7CEC60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFF00000000FF000000FF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF00000000000000000000FF00
      000000000000FF00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF00000000
      FF000000FF000000FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      00000000000000000000FF00000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00FFFFFF00FFFF00000000000000000000FF0000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7CEC60000000000100829000000210000002100000021003131CE000000
      FF000000FF000000FF006B6BFF00000000000000210000002100000000000000
      0000E7CEC6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFF0000FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      0000FFFFFF00000000000000000000000000FF00000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFF0000FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FFFF0000FFFFFF00000000000000000000000000FF00
      000000000000FF000000FF000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFF0000FFFFFF00FFFF
      FB00FFFFFF000000FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FFFF0000FFFF
      FF00000000000000000000000000FF0000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080018000000
      FF000000FF003131FF000000FF000000FF000000FF000000FF000000FF003131
      FF000000FF000000FF0021102900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFFFF00FFFF0000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FF000000FF000000FF000000FFFFFF00FFFF000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFFFF00FFFF0000FF00
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFFFF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF000000FF000000FFFFFF00FFFF00000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600393952003131CE002121DE000000FF000000
      FF000000FF000000FF000000FF003131FF000000FF0000002100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFFFF00FFFF
      0000FFFFFF00FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFF000084848400000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFFFF00FFFF0000FFFFFF00FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFF00008484840000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFFFF00FFFFFF00FFFF
      FF00FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      000084848400000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000212121003131CE003131CE000000FF000000FF000000FF006B6BFF003131
      FF00000021000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFF0000FFFFFF00FFFF0000000000000000
      0000FF00000000000000FF000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FF000000FF000000FF000000FF000000FF000000FF000000FFFF0000FFFF
      FF00FFFF00000000000000000000FF00000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FFFF0000FFFFFF00FFFF00000000000000000000FF00
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000080808003131CE003131
      CE000000FF006B6BFF006B6BFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFF0000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFF0000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF00FFFF
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000393939003131CE003131CE006B6BFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFF0000FFFFFF00FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF0000FFFF
      FF00FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFF0000FFFFFF00FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF0000000000C6C6BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E2D9DF00DBD8D800D7D9DA00E0DBE100EADFE500E8E2E400E3E2
      E500E3DDE500EADFE600E5E0E200DFDDE100E1DAE400E9DEE600E7E1E500DFDD
      E200DFD8E200E6D9E100E4DEE200E2DFE400E2DCE600E9DDE500E7E2E500DFDE
      E200E0D8E200E6D9E100E4DEE200E1DFE400E2DDE500E9DDE600E7E2E500E2E1
      E500DDD8DF00DDD2D700DDDADB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDDDDE00DDD8DB00ECEBEC00FFF8
      FF00FFF7FF00F6F5FE00F5F6FD00F6F4FF00F6F5FF00F4F2FF00F4F2FE00F7F4
      FD00FBFAFF00FAF9FF00FBF9FF00FBF7FE00FAF8FE00F9F7FE00F9F8FE00FBF7
      FF00FCFAFF00FAF8FF00FBFAFF00FBF8FE00F9F7FB00F6F4FA00F7F5FA00F8F4
      FC00F9F8FC00F8F5FC00F6F4FB00FAF1FB00FFF9FF00F8F5FA00E0E1E3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E4DEDC00E1DBD900FFF9F800D8D1D300797C7600595D42005A5933005C57
      34005C5C31005C5F34005B5C3400616334006464300063623000606230006062
      300060623100606230006062300060623100606230006064300060603000615F
      31006363350066673800646636006466340064643400646A3400696E38006C76
      51009CA29C00F1F3F400F2F0F000000000000000000000000000848484008484
      8400848484008484840084848400848484000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E1DCDE00E4E5E300D3D1D300454E
      3D0000000000000100000017000000180000001C0200001E0000001F0000001A
      0100001F0500002105000021050000230600002103000021050000210600001F
      0300001F030000200400002404000026020000280700002A080000290B000029
      0D0000280D00002C0F00002B0000001600000B1C00008F908700E8DCDE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000000000
      0000840000008400000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000840000008400000000000000
      0000000000000000000000000000000000008400840084008400000000008400
      8400840084008400840000000000000000000000000084840000848400008484
      0000848400008484000000000000000000000000000000000000000000000000
      0000848400008484000084840000848400000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000E0DBE300E5E4E700C1C9C100374A29000B2E130022778E002298C8001F97
      C6002599CF00269BCE002599CA002699CF00269FDC0025A6DE0029A7E0002CA6
      E40030A4DF0032A6E30031AAE30031A8DB002FA7E0002FABE8002EAEE50031B0
      DC0036ADD10036ACD00039ABD8003BAEDB0036AEDA003AAFDB0040AED300367B
      6F001A3A08007D886900DFDFDB00000000000000000000000000000000000000
      0000840000008400000084000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000840000000000848484000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000008400000000000000000000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000000000000000000000000000000000000000000000000
      0000000000000000000000000000008484000000000000000000000000008484
      00000000000000000000000000006B634A006B634A006B634A006B634A006B63
      4A006B634A006B634A006B634A006B634A006B634A006B634A006B634A006B63
      4A006B634A006B634A006B634A006B634A006B634A006B634A006B634A006B63
      4A006B634A006B634A006B634A006B634A006B634A006B634A006B634A006B63
      4A0084848400848484000000000000000000E5DDE200E7E2E600C6CCC1004455
      3000145E630021ACF20023B3FF0025B3FF0025B5FF002AB8FF002CBBFF002ABE
      FF002BACF2002CAAEB002AA4D600299CC2002EB2F40031A7DA00309EC50032B8
      F40035B7F20035A7D80034ADE2003AB8F8003BC7FF003DCBFF0044C7FF0046CF
      FF004AD5FF0059DFFF006AEAFF0057BFE200295C3C007E956D00DEE1DB000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000008484840000008400000000008484
      8400000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000084000000
      0000000084000000FF000000FF000000000000000000FFFF0000848400000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000008484000084
      8400FFFFFF000084840000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000006B63
      4A00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD006B634A008484840000000000000000000000
      0000E7E1E000E9E4E500CACDC30045543B00135F7100229FE60028A8F5002BAD
      F10024A9EE0024A9EE0027ADED002BB0F9002A8DAC00287B830029726D00296A
      580025818200257A6E00256B57002B8B9E002E756F0028542C002A5D37003384
      90003BB0E90040C0FB003DBEF50048C4F40061CEFB006BD7FF0070DAFF005AC1
      E0002E684A0086997800E0DDDB00000000000000000000000000000000000000
      0000840000008400000084000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000000000000000000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000FF000000FF00000084000000
      00000000000000000000FFFF00008484000000000000FFFFFF00FFFF00000000
      00000000000000848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00008484000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      00000000000000000000000000006B634A00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD0000000000EFD6B500EFD6B500EFD6
      B500EFD6B500EFD6B500EFD6B500EFD6B500EFD6B500EFD6B500EFD6B500F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD006B63
      4A0000000000000000000000000000000000E7E6E500EEE6E700CCCAC0004553
      370012586B00289EE3002AAFF20028AEED0027ADEE002AABEE002BACF1002CA0
      D40027634D00255C400025695A00256550002A685100286E5D00246746003084
      8B002A75720027716300266648002F878D003FBAED0043C8F90043CAF70055CD
      F5006BD6FC006BD8FF006BD7FF005EC0D500346A49008B987900E3E5E2000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000840000008400000000000000
      8400000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      00000000FF000000840000000000000000000000000000000000000000008484
      00000000000000000000FFFFFF00FFFF0000000000000000000000848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00008484000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000006B63
      4A00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00000000008484840084848400848484008484840084848400848484008484
      84008484840084848400EFD6B500F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD006B634A000000000000000000000000000000
      0000E5E4E700EEECED00CCCEC30044553700115F6C0026A7E40029AFF40025AC
      EF0028AAEF0030ADEF0033AEF1002DA3D4002A7875002C7D86002B869100297E
      73002F91A2002C8390002974710033A1C20039B6E5003EBDEE003BBBE10038BD
      E4003FC5F50049C3F60054CBF60059CFF40059CEFA005ED4FF0067D9FF0059C0
      D600376D47008C9A7700E1E3DF00000000000000000000000000000000000000
      0000840000008400000084000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000840000000000000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000840000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF0000FFFF
      FF0000000000000000000000000000848400FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      00000000000000000000000000006B634A00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400EFD6B500F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD006B63
      4A0000000000000000000000000000000000E6E3E700EBEBEC00CCCDC4004359
      380014676C0027A8E40026AEF40029AAEF0031ADEF0032B6EF0030B1EE0031B9
      F70034C4FF0034C6FF0039C4FF003CBFFB0039C6FF0038C3FF0037C0FC003ECE
      FF004AD6FF0049DBFF0045D7FF0044CBFF0049C8F60053C8F6005BCCF4005ACD
      F70059CCFB0060D4FF0063D9FF0058C0D70034744A008A9B7800DFE1DF000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000008484840000008400000000008484
      8400000084000000840000000000000000000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084840000FFFF
      FF00FFFFFF00FFFF0000FFFFFF00000000000000000000000000000000000000
      000000848400FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000006B63
      4A00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFD6B500F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD006B634A000000000000000000000000000000
      0000EBE5E500EFE9EA00CBCCC2004359380019636C0028A8E40028AFF4002FAD
      EF0031B3EF0031B5EF002FB6EE0030B5EF002CA1CB002B91A8002F8EA6003293
      AC003191A5003596A800369EAC003999A50037959F003B9BA7003FADDA0047C1
      F70052CDF5005BD1F6005ACCF70057CDFE005FD4FF0064D6FF0061D7FF0057BD
      D70038714F008C9F7C00E3E3E000000000000000000000000000000000000000
      0000840000008400000084000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000084000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00008484000000000000000000000000000000
      00000000000084840000FFFFFF00FFFFFF00FFFF0000FFFFFF00000000000000
      00000000000000000000000000000000000000848400FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000006B634A00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD006B63
      4A0000000000000000000000000000000000EAE8E700EDEEED00CBCEC5004559
      380019656C002CA6E40030ABF40032B2EF002FB6EF002DB2EF0031B4F10031A8
      D600215641001821000018230000182B0000172E00001C2D0000203200002037
      00002032000021300000367F6A0052CBF0005BD2FB005BCCF20056CDFC005AD5
      FF0061D7FF0062D4FF0066DAFF0059C3D7003F704F008FA37C00E8E5DD000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000848484008400000084000000840000008400
      0000840000008400000084848400000000000000840000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000084
      84000000000000000000000000000000000084840000FFFFFF00FFFFFF00FFFF
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000008484000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000006B63
      4A00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD00847B6B00847B
      6B00847B6B00847B6B00847B6B00847B6B00847B6B00847B6B00847B6B00847B
      6B00847B6B00847B6B00847B6B00847B6B00847B6B00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD006B634A000000000000000000000000000000
      0000E7E7EA00EDEEF000CCCFC6004359380016646C0030AAE40031B2F4002EB2
      EF0031B3EF0033B5EF0037BAF30036A8D500255E4E00153000001C3B01002341
      0200223D0100204401001B480200254500002746050026440000439287005DD1
      FF005ED4FF0058CCFB005AD3FC0063D7FF0064D5FF0060D4FF006ADEFF005CCB
      D7003B774F008FA27A00E6E9E200000000000000000000000000000000000000
      0000840000008400000084000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000008484
      8400840000008400000084000000840000008400000084000000848484000000
      0000000084000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000084840000848400000000000000
      8400000084000000840000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000006B634A00F7D6AD00F7D6AD00F7D6AD00F7D6
      AD00F7D6AD006B634A00FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7E700FFF7
      E700FFF7E7006B634A00F7D6AD00F7D6AD00F7D6AD00F7D6AD00F7D6AD006B63
      4A0000000000000000000000000000000000EDE6EE00F1ECF100CBCFC4004257
      380015616C0031ACE40034B9F40033B2EF0037B5EF0038BCEF003BBFEF003CBB
      ED00297F8600194219001D3D0300224208002141080020470800214B08002648
      0900274D0800396835004D9B9D0050ABBC0053BED5005CD1FD0063D5FE0063D6
      FF0061D6FF0065D8FF006BDFFF005BC6D7003D7A4F008FA57A00E7E8E1000000
      0000000000000000000000008400000000008484840084000000840000008400
      0000848484008400000084000000840000000000000000000000000000000000
      0000000000000000000000008400848484008400000084000000840000008400
      0000840000008400000084848400000000000000840000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF00008484000084
      840000FFFF0000FFFF000084840000008400FF00FF000000FF000000FF000000
      FF00000084000000000000000000000000000000000000000000000000000084
      84000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000006B63
      4A00F7D6AD00F7D6AD00F7D6AD00F7D6AD006B634A00FFEFDE00F7EFDE00FFF7
      E700FFF7E700FFF7E700FFF7E700F7EFDE00FFF7E700F7EFDE00FFF7E700F7EF
      DE00FFF7E700F7EFDE00FFF7E700F7EFDE00FFF7E700FFEFDE006B634A00F7D6
      AD00F7D6AD00F7D6AD00F7D6AD006B634A000000000000000000000000000000
      0000F0E9EE00EEEFF100C8CEC500455A380018656C0037ADE4003BB7F4003AB5
      EF0039BBEF0039BEEF0042BBED003FC3FB00329FBB001C5635001C3D01002240
      0500214108001E4708002848050029460B002D52150045866300498F7E004381
      67004A9986005BC8E00062D8FF0062D3FF0063D0FF0064D9FF006BE1FF005AC7
      D7003D7A4F008BA57B00E5E5DF00000000000000000000008400000084008484
      8400840000008400000084000000840000008400000084000000840000008400
      0000848484000000000000008400000000000000000000008400000084008484
      8400840000008400000084000000840000008400000084000000000000008484
      8400000084000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000848400008484000084840000FFFF000000
      8400FF00FF000000FF000000FF0000FFFF000000840000000000000084000000
      84000000840000008400000084000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000006B634A006B634A006B634A006B634A006B63
      4A00FFEFDE00F7EFDE00B5B5AD00FFF7E700FFF7E700FFF7E700B5B5AD00FFF7
      E700B5B5AD0000000000F7EFDE00FFF7E700F7EFDE00FFF7E700F7EFDE00FFF7
      E70000000000FFFFFF00FFEFDE006B634A006B634A006B634A006B634A006B63
      4A0000000000000000000000000000000000F0EEEB00F2EDEE00CBCCC3004C5F
      380025726C0037B0E40038B3F40037BAEE0036BEEE003FBBEF0043BDEF0043BF
      F4003A9CB9001F5433001A3B000022420700214008001E460500204904002F51
      14003D5F2600467D57004C8A770055B7C90055A3A60056B1C70060D5FF0064DB
      FF0060DBFF0061DCFF0069E1FF005CC8D7003B784F0091A37900E8EDE6000000
      0000000000000000000000000000848484008400000084000000840000008400
      0000840000008400000084000000840000008484840000008400000084008484
      8400000000000000000084848400FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000848484000000000000000000000084000000
      00000000000000000000000000000000000000FFFF0000848400008484000000
      000000000000000000000084840000008400FF00FF000000FF000000FF000000
      FF0000008400000084000000FF000000FF000000FF000000FF000000840000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00CEB5A500CEB5A500CEB5A500946342008C4A2100FFF7E700FFF7
      E700FFF7E700FFF7E700FFF7E700B5B5AD000000000084848400000000000000
      0000FFF7E700C6C6C600FFF7E700CECEC600FFF7E70000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000EDEDEE00F8F4F400CFCFC600485F38001F6B6C0037B2E40038BAF40036BA
      EC0039BCED0040BDEF0041BAEF0043C0F600379BB400205433001D3D02002141
      07001F3F05001E43050028500F00395B2100425E2200467F5C004E93850059BA
      CA0054ACB9005EB9D50063D4FF0061D9FF0066DEFF006CDEFF006CE1FF0059C6
      D7003E7B4C0098A67C00EAE9E500000000000000000084000000840000008484
      8400840000008400000084000000840000008400000084000000840000008400
      000084848400000000008484840000000000000000000000000000000000FF00
      0000FF000000FF00000084000000FF000000FF000000FF000000000000008484
      8400000000000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400FF00FF000000FF000000FF0000FFFF00000000000000FF000000FF00FF00
      FF000000840000008400FFFFFF00000000000000000000000000000000000000
      0000848400000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEB5A5008C4A21008C4A
      21008C4A2100EFDECE00B5B5AD00FFF7E700B5B5AD00FFF7E700B5B5AD000000
      00006B6BFF003131CE003131CE000000000000000000FFFFFF00CECEC600FFF7
      E700CECEC600FFFFFF0084523900000000008C4A2100FFFFFF00000000000000
      000000000000000000000000000000000000EEEBF000F4F3F300CECFC600495F
      3700206D6C0037B1E4003BBEF2003BBDF20041BCF00042BCED0041BFEF0043C2
      F6003899B60025523300203D0200203F07001F40080029480F003A5A21004264
      2900415E2200488268005093870058AFB30053AFAD005BC1D40064D7FF0061D6
      FF0064DBFF0069DEFF006DE1FF005BC5D600427F4F0099A98300EAEBE7000000
      0000000000008400000084000000848484008400000084000000840000008400
      0000840000008400000084000000840000008484840084000000840000000000
      000000000000FF000000FF00000084000000FF000000FF000000FF000000FF00
      0000FF000000FF00000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008400FF00FF000000FF000000FF000000
      00000000FF000000FF00FF00FF00000084000000000000000000848400000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEB5A5008C4A21008C4A21003918100094634200EFDECE00B5B5
      AD00FFF7E700B5B5AD00000000006B6BFF006B6BFF000000FF003131CE003131
      CE000000000000000000FFF7E700CECEC600F7EFE7009C6B52008C4A21008C4A
      210084523900FFFFFF0000000000000000000000000000000000000000000000
      0000F5EEF000F8EFF200CDCEC500495F36001F6B680033ADE20040BDF00046BE
      F20042BAF2003FB8EB003EC4EB003FC2F200369BB40025543300203C01001C41
      040024480800365B200043642C00436229003F6020004D876B0053968C0055A2
      960052ABA1005EC8DD0064D5FF0063DBFF0062DFFF0068DEFF006DDEFF005BC7
      D4004280540099A88400E6EBE600000000000000000084000000840000008484
      8400840000008400000084000000840000008400840084000000840000008400
      00000000000084000000840000000000000000000000FF000000FF0000008400
      0000FF000000FF000000FF000000FF000000FF000000FF00000084000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400FFFFFF000000FF00000000000000FF000000FF00FF00FF00000084000000
      000000000000848400008484000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039181000CEB5A5008C4A
      21008C4A21008C4A210094634200FFFFFF00FFFFFF00000021003131FF006B6B
      FF000000FF000000FF000000FF003131CE003131CE000000000000000000EFDE
      D6009C6B52008C4A2100211008008C4A2100A56B520000000000000000000000
      000000000000000000000000000000000000F2EFED00F6F6F600CDD1C800485D
      3B00236E72003AB7E20040C0F70041BBEF0040C0ED0045C1F20048C4F30047C5
      F90038A3B600255731001E370000224707002F541B003A602900416229004163
      29003F6722004B8F690053988B004E9888005AB4B80061D3F40062DBFF0060DB
      FF006ADDFF006EDCFF006DE2FF005ACFD6004283540099A68400ECE9E6000000
      0000000000008400000084000000840000008400000084000000848484008484
      8400840084008484840084000000840000008484840084000000840000000000
      000000000000FF000000FF00000084000000FF000000FF00000000000000FF00
      0000FF000000FF00000084000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000084000000FF000000FF000000
      FF00FF00FF0000008400000000000000000084840000FFFFFF00FFFF00008484
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEB5A5008C4A21008C4A210039181000CEB5A5006331
      6300000021000000FF003131FF000000FF000000FF000000FF000000FF000000
      FF002121DE003131CE0000002100FFFFFF008C4A21008C4A21008C4A21009C6B
      5200FFFFFF000000000000000000000000000000000000000000000000000000
      0000F0F3F200F7F6F700CDD1C800485D3A002673750042B8E80042BDF70041B9
      EE003EC2EA0044C8F50048C5FB004DCAFF0039A4B70022562F001D4003002E4F
      16003B5D280043622C00416429003F69290042651F004E8C6E00529C8E00509C
      920060BFCA0064D6F70061DEFF0061DFFF0064DDFF0065DAFF006AE6FF0059D1
      D6004182540099A58400EFECEB00000000000000000084848400840000008400
      0000840000008400000000000000000000008400840000000000840000008400
      00008400000084000000840000000000000000000000FF000000FF0000008400
      0000FF000000FF00000000000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000008400FFFFFF000000FF00FF00FF000000840000000000000000000000
      000084840000FFFFFF008484000084840000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF00000000000000000000848400008484000084840000848400008484
      000000000000000000000000000000000000000000000000000039181000CEB5
      A5008C4A21008C4A21008C4A2100291839000000FF000000FF003131FF000000
      FF000000FF000000FF000000FF000000FF003131FF000000FF000000FF001008
      29008C4A2100180800009C6B5200EFDED6000000000000000000000000000000
      000000000000000000000000000000000000F4F3F500FAF6FA00CDD1C800495E
      33002673700040B8F00043BDF50040BDF00044C4F20042C5EF003EC6F50043CA
      FA0039A2B400245A2E00284B0A0039571900415A1B003F5D1A00426318004268
      1B0048682100518B6C00519980004F9E8F0059B9C60062D3F40063DCFF0062DE
      FF0063DCFF0064DEFF0069E9FF005ECFD6004384540097AB8400F0EEE9000000
      0000000000000000000084000000840000008400000084000000FFFFFF00FFFF
      FF0084008400FFFFFF0084000000840000008400000084000000848484000000
      000000000000FF000000FF00000084000000FF00000000000000000000000000
      0000FF000000FF000000FF000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400840084008400
      840000FFFF0000000000000000000000000084840000FFFFFF00FFFF00008484
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000084840000FFFF00008484
      0000FFFF000084840000FFFF0000848400000000000000000000000000000000
      0000000000000000000000000000CEB5A5008C4A21008C4A2100391810002918
      39000000210000002100000021006B6BFF000000FF000000FF000000FF003131
      CE0000002100000021000000210010082900180800008C4A210084848400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000F8F0F600F8F5F900CCD1C800495E380026736F0040B6E50043C0F3003FC6
      F1004AC6F80045C5F20040C6F30043C9F8003FA3B40031653C0033500E00405B
      1C00436120003F682000466624004C6A1B00487022004A7D3F00519C7C0050A6
      930054ADA4005FD3E90064E1FF0060DAFF006ADEFF006EE7FF006DEAFF0061CD
      D6004588540097B38400F0EDE800000000000000000000000000840000008400
      00008400000084000000FFFFFF00FFFFFF0084008400FFFFFF00840000008400
      00008400000084000000000000000000000000000000FF000000FF000000FF00
      0000FF00000084848400FFFFFF00848484000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000FFFF0000FFFF000000
      000000000000848400008484000084840000FFFF0000FFFF0000FFFF00000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008484
      0000000000000000000000000000000000000000000000000000000000003918
      1000CEB5A500522918008C52310094634A0094634A0094634A00000000006B6B
      FF000000FF000000FF000000FF003131CE000000000094634A0094634A009463
      4A0094634A0021100800FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000F6F5F300F8F7F700CECFC500475E
      3F002673710041BBE50043C9F70041C7EB0043C4F10041C6FA003DC5F70045C5
      FF0047AABF004273500049815E0051A4A60051B0BA004FAFBC0058B0C20059B0
      AE004E8E5400518844005DBBBE0056A48E00549C720061CFDF0064DFFF0062E1
      FF0063E8FF006BE8FF006AE8FF0057CFD6004088540099B18400F0F5EF000000
      0000000000000000000084000000840000008400000084000000FFFFFF00FFFF
      FF0084008400FFFFFF0084000000840000008400000084000000000000000000
      000000000000FF000000FF000000FF00000000000000FFFFFF00FF000000FFFF
      FF000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000848400008484
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008484
      0000848400008484000084840000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00211008008C4A21008C4A
      21008C4A210094634A00000000006B6BFF000000FF000000FF000000FF003131
      CE000000000094634A008C4A21008C4A21008C4A210021100800FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5F7F600FEFDFE00D1D3C800475E3C002673750041BCEB0043C9FD0041C5
      F50041C5F50044C5F60043C4F7004BCAFC0050AFC0004574530055A7AA0062DC
      FF0060D7FF0060D2FF0064DDFF0062DEFF0054A59000559C7A0063CCE1005B9D
      7900559F72005FD4E70063DEFF0063DFFF0060E6FF0064E6FF0063E8FF0056CD
      D6004287540099AC8400EFF0EC00000000000000000000000000840000008400
      00008400000084000000FFFFFF00FFFFFF0084008400FFFFFF00840000008400
      0000840000008484840000000000000000000000000084848400FF000000FF00
      000000000000FFFFFF00FF000000FFFFFF000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000FFFF0000FFFF000000
      000000000000000000000000000084840000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7CEC6008C4A21008C4A21008C4A210094634A00000000006B6B
      FF000000FF000000FF000000FF003131CE000000000094634A008C4A21008C4A
      21008C4A2100E7CEC60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F8F800FBFAFB00D0D3C900475E
      3C002673760041B5E30043C0F50040C4F40047C7F4004BC3F6004BC6F70057D2
      FC0058AEBF00437554004CA9B20062DBFF0066D6FF0065D2FF0063D7FF0064D5
      FF0059A8980056A27C0062C4C9005EA783005AB89E0061DCF70062E2FF0063DF
      FF0063E3FF0060E7FF0063EBFF0058D0D6004386540099AC8400EEEEEC000000
      0000000000000000000000000000840000008400000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000840000008484840000000000000000000000
      0000000000000000000084848400FF00000000000000FF00000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848400008484000084840000000000000000000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7CEC600E7CEC600E7CE
      C600E7CEC60094634A00000000006B6BFF000000FF000000FF000000FF003131
      CE000000000094634A00E7CEC600E7CEC600E7CEC600E7CEC600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCF8F800FEFAFB00D0D1C700475E3D002673760041B5E30041B9ED003FC1
      EC0042C4F50047C5F7004FCCF7005BD1FD0056B0BC00477C540054ACB30065D9
      FF0063DAFF0061D9FF0061D7FF0064D7FF005DAF9B0057A47C0059AE98005BB3
      A10061D1DE0063DDFF0062E4FF0063E9FF0063E7FF0062E5FF0064F2FF0058D4
      D6004386540099B18400EEF3ED00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084840000FFFF0000FFFF00008484
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      FF000000FF000000FF000000FF003131CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBF6F600FFFCFD00D0D4C900495C
      3D002572750040BAE80044C2F6003FC1F60048C5F80052CDF5005BCFF60066CF
      FD0055B0BC00477745005AA4A50063DBFF0063DCFF0064DCFF0064DCFF0061E1
      FF005AA986005B996C005ABFB10062DAF00064DEFF0061E0FF0062E5FF0062E7
      FF0062E7FF0061E5FF0064EAFF0058CFD5004185520099B28400EDF0EA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000008400000084000000
      8400000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484000084840000848400000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006B6BFF000000FF000000FF000000FF003131
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8FAFA00FFFFFF00D1D3CA00475C3D00247377003EBFEE0045C9FE004DC6
      F7005DCDF50060CEF60062CBF50062D0F9005BBFDD004C8565004C794B004E97
      840056A499005CA798005BB09E0057A88500559248005FAB870065DEFC0062E7
      FF0061E0FF0062E5FF0061E8FF0061E5FF0061E5FF0063E9FF0060EAFF0054CD
      D5004389550097AC8300F1F4F000000000000000000000000000000000000000
      0000000000008484840000008400000084000000840000008400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      FF000000FF000000FF000000FF003131CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00FFFFFF00CFD4CA00475E
      390028767D0043C3F6004CCCFE005FCFFA0069CFFA006BD0F90068D2F80067D6
      FD006CD8FD0061C1CB00569B820057957B005D9F82005FA37F0062AB85005FA7
      7A0060B3940067D2DF006AE1FF0065DDFF0063E6FF0064EAFF0064E8FF0064E8
      FF0064E6FF005FEDFF005EF9FF0058DDE400428B560097A68000F5F1F0000000
      0000000000000000000000000000000000000000000000000000000084000000
      8400000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00FFFFFF0000FFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006B6BFF000000FF000000FF000000FF003131
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFDFD00FEFFFF00CBCAC3003C5326001D654F004BC5F90062E9FF0074E9
      FF007AE6FF0077EDFF0075F0FF0073F0FF0074EFFF0071F0FF0071F5FF0078F2
      FF007BEEFF0079F4FF0074F7FF006FF4FF0072FBFF0072FCFF0071F6FF006BF5
      FF0068FEFF0068FFFF0068FEFF0068FEFF006AFFFF0064FFFF0064FFFF0058D4
      CE003C7637008E9F7500F2EEE900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      FF006B6BFF006B6BFF006B6BFF006B6BFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFBFB00FCFFFF00DDD9DA005A61
      4E00072000000D46180021664F0024685400246F57002373590028715F002B71
      600029745C002A79600034806D003A8570003684700038837000338070002C81
      70002D7E6B00307B64002E7E6200318762003386620033836200338362003383
      620033876200368A65002F8251002B5812003F4E1D00A2A79700F6F8F9000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFEFE00FFFFFF00F8F9FB00B4B5B5006A725B00566534005A6936005A6F
      3B00597439005A763F005F7541006074420063794600657D4400687A49006A78
      4C006A794B006A794B006C794B0068794B006A794A006D794B006C7D4B006C82
      4B006D844B006D824B006D824B006D824B006D814B006B814B006D8445007082
      4F0093988600DCDBDD00FEFCFE00000000000000000000000000000000000000
      0000000000000000000084848400848484000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F3F2F100ECEBE600EBE8E400EBEDE300EBEFE300EBEDE300EAEDE100E9EE
      E500EEEDE900F1ECE800EEECE700EEECE600EEECE600EEECE600EEECE600EFEC
      E600EEECE600EEECE600EEECE600EEEEE600EEF2E600EEF1E600EEF1E600EEF1
      E600EEF1E600EEF1E600EEF2E800EDEEE900F8F7FA00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      280000008C000000180100000100010000000000E01500000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFF00000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFD007FFFF00000FFFFFFFFFFFFFFFFFFFFFFFFFFF80040
      1FF00000FFFFFFFFFFFFFFFFFF000F8007F0000001F00000FFFFFFFFFFC7FFE3
      FF00078003F8000000700000FFFE0FFFFFBFFFFDFF00078003E8000000100000
      FFF001FFFF73FFCEFF000F8003C0000000000000FFE000FFFFEFC1F7FF001F80
      03C0000000000000FFC0007FFFFF20FFFF007F8003C0000000000000FF80003F
      FFFC903FFF007F8003E0000000000000FF00001FFFF24B1FFF007C8003800000
      00000000FE00001FFFE1240FFF007C800380000000000000FE00001FFFE088C7
      FF03F0800380000000000000FE00001FFFE12107FF03F0800380000000000000
      FE00001FFFC002F7FF03F08003E0000000000000FE00001FFF208D10FF0FF080
      03C0000000000000FE00001FFE2012083F0F808003C0000000000000FF00001F
      FC3000031F0F808003C0000000000000FF00003FF81800000F8F80C003E00000
      00000000FF80003FF00C00008FFC00FFFFF0000000000000FFC0007FF003FF81
      4FFC00FCFFF8000000000000FFE000FFF003FF86AFFC00F87FFE800000000000
      FFF003FFF007FF875FFC00F03FFF800000000000FFF003FFF00FFF8BBFFFC1E0
      1FFF800000000000FFF807FFF01FFFD5DFFFC0C00FFF800000000000FFF807FF
      F01FFFCAFFFFC0F03FFF800000000000FFF80FFFF83FFFE57FFFC0F03FFF8000
      00000000FFF80FFFF83FFFEAFFFFC0F03FFF800000000000FFF80FFFF87FFFF5
      FFFFC0F03FFF800000000000FFF007FFFC7FFFF2FFFFC0003FFF800000000000
      FFF003FFFCFFFFF9FFFFC0003FFF800000000000FFFA47FFFCFFFFFBFFFFC000
      3FFF800000000000FFFFFFFFFFFFFFFFFFFFE0003FFFC00000100000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF00000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFE00
      03F00000000000001FFFFFFFFFFFFF00FFFFFFFFFFF00000000000001FFFFFFF
      FFFFF800FFFFFFFFFFF00000000000001FF3FFFFFFFF8000FFFFFFFFFFF00000
      000000001FF0FFFFFFFC0000FFE001F000F00000000000001FF83FFFFFE00000
      FFE000F000700000000000001FF81FFFFE0006007FE000F00070000000000000
      1FFC0FFFFC0030007FE000F000700000000000001FFC07FFFC0180007FE000F0
      007000001FC3C71FFC000007FC1C00001FE000F00070000000000000F8000007
      FC4000001FE000F00070000006000001F8000007FC0000001FE000F000700000
      06000003F8000007FC0000000FE000F00070000006000007F8000007FE000000
      0FE000F00070000006000007F8000007FE00000007E000F0007000000600FF1F
      F8000007FE00000007E000F0007000001E03FE0FF8000007FF00000007E000F0
      007000001E03FF1FF8000003FF00000003E000F0007000000C01FF1F38000001
      FF80000001E000F000700000FFFFFFF8B8000000FF80000001F000F800700000
      FFFE0F19580000007FC0000001FFFFFFFFF00000FFFEC33AF80000003FE00000
      01FC1FFF9FF00000F0087FFAF80000001FE0000001FC0FFF0FF00000F0B47F3F
      980000000FF0000001FC0FFE07F00000F009FE3F180000000FF0000001FC0FFC
      03F0000088AFFFFC580000041FF8000001FC0FF801F00000F0FFF8C0B8000006
      3FF8000001FC0FFE07F00000FFFFFCFCB8000007FFF8000001FC0FFE07F00000
      FFFF8F8078000007FFFC000001FC0FFE07F00000FFFF063AF800000FFFFC0000
      01FC0FFE07F00000FC071FE0F800001FFFFE000001FC000007F00000F80FFF81
      F800003FFFFE000003FC000007F00000C01FF81FF800007FFFFF00000FFC0000
      07F00000FFFF43FFF80000FFFFFF0000FFFE000007F00000FFFFFFFFF80001FF
      FFFF8007FFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFFF803FFFFFFFFFFFF00000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFF00000E040F863FF8000000FF39CE33FFFFFFFFFF00000F061F907
      FF0000000FDCE721CFFFFFFFFFF00000F847F90FFF00007FCFE739C073FFC007
      83F00000F847F91FF80003004F39CE601DFE000001F00000F847F91FF0000000
      4FCE738007FC000000F00000F847F91FF70002004F739CE001F8000000700000
      F844F91FF70002004F00072001F8000000700000F844F919F400027FCFFFF1C0
      03F8000000300000F844F819F70003004FFFF06003F8000000300000F844F009
      F70000004FFFD00003F0000000300000F844F009F41FF2004FFF800003E00000
      00300000E804E009F7001A004FFF800003E0000000300000C000C001F700027F
      CFFF800003E0000000300000F0006000F40013004FFF800003E0000000300000
      C002C005F70000004FF0000003F0000000700000C000C003F70000004FE00000
      03F8000000700000C004C003F40000000FC0000003F8000000F00000C000C003
      F70000000F80000003FC000001F00000C1A0C003F70000000F80000003FC0000
      03F00000E000C103F40000001F80000003FC00001FF00000E001C007F7F00000
      FF80000003FC00001FF00000E001C007F7F00000FFC0000003FC00000FF00000
      E001C007F4100000FFFF800003FE000007F00000F203E00FF7F00000FFFF8000
      03FF03F003F00000FFBFFC7FF7F00000FFFF800003FF800003F00000FE1FF00F
      F4300000FFFF800003FF800003F00000FC0FF00FF7F00000FFFF900003FF8000
      03F00000FC0FF81FF7F00000FFFFF00003FFC00007F00000FC0FF81FF4100000
      FFFFF00003FFE00F0FF00000FC0FFC7FF7F00000FFFFF00007FFFC007FF00000
      FE1FFC7FF7F00000FFFFF0000FFFFFFFFFF00000FFFFFFFFF0000001FFFFFFFF
      FFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000FFFFFFFF
      FFFFFFFFFFFFFF8FFFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFFFFE0FFFFFFFFF
      FFF00000FE001FFFFFFFFFFFFFFFE003FFFFFF47FFF00000FE001FFFFFFFFFFF
      FFFF8001FFFFF0007FF00000FE001FFFFFFFFFFFFFF80000FFFFC0001FF00000
      FE001FFFFFFFFFFFFFF00000FFFF80000FF00000FE001FFFFFFFFFFFFF00F800
      3FFF80000FF00000F0001FFFFFFFFFFFFC01F0001FFF000007F00000E0000FFF
      FE38FFF1FC0070001FFF000007F00000E000007FFC927FE4FE0000000FFE0000
      03F00000E000003FF145000A0F00000007FE040003F00000E000003FF0820004
      0FE0000003FE400003F00000E000001FF00000000FF0000001FE050003F00000
      E000001FF00000000FF8000000FE020003F00000E000001FF00000000FF80000
      007E020003F00000E000000FF00000000FF80000007E050003F00000F0000007
      F00000000FF8000007FE460003F00000F0000007F00FFE001FF800001FFE4200
      01F00000F800000FF00800003FF800001FFE064001F00000FC00003FF0080000
      7FF800001FFE138003F00000FE000EFFF0080001FFF800401FFE810001F00000
      FF007FFFF0080003FFF800801FFE880003F00000FFC0FFFFF0080003FFF80180
      1FFEC00003F00000FF807FFFF7F800FFFFF000001FFE000003F00000FF807FFF
      F00001FFFFE802001FFE040003F00000FF007FFFFFFFFFFFFFF004001FFE0000
      03F00000FF003FFFFFFFFFFFFFFC08000FFE000007F00000FF001FFFFFFFFFFF
      FFF808000FFF118007F00000FF003FFFFFFFFFFFFFFD10000FFF332807F00000
      FF807FFFFFFFFFFFFFFE30001FFF90600FF00000FF80FFFFFFFFFFFFFFFFC000
      1FFF84070FF00000FFC1FFFFFFFFFFFFFFFF40003FFFC0201FF00000FFFFFFFF
      FFFFFFFFFFFFC0007FFFF008BFF00000FFFFFFFFFFFFFFFFFFFFF800FFFFFFC3
      FFF00000FFFFFFFFFFFFFFFFFFFFFFF1FFFFFFFFFFF00000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF00000FFFFFFFFFFFFFFC3FFFFFFFFF0FFFFFF83F00000
      FFFFFFFFFFFFFFC1FFFFFFFFC0FFFFF300F00000F00000003C57FFC07F8AFFFF
      00FAAFF000700000C00000007CAABF401F9557EA00F9557000300000C0000000
      FC055A800F80AB5400F80A9010100000C0000001FC002500078004A000F80060
      0C100000C0000001FC0000000380000000F8000002100000C0000001FC000000
      0780000000F800000DF00000C0000001FC0000001F80000000F800000C000000
      C0000001FC0000007F80000100F8000010000000C0000001FC000000FF800000
      80F800000C000000C0000001FC000001FF80000160F8000010000000C02AAA01
      FC000001FF800002B0F8000000000000C0105501F800000BFF0000017CF00000
      00000000C0000081F8000015FF000002BFF0000000D00000E0000003F800000B
      FF0000017FF0000003F00000E0000003F9000015FF200002BFF000002FF00000
      F0000007F800000BFF0000017FF0000013F00000F0000007F8000015FF000002
      BFF000002FF00000F800000FF000000BFE0000017FE0000013F00000F800000F
      F0000015FE000002BFE000002FF00000FC00001FF000000BFE0000017FE00000
      13F00000FC00001FF0000015FE000002BFE000002FF00000FE00003FE000000B
      FC0000017FC0000013F00000FE00003FE0000014FC0000029FC000002DF00000
      FF00007FE000000BFC0000017FC0000013F00000FFC003FFE000000BFC000001
      7FC0000013F00000FFF007FFE0000004FC0000009FC000000DF00000FFF80FFF
      E000000FFC000001FFC000001FF00000FFFC1FFFFC00000FFF800001FFF80000
      1FF00000FFFE1FFFFFC0000FFFF80001FFFF80001FF00000FFFF3FFFFFFF800F
      FFFFF001FFFFFF001FF00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000800000001FFFFFFFFFFFFFFF
      FFFFFFFFFFF00000000000001FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000
      1C081F0C7F00000000FFFFFFFFF00000000000001E0C3F20FF3E0183F0F80000
      00100000000000001F08FF21FF180387E0E0000000300000000000001F08FF23
      FF008183E3E0000000700000000000001F08FF23FF01C081E3E0000000F00000
      000000001F08FF23FF03E040E3E0000000F00000000000001F089F23FF078062
      E3E0000000F00000000000001F089F233F0F80F2E3E0000000F0000000000000
      1F089F033F0F01F2C3E0000000F00000000000001F089E013F0E03F607E00000
      00F00000000000001F089E013F0207F10FE0000000F00000000000001D009C01
      3F0007EC1FE0000000F0000000000000180018003F0004183FE0000080F00000
      000000001E000C001F1C00003FE0001040F000000000000018005800BFEE000F
      7FF0000801F0000000000000180018007F7600C03FF0000401F0000000000000
      180098007F6601803FF8000203F0000000000000180018007F0703003FF80000
      03F0000000000000183418007F8F070000FC000007F00000000000001C001820
      7FFF810000FC000007F00000000000001C003800FFFFC08000FE00000FF00000
      000000001C003800FFFFC0C001FE00000FF00000000000001C003800FFFFC0E0
      1FFF00001FF00000000000001E407C01FFFF80F03FFF00001FF0000000000000
      1FF7FF8FFFFFE1F07FFF84043FF00000000000001FC3FE01FFFFFFF0FFFFFC07
      FFF00000000000001F81FE01FFFFFFF87FFFFC07FFF00000000000001F81FF03
      FFFFFFF01FFFFC07FFF00000000000001F81FF03FFFFFFF03FFFFC07FFF00000
      000000001F81FF8FFFFFFFF07FFFFE0FFFF00000000000001FC3FF8FFFFFFFF0
      3FFFFFFFFFF00000000000001FFFFFFFFFFFFFF07FFFFFFFFFF0000000000000
      1FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000
      000000000000}
  end
  object qNN: TOilQuery
    SQL.Strings = (
      'select * from v_oil_Nnak'
      'where id = :a'
      'and inst = :b')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 456
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'a'
      end
      item
        DataType = ftInteger
        Name = 'b'
      end>
    object qNNID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qNNINST: TFloatField
      FieldName = 'INST'
      Required = True
    end
    object qNNS_DATE: TDateTimeField
      FieldName = 'S_DATE'
    end
    object qNNORGAN: TFloatField
      FieldName = 'ORGAN'
    end
    object qNNORGAN_INST: TFloatField
      FieldName = 'ORGAN_INST'
    end
    object qNNNUM: TStringField
      FieldName = 'NUM'
      Size = 32
    end
    object qNNF_DOC: TStringField
      FieldName = 'F_DOC'
      Size = 200
    end
    object qNNFRASCH: TStringField
      FieldName = 'FRASCH'
      Size = 100
    end
    object qNNR_DATE: TDateTimeField
      FieldName = 'R_DATE'
    end
    object qNNSALE_TXT: TStringField
      FieldName = 'SALE_TXT'
      Size = 80
    end
    object qNNNDS_T: TFloatField
      FieldName = 'NDS_T'
    end
    object qNNNDS_P_BASE: TFloatField
      FieldName = 'NDS_P_BASE'
    end
    object qNNNDS_P_20: TFloatField
      FieldName = 'NDS_P_20'
    end
    object qNNNDS_NP_BASE: TFloatField
      FieldName = 'NDS_NP_BASE'
    end
    object qNNNDS_NP_20: TFloatField
      FieldName = 'NDS_NP_20'
    end
    object qNNVNDS_T: TFloatField
      FieldName = 'VNDS_T'
    end
    object qNNVNDS_P_S: TFloatField
      FieldName = 'VNDS_P_S'
    end
    object qNNVNDS_P_O: TFloatField
      FieldName = 'VNDS_P_O'
    end
    object qNNVNDS_P_NB: TFloatField
      FieldName = 'VNDS_P_NB'
    end
    object qNNVNDS_NP_S: TFloatField
      FieldName = 'VNDS_NP_S'
    end
    object qNNVNDS_NP_O: TFloatField
      FieldName = 'VNDS_NP_O'
    end
    object qNNVNDS_NP_NB: TFloatField
      FieldName = 'VNDS_NP_NB'
    end
    object qNNVNDS_NP_EXP: TFloatField
      FieldName = 'VNDS_NP_EXP'
    end
    object qNNK_VNDS_S: TFloatField
      FieldName = 'K_VNDS_S'
    end
    object qNNK_VNDS_O: TFloatField
      FieldName = 'K_VNDS_O'
    end
    object qNNK_NDS_B: TFloatField
      FieldName = 'K_NDS_B'
    end
    object qNNK_NDS_20: TFloatField
      FieldName = 'K_NDS_20'
    end
    object qNNTOV_ID: TFloatField
      FieldName = 'TOV_ID'
    end
    object qNNDIV_ID: TFloatField
      FieldName = 'DIV_ID'
    end
    object qNNKOL: TFloatField
      FieldName = 'KOL'
    end
    object qNNFROM_: TFloatField
      FieldName = 'FROM_'
    end
    object qNNFROM_INST: TFloatField
      FieldName = 'FROM_INST'
    end
    object qNNNAL_T: TFloatField
      FieldName = 'NAL_T'
    end
    object qNNFROM_NAME: TStringField
      FieldName = 'FROM_NAME'
      Size = 300
    end
    object qNNFROM_ADDR: TStringField
      FieldName = 'FROM_ADDR'
      Size = 200
    end
    object qNNFROM_SVID_NUM: TStringField
      FieldName = 'FROM_SVID_NUM'
      Size = 50
    end
    object qNNFROM_NAL_NUM: TStringField
      FieldName = 'FROM_NAL_NUM'
      Size = 50
    end
    object qNNFROM_BOSS: TStringField
      FieldName = 'FROM_BOSS'
      Size = 50
    end
    object qNNFROM_OKPO: TStringField
      FieldName = 'FROM_OKPO'
    end
    object qNNFROM_PHONE: TStringField
      FieldName = 'FROM_PHONE'
      Size = 30
    end
    object qNNTO_NAME: TStringField
      FieldName = 'TO_NAME'
      Size = 300
    end
    object qNNTO_ADDR: TStringField
      FieldName = 'TO_ADDR'
      Size = 200
    end
    object qNNTO_SVID_NUM: TStringField
      FieldName = 'TO_SVID_NUM'
      Size = 50
    end
    object qNNTO_NAL_NUM: TStringField
      FieldName = 'TO_NAL_NUM'
      Size = 50
    end
    object qNNTO_BOSS: TStringField
      FieldName = 'TO_BOSS'
      Size = 50
    end
    object qNNTO_OKPO: TStringField
      FieldName = 'TO_OKPO'
    end
    object qNNTO_PHONE: TStringField
      FieldName = 'TO_PHONE'
      Size = 30
    end
    object qNNDIM_NAME: TStringField
      FieldName = 'DIM_NAME'
      Size = 50
    end
    object qNNNP_TYPE_NAME: TStringField
      FieldName = 'NP_TYPE_NAME'
      Size = 50
    end
    object qNNPRICE: TFloatField
      FieldName = 'PRICE'
    end
  end
  object FormStorage1: TFormStorage
    IniFileName = 'Software\Oil'
    IniSection = 'Main'
    Options = []
    UseRegistry = True
    StoredProps.Strings = (
      'miOneOilInstance.Checked')
    StoredValues = <>
    Left = 312
    Top = 232
  end
  object RestsQuery: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 592
    Top = 256
  end
  object Query1: TOilQuery
    SQL.Strings = (
      'Select name,Par_Name from '
      'V_oil_org '
      'where id = :a And inst = id')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 384
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'a'
      end>
    object StringField1: TStringField
      FieldName = 'NAME'
      Origin = 'V_OIL_ORG.NAME'
      Size = 100
    end
    object StringField2: TStringField
      FieldName = 'PAR_NAME'
      Origin = 'V_OIL_ORG.PAR_NAME'
      Size = 100
    end
  end
  object NNNumQuery: TOilQuery
    SQL.Strings = (
      'select nal_nakl_num.nextval as newnum from '
      'sys.dual')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 568
    Top = 64
    object NNNumQueryNEWNUM: TFloatField
      FieldName = 'NEWNUM'
    end
  end
  object DebitorsQuery: TOilQuery
    SQL.Strings = (
      'insert into OIL_DEB_RESEND (id_c, inst_c, date_op) values'
      '(:id, :inst, :date_)')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 592
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end
      item
        DataType = ftUnknown
        Name = 'date_'
      end>
  end
  object qTemp: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 32
    Top = 288
  end
  object pmExch: TPopupMenu
    Images = il
    Left = 288
    Top = 64
    object N100: TMenuItem
      Caption = #1047#1072#1084#1077#1085#1072' '#1087#1072#1088#1090#1080#1081
      RadioItem = True
      OnClick = N100Click
    end
    object N101: TMenuItem
      Caption = #1047#1072#1084#1077#1085#1072' '#1087#1086#1076#1087#1072#1088#1090#1080#1081
      RadioItem = True
      OnClick = N101Click
    end
    object miSynchroOrg: TMenuItem
      Caption = #1047#1072#1084#1077#1085#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
      OnClick = miSynchroClick
    end
    object miSynchroAuto: TMenuItem
      Caption = #1047#1072#1084#1077#1085#1072' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1077#1081
      OnClick = miSynchroClick
    end
    object miSynchroEmploy: TMenuItem
      Caption = #1047#1072#1084#1077#1085#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      OnClick = miSynchroClick
    end
  end
  object timDailyRep: TRxTimerList
    Left = 688
    Top = 240
    object MessEvent: TRxTimerEvent
      OnTimer = MessEventTimer
    end
    object ExpireEvent: TRxTimerEvent
      Cycled = False
      RepeatCount = 1
      OnTimer = ExpireEventTimer
    end
  end
  object timPackets: TRxTimerList
    Left = 688
    Top = 192
    object UnloadAfterDR: TRxTimerEvent
      Cycled = False
      Enabled = False
      OnTimer = UnloadAfterDRTimer
    end
    object UnloadEvening: TRxTimerEvent
      Cycled = False
      Enabled = False
      OnTimer = UnloadEveningTimer
    end
    object UnloadMessage: TRxTimerEvent
      Enabled = False
      OnTimer = UnloadMessageTimer
    end
    object UnloadCardAlientRn: TRxTimerEvent
      OnTimer = UnloadCardAlientRnTimer
    end
  end
  object timPetrol: TRxTimerList
    Active = True
    Left = 688
    Top = 144
    object teSuccIncass: TRxTimerEvent
      Cycled = False
      RepeatCount = 1000
      Enabled = False
      OnTimer = teSuccIncassTimer
    end
    object teSuccIncassMsg: TRxTimerEvent
      RepeatCount = 1000
      Enabled = False
      OnTimer = teSuccIncassMsgTimer
    end
    object teLoadModemTrans: TRxTimerEvent
      Cycled = False
      RepeatCount = 1000
      Enabled = False
      OnTimer = teLoadModemTransTimer
    end
    object teLoadModemTransMsg: TRxTimerEvent
      RepeatCount = 1000
      Enabled = False
      OnTimer = teLoadModemTransMsgTimer
    end
    object teLoadCardTrans: TRxTimerEvent
      Cycled = False
      RepeatCount = 1000
      Enabled = False
      OnTimer = teLoadCardTransTimer
    end
    object teLoadCardTransMsg: TRxTimerEvent
      RepeatCount = 1000
      Enabled = False
      OnTimer = teLoadCardTransMsgTimer
    end
    object tePutBlackList: TRxTimerEvent
      Cycled = False
      RepeatCount = 1000
      Enabled = False
      OnTimer = tePutBlackListTimer
    end
    object tePutBlackListMsg: TRxTimerEvent
      RepeatCount = 1000
      Enabled = False
      OnTimer = tePutBlackListMsgTimer
    end
    object teLoadPackPC: TRxTimerEvent
      Cycled = False
      RepeatCount = 1000
      Enabled = False
      OnTimer = teLoadPackPCTimer
    end
    object teLoadPackPCMsg: TRxTimerEvent
      RepeatCount = 1000
      Enabled = False
      OnTimer = teLoadPackPCMsgTimer
    end
    object teSendPackPC: TRxTimerEvent
      Cycled = False
      RepeatCount = 1000
      Enabled = False
      OnTimer = teSendPackPCTimer
    end
    object teSendPackPCMsg: TRxTimerEvent
      RepeatCount = 1000
      Enabled = False
      OnTimer = teSendPackPCMsgTimer
    end
    object teMakeBlackList: TRxTimerEvent
      Cycled = False
      RepeatCount = 1000
      Enabled = False
      OnTimer = teMakeBlackListTimer
    end
    object teMakeBlackListMsg: TRxTimerEvent
      RepeatCount = 1000
      Enabled = False
      OnTimer = teMakeBlackListMsgTimer
    end
    object teRunComServerMsg: TRxTimerEvent
      RepeatCount = 1000
      Enabled = False
      OnTimer = teRunComServerMsgTimer
    end
  end
  object pmMDI: TPopupMenu
    Left = 128
    Top = 176
    object miMDIRestore: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      OnClick = miMDIRestoreClick
    end
    object miMDIMinimize: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100
      OnClick = miMDIMinimizeClick
    end
    object N132: TMenuItem
      Caption = '-'
    end
    object miMDIClose: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = miMDICloseClick
    end
  end
  object qMainMenu: TOilQuery
    SQL.Strings = (
      'SELECT o.NAME, u.ID'
      'FROM ADM_OBJECT o, ADM_USERS u, ADM_USER_RIGHT ur'
      'WHERE  (ur.OBJECT_ID = o.ID)'
      '   AND  (ur.USER_ID = u.ID)'
      '   AND  (o.TYPE = '#39'M'#39')'
      '   AND  (u.id=:USER_ID)'
      ' ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 176
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'USER_ID'
      end>
  end
  object BaseImage: TImageList
    Left = 176
    Top = 120
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000007F7F7F007F7F7F00FFFFFF007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000FFFFFF007F7F7F000000
      00007F7F7F007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F007F7F7F000000
      0000000000000000000000000000FFFFFF007F7F7F00FFFFFF00000000000000
      00000000000000000000FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000FFFFFF000000
      0000FFFFFF007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF007F7F7F00FFFFFF007F7F
      7F007F7F7F00FFFFFF00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      00007F7F7F0000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F
      7F000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF00FFFF
      FF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      000000000000FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000007F7F7F007F7F7F007F7F7F000000
      0000FFFFFF00FFFFFF007F7F7F007F7F7F00000000007F7F7F00000000000000
      00007F7F7F007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F00000000007F7F7F0000000000000000000000
      000000000000FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F00000000007F7F7F000000000000000000FFFFFF00FFFF
      FF007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00007F7F7F00000000007F7F7F00FFFFFF00000000007F7F7F007F7F7F000000
      00007F7F7F00FFFFFF00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000007F7F
      7F00FFFFFF007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      00007F7F7F00FFFFFF007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F00000000007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F0000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      800080808000808080008080800080808000FFFFFF00FFFFFF00808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF0000000000FFFF
      FF00000000000000000000000000000000000000000080808000000000000000
      000000000000000000000000000080808000FFFFFF00FFFFFF00808080000000
      0000808080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      000080808000808080008080800080808000FFFFFF00FFFFFF00808080008080
      8000808080008080800000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000080808000000000000000
      000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000080808000000000000000
      000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000080808000000000000000
      000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      000080808000808080008080800080808000FFFFFF00FFFFFF00808080008080
      8000808080008080800000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000080808000000000000000
      000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF0000000000FFFF
      FF00000000000000000000000000000000000000000080808000000000008080
      800000000000000000000000000080808000FFFFFF00FFFFFF00808080000000
      0000808080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF0000000000FFFF
      FF00000000000000000000000000000000000000000080808000000000000000
      000000000000000000000000000080808000FFFFFF00FFFFFF00808080000000
      0000808080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000080808000000000008080
      8000000000008080800000000000808080008080800080808000808080000000
      0000808080000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000080808000000000008080
      8000000000008080800080808000000000008080800080808000808080000000
      0000808080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000080808000000000008080
      8000808080008080800000000000808080000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000080808000000000008080
      8000808080008080800000000000808080000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000080808000000000008080
      8000808080008080800000000000000000000000000080808000000000008080
      8000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000080808000000000008080
      8000808080008080800000000000000000000000000080808000000000008080
      8000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FC00FC0000000000FC00906800000000
      200000920000000000001E3C0000000000001C520000000000001E0200000000
      00001C16000000000000180E000000000000001800000000000010B200000000
      E000E17800000000F800FAC000000000F000F49200000000E001E0F100000000
      C403C40300000000EC07EC0700000000FE1FFE1FFFFFFFFF8007800780078007
      8007BE178007BFF78003B0038007BFF78003B0038003B0038003B0038003B003
      8003B0038003B0038007AE178003B0038007BE178007BFF78007AA178007A917
      8007BFF78007BFF78007A2F78007A2F78007BF878007BF87802FA3AF802FA3AF
      801FBF9F801FBF9F803F803F803F803F00000000000000000000000000000000
      000000000000}
  end
  object OraScriptTalon: TOraScript
    SQL.Strings = (
      '--> OraScriptTalon,Main')
    OnError = OraScriptTalonError
    Session = frmStart.OraSession1
    Left = 32
    Top = 384
  end
  object timOilChecks: TRxTimerList
    Active = True
    Left = 688
    Top = 92
    object RegularFirstTest: TRxTimerEvent
      Interval = 1200000
      OnTimer = RegularFirstTestTimer
    end
    object DayEndOilOff: TRxTimerEvent
      Interval = 900000
      OnTimer = DayEndOilOffTimer
    end
    object OilOffLast1Min: TRxTimerEvent
      Enabled = False
      Interval = 60000
      OnTimer = OilOffLast1MinTimer
    end
  end
end
