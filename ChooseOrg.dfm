inherited ChooseOrgForm: TChooseOrgForm
  Left = 241
  Top = 308
  Width = 651
  Height = 505
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1042#1099#1073#1086#1088' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object p9: TPanel
    Left = 0
    Top = 10
    Width = 643
    Height = 115
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object p1: TPanel
      Left = 2
      Top = 2
      Width = 639
      Height = 31
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object p11: TPanel
        Left = 0
        Top = 0
        Width = 303
        Height = 31
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 28
          Height = 16
          Alignment = taRightJustify
          Caption = #1054#1041#1051
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object BtnClearObl: TSpeedButton
          Left = 274
          Top = 4
          Width = 23
          Height = 22
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
          OnClick = BtnClearOblClick
        end
        object CEObl: TComboEdit
          Left = 40
          Top = 5
          Width = 233
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          NumGlyphs = 1
          TabOrder = 0
          OnButtonClick = CEOblButtonClick
        end
      end
      object p12: TPanel
        Left = 303
        Top = 0
        Width = 336
        Height = 31
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          336
          31)
        object btnClearPpon: TSpeedButton
          Left = 307
          Top = 3
          Width = 23
          Height = 22
          Anchors = [akTop, akRight]
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
          OnClick = btnClearPponClick
        end
        object Label4: TLabel
          Left = 8
          Top = 8
          Width = 40
          Height = 16
          Alignment = taRightJustify
          Caption = #1055#1055#1054#1053
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object CEPpon: TComboEdit
          Left = 53
          Top = 5
          Width = 252
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 0
          OnButtonClick = CEPponButtonClick
        end
      end
    end
    object p13: TPanel
      Left = 2
      Top = 33
      Width = 639
      Height = 80
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object p14: TPanel
        Left = 0
        Top = 0
        Width = 491
        Height = 80
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object p4: TPanel
          Left = 0
          Top = 0
          Width = 303
          Height = 80
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object p5: TPanel
            Left = 0
            Top = 0
            Width = 303
            Height = 31
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 0
            object Label1: TLabel
              Left = 8
              Top = 8
              Width = 27
              Height = 16
              Alignment = taRightJustify
              Caption = #1054#1088#1075'.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btnClearOrg: TSpeedButton
              Left = 274
              Top = 4
              Width = 23
              Height = 22
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
              OnClick = btnClearOrgClick
            end
            object EditOrg: TEdit
              Left = 40
              Top = 5
              Width = 233
              Height = 21
              TabOrder = 0
              OnChange = EditOrgChange
              OnKeyPress = EditOrgKeyPress
            end
          end
          object p6: TPanel
            Left = 0
            Top = 31
            Width = 303
            Height = 25
            Align = alClient
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 1
            object CBFizFace: TCheckBox
              Left = 8
              Top = 5
              Width = 73
              Height = 17
              Caption = #1060#1080#1079'.'#1083#1080#1094#1072
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = CBFizFaceClick
            end
            object CBUrFace: TCheckBox
              Left = 128
              Top = 5
              Width = 73
              Height = 17
              Caption = #1070#1088'. '#1051#1080#1094#1072
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = CBUrFaceClick
            end
            object CBNotDefFace: TCheckBox
              Left = 200
              Top = 5
              Width = 89
              Height = 17
              Caption = #1053#1077' '#1086#1087#1088#1077#1076#1077#1083'.'
              Checked = True
              State = cbChecked
              TabOrder = 2
              OnClick = CBNotDefFaceClick
            end
          end
          object p7: TPanel
            Left = 0
            Top = 56
            Width = 303
            Height = 24
            Align = alBottom
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 2
            object cbSvoy: TCheckBox
              Left = 128
              Top = 3
              Width = 57
              Height = 17
              Caption = '"'#1057#1074#1086#1080'"'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = CBFizFaceClick
            end
            object cbBlackList: TCheckBox
              Left = 8
              Top = 3
              Width = 113
              Height = 17
              Caption = '"'#1063#1077#1088#1085#1099#1081'" '#1089#1087#1080#1089#1086#1082
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = CBFizFaceClick
            end
            object cbPr: TCheckBox
              Left = 200
              Top = 3
              Width = 65
              Height = 17
              Caption = #1055#1088#1086#1095#1080#1077
              Checked = True
              State = cbChecked
              TabOrder = 2
              OnClick = CBFizFaceClick
            end
          end
        end
        object p8: TPanel
          Left = 303
          Top = 0
          Width = 188
          Height = 80
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          DesignSize = (
            188
            80)
          object Label5: TLabel
            Left = 24
            Top = 8
            Width = 13
            Height = 16
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object btnClearId: TSpeedButton
            Left = 159
            Top = 3
            Width = 23
            Height = 22
            Anchors = [akTop, akRight]
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
            OnClick = btnClearIdClick
          end
          object btnClearOKPO: TSpeedButton
            Left = 159
            Top = 30
            Width = 23
            Height = 22
            Anchors = [akTop, akRight]
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
            OnClick = btnClearOKPOClick
          end
          object Label2: TLabel
            Left = 24
            Top = 35
            Width = 38
            Height = 16
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = #1054#1050#1055#1054
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object EditOrgId: TEdit
            Left = 65
            Top = 5
            Width = 93
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 0
            OnChange = EditOrgIdChange
          end
          object EditOkpo: TEdit
            Left = 65
            Top = 32
            Width = 93
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 1
            OnChange = EditOkpoChange
          end
        end
      end
      object p15: TPanel
        Left = 491
        Top = 0
        Width = 148
        Height = 80
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object RBObl: TRadioButton
          Left = 8
          Top = 8
          Width = 49
          Height = 17
          Caption = #1054#1041#1051
          TabOrder = 0
          OnClick = RBOblClick
        end
        object RBPpon: TRadioButton
          Left = 8
          Top = 28
          Width = 57
          Height = 17
          Caption = #1055#1055#1054#1053
          TabOrder = 1
          OnClick = RBPponClick
        end
        object RBAzs: TRadioButton
          Left = 8
          Top = 48
          Width = 49
          Height = 17
          Caption = #1040#1047#1057
          TabOrder = 2
          OnClick = RBAzsClick
        end
        object RBOther: TRadioButton
          Left = 72
          Top = 8
          Width = 65
          Height = 17
          Caption = #1055#1088#1086#1095#1080#1077
          TabOrder = 3
          OnClick = RBOtherClick
        end
        object RBAll: TRadioButton
          Left = 72
          Top = 28
          Width = 49
          Height = 17
          Caption = #1042#1089#1077
          TabOrder = 4
          OnClick = RBAllClick
        end
      end
    end
  end
  object p10: TPanel
    Left = 0
    Top = 437
    Width = 643
    Height = 34
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object p16: TPanel
      Left = 2
      Top = 2
      Width = 105
      Height = 30
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object btnEdit: TSpeedButton
        Left = 46
        Top = 3
        Width = 25
        Height = 25
        Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        ParentShowHint = False
        ShowHint = True
        OnClick = btnEditClick
      end
      object btnDel: TSpeedButton
        Left = 76
        Top = 3
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
        OnClick = btnDelClick
      end
      object btnAdd: TRxSpeedButton
        Left = 4
        Top = 3
        Width = 37
        Height = 25
        DropDownMenu = PopupMenu1
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
      object Button2: TButton
        Left = 112
        Top = 4
        Width = 75
        Height = 25
        Hint = #1042#1074#1086#1076' '#1072#1085#1082#1077#1090#1099
        Caption = #1040#1085#1082#1077#1090#1072
        TabOrder = 0
        Visible = False
        OnClick = Button2Click
      end
    end
    object p3: TPanel
      Left = 431
      Top = 2
      Width = 210
      Height = 30
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object RxSpeedButton1: TRxSpeedButton
        Left = 98
        Top = 3
        Width = 15
        Height = 25
        DropDownMenu = PopupMenu3
      end
      object bbOk: TBitBtn
        Left = 11
        Top = 3
        Width = 87
        Height = 25
        Caption = '&'#1042#1099#1073#1088#1072#1090#1100
        Default = True
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
      object bbCancel: TBitBtn
        Left = 118
        Top = 3
        Width = 87
        Height = 25
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 0
        OnClick = bbCancelClick
        Kind = bkCancel
      end
    end
    object p2: TPanel
      Left = 107
      Top = 2
      Width = 324
      Height = 30
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      OnDblClick = p2DblClick
      object CBRekvizit: TCheckBox
        Left = 10
        Top = 8
        Width = 159
        Height = 17
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1088#1077#1082#1074#1080#1079#1080#1090#1099
        TabOrder = 0
        OnClick = CBRekvizitClick
      end
    end
  end
  object DBGrid1: TDBGridEh
    Left = 0
    Top = 125
    Width = 493
    Height = 312
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = Ds
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghColumnResize, dghColumnMove]
    PopupMenu = PopupMenu2
    RowDetailPanel.Color = clBtnFace
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnColumnMoved = DBGrid1ColumnMoved
    OnDblClick = DBGrid1DblClick
    OnGetCellParams = DBGrid1GetCellParams
    OnSortMarkingChanged = DBGrid1SortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'KATEGORY'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'ORG_TYPE_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        Title.TitleButton = True
        Width = 95
      end
      item
        EditButtons = <>
        FieldName = 'PAR_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1085#1072#1076#1083#1077#1078#1080#1090
        Title.TitleButton = True
        Visible = False
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'ID_NUM'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1054#1050#1055#1054
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'NAL_NUM'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1083#1086#1075'. '#8470
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'SVID_NUM'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1089#1074#1080#1076'.'
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'RACH_CHET'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1089#1095'.'#1089#1095#1077#1090
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'MFO'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1052#1060#1054
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'ADDR'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1040#1076#1088#1077#1089
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PHONE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'BOSS'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1080#1088#1077#1082#1090#1086#1088
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'NAME_UKR'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1059#1082#1088'. '#1085#1072#1079#1074#1072#1085#1080#1077
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'ADDR_UKR'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1059#1082#1088'. '#1072#1076#1088#1077#1089
        Width = 100
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlHideFilter: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 10
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object sbFilterPosition: TSpeedButton
      Left = 3
      Top = 1
      Width = 23
      Height = 8
      Hint = #1057#1082#1088#1099#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1092#1080#1083#1100#1090#1088#1086#1074
      AllowAllUp = True
      GroupIndex = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbFilterPositionClick
    end
    object pnlTuneGridBtn: TPanel
      Left = 614
      Top = 0
      Width = 29
      Height = 10
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        29
        10)
      object sbCol: TSpeedButton
        Left = 2
        Top = 1
        Width = 23
        Height = 8
        Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
        AllowAllUp = True
        Anchors = [akRight, akBottom]
        GroupIndex = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = sbColClick
      end
    end
  end
  object PanelCol: TPanel
    Left = 493
    Top = 125
    Width = 150
    Height = 312
    Align = alRight
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'PanelCol'
    TabOrder = 4
    object cbCol: TRxCheckListBox
      Left = 2
      Top = 2
      Width = 146
      Height = 284
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      OnClickCheck = cbColClickCheck
      InternalVersion = 202
    end
    object pRefresh: TPanel
      Left = 2
      Top = 286
      Width = 146
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object spbCloseTunePanel: TSpeedButton
        Left = 93
        Top = 1
        Width = 25
        Height = 22
        Hint = #1047#1072#1082#1088#1099#1090#1100' '#1087#1072#1085#1077#1083#1100
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
        ParentShowHint = False
        ShowHint = True
        OnClick = spbCloseTunePanelClick
      end
      object spbSelectAll: TSpeedButton
        Left = 66
        Top = 1
        Width = 25
        Height = 22
        Hint = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
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
        ParentShowHint = False
        ShowHint = True
        OnClick = spbSelectAllClick
      end
      object spbClearColConfig: TSpeedButton
        Left = 120
        Top = 1
        Width = 25
        Height = 22
        Hint = #1057#1073#1088#1086#1089' '#1085#1072#1089#1090#1088#1086#1077#1082' '#1082#1086#1083#1086#1085#1086#1082
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = spbClearColConfigClick
      end
    end
  end
  object qOld: TOilQuery
    SQL.Strings = (
      'select *'
      'from v_oil_org'
      ''
      '')
    OnCalcFields = QOldCalcFields
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 224
    Top = 272
    object qOldKATEGORY: TStringField
      FieldKind = fkCalculated
      FieldName = 'KATEGORY'
      Size = 5
      Calculated = True
    end
    object qOldID: TFloatField
      FieldName = 'ID'
      Origin = 'V_OIL_ORG.ID'
    end
    object qOldNAME: TStringField
      FieldName = 'NAME'
      Origin = 'V_OIL_ORG.NAME'
      Size = 100
    end
    object qOldINST: TFloatField
      FieldName = 'INST'
      Origin = 'V_OIL_ORG.INST'
    end
    object qOldID_NUM: TStringField
      FieldName = 'ID_NUM'
      Origin = 'V_OIL_ORG.ID_NUM'
    end
    object qOldNAL_NUM: TStringField
      FieldName = 'NAL_NUM'
      Origin = 'V_OIL_ORG.NAL_NUM'
      Size = 50
    end
    object qOldSVID_NUM: TStringField
      FieldName = 'SVID_NUM'
      Origin = 'V_OIL_ORG.SVID_NUM'
      Size = 50
    end
    object qOldADDR: TStringField
      FieldName = 'ADDR'
      Origin = 'V_OIL_ORG.ADDR'
      Size = 200
    end
    object qOldPHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'V_OIL_ORG.PHONE'
      Size = 30
    end
    object qOldBOSS: TStringField
      FieldName = 'BOSS'
      Origin = 'V_OIL_ORG.BOSS'
      Size = 50
    end
    object qOldFACE: TFloatField
      FieldName = 'FACE'
      Origin = 'V_OIL_ORG.FACE'
    end
    object qOldORG_ID: TFloatField
      FieldName = 'ORG_ID'
      Origin = 'V_OIL_ORG.ORG_ID'
    end
    object qOldPAR_NAME: TStringField
      FieldName = 'PAR_NAME'
      Origin = 'V_OIL_ORG.PAR_NAME'
      Size = 100
    end
    object qOldRACH_CHET: TStringField
      FieldName = 'RACH_CHET'
      Origin = 'V_OIL_ORG.RACH_CHET'
    end
    object qOldMFO: TStringField
      FieldName = 'MFO'
      Origin = 'V_OIL_ORG.MFO'
    end
    object qOldANKETA: TStringField
      FieldName = 'ANKETA'
      Origin = 'V_OIL_ORG.ANKETA'
      Size = 30
    end
    object qOldORG_TYPE_NAME: TStringField
      FieldName = 'ORG_TYPE_NAME'
      Size = 54
    end
    object qOldBLACK_HERE: TStringField
      FieldName = 'BLACK_HERE'
      Size = 1
    end
    object qOldBLACK_LIST_COUNT: TFloatField
      FieldName = 'BLACK_LIST_COUNT'
    end
    object qOldSVOY: TStringField
      FieldName = 'SVOY'
      Size = 1
    end
    object qOldNAME_UKR: TStringField
      FieldName = 'NAME_UKR'
      Size = 100
    end
    object qOldADDR_UKR: TStringField
      FieldName = 'ADDR_UKR'
      Size = 200
    end
  end
  object Ds: TOraDataSource
    DataSet = q
    Left = 272
    Top = 272
  end
  object qExt: TOilQuery
    SQL.Strings = (
      'select *'
      'from v_oil_org'
      'where id=:id and inst=:inst'
      'order by def desc')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 304
    Top = 272
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
    object qExtID: TFloatField
      FieldName = 'ID'
      Origin = 'V_OIL_ORG.ID'
    end
    object qExtNAME: TStringField
      FieldName = 'NAME'
      Origin = 'V_OIL_ORG.NAME'
      Size = 100
    end
    object qExtINST: TFloatField
      FieldName = 'INST'
      Origin = 'V_OIL_ORG.INST'
    end
    object qExtID_NUM: TStringField
      FieldName = 'ID_NUM'
      Origin = 'V_OIL_ORG.ID_NUM'
    end
    object qExtNAL_NUM: TStringField
      FieldName = 'NAL_NUM'
      Origin = 'V_OIL_ORG.NAL_NUM'
      Size = 50
    end
    object qExtSVID_NUM: TStringField
      FieldName = 'SVID_NUM'
      Origin = 'V_OIL_ORG.SVID_NUM'
      Size = 50
    end
    object qExtADDR: TStringField
      FieldName = 'ADDR'
      Origin = 'V_OIL_ORG.ADDR'
      Size = 200
    end
    object qExtSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
      Origin = 'V_OIL_ORG.START_DATE'
    end
    object qExtPHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'V_OIL_ORG.PHONE'
      Size = 30
    end
    object qExtE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Origin = 'V_OIL_ORG.E_MAIL'
      Size = 100
    end
    object qExtBOSS: TStringField
      FieldName = 'BOSS'
      Origin = 'V_OIL_ORG.BOSS'
      Size = 50
    end
    object qExtBOSS_TEL_H: TStringField
      FieldName = 'BOSS_TEL_H'
      Origin = 'V_OIL_ORG.BOSS_TEL_H'
      Size = 30
    end
    object qExtBOSS_TEL_W: TStringField
      FieldName = 'BOSS_TEL_W'
      Origin = 'V_OIL_ORG.BOSS_TEL_W'
      Size = 30
    end
    object qExtDOV: TStringField
      FieldName = 'DOV'
      Origin = 'V_OIL_ORG.DOV'
      Size = 50
    end
    object qExtDOV_DATE: TDateTimeField
      FieldName = 'DOV_DATE'
      Origin = 'V_OIL_ORG.DOV_DATE'
    end
    object qExtGBUH: TStringField
      FieldName = 'GBUH'
      Origin = 'V_OIL_ORG.GBUH'
      Size = 50
    end
    object qExtGBUH_TEL_H: TStringField
      FieldName = 'GBUH_TEL_H'
      Origin = 'V_OIL_ORG.GBUH_TEL_H'
      Size = 30
    end
    object qExtGBUH_TEL_W: TStringField
      FieldName = 'GBUH_TEL_W'
      Origin = 'V_OIL_ORG.GBUH_TEL_W'
      Size = 30
    end
    object qExtPAR: TFloatField
      FieldName = 'PAR'
      Origin = 'V_OIL_ORG.PAR'
    end
    object qExtPAR_INST: TFloatField
      FieldName = 'PAR_INST'
      Origin = 'V_OIL_ORG.PAR_INST'
    end
    object qExtFACE: TFloatField
      FieldName = 'FACE'
      Origin = 'V_OIL_ORG.FACE'
    end
    object qExtNUM: TStringField
      FieldName = 'NUM'
      Origin = 'V_OIL_ORG.NUM'
    end
    object qExtORG_TYPE: TStringField
      FieldName = 'ORG_TYPE'
      Origin = 'V_OIL_ORG.ORG_TYPE'
      Size = 50
    end
    object qExtORG_ID: TFloatField
      FieldName = 'ORG_ID'
      Origin = 'V_OIL_ORG.ORG_ID'
    end
    object qExtPAR_NAME: TStringField
      FieldName = 'PAR_NAME'
      Origin = 'V_OIL_ORG.PAR_NAME'
      Size = 100
    end
    object qExtREK_ID: TFloatField
      FieldName = 'REK_ID'
      Origin = 'V_OIL_ORG.REK_ID'
    end
    object qExtREK_INST: TFloatField
      FieldName = 'REK_INST'
      Origin = 'V_OIL_ORG.REK_INST'
    end
    object qExtRACH_CHET: TStringField
      FieldName = 'RACH_CHET'
      Origin = 'V_OIL_ORG.RACH_CHET'
    end
    object qExtMFO: TStringField
      FieldName = 'MFO'
      Origin = 'V_OIL_ORG.MFO'
    end
    object qExtFACE_NAME: TStringField
      FieldName = 'FACE_NAME'
      Origin = 'V_OIL_ORG.FACE_NAME'
      Size = 14
    end
    object qExtFACE_SHORTNAME: TStringField
      FieldName = 'FACE_SHORTNAME'
      Origin = 'V_OIL_ORG.FACE_SHORTNAME'
      Size = 1
    end
    object qExtPLANECO_CODE: TFloatField
      FieldName = 'PLANECO_CODE'
      Origin = 'V_OIL_ORG.PLANECO_CODE'
    end
    object qExtCARD_ID: TFloatField
      FieldName = 'CARD_ID'
      Origin = 'V_OIL_ORG.CARD_ID'
    end
    object qExtDOGOVOR: TStringField
      FieldName = 'DOGOVOR'
      Origin = 'V_OIL_ORG.DOGOVOR'
      Size = 200
    end
    object qExtANKETA: TStringField
      FieldName = 'ANKETA'
      Origin = 'V_OIL_ORG.ANKETA'
      Size = 30
    end
    object qExtVED: TFloatField
      FieldName = 'VED'
      Origin = 'V_OIL_ORG.VED'
    end
    object qExtAZSID: TFloatField
      FieldName = 'AZSID'
      Origin = 'V_OIL_ORG.AZSID'
    end
    object qExtAZSINST: TFloatField
      FieldName = 'AZSINST'
      Origin = 'V_OIL_ORG.AZSINST'
    end
    object qExtAZSNAME: TStringField
      FieldName = 'AZSNAME'
      Origin = 'V_OIL_ORG.AZSNAME'
      Size = 100
    end
    object qExtPPONID: TFloatField
      FieldName = 'PPONID'
      Origin = 'V_OIL_ORG.PPONID'
    end
    object qExtPPONINST: TFloatField
      FieldName = 'PPONINST'
      Origin = 'V_OIL_ORG.PPONINST'
    end
    object qExtPPONNAME: TStringField
      FieldName = 'PPONNAME'
      Origin = 'V_OIL_ORG.PPONNAME'
      Size = 100
    end
    object qExtOBLID: TFloatField
      FieldName = 'OBLID'
      Origin = 'V_OIL_ORG.OBLID'
    end
    object qExtOBLINST: TFloatField
      FieldName = 'OBLINST'
      Origin = 'V_OIL_ORG.OBLINST'
    end
    object qExtOBLNAME: TStringField
      FieldName = 'OBLNAME'
      Origin = 'V_OIL_ORG.OBLNAME'
      Size = 100
    end
    object qExtBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Origin = 'V_OIL_ORG.BANK_NAME'
      Size = 50
    end
    object qExtDEF: TFloatField
      FieldName = 'DEF'
      Origin = 'V_OIL_ORG.DEF'
    end
  end
  object CanDeleteQuery: TOilQuery
    SQL.Strings = (
      'select count(*) co from ('
      '  select '#39'OIL_MONEY_ORG'#39' as name,org_id, org_inst from oil_money'
      '    where org_id = :id and org_inst = :inst and state = '#39'Y'#39
      '  union all'
      '  select '#39'OIL_MONEY_DEP'#39' as name,dep_id, dep_inst from oil_money'
      '    where dep_id = :id and dep_inst = :inst and state = '#39'Y'#39
      '  union all'
      '  select '#39'OIL_VEDOMOST'#39',org_id, org_inst from oil_vedomost'
      '    where org_id = :id and org_inst = :inst and state = '#39'Y'#39
      ' union all'
      '  select '#39'OIL_EMPLOY'#39',org_id, org_inst from oil_employ'
      '    where org_id = :id and org_inst = :inst and state = '#39'Y'#39
      ' union all'
      
        '  select '#39'OIL_TALON_PRIH_ORG'#39',org_id, org_inst from oil_talon_pr' +
        'ih'
      '    where org_id = :id and org_inst = :inst and state = '#39'Y'#39
      ' union all'
      
        '  select '#39'OIL_TALON_PRIH_DEP'#39',dep_id, dep_inst from oil_talon_pr' +
        'ih'
      '    where dep_id = :id and dep_inst = :inst and state = '#39'Y'#39
      ' union all'
      '  select '#39'OIL_TALON_OUT_ORG'#39',org_id, org_inst from oil_talon_out'
      '    where org_id = :id and org_inst = :inst and state = '#39'Y'#39
      ' union all'
      '  select '#39'OIL_TALON_OUT_DEP'#39',dep_id, dep_inst from oil_talon_out'
      '    where dep_id = :id and dep_inst = :inst and state = '#39'Y'#39
      ' union all'
      '  select '#39'OIL_SROTHER'#39',org_id, org_inst from oil_srother'
      '    where org_id = :id and org_inst = :inst and state = '#39'Y'#39
      ' union all'
      '  select '#39'OIL_SERVICE_ORG'#39',org_id, org_inst from oil_service'
      '    where org_id = :id and org_inst = :inst and state = '#39'Y'#39
      ' union all'
      '  select '#39'OIL_SERVICE_DEP'#39',dep_id, dep_inst from oil_service'
      '    where dep_id = :id and dep_inst = :inst and state = '#39'Y'#39
      ' union all'
      '  select '#39'OIL_PART_FROM'#39',from_, from_inst from oil_part'
      '    where from_ = :id and from_inst = :inst and state = '#39'Y'#39
      ' union all'
      '  select '#39'OIL_PART_TO'#39',to_, to_inst from oil_part'
      '    where to_ = :id and to_inst = :inst and state = '#39'Y'#39
      ' union all'
      '  select '#39'OIL_DOG_FROM'#39',from_, from_inst from oil_dog'
      '    where from_ = :id and from_inst = :inst and state = '#39'Y'#39
      ' union all'
      '  select '#39'OIL_DOG_TO'#39',to_, to_inst from oil_dog'
      '    where to_ = :id and to_inst = :inst and state = '#39'Y'#39
      ' union all'
      '   select '#39'OIL_PRIHOD_FROM'#39',from_, from_inst from oil_prihod'
      '    where from_ = :id and from_inst = :inst and state = '#39'Y'#39
      ' union all'
      '  select '#39'OIL_PRIHOD_TO'#39',to_, to_inst from oil_prihod'
      '    where to_ = :id and to_inst = :inst and state = '#39'Y'#39
      ' union all'
      
        '  select '#39'OIL_SALE_BOOK_ORGAN'#39',organ, organ_inst from oil_sale_b' +
        'ook'
      '    where organ = :id and organ_inst = :inst and state = '#39'Y'#39
      ' union all'
      
        '  select '#39'OIL_SALE_BOOK_FROM'#39',from_, from_inst from oil_sale_boo' +
        'k'
      '    where from_ = :id and from_inst = :inst and state = '#39'Y'#39
      ' union all'
      '  select '#39'OIL_RASHOD_FROM'#39',from_id, from_inst from oil_rashod'
      '    where from_id = :id and from_inst = :inst and state = '#39'Y'#39
      ' union all'
      '  select '#39'OIL_RASHOD_TO'#39',to_id, to_inst from oil_rashod'
      '    where to_id = :id and to_inst = :inst and state = '#39'Y'#39
      ' union all'
      '  select '#39'OIL_DAILY_REP'#39',azs_id, azs_inst from oil_daily_rep'
      '    where azs_id = :id and azs_inst = :inst and state = '#39'Y'#39
      ' union all'
      
        '  select '#39'V_CARD_TRANSACTION'#39',to_id,to_inst from v_card_transact' +
        'ion'
      '  where to_id=:id and to_inst=:inst'
      ')'
      '')
    MasterSource = Ds
    DataSource = Ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 168
    Top = 273
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
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
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
  object q2: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 336
    Top = 272
  end
  object PopupMenu1: TPopupMenu
    Left = 24
    Top = 384
    object N1: TMenuItem
      Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
      OnClick = N2Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object miDuplicateOrg: TMenuItem
      Caption = #1044#1091#1073#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      OnClick = miDuplicateOrgClick
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 448
    Top = 272
    object N3: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      OnClick = N3Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 488
    Top = 384
    object miAviasOrg: TMenuItem
      Tag = 4000
      Caption = #1054#1054#1054' '#1055#1058#1060' '#171#1040#1074#1080#1072#1089#187
      OnClick = miAlfaNaftaClick
    end
    object miAlfaNafta: TMenuItem
      Tag = 38
      Caption = #1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1072
      OnClick = miAlfaNaftaClick
    end
    object miNKAlfaNafta: TMenuItem
      Tag = 4587
      Caption = #1053#1050' '#1040#1083#1100#1092#1072'-'#1053#1072#1092#1090#1072
      OnClick = miAlfaNaftaClick
    end
    object miMainOrg: TMenuItem
      Caption = #1057#1074#1086#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      OnClick = miAlfaNaftaClick
    end
    object miOldOrg: TMenuItem
      Caption = #1057#1090#1072#1088#1099#1081' '#1080#1085#1089#1090
      OnClick = miAlfaNaftaClick
    end
  end
  object q: TOilQuery
    SQL.Strings = (
      'select *'
      'from v_oil_org'
      ''
      '')
    OnCalcFields = QOldCalcFields
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 260
    Top = 284
    object qKATEGORY: TStringField
      FieldKind = fkCalculated
      FieldName = 'KATEGORY'
      Size = 5
      Calculated = True
    end
    object qID: TFloatField
      FieldName = 'ID'
      Origin = 'V_OIL_ORG.ID'
    end
    object qNAME: TStringField
      FieldName = 'NAME'
      Origin = 'V_OIL_ORG.NAME'
      Size = 100
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Origin = 'V_OIL_ORG.INST'
    end
    object qID_NUM: TStringField
      FieldName = 'ID_NUM'
      Origin = 'V_OIL_ORG.ID_NUM'
    end
    object qNAL_NUM: TStringField
      FieldName = 'NAL_NUM'
      Origin = 'V_OIL_ORG.NAL_NUM'
      Size = 50
    end
    object qSVID_NUM: TStringField
      FieldName = 'SVID_NUM'
      Origin = 'V_OIL_ORG.SVID_NUM'
      Size = 50
    end
    object qADDR: TStringField
      FieldName = 'ADDR'
      Origin = 'V_OIL_ORG.ADDR'
      Size = 200
    end
    object qPHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'V_OIL_ORG.PHONE'
      Size = 30
    end
    object qBOSS: TStringField
      FieldName = 'BOSS'
      Origin = 'V_OIL_ORG.BOSS'
      Size = 50
    end
    object qORG_ID: TFloatField
      FieldName = 'ORG_ID'
      Origin = 'V_OIL_ORG.ORG_ID'
    end
    object qPAR_NAME: TStringField
      FieldName = 'PAR_NAME'
      Origin = 'V_OIL_ORG.PAR_NAME'
      Size = 100
    end
    object qRACH_CHET: TStringField
      FieldName = 'RACH_CHET'
      Origin = 'V_OIL_ORG.RACH_CHET'
    end
    object qMFO: TStringField
      FieldName = 'MFO'
      Origin = 'V_OIL_ORG.MFO'
    end
    object qANKETA: TStringField
      FieldName = 'ANKETA'
      Origin = 'V_OIL_ORG.ANKETA'
      Size = 30
    end
    object qORG_TYPE_NAME: TStringField
      FieldName = 'ORG_TYPE_NAME'
      Size = 54
    end
    object qBLACK_HERE: TStringField
      FieldName = 'BLACK_HERE'
      Size = 1
    end
    object qBLACK_LIST_COUNT: TFloatField
      FieldName = 'BLACK_LIST_COUNT'
    end
    object qSVOY: TStringField
      FieldName = 'SVOY'
      Size = 1
    end
    object qNAME_UKR: TStringField
      FieldName = 'NAME_UKR'
      Size = 100
    end
    object qADDR_UKR: TStringField
      FieldName = 'ADDR_UKR'
      Size = 200
    end
    object qFace: TFloatField
      FieldName = 'FACE'
    end
  end
  object TimerActivateQ: TTimer
    Enabled = False
    OnTimer = TimerActivateQTimer
    Left = 336
    Top = 184
  end
end
