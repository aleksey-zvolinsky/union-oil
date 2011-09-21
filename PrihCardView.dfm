inherited PrihCardViewForm: TPrihCardViewForm
  Left = 311
  Top = 245
  Width = 727
  Height = 434
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 719
    Height = 57
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 33
      Height = 13
      Caption = #1050#1072#1088#1090#1072':'
    end
    object TLabel
      Left = 147
      Top = 8
      Width = 41
      Height = 13
      Caption = #1058#1080#1087' '#1053#1055':'
    end
    object edtCard: TEdit
      Left = 11
      Top = 24
      Width = 121
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtNp: TEdit
      Left = 147
      Top = 24
      Width = 121
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 373
    Width = 719
    Height = 34
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object sbSum: TSpeedButton
      Left = 181
      Top = 5
      Width = 25
      Height = 25
      Hint = #1042#1082#1083'/'#1086#1090#1082#1083'. '#1087#1086#1076#1089#1095#1077#1090' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080
      AllowAllUp = True
      GroupIndex = 12
      Down = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
        03333377777777777F33333003333330033333377FF333377F33333300333333
        0333333377FF33337F3333333003333303333333377FF3337333333333003333
        333333333377FF3333333333333003333333333333377FF33333333333330033
        3333333333337733333333333330033333333333333773333333333333003333
        33333333337733333F3333333003333303333333377333337F33333300333333
        03333333773333337F33333003333330033333377FFFFFF77F33330000000000
        0333337777777777733333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = sbSumClick
    end
    object pnlBtn: TPanel
      Left = 624
      Top = 2
      Width = 93
      Height = 30
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbCancel: TBitBtn
        Left = 4
        Top = 3
        Width = 85
        Height = 25
        Caption = '&'#1047#1072#1082#1088#1099#1090#1100
        TabOrder = 0
        OnClick = bbCancelClick
        Kind = bkCancel
      end
    end
    object bbSearch: TBitBtn
      Left = 7
      Top = 5
      Width = 82
      Height = 25
      Hint = #1053#1072#1081#1090#1080
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbSearchClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888888888888000000000000880077777777777788770FFFFFFFFFF0
        800078888888888787770F0000FF0000700878777788777777780FFFFFF07887
        078878888887788777880F0FFF0788E770887878887788F777880FFFFF088887
        808878888878888787880F000F08E887808878777878F88787880FFFFF07EE87
        708878888877FF8777880F0F0FF07887088878787887788778880FFFFFFF0000
        888878888888777788880F000F0FFFF0888878777878888788880FFFFFFF0000
        888878888888777788880F000FFF0808888878777888787888880FFFFFFF0088
        8888788888887788888800000000088888887777777778888888}
      NumGlyphs = 2
    end
    object btnRecalc: TBitBtn
      Left = 94
      Top = 5
      Width = 82
      Height = 25
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100
      TabOrder = 2
      OnClick = btnRecalcClick
    end
  end
  object DBGridEh: TDBGridEh
    Left = 0
    Top = 57
    Width = 719
    Height = 316
    Align = alClient
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clSilver
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = [fsBold]
    FooterRowCount = 1
    FrozenCols = 2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CAUSE_NAME'
        Footers = <
          item
            Alignment = taRightJustify
            Value = #1050'-'#1074#1086', '#1096#1090
            ValueType = fvtStaticText
          end>
        Title.Alignment = taCenter
        Width = 176
      end
      item
        EditButtons = <>
        FieldName = 'OPER_DATE'
        Footers = <
          item
            FieldName = 'OPER_DATE'
            ValueType = fvtCount
          end>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'TO_ID'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'TO_INST'
        Footers = <
          item
            Value = #1054#1089#1090#1072#1090#1086#1082':'
            ValueType = fvtStaticText
          end>
        Title.Alignment = taCenter
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <
          item
            FieldName = 'LITR'
            ValueType = fvtSum
          end>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'LITR'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'CARD_REST'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'ID_RECEIPTS'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'REC_LITR'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'R_OPER_DATE'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'R_DOC_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'R_DOC_DATE'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'DOC_DATE'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'DOC_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'AUTO_ID'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'AUTO_INST'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOY_ID'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOY_INST'
        Footers = <>
        Title.Alignment = taCenter
      end>
  end
  object ds: TOraDataSource
    DataSet = qCTRest
    Left = 304
    Top = 192
  end
  object qCTRest: TOilQuery
    SQL.Strings = (
      'select --+ordered use_hash(ct,client,cause)'
      '  cause.cause_name,'
      '  ct.oper_date, '
      '  ct.to_id, '
      '  ct.to_inst, '
      '  client.name,'
      
        '  decode(tr_type,5,1,6,-1,7,1,9,-1,10,1,12,-1,0)*ct.litr as Litr' +
        ', '
      '  ct.card_rest, '
      '  ct.id_receipts,'
      '  ct.rec_litr,'
      '  ct.r_oper_date,'
      '  ct.r_doc_number,'
      '  ct.r_doc_date,'
      '  ct.doc_date,'
      '  ct.doc_number,'
      '  ct.auto_id,'
      '  ct.auto_inst,'
      '  ct.employ_id,'
      '  ct.employ_inst'
      'from '
      '  card_transaction_rest ct,'
      '  v_org client,'
      '  card_cause cause'
      'where ct.tr_type = cause.id (+)'
      '  and ct.to_id = client.id (+)'
      '  and ct.to_inst = client.inst (+)'
      '  and ct.card_number = :CardNumber'
      '  and ct.np_type = :NpType'
      
        'order by to_id, to_inst, card_number, np_type, oper_date desc, r' +
        '_oper_date desc'
      ' '
      ' '
      ' '
      ' ')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 240
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CardNumber'
      end
      item
        DataType = ftInteger
        Name = 'NpType'
      end>
    object qCTRestCAUSE_NAME: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1094#1080#1103
      FieldName = 'CAUSE_NAME'
      Size = 30
    end
    object qCTRestOPER_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 19
      FieldName = 'OPER_DATE'
    end
    object qCTRestTO_ID: TFloatField
      DisplayLabel = 'ID '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'TO_ID'
    end
    object qCTRestTO_INST: TFloatField
      DisplayLabel = 'INST '#1082#1083#1080#1077#1085#1090#1072
      DisplayWidth = 8
      FieldName = 'TO_INST'
    end
    object qCTRestNAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      DisplayWidth = 40
      FieldName = 'NAME'
      Size = 50
    end
    object qCTRestLITR: TFloatField
      DisplayLabel = #1050'-'#1074#1086', '#1083
      DisplayWidth = 8
      FieldName = 'LITR'
    end
    object qCTRestCARD_REST: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103
      DisplayWidth = 12
      FieldName = 'CARD_REST'
    end
    object qCTRestID_RECEIPTS: TFloatField
      DisplayLabel = 'ID '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103
      FieldName = 'ID_RECEIPTS'
    end
    object qCTRestREC_LITR: TFloatField
      DisplayLabel = #1055#1086#1087#1086#1083#1085#1077#1085#1086', '#1083
      FieldName = 'REC_LITR'
    end
    object qCTRestR_OPER_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103
      FieldName = 'R_OPER_DATE'
    end
    object qCTRestR_DOC_NUMBER: TStringField
      DisplayLabel = #1047#1072#1103#1074#1082#1072
      FieldName = 'R_DOC_NUMBER'
      Size = 15
    end
    object qCTRestR_DOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080
      FieldName = 'R_DOC_DATE'
    end
    object qCTRestDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082'.'
      FieldName = 'DOC_DATE'
    end
    object qCTRestDOC_NUMBER: TStringField
      DisplayLabel = #8470' '#1076#1086#1082'.'
      FieldName = 'DOC_NUMBER'
      Size = 10
    end
    object qCTRestAUTO_ID: TFloatField
      DisplayLabel = 'ID A'#1074#1090#1086
      FieldName = 'AUTO_ID'
    end
    object qCTRestAUTO_INST: TFloatField
      DisplayLabel = 'INST A'#1074#1090#1086
      FieldName = 'AUTO_INST'
    end
    object qCTRestEMPLOY_ID: TFloatField
      DisplayLabel = 'ID '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      FieldName = 'EMPLOY_ID'
    end
    object qCTRestEMPLOY_INST: TFloatField
      DisplayLabel = 'INST '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      FieldName = 'EMPLOY_INST'
    end
  end
  object PopupMenu: TPopupMenu
    Left = 400
    Top = 168
    object miPtintGrid: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      OnClick = miPtintGridClick
    end
  end
end
