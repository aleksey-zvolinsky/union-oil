inherited NPTypeForm: TNPTypeForm
  Left = 224
  Top = 189
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Тип нефтепродукта'
  ClientHeight = 130
  ClientWidth = 262
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 262
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel3: TPanel
      Left = 65
      Top = 2
      Width = 195
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbOk: TBitBtn
        Left = 8
        Top = 2
        Width = 87
        Height = 25
        Caption = '&Принять'
        Default = True
        TabOrder = 0
        OnClick = bbOkClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
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
        Left = 104
        Top = 2
        Width = 87
        Height = 25
        Caption = '&Отменить'
        TabOrder = 1
        Kind = bkCancel
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 262
    Height = 97
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 40
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Label2: TLabel
      Left = 12
      Top = 72
      Width = 99
      Height = 13
      Caption = 'Короткое название'
    end
    object Label3: TLabel
      Left = 24
      Top = 12
      Width = 35
      Height = 13
      Caption = 'Группа'
    end
    object edName: TEdit
      Left = 72
      Top = 36
      Width = 181
      Height = 21
      TabOrder = 0
      Text = 'edName'
    end
    object edShort_Name: TEdit
      Left = 116
      Top = 68
      Width = 137
      Height = 21
      TabOrder = 1
      Text = 'ed_Name'
    end
    object edNPGroup: TComboEdit
      Left = 72
      Top = 8
      Width = 181
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
      Text = 'edNPGroup'
      OnButtonClick = edNPGroupButtonClick
      OnDblClick = edNPGroupButtonClick
    end
  end
  object SP: TOilStoredProc
        Left = 124
    Top = 52
  end
end
