inherited RezervArendaForm: TRezervArendaForm
  Left = 427
  Top = 294
  Width = 462
  Height = 385
  Caption = 'Сдача резервуара в аренду'
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 317
    Width = 454
    Height = 34
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object sbDel: TSpeedButton
      Left = 34
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
    object OilHelpButton1: TOilHelpButton
      Left = 6
      Top = 4
      Width = 25
      Height = 25
      AllowAllUp = True
      GroupIndex = 1001
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B000000FF007B7B7B00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000FF000000FF0000FF
        FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF007B7B7B000000FF007B7B7B00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF0000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000FF007B7B7B0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000FF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FFFF00FFFF
        FF0000FFFF00FFFFFF007B7B7B007B7B7B0000FFFF00FFFFFF007B7B7B000000
        FF000000FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF000000FF000000FF00FFFFFF0000FFFF007B7B7B000000
        FF000000FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000FFFF00FFFFFF000000FF000000FF007B7B7B00FFFFFF007B7B7B000000
        FF000000FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF000000FF000000FF000000FF000000FF000000
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000FF000000FF000000FF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      AnimateTime = 200
      Lines.Strings = (
        '{12}{RED}\BРегистрация сдачи резервуара в аренду\D'
        ''
        
          'В этой форме регистрируются операции сдачи в аренду и конца арен' +
          'ды.'
        
          'Если резервуар сдается в аренду, нужно в столбце \BОперация\b вы' +
          'брать'
        
          '\I"Сдан в аренду"\D, а в столбце \BКому\D - организацию, арендов' +
          'авшую'
        
          'резервуар. В случае окончания аренды нужно добавить запись с опе' +
          'рацией'
        '\I"Конец аренды"\D, при этом организацию выбирать не нужно.'
        'В случае, если сменилась организация, арендовавшая резервуар, не'
        
          'нужно вводить запись о конце аренды, нужно ввести новую запись с' +
          ' операцией'
        '\I"Сдан в аренду"\D и новой арендовавшей организацией. '
        'Новая запись добавляется с помощью нажатия \I\Bстрелки вниз\D,'
        'когда курсор находится в самой нижней строчке.'
        'Если нужно удалить неправильно введенную запись, нужно нажать'
        'кнопку со значком \I\Bминус\D. При этом запись не исчезает'
        'из списка, а помечается красным. Повторным нажатием на кнопку'
        'со значком \I\Bминус\D отменяет удаление.'
        '\B{RED}Внимание!\D Сохранение введенных изменений происходит'
        'при принятии резервуара, а не при нажатии кнопки \B\IПринять\D'
        
          'в этой форме. Если Вы нажмете \B\IПринять\D здесь, и \B\IОтмена\' +
          'D'
        'на форме резервуара, то изменения приняты не будут. '
        ' '
        ' ')
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'MS Sans Serif'
      HeaderFont.Style = []
      Animate = True
      UseCurrentDir = False
      FormOrientation = fBottomToTop
      Images = MainForm.il
      ImageIndex = 0
    end
    object bbOk: TBitBtn
      Left = 268
      Top = 4
      Width = 87
      Height = 25
      Hint = 'Создать новую организацию'
      Anchors = [akTop, akRight]
      Caption = '&Принять'
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
      Left = 359
      Top = 4
      Width = 87
      Height = 25
      Hint = 'Закрыть окнр'
      Anchors = [akTop, akRight]
      Caption = '&Отменить'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object grid1: TDBGridEh
    Left = 0
    Top = 0
    Width = 454
    Height = 317
    Align = alClient
    DataSource = ds
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = grid1GetCellParams
    OnKeyPress = grid1KeyPress
    Columns = <
      item
        AutoDropDown = True
        DropDownSizing = True
        DropDownWidth = 5
        EditButtons = <>
        FieldName = 'OPER_TYPE_NAME'
        Footers = <>
        Title.Caption = 'Операция'
        Width = 86
      end
      item
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'ORG_NAME'
        Footers = <>
        Title.Caption = 'Кому'
        Width = 226
        OnEditButtonClick = grid1Columns1EditButtonClick
      end
      item
        EditButtons = <>
        FieldName = 'DATE_'
        Footers = <>
        Title.Caption = 'Начиная с...'
        Width = 96
      end>
  end
  object ds: TOraDataSource
    Left = 168
    Top = 136
  end
end
