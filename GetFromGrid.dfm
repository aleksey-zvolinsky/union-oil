inherited GetFromGridForm: TGetFromGridForm
  Left = 363
  Top = 179
  Width = 441
  Height = 479
  Anchors = [akTop]
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 404
    Width = 433
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 242
      Top = 8
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Принять'
      Default = True
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
    object bbCancel: TBitBtn
      Left = 338
      Top = 8
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Отменить'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Grid1: TDBGridEh
    Left = 0
    Top = 49
    Width = 433
    Height = 355
    Align = alClient
    AllowedOperations = []
    AllowedSelections = [gstRecordBookmarks]
    DataSource = ds
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = Grid1DblClick
    OnKeyPress = Grid1KeyPress
  end
  object panelHead: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 49
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
  end
  object ds: TOraDataSource
    Left = 200
    Top = 152
  end
end
