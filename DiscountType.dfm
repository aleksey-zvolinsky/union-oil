inherited frmDiscountType: TfrmDiscountType
  Left = 352
  Top = 226
  Caption = 'Виды скидок'
  ClientHeight = 300
  ClientWidth = 396
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 267
    Width = 396
    inherited Panel3: TPanel
      Left = 199
      inherited bbOk: TBitBtn
        Left = 12
      end
    end
    inherited Panel4: TPanel
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
  end
  inherited Panel2: TPanel
    Width = 396
    Height = 49
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 61
      Height = 13
      Caption = 'Вид скидки:'
    end
    object edDiscountType: TEdit
      Left = 80
      Top = 12
      Width = 137
      Height = 21
      TabOrder = 0
    end
  end
  inherited pBase: TPanel
    Top = 59
    Width = 264
    Height = 208
    inherited DBGrid1: TDBGridEh
      Width = 264
      Height = 208
      AutoFitColWidths = False
      Columns = <
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Тип скидки'
        end>
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 396
    inherited pnlTuneGridBtn: TPanel
      Left = 367
    end
  end
  inherited PanelCol: TPanel
    Left = 264
    Top = 59
    Height = 208
    inherited cbCol: TRxCheckListBox
      Height = 180
    end
    inherited pRefresh: TPanel
      Top = 182
    end
  end
  inherited ds: TOraDataSource
    Left = 180
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select Name, Id'
      'from oil_discount_type'
      'where state='#39'Y'#39
      'and (Name like '#39'%'#39' || :DiscName || '#39'%'#39' or :DiscName is null)'
      ' ')
    ParamData = <
      item
        DataType = ftString
        Name = 'DiscName'
      end
      item
        DataType = ftString
        Name = 'DiscName'
      end>
  end
end
