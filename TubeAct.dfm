inherited TubeActForm: TTubeActForm
  Left = 424
  Top = 526
  VertScrollBar.Range = 0
  AutoScroll = False
  Caption = #1040#1082#1090#1099
  ClientHeight = 296
  ClientWidth = 697
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited pBottom: TPanel
    Top = 263
    Width = 697
    inherited pBtn: TPanel
      Left = 500
      inherited bbOk: TBitBtn
        Left = 12
      end
      inherited bbCancel: TBitBtn
        Left = 103
      end
    end
    object Panel1: TPanel
      Left = 30
      Top = 2
      Width = 28
      Height = 29
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object sbDel: TSpeedButton
        Left = 2
        Top = 1
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
        OnClick = sbDelClick
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 28
      Height = 29
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      object sbAdd: TSpeedButton
        Left = 2
        Top = 1
        Width = 25
        Height = 25
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100
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
        ParentShowHint = False
        ShowHint = True
        OnClick = sbAddClick
      end
    end
  end
  object pData: TPanel [1]
    Left = 0
    Top = 0
    Width = 697
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 11
      Top = 7
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = #1040#1082#1090' '#8470
    end
    object Label3: TLabel
      Left = 123
      Top = 7
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1072#1090#1072
    end
    object pShare: TPanel
      Left = 359
      Top = 89
      Width = 362
      Height = 24
      BevelOuter = bvNone
      TabOrder = 0
      Visible = False
      object sbShare: TSpeedButton
        Left = 337
        Top = 0
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
      end
    end
    object eActNum: TEdit
      Left = 48
      Top = 6
      Width = 65
      Height = 21
      Color = clSilver
      ReadOnly = True
      TabOrder = 1
    end
    object eDate: TEdit
      Left = 156
      Top = 6
      Width = 67
      Height = 21
      Color = clSilver
      ReadOnly = True
      TabOrder = 2
      OnChange = eDateChange
    end
  end
  object grTube: TDBGridEh [2]
    Left = 0
    Top = 33
    Width = 697
    Height = 230
    Align = alClient
    Anchors = [akLeft, akRight, akBottom]
    AutoFitColWidths = True
    DataGrouping.GroupLevels = <>
    DataSource = dslisttube
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = 16704226
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    OddRowColor = clWindow
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ParentFont = False
    PopupMenu = PUM
    RowDetailPanel.Color = clBtnFace
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = cl3DDkShadow
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnExit = grTubeExit
    OnMouseMove = grTubeMouseMove
    OnSortMarkingChanged = grTubeSortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'LAYER_NAME'
        Footer.Color = clSilver
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clInfoText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = []
        Footer.Value = #1042#1089#1077#1075#1086' '#1087#1086' '#1053#1055':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #8470#1055#1086#1079#1080#1094#1080#1080
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 83
      end
      item
        EditButtons = <>
        FieldName = 'NP_GRP_NAME'
        Footer.Color = clSilver
        Footers = <
          item
            Color = clSilver
            FieldName = 'NP_GRP_NAME'
            ValueType = fvtStaticText
          end>
        PickList.Strings = (
          #1044#1080#1079#1077#1083#1100#1085#1086#1077' '#1090#1086#1087#1083#1080#1074#1086' '#1051' 0,2-62'
          #1041#1077#1085#1079#1080#1085' '#1040'-80 '#1085'/'#1077
          #1041#1077#1085#1079#1080#1085' '#1040'-92 '#1085'/'#1077
          #1041#1077#1085#1079#1080#1085' '#1040'-95 '#1085'/'#1077
          #1060#1088#1072#1082#1094#1080#1103' '#1083#1077#1075#1082#1072#1103)
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087' '#1053#1055
        Title.TitleButton = True
        Width = 112
      end
      item
        DisplayFormat = '0,'
        EditButtons = <>
        FieldName = 'MAX_VOLUME'
        Footer.Color = clSilver
        Footer.DisplayFormat = '0,'
        Footer.ValueType = fvtSum
        Footers = <
          item
            Color = clSilver
            DisplayFormat = '0,'
            FieldName = 'MAX_VOLUME'
            ValueType = fvtStaticText
          end>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1054#1073#1098#1077#1084' ['#1083']'
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'TANK_REST'
        Footer.Color = clSilver
        Footer.Value = 'kk'
        Footer.ValueType = fvtStaticText
        Footers = <
          item
            Color = clSilver
            DisplayFormat = '0,'
            FieldName = 'TANK_REST'
            ValueType = fvtStaticText
          end>
        Title.Alignment = taCenter
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082' ['#1083']'
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'NOTES'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1052#1077#1089#1090#1086#1087#1086#1083#1086#1078#1077#1085#1080#1077' '#1091#1095#1072#1089#1090#1082#1072
        Title.TitleButton = True
        Width = 99
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT_'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
        Title.TitleButton = True
        Width = 119
      end
      item
        EditButtons = <>
        FieldName = 'DATE_CHANGE'
        Footers = <>
        ReadOnly = True
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'PIPELINE_VALVE'
        Footers = <>
        PickList.Strings = (
          #1045#1089#1090#1100
          #1053#1077#1090)
        Title.Caption = #1047#1072#1076#1074#1080#1078#1082#1072
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  inherited q: TOilQuery
    Left = 664
    Top = 3
  end
  object dslisttube: TOraDataSource
    DataSet = qTube
    OnDataChange = dslisttubeDataChange
    Left = 415
    Top = 2
  end
  object qTube: TOraQuery
    SQLInsert.Strings = (
      'INSERT INTO TUBE_ACT'
      '  (ID,'
      '   INST,'
      '   STATE,'
      '   LAYER_NAME,'
      '   COLOR,'
      '   NP_ID,'
      '   CONDITION,'
      '   MAX_VOLUME,'
      '   TANK_REST,'
      '   PIPELINE_VALVE,'
      '   DATE_CHANGE,'
      '   NOTES,'
      '   COMMENT_,'
      '   LAYER_NAME_CAD,'
      '   ACT_NUM,'
      '   LAYER_NAME_CAD_EXIST)'
      'VALUES'
      '  (:ID,'
      '   :INST,'
      '   '#39'Y'#39','
      '   :layer_name,'
      '   :color,'
      '   :np_id,'
      '   1,'
      '   :max_volume,'
      '   :tank_rest,'
      '   :pipeline_valve,'
      '   :date_change,'
      '   :notes,'
      '   :comment_,'
      '   :layer_name_cad,'
      '   :act_num,'
      '   '#39'Y'#39')'
      
        'RETURNING ID, INST, LAYER_NAME, COLOR, NP_ID, MAX_VOLUME, TANK_R' +
        'EST,PIPELINE_VALVE,DATE_CHANGE, NOTES, COMMENT_, LAYER_NAME_CAD,' +
        ' ACT_NUM INTO :ID, :INST, :LAYER_NAME, :COLOR, :NP_ID, :MAX_VOLU' +
        'ME, :TANK_REST, :PIPELINE_VALVE, :DATE_CHANGE, :NOTES, :COMMENT_' +
        ', :LAYER_NAME_CAD, :ACT_NUM')
    SQLUpdate.Strings = (
      'UPDATE TUBE_ACT'
      'SET'
      
        '  LAYER_NAME = :LAYER_NAME, COLOR = :COLOR, NP_ID = :NP_ID, MAX_' +
        'VOLUME = :MAX_VOLUME, TANK_REST = :TANK_REST, PIPELINE_VALVE = :' +
        'PIPELINE_VALVE, DATE_CHANGE = :DATE_CHANGE, NOTES = :NOTES, COMM' +
        'ENT_ = :COMMENT_, LAYER_NAME_CAD = :LAYER_NAME_CAD, ACT_NUM = :A' +
        'CT_NUM'
      'WHERE'
      '  ID = :Old_ID AND INST = :Old_INST'
      'RETURNING'
      
        '  LAYER_NAME, COLOR, NP_ID, MAX_VOLUME, TANK_REST, PIPELINE_VALV' +
        'E, DATE_CHANGE, NOTES, COMMENT_, LAYER_NAME_CAD, ACT_NUM'
      'INTO'
      
        '  :LAYER_NAME, :COLOR, :NP_ID, :MAX_VOLUME, :TANK_REST, :PIPELIN' +
        'E_VALVE, :DATE_CHANGE, :NOTES, :COMMENT_, :LAYER_NAME_CAD, :ACT_' +
        'NUM')
    SQLRefresh.Strings = (
      
        'SELECT ID, INST, STATE, LAYER_NAME, COLOR, NP_ID, CONDITION, MAX' +
        '_VOLUME, TANK_REST, DATE_CHANGE, DATE_MOD, NOTES, COMMENT_, LAYE' +
        'R_NAME_CAD, ACT_NUM, LAYER_NAME_CAD_EXIST FROM TUBE_ACT'
      'WHERE'
      '  ID = :ID AND INST = :INST')
    SQL.Strings = (
      'select t.id,'
      '       t.inst,       '
      '       t.layer_name,'
      '       t.layer_name_cad,'
      '       t.color,'
      '       t.np_id,'
      '       t.tank_rest,'
      '       t.max_volume,'
      '       t.notes,'
      '       t.comment_,'
      '       t.date_change,'
      '       t.act_num,'
      '       t.pipeline_valve,'
      '       tt.name as name_np,'
      '       tt.name_rus as np_grp_name,'
      
        '       max(t.act_num) over(PARTITION BY t.layer_name) as maxn,  ' +
        '     '
      
        '       sum(t.tank_rest) OVER(PARTITION BY t.color) as SumTankRes' +
        't,'
      
        '       sum(t.max_volume) OVER(PARTITION BY t.color) as SumTankVa' +
        'l    '
      '  from tube_act t, v_oil_np_type tt'
      ' where (t.date_change >= :date_begin or :date_begin is null)'
      '   and (t.date_change <= :date_end or :date_end is null)'
      '   and (t.act_num = :act_num or :act_num is null) '
      '   and (t.id = :id or :id is null)  '
      '   and (t.tank_rest = :tank_rest or :tank_rest is null) '
      '   and (t.layer_name = :layer_name or :layer_name is null)'
      '   and t.State = '#39'Y'#39
      '   and t.np_id > 0'
      '   and t.np_id = tt.id(+)'
      ' group by t.id,'
      '          t.inst,          '
      '          t.layer_name,'
      '          t.layer_name_cad,'
      '          t.color,'
      '          t.np_id,'
      '          t.tank_rest,'
      '          t.max_volume,'
      '          t.notes,'
      '          t.comment_,'
      '          t.date_change,'
      '          t.act_num,'
      '          t.pipeline_valve,'
      '          tt.name,'
      '          tt.name_rus '
      ' order by tt.name_rus,to_number(t.layer_name)')
    RefreshOptions = [roAfterUpdate]
    BeforePost = qTubeBeforePost
    AfterPost = qTubeAfterPost
    Left = 448
    Top = 1
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date_begin'
        ParamType = ptInputOutput
      end
      item
        DataType = ftDateTime
        Name = 'date_end'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'act_num'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'tank_rest'
        ParamType = ptInputOutput
      end
      item
        DataType = ftWideString
        Name = 'layer_name'
        ParamType = ptInputOutput
      end>
    object qTubeID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qTubeINST: TFloatField
      FieldName = 'INST'
      Required = True
    end
    object qTubeLAYER_NAME: TStringField
      FieldName = 'LAYER_NAME'
      OnChange = qTubeLAYER_NAMEChange
      Size = 255
    end
    object qTubeLAYER_NAME_CAD: TStringField
      FieldName = 'LAYER_NAME_CAD'
      Size = 255
    end
    object qTubeCOLOR: TStringField
      FieldName = 'COLOR'
      Size = 15
    end
    object qTubeNP_ID: TFloatField
      FieldName = 'NP_ID'
    end
    object qTubeTANK_REST: TFloatField
      FieldName = 'TANK_REST'
    end
    object qTubeMAX_VOLUME: TFloatField
      FieldName = 'MAX_VOLUME'
    end
    object qTubeNOTES: TStringField
      FieldName = 'NOTES'
      Size = 150
    end
    object qTubeCOMMENT_: TStringField
      FieldName = 'COMMENT_'
      Size = 150
    end
    object qTubeDATE_CHANGE: TDateTimeField
      FieldName = 'DATE_CHANGE'
      Required = True
    end
    object qTubeNAME_NP: TStringField
      FieldName = 'NAME_NP'
      Size = 255
    end
    object qTubeNP_GRP_NAME: TStringField
      FieldName = 'NP_GRP_NAME'
      OnChange = qTubeNP_GRP_NAMEChange
      Size = 255
    end
    object qTubeACT_NUM: TFloatField
      FieldName = 'ACT_NUM'
    end
    object qTubePIPELINE_VALVE: TStringField
      FieldName = 'PIPELINE_VALVE'
    end
    object qTubeSumTankRest: TFloatField
      FieldName = 'SUMTANKREST'
    end
    object qTubeSUMTANKVAL: TFloatField
      FieldName = 'SUMTANKVAL'
    end
  end
  object PUM: TPopupMenu
    Left = 384
    Top = 152
    object MI1: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      OnClick = MI2Click
    end
  end
end
