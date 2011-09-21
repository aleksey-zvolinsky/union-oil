inherited ZavodRashForm: TZavodRashForm
  Left = 265
  Top = 205
  Width = 650
  Height = 493
  Caption = 'Отпуск с завода'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited pBottom: TPanel
    Top = 433
    Width = 642
    inherited pBtn: TPanel
      Left = 445
    end
    object edSearch: TEdit
      Left = 8
      Top = 6
      Width = 121
      Height = 21
      Hint = 'Поиск цистерны'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = edSearchChange
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 642
    Height = 97
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 127
      Height = 93
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 4
        Top = 4
        Width = 34
        Height = 13
        Caption = 'Номер'
      end
      object Label2: TLabel
        Left = 6
        Top = 44
        Width = 26
        Height = 13
        Caption = 'Дата'
      end
      object edNum: TEdit
        Left = 4
        Top = 20
        Width = 113
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clScrollBar
        Enabled = False
        TabOrder = 0
      end
      object deDate: TDateEdit
        Left = 4
        Top = 60
        Width = 117
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 129
      Top = 2
      Width = 236
      Height = 93
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label3: TLabel
        Left = 4
        Top = 4
        Width = 22
        Height = 13
        Caption = 'ГТД'
      end
      object Label4: TLabel
        Left = 4
        Top = 44
        Width = 44
        Height = 13
        Caption = 'Договор'
      end
      object sbClearGTD: TSpeedButton
        Left = 205
        Top = 20
        Width = 23
        Height = 22
        Anchors = [akTop, akRight]
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
        OnClick = sbClearGTDClick
      end
      object sbClearDog: TSpeedButton
        Left = 205
        Top = 60
        Width = 23
        Height = 22
        Anchors = [akTop, akRight]
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
        OnClick = sbClearDogClick
      end
      object ceGTD: TComboEdit
        Left = 4
        Top = 20
        Width = 198
        Height = 21
        GlyphKind = gkDropDown
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 1
        TabOrder = 0
        OnButtonClick = ceGTDButtonClick
        OnDblClick = ceGTDButtonClick
      end
      object ceDog: TComboEdit
        Left = 4
        Top = 60
        Width = 198
        Height = 21
        GlyphKind = gkDropDown
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 1
        TabOrder = 1
        OnButtonClick = ceDogButtonClick
        OnDblClick = ceDogButtonClick
      end
    end
    object Panel6: TPanel
      Left = 365
      Top = 2
      Width = 275
      Height = 93
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object Label5: TLabel
        Left = 4
        Top = 4
        Width = 77
        Height = 13
        Caption = 'Завод (от кого)'
      end
      object sbClearZavod: TSpeedButton
        Left = 243
        Top = 20
        Width = 23
        Height = 22
        Anchors = [akTop, akRight]
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
      end
      object Label6: TLabel
        Left = 4
        Top = 44
        Width = 114
        Height = 13
        Caption = 'Подразделение (кому)'
      end
      object sbClearDep: TSpeedButton
        Left = 243
        Top = 60
        Width = 23
        Height = 22
        Anchors = [akTop, akRight]
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
      end
      object ceZavod: TComboEdit
        Left = 4
        Top = 20
        Width = 236
        Height = 21
        GlyphKind = gkDropDown
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 1
        TabOrder = 0
      end
      object ceDep: TComboEdit
        Left = 4
        Top = 60
        Width = 236
        Height = 21
        GlyphKind = gkDropDown
        Anchors = [akLeft, akTop, akRight]
        NumGlyphs = 1
        TabOrder = 1
      end
    end
  end
  object DBGridEh1: TDBGridEh [2]
    Left = 0
    Top = 97
    Width = 642
    Height = 336
    Align = alClient
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWhite
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clGreen
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = [fsBold]
    FooterRowCount = 1
    ParentFont = False
    PopupMenu = pm
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'INST'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'STATE'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'TANK_NUM'
        Footer.Value = 'Итого'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Caption = '№ цистерны'
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'ZD_NAKL'
        Footers = <>
        Title.Caption = 'ЖД накладная'
        Width = 89
      end
      item
        DropDownBox.Columns = <
          item
            FieldName = 'ID'
          end
          item
            FieldName = 'NAME'
          end>
        EditButtons = <>
        FieldName = 'TANK_TYPE'
        Footers = <>
        LookupDisplayFields = 'NAME'
        Title.Caption = 'Тип цистерны'
        Visible = False
        OnEditButtonClick = DBGridEh1Columns5EditButtonClick
      end
      item
        EditButtons = <
          item
            OnClick = DBGridEh1Columns5EditButtonClick
          end>
        EndEllipsis = True
        FieldName = 'TANK_TYPE_NAME'
        Footers = <>
        Title.Caption = 'Тип цистерны'
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'NP_TYPE'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <
          item
            OnClick = DBGridEh1Columns8EditButtons0Click
          end>
        FieldName = 'NP_TYPE_NAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = 'Тип НП'
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'DENSITY'
        Footers = <>
        Title.Caption = 'Плотность'
      end
      item
        EditButtons = <>
        FieldName = 'TEMPERATURE'
        Footers = <>
        Title.Caption = 'Темп-ра'
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'NP_COUNT'
        Footer.DisplayFormat = '0.000'
        Footer.FieldName = 'NP_COUNT'
        Footer.ValueType = fvtSum
        Footers = <
          item
            FieldName = 'NP_COUNT'
            ValueType = fvtSum
          end>
        Title.Caption = 'НП (т.)'
      end
      item
        EditButtons = <>
        FieldName = 'WATER_COUNT'
        Footer.DisplayFormat = '0.000'
        Footer.FieldName = 'WATER_COUNT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'Вода (т.)'
      end
      item
        EditButtons = <>
        FieldName = 'LEVEL_MM'
        Footer.DisplayFormat = '0.000'
        Footers = <>
        Title.Caption = 'Уровень, мм'
      end
      item
        EditButtons = <>
        FieldName = 'PV'
        Footer.DisplayFormat = '0.000'
        Footers = <>
        Title.Caption = 'п/в'
      end>
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select *'
      'from v_oil_zavod_rash_full'
      'where id=:id and inst=:inst'
      'order by zrd_id')
    Left = 16
  end
  object mt: TMemoryTable
    BeforeInsert = mtBeforeInsert
    AfterInsert = mtAfterInsert
    BeforePost = mtBeforePost
    Left = 280
    Top = 204
    object mtID: TIntegerField
      FieldName = 'ID'
    end
    object mtINST: TIntegerField
      FieldName = 'INST'
    end
    object mtSTATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object mtTANK_NUM: TStringField
      FieldName = 'TANK_NUM'
      Size = 32
    end
    object mtZD_NAKL: TStringField
      FieldName = 'ZD_NAKL'
      Size = 32
    end
    object mtTANK_TYPE: TIntegerField
      FieldName = 'TANK_TYPE'
    end
    object mtTANK_TYPE_NAME: TStringField
      FieldName = 'TANK_TYPE_NAME'
      Size = 32
    end
    object mtNP_TYPE: TIntegerField
      FieldName = 'NP_TYPE'
    end
    object mtNP_TYPE_NAME: TStringField
      FieldName = 'NP_TYPE_NAME'
      Size = 50
    end
    object mtDENSITY: TFloatField
      FieldName = 'DENSITY'
    end
    object mtTEMPERATURE: TFloatField
      FieldName = 'TEMPERATURE'
    end
    object mtNP_COUNT: TFloatField
      FieldName = 'NP_COUNT'
    end
    object mtWATER_COUNT: TFloatField
      FieldName = 'WATER_COUNT'
    end
    object mtLEVEL_MM: TFloatField
      FieldName = 'LEVEL_MM'
    end
    object mtPV: TFloatField
      FieldName = 'PV'
    end
  end
  object ds: TDataSource
    DataSet = mt
    Left = 288
    Top = 196
  end
  object pm: TPopupMenu
    Left = 488
    Top = 240
    object N1: TMenuItem
      Caption = 'Скопировать на все'
      object N2: TMenuItem
        Caption = 'Температуру'
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = 'Плотность'
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = 'Тип НП'
        OnClick = N4Click
      end
    end
  end
end
