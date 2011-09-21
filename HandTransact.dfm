inherited frmHandTrans: TfrmHandTrans
  Left = 253
  Top = 100
  Width = 285
  Height = 427
  AutoSize = True
  Caption = '»ÒÍÛÒÒÚ‚ÂÌÌ‡ˇ Ú‡ÌÁ‡ÍˆËˇ'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlWhere: TPanel
    Left = 0
    Top = 179
    Width = 277
    Height = 21
    Align = alTop
    AutoSize = True
    TabOrder = 4
    object lComboEdit3: TLabel
      Left = 6
      Top = 2
      Width = 18
      Height = 13
      Caption = '√‰Â'
    end
    object ComboEdit3: TComboEdit
      Left = 45
      Top = 1
      Width = 225
      Height = 19
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ComboEdit3ButtonClick
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 364
    Width = 277
    Height = 29
    Align = alTop
    TabOrder = 8
    object btnOK: TSpeedButton
      Left = 114
      Top = 3
      Width = 78
      Height = 24
      Caption = 'OK'
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
      OnClick = btnOKClick
    end
    object SpeedButton2: TSpeedButton
      Left = 196
      Top = 4
      Width = 78
      Height = 23
      Caption = '«‡Í˚Ú¸'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
      OnClick = SpeedButton2Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 277
    Height = 113
    Align = alTop
    AutoSize = True
    TabOrder = 0
    object Label6: TLabel
      Left = 6
      Top = 91
      Width = 43
      Height = 13
      Caption = '›ÏËÚÂÌÚ'
    end
    object Label5: TLabel
      Left = 6
      Top = 68
      Width = 38
      Height = 13
      Caption = 'π ƒÓÍ.'
    end
    object Label3: TLabel
      Left = 145
      Top = 68
      Width = 50
      Height = 13
      Caption = 'ƒ‡Ú‡ ‰ÓÍ.'
    end
    object Label13: TLabel
      Left = 5
      Top = 47
      Width = 33
      Height = 13
      Caption = 'ÀËÚ˚'
    end
    object Label17: TLabel
      Left = 126
      Top = 46
      Width = 26
      Height = 13
      Caption = '÷ÂÌ‡'
    end
    object Label12: TLabel
      Left = 143
      Top = 27
      Width = 16
      Height = 13
      Caption = 'Õœ'
    end
    object Label2: TLabel
      Left = 6
      Top = 27
      Width = 45
      Height = 13
      Caption = 'π Í‡Ú˚'
    end
    object Label23: TLabel
      Left = 7
      Top = 5
      Width = 29
      Height = 13
      Caption = 'ƒ‡Ú‡ '
    end
    object Label22: TLabel
      Left = 146
      Top = 6
      Width = 33
      Height = 13
      Caption = '¬ÂÏˇ'
    end
    object edtDocNum: TEdit
      Left = 48
      Top = 66
      Width = 93
      Height = 21
      TabOrder = 6
      OnKeyPress = edtDocNumKeyPress
    end
    object Edit1: TEdit
      Left = 50
      Top = 91
      Width = 220
      Height = 21
      Color = clSilver
      ReadOnly = True
      TabOrder = 8
    end
    object edtDocDate: TDateEdit
      Left = 199
      Top = 66
      Width = 71
      Height = 20
      NumGlyphs = 2
      TabOrder = 7
    end
    object edtPrice: TCurrencyEdit
      Left = 164
      Top = 45
      Width = 105
      Height = 19
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'#39
      TabOrder = 5
    end
    object edtLitre: TCurrencyEdit
      Left = 48
      Top = 45
      Width = 67
      Height = 19
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'#39
      TabOrder = 4
    end
    object dbceNP: TComboEdit
      Left = 162
      Top = 25
      Width = 93
      Height = 18
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = dbceNPButtonClick
      OnChange = dbceNPChange
    end
    object edtCardNum: TCurrencyEdit
      Left = 56
      Top = 25
      Width = 76
      Height = 18
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '#########'
      FormatOnEditing = True
      TabOrder = 2
      OnChange = edtCardNumChange
      OnKeyPress = edtCardNumKeyPress
    end
    object DateTimePicker1: TDateEdit
      Left = 49
      Top = 1
      Width = 89
      Height = 22
      DefaultToday = True
      NumGlyphs = 2
      TabOrder = 0
      OnChange = DateTimePicker1Change
    end
    object DateTimePicker2: TDateTimePicker
      Left = 192
      Top = 2
      Width = 69
      Height = 21
      CalAlignment = dtaLeft
      Date = 37859.6111476968
      Time = 37859.6111476968
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkTime
      ParseInput = False
      TabOrder = 1
      OnChange = DateTimePicker2Change
    end
  end
  object pnlAutoDirver: TPanel
    Left = 0
    Top = 283
    Width = 277
    Height = 58
    Align = alTop
    AutoSize = True
    TabOrder = 7
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 233
      Height = 13
      Caption = 'ƒÎˇ Í‡ÚÓ˜ÂÍ Ì‡ ÒÓ·ÒÚ‚ÂÌÌ˚È ‡‚ÚÓÚ‡ÌÒÔÓÚ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 2
      Top = 19
      Width = 76
      Height = 13
      Caption = 'π ¿‚ÚÓÏÓ·ËÎˇ'
    end
    object sbDelAuto: TSpeedButton
      Left = 249
      Top = 17
      Width = 20
      Height = 19
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
    end
    object sbDelDriver: TSpeedButton
      Left = 249
      Top = 38
      Width = 20
      Height = 19
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
    end
    object Label8: TLabel
      Left = 2
      Top = 44
      Width = 78
      Height = 13
      Caption = '‘»Œ ¬Ó‰ËÚÂÎˇ'
    end
    object dbceAutoNumb: TComboEdit
      Left = 87
      Top = 17
      Width = 161
      Height = 19
      AutoSelect = False
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = dbceAutoNumbButtonClick
    end
    object dbceDriver: TComboEdit
      Left = 87
      Top = 39
      Width = 161
      Height = 18
      AutoSelect = False
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = dbceDriverButtonClick
    end
  end
  object pnlCardPrice: TPanel
    Left = 0
    Top = 136
    Width = 277
    Height = 21
    Align = alTop
    AutoSize = True
    TabOrder = 2
    object ledtCardPrice: TLabel
      Left = 5
      Top = 3
      Width = 75
      Height = 13
      Caption = '÷ÂÌ‡ Í‡ÚÓ˜ÍË'
    end
    object edtCardPrice: TCurrencyEdit
      Left = 93
      Top = 1
      Width = 57
      Height = 19
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'#39
      TabOrder = 0
    end
  end
  object pnlDov: TPanel
    Left = 0
    Top = 220
    Width = 277
    Height = 63
    Align = alTop
    AutoSize = True
    TabOrder = 6
    object Label9: TLabel
      Left = 3
      Top = 1
      Width = 77
      Height = 13
      Caption = 'ƒÓ‚ÂÂÌÌÓÒÚ¸ '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 3
      Top = 19
      Width = 31
      Height = 13
      Caption = '—ÂËˇ'
    end
    object Label4: TLabel
      Left = 82
      Top = 20
      Width = 11
      Height = 13
      Caption = 'π'
    end
    object Label11: TLabel
      Left = 159
      Top = 20
      Width = 11
      Height = 13
      Caption = 'ÓÚ'
    end
    object Label19: TLabel
      Left = 3
      Top = 42
      Width = 32
      Height = 13
      Caption = '◊ÂÂÁ'
    end
    object edtDovSer: TEdit
      Left = 38
      Top = 16
      Width = 41
      Height = 21
      TabOrder = 0
    end
    object edtDovNum: TEdit
      Left = 97
      Top = 17
      Width = 57
      Height = 21
      TabOrder = 1
    end
    object edtDovDate: TDateEdit
      Left = 176
      Top = 17
      Width = 94
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    object edtDovWho: TEdit
      Left = 44
      Top = 41
      Width = 225
      Height = 21
      TabOrder = 3
    end
  end
  object pnlShet: TPanel
    Left = 0
    Top = 113
    Width = 277
    Height = 23
    Align = alTop
    AutoSize = True
    TabOrder = 1
    object lShet: TLabel
      Left = 5
      Top = 4
      Width = 40
      Height = 13
      Caption = '—˜ÂÚ π '
    end
    object lShetDate: TLabel
      Left = 144
      Top = 4
      Width = 43
      Height = 13
      Caption = 'ƒ‡Ú‡ Ò˜.'
    end
    object edtShet: TEdit
      Left = 46
      Top = 1
      Width = 93
      Height = 21
      TabOrder = 0
    end
    object edtShetDate: TDateEdit
      Left = 195
      Top = 3
      Width = 74
      Height = 19
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 341
    Width = 277
    Height = 23
    Align = alTop
    AutoSize = True
    TabOrder = 9
    Visible = False
    object lCouse: TLabel
      Left = 1
      Top = 3
      Width = 43
      Height = 13
      Caption = 'œË˜ËÌ‡'
    end
    object cmbCouse: TComboBox
      Left = 47
      Top = 1
      Width = 222
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'ŒÚÎÓÊÂÌÌÓÂ ÔÓÔÓÎÌ.Ì‡ ¿«—'
        '¬ÓÁ‚‡Ú ÓÚÎ.ÔÓÔÓÎÌ.Ì‡ ¿«—'
        'œÓÔÓÎÌÂÌËÂ Í‡Ú˚ ‚ Œ÷'
        '¬ÓÁ‚‡Ú Ò Í‡Ú˚ ‚ Œ÷'
        '—ÔËÒ‡ÌËÂ Ò Í‡Ú˚ Ì‡ ¿«—'
        '¬ÓÁ‚‡Ú Ì‡ Í‡ÚÛ Ì‡ ¿«—'
        '¬ÓÁ‚‡Ú Ì‡ Ò˜ÂÚ Ì‡ ¿«—'
        'ÀËÏËÚÌ‡ˇ ÒıÂÏ‡')
    end
  end
  object pnlClient: TPanel
    Left = 0
    Top = 157
    Width = 277
    Height = 22
    Align = alTop
    AutoSize = True
    TabOrder = 3
    object lComboEdit1: TLabel
      Left = 5
      Top = 4
      Width = 36
      Height = 13
      Caption = ' ÎËÂÌÚ'
    end
    object comboEdit1: TComboEdit
      Left = 45
      Top = 1
      Width = 225
      Height = 20
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = comboEdit1ButtonClick
    end
  end
  object pnlTo: TPanel
    Left = 0
    Top = 200
    Width = 277
    Height = 20
    Align = alTop
    TabOrder = 5
    object lComboEdit4: TLabel
      Left = 4
      Top = 2
      Width = 15
      Height = 13
      Caption = '“Œ'
    end
    object ComboEdit4: TComboEdit
      Left = 45
      Top = 1
      Width = 225
      Height = 18
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ComboEdit4ButtonClick
    end
  end
  object stProcCardTransaction: TOraStoredProc
    StoredProcName = 'OIL.INSORUPDCARD_TRANSACTION'
    Session = frmStart.OraSession1
    SQL.Strings = (
      'begin'
      
        '  :RESULT := OIL.INSORUPDCARD_TRANSACTION(:OIL_ID#, :OIL_INST#, ' +
        ':DATE_#, :TIME_#, :DOC_NUMBER#, :DOC_DATE#, :CHEK_NUMBER#, :CHEK' +
        '_DATE#, :TO_ID#, :TO_INST#, :PRICE_NDS#, :ID_—’≈Ã€_Œ¡—À#, :NP_TY' +
        'PE#, :ID_ Œÿ_◊≈Ã#, :COUNT_LITR#, :—”ÃÃ¿_◊≈Ã#, :›Ã»“≈Õ“_√ƒ≈#, :OP' +
        'ER_TYPE#, :GR_CARD_NUM#, :œ–»◊»Õ¿_»«Ã≈Õ≈Õ»ﬂ#, :ID_“≈–Ã»Õ¿À¿#, :I' +
        'D_“Œ#, :ÕŒÃ≈–_“≈–Ã»Õ¿À¿#, :PRICE_DOG_NDS#, :ID_ ŒÃÃ≈Õ“¿–»ﬂ#, :‘À' +
        '¿√_ Œ––≈ “»–Œ¬ »#, :‘À¿√_Œ“ÀŒ∆_»«Ã#, :‘À¿√_› ¬¿–»Õ√¿#, :¿¬“Œœ≈–≈' +
        '—◊≈“#, :Œ“ ”ƒ¿_»Õ ¿——¿÷»ﬂ#, :ID_œ≈–—ŒÕ¿À¿#, :√–_ÕŒÃ≈–_—À”∆_ ¿–“€' +
        '#, :‘À¿√_¬Œ«¬–¿“¿#, :CARD_PRICE#, :ID#, :DOV_SER#, :DOV_NUM#, :D' +
        'OV_DATE#, :DOV_WHO#, :FIRST_USE#, :CLEAN_Z_NUM#, :AUTO_ID#, :AUT' +
        'O_INST#, :EMPLOY_ID#, :EMPLOY_INST#, :NN_ID#, :NN_INST#, :TRANS_' +
        'TYPE#);'
      'end;')
    Left = 208
    Top = 254
    ParamData = <
      item
        DataType = ftString
        Name = 'RESULT'
        ParamType = ptOutput
        Value = '-1#OIL :?? ??????? ???????????? ????????#'
      end
      item
        DataType = ftFloat
        Name = 'OIL_ID#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'OIL_INST#'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATE_#'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'TIME_#'
        ParamType = ptInput
        Size = 6
      end
      item
        DataType = ftString
        Name = 'DOC_NUMBER#'
        ParamType = ptInput
        Value = ''
        Size = 10
      end
      item
        DataType = ftDateTime
        Name = 'DOC_DATE#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CHEK_NUMBER#'
        ParamType = ptInput
        Value = ''
        Size = 10
      end
      item
        DataType = ftDateTime
        Name = 'CHEK_DATE#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TO_ID#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TO_INST#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRICE_NDS#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_—’≈Ã€_Œ¡—À#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NP_TYPE#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_ Œÿ_◊≈Ã#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'COUNT_LITR#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '—”ÃÃ¿_◊≈Ã#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '›Ã»“≈Õ“_√ƒ≈#'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OPER_TYPE#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'GR_CARD_NUM#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'œ–»◊»Õ¿_»«Ã≈Õ≈Õ»ﬂ#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_“≈–Ã»Õ¿À¿#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_“Œ#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ÕŒÃ≈–_“≈–Ã»Õ¿À¿#'
        ParamType = ptInput
        Value = ''
        Size = 5
      end
      item
        DataType = ftFloat
        Name = 'PRICE_DOG_NDS#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_ ŒÃÃ≈Õ“¿–»ﬂ#'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '‘À¿√_ Œ––≈ “»–Œ¬ »#'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '‘À¿√_Œ“ÀŒ∆_»«Ã#'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '‘À¿√_› ¬¿–»Õ√¿#'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '¿¬“Œœ≈–≈—◊≈“#'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Œ“ ”ƒ¿_»Õ ¿——¿÷»ﬂ#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID_œ≈–—ŒÕ¿À¿#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '√–_ÕŒÃ≈–_—À”∆_ ¿–“€#'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '‘À¿√_¬Œ«¬–¿“¿#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CARD_PRICE#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOV_SER#'
        ParamType = ptInput
        Value = ''
        Size = 10
      end
      item
        DataType = ftString
        Name = 'DOV_NUM#'
        ParamType = ptInput
        Value = ''
        Size = 15
      end
      item
        DataType = ftDateTime
        Name = 'DOV_DATE#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOV_WHO#'
        ParamType = ptInput
        Value = ''
        Size = 35
      end
      item
        DataType = ftString
        Name = 'FIRST_USE#'
        ParamType = ptInput
        Value = ''
        Size = 1
      end
      item
        DataType = ftString
        Name = 'CLEAN_Z_NUM#'
        ParamType = ptInput
        Value = ''
        Size = 10
      end
      item
        DataType = ftFloat
        Name = 'AUTO_ID#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'AUTO_INST#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'EMPLOY_ID#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'EMPLOY_INST#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NN_ID#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NN_INST#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TRANS_TYPE#'
        ParamType = ptInput
      end>
  end
  object qrySeq: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select S_CARD_TRANSACTION.NEXTVAL from dual')
    Left = 180
    Top = 222
    object qrySeqNEXTVAL: TFloatField
      FieldName = 'NEXTVAL'
    end
  end
  object qryCardID: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select id,inst,card_id from v_org t where id=:card_id')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 152
    Top = 222
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'card_id'
        Value = Null
      end>
    object qryCardIDCARD_ID: TFloatField
      FieldName = 'CARD_ID'
    end
    object qryCardIDID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qryCardIDINST: TFloatField
      FieldName = 'INST'
      Required = True
    end
  end
  object qryEmitent: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select id,inst,card_id,name'
      'from v_org '
      'where '
      'card_id=:card_id'
      '')
    Left = 148
    Top = 254
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'card_id'
      end>
    object qryEmitentCARD_ID: TFloatField
      FieldName = 'CARD_ID'
    end
    object qryEmitentNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object qryEmitentID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qryEmitentINST: TFloatField
      FieldName = 'INST'
      Required = True
    end
  end
  object stProcCardTransit: TOraStoredProc
    StoredProcName = 'OIL.INSORUPDCARD_TRANSIT'
    Session = frmStart.OraSession1
    SQL.Strings = (
      'begin'
      
        '  :RESULT := OIL.INSORUPDCARD_TRANSIT(:OIL_ID#, :OIL_INST#, :OPE' +
        'R_DATE#, :DOC_NUMBER#, :DOC_DATE#, :NP_TYPE#, :LITR#, :TERM_PRIC' +
        'E#, :TERM_EMITENT#, :CARD_NUMBER#, :AZS_ID#, :SERV_CARD_NUMBER#,' +
        ' :ID#, :NN_ID#, :NN_INST#, :TRANS_TYPE#);'
      'end;')
    Left = 180
    Top = 254
    ParamData = <
      item
        DataType = ftString
        Name = 'RESULT'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'OIL_ID#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'OIL_INST#'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'OPER_DATE#'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOC_NUMBER#'
        ParamType = ptInput
        Value = ''
        Size = 10
      end
      item
        DataType = ftDateTime
        Name = 'DOC_DATE#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NP_TYPE#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'LITR#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TERM_PRICE#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TERM_EMITENT#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CARD_NUMBER#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'AZS_ID#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SERV_CARD_NUMBER#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ID#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NN_ID#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NN_INST#'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TRANS_TYPE#'
        ParamType = ptInput
      end>
  end
  object qrySeqTrans: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select S_CARD_TRANSIT.NEXTVAL from dual')
    Left = 208
    Top = 222
    object qrySeqTransNEXTVAL: TFloatField
      FieldName = 'NEXTVAL'
    end
  end
end
