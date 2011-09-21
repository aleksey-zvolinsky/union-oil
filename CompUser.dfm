inherited FCompUser: TFCompUser
  Left = 218
  Top = 108
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' : '#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
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
  end
  inherited Panel2: TPanel
    Height = 57
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 55
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103' :'
    end
    object SpeedButton4: TSpeedButton
      Left = 243
      Top = 24
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
    object EName: TEdit
      Left = 16
      Top = 24
      Width = 225
      Height = 21
      TabOrder = 0
    end
  end
  inherited pBase: TPanel
    Top = 67
    Height = 304
    inherited DBGrid1: TDBGridEh
      Height = 304
      Columns = <
        item
          EditButtons = <>
          FieldName = 'F_NAME'
          Footers = <>
          Title.Caption = #1060#1072#1084#1080#1083#1080#1103
          Width = 129
        end
        item
          EditButtons = <>
          FieldName = 'I_NAME'
          Footers = <>
          Title.Caption = #1048#1084#1103
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'O_NAME'
          Footers = <>
          Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'DEPARTMENT'
          Footers = <>
          Title.Caption = #1054#1090#1076#1077#1083
          Width = 114
        end
        item
          EditButtons = <>
          FieldName = 'POST_'
          Footers = <>
          Title.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          Width = 91
        end
        item
          EditButtons = <>
          FieldName = 'ROOM'
          Footers = <>
          Title.Caption = #1050#1086#1084#1085#1072#1090#1072
        end
        item
          EditButtons = <>
          FieldName = 'LOCAL_NAME'
          Footers = <>
          Title.Caption = #1048#1084#1103' '#1074' '#1089#1077#1090#1080
          Width = 109
        end
        item
          EditButtons = <>
          FieldName = 'LOCAL_GROUP'
          Footers = <>
          Title.Caption = #1057#1077#1090#1077#1074#1072#1103' '#1075#1088#1091#1087#1072
          Width = 127
        end>
    end
  end
  inherited PanelCol: TPanel
    Top = 67
    Height = 304
    inherited cbCol: TRxCheckListBox
      Height = 276
    end
    inherited pRefresh: TPanel
      Top = 278
    end
  end
  inherited ds: TOraDataSource
    Left = 204
    Top = 124
  end
  inherited q: TOilQuery
    SQL.Strings = (
      
        'SELECT OIL_COMP_USER.EMPLOY_INST, OIL_COMP_USER.EMPLOY_ID, OIL_C' +
        'OMP_USER.ROOM, OIL_COMP_USER.DEPARTMENT, OIL_COMP_USER.LOCAL_NAM' +
        'E, OIL_COMP_USER.LOCAL_GROUP, OIL_COMP_USER.STATE, OIL_COMP_USER' +
        '.INST, OIL_COMP_USER.ID, OIL_EMPLOY.I_NAME, OIL_EMPLOY.F_NAME, O' +
        'IL_EMPLOY.O_NAME, OIL_EMPLOY.POST_'
      'FROM OIL_EMPLOY, OIL_COMP_USER'
      'WHERE  (OIL_EMPLOY.ID = OIL_COMP_USER.EMPLOY_ID)  '
      '   AND  (OIL_EMPLOY.INST = OIL_COMP_USER.EMPLOY_INST)  '
      '   AND  ( (OIL_COMP_USER.STATE = '#39'Y'#39')  '
      '   AND  (OIL_EMPLOY.STATE = '#39'Y'#39')  '
      '   AND  (OIL_EMPLOY.ID = OIL_COMP_USER.EMPLOY_ID)  '
      '   AND  (OIL_EMPLOY.INST = OIL_COMP_USER.EMPLOY_INST) ) '
      'order by OIL_EMPLOY.F_name')
    Top = 124
  end
  object sp1: TOilStoredProc
        Left = 168
    Top = 125
  end
  object qExam: TOilQuery
    SQL.Strings = (
      'SELECT USER_ID, USER_INST'
      'FROM OIL_COMP_INFO Oil_comp_info'
      'where (state='#39'Y'#39')')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 296
    Top = 185
  end
end
