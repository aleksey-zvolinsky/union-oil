inherited frmTalonsTotal: TfrmTalonsTotal
  Left = 366
  Top = 295
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1057#1074#1086#1076#1085#1099#1081' '#1087#1086' '#1076#1074#1080#1078#1077#1085#1080#1102' '#1090#1072#1083#1086#1085#1086#1074
  ClientHeight = 128
  ClientWidth = 265
  OldCreateOrder = True
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 265
    Height = 45
    Align = alTop
    Caption = #1044#1072#1090#1072
    TabOrder = 0
    object deCurDate: TDateEdit
      Left = 8
      Top = 16
      Width = 121
      Height = 21
      DefaultToday = True
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 95
    Width = 265
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object bbtClose: TBitBtn
      Left = 176
      Top = 4
      Width = 83
      Height = 25
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 1
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
    object bbtPrint: TBitBtn
      Left = 88
      Top = 4
      Width = 81
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 1
      OnClick = bbtPrintClick
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000C0C0C0C0C0C0
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
  object pnlCenter: TPanel
    Left = 0
    Top = 45
    Width = 265
    Height = 50
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object cbBadSer: TCheckBox
      Left = 8
      Top = 16
      Width = 249
      Height = 17
      Caption = #1053#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1077#1087#1088#1072#1074#1080#1083#1100#1085#1099#1077' '#1089#1077#1088#1080#1080
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
  end
  object qTalonRest: TOilQuery
    SQL.Strings = (
      'select /*+ORDERED USE_MERGE(TalMax, TalOut)*/'
      ' Dep.Name as Dep_Name,'
      ' TalMax.Nominal,'
      ' sum(TalMax.A76) as Rest_A76,'
      ' sum(TalMax.A92) as Rest_A92,'
      ' sum(TalMax.A95) as Rest_A95,'
      ' sum(TalMax.A98) as Rest_A98,'
      ' sum(TalMax.DT) as Rest_DT,'
      ' sum(TalMax.Gaz) as Rest_Gaz,'
      ' sum(TalMax.Other) as Rest_Other,'
      ' sum(1) as Rest_All,'
      ' sum(decode(Place_Code, 1, TalMax.A76, 0)) as DepRest_A76,'
      ' sum(decode(Place_Code, 1, TalMax.A92, 0)) as DepRest_A92,'
      ' sum(decode(Place_Code, 1, TalMax.A95, 0)) as DepRest_A95,'
      ' sum(decode(Place_Code, 1, TalMax.A98, 0)) as DepRest_A98,'
      ' sum(decode(Place_Code, 1, TalMax.DT, 0)) as DepRest_DT,'
      ' sum(decode(Place_Code, 1, TalMax.Gaz, 0)) as DepRest_Gaz,'
      ' sum(decode(Place_Code, 1, TalMax.Other, 0)) as DepRest_Other,'
      ' sum(decode(Place_Code, 1, 1, 0)) as DepRest_All,'
      ' sum(decode(Place_Code, 0, TalMax.A76, 0)) as ClientRest_A76,'
      ' sum(decode(Place_Code, 0, TalMax.A92, 0)) as ClientRest_A92,'
      ' sum(decode(Place_Code, 0, TalMax.A95, 0)) as ClientRest_A95,'
      ' sum(decode(Place_Code, 0, TalMax.A98, 0)) as ClientRest_A98,'
      ' sum(decode(Place_Code, 0, TalMax.DT, 0)) as ClientRest_DT,'
      ' sum(decode(Place_Code, 0, TalMax.Gaz, 0)) as ClientRest_Gaz,'
      
        ' sum(decode(Place_Code, 0, TalMax.Other, 0)) as ClientRest_Other' +
        ','
      ' sum(decode(Place_Code, 0, 1, 0)) as ClientRest_All,'
      ' sum(decode(Place_Code, 2, TalMax.A76, 0)) as Spis_A76,'
      ' sum(decode(Place_Code, 2, TalMax.A92, 0)) as Spis_A92,'
      ' sum(decode(Place_Code, 2, TalMax.A95, 0)) as Spis_A95,'
      ' sum(decode(Place_Code, 2, TalMax.A98, 0)) as Spis_A98,'
      ' sum(decode(Place_Code, 2, TalMax.DT, 0)) as Spis_DT,'
      ' sum(decode(Place_Code, 2, TalMax.Gaz, 0)) as Spis_Gaz,'
      ' sum(decode(Place_Code, 2, TalMax.Other, 0)) as Spis_Other,'
      ' sum(decode(Place_Code, 2, 1, 0)) as Spis_All'
      '  from (select /*+NO_MERGE*/'
      '         Talon_Code,'
      '         substr(max(DateCode), -1) as Place_Code,'
      '         Nominal,'
      '         decode(substr(Ser, 1, 1), '#39'A'#39', 1, 0) as A76,'
      '         decode(substr(Ser, 1, 1), '#39'B'#39', 1, 0) as A92,'
      '         decode(substr(Ser, 1, 1), '#39'C'#39', 1, 0) as A95,'
      '         decode(substr(Ser, 1, 1), '#39'E'#39', 1, 0) as A98,'
      '         decode(substr(Ser, 1, 1), '#39'D'#39', 1, 0) as DT,'
      '         decode(substr(Ser, 1, 1), '#39'F'#39', 1, 0) as Gaz,'
      '         decode(substr(Ser, 1, 1),'
      '                '#39'A'#39','
      '                0,'
      '                '#39'B'#39','
      '                0,'
      '                '#39'C'#39','
      '                0,'
      '                '#39'D'#39','
      '                0,'
      '                '#39'E'#39','
      '                0,'
      '                '#39'F'#39','
      '                0,'
      '                1) as Other'
      '          from (select Dep.Talon_Code,'
      '                       o.Ser,'
      '                       o.Num,'
      '                       o.Nominal,'
      '                       decode(Tip,'
      '                              '#39'P'#39','
      
        '                              to_char(o.Date_, '#39'YYYYMMDD'#39') || '#39'B' +
        '1'#39','
      
        '                              to_char(o.Date_, '#39'YYYYMMDD'#39') || '#39'A' +
        #39' ||'
      
        '                              decode(o.Oper_Id, 192, 2, 0)) as D' +
        'ateCode,'
      
        '                       decode(Tip, '#39'P'#39', o.Date_ + 1 / 86400, o.D' +
        'ate_) SamDate'
      '                  from V_Oil_Talon_Op o, v_org Dep'
      '                 where o.Dep_Id = Dep.Id'
      '                   and o.Dep_Inst = Dep.Inst'
      '                   and o.Date_ < :CurDate) TalMax'
      '         group by Talon_Code, Ser, Num, Nominal) TalMax,'
      '       (select /*+ORDERED NO_MERGE*/'
      '         Talon_Code, Name'
      '          from v_org'
      '         where Org_Type = 4'
      '           and Talon_Code is not null) Dep'
      ' where Dep.Talon_Code = TalMax.Talon_Code'
      ' group by Dep.Name, TalMax.Nominal')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 212
    Top = 13
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'CurDate'
      end>
  end
end
