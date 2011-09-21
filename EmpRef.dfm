inherited EmpRefForm: TEmpRefForm
  Left = 242
  Top = 143
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'- '#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
  ClientHeight = 464
  ClientWidth = 654
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 431
    Width = 654
    TabOrder = 2
    inherited Panel3: TPanel
      Left = 457
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
        OnClick = bbSearchClick
      end
    end
    inherited pShowDetail: TPanel
      Width = 89
    end
  end
  inherited Panel2: TPanel
    Width = 654
    Height = 98
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 3
      Width = 49
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
    end
    object Label2: TLabel
      Left = 6
      Top = 40
      Width = 22
      Height = 13
      Caption = #1048#1084#1103
    end
    object Label4: TLabel
      Left = 281
      Top = 3
      Width = 79
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
    end
    object Label5: TLabel
      Left = 117
      Top = 3
      Width = 45
      Height = 13
      Caption = #1048#1076#1077#1085#1090'.'#8470
    end
    object Label6: TLabel
      Left = 117
      Top = 40
      Width = 31
      Height = 13
      Caption = #1040#1076#1088#1077#1089
    end
    object Label7: TLabel
      Left = 392
      Top = 40
      Width = 58
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    end
    object Label14: TLabel
      Left = 392
      Top = 3
      Width = 67
      Height = 13
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
    end
    object SpeedButton1: TSpeedButton
      Left = 625
      Top = 15
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
    object Label8: TLabel
      Left = 281
      Top = 40
      Width = 66
      Height = 13
      Caption = #1055#1072#1089#1087#1086#1088#1090' '#1057'/'#1053
    end
    object Label10: TLabel
      Left = 224
      Top = 3
      Width = 20
      Height = 13
      Caption = #1055#1086#1083
    end
    object eSurName: TEdit
      Left = 6
      Top = 16
      Width = 100
      Height = 21
      TabOrder = 0
    end
    object eName: TEdit
      Left = 6
      Top = 53
      Width = 100
      Height = 21
      TabOrder = 1
    end
    object deBirthDate: TDateEdit
      Left = 281
      Top = 16
      Width = 100
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 2
    end
    object eIdNum: TEdit
      Left = 117
      Top = 16
      Width = 96
      Height = 21
      TabOrder = 3
    end
    object eAddress: TEdit
      Left = 117
      Top = 53
      Width = 154
      Height = 21
      TabOrder = 4
    end
    object ePost_: TEdit
      Left = 392
      Top = 53
      Width = 256
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
    object ceOrg: TComboEdit
      Left = 392
      Top = 16
      Width = 232
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 6
      OnButtonClick = ceOrgButtonClick
      OnDblClick = ceOrgButtonClick
    end
    object ePassNum: TEdit
      Left = 281
      Top = 53
      Width = 100
      Height = 21
      TabOrder = 7
    end
    object cbSex: TComboBox
      Left = 224
      Top = 16
      Width = 47
      Height = 21
      DropDownCount = 2
      ItemHeight = 13
      TabOrder = 8
      Items.Strings = (
        #1052
        #1046)
    end
    object cbIsWorking: TCheckBox
      Left = 6
      Top = 77
      Width = 161
      Height = 17
      Caption = #1053#1077' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1091#1074#1086#1083#1077#1085#1085#1099#1093
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
  end
  inherited pBase: TPanel
    Top = 108
    Width = 504
    Height = 323
    inherited SplitterDetail: TSplitter
      Top = 268
      Width = 504
    end
    inherited DBGrid1: TDBGridEh
      Width = 504
      Height = 268
      Columns = <
        item
          EditButtons = <>
          FieldName = 'F_NAME'
          Footers = <>
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'I_NAME'
          Footers = <>
          Width = 72
        end
        item
          EditButtons = <>
          FieldName = 'O_NAME'
          Footers = <>
          Width = 92
        end
        item
          EditButtons = <>
          FieldName = 'POST_'
          Footers = <>
          Width = 103
        end
        item
          EditButtons = <>
          FieldName = 'ID_NUM'
          Footers = <>
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = 'SEX'
          Footers = <>
          Width = 29
        end
        item
          EditButtons = <>
          FieldName = 'ORG_NAME'
          Footers = <>
          Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          Width = 300
        end
        item
          EditButtons = <>
          FieldName = 'HIRE_DATE'
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'DIS_DATE'
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'PHONE'
          Footers = <>
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'DATE_BIRTH'
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'PASS_NUM'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'PASS_GIVE'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'PASS_GIVE_D'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'ADDR'
          Footers = <>
          Width = 300
        end
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
        end>
    end
    inherited pDetail: TPanel
      Top = 271
      Width = 504
      inherited DBGridDetail: TDBGridEh
        Width = 504
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 654
    inherited pnlTuneGridBtn: TPanel
      Left = 625
    end
  end
  inherited PanelCol: TPanel
    Left = 504
    Top = 108
    Height = 323
    inherited cbCol: TRxCheckListBox
      Height = 295
    end
    inherited pRefresh: TPanel
      Top = 297
    end
  end
  inherited ds: TOraDataSource
    Left = 174
    Top = 262
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'SELECT OIL_EMPLOY.*, OIL_ORG.NAME ORG_NAME'
      'FROM OIL_EMPLOY, v_org OIL_ORG'
      'WHERE OIL_EMPLOY.STATE = '#39'Y'#39
      '  AND OIL_EMPLOY.ORG_ID = OIL_ORG.ID (+)'
      '  AND OIL_EMPLOY.ORG_INST = OIL_ORG.INST (+)'
      
        '  AND (UPPER(OIL_EMPLOY.F_NAME) LIKE '#39'%'#39' || UPPER(:SURNAME) || '#39 +
        '%'#39' OR :SURNAME IS NULL)'
      
        '  AND (UPPER(OIL_EMPLOY.I_NAME) LIKE '#39'%'#39' || UPPER(:NAME) || '#39'%'#39' ' +
        'OR :NAME IS NULL)'
      
        '  AND (UPPER(OIL_EMPLOY.ADDR) LIKE '#39'%'#39' || UPPER(:ADDRESS) || '#39'%'#39 +
        ' OR :ADDRESS IS NULL)'
      
        '  AND (UPPER(OIL_EMPLOY.PASS_NUM) LIKE UPPER(:PassNum) || '#39'%'#39' OR' +
        ' :PassNum IS NULL)'
      
        '  AND (UPPER(OIL_EMPLOY.POST_) LIKE '#39'%'#39' || UPPER(:POST_) || '#39'%'#39' ' +
        'OR :POST_ IS NULL)'
      '  AND (OIL_EMPLOY.ID_NUM LIKE :IdNum || '#39'%'#39' OR :IdNum IS NULL)'
      '  AND (OIL_EMPLOY.DIS_DATE is null or :IsWorking is null)'
      '  AND (OIL_EMPLOY.DATE_BIRTH = :BIRTHDATE OR :BIRTHDATE IS NULL)'
      '  AND (OIL_EMPLOY.ORG_ID = :OrgId OR :OrgId IS NULL)'
      '  AND (OIL_EMPLOY.ORG_INST = :OrgInst OR :OrgInst IS NULL)'
      '  AND (OIL_EMPLOY.SEX = :SEX OR :SEX IS NULL)'
      'ORDER BY OIL_EMPLOY.F_NAME, OIL_EMPLOY.I_NAME, OIL_EMPLOY.O_NAME'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    CachedUpdates = True
    UpdateObject = uq
    AfterPost = qAfterPost
    AfterDelete = qAfterPost
    Left = 160
    Top = 270
    ParamData = <
      item
        DataType = ftString
        Name = 'SurName'
      end
      item
        DataType = ftString
        Name = 'SURNAME'
      end
      item
        DataType = ftString
        Name = 'Name'
      end
      item
        DataType = ftString
        Name = 'NAME'
      end
      item
        DataType = ftString
        Name = 'Address'
      end
      item
        DataType = ftString
        Name = 'ADDRESS'
      end
      item
        DataType = ftString
        Name = 'PassNum'
      end
      item
        DataType = ftString
        Name = 'PassNum'
      end
      item
        DataType = ftString
        Name = 'Post_'
      end
      item
        DataType = ftString
        Name = 'POST_'
      end
      item
        DataType = ftString
        Name = 'IdNum'
      end
      item
        DataType = ftString
        Name = 'IdNum'
      end
      item
        DataType = ftString
        Name = 'IsWorking'
      end
      item
        DataType = ftDateTime
        Name = 'BirthDate'
      end
      item
        DataType = ftDateTime
        Name = 'BIRTHDATE'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftString
        Name = 'Sex'
      end
      item
        DataType = ftString
        Name = 'SEX'
      end>
    object qID: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'ID'
      Origin = 'V_OIL_EMP.ID'
    end
    object qINST: TFloatField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'INST'
      Origin = 'V_OIL_EMP.INST'
    end
    object qSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'OIL_EMPLOY.STATE'
      Size = 1
    end
    object qI_NAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'I_NAME'
      Origin = 'V_OIL_EMP.I_NAME'
      Size = 50
    end
    object qF_NAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'F_NAME'
      Origin = 'V_OIL_EMP.F_NAME'
      Size = 50
    end
    object qO_NAME: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'O_NAME'
      Origin = 'V_OIL_EMP.O_NAME'
      Size = 50
    end
    object qORG_NAME: TStringField
      FieldName = 'ORG_NAME'
      Origin = 'V_OIL_EMP.ORG_NAME'
      Size = 100
    end
    object qSEX: TStringField
      DisplayLabel = #1055#1086#1083
      FieldName = 'SEX'
      Origin = 'V_OIL_EMP.SEX'
      Size = 1
    end
    object qDATE_BIRTH: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
      FieldName = 'DATE_BIRTH'
      Origin = 'V_OIL_EMP.DATE_BIRTH'
    end
    object qID_NUM: TStringField
      DisplayLabel = #1048#1076#1077#1085#1090'. '#8470
      FieldName = 'ID_NUM'
      Origin = 'V_OIL_EMP.ID_NUM'
      Size = 15
    end
    object qADDR: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'ADDR'
      Origin = 'V_OIL_EMP.ADDR'
      Size = 200
    end
    object qPASS_NUM: TStringField
      DisplayLabel = #8470' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASS_NUM'
      Origin = 'V_OIL_EMP.PASS_NUM'
      Size = 15
    end
    object qPASS_GIVE: TStringField
      DisplayLabel = #1055#1072#1089#1087#1086#1088#1090' '#1074#1099#1076#1072#1085
      FieldName = 'PASS_GIVE'
      Origin = 'V_OIL_EMP.PASS_GIVE'
      Size = 100
    end
    object qPASS_GIVE_D: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASS_GIVE_D'
      Origin = 'V_OIL_EMP.PASS_GIVE_D'
    end
    object qPHONE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'PHONE'
      Origin = 'V_OIL_EMP.PHONE'
      Size = 30
    end
    object qPOST_: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'POST_'
      Origin = 'V_OIL_EMP.POST_'
      Size = 50
    end
    object qHIRE_DATE: TDateTimeField
      DisplayLabel = #1055#1088#1080#1085#1103#1090
      FieldName = 'HIRE_DATE'
      Origin = 'V_OIL_EMP.HIRE_DATE'
    end
    object qDIS_DATE: TDateTimeField
      DisplayLabel = #1059#1074#1086#1083#1077#1085
      FieldName = 'DIS_DATE'
      Origin = 'V_OIL_EMP.DIS_DATE'
    end
    object qORG_ID: TFloatField
      FieldName = 'ORG_ID'
      Origin = 'V_OIL_EMP.ORG_ID'
    end
    object qORG_INST: TFloatField
      FieldName = 'ORG_INST'
      Origin = 'V_OIL_EMP.ORG_INST'
    end
  end
  inherited ADMQ: TOilQuery
    Left = 52
    Top = 162
  end
  inherited PUM: TPopupMenu
    Left = 425
    Top = 292
  end
  inherited ActionList: TActionList
    Left = 296
    Top = 166
  end
  object SP: TOilStoredProc
    Left = 252
    Top = 165
  end
  object uq: TOraUpdateSQL
    ModifySQL.Strings = (
      'update OIL_EMPLOY'
      'set'
      '  I_NAME = :I_NAME,'
      '  F_NAME = :F_NAME,'
      '  O_NAME = :O_NAME,'
      '  SEX = :SEX,'
      '  DATE_BIRTH = :DATE_BIRTH,'
      '  ID_NUM = :ID_NUM,'
      '  ADDR = :ADDR,'
      '  PASS_NUM = :PASS_NUM,'
      '  PASS_GIVE = :PASS_GIVE,'
      '  PASS_GIVE_D = :PASS_GIVE_D,'
      '  PHONE = :PHONE,'
      '  HIRE_DATE = :HIRE_DATE,'
      '  POST_ = :POST_,'
      '  DIS_DATE = :DIS_DATE,'
      '  ORG_ID = :ORG_ID,'
      '  ORG_INST = :ORG_INST'
      'where'
      '  ID = :OLD_ID and'
      '  INST = :OLD_INST')
    InsertSQL.Strings = (
      'insert into OIL_EMPLOY'
      
        '  (ID, STATE, INST, I_NAME, F_NAME, O_NAME, SEX, DATE_BIRTH, ID_' +
        'NUM, '
      'ADDR, '
      '   PASS_NUM, PASS_GIVE, PASS_GIVE_D, PHONE, HIRE_DATE, POST_, '
      'DIS_DATE, '
      '   ORG_ID, ORG_INST)'
      'values'
      
        '  (:ID, '#39'Y'#39', :INST, :I_NAME, :F_NAME, :O_NAME, :SEX, :DATE_BIRTH' +
        ', '
      ':ID_NUM, '
      
        '   :ADDR, :PASS_NUM, :PASS_GIVE, :PASS_GIVE_D, :PHONE, :HIRE_DAT' +
        'E, '
      ':POST_, '
      '   :DIS_DATE, :ORG_ID, :ORG_INST)')
    DeleteSQL.Strings = (
      'update OIL_EMPLOY'
      'set STATE = '#39'N'#39
      'where'
      '  ID = :OLD_ID and'
      '  STATE = :OLD_STATE'
      '')
    Left = 212
    Top = 262
  end
  object qWork: TOilQuery
    SQL.Strings = (
      'select s_oil_employ.nextval'
      'from sys.dual')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 52
    Top = 254
  end
  object qCheckDelete: TOilQuery
    SQL.Strings = (
      ' select '#39'^'#39
      '   from Oil_Auto'
      '  where Employ_Id = :Id'
      '    and Employ_Inst = :Inst'
      ''
      '  union all'
      ''
      ' select '#39'^'#39
      '   from v_Card_Transaction'
      '  where Employ_Id = :Id'
      '    and Employ_Inst = :Inst'
      ''
      '  union all'
      ''
      ' select '#39'^'#39
      '   from Oil_SROther'
      '  where State = '#39'Y'#39
      '    and Employ_Id = :Id'
      '    and Employ_Inst = :Inst'
      ''
      '  union all'
      ''
      ' select '#39'^'#39
      '   from Oil_Talon_Data'
      '  where State = '#39'Y'#39
      '    and Employ_Id = :Id'
      '    and Employ_Inst = :Inst'
      ''
      '  union all'
      ''
      ' select '#39'^'#39
      '   from Oil_Daily_Rep'
      '  where State = '#39'Y'#39
      '    and Emp_Id = :Id'
      '    and Emp_Inst = :Inst'
      ''
      '  union all'
      ''
      ' select '#39'^'#39
      '   from Oil_Rashod'
      '  where State = '#39'Y'#39
      '    and Employ_Id = :Id'
      '    and Employ_Inst = :Inst'
      ''
      '  union all'
      ''
      ' select '#39'^'#39
      '   from Oil_Rash_Det'
      '  where State = '#39'Y'#39
      '    and Employ_Id = :Id'
      '    and Employ_Inst = :Inst'
      ' '
      ' ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 52
    Top = 209
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
        Name = 'Id'
      end
      item
        DataType = ftFloat
        Name = 'Inst'
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
        Name = 'Id'
      end
      item
        DataType = ftFloat
        Name = 'Inst'
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
        Name = 'Id'
      end
      item
        DataType = ftFloat
        Name = 'Inst'
      end
      item
        DataType = ftFloat
        Name = 'Id'
      end
      item
        DataType = ftFloat
        Name = 'Inst'
      end>
  end
end
