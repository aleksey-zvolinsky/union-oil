inherited frmCardDocEnh: TfrmCardDocEnh
  Left = 229
  Top = 206
  Width = 750
  Height = 426
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1076#1083#1103' '#1082#1083#1080#1077#1085#1090#1086#1074' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1072#1084' '#1051#1057
  Constraints.MinHeight = 400
  Constraints.MinWidth = 720
  ParentFont = True
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TPageControl
    Left = 0
    Top = 57
    Width = 742
    Height = 342
    ActivePage = tsMakePrePay
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotTrack = True
    MultiLine = True
    ParentFont = False
    PopupMenu = pm
    ScrollOpposite = True
    TabOrder = 0
    object tsRest: TTabSheet
      Caption = #1054#1089#1090#1072#1090#1082#1080' '#1087#1088#1077#1076#1086#1087#1083#1072#1090#1099
      ImageIndex = 3
      object GroupBox4: TGroupBox
        Left = 0
        Top = 274
        Width = 734
        Height = 40
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          734
          40)
        object sbSum: TSpeedButton
          Left = 230
          Top = 9
          Width = 25
          Height = 27
          Hint = #1042#1082#1083'/'#1086#1090#1082#1083'. '#1087#1086#1076#1089#1095#1077#1090' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
          AllowAllUp = True
          GroupIndex = 12
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
            03333377777777777F33333003333330033333377FF333377F33333300333333
            0333333377FF33337F3333333003333303333333377FF3337333333333003333
            333333333377FF3333333333333003333333333333377FF33333333333330033
            3333333333337733333333333330033333333333333773333333333333003333
            33333333337733333F3333333003333303333333377333337F33333300333333
            03333333773333337F33333003333330033333377FFFFFF77F33330000000000
            0333337777777777733333333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = sbSumClick
        end
        object bbMakeCorr: TBitBtn
          Left = 105
          Top = 9
          Width = 119
          Height = 27
          Anchors = [akLeft, akBottom]
          Caption = #1055#1077#1088#1077#1073#1088#1086#1089#1082#1072
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = bbMakeCorrClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
        end
        object bbCheckRest: TBitBtn
          Left = 4
          Top = 9
          Width = 96
          Height = 27
          Anchors = [akLeft, akBottom]
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = bbCheckRestClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888888888888000000000000880077777777777788770FFFFFFFFFF0
            800078888888888787770F0000FF0000700878777788777777780FFFFFF07887
            078878888887788777880F0FFF0788E770887878887788F777880FFFFF088887
            808878888878888787880F000F08E887808878777878F88787880FFFFF07EE87
            708878888877FF8777880F0F0FF07887088878787887788778880FFFFFFF0000
            888878888888777788880F000F0FFFF0888878777878888788880FFFFFFF0000
            888878888888777788880F000FFF0808888878777888787888880FFFFFFF0088
            8888788888887788888800000000088888887777777778888888}
          NumGlyphs = 2
        end
        object BitBtn3: TBitBtn
          Left = 645
          Top = 9
          Width = 85
          Height = 27
          Anchors = [akRight, akBottom]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ModalResult = 1
          ParentFont = False
          TabOrder = 2
          OnClick = bbCloseClick
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
          Style = bsNew
        end
      end
      object dbgRest: TDBGridEh
        Left = 0
        Top = 0
        Width = 734
        Height = 274
        Align = alClient
        Ctl3D = True
        DataSource = dsRest
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clSilver
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clBlack
        FooterFont.Height = -12
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        FrozenCols = 5
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
        ParentCtl3D = False
        ParentFont = False
        PopupMenu = pm
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        UseMultiTitle = True
        VTitleMargin = 5
        OnGetCellParams = dbgRestGetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'PERIOD_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'DOGNAME'
            Footers = <>
            Title.Caption = #1044#1086#1075#1086#1074#1086#1088
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'NPNAME'
            Footers = <>
            Title.Caption = #1058#1080#1087' '#1053#1055
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072
            Width = 40
          end
          item
            EditButtons = <>
            FieldName = 'DOG_LITR'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1055#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' ('#1083')'
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'DOG_AMOUNT'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1055#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' ('#1075#1088#1085')'
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'MONEY'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1055#1086' '#1086#1087#1083#1072#1090#1072#1084' ('#1075#1088#1085')'
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'EXP_LITR'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1057#1087#1080#1089#1072#1085#1086' ('#1083')'
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'EXP_AMOUNT'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1057#1087#1080#1089#1072#1085#1086' ('#1075#1088#1085')'
            Width = 80
          end
          item
            Color = 15329769
            EditButtons = <>
            FieldName = 'REST_LITR'
            Footers = <>
            Title.Caption = #1054#1073#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082' ('#1083')'
            Width = 70
          end
          item
            Color = 15329769
            EditButtons = <>
            FieldName = 'REST_AMOUNT'
            Footers = <>
            Title.Caption = #1054#1073#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082' ('#1075#1088#1085')'
            Width = 80
          end>
      end
    end
    object tsReservTaxBills: TTabSheet
      Caption = #1056#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1080#1077' '#1053#1053
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 3
      ParentFont = False
      object dbgReserv: TDBGridEh
        Left = 0
        Top = 0
        Width = 734
        Height = 274
        Align = alClient
        DataSource = dsReserv
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clBlack
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'TAXBILLDATE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'TAXBILLNUM'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1053#1086#1084#1077#1088' '#1053#1053
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = 'ORGNAME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
            Width = 311
          end>
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 274
        Width = 734
        Height = 40
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          734
          40)
        object sbViewReserv: TRxSpeedButton
          Left = 43
          Top = 9
          Width = 47
          Height = 27
          DropDownMenu = pmViewReserv
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888888888888000000000000880077777777777788770FFFFFFFFFF0
            800078888888888787770F0000FF0000700878777788777777780FFFFFF07887
            078878888887788777880F0FFF0788E770887878887788F777880FFFFF088887
            808878888878888787880F000F08E887808878777878F88787880FFFFF07EE87
            708878888877FF8777880F0F0FF07887088878787887788778880FFFFFFF0000
            888878888888777788880F000F0FFFF0888878777878888788880FFFFFFF0000
            888878888888777788880F000FFF0808888878777888787888880FFFFFFF0088
            8888788888887788888800000000088888887777777778888888}
          NumGlyphs = 2
        end
        object bbReservStart: TBitBtn
          Left = 94
          Top = 9
          Width = 169
          Height = 27
          Caption = #1053#1072#1095#1072#1090#1100' '#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1080#1077
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = bbReservStartClick
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
        object BitBtn2: TBitBtn
          Left = 645
          Top = 9
          Width = 85
          Height = 27
          Anchors = [akRight, akBottom]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ModalResult = 1
          ParentFont = False
          TabOrder = 1
          OnClick = bbCloseClick
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
          Style = bsNew
        end
        object bbDelReserved: TBitBtn
          Left = 6
          Top = 9
          Width = 33
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = bbDelReservedClick
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
          NumGlyphs = 2
        end
      end
    end
    object tsMakePrePay: TTabSheet
      Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1053#1053
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 3
      ParentFont = False
      object GroupBox1: TGroupBox
        Left = 0
        Top = 274
        Width = 734
        Height = 40
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          734
          40)
        object bbMake: TSpeedButton
          Left = 146
          Top = 9
          Width = 114
          Height = 27
          Hint = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1083#1086#1075#1086#1074#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
          Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333377F3333333333000033334224333333333333
            337337F3333333330000333422224333333333333733337F3333333300003342
            222224333333333373333337F3333333000034222A22224333333337F337F333
            7F33333300003222A3A2224333333337F3737F337F33333300003A2A333A2224
            33333337F73337F337F33333000033A33333A222433333337333337F337F3333
            0000333333333A222433333333333337F337F33300003333333333A222433333
            333333337F337F33000033333333333A222433333333333337F337F300003333
            33333333A222433333333333337F337F00003333333333333A22433333333333
            3337F37F000033333333333333A223333333333333337F730000333333333333
            333A333333333333333337330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = bbMakeClick
        end
        object sbMakeSum: TSpeedButton
          Left = 264
          Top = 9
          Width = 25
          Height = 27
          Hint = #1042#1082#1083'/'#1086#1090#1082#1083'. '#1087#1086#1076#1089#1095#1077#1090' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
          AllowAllUp = True
          GroupIndex = 12
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
            03333377777777777F33333003333330033333377FF333377F33333300333333
            0333333377FF33337F3333333003333303333333377FF3337333333333003333
            333333333377FF3333333333333003333333333333377FF33333333333330033
            3333333333337733333333333330033333333333333773333333333333003333
            33333333337733333F3333333003333303333333377333337F33333300333333
            03333333773333337F33333003333330033333377FFFFFF77F33330000000000
            0333337777777777733333333333333333333333333333333333}
          NumGlyphs = 2
          OnClick = sbMakeSumClick
        end
        object sbEdit: TRxSpeedButton
          Left = 6
          Top = 9
          Width = 34
          Height = 27
          DropDownMenu = pmEditTB
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800008
            88888888888777788888800000009900088887777777FF77788880FFFFF0990F
            088887888887FF78788880FF00009900008887887777FF77778880FF09999999
            908887887FFFFFFFF78880FF09999999908887887FFFFFFFF78880FF00009900
            008887887777FF77778880F0FFF0990F088887878887FF78788880FFFFF0990F
            088887888887FF78788880F0F0F0000F0888878787877778788880FFFFFFFFFF
            0888878888888888788880F000F0FFFF0888878777878888788880FFFFFFF000
            0888878888888777788880F000FFF0808888878777888787888880FFFFFFF008
            8888878888888778888880000000008888888777777777888888}
          NumGlyphs = 2
        end
        object btnShowTB: TBitBtn
          Left = 44
          Top = 9
          Width = 96
          Height = 27
          Anchors = [akLeft, akBottom]
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnShowTBClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888888888888000000000000880077777777777788770FFFFFFFFFF0
            800078888888888787770F0000FF0000700878777788777777780FFFFFF07887
            078878888887788777880F0FFF0788E770887878887788F777880FFFFF088887
            808878888878888787880F000F08E887808878777878F88787880FFFFF07EE87
            708878888877FF8777880F0F0FF07887088878787887788778880FFFFFFF0000
            888878888888777788880F000F0FFFF0888878777878888788880FFFFFFF0000
            888878888888777788880F000FFF0808888878777888787888880FFFFFFF0088
            8888788888887788888800000000088888887777777778888888}
          NumGlyphs = 2
        end
        object BitBtn1: TBitBtn
          Left = 645
          Top = 9
          Width = 85
          Height = 27
          Anchors = [akRight, akBottom]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ModalResult = 1
          ParentFont = False
          TabOrder = 1
          OnClick = bbCloseClick
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
      end
      object dbgMake: TDBGridEh
        Left = 0
        Top = 0
        Width = 734
        Height = 274
        Align = alClient
        DataSource = dsMake
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
        FrozenCols = 5
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = pm
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ORG_NAME'
            Footer.Alignment = taRightJustify
            Footer.Value = #1050'-'#1074#1086'('#1096#1090')'
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 166
          end
          item
            EditButtons = <>
            FieldName = 'NPNAME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1058#1080#1087' '#1053#1055
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'NAL_T_TEXT'
            Footer.FieldName = 'name'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1058#1080#1087' '#1053#1053
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'NN_DATE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072' '#1053#1053
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'PRICENDS'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1062#1077#1085#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 32
          end
          item
            EditButtons = <>
            FieldName = 'CALC_NN_LITR'
            Footer.FieldName = 'CALC_NN_LITR'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1056#1072#1089#1095#1077#1090#1085#1086#1077' '#1082'-'#1074#1086' ('#1083')'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'CALC_NN_SUM'
            Footer.FieldName = 'CALC_NN_SUM'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1056#1072#1089#1095#1077#1090#1085#1086#1077' '#1082'-'#1074#1086' ('#1075#1088#1085')'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'REAL_NN_LITR'
            Footer.FieldName = 'REAL_NN_LITR'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1057#1092#1086#1088#1084#1080' - '#1088#1086#1074#1072#1085#1086'('#1083')'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'REAL_NN_SUM'
            Footer.FieldName = 'REAL_NN_SUM'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1057#1092#1086#1088#1084#1080' - '#1088#1086#1074#1072#1085#1086'('#1075#1088#1085')'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 63
          end
          item
            EditButtons = <>
            FieldName = 'DELTA_LITR'
            Footer.FieldName = 'DELTA_LITR'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1056#1072#1079#1085#1080#1094#1072'    ('#1083')'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'DELTA_SUM'
            Footer.FieldName = 'DELTA_SUM'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1056#1072#1079#1085#1080#1094#1072'    ('#1075#1088#1085')'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'NN_NUM'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #8470' '#1053#1053
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 74
          end>
      end
    end
    object tsPrintTaxBills: TTabSheet
      Caption = #1055#1077#1095#1072#1090#1100'/'#1059#1076#1072#1083#1077#1085#1080#1077' '#1053#1053
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      object gbPrintTB: TGroupBox
        Left = 0
        Top = 274
        Width = 734
        Height = 40
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          734
          40)
        object Label6: TLabel
          Left = 456
          Top = 16
          Width = 61
          Height = 13
          Caption = #1074#1099#1074#1077#1089#1090#1080' '#1085#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object bbDelTaxBills: TSpeedButton
          Left = 7
          Top = 9
          Width = 34
          Height = 27
          Hint = #1059#1076#1072#1083#1080#1090#1100
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = bbDelTaxBillsClick
        end
        object bbPrint: TBitBtn
          Left = 133
          Top = 9
          Width = 85
          Height = 27
          Anchors = [akLeft, akBottom]
          Caption = #1055#1077#1095#1072#1090#1100
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = bbPrintClick
          Glyph.Data = {
            E6040000424DE604000000000000360000002800000014000000140000000100
            180000000000B0040000C40E0000C40E00000000000000000000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000
            000000000000000000000000000000000000000000000000000000C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6
            C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6C6000000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C00000000000000000000000000000000000000000
            00000000000000000000000000000000000000C6C6C6000000C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600FFFF
            00FFFF00FFFFC6C6C6C6C6C6000000000000000000C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C684848484848484
            8484C6C6C6C6C6C6000000C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000C6C6C6C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0000000C6
            C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000
            C6C6C6000000C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
            00000000000000000000000000000000000000000000000000C6C6C6000000C6
            C6C6000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C6C6000000C6C6
            C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF00
            0000000000000000000000000000FFFFFF000000000000000000000000C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF000000000000
            000000000000000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000000000000000000000
            00000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0}
        end
        object bbRefresh: TBitBtn
          Left = 44
          Top = 9
          Width = 85
          Height = 27
          Anchors = [akLeft, akBottom]
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = bbRefreshClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888888888888000000000000880077777777777788770FFFFFFFFFF0
            800078888888888787770F0000FF0000700878777788777777780FFFFFF07887
            078878888887788777880F0FFF0788E770887878887788F777880FFFFF088887
            808878888878888787880F000F08E887808878777878F88787880FFFFF07EE87
            708878888877FF8777880F0F0FF07887088878787887788778880FFFFFFF0000
            888878888888777788880F000F0FFFF0888878777878888788880FFFFFFF0000
            888878888888777788880F000FFF0808888878777888787888880FFFFFFF0088
            8888788888887788888800000000088888887777777778888888}
          NumGlyphs = 2
        end
        object rbOriginal: TRadioButton
          Left = 377
          Top = 16
          Width = 73
          Height = 13
          Caption = #1054#1088#1080#1075#1080#1085#1072#1083
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TabStop = True
        end
        object rbCopy: TRadioButton
          Left = 320
          Top = 16
          Width = 53
          Height = 13
          Caption = #1050#1086#1087#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object cbOutputType: TComboBox
          Left = 520
          Top = 12
          Width = 89
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 4
          Items.Strings = (
            #1069#1082#1088#1072#1085
            #1044#1080#1089#1082
            #1055#1088#1080#1085#1090#1077#1088)
        end
        object bbClose: TBitBtn
          Left = 645
          Top = 9
          Width = 85
          Height = 27
          Anchors = [akRight, akBottom]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ModalResult = 1
          ParentFont = False
          TabOrder = 5
          OnClick = bbCloseClick
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
          Style = bsNew
        end
      end
      object dbgViewTaxBills: TDBGridEh
        Left = 0
        Top = 0
        Width = 734
        Height = 274
        Align = alClient
        DataSource = dsViewTaxBills
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clBlack
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FrozenCols = 5
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        PopupMenu = pm
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'TAXBILLDATE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072' '#1053#1053
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'Orgname'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
            Width = 128
          end
          item
            EditButtons = <>
            FieldName = 'TAXBILLNUM'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #8470' '#1053#1053
            Width = 53
          end
          item
            EditButtons = <>
            FieldName = 'TAXBILLTYPE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1058#1080#1087' '#1053#1053
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'NPNAME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1058#1080#1087' '#1053#1055
            Width = 73
          end
          item
            EditButtons = <>
            FieldName = 'COUNTLITR'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1050'-'#1074#1086' '#1083#1080#1090#1088#1086#1074
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'PRICENDS'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1062#1077#1085#1072
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'SUMNDS'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1057#1091#1084#1084#1072
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'BYDOGNAME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1057#1086#1075#1083#1072#1089#1085#1086' '#1076#1086#1075#1086#1074#1086#1088#1072
            Width = 181
          end>
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 57
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 9
      Width = 36
      Height = 13
      Caption = #1050#1083#1080#1077#1085#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 7
      Top = 34
      Width = 35
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 208
      Top = 34
      Width = 12
      Height = 13
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sbClearOptions: TSpeedButton
      Left = 330
      Top = 4
      Width = 21
      Height = 21
      Hint = '21'
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
      OnClick = sbClearOptionsClick
    end
    object Label4: TLabel
      Left = 386
      Top = 34
      Width = 35
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072
    end
    object sbGroupClear: TSpeedButton
      Left = 578
      Top = 29
      Width = 21
      Height = 21
      Hint = '21'
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
      OnClick = sbGroupClearClick
    end
    object sbNpTypeClear: TSpeedButton
      Left = 578
      Top = 4
      Width = 21
      Height = 21
      Hint = '21'
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
      OnClick = sbNpTypeClearClick
    end
    object Label7: TLabel
      Left = 386
      Top = 9
      Width = 16
      Height = 13
      Caption = #1053#1055
    end
    object ceOrgName: TComboEdit
      Left = 50
      Top = 5
      Width = 279
      Height = 21
      DirectInput = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ParentFont = False
      TabOrder = 0
      OnButtonClick = ceOrgNameButtonClick
      OnDblClick = ceOrgNameButtonClick
    end
    object deFrom: TDateEdit
      Left = 50
      Top = 30
      Width = 100
      Height = 21
      DefaultToday = True
      DirectInput = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
    end
    object deTo: TDateEdit
      Left = 229
      Top = 30
      Width = 100
      Height = 21
      DirectInput = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
    end
    object cbNpGroup: TComboBox
      Left = 427
      Top = 30
      Width = 150
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        #1044#1080#1079#1077#1083#1100#1085#1086#1077' '#1090#1086#1087#1083#1080#1074#1086
        #1041#1077#1085#1079#1080#1085#1099)
    end
    object ceNpType: TComboEdit
      Left = 427
      Top = 5
      Width = 150
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = ceNpTypeButtonClick
      OnChange = ceNpTypeChange
      OnDblClick = ceNpTypeButtonClick
    end
  end
  object pmViewReserv: TPopupMenu
    Left = 84
    Top = 257
    object miMustReserved: TMenuItem
      Caption = #1055#1086#1076#1083#1077#1078#1072#1097#1080#1077' '#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1080#1102
      OnClick = miMustReservedClick
    end
    object miReserved: TMenuItem
      Caption = #1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1085#1099#1077
      OnClick = miReservedClick
    end
  end
  object qRest: TOilQuery
    SQL.Strings = (
      '-->qRest,CardDocEnh'
      'select prepay,'
      '       name,'
      '       npname,'
      '       np_type,'
      '       dogname,'
      '       dogdate,'
      '       todate,'
      '       period_date,'
      '       price,'
      '       dog_litr,'
      '       dog_amount,'
      
        '       decode(sign(money), -1, money + dog_amount, dog_amount) a' +
        's money,'
      '       exp_litr,'
      '       exp_amount,'
      '       rest_litr,'
      '       rest_amount,'
      '       to_id,'
      '       to_inst'
      '  from (select prepay,'
      '               name,'
      '               npname,'
      '               np_type,'
      '               dogname,'
      '               dogdate,'
      '               todate,'
      '               period_date,'
      '               price,'
      '               dog_litr,'
      '               dog_amount,'
      
        '               sum(money_sum) - sum(dog_amount) over(partition b' +
        'y Dog_id, Dog_inst order by rnum desc) as money,'
      '               exp_litr,'
      '               exp_amount,'
      '               rest_litr,'
      '               rest_amount,'
      '               to_id,'
      '               to_inst'
      '          from ('
      '                '
      '                select /*+ORDERED USE_HASH(tr, org, m)*/'
      '                 prepay,'
      '                  org.name,'
      '                  npname,'
      '                  np_type,'
      '                  dogname,'
      '                  dogdate,'
      '                  todate,'
      '                  period_date,'
      '                  pricends as price,'
      '                  dog_litr,'
      '                  dog_amount,'
      '                  nvl(money, 0) as money_sum,'
      
        '                  row_number() over(partition by tr.Dog_id, tr.D' +
        'og_inst order by to_id, to_inst, np_type, dogdate desc, prepay, ' +
        'dogname) as rnum,'
      '                  exp_litr,'
      '                  exp_amount,'
      '                  rest_litr,'
      '                  round(rest_litr * pricends, 2) as rest_amount,'
      '                  to_id,'
      '                  to_inst,'
      '                  tr.Dog_id,'
      '                  tr.Dog_inst'
      '                  from (select prepay,'
      '                                to_id,'
      '                                to_inst,'
      '                                np_type,'
      '                                npname,'
      
        '                                decode(prepay, 0, null, Dog_id) ' +
        'as Dog_id,'
      
        '                                decode(prepay, 0, null, Dog_inst' +
        ') as Dog_inst,'
      '                                decode(prepay,'
      '                                       0,'
      '                                       '#39#1087#1086#1089#1083#1077#1086#1087#1083#1072#1090#1072#39','
      '                                       dogname) as dogname,'
      
        '                                decode(prepay, 0, min(date_), do' +
        'gdate) as dogdate,'
      
        '                                decode(prepay, 0, max(date_), do' +
        'gdate) as todate,'
      '                                decode(prepay,'
      '                                       0,'
      
        '                                       '#39'c '#39' || min(date_) || '#39' '#1087 +
        #1086' '#39' || max(date_),'
      '                                       dogdate) as period_date,'
      '                                pricends,'
      
        '                                decode(prepay, 0, 0, doglitr) as' +
        ' Dog_Litr,'
      
        '                                decode(prepay, 0, 0, doglitr * p' +
        'ricends) as Dog_Amount,'
      '                                sum(litr) as exp_litr,'
      
        '                                sum(nvl(sumnds, 0)) as exp_amoun' +
        't,'
      
        '                                sum(decode(prepay, 0, 0, doglitr' +
        ') - sum(litr)) over(partition by to_id, to_inst, np_type order b' +
        'y decode(prepay, 0, min(date_), dogdate), sum(litr)) as Rest_lit' +
        'r'
      '                           from v_card_equal_ls t'
      '                          where date_ <= :todate'
      '                            and dogdate >= :dogdate'
      
        '                            and ((:np_type = 0 and np_type = 3) ' +
        'or'
      
        '                                (:np_type = 1 and np_type in (4,' +
        ' 5, 6, 7)) or'
      '                                :np_type = -1)'
      '                            and to_id = :org_id'
      '                            and to_inst = :org_inst'
      '                            and t.CardAlign = 0'
      '                          group by prepay,'
      '                                   to_id,'
      '                                   to_inst,'
      '                                   np_type,'
      '                                   npname,'
      '                                   Dog_id,'
      '                                   Dog_inst,'
      '                                   dogname,'
      '                                   dogdate,'
      '                                   doglitr,'
      '                                   doglitr * pricends,'
      '                                   pricends) tr,'
      '                        v_org org,'
      '                        oil_money m'
      '                 where tr.to_id = org.id(+)'
      '                   and tr.to_inst = org.inst(+)'
      '                   and tr.dog_id = m.dog_id(+)'
      '                   and tr.dog_inst = m.dog_inst(+)'
      '                   and m.state(+) = '#39'Y'#39')'
      '         group by prepay,'
      '                  name,'
      '                  npname,'
      '                  np_type,'
      '                  dogname,'
      '                  dogdate,'
      '                  todate,'
      '                  period_date,'
      '                  price,'
      '                  dog_litr,'
      '                  dog_amount,'
      '                  exp_litr,'
      '                  exp_amount,'
      '                  rest_litr,'
      '                  rest_amount,'
      '                  to_id,'
      '                  to_inst,'
      '                  Dog_id,'
      '                  Dog_inst,'
      '                  rnum)'
      ' order by to_id, to_inst, np_type, dogdate desc, prepay, dogname')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 444
    Top = 137
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'todate'
      end
      item
        DataType = ftUnknown
        Name = 'dogdate'
      end
      item
        DataType = ftUnknown
        Name = 'np_type'
      end
      item
        DataType = ftUnknown
        Name = 'org_id'
      end
      item
        DataType = ftUnknown
        Name = 'org_inst'
      end>
  end
  object qWork: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 598
    Top = 25
  end
  object qCheckDog: TOilQuery
    SQL.Strings = (
      ''
      'select *'
      'from'
      '  oil_dog '
      'where to_ = :OrgId'
      '  and to_inst = :OrgInst'
      '  and State='#39'Y'#39'  '
      '  and Dog_Type = '#39'K'#39
      '  and Sub_Type = 101'
      '  and Dog_Date in '
      '  ('
      '    select /*+HASH_AJ*/'
      '      min(Dog_Date) '
      '    from oil_Dog '
      '    where to_ = :OrgId'
      '    and to_inst = :OrgInst'
      '    and State='#39'Y'#39'  '
      '    and Dog_Type = '#39'K'#39
      '    and Sub_Type = 101'
      '  )')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 656
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OrgId'
      end
      item
        DataType = ftUnknown
        Name = 'OrgInst'
      end>
  end
  object dsRest: TOraDataSource
    DataSet = qRest
    OnDataChange = dsRestDataChange
    Left = 444
    Top = 185
  end
  object dsReserv: TOraDataSource
    Left = 56
    Top = 137
  end
  object qReservNum: TOilQuery
    SQL.Strings = (
      
        'select distinct /*+ORDERED USE_HASH(res,org)*/ Res.ExpDate as Ta' +
        'xBillDate,'
      '                Res.OrgId,'
      '                Res.OrgInst,'
      '                to_char(null) as TaxBillNum,'
      '                Org.Name as OrgName'
      
        '  from (select distinct to_id as OrgId, To_inst as OrgInst, date' +
        '_ as ExpDate'
      '          from v_card_transaction'
      '         where oper_num = 12'
      '           and Np_type not in (select value'
      '                                 from oil_var'
      '                                where name = '#39'NN_OPLAT_ONLY'#39')'
      '           and (to_id, to_inst) in (select distinct to_, to_inst'
      '                                      from oil_dog'
      '                                     where sub_type = 101'
      '                                       and forepay = 0)'
      '        minus (select OrgId, OrgInst, ExpDate'
      '                from (select id,'
      '                             inst,'
      '                             organ as OrgId,'
      '                             organ_inst as OrgInst,'
      '                             s_date as ExpDate'
      '                        from oil_sale_book'
      '                       where State = '#39'Y'#39
      '                      minus'
      '                      select m.nn_id,'
      '                             m.nn_inst,'
      '                             m.org_id,'
      '                             m.org_inst,'
      '                             m.mdate'
      '                        from oil_money m'
      '                       where nn_id is not null'
      '                         and nn_inst is not null))) res,'
      '       v_org org'
      ' where res.OrgId = Org.Id(+)'
      '   and res.OrgInst = Org.Inst(+)'
      '   and org.State = '#39'Y'#39
      '   and res.ExpDate between :FromDate and :ToDate'
      ' order by res.ExpDate')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 60
    Top = 185
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FromDate'
      end
      item
        DataType = ftUnknown
        Name = 'ToDate'
      end>
  end
  object qViewTaxBills: TOilQuery
    SQL.Strings = (
      '-->qViewTaxBills,CardDocEnh'
      'select  /*+ORDERED USE_HASH(sb,sbd,org,np,dim)*/'
      '  sb.id as tbId,'
      '  sb.inst as tbInst,'
      '  sb.s_Date as TaxBillDate,'
      '  sb.Num as TaxBillNum,'
      '  sb.F_Doc as ByDogName,'
      '  sb.sale_txt as PayType,'
      '  sb.Nal_t as TaxBillType,'
      '  Sum(sbd.kol) as CountLitr,'
      '  Sum(sbd.Nds_T) as SumNds,'
      
        '  decode(sb.nal_t,8,Sum(sbd.k_nds_b),Sum(sbd.nds_p_base)) as Sum' +
        'NoNds,'
      '  decode(sb.nal_t,8,Sum(sbd.k_nds_20),Sum(sbd.nds_p_20)) as Nds,'
      '  np.FullName as NpName,'
      '  Round(sbd.Nds_T /sbd.kol,2) as PriceNds,'
      '  dim.name as DivName,'
      '  org.name as OrgName,'
      '  org.id as OrgId,'
      '  org.inst as OrgInst ,'
      '  np.petrol_id as np_id,'
      '  dim.id as dim_id'
      'from'
      '  oil_sale_book sb,'
      '  oil_sale_book_det sbd,'
      '  v_org org,'
      '  v_oil_np_group np,'
      '  oil_dimension dim'
      'where sb.id = sbd.nn_id (+)'
      '  and sb.inst = sbd.nn_inst (+)'
      '  and sb.state = '#39'Y'#39
      '  and sb.state = sbd.state (+)'
      '  and (sb.nal_t in (7,9,8) or  1 =:Reserved)'
      '  and (sb.nal_t = 6 or 0 = :Reserved)'
      '  and (sb.organ = :OrgId or :OrgId = 0)'
      '  and (sb.organ_inst = :OrgInst or :OrgInst = 0)'
      '  and sbd.div_id = dim.id (+)'
      '  and sbd.tov_id = np.petrol_id (+)'
      '  and sb.organ = org.id (+)'
      '  and sb.organ_inst = org.inst (+)'
      '  and org.state = '#39'Y'#39
      '  and sb.organ <> sb.organ_inst'
      '  and s_date between :FromDate and :ToDate'
      'group by'
      '  sb.s_Date,'
      '  sb.Num,'
      '  sb.F_Doc,'
      '  sb.sale_txt,'
      '  sb.Nal_t,'
      '  Round(sbd.Nds_T /sbd.kol,2),'
      '  np.FullName,'
      '  dim.name,'
      '  sb.organ,'
      '  sb.organ_inst,'
      '  org.name,'
      '  org.id,'
      '  org.inst,'
      '  sb.id,'
      '  sb.inst,'
      '  np.petrol_id,'
      '  dim.id'
      
        'order by org.name, sb.s_date desc, substr(sb.num,instr(sb.num,'#39'/' +
        #39',-1)+1,length(sb.num)), np.FullName'
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 676
    Top = 153
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Reserved'
      end
      item
        DataType = ftUnknown
        Name = 'OrgId'
      end
      item
        DataType = ftUnknown
        Name = 'OrgInst'
      end
      item
        DataType = ftUnknown
        Name = 'FromDate'
      end
      item
        DataType = ftUnknown
        Name = 'ToDate'
      end>
  end
  object dsViewTaxBills: TOraDataSource
    DataSet = qViewTaxBills
    Left = 676
    Top = 201
  end
  object pm: TPopupMenu
    Left = 156
    Top = 257
    object miPrintGrid: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      OnClick = miPrintGridClick
    end
  end
  object qMake: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '-->qMake,CardDocEnh'
      'select /*+ORDERED USE_HASH(calc_nn,real_nn)*/'
      '       calc_nn.nn_litr,'
      '       real_nn.nn_litr,'
      '       calc_nn.nal_t,'
      '       calc_nn.nn_date,'
      '       calc_nn.to_id,'
      '       calc_nn.to_inst,'
      '       calc_nn.np_type,'
      '       calc_nn.npname,'
      '       calc_nn.pricends,'
      '       real_nn.nn_litr as real_nn_litr,'
      '       calc_nn.nn_litr as calc_nn_litr,'
      
        '       abs(calc_nn.nn_litr) - abs(real_nn.nn_litr) as delta_litr' +
        ','
      '       real_nn.pricends as real_nn_price,'
      '       calc_nn.pricends as calc_nn_price,'
      '       real_nn.nn_sum as real_nn_sum,'
      '       calc_nn.nn_sum as calc_nn_sum,'
      '       abs(calc_nn.nn_sum) - abs(real_nn.nn_sum) as delta_sum,'
      '       calc_nn.nn_id as nn_id,'
      '       calc_nn.nn_inst as nn_inst,'
      '       calc_nn.paynum as pay_num,'
      '       calc_nn.nal_t_text,'
      '       calc_nn.org_name,'
      '       real_nn.nn_num'
      '  from (select /*+ORDERED USE_HASH(nn, org)*/'
      '         nn.*,'
      '         decode(nn.nal_t,'
      '                7,'
      '                '#39#1054#1090#1075#1088#1091#1079#1082#1072#39','
      '                9,'
      '                '#39#1054#1087#1083#1072#1090#1072#39','
      '                8,'
      '                '#39#1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072#39') as nal_t_text,'
      '         org.name as org_name'
      '          from (select tr.Nal_t,'
      '                       decode(prepay,'
      '                              0,'
      '                              tr.nn_date,'
      
        '                              decode(m.mdate, null, tr.nn_date, ' +
        'm.mdate)) as nn_date,'
      '                       tr.to_id,'
      '                       tr.to_inst,'
      '                       tr.np_type,'
      '                       tr.npname,'
      '                       tr.PriceNds,'
      '                       tr.nn_litr,'
      '                       tr.nn_sum,'
      '                       m.nn_id,'
      '                       m.nn_inst,'
      '                       to_char(m.num) as PayNum'
      
        '                  from (select decode(tr.prepay, 1, 9, 7) as Nal' +
        '_t,'
      
        '                               decode(prepay, 0, tr.date_, tr.do' +
        'gdate) as nn_date,'
      '                               tr.to_id,'
      '                               tr.to_inst,'
      '                               tr.np_type,'
      '                               tr.npname,'
      '                               tr.PriceNds,'
      
        '                               sum(round(nn_litr, 2)) as nn_litr' +
        ','
      '                               sum(nn_sum) as nn_sum,'
      
        '                               decode(tr.prepay, 0, null, tr.dog' +
        '_id) as dog_id,'
      
        '                               decode(tr.prepay, 0, null, tr.dog' +
        '_inst) as dog_inst,'
      '                               tr.prepay'
      '                          from (select tr.*,'
      '                                       decode(card_number,'
      '                                              null,'
      '                                              decode(lead_dog,'
      '                                                     dogname,'
      '                                                     ss,'
      '                                                     doglitr),'
      '                                              litr) as nn_litr,'
      '                                       decode(card_number,'
      '                                              null,'
      
        '                                              round(decode(lead_' +
        'dog,'
      
        '                                                           dogna' +
        'me,'
      '                                                           ss,'
      
        '                                                           dogli' +
        'tr) * pricends,'
      '                                                    2),'
      '                                              sumnds) as nn_sum,'
      '                                       decode(card_number,'
      '                                              null,'
      '                                              decode(lead_dog,'
      '                                                     dogname,'
      
        '                                                     decode(ss, ' +
        'null, null, 1),'
      
        '                                                     decode(ss, ' +
        'null, null, 1)),'
      
        '                                              decode(prepay, 0, ' +
        '1, null)) as nn'
      
        '                                  from (select lead(rest + litr)' +
        ' over(partition by to_id, to_inst, np_type order by to_id, to_in' +
        'st, np_type, date_, time_, oildogdet_id) as ss,'
      
        '                                               lead(dogname) ove' +
        'r(partition by to_id, to_inst, np_type order by to_id, to_inst, ' +
        'np_type, date_, time_, oildogdet_id, litr) as lead_dog,'
      '                                               l.*'
      '                                          from v_card_equal_ls l'
      
        '                                         where date_ between :Fr' +
        'omDate and'
      '                                               :ToDate'
      '                                           and l.CardAlign = 0'
      
        '                                           and decode(nvl(card_n' +
        'umber, 0),'
      '                                                      0,'
      
        '                                                      decode(dog' +
        '_forepay, 0, 1, 0),'
      
        '                                                      0) <> 1) t' +
        'r'
      '                                 where to_id = :ToId'
      '                                   and to_inst = :ToInst'
      
        '                                   and (np_type = :NpType or :Np' +
        'Type = 0)'
      '                                   and decode(card_number,'
      '                                              null,'
      '                                              decode(lead_dog,'
      '                                                     dogname,'
      
        '                                                     decode(ss, ' +
        'null, null, 1),'
      
        '                                                     decode(ss, ' +
        'null, null, 1)),'
      
        '                                              decode(prepay, 0, ' +
        '1, null)) = 1) tr'
      '                         group by tr.prepay,'
      
        '                                  decode(prepay, 0, tr.date_, tr' +
        '.dogdate),'
      '                                  tr.to_id,'
      '                                  tr.to_inst,'
      '                                  tr.np_type,'
      '                                  tr.npname,'
      '                                  tr.PriceNds,'
      '                                  nn,'
      
        '                                  decode(tr.prepay, 0, null, tr.' +
        'dog_id),'
      
        '                                  decode(tr.prepay, 0, null, tr.' +
        'dog_inst)) tr,'
      '                       oil_sale_book sb,'
      '                       oil_money m,'
      '                       v_card_receipts_ls rec'
      
        '                 where decode(tr.prepay, 1, tr.dog_id, 0) = rec.' +
        'dog_id(+)'
      
        '                   and decode(tr.prepay, 1, tr.dog_inst, 0) = re' +
        'c.dog_inst(+)'
      
        '                   and decode(tr.prepay, 1, tr.np_type, 0) = rec' +
        '.petrolid(+)'
      '                   and tr.np_type = rec.petrolid(+)'
      '                   and rec.dog_id = m.dog_id(+)'
      '                   and rec.dog_inst = m.dog_inst(+)'
      '                   and m.nn_id = sb.id(+)'
      '                   and m.nn_inst = sb.inst(+)'
      '                   and m.state(+) = '#39'Y'#39
      '                   and sb.state(+) = '#39'Y'#39
      '                   and nvl(m.nn_id(+), 0) > 0'
      '                   and not (tr.nal_t = 9 and m.nn_id = 0)'
      '                   and nn_date between :FromDate and :ToDate'
      '                union all'
      '                /*'#1076#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080'*/'
      
        '                select distinct /*+ORDERED USE_HASH(m.d)*/ 8 as ' +
        'Nal_T,'
      '                                d.dogdate as nn_date,'
      '                                d.to_id,'
      '                                d.to_inst,'
      '                                d.petrolid as np_type,'
      '                                d.npname,'
      '                                d.price_nds as PriceNds,'
      '                                d.doglitr as NN_Litr,'
      '                                d.amount as NN_Sum,'
      '                                m.nn_id,'
      '                                m.nn_inst,'
      '                                to_char(m.num) as PayNum'
      '                  from v_Oil_Money m,'
      '                       (select d.Dog_Id,'
      '                               d.Dog_Inst,'
      '                               d.dog as DogName,'
      '                               d.dog_date as DogDate,'
      '                               d.ForePay,'
      '                               d.Share_Id,'
      '                               d.to_id,'
      '                               d.to_inst,'
      '                               d.price_nds,'
      '                               nvl(d.litr, 0) as DogLitr,'
      '                               Round(d.Summ_Nds, 2) as Amount,'
      '                               d.id as OilDogDet_id,'
      '                               Np.id as np_type,'
      '                               Np.Np_Grp_FullName as NpName,'
      '                               Np.petrol_id as PetrolId'
      
        '                          from v_oil_dog_full d, v_oil_np_type N' +
        'p'
      '                         where d.Dog_Type = '#39'K'#39
      '                           and d.Sub_Type = 101'
      
        '                           and decode(d.np_grp, 5, 6, d.np_type)' +
        ' = np.id'
      '                           and np.petrol_id is not null) d'
      '                 where (substr(d.DogName,'
      '                               1,'
      '                               decode(instr(d.DogName, '#39'*'#39', -1),'
      '                                      0,'
      '                                      length(d.DogName),'
      
        '                                      instr(d.DogName, '#39'*'#39', -1) ' +
        '- 1)) ='
      '                       m.dogovor)'
      '                   and (substr(d.DogName,'
      '                               1,'
      '                               decode(instr(d.DogName, '#39'*'#39', -1),'
      '                                      0,'
      '                                      length(d.DogName),'
      
        '                                      instr(d.DogName, '#39'*'#39', -1) ' +
        '- 1)) ='
      '                       m.dogovor)'
      '                   and instr(d.DogName, '#39'*'#39', -1) <> 0'
      '                   and m.sub_type = 101'
      '                   and m.forepay = 1'
      '                   and (m.org_id = :ToId or :ToId = 0)'
      '                   and (m.org_inst = :ToInst or :ToInst = 0)'
      '                   and (d.petrolid = :NpType or :NpType = 0)'
      
        '                   and d.dogdate between :FromDate and :ToDate) ' +
        'nn,'
      '               v_org org'
      '         where nn.to_id = org.id(+)'
      '           and nn.to_inst = org.inst(+)'
      '           and org.state(+) = '#39'Y'#39
      '           and nn.NN_Date between :FromDate and :ToDate'
      '           and (nn.np_type = :NpType or :NpType = 0)) calc_nn,'
      '       (select /*+ORDERED USE_HASH(sb,sbd,m,np)*/'
      '         decode(count(*),'
      '                 1,'
      '                 min(sb.num),'
      '                 case'
      '                   when min(sb.num) <> max(sb.num) then'
      
        '                    min(sb.num) || '#39','#39' || max(sb.num) || '#39'('#39' || ' +
        'count(*) || '#39')'#39
      '                   else'
      '                    min(sb.num)'
      '                 end) as nn_num,'
      '         sb.nal_t,'
      '         sb.s_date as nn_date,'
      '         sb.organ as to_id,'
      '         sb.organ_inst as to_inst,'
      '         sbd.tov_id as np_type,'
      '         decode(price_nds,'
      '                null,'
      '                decode(sbd.kol,'
      '                       0,'
      '                       0,'
      
        '                       round(round(sbd.nds_t, 2) / round(sbd.kol' +
        ', 2), 2)),'
      '                price_nds) as PriceNds,'
      '         sum(round(sbd.kol, 4)) as nn_litr,'
      '         sum(round(sbd.nds_t, 4)) as nn_sum'
      '          from oil_sale_book sb,'
      '               oil_sale_book_det sbd,'
      '               oil_money m,'
      '               v_oil_np_group np'
      '         where sb.id = sbd.nn_id'
      '           and sb.inst = sbd.nn_inst'
      '           and sb.state = sbd.state'
      '           and sb.id = m.nn_id(+)'
      '           and sb.inst = m.nn_inst(+)'
      '           and sb.state = m.state(+)'
      '           and sbd.tov_id = np.petrol_id'
      '           and sb.state = '#39'Y'#39
      '           and (sb.organ = :ToId or :ToId = 0)'
      '           and (sb.organ_inst = :ToInst or :ToInst = 0)'
      '           and (sbd.tov_id = :NpType or :NpType = 0)'
      '           and sb.s_date between :FromDate and :ToDate'
      '         group by sb.nal_t,'
      '                  sb.s_date,'
      '                  sb.organ,'
      '                  sb.organ_inst,'
      '                  sbd.tov_id,'
      '                  decode(sb.nal_t, 8, sb.num, null),'
      '                  decode(price_nds,'
      '                         null,'
      '                         decode(sbd.kol,'
      '                                0,'
      '                                0,'
      
        '                                round(round(sbd.nds_t, 2) / roun' +
        'd(sbd.kol, 2),'
      '                                      2)),'
      '                         price_nds)) real_nn'
      ' where calc_nn.nn_date = real_nn.nn_date(+)'
      '   and calc_nn.to_id = real_nn.to_id(+)'
      '   and calc_nn.to_inst = real_nn.to_inst(+)'
      '   and calc_nn.pricends = real_nn.pricends(+)'
      '   and calc_nn.np_type = real_nn.np_type(+)'
      '   and calc_nn.nal_t = real_nn.nal_t(+)'
      '   and decode(calc_nn.nal_t, 8, round(calc_nn.nn_litr, 4), 1) ='
      '       decode(calc_nn.nal_t, 8, round(real_nn.nn_litr(+), 4), 1)'
      ' order by calc_nn.org_name,'
      '          calc_nn.nn_date desc,'
      '          calc_nn.nal_t_text,'
      '          calc_nn.nn_id,'
      '          calc_nn.nn_inst,'
      '          calc_nn.np_type')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 324
    Top = 137
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FromDate'
      end
      item
        DataType = ftUnknown
        Name = 'ToDate'
      end
      item
        DataType = ftUnknown
        Name = 'ToId'
      end
      item
        DataType = ftUnknown
        Name = 'ToInst'
      end
      item
        DataType = ftUnknown
        Name = 'NpType'
      end>
  end
  object pmEditTB: TPopupMenu
    Left = 20
    Top = 257
    object miAddDelta: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1053#1053' '#1085#1072' '#1088#1072#1079#1085#1080#1094#1091
      OnClick = miAddDeltaClick
    end
  end
  object dsMake: TOraDataSource
    DataSet = qMake
    OnDataChange = dsMakeDataChange
    Left = 328
    Top = 184
  end
  object qMake_Old: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select /*+ORDERED USE_HASH(calc_nn,real_nn)*/'
      ' calc_nn.nal_t,'
      ' calc_nn.nn_date,'
      ' calc_nn.to_id,'
      ' calc_nn.to_inst,'
      ' calc_nn.np_type,'
      ' calc_nn.npname,'
      ' calc_nn.pricends,'
      ' real_nn.nn_litr as real_nn_litr,'
      ' calc_nn.nn_litr as calc_nn_litr,'
      ' abs(calc_nn.nn_litr) - abs(real_nn.nn_litr) as delta_litr,'
      ' real_nn.pricends as real_nn_price,'
      ' calc_nn.pricends as calc_nn_price,'
      ' real_nn.nn_sum as real_nn_sum,'
      ' calc_nn.nn_sum as calc_nn_sum,'
      ' abs(calc_nn.nn_sum)-abs(real_nn.nn_sum) as delta_sum,'
      ' calc_nn.nn_id as nn_id,'
      ' calc_nn.nn_inst as nn_inst,'
      ' calc_nn.paynum as pay_num,'
      ' calc_nn.nal_t_text ,'
      ' calc_nn.org_name,'
      ' real_nn.nn_num'
      'from'
      '('
      'select /*+ORDERED USE_HASH(nn, org)*/'
      '  nn.*,'
      
        '  decode(nn.nal_t,7,'#39#1054#1090#1075#1088#1091#1079#1082#1072#39',9,'#39#1054#1087#1083#1072#1090#1072#39',8,'#39#1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072#39') as ' +
        'nal_t_text,'
      '  org.name  as org_name'
      'from ('
      ''
      'select * from ('
      'select /*+ORDERED USE_HASH(tr,sb,m)*/'
      '     decode(tr.prepay,1,9,7) as Nal_T ,'
      '     decode(prepay,0,min(tr.date_),min(m.mdate)) as nn_date,'
      '     tr.to_id,'
      '     tr.to_inst,'
      '     tr.np_type,'
      '     tr.npname,'
      '     tr.pricendsdis as PriceNds,'
      '     sum(round(tr.litr,2)) as nn_litr,'
      '     sum(round(tr.SumNds,2)) as nn_sum,'
      '     to_number(decode(prepay,0,null,min(sb.id)))  as NN_Id,'
      '     to_number(decode(prepay,0,null,min(sb.inst))) as NN_Inst,'
      '     to_char(decode(prepay,0,null,min(m.num))) as PayNum'
      'from'
      '  v_card_equal_ls tr,'
      '  oil_sale_book sb,'
      '  oil_money m'
      'where'
      '  decode(tr.prepay,1, tr.dog_id,0) = m.dog_id (+)    and'
      '  decode(tr.prepay,1, tr.dog_inst,0) = m.dog_inst (+)  and'
      '  tr.litr<>0 and'
      '  m.nn_id = sb.id (+) and'
      '  m.nn_inst = sb.inst (+) and'
      '  m.state (+) = '#39'Y'#39'  and'
      '  sb.state(+) ='#39'Y'#39'  and'
      '  nvl(m.nn_id(+),0) >0'
      'group by'
      '     tr.prepay,'
      '     tr.to_id,'
      '     tr.to_inst,'
      '     tr.np_type,'
      '     tr.npname,'
      '     tr.dogname,'
      '     tr.dogdate,'
      '     tr.doglitr,'
      '     tr.receipt_amount,'
      '     tr.pricendsdis,'
      '     decode(tr.prepay,1,null, tr.date_)'
      ')'
      'where'
      
        ' np_type not in ( select to_number(value) from oil_var where nam' +
        'e='#39'NN_OPLAT_ONLY'#39') and'
      ' (to_id = :ToId or :ToId=0) and'
      ' (to_inst = :ToInst or :ToInst=0) and'
      ' (np_type= :NpType  or :NpType=0) and'
      '  nn_date  between :FromDate and :ToDate'
      'union all'
      'select'
      '    9 as Nal_t,'
      '    Pay_Date as NN_Date,'
      '    to_id,'
      '    to_inst,'
      '    np_type as NpType,'
      '    npname,'
      '    Price,'
      
        '    round(Sum(SumNds) / decode(nvl(Price,0),0,1,Price),2) as NN_' +
        'Litr,'
      '    Sum(SumNds) as NN_SUM,'
      '    min(nn_id) as nn_id,'
      '    min(nn_inst) as nn_inst,'
      '    to_char(min(pay_num)) as pay_num'
      'from'
      '('
      '    select /*+ORDERED  USE_HASH(tr,pay)*/'
      '      decode(tr.to_id,null, Pay.to_id, tr.to_id ) as To_Id,'
      
        '      decode(Pay.to_inst,null,tr.to_inst, Pay.to_inst ) as To_In' +
        'st,'
      '      decode(Pay.npname,null,tr.npname, Pay.npname) as NpName,'
      '      decode(Tr.Price,null,Pay.Price,tr.Price) as Price,'
      
        '      decode(sign(Pay.Sum_Up - Tr.Sum_Up),1, Tr.Sum_Up,Pay.Sum_U' +
        'p)'
      
        '       - decode(sign(Tr.Sum_Down - Pay.Sum_Down), 1, Tr.Sum_Down' +
        ', Pay.Sum_Down) as SumNds,'
      '      Pay.mdate as Pay_Date,'
      
        '      pay.Sum_One as Pay_Money, pay.pay_num, pay.nn_id, pay.nn_i' +
        'nst,'
      '      3 as np_type'
      '    from'
      '    ('
      '     select'
      '         to_id, to_inst, np_type,'
      '          PriceNdsDis as Price, npname,'
      '         Sum(SumNds) as Sum_One,'
      
        '         Sum(Sum(SumNds)) over (partition by to_id, to_inst, np_' +
        'type order by date_,pricendsdis) - sum(SumNds) as Sum_Down,'
      
        '         Sum(Sum(SumNds)) over (partition by to_id, to_inst, np_' +
        'type order by date_,pricendsdis) as Sum_Up'
      '        from v_card_equal_ls'
      '        where litr <> 0'
      
        '        and np_type in (select to_number(value) from oil_var whe' +
        're name = '#39'NN_OPLAT_ONLY'#39')'
      '        and ( to_id = :ToId or :ToId=0 )'
      '        and ( to_inst = :ToInst or :ToInst=0)'
      
        '        group by date_, to_id, to_inst, np_type,npname, PriceNds' +
        'Dis'
      '     ) tr,'
      '     ('
      '        select /*+ORDERED USE_HASH(m,rec)*/'
      '          m.mdate, m.cash_method,'
      '          m.org_id as to_id,'
      '          m.org_inst as to_inst,'
      '          rec.pricends as Price,'
      '          rec.npname,'
      '          rec.petrolid as np_type,'
      '          decode(m.cash_method, 1,'
      '             m.money,'
      '             rec.amount'
      '           ) as Sum_One,'
      '          decode(m.cash_method, 1,'
      
        '            sum(m.money) over (  partition by   m.org_id, m.org_' +
        'inst  order by m.mdate,m.dog_id, m.id ) - m.money,'
      
        '            sum(rec.amount) over (partition by rec.toid, rec.toi' +
        'nst, rec.petrolid order by rec.dogdate, rec.oildogdet_id) - rec.' +
        'amount'
      '          )  as Sum_Down,'
      '          decode(m.cash_method, 1,'
      
        '            sum(m.money) over (partition by m.org_id, m.org_inst' +
        ' order by  m.mdate,m.dog_id, m.id) ,'
      
        '            sum(rec.amount) over (partition by rec.toid, rec.toi' +
        'nst, rec.petrolid order by rec.dogdate, rec.oildogdet_id,rec.pet' +
        'rolid)'
      '          ) as Sum_Up, m.num as pay_num, m.nn_id, m.nn_inst'
      '        from'
      '       ('
      '       select * from'
      '        oil_money ,'
      
        '        (select to_number(value) as cm_np_type from oil_var wher' +
        'e name = '#39'NN_OPLAT_ONLY'#39')'
      '        )  m,'
      '          v_card_receipts_ls rec'
      '        where ('
      
        '        (decode(m.cm_np_type,0,0,m.cash_method)  = 1  and m.cm_n' +
        'p_type = rec.petrolid )  or'
      '        ( m.cm_np_type = rec.petrolid  and rec.forepay=1)  or'
      '        (rec.petrolid is null and m.cash_method=1)'
      '       )'
      '       and m.dog_id = rec.dog_id (+)'
      '        and m.dog_inst = rec.dog_inst (+)'
      '        and m.state = '#39'Y'#39
      '        and (m.org_id = :ToId or :ToId=0)'
      '        and (m.org_inst = :ToInst or  :ToInst=0)'
      '        ) pay'
      '    where'
      '      Pay.Sum_Up  - Tr.Sum_Down (+) >= 0 and'
      '      Pay.Sum_Down - Tr.Sum_Up (+) <= 0 and'
      '      tr.to_id (+) = pay.to_id  and'
      '      tr.to_inst (+) = pay.to_inst  and'
      '      decode(Pay.npname,null,tr.npname, Pay.npname) is not null'
      '  )'
      
        'group by to_id,  to_inst, price , npname,np_type,pay_date, pay_m' +
        'oney'
      'union all'
      '/*'#1076#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080'*/'
      'select distinct /*+ORDERED USE_HASH(m.d)*/'
      '   8 as Nal_T,'
      '   d.dogdate as nn_date,'
      '   d.toid  as to_id,'
      '   d.toinst as to_inst,'
      '   d.petrolid as np_type,'
      '   d.npname,'
      '   d.pricends as PriceNds,'
      '   d.doglitr as NN_Litr,'
      '   d.amount as NN_Sum,'
      '   m.nn_id,'
      '   m.nn_inst,'
      '   to_char(m.num) as PayNum'
      'from'
      '  v_Oil_Money m,'
      '  v_card_dog_ls d'
      
        'where (substr(d.DogName,1,decode(instr(d.DogName,'#39'*'#39',-1),0,lengt' +
        'h(d.DogName),instr(d.DogName,'#39'*'#39',-1)-1)) = m.dogovor)'
      
        'and (substr(d.DogName,1,decode(instr(d.DogName,'#39'*'#39',-1),0,length(' +
        'd.DogName),instr(d.DogName,'#39'*'#39',-1)-1)) = m.dogovor )'
      'and instr(d.DogName,'#39'*'#39',-1) <> 0'
      'and m.sub_type = 101'
      'and m.forepay = 1'
      'and (m.org_id = :ToId or :ToId=0)'
      'and (m.org_inst = :ToInst or  :ToInst=0)'
      'and (d.petrolid  = :NpType or :NpType =0)'
      'and d.dogdate between :FromDate and :ToDate'
      ') nn,'
      'v_org org'
      'where nn.to_id = org.id (+)'
      ' and nn.to_inst = org.inst (+)'
      ' and org.state(+)='#39'Y'#39
      ' and nn.NN_Date between :FromDate and :ToDate'
      ' and (nn.np_type = :NpType or :NpType = 0)'
      ') calc_nn,'
      '('
      'select /*+ORDERED USE_HASH(sb,sbd,m,np)*/'
      ' decode(count(*),1,'
      '   min(sb.num),'
      '   min(sb.num)||'#39','#39'||max(sb.num)||'#39'('#39'||count(*)||'#39')'#39
      ' ) as nn_num,'
      ' sb.nal_t,'
      ' sb.s_date as nn_date,'
      ' sb.organ as to_id,'
      ' sb.organ_inst as to_inst,'
      ' sbd.tov_id as np_type,'
      ' decode(price_nds, null, '
      
        '   decode(sbd.kol,0,0,round(round(sbd.nds_t,2)/round(sbd.kol,2),' +
        '2)),'
      '   price_nds'
      ' ) as PriceNds,'
      ' sum(round(sbd.kol,2)) as nn_litr,'
      ' sum(round(sbd.nds_t,2)) as nn_sum'
      'from'
      'oil_sale_book sb,'
      'oil_sale_book_det sbd,'
      'oil_money m,'
      'v_oil_np_group np'
      'where'
      'sb.id = sbd.nn_id and'
      'sb.inst = sbd.nn_inst and'
      'sb.state = sbd.state and'
      'sb.id = m.nn_id (+) and'
      'sb.inst = m.nn_inst (+) and'
      'sb.state = m.state (+) and'
      'sbd.tov_id = np.petrol_id and'
      'sb.state ='#39'Y'#39' and'
      '(sb.organ = :ToId or :ToId=0) and'
      '(sb.organ_inst = :ToInst or :ToInst=0) and'
      '(sbd.tov_id = :NpType or :NpType = 0) and'
      'sb.s_date between :FromDate and :ToDate'
      'group by'
      ' sb.nal_t,'
      ' sb.s_date,'
      ' sb.organ,'
      ' sb.organ_inst,'
      ' sbd.tov_id,'
      ' decode(price_nds, null, '
      
        '   decode(sbd.kol,0,0,round(round(sbd.nds_t,2)/round(sbd.kol,2),' +
        '2)),'
      '   price_nds'
      ' )'
      ') real_nn'
      'where'
      '   calc_nn.nn_date = real_nn.nn_date (+) and'
      '   calc_nn.to_id = real_nn.to_id (+) and'
      '   calc_nn.to_inst = real_nn.to_inst (+) and'
      '   calc_nn.pricends = real_nn.pricends (+)  and'
      '   calc_nn.np_type = real_nn.np_type (+) and'
      '   calc_nn.nal_t = real_nn.nal_t (+) and'
      '   calc_nn.nn_litr <> 0'
      
        'order by calc_nn.org_name, calc_nn.nn_date  desc, calc_nn.nal_t_' +
        'text, calc_nn.np_type'
      ''
      ' ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 244
    Top = 145
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ToId'
      end
      item
        DataType = ftUnknown
        Name = 'ToInst'
      end
      item
        DataType = ftUnknown
        Name = 'NpType'
      end
      item
        DataType = ftUnknown
        Name = 'FromDate'
      end
      item
        DataType = ftUnknown
        Name = 'ToDate'
      end>
  end
end
