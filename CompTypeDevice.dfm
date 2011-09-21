inherited FCompTypeDevice: TFCompTypeDevice
  Left = 230
  Top = 110
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' : '#1058#1080#1087#1080' '#1091#1089#1090#1088#1086#1081#1089#1090#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
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
    Height = 328
    inherited DBGrid1: TDBGridEh
      Height = 328
      Columns = <
        item
          EditButtons = <>
          FieldName = 'TYPE'
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
          Width = 144
        end>
    end
  end
  inherited PanelCol: TPanel
    Top = 43
    Height = 328
    inherited cbCol: TRxCheckListBox
      Height = 300
    end
    inherited pRefresh: TPanel
      Top = 302
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'SELECT TYPE, id, inst'
      'FROM OIL_COMP_TYPE_DEVICE'
      'WHERE (state='#39'Y'#39')'
      'order by type')
  end
end
