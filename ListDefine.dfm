object ListDefineForm: TListDefineForm
  Left = 413
  Top = 232
  Width = 463
  Height = 500
  Caption = #1055#1088#1080#1074#1077#1076#1080#1090#1077' '#1089#1088#1072#1074#1085#1077#1085#1080#1077' '#1089' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1084' Oil'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 433
    Width = 455
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object pBtn: TPanel
      Left = 258
      Top = 2
      Width = 195
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        195
        29)
      object bbOk: TBitBtn
        Left = 18
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1055#1088#1080#1085#1103#1090#1100
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
        Left = 108
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 1
        Kind = bkCancel
      end
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 0
    Width = 455
    Height = 433
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Grid: TDBGridEh
      Left = 2
      Top = 2
      Width = 451
      Height = 429
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = ds
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      PopupMenu = pm
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnEditButtonClick = GridEditButtonClick
      Columns = <
        item
          Color = 15658991
          EditButtons = <>
          FieldName = 'VALUE'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1042#1085#1077#1096#1085#1077#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
          Width = 165
        end
        item
          Color = 15658991
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          ReadOnly = True
          Title.Caption = 'Oil|ID'
          Width = 52
        end
        item
          Color = 15658991
          EditButtons = <>
          FieldName = 'INST'
          Footers = <>
          ReadOnly = True
          Title.Caption = 'Oil|INST'
          Width = 56
        end
        item
          ButtonStyle = cbsEllipsis
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = 'Oil|'#1053#1072#1079#1074#1072#1085#1080#1077
          Width = 142
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object VirtualTable: TVirtualTable
    BeforePost = VirtualTableBeforePost
    Left = 184
    Top = 208
    Data = {03000000000000000000}
    object VirtualTableVALUE: TStringField
      DisplayWidth = 20
      FieldName = 'VALUE'
      Size = 256
    end
    object VirtualTableID: TIntegerField
      FieldName = 'ID'
    end
    object VirtualTableINST: TIntegerField
      FieldName = 'INST'
    end
    object VirtualTableNAME: TStringField
      DisplayWidth = 20
      FieldName = 'NAME'
      Size = 256
    end
  end
  object ds: TOraDataSource
    DataSet = VirtualTable
    Left = 128
    Top = 208
  end
  object pm: TPopupMenu
    Left = 200
    Top = 96
    object miNotUse: TMenuItem
      Caption = #1053#1077' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100
      OnClick = miNotUseClick
    end
  end
end
