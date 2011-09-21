inherited frmTaxBillPrintForm: TfrmTaxBillPrintForm
  Left = 433
  Top = 344
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1077#1095#1072#1090#1080' '#1053#1053
  ClientHeight = 198
  ClientWidth = 292
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 292
    Height = 44
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object rbUseDefault: TRadioButton
      Left = 7
      Top = 24
      Width = 273
      Height = 15
      Caption = #1042#1089#1077#1075#1076#1072' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = rbUseDefaultClick
    end
    object rbAlwaysAsk: TRadioButton
      Left = 7
      Top = 7
      Width = 287
      Height = 12
      Caption = #1044#1083#1103' '#1082#1072#1078#1076#1086#1081' '#1053#1053' '#1074#1099#1074#1086#1076#1080#1090#1100' '#1086#1082#1085#1086' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1087#1077#1095#1072#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = rbAlwaysAskClick
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 44
    Width = 292
    Height = 61
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object rbEmpty: TRadioButton
      Left = 8
      Top = 21
      Width = 273
      Height = 17
      Caption = #1054#1089#1090#1072#1074#1080#1090#1100' '#1103#1095#1077#1081#1082#1080' '#1082#1086#1087#1080#1103'/'#1086#1088#1080#1075#1080#1085#1072#1083' '#1087#1091#1089#1090#1099#1084#1080
      TabOrder = 0
    end
    object rbOrigOnly: TRadioButton
      Left = 8
      Top = 3
      Width = 137
      Height = 17
      Caption = #1055#1077#1095#1072#1090#1100' '#1086#1088#1080#1075#1080#1085#1072#1083#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object rbAll: TRadioButton
      Left = 8
      Top = 39
      Width = 265
      Height = 17
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1076#1074#1072' '#1101#1082#1079#1077#1084#1087#1083#1103#1088#1072' - '#1082#1086#1087#1080#1102' '#1080' '#1086#1088#1080#1075#1080#1085#1072#1083
      TabOrder = 2
    end
    object rbCopyOnly: TRadioButton
      Left = 160
      Top = 3
      Width = 121
      Height = 17
      Caption = #1055#1077#1095#1072#1090#1100' '#1082#1086#1087#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 169
    Width = 292
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      292
      29)
    object bbOk: TBitBtn
      Left = 211
      Top = 3
      Width = 76
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 0
      Kind = bkOK
    end
  end
  object pnlClient: TPanel
    Left = 0
    Top = 105
    Width = 292
    Height = 64
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Label6: TLabel
      Left = 26
      Top = 10
      Width = 47
      Height = 13
      Caption = #1042#1099#1074#1077#1089#1090#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sbUpDown: TRxSpinButton
      Left = 264
      Top = 7
      Width = 20
      Height = 20
      Enabled = False
      DownGlyph.Data = {
        56000000424D56000000000000003E0000002800000006000000060000000100
        010000000000180000000000000000000000020000000200000000000000FFFF
        FF00CC0000008400000000000000CC000000CC000000CC000000}
      UpGlyph.Data = {
        56000000424D56000000000000003E0000002800000006000000060000000100
        010000000000180000000000000000000000020000000200000000000000FFFF
        FF00CC000000CC000000CC0000000000000084000000CC000000}
      OnBottomClick = sbUpDownBottomClick
      OnTopClick = sbUpDownTopClick
    end
    object Label1: TLabel
      Left = 179
      Top = 10
      Width = 30
      Height = 13
      Caption = #1082#1086#1087#1080#1081
    end
    object cbOutputType: TComboBox
      Left = 83
      Top = 6
      Width = 87
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      OnChange = cbOutputTypeChange
      Items.Strings = (
        #1069#1082#1088#1072#1085
        #1055#1088#1080#1085#1090#1077#1088
        #1044#1080#1089#1082)
    end
    object edNumOfCopy: TRxCalcEdit
      Left = 221
      Top = 7
      Width = 39
      Height = 20
      AutoSize = False
      DirectInput = False
      DisplayFormat = '0'
      Enabled = False
      ButtonWidth = 0
      MaxLength = 2
      MinValue = 1.000000000000000000
      NumGlyphs = 2
      ReadOnly = True
      TabOrder = 1
      Value = 1.000000000000000000
    end
    object deSaveTo: TDirectoryEdit
      Left = 82
      Top = 37
      Width = 202
      Height = 20
      DialogKind = dkWin32
      DirectInput = False
      NumGlyphs = 1
      TabOrder = 2
    end
    object chSaveTo: TCheckBox
      Left = 8
      Top = 38
      Width = 72
      Height = 19
      Caption = 'c'#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 3
      OnClick = chSaveToClick
    end
  end
  object FormStorage: TFormStorage
    Options = []
    UseRegistry = True
    OnRestorePlacement = FormStorageRestorePlacement
    StoredProps.Strings = (
      'rbAll.Checked'
      'rbAlwaysAsk.Checked'
      'rbEmpty.Checked'
      'rbOrigOnly.Checked'
      'rbUseDefault.Checked'
      'rbCopyOnly.Checked'
      'deSaveTo.Text'
      'edNumOfCopy.Text')
    StoredValues = <
      item
        Name = 'OutputIndex'
      end>
    Left = 240
    Top = 12
  end
end
