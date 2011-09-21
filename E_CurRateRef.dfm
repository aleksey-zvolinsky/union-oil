inherited E_CurRateRefForm: TE_CurRateRefForm
  Left = 386
  Top = 223
  Caption = 'Курсы валют'
  ClientHeight = 426
  ClientWidth = 436
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 394
    Width = 436
    Height = 32
    inherited Panel3: TPanel
      Left = 263
      Width = 171
      Height = 28
      inherited bbOk: TBitBtn
        Left = 4
        Width = 81
      end
      inherited bbCancel: TBitBtn
        Left = 88
        Width = 81
      end
    end
    inherited PAdd: TPanel
      Height = 28
      inherited sbAdd: TSpeedButton
        OnClick = sbAddClick
      end
    end
    inherited PEdit: TPanel
      Height = 28
    end
    inherited pDel: TPanel
      Height = 28
    end
    inherited Panel4: TPanel
      Width = 170
      Height = 28
      inherited bbClear: TBitBtn
        Left = 85
        Visible = False
      end
      inherited bbSearch: TBitBtn
        Left = 0
        Width = 81
        OnClick = bbSearchClick
      end
    end
  end
  inherited Panel2: TPanel
    Width = 436
    Height = 31
    object Label1: TLabel
      Left = 272
      Top = 8
      Width = 38
      Height = 13
      Caption = 'Валюта'
    end
    object Label2: TLabel
      Left = 6
      Top = 8
      Width = 35
      Height = 13
      Caption = 'Дата с'
    end
    object Label3: TLabel
      Left = 142
      Top = 8
      Width = 12
      Height = 13
      Caption = 'по'
    end
    object cbCurrency: TComboBox
      Left = 315
      Top = 4
      Width = 115
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object DES: TDateEdit
      Left = 48
      Top = 4
      Width = 89
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object DEPo: TDateEdit
      Left = 162
      Top = 4
      Width = 89
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
  end
  inherited pBase: TPanel
    Top = 41
    Width = 286
    Height = 353
    inherited DBGrid1: TDBGridEh
      Width = 286
      Height = 353
      FooterColor = clSilver
      FooterFont.Style = [fsBold]
      FooterRowCount = 1
      ParentFont = False
      SumList.Active = True
      Columns = <
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'CURRENCY_NAME'
          Footer.Value = 'Количество:'
          Footer.ValueType = fvtStaticText
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Валюта'
          Width = 107
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'DATE_'
          Footer.ValueType = fvtCount
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Дата'
          Width = 73
        end
        item
          Alignment = taLeftJustify
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'RATE'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Курс'
          Width = 69
        end>
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 436
    inherited pnlTuneGridBtn: TPanel
      Left = 407
    end
  end
  inherited PanelCol: TPanel
    Left = 286
    Top = 41
    Height = 353
    inherited cbCol: TRxCheckListBox
      Height = 325
    end
    inherited pRefresh: TPanel
      Top = 327
    end
  end
  inherited ds: TOraDataSource
    Left = 100
    Top = 164
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select id, inst, date_, currency_id, currency_name, rate'
      '  from ve_currency_rate')
    Left = 88
    Top = 172
    object qID: TFloatField
      FieldName = 'ID'
      Origin = 'E_CURRENCY_RATE.ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Origin = 'E_CURRENCY_RATE.INST'
    end
    object qDATE_: TDateTimeField
      FieldName = 'DATE_'
      Origin = 'E_CURRENCY_RATE.DATE_'
    end
    object qCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      Origin = 'E_CURRENCY_RATE.CURRENCY_ID'
    end
    object qCURRENCY_NAME: TStringField
      FieldName = 'CURRENCY_NAME'
      Origin = 'OIL_CURRENCY.NAME'
      Size = 30
    end
    object qRATE: TFloatField
      FieldName = 'RATE'
      Origin = 'E_CURRENCY_RATE.RATE'
    end
  end
  inherited ADMQ: TOilQuery
    Top = 352
  end
  inherited PUM: TPopupMenu
    Left = 368
  end
  inherited ActionList: TActionList
    Left = 168
    Top = 231
  end
end
