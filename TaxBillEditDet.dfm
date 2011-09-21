inherited TaxBillEditDetForm: TTaxBillEditDetForm
  Left = 230
  Top = 180
  Width = 640
  Height = 383
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1053#1053
  OldCreateOrder = True
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pBase: TPanel
    Left = 0
    Top = 55
    Width = 632
    Height = 268
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pBase'
    TabOrder = 0
    object DBGrid1: TDBGridEh
      Left = 0
      Top = 0
      Width = 632
      Height = 268
      Align = alClient
      AllowedOperations = [alopInsertEh, alopUpdateEh, alopDeleteEh]
      Color = clWhite
      DataSource = ds
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
      PopupMenu = PUM
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      Columns = <
        item
          Color = 15658991
          EditButtons = <>
          FieldName = 'SHORT_NAME'
          Footers = <
            item
              Alignment = taCenter
              Value = #1050#1086#1083'. '#1087#1086#1079#1080#1094#1080#1081
              ValueType = fvtStaticText
            end>
          ReadOnly = True
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088'|'#1053#1077#1092#1090#1077#1088#1086#1076#1091#1082#1090
          Width = 105
        end
        item
          Color = 15658991
          EditButtons = <>
          FieldName = 'PRICE'
          Footers = <
            item
              ValueType = fvtCount
            end>
          ReadOnly = True
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088'|'#1062#1077#1085#1072
          Width = 60
        end
        item
          Color = 15658991
          EditButtons = <>
          FieldName = 'COUNT_'
          Footers = <
            item
              ValueType = fvtSum
            end>
          ReadOnly = True
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
          Width = 78
        end
        item
          Color = 15658991
          EditButtons = <>
          FieldName = 'SUM_DOG'
          Footers = <
            item
              ValueType = fvtSum
            end>
          ReadOnly = True
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088'|'#1057#1091#1084#1084#1072
          Width = 82
        end
        item
          Color = 15658991
          EditButtons = <>
          FieldName = 'SUM_REMAIN'
          Footers = <
            item
              ValueType = fvtSum
            end>
          ReadOnly = True
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088'|'#1054#1089#1090#1072#1090#1086#1082' '#1089#1091#1084#1084#1099
          Width = 93
        end
        item
          Color = 15658991
          EditButtons = <>
          FieldName = 'COUNT_NN_EDIT'
          Footer.DisplayFormat = '0.######'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1091#1077#1084#1072#1103' '#1053#1053'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
          Width = 86
        end
        item
          EditButtons = <>
          FieldName = 'SUM_NN_EDIT'
          Footer.DisplayFormat = '0.##'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1091#1077#1084#1072#1103' '#1053#1053'|'#1057#1091#1084#1084#1072
          Width = 85
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 55
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object lNomerNN: TLabel
      Left = 184
      Top = 8
      Width = 96
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' :'
    end
    object lTypeDog: TLabel
      Left = 8
      Top = 8
      Width = 75
      Height = 13
      Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1072' :'
    end
    object lSumMoney: TLabel
      Left = 315
      Top = 7
      Width = 43
      Height = 13
      Caption = #1054#1087#1083#1072#1090#1072' :'
    end
    object lDog: TLabel
      Left = 104
      Top = 8
      Width = 50
      Height = 13
      Caption = #1044#1086#1075#1086#1074#1086#1088' :'
    end
    object lSumOstatka: TLabel
      Left = 427
      Top = 7
      Width = 88
      Height = 13
      Caption = #1054#1089#1090#1072#1090#1086#1082' '#1086#1087#1083#1072#1090#1099' :'
    end
    object lTypeDogName: TLabel
      Left = 8
      Top = 28
      Width = 74
      Height = 13
      Caption = 'lTypeDogName'
    end
    object lNomerNNname: TLabel
      Left = 184
      Top = 28
      Width = 75
      Height = 13
      Caption = 'lNomerNNname'
    end
    object lDogName: TLabel
      Left = 104
      Top = 28
      Width = 50
      Height = 13
      Caption = 'lDogName'
    end
    object eMoney: TCurrencyEdit
      Left = 315
      Top = 23
      Width = 97
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00'
      ReadOnly = True
      TabOrder = 0
      OnChange = eMoneyChange
      OnKeyPress = eMoneyKeyPress
    end
    object eMoneyEdit: TCurrencyEdit
      Left = 427
      Top = 23
      Width = 97
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00'
      ReadOnly = True
      TabOrder = 1
      OnChange = eMoneyEditChange
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 323
    Width = 632
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object OilHelpButton: TOilHelpButton
      Left = 4
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
        '{12}{RED}\B'#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1053#1053'\D {10}'
        ''
        #1045#1089#1083#1080' '#1074#1074#1077#1089#1090#1080' '#1086#1087#1083#1072#1090#1091' '#1085#1072' '#1089#1091#1084#1084#1091' '#1084#1077#1085#1100#1096#1091#1102', '#1095#1077#1084' '#1074' '#1076#1086#1075#1086#1074#1086#1088#1077
        #1080' '#1076#1086#1075#1086#1074#1086#1088' '#1085#1072' '#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1087#1086#1079#1080#1094#1080#1081', '#1090#1086' '#1079#1076#1077#1089#1100' '#1076#1072#1077#1090#1089#1103
        #1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1088#1072#1089#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1089#1091#1084#1084#1091' '#1086#1087#1083#1072#1090#1099' '#1074' '#1085#1091#1078#1085#1099#1093
        #1087#1088#1086#1087#1086#1088#1094#1080#1103#1093' '#1084#1077#1078#1076#1091' '#1087#1091#1085#1082#1090#1072#1084#1080' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' '#1089' '#1091#1095#1077#1090#1086#1084' '#1091#1078#1077
        #1074#1099#1087#1080#1089#1072#1085#1085#1099#1093' '#1085#1072#1083#1086#1075#1086#1074#1099#1093'. '#1055#1091#1085#1082#1090#1099' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1090
        #1087#1091#1085#1082#1090#1072#1084' '#1076#1086#1075#1086#1074#1086#1088#1072'. '#1053#1077#1083#1100#1079#1103' '#1074#1074#1077#1089#1090#1080' '#1089#1091#1084#1084#1091' '#1073#1086#1083#1100#1096#1091#1102' '#1095#1077#1084
        #1074' '#1087#1086#1083#1077' "'#1044#1086#1075#1086#1074#1086#1088'/'#1054#1089#1090#1072#1090#1086#1082' '#1089#1091#1084#1084#1099'", '#1089#1072#1084#1086' '#1087#1086#1083#1077' '#1089#1086#1076#1077#1088#1078#1080#1090
        #1089#1091#1084#1084#1091' '#1087#1086' '#1087#1091#1085#1082#1090#1091' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1084#1080#1085#1091#1089' '#1089#1091#1084#1084#1072' '#1087#1086' '#1091#1078#1077' '#1074#1099#1087#1080#1089#1072#1085#1099#1084
        #1085#1072#1083#1086#1075#1086#1074#1099#1084' '#1087#1086' '#1101#1090#1086#1084#1091' '#1087#1091#1085#1082#1090#1091' '#1053#1045' '#1074#1082#1083#1102#1095#1072#1103' '#1101#1090#1091' '#1085#1072#1083#1086#1075#1086#1074#1091#1102'.'
        ' \B\I '#1044#1083#1103' '#1091#1076#1086#1073#1089#1090#1074#1072':\D '#1087#1086' '#1085#1072#1078#1072#1090#1080#1102
        #1087#1088#1072#1074#1086#1081' '#1082#1085#1086#1087#1082#1086#1081' '#1085#1072' '#1090#1072#1073#1083#1080#1094#1077' '#1087#1086#1103#1074#1080#1090#1100#1089#1103' '#1084#1077#1085#1102' '#1089' '#1076#1074#1091#1084#1103
        #1087#1091#1085#1082#1090#1072#1084#1080':'
        '  "'#1054#1073#1085#1091#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102'" - '#1076#1077#1083#1072#1077#1090' '#1079#1085#1072#1095#1077#1085#1080#1077
        #1087#1086#1083#1103' "'#1056#1077#1076#1072#1082#1090#1080#1088#1091#1077#1084#1072#1103' '#1053#1053'/'#1057#1091#1084#1084#1072'" '#1088#1072#1074#1085#1099#1084' "0",'
        '  "'#1055#1088#1080#1073#1072#1074#1080#1090#1100' '#1086#1089#1090#1072#1090#1086#1082'" - '#1076#1077#1083#1072#1077#1090' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103
        '"'#1056#1077#1076#1072#1082#1090#1080#1088#1091#1077#1084#1072#1103' '#1053#1053'/'#1057#1091#1084#1084#1072'" '#1088#1072#1074#1085#1099#1084' '#1079#1085#1072#1095#1077#1085#1080#1102' '#1087#1086#1083#1103
        '"'#1044#1086#1075#1086#1074#1086#1088'/'#1054#1089#1090#1072#1090#1086#1082' '#1089#1091#1084#1084#1099'" '#1077#1089#1083#1080' '#1101#1090#1086' '#1087#1086#1079#1074#1086#1083#1103#1077#1090
        '"'#1054#1089#1090#1072#1090#1086#1082' '#1086#1087#1083#1072#1090#1099'".'
        ' \B\I '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':\D '#1089#1091#1084#1084#1072' '#1085#1072#1083#1086#1075#1086#1074#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093' '#1087#1086' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1085#1086#1084#1091
        #1076#1086#1075#1086#1074#1086#1088#1091' '#1085#1077' '#1076#1086#1083#1078#1085#1072' '#1087#1088#1077#1074#1099#1096#1072#1090#1100' '#1089#1091#1084#1084#1091' '#1089#1072#1084#1086#1075#1086' '#1076#1086#1075#1086#1074#1086#1088#1072', '#1077#1089#1083#1080
        #1078#1077' '#1074#1086#1079#1085#1080#1082#1083#1072' '#1089#1080#1090#1091#1072#1094#1080#1103' '#1095#1090#1086' '#1082#1083#1080#1077#1085#1090' '#1079#1072#1087#1083#1072#1090#1080#1083' '#1073#1086#1083#1100#1096#1077' '#1080
        #1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1087#1080#1089#1072#1090#1100' '#1085#1072#1083#1086#1075#1086#1074#1091#1102', '#1090#1086' '#1074' '#1090#1072#1082#1086#1084' '#1089#1083#1091#1095#1072#1077
        #1077#1089#1090#1100' '#1076#1074#1072' '#1088#1077#1096#1077#1085#1080#1103' '#1101#1090#1086#1081' '#1087#1088#1086#1073#1083#1077#1084#1099'. '#1055#1077#1088#1074#1086#1077' '#1101#1090#1086
        #1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1074' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1080' '#1089' '#1086#1087#1083#1072#1090#1086#1081','
        #1072' '#1074#1090#1086#1088#1086#1077' '#1101#1090#1086' '#1089#1086#1079#1076#1072#1085#1080#1077' '#1086#1090#1076#1077#1083#1100#1085#1086#1075#1086' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1076#1083#1103' '#1101#1090#1086#1075#1086
        #1082#1083#1080#1077#1085#1090#1072' '#1085#1072' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1091#1102' '#1088#1072#1079#1085#1080#1094#1091'.'
        '')
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
    object Panel3: TPanel
      Left = 435
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
        Left = 16
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
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
        Left = 106
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1054#1090#1084#1077#1085#1072
        TabOrder = 1
        OnClick = bbCancelClick
        Kind = bkCancel
      end
    end
  end
  object ds: TOraDataSource
    DataSet = q
    Left = 152
    Top = 144
  end
  object q: TOilQuery
    SQL.Strings = (
      'select dog.*,'
      '       dog.np_id,'
      '       dog.summ_nds as sum_dog,'
      
        '       round(dog.summ_nds - nvl(nnExistOut.Sum_nn, 0), 2) sum_re' +
        'main,'
      
        '       round(dog.count_ - nvl(nnExistOut.count_, 0), 6) count_re' +
        'main,'
      '       nn.id nn_id,'
      '       nn.inst nn_inst,'
      '       nn.num,'
      '       nn.nn_d_id,'
      '       nvl(nn.nds_t, 0) sum_nn_edit,'
      '       nvl(nn.count_, 0) count_nn_edit,'
      '       dog.np_grp_id,'
      '       nn.np_grp_id,'
      '       nvl(nnExistOut.Sum_nn, 0) Sum_nn_exist,'
      '       nvl(nnExistOut.count_, 0) count_exist,'
      '       nal_t'
      '  from (select dog.id,'
      '               dog.inst,'
      '               dog.dog,'
      '               dog.dog_date,'
      '               dog.dog_type,'
      '               d.np_type np_id,'
      '               np.grp_id np_grp_id,'
      
        '               decode(dog.dog_type, '#39'S'#39', oper.name, np.short_nam' +
        'e) short_name,'
      '               d.dim_id,'
      '               d.price2 price,'
      '               d.price price_no_nds,'
      '               d.summ_x_nds,'
      '               d.summ_nds,'
      '               nvl(d.count_, 0) count_'
      '          from Oil_Dog        dog,'
      '               oil_dog_detail d,'
      '               Oil_Np_Type    np,'
      '               oil_oper_type  oper'
      '         where dog.id = d.dog_id(+)'
      '           and dog.inst = d.dog_inst(+)'
      '           and np.id(+) = d.np_type'
      '           and oper.id(+) = d.np_type'
      '           and dog.state = '#39'Y'#39
      '           and d.state = '#39'Y'#39
      '           and dog.id = :dog_id'
      '           and dog.inst = :dog_inst) dog,'
      '       (select sb.id,'
      '               sb.inst,'
      '               sb.num,'
      '               nvl(d.nds_t, 0) nds_t,'
      '               d.tov_id np_id,'
      '               np.grp_id np_grp_id,'
      '               nvl(d.kol, 0) count_,'
      '               d.price_nds,'
      '               d.id nn_d_id,'
      '               nal_t'
      '          from Oil_Sale_Book sb, '
      '               Oil_Sale_Book_Det d, '
      '               Oil_Np_Type np'
      '         where sb.id = d.nn_id(+)'
      '           and sb.inst = d.nn_inst(+)'
      '           and np.id = d.tov_id'
      '           and sb.state = '#39'Y'#39
      '           and d.state = '#39'Y'#39
      '           and sb.id = :nn_id'
      '           and sb.inst = :nn_inst) nn,'
      '       (select sum(nvl(bd.nds_t, 0)) as sum_nn,'
      '               bd.tov_id as np_id,'
      '               sum(nvl(bd.kol, 0)) as count_'
      '          from v_oil_sale_book_link lnk,'
      '               v_oil_sale_book_det bd'
      '         where lnk.dog_id = :dog_id'
      '           and lnk.dog_inst = :dog_inst'
      '           and bd.nn_id = lnk.nn_id'
      '           and bd.nn_inst = lnk.nn_inst'
      '           and not (bd.nn_id = :nn_id and bd.nn_inst = :nn_inst)'
      '         group by bd.tov_id) nnExistOut'
      ' where dog.np_id = nn.np_id(+)'
      '   and dog.np_id = nnExistOut.np_id(+)')
    CachedUpdates = True
    UpdateObject = UpdQ
    BeforeOpen = qBeforeOpen
    AfterOpen = qAfterOpen
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 184
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'dog_id'
      end
      item
        DataType = ftInteger
        Name = 'dog_inst'
      end
      item
        DataType = ftInteger
        Name = 'nn_id'
      end
      item
        DataType = ftInteger
        Name = 'nn_inst'
      end>
    object qID: TFloatField
      FieldName = 'ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
    end
    object qDOG: TStringField
      FieldName = 'DOG'
      Size = 15
    end
    object qDOG_DATE: TDateTimeField
      FieldName = 'DOG_DATE'
    end
    object qDOG_TYPE: TStringField
      FieldName = 'DOG_TYPE'
      Size = 1
    end
    object qNP_ID: TFloatField
      FieldName = 'NP_ID'
    end
    object qNP_GRP_ID: TFloatField
      FieldName = 'NP_GRP_ID'
    end
    object qSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 50
    end
    object qDIM_ID: TFloatField
      FieldName = 'DIM_ID'
    end
    object qPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object qCOUNT_: TFloatField
      FieldName = 'COUNT_'
    end
    object qSUM_DOG: TFloatField
      FieldName = 'SUM_DOG'
    end
    object qSUM_REMAIN: TFloatField
      FieldName = 'SUM_REMAIN'
    end
    object qCOUNT_REMAIN: TFloatField
      FieldName = 'COUNT_REMAIN'
    end
    object qNN_ID: TFloatField
      FieldName = 'NN_ID'
    end
    object qNN_INST: TFloatField
      FieldName = 'NN_INST'
    end
    object qNUM: TStringField
      FieldName = 'NUM'
      Size = 8
    end
    object qNN_D_ID: TFloatField
      FieldName = 'NN_D_ID'
    end
    object qSUM_NN_EDIT: TFloatField
      FieldName = 'SUM_NN_EDIT'
      OnChange = qSUM_NN_EDITChange
      OnSetText = qSUM_NN_EDITSetText
    end
    object qCOUNT_NN_EDIT: TFloatField
      FieldName = 'COUNT_NN_EDIT'
    end
    object qSUM_NN_EXIST: TFloatField
      FieldName = 'SUM_NN_EXIST'
    end
    object qCOUNT_EXIST: TFloatField
      FieldName = 'COUNT_EXIST'
    end
    object qprice_no_nds: TFloatField
      FieldName = 'price_no_nds'
    end
  end
  object UpdQ: TOraUpdateSQL
    ModifySQL.Strings = (
      'update OIL_SALE_BOOK_DET'
      'set'
      '  nds_t = :summa,'
      '  kol = :COUNT_NN'
      'where'
      '  ID = :nn_d_id')
    InsertSQL.Strings = (
      'insert into OIL_SALE_BOOK_DET('
      '  id,'
      '  state,'
      '  Inst,'
      '  Nn_Id,'
      '  Nn_Inst,'
      '  Nds_t,'
      '  Tov_id,'
      '  Div_Id,'
      '  Kol,'
      '  Price_Nds)'
      '  values('
      '  s_oil_sale_book_det.nextval,'
      '  '#39'Y'#39','
      '  :inst,'
      '  :nn_id,'
      '  :nn_inst,'
      '  :sum_nn_edit,'
      '  :np_id,'
      '  :dim_id,'
      '  :count_nn_edit,'
      '  :price)')
    Left = 216
    Top = 144
  end
  object PUM: TPopupMenu
    Left = 384
    Top = 144
    object miNulling: TMenuItem
      Caption = #1054#1073#1085#1091#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      OnClick = miNullingClick
    end
    object miAddOstatok: TMenuItem
      Caption = #1055#1088#1080#1073#1072#1074#1080#1090#1100' '#1086#1089#1090#1072#1090#1086#1082
      OnClick = miAddOstatokClick
    end
  end
end
