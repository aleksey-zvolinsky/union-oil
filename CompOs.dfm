inherited FCompOs: TFCompOs
  Left = 266
  Top = 75
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' : '#1054#1087#1077#1088#1072#1094#1080#1086#1085#1085#1099#1077' '#1089#1080#1089#1090#1077#1084#1099
  ClientHeight = 358
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 325
    inherited Panel4: TPanel
      inherited bbClear: TBitBtn
        Visible = False
      end
      inherited bbSearch: TBitBtn
        Visible = False
        OnClick = bbSearchClick
      end
    end
  end
  inherited Panel2: TPanel
    Height = 33
  end
  inherited pBase: TPanel
    Top = 43
    Height = 282
    inherited DBGrid1: TDBGridEh
      Height = 282
      Columns = <
        item
          EditButtons = <>
          FieldName = 'OS'
          Footers = <>
          Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1086#1085#1085#1072#1103' '#1089#1080#1089#1090#1077#1084#1072
        end>
    end
  end
  inherited PanelCol: TPanel
    Top = 43
    Height = 282
    inherited cbCol: TRxCheckListBox
      Height = 254
    end
    inherited pRefresh: TPanel
      Top = 256
    end
  end
  inherited ds: TOraDataSource
    Left = 192
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'SELECT *'
      'FROM  OIL_COMP_OS'
      'WHERE STATE='#39'Y'#39
      'order by os')
  end
  object sp1: TOilStoredProc
        Left = 164
    Top = 108
  end
  object qExam: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 224
    Top = 108
  end
end
