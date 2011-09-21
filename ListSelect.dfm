inherited ListSelectForm: TListSelectForm
  Left = 469
  Top = 317
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1080#1079' '#1089#1087#1080#1089#1082#1072
  ClientHeight = 255
  ClientWidth = 345
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SrcLabel: TLabel
    Left = 8
    Top = 8
    Width = 145
    Height = 16
    AutoSize = False
    Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1087#1086#1079#1080#1094#1080#1080
  end
  object DstLabel: TLabel
    Left = 192
    Top = 8
    Width = 145
    Height = 16
    AutoSize = False
    Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1087#1086#1079#1080#1094#1080#1080
  end
  object IncludeBtn: TSpeedButton
    Left = 160
    Top = 32
    Width = 24
    Height = 24
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077
    Caption = '>'
    OnClick = IncludeBtnClick
  end
  object IncAllBtn: TSpeedButton
    Left = 160
    Top = 64
    Width = 24
    Height = 24
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
    Caption = '>>'
    OnClick = IncAllBtnClick
  end
  object ExcludeBtn: TSpeedButton
    Left = 160
    Top = 96
    Width = 24
    Height = 24
    Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077
    Caption = '<'
    Enabled = False
    OnClick = ExcludeBtnClick
  end
  object ExAllBtn: TSpeedButton
    Left = 160
    Top = 128
    Width = 24
    Height = 24
    Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1089#1077
    Caption = '<<'
    Enabled = False
    OnClick = ExcAllBtnClick
  end
  object OKBtn: TButton
    Left = 179
    Top = 220
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 259
    Top = 220
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
  object SrcList: TListBox
    Left = 8
    Top = 24
    Width = 144
    Height = 185
    ItemHeight = 13
    Items.Strings = (
      'Item1'
      'Item2'
      'Item3'
      'Item4'
      'Item5')
    MultiSelect = True
    TabOrder = 0
    OnDblClick = IncludeBtnClick
  end
  object DstList: TListBox
    Left = 192
    Top = 24
    Width = 144
    Height = 185
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 1
    OnDblClick = ExcludeBtnClick
  end
  object Query: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 16
    Top = 272
  end
end
