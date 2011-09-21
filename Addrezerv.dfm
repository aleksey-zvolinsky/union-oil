inherited AddrezervForm: TAddrezervForm
  Left = 340
  Top = 253
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Резервуары'
  ClientHeight = 304
  ClientWidth = 606
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 11
    Height = 13
    Caption = '№'
  end
  object Label2: TLabel
    Left = 64
    Top = 0
    Width = 50
    Height = 13
    Caption = 'Название'
  end
  object Label3: TLabel
    Left = 8
    Top = 40
    Width = 35
    Height = 13
    Caption = 'Объем'
  end
  object Label4: TLabel
    Left = 104
    Top = 40
    Width = 57
    Height = 13
    Caption = 'М. Остаток'
  end
  object pAdd: TSpeedButton
    Left = 176
    Top = 88
    Width = 28
    Height = 26
    Hint = 'Добавить резервуар'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      E6000000424DE60000000000000076000000280000000E0000000E0000000100
      0400000000007000000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3300333333333333330033333333333333003333300033333300333330F03333
      3300333330F033333300330000F000033300330FFFFFFF033300330000F00003
      3300333330F033333300333330F0333333003333300033333300333333333333
      33003333333333333300}
    ParentFont = False
    Visible = False
    OnClick = pAddClick
  end
  object pEdit: TSpeedButton
    Left = 208
    Top = 88
    Width = 28
    Height = 26
    Hint = 'Изменить парамнтры резервуара'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
      33333333333F8888883F33330000324334222222443333388F3833333388F333
      000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
      F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
      223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
      3338888300003AAAAAAA33333333333888888833333333330000333333333333
      333333333333333333FFFFFF000033333333333344444433FFFF333333888888
      00003A444333333A22222438888F333338F3333800003A2243333333A2222438
      F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
      22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
      33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentFont = False
    Visible = False
    OnClick = pEditClick
  end
  object pDel: TSpeedButton
    Left = 240
    Top = 88
    Width = 28
    Height = 26
    Hint = 'Удалить резервуар'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      E6000000424DE60000000000000076000000280000000E0000000E0000000100
      0400000000007000000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3300333333333333330033333333333333003333333333333300333333333333
      330033333333333333003300000000003300330FFFFFFFF03300330000000000
      3300333333333333330033333333333333003333333333333300333333333333
      33003333333333333300}
    ParentFont = False
    Visible = False
    OnClick = pDelClick
  end
  object Label5: TLabel
    Left = 264
    Top = 0
    Width = 53
    Height = 13
    Caption = 'Категория'
  end
  object Label6: TLabel
    Left = 192
    Top = 40
    Width = 131
    Height = 13
    Caption = 'Коррекция днища (куб.м.)'
  end
  object Label7: TLabel
    Left = 336
    Top = 40
    Width = 119
    Height = 13
    Caption = 'Дата посл. калибровки'
  end
  object bbOk: TBitBtn
    Left = 416
    Top = 275
    Width = 87
    Height = 25
    Hint = 'Создать новую организацию'
    Cancel = True
    Caption = '&Принять'
    ModalResult = 1
    TabOrder = 5
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
    Left = 512
    Top = 275
    Width = 87
    Height = 25
    Hint = 'Закрыть окнр'
    Caption = '&Отменить'
    TabOrder = 6
    Kind = bkCancel
  end
  object ListView1: TListView
    Left = 6
    Top = 120
    Width = 595
    Height = 147
    Columns = <
      item
        Caption = '№'
        MaxWidth = 30
        MinWidth = 30
        Width = 30
      end
      item
        Caption = 'Название'
        MaxWidth = 100
        MinWidth = 100
        Width = 100
      end
      item
        Caption = 'Объем'
        MaxWidth = 50
        MinWidth = 50
      end
      item
        Caption = 'М. Остаток'
        MaxWidth = 70
        MinWidth = 70
        Width = 70
      end
      item
        Caption = 'DbId'
        Width = 0
      end
      item
        Caption = 'DbInst'
        Width = 0
      end
      item
        Caption = 'Категория'
        Width = 140
      end
      item
        Caption = 'Корр.днища'
        Width = 75
      end
      item
        Caption = 'Дата посл. калибр.'
        Width = 110
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 4
    ViewStyle = vsReport
    OnClick = ListView1Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 56
    Width = 89
    Height = 21
    Hint = 'Объем'
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 64
    Top = 16
    Width = 193
    Height = 21
    Hint = 'Название'
    TabOrder = 1
  end
  object ce2: TCurrencyEdit
    Left = 104
    Top = 56
    Width = 81
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
    TabOrder = 3
  end
  object ce1: TEdit
    Left = 8
    Top = 16
    Width = 49
    Height = 21
    TabOrder = 0
    OnKeyPress = ce1KeyPress
  end
  object CEKat: TComboEdit
    Left = 264
    Top = 16
    Width = 193
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 7
    OnButtonClick = CEKatButtonClick
  end
  object CalcDno_Corr: TRxCalcEdit
    Left = 192
    Top = 56
    Width = 129
    Height = 21
    AutoSize = False
    DecimalPlaces = 6
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 8
  end
  object DELast_Cal_Date: TDateEdit
    Left = 336
    Top = 56
    Width = 121
    Height = 21
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 9
  end
  object BitBtn1: TBitBtn
    Left = 280
    Top = 275
    Width = 129
    Height = 25
    Caption = 'Калибровка'
    TabOrder = 10
    OnClick = BitBtn1Click
  end
  object admq: TOilQuery
    SessionName = 'Default'
    Left = 8
    Top = 256
  end
  object canDeleteQuery: TOilQuery
    SQL.Strings = (
      'select sum(co) as a from'
      '  (select count(*) as  co from oil_prih_det '
      '  where rez = :rez_id and'
      '               rez_inst = :rez_inst and'
      '               state = '#39'Y'#39
      '  union '
      '  select count(*) as co from oil_rashod'
      '  where rez = :rez_id2 and'
      '               rez_inst = :rez_inst2 and'
      '               state = '#39'Y'#39')  ')
    Left = 80
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rez_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'rez_inst'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'rez_id2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'rez_inst2'
        ParamType = ptUnknown
      end>
  end
end
