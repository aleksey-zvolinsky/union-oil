inherited AddOrgUkrForm: TAddOrgUkrForm
  Left = 337
  Top = 256
  BorderStyle = bsDialog
  Caption = 'Формы для печати'
  ClientHeight = 294
  ClientWidth = 520
  OldCreateOrder = True
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel6: TPanel
    Left = 0
    Top = 261
    Width = 520
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 428
      Top = 4
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Принять'
      ModalResult = 1
      TabOrder = 0
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 520
    Height = 261
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'На русском языке'
      object Label4: TLabel
        Left = 6
        Top = 4
        Width = 292
        Height = 13
        Caption = 'Полное наименование (для печати налоговой накладной)'
      end
      object Label1: TLabel
        Left = 6
        Top = 42
        Width = 228
        Height = 13
        Caption = 'Фактический адрес (для печати в ТТН и НН)'
      end
      object Label5: TLabel
        Left = 6
        Top = 80
        Width = 148
        Height = 13
        Caption = 'Форма для печати договора:'
      end
      object Label6: TLabel
        Left = 6
        Top = 118
        Width = 238
        Height = 13
        Caption = 'Форма для расходной накладной (через кого):'
      end
      object Label2: TLabel
        Left = 6
        Top = 156
        Width = 125
        Height = 13
        Caption = 'Форма для Акта Сверки'
      end
      object Label7: TLabel
        Left = 6
        Top = 194
        Width = 139
        Height = 13
        Caption = 'Должность управляющего:'
      end
      object edFullName: TEdit
        Left = 6
        Top = 18
        Width = 500
        Height = 21
        Hint = 'Название организации'
        AutoSize = False
        MaxLength = 255
        TabOrder = 0
      end
      object edDogovor: TEdit
        Left = 6
        Top = 94
        Width = 500
        Height = 21
        MaxLength = 255
        TabOrder = 1
        Text = 'в лице ..., действующего на основании ...'
      end
      object edThrough: TEdit
        Left = 6
        Top = 132
        Width = 500
        Height = 21
        MaxLength = 100
        TabOrder = 2
      end
      object edAktSverki: TEdit
        Left = 6
        Top = 170
        Width = 500
        Height = 21
        MaxLength = 100
        TabOrder = 3
      end
      object edRealAddr: TEdit
        Left = 6
        Top = 56
        Width = 500
        Height = 21
        Hint = 'Название организации'
        AutoSize = False
        MaxLength = 100
        TabOrder = 4
      end
      object ePost: TEdit
        Left = 6
        Top = 208
        Width = 500
        Height = 21
        MaxLength = 100
        TabOrder = 5
        Text = 'Директор'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'На украинском языке'
      ImageIndex = 1
      object Label20: TLabel
        Left = 6
        Top = 42
        Width = 228
        Height = 13
        Caption = 'Фактический адрес (для печати в ТТН и НН)'
      end
      object Label10: TLabel
        Left = 6
        Top = 4
        Width = 292
        Height = 13
        Caption = 'Полное наименование (для печати налоговой накладной)'
      end
      object Label22: TLabel
        Left = 6
        Top = 80
        Width = 148
        Height = 13
        Caption = 'Форма для печати договора:'
      end
      object Label12: TLabel
        Left = 6
        Top = 118
        Width = 238
        Height = 13
        Caption = 'Форма для расходной накладной (через кого):'
      end
      object Label3: TLabel
        Left = 6
        Top = 156
        Width = 125
        Height = 13
        Caption = 'Форма для Акта Сверки'
      end
      object Label8: TLabel
        Left = 6
        Top = 194
        Width = 139
        Height = 13
        Caption = 'Должность управляющего:'
      end
      object edRealAddrUkr: TEdit
        Left = 6
        Top = 56
        Width = 500
        Height = 21
        Hint = 'Название организации'
        AutoSize = False
        MaxLength = 100
        TabOrder = 1
      end
      object edFullNameUkr: TEdit
        Left = 6
        Top = 18
        Width = 500
        Height = 21
        Hint = 'Название организации'
        AutoSize = False
        MaxLength = 255
        TabOrder = 0
      end
      object edDogovorUkr: TEdit
        Left = 6
        Top = 94
        Width = 500
        Height = 21
        MaxLength = 255
        TabOrder = 2
        Text = 'в лице ..., действующего на основании ...'
      end
      object edThroughUkr: TEdit
        Left = 6
        Top = 132
        Width = 500
        Height = 21
        MaxLength = 100
        TabOrder = 3
      end
      object edAktSverkiUkr: TEdit
        Left = 6
        Top = 170
        Width = 500
        Height = 21
        MaxLength = 100
        TabOrder = 4
      end
      object ePostUkr: TEdit
        Left = 6
        Top = 208
        Width = 500
        Height = 21
        MaxLength = 100
        TabOrder = 5
        Text = 'Директор'
      end
    end
  end
end
