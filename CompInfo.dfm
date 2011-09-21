inherited FCompInfo: TFCompInfo
  Left = 212
  Top = 129
  Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1086#1074
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
      Width = 86
      Height = 13
      Caption = #1055'&'#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' :'
    end
    object SpeedButton5: TSpeedButton
      Left = 315
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
      OnClick = SpeedButton5Click
    end
    object ceOrg: TComboEdit
      Left = 16
      Top = 24
      Width = 297
      Height = 21
      DirectInput = False
      Glyph.Data = {
        D6000000424DD60000000000000076000000280000000C0000000C0000000100
        0400000000006000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        0000777777777777000077777777777700007777777777770000777770777777
        0000777700077777000077700000777700007700000007770000777777777777
        0000777777777777000077777777777700007777777777770000}
      ButtonWidth = 16
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ceOrgButtonClick
      OnDblClick = ceOrgButtonClick
    end
  end
  inherited pBase: TPanel
    Top = 67
    Height = 304
    inherited DBGrid1: TDBGridEh
      Height = 304
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      Columns = <
        item
          Checkboxes = False
          DropDownBox.Options = [dlgColLinesEh, dlgAutoSortMarkingEh, dlgMultiSortMarkingEh]
          DropDownBox.UseMultiTitle = True
          EditButtons = <>
          FieldName = 'IASSIGMENT'
          Footers = <>
          Title.Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077
          Width = 83
        end
        item
          EditButtons = <>
          FieldName = 'MOTHER_CARD'
          Footers = <>
          Title.Caption = #1052#1072#1090#1077#1088#1080#1085#1089#1082#1072#1103' '#1087#1083#1072#1090#1072
          Width = 184
        end
        item
          EditButtons = <>
          FieldName = 'MODEL_PROC'
          Footers = <>
          Title.Caption = #1052#1086#1076#1077#1083#1100' '#1087#1088#1086#1094#1077#1089#1086#1088#1072
          Width = 142
        end
        item
          EditButtons = <>
          FieldName = 'NUM_PROC'
          Footers = <>
          Title.Caption = #1063#1072#1089#1090#1086#1090#1072' '#1087#1088#1086#1094#1077#1089#1086#1088#1072
          Width = 109
        end
        item
          EditButtons = <>
          FieldName = 'RAM'
          Footers = <>
          Title.Caption = #1054#1047#1059
          Width = 53
        end
        item
          EditButtons = <>
          FieldName = 'CAPACITY'
          Footers = <>
          Title.Caption = #1054#1073#1100#1077#1084' '#1074#1080#1085#1095#1077#1089#1090#1077#1088#1072
          Width = 119
        end
        item
          EditButtons = <>
          FieldName = 'RAM_VIDEO'
          Footers = <>
          Title.Caption = #1045#1084#1082#1086#1089#1090#1100' '#1074#1080#1076#1077#1086
          Width = 99
        end
        item
          EditButtons = <>
          FieldName = 'OS'
          Footers = <>
          Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1086#1085#1085#1072#1103' '#1089#1080#1089#1090#1077#1084#1072
          Width = 141
        end
        item
          EditButtons = <>
          FieldName = 'ORGNAME'
          Footers = <>
          Title.Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
          Width = 183
        end
        item
          EditButtons = <>
          FieldName = 'F_NAME'
          Footers = <>
          Title.Caption = #1060#1072#1084#1080#1083#1080#1103
          Width = 106
        end
        item
          EditButtons = <>
          FieldName = 'POST_'
          Footers = <>
          Title.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          Width = 116
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
    Left = 172
  end
  inherited q: TOilQuery
    SQL.Strings = (
      
        'SELECT OIL_EMPLOY.F_NAME, OIL_EMPLOY.POST_, OIL_ORG.NAME ORGNAME' +
        ', Oil_comp_cfg.MODEL_PROC, Oil_comp_cfg.NUM_PROC, Oil_comp_cfg.C' +
        'APACITY, Oil_comp_os.OS, Oil_comp_info.COMPCFG_ID, Oil_comp_info' +
        '.COMPCFG_INST, Oil_comp_info.ID, Oil_comp_info.INST, Oil_comp_in' +
        'fo.STATE, Oil_comp_info.ASSIGMENT IASSIGMENT, Oil_comp_info.USER' +
        '_ID, Oil_comp_info.USER_INST, Oil_comp_info.OS_ID, Oil_comp_info' +
        '.OS_INST, Oil_comp_info.DATE_MOD, Oil_comp_cfg.MOTHER_CARD, Oil_' +
        'comp_cfg.RAM, Oil_comp_cfg.RAM_VIDEO'
      
        'FROM OIL_EMPLOY, v_org OIL_ORG, OIL_COMP_CFG Oil_comp_cfg, OIL_C' +
        'OMP_INFO Oil_comp_info, OIL_COMP_OS Oil_comp_os, OIL_COMP_USER O' +
        'il_comp_user'
      'WHERE  (Oil_comp_cfg.ID = Oil_comp_info.COMPCFG_ID)  '
      '   AND  (Oil_comp_cfg.INST = Oil_comp_info.COMPCFG_INST)  '
      '   AND  (Oil_comp_info.OS_ID = Oil_comp_os.ID)  '
      '   AND  (Oil_comp_info.OS_INST = Oil_comp_os.INST)  '
      '   AND  (Oil_comp_info.ORG_ID = OIL_ORG.ID)  '
      '   AND  (Oil_comp_info.ORG_INST = OIL_ORG.INST)  '
      '   AND  (Oil_comp_info.USER_ID = Oil_comp_user.ID)  '
      '   AND  (Oil_comp_info.USER_INST = Oil_comp_user.INST)  '
      '   AND  (Oil_comp_user.EMPLOY_ID = OIL_EMPLOY.ID)  '
      '   AND  (Oil_comp_user.EMPLOY_INST = OIL_EMPLOY.INST)  '
      '   AND  ( (Oil_comp_cfg.STATE = '#39'Y'#39')  '
      '   AND  (Oil_comp_os.STATE = '#39'Y'#39')  '
      '   AND  (Oil_comp_info.STATE = '#39'Y'#39')  '
      '   AND  (Oil_comp_user.STATE = '#39'Y'#39') ) '
      'ORDER BY IASSIGMENT'
      '')
  end
  object sp1: TOilStoredProc
        Left = 209
    Top = 108
  end
end
