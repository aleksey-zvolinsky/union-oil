inherited E_PlanForm: TE_PlanForm
  Left = 396
  Top = 212
  Width = 720
  Height = 606
  Caption = 'Планирование'
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 542
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object gridDet: TDBGridEh
      Left = 2
      Top = 73
      Width = 708
      Height = 467
      Align = alClient
      DataSource = dsPlanDet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterColor = clSilver
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = [fsBold]
      FooterRowCount = 1
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghEnterAsTab]
      ParentFont = False
      RowHeight = 4
      RowLines = 1
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          AutoFitColWidth = False
          Color = 15461353
          EditButtons = <>
          FieldName = 'E_BUDGET_ID'
          Footers = <>
          ReadOnly = True
          Title.Caption = '№'
          Width = 29
        end
        item
          AutoFitColWidth = False
          Color = 15461353
          EditButtons = <>
          FieldName = 'BUDGET_NAME'
          Footer.Value = 'Итого:'
          Footers = <
            item
              Value = 'Итого:'
              ValueType = fvtStaticText
            end>
          ReadOnly = True
          Title.Caption = 'Статья'
          Width = 231
        end
        item
          Color = 15461353
          EditButtons = <>
          FieldName = 'BUD_NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = 'Происхождение'
          Width = 108
        end
        item
          AutoFitColWidth = False
          Color = 15461353
          EditButtons = <>
          FieldName = 'ACTIVITY_NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = 'Вид деят.'
          Visible = False
          Width = 114
        end
        item
          AutoFitColWidth = False
          Checkboxes = False
          EditButtons = <>
          FieldName = 'SUMMA'
          Footers = <
            item
              ValueType = fvtSum
            end>
          Title.Caption = 'Сумма'
          Width = 70
        end
        item
          Color = 15461353
          EditButtons = <>
          FieldName = 'SUMMA_WITH_CUR'
          Footers = <>
          ReadOnly = True
          Title.Caption = 'Сумма'
          Width = 70
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'ITEM_COMMENTS'
          Footers = <>
          Title.Caption = 'Примечание'
          Width = 162
        end>
    end
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 708
      Height = 71
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 225
        Height = 71
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 3
          Width = 124
          Height = 13
          Caption = 'Бюджетный план на:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 49
          Height = 13
          Caption = 'Валюта:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cbM: TComboBox
          Left = 6
          Top = 20
          Width = 120
          Height = 21
          Style = csDropDownList
          DropDownCount = 20
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
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
          Left = 130
          Top = 20
          Width = 89
          Height = 21
          Style = csDropDownList
          DropDownCount = 20
          ItemHeight = 13
          TabOrder = 1
        end
        object cbCurrency: TComboBox
          Left = 72
          Top = 44
          Width = 147
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          OnChange = cbCurrencyChange
        end
      end
      object Panel5: TPanel
        Left = 225
        Top = 0
        Width = 483
        Height = 71
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Label5: TLabel
          Left = 8
          Top = 3
          Width = 74
          Height = 13
          Caption = 'Примечание'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel6: TPanel
          Left = 2
          Top = 56
          Width = 479
          Height = 13
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
        end
        object reComments: TRichEdit
          Left = 6
          Top = 20
          Width = 470
          Height = 45
          MaxLength = 200
          ScrollBars = ssBoth
          TabOrder = 1
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 542
    Width = 712
    Height = 30
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label3: TLabel
      Left = 160
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Курс:'
    end
    object bbOk: TBitBtn
      Left = 528
      Top = 2
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      BiDiMode = bdLeftToRight
      Caption = '&Принять'
      Default = True
      ParentBiDiMode = False
      TabOrder = 0
      OnClick = bbOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbCancel: TBitBtn
      Left = 621
      Top = 2
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      BiDiMode = bdLeftToRight
      Caption = '&Отменить'
      ParentBiDiMode = False
      TabOrder = 1
      Kind = bkCancel
    end
    object BitBtn1: TBitBtn
      Left = 4
      Top = 2
      Width = 89
      Height = 25
      Caption = 'Печать'
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B004000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000
        000000000000000000000000000000000000000000000000000000C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6C6000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C00000000000000000000000000000000000000000
        00000000000000000000000000000000000000C6C6C6000000C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600FFFF
        00FFFF00FFFFC6C6C6C6C6C6000000000000000000C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C684848484848484
        8484C6C6C6C6C6C6000000C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000C6C6C6C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0000000C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000
        C6C6C6000000C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
        00000000000000000000000000000000000000000000000000C6C6C6000000C6
        C6C6000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C6C6000000C6C6
        C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF00
        0000000000000000000000000000FFFFFF000000000000000000000000C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF000000000000
        000000000000000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000000000000000000000
        00000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0}
    end
    object ceCurSumm: TRxCalcEdit
      Left = 200
      Top = 4
      Width = 89
      Height = 21
      AutoSize = False
      NumGlyphs = 2
      TabOrder = 3
      OnChange = ceCurSummChange
    end
  end
  object dsPlanDet: TOraDataSource
    DataSet = mdPlanDet
    Left = 200
    Top = 184
  end
  object qWork: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 256
    Top = 184
  end
  object qTestDate: TOilQuery
    SQL.Strings = (
      'select count(*) as numb'
      '  from e_plan'
      ' where (:date1 between date_begin and date_end or'
      '       :date2 between date_begin and date_end or'
      '       date_begin between :date1 and :date2 or'
      '       date_end between :date1 and :date2)'
      '   and state = '#39'Y'#39)
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 304
    Top = 184
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date1'
      end
      item
        DataType = ftDateTime
        Name = 'date2'
      end>
  end
  object mdPlanDet: TMemoryTable
    BeforePost = mdPlanDetBeforePost
    Left = 192
    Top = 192
    object mdPlanDetID: TFloatField
      FieldName = 'ID'
    end
    object mdPlanDetE_BUDGET_ID: TFloatField
      FieldName = 'E_BUDGET_ID'
    end
    object mdPlanDetBUDGET_NAME: TStringField
      FieldName = 'BUDGET_NAME'
      Size = 50
    end
    object mdPlanDetACTIVITY_NAME: TStringField
      FieldName = 'ACTIVITY_NAME'
      Size = 50
    end
    object mdPlanDetSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 2
    end
    object mdPlanDetSUMMA_WITH_CUR: TFloatField
      FieldName = 'SUMMA_WITH_CUR'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 2
    end
    object mdPlanDetITEM_COMMENTS: TStringField
      FieldName = 'ITEM_COMMENTS'
      Size = 100
    end
    object mdPlanDetBUD_NAME: TStringField
      FieldName = 'BUD_NAME'
    end
  end
end
