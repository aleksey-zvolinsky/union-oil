inherited FCompIFace: TFCompIFace
  Left = 285
  Top = 175
  Caption = 'Справочник : Интерфейсы'
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
          FieldName = 'IFACE'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Итерфейс'
          Width = 92
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
  inherited ds: TOraDataSource
    Left = 164
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'SELECT  *'
      'FROM OIL_COMP_IFACE'
      'WHERE STATE='#39'Y'#39
      'order by IFace')
    object qID: TFloatField
      FieldName = 'ID'
      Origin = 'MAINBASE.OIL_COMP_IFACE.ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Origin = 'MAINBASE.OIL_COMP_IFACE.INST'
    end
    object qSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'MAINBASE.OIL_COMP_IFACE.STATE'
      Size = 1
    end
    object qIFACE: TStringField
      FieldName = 'IFACE'
      Origin = 'MAINBASE.OIL_COMP_IFACE.IFACE'
      Size = 10
    end
    object qDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
      Origin = 'MAINBASE.OIL_COMP_IFACE.DATE_MOD'
    end
  end
  inherited PUM: TPopupMenu
    Left = 224
    Top = 112
  end
  object sp1: TOilStoredProc
        Left = 192
    Top = 109
  end
  object qExam: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 320
    Top = 133
  end
end
