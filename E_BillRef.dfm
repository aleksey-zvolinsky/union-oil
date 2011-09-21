inherited E_BillRefForm: TE_BillRefForm
  Left = 331
  Top = 352
  Width = 721
  Height = 401
  Caption = 'Справочник - Оплаты и поступления'
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 169
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 709
      Height = 39
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel8: TPanel
        Left = 2
        Top = 2
        Width = 239
        Height = 35
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 10
          Width = 7
          Height = 13
          Caption = 'C'
        end
        object Label2: TLabel
          Left = 118
          Top = 10
          Width = 12
          Height = 13
          Caption = 'по'
        end
        object deS: TDateEdit
          Left = 24
          Top = 6
          Width = 89
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
        end
        object dePo: TDateEdit
          Left = 138
          Top = 6
          Width = 89
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object Panel5: TPanel
        Left = 241
        Top = 2
        Width = 466
        Height = 35
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object sbClearDep: TSpeedButton
          Left = 438
          Top = 6
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
          OnClick = sbClearDepClick
        end
        object Label3: TLabel
          Left = 8
          Top = 10
          Width = 83
          Height = 13
          Caption = 'Подразделение:'
        end
        object ceDep: TComboEdit
          Left = 104
          Top = 6
          Width = 333
          Height = 21
          GlyphKind = gkDropDown
          NumGlyphs = 1
          TabOrder = 0
          OnButtonClick = ceDepButtonClick
          OnDblClick = ceDepButtonClick
        end
      end
    end
    object Panel6: TPanel
      Left = 2
      Top = 41
      Width = 709
      Height = 126
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel9: TPanel
        Left = 241
        Top = 2
        Width = 466
        Height = 122
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Label7: TLabel
          Left = 6
          Top = 8
          Width = 107
          Height = 13
          Caption = 'Тип статьи бюджета:'
        end
        object Label8: TLabel
          Left = 6
          Top = 31
          Width = 86
          Height = 13
          Caption = 'Статья бюджета:'
        end
        object sbClearActivity: TSpeedButton
          Left = 295
          Top = 4
          Width = 23
          Height = 22
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
          OnClick = sbClearActivityClick
        end
        object sbClearBudget: TSpeedButton
          Left = 295
          Top = 27
          Width = 23
          Height = 22
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
          OnClick = sbClearBudgetClick
        end
        object Label5: TLabel
          Left = 325
          Top = 62
          Width = 37
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Номер:'
        end
        object sbClearNum: TSpeedButton
          Left = 437
          Top = 58
          Width = 23
          Height = 22
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
          OnClick = sbClearNumClick
        end
        object Label6: TLabel
          Left = 325
          Top = 80
          Width = 73
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Комментарий:'
        end
        object sbClearComments: TSpeedButton
          Left = 437
          Top = 96
          Width = 23
          Height = 22
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
          OnClick = sbClearCommentsClick
        end
        object sbClearSpring: TSpeedButton
          Left = 295
          Top = 50
          Width = 23
          Height = 22
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
          OnClick = sbClearSpringClick
        end
        object Label10: TLabel
          Left = 6
          Top = 54
          Width = 51
          Height = 13
          Caption = 'Источник:'
        end
        object sbClearPermit: TSpeedButton
          Left = 295
          Top = 73
          Width = 23
          Height = 22
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
          OnClick = sbClearPermitClick
        end
        object Label11: TLabel
          Left = 6
          Top = 76
          Width = 66
          Height = 13
          Caption = 'Разрешение:'
        end
        object sbClearObject: TSpeedButton
          Left = 295
          Top = 96
          Width = 23
          Height = 22
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
          OnClick = sbClearObjectClick
        end
        object Label12: TLabel
          Left = 6
          Top = 99
          Width = 41
          Height = 13
          Caption = 'Объект:'
        end
        object CEBudget: TComboEdit
          Left = 120
          Top = 27
          Width = 175
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 1
          OnButtonClick = CEBudgetButtonClick
          OnDblClick = CEBudgetButtonClick
        end
        object CEActivity: TComboEdit
          Left = 120
          Top = 4
          Width = 175
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 0
          OnButtonClick = CEActivityButtonClick
          OnDblClick = CEActivityButtonClick
        end
        object edNum: TEdit
          Left = 368
          Top = 58
          Width = 67
          Height = 21
          Anchors = [akTop, akRight]
          MaxLength = 255
          TabOrder = 8
        end
        object edComments: TEdit
          Left = 325
          Top = 96
          Width = 110
          Height = 21
          Anchors = [akTop, akRight]
          MaxLength = 255
          TabOrder = 9
        end
        object cbImpNoRaz: TCheckBox
          Left = 325
          Top = 4
          Width = 132
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Импорт. и не разнес.'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object cbImpRaz: TCheckBox
          Left = 325
          Top = 22
          Width = 132
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Импорт. и разнесенн.'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object cbHand: TCheckBox
          Left = 325
          Top = 40
          Width = 124
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Внесенные вручную'
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
        object CESpring: TComboEdit
          Left = 120
          Top = 50
          Width = 175
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 2
          OnButtonClick = CESpringButtonClick
          OnDblClick = CESpringButtonClick
        end
        object CEPermit: TComboEdit
          Left = 120
          Top = 73
          Width = 175
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 3
          OnButtonClick = CEPermitButtonClick
          OnDblClick = CEPermitButtonClick
        end
        object CEObject: TComboEdit
          Left = 120
          Top = 96
          Width = 175
          Height = 21
          DirectInput = False
          GlyphKind = gkDropDown
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 1
          TabOrder = 4
          OnButtonClick = CEObjectButtonClick
          OnDblClick = CEObjectButtonClick
        end
      end
      object Panel10: TPanel
        Left = 2
        Top = 2
        Width = 239
        Height = 122
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label4: TLabel
          Left = 8
          Top = 4
          Width = 39
          Height = 13
          Caption = 'Клиент:'
        end
        object sbClearOrg: TSpeedButton
          Left = 210
          Top = 20
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
          OnClick = sbClearOrgClick
        end
        object ClearBank: TSpeedButton
          Left = 210
          Top = 78
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
          OnClick = ClearBankClick
        end
        object Label9: TLabel
          Left = 8
          Top = 62
          Width = 28
          Height = 13
          Caption = 'Банк:'
        end
        object ceOrg: TComboEdit
          Left = 8
          Top = 20
          Width = 201
          Height = 21
          GlyphKind = gkDropDown
          NumGlyphs = 1
          TabOrder = 0
          OnButtonClick = ceOrgButtonClick
          OnDblClick = ceOrgButtonClick
        end
        object cbPlat: TCheckBox
          Left = 8
          Top = 44
          Width = 65
          Height = 17
          Caption = 'Оплаты'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = cbPlatClick
        end
        object cbPost: TCheckBox
          Left = 104
          Top = 44
          Width = 97
          Height = 17
          Caption = 'Поступления'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = cbPostClick
        end
        object RBKassa: TRadioButton
          Left = 104
          Top = 102
          Width = 113
          Height = 17
          Caption = 'Оплата по кассе'
          TabOrder = 5
          OnClick = RBKassaClick
        end
        object RBRs: TRadioButton
          Left = 8
          Top = 102
          Width = 56
          Height = 17
          Caption = 'С р/с:'
          Checked = True
          TabOrder = 4
          TabStop = True
          OnClick = RBRsClick
        end
        object LEBank: TRxLookupEdit
          Left = 8
          Top = 78
          Width = 201
          Height = 21
          DropDownCount = 10
          DropDownWidth = 1000
          LookupField = 'NAME'
          LookupSource = dsB
          DirectInput = False
          TabOrder = 3
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 337
    Width = 713
    Height = 30
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    OnDblClick = Panel2Click
    object sbEdit: TSpeedButton
      Left = 33
      Top = 2
      Width = 25
      Height = 25
      Hint = 'Редактировать'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbEditClick
    end
    object sbDel: TSpeedButton
      Left = 62
      Top = 2
      Width = 25
      Height = 25
      Hint = 'Удалить'
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
    object sbAdd: TRxSpeedButton
      Left = 4
      Top = 2
      Width = 25
      Height = 25
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800008
        88888888888777788888800000009900088887777777FF77788880FFFFF0990F
        088887888887FF78788880FF00009900008887887777FF77778880FF09999999
        908887887FFFFFFFF78880FF09999999908887887FFFFFFFF78880FF00009900
        008887887777FF77778880F0FFF0990F088887878887FF78788880FFFFF0990F
        088887888887FF78788880F0F0F0000F0888878787877778788880FFFFFFFFFF
        0888878888888888788880F000F0FFFF0888878777878888788880FFFFFFF000
        0888878888888777788880F000FFF0808888878777888787888880FFFFFFF008
        8888878888888778888880000000008888888777777777888888}
      NumGlyphs = 2
      OnClick = sbAddClick
    end
    object lblSumm: TLabel
      Left = 344
      Top = 8
      Width = 66
      Height = 13
      Caption = 'Сумма: 0 грн'
    end
    object rsbPrint: TRxSpeedButton
      Left = 253
      Top = 2
      Width = 57
      Height = 25
      Hint = 'Печать сопутствующих документов'
      DropDownMenu = PUM
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B004000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000
        000000000000000000000000000000000000000000000000000000C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6C6000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C00000000000000000000000000000000000000000
        00000000000000000000000000000000000000C6C6C6000000C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600FFFF
        00FFFF00FFFFC6C6C6C6C6C6000000000000000000C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C684848484848484
        8484C6C6C6C6C6C6000000C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000C6C6C6C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0000000C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000
        C6C6C6000000C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
        00000000000000000000000000000000000000000000000000C6C6C6000000C6
        C6C6000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C6C6000000C6C6
        C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF00
        0000000000000000000000000000FFFFFF000000000000000000000000C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF000000000000
        000000000000000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000000000000000000000
        00000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0}
    end
    object bbClear: TBitBtn
      Left = 91
      Top = 2
      Width = 81
      Height = 25
      Hint = 'Очистить все поля поиска'
      Caption = 'О&чистить'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bbClearClick
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
    end
    object bbSearch: TBitBtn
      Left = 175
      Top = 2
      Width = 75
      Height = 25
      Hint = 'Найти'
      Caption = 'По&иск'
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
    object bbOk: TBitBtn
      Left = 532
      Top = 2
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Выбрать'
      TabOrder = 2
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
      Left = 622
      Top = 2
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Закрыть'
      TabOrder = 3
      OnClick = bbCancelClick
      Kind = bkCancel
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 169
    Width = 713
    Height = 168
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    TabStop = True
    object DBGridMain: TDBGridEh
      Left = 2
      Top = 2
      Width = 709
      Height = 164
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
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
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
      OnDblClick = sbEditClick
      OnGetCellParams = DBGridMainGetCellParams
      OnMouseUp = DBGridMainMouseUp
      OnSortMarkingChanged = DBGridMainSortMarkingChanged
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DATE_'
          Footer.Value = 'Кол-во:'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Caption = 'Дата'
          Width = 59
        end
        item
          EditButtons = <>
          FieldName = 'NUMB'
          Footer.Alignment = taRightJustify
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = 'Номер'
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'CLIENT_NAME'
          Footers = <>
          Title.Caption = 'Клиент'
          Width = 196
        end
        item
          EditButtons = <>
          FieldName = 'DEBKR_NAME'
          Footer.Value = 'Суммы:'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Caption = 'Опл./Пост.'
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = 'SUMM'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = 'Сумма'
          Width = 62
        end
        item
          EditButtons = <>
          FieldName = 'NDS'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = 'НДС'
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'SUMMBEZ'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = 'Сумма без НДС'
          Width = 63
        end
        item
          EditButtons = <>
          FieldName = 'BANK_NAME'
          Footers = <>
          Title.Caption = 'Банк'
          Width = 143
        end
        item
          EditButtons = <>
          FieldName = 'ACTIVITY_NAME'
          Footers = <>
          Title.Caption = 'Тип статьи'
          Width = 113
        end
        item
          EditButtons = <>
          FieldName = 'BUDGET_ID'
          Footers = <>
          Title.Caption = '№ Статьи'
          Width = 51
        end
        item
          EditButtons = <>
          FieldName = 'BUDGET_NAME'
          Footers = <>
          Title.Caption = 'Статья'
          Width = 121
        end
        item
          EditButtons = <>
          FieldName = 'SPRING_NAME'
          Footers = <>
          Title.Caption = 'Источник'
          Width = 115
        end
        item
          EditButtons = <>
          FieldName = 'OBJECT_NAME'
          Footers = <>
          Title.Caption = 'Объект'
          Width = 118
        end
        item
          EditButtons = <>
          FieldName = 'COMMENTS'
          Footers = <>
          Title.Caption = 'Комментарий'
          Width = 318
        end>
    end
  end
  object ds: TOraDataSource
    DataSet = q
    Left = 216
    Top = 241
  end
  object QMD: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 8
    Top = 281
  end
  object qB: TOilQuery
    SQL.Strings = (
      'select * from ve_rekvizit where obl_id = :obl_id')
    OnCalcFields = qBCalcFields
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 64
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'obl_id'
        ParamType = ptInput
      end>
    object qBID: TFloatField
      FieldName = 'ID'
      Origin = 'VE_REKVIZIT.ID'
    end
    object qBINST: TFloatField
      FieldName = 'INST'
      Origin = 'VE_REKVIZIT.INST'
    end
    object qBRACH_CHET: TStringField
      FieldName = 'RACH_CHET'
      Origin = 'VE_REKVIZIT.RACH_CHET'
    end
    object qBFACE_CHET: TStringField
      FieldName = 'FACE_CHET'
      Origin = 'VE_REKVIZIT.FACE_CHET'
    end
    object qBMFO: TStringField
      FieldName = 'MFO'
      Origin = 'VE_REKVIZIT.MFO'
    end
    object qBBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Origin = 'VE_REKVIZIT.BANK_NAME'
      Size = 50
    end
    object qBORG_NAME: TStringField
      FieldName = 'ORG_NAME'
      Origin = 'VE_REKVIZIT.ORG_NAME'
      Size = 100
    end
    object qBORG_TYPE: TFloatField
      FieldName = 'ORG_TYPE'
      Origin = 'VE_REKVIZIT.ORG_TYPE'
    end
    object qBOBL_ID: TFloatField
      FieldName = 'OBL_ID'
      Origin = 'VE_REKVIZIT.OBL_ID'
    end
    object qBOBL_INST: TFloatField
      FieldName = 'OBL_INST'
      Origin = 'VE_REKVIZIT.OBL_INST'
    end
    object qBNAME: TStringField
      DisplayWidth = 200
      FieldKind = fkCalculated
      FieldName = 'NAME'
      Size = 200
      Calculated = True
    end
  end
  object dsB: TOraDataSource
    DataSet = qB
    Left = 80
    Top = 104
  end
  object PUM: TPopupMenu
    Left = 336
    Top = 288
    object MI1: TMenuItem
      Caption = 'Печать справочника'
      OnClick = MI1Click
    end
  end
  object q: TOilQuery
    LocalUpdate = True
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select'
      
        '  vb.id, vb.inst, vb.obl_name, vb.numb, vb.date_, vb.vr, vb.vd, ' +
        'vb.nob, vb.nk, vb.source,'
      
        '  vb.debkr, vb.debkr_name, sum(vb.summ) as summ, sum(vb.nds) as ' +
        'nds, sum(vb.summbez) as summbez,'
      
        '  vb.client_id, vb.client_inst, vb.client_name, vb.client_okpo, ' +
        'vb.rekvizit_id, vb.rekvizit_inst, vb.bank_name,'
      
        '  vb.mfo, vb.rach_chet, vb.budget_id, vb.budget_name, vb.activit' +
        'y_id, vb.activity_name, vb.spring_id,'
      '  vb.spring_name, vb.object_id, vb.object_name, vb.comments'
      'from'
      '  ve_bill vb'
      'group by'
      
        '  vb.id, vb.inst, vb.obl_name, vb.numb, vb.date_, vb.vr, vb.vd, ' +
        'vb.nob, vb.nk, vb.source,'
      
        '  vb.debkr, vb.debkr_name, vb.client_id, vb.client_inst, vb.clie' +
        'nt_name, vb.client_okpo, vb.rekvizit_id,'
      
        '  vb.rekvizit_inst, vb.bank_name, vb.mfo, vb.rach_chet, vb.budge' +
        't_id, vb.budget_name, vb.activity_id,'
      
        '  vb.activity_name, vb.spring_id, vb.spring_name, vb.object_id, ' +
        'vb.object_name, vb.comments'
      'order by vb.date_, vb.numb')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 200
    Top = 248
    object qID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Required = True
    end
    object qOBL_NAME: TStringField
      FieldName = 'OBL_NAME'
      Size = 100
    end
    object qNUMB: TStringField
      FieldName = 'NUMB'
      Size = 100
    end
    object qDATE_: TDateTimeField
      FieldName = 'DATE_'
    end
    object qVR: TFloatField
      FieldName = 'VR'
    end
    object qVD: TFloatField
      FieldName = 'VD'
    end
    object qNOB: TFloatField
      FieldName = 'NOB'
    end
    object qNK: TFloatField
      FieldName = 'NK'
    end
    object qSOURCE: TStringField
      FieldName = 'SOURCE'
      Required = True
      Size = 1
    end
    object qDEBKR: TFloatField
      FieldName = 'DEBKR'
    end
    object qDEBKR_NAME: TStringField
      FieldName = 'DEBKR_NAME'
      Size = 11
    end
    object qSUMM: TFloatField
      FieldName = 'SUMM'
    end
    object qNDS: TFloatField
      FieldName = 'NDS'
    end
    object qSUMMBEZ: TFloatField
      FieldName = 'SUMMBEZ'
    end
    object qCLIENT_ID: TFloatField
      FieldName = 'CLIENT_ID'
    end
    object qCLIENT_INST: TFloatField
      FieldName = 'CLIENT_INST'
    end
    object qCLIENT_NAME: TStringField
      FieldName = 'CLIENT_NAME'
      Size = 100
    end
    object qCLIENT_OKPO: TStringField
      FieldName = 'CLIENT_OKPO'
    end
    object qREKVIZIT_ID: TFloatField
      FieldName = 'REKVIZIT_ID'
    end
    object qREKVIZIT_INST: TFloatField
      FieldName = 'REKVIZIT_INST'
    end
    object qBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Size = 50
    end
    object qMFO: TStringField
      FieldName = 'MFO'
    end
    object qRACH_CHET: TStringField
      FieldName = 'RACH_CHET'
    end
    object qBUDGET_ID: TFloatField
      FieldName = 'BUDGET_ID'
    end
    object qBUDGET_NAME: TStringField
      FieldName = 'BUDGET_NAME'
      Size = 50
    end
    object qACTIVITY_ID: TFloatField
      FieldName = 'ACTIVITY_ID'
    end
    object qACTIVITY_NAME: TStringField
      FieldName = 'ACTIVITY_NAME'
      Size = 50
    end
    object qSPRING_ID: TFloatField
      FieldName = 'SPRING_ID'
    end
    object qSPRING_NAME: TStringField
      FieldName = 'SPRING_NAME'
      Size = 100
    end
    object qOBJECT_ID: TFloatField
      FieldName = 'OBJECT_ID'
    end
    object qOBJECT_NAME: TStringField
      FieldName = 'OBJECT_NAME'
      Size = 255
    end
    object qCOMMENTS: TStringField
      FieldName = 'COMMENTS'
      Size = 200
    end
  end
end
