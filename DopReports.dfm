inherited DopReportsForm: TDopReportsForm
  Caption = 'Дополнительные отчеты'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel3: TPanel
      inherited bbOk: TBitBtn
        Left = 12
        Caption = '&Запустить'
        Visible = True
      end
    end
    inherited Panel4: TPanel
      inherited bbClear: TBitBtn
        Left = 83
        Visible = False
      end
      inherited bbSearch: TBitBtn
        Left = 0
        OnClick = bbSearchClick
      end
    end
  end
  inherited Panel2: TPanel
    Visible = False
  end
  inherited pBase: TPanel
    inherited DBGrid1: TDBGridEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Название'
          Width = 480
        end>
    end
  end
  inherited ds: TOraDataSource
    DataSet = md
  end
  inherited PUM: TPopupMenu
    object N1: TMenuItem
      Caption = 'Редактировать'
      OnClick = N1Click
    end
  end
  object md: TRxMemoryData
    FieldDefs = <>
    Left = 136
    Top = 165
    object mdNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
  end
end
