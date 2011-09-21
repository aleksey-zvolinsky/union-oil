inherited InvRepForm: TInvRepForm
  Left = 312
  Top = 162
  BorderStyle = bsDialog
  Caption = 'Инвентаризационные отчеты'
  ClientHeight = 169
  ClientWidth = 405
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 34
    Height = 13
    Caption = 'Номер'
  end
  object Label2: TLabel
    Left = 8
    Top = 43
    Width = 49
    Height = 13
    Caption = 'Владелец'
  end
  object Label3: TLabel
    Left = 8
    Top = 76
    Width = 82
    Height = 13
    Caption = 'Дата начальная'
  end
  object Label4: TLabel
    Left = 8
    Top = 108
    Width = 76
    Height = 13
    Caption = 'Дата конечная'
  end
  object Panel2: TPanel
    Left = 0
    Top = 136
    Width = 405
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    object bbOk: TBitBtn
      Left = 168
      Top = 4
      Width = 110
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Формировать'
      Default = True
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
      Left = 288
      Top = 4
      Width = 110
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Отменить'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object edFrom: TComboEdit
    Left = 96
    Top = 40
    Width = 297
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 1
    OnButtonClick = edFromButtonClick
  end
  object DateEdit1: TDateEdit
    Left = 96
    Top = 72
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object DateEdit2: TDateEdit
    Left = 96
    Top = 104
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
  end
  object RxCalcEdit1: TRxCalcEdit
    Left = 96
    Top = 8
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 6
    DisplayFormat = '######'
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 0
  end
  object CB1: TCheckBox
    Left = 8
    Top = 104
    Width = 249
    Height = 17
    Caption = 'Учитывать только мерный товар'
    Checked = True
    State = cbChecked
    TabOrder = 4
    Visible = False
  end
  object q: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 208
    Top = 8
  end
  object OrgQ: TOilQuery
    SQL.Strings = (
      'select * from v_oil_org where id =:id and inst = :inst')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 264
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
      end
      item
        DataType = ftInteger
        Name = 'inst'
      end>
    object OrgQID: TFloatField
      FieldName = 'ID'
      Origin = 'V_OIL_ORG.ID'
    end
    object OrgQNAME: TStringField
      FieldName = 'NAME'
      Origin = 'V_OIL_ORG.NAME'
      Size = 100
    end
    object OrgQINST: TFloatField
      FieldName = 'INST'
      Origin = 'V_OIL_ORG.INST'
    end
    object OrgQID_NUM: TStringField
      FieldName = 'ID_NUM'
      Origin = 'V_OIL_ORG.ID_NUM'
    end
    object OrgQNAL_NUM: TStringField
      FieldName = 'NAL_NUM'
      Origin = 'V_OIL_ORG.NAL_NUM'
      Size = 50
    end
    object OrgQSVID_NUM: TStringField
      FieldName = 'SVID_NUM'
      Origin = 'V_OIL_ORG.SVID_NUM'
      Size = 50
    end
    object OrgQADDR: TStringField
      FieldName = 'ADDR'
      Origin = 'V_OIL_ORG.ADDR'
      Size = 200
    end
    object OrgQSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
      Origin = 'V_OIL_ORG.START_DATE'
    end
    object OrgQPHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'V_OIL_ORG.PHONE'
      Size = 30
    end
    object OrgQE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Origin = 'V_OIL_ORG.E_MAIL'
      Size = 100
    end
    object OrgQBOSS: TStringField
      FieldName = 'BOSS'
      Origin = 'V_OIL_ORG.BOSS'
      Size = 50
    end
    object OrgQBOSS_TEL_H: TStringField
      FieldName = 'BOSS_TEL_H'
      Origin = 'V_OIL_ORG.BOSS_TEL_H'
      Size = 30
    end
    object OrgQBOSS_TEL_W: TStringField
      FieldName = 'BOSS_TEL_W'
      Origin = 'V_OIL_ORG.BOSS_TEL_W'
      Size = 30
    end
    object OrgQDOV: TStringField
      FieldName = 'DOV'
      Origin = 'V_OIL_ORG.DOV'
      Size = 50
    end
    object OrgQDOV_DATE: TDateTimeField
      FieldName = 'DOV_DATE'
      Origin = 'V_OIL_ORG.DOV_DATE'
    end
    object OrgQGBUH: TStringField
      FieldName = 'GBUH'
      Origin = 'V_OIL_ORG.GBUH'
      Size = 50
    end
    object OrgQGBUH_TEL_H: TStringField
      FieldName = 'GBUH_TEL_H'
      Origin = 'V_OIL_ORG.GBUH_TEL_H'
      Size = 30
    end
    object OrgQGBUH_TEL_W: TStringField
      FieldName = 'GBUH_TEL_W'
      Origin = 'V_OIL_ORG.GBUH_TEL_W'
      Size = 30
    end
    object OrgQPAR: TFloatField
      FieldName = 'PAR'
      Origin = 'V_OIL_ORG.PAR'
    end
    object OrgQPAR_INST: TFloatField
      FieldName = 'PAR_INST'
      Origin = 'V_OIL_ORG.PAR_INST'
    end
    object OrgQFACE: TFloatField
      FieldName = 'FACE'
      Origin = 'V_OIL_ORG.FACE'
    end
    object OrgQNUM: TStringField
      FieldName = 'NUM'
      Origin = 'V_OIL_ORG.NUM'
    end
    object OrgQVED_NAME: TStringField
      FieldName = 'VED_NAME'
      Origin = 'V_OIL_ORG.VED_NAME'
      Size = 50
    end
    object OrgQVED_ID: TFloatField
      FieldName = 'VED_ID'
      Origin = 'V_OIL_ORG.VED_ID'
    end
    object OrgQORG_TYPE: TStringField
      FieldName = 'ORG_TYPE'
      Origin = 'V_OIL_ORG.ORG_TYPE'
      Size = 50
    end
    object OrgQORG_ID: TFloatField
      FieldName = 'ORG_ID'
      Origin = 'V_OIL_ORG.ORG_ID'
    end
    object OrgQPAR_NAME: TStringField
      FieldName = 'PAR_NAME'
      Origin = 'V_OIL_ORG.PAR_NAME'
      Size = 100
    end
    object OrgQREK_ID: TFloatField
      FieldName = 'REK_ID'
      Origin = 'V_OIL_ORG.REK_ID'
    end
    object OrgQREK_INST: TFloatField
      FieldName = 'REK_INST'
      Origin = 'V_OIL_ORG.REK_INST'
    end
    object OrgQRACH_CHET: TStringField
      FieldName = 'RACH_CHET'
      Origin = 'V_OIL_ORG.RACH_CHET'
    end
    object OrgQMFO: TStringField
      FieldName = 'MFO'
      Origin = 'V_OIL_ORG.MFO'
    end
    object OrgQBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Origin = 'V_OIL_ORG.BANK_NAME'
      Size = 50
    end
    object OrgQDEF: TFloatField
      FieldName = 'DEF'
      Origin = 'V_OIL_ORG.DEF'
    end
  end
end
