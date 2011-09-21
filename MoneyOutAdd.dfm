inherited frmMoneyOutAdd: TfrmMoneyOutAdd
  Left = 395
  Top = 231
  BorderStyle = bsDialog
  Caption = 'Исходящая оплата'
  ClientHeight = 306
  ClientWidth = 307
  OldCreateOrder = True
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pButtons: TPanel
    Left = 0
    Top = 265
    Width = 307
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object bbOK: TBitBtn
      Left = 135
      Top = 8
      Width = 79
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Принять'
      TabOrder = 0
      OnClick = bbOKClick
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
      Left = 218
      Top = 8
      Width = 82
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Отменить'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 307
    Height = 265
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label8: TLabel
      Left = 7
      Top = 205
      Width = 73
      Height = 13
      Caption = 'Комментарий:'
    end
    object Label6: TLabel
      Left = 6
      Top = 167
      Width = 37
      Height = 13
      Caption = 'Сумма:'
    end
    object sbDogClear: TSpeedButton
      Left = 130
      Top = 142
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
      OnClick = sbDogClearClick
    end
    object Label7: TLabel
      Left = 160
      Top = 129
      Width = 53
      Height = 13
      Caption = 'Операция:'
    end
    object Label5: TLabel
      Left = 7
      Top = 129
      Width = 47
      Height = 13
      Caption = 'Договор:'
    end
    object Label2: TLabel
      Left = 7
      Top = 88
      Width = 73
      Height = 13
      Caption = 'Организация :'
    end
    object Label3: TLabel
      Left = 7
      Top = 48
      Width = 86
      Height = 13
      Caption = 'Подразделение :'
    end
    object Label1: TLabel
      Left = 137
      Top = 4
      Width = 74
      Height = 13
      Caption = 'Номер оплаты'
    end
    object Label4: TLabel
      Left = 6
      Top = 6
      Width = 66
      Height = 13
      Caption = 'Дата оплаты'
    end
    object mComment: TMemo
      Left = 8
      Top = 218
      Width = 289
      Height = 43
      TabOrder = 0
    end
    object edPay: TRxCalcEdit
      Left = 8
      Top = 183
      Width = 108
      Height = 21
      AutoSize = False
      NumGlyphs = 2
      TabOrder = 1
    end
    object ceDogName: TComboEdit
      Left = 8
      Top = 144
      Width = 121
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = ceDogNameButtonClick
      OnDblClick = ceDogNameButtonClick
    end
    object ceOperName: TComboEdit
      Left = 160
      Top = 144
      Width = 143
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = ceOperNameButtonClick
      OnDblClick = ceOperNameButtonClick
    end
    object ceOrgName: TComboEdit
      Left = 8
      Top = 104
      Width = 295
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = ceOrgNameButtonClick
      OnDblClick = ceOrgNameButtonClick
    end
    object ceDepName: TComboEdit
      Left = 8
      Top = 64
      Width = 295
      Height = 21
      DirectInput = False
      Enabled = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = ceDepNameButtonClick
      OnDblClick = ceDepNameButtonClick
    end
    object dePayDate: TDateEdit
      Left = 8
      Top = 21
      Width = 121
      Height = 21
      DirectInput = False
      NumGlyphs = 2
      TabOrder = 6
    end
    object edPayNum: TEdit
      Left = 137
      Top = 20
      Width = 108
      Height = 21
      TabOrder = 7
    end
  end
  object qProperties: TOilQuery
    SQL.Strings = (
      'SELECT *'
      'FROM v_oil_rekvizit'
      'WHERE id_org = :p_OrgId'
      '  AND inst = :p_OrgInst'
      'ORDER BY def DESC  ')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 216
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_OrgId'
      end
      item
        DataType = ftInteger
        Name = 'p_OrgInst'
      end>
  end
end
