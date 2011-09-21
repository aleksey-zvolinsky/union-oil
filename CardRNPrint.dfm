inherited CardRNPrintForm: TCardRNPrintForm
  Left = 389
  Top = 238
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 271
  ClientWidth = 642
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 32
    Top = 160
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object pButtons: TPanel
    Left = 0
    Top = 239
    Width = 642
    Height = 32
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      642
      32)
    object lHide: TLabel
      Left = 80
      Top = 8
      Width = 3
      Height = 13
      Enabled = False
      Visible = False
    end
    object lDocType: TLabel
      Left = 12
      Top = 8
      Width = 46
      Height = 13
      Caption = 'lDocType'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lLastDog: TLabel
      Left = 6
      Top = 8
      Width = 42
      Height = 13
      Caption = 'lLastDog'
      Visible = False
    end
    object bbCancel: TBitBtn
      Left = 558
      Top = 3
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbPrint: TBitBtn
      Left = 474
      Top = 3
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#1055#1077#1095#1072#1090#1100
      TabOrder = 1
      OnClick = bbPrintClick
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
  end
  object nbForms: TNotebook
    Left = 0
    Top = 0
    Width = 642
    Height = 239
    Align = alClient
    PageIndex = 3
    TabOrder = 1
    object TPage
      Left = 0
      Top = 0
      Caption = 'RnForm'
      object Label8: TLabel
        Left = 6
        Top = 44
        Width = 52
        Height = 13
        Caption = #1055#1077#1088#1080#1086#1076' '#1086#1090
      end
      object Label9: TLabel
        Left = 202
        Top = 44
        Width = 12
        Height = 13
        Caption = #1076#1086
      end
      object lRnOrg: TLabel
        Left = 6
        Top = 78
        Width = 70
        Height = 13
        Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103':'
      end
      object sbRnAuto: TSpeedButton
        Left = 172
        Top = 5
        Width = 24
        Height = 21
        Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1085#1086#1084#1077#1088
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Glyph.Data = {
          42010000424D4201000000000000760000002800000015000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          777777777000777777777777777777777000788778878877788778877000F087
          F0800087F08780087000F087F080FF08F08F0FF08000F087F0808F08F08F08F0
          8000F08870808F08F08F08F08000F00000808F08F08F08F08000F07FF0808F0F
          F08808F08000F087F08000700000F0087000F087F080087FFFFF7FF77000F087
          F08080877777777770007F087080808777777777700077F0008F0F7777777777
          7000777FFF77F777777777777000777777777777777777777000777777777777
          777777777000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbRnAutoClick
      end
      object Label6: TLabel
        Left = 6
        Top = 8
        Width = 90
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1088#1072#1089#1093#1086#1076#1085#1086#1081
      end
      object lDocDate: TLabel
        Left = 212
        Top = 8
        Width = 12
        Height = 13
        Caption = #1085#1072
      end
      object deBeginDate: TDateEdit
        Left = 83
        Top = 41
        Width = 102
        Height = 21
        DefaultToday = True
        DirectInput = False
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 0
        Text = '16.05.2008'
        OnAcceptDate = deBeginDateAcceptDate
      end
      object deEndDate: TDateEdit
        Left = 230
        Top = 41
        Width = 97
        Height = 21
        DefaultToday = True
        DirectInput = False
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 1
        Text = '16.05.2008'
        OnAcceptDate = deEndDateAcceptDate
      end
      object ceRnToName: TComboEdit
        Left = 83
        Top = 75
        Width = 245
        Height = 21
        DirectInput = False
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333330333333333333330C033333333333330C03333333333330CCC033
          3333333330CCC033333333330CCCCC03333333330CCCCC0333333330CCCCCCC0
          33333330000C000033333333330C033333333333330C033333333333330C0333
          33333333330C033333333333330C033333333333330003333333}
        NumGlyphs = 1
        TabOrder = 2
        Text = 'ceRnToName'
        OnButtonClick = ceRnToNameButtonClick
        OnDblClick = ceRnToNameButtonClick
      end
      object RnNumber: TEdit
        Left = 104
        Top = 5
        Width = 68
        Height = 21
        TabOrder = 3
        Text = 'RnNumber'
      end
      object deCurDate: TDateEdit
        Left = 230
        Top = 6
        Width = 97
        Height = 21
        DefaultToday = True
        DirectInput = False
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 4
        Text = '16.05.2008'
      end
      object cbWithPart: TCheckBox
        Left = 83
        Top = 102
        Width = 97
        Height = 17
        Caption = #1057' '#1087#1072#1088#1090#1080#1103#1084#1080
        TabOrder = 5
        Visible = False
      end
      object cbWithSign: TCheckBox
        Left = 172
        Top = 102
        Width = 173
        Height = 17
        Caption = #1055#1086#1076#1087#1080#1089#1080' '#1085#1072' '#1082#1072#1078#1076#1086#1081' '#1089#1090#1088#1072#1085#1080#1094#1077
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 6
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'ReestrForm'
      object Label1: TLabel
        Left = 6
        Top = 19
        Width = 52
        Height = 13
        Caption = #1055#1077#1088#1080#1086#1076' '#1086#1090
      end
      object Label2: TLabel
        Left = 205
        Top = 20
        Width = 12
        Height = 13
        Caption = #1076#1086
      end
      object lReestrOrg: TLabel
        Left = 6
        Top = 67
        Width = 70
        Height = 13
        Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103':'
      end
      object Label4: TLabel
        Left = 110
        Top = 40
        Width = 149
        Height = 13
        Caption = '('#1087#1077#1088#1080#1086#1076' '#1087#1086' '#1076#1072#1090#1072#1084' '#1085#1072#1082#1083#1072#1076#1085#1099#1093')'
      end
      object DateReestr1: TDateEdit
        Left = 84
        Top = 16
        Width = 103
        Height = 21
        DefaultToday = True
        DirectInput = False
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 0
        Text = '18.12.2001'
      end
      object DateReestr2: TDateEdit
        Left = 223
        Top = 17
        Width = 98
        Height = 21
        DefaultToday = True
        DirectInput = False
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 1
        Text = '18.12.2001'
      end
      object ceReestrToName: TComboEdit
        Left = 84
        Top = 64
        Width = 240
        Height = 21
        DirectInput = False
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333330333333333333330C033333333333330C03333333333330CCC033
          3333333330CCC033333333330CCCCC03333333330CCCCC0333333330CCCCCCC0
          33333330000C000033333333330C033333333333330C033333333333330C0333
          33333333330C033333333333330C033333333333330003333333}
        NumGlyphs = 1
        TabOrder = 2
        Text = 'ceReestrToName'
        OnButtonClick = ceReestrToNameButtonClick
        OnDblClick = ceReestrToNameButtonClick
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'CleanCardRn'
      object gb: TGroupBox
        Left = 2
        Top = 53
        Width = 325
        Height = 109
        Caption = #1044#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100
        TabOrder = 0
        object Label10: TLabel
          Left = 5
          Top = 19
          Width = 34
          Height = 13
          Caption = #1057#1077#1088#1080#1103':'
        end
        object Label11: TLabel
          Left = 192
          Top = 19
          Width = 14
          Height = 13
          Caption = #8470':'
        end
        object Label12: TLabel
          Left = 23
          Top = 47
          Width = 14
          Height = 13
          Caption = #1086#1090':'
        end
        object Label13: TLabel
          Left = 144
          Top = 47
          Width = 61
          Height = 13
          Caption = #1063#1077#1088#1077#1079' '#1082#1086#1075#1086':'
        end
        object Label14: TLabel
          Left = 57
          Top = 84
          Width = 78
          Height = 13
          Caption = #1062#1077#1085#1072' '#1082#1072#1088#1090#1086#1095#1082#1080':'
        end
        object Bevel1: TBevel
          Left = 1
          Top = 74
          Width = 325
          Height = 2
        end
        object edSer: TEdit
          Left = 42
          Top = 16
          Width = 91
          Height = 21
          MaxLength = 10
          TabOrder = 0
          Text = 'edSer'
        end
        object edNum: TEdit
          Left = 209
          Top = 16
          Width = 110
          Height = 21
          MaxLength = 15
          TabOrder = 1
          Text = 'edNum'
        end
        object edFromWho: TEdit
          Left = 209
          Top = 42
          Width = 110
          Height = 21
          MaxLength = 30
          TabOrder = 2
          Text = 'edFromWho'
        end
        object ceCardPrice: TRxCalcEdit
          Left = 140
          Top = 81
          Width = 110
          Height = 21
          AutoSize = False
          NumGlyphs = 2
          TabOrder = 3
        end
        object deDate: TDateEdit
          Left = 41
          Top = 44
          Width = 95
          Height = 21
          DefaultToday = True
          DirectInput = False
          NumGlyphs = 2
          YearDigits = dyFour
          TabOrder = 4
          Text = '28.11.2001'
        end
      end
      object gbRnProps: TGroupBox
        Left = 2
        Top = 3
        Width = 325
        Height = 50
        Caption = #1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
        TabOrder = 1
        object Label5: TLabel
          Left = 23
          Top = 22
          Width = 11
          Height = 13
          Caption = #8470
        end
        object Label7: TLabel
          Left = 156
          Top = 22
          Width = 26
          Height = 13
          Caption = #1044#1072#1090#1072
        end
        object sbCBlankAuto: TSpeedButton
          Left = 107
          Top = 19
          Width = 24
          Height = 21
          Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1085#1086#1084#1077#1088
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Glyph.Data = {
            42010000424D4201000000000000760000002800000015000000110000000100
            040000000000CC00000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            777777777000777777777777777777777000788778878877788778877000F087
            F0800087F08780087000F087F080FF08F08F0FF08000F087F0808F08F08F08F0
            8000F08870808F08F08F08F08000F00000808F08F08F08F08000F07FF0808F0F
            F08808F08000F087F08000700000F0087000F087F080087FFFFF7FF77000F087
            F08080877777777770007F087080808777777777700077F0008F0F7777777777
            7000777FFF77F777777777777000777777777777777777777000777777777777
            777777777000}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbCBlankAutoClick
        end
        object deRnDate: TDateEdit
          Left = 188
          Top = 17
          Width = 132
          Height = 21
          DirectInput = False
          NumGlyphs = 2
          TabOrder = 0
        end
        object edCBlank: TEdit
          Left = 39
          Top = 19
          Width = 68
          Height = 21
          TabOrder = 1
          Text = 'edCBlank'
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'DocActive'
      object l2: TLabel
        Left = 220
        Top = 8
        Width = 12
        Height = 13
        Caption = #1085#1072
      end
      object l1: TLabel
        Left = 6
        Top = 8
        Width = 83
        Height = 13
        Caption = #1044#1086#1075#1086#1074#1086#1088'-'#1079#1072#1103#1074#1082#1072
      end
      object l3: TLabel
        Left = 6
        Top = 38
        Width = 52
        Height = 13
        Caption = #1055#1077#1088#1080#1086#1076' '#1086#1090
      end
      object l4: TLabel
        Left = 220
        Top = 38
        Width = 12
        Height = 13
        Caption = #1076#1086
      end
      object l5: TLabel
        Left = 6
        Top = 68
        Width = 70
        Height = 13
        Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103':'
      end
      object sbReqOrgClear: TSpeedButton
        Left = 331
        Top = 64
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
        OnClick = sbReqOrgClearClick
      end
      object sbReqNAuto: TSpeedButton
        Left = 188
        Top = 5
        Width = 24
        Height = 21
        Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1085#1086#1084#1077#1088
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Glyph.Data = {
          42010000424D4201000000000000760000002800000015000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          777777777000777777777777777777777000788778878877788778877000F087
          F0800087F08780087000F087F080FF08F08F0FF08000F087F0808F08F08F08F0
          8000F08870808F08F08F08F08000F00000808F08F08F08F08000F07FF0808F0F
          F08808F08000F087F08000700000F0087000F087F080087FFFFF7FF77000F087
          F08080877777777770007F087080808777777777700077F0008F0F7777777777
          7000777FFF77F777777777777000777777777777777777777000777777777777
          777777777000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbReqNAutoClick
      end
      object sbReqDogClear: TSpeedButton
        Left = 331
        Top = 4
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
        OnClick = sbReqDogClearClick
      end
      object deReqDogDate: TDateEdit
        Left = 240
        Top = 5
        Width = 90
        Height = 21
        DirectInput = False
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 0
      end
      object ceReqDog: TComboEdit
        Left = 98
        Top = 5
        Width = 90
        Height = 21
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333330333333333333330C033333333333330C03333333333330CCC033
          3333333330CCC033333333330CCCCC03333333330CCCCC0333333330CCCCCCC0
          33333330000C000033333333330C033333333333330C033333333333330C0333
          33333333330C033333333333330C033333333333330003333333}
        NumGlyphs = 1
        TabOrder = 1
        OnButtonClick = ceReqDogButtonClick
        OnDblClick = ceReqDogButtonClick
      end
      object deReqDBegin: TDateEdit
        Left = 98
        Top = 35
        Width = 90
        Height = 21
        DirectInput = False
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 2
      end
      object deReqDEnd: TDateEdit
        Left = 240
        Top = 32
        Width = 90
        Height = 21
        DirectInput = False
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 3
      end
      object ceReqOrg: TComboEdit
        Left = 98
        Top = 65
        Width = 232
        Height = 21
        DirectInput = False
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333330333333333333330C033333333333330C03333333333330CCC033
          3333333330CCC033333333330CCCCC03333333330CCCCC0333333330CCCCCCC0
          33333330000C000033333333330C033333333333330C033333333333330C0333
          33333333330C033333333333330C033333333333330003333333}
        NumGlyphs = 1
        TabOrder = 4
        OnButtonClick = ceReqOrgButtonClick
        OnDblClick = ceReqOrgButtonClick
      end
    end
  end
  object qReport: TOilQuery
    SQL.Strings = (
      'select *'
      '  from (select /*+ORDERED USE_NL(d, FrO, UpFrO, ToO)*/'
      '         d.*,'
      '         FrO.Name as From_Name,'
      '         FrO.Addr as From_Addr,'
      '         FrO.Svid_Num as From_Svid_Num,'
      '         FrO.Nal_Num as From_Nal_Num,'
      '         FrO.Boss as From_Boss,'
      '         FrO.Id_Num as From_OKPO,'
      '         FrO.Phone as From_Phone,'
      '         FrO.Rach_Chet as From_Rach_Chet,'
      '         FrO.bank_name as From_Bank_Name,'
      '         FrO.MFO as From_MFO,'
      '         ToO.Name as To_Name,'
      '         ToO.Addr as To_Addr,'
      '         ToO.Svid_Num as To_Svid_Num,'
      '         ToO.Nal_Num as To_Nal_Num,'
      '         ToO.Boss as To_Boss,'
      '         ToO.Id_Num as To_OKPO,'
      '         ToO.Phone as To_Phone,'
      '         ToO.Rach_Chet as To_Rach_Chet,'
      '         ToO.bank_name as To_Bank_Name,'
      '         ToO.MFO as To_MFO,'
      '         ToO.Face as To_Face,'
      '         ToO.Passport_ser as Passp_Ser,'
      '         ToO.Passport_num as Passp_Num,'
      '         ToO.Passport_whom as Passp_whom,'
      '         ToO.Passport_when as Passp_when,'
      '         UpFrO.Name as Up_From_Name,'
      '         UpFrO.Addr as Up_From_Addr,'
      '         UpFrO.Phone as Up_From_Phone,'
      '         UpFrO.Svid_Num as Up_From_Svid_Num,'
      '         UpFrO.Nal_Num as Up_From_Nal_Num'
      
        '          from Oil_Dog d, V_Oil_Org FrO, V_Oil_Org ToO, v_Org Up' +
        'FrO'
      '         where d.State = '#39'Y'#39
      '           and d.Dog_Date = (select min(Dog_Date)'
      '                               from Oil_Dog'
      '                              where state = '#39'Y'#39
      '                                and To_ = :OrgId'
      '                                and To_inst = :OrgInst'
      '                                and Dog_type = '#39'K'#39
      '                                and nvl(Sub_Type, 0) <> 101)'
      '           and d.To_ = :OrgId'
      '           and d.To_inst = :OrgInst'
      '           and d.Dog_type = '#39'K'#39
      '           and nvl(d.Sub_type, 0) <> 101'
      '           and d.From_ = FrO.Id'
      '           and d.From_Inst = FrO.Inst'
      '           and d.To_ = ToO.Id'
      '           and d.To_Inst = ToO.Inst'
      '           and FrO.Par = UpFrO.Id(+)'
      '           and FrO.Par_Inst = UpFrO.Inst(+)'
      '         order by FrO.def desc, ToO.def desc)'
      ' where rownum = 1')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 307
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end>
  end
  object qRn: TOilQuery
    SQL.Strings = (
      'select /*+ORDERED*/'
      '       np.FullName as NpName,'
      '       Filial.name as Filial_old,'
      '       ParAZS.name as Filial,'
      '       AZS.name as AZS,'
      '       ct.Card_Number as CardNum,'
      '       ct.Date_,'
      '       ct.Time_,'
      '       ct.'#1085#1086#1084#1077#1088'_'#1090#1077#1088#1084#1080#1085#1072#1083#1072','
      
        '       to_char(ct.date_, '#39'yymmdd'#39') || ct.time_||substr(ct.'#1085#1086#1084#1077#1088'_' +
        #1090#1077#1088#1084#1080#1085#1072#1083#1072',2,2)||lpad(to_char(ct.Card_Number),10,'#39'0'#39') as CheckNum' +
        ','
      
        '       concat('#39'10'#39', lpad(to_char(ct.'#1085#1086#1084#1077#1088'_'#1090#1077#1088#1084#1080#1085#1072#1083#1072'), 5, '#39'0'#39')) a' +
        's AzsId,'
      '       ct.Doc_Number,'
      '       ct.Doc_Date,'
      '       ct.R_Doc_Number as Plus_Num,'
      '       ct.R_Doc_Date as Plus_Date,'
      '       ct.Litr as CountLitr,'
      '       NDS.GetNoNds_WithNds(ct.Price,ct.Date_, 4) as PriceNoNds,'
      '       NDS.GetNoNds_WithNds(ct.Amount,ct.Date_, 2) as SumNoNDS,'
      '       NDS.GetNds_WithNds(ct.Amount, ct.Date_) as Nds,'
      '       ct.Price as PriceNds,'
      '       ct.Amount as SumNds,'
      '       ct.share_id'
      '  from v_Card_Equal ct, '
      '       v_oil_np_group NP, '
      '       v_org Filial, '
      '       v_org ParAZS,'
      '       v_org AZS'
      
        ' where azs_ppon_id = Filial.id (+) and filial.id(+)=filial.inst ' +
        '(+)'
      '   and ct.subq_id = 1'
      '   and ct.'#1085#1086#1084#1077#1088'_'#1090#1077#1088#1084#1080#1085#1072#1083#1072' + 1000000 = AZS.Id (+)'
      '   and ct.'#1085#1086#1084#1077#1088'_'#1090#1077#1088#1084#1080#1085#1072#1083#1072' + 1000000 = AZS.Inst (+)'
      '   and ct.to_id = :OrgId'
      '   and ct.to_inst = :OrgInst'
      '   and ct.date_ >= :BeginDate'
      '   and ct.date_ <= :EndDate'
      '   and ct.CardAlign = 0'
      '   and np.petrol_id = ct.np_type (+)'
      '   and ct.Card_Number is not null'
      '   and ParAZS.id(+)=AZS.par and ParAZS.inst(+)=AZS.par_inst'
      
        ' order by Plus_Num, Plus_Date, card_number, Filial.Name, Azs.Nam' +
        'e, Np.FullName, ct.Date_')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 544
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
  end
  object qReestr: TOilQuery
    SQL.Strings = (
      'select /*+ORDERED*/'
      '        NP.FullName as NpName,'
      '        Oil_Dog.Dog as DogNum,'
      '        Oil_Dog.Dog_date as DogDate,'
      '        ct.Doc_Number as Minus_Num,'
      '        ct.Doc_Date as Minus_Date,'
      '        ct.R_Doc_Number as Plus_Num,'
      '        ct.R_Doc_Date as Plus_Date,'
      '        Sum(ct.Litr) as CountLitr,'
      
        '        NDS.GetNoNDS_WithNDS(ct.Price,ct.Doc_Date, 4) as PriceNo' +
        'Nds,'
      
        '        NDS.GetNoNDS_WithNDS(sum(ct.Amount),ct.Doc_Date, 2) as S' +
        'umNoNDS,'
      
        '        NDS.GetNDS_WithNDS(sum(ct.Amount),ct.Doc_Date, 2) as Nds' +
        ','
      '        ct.Price as PriceNds,'
      '        Sum(ct.Amount) as SumNds'
      '   from v_Card_Equal ct, Oil_Dog, v_oil_np_group np'
      '  where ct.to_id = :OrgId'
      '    and ct.to_inst = :OrgInst'
      '    and Oil_Dog.Id = (select min(id) from oil_dog'
      
        '                       where state = '#39'Y'#39' and to_ = :OrgId and to' +
        '_inst = :OrgInst and Dog_type = '#39'K'#39
      
        '                         and dog_date=(select min(Dog_Date) from' +
        ' oil_Dog'
      
        '                                        where state = '#39'Y'#39' and to' +
        '_ = :OrgId and to_inst = :OrgInst and Dog_type = '#39'K'#39' ))'
      '    and ct.Doc_Date >= :BeginDate'
      '    and ct.Doc_Date <= :EndDate'
      '    and Oil_Dog.to_ = ct.to_id'
      '    and Oil_Dog.to_inst = ct.to_inst'
      '    and CT.'#1085#1086#1084#1077#1088'_'#1090#1077#1088#1084#1080#1085#1072#1083#1072' <> 0'
      '    and Oil_Dog.Dog_type = '#39'K'#39
      '    and Oil_Dog.state = '#39'Y'#39
      '    and ct.subq_id=1'
      '    and ct.CardAlign = 0'
      '    and ct.np_type = np.petrol_id (+)'
      
        '  group by NP.FullName, Oil_Dog.Dog, Oil_Dog.Dog_date, ct.Doc_Nu' +
        'mber, ct.Doc_Date, ct.R_Doc_Number, ct.R_Doc_Date, ct.Price'
      '  order by Minus_Num, Minus_Date desc'
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 596
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
  end
  object qWork: TOilQuery
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 192
    Top = 120
  end
  object qRequest: TOilQuery
    SQL.Strings = (
      'select Card_Number,'
      '       NP_Name,'
      '       Price,'
      '       sum(Litr) as Litr,'
      '       max(to_number(null)) as Clean_Z_Num,'
      '       sum(SumNDS) as SumNDS'
      '  from (select /*+ORDERED USE_HASH(Receipt, Oil_NP_Group)*/'
      
        '         decode(:PrintCard, null, '#39#39', Card_Number) as Card_Numbe' +
        'r,'
      '         Oil_NP_Group.FullName as NP_Name,'
      '         Receipt.Price,'
      '         Receipt.Litr,'
      '         to_number(null) as Clean_Z_Num,'
      '         round(Litr * Price, 2) as SumNDS'
      
        '          from v_Card_Receipts Receipt, v_Oil_NP_Group Oil_NP_Gr' +
        'oup'
      '         where Receipt.Doc_Number = :DocNum'
      '           and Receipt.Doc_Date = :DocDate'
      '           and Receipt.To_Id = :OrgId'
      '           and Receipt.To_Inst = :OrgInst'
      '           and Receipt.CardAlign = 0'
      '           and Receipt.NP_Type = Oil_NP_Group.Petrol_Id'
      '           and Receipt.dog_id is null'
      '        union all'
      
        '        select decode(:PrintCard, null, '#39#39', t.Card_Number) as Ca' +
        'rd_Number,'
      '               t.FullName as NP_Name,'
      '               d.price2 as Price,'
      '               t.Litr as Litr,'
      '               to_number(null) as Clean_Z_Num,'
      
        '               decode(d.price2, 0, d.summ_nds, round(t.Litr * t.' +
        'Price, 2))'
      '          from (select t.Card_Number,'
      '                       npg.id as grp_id,'
      '                       npg.FullName,'
      '                       t.Litr,'
      '                       t.Price,'
      '                       t.dog_id,'
      '                       t.dog_inst'
      '                  from v_Card_Receipts t, v_Oil_NP_Group npg'
      '                 where t.NP_Type = npg.Petrol_Id) t,'
      '               (select dog_id,'
      '                       dog_inst,'
      '                       nvl(d.price2, 0) as price2,'
      '                       summ_nds,'
      '                       grp_id'
      '                  from oil_dog_detail d, oil_np_type np'
      '                 where np.id = d.np_type'
      '                   and d.state = '#39'Y'#39') d'
      '         where t.dog_id = d.dog_id(+)'
      '           and t.dog_inst = d.dog_inst(+)'
      '           and t.grp_id = d.grp_id(+)'
      '           and t.dog_id = :dog_id'
      '           and t.dog_inst = :dog_inst)'
      ' group by Card_Number, NP_Name, Price')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 306
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'PrintCard'
      end
      item
        DataType = ftInteger
        Name = 'DocNum'
      end
      item
        DataType = ftUnknown
        Name = 'DocDate'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftUnknown
        Name = 'dog_id'
      end
      item
        DataType = ftUnknown
        Name = 'dog_inst'
      end>
  end
  object qRnLS: TOilQuery
    SQL.Strings = (
      'select /*+ORDERED USE_HASH(Ct,Filial,Azs) */'
      '       ct.NpName as NpName,'
      '       Filial.name as Filial_old,/* '#1042#1099#1074#1086#1076#1080#1090#1100#1089#1103' '#1085#1072' '#1087#1077#1095#1072#1090#1100' */'
      '       ParAZS.name as Filial,'
      '       AZS.name as AZS,'
      '       ct.card_number as CardNum,'
      '       ct.Date_,'
      '       ct.Time_,'
      '       ct.Term_Number,'
      
        '       to_char(ct.date_, '#39'yymmdd'#39') || ct.time_||substr(ct.Term_N' +
        'umber,2,2)||lpad(to_char(ct.Card_Number),10,'#39'0'#39') as CheckNum,'
      
        '       concat('#39'10'#39', lpad(to_char(ct.Term_Number), 5, '#39'0'#39')) as Az' +
        'sId,'
      '       ct.Doc_Number,'
      '       ct.Doc_Date,'
      '       ct.DogName as Plus_Num,'
      '       ct.DogDate as Plus_Date,'
      '       ct.Litr as CountLitr,'
      '       ct.PriceNds,'
      '       ct.PriceNdsDis,'
      
        '       nds.GetNoNds_WithNds(ct.PriceNds,ct.date_,4) as PriceNoNd' +
        's,'
      
        '       nds.GetNoNds_WithNds(ct.PriceNdsDis,ct.date_,4) as PriceN' +
        'oNdsDis,'
      '       nds.GetNoNds_WithNds(ct.SumNds,ct.date_,2) as SumNoNDS,'
      '       nds.GetNds_WithNds(ct.SumNds,ct.date_,2) as Nds,'
      '       ct.SumNds,'
      '       to_number(null) as share_id'
      '  from v_card_equal_ls ct,'
      '       v_org Filial,'
      '       v_org ParAZS,'
      '       v_org AZS'
      
        ' where azs_ppon_id = Filial.id (+) and filial.id(+)=filial.inst ' +
        '(+)'
      '   and ct.Term_Number + 1000000 = AZS.Id (+)'
      
        '   and ct.Term_Number + 1000000 = decode(azs.inst(+),1,azs.id(+)' +
        ',azs.inst(+))'
      '   and ct.to_id = :OrgId'
      '   and ct.to_inst = :OrgInst'
      '   and ct.date_ >= :BeginDate'
      '   and ct.date_ <= :EndDate'
      '   and ct.Doc_Number like :Doc_Number ||'#39'%'#39
      '   and AZS.par=ParAZS.id(+) and AZS.par_inst=ParAZS.inst(+)'
      '   and ct.CardAlign = 0'
      
        ' order by  ct.Date_,Plus_Num, Plus_Date,CardNum, Filial.Name, Az' +
        's.Name,ct.NpName')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 544
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OrgId'
      end
      item
        DataType = ftUnknown
        Name = 'OrgInst'
      end
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end
      item
        DataType = ftUnknown
        Name = 'Doc_Number'
      end>
  end
  object qReestrLS: TOilQuery
    SQL.Strings = (
      'select /*+USE_HASH(ct)*/'
      '        ct.npname as NpName,'
      '        ct.dogname as DogNum,'
      '        ct.dogdate as DogDate,'
      '        ct.doc_number as Minus_Num,'
      '        ct.Doc_Date as Minus_Date,'
      '        ct.DogName as Plus_Num,'
      '        ct.DogDate as Plus_Date,'
      '        Sum(ct.Litr) as CountLitr,'
      
        '        nds.GetNoNds_WithNds(ct.PriceNds,ct.date_,4) as PriceNoN' +
        'ds ,'
      
        '        nds.GetNoNds_WithNds(ct.PriceNdsDis,ct.date_,4) as Price' +
        'NoNdsDis,'
      
        '        nds.GetNoNds_WithNds(Sum(SumNds),ct.Doc_Date,4) as SumNo' +
        'NDS,'
      '        nds.GetNds_WithNds(Sum(ct.SumNds),ct.Doc_Date,2) as Nds,'
      '        ct.PriceNds as PriceNds,'
      '        Sum(SumNds) as SumNds'
      '   from v_card_equal_ls ct'
      '   where ct.to_id = :OrgId'
      '    and ct.to_inst = :OrgInst'
      '    and ct.Doc_Date between :BeginDate and :EndDate'
      '    and ct.CardAlign = 0'
      '  group by'
      '        ct.npname,'
      '        ct.PriceNds,'
      '        nds.GetNoNds_WithNds(ct.PriceNds,ct.date_,4),'
      '        nds.GetNoNds_WithNds(ct.PriceNdsDis,ct.date_,4),'
      '        ct.doc_number,'
      '        ct.Doc_Date,'
      '        ct.DogName,'
      '        ct.DogDate'
      'order by Minus_Date, Minus_Num  desc')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 595
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
  end
  object qInvoiceLS: TOilQuery
    SQL.Strings = (
      'select /*+USE_HASH(ct)*/'
      '       1 as Minus_Num,'
      '       min(date_) as WeekFrom,'
      '       max(date_) as WeekTo,'
      '       ct.npname as NpName,'
      '       Sum(ct.Litr) as CountLitr,'
      
        '       Round(NDS.GetNoNDS_WithNds(ct.PriceNdsDis, :EndDate), 4) ' +
        'as PriceNoNds,'
      
        '       Round(NDS.GetNoNDS_WithNds(Sum(SumNds), :EndDate), 2) as ' +
        'SumNoNDS,'
      
        '       Round(NDS.GetNDS_WithNds(Sum(SumNds), :EndDate), 2) as Nd' +
        's,'
      '       ct.PriceNds as PriceNds,'
      '       Sum(SumNds) as SumNds,'
      '       ct.chek_number as InvoiceNum,'
      '       Decode(ct.Np_Type, 3, 1, 0) as Cash_Method'
      '  from v_card_equal_ls ct'
      ' where ct.to_id = :OrgId'
      '   and ct.to_inst = :OrgInst'
      '   and ct.date_ between :BeginDate and :EndDate'
      '   and rtrim(ct.chek_number, '#39#1076#1073#39') = rtrim(:Doc_num, '#39#1076#1073#39')'
      '   and ct.CardAlign = 0'
      ' group by to_char(ct.date_, '#39'IW mm.yyyy'#39'),'
      '          ct.npname,'
      
        '          Round(NDS.GetNoNDS_WithNds(ct.PriceNdsDis, :EndDate), ' +
        '4),'
      '          ct.PriceNds,'
      '          ct.chek_number,'
      '          Decode(ct.Np_Type, 3, 1, 0)'
      ' order by NpName, min(date_), max(date_) desc')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 251
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end
      item
        DataType = ftUnknown
        Name = 'OrgId'
      end
      item
        DataType = ftUnknown
        Name = 'OrgInst'
      end
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'Doc_num'
      end>
  end
  object qReportLS: TOilQuery
    SQL.Strings = (
      
        'select /*+ORDERED USE_NL(Oil_Dog, From_Org, From_Rekv, From_Bank' +
        ', To_Org, To_Rekv, To_Bank)*/'
      ' Oil_Dog.*,'
      ' From_Org.Name as From_Name,'
      ' From_Org.Addr as From_Addr,'
      ' From_Org.Svid_Num as From_Svid_Num,'
      ' From_Org.Nal_Num as From_Nal_Num,'
      ' From_Org.Boss as From_Boss,'
      ' From_Org.Id_Num as From_OKPO,'
      ' From_Org.Phone as From_Phone,'
      ' From_Rekv.Rach_Chet as From_Rach_Chet,'
      ' From_Bank.Name as From_Bank_Name,'
      ' From_Bank.MFO as From_MFO,'
      ' To_Org.Name as To_Name,'
      ' To_Org.Addr as To_Addr,'
      ' To_Org.Svid_Num as To_Svid_Num,'
      ' To_Org.Nal_Num as To_Nal_Num,'
      ' To_Org.Boss as To_Boss,'
      ' To_Org.Id_Num as To_OKPO,'
      ' To_Org.Phone as To_Phone,'
      ' To_Rekv.Rach_Chet as To_Rach_Chet,'
      ' To_Bank.Name as To_Bank_Name,'
      ' To_Bank.MFO as To_MFO,'
      ' To_Org.Face as To_Face,'
      ' To_Org.Passport_ser as Passp_Ser,'
      ' To_Org.Passport_num as Passp_Num,'
      ' To_Org.Passport_whom as Passp_whom,'
      ' To_Org.Passport_when as Passp_when,'
      ' Up_From_Org.Name as Up_From_Name,'
      ' Up_From_Org.Addr as Up_From_Addr,'
      ' Up_From_Org.Phone as Up_From_Phone,'
      ' Up_From_Org.Svid_Num as Up_From_Svid_Num,'
      ' Up_From_Org.Nal_Num as Up_From_Nal_Num'
      '  from Oil_Dog,'
      '       v_Org From_Org,'
      '       v_Org Up_From_Org,'
      '       v_Oil_Rekvizit From_Rekv,'
      '       v_Oil_Bank From_Bank,'
      '       v_Org To_Org,'
      '       v_Oil_Rekvizit To_Rekv,'
      '       v_Oil_Bank To_Bank'
      ' where Oil_Dog.State = '#39'Y'#39
      '   and Oil_Dog.Dog_Date = (select min(Dog_Date)'
      '                             from oil_dog d, card_id_history cih'
      
        '                            where d.state = '#39'Y'#39' and cih.state = ' +
        #39'Y'#39
      '                              and to_ = :OrgId'
      '                              and to_inst = :OrgInst'
      '                              and dog_type = '#39'K'#39
      '                              and Sub_Type = 101'
      
        '                              and d.dog_date between cih.date_ a' +
        'nd cih.date_to'
      '                              and cih.dep_id = d.inst)'
      '   and Oil_Dog.to_ = :OrgId'
      '   and Oil_Dog.to_inst = :OrgInst'
      '   and Oil_Dog.dog_type = '#39'K'#39
      '   and Oil_DOg.Sub_Type = 101'
      '   and Oil_Dog.From_ = From_Org.Id'
      '   and Oil_Dog.From_Inst = From_Org.Inst'
      '   and From_Org.Par = Up_From_Org.Id(+)'
      '   and From_Org.Par_Inst = Up_From_Org.Inst(+)'
      '   and Oil_Dog.R_From_ = From_Rekv.Id(+)'
      '   and Oil_Dog.R_From_Inst = From_Rekv.Inst(+)'
      '   and From_Rekv.Id_Bank = From_Bank.Id(+)'
      '   and From_Rekv.Bank_Inst = From_Bank.Inst(+)'
      '   and Oil_Dog.To_ = To_Org.Id'
      '   and Oil_Dog.To_Inst = To_Org.Inst'
      '   and Oil_Dog.R_To_ = To_Rekv.Id(+)'
      '   and Oil_Dog.R_To_Inst = To_Rekv.Inst(+)'
      '   and To_Rekv.Id_Bank = To_Bank.Id(+)'
      '   and To_Rekv.Bank_Inst = To_Bank.Inst(+)'
      '   and rownum = 1')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 251
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end>
  end
  object qAlienNN_: TOilQuery
    SQL.Strings = (
      'select Oper_Date,'
      '       Np_Name,'
      '       sum(Litr) as Litr,'
      '       PriceXNds,'
      '       sum(SumXNDS) as SumXNDS,'
      '       sum(NDS) as NDS,'
      '       sum(SumNDS) as SumNDS'
      
        '  from (select decode(:PrintAll, null, to_date(null), trunc(Card' +
        '_Transit.Oper_Date)) as Oper_Date,'
      
        '               decode(:PrintAll, null, to_char(null), Oil_NP_Gro' +
        'up.FullName) as Np_Name,'
      '               Card_Transit.Litr,'
      
        '               decode(:PrintAll, null, to_number(null), Round(Ca' +
        'rd_Transit.Term_Price / 6 * 5, 4)) as PriceXNds,'
      
        '               Round(Round(Card_Transit.Term_Price * Card_Transi' +
        't.Litr, 2) - Round(Card_Transit.Term_Price * Card_Transit.Litr /' +
        ' 6, 2), 2) as SumXNDS,'
      
        '               Round(Card_Transit.Term_Price * Card_Transit.Litr' +
        ' / 6, 2) as Nds,'
      
        '               Round(Card_Transit.Term_Price * Card_Transit.Litr' +
        ', 2) as SumNds'
      '          from Card_Transit, v_Oil_NP_Group Oil_NP_Group'
      '         where Card_Transit.NN_Id = :NNId'
      '           and Card_Transit.NN_Inst = :NNInst'
      
        '           and Card_Transit.NP_Type = Oil_NP_Group.Petrol_Id (+)' +
        ')'
      ' group by Oper_Date, NP_Name, PriceXNDS'
      ' order by Oper_Date, Np_Name'
      ''
      ''
      '')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 484
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'PrintAll'
        Value = ''
      end
      item
        DataType = ftString
        Name = 'PrintAll'
      end
      item
        DataType = ftString
        Name = 'PrintAll'
      end
      item
        DataType = ftInteger
        Name = 'NNId'
      end
      item
        DataType = ftInteger
        Name = 'NNInst'
      end>
  end
  object qAlienRn: TOilQuery
    SQL.Strings = (
      'select /*+ORDERED*/'
      '       Oil_NP_Group.FullName as Np_Name,'
      '       Filial.Name as Filial_Name,'
      '       AZS.Name as AZS_Name,'
      '       Card_Transit.Card_Number,'
      '       trunc(Card_Transit.Oper_Date) as Oper_Date,'
      
        '       to_char(Card_Transit.Oper_Date, '#39'yymmddhh24miss'#39') || subs' +
        'tr(to_char(Card_Transit.AZS_Id - 1000000), 2, 2) || lpad(to_char' +
        '(Card_Transit.Card_Number), 10, '#39'0'#39') as Check_Number,'
      '       Card_Transit.Azs_Id,'
      '       Card_Transit.Doc_Number,'
      '       Card_Transit.Doc_Date,'
      '       Card_Transit.Litr,'
      '       Round(Card_Transit.Term_Price / 6 * 5, 4) as PriceXNds,'
      
        '       Round(Card_Transit.Term_Price * Card_Transit.Litr, 2) - R' +
        'ound(Round(Card_Transit.Term_Price * Card_Transit.Litr, 2) / 6, ' +
        '2) as SumXNDS,'
      
        '       Round(Round(Card_Transit.Term_Price * Card_Transit.Litr, ' +
        '2) / 6, 2) as Nds,'
      '       Round(Card_Transit.Term_Price, 2) as PriceNds,'
      
        '       Round(Card_Transit.Term_Price * Card_Transit.Litr, 2) as ' +
        'SumNds'
      
        '  from Card_Transit, v_Oil_NP_Group Oil_NP_Group, v_Org Filial, ' +
        'v_Org AZS, v_Org Emitent'
      ' where AZS.Par = Filial.Id (+)'
      '   and AZS.Par_Inst = Filial.Inst (+)'
      '   and Card_Transit.AZS_Id = AZS.Id (+)'
      '   and Card_Transit.AZS_Id = AZS.Inst (+)'
      '   and Card.GetDep(Card_Number, oper_date) = :OrgId'
      '   and Emitent.Id = :OrgId'
      '   and Emitent.Inst = :OrgInst'
      '   and trunc(Card_Transit.Oper_Date) >= :BeginDate'
      '   and trunc(Card_Transit.Oper_Date) <= :EndDate'
      '   and Card_Transit.NP_Type = Oil_NP_Group.Petrol_Id (+)'
      
        ' order by Filial.Name, Azs.Name, Oil_NP_Group.FullName, Card_Tra' +
        'nsit.Oper_Date'
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 486
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
  end
  object qAlienNN: TOilQuery
    SQL.Strings = (
      'select Np_Name,'
      '       sum(Litr) as Litr,'
      '       PriceXNds,'
      '       sum(SumXNDS) as SumXNDS,'
      '       sum(NDS) as NDS,'
      '       sum(SumNDS) as SumNDS'
      '  from (select /*+ORDERED*/'
      
        '               decode(:PrintAll, null, to_char(null), Oil_NP_Gro' +
        'up.FullName) as Np_Name,'
      '               Card_Transit.Litr,'
      
        '               decode(:PrintAll, null, to_number(null), Round(Ca' +
        'rd_Transit.Term_Price / 6 * 5, 4)) as PriceXNds,'
      
        '               Round(Round(Card_Transit.Term_Price * Card_Transi' +
        't.Litr, 2) - Round(Card_Transit.Term_Price * Card_Transit.Litr /' +
        ' 6, 2), 2) as SumXNDS,'
      
        '               Round(Card_Transit.Term_Price * Card_Transit.Litr' +
        ' / 6, 2) as Nds,'
      
        '               Round(Card_Transit.Term_Price * Card_Transit.Litr' +
        ', 2) as SumNds'
      
        '          from Card_Transit,  v_Oil_NP_Group Oil_NP_Group, v_Org' +
        ' Emitent'
      '         where Card.GetDep(Card_Number, oper_date) = :OrgId'
      '           and Emitent.Id = :OrgId'
      '           and Emitent.Inst = :OrgInst'
      '           and trunc(Card_Transit.Oper_Date) >= :BeginDate'
      '           and trunc(Card_Transit.Oper_Date) <= :EndDate'
      '           and Card_Transit.NP_Type = Oil_NP_Group.Petrol_Id (+)'
      '           and Card_Transit.Card_Number is not null)'
      ' group by NP_Name, PriceXNDS'
      ' order by Np_Name'
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 485
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'PrintAll'
        Value = ''
      end
      item
        DataType = ftString
        Name = 'PrintAll'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
  end
  object qAlienOrg: TOilQuery
    SQL.Strings = (
      
        ' select nvl(Rekv.Def, 0) as Def, Obl.*, Rekv.Rach_Chet, Rekv.MFO' +
        ', Rekv.Name as Bank_Name'
      '   from v_Org Filial, v_Org Obl, v_Oil_Rekvizit Rekv'
      '  where Filial.Org_Type = 3'
      '    and Filial.Par = Obl.Id'
      '    and Filial.Par_Inst = Obl.Inst'
      '    and Rekv.Id_Org (+) = Obl.Id'
      '    and Rekv.Inst (+) = Obl.Inst'
      '    and Filial.Id = :OrgId'
      '    and Filial.Inst = :OrgInst'
      ''
      '  union all'
      ''
      
        ' select nvl(Rekv.Def, 0) as Def, Oil_Org.*, Rekv.Rach_Chet, Rekv' +
        '.MFO, Rekv.Name as Bank_Name'
      '   from v_org Oil_Org, v_Oil_Rekvizit Rekv'
      '  where Oil_Org.Org_Type = 4'
      '    and Rekv.Id_Org (+) = Oil_Org.Id'
      '    and Rekv.Inst (+) = Oil_Org.Inst'
      '    and Oil_Org.Id = :OrgId'
      '    and Oil_Org.Inst = :OrgInst'
      ''
      '  order by 1 desc'
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 486
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end>
  end
  object qRnPart: TOilQuery
    SQL.Strings = (
      'select *'
      '  from (select ct.np_group_fullname as NpName, '
      '               ct.filial_name Filial,'
      '               ct.azs_name AZS, '
      '               ct.Card_Number as CardNum,'
      '               trunc(ct.exp_date) date_,'
      '               to_char(ct.exp_date, '#39'HH24MISS'#39') time_,'
      '               to_char(ct.exp_date, '#39'yymmdd'#39') ||'
      '                 to_char(ct.exp_date, '#39'HH24MISS'#39') ||'
      '                 substr(ct.azs_id - 1e6, 2, 2) ||'
      
        '                 lpad(to_char(ct.Card_Number), 10, '#39'0'#39') as Check' +
        'Num,'
      
        '               concat('#39'10'#39', lpad(to_char(ct.azs_id - 1e6), 5, '#39'0' +
        #39')) as AzsId,'
      
        '               ct.Doc_Number, ct.Doc_Date, ct.Rec_Doc_Number as ' +
        'Plus_Num,'
      
        '               ct.Rec_Doc_Date as Plus_Date, ct.Litr as CountLit' +
        'r,'
      
        '               NDS.GetNoNds_WithNds(ct.Price, trunc(ct.exp_date)' +
        ', 4) as PriceNoNds,'
      
        '               NDS.GetNoNds_WithNds(ct.dog_amount, trunc(ct.exp_' +
        'date), 2) as SumNoNDS,'
      
        '               NDS.GetNds_WithNds(ct.dog_amount, trunc(ct.exp_da' +
        'te)) as Nds,'
      '               ct.Price as PriceNds, '
      '               ct.dog_amount as SumNds, '
      '               ct.oil_id, ct.oil_inst, '
      '               ct.card_number, ct.part_dog, '
      '               ct.client_id, ct.client_inst,'
      '               ct.share_id'
      '          from v_card_sr_equal ct'
      '         where ct.is_ls = 0'
      '           and ct.CardAlign = 0'
      '           and ct.Card_Number is not null'
      '         union all'
      '        select gr.fullname, '
      '               fil.name Filial, '
      '               azs.name AZS,'
      '               cep.Card_Number as CardNum, '
      '               date_, time_,'
      '               to_char(date_, '#39'yymmdd'#39') || time_ ||'
      '                 substr(cep.azs_id - 1e6, 2, 2) ||'
      
        '                 lpad(to_char(cep.Card_Number), 10, '#39'0'#39') as Chec' +
        'kNum,'
      
        '               concat('#39'10'#39', lpad(to_char(cep.azs_id - 1e6), 5, '#39 +
        '0'#39')) as AzsId,'
      
        '               cep.Doc_Number, cep.Doc_Date, cep.R_Doc_Number as' +
        ' Plus_Num,'
      
        '               cep.R_Doc_Date as Plus_Date, cep.Litr as CountLit' +
        'r,'
      
        '               NDS.GetNoNds_WithNds(cep.Price, date_, 4) as Pric' +
        'eNoNds,'
      
        '               NDS.GetNoNds_WithNds(cep.amount, date_, 2) as Sum' +
        'NoNDS,'
      '               NDS.GetNds_WithNds(cep.amount, date_) as Nds,'
      
        '               cep.Price as PriceNds, cep.Amount as SumNds, cep.' +
        'oil_id,'
      
        '               cep.oil_inst, cep.card_number, cep.dog part_dog, ' +
        'cep.client_id,'
      '               cep.client_inst,'
      '               cep.share_id'
      '          from v_card_equal_alpart cep, '
      '               v_oil_np_group gr, '
      '               v_org fil,'
      '               v_org azs'
      '         where cep.subq_id = 1'
      '           and cep.np_type = gr.petrol_id(+)'
      '           and cep.azs_id = azs.id'
      '           and cep.azs_inst = azs.inst'
      '           and cep.azs_ppon_id = fil.id'
      '           and fil.id = fil.inst)'
      ' where client_id = :OrgId'
      '   and client_inst = :OrgInst'
      '   and date_ >= :BeginDate'
      '   and date_ <= :EndDate'
      
        ' order by Plus_Num, Plus_Date, CardNum, Filial, Azs, NpName, dat' +
        'e_')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 544
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
  end
  object qRnLSPart: TOilQuery
    SQL.Strings = (
      'select * from '
      '(select /*+ORDERED USE_HASH(Ct,Filial,Azs) */'
      '       ct.np_group_fullname as NpName,'
      '       Filial.name as Filial_old,/* '#1042#1099#1074#1086#1076#1080#1090#1100#1089#1103' '#1085#1072' '#1087#1077#1095#1072#1090#1100' */'
      '       ParAZS.name Filial,'
      '       AZS.name as AZS,'
      '       ct.Card_Number as CardNum,'
      '       trunc(ct.exp_date) Date_,'
      '       to_char(ct.exp_date, '#39'HH24MISS'#39') Time_,'
      
        '       to_char(trunc(ct.exp_date), '#39'yymmdd'#39') || to_char(ct.exp_d' +
        'ate, '#39'HH24MISS'#39') '
      
        '         ||substr(ct.azs_id - 1e6,2,2)||lpad(to_char(ct.Card_Num' +
        'ber),10,'#39'0'#39') as CheckNum,'
      
        '       concat('#39'10'#39', lpad(to_char(ct.azs_id - 1e6), 5, '#39'0'#39')) as A' +
        'zsId,'
      '       ct.Doc_Number,  ct.Doc_Date,'
      
        '       ct.Rec_Doc_Number as Plus_Num,  ct.Rec_Doc_Date as Plus_D' +
        'ate,'
      '       ct.Litr as CountLitr,'
      
        '       NDS.GetNoNds_WithNds(ct.Price, trunc(ct.exp_date), 4) as ' +
        'PriceNoNds,'
      
        '       NDS.GetNoNds_WithNds(ct.Price, trunc(ct.exp_date), 4) as ' +
        'PriceNoNdsDis,'
      
        '       nds.GetNoNDS_WithNDS(ct.dog_amount,trunc(ct.exp_date)) as' +
        ' SumNoNDS,'
      
        '       nds.GetNDS_WithNDS(ct.dog_amount,trunc(ct.exp_date)) as N' +
        'ds,'
      '       ct.dog_amount SumNds,'
      '       client_id,'
      '       client_inst,'
      '       ct.Price as PriceNds,'
      '       ct.Price as PriceNdsDis,'
      '       to_number(null) as share_id'
      '  from v_card_sr_equal ct,'
      '       v_org Filial,'
      '       v_org ParAZS,'
      '       v_org AZS'
      
        ' where emitent_id = Filial.id (+) and filial.id(+)=filial.inst (' +
        '+)'
      '   and ct.azs_id = AZS.Id (+)'
      '   and ct.azs_inst = decode(azs.inst(+),1,azs.id(+),azs.inst(+))'
      '   and is_ls=1'
      '   and ParAZS.id(+)=AZS.par and ParAZS.inst(+)=AZS.par_inst'
      ' union all'
      'select gr.fullname, '
      '       fil.name Filial, '
      '       fil.name ParAZS, '
      '       azs.name AZS,'
      '       cep.Card_Number as CardNum, '
      '       date_, '
      '       time_,'
      '       to_char(date_, '#39'yymmdd'#39') || time_ '
      '         || substr(cep.azs_id - 1e6, 2, 2) '
      '         || lpad(to_char(cep.Card_Number), 10, '#39'0'#39') as CheckNum,'
      
        '       concat('#39'10'#39', lpad(to_char(cep.azs_id - 1e6), 5, '#39'0'#39')) as ' +
        'AzsId,'
      '       cep.Doc_Number, cep.Doc_Date, '
      
        '       cep.R_Doc_Number as Plus_Num, cep.R_Doc_Date as Plus_Date' +
        ', '
      '       cep.Litr as CountLitr,'
      '       NDS.GetNoNds_WithNds(cep.Price, date_, 4) as PriceNoNds,'
      
        '       NDS.GetNoNds_WithNds(cep.Price, date_, 4) as PriceNoNdsDi' +
        's,                '
      '       NDS.GetNoNds_WithNds(cep.amount, date_, 2) as SumNoNDS,'
      '       NDS.GetNds_WithNds(cep.amount, date_) as Nds,'
      '       cep.Amount as SumNds,'
      '       cep.to_id client_id,'
      '       cep.to_inst client_inst,'
      '       cep.Price as PriceNds,'
      '       cep.Price as PriceNdsDis,'
      '       to_number(null) as share_id'
      '  from v_card_equal_alpart cep, v_oil_np_group gr, v_org fil,'
      '       v_org azs'
      ' where cep.is_ls = 1'
      '   and cep.np_type = gr.petrol_id(+)'
      '   and cep.azs_id = azs.id'
      '   and cep.azs_inst = azs.inst'
      '   and cep.azs_ppon_id = fil.id'
      '   and fil.id = fil.inst)'
      ' where client_id = :OrgId'
      '   and client_inst = :OrgInst'
      '   and date_ >= :BeginDate'
      '   and date_ <= :EndDate'
      '   and Doc_Number like :Doc_Number ||'#39'%'#39
      ' order by  date_,Plus_Num, Plus_Date,CardNum, Filial, Azs,NpName')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 544
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OrgId'
      end
      item
        DataType = ftUnknown
        Name = 'OrgInst'
      end
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end
      item
        DataType = ftUnknown
        Name = 'Doc_Number'
      end>
  end
  object qGetDogDetail: TOilQuery
    SQL.Strings = (
      
        'select npg.np_id, npg.Petrol_Id, Sum(t.litr) as count_litr, t.pr' +
        'ice_dog_nds'
      '  from card_transaction_rest t,'
      '       (select npg.Petrol_Id, min(np.id) as np_id'
      '          from oil_np_type np, Oil_NP_Group npg'
      '         where np.grp_id = npg.id'
      '         group by npg.Petrol_Id) npg'
      ' where t.dog_id is null'
      
        '   and ((t.tr_type in (5, 7) and t.Doc_Number is null) or :shema' +
        '_type = 0)'
      
        '   and ((t.tr_type = 12 and t.Chek_Number is null) or :shema_typ' +
        'e = 1)'
      '   and npg.Petrol_Id = t.np_type'
      '   and t.To_Id = :to_id'
      '   and t.To_Inst = :to_inst'
      '   and trunc(t.Oper_Date) between :begin_date and :end_date'
      ' group by npg.np_id, npg.Petrol_Id, t.price_dog_nds')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 250
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'shema_type'
      end
      item
        DataType = ftUnknown
        Name = 'to_id'
      end
      item
        DataType = ftUnknown
        Name = 'to_inst'
      end
      item
        DataType = ftUnknown
        Name = 'begin_date'
      end
      item
        DataType = ftUnknown
        Name = 'end_date'
      end>
  end
end
