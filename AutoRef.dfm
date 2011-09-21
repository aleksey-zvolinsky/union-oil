inherited AutoRefForm: TAutoRefForm
  Left = 287
  Top = 275
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'- '#1040#1074#1090#1086#1084#1086#1073#1080#1083#1080' '#1080' '#1090#1077#1093'. '#1089#1088#1077#1076#1089#1090#1074#1072
  ClientHeight = 393
  ClientWidth = 752
  Constraints.MinHeight = 420
  Constraints.MinWidth = 760
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 360
    Width = 752
    inherited Panel3: TPanel
      Left = 555
      inherited bbOk: TBitBtn
        Left = 11
      end
    end
    inherited PAdd: TPanel
      Width = 44
      inherited sbAdd: TSpeedButton
        Left = 0
        Visible = False
        OnClick = sbAddClick
      end
      object RxSpeedButton1: TRxSpeedButton
        Left = 2
        Top = 2
        Width = 37
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
      Left = 46
    end
    inherited pDel: TPanel
      Left = 76
      inherited sbDel: TSpeedButton
        Left = 3
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      Left = 156
      inherited bbClear: TBitBtn
        Left = 4
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        Left = 91
        OnClick = bbSearchClick
      end
    end
    inherited pPrint: TPanel
      Left = 106
    end
    inherited pTotal: TPanel
      Left = 322
    end
    inherited pSpeedUp: TPanel
      Left = 352
    end
    inherited pShowDetail: TPanel
      Left = 382
      Width = 173
      Visible = True
    end
  end
  inherited Panel2: TPanel
    Width = 752
    Height = 55
    object Label1: TLabel
      Left = 6
      Top = 8
      Width = 60
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1072#1074#1090#1086
    end
    object Label2: TLabel
      Left = 171
      Top = 8
      Width = 48
      Height = 13
      Caption = #1042#1086#1076#1080#1090#1077#1083#1100
    end
    object Label3: TLabel
      Left = 568
      Top = 8
      Width = 22
      Height = 13
      Caption = #1040#1058#1055
    end
    object Label4: TLabel
      Left = 364
      Top = 8
      Width = 19
      Height = 13
      Caption = #1058#1080#1087
    end
    object SpeedButton2: TSpeedButton
      Left = 530
      Top = 4
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
    object lblInst: TLabel
      Left = 6
      Top = 34
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = #1043#1076#1077' '#1079#1072#1074#1077#1076#1077#1085
    end
    object sbClearInst: TSpeedButton
      Left = 337
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
      OnClick = sbClearInstClick
    end
    object edNumb: TEdit
      Left = 76
      Top = 5
      Width = 76
      Height = 21
      TabOrder = 0
    end
    object edDriver: TEdit
      Left = 224
      Top = 5
      Width = 111
      Height = 21
      TabOrder = 1
    end
    object edATP: TEdit
      Left = 595
      Top = 5
      Width = 151
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object leType: TRxLookupEdit
      Left = 385
      Top = 5
      Width = 144
      Height = 21
      DropDownCount = 16
      LookupField = 'TYPE_NAME'
      LookupSource = dsType
      DirectInput = False
      TabOrder = 2
      OnCloseUp = bbSearchClick
    end
    object edInst: TComboEdit
      Left = 76
      Top = 30
      Width = 260
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = edInstButtonClick
      OnDblClick = edInstButtonClick
    end
  end
  inherited pBase: TPanel
    Top = 65
    Width = 602
    Height = 295
    inherited SplitterDetail: TSplitter
      Top = 240
      Width = 602
    end
    inherited DBGrid1: TDBGridEh
      Width = 602
      Height = 240
      ReadOnly = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NUMB'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084#1077#1088' '#1072#1074#1090#1086
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'FULLNAME'
          Footers = <>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'AUTO_TYPE_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1058#1080#1087
          Width = 140
        end
        item
          EditButtons = <>
          FieldName = 'AUTO_GROUP_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1043#1088#1091#1087#1087#1072
          Width = 140
        end
        item
          EditButtons = <>
          FieldName = 'AUTO_MODEL'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1052#1072#1088#1082#1072
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'CAPACITY'
          Footers = <>
          Title.Alignment = taCenter
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'ATP'
          Footers = <>
          Title.Alignment = taCenter
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'DEP_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1043#1076#1077' '#1079#1072#1074#1077#1076#1077#1085
          Width = 140
        end>
    end
    inherited pDetail: TPanel
      Top = 243
      Width = 602
      inherited DBGridDetail: TDBGridEh
        Width = 602
        ReadOnly = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'POSITION'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1055#1086#1079#1080#1094#1080#1103
          end
          item
            EditButtons = <>
            FieldName = 'CAPACITY'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1054#1073#1098#1077#1084
            Width = 87
          end>
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 752
    inherited pnlTuneGridBtn: TPanel
      Left = 723
    end
  end
  inherited PanelCol: TPanel
    Left = 602
    Top = 65
    Height = 295
    inherited cbCol: TRxCheckListBox
      Height = 267
    end
    inherited pRefresh: TPanel
      Top = 269
    end
  end
  inherited ds: TOraDataSource
    Left = 165
    Top = 110
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select distinct *'
      '  from (select a.*,'
      
        '               e.f_name || '#39' '#39' || substr(trim(e.i_name), 1, 1) |' +
        '|'
      
        '               decode(substr(trim(e.i_name), 1, 1), null, '#39#39', '#39'.' +
        #39') ||'
      '               substr(trim(e.o_name), 1, 1) ||'
      
        '               decode(substr(trim(e.o_name), 1, 1), null, '#39#39', '#39'.' +
        #39') as fullname,'
      '               atp.name as auto_type_name,'
      '               ag.name as auto_group_name,'
      '               ag.id as auto_group_id,'
      '               oo.name as dep_name,'
      '               decode(ad.id, null, 0, 1) as is_have_det'
      '          from oil_auto        a,'
      '               oil_employ      e,'
      '               oil_auto_type   atp,'
      '               oil_auto_group  ag,'
      '               v_org           oo,'
      '               oil_auto_detail ad'
      '         where a.state = '#39'Y'#39
      '           and e.state(+) = '#39'Y'#39
      '           and ad.state(+) = '#39'Y'#39
      '           and a.id = ad.auto_id(+)'
      '           and a.inst = ad.auto_inst(+)'
      '           and a.employ_id = e.id(+)'
      '           and a.employ_inst = e.inst(+)'
      '           and a.auto_type_id = atp.id(+)'
      '           and atp.auto_group = ag.id(+)'
      '           and a.inst = oo.id'
      '           and oo.id = oo.inst)'
      ' where (upper(numb) like upper('#39'%'#39' || :numb || '#39'%'#39') or'
      '       numb is null and :numb is null)'
      '   and (upper(atp) like upper('#39'%'#39' || :atp || '#39'%'#39') or'
      '       atp is null and :atp is null)'
      '   and (auto_type_id = :type_id or :type_id is null)'
      '   and (upper(fullname) like upper('#39'%'#39' || :driver || '#39'%'#39') or'
      '       fullname is null and :driver is null)'
      '   and (inst = :inst or :inst is null)'
      ' order by numb')
    CachedUpdates = True
    UpdateObject = uq
    AfterPost = qAfterPost
    AfterDelete = qAfterPost
    Left = 159
    Top = 118
    ParamData = <
      item
        DataType = ftString
        Name = 'numb'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'atp'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'type_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'driver'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
    object qID: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'ID'
      Origin = 'V_OIL_AUTO.ID'
    end
    object qINST: TFloatField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'INST'
      Origin = 'V_OIL_AUTO.INST'
    end
    object qNUMB: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1072#1074#1090#1086'.'
      FieldName = 'NUMB'
      Origin = 'V_OIL_AUTO.NUMB'
      Size = 12
    end
    object qATP: TStringField
      DisplayLabel = #1040#1058#1055
      FieldName = 'ATP'
      Origin = 'V_OIL_AUTO.ATP'
      Size = 50
    end
    object qCAPACITY: TFloatField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'CAPACITY'
      Origin = 'V_OIL_AUTO.CAPACITY'
    end
    object qAUTO_MODEL: TStringField
      DisplayLabel = #1052#1072#1088#1082#1072' '#1072#1074#1090#1086
      FieldName = 'AUTO_MODEL'
      Size = 50
    end
    object qEMPLOY_ID: TFloatField
      FieldName = 'EMPLOY_ID'
      Origin = 'OIL_AUTO.EMPLOY_ID'
    end
    object qEMPLOY_INST: TFloatField
      FieldName = 'EMPLOY_INST'
      Origin = 'OIL_AUTO.EMPLOY_INST'
    end
    object qSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'OIL_AUTO.STATE'
      Size = 1
    end
    object qFULLNAME: TStringField
      DisplayLabel = #1042#1086#1076#1080#1090#1077#1083#1100
      FieldName = 'FULLNAME'
      Size = 55
    end
    object qAUTO_TYPE_ID: TFloatField
      FieldName = 'AUTO_TYPE_ID'
    end
    object qAUTO_TYPE_NAME: TStringField
      FieldName = 'AUTO_TYPE_NAME'
      Size = 100
    end
    object qAUTO_GROUP_NAME: TStringField
      FieldName = 'AUTO_GROUP_NAME'
      Size = 100
    end
    object qAUTO_GROUP_ID: TFloatField
      FieldName = 'AUTO_GROUP_ID'
    end
    object qDEP_NAME: TStringField
      FieldName = 'DEP_NAME'
      Size = 100
    end
    object qAUTO_TYPE: TStringField
      FieldName = 'AUTO_TYPE'
      Size = 100
    end
    object qDRIVER: TStringField
      FieldName = 'DRIVER'
      Size = 50
    end
    object qIS_HAVE_DET: TFloatField
      FieldName = 'IS_HAVE_DET'
    end
  end
  inherited ADMQ: TOilQuery
    Left = 16
    Top = 200
  end
  inherited PUM: TPopupMenu
    Left = 416
    Top = 176
  end
  inherited ActionList: TActionList
    Left = 416
    Top = 223
  end
  inherited qDetail: TOilQuery
    SQL.Strings = (
      'select POSITION, capacity'
      '  from oil_auto_detail d'
      ' where state = '#39'Y'#39
      '   and auto_id = :id'
      '   and auto_inst = :inst'
      ' order by POSITION')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
  object uq: TOraUpdateSQL
    InsertSQL.Strings = (
      'insert into OIL_AUTO'
      
        '  (ID, STATE, INST, NUMB, ATP, CAPACITY, AUTO_TYPE_ID, AUTO_MODE' +
        'L, '
      'EMPLOY_ID, EMPLOY_INST)'
      'values'
      
        '  (:ID,  '#39'Y'#39', :INST, :NUMB, :ATP, :CAPACITY, :AUTO_TYPE_ID, :AUT' +
        'O_MODEL, '
      ':EMPLOY_ID, :EMPLOY_INST)')
    DeleteSQL.Strings = (
      'update OIL_AUTO'
      'set STATE = '#39'N'#39
      'where ID = :OLD_ID '
      '    and INST = :OLD_INST')
    ModifySQL.Strings = (
      'update OIL_AUTO'
      'set'
      '  NUMB = :NUMB,'
      '  ATP = :ATP,'
      '  CAPACITY = :CAPACITY,'
      '  AUTO_TYPE_ID = :AUTO_TYPE_ID,'
      '  AUTO_MODEL = :AUTO_MODEL,'
      '  EMPLOY_ID = :EMPLOY_ID,'
      '  EMPLOY_INST = :EMPLOY_INST'
      'where'
      '  ID = :OLD_ID and'
      '  INST = :OLD_INST')
    Left = 195
    Top = 110
  end
  object qWork: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 127
    Top = 200
  end
  object qCheckDelete: TOilQuery
    SQL.Strings = (
      ' select '#39'^'#39
      '   from v_Card_Transaction'
      '  where Auto_id = :id'
      '    and Auto_inst = :inst'
      ''
      '  union all'
      ''
      ' select '#39'^'#39
      '   from Oil_SROther'
      '  where State = '#39'Y'#39
      '    and Auto_id = :id'
      '    and Auto_inst = :inst'
      ''
      '  union all'
      ''
      ' select '#39'^'#39
      '   from Oil_Talon_Data'
      '  where State = '#39'Y'#39
      '    and Auto_id = :id'
      '    and Auto_inst = :inst'
      ''
      '  union all'
      ''
      ' select '#39'^'#39
      '   from Oil_Rashod'
      '  where State = '#39'Y'#39
      '    and Auto_id = :id'
      '    and Auto_inst = :inst'
      ''
      '  union all'
      ''
      ' select '#39'^'#39
      '   from Oil_Rash_Det'
      '  where State = '#39'Y'#39
      '    and Auto_Id = :Id'
      '    and Auto_Inst = :Inst'
      ''
      '  union all'
      ''
      ' select '#39'^'#39
      '   from Oil_Prih_Det'
      '  where State = '#39'Y'#39
      '    and Nakl = to_char(:id) || '#39'#'#39' || to_char(:inst)'
      ' ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 72
    Top = 200
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
      end
      item
        DataType = ftFloat
        Name = 'INST'
      end
      item
        DataType = ftFloat
        Name = 'id'
      end
      item
        DataType = ftFloat
        Name = 'inst'
      end
      item
        DataType = ftFloat
        Name = 'id'
      end
      item
        DataType = ftFloat
        Name = 'inst'
      end
      item
        DataType = ftFloat
        Name = 'id'
      end
      item
        DataType = ftFloat
        Name = 'inst'
      end
      item
        DataType = ftFloat
        Name = 'Id'
      end
      item
        DataType = ftFloat
        Name = 'Inst'
      end
      item
        DataType = ftFloat
        Name = 'id'
      end
      item
        DataType = ftFloat
        Name = 'inst'
      end>
  end
  object dsType: TOraDataSource
    DataSet = qType
    Left = 359
    Top = 80
  end
  object qType: TOilQuery
    SQL.Strings = (
      
        'select Oil_Auto_Type.Id, Oil_Auto_Type.Name as Type_Name, Oil_Au' +
        'to_Group.Name as Group_Name'
      '  from Oil_Auto_Type, Oil_Auto_Group'
      ' where Oil_Auto_Type.State = '#39'Y'#39
      '   and Oil_Auto_Type.Auto_Group = Oil_Auto_Group.Id'
      ' order by Oil_Auto_Type.Id'
      ''
      ' '
      ' '
      ' '
      ' ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 353
    Top = 88
  end
  object pmAdd: TPopupMenu
    Left = 12
    Top = 296
    object N1: TMenuItem
      Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100' '#1080#1083#1080' '#1090#1077#1093'.'#1089#1088#1077#1076#1089#1090#1074#1086
      OnClick = sbAddClick
    end
    object N2: TMenuItem
      Caption = #1042#1086#1076#1085#1099#1081' '#1090#1088#1072#1085#1089#1087#1086#1088#1090
      OnClick = N2Click
    end
  end
end
