inherited CardAlienRestForm: TCardAlienRestForm
  Left = 248
  Top = 176
  Width = 707
  Height = 514
  BorderIcons = [biSystemMenu]
  Caption = 'Ввод и редактирование остатков по чужим списаниям'
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 241
    Height = 487
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object gridObl: TDBGridEh
      Left = 2
      Top = 2
      Width = 237
      Height = 483
      Align = alClient
      DataSource = dsGrid
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = gridOblGetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = 'Облнефтепродукт'
          Width = 1000
        end
        item
          EditButtons = <>
          FieldName = 'DOG'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'START_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'LAST_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 88
        end
        item
          EditButtons = <>
          FieldName = 'SB_COUNT'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end>
    end
  end
  object Panel9: TPanel
    Left = 241
    Top = 0
    Width = 458
    Height = 487
    Align = alRight
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel1: TPanel
      Left = 2
      Top = 328
      Width = 454
      Height = 122
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      DesignSize = (
        454
        122)
      object Panel12: TPanel
        Left = 2
        Top = 2
        Width = 450
        Height = 118
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Panel12'
        TabOrder = 2
        object SpeedButton1: TSpeedButton
          Left = 6
          Top = 92
          Width = 25
          Height = 25
          Hint = 'Удалить'
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
          OnClick = SpeedButton1Click
        end
        object cbMoneyAuto: TCheckBox
          Left = 40
          Top = 94
          Width = 265
          Height = 17
          Caption = 'Автоматически пересчитывать сумму по цене'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
      object gridMoney: TDBGridEh
        Left = 8
        Top = -1
        Width = 439
        Height = 89
        Anchors = [akLeft, akRight, akBottom]
        DataSource = dsMoney
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        FooterRowCount = 1
        ParentFont = False
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
            EditButtons = <>
            FieldName = 'DATE_'
            Footers = <>
            Title.Caption = 'Дата'
            Width = 58
          end
          item
            AutoFitColWidth = False
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'NP_GROUP'
            Footers = <>
            Title.Caption = 'Группа НП'
            Width = 67
            OnEditButtonClick = gridMoneyColumns1EditButtonClick
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'NP_GROUP_ID'
            Footers = <>
            Visible = False
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'NN_NUM'
            Footers = <>
            Title.Caption = '№ нал.нак.'
            Width = 65
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'COUNT'
            Footers = <
              item
                ValueType = fvtSum
              end>
            Title.Caption = 'Кол-во'
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            Title.Caption = 'Цена'
            Width = 62
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'SUMMA'
            Footer.ValueType = fvtSum
            Footers = <
              item
                ValueType = fvtSum
              end>
            Title.Caption = 'Сумма'
            Width = 62
          end>
      end
      object Panel7: TPanel
        Left = 322
        Top = 91
        Width = 124
        Height = 24
        Anchors = [akRight, akBottom]
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object sbClearCredit: TSpeedButton
          Left = 0
          Top = 0
          Width = 124
          Height = 24
          Caption = 'Обнулить кредит'
          Flat = True
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
          OnClick = sbClearCreditClick
        end
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 454
      Height = 23
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'ДЕБЕТ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel6: TPanel
      Left = 2
      Top = 25
      Width = 454
      Height = 280
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      DesignSize = (
        454
        280)
      object Label1: TLabel
        Left = 8
        Top = 4
        Width = 248
        Height = 13
        Caption = 'Не выписаны налоговые накладные (ДТ)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 224
        Width = 203
        Height = 26
        Anchors = [akLeft, akBottom]
        Caption = 'Выписаны налоговые накладные '#13#10'(прочие отпуски) на сумму'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 288
        Top = 231
        Width = 42
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'гривен'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 256
        Width = 173
        Height = 16
        Anchors = [akLeft, akBottom]
        Caption = 'Общий дебет на сумму '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDebSum: TLabel
        Left = 184
        Top = 256
        Width = 38
        Height = 16
        Anchors = [akLeft, akBottom]
        Caption = '0 грн'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gridDT: TDBGridEh
        Left = 8
        Top = 20
        Width = 439
        Height = 125
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsDT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        FooterRowCount = 1
        ParentFont = False
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'NP_GROUP'
            Footers = <>
            Title.Caption = 'Группа НП'
            Width = 88
            OnEditButtonClick = gridDTColumns0EditButtonClick
          end
          item
            EditButtons = <>
            FieldName = 'COUNT'
            Footers = <
              item
                FieldName = 'COUNT'
                ValueType = fvtSum
              end>
            Title.Caption = 'Кол-во'
            Width = 96
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            Title.Caption = 'Цена'
            Width = 102
          end
          item
            EditButtons = <>
            FieldName = 'SUMMA'
            Footers = <
              item
                FieldName = 'SUMMA'
                ValueType = fvtSum
              end>
            Title.Caption = 'Сумма'
            Width = 107
          end>
      end
      object clcPr: TRxCalcEdit
        Left = 212
        Top = 229
        Width = 73
        Height = 21
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ButtonWidth = 0
        Anchors = [akLeft, akBottom]
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
        OnChange = clcPrChange
      end
      object Panel5: TPanel
        Left = 322
        Top = 248
        Width = 124
        Height = 24
        Anchors = [akRight, akBottom]
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object sbClearDebet: TSpeedButton
          Left = 0
          Top = 0
          Width = 124
          Height = 24
          Caption = 'Обнулить дебет'
          Flat = True
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
          OnClick = sbClearDebetClick
        end
      end
      object Panel8: TPanel
        Left = 8
        Top = 145
        Width = 489
        Height = 33
        Anchors = [akLeft, akBottom]
        BevelInner = bvLowered
        BevelOuter = bvSpace
        TabOrder = 3
        object sbDel: TSpeedButton
          Left = 6
          Top = 4
          Width = 25
          Height = 25
          Hint = 'Удалить'
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
        object cbAuto: TCheckBox
          Left = 48
          Top = 8
          Width = 265
          Height = 17
          Caption = 'Автоматически пересчитывать сумму по цене'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
      object Panel10: TPanel
        Left = 8
        Top = 178
        Width = 489
        Height = 41
        BevelInner = bvLowered
        TabOrder = 4
        DesignSize = (
          489
          41)
        object Label3: TLabel
          Left = 8
          Top = 16
          Width = 67
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Перебросить'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 152
          Top = 16
          Width = 85
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'литров на сумму'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 316
          Top = 16
          Width = 35
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'гривен'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object sbMove: TSpeedButton
          Left = 354
          Top = 11
          Width = 23
          Height = 22
          Anchors = [akLeft, akBottom]
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
            333333333330333333333333330C033333333333330C03333333333330CCC033
            3333333330CCC033333333330CCCCC03333333330CCCCC0333333330CCCCCCC0
            33333330000C000033333333330C033333333333330C033333333333330C0333
            33333333330C033333333333330C033333333333330003333333}
          OnClick = sbMoveClick
        end
        object clcDebCount: TRxCalcEdit
          Left = 80
          Top = 12
          Width = 65
          Height = 21
          AutoSize = False
          DecimalPlaces = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ButtonWidth = 0
          Anchors = [akLeft, akBottom]
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
          OnChange = clcDebCountChange
        end
        object clcDebSumma: TRxCalcEdit
          Left = 244
          Top = 12
          Width = 65
          Height = 21
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ButtonWidth = 0
          Anchors = [akLeft, akBottom]
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 450
      Width = 454
      Height = 35
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      DesignSize = (
        454
        35)
      object Label8: TLabel
        Left = 8
        Top = 10
        Width = 57
        Height = 13
        Caption = 'Остатки на'
      end
      object bbOk: TBitBtn
        Left = 274
        Top = 8
        Width = 88
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Принять'
        Default = True
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
        Left = 366
        Top = 8
        Width = 88
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Закрыть'
        TabOrder = 1
        OnClick = bbCancelClick
        Kind = bkCancel
      end
      object deNa: TDateEdit
        Left = 72
        Top = 8
        Width = 97
        Height = 21
        NumGlyphs = 2
        TabOrder = 2
        OnChange = deNaChange
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 305
      Width = 454
      Height = 23
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'КРЕДИТ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
  end
  object qGrid: TOilQuery
    SQL.Strings = (
      'select /*+ORDERED USE_HASH(dog,oo,sb,ctr)*/'
      
        '      distinct oo.id,oo.name,ctr.start_date,ctr.co as ct_rest_co' +
        'unt,max(sb.s_date) as last_date,'
      '      count(sb.id) as sb_count'
      'from oil_dog dog,v_org oo,'
      
        '     (select * from oil_sale_book where state=''Y'' and nal_t in (' +
        '7,8,9)) sb,'
      
        '     (select obl_id,obl_inst,start_date,count(*) as co from oil_' +
        'ct_rest where state=''Y'' group by obl_id,obl_inst,start_date) ctr'
      'where dog.state=''Y'''
      '      and dog.to_=oo.id and dog.to_inst=oo.inst'
      '      and dog.from_<>dog.to_'
      '      and oo.org_type=4'
      '      and dog.dog_type=''K'''
      '      and dog.to_=ctr.obl_id(+) and dog.to_inst=ctr.obl_inst(+)'
      '      and dog.dog_date='
      '          (select min(dog_date) from oil_dog'
      
        '           where oil_dog.to_=dog.to_ and oil_dog.to_inst=dog.to_' +
        'inst'
      '                 and oil_dog.dog_type=''K'' and oil_dog.state=''Y'')'
      '      and sb.organ(+)=dog.to_ and sb.organ_inst(+)=dog.to_inst'
      'group by oo.id,oo.name,dog.dog,ctr.co,ctr.start_date'
      'order by name'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 152
    Top = 232
    object qGridNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object qGridLAST_DATE: TDateTimeField
      FieldName = 'LAST_DATE'
    end
    object qGridSB_COUNT: TFloatField
      FieldName = 'SB_COUNT'
    end
    object qGridID: TFloatField
      FieldName = 'ID'
    end
    object qGridCT_REST_COUNT: TFloatField
      FieldName = 'CT_REST_COUNT'
    end
    object qGridSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
    end
  end
  object dsGrid: TOraDataSource
    DataSet = qGrid
    OnDataChange = dsGridDataChange
    Left = 208
    Top = 232
  end
  object qDeb: TOilQuery
    SQL.Strings = (
      'select table_name,oplat_only,'
      '       decode(oplat_only,''Y'',date_,to_date(null)) as date_,'
      '       decode(oplat_only,''Y'',price,to_number(null)) as price,'
      
        '       decode(oplat_only,''Y'',np_group_id,to_number(null)) as np_' +
        'group_id,'
      '       sum(count) as count,sum(summa) as summa'
      'from v_card_transit'
      'where oblid=:oblid and date_<:date_'
      'group by table_name,oplat_only,'
      '         decode(oplat_only,''Y'',date_,to_date(null)),'
      '         decode(oplat_only,''Y'',price,to_number(null)),'
      '         decode(oplat_only,''Y'',np_group_id,to_number(null))'
      'order by table_name desc,oplat_only desc,date_'
      ' ')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 152
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oblid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end>
    object qDebTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Size = 12
    end
    object qDebOPLAT_ONLY: TStringField
      FieldName = 'OPLAT_ONLY'
      Size = 1
    end
    object qDebPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object qDebSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object qDebDATE_: TDateTimeField
      FieldName = 'DATE_'
    end
    object qDebCOUNT: TFloatField
      FieldName = 'COUNT'
    end
    object qDebNP_GROUP_ID: TFloatField
      FieldName = 'NP_GROUP_ID'
    end
  end
  object mtDT: TMemoryTable
    AfterPost = mtDTAfterPost
    Left = 595
    Top = 113
    object mtDTNP_GROUP: TStringField
      FieldName = 'NP_GROUP'
      Size = 50
    end
    object mtDTNP_GROUP_ID: TFloatField
      FieldName = 'NP_GROUP_ID'
    end
    object mtDTCOUNT: TFloatField
      FieldName = 'COUNT'
      OnChange = mtDTCOUNTChange
      DisplayFormat = '0.000'
      Precision = 3
    end
    object mtDTPRICE: TFloatField
      FieldName = 'PRICE'
      OnChange = mtDTPRICEChange
      DisplayFormat = '0.00'
      Precision = 2
    end
    object mtDTSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = '0.00'
      Precision = 2
    end
  end
  object dsDT: TOraDataSource
    DataSet = mtDT
    OnDataChange = dsDTDataChange
    Left = 643
    Top = 113
  end
  object qRest: TOilQuery
    SQL.Strings = (
      'select sum(summa) as rest'
      'from v_card_transit'
      'where oblid=:oblid'
      '      and date_<:date_')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 208
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oblid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end>
    object qRestREST: TFloatField
      FieldName = 'REST'
      Origin = 'V_CARD_TRANSIT.SUMMA'
    end
  end
  object qCred: TOilQuery
    SQL.Strings = (
      'select table_name,'
      
        '       decode(table_name,''OIL_MONEY'',date_,to_date(null)) as dat' +
        'e_,'
      
        '       decode(table_name,''OIL_MONEY'',id,to_number(null)) as id, ' +
        '      '
      '       sum(summa) as summa'
      'from v_card_transit'
      'where oblid=:oblid and date_<:date_'
      
        'group by table_name,decode(table_name,''OIL_MONEY'',date_,to_date(' +
        'null)),decode(table_name,''OIL_MONEY'',id,to_number(null))'
      'order by table_name,date_')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 152
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oblid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end>
    object qCredTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Size = 12
    end
    object qCredDATE_: TDateTimeField
      FieldName = 'DATE_'
    end
    object qCredID: TFloatField
      FieldName = 'ID'
    end
    object qCredSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
  end
  object mtMoney: TMemoryTable
    Left = 603
    Top = 353
    object mtMoneyDATE_: TDateField
      FieldName = 'DATE_'
    end
    object mtMoneyNP_GROUP: TStringField
      FieldName = 'NP_GROUP'
      Size = 50
    end
    object mtMoneyNP_GROUP_ID: TFloatField
      FieldName = 'NP_GROUP_ID'
    end
    object mtMoneyNN_NUM: TStringField
      FieldName = 'NN_NUM'
    end
    object mtMoneyCount: TFloatField
      FieldName = 'COUNT'
      OnChange = mtMoneyCountChange
      DisplayFormat = '0.000'
      Precision = 3
    end
    object mtMoneyPrice: TFloatField
      FieldName = 'PRICE'
      OnChange = mtMoneyPriceChange
      DisplayFormat = '0.00'
      Precision = 2
    end
    object mtMoneySumma: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = '0.00'
      Precision = 2
    end
  end
  object dsMoney: TOraDataSource
    DataSet = mtMoney
    Left = 659
    Top = 353
  end
  object qMoneyCount: TOilQuery
    SQL.Strings = (
      'select count(*) as co'
      'from v_card_transit'
      'where oblid=:oblid and date_<:date_'
      '      and table_name=''OIL_MONEY''')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 208
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oblid'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end>
    object qMoneyCountCO: TFloatField
      FieldName = 'CO'
    end
  end
  object qCtRest: TOilQuery
    SQL.Strings = (
      'select *'
      'from oil_ct_rest'
      'where obl_id=:oblid and obl_id=obl_inst '
      '      and state=''Y''')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 152
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oblid'
        ParamType = ptInput
      end>
    object qCtRestOBL_ID: TFloatField
      FieldName = 'OBL_ID'
      Origin = 'OIL_CT_REST.OBL_ID'
    end
    object qCtRestOBL_INST: TFloatField
      FieldName = 'OBL_INST'
      Origin = 'OIL_CT_REST.OBL_INST'
    end
    object qCtRestSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
      Origin = 'OIL_CT_REST.START_DATE'
    end
    object qCtRestNP_GROUP_ID: TFloatField
      FieldName = 'NP_GROUP_ID'
      Origin = 'OIL_CT_REST.NP_GROUP_ID'
    end
    object qCtRestCOUNT_: TFloatField
      FieldName = 'COUNT_'
      Origin = 'OIL_CT_REST.COUNT_'
    end
    object qCtRestPRICE: TFloatField
      FieldName = 'PRICE'
      Origin = 'OIL_CT_REST.PRICE'
    end
    object qCtRestSUMMA: TFloatField
      FieldName = 'SUMMA'
      Origin = 'OIL_CT_REST.SUMMA'
    end
    object qCtRestNN_DATE: TDateTimeField
      FieldName = 'NN_DATE'
      Origin = 'OIL_CT_REST.NN_DATE'
    end
    object qCtRestNN_NUM: TFloatField
      FieldName = 'NN_NUM'
      Origin = 'OIL_CT_REST.NN_NUM'
    end
  end
  object qUpdDoc: TOilQuery
    SQL.Strings = (
      'update card_transit'
      'set doc_number=null'
      'where trunc(oper_date)>=:date_'
      '  and Card.GetObl(card_number,oper_date)=:obl_id'
      ' ')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 208
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'date_'
      end
      item
        DataType = ftUnknown
        Name = 'obl_id'
      end>
  end
end
