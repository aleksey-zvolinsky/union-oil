inherited FCompProg: TFCompProg
  Left = 245
  Top = 155
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' : '#1055#1088#1086#1075#1088#1072#1084#1084#1099
  ClientHeight = 356
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 323
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
      Left = 32
      Top = 8
      Width = 118
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' :'
    end
    object SpeedButton5: TSpeedButton
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
      OnClick = SpeedButton5Click
    end
    object EProg: TEdit
      Left = 32
      Top = 24
      Width = 241
      Height = 21
      TabOrder = 0
    end
  end
  inherited pBase: TPanel
    Top = 67
    Height = 256
    inherited DBGrid1: TDBGridEh
      Height = 256
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PROG'
          Footers = <>
          Title.Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
          Width = 190
        end
        item
          EditButtons = <>
          FieldName = 'VER'
          Footers = <>
          Title.Caption = #1042#1077#1088#1089#1080#1103
          Width = 103
        end
        item
          EditButtons = <>
          FieldName = 'PRODUCTION'
          Footers = <>
          Title.Caption = #1055#1088#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
          Width = 117
        end
        item
          EditButtons = <>
          FieldName = 'LICENSE'
          Footers = <>
          Title.Caption = #1051#1080#1094#1077#1085#1079#1080#1103
        end
        item
          EditButtons = <>
          FieldName = 'NOTE'
          Footers = <>
          Title.Caption = #1050#1086#1084#1077#1085#1090#1072#1088#1080#1081
          Width = 235
        end>
    end
  end
  inherited PanelCol: TPanel
    Top = 67
    Height = 256
    inherited cbCol: TRxCheckListBox
      Height = 228
    end
    inherited pRefresh: TPanel
      Top = 230
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'SELECT *'
      'FROM  OIL_COMP_PROG'
      'where state='#39'Y'#39
      'order by prog')
  end
  object sp1: TOilStoredProc
        Left = 176
    Top = 113
  end
  object qExam: TOilQuery
    SQL.Strings = (
      'SELECT PROG_ID, PROG_INST'
      'FROM OIL_COMP_LPROG'
      'where (state='#39'Y'#39')')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 288
    Top = 161
  end
end
