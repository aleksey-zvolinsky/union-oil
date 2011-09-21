inherited frmDiscount: TfrmDiscount
  Left = 235
  Top = 189
  Caption = 'Скидки'
  ClientHeight = 336
  ClientWidth = 759
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 303
    Width = 759
    inherited Panel3: TPanel
      Left = 562
    end
    inherited PAdd: TPanel
      inherited sbAdd: TSpeedButton
        OnClick = sbAddClick
      end
    end
    inherited pDel: TPanel
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
  end
  inherited Panel2: TPanel
    Width = 759
    Height = 95
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = 'Дата c:'
    end
    object Label7: TLabel
      Left = 8
      Top = 48
      Width = 15
      Height = 13
      Caption = 'по:'
    end
    object Label2: TLabel
      Left = 112
      Top = 48
      Width = 73
      Height = 13
      Caption = 'Организация :'
    end
    object Label3: TLabel
      Left = 112
      Top = 8
      Width = 86
      Height = 13
      Caption = 'Подразделение :'
    end
    object sbDepClear: TSpeedButton
      Left = 411
      Top = 24
      Width = 23
      Height = 22
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
      OnClick = sbDepClearClick
    end
    object sbOrgClear: TSpeedButton
      Left = 411
      Top = 63
      Width = 22
      Height = 22
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
    object Label8: TLabel
      Left = 441
      Top = 48
      Width = 61
      Height = 13
      Caption = 'Тип скидки:'
    end
    object sbDiscTypeClear: TSpeedButton
      Left = 573
      Top = 64
      Width = 23
      Height = 21
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
      OnClick = sbDiscTypeClearClick
    end
    object Label4: TLabel
      Left = 442
      Top = 12
      Width = 38
      Height = 13
      Caption = 'Тип НП'
    end
    object sbNPClear: TSpeedButton
      Left = 572
      Top = 25
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
      OnClick = sbNPClearClick
    end
    object deBeginDate: TDateEdit
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      CheckOnExit = True
      DefaultToday = True
      DirectInput = False
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
      Text = '16.05.2003'
    end
    object deEndDate: TDateEdit
      Left = 8
      Top = 64
      Width = 97
      Height = 21
      CheckOnExit = True
      DefaultToday = True
      DirectInput = False
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
      Text = '16.05.2003'
    end
    object ceOrgName: TComboEdit
      Left = 112
      Top = 64
      Width = 297
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = ceOrgNameButtonClick
      OnDblClick = ceOrgNameButtonClick
    end
    object ceDiscountType: TComboEdit
      Left = 441
      Top = 63
      Width = 130
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = ceDiscountTypeButtonClick
      OnDblClick = ceDiscountTypeButtonClick
    end
    object ceDepName: TComboEdit
      Left = 112
      Top = 24
      Width = 297
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = ceDepNameButtonClick
      OnDblClick = ceDepNameButtonClick
    end
    object ceNpType: TComboEdit
      Left = 441
      Top = 25
      Width = 130
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = ceNpTypeButtonClick
      OnDblClick = ceNpTypeButtonClick
    end
  end
  inherited pBase: TPanel
    Top = 105
    Width = 609
    Height = 198
    inherited DBGrid1: TDBGridEh
      Width = 609
      Height = 198
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DISCOUNT_DATE'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Дата'
          Width = 98
        end
        item
          EditButtons = <>
          FieldName = 'DEPNAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Подразделение'
          Width = 203
        end
        item
          EditButtons = <>
          FieldName = 'ORGNAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Организация'
          Width = 171
        end
        item
          EditButtons = <>
          FieldName = 'DISCOUNTTYPE'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Тип скидки'
          Width = 102
        end
        item
          EditButtons = <>
          FieldName = 'NPNAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Тип НП'
          Width = 101
        end
        item
          EditButtons = <>
          FieldName = 'DISCOUNT'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Скидка, %'
          Width = 59
        end>
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 759
    inherited pnlTuneGridBtn: TPanel
      Left = 730
    end
  end
  inherited PanelCol: TPanel
    Left = 609
    Top = 105
    Height = 198
    inherited cbCol: TRxCheckListBox
      Height = 170
    end
    inherited pRefresh: TPanel
      Top = 172
    end
  end
  inherited ds: TOraDataSource
    Left = 156
    Top = 212
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select'
      ' disc.*,'
      ' dep.name as DepName,'
      ' org.name as OrgName,'
      ' disct.name as DiscountType,'
      ' npg.fullname as NpName'
      'from'
      '  v_org dep,'
      '  v_org org,'
      '  oil_discount disc,'
      '  oil_np_group npg,'
      '  oil_discount_type disct'
      'where'
      '  disc.state = '#39'Y'#39' and'
      '  disc.Org_Id = org.id (+) and'
      '  disc.Org_Inst = org.inst (+) and'
      '  disc.inst = dep.inst and'
      '  disc.inst = dep.id and'
      '  disc.discount_type = disct.id (+) and'
      '  disc.discount_npg_id = npg.petrol_id (+)'
      'and (disc.discount_type = :DiscType or :DiscType =0)'
      'and (org.Name like '#39'%'#39' || :OrgName || '#39'%'#39' or :OrgName is null)'
      'and (dep.Name like '#39'%'#39' || :DepName || '#39'%'#39' or :DepName is null)'
      
        'and (npg.FullName like '#39'%'#39' || :NpgName || '#39'%'#39' or :NpgName is nul' +
        'l)'
      'and disc.discount_date between :BeginDate and :EndDate'
      'order by disc.discount_date desc, disc.id desc'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 120
    Top = 212
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DiscType'
      end
      item
        DataType = ftInteger
        Name = 'DiscType'
      end
      item
        DataType = ftString
        Name = 'OrgName'
      end
      item
        DataType = ftString
        Name = 'OrgName'
      end
      item
        DataType = ftString
        Name = 'DepName'
      end
      item
        DataType = ftString
        Name = 'DepName'
      end
      item
        DataType = ftString
        Name = 'NpgName'
      end
      item
        DataType = ftString
        Name = 'NpgName'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
    object qID: TFloatField
      FieldName = 'ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
    end
    object qSTATE: TStringField
      FieldName = 'STATE'
      Size = 1
    end
    object qDISCOUNT_DATE: TDateTimeField
      FieldName = 'DISCOUNT_DATE'
    end
    object qDISCOUNT_TYPE: TFloatField
      FieldName = 'DISCOUNT_TYPE'
    end
    object qDISCOUNT: TFloatField
      FieldName = 'DISCOUNT'
    end
    object qORG_ID: TFloatField
      FieldName = 'ORG_ID'
    end
    object qORG_INST: TFloatField
      FieldName = 'ORG_INST'
    end
    object qDEPNAME: TStringField
      FieldName = 'DEPNAME'
      Size = 100
    end
    object qORGNAME: TStringField
      FieldName = 'ORGNAME'
      Size = 100
    end
    object qDISCOUNTTYPE: TStringField
      FieldName = 'DISCOUNTTYPE'
      Size = 50
    end
    object qNPNAME: TStringField
      FieldName = 'NPNAME'
      Size = 40
    end
    object qDISCOUNT_NPG_ID: TFloatField
      FieldName = 'DISCOUNT_NPG_ID'
    end
  end
  inherited ADMQ: TOilQuery
    Left = 40
    Top = 208
  end
  inherited PUM: TPopupMenu
    Left = 72
    Top = 208
  end
end
