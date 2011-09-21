inherited frmMoneyOut: TfrmMoneyOut
  Left = 229
  Top = 216
  Caption = 'Исходящие оплаты'
  ClientWidth = 754
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 754
    inherited Panel3: TPanel
      Left = 557
      inherited bbOk: TBitBtn
        Left = 12
      end
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
        Caption = 'Найти'
        OnClick = bbSearchClick
      end
    end
  end
  inherited Panel2: TPanel
    Width = 754
    Height = 88
    object Label1: TLabel
      Left = 8
      Top = 3
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
      Top = 43
      Width = 73
      Height = 13
      Caption = 'Организация :'
    end
    object Label3: TLabel
      Left = 112
      Top = 3
      Width = 86
      Height = 13
      Caption = 'Подразделение :'
    end
    object sbDepClear: TSpeedButton
      Left = 411
      Top = 19
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
      Top = 58
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
      Top = 3
      Width = 53
      Height = 13
      Caption = 'Операция:'
    end
    object SpeedButton1: TSpeedButton
      Left = 572
      Top = 18
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
      OnClick = SpeedButton1Click
    end
    object Label4: TLabel
      Left = 442
      Top = 44
      Width = 57
      Height = 13
      Caption = '№ оплаты :'
    end
    object deBeginDate: TDateEdit
      Left = 8
      Top = 19
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
      Top = 59
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
      Top = 59
      Width = 297
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = ceOrgNameButtonClick
      OnDblClick = ceOrgNameButtonClick
    end
    object ceDepName: TComboEdit
      Left = 112
      Top = 19
      Width = 297
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = ceDepNameButtonClick
      OnDblClick = ceDepNameButtonClick
    end
    object ceOperName: TComboEdit
      Left = 440
      Top = 18
      Width = 130
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = ceOperNameButtonClick
      OnDblClick = ceOperNameButtonClick
    end
    object edPayNum: TEdit
      Left = 442
      Top = 59
      Width = 65
      Height = 21
      TabOrder = 5
    end
  end
  inherited pBase: TPanel
    Top = 98
    Width = 604
    Height = 273
    inherited DBGrid1: TDBGridEh
      Width = 604
      Height = 273
      Columns = <
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'PAY_NUM'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = '№'
          Width = 39
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'PAY_DATE'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Дата'
          Width = 59
        end
        item
          EditButtons = <>
          FieldName = 'DOGNAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Договор'
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
          Width = 193
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
          Width = 172
        end
        item
          EditButtons = <>
          FieldName = 'PAY'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Сумма'
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = 'OPERTYPE'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Операция'
          Width = 92
        end>
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 754
    inherited pnlTuneGridBtn: TPanel
      Left = 725
    end
  end
  inherited PanelCol: TPanel
    Left = 604
    Top = 98
    Height = 273
    inherited cbCol: TRxCheckListBox
      Height = 245
    end
    inherited pRefresh: TPanel
      Top = 247
    end
  end
  inherited ds: TOraDataSource
    Left = 204
    Top = 180
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select'
      ' p.*,'
      ' dog.dog as DogName,'
      ' org.name as OrgName,'
      ' dep.name as DepName,'
      ' opt.name as OperType'
      'from'
      '  oil_money_out p,'
      '  oil_dog dog,'
      '  v_org dep,'
      '  v_org org,'
      '  oil_oper_type opt'
      'where p.dep_id = dep.id (+)'
      'and p.dep_inst = dep.inst (+)'
      'and p.org_id = org.id (+)'
      'and p.org_inst = org.inst (+)'
      'and p.state='#39'Y'#39
      'and p.dog_id = dog.id  (+)'
      'and p.dog_inst = dog.inst (+)'
      'and p.oper_id = opt.id (+)'
      'and (p.oper_id = :OperId or :OperId =0)'
      'and (org.Name like '#39'%'#39' || :OrgName || '#39'%'#39' or :OrgName is null)'
      'and (dep.Name like '#39'%'#39' || :DepName || '#39'%'#39' or :DepName is null)'
      'and (p.Pay_Num like '#39'%'#39' || :PayNum || '#39'%'#39' or :PayNum is null)'
      'and p.pay_date between :BeginDate and :EndDate'
      'order by p.pay_date desc, p.id desc'
      ' '
      ' '
      ' '
      ' ')
    Left = 168
    Top = 180
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OperId'
      end
      item
        DataType = ftInteger
        Name = 'OperId'
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
        Name = 'PayNum'
      end
      item
        DataType = ftString
        Name = 'PayNum'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
    object qPAYNUM: TStringField
      FieldName = 'PAY_NUM'
      Origin = 'MAINBASE.OIL_MONEY_OUT.PAY_NUM'
      Size = 10
    end
    object qPAYDATE: TDateTimeField
      FieldName = 'PAY_DATE'
      Origin = 'MAINBASE.OIL_MONEY_OUT.PAY_DATE'
    end
    object qDOGNAME: TStringField
      FieldName = 'DOGNAME'
      Origin = 'MAINBASE.OIL_DOG.DOG'
      Size = 15
    end
    object qORGNAME: TStringField
      FieldName = 'ORGNAME'
      Origin = 'MAINBASE.OIL_ORG.NAME'
      Size = 100
    end
    object qDEPNAME: TStringField
      FieldName = 'DEPNAME'
      Origin = 'MAINBASE.OIL_ORG.NAME'
      Size = 100
    end
    object qPAY: TFloatField
      FieldName = 'PAY'
      Origin = 'MAINBASE.OIL_MONEY_OUT.PAY'
    end
    object qOPERTYPE: TStringField
      FieldName = 'OPERTYPE'
      Origin = 'MAINBASE.OIL_OPER_TYPE.NAME'
      Size = 50
    end
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
    object qOPER_ID: TFloatField
      FieldName = 'OPER_ID'
    end
    object qDEP_ID: TFloatField
      FieldName = 'DEP_ID'
    end
    object qDEP_INST: TFloatField
      FieldName = 'DEP_INST'
    end
    object qORG_ID: TFloatField
      FieldName = 'ORG_ID'
    end
    object qORG_INST: TFloatField
      FieldName = 'ORG_INST'
    end
    object qREKV_ID: TFloatField
      FieldName = 'REKV_ID'
    end
    object qREKV_INST: TFloatField
      FieldName = 'REKV_INST'
    end
    object qDOG_ID: TFloatField
      FieldName = 'DOG_ID'
    end
    object qDOG_INST: TFloatField
      FieldName = 'DOG_INST'
    end
    object qPAY_COMMENT: TStringField
      FieldName = 'PAY_COMMENT'
      Size = 200
    end
  end
  inherited ADMQ: TOilQuery
    Left = 16
    Top = 232
  end
  inherited PUM: TPopupMenu
    Left = 240
    Top = 180
  end
end
