inherited E_OptionsForm: TE_OptionsForm
  Left = 365
  Top = 284
  Width = 447
  Height = 357
  BorderIcons = []
  Caption = 'Опции'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 439
    Height = 291
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = 'Импорт'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 431
        Height = 33
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object cbImpLog: TCheckBox
          Left = 8
          Top = 8
          Width = 121
          Height = 17
          Caption = 'Вести лог в файле:'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object edImpLogFile: TEdit
          Left = 136
          Top = 4
          Width = 284
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Text = 'import.log'
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 33
        Width = 431
        Height = 230
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object cb_I1C_TestRecordExists: TCheckBox
          Left = 8
          Top = 8
          Width = 281
          Height = 17
          Caption = 'Проверять записи на существование'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object cb_I1C_WITHNDS: TCheckBox
          Left = 8
          Top = 32
          Width = 209
          Height = 17
          Caption = 'Импортировать записи с НДС'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object cb_I1C_ANALIZEORGNAME: TCheckBox
          Left = 8
          Top = 56
          Width = 209
          Height = 17
          Caption = 'Анализировать название фирм'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object cb_I1C_ReplaceOrgName: TCheckBox
          Left = 8
          Top = 80
          Width = 225
          Height = 17
          Caption = 'Предлагать замену названия фирмы'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object cb_I1C_AddFirmaAuto: TCheckBox
          Left = 8
          Top = 104
          Width = 289
          Height = 17
          Caption = 'Добавлять отсутствующие фирмы автоматически'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object cb_I1C_SearchST: TCheckBox
          Left = 8
          Top = 128
          Width = 369
          Height = 17
          Caption = 'Искать в комментарии номер статьи. Примеры:   "ст.34", "ст34"'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object cb_I1C_SearchNB: TCheckBox
          Left = 8
          Top = 152
          Width = 321
          Height = 17
          Caption = 'Искать в комментарии ID нефтебазы. Пример:   "нб616"'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 291
    Width = 439
    Height = 32
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bbCancel: TBitBtn
      Left = 349
      Top = 4
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Отменить'
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
      Left = 258
      Top = 4
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Принять'
      Default = True
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
end
