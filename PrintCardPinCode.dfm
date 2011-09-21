inherited PrintCardPinCodeForm: TPrintCardPinCodeForm
  Left = 110
  Top = 418
  Caption = #1055#1048#1053'-'#1082#1086#1085#1074#1077#1088#1090#1099' '#1076#1083#1103' '#1089#1084#1072#1088#1090'-'#1082#1072#1088#1090
  ClientWidth = 531
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 531
    object Label5: TLabel [0]
      Left = 346
      Top = 10
      Width = 62
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LCount: TLabel [1]
      Left = 416
      Top = 10
      Width = 8
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited Panel3: TPanel
      Left = 445
      Width = 84
      inherited bbOk: TBitBtn
        Left = 2
        Width = 80
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
      inherited bbCancel: TBitBtn
        Left = 2
        Width = 80
        Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
        Caption = #1047#1072#1082#1088#1099#1090#1100
        ParentShowHint = False
        ShowHint = True
      end
    end
    inherited PAdd: TPanel
      Left = 402
      Width = 0
    end
    inherited PEdit: TPanel
      Left = 402
      Width = 0
    end
    inherited pDel: TPanel
      Left = 402
      Width = 0
    end
    inherited Panel4: TPanel
      Left = 46
      Width = 296
      inherited bbClear: TBitBtn
        Left = 2
        Width = 80
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        Left = 87
        Width = 80
        OnClick = bbSearchClick
      end
      object BitBtn1: TBitBtn
        Left = 172
        Top = 2
        Width = 121
        Height = 25
        Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1077#1095#1072#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1077#1095#1072#1090#1080
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF000000000000FFFF777777777777FFF787777777777
          70FF78888888888887FF0F8888888888870F7FFFFFFFFFFFF87F0F9988888888
          87707F77FFFFFFFFF8877FFFFFFFFFFFF7707FFFFFFFFFFFF887F08888888887
          7F70F7FFFFFFFFF88F87FF087777777777F0FF7F8888888888F7FFF000000000
          000FFFF777777777777FFFFFFFFFFFF6EEE0FFFFFFFFFFF78887F7000000000E
          600FF87777777778777FF0E6EEEEEEEE08FFF787888888887FFFF7000000000E
          6007F877777777787778FFFFFFFFFF76EEE0FFFFFFFFFF878887FFFFFFFFFFF7
          0007FFFFFFFFFFF87778FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
      end
    end
    inherited pPrint: TPanel
      Left = 2
      Width = 44
      inherited sbBasePrint: TRxSpeedButton
        Width = 38
      end
    end
    inherited pTotal: TPanel
      Left = 342
    end
    inherited pSpeedUp: TPanel
      Left = 372
    end
    inherited pShowDetail: TPanel
      Left = 402
      Width = 43
    end
  end
  inherited Panel2: TPanel
    Width = 531
    Height = 54
    object Label1: TLabel
      Left = 6
      Top = 8
      Width = 39
      Height = 13
      Caption = #1050#1072#1088#1090#1072' '#1089
    end
    object Label2: TLabel
      Left = 126
      Top = 8
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object lClient: TLabel
      Left = 6
      Top = 31
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1083#1080#1077#1085#1090
    end
    object SpeedButton3: TSpeedButton
      Left = 504
      Top = 27
      Width = 21
      Height = 21
      Hint = '21'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD88DDDDDDDD
        88DDDDFFDDDDDDDDFFDDDD888DDDDDD888DDDDFFFDDDDDDFFFDDDDD888DDDD88
        8DDDDDDFFFDDDDFFFDDDDDDD888DD888DDDDDDDDFFFDDFFFDDDDDDDDD888888D
        DDDDDDDDDFFFFFFDDDDDDDDDDD8888DDDDDDDDDDDDFFFFDDDDDDDDDDDD8888DD
        DDDDDDDDDDFFFFDDDDDDDDDDD888888DDDDDDDDDDFFFFFFDDDDDDDDD888DD888
        DDDDDDDDFFFDDFFFDDDDDDD888DDDD888DDDDDDFFFDDDDFFFDDDDD888DDDDDD8
        88DDDDFFFDDDDDDFFFDDDD88DDDDDDDD88DDDDFFDDDDDDDDFFDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
      OnClick = SpeedButton3Click
    end
    object Label4: TLabel
      Left = 396
      Top = 8
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object Label3: TLabel
      Left = 262
      Top = 8
      Width = 35
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089
    end
    object SpeedButton1: TSpeedButton
      Left = 216
      Top = 3
      Width = 21
      Height = 21
      Hint = '21'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD88DDDDDDDD
        88DDDDFFDDDDDDDDFFDDDD888DDDDDD888DDDDFFFDDDDDDFFFDDDDD888DDDD88
        8DDDDDDFFFDDDDFFFDDDDDDD888DD888DDDDDDDDFFFDDFFFDDDDDDDDD888888D
        DDDDDDDDDFFFFFFDDDDDDDDDDD8888DDDDDDDDDDDDFFFFDDDDDDDDDDDD8888DD
        DDDDDDDDDDFFFFDDDDDDDDDDD888888DDDDDDDDDDFFFFFFDDDDDDDDD888DD888
        DDDDDDDDFFFDDFFFDDDDDDD888DDDD888DDDDDDFFFDDDDFFFDDDDD888DDDDDD8
        88DDDDFFFDDDDDDFFFDDDD88DDDDDDDD88DDDDFFDDDDDDDDFFDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 504
      Top = 3
      Width = 21
      Height = 21
      Hint = '21'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD88DDDDDDDD
        88DDDDFFDDDDDDDDFFDDDD888DDDDDD888DDDDFFFDDDDDDFFFDDDDD888DDDD88
        8DDDDDDFFFDDDDFFFDDDDDDD888DD888DDDDDDDDFFFDDFFFDDDDDDDDD888888D
        DDDDDDDDDFFFFFFDDDDDDDDDDD8888DDDDDDDDDDDDFFFFDDDDDDDDDDDD8888DD
        DDDDDDDDDDFFFFDDDDDDDDDDD888888DDDDDDDDDDFFFFFFDDDDDDDDD888DD888
        DDDDDDDDFFFDDFFFDDDDDDD888DDDD888DDDDDDFFFDDDDFFFDDDDD888DDDDDD8
        88DDDDFFFDDDDDDFFFDDDD88DDDDDDDD88DDDDFFDDDDDDDDFFDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
      OnClick = SpeedButton2Click
    end
    object eCardS: TEdit
      Left = 51
      Top = 4
      Width = 70
      Height = 21
      TabOrder = 0
      OnKeyPress = eCardSKeyPress
    end
    object eCardPo: TEdit
      Left = 143
      Top = 4
      Width = 70
      Height = 21
      TabOrder = 1
      OnKeyPress = eCardSKeyPress
    end
    object ceToName: TComboEdit
      Left = 51
      Top = 28
      Width = 452
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = ceToNameButtonClick
      OnDblClick = ceToNameButtonClick
    end
    object dePo: TDateEdit
      Left = 413
      Top = 4
      Width = 90
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object deS: TDateEdit
      Left = 303
      Top = 4
      Width = 90
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
  end
  inherited pBase: TPanel
    Top = 64
    Width = 381
    Height = 307
    inherited SplitterDetail: TSplitter
      Top = 252
      Width = 381
    end
    inherited DBGrid1: TDBGridEh
      Width = 381
      Height = 252
      FooterRowCount = 1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ReadOnly = True
      SumList.Active = True
      OnMouseUp = DBGrid1MouseUp
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CARD_NUMBER'
          Footer.Alignment = taLeftJustify
          Footer.Value = #1050#1072#1088#1090#1086#1095#1077#1082':'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.SortIndex = 1
          Title.SortMarker = smDownEh
          Title.TitleButton = True
          Width = 91
        end
        item
          EditButtons = <>
          FieldName = 'ORG_NAME'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'PIN_COD'
          Footers = <>
          Title.TitleButton = True
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'DATA_VYDACHI'
          Footers = <>
          Title.TitleButton = True
          Width = 101
        end>
    end
    inherited pDetail: TPanel
      Top = 255
      Width = 381
      inherited DBGridDetail: TDBGridEh
        Width = 381
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 531
    inherited pnlTuneGridBtn: TPanel
      Left = 502
    end
  end
  inherited PanelCol: TPanel
    Left = 381
    Top = 64
    Height = 307
    inherited cbCol: TRxCheckListBox
      Height = 279
    end
    inherited pRefresh: TPanel
      Top = 281
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select card.org_id,'
      '       card.org_inst,'
      '       o.name as org_name,'
      '       card_number,'
      '       pin_cod,'
      '       pin_cod_real,'
      '       data_vydachi'
      
        '  from (select to_number(substr(LPAD(to_char(ID_klienta_importa)' +
        ', 12, '#39'0'#39'),'
      '                                1,'
      
        '                                12 - ANDRIY.ov.GetVal('#39'INST_MAX_' +
        'LENGTH'#39'))) as org_id,'
      
        '               to_number(substr(LPAD(to_char(ID_klienta_importa)' +
        ', 12, '#39'0'#39'),'
      
        '                                12 - ANDRIY.ov.GetVal('#39'INST_MAX_' +
        'LENGTH'#39') + 1,'
      
        '                                ANDRIY.ov.GetVal('#39'INST_MAX_LENGT' +
        'H'#39'))) as org_inst,'
      '               ec.gr_nomer as card_number,'
      
        '               translate(ec.pin_cod, '#39'0123456789'#39', '#39'**********'#39')' +
        ' as pin_cod,'
      '               ec.pin_cod as pin_cod_real,'
      '               ec.data_vydachi'
      '          from &card_user.ecfil012 ec, &card_user.ecfil108 eo'
      '         where ec.id_vladeltza = eo.id_nashego_klienta'
      '           and ec.id_prinadlejnosti = eo.id_prinadlejnosti'
      '           and ec.id_sostoyanya = 1) card,'
      '       (select /*+PUSH_SUBQ*/'
      '         id, inst, name'
      '          from andriy.v_org'
      '         where state = '#39'Y'#39
      '        union all'
      '        select id, inst, name'
      '          from oil_old.v_org oo'
      '         where state = '#39'Y'#39
      '           and not exists (select oa.id, oa.inst'
      '                  from andriy.v_org oa'
      '                 where oa.state = '#39'Y'#39
      '                   and oa.id = oo.id'
      '                   and oa.inst = oo.inst)) o'
      ' where o.id = card.org_id'
      '   and o.inst = card.org_inst'
      ' order by card_number')
    Left = 216
    Top = 116
    MacroData = <
      item
        Name = 'card_user'
      end>
    object qORG_ID: TFloatField
      FieldName = 'ORG_ID'
    end
    object qORG_NAME: TStringField
      DisplayLabel = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      DisplayWidth = 40
      FieldName = 'ORG_NAME'
      Size = 250
    end
    object qCARD_NUMBER: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1099
      DisplayWidth = 13
      FieldName = 'CARD_NUMBER'
    end
    object qPIN_COD: TStringField
      DisplayLabel = #1055#1048#1053'-'#1082#1086#1076
      FieldName = 'PIN_COD'
      Size = 8
    end
    object qPIN_COD_REAL: TStringField
      FieldName = 'PIN_COD_REAL'
      Size = 0
    end
    object qDATA_VYDACHI: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      DisplayWidth = 15
      FieldName = 'DATA_VYDACHI'
    end
  end
  inherited ADMQ: TOilQuery
    Left = 16
    Top = 184
  end
  inherited PUM: TPopupMenu
    Left = 8
    Top = 328
    object N11: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1055#1048#1053'-'#1082#1086#1076#1086#1074' '#1074' '#1055#1048#1053'-'#1082#1086#1085#1074#1077#1088#1090#1077
      OnClick = N11Click
    end
    object N1: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1074#1089#1077#1093' '#1055#1048#1053'-'#1082#1086#1076#1086#1074' '#1074' '#1055#1048#1053'-'#1082#1086#1085#1074#1077#1088#1090#1077
      OnClick = N1Click
    end
  end
  object PrinterSD: TPrinterSetupDialog
    Left = 136
    Top = 224
  end
end
