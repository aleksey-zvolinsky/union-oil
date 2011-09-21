inherited SRepRefForm: TSRepRefForm
  Left = 261
  Top = 233
  Caption = #1040#1088#1093#1080#1074' '#1089#1084#1077#1085#1085#1099#1093' '#1086#1090#1095#1077#1090#1086#1074
  ClientHeight = 393
  ClientWidth = 754
  Constraints.MinHeight = 420
  Constraints.MinWidth = 762
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 360
    Width = 754
    TabOrder = 1
    inherited Panel3: TPanel
      Left = 557
    end
    inherited PAdd: TPanel
      Width = 40
      inherited sbAdd: TSpeedButton
        Visible = False
        OnClick = sbAddClick
      end
      object rsbAdd: TRxSpeedButton
        Left = 2
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
        OnClick = sbAddClick
      end
    end
    inherited PEdit: TPanel
      Left = 42
    end
    inherited pDel: TPanel
      Left = 72
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      Left = 152
      inherited bbClear: TBitBtn
        TabOrder = 1
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        TabOrder = 0
        OnClick = bbSearchClick
      end
    end
    inherited pPrint: TPanel
      Left = 102
      Visible = True
    end
    inherited pTotal: TPanel
      Left = 318
      Visible = True
      inherited sbTotal: TSpeedButton
        Down = True
      end
    end
    inherited pSpeedUp: TPanel
      Left = 348
      Visible = True
    end
    inherited pShowDetail: TPanel
      Left = 378
      Width = 179
    end
  end
  inherited Panel2: TPanel
    Width = 754
    Height = 57
    TabOrder = 0
    object Label1: TLabel
      Left = 30
      Top = 10
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1072#1090#1072
    end
    object Label2: TLabel
      Left = 310
      Top = 34
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = #1040#1047#1057
    end
    object Label3: TLabel
      Left = 7
      Top = 34
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1087#1077#1088#1072#1090#1086#1088
    end
    object sbAzs: TSpeedButton
      Left = 726
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
      OnClick = sbAzsClick
    end
    object sbEmp: TSpeedButton
      Left = 220
      Top = 29
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
      OnClick = sbEmpClick
    end
    object lSubOrg: TLabel
      Left = 264
      Top = 10
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
    end
    object sbOrg: TSpeedButton
      Left = 726
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
      OnClick = sbOrgClick
    end
    object sbDate: TSpeedButton
      Left = 147
      Top = 5
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
      OnClick = sbDateClick
    end
    object deDate: TDateEdit
      Left = 60
      Top = 6
      Width = 86
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
    end
    object ceAZS: TComboEdit
      Left = 335
      Top = 30
      Width = 390
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = ceAZSButtonClick
      OnDblClick = ceAZSButtonClick
      OnKeyPress = ceEmpKeyPress
    end
    object ceEmp: TComboEdit
      Left = 60
      Top = 30
      Width = 160
      Height = 21
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = ceEmpButtonClick
      OnDblClick = ceEmpButtonClick
      OnKeyPress = ceEmpKeyPress
    end
    object ceOrg: TComboEdit
      Left = 335
      Top = 6
      Width = 390
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = ceOrgButtonClick
      OnDblClick = ceOrgButtonClick
      OnKeyPress = ceEmpKeyPress
    end
  end
  inherited pBase: TPanel
    Top = 67
    Width = 604
    Height = 293
    inherited SplitterDetail: TSplitter
      Top = 238
      Width = 604
    end
    inherited DBGrid1: TDBGridEh
      Width = 604
      Height = 238
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1083#1086#1075#1086#1074' (L)'
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      SumList.Active = True
      UseMultiTitle = True
      OnDblClick = sbEditClick
      OnGetCellParams = DBGrid1GetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'REP_DATE'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' ('#1053#1072#1095#1072#1083#1086' '#1089#1084#1077#1085#1099')'
          Title.SortIndex = 1
          Title.SortMarker = smUpEh
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'REP_DATE_END_REAL'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' ('#1050#1086#1085#1077#1094' '#1089#1084#1077#1085#1099')'
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'REP_NUM'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'SMENA_NUM'
          Footers = <>
          Title.Caption = #1057#1084#1077#1085#1072
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'AZS_NAME'
          Footers = <>
          Title.Caption = #1040#1047#1057
          Width = 180
        end
        item
          EditButtons = <>
          FieldName = 'FILIAL_NAME'
          Footers = <>
          Title.Caption = #1060#1080#1083#1080#1072#1083
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'EMP_NAME'
          Footers = <>
          Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'INPUT_METHOD'
          Footers = <>
          Title.Caption = #1057#1087#1086#1089#1086#1073' '#1074#1074#1086#1076#1072
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'OPS_VERSION'
          Footers = <>
          Title.Caption = #1042#1077#1088#1089#1080#1103' OPS'
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'MACHINE'
          Footers = <>
          Title.Caption = #1050#1086#1084#1087#1100#1102#1090#1077#1088
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'OS_USER'
          Footers = <>
          Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'USER_NAME'
          Footers = <>
          Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' OIL'
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'DATE_MOD'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
          Width = 110
        end>
    end
    inherited pDetail: TPanel
      Top = 241
      Width = 604
      inherited DBGridDetail: TDBGridEh
        Width = 604
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 754
    TabOrder = 2
    inherited pnlTuneGridBtn: TPanel
      Left = 725
    end
  end
  inherited PanelCol: TPanel
    Left = 604
    Top = 67
    Height = 293
    inherited cbCol: TRxCheckListBox
      Height = 265
    end
    inherited pRefresh: TPanel
      Top = 267
    end
  end
  object sp1: TOilStoredProc [5]
    Left = 165
    Top = 94
  end
  object RQ1: TOilQuery [6]
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 435
    Top = 200
  end
  object RQ2: TOilQuery [7]
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 465
    Top = 200
  end
  object RQ3: TOilQuery [8]
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 495
    Top = 200
  end
  object RQ4: TOilQuery [9]
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 525
    Top = 200
  end
  inherited ds: TOraDataSource
    Left = 55
    Top = 268
  end
  inherited q: TOilQuery
    CachedUpdates = True
    UpdateObject = u
    AutoCalcFields = False
    AfterPost = qAfterPost
    AfterDelete = qAfterPost
    RequestLive = True
    UpdateMode = upWhereChanged
    Left = 40
    Top = 276
    object qID: TFloatField
      FieldName = 'ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
    end
    object qREP_DATE: TDateTimeField
      FieldName = 'REP_DATE'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object qREP_DATE_END: TDateTimeField
      FieldName = 'REP_DATE_END'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object qREP_DATE_END_REAL: TDateTimeField
      FieldName = 'REP_DATE_END_REAL'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object qREP_NUM: TFloatField
      FieldName = 'REP_NUM'
    end
    object qSMENA_NUM: TFloatField
      FieldName = 'SMENA_NUM'
    end
    object qFILIAL_NAME: TStringField
      FieldName = 'FILIAL_NAME'
      Size = 100
    end
    object qFILIAL_NAL_NUM: TStringField
      FieldName = 'FILIAL_NAL_NUM'
      Size = 50
    end
    object qFILIAL_SVID_NUM: TStringField
      FieldName = 'FILIAL_SVID_NUM'
      Size = 50
    end
    object qAZS_ID: TFloatField
      FieldName = 'AZS_ID'
    end
    object qAZS_INST: TFloatField
      FieldName = 'AZS_INST'
    end
    object qAZS_NAME: TStringField
      FieldName = 'AZS_NAME'
      Size = 100
    end
    object qEMP_ID: TFloatField
      FieldName = 'EMP_ID'
    end
    object qEMP_INST: TFloatField
      FieldName = 'EMP_INST'
    end
    object qEMP_NAME: TStringField
      FieldName = 'EMP_NAME'
      Size = 153
    end
    object qLOAD_PRIH_TALON: TStringField
      FieldName = 'LOAD_PRIH_TALON'
      Size = 1
    end
    object qAUTO_LOAD: TStringField
      FieldName = 'AUTO_LOAD'
      Size = 10
    end
    object qRES_COMMENT: TStringField
      FieldName = 'RES_COMMENT'
      Size = 2048
    end
    object qINPUT_METHOD: TStringField
      FieldName = 'INPUT_METHOD'
      Size = 15
    end
    object qRESAVE: TStringField
      FieldName = 'RESAVE'
      Size = 1
    end
    object qOPS_VERSION: TStringField
      FieldName = 'OPS_VERSION'
      Size = 50
    end
    object qDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
    end
    object qOS_USER: TStringField
      FieldName = 'OS_USER'
      Size = 255
    end
    object qMACHINE: TStringField
      FieldName = 'MACHINE'
      Size = 255
    end
    object qUSER_ID: TFloatField
      FieldName = 'USER_ID'
    end
    object qUSER_NAME: TStringField
      FieldName = 'USER_NAME'
      Size = 152
    end
  end
  inherited ADMQ: TOilQuery
    Left = 13
    Top = 96
  end
  inherited PUM: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 172
    Top = 218
    object N1: TMenuItem [0]
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1084#1077#1085#1085#1086#1075#1086' '#1086#1090#1095#1077#1090#1072
      OnClick = N1Click
    end
    object miSrepAdd: TMenuItem [1]
      Caption = #1055#1077#1095#1072#1090#1100' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103' '#1082' '#1089#1084#1077#1085#1085#1086#1084#1091' '#1086#1090#1095#1077#1090#1091
      OnClick = miSrepAddClick
    end
    object N11: TMenuItem [2]
      Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1086#1074'('#1090#1086#1074#1072#1088#1086#1074') '#1080' '#1076#1077#1085#1077#1075
      OnClick = N11Click
    end
    object N7: TMenuItem [3]
      Caption = '-'
    end
    object N3: TMenuItem [4]
      Caption = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1080' '#1087#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      OnClick = N3Click
    end
    object N2: TMenuItem [5]
      Caption = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1080' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084
      OnClick = N2Click
    end
    object N8: TMenuItem [6]
      Caption = '-'
    end
    object N5: TMenuItem [7]
      Caption = #1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1072#1084' ('#1079#1072#1087#1088'. '#1089#1086#1073#1089#1090'. '#1072#1074#1090#1086')'
      Visible = False
      OnClick = N5Click
    end
    object N9: TMenuItem [8]
      Caption = '-'
    end
    object N6: TMenuItem [9]
      Caption = #1042#1099#1074#1086#1076' '#1090#1072#1083#1086#1085#1086#1074' '#1080#1079' '#1087#1091#1090#1080
      OnClick = N6Click
    end
    object N444: TMenuItem
      Caption = '-'
    end
    object miEditAllSR: TMenuItem
      Caption = #1055#1077#1088#1077#1087#1088#1080#1085#1103#1090#1100' '#1074#1089#1077' '#1074#1099#1096#1077' '#1074#1074#1077#1076#1105#1085#1085#1099#1077' '#1089#1084#1077#1085#1085#1099#1077' '#1086#1090#1095#1077#1090#1099'. '#1057#1073#1088#1086#1089' (Ctrl+R)'
      OnClick = miEditAllSRClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object miAutoloadLog: TMenuItem
      Action = actAutoloadLog
    end
    object miShifts: TMenuItem
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1075#1088#1072#1092#1080#1082#1072' '#1079#1072#1084#1077#1088#1086#1074
      ShortCut = 71
      OnClick = miShiftsClick
    end
  end
  inherited ActionList: TActionList
    object actAutoloadLog: TAction
      Caption = #1051#1086#1075' '#1072#1074#1090#1086#1079#1072#1075#1088#1091#1079#1082#1080
      ShortCut = 76
      SecondaryShortCuts.Strings = (
        'Ctrl+DblClick')
      OnExecute = actAutoloadLogExecute
    end
    object actEscSR: TAction
      ShortCut = 16466
      OnExecute = actEscSRExecute
    end
  end
  object RQ5: TOilQuery
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 555
    Top = 200
  end
  object qVed: TOilQuery
    SQL.Strings = (
      
        ' select /*+ORDERED USE_NL(Oil_Vedomost, Oil_Org, Oil_DR_Data, Oi' +
        'l_Rashod, Oil_Part, v_Oil_Dim, Oil_NP_Type)*/'
      '        Org.Name as Org_Name,'
      '        Org.Id_Num,'
      '        NP_Type.Name as NP_Name,'
      '        Oil_Part.Dog as Part,'
      '        Oil_DR_Data.Sub_Part,'
      '        v_Oil_Dim.Name as Dim_Name,'
      '        v_Oil_Dim.IsShtuki,'
      '        Oil_DR_Data.Pr_Ud_Weig as Ud_Weight,'
      '        Oil_Vedomost.Price,'
      '        Oil_Vedomost.Litr,'
      '        Oil_Vedomost.Count_T as Weight,'
      '        Oil_Vedomost.Amount'
      
        '   from Oil_Vedomost, V_Org ORG, Oil_DR_Data, Oil_Rashod, Oil_Pa' +
        'rt, v_Oil_Dim, V_Oil_NP_Type NP_Type'
      '  where Oil_Vedomost.State = '#39'Y'#39
      '    and Oil_DR_Data.State = '#39'Y'#39
      '    and Oil_DR_Data.rep_id = :Id'
      '    and Oil_DR_Data.rep_inst = :Inst'
      '    and Oil_Vedomost.Org_Id = Org.Id'
      '    and Oil_Vedomost.Org_Inst = Org.Inst'
      '    and Oil_Vedomost.SRep_Id = Oil_DR_Data.Id'
      '    and Oil_Vedomost.SRep_Inst = Oil_DR_Data.Inst'
      '    and Oil_DR_Data.TTN_Id = Oil_Rashod.Id'
      '    and Oil_DR_Data.TTN_Inst = Oil_Rashod.Inst'
      '    and Oil_Rashod.Part_Id = Oil_Part.Id'
      '    and Oil_Rashod.Part_Inst = Oil_Part.Inst'
      '    and Oil_Part.Dim_Id = v_Oil_Dim.Id'
      '    and Oil_Part.NP_Type = NP_Type.Id'
      '  order by Org_Name, Id_Num, NP_Name')
    FetchAll = True
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 290
    Top = 166
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Id'
      end
      item
        DataType = ftInteger
        Name = 'Inst'
      end>
  end
  object qDecTal: TOilQuery
    SQL.Strings = (
      
        'select /*+ORDERED USE_NL(Oil_DR_Data, Oil_SRTalon, Oil_Rashod, O' +
        'il_Part, Oil_NP_Type)*/'
      '       NP_Type.Name as NP_Name,'
      '       Oil_Part.Dog as Part,'
      '       Oil_DR_Data.Sub_Part,'
      '       Oil_Part.SS,'
      '       Oil_Rashod.Ud_Weig as Ud_Weight,'
      '       Oil_SRTalon.Ser,'
      '       Oil_SRTalon.Num,'
      
        '       decode(substr(Ser, 3, 1), '#39'0'#39', 5, '#39'1'#39', 10, '#39'2'#39', 20, '#39'3'#39', ' +
        '50, 0) as Nominal,'
      '       Oil_SRTalon.Litr,'
      '       Oil_SRTalon.Count_T as Weight'
      
        '  from Oil_DR_Data, Oil_SRTalon, Oil_Rashod, Oil_Part, V_Oil_NP_' +
        'Type NP_Type'
      ' where Oil_SRTalon.State = '#39'Y'#39
      '   and Oil_DR_Data.Rep_Id = :RepId'
      '   and Oil_DR_Data.Rep_Inst = :RepInst'
      '   and Oil_DR_Data.Id = Oil_SRTalon.SRep_Id'
      '   and Oil_DR_Data.Inst = Oil_SRTalon.SRep_Inst'
      '   and Oil_DR_Data.TTN_Id = Oil_Rashod.Id'
      '   and Oil_DR_Data.TTN_Inst = Oil_Rashod.Inst'
      '   and Oil_Rashod.Part_Id = Oil_Part.Id'
      '   and Oil_Rashod.Part_Inst = Oil_Part.Inst'
      '   and Oil_Part.NP_Type = NP_Type.Id'
      ' order by NP_Name'
      ' ')
    FetchAll = True
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 290
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RepId'
      end
      item
        DataType = ftInteger
        Name = 'RepInst'
      end>
  end
  object qDecTalSum: TOilQuery
    SQL.Strings = (
      'select NP_Name,'
      '       sum(Nominal5) as Nominal5,'
      '       sum(Nominal10) as Nominal10,'
      '       sum(Nominal20) as Nominal20,'
      '       sum(Nominal50) as Nominal50'
      '  from (select /*+ORDERED USE_NL(SRTalon, Oil_NP_Group)*/'
      '         NP_Group.Name as NP_Name,'
      
        '         decode(substr(SRTalon.Ser, 3, 1), '#39'0'#39', 1, 0) as Nominal' +
        '5,         '
      
        '         decode(substr(SRTalon.Ser, 3, 1), '#39'1'#39', 1, 0) as Nominal' +
        '10,'
      
        '         decode(substr(SRTalon.Ser, 3, 1), '#39'2'#39', 1, 0) as Nominal' +
        '20,'
      
        '         decode(substr(SRTalon.Ser, 3, 1), '#39'3'#39', 1, 0) as Nominal' +
        '50'
      
        '          from (select /*+ORDERED USE_NL(Oil_DR_Data, Oil_SRTalo' +
        'n)*/'
      '                 Oil_SRTalon.Ser, Oil_SRTalon.Num'
      '                  from Oil_DR_Data, Oil_SRTalon'
      '                 where Oil_SRTalon.State = '#39'Y'#39
      '                   and Oil_DR_Data.Rep_Id = :RepId'
      '                   and Oil_DR_Data.Rep_Inst = :RepInst'
      '                   and Oil_DR_Data.Id = Oil_SRTalon.SRep_Id'
      '                   and Oil_DR_Data.Inst = Oil_SRTalon.SRep_Inst'
      
        '                 group by Oil_SRTalon.Ser, Oil_SRTalon.Num) SRTa' +
        'lon,'
      '               V_Oil_NP_Group NP_Group'
      '         where decode(substr(SRTalon.Ser, 1, 1),'
      '                      '#39'A'#39','
      '                      decode(length(SRTalon.num), 9, 5, 4),'
      '                      '#39'B'#39', 6,'
      '                      '#39'C'#39', 7,'
      '                      '#39'D'#39', 3,'
      '                      '#39'E'#39', 10,'
      '                      '#39'F'#39', 62,'
      '                      0) = NP_Group.Id)'
      ' group by NP_Name')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 350
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RepId'
      end
      item
        DataType = ftInteger
        Name = 'RepInst'
      end>
  end
  object u: TOraUpdateSQL
    InsertSQL.Strings = (
      'insert into Oil_Daily_Rep'
      '  (ID,'
      '   INST,'
      '   STATE,'
      '   REP_DATE,'
      '   REP_DATE_END,'
      '   SMENA_NUM,'
      '   REP_NUM,'
      '   AZS_ID,'
      '   AZS_INST,'
      '   EMP_ID,'
      '   EMP_INST,'
      '   LOAD_PRIH_TALON,'
      '   AUTO_LOAD,'
      '   RESAVE,'
      '   USER_ID)'
      'values'
      '  (:ID,'
      '   :INST,'
      '   '#39'Y'#39','
      '   :REP_DATE,'
      '   :REP_DATE_END_REAL,'
      '   :SMENA_NUM,'
      '   :REP_NUM,'
      '   :AZS_ID,'
      '   :AZS_INST,'
      '   :EMP_ID,'
      '   :EMP_INST,'
      '   :LOAD_PRIH_TALON,'
      '   :AUTO_LOAD,'
      '   :RESAVE,'
      '   :USER_ID)')
    DeleteSQL.Strings = (
      'update Oil_Daily_Rep'
      '   set STATE = '#39'N'#39
      ' where ID = :OLD_ID'
      '   and INST = :OLD_INST')
    ModifySQL.Strings = (
      'update Oil_Daily_Rep'
      '   set REP_DATE        = :REP_DATE,'
      '       REP_DATE_END    = :REP_DATE_END_REAL,'
      '       SMENA_NUM       = :SMENA_NUM,'
      '       REP_NUM         = :REP_NUM,'
      '       AZS_ID          = :AZS_ID,'
      '       AZS_INST        = :AZS_INST,'
      '       EMP_ID          = :EMP_ID,'
      '       EMP_INST        = :EMP_INST,'
      '       LOAD_PRIH_TALON = :LOAD_PRIH_TALON,'
      '       AUTO_LOAD       = :AUTO_LOAD,'
      '       RESAVE          = :RESAVE,'
      '       USER_ID         = :USER_ID'
      ' where ID = :OLD_ID'
      '   and INST = :OLD_INST')
    Left = 44
    Top = 220
  end
  object qWork: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 55
    Top = 96
  end
  object qSCRashNakl: TOilQuery
    SQL.Strings = (
      
        'select /*+ORDERED USE_NL(Oil_SROther, Oil_Rashod, Oil_Part, Oil_' +
        'NP_Type, Oil_NP_Group)*/'
      '       NP_Type.Name as NPGrp_Name,'
      '       Oil_SROther.SC_Number,'
      '       Oil_SROther.SC_Cheque,'
      '       Oil_SROther.Litr,'
      '       Oil_SROther.Price'
      
        '  from Oil_DR_Data, Oil_SROther, Oil_Rashod, Oil_Part, V_Oil_NP_' +
        'Type NP_Type, V_Oil_NP_Group NP_Group'
      ' where Oil_DR_Data.State = '#39'Y'#39
      '   and Oil_SROther.State = '#39'Y'#39
      '   and Oil_DR_Data.Rep_Id = :Id'
      '   and Oil_DR_Data.Rep_Inst = :Inst'
      '   and Oil_DR_Data.Id = Oil_SROther.SRep_Id'
      '   and Oil_DR_Data.Inst = Oil_SROther.SRep_Inst'
      '   and Oil_SROther.Oper_Id = 40'
      '   and Oil_SROther.SC_Number is not null'
      '   and Oil_DR_Data.TTN_Id = Oil_Rashod.Id'
      '   and Oil_DR_Data.TTN_Inst = Oil_Rashod.Inst'
      '   and Oil_Rashod.Part_Id = Oil_Part.Id'
      '   and Oil_Rashod.Part_Inst = Oil_Part.Inst'
      '   and Oil_Part.NP_Type = NP_Type.Id'
      '   and NP_Type.NP_Grp = NP_Group.Id'
      ' order by NP_Group.Name')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 605
    Top = 261
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Id'
      end
      item
        DataType = ftInteger
        Name = 'Inst'
      end>
  end
  object qVedSum: TOilQuery
    SQL.Strings = (
      
        ' select /*+ORDERED USE_NL(Oil_Vedomost, Oil_DR_Data, Oil_Rashod,' +
        ' Oil_Part, v_Oil_Dim, Oil_NP_Type)*/'
      '        NP_Type.Name as NP_Name,'
      '        v_Oil_Dim.IsShtuki,'
      '        sum(Oil_Vedomost.Litr) as Litr'
      
        '   from Oil_Vedomost, Oil_DR_Data, Oil_Rashod, Oil_Part, v_Oil_D' +
        'im, V_Oil_NP_Type NP_Type'
      '  where Oil_Vedomost.State = '#39'Y'#39
      '    and Oil_DR_Data.State = '#39'Y'#39
      '    and Oil_DR_Data.rep_id = :Id'
      '    and Oil_DR_Data.rep_inst = :Inst'
      '    and Oil_Vedomost.SRep_Id = Oil_DR_Data.Id'
      '    and Oil_Vedomost.SRep_Inst = Oil_DR_Data.Inst'
      '    and Oil_DR_Data.TTN_Id = Oil_Rashod.Id'
      '    and Oil_DR_Data.TTN_Inst = Oil_Rashod.Inst'
      '    and Oil_Rashod.Part_Id = Oil_Part.Id'
      '    and Oil_Rashod.Part_Inst = Oil_Part.Inst'
      '    and Oil_Part.Dim_Id = v_Oil_Dim.Id'
      '    and Oil_Part.NP_Type = NP_Type.Id'
      ''
      '  group by NP_Type.Name, v_Oil_Dim.IsShtuki'
      '  order by NP_Name')
    AutoCalcFields = False
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 350
    Top = 166
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Id'
      end
      item
        DataType = ftInteger
        Name = 'Inst'
      end>
  end
  object TTalon: TTable
    TableName = 'Oil_SRTalonT.DB'
    Left = 128
    Top = 95
  end
  object qRest: TOilQuery
    SQL.Strings = (
      'select *'
      
        '  from (select decode(np_grp, null, np_type_id, np_grp) as np_ty' +
        'pe_id,'
      '               np_grp,'
      '               min(ttn_id) as ttn_id,'
      '               ttn_inst,'
      '               '
      '               nvl(sum(pr_litr), 0) -'
      
        '               nvl(sum(out_nal_litr + out_ved_litr + out_sn_litr' +
        ' + out_litr +'
      '                       out_talon_litr),'
      '                   0) as ost_l,'
      '               nvl(sum(pr_count), 0) -'
      
        '               nvl(sum(out_nal_count + out_ved_count + out_sn_co' +
        'unt +'
      '                       out_count + out_talon_count),'
      '                   0) as ost_t'
      
        '          from (select /*+ORDERED INDEX(drep IDX_OIL_DAYLY_REP_A' +
        'ZS) INDEX(dr I_DR_DATA)*/'
      '                 dr.ttn_id,'
      '                 dr.ttn_inst,'
      '                 npt.id as np_type_id,'
      
        '                 decode(npt.us_subgroup_id, null, npt.np_grp, nu' +
        'll) as np_grp,'
      '                 '
      '                 decode(drep.rep_date, :p_rep_date, 1, 0) *'
      
        '                 decode(dr.oper_type, 0, 1, 0) as IsPrih, -- '#1087#1088#1080 +
        #1093#1086#1076#1080' '#1089#1100#1086#1075#1086#1076#1085#1110
      '                 '
      '                 decode(drep.rep_date, :p_rep_date, 1, 0) *'
      
        '                 decode(dr.oper_type, 1, 1, 2, 1, 0) as IsRash, ' +
        '-- '#1074#1110#1076#1087#1091#1089#1082#1080' '#1089#1100#1086#1075#1086#1076#1085#1110
      '                 '
      '                 nvl(dr.pr_litr, 0) as pr_litr,'
      '                 nvl(dr.pr_count, 0) as pr_count,'
      '                 '
      '                 nvl(dr.out_nal_litr, 0) as out_nal_litr,'
      '                 nvl(dr.out_ved_litr, 0) as out_ved_litr,'
      '                 nvl(dr.out_talon_litr, 0) as out_talon_litr,'
      '                 nvl(out_sn_litr, 0) as out_sn_litr,'
      '                 nvl(out_litr, 0) as out_litr,'
      '                 '
      '                 nvl(dr.out_nal_count, 0) as out_nal_count,'
      '                 nvl(dr.out_ved_count, 0) as out_ved_count,'
      '                 nvl(dr.out_talon_count, 0) as out_talon_count,'
      '                 nvl(out_sn_count, 0) as out_sn_count,'
      '                 nvl(out_count, 0) as out_count'
      '                  from oil_daily_rep drep,'
      '                       oil_dr_data   dr,'
      '                       oil_rashod    r,'
      '                       oil_part      p,'
      '                       v_oil_np_type npt'
      '                 where drep.state = '#39'Y'#39
      '                   and dr.state = '#39'Y'#39
      '                   and r.state = '#39'Y'#39
      '                   and p.state = '#39'Y'#39
      '                      '
      '                   and drep.id = dr.rep_id'
      '                   and drep.inst = dr.rep_inst'
      '                      '
      '                   and dr.ttn_id = r.id'
      '                   and dr.ttn_inst = r.inst'
      '                      '
      '                   and r.part_id = p.id'
      '                   and r.part_inst = p.inst'
      '                      '
      '                   and p.np_type = npt.id'
      '                      '
      '                   and drep.azs_id = :p_azs_id'
      '                   and drep.azs_inst = :p_azs_id'
      '                      '
      '                   and ((trunc(drep.rep_date) <'
      '                       to_date(:p_rep_date, '#39'dd.mm.yyyy'#39')) or'
      '                       (trunc(drep.rep_date) ='
      '                       to_date(:p_rep_date, '#39'dd.mm.yyyy'#39') and'
      '                       smena_num < :p_smena_num)))'
      
        '         group by decode(np_grp, null, np_type_id, np_grp), np_g' +
        'rp, ttn_inst)'
      ' where ttn_id = :p_ttn_id'
      '   and ttn_inst = :p_ttn_inst')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 435
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_rep_date'
      end
      item
        DataType = ftUnknown
        Name = 'p_azs_id'
      end
      item
        DataType = ftUnknown
        Name = 'p_smena_num'
      end
      item
        DataType = ftUnknown
        Name = 'p_ttn_id'
      end
      item
        DataType = ftUnknown
        Name = 'p_ttn_inst'
      end>
  end
  object pmAdd: TPopupMenu
    Left = 6
    Top = 276
    object miAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1088#1091#1095#1085#1091#1102
      OnClick = sbAddClick
    end
    object miAutoLoad: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089' '#1087#1072#1087#1082#1080'/FTP'
      OnClick = miAutoLoadClick
    end
  end
  object qDel: TOilQuery
    SQL.Strings = (
      'begin'
      '  for r in (select *'
      '              from v_exe_foreign_keys'
      '             where table_to = '#39'OIL_DAILY_REP'#39
      '               and from1 = '#39'REP_ID'#39
      '               and from2 = '#39'REP_INST'#39') loop'
      '    execute immediate '#39'update '#39' || r.table_from ||'
      
        '                      '#39' set state = '#39#39'N'#39#39' where state = '#39#39'Y'#39#39' an' +
        'd rep_id = '#39' ||'
      
        '                      :rep_id || '#39' and rep_inst = '#39' || :rep_inst' +
        ';'
      '  end loop;'
      'end;')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 87
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rep_id'
      end
      item
        DataType = ftUnknown
        Name = 'rep_inst'
      end>
  end
  object qFast: TOilQuery
    SQL.Strings = (
      'select /*+ORDERED INDEX(dr IDX_OIL_DAYLY_REP_AZS)*/'
      ' dr.*,'
      ' to_date('#39'01.01.1990'#39') as REP_DATE_END_REAL,'
      ' azs.name as azs_name,'
      ' fil.name as filial_name,'
      ' fil.nal_num as filial_nal_num,'
      ' fil.svid_num as filial_svid_num,'
      ' '#39#39' as EMP_NAME,'
      ' '#39#39' as res_comment,'
      ' decode(substr(nvl(dr.auto_load, '#39'H'#39'), 1, 1),'
      '        '#39'H'#39','
      '        '#39#1042#1088#1091#1095#1085#1091#1102#39','
      '        '#39'P'#39','
      '        '#39#1055#1072#1082#1077#1090#39','
      '        '#39'Y'#39','
      '        '#39'dbf-'#1092#1072#1081#1083#39') ||'
      
        ' decode(instr(nvl(dr.auto_load, '#39'H'#39'), '#39'E'#39'), 0, null, '#39' ('#1088#1077#1076'.)'#39') ' +
        'as input_method,'
      ' '#39#39' as ops_version,'
      ' dr.os_user,'
      ' dr.machine,'
      ' '#39#39' as user_name'
      '  from oil_daily_rep dr, v_org azs, v_org fil'
      ' where dr.state = '#39'Y'#39
      '      '
      '   and dr.azs_id = azs.id'
      '   and dr.azs_inst = azs.inst'
      '      '
      '   and azs.par = fil.id'
      '   and azs.par_inst = fil.inst'
      '      '
      '   and ((trunc(dr.rep_date) = to_date(:p_date, '#39'dd.mm.yyyy'#39')) or'
      '       (:p_date is null))'
      '   and ((dr.azs_id = :p_azs_id and dr.azs_inst = :p_azs_id) or'
      '       (:p_azs_id = 0))'
      '   and ((azs.par = :p_par_id and azs.par_inst = :p_par_id) or'
      '       (:p_par_id = 0))'
      '   and ((dr.emp_id = :p_emp_id and dr.emp_inst = :p_emp_inst) or'
      '       (:p_emp_id = 0))'
      ' order by trunc(nvl(dr.rep_date, to_date('#39'01.01.1990'#39'))) desc,'
      '          fil.name,'
      '          to_number(substr(azs.name,'
      '                           instr(azs.name, '#39#8470#39') + 1,'
      
        '                           instr(translate(azs.name, '#39'/'#39', '#39' '#39') |' +
        '| '#39' '#39','
      '                                 '#39' '#39','
      '                                 instr(azs.name, '#39#8470#39')) -'
      '                           instr(azs.name, '#39#8470#39') - 1)),'
      '          azs.name,'
      '          dr.rep_date desc')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 80
    Top = 220
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p_date'
      end
      item
        DataType = ftInteger
        Name = 'p_azs_id'
      end
      item
        DataType = ftInteger
        Name = 'p_par_id'
      end
      item
        DataType = ftInteger
        Name = 'p_emp_id'
      end
      item
        DataType = ftInteger
        Name = 'p_emp_inst'
      end>
  end
  object qSlow: TOilQuery
    SQL.Strings = (
      'select /*+ORDERED INDEX(dr IDX_OIL_DAYLY_REP_AZS)*/'
      ' dr.*,'
      ' nvl(dr.rep_date_end,'
      
        '     nvl(lead(dr.rep_date) over(partition by dr.azs_id order by ' +
        'dr.rep_date) -'
      '         1 / (24 * 60 * 60),'
      '         trunc(dr.rep_date) + 1)) as rep_date_end_real,'
      ' azs.name as azs_name,'
      ' fil.name as filial_name,'
      ' fil.nal_num as filial_nal_num,'
      ' fil.svid_num as filial_svid_num,'
      
        ' e.f_name || '#39' '#39' || e.i_name || '#39' '#39' || e.o_name || '#39' '#39' as emp_na' +
        'me,'
      ' a.res_comment as res_comment,'
      ' decode(substr(nvl(dr.auto_load, '#39'H'#39'), 1, 1),'
      '        '#39'H'#39','
      '        '#39#1042#1088#1091#1095#1085#1091#1102#39','
      '        '#39'P'#39','
      '        '#39#1055#1072#1082#1077#1090#39','
      '        '#39'Y'#39','
      '        '#39'dbf-'#1092#1072#1081#1083#39') ||'
      
        ' decode(instr(nvl(dr.auto_load, '#39'H'#39'), '#39'E'#39'), 0, null, '#39' ('#1088#1077#1076'.)'#39') ' +
        'as input_method,'
      ' v.ops_version,'
      ' dr.os_user,'
      ' dr.machine,'
      ' u.user_name'
      '  from oil_daily_rep dr,'
      '       v_org azs,'
      '       v_org fil,'
      '       exch_receive_azs a,'
      '       ( /*'#1042#1077#1088#1089#1110#1111' OPS*/'
      '        select v.rep_id, v.rep_inst, v.value as ops_version'
      '          from oil_azs_versions v'
      '         where v.state = '#39'Y'#39
      '           and upper(v.paramname) = '#39'OPS_PRODUCT_VERSION'#39') v,'
      '       oil_employ e,'
      '       ( /*'#1050#1086#1088#1080#1089#1090#1091#1074#1072#1095' OIL*/'
      '        select u.id,'
      
        '                nvl(trim(e.f_name || '#39' '#39' || e.i_name || '#39' '#39' || e' +
        '.o_name),'
      '                    u.u_name) as user_name'
      '          from adm_users u, oil_employ e'
      '         where e.state(+) = '#39'Y'#39
      '           and u.emp_id = e.id(+)'
      '           and u.emp_inst = e.inst(+)) u'
      ' where dr.state = '#39'Y'#39
      '   and a.state(+) = '#39'Y'#39
      '   and a.exch_type(+) = 1'
      '      '
      '   and dr.id = a.rep_id(+)'
      '   and dr.inst = a.rep_inst(+)'
      '      '
      '   and dr.id = v.rep_id(+)'
      '   and dr.inst = v.rep_inst(+)'
      '      '
      '   and dr.azs_id = azs.id'
      '   and dr.azs_inst = azs.inst'
      '      '
      '   and azs.par = fil.id'
      '   and azs.par_inst = fil.inst'
      '      '
      '   and dr.emp_id = e.id(+)'
      '   and dr.emp_inst = e.inst(+)'
      '      '
      '   and dr.user_id = u.id(+)'
      '      '
      '   and ((trunc(dr.rep_date) = to_date(:p_date, '#39'dd.mm.yyyy'#39')) or'
      '       (:p_date is null))'
      '   and ((dr.azs_id = :p_azs_id and dr.azs_inst = :p_azs_id) or'
      '       (:p_azs_id = 0))'
      '   and ((azs.par = :p_par_id and azs.par_inst = :p_par_id) or'
      '       (:p_par_id = 0))'
      '   and ((dr.emp_id = :p_emp_id and dr.emp_inst = :p_emp_inst) or'
      '       (:p_emp_id = 0))'
      ' order by trunc(nvl(dr.rep_date, to_date('#39'01.01.1990'#39'))) desc,'
      '          fil.name,'
      '          to_number(substr(azs.name,'
      '                           instr(azs.name, '#39#8470#39') + 1,'
      
        '                           instr(translate(azs.name, '#39'/'#39', '#39' '#39') |' +
        '| '#39' '#39','
      '                                 '#39' '#39','
      '                                 instr(azs.name, '#39#8470#39')) -'
      '                           instr(azs.name, '#39#8470#39') - 1)),'
      '          azs.name,'
      '          dr.rep_date desc')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 80
    Top = 172
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p_date'
      end
      item
        DataType = ftInteger
        Name = 'p_azs_id'
      end
      item
        DataType = ftInteger
        Name = 'p_par_id'
      end
      item
        DataType = ftInteger
        Name = 'p_emp_id'
      end
      item
        DataType = ftInteger
        Name = 'p_emp_inst'
      end>
  end
end
