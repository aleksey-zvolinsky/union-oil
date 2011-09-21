inherited OvExpTypeRefForm: TOvExpTypeRefForm
  Caption = 'Справочник - Типы накладных расходов'
  ClientHeight = 301
  ClientWidth = 480
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 268
    Width = 480
    inherited Panel3: TPanel
      Left = 283
      inherited bbOk: TBitBtn
        Visible = True
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
    Width = 480
    Height = 38
    object Label1: TLabel
      Left = 12
      Top = 12
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object edName: TEdit
      Left = 72
      Top = 8
      Width = 237
      Height = 21
      TabOrder = 0
    end
  end
  inherited pBase: TPanel
    Top = 48
    Width = 348
    Height = 220
    inherited DBGrid1: TDBGridEh
      Width = 348
      Height = 220
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Название'
          Width = 300
        end
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Номер'
        end>
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 480
    inherited pnlTuneGridBtn: TPanel
      Left = 451
    end
  end
  inherited PanelCol: TPanel
    Left = 348
    Top = 48
    Height = 220
    inherited cbCol: TRxCheckListBox
      Height = 192
    end
    inherited pRefresh: TPanel
      Top = 194
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'Select * from V_OIL_OV_EXP_TYPE')
    object qID: TFloatField
      FieldName = 'ID'
      Origin = 'V_OIL_OV_EXP_TYPE.ID'
    end
    object qNAME: TStringField
      FieldName = 'NAME'
      Origin = 'V_OIL_OV_EXP_TYPE.NAME'
      Size = 200
    end
  end
  inherited ADMQ: TOilQuery
    Left = 23
    Top = 190
  end
end
