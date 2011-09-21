inherited E_PlanRefForm: TE_PlanRefForm
  Left = 234
  Top = 286
  Caption = 'Планирование'
  ClientHeight = 428
  ClientWidth = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 396
    Width = 650
    Height = 32
    inherited Panel3: TPanel
      Left = 453
      Height = 28
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
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      Width = 161
      Height = 28
      inherited bbClear: TBitBtn
        Left = 79
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        Left = 0
        OnClick = bbSearchClick
      end
    end
  end
  inherited Panel2: TPanel
    Width = 650
    Height = 34
    object Label2: TLabel
      Left = 6
      Top = 10
      Width = 41
      Height = 13
      Caption = 'Период:'
    end
    object sbClearPeriod: TSpeedButton
      Left = 198
      Top = 6
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
      OnClick = sbClearPeriodClick
    end
    object Label3: TLabel
      Left = 449
      Top = 10
      Width = 21
      Height = 13
      Caption = 'Год:'
    end
    object Label4: TLabel
      Left = 249
      Top = 10
      Width = 36
      Height = 13
      Caption = 'Месяц:'
    end
    object SpeedButton1: TSpeedButton
      Left = 403
      Top = 6
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
    object SpeedButton2: TSpeedButton
      Left = 588
      Top = 6
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
      OnClick = SpeedButton2Click
    end
    object edPeriod: TEdit
      Left = 53
      Top = 7
      Width = 143
      Height = 21
      MaxLength = 250
      TabOrder = 0
      OnChange = bbSearchClick
    end
    object cbM: TComboBox
      Left = 289
      Top = 7
      Width = 113
      Height = 21
      Style = csDropDownList
      DropDownCount = 20
      ItemHeight = 13
      TabOrder = 1
      OnChange = bbSearchClick
      Items.Strings = (
        'Январь'
        'Февраль'
        'Март'
        'Апрель'
        'Май'
        'Июнь'
        'Июль'
        'Август'
        'Сентябрь'
        'Октябрь'
        'Ноябрь'
        'Декабрь')
    end
    object cbY: TComboBox
      Left = 473
      Top = 7
      Width = 113
      Height = 21
      Style = csDropDownList
      DropDownCount = 20
      ItemHeight = 13
      TabOrder = 2
      OnChange = bbSearchClick
    end
  end
  inherited pBase: TPanel
    Top = 44
    Width = 500
    Height = 352
    inherited DBGrid1: TDBGridEh
      Width = 500
      Height = 352
      FooterColor = clSilver
      FooterFont.Style = [fsBold]
      FooterRowCount = 1
      ParentFont = False
      SumList.Active = True
      OnDblClick = sbEditClick
      OnDrawColumnCell = nil
      Columns = <
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'DEP_NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Подразделение'
          Visible = False
          Width = 138
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'PLAN_NAME'
          Footer.Value = 'Сумма:'
          Footer.ValueType = fvtStaticText
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Период'
          Width = 111
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'SUMMA'
          Footer.ValueType = fvtSum
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Сумма'
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'CURRENCY_NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Валюта'
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'CURRENCY_SUMM'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Курс ($)'
          Width = 70
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'COMMENTS'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Примечание'
          Width = 268
        end>
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 650
    inherited pnlTuneGridBtn: TPanel
      Left = 621
    end
  end
  inherited PanelCol: TPanel
    Left = 500
    Top = 44
    Height = 352
    inherited cbCol: TRxCheckListBox
      Height = 324
    end
    inherited pRefresh: TPanel
      Top = 326
    end
  end
  inherited ds: TOraDataSource
    Left = 180
    Top = 124
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select dep_name,'
      '       plan_id,'
      '       plan_inst,'
      '       plan_name,'
      '       sum(summa) as summa,'
      '       comments,'
      '       currency_name,'
      '       currency_summ'
      '  from ve_plan'
      ' group by dep_name,'
      '          plan_id,'
      '          plan_inst,'
      '          plan_name,'
      '          comments,'
      '          currency_name,'
      '          currency_summ')
    Left = 168
    Top = 132
    object qDEP_NAME: TStringField
      DisplayWidth = 100
      FieldName = 'DEP_NAME'
      Origin = 'VE_PLAN.DEP_NAME'
      Size = 100
    end
    object qPLAN_ID: TFloatField
      FieldName = 'PLAN_ID'
      Origin = 'PLAN_ID'
    end
    object qPLAN_INST: TFloatField
      FieldName = 'PLAN_INST'
      Origin = 'PLAN_INST'
    end
    object qPLAN_NAME: TStringField
      DisplayWidth = 40
      FieldName = 'PLAN_NAME'
      Origin = 'PLAN_NAME'
      Size = 40
    end
    object qSUMMA: TFloatField
      DisplayWidth = 30
      FieldName = 'SUMMA'
      Origin = 'SUMMA'
    end
    object qCOMMENTS: TStringField
      FieldName = 'COMMENTS'
      Origin = 'COMMENTS'
      Size = 200
    end
    object qCURRENCY_NAME: TStringField
      FieldName = 'CURRENCY_NAME'
    end
    object qCURRENCY_SUMM: TFloatField
      FieldName = 'CURRENCY_SUMM'
    end
  end
  inherited ADMQ: TOilQuery
    Top = 344
  end
  inherited PUM: TPopupMenu
    Left = 310
    Top = 214
  end
end
