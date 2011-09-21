inherited AzsDeviceForm: TAzsDeviceForm
  Left = 308
  Top = 242
  Caption = #1059#1089#1090#1088#1086#1081#1089#1090#1074#1072' '#1085#1072' '#1040#1047#1057
  ClientHeight = 423
  ClientWidth = 742
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 390
    Width = 742
    inherited Panel3: TPanel
      Left = 545
    end
    inherited PAdd: TPanel
      Visible = True
      inherited sbAdd: TSpeedButton
        OnClick = sbAddClick
      end
    end
    inherited PEdit: TPanel
      Visible = True
    end
    inherited pDel: TPanel
      Visible = True
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      inherited bbClear: TBitBtn
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
    inherited pPrint: TPanel
      Visible = True
    end
    inherited pShowDetail: TPanel
      Width = 177
    end
  end
  inherited Panel2: TPanel
    Width = 742
    Height = 87
    object Label2: TLabel
      Left = 9
      Top = 6
      Width = 70
      Height = 13
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103':'
    end
    object sbOrgClear: TSpeedButton
      Left = 236
      Top = 20
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
      OnClick = sbOrgClearClick
    end
    object Label3: TLabel
      Left = 9
      Top = 43
      Width = 24
      Height = 13
      Caption = #1040#1047#1057':'
    end
    object sbCearAZS: TSpeedButton
      Left = 236
      Top = 58
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
      OnClick = sbCearAZSClick
    end
    object Label1: TLabel
      Left = 273
      Top = 42
      Width = 74
      Height = 13
      Caption = #8470' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072':'
    end
    object Label4: TLabel
      Left = 273
      Top = 6
      Width = 82
      Height = 13
      Caption = #1058#1080#1087' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072':'
    end
    object sbDevTypeClear: TSpeedButton
      Left = 443
      Top = 20
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
      OnClick = sbDevTypeClearClick
    end
    object ceParName: TComboEdit
      Left = 9
      Top = 20
      Width = 226
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ceParNameButtonClick
      OnDblClick = ceParNameButtonClick
    end
    object ceAZSName: TComboEdit
      Left = 9
      Top = 58
      Width = 226
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = ceAZSNameButtonClick
      OnDblClick = ceAZSNameButtonClick
    end
    object edDeviceNumber: TEdit
      Left = 273
      Top = 57
      Width = 169
      Height = 21
      TabOrder = 2
    end
    object edDeviceType: TComboEdit
      Left = 273
      Top = 20
      Width = 169
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = edDeviceTypeButtonClick
      OnDblClick = edDeviceTypeButtonClick
    end
  end
  inherited pBase: TPanel
    Top = 97
    Width = 592
    Height = 293
    inherited SplitterDetail: TSplitter
      Top = 238
      Width = 592
    end
    inherited DBGrid1: TDBGridEh
      Width = 592
      Height = 238
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      RowHeight = 8
      RowLines = 2
      RowSizingAllowed = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PAR_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          Width = 142
        end
        item
          EditButtons = <>
          FieldName = 'AZS_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1040#1047#1057
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'DEVICE_TYPE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1058#1080#1087' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
          Width = 114
        end
        item
          EditButtons = <>
          FieldName = 'DATE_FROM'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1084#1086#1085#1090#1072#1078#1072
          Width = 109
        end
        item
          EditButtons = <>
          FieldName = 'DATE_TO'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1076#1077#1084#1086#1085#1090#1072#1078#1072
          Width = 106
        end
        item
          EditButtons = <>
          FieldName = 'DEVICE_NUM'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'DEVICE_STR'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
          Width = 150
        end>
    end
    inherited pDetail: TPanel
      Top = 241
      Width = 592
      inherited DBGridDetail: TDBGridEh
        Width = 592
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 742
    inherited pnlTuneGridBtn: TPanel
      Left = 713
    end
  end
  inherited PanelCol: TPanel
    Left = 592
    Top = 97
    Height = 293
    inherited cbCol: TRxCheckListBox
      Height = 265
    end
    inherited pRefresh: TPanel
      Top = 267
    end
  end
  inherited ds: TOraDataSource
    Left = 180
    Top = 212
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select'
      '  par.id as par_id,'
      '  par.inst as par_inst,'
      '  par.name as par_name,'
      '  dev.id,'
      '  dev.inst,'
      '  azs.id as azs_id,'
      '  azs.inst as azs_inst,'
      '  azs.name as azs_name,'
      '  devt.name as device_type,'
      '  devt.id as device_type_id,'
      '  dev.date_from,'
      '  dev.date_to,'
      '  dev.device_num,'
      '  dev.device_str'
      'from'
      '  v_org azs,'
      '  v_org par,'
      '  oil_azs_device dev,'
      '  oil_azs_device_type devt'
      'where'
      '  dev.azs_id = azs.id (+) and'
      '  dev.state = '#39'Y'#39' and'
      '  dev.azs_inst = azs.inst (+) and'
      '  azs.state (+) = '#39'Y'#39' and'
      '  dev.device_type_id = devt.id (+)  and'
      '  azs.par = par.id (+) and'
      '  azs.par_inst = par.inst (+) and'
      '  par.state (+) = '#39'Y'#39' and'
      '  (azs.Name like '#39'%'#39' || :AzsName || '#39'%'#39' or :AzsName is null) and'
      '  (par.Name like '#39'%'#39' || :ParName || '#39'%'#39' or :ParName is null) and'
      
        '  (devt.Name like '#39'%'#39' || :DevtName || '#39'%'#39' or :DevtName is null) ' +
        'and'
      '  (dev.device_num like '#39'%'#39' || :DevNum || '#39'%'#39' or :DevNum is null)'
      'order by par.name, azs.name, dev.date_from, dev.date_to'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 120
    Top = 212
    ParamData = <
      item
        DataType = ftString
        Name = 'AzsName'
      end
      item
        DataType = ftString
        Name = 'AzsName'
      end
      item
        DataType = ftString
        Name = 'ParName'
      end
      item
        DataType = ftString
        Name = 'ParName'
      end
      item
        DataType = ftString
        Name = 'DevtName'
      end
      item
        DataType = ftString
        Name = 'DevtName'
      end
      item
        DataType = ftString
        Name = 'DevNum'
      end
      item
        DataType = ftString
        Name = 'DevNum'
      end>
    object qAZS_NAME: TStringField
      FieldName = 'AZS_NAME'
      Size = 100
    end
    object qDEVICE_TYPE: TStringField
      FieldName = 'DEVICE_TYPE'
      Size = 50
    end
    object qDATE_FROM: TDateTimeField
      FieldName = 'DATE_FROM'
    end
    object qDATE_TO: TDateTimeField
      FieldName = 'DATE_TO'
    end
    object qDEVICE_STR: TStringField
      FieldName = 'DEVICE_STR'
      Size = 25
    end
    object qDEVICE_NUM: TStringField
      FieldName = 'DEVICE_NUM'
      Size = 25
    end
    object qID: TFloatField
      FieldName = 'ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
    end
    object qAZS_ID: TFloatField
      FieldName = 'AZS_ID'
    end
    object qAZS_INST: TFloatField
      FieldName = 'AZS_INST'
    end
    object qPAR_ID: TFloatField
      FieldName = 'PAR_ID'
    end
    object qPAR_INST: TFloatField
      FieldName = 'PAR_INST'
    end
    object qPAR_NAME: TStringField
      FieldName = 'PAR_NAME'
      Size = 100
    end
    object qDEVICE_TYPE_ID: TFloatField
      FieldName = 'DEVICE_TYPE_ID'
    end
  end
  inherited ADMQ: TOilQuery
    Left = 16
    Top = 224
  end
  inherited PUM: TPopupMenu
    Left = 288
    Top = 216
    object miRefreshBankDevice: TMenuItem [0]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1073#1072#1085#1082#1086#1074#1089#1082#1080#1084' '#1090#1077#1088#1084#1080#1085#1072#1083#1072#1084
      OnClick = miRefreshBankDeviceClick
    end
    object N1: TMenuItem [1]
      Caption = '-'
    end
  end
  inherited ActionList: TActionList
    Left = 240
  end
end
