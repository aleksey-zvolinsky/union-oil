inherited AddBankForm: TAddBankForm
  Left = 347
  Top = 174
  BorderStyle = bsDialog
  Caption = '����'
  ClientHeight = 128
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 89
    Width = 275
    Height = 39
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'Panel1'
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 91
      Top = 8
      Width = 87
      Height = 25
      Hint = '������� ����� ����'
      Caption = '&�������'
      ModalResult = 1
      TabOrder = 0
      OnClick = bbOkClick
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
      Left = 184
      Top = 8
      Width = 87
      Height = 25
      Hint = '������� ����'
      Caption = '&��������'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 275
    Height = 89
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 34
      Height = 13
      Caption = '��� :'
    end
    object Label2: TLabel
      Left = 8
      Top = 44
      Width = 82
      Height = 13
      Caption = '������������ :'
    end
    object Edit1: TEdit
      Left = 8
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '��� ��� �����'
    end
    object Edit2: TEdit
      Left = 8
      Top = 60
      Width = 257
      Height = 21
      TabOrder = 1
      Text = '�������� �����'
    end
  end
  object sp: TOilStoredProc
    Left = 200
    Top = 8
  end
  object q1: TOilQuery
    SQL.Strings = (
      'select s_oil_bank.nextval from sys.dual')
    Left = 168
    Top = 8
  end
end
