inherited SetNumForm: TSetNumForm
  Left = 298
  Top = 245
  Width = 444
  Height = 430
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1085#1086#1084#1077#1088#1086#1074
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 373
    Width = 436
    Height = 30
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      436
      30)
    object bbOk: TBitBtn
      Left = 257
      Top = 2
      Width = 87
      Height = 25
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102
      Anchors = [akTop, akRight]
      Caption = '&'#1055#1088#1080#1085#1103#1090#1100
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
      Left = 347
      Top = 2
      Width = 87
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1088
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
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
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 436
    Height = 373
    Align = alClient
    DataSource = ds
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = DBGridEh1GetCellParams
    Columns = <
      item
        Color = 15658991
        EditButtons = <>
        FieldName = 'DESCRIPTION'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Width = 324
      end
      item
        EditButtons = <>
        FieldName = 'NUM'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
      end>
  end
  object mt: TMemoryTable
    BeforePost = mtBeforePost
    Left = 176
    Top = 160
    object mtDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 255
    end
    object mtNUM: TFloatField
      FieldName = 'NUM'
      DisplayFormat = '#'
      EditFormat = '#'
    end
    object mtNUM_OLD: TFloatField
      FieldName = 'NUM_OLD'
    end
    object mtSEQUENCE_NAME: TStringField
      FieldName = 'SEQUENCE_NAME'
      Size = 255
    end
    object mtDEF_NUM: TFloatField
      FieldName = 'DEF_NUM'
    end
  end
  object ds: TOraDataSource
    DataSet = mt
    Left = 184
    Top = 152
  end
  object q: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select '
      '  es.description,es.sequence_name,'
      '  nvl(seq.last_number,0) as num_old,'
      '  nvl(seq.last_number,es.start_value) as num,'
      '  es.start_value as def_num'
      'from exe_sequences es,sys.all_sequences seq'
      'where es.show_in_form='#39'Y'#39' and es.state ='#39'Y'#39
      '  and es.sequence_name=seq.sequence_name(+)'
      '  and seq.sequence_owner(+)=user'
      'order by description')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 56
    Top = 120
  end
end
