inherited ExportIn1CForm: TExportIn1CForm
  Left = 435
  Top = 253
  Width = 420
  Height = 446
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1074' 1'#1057
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grid1: TDBGridEh
    Left = 0
    Top = 57
    Width = 412
    Height = 302
    Align = alClient
    AllowedOperations = [alopUpdateEh, alopDeleteEh]
    DataSource = ds
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.Tracking = True
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnColWidthsChanged = grid1ColWidthsChanged
    OnGetCellParams = grid1GetCellParams
    Columns = <
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'CHECKED'
        Footers = <>
        Width = 16
      end
      item
        Checkboxes = False
        EditButtons = <>
        FieldName = 'DESCRIPTION'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1058#1080#1087' '#1074#1099#1075#1088#1091#1079#1082#1080
        Width = 303
      end
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Title.Caption = #8470
        Width = 55
      end>
  end
  object pnlBtnAutoUnload: TPanel
    Left = 0
    Top = 359
    Width = 412
    Height = 30
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    Visible = False
    DesignSize = (
      412
      30)
    object sbAutoLoad: TSpeedButton
      Left = 4
      Top = 2
      Width = 25
      Height = 25
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1072#1074#1090#1086#1079#1072#1075#1088#1091#1079#1082#1091
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 121
      Glyph.Data = {
        3E040000424D3E04000000000000760000002800000058000000160000000100
        040000000000C803000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        777777777777777777770000007777777777777777FFFFFF7777777777777777
        0000007777777777777777000000777777777777770088888800777777777777
        FF888888FF777777777777008888880077777777777700888888007777777777
        70887707778807777777777F8877F77788F7777777777088FF0FFF8807777777
        777088FF0FFF8807777777770870777770778077777777887F77777F778F7777
        777708F0FFFFF0FF807777777708F0FFFFF0FF80777777708F87777777777807
        777778F7777777777778F77777708FFFFFFFFFFFF8077777708FFFFFFFFFFFF8
        077777708FF8777777770807777778F77777777777F8F77777708FFFFFFFFFFF
        08077777708FFFFFFFFFFF0807777708F0FF87777777778077778F7F77777777
        77778F777708F0FFFFFFFFFFFF80777708F0FFFFFFFFFFFF80777708FFFFF877
        7777778077778F777777887777778F777708FFFFFF99FFFFFF80777708FFFFFF
        88FFFFFF80777708FFFFF8877777708077778F7777788887777F8F777708FFFF
        F9999FFFF080777708FFFFF8888FFFF0807777080FFFF8877777778077778FF7
        7778878777778F7777080FFFF99C9FFFFF807777080FFFF8878FFFFF80777708
        FFFFFF877777778077778F777777877877778F777708FFFFFF9CC9FFFF807777
        08FFFFFF8778FFFF80777708FFFFFF877777078077778F777777877787F78F77
        7708FFFFFF9CCC9F0F80777708FFFFFF87778F0F8077777080FFFF8777777807
        777778FF777787777878F777777080FFFF9CCCC9F80777777080FFFF877778F8
        077777708FFFFF8777777807777778F7777787777778F77777708FFFFF9CCCCC
        F8077777708FFFFF877777F80777777708FF0F87770780777777778F77F78777
        F7FF7777777708FF0F9CCC0C807777777708FF0F87770780777777777088FFF0
        7788077777777778FF777F77FF87777777777088FFF0CC8807777777777088FF
        F07788077777777777008888880077777777777788FFFFFF8877777777777700
        8888880077777777777700888888007777777777777700000077777777777777
        7788888877777777777777770000007777777777777777000000777777777777
        77777708777777777777777777778F7777777777777777777708777777777777
        777777770877777777777777777770008777777777777777777888F777777777
        7777777770008777777777777777777000877777777777777777700087777777
        77777777777888F7777777777777777770008777777777777777777000877777
        7777}
      NumGlyphs = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = sbAutoLoadClick
    end
    object LblNextDate: TLabel
      Left = 32
      Top = 8
      Width = 139
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1079#1072#1087#1091#1089#1082#1072':'
    end
    object LblNextDateValue: TLabel
      Left = 176
      Top = 8
      Width = 86
      Height = 13
      Caption = 'LblNextDateValue'
    end
    object bbCancel: TBitBtn
      Left = 323
      Top = 2
      Width = 87
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1088
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      ModalResult = 2
      TabOrder = 0
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
  object pTop: TPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 57
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      412
      57)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 7
      Height = 13
      Caption = 'C'
    end
    object Label2: TLabel
      Left = 110
      Top = 8
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object Label3: TLabel
      Left = 8
      Top = 32
      Width = 105
      Height = 13
      Caption = #1055#1086#1084#1077#1089#1090#1080#1090#1100' '#1092#1072#1081#1083#1099' '#1074' '
    end
    object deBegin: TDateEdit
      Left = 18
      Top = 4
      Width = 90
      Height = 21
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
      OnChange = deBeginChange
    end
    object deEnd: TDateEdit
      Left = 128
      Top = 4
      Width = 90
      Height = 21
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
    end
    object dir1: TDirectoryEdit
      Left = 128
      Top = 27
      Width = 264
      Height = 21
      DirectInput = False
      NumGlyphs = 1
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
  end
  object pnlBtnNormal: TPanel
    Left = 0
    Top = 389
    Width = 412
    Height = 30
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    Visible = False
    DesignSize = (
      412
      30)
    object BitBtn1: TBitBtn
      Left = 134
      Top = 2
      Width = 186
      Height = 25
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102
      Anchors = [akTop, akRight]
      Caption = ' &'#1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074#1089#1077' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1077
      TabOrder = 0
      OnClick = bbOkClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00090909001212
        12001F1F1F002C2C2C003939390045454500525252005F5F5F006C6C6C007878
        780085858500929292009F9F9F00ABABAB00B8B8B800C5C5C500D2D2D200DEDE
        DE00EBEBEB00F8F8F800F0FBFF00A4A0A000C0DCC000F0CAA60000003E000000
        5D0000007C0000009B000000BA000000D9000000F0002424FF004848FF006C6C
        FF009090FF00B4B4FF0000143E00001E5D0000287C0000329B00003CBA000046
        D9000055F000246DFF004885FF006C9DFF0090B5FF00B4CDFF00002A3E00003F
        5D0000547C0000699B00007EBA000093D90000AAF00024B6FF0048C2FF006CCE
        FF0090DAFF00B4E6FF00003E3E00005D5D00007C7C00009B9B0000BABA0000D9
        D90000F0F00024FFFF0048FFFF006CFFFF0090FFFF00B4FFFF00003E2A00005D
        3F00007C5400009B690000BA7E0000D9930000F0AA0024FFB60048FFC2006CFF
        CE0090FFDA00B4FFE600003E1400005D1E00007C2800009B320000BA3C0000D9
        460000F0550024FF6D0048FF85006CFF9D0090FFB500B4FFCD00003E0000005D
        0000007C0000009B000000BA000000D9000000F0000024FF240048FF48006CFF
        6C0090FF9000B4FFB400143E00001E5D0000287C0000329B00003CBA000046D9
        000055F000006DFF240085FF48009DFF6C00B5FF9000CDFFB4002A3E00003F5D
        0000547C0000699B00007EBA000093D90000AAF00000B6FF2400C2FF4800CEFF
        6C00DAFF9000E6FFB4003E3E00005D5D00007C7C00009B9B0000BABA0000D9D9
        0000F0F00000FFFF2400FFFF4800FFFF6C00FFFF9000FFFFB4003E2A00005D3F
        00007C5400009B690000BA7E0000D9930000F0AA0000FFB62400FFC24800FFCE
        6C00FFDA9000FFE6B4003E1400005D1E00007C2800009B320000BA3C0000D946
        0000F0550000FF6D2400FF854800FF9D6C00FFB59000FFCDB4003E0000005D00
        00007C0000009B000000BA000000D9000000F0000000FF242400FF484800FF6C
        6C00FF909000FFB4B4003E0014005D001E007C0028009B003200BA003C00D900
        4600F0005500FF246D00FF488500FF6C9D00FF90B500FFB4CD003E002A005D00
        3F007C0054009B006900BA007E00D9009300F000AA00FF24B600FF48C200FF6C
        CE00FF90DA00FFB4E6003E003E005D005D007C007C009B009B00BA00BA00D900
        D900F000F000FF24FF00FF48FF00FF6CFF00FF90FF00FFB4FF002A003E003F00
        5D0054007C0069009B007E00BA009300D900AA00F000B624FF00C248FF00CE6C
        FF00DA90FF00E6B4FF0014003E001E005D0028007C0032009B003C00BA004600
        D9005500F0006D24FF008548FF009D6CFF00B590FF00CDB4FF00030303000000
        0303030300000003030303030300DA000303030300DA0003030303030300DA00
        0303030300DA0003030303030300DA000303030300DA0003030303030300DA00
        0303030300DA0003030303030300DA000303030300DA0003030300000000DA00
        0000000000DA0000000000DADADADADADADADADADADADADADA000300DADADADA
        DA0000DADADADADA00030300DADADADADA0000DADADADADA0003030300DADADA
        00030300DADADA000303030300DADADA00030300DADADA00030303030300DA00
        0303030300DA0003030303030300DA000303030300DA00030303030303030003
        0303030303000303030303030303000303030303030003030303}
    end
    object BitBtn2: TBitBtn
      Left = 323
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
    object Panel5: TPanel
      Left = 4
      Top = 4
      Width = 23
      Height = 21
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object SpeedButton4: TSpeedButton
        Left = 0
        Top = 0
        Width = 23
        Height = 21
        Flat = True
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333333388F3333333333000033334224333333333333338338F333333333
          0000333422224333333333333833338F33333333000033422222243333333333
          83333338F3333333000034222A22224333333338F33F33338F33333300003222
          A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
          38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
          2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
          0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
          333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
          33333A2224A2233333333338F338F83300003333333333A2224A333333333333
          8F338F33000033333333333A222433333333333338F338F30000333333333333
          A224333333333333338F38F300003333333333333A223333333333333338F8F3
          000033333333333333A3333333333333333383330000}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
    end
    object Panel6: TPanel
      Left = 28
      Top = 4
      Width = 23
      Height = 21
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object SpeedButton5: TSpeedButton
        Left = 0
        Top = 0
        Width = 23
        Height = 21
        Flat = True
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333333388F3333333333000033334994333333333333338338F333333333
          0000333499994333333333333833338F33333333000033499999943333333333
          83333338F3333333000034999199994333333338F33F33338F33333300003999
          1919994333333338F383F3338F333333000031919991999433333338F8333F33
          38F33333000034199999199943333338833333F3338F33330000499919999199
          9433338F338F333F3338F33300009991319991199943338F3838F338F3338F33
          00001913331999419994338F83338F338F3338F3000031333331999419994338
          333338F338F3338F0000333333331999419943333333338F338F338F00003333
          333331999419933333333338F338F83300003333333333199941333333333333
          8F338F330000333333333331999433333333333338F338F30000333333333333
          1994333333333333338F38F3000033333333333331993333333333333338F8F3
          00003333333333333313333333333333333383330000}
        NumGlyphs = 2
        OnClick = SpeedButton2Click
      end
    end
  end
  object mt: TMemoryTable
    AfterInsert = mtAfterInsert
    Left = 168
    Top = 232
    object mtID: TFloatField
      FieldName = 'ID'
    end
    object mtCHECKED: TBooleanField
      FieldName = 'CHECKED'
    end
    object mtDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 255
    end
  end
  object ds: TOraDataSource
    DataSet = mt
    Left = 176
    Top = 224
  end
  object qLoad: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select sql.id,substr(sqd.text,9) as description'
      'from exe_sql sql,exe_forms frm,exe_sql_data sqd'
      'where sql.form_id=frm.id'
      '  and sqd.sql_id=sql.id'
      '   and sql.state='#39'Y'#39' and sqd.state='#39'Y'#39
      '  and lower(frm.name)='#39'exportin1c'#39
      '  and substr(sqd.text,1,8)='#39'--$DESC='#39
      'order by description  ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 56
    Top = 144
    object qLoadID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qLoadDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 248
    end
  end
  object TimerAutoUpload: TTimer
    OnTimer = TimerAutoUploadTimer
    Left = 32
    Top = 304
  end
  object qTestAutoUpload: TOraQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select /*+ORDERED*/'
      '       rep_date,'
      '       azs_id,'
      '       azs_inst,'
      '       azs_name,'
      '       1 as count_,'
      '       decode(rash_type,'
      '              1,'
      '              '#39#39','
      '              2,'
      '              decode(ov.language, 0, '#39#1053#1077#1090#39', '#39#1053#1077#1084#1072#1108#39'),'
      '              3,'
      '              decode(ov.language,'
      '                     0,'
      '                     '#39#1055#1077#1088#1077#1087#1088#1080#1085#1103#1090#1100#39','
      '                     '#39#1055#1077#1088#1077#1087#1088#1080#1081#1085#1103#1090#1080#39')) as rash_type'
      '  from (select to_date(c.date_of, '#39'DD.MM.YYYY'#39') as rep_date,'
      '               azs.id as azs_id,'
      '               azs.inst as azs_inst,'
      '               azs.name as azs_name,'
      '               azs.obl_id,'
      '               1 as rash_type'
      '          from oil_calendar c, v_oil_azs azs'
      '         where not exists'
      '         (select *'
      '                  from oil_dr_summary s'
      '                 where s.state = '#39'Y'#39
      '                   and s.azs_id = azs.id'
      '                   and s.azs_id = azs.inst'
      '                   and s.rep_id is null'
      '                   and s.rep_inst is null'
      '                   and to_date(c.date_of, '#39'DD.MM.YYYY'#39') between'
      
        '                       trunc(s.begin_date) and trunc(s.end_date)' +
        ')'
      
        '          and to_date(c.date_of, '#39'DD.MM.YYYY'#39') between :BeginDat' +
        'e and :EndDate'
      '         minus'
      
        '        select rep_date, azs_id, azs_inst, azs_name, obl_id, 1 a' +
        's rash_type'
      '          from (select sum(nvl(rep_date_end,'
      
        '                               nvl(rep_date_next, trunc(rep_date' +
        '_start) + 1)) -'
      '                           rep_date_start) as work_date,'
      
        '                       min(decode(rep_date_next, null, 0, 1)) as' +
        ' is_rep_date_next,'
      '                       rep_date,'
      '                       azs_id,'
      '                       azs_inst,'
      '                       azs_name,'
      '                       obl_id'
      
        '                  from (select /*+ORDERED*/ dr.rep_date as rep_d' +
        'ate_start,'
      '                               dr.rep_date_end,'
      
        '                               lead(dr.rep_date) over(partition ' +
        'by dr.azs_id order by dr.rep_date) as rep_date_next,'
      '                               trunc(dr.rep_date) as rep_date,'
      '                               azs.id as azs_id,'
      '                               azs.inst as azs_inst,'
      '                               azs.name as azs_name,'
      '                               azs.obl_id'
      '                          from oil_daily_rep dr, v_oil_azs azs'
      '                         where dr.state = '#39'Y'#39
      '                           and dr.azs_id = azs.id'
      '                           and dr.azs_inst = azs.inst'
      
        '                           and trunc(rep_date) between :BeginDat' +
        'e - 10 and :EndDate + 10'
      '                           and azs.obl_id = :OrgId)'
      
        '                 group by rep_date, azs_id, azs_inst, azs_name, ' +
        'obl_id)'
      '         where (work_date > 0.80 and is_rep_date_next = 0)'
      '            or (work_date > 0.90 and is_rep_date_next = 1))'
      ' where trunc(rep_date) between :BeginDate and :EndDate'
      '   and obl_id = :OrgId'
      '   and rash_type = 1'
      '   and azs_id in (&AZSList)'
      ' order by rash_type desc, rep_date desc, azs_name')
    Left = 32
    Top = 256
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end>
    MacroData = <
      item
        Name = 'AZSList'
        Value = '1000000'
      end>
  end
end
