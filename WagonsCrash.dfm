inherited WagonsCrashForm: TWagonsCrashForm
  Left = 476
  Top = 304
  Width = 331
  Height = 390
  Caption = '����� ����� �� ���������'
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 326
    Width = 323
    Height = 30
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object bbCancel: TBitBtn
      Left = 234
      Top = 4
      Width = 87
      Height = 25
      Hint = '������� ����'
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&��������'
      ModalResult = 2
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
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
    object BitBtn1: TBitBtn
      Left = 32
      Top = 4
      Width = 201
      Height = 25
      Hint = '������� ����'
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = ' &���� �� ��������� ���������'
      ModalResult = 2
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000000
        77777700444400407777774444040434407777448B3043BB40077048BB3043BB
        B000004BBBB04BBBB3007443BBBB3BBB3044044443BBBB3000447004443BB344
        404444400BBBBBB34040040BBBB78BBBB304744BBBB84BBBB8047443BBB443BB
        B40077040B8000B3400777044440444044077777074004047777}
    end
  end
  object grid1: TDBGridEh
    Left = 0
    Top = 0
    Width = 323
    Height = 326
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
    TitleHeight = 18
    TitleImages = ImageList1
    OnColumnMoved = grid1ColumnMoved
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CHECKED'
        Footers = <>
        Title.Alignment = taCenter
        Title.ImageIndex = 1
        Width = 24
      end
      item
        EditButtons = <>
        FieldName = 'DOG'
        Footers = <>
        ReadOnly = True
        Title.Caption = ' ������'
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'DOG_DATE'
        Footers = <>
        ReadOnly = True
        Title.Caption = ' ����'
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = ' ��������'
        Width = 120
      end>
  end
  object mt: TMemoryTable
    Left = 136
    Top = 176
    object mtCHECKED: TBooleanField
      FieldName = 'CHECKED'
    end
    object mtID: TFloatField
      FieldName = 'ID'
    end
    object mtDOG: TStringField
      FieldName = 'DOG'
      Size = 50
    end
    object mtDOG_DATE: TDateField
      FieldName = 'DOG_DATE'
    end
    object mtNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object ds: TOraDataSource
    DataSet = mt
    Left = 152
    Top = 168
  end
  object qLoad: TOilQuery
    SQL.Strings = (
      '--> qNoPrih,Wagons'
      'select id,dog,date_rast as dog_date,name'
      'from v_oil_tsw')
    Left = 72
    Top = 136
  end
  object ImageList1: TImageList
    Left = 144
    Top = 80
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000080000000800080808000000000000000000000000000000000000000
      00000000FF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000080000000800000008000808080000000000000000000000000000000
      FF00000080000000800080808000000000000000000000000000000000000000
      0000800000008000000080000000800000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000800000008000000080000000800080808000000000000000FF000000
      8000000080000000800000008000808080000000000000000000800000008000
      0000800000008000000000000000800000000000000080000000008080008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000800000008000000080000000800080808000000080000000
      8000000080000000800000008000808080000000000000000000800000008000
      00008080800000FFFF000080800000000000800000000080800000FFFF0000FF
      FF00800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000008000000080000000800000008000000080000000
      8000000080000000800080808000000000000000000000000000800000008080
      800000FFFF0000FFFF000080800000000000800000000080800000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000080000000800000008000000080000000
      80000000800080808000000000000000000000000000000000008000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000008000000000FFFF0000FFFF0000FF
      FF0000FFFF000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000800000008000000080000000
      8000808080000000000000000000000000000000000080000000800000000080
      800000FFFF0000FFFF0000FFFF0000FFFF000080800000FFFF0000FFFF0000FF
      FF00008080000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000800000008000000080000000
      8000808080000000000000000000000000000000000080000000800000008000
      0000800000000080800000FFFF0000FFFF0000FFFF0000FFFF00008080000000
      0000000000000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000080000000800000008000000080000000
      8000808080000000000000000000000000000000000000000000000000008000
      000080000000800000000080800000FFFF0000FFFF0000808000800000008000
      0000800000000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000008000000080000000800080808000000080000000
      8000000080008080800000000000000000008000000080000000800000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000080
      8000800000000000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF0000008000000080000000800080808000000000000000FF000000
      80000000800000008000808080000000000000000000800000000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000008080800000FFFF0000FFFF0000FF
      FF0000FFFF000080800000000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000800000008000808080000000000000000000000000000000
      FF000000800000008000000080008080800000000000800000008000000000FF
      FF0000FFFF0000FFFF0000FFFF00808080008000000000FFFF0000FFFF0000FF
      FF0000FFFF008080800000000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000008000000000000000000000000000000000000000
      00000000FF000000800000008000000080000000000080000000800000000080
      800000FFFF0000FFFF0000FFFF0080000000800000000080800000FFFF0000FF
      FF0000FFFF008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000080000000FF000000000000000000000000008000
      00000000000000FFFF008080800000000000000000000000000000FFFF000080
      8000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000080000000000000008000000080000000800000000000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000000000000000000080000000000000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00E1F3FC0F00000000E0E1C00F00000000
      E040C00300000000F000C00100000000F801800000000000FC03000000000000
      FE07800000000000FE07000000000000FC07800000000000F803000000000000
      F041010000000000F0E0800000000000F9F0800000000000FFF8C00100000000
      FFFFC00100000000FFFFF40F0000000000000000000000000000000000000000
      000000000000}
  end
end
