inherited NpPriceEditForm: TNpPriceEditForm
  Left = 419
  Top = 251
  Width = 477
  Caption = #1042#1074#1086#1076' '#1094#1077#1085' '#1085#1072' '#1089#1086#1087#1091#1090#1089#1090#1074#1091#1102#1097#1080#1081' '#1090#1086#1074#1072#1088
  PixelsPerInch = 96
  TextHeight = 13
  object lblDateOn: TLabel [0]
    Left = 1
    Top = 9
    Width = 32
    Height = 13
    Caption = #1044#1072#1090#1072' :'
  end
  inherited pBottom: TPanel
    Width = 469
    object sbDel: TSpeedButton [0]
      Left = 4
      Top = 4
      Width = 25
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100
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
    inherited pBtn: TPanel
      Left = 272
    end
  end
  object deDateOn: TDateEdit [2]
    Left = 40
    Top = 5
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 32
    Width = 469
    Height = 277
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'Panel1'
    TabOrder = 2
    object Grid: TDBGridEh
      Left = 2
      Top = 2
      Width = 465
      Height = 273
      Align = alClient
      DataSource = ds
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
      UseMultiTitle = True
      OnEditButtonClick = GridEditButtonClick
      OnKeyPress = GridKeyPress
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NP_TYPE_ID'
          Footers = <>
          Title.Caption = #1050#1086#1076' Oil'
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'CODAVIAS'
          Footers = <>
          Title.Caption = #1050#1086#1076' '#1053#1053#1041
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'CODINT'
          Footers = <>
          Title.Caption = #1050#1086#1076' '#1074#1085#1091#1090'.'
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'CODOPTIMA'
          Footers = <>
          Title.Caption = #1050#1086#1076' Cashtan'
          Width = 50
        end
        item
          ButtonStyle = cbsEllipsis
          EditButtons = <>
          FieldName = 'NP_NAME'
          Footers = <>
          Title.Caption = #1058#1086#1074#1072#1088
          Width = 237
        end
        item
          EditButtons = <>
          FieldName = 'PRICE'
          Footers = <>
          Title.Caption = #1062#1077#1085#1072
          Width = 62
        end>
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select np.id as np_type_id,'
      '       np.codavias,'
      
        '       to_number(ov.GetOutLinkVal('#39'OIL_NP_TYPE'#39',2,np.id)) as cod' +
        'optima,'
      
        '       to_number(ov.GetOutLinkVal('#39'OIL_NP_TYPE'#39',ov.GetVal('#39'NP_CO' +
        'DINT'#39'),np.id)) as codint,    '
      '       np.name as np_name,'
      '       npp.org_id,'
      '       npp.org_inst,'
      '       npp.date_on,'
      '       npp.price,'
      '       npp.id,'
      '       npp.inst'
      '  from oil_np_type np, OIL_NP_PRICE npp'
      ' where np.id = npp.np_id'
      '   and npp.state = '#39'Y'#39
      '   and npp.inst = :inst'
      '   and npp.date_on = :date_on')
    Left = 16
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'date_on'
      end>
  end
  object vt: TVirtualTable
    BeforePost = vtBeforePost
    Left = 56
    Top = 104
    Data = {02000000000000000000}
  end
  object ds: TOraDataSource
    DataSet = vt
    Left = 96
    Top = 104
  end
end
