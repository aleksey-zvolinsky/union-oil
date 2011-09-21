inherited EditBaseForm: TEditBaseForm
  Left = 468
  Top = 210
  Width = 337
  Height = 369
  Caption = 'EditBaseForm'
  OldCreateOrder = True
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 0
    Top = 309
    Width = 329
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object pBtn: TPanel
      Left = 132
      Top = 2
      Width = 195
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        195
        29)
      object bbOk: TBitBtn
        Left = 18
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1055#1088#1080#1085#1103#1090#1100
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
        Left = 108
        Top = 2
        Width = 87
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 1
        OnClick = bbCancelClick
        Kind = bkCancel
      end
    end
  end
  object q: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select *'
      'from table1'
      'where id=:id and inst=:inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 8
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'inst'
        ParamType = ptInput
      end>
  end
end
