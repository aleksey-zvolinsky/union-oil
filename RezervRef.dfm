inherited RezervRefForm: TRezervRefForm
  Left = 253
  Top = 193
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1086#1074
  ClientHeight = 452
  ClientWidth = 597
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 419
    Width = 597
    object sbUnErase: TSpeedButton [0]
      Left = 266
      Top = 4
      Width = 25
      Height = 25
      Hint = 
        #1042#1086#1089#1090#1072#1085#1086#1074#1083#1080#1074#1072#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1077'|'#1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1074#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103' '#1091#1076#1072#1083#1077#1085#1085#1099#1093 +
        ' '#1079#1072#1087#1080#1089#1077#1081'.'
      AllowAllUp = True
      GroupIndex = 1
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F77777703333333733F3F3F73F33330FF0808077
        0333337F37F7F7F37F33330FF0807077033333733737F73F73F330FF77808707
        703337F37F37F37F37F330FF08807807703037F37F37F37F37F700FF08808707
        700377F37337F37F377330FF778078077033373F73F7F3733733330FF0808077
        0333337F37F7F7F37F33330FF08070770333337FF7F7F7FF7F33330000000000
        03333377777777777F33330F888777770333337FFFFFFFFF7F33330000000000
        033333777777777773333333307770333333333337FFF7F33333333330000033
        3333333337777733333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbUnEraseClick
    end
    inherited Panel3: TPanel
      Left = 400
      inherited bbOk: TBitBtn
        Left = 11
        ModalResult = 1
      end
    end
    inherited PAdd: TPanel
      inherited sbAdd: TSpeedButton
        OnClick = sbAddClick
      end
    end
    inherited pDel: TPanel
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      inherited bbClear: TBitBtn
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        OnClick = ActivateQ
      end
    end
    inherited pPrint: TPanel
      TabOrder = 9
    end
    inherited pShowDetail: TPanel
      Width = 32
    end
    object bbKalibr: TBitBtn
      Left = 314
      Top = 4
      Width = 89
      Height = 25
      Caption = #1050#1072#1083#1080#1073#1088#1086#1074#1082#1072
      TabOrder = 5
      OnClick = bbKalibrClick
    end
  end
  inherited Panel2: TPanel
    Width = 597
    Height = 79
    object Label3: TLabel
      Left = 6
      Top = 2
      Width = 73
      Height = 13
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' :'
    end
    object SpeedButton1: TSpeedButton
      Left = 289
      Top = 15
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
      OnClick = SpeedButton1Click
    end
    object Label1: TLabel
      Left = 6
      Top = 38
      Width = 56
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' :'
    end
    object Label2: TLabel
      Left = 322
      Top = 38
      Width = 28
      Height = 13
      Caption = #1058#1080#1087' : '
    end
    object Label4: TLabel
      Left = 174
      Top = 38
      Width = 40
      Height = 13
      Caption = #1053#1086#1084#1077#1088' :'
    end
    object SpeedButton2: TSpeedButton
      Left = 289
      Top = 50
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
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 437
      Top = 50
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
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 121
      Top = 50
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
      OnClick = SpeedButton4Click
    end
    object Label5: TLabel
      Left = 322
      Top = 3
      Width = 44
      Height = 13
      Caption = #1058#1080#1087' '#1053#1055' :'
    end
    object SpeedButton5: TSpeedButton
      Left = 437
      Top = 15
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
      OnClick = SpeedButton5Click
    end
    object cbOrg: TComboEdit
      Left = 6
      Top = 16
      Width = 281
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = cbOrgButtonClick
      OnDblClick = cbOrgButtonClick
    end
    object edName: TEdit
      Left = 6
      Top = 51
      Width = 113
      Height = 21
      TabOrder = 1
    end
    object edType: TEdit
      Left = 322
      Top = 51
      Width = 113
      Height = 21
      TabOrder = 2
    end
    object edNum: TEdit
      Left = 174
      Top = 51
      Width = 113
      Height = 21
      TabOrder = 3
    end
    object gbClass: TGroupBox
      Left = 464
      Top = 2
      Width = 131
      Height = 75
      Align = alRight
      Caption = #1050#1083#1072#1089#1089' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072' :'
      TabOrder = 4
      object cbReal: TCheckBox
        Left = 8
        Top = 17
        Width = 81
        Height = 19
        Caption = #1056#1077#1072#1083#1100#1085#1099#1077
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = ActivateQ
      end
      object cbVirt: TCheckBox
        Left = 8
        Top = 34
        Width = 97
        Height = 19
        Caption = #1042#1080#1088#1090#1091#1072#1083#1100#1085#1099#1077
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = ActivateQ
      end
      object cbElev: TCheckBox
        Left = 8
        Top = 52
        Width = 81
        Height = 19
        Caption = #1069#1083#1077#1074#1072#1090#1086#1088#1099
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = ActivateQ
      end
    end
    object ceNpType: TComboEdit
      Left = 322
      Top = 16
      Width = 113
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = ceNpTypeButtonClick
      OnDblClick = ceNpTypeButtonClick
    end
  end
  inherited pBase: TPanel
    Top = 89
    Width = 447
    Height = 330
    inherited SplitterDetail: TSplitter
      Top = 244
      Width = 447
    end
    inherited DBGrid1: TDBGridEh
      Width = 447
      Height = 244
      AllowedOperations = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghTraceColSizing, dghRowHighlight]
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'REZ_TYPE'
          Footers = <>
          Title.Caption = #1058#1080#1087
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'REALVIRT_NAME'
          Footers = <>
          Title.Caption = #1056#1077#1072#1083'./'#1042#1080#1088#1090'.'
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'NUM'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'CAPACITY'
          Footers = <>
          Title.Caption = #1025#1084#1082#1086#1089#1090#1100' ('#1084'.'#1082#1091#1073'.)'
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'NP_TYPE'
          Footers = <>
          Title.Caption = #1053#1055
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'ARENDA_NAME'
          Footers = <>
          Title.Caption = #1057#1076#1072#1085' '#1074' '#1072#1088#1077#1085#1076#1091
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'ORGNAME'
          Footers = <>
          Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'START_YEAR'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072' '#1074' '#1101#1082#1089#1087#1083'.'
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'DEAD'
          Footers = <>
          Title.Caption = #1052#1077#1088#1090#1074#1099#1081' '#1086#1089#1090'.'
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'UB_KAT_NAME'
          Footers = <>
          Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
          Width = 145
        end
        item
          EditButtons = <>
          FieldName = 'DNO_CORR'
          Footers = <>
          Title.Caption = #1050#1086#1088#1088'. '#1076#1085#1080#1097#1072
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'CONDITION_NAME'
          Footers = <>
          Title.Caption = #1058#1077#1093'. '#1089#1086#1089#1090#1086#1103#1085#1080#1077
          Width = 85
        end
        item
          EditButtons = <>
          FieldName = 'LAST_CAL_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083'. '#1082#1072#1083#1080#1073#1088'.'
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'INSPECTION_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1086#1073#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
          Width = 110
        end
        item
          EditButtons = <>
          FieldName = 'REPAIR_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083'.'#1088#1077#1084#1086#1085#1090#1072
          Width = 110
        end
        item
          EditButtons = <>
          FieldName = 'REPAIR_DETAILS'
          Footers = <>
          Title.Caption = #1063#1090#1086' '#1088#1077#1084#1086#1085#1090#1080#1088#1086#1074#1072#1083#1080
          Width = 110
        end
        item
          EditButtons = <>
          FieldName = 'COLOURING_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083'. '#1086#1082#1088#1072#1089#1082#1080
          Width = 110
        end
        item
          EditButtons = <>
          FieldName = 'COMMENTS'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'TUBING_TYPE'
          Footers = <>
          Title.Caption = #1058#1088#1091#1073#1086#1087#1088#1086#1074'.'
          Title.Hint = #1042#1080#1076' '#1090#1088#1091#1073#1086#1087#1088#1086#1074#1086#1076#1072' ('#1079#1072#1075#1072#1083#1100#1085#1080#1081' | '#1088#1086#1079#1076#1110#1083#1100#1085#1080#1081')'
          Width = 81
        end
        item
          EditButtons = <>
          FieldName = 'TUBINGCAPACITY'
          Footers = <>
          Title.Caption = #1025#1084#1082#1086#1089#1090#1100' '#1090#1088#1091#1073#1086#1087#1088#1086#1074'.'
          Title.Hint = #1028#1084#1085#1110#1089#1090#1100' '#1090#1088#1091#1073#1086#1087#1088#1086#1074#1086#1076#1072
          Width = 109
        end>
    end
    inherited pDetail: TPanel
      Top = 247
      Width = 447
      TabOrder = 2
      inherited DBGridDetail: TDBGridEh
        Width = 447
      end
    end
    object pUnErase: TPanel
      Left = 0
      Top = 299
      Width = 447
      Height = 31
      Align = alBottom
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = ' '#1057#1077#1081#1095#1072#1089' '#1087#1086#1082#1072#1079#1099#1074#1072#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1091#1076#1072#1083#1077#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080'!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
      object bbUnErase: TBitBtn
        Left = 329
        Top = 3
        Width = 113
        Height = 25
        Caption = #1042#1086'&'#1089#1090#1072#1085#1086#1074#1080#1090#1100'!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = bbUnEraseClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333888888888F3333330F88888803333333833F3F3F83F33330FF0707088
          0333338F38F8F8F38F33330FF0708088033333833838F83F83F330FF88707808
          803338F38F38F38F38F330FF07708708803038F38F38F38F38F800FF07707808
          800388F38338F38F388330FF887087088033383F83F8F3FFFFFF330FF0707044
          4444FFFF38F8F3888888444FF0708A222224888F38F8F8F333382240000000A2
          2224F38F888888833338A2247778844222248338FFFFF8833338A22244444222
          22248F3388888333FF383A2222222222AA2438FF333333FF88F833AA222222AA
          33A33388FFFFFF8833833333AAAAAA3333333333888888333333}
        NumGlyphs = 2
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 597
    inherited pnlTuneGridBtn: TPanel
      Left = 568
    end
  end
  inherited PanelCol: TPanel
    Left = 447
    Top = 89
    Height = 330
    inherited cbCol: TRxCheckListBox
      Height = 302
    end
    inherited pRefresh: TPanel
      Top = 304
    end
  end
  inherited ds: TOraDataSource
    Left = 156
    Top = 180
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select *'
      '  from (select rez.*,'
      '               oo.name as orgname,'
      '               npt.name as np_type,'
      '               npt.id as reznp_type_id,'
      '               rzt.name as ub_kat_name,'
      '               elev.name as elev_name,'
      '               decode(rez.realvirt,'
      '                      0,'
      '                      '#39#1042#1080#1088#1090#1091#1072#1083#1100#1085#1099#1081#39','
      '                      1,'
      '                      '#39#1056#1077#1072#1083#1100#1085#1099#1081#39') as realvirt_name,'
      '               ooa.name as arenda_name,'
      '               decode(rez.condition,'
      '                      0,'
      '                      '#39#1057#1087#1088#1072#1074#1085#1080#1081#39','
      '                      1,'
      '                      '#39#1042' '#1088#1077#1084#1086#1085#1090#1110#39','
      '                      2,'
      '                      '#39#1053#1072' '#1086#1073#1089#1090#1077#1078#1077#1085#1085#1110#39','
      '                      3,'
      '                      '#39#1055#1088#1086#1074#1086#1076#1080#1090#1100#1089#1103' '#1076#1077#1092#1077#1082#1090#1086#1089#1082#1086#1087#1110#1103#39','
      '                      4,'
      '                      '#39#1055#1086#1090#1088#1077#1073#1091#1108' '#1088#1077#1084#1086#1085#1090#1091' ('#1087#1110#1089#1083#1103' '#1086#1073#1089#1090#1077#1078#1077#1085#1085#1103')'#39','
      '                      5,'
      '                      '#39#1055#1110#1076#1083#1103#1075#1072#1108' '#1091#1090#1080#1083#1110#1079#1072#1094#1110#1111#39','
      '                      6,'
      '                      '#39#1050#1072#1087#1110#1090#1072#1083#1100#1085#1080#1081' '#1088#1077#1084#1086#1085#1090#39') as condition_name,'
      '                decode(rez.tubing,'
      
        '                       0,decode(ov.Language,1,'#39#1047#1072#1075#1072#1083#1100#1085#1080#1081#39','#39#1054#1073#1097#1080#1081 +
        #39'),'
      
        '                       1,decode(ov.Language,1,'#39#1056#1086#1079#1076#1110#1083#1100#1085#1080#1081#39','#39#1056#1072#1079#1076 +
        #1077#1083#1100#1085#1099#1081#39')) as Tubing_type '
      '          from oil_rezervuar rez,'
      '               v_org oo,'
      '               v_org elev,'
      '               v_oil_rez_np_type reznp,'
      '               oil_np_type npt,'
      '               oil_rez_types rzt,'
      '               (select *'
      '                  from v_oil_rez_arenda'
      
        '                 where sysdate between date_from and date_to) rz' +
        'a,'
      '               v_org ooa'
      '         where rez.id_org = oo.id'
      '           and rez.inst_org = oo.inst'
      '           and reznp.rez_id(+) = rez.id'
      '           and reznp.rez_inst(+) = rez.inst'
      '           and reznp.date_from(+) <= sysdate'
      '           and reznp.date_to(+) > sysdate'
      '           and reznp.np_type = npt.id(+)'
      '           and rez.elev_id = elev.id(+)'
      '           and rez.elev_inst = elev.inst(+)'
      '           and rez.id = rza.rez_id(+)'
      '           and rez.inst = rza.rez_inst(+)'
      '           and rza.org_id = ooa.id(+)'
      '           and rza.org_inst = ooa.inst(+)'
      '           and rez.ub_kat = rzt.id(+)'
      '           and rez.state = :AState'
      
        '           and ((rez.id_org = :AOrgId and rez.inst_org = :AOrgIn' +
        'st) or'
      '               (:AOrgId is null and :AOrgInst is null))'
      
        '           and (upper(rez.name) like '#39'%'#39' || upper(:AName) || '#39'%'#39 +
        ' or'
      '               :AName is null)'
      
        '           and (upper(rez.rez_type) like '#39'%'#39' || upper(:AType) ||' +
        ' '#39'%'#39' or'
      '               :AType is null)'
      
        '           and (upper(rez.num) like '#39'%'#39' || upper(:ANum) || '#39'%'#39' o' +
        'r'
      '               :ANum is null)'
      '           and (rez.realvirt = :AIsReal'
      '             or rez.realvirt = :AIsVirt-1'
      '             or sign(nvl(rez.Elev_Id,0)) = :AIsElev))'
      ' where (reznp_type_id = :ANPType)'
      '    or (:ANPType is null)')
    Left = 144
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AState'
      end
      item
        DataType = ftUnknown
        Name = 'AOrgId'
      end
      item
        DataType = ftUnknown
        Name = 'AOrgInst'
      end
      item
        DataType = ftUnknown
        Name = 'AName'
      end
      item
        DataType = ftUnknown
        Name = 'AType'
      end
      item
        DataType = ftUnknown
        Name = 'ANum'
      end
      item
        DataType = ftUnknown
        Name = 'AIsReal'
      end
      item
        DataType = ftUnknown
        Name = 'AIsVirt'
      end
      item
        DataType = ftUnknown
        Name = 'AIsElev'
      end
      item
        DataType = ftUnknown
        Name = 'ANPType'
      end>
  end
  inherited ADMQ: TOilQuery
    Top = 328
  end
  inherited PUM: TPopupMenu
    Left = 192
    Top = 256
  end
  inherited ActionList: TActionList
    Left = 152
    Top = 255
  end
  object qq: TOilQuery
    SQL.Strings = (
      'select count(*) as numb'
      '  from (select id'
      '          from oil_prih_det'
      '         where state = '#39'Y'#39
      '           and rez = :rez_id'
      '           and rez_inst = :rez_inst'
      '        UNION ALL'
      '        select id'
      '          from oil_rashod'
      '         where state = '#39'Y'#39
      '           and rez = :rez_id'
      '           and rez_inst = :rez_inst)')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 544
    Top = 121
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rez_id'
      end
      item
        DataType = ftInteger
        Name = 'rez_inst'
      end>
  end
end
