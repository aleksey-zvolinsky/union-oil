inherited RezKalForm: TRezKalForm
  Left = 232
  Top = 207
  Width = 813
  Height = 677
  Caption = 'Калибровочная таблица резервуара'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 805
    Height = 85
    Align = alTop
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 10
      Width = 68
      Height = 13
      Caption = 'Резервуар №'
    end
    object Label5: TLabel
      Left = 8
      Top = 34
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Label6: TLabel
      Left = 8
      Top = 58
      Width = 19
      Height = 13
      Caption = 'Тип'
    end
    object Label7: TLabel
      Left = 216
      Top = 10
      Width = 44
      Height = 13
      Caption = 'Емкость'
    end
    object Label8: TLabel
      Left = 216
      Top = 34
      Width = 89
      Height = 13
      Caption = 'Мертвый остаток'
    end
    object Label9: TLabel
      Left = 448
      Top = 34
      Width = 89
      Height = 13
      Caption = 'Дата калибровки'
    end
    object Label10: TLabel
      Left = 448
      Top = 10
      Width = 91
      Height = 13
      Caption = 'Коррекция днища'
    end
    object Edit1: TEdit
      Left = 80
      Top = 8
      Width = 105
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 80
      Top = 32
      Width = 105
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 80
      Top = 56
      Width = 561
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 312
      Top = 8
      Width = 105
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
      Text = 'Edit4'
    end
    object Edit5: TEdit
      Left = 312
      Top = 32
      Width = 105
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
      Text = 'Edit5'
    end
    object Edit6: TEdit
      Left = 544
      Top = 8
      Width = 97
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
      Text = 'Edit6'
    end
    object Edit7: TEdit
      Left = 544
      Top = 32
      Width = 97
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
      Text = 'Edit7'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 85
    Width = 805
    Height = 558
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 0
      Top = 153
      Width = 805
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      MinSize = 1
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 805
      Height = 153
      Align = alTop
      TabOrder = 0
      OnCanResize = Panel3CanResize
      OnResize = Panel3Resize
      object Label1: TLabel
        Left = 5
        Top = 3
        Width = 94
        Height = 13
        Caption = 'Пояса резервуара'
      end
      object SpeedButton1: TSpeedButton
        Left = 787
        Top = 3
        Width = 16
        Height = 15
        AllowAllUp = True
        Anchors = [akTop, akRight]
        GroupIndex = 1
        Glyph.Data = {
          96010000424D96010000000000007600000028000000300000000C0000000100
          0400000000002001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777777777000000000077888888888877777
          7007777777777007777777000000007777888888887777770000777777770000
          7777777000000777777888888777777000000777777000000777777700007777
          7777888877777700000000777700000000777777700777777777788777777000
          0000000770000000000770000000000778888888888777777007777777777007
          7777770000000077778888888877777700007777777700007777777000000777
          7778888887777770000007777770000007777777000077777777888877777700
          0000007777000000007777777007777777777887777770000000000770000000
          0007777777777777777777777777777777777777777777777777}
        NumGlyphs = 4
        OnClick = SpeedButton1Click
      end
      object Panel7: TPanel
        Left = 1
        Top = 19
        Width = 803
        Height = 133
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderWidth = 2
        Caption = 'Panel7'
        TabOrder = 0
        object Panel10: TPanel
          Left = 683
          Top = 3
          Width = 117
          Height = 127
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object SpeedButton4: TSpeedButton
            Left = 8
            Top = 8
            Width = 25
            Height = 25
            Hint = 'Добавить запись'
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
            OnClick = SpeedButton4Click
          end
          object SpeedButton5: TSpeedButton
            Left = 34
            Top = 8
            Width = 25
            Height = 25
            Hint = 'Удалить запись'
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
            OnClick = SpeedButton5Click
          end
          object SpeedButton10: TSpeedButton
            Left = 60
            Top = 8
            Width = 25
            Height = 25
            Hint = 'Сохранить изменения'
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
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton10Click
          end
          object SpeedButton11: TSpeedButton
            Left = 86
            Top = 8
            Width = 25
            Height = 25
            Hint = 'Отменить изменения'
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
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton11Click
          end
        end
        object RxDBGrid1: TDBGridEh
          Left = 3
          Top = 3
          Width = 680
          Height = 127
          Align = alClient
          DataSource = DataSource1
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          TabOrder = 0
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
              FieldName = 'REZ_ID'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'REZ_INST'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'BELT_NO'
              Footers = <>
              Title.Caption = 'Номер пояса'
            end
            item
              EditButtons = <>
              FieldName = 'BELT_BOTTOM_HGT'
              Footers = <>
              Title.Caption = 'Высота нижнего края мм'
            end>
        end
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 156
      Width = 805
      Height = 402
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel4'
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 0
        Top = 243
        Width = 805
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        Beveled = True
        MinSize = 19
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 805
        Height = 243
        Align = alClient
        TabOrder = 0
        OnCanResize = Panel3CanResize
        OnResize = Panel5Resize
        object Label2: TLabel
          Left = 5
          Top = 3
          Width = 117
          Height = 13
          Caption = 'Взлив по сантиметрам'
        end
        object SpeedButton2: TSpeedButton
          Left = 787
          Top = 3
          Width = 16
          Height = 15
          AllowAllUp = True
          Anchors = [akTop, akRight]
          GroupIndex = 2
          Glyph.Data = {
            96010000424D96010000000000007600000028000000300000000C0000000100
            0400000000002001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777777777777777000000000077888888888877777
            7007777777777007777777000000007777888888887777770000777777770000
            7777777000000777777888888777777000000777777000000777777700007777
            7777888877777700000000777700000000777777700777777777788777777000
            0000000770000000000770000000000778888888888777777007777777777007
            7777770000000077778888888877777700007777777700007777777000000777
            7778888887777770000007777770000007777777000077777777888877777700
            0000007777000000007777777007777777777887777770000000000770000000
            0007777777777777777777777777777777777777777777777777}
          NumGlyphs = 4
          OnClick = SpeedButton2Click
        end
        object Splitter3: TSplitter
          Left = 1
          Top = 1
          Width = 3
          Height = 241
          Cursor = crHSplit
        end
        object Panel8: TPanel
          Left = 4
          Top = 19
          Width = 800
          Height = 228
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderWidth = 2
          Caption = 'Panel8'
          TabOrder = 0
          object Panel11: TPanel
            Left = 680
            Top = 3
            Width = 117
            Height = 222
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object SpeedButton6: TSpeedButton
              Left = 34
              Top = 8
              Width = 25
              Height = 25
              Hint = 'Удалить запись'
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
              OnClick = SpeedButton6Click
            end
            object SpeedButton7: TSpeedButton
              Left = 8
              Top = 8
              Width = 25
              Height = 25
              Hint = 'Добавить запись'
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
              OnClick = SpeedButton7Click
            end
            object SpeedButton8: TSpeedButton
              Left = 7
              Top = 40
              Width = 41
              Height = 25
              Hint = 'Вычесть 0.001 м.куб.'
              Caption = '-0.001'
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton8Click
            end
            object SpeedButton9: TSpeedButton
              Left = 49
              Top = 40
              Width = 41
              Height = 25
              Hint = 'Прибавить 0.001 м.куб.'
              Caption = '+0,001'
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton9Click
            end
            object SpeedButton12: TSpeedButton
              Left = 60
              Top = 8
              Width = 25
              Height = 25
              Hint = 'Сохранить изменения'
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
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton12Click
            end
            object SpeedButton13: TSpeedButton
              Left = 86
              Top = 8
              Width = 25
              Height = 25
              Hint = 'Отменить изменения'
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
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton13Click
            end
            object cbInterpol: TCheckBox
              Left = 8
              Top = 72
              Width = 97
              Height = 17
              Caption = 'Предсказатель'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object cbHorizont: TCheckBox
              Left = 24
              Top = 96
              Width = 97
              Height = 17
              Caption = 'Гориз. рез.'
              TabOrder = 1
            end
          end
          object RxDBGrid2: TDBGridEh
            Left = 3
            Top = 3
            Width = 677
            Height = 222
            Align = alClient
            DataSource = DataSource2
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            TabOrder = 0
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
                FieldName = 'REZ_ID'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'REZ_INST'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'HGT_CM'
                Footers = <>
                ReadOnly = True
                Title.Caption = 'Взлив см.'
              end
              item
                EditButtons = <>
                FieldName = 'VOLUME'
                Footers = <>
                Title.Caption = 'Объем м.куб.'
              end>
          end
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 246
        Width = 805
        Height = 156
        Align = alBottom
        TabOrder = 1
        OnCanResize = Panel3CanResize
        OnResize = Panel6Resize
        object Label3: TLabel
          Left = 4
          Top = 3
          Width = 175
          Height = 13
          Caption = 'Поправка взлива по  милиметрам'
        end
        object SpeedButton3: TSpeedButton
          Left = 787
          Top = 3
          Width = 16
          Height = 15
          AllowAllUp = True
          Anchors = [akTop, akRight]
          GroupIndex = 3
          Glyph.Data = {
            96010000424D96010000000000007600000028000000300000000C0000000100
            0400000000002001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777777777777777000000000077888888888877777
            7007777777777007777777000000007777888888887777770000777777770000
            7777777000000777777888888777777000000777777000000777777700007777
            7777888877777700000000777700000000777777700777777777788777777000
            0000000770000000000770000000000778888888888777777007777777777007
            7777770000000077778888888877777700007777777700007777777000000777
            7778888887777770000007777770000007777777000077777777888877777700
            0000007777000000007777777007777777777887777770000000000770000000
            0007777777777777777777777777777777777777777777777777}
          NumGlyphs = 4
          OnClick = SpeedButton1Click
        end
        object Panel9: TPanel
          Left = 1
          Top = 19
          Width = 803
          Height = 136
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderWidth = 2
          Caption = 'Panel9'
          TabOrder = 0
          object Panel12: TPanel
            Left = 683
            Top = 3
            Width = 117
            Height = 130
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object SpeedButton14: TSpeedButton
              Left = 8
              Top = 8
              Width = 25
              Height = 25
              Hint = 'Сохранить изменения'
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
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton14Click
            end
            object SpeedButton15: TSpeedButton
              Left = 34
              Top = 8
              Width = 25
              Height = 25
              Hint = 'Отменить изменения'
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
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton15Click
            end
            object cmBitBtn: TBitBtn
              Left = 8
              Top = 40
              Width = 105
              Height = 25
              Caption = 'Разделить см.'
              TabOrder = 0
              OnClick = cmBitBtnClick
            end
            object mmBitBtn: TBitBtn
              Left = 8
              Top = 72
              Width = 105
              Height = 25
              Caption = 'Умножить мм.'
              TabOrder = 1
              OnClick = mmBitBtnClick
            end
          end
          object RxDBGrid3: TDBGridEh
            Left = 3
            Top = 3
            Width = 680
            Height = 130
            Align = alClient
            DataSource = DataSource3
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            TabOrder = 0
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
                FieldName = 'BELT_ID'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'BELT_INST'
                Footers = <>
                Visible = False
              end
              item
                EditButtons = <>
                FieldName = 'HGT_MM'
                Footers = <>
                Title.Caption = 'Приращение взлива мм'
              end
              item
                EditButtons = <>
                FieldName = 'VOL_PLUS'
                Footers = <>
                Title.Caption = 'Приращение объема м.куб.'
              end>
          end
        end
      end
    end
  end
  object Table1: TOraTable
    TableName = 'OIL_RC_BELTS'
    Filtered = True
    AfterInsert = Table1AfterInsert
    AfterEdit = Table1AfterEdit
    AfterPost = Table1AfterPost
    Left = 165
    Top = 176
    object Table1ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object Table1INST: TFloatField
      FieldName = 'INST'
      Required = True
    end
    object Table1STATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object Table1REZ_ID: TFloatField
      FieldName = 'REZ_ID'
      Required = True
    end
    object Table1REZ_INST: TFloatField
      FieldName = 'REZ_INST'
      Required = True
    end
    object Table1BELT_NO: TFloatField
      FieldName = 'BELT_NO'
      Required = True
    end
    object Table1BELT_BOTTOM_HGT: TFloatField
      FieldName = 'BELT_BOTTOM_HGT'
    end
  end
  object Table2: TOraTable
    TableName = 'OIL_RC_CM'
    Filtered = True
    AfterInsert = Table2AfterInsert
    AfterCancel = Table2AfterCancel
    Left = 168
    Top = 336
    object Table2ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object Table2INST: TFloatField
      FieldName = 'INST'
      Required = True
    end
    object Table2STATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object Table2REZ_ID: TFloatField
      FieldName = 'REZ_ID'
      Required = True
    end
    object Table2REZ_INST: TFloatField
      FieldName = 'REZ_INST'
      Required = True
    end
    object Table2HGT_CM: TFloatField
      FieldName = 'HGT_CM'
    end
    object Table2VOLUME: TFloatField
      FieldName = 'VOLUME'
      DisplayFormat = '####0.000'
      EditFormat = '####0.000'
    end
  end
  object Table3: TOraTable
    TableName = 'OIL_RC_MM'
    Filtered = True
    AfterInsert = Table3AfterInsert
    Left = 165
    Top = 492
    object Table3ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object Table3INST: TFloatField
      FieldName = 'INST'
      Required = True
    end
    object Table3STATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object Table3BELT_ID: TFloatField
      FieldName = 'BELT_ID'
      Required = True
    end
    object Table3BELT_INST: TFloatField
      FieldName = 'BELT_INST'
      Required = True
    end
    object Table3HGT_MM: TFloatField
      FieldName = 'HGT_MM'
      ReadOnly = True
    end
    object Table3VOL_PLUS: TFloatField
      FieldName = 'VOL_PLUS'
      DisplayFormat = '####0.000'
      EditFormat = '####0.000'
    end
  end
  object DataSource1: TOraDataSource
    DataSet = Table1
    OnDataChange = DataSource1DataChange
    Left = 221
    Top = 160
  end
  object DataSource2: TOraDataSource
    DataSet = Table2
    OnDataChange = DataSource2DataChange
    Left = 200
    Top = 336
  end
  object DataSource3: TOraDataSource
    DataSet = Table3
    OnDataChange = DataSource3DataChange
    Left = 197
    Top = 492
  end
  object RezQuery: TOilQuery
    SQL.Strings = (
      'select * from'
      '  oil_rezervuar or_,'
      '  oil_rez_types ort'
      'where'
      '  or_.id = :id and'
      '  or_.inst = :inst and'
      '  or_.ub_kat = ort.id and'
      '  or_.state = '#39'Y'#39' and'
      '  ort.state = '#39'Y'#39' '
      ' ')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 200
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
    object RezQueryID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_REZERVUAR.ID'
    end
    object RezQueryID_ORG: TFloatField
      FieldName = 'ID_ORG'
      Origin = 'OIL_REZERVUAR.ID_ORG'
    end
    object RezQuerySTATE: TStringField
      FieldName = 'STATE'
      Origin = 'OIL_REZERVUAR.STATE'
      Size = 1
    end
    object RezQueryINST: TFloatField
      FieldName = 'INST'
      Origin = 'OIL_REZERVUAR.INST'
    end
    object RezQueryNAME: TStringField
      FieldName = 'NAME'
      Origin = 'OIL_REZERVUAR.NAME'
      Size = 50
    end
    object RezQueryCAPACITY: TStringField
      FieldName = 'CAPACITY'
      Origin = 'OIL_REZERVUAR.CAPACITY'
      Size = 50
    end
    object RezQueryDEAD: TFloatField
      FieldName = 'DEAD'
      Origin = 'OIL_REZERVUAR.DEAD'
    end
    object RezQueryNUM: TStringField
      FieldName = 'NUM'
      Origin = 'OIL_REZERVUAR.NUM'
    end
    object RezQueryINST_ORG: TFloatField
      FieldName = 'INST_ORG'
      Origin = 'OIL_REZERVUAR.INST_ORG'
    end
    object RezQueryDATE_MOD: TDateTimeField
      FieldName = 'DATE_MOD'
      Origin = 'OIL_REZERVUAR.DATE_MOD'
    end
    object RezQueryUB_KAT: TFloatField
      FieldName = 'UB_KAT'
      Origin = 'OIL_REZERVUAR.UB_KAT'
    end
    object RezQueryDNO_CORR: TFloatField
      FieldName = 'DNO_CORR'
      Origin = 'OIL_REZERVUAR.DNO_CORR'
    end
    object RezQueryLAST_CAL_DATE: TDateTimeField
      FieldName = 'LAST_CAL_DATE'
      Origin = 'OIL_REZERVUAR.LAST_CAL_DATE'
    end
    object RezQueryID_1: TFloatField
      FieldName = 'ID_1'
      Origin = 'OIL_REZERVUAR.LAST_CAL_DATE'
    end
    object RezQuerySTATE_1: TStringField
      FieldName = 'STATE_1'
      Origin = 'OIL_REZERVUAR.LAST_CAL_DATE'
      Size = 1
    end
    object RezQueryNAME_1: TStringField
      FieldName = 'NAME_1'
      Origin = 'OIL_REZERVUAR.LAST_CAL_DATE'
      Size = 70
    end
  end
  object NextBeltQ: TOilQuery
    SQL.Strings = (
      'select  belt_bottom_hgt from'
      '  oil_rc_belts where'
      '  state = '#39'Y'#39' '
      '  and rez_id = :rez_id'
      '  and rez_inst = :rez_inst '
      '  and belt_no = :belt_no +1')
    MasterSource = DataSource1
        DataSource = DataSource1
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 354
    Top = 150
    ParamData = <
      item
        DataType = ftFloat
        Name = 'REZ_ID'
      end
      item
        DataType = ftFloat
        Name = 'REZ_INST'
      end
      item
        DataType = ftFloat
        Name = 'BELT_NO'
      end>
    object NextBeltQBELT_BOTTOM_HGT: TFloatField
      FieldName = 'BELT_BOTTOM_HGT'
      Origin = 'OIL_RC_BELTS.BELT_BOTTOM_HGT'
    end
  end
  object sBeltquery: TOilQuery
    SQL.Strings = (
      'select s_oil_rc_belts.nextval as nv from sys.dual')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 261
    Top = 144
  end
  object sCmQuery: TOilQuery
    SQL.Strings = (
      'select s_oil_rc_cm.nextval as nv from sys.dual')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 232
    Top = 336
    object sCmQueryNV: TFloatField
      FieldName = 'NV'
    end
  end
  object sMmQuery: TOilQuery
    SQL.Strings = (
      'select s_oil_rc_mm.nextval as nv from sys.dual')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 229
    Top = 492
    object sMmQueryNV: TFloatField
      FieldName = 'NV'
    end
  end
  object OrderTable: TOraTable
    TableName = 'OIL_RC_BELTS'
    Filtered = True
    Left = 354
    Top = 107
    object OrderTableID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OrderTableINST: TFloatField
      FieldName = 'INST'
      Required = True
    end
    object OrderTableSTATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object OrderTableREZ_ID: TFloatField
      FieldName = 'REZ_ID'
      Required = True
    end
    object OrderTableREZ_INST: TFloatField
      FieldName = 'REZ_INST'
      Required = True
    end
    object OrderTableBELT_NO: TFloatField
      FieldName = 'BELT_NO'
      Required = True
    end
    object OrderTableBELT_BOTTOM_HGT: TFloatField
      FieldName = 'BELT_BOTTOM_HGT'
    end
  end
  object MaxCmQuery: TOilQuery
    SQL.Strings = (
      'select hgt_cm from oil_rc_cm where '
      'hgt_cm < :max_cm and '
      'hgt_cm >= :min_cm and'
      'state = '#39'Y'#39' and'
      'rez_id = :rez_id and'
      'rez_inst = :rez_inst '
      'order by hgt_cm')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 253
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'max_cm'
      end
      item
        DataType = ftUnknown
        Name = 'min_cm'
      end
      item
        DataType = ftUnknown
        Name = 'rez_id'
      end
      item
        DataType = ftUnknown
        Name = 'rez_inst'
      end>
  end
  object InterpolQuery: TOilQuery
    SQL.Strings = (
      'select * from oil_rc_cm where '
      '  state = '#39'Y'#39' and '
      '  rez_id = :rez_id and'
      '  rez_inst = :rez_inst and'
      '  hgt_cm >= :min_cm and'
      '  hgt_cm <= :max_cm   '
      'order by hgt_cm asc')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 253
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rez_id'
      end
      item
        DataType = ftInteger
        Name = 'rez_inst'
      end
      item
        DataType = ftInteger
        Name = 'min_cm'
      end
      item
        DataType = ftInteger
        Name = 'max_cm'
      end>
    object InterpolQueryID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_RC_CM.ID'
    end
    object InterpolQueryINST: TFloatField
      FieldName = 'INST'
      Origin = 'OIL_RC_CM.INST'
    end
    object InterpolQuerySTATE: TStringField
      FieldName = 'STATE'
      Origin = 'OIL_RC_CM.STATE'
      Size = 1
    end
    object InterpolQueryREZ_ID: TFloatField
      FieldName = 'REZ_ID'
      Origin = 'OIL_RC_CM.REZ_ID'
    end
    object InterpolQueryREZ_INST: TFloatField
      FieldName = 'REZ_INST'
      Origin = 'OIL_RC_CM.REZ_INST'
    end
    object InterpolQueryHGT_CM: TFloatField
      FieldName = 'HGT_CM'
      Origin = 'OIL_RC_CM.HGT_CM'
    end
    object InterpolQueryVOLUME: TFloatField
      FieldName = 'VOLUME'
      Origin = 'OIL_RC_CM.VOLUME'
    end
  end
  object mmInserTOilQuery: TOilQuery
    SQL.Strings = (
      'insert into oil_rc_mm '
      '  (id, inst,state, belt_id, belt_inst, hgt_mm, vol_plus) '
      'values'
      '  (:id, :inst, '#39'Y'#39', :belt_id, :belt_inst, :hgt_mm, 0) ')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 240
    Top = 420
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end
      item
        DataType = ftUnknown
        Name = 'belt_id'
      end
      item
        DataType = ftUnknown
        Name = 'belt_inst'
      end
      item
        DataType = ftUnknown
        Name = 'hgt_mm'
      end>
  end
  object DelQuery1: TOilQuery
    SQL.Strings = (
      
        'update oil_rc_belts set state  = '#39'N'#39' where id = :id and inst = :' +
        'inst')
    MasterSource = DataSource1
        DataSource = DataSource1
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 312
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
  object DelQuery2: TOilQuery
    SQL.Strings = (
      'update oil_rc_cm set state = '#39'N'#39' where id = :id and inst = :inst')
    MasterSource = DataSource2
        DataSource = DataSource2
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 264
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
end
