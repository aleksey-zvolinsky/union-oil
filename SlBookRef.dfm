inherited SlBookRefForm: TSlBookRefForm
  Left = 263
  Top = 160
  Caption = #1050#1085#1080#1075#1072' '#1091#1095#1077#1090#1072' '#1087#1088#1086#1076#1072#1078
  ClientHeight = 396
  ClientWidth = 695
  Constraints.MinWidth = 700
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 200
    Top = 176
    Width = 32
    Height = 13
    Caption = 'PRICE'
  end
  inherited Panel1: TPanel
    Top = 363
    Width = 695
    TabOrder = 1
    inherited Panel3: TPanel
      Left = 507
      Width = 186
      TabOrder = 0
      inherited bbOk: TBitBtn
        Left = 5
      end
      inherited bbCancel: TBitBtn
        Left = 96
      end
    end
    inherited PAdd: TPanel
      Width = 42
      TabOrder = 1
      inherited sbAdd: TSpeedButton
        Visible = False
        OnClick = miAddNewClick
      end
      object rsbAdd: TRxSpeedButton
        Left = 4
        Top = 2
        Width = 35
        Height = 25
        DropDownMenu = pmAdd
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
    end
    inherited PEdit: TPanel
      Left = 44
      TabOrder = 2
    end
    inherited pDel: TPanel
      Left = 74
      TabOrder = 3
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      Left = 154
      Width = 168
      TabOrder = 4
      inherited bbClear: TBitBtn
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
    inherited pPrint: TPanel
      Left = 104
      Visible = True
    end
    inherited pTotal: TPanel
      Left = 322
      Visible = True
    end
    inherited pSpeedUp: TPanel
      Left = 352
      Visible = True
    end
    inherited pShowDetail: TPanel
      Left = 382
      Width = 125
      Visible = True
      inherited cbShowDetail: TCheckBox
        Width = 63
      end
    end
  end
  inherited Panel2: TPanel
    Width = 695
    Height = 80
    TabOrder = 0
    object LblNum: TLabel
      Left = 197
      Top = 13
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1086#1084#1077#1088
    end
    object Label3: TLabel
      Left = 367
      Top = 10
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1083#1080#1077#1085#1090
    end
    object SpeedButton1: TSpeedButton
      Left = 670
      Top = 5
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
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
      OnClick = SpeedButton1Click
    end
    object Label4: TLabel
      Left = 162
      Top = 35
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1072#1090#1072' '#1088#1072#1089#1095#1077#1090#1072
    end
    object lFromOrg: TLabel
      Left = 345
      Top = 34
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    end
    object sbClearFromOrg: TSpeedButton
      Left = 670
      Top = 29
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
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
      OnClick = sbClearFromOrgClick
    end
    object Label2: TLabel
      Left = 5
      Top = 11
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1077#1088#1080#1086#1076' '#1089
    end
    object Label7: TLabel
      Left = 40
      Top = 33
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = #1087#1086
    end
    object sbCause: TSpeedButton
      Left = 233
      Top = 55
      Width = 24
      Height = 22
      Hint = #1042#1099#1073#1088#1072#1085#1099' '#1074#1089#1077
      AllowAllUp = True
      GroupIndex = 1
      Flat = True
      Glyph.Data = {
        3E040000424D3E04000000000000760000002800000058000000160000000100
        040000000000C803000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        777777777777777777777777777777777777FFFFFFF777777FFFFFFF77777777
        7777777777777777777777777777777777777000000077777700000007788888
        88F777FF8888888F7000000077777700000007700000007777770000000770FF
        FFF07777970FFFFF0778F77778F77F8F8F77778F70FFFFF07777970FFFFF0770
        FFFFF07777970FFFFF0770888FF07779970FFFFF0778F77778F7F88F8F77778F
        70FFFFF07779970FFFFF0770FFFFF07779970FFFFF0770FFFFF07799970FFFFF
        0778F77778FF878F8F77778F70FFFFF07799970FFFFF0770FFFFF07799970FFF
        FF07708F88F07999970FFFFF0778F77778F8F78F8F77778F70FFFFF07999970F
        FFFF0770FFFFF07999970FFFFF0770FFFFF07799970FFFFF0778F77778F78F8F
        8F77778F70FFFFF07799970CCCCC0770FFFFF07799970CCCCC07708888807779
        970FFFFF0778F77778F7788F8F77778F70FFFFF077799708888C0770FFFFF077
        799708888C0770FFFFF07777970FFFFF0778F77778F777878F77778F70FFFFF0
        7777970FFFFF0770FFFFF07777970FFFFF077088FFF07777770FFFFF0778F777
        78F777778F77778F7088FFF07777770888FF077088FFF07777770888FF0770FF
        FFF07777770FFFFF0778F77778FF77778F77778F70FFFFF07777770FFFFF0770
        FFFFF07777770FFFFF0770888FF07C77770FFFFF0778F77778F8F7778F77778F
        70888FF07C77770888880770888FF07C77770888880770FFFFF07CC7770FFFFF
        0778F77778F88F778F77778F70FFFFF07CC7770FFFFF0770FFFFF07CC7770FFF
        FF0770888FF07CCC770FFFFF0778F77778F8F8F78F77778F70888FF07CCC7708
        888F0770888FF07CCC7708888F0770CCCCC07CCCC70FFFFF0778F77778F8F787
        8F77778F70FFFFF07CCCC70FFFFF0770FFFFF07CCCC70FFFFF07708888C07CCC
        770FFFFF0778F77778F8F8778F77778F708888F07CCC77088FFF07708888F07C
        CC77088FFF0770FFFFF07CC7770FFFFF0778F77778F887778F77778F70FFFFF0
        7CC7770FFFFF0770FFFFF07CC7770FFFFF0770888FF07C77770FFFFF0778FFFF
        F8F877778FFFFF8F7088FFF07C77770888FF077088FFF07C77770888FF077000
        0000777777000000077888888877777788888887700000007777770000000770
        0000007777770000000777777777777777777777777777777777777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777}
      NumGlyphs = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = sbCauseClick
    end
    object LblCause: TLabel
      Left = 164
      Top = 59
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1053#1053
    end
    object LblAZS: TLabel
      Left = 382
      Top = 58
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = #1040#1047#1057
    end
    object sbClearAZS: TSpeedButton
      Left = 670
      Top = 53
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
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
      OnClick = sbClearAZSClick
    end
    object sbType: TSpeedButton
      Left = 305
      Top = 54
      Width = 24
      Height = 22
      Hint = #1042#1099#1073#1088#1072#1085#1099' '#1074#1089#1077
      AllowAllUp = True
      GroupIndex = 2
      Flat = True
      Glyph.Data = {
        3E040000424D3E04000000000000760000002800000058000000160000000100
        040000000000C803000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        777777777777777777777777777777777777FFFFFFF777777FFFFFFF77777777
        7777777777777777777777777777777777777000000077777700000007788888
        88F777FF8888888F7000000077777700000007700000007777770000000770FF
        FFF07777970FFFFF0778F77778F77F8F8F77778F70FFFFF07777970FFFFF0770
        FFFFF07777970FFFFF0770888FF07779970FFFFF0778F77778F7F88F8F77778F
        70FFFFF07779970FFFFF0770FFFFF07779970FFFFF0770FFFFF07799970FFFFF
        0778F77778FF878F8F77778F70FFFFF07799970FFFFF0770FFFFF07799970FFF
        FF07708F88F07999970FFFFF0778F77778F8F78F8F77778F70FFFFF07999970F
        FFFF0770FFFFF07999970FFFFF0770FFFFF07799970FFFFF0778F77778F78F8F
        8F77778F70FFFFF07799970CCCCC0770FFFFF07799970CCCCC07708888807779
        970FFFFF0778F77778F7788F8F77778F70FFFFF077799708888C0770FFFFF077
        799708888C0770FFFFF07777970FFFFF0778F77778F777878F77778F70FFFFF0
        7777970FFFFF0770FFFFF07777970FFFFF077088FFF07777770FFFFF0778F777
        78F777778F77778F7088FFF07777770888FF077088FFF07777770888FF0770FF
        FFF07777770FFFFF0778F77778FF77778F77778F70FFFFF07777770FFFFF0770
        FFFFF07777770FFFFF0770888FF07C77770FFFFF0778F77778F8F7778F77778F
        70888FF07C77770888880770888FF07C77770888880770FFFFF07CC7770FFFFF
        0778F77778F88F778F77778F70FFFFF07CC7770FFFFF0770FFFFF07CC7770FFF
        FF0770888FF07CCC770FFFFF0778F77778F8F8F78F77778F70888FF07CCC7708
        888F0770888FF07CCC7708888F0770CCCCC07CCCC70FFFFF0778F77778F8F787
        8F77778F70FFFFF07CCCC70FFFFF0770FFFFF07CCCC70FFFFF07708888C07CCC
        770FFFFF0778F77778F8F8778F77778F708888F07CCC77088FFF07708888F07C
        CC77088FFF0770FFFFF07CC7770FFFFF0778F77778F887778F77778F70FFFFF0
        7CC7770FFFFF0770FFFFF07CC7770FFFFF0770888FF07C77770FFFFF0778FFFF
        F8F877778FFFFF8F7088FFF07C77770888FF077088FFF07C77770888FF077000
        0000777777000000077888888877777788888887700000007777770000000770
        0000007777770000000777777777777777777777777777777777777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7777}
      NumGlyphs = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = sbTypeClick
    end
    object Label5: TLabel
      Left = 264
      Top = 59
      Width = 38
      Height = 13
      Caption = #1058#1080#1087' '#1053#1053
    end
    object lKP_Dog: TLabel
      Left = 5
      Top = 58
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1086#1075#1086#1074#1086#1088':'
    end
    object eFiltrNN: TEdit
      Left = 234
      Top = 7
      Width = 95
      Height = 21
      MaxLength = 10
      TabOrder = 2
    end
    object ceClient: TComboEdit
      Left = 407
      Top = 6
      Width = 262
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = ceClientButtonClick
      OnDblClick = ceClientButtonClick
    end
    object deFiltrR_Date: TDateEdit
      Left = 234
      Top = 31
      Width = 95
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 4
    end
    object ceFromOrg: TComboEdit
      Left = 407
      Top = 30
      Width = 262
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = ceFromOrgButtonClick
      OnDblClick = ceFromOrgButtonClick
    end
    object deFiltrToDate: TDateEdit
      Left = 56
      Top = 30
      Width = 91
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
    end
    object deFiltrFromDate: TDateEdit
      Left = 56
      Top = 6
      Width = 91
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 0
    end
    object ceAzs: TComboEdit
      Left = 407
      Top = 54
      Width = 262
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 7
      OnButtonClick = ceAzsButtonClick
      OnDblClick = ceAzsButtonClick
    end
    object edKP_Dog: TComboEdit
      Left = 56
      Top = 54
      Width = 91
      Height = 21
      DirectInput = False
      Enabled = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 6
      OnButtonClick = edKP_DogButtonClick
      OnDblClick = edKP_DogButtonClick
    end
  end
  inherited pBase: TPanel
    Top = 90
    Width = 545
    Height = 273
    inherited SplitterDetail: TSplitter
      Top = 212
      Width = 545
      Height = 9
    end
    object Label6: TLabel [1]
      Left = 416
      Top = 104
      Width = 33
      Height = 13
      Caption = 'NN_ID'
    end
    inherited DBGrid1: TDBGridEh
      Width = 545
      Height = 212
      Constraints.MinHeight = 125
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      SumList.Active = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'S_DATE'
          Footer.Value = #1047#1072#1087#1080#1089#1077#1081':'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Title.SortIndex = 1
          Title.SortMarker = smDownEh
          Title.TitleButton = True
          Width = 72
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'GRID_NUM'
          Footer.FieldName = 'GRID_NUM'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
          Width = 79
          WordWrap = False
        end
        item
          EditButtons = <>
          FieldName = 'ORGAN_NAME'
          Footers = <>
          Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          Width = 189
        end
        item
          EditButtons = <>
          FieldName = 'F_DOC'
          Footers = <>
          Title.Caption = #1055#1077#1088#1074#1080#1095#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
          Width = 129
        end
        item
          EditButtons = <>
          FieldName = 'FRASCH'
          Footers = <>
          Title.Caption = #1060#1086#1088#1084#1072' '#1088#1072#1089#1095#1077#1090#1072
          Width = 185
        end
        item
          EditButtons = <>
          FieldName = 'R_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1088#1072#1089#1095#1077#1090#1072
          Width = 106
        end
        item
          EditButtons = <>
          FieldName = 'SUM_BASE'
          Footer.FieldName = 'SUM_BASE'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = 'SUM_20'
          Footer.FieldName = 'SUM_20'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1053#1044#1057
          Width = 49
        end
        item
          EditButtons = <>
          FieldName = 'NDS_T'
          Footer.FieldName = 'NDS_T'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
          Width = 85
        end
        item
          EditButtons = <>
          FieldName = 'NN_CAUSE_NAME'
          Footers = <>
          Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1053#1053
          Width = 190
        end
        item
          EditButtons = <>
          FieldName = 'NN_TYPE_NAME'
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1053#1053
        end
        item
          EditButtons = <>
          FieldName = 'FROM_NAME'
          Footers = <>
          Width = 241
        end
        item
          EditButtons = <>
          FieldName = 'AZS_NAME'
          Footers = <>
          Width = 161
        end
        item
          EditButtons = <>
          FieldName = 'FROM_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1089' ('#1040#1047#1057')'
        end
        item
          EditButtons = <>
          FieldName = 'TODATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1087#1086' ('#1040#1047#1057')'
        end
        item
          EditButtons = <>
          FieldName = 'ORGAN_OKPO'
          Footers = <>
        end>
    end
    inherited pDetail: TPanel
      Top = 221
      Width = 545
      inherited DBGridDetail: TDBGridEh
        Width = 545
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NP_NAME'
            Footers = <>
            Title.Caption = #1058#1086#1074#1072#1088
            Width = 106
          end
          item
            EditButtons = <>
            FieldName = 'DIM_NAME'
            Footers = <>
            Title.Caption = #1045#1076#1080#1085'.'#1080#1079#1084#1077#1088'.'
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = 'PRICE_NO_NDS'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
            Width = 93
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
            Width = 83
          end
          item
            EditButtons = <>
            FieldName = 'COUNT'
            Footers = <>
            Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
          end
          item
            EditButtons = <>
            FieldName = 'NDS_BASE'
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057
            Width = 99
          end
          item
            EditButtons = <>
            FieldName = 'NDS_20'
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072' '#1053#1044#1057
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = 'SUM'
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
            Width = 87
          end
          item
            EditButtons = <>
            FieldName = 'DET_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1086#1090#1087#1091#1089#1082#1072
          end>
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 695
    TabOrder = 2
    inherited pnlTuneGridBtn: TPanel
      Left = 666
    end
  end
  inherited PanelCol: TPanel
    Left = 545
    Top = 90
    Height = 273
    inherited cbCol: TRxCheckListBox
      Height = 245
    end
    inherited pRefresh: TPanel
      Top = 247
    end
  end
  inherited ds: TOraDataSource
    OnDataChange = dsDataChange
    Left = 196
    Top = 132
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select * from v_oil_sale_book'
      'where -1=-1'
      'order by s_date, num'
      ' ')
    Left = 165
    Top = 132
    object qID: TFloatField
      FieldName = 'ID'
      Origin = 'V_OIL_SALE_BOOK.ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Origin = 'V_OIL_SALE_BOOK.INST'
    end
    object qORGAN: TFloatField
      FieldName = 'ORGAN'
      Origin = 'V_OIL_SALE_BOOK.ORGAN'
    end
    object qORGAN_INST: TFloatField
      FieldName = 'ORGAN_INST'
      Origin = 'V_OIL_SALE_BOOK.ORGAN_INST'
    end
    object qORGAN_NAME: TStringField
      FieldName = 'ORGAN_NAME'
      Origin = 'V_OIL_SALE_BOOK.ORGAN_NAME'
      Size = 100
    end
    object qFRASCH: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1088#1072#1089#1089#1095#1077#1090#1086#1074
      FieldName = 'FRASCH'
      Origin = 'V_OIL_SALE_BOOK.FRASCH'
      Size = 100
    end
    object qR_DATE: TDateTimeField
      FieldName = 'R_DATE'
      Origin = 'V_OIL_SALE_BOOK.R_DATE'
    end
    object qSALE_TXT: TStringField
      FieldName = 'SALE_TXT'
      Origin = 'V_OIL_SALE_BOOK.SALE_TXT'
      Size = 80
    end
    object qNDS_T: TFloatField
      FieldName = 'NDS_T'
      Origin = 'V_OIL_SALE_BOOK.NDS_T'
    end
    object qNDS_P_BASE: TFloatField
      FieldName = 'NDS_P_BASE'
      Origin = 'V_OIL_SALE_BOOK.NDS_P_BASE'
    end
    object qNDS_P_20: TFloatField
      FieldName = 'NDS_P_20'
      Origin = 'V_OIL_SALE_BOOK.NDS_P_20'
    end
    object qNDS_NP_BASE: TFloatField
      FieldName = 'NDS_NP_BASE'
      Origin = 'V_OIL_SALE_BOOK.NDS_NP_BASE'
    end
    object qNDS_NP_20: TFloatField
      FieldName = 'NDS_NP_20'
      Origin = 'V_OIL_SALE_BOOK.NDS_NP_20'
    end
    object qNUM: TStringField
      FieldName = 'NUM'
      Origin = 'V_OIL_SALE_BOOK.NUM'
      Size = 8
    end
    object qTOV_ID: TFloatField
      FieldName = 'TOV_ID'
      Origin = 'V_OIL_SALE_BOOK.TOV_ID'
    end
    object qTOV_NAME: TStringField
      FieldName = 'TOV_NAME'
      Origin = 'V_OIL_SALE_BOOK.TOV_NAME'
      Size = 50
    end
    object qDIM_ID: TFloatField
      FieldName = 'DIM_ID'
      Origin = 'V_OIL_SALE_BOOK.DIM_ID'
    end
    object qDIM_NAME: TStringField
      FieldName = 'DIM_NAME'
      Origin = 'V_OIL_SALE_BOOK.DIM_NAME'
      Size = 50
    end
    object qKOL: TFloatField
      FieldName = 'KOL'
      Origin = 'V_OIL_SALE_BOOK.KOL'
    end
    object qFROM_: TFloatField
      FieldName = 'FROM_'
      Origin = 'V_OIL_SALE_BOOK.FROM_'
    end
    object qFROM_INST: TFloatField
      FieldName = 'FROM_INST'
      Origin = 'V_OIL_SALE_BOOK.FROM_INST'
    end
    object qORGAN_NALN: TStringField
      FieldName = 'ORGAN_NALN'
      Origin = 'V_OIL_SALE_BOOK.ORGAN_NALN'
      Size = 50
    end
    object qAZS_ID: TFloatField
      FieldName = 'AZS_ID'
      Origin = 'V_OIL_SALE_BOOK.AZS_ID'
    end
    object qAZS_INST: TFloatField
      FieldName = 'AZS_INST'
      Origin = 'V_OIL_SALE_BOOK.AZS_INST'
    end
    object qNAL_T: TFloatField
      FieldName = 'NAL_T'
      Origin = 'V_OIL_SALE_BOOK.NAL_T'
    end
    object qLOCK_: TFloatField
      FieldName = 'LOCK_'
      Origin = 'V_OIL_SALE_BOOK.LOCK_'
    end
    object qF_DOC: TStringField
      FieldName = 'F_DOC'
      Origin = 'OIL.V_OIL_SALE_BOOK.F_DOC'
      Size = 200
    end
    object qNN_TYPE_ID: TFloatField
      FieldName = 'NN_TYPE_ID'
      Origin = 'OIL.V_OIL_SALE_BOOK.NN_TYPE_ID'
    end
    object qNN_CAUSE_ID: TFloatField
      FieldName = 'NN_CAUSE_ID'
      Origin = 'OIL.V_OIL_SALE_BOOK.NN_CAUSE_ID'
    end
    object qNN_TYPE_NAME: TStringField
      FieldName = 'NN_TYPE_NAME'
      Origin = 'OIL.V_OIL_SALE_BOOK.NN_CAUSE_ID'
      Size = 50
    end
    object qNN_CAUSE_NAME: TStringField
      FieldName = 'NN_CAUSE_NAME'
      Origin = 'OIL.V_OIL_SALE_BOOK.NN_CAUSE_ID'
      Size = 50
    end
    object qFROM_DATE: TDateTimeField
      FieldName = 'FROM_DATE'
      Origin = 'OIL.V_OIL_SALE_BOOK.FROM_DATE'
    end
    object qTO_DATE: TDateTimeField
      FieldName = 'TODATE'
      Origin = 'OIL.V_OIL_SALE_BOOK.TO_DATE'
    end
    object qFROM_NAME: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      FieldName = 'FROM_NAME'
      Origin = 'OIL.V_OIL_SALE_BOOK.FROM_NAME'
      Size = 100
    end
    object qAZS_NAME: TStringField
      DisplayLabel = #1040#1047#1057
      FieldName = 'AZS_NAME'
      Origin = 'OIL.V_OIL_SALE_BOOK.AZS_NAME'
      Size = 100
    end
    object qORGAN_OKPO: TStringField
      DisplayLabel = #1050#1086#1076' '#1054#1050#1055#1054
      FieldName = 'ORGAN_OKPO'
      Origin = 'OIL.V_OIL_SALE_BOOK.ORGAN_OKPO'
    end
    object qNN_ID: TFloatField
      FieldName = 'NN_ID'
      Origin = 'OIL.V_OIL_SALE_BOOK.NN_ID'
    end
    object qNN_INST: TFloatField
      FieldName = 'NN_INST'
      Origin = 'OIL.V_OIL_SALE_BOOK.NN_INST'
    end
    object qSUM_BASE: TFloatField
      FieldName = 'SUM_BASE'
      Origin = 'OIL.V_OIL_SALE_BOOK.SUM_BASE'
    end
    object qSUM_20: TFloatField
      FieldName = 'SUM_20'
      Origin = 'OIL.V_OIL_SALE_BOOK.SUM_20'
    end
    object qGRID_NUM: TStringField
      FieldName = 'GRID_NUM'
    end
    object qS_DATE: TDateTimeField
      FieldName = 'S_DATE'
      Origin = 'OIL.V_OIL_SALE_BOOK.S_DATE'
    end
  end
  inherited ADMQ: TOilQuery
    Left = 161
    Top = 275
  end
  inherited PUM: TPopupMenu
    Left = 336
    Top = 236
    object miPrintNN: TMenuItem [0]
      Caption = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      OnClick = miPrintNNClick
    end
    object miPrintAll: TMenuItem [1]
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1074#1089#1077' '#1085#1072#1083#1086#1075#1086#1074#1099#1077
      OnClick = miPrintAllClick
    end
    object miPrintSaleBook: TMenuItem [2]
      Caption = #1055#1077#1095#1072#1090#1100' '#1082#1085#1080#1075#1080' '#1091#1095#1077#1090#1072' '#1087#1088#1086#1076#1072#1078
      OnClick = miPrintSaleBookClick
    end
    object miSeparator: TMenuItem [3]
      Caption = '-'
    end
  end
  inherited ActionList: TActionList
    Left = 72
    Top = 287
  end
  object pmAdd: TPopupMenu [11]
    Left = 8
    Top = 278
    object miAddNew: TMenuItem
      Caption = #1042#1099#1087#1080#1089#1082#1072' '#1053#1053' '#1087#1086' '#1095#1077#1082#1072#1084'/'#1086#1073#1099#1095#1085#1099#1077
      OnClick = miAddNewClick
    end
    object miCorr: TMenuItem
      Caption = #1042#1099#1087#1080#1089#1082#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      OnClick = miAddNewClick
    end
    object N3: TMenuItem
      Caption = #1042#1099#1087#1080#1089#1082#1072' '#1053#1053' '#1089' '#1040#1047#1057
      object miVedomost: TMenuItem
        Tag = 11
        Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100
        OnClick = miCreateNNByQuery
      end
      object miOther: TMenuItem
        Tag = 12
        Caption = '"'#1055#1088#1086#1095#1080#1081' '#1086#1090#1087#1091#1089#1082'"'
        OnClick = miCreateNNByQuery
      end
      object miOtherHelp: TMenuItem
        Tag = 23
        Caption = '"'#1055#1088#1086#1095#1080#1081' '#1086#1090#1087#1091#1089#1082'" ('#1057#1087#1086#1085#1089#1086#1088#1089#1082#1072#1103' '#1087#1086#1084#1086#1097#1100')'
        OnClick = miCreateNNByQuery
      end
      object miNal: TMenuItem
        Tag = 10
        Caption = #1053#1072#1083#1080#1095#1085#1099#1077
        OnClick = miCreateNNByTaxBill
      end
      object miBank: TMenuItem
        Tag = 22
        Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1077' '#1082#1072#1088#1090#1099
        OnClick = miCreateNNByTaxBill
      end
    end
    object miAccountPayable: TMenuItem
      Tag = 25
      Caption = #1042#1099#1087#1080#1089#1082#1072' '#1053#1053' '#1085#1072' '#1082#1088#1077#1076#1080#1090#1086#1088#1089#1082#1091#1102' '#1079#1072#1076#1086#1083#1078#1077#1085#1086#1089#1090#1100
      OnClick = miCreateNNByQuery
    end
    object miLoad: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
      OnClick = miLoadClick
    end
  end
  object qCheck: TOilQuery [12]
    SQL.Strings = (
      'select s.det_text,s.det_date'
      '  from Oil_Sale_Book_Det s'
      ' where nn_id = :nn_id'
      '   and nn_inst = :nn_inst'
      '   And ltrim(s.det_text) is not null '
      ' group by s.det_text,s.det_date'
      ' order by s.det_date')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 280
    Top = 241
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nn_id'
      end
      item
        DataType = ftUnknown
        Name = 'nn_inst'
      end>
  end
  object OpenDialog: TOpenDialog [13]
    Filter = #1092#1072#1081#1083#1099' '#1089#1084'. '#1086#1090#1095#1077#1090#1086#1074'|*.oil|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 40
    Top = 193
  end
  object qFindOrg: TOilQuery [14]
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select count(*),'
      '       o.name,'
      '       o.id,'
      '       o.inst,'
      '       :OKPO InOkpo,'
      '       :nal_num InNal,'
      '       :svid_num InSvid_Num,'
      '       o.id_num Okpo,'
      '       o.nal_num nal_num,'
      '       o.Svid_num Svid_num'
      '  from (select *'
      '          from v_org o'
      
        '         where (o.id_num is not null or o.nal_num is not null or' +
        ' o.svid_num is not null)'
      '           and o.state = '#39'Y'#39
      '           and o.inst = :inst'
      '           and id <> inst) o'
      ' where/* (o.id_num = :OKPO and :OKPO is not null)'
      '    or*/ (o.nal_num = :nal_num and :nal_num is not null)'
      
        '    or (upper(replace(replace(o.svid_num, '#39' '#39','#39#39'),'#39#8470#39','#39#39')) = upp' +
        'er(replace(replace(:svid_num,'#39' '#39','#39#39'),'#39#8470#39','#39#39')) and :svid_num is n' +
        'ot null)'
      'group by o.name,'
      '      o.id,'
      '      o.inst,'
      '      o.id_num ,'
      '      o.nal_num ,'
      '      o.Svid_num ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 80
    Top = 193
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OKPO'
      end
      item
        DataType = ftUnknown
        Name = 'nal_num'
      end
      item
        DataType = ftUnknown
        Name = 'svid_num'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
  inherited qDetail: TOilQuery
    SQL.Strings = (
      'SELECT'
      '       b.ID id,'
      '       b.INST inst,'
      '       SB.ID NN_ID,'
      '       SB.INST NN_INST,'
      '       nvl(b.NDS_T,SB.NDS_T) sum,'
      '       nvl(nvl(b.NDS_P_BASE,b.NDS_NP_BASE),'
      '           nvl(SB.NDS_P_BASE,SB.NDS_NP_BASE)) NDS_BASE,'
      '       nvl(nvl(b.NDS_P_20,b.NDS_NP_20),'
      '           nvl(SB.NDS_P_20,SB.NDS_NP_20)) NDS_20,'
      '       nvl(b.TOV_ID,SB.TOV_ID) np_type,'
      '       nvl(b.DIV_ID,SB.DIV_ID) dim_id,'
      '       nvl(b.KOL,SB.KOL) count,'
      '       b.PRICE_NDS price,'
      
        '       NDS.GetNoNds_WithNds(nvl(b.PRICE_NDS,0), nvl(b.det_date,s' +
        'b.s_date),4) price_no_nds,'
      '       b.det_text,'
      '       b.det_date,'
      '       nvl(dimDet.name,dim.name)dim_name,'
      
        '       nvl(get_nn_tov_name(b.tov_id,sb.nn_cause_id),get_nn_tov_n' +
        'ame(sb.tov_id,sb.nn_cause_id))np_name'
      '  FROM OIL_SALE_BOOK_DET b,'
      '       OIL_SALE_BOOK SB,'
      '       v_OIL_DIMENSION DimDet,v_OIL_DIMENSION dim'
      ' WHERE b.nn_id(+) = SB.ID'
      '   AND b.nn_inst(+) = SB.INST'
      '   AND SB.ID =  :id'
      '   AND SB.INST = :inst'
      '   AND dim.id(+) = sb.div_id'
      '   AND DimDet.id(+) = b.div_id'
      '   AND SB.STATE ='#39'Y'#39
      '   AND SB.STATE = b.state(+)'
      
        ' Order by decode(sb.nn_cause_id, 11,b.det_date, 12,b.det_date, s' +
        'b.s_Date)')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
    object qDetailID: TFloatField
      FieldName = 'ID'
    end
    object qDetailINST: TFloatField
      FieldName = 'INST'
    end
    object qDetailNN_ID: TFloatField
      FieldName = 'NN_ID'
      Required = True
    end
    object qDetailNN_INST: TFloatField
      FieldName = 'NN_INST'
      Required = True
    end
    object qDetailSUM: TFloatField
      FieldName = 'SUM'
    end
    object qDetailNDS_BASE: TFloatField
      FieldName = 'NDS_BASE'
    end
    object qDetailNDS_20: TFloatField
      FieldName = 'NDS_20'
    end
    object qDetailNP_TYPE: TFloatField
      FieldName = 'NP_TYPE'
    end
    object qDetailDIM_ID: TFloatField
      FieldName = 'DIM_ID'
    end
    object qDetailCOUNT: TFloatField
      FieldName = 'COUNT'
    end
    object qDetailPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object qDetailPRICE_NO_NDS: TFloatField
      FieldName = 'PRICE_NO_NDS'
    end
    object qDetailDET_TEXT: TStringField
      FieldName = 'DET_TEXT'
      Size = 100
    end
    object qDetailDET_DATE: TDateTimeField
      FieldName = 'DET_DATE'
    end
    object qDetailDIM_NAME: TStringField
      FieldName = 'DIM_NAME'
      Size = 50
    end
    object qDetailNP_NAME: TStringField
      FieldName = 'NP_NAME'
      Size = 50
    end
  end
end
