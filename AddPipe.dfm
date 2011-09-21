inherited AddPipeForm: TAddPipeForm
  Left = 203
  Top = 123
  BorderStyle = bsDialog
  Caption = 'Трубопровод'
  ClientHeight = 130
  ClientWidth = 510
  OldCreateOrder = True
  OnCreate = FormCreate
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
    Left = 144
    Top = 11
    Width = 49
    Height = 13
    Caption = 'Владелец'
  end
  object Label3: TLabel
    Left = 8
    Top = 44
    Width = 86
    Height = 13
    Caption = 'Границы участка'
  end
  object Label4: TLabel
    Left = 32
    Top = 76
    Width = 65
    Height = 13
    Caption = 'Диаметр мм'
  end
  object Label5: TLabel
    Left = 328
    Top = 76
    Width = 47
    Height = 13
    Caption = 'Длина м '
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 510
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    object bbOk: TBitBtn
      Left = 320
      Top = 4
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Принять'
      Default = True
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
      Left = 416
      Top = 4
      Width = 88
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Отменить'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object edId: TEdit
    Left = 48
    Top = 8
    Width = 65
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 0
  end
  object edFrom: TComboEdit
    Left = 200
    Top = 8
    Width = 305
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 1
    Text = 'edFrom'
    OnButtonClick = edFromButtonClick
  end
  object edBounds: TEdit
    Left = 104
    Top = 40
    Width = 401
    Height = 21
    TabOrder = 2
    Text = 'От вентиля №  до вентиля №'
  end
  object rceDiam: TRxCalcEdit
    Left = 104
    Top = 72
    Width = 121
    Height = 21
    AutoSize = False
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 3
  end
  object rceLength: TRxCalcEdit
    Left = 384
    Top = 72
    Width = 121
    Height = 21
    AutoSize = False
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 4
  end
  object nvQ: TOilQuery
    SQL.Strings = (
      'select s_oil_pipe.nextval nv from sys.dual')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 232
    Top = 64
    object nvQNV: TFloatField
      FieldName = 'NV'
    end
  end
  object sp: TOilStoredProc
    StoredProcName = 'insorupdoil_pipe'
    Left = 264
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
      end>
  end
end
