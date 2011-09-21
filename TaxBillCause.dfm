inherited TaxBillCauseForm: TTaxBillCauseForm
  Left = 266
  Top = 286
  Width = 789
  Height = 355
  BorderIcons = []
  Caption = 'Настройка печати налоговых накладных'
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbg: TDBGridEh
    Left = 0
    Top = 0
    Width = 781
    Height = 280
    Align = alClient
    DataSource = ds
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnColEnter = dbgColEnter
    OnColExit = dbgColEnter
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Title.Caption = 'Код'
        Width = 24
      end
      item
        EditButtons = <>
        FieldName = 'NAME_'
        Footers = <>
        Title.Caption = 'Название'
        Width = 159
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'HIDE'
        Footers = <>
        KeyList.Strings = (
          'N;'
          'Y;')
        Title.Caption = 'Возм. созд. ручную'
        Title.Hint = 'Возможность создать ручную'
        Width = 105
        WordWrap = False
      end
      item
        EditButtons = <>
        FieldName = 'SCHEME'
        Footers = <>
        Title.Caption = 'Схема'
        Width = 139
      end
      item
        EditButtons = <>
        FieldName = 'TOVAR_TYPE'
        Footers = <>
        Title.Caption = 'Источник товара'
        Width = 132
      end
      item
        EditButtons = <>
        FieldName = 'NDS_CALC_ORIENTATION'
        Footers = <>
        Title.Caption = 'Расчет НДС'
        Title.Hint = 'Способ расчета НДС'
        Width = 149
      end
      item
        EditButtons = <>
        FieldName = 'DECIMAL_COUNT'
        Footers = <>
        Title.Caption = 'Кол-во дробных знаков|Количество'
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'DECIMAL_PRICE'
        Footers = <>
        Title.Caption = 'Кол-во дробных знаков|Цена'
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'COMMENT_'
        Footers = <>
        Title.Caption = 'Коментарий'
      end>
  end
  object pBtn: TPanel
    Left = 0
    Top = 280
    Width = 781
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 599
      Top = 7
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Принять'
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
      Left = 689
      Top = 7
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Отмена'
      ModalResult = 2
      TabOrder = 1
      OnClick = bbCancelClick
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
  end
  object q: TOilQuery
    SQLUpdate.Strings = (
      'update oil_nn_cause'
      '   set scheme=:scheme,'
      '       tovar_type=:tovar_type,'
      '       nds_calc_orientation=:nds_calc_orientation,'
      '       decimal_count=:decimal_count,'
      '       decimal_price=:decimal_price'
      ' where id=:id'
      '   and inst=:inst')
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select * from oil_nn_cause order by id')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 344
    Top = 248
    object qID: TFloatField
      DisplayWidth = 10
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object qNAME_: TStringField
      DisplayWidth = 29
      FieldName = 'NAME_'
      ReadOnly = True
      Size = 50
    end
    object qCOMMENT_: TStringField
      DisplayWidth = 26
      FieldName = 'COMMENT_'
      ReadOnly = True
      Size = 50
    end
    object qHIDE: TStringField
      DisplayWidth = 9
      FieldName = 'HIDE'
      ReadOnly = True
      Required = True
      Size = 1
    end
    object qSCHEME: TFloatField
      DisplayWidth = 10
      FieldName = 'SCHEME'
    end
    object qTOVAR_TYPE: TFloatField
      DisplayWidth = 10
      FieldName = 'TOVAR_TYPE'
    end
    object qNDS_CALC_ORIENTATION: TFloatField
      DisplayWidth = 10
      FieldName = 'NDS_CALC_ORIENTATION'
    end
    object qDECIMAL_COUNT: TFloatField
      FieldName = 'DECIMAL_COUNT'
    end
    object qDECIMAL_PRICE: TFloatField
      FieldName = 'DECIMAL_PRICE'
    end
  end
  object ds: TOraDataSource
    DataSet = q
    Left = 312
    Top = 248
  end
end
