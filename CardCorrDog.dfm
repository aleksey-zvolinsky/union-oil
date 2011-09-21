inherited CardCorrDogForm: TCardCorrDogForm
  Top = 325
  Width = 500
  Height = 257
  Caption = 'Корректировка договора'
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 500
  Constraints.MinHeight = 200
  Constraints.MinWidth = 355
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbg: TDBGridEh
    Left = 0
    Top = 52
    Width = 492
    Height = 134
    Align = alClient
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clBtnFace
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clBlack
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    Columns = <
      item
        Alignment = taLeftJustify
        EditButtons = <>
        FieldName = 'Oper'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        KeyList.Strings = (
          '1'
          '2')
        PickList.Strings = (
          'Снять'
          'Добавить')
        Title.Alignment = taCenter
        Title.Caption = 'Операция'
        Width = 65
      end
      item
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'NpName'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Тип НП'
        Width = 133
        OnEditButtonClick = dbgColumns0EditButtonClick
      end
      item
        EditButtons = <>
        FieldName = 'Price'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Цена'
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'Sum'
        Footer.FieldName = 'Sum'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clBlack
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Сумма (грн)'
        Width = 118
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 186
    Width = 492
    Height = 37
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 1
    object Panel2: TPanel
      Left = 305
      Top = 1
      Width = 182
      Height = 31
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbClose: TBitBtn
        Left = 93
        Top = 3
        Width = 85
        Height = 27
        Anchors = [akRight, akBottom]
        Caption = 'Закрыть'
        ModalResult = 2
        TabOrder = 0
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
      object bbOk: TBitBtn
        Left = 3
        Top = 3
        Width = 87
        Height = 27
        Anchors = [akRight, akBottom]
        Caption = 'Принять'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
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
    end
    object Panel4: TPanel
      Left = 3
      Top = 3
      Width = 71
      Height = 27
      BevelOuter = bvNone
      TabOrder = 1
      object sbAdd: TSpeedButton
        Left = 4
        Top = 1
        Width = 28
        Height = 26
        Anchors = [akLeft, akBottom]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800008
          88888888888777788888800000009900088887777777FF77788880FFFFF0990F
          088887888887FF78788880FF00009900008887887777FF77778880FF09999999
          908887887FFFFFFFF78880FF09999999908887887FFFFFFFF78880FF00009900
          008887887777FF77778880F0FFF0990F088887878887FF78788880FFFFF0990F
          088887888887FF78788880F0F0F0000F0888878787877778788880FFFFFFFFFF
          0888878888888888788880F000F0FFFF0888878777878888788880FFFFFFF000
          0888878888888777788880F000FFF0808888878777888787888880FFFFFFF008
          8888878888888778888880000000008888888777777777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbAddClick
      end
      object sbDel: TSpeedButton
        Left = 34
        Top = 1
        Width = 28
        Height = 26
        Hint = 'Удалить'
        Anchors = [akLeft, akBottom]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888888888888000000000000888877777777777788880FFFFFFFFFF
          0888878888888888788880FFFFFFFFFF0888878888888888788880FF00000000
          0088878877777777778880FF09999999908887887FFFFFFFF78880FF09999999
          908887887FFFFFFFF78880FF000000000088878877777777778880FFFFFFFFFF
          0888878888888888788880F0F00F000F0888878787787778788880FFFFFFFFFF
          0888878888888888788880F000F0FFFF0888878777878888788880FFFFFFF000
          0888878888888777788880F000FFF0808888878777888787888880FFFFFFF008
          8888878888888778888880000000008888888777777777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbDelClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 52
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 2
    object Label1: TLabel
      Left = 136
      Top = 4
      Width = 44
      Height = 13
      Caption = 'Договор'
    end
    object Label2: TLabel
      Left = 234
      Top = 4
      Width = 38
      Height = 13
      Caption = 'Вид НП'
    end
    object Label3: TLabel
      Left = 362
      Top = 4
      Width = 75
      Height = 13
      Caption = 'Доступно (грн)'
    end
    object Bevel1: TBevel
      Left = -2
      Top = -1
      Width = 123
      Height = 50
      Shape = bsFrame
    end
    object Label4: TLabel
      Left = 8
      Top = 4
      Width = 89
      Height = 13
      Caption = 'Дата переброски'
    end
    object edDogName: TEdit
      Left = 138
      Top = 21
      Width = 89
      Height = 19
      Color = clBtnFace
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edNpType: TEdit
      Left = 234
      Top = 21
      Width = 122
      Height = 19
      Color = clBtnFace
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edCountLitr: TEdit
      Left = 363
      Top = 21
      Width = 102
      Height = 19
      Color = clBtnFace
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object deCorr: TDateEdit
      Left = 9
      Top = 21
      Width = 105
      Height = 21
      DirectInput = False
      NumGlyphs = 2
      TabOrder = 3
    end
  end
  object ds: TOraDataSource
    DataSet = vt
    Left = 233
    Top = 109
  end
  object vt: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'NpType'
        DataType = ftFloat
      end
      item
        Name = 'NpName'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Price'
        DataType = ftFloat
      end
      item
        Name = 'Sum'
        DataType = ftFloat
      end
      item
        Name = 'Oper'
        DataType = ftFloat
      end>
    Left = 272
    Top = 110
    Data = {
      0100050006004E70547970650600000006004E704E616D650100140005005072
      69636506000000030053756D0600000004004F70657206000000000000000000}
    object vtNpType: TFloatField
      FieldName = 'NpType'
    end
    object vtNpName: TStringField
      FieldName = 'NpName'
    end
    object vtPrice: TFloatField
      FieldName = 'Price'
    end
    object vtSum: TFloatField
      FieldName = 'Sum'
    end
    object vtOper: TFloatField
      FieldName = 'Oper'
    end
  end
  object qWork: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 32
    Top = 136
  end
end
