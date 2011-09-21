inherited FCompOutDevice: TFCompOutDevice
  Left = 242
  Top = 103
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' : '#1042#1085#1077#1096#1085#1080#1077' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
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
      Left = 8
      Top = 8
      Width = 73
      Height = 13
      Caption = '&'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' :'
    end
    object Label2: TLabel
      Left = 304
      Top = 8
      Width = 25
      Height = 13
      Caption = '&'#1058#1080#1087' :'
    end
    object SpeedButton5: TSpeedButton
      Left = 475
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
    object SpeedButton1: TSpeedButton
      Left = 275
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
      OnClick = SpeedButton1Click
    end
    object ceOrg: TComboEdit
      Left = 8
      Top = 24
      Width = 265
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
    object ceType: TComboEdit
      Left = 304
      Top = 24
      Width = 169
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
      TabOrder = 1
      OnButtonClick = ceTypeButtonClick
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
          FieldName = 'TYPE'
          Footers = <>
          Title.Caption = #1058#1080#1087
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'DEVICE'
          Footers = <>
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Width = 129
        end
        item
          EditButtons = <>
          FieldName = 'DEP'
          Footers = <>
          Title.Caption = #1054#1090#1076#1077#1083
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'ORGNAME'
          Footers = <>
          Title.Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
          Width = 180
        end
        item
          EditButtons = <>
          FieldName = 'STATE_DEVICE'
          Footers = <>
          Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'NOTE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 254
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
    Left = 192
    Top = 120
  end
  inherited q: TOilQuery
    SQL.Strings = (
      
        'Select OIL_COMP_DEVICE.*, OIL_ORG.NAME ORGNAME, OIL_ORG.ID, OIL_' +
        'ORG.INST, Oil_comp_Type_device.*'
      'FROM OIL_COMP_DEVICE, v_org OIL_ORG, Oil_comp_Type_device'
      'Where (OIL_COMP_DEVICE.state='#39'Y'#39')'
      'AND (Oil_org.state='#39'Y'#39')'
      'AND (Oil_comp_Type_device.state='#39'Y'#39')'
      'AND (ORG_ID = OIL_ORG.ID)'
      'AND (ORG_INST = OIL_ORG.INST)'
      'AND (TYPE_ID = OIL_COMP_TYPE_DEVICE.ID)'
      'AND (TYPE_INST = OIL_COMP_TYPE_DEVICE.INST)'
      'order by TYPE')
    CachedUpdates = True
    Top = 120
  end
  object sp1: TOilStoredProc
        Left = 164
    Top = 120
  end
end
