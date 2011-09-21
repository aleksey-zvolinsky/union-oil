inherited RashReportForm: TRashReportForm
  Left = 348
  Top = 216
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Отчеты по отпуску нефтепродуктов'
  ClientHeight = 424
  ClientWidth = 488
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 8
    Top = 248
    Width = 104
    Height = 16
    Caption = 'Все операции'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 280
    Top = 248
    Width = 161
    Height = 16
    Caption = 'Выбранные операции'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelDebug: TLabel
    Left = 208
    Top = 360
    Width = 63
    Height = 24
    Caption = 'Debug'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label6: TLabel
    Left = 328
    Top = 76
    Width = 102
    Height = 13
    Caption = 'Вид группировки'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton2: TSpeedButton
    Left = 192
    Top = 220
    Width = 23
    Height = 22
    Caption = 'E'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object Panel5: TPanel
    Left = 0
    Top = 383
    Width = 488
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 19
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 128
    Width = 177
    Height = 113
    Caption = 'Необязательные колонки'
    TabOrder = 17
    object CBRez: TCheckBox
      Left = 8
      Top = 70
      Width = 81
      Height = 17
      Caption = 'Резервуар'
      TabOrder = 0
    end
    object CBTo: TCheckBox
      Left = 8
      Top = 52
      Width = 73
      Height = 17
      Caption = 'Кому'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CBFrom: TCheckBox
      Left = 8
      Top = 16
      Width = 65
      Height = 17
      Caption = 'От кого'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 2
    end
    object CBDate: TCheckBox
      Left = 88
      Top = 34
      Width = 57
      Height = 17
      Caption = 'Дата'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object CBOperation: TCheckBox
      Left = 88
      Top = 52
      Width = 73
      Height = 17
      Caption = 'Операция'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object CBPart: TCheckBox
      Left = 8
      Top = 34
      Width = 65
      Height = 17
      Caption = 'Партия'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 5
      OnClick = CBPartClick
    end
    object CBSubpart: TCheckBox
      Left = 88
      Top = 70
      Width = 80
      Height = 17
      Caption = 'Подпартия'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 6
      OnClick = CBSubpartClick
    end
    object CBUchPrice: TCheckBox
      Left = 8
      Top = 88
      Width = 97
      Height = 17
      Caption = 'Учетная цена'
      TabOrder = 7
      OnClick = CBUchPriceClick
    end
  end
  object Panel3: TPanel
    Left = 272
    Top = 8
    Width = 209
    Height = 65
    TabOrder = 16
    object CBAzsNal: TCheckBox
      Left = 12
      Top = 44
      Width = 85
      Height = 17
      Caption = 'АЗС (нал.)'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CBAzsSn: TCheckBox
      Left = 108
      Top = 44
      Width = 85
      Height = 17
      Caption = 'АЗС (собст.)'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 192
    Top = 128
    Width = 289
    Height = 89
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 21
      Width = 40
      Height = 13
      Caption = 'Партия:'
    end
    object Label5: TLabel
      Left = 24
      Top = 45
      Width = 24
      Height = 13
      Caption = 'Н/П:'
    end
    object CBPartAll: TCheckBox
      Left = 130
      Top = 19
      Width = 41
      Height = 17
      Caption = 'Все'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CBPartAllClick
      OnKeyDown = FormKeyDown
    end
    object LENp: TRxLookupEdit
      Left = 56
      Top = 40
      Width = 65
      Height = 21
      LookupField = 'NAME'
      LookupSource = DSNp
      Enabled = False
      TabOrder = 1
      OnButtonClick = LENpButtonClick
      OnKeyDown = FormKeyDown
    end
    object CBNpAll: TCheckBox
      Left = 130
      Top = 43
      Width = 41
      Height = 17
      Caption = 'Все'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CBNpAllClick
      OnKeyDown = FormKeyDown
    end
    object Panel4: TPanel
      Left = 176
      Top = 8
      Width = 105
      Height = 73
      BevelOuter = bvLowered
      TabOrder = 3
      object CBKom: TCheckBox
        Left = 8
        Top = 8
        Width = 81
        Height = 17
        Caption = 'Комиссия'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object CBOwn: TCheckBox
        Left = 8
        Top = 30
        Width = 89
        Height = 17
        Caption = 'Собственный'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object CBStore: TCheckBox
        Left = 8
        Top = 52
        Width = 81
        Height = 17
        Caption = 'Хранение'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 257
    Height = 113
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 7
      Height = 13
      Caption = 'C'
    end
    object Label2: TLabel
      Left = 128
      Top = 13
      Width = 12
      Height = 13
      Caption = 'по'
    end
    object Label3: TLabel
      Left = 8
      Top = 50
      Width = 42
      Height = 13
      Caption = 'От кого:'
    end
    object Label9: TLabel
      Left = 22
      Top = 83
      Width = 29
      Height = 13
      Caption = 'Кому:'
    end
    object DateEdit1: TDateEdit
      Left = 22
      Top = 8
      Width = 105
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
      OnKeyDown = FormKeyDown
    end
    object DateEdit2: TDateEdit
      Left = 144
      Top = 8
      Width = 105
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnKeyDown = FormKeyDown
    end
    object CETo: TComboEdit
      Left = 56
      Top = 80
      Width = 192
      Height = 21
      DirectInput = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ParentFont = False
      TabOrder = 2
      OnButtonClick = CEToButtonClick
      OnKeyDown = FormKeyDown
    end
  end
  object BitBtn1: TBitBtn
    Left = 280
    Top = 392
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
  object BitBtn2: TBitBtn
    Left = 376
    Top = 392
    Width = 91
    Height = 25
    Caption = 'Выход'
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object CEFrom: TComboEdit
    Left = 65
    Top = 52
    Width = 192
    Height = 21
    Hint = 'В этом поле укажите организацию для которой строиться отчет'
    DirectInput = False
    GlyphKind = gkDropDown
    ButtonWidth = 18
    NumGlyphs = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnButtonClick = CEFromButtonClick
    OnKeyDown = FormKeyDown
  end
  object CMBPart: TComboEdit
    Left = 249
    Top = 143
    Width = 64
    Height = 21
    Hint = 'В этом поле укажите партию'
    DirectInput = False
    Enabled = False
    GlyphKind = gkDropDown
    ButtonWidth = 18
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    NumGlyphs = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnButtonClick = CMBPartButtonClick
    OnKeyDown = FormKeyDown
  end
  object DBOper: TDBGridEh
    Left = 8
    Top = 272
    Width = 193
    Height = 104
    DataSource = DSOper
    Enabled = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBOperDblClick
    OnKeyDown = FormKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = '  '
      end>
  end
  object STOper: TStringGrid
    Left = 280
    Top = 272
    Width = 201
    Height = 104
    ColCount = 1
    DefaultRowHeight = 18
    Enabled = False
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 7
    OnDblClick = STOperDblClick
    OnKeyDown = FormKeyDown
    ColWidths = (
      239)
  end
  object BitBtn3: TBitBtn
    Left = 220
    Top = 280
    Width = 41
    Height = 25
    Caption = '>>'
    Enabled = False
    TabOrder = 8
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 220
    Top = 312
    Width = 41
    Height = 25
    Caption = '<<'
    Enabled = False
    TabOrder = 9
    OnClick = BitBtn4Click
  end
  object CBOper: TCheckBox
    Left = 16
    Top = 396
    Width = 169
    Height = 17
    Caption = 'включить фильтр операций'
    TabOrder = 10
    OnClick = CBOperClick
    OnKeyDown = FormKeyDown
  end
  object CbAzsVed: TCheckBox
    Left = 284
    Top = 34
    Width = 89
    Height = 17
    Caption = 'АЗС (ведом.)'
    Checked = True
    State = cbChecked
    TabOrder = 12
  end
  object CBNb: TCheckBox
    Left = 284
    Top = 16
    Width = 89
    Height = 17
    Caption = 'Нефтебаза'
    Checked = True
    State = cbChecked
    TabOrder = 13
  end
  object CBAzsTalon: TCheckBox
    Left = 380
    Top = 16
    Width = 89
    Height = 17
    Caption = 'АЗС (талоны)'
    Checked = True
    State = cbChecked
    TabOrder = 14
  end
  object CBAzsOther: TCheckBox
    Left = 380
    Top = 34
    Width = 89
    Height = 17
    Caption = 'АЗС (прочее)'
    Checked = True
    State = cbChecked
    TabOrder = 15
  end
  object CBTtn: TCheckBox
    Left = 96
    Top = 144
    Width = 81
    Height = 17
    Caption = 'Номер ТТН'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 11
    OnKeyDown = FormKeyDown
  end
  object CMBSort: TComboBox
    Left = 272
    Top = 96
    Width = 209
    Height = 21
    ItemHeight = 13
    TabOrder = 18
    Text = 'От кого - Тип НП - Партия - Подпартия'
    OnChange = CMBSortChange
    Items.Strings = (
      'От кого - Тип НП - Партия - Подпартия'
      'От кого - Тип НП - Партия'
      'От кого - Тип НП - Резервуар'
      'От кого - Кому - Тип НП'
      'Тип НП - Партия'
      'Тип НП - Партия - От кого'
      'Тип НП - Партия - Подпартия'
      'Тип НП - Партия - Подпартия - От кого'
      'только Тип НП')
  end
  object QNp: TOilQuery
    SQL.Strings = (
      'select id,name'
      'from oil_np_group')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 248
    Top = 168
    object QNpID: TFloatField
      FieldName = 'ID'
    end
    object QNpNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object DSNp: TOraDataSource
    DataSet = QNp
    Left = 280
    Top = 168
  end
  object QOper: TOilQuery
    SQL.Strings = (
      'select id,name'
      'from oil_oper_type'
      'where state='#39'Y'#39' and grp in (8,9,10,13)'
      'order by name')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 80
    Top = 296
    object QOperNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object QOperID: TFloatField
      FieldName = 'ID'
    end
  end
  object DSOper: TOraDataSource
    DataSet = QOper
    Left = 32
    Top = 296
  end
end
