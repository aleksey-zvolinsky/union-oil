inherited PolisRangeForm: TPolisRangeForm
  Left = 452
  Top = 424
  ActiveControl = edtSer
  BorderStyle = bsDialog
  Caption = 'Ввод диапазона'
  ClientHeight = 106
  ClientWidth = 233
  OldCreateOrder = True
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbx: TGroupBox
    Left = 0
    Top = 0
    Width = 233
    Height = 75
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 19
      Width = 34
      Height = 13
      Caption = 'Серия:'
    end
    object Label2: TLabel
      Left = 68
      Top = 20
      Width = 51
      Height = 13
      Caption = 'Номер от:'
    end
    object Label3: TLabel
      Left = 151
      Top = 20
      Width = 52
      Height = 13
      Caption = 'Номер до:'
    end
    object edtSer: TEdit
      Left = 10
      Top = 35
      Width = 47
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object edtFrom: TEdit
      Left = 68
      Top = 36
      Width = 73
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object edtTo: TEdit
      Left = 151
      Top = 36
      Width = 73
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 75
    Width = 233
    Height = 31
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object btnOk: TBitBtn
      Left = 131
      Top = 4
      Width = 42
      Height = 23
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TBitBtn
      Left = 178
      Top = 4
      Width = 50
      Height = 23
      Cancel = True
      Caption = 'Отмена'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object ActionList: TActionList
    Left = 64
    Top = 40
    object actEsc: TAction
      Caption = 'actEsc'
      ShortCut = 27
      OnExecute = actEscExecute
    end
    object actEnter: TAction
      Caption = 'actEnter'
      ShortCut = 13
      OnExecute = actEnterExecute
    end
  end
end
