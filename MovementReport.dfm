inherited MovementReportForm: TMovementReportForm
  Left = 481
  Top = 216
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1053#1055' '#1087#1086' '#1073#1072#1088#1090#1077#1088#1091
  ClientHeight = 265
  ClientWidth = 260
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 88
    Width = 257
    Height = 129
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label4: TLabel
      Left = 56
      Top = 21
      Width = 40
      Height = 13
      Caption = #1055#1072#1088#1090#1080#1103':'
    end
    object Label5: TLabel
      Left = 72
      Top = 53
      Width = 24
      Height = 13
      Caption = #1053'/'#1055':'
    end
    object CBPartAll: TCheckBox
      Left = 182
      Top = 17
      Width = 41
      Height = 17
      Caption = #1042#1089#1077
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CBPartAllClick
    end
    object LENp: TRxLookupEdit
      Left = 104
      Top = 48
      Width = 65
      Height = 21
      LookupField = 'NAME'
      LookupSource = DSNp
      Enabled = False
      TabOrder = 1
      OnButtonClick = LENpButtonClick
    end
    object CBNpAll: TCheckBox
      Left = 182
      Top = 49
      Width = 41
      Height = 17
      Caption = #1042#1089#1077
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CBNpAllClick
    end
    object CB1: TCheckBox
      Left = 8
      Top = 80
      Width = 225
      Height = 17
      Caption = #1042#1082#1083#1102#1095#1072#1090#1100' '#1086#1090#1087#1091#1089#1082#1080' '#1085#1072' '#1040#1047#1057' '#1080' '#1074#1086#1079#1074#1088#1072#1090#1099
      TabOrder = 3
    end
    object cb2: TCheckBox
      Left = 8
      Top = 104
      Width = 233
      Height = 17
      Caption = #1042#1082#1083#1102#1095#1072#1090#1100' '#1074#1085#1091#1090#1088#1080#1089#1080#1089#1090#1077#1084#1085#1091#1102' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1102
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 8
    Width = 257
    Height = 73
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 7
      Height = 13
      Caption = 'C'
    end
    object Label2: TLabel
      Left = 128
      Top = 13
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object Label3: TLabel
      Left = 8
      Top = 50
      Width = 22
      Height = 13
      Caption = #1054#1088#1075':'
    end
    object DateEdit1: TDateEdit
      Left = 30
      Top = 8
      Width = 91
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 152
      Top = 8
      Width = 97
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object CEFrom: TComboEdit
      Left = 40
      Top = 44
      Width = 209
      Height = 21
      Hint = #1042' '#1101#1090#1086#1084' '#1087#1086#1083#1077' '#1091#1082#1072#1078#1080#1090#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102' '#1076#1083#1103' '#1082#1086#1090#1086#1088#1086#1081' '#1089#1090#1088#1086#1080#1090#1100#1089#1103' '#1086#1090#1095#1077#1090
      DirectInput = False
      GlyphKind = gkDropDown
      ButtonWidth = 18
      NumGlyphs = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnButtonClick = CEFromButtonClick
    end
  end
  object CMBPart: TComboEdit
    Left = 105
    Top = 103
    Width = 64
    Height = 21
    Hint = #1042' '#1101#1090#1086#1084' '#1087#1086#1083#1077' '#1091#1082#1072#1078#1080#1090#1077' '#1087#1072#1088#1090#1080#1102
    DirectInput = False
    Enabled = False
    GlyphKind = gkDropDown
    ButtonWidth = 18
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    NumGlyphs = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnButtonClick = CMBPartButtonClick
  end
  object Panel3: TPanel
    Left = 0
    Top = 224
    Width = 257
    Height = 41
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 232
    Width = 89
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      E6040000424DE604000000000000360000002800000014000000140000000100
      180000000000B004000000000000000000000000000000000000C0C0C0C0C0C0
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
  object BitBtn2: TBitBtn
    Left = 160
    Top = 232
    Width = 91
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    ModalResult = 1
    TabOrder = 5
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
  object DSNp: TOraDataSource
    DataSet = QNp
    Left = 120
    Top = 120
  end
  object QNp: TOilQuery
    SQL.Strings = (
      'select id,name'
      'from oil_np_group')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 64
    Top = 80
    object QNpID: TFloatField
      FieldName = 'ID'
    end
    object QNpNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object Q: TOilQuery
    SQL.Strings = (
      
        'select dog,substr(dog,1,2) as dog_ser,dog_date,org_name,np_type,' +
        'ss,'
      '       nb_rest_tonn,azs_rest_tonn,'
      
        '       nb_rest_tonn+azs_rest_tonn as vsego_rest_tonn,nb_rest_mon' +
        'ey+azs_rest_money as vsego_rest_sell_money,'
      '       (nb_rest_tonn+azs_rest_tonn)*ss as vsego_rest_uch_money,'
      ''
      '       nb_prih_tonn,azs_prih_tonn,'
      
        '       nb_prih_tonn+azs_prih_tonn as vsego_prih_tonn,nb_prih_ton' +
        'n*ss+azs_prih_money as vsego_prih_sell_money,'
      '       (nb_prih_tonn+azs_prih_tonn)*ss as vsego_prih_uch_money,'
      ''
      '       nb_rash_tonn,azs_rash_tonn,'
      
        '       nb_rash_tonn+azs_rash_tonn as vsego_rash_tonn,nb_rash_mon' +
        'ey+azs_rash_money as vsego_rash_sell_money,'
      '       (nb_rash_tonn+azs_rash_tonn)*ss as vsego_rash_uch_money,'
      ''
      '       nb_rest_tonn+nb_prih_tonn-nb_rash_tonn as nb_end_tonn,'
      
        '       azs_rest_tonn+azs_prih_tonn-azs_rash_tonn as azs_end_tonn' +
        ','
      
        '       nb_rest_tonn+nb_prih_tonn-nb_rash_tonn+azs_rest_tonn+azs_' +
        'prih_tonn-azs_rash_tonn as vsego_end_tonn,'
      
        '       nb_rest_money+azs_rest_money+nb_prih_tonn*ss+azs_prih_mon' +
        'ey-nb_rash_money-azs_rash_money as vsego_end_sell_money,'
      
        '       (nb_rest_tonn+nb_prih_tonn-nb_rash_tonn+azs_rest_tonn+azs' +
        '_prih_tonn-azs_rash_tonn)*ss as vsego_end_uch_money'
      ''
      'from'
      '(select /*+ORDERED USE_HASH(P,OO,NPT,NPG) USE_MERGE(A)*/'
      
        '       OO.id as org_id,OO.inst as org_inst,OO.par as par_id,OO.p' +
        'ar_inst as par_inst,OO.name as org_name,'
      
        '       NPT.name as np_type,NPG.id as np_group_id,NPG.name as np_' +
        'group,P.dog,P.dog_date,P.ss, P.own_goods,P.id as part_id,P.inst ' +
        'as part_inst,'
      
        '       sum(A.nb_rest_tonn) as nb_rest_tonn,sum(A.nb_rest_money) ' +
        'as nb_rest_money,'
      
        '       sum(A.azs_rest_tonn) as azs_rest_tonn,sum(A.azs_rest_mone' +
        'y) as azs_rest_money,'
      '       sum(A.nb_prih_tonn) as nb_prih_tonn,'
      
        '       sum(A.azs_prih_tonn) as azs_prih_tonn,sum(A.azs_prih_mone' +
        'y) as azs_prih_money,'
      
        '       sum(A.nb_rash_tonn) as nb_rash_tonn,sum(A.nb_rash_money) ' +
        'as nb_rash_money,'
      
        '       sum(A.azs_rash_tonn) as azs_rash_tonn,sum(A.azs_rash_mone' +
        'y) as azs_rash_money'
      ''
      'from oil_part P,'
      ''
      '( -- NB prihod'
      '  select /*+ORDERED USE_HASH(PR,PRD)*/'
      '    PR.to_ as to_id,PR.to_inst,PR.part_id,PR.part_inst,'
      
        '    0 as nb_rest_tonn,0 as nb_rest_money,0 as azs_rest_tonn,0 as' +
        ' azs_rest_money,'
      '    sum(fact_count) as nb_prih_tonn,'
      '    0 as azs_prih_tonn,0 as azs_prih_money,'
      
        '    0 as nb_rash_tonn,0 as nb_rash_money,0 as azs_rash_tonn,0 as' +
        ' azs_rash_money'
      'from oil_prihod PR,oil_prih_det PRD'
      'where PR.state='#39'Y'#39' and PRD.state='#39'Y'#39
      '      and PRD.prihod_id=PR.id and PRD.inst=PR.inst'
      '      and PR.date_>=:begin_date and PR.date_<=:end_date'
      'group by PR.to_,PR.to_inst,PR.part_id,PR.part_inst'
      ''
      'UNION ALL'
      ''
      '-- NB rashod'
      'select from_id,from_inst,part_id,part_inst,'
      '        0,0,0,0,0,0,0,'
      
        '        sum(count_) as nb_rash_tonn,sum(count_*price) as nb_rash' +
        '_money,'
      '        0,0'
      'from oil_rashod'
      'where state='#39'Y'#39' and date_>=:begin_date and date_<=:end_date'
      'group by from_id,from_inst,part_id,part_inst'
      ''
      'UNION ALL'
      ''
      '-- AZS prihod'
      
        'select /*+ORDERED USE_HASH(DR,DREP,R,OO)*/OO.par as to_id,OO.par' +
        '_inst as to_inst,R.part_id,R.part_inst,'
      '       0,0,0,0,0,'
      
        '       sum(DR.pr_count) as azs_prih_tonn,sum(DR.pr_litr*DR.s_pri' +
        'ce) as azs_prih_money,'
      '       0,0,0,0'
      'from oil_dr_data DR,oil_daily_rep DREP,oil_rashod R,v_org OO'
      'where DR.state='#39'Y'#39' and DREP.state='#39'Y'#39' and R.state='#39'Y'#39
      '      and DR.rep_id=DREP.id and DR.rep_inst=DREP.inst'
      '      and DR.ttn_id=R.id and DR.ttn_inst=R.inst'
      '      and DREP.azs_id=OO.id and DREP.azs_inst=OO.inst'
      
        '      and trunc(DREP.rep_date)>=:begin_date and trunc(DREP.rep_d' +
        'ate) <=:end_date and DR.oper_type=0'
      'group by OO.par,OO.par_inst,R.part_id,R.part_inst'
      ''
      'UNION ALL'
      ''
      '-- AZS rashod'
      
        'select /*+ORDERED USE_HASH(DR,DREP,R,OO)*/OO.par as to_id,OO.par' +
        '_inst as to_inst,R.part_id,R.part_inst,'
      '       0,0,0,0,0,0,0,0,0,'
      
        '       sum(nvl(DR.out_ved_count,0)+nvl(DR.out_nal_count,0)+nvl(D' +
        'R.out_talon_count,0)+nvl(DR.out_sn_count,0)+nvl(DR.out_count,0))' +
        ' as azs_rash_tonn,'
      
        '       sum(nvl(DR.out_ved_money,0)+nvl(DR.out_nal_money,0)+nvl(D' +
        'R.out_talon_money,0)+nvl(DR.out_sn_money,0)+nvl(DR.out_money,0))' +
        ' as azs_rash_money'
      'from oil_dr_data DR,oil_daily_rep DREP,oil_rashod R,v_org OO'
      'where DR.state='#39'Y'#39' and DREP.state='#39'Y'#39' and R.state='#39'Y'#39
      '      and DR.rep_id=DREP.id and DR.rep_inst=DREP.inst'
      '      and DR.ttn_id=R.id and DR.ttn_inst=R.inst'
      '      and DREP.azs_id=OO.id and DREP.azs_inst=OO.inst'
      
        '      and trunc(DREP.rep_date)>=:begin_date and trunc(DREP.rep_d' +
        'ate)<=:end_date and DR.oper_type=1'
      'group by OO.par,OO.par_inst,R.part_id,R.part_inst'
      ''
      'UNION ALL'
      ''
      '-- NB rest'
      'select to_id,to_inst,part_id,part_inst,'
      '        sum(tonn) as nb_rest_tonn,sum(money) as nb_rest_money,'
      '        0,0,0,0,0,0,0,0,0'
      'from'
      
        '    (select /*+ORDERED USE_HASH(PR,PRD,P)*/PR.to_ as to_id,PR.to' +
        '_inst,PR.part_id,PR.part_inst,sum(fact_count) as tonn,sum(fact_c' +
        'ount)*P.ss as money'
      '    from oil_prihod PR,oil_prih_det PRD,oil_part P'
      '    where PR.state='#39'Y'#39' and PRD.state='#39'Y'#39' and P.state='#39'Y'#39
      '          and PRD.prihod_id=PR.id and PRD.inst=PR.inst'
      '          and PR.part_id=P.id and PR.part_inst=P.inst'
      '          and PR.date_<:begin_date'
      '    group by PR.to_,PR.to_inst,PR.part_id,PR.part_inst,P.ss'
      ''
      '    UNION ALL'
      ''
      
        '    select from_id,from_inst,part_id,part_inst,-sum(count_) as t' +
        'onn,-sum(count_*price) as money'
      '    from oil_rashod'
      '    where state='#39'Y'#39' and date_<:begin_date'
      '    group by from_id,from_inst,part_id,part_inst)'
      'group by to_id,to_inst,part_id,part_inst'
      ''
      'UNION ALL'
      ''
      '-- AZS rest'
      'select to_id,to_inst,part_id,part_inst,'
      '        0,0,'
      '        sum(tonn) as azs_rest_tonn,sum(money) as azs_rest_money,'
      '        0,0,0,0,0,0,0'
      'from'
      
        '    (select /*+ORDERED USE_HASH(DR,DREP,R,OO)*/OO.par as to_id,O' +
        'O.par_inst as to_inst,R.part_id,R.part_inst,sum(DR.pr_count) as ' +
        'tonn,'
      '            sum(DR.pr_litr*DR.s_price) as money'
      '    from oil_dr_data DR,oil_daily_rep DREP,oil_rashod R,v_org OO'
      '    where DR.state='#39'Y'#39' and DREP.state='#39'Y'#39' and R.state='#39'Y'#39
      '          and DR.rep_id=DREP.id and DR.rep_inst=DREP.inst'
      '          and DR.ttn_id=R.id and DR.ttn_inst=R.inst'
      '          and DREP.azs_id=OO.id and DREP.azs_inst=OO.inst'
      
        '          and trunc(DREP.rep_date)<:begin_date and DR.oper_type=' +
        '0'
      '    group by OO.par,OO.par_inst,R.part_id,R.part_inst'
      ''
      '    UNION ALL'
      ''
      
        '    select /*+ORDERED USE_HASH(DR,DREP,R,OO)*/OO.par as to_id,OO' +
        '.par_inst as to_inst,R.part_id,R.part_inst,'
      
        '           -sum(nvl(DR.out_ved_count,0)+nvl(DR.out_nal_count,0)+' +
        'nvl(DR.out_talon_count,0)+nvl(DR.out_sn_count,0)+nvl(DR.out_coun' +
        't,0)) as tonn,'
      
        '           -sum(nvl(DR.out_ved_money,0)+nvl(DR.out_nal_money,0)+' +
        'nvl(DR.out_talon_money,0)+nvl(DR.out_sn_money,0)+nvl(DR.out_mone' +
        'y,0)) as money'
      '    from oil_dr_data DR,oil_daily_rep DREP,oil_rashod R,v_org OO'
      '    where DR.state='#39'Y'#39' and DREP.state='#39'Y'#39' and R.state='#39'Y'#39
      '          and DR.rep_id=DREP.id and DR.rep_inst=DREP.inst'
      '          and DR.ttn_id=R.id and DR.ttn_inst=R.inst'
      '          and DREP.azs_id=OO.id and DREP.azs_inst=OO.inst'
      
        '          and trunc(DREP.rep_date)<:begin_date and DR.oper_type=' +
        '1'
      '    group by OO.par,OO.par_inst,R.part_id,R.part_inst)'
      'group by to_id,to_inst,part_id,part_inst) A,'
      ''
      'v_org OO,oil_np_type NPT,oil_np_group NPG'
      ''
      'where P.state='#39'Y'#39
      '      and P.id=A.part_id and P.inst=A.part_inst'
      '      and OO.id=A.to_id and OO.inst=A.to_inst'
      '      and NPT.id=P.np_type and NPG.id=NPT.grp_id'
      '      and (nb_rest_tonn<>0 or azs_rest_tonn<>0 or'
      '           nb_prih_tonn<>0 or azs_prih_tonn<>0 or'
      '           nb_rash_tonn<>0 or azs_rash_tonn<>0)'
      ''
      
        'group by P.dog,P.dog_date,P.ss,OO.name,NPT.name,OO.id,OO.inst,OO' +
        '.par,OO.par_inst,P.own_goods,NPG.id,NPG.name,P.id,P.inst'
      ')'
      ' '
      ' '
      ' ')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 112
    Top = 80
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'begin_date'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'end_date'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'begin_date'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'end_date'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'begin_date'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'end_date'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'begin_date'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'end_date'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'begin_date'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'begin_date'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'begin_date'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'begin_date'
        ParamType = ptInput
      end>
    object QDOG: TStringField
      FieldName = 'DOG'
      Size = 15
    end
    object QDOG_SER: TStringField
      FieldName = 'DOG_SER'
      Size = 2
    end
    object QDOG_DATE: TDateTimeField
      FieldName = 'DOG_DATE'
    end
    object QORG_NAME: TStringField
      FieldName = 'ORG_NAME'
      Size = 100
    end
    object QNP_TYPE: TStringField
      FieldName = 'NP_TYPE'
      Size = 50
    end
    object QSS: TFloatField
      FieldName = 'SS'
    end
    object QNB_REST_TONN: TFloatField
      FieldName = 'NB_REST_TONN'
    end
    object QAZS_REST_TONN: TFloatField
      FieldName = 'AZS_REST_TONN'
    end
    object QVSEGO_REST_TONN: TFloatField
      FieldName = 'VSEGO_REST_TONN'
    end
    object QVSEGO_REST_SELL_MONEY: TFloatField
      FieldName = 'VSEGO_REST_SELL_MONEY'
    end
    object QVSEGO_REST_UCH_MONEY: TFloatField
      FieldName = 'VSEGO_REST_UCH_MONEY'
    end
    object QNB_PRIH_TONN: TFloatField
      FieldName = 'NB_PRIH_TONN'
    end
    object QAZS_PRIH_TONN: TFloatField
      FieldName = 'AZS_PRIH_TONN'
    end
    object QVSEGO_PRIH_TONN: TFloatField
      FieldName = 'VSEGO_PRIH_TONN'
    end
    object QVSEGO_PRIH_SELL_MONEY: TFloatField
      FieldName = 'VSEGO_PRIH_SELL_MONEY'
    end
    object QVSEGO_PRIH_UCH_MONEY: TFloatField
      FieldName = 'VSEGO_PRIH_UCH_MONEY'
    end
    object QNB_RASH_TONN: TFloatField
      FieldName = 'NB_RASH_TONN'
    end
    object QAZS_RASH_TONN: TFloatField
      FieldName = 'AZS_RASH_TONN'
    end
    object QVSEGO_RASH_TONN: TFloatField
      FieldName = 'VSEGO_RASH_TONN'
    end
    object QVSEGO_RASH_SELL_MONEY: TFloatField
      FieldName = 'VSEGO_RASH_SELL_MONEY'
    end
    object QVSEGO_RASH_UCH_MONEY: TFloatField
      FieldName = 'VSEGO_RASH_UCH_MONEY'
    end
    object QNB_END_TONN: TFloatField
      FieldName = 'NB_END_TONN'
    end
    object QAZS_END_TONN: TFloatField
      FieldName = 'AZS_END_TONN'
    end
    object QVSEGO_END_TONN: TFloatField
      FieldName = 'VSEGO_END_TONN'
    end
    object QVSEGO_END_SELL_MONEY: TFloatField
      FieldName = 'VSEGO_END_SELL_MONEY'
    end
    object QVSEGO_END_UCH_MONEY: TFloatField
      FieldName = 'VSEGO_END_UCH_MONEY'
    end
  end
  object Q1: TOilQuery
    SQL.Strings = (
      
        'select Org_Name,PponId,OblId,Dog,Dog_Date,partid,partinst,np_gro' +
        'up,np_group_id,ss,'
      ''
      
        '       sum(rest_tonn) as rest_tonn, sum(rest_shtuki) as rest_sht' +
        'uki, sum(rest_money) as rest_money,'
      
        '       sum(prihod_tonn) as prihod_tonn,sum(prihod_shtuki) as pri' +
        'hod_shtuki,sum(prihod_money) as prihod_money,'
      
        '       sum(rash_tonn) as rash_tonn,sum(rash_shtuki) as rash_shtu' +
        'ki,sum(rash_money) as rash_money,'
      ''
      '       sum(rest_tonn+prihod_tonn-rash_tonn) as rest_end_tonn,'
      
        '       sum(rest_shtuki+prihod_shtuki-rash_shtuki) as rest_end_sh' +
        'tuki,'
      
        '       decode(sum(rest_tonn+prihod_tonn-rash_tonn)+sum(rest_shtu' +
        'ki+prihod_shtuki-rash_shtuki),0,0,'
      
        '              sum(rest_money+prihod_money-rash_money)) as rest_e' +
        'nd_money,'
      ''
      '       sum(decode(operid,18,prihod_tonn,0)) as prc_tonn,'
      '       sum(decode(operid,18,prihod_shtuki,0)) as prc_shtuki,'
      '       sum(decode(operid,18,prihod_money,0)) as prc_money,'
      ''
      '       sum(decode(operid,57,prihod_tonn,0)) as pri_tonn,'
      '       sum(decode(operid,57,prihod_shtuki,0)) as pri_shtuki,'
      '       sum(decode(operid,57,prihod_money,0)) as pri_money,'
      ''
      '       sum(decode(operid,18,0,57,0,prihod_tonn)) as prih_tonn,'
      
        '       sum(decode(operid,18,0,57,0,prihod_shtuki)) as prih_shtuk' +
        'i,'
      '       sum(decode(operid,18,0,57,0,prihod_money)) as prih_money,'
      ''
      '       sum(decode(operid,11,rash_tonn,0)) as bnal_tonn,'
      '       sum(decode(operid,11,rash_shtuki,0)) as bnal_shtuki,'
      '       sum(decode(operid,11,rash_money,0)) as bnal_money,'
      ''
      '       sum(decode(operid,153,rash_tonn,0)) as rcard_tonn,'
      '       sum(decode(operid,153,rash_shtuki,0)) as rcard_shtuki,'
      '       sum(decode(operid,153,rash_money,0)) as rcard_money,'
      ''
      '       sum(decode(operid,12,rash_tonn,0)) as nal_tonn,'
      '       sum(decode(operid,12,rash_shtuki,0)) as nal_shtuki,'
      '       sum(decode(operid,12,rash_money,0)) as nal_money,'
      ''
      '       sum(decode(operid,14,rash_tonn,0)) as rto_tonn,'
      '       sum(decode(operid,14,rash_shtuki,0)) as rto_shtuki,'
      '       sum(decode(operid,14,rash_money,0)) as rto_money,'
      ''
      '       sum(decode(operid,18,rash_tonn,0)) as roc_tonn,'
      '       sum(decode(operid,18,rash_shtuki,0)) as roc_shtuki,'
      '       sum(decode(operid,18,rash_money,0)) as roc_money,'
      ''
      
        '       sum(decode(operid,40,decode(auto_groupid,1,rash_tonn,0),0' +
        ')) as legk_tonn,'
      
        '       sum(decode(operid,40,decode(auto_groupid,1,rash_shtuki,0)' +
        ',0)) as legk_shtuki,'
      
        '       sum(decode(operid,40,decode(auto_groupid,1,rash_money,0),' +
        '0)) as legk_money,'
      ''
      
        '       sum(decode(operid,40,decode(auto_groupid,2,rash_tonn,0),0' +
        ')) as gruz_tonn,'
      
        '       sum(decode(operid,40,decode(auto_groupid,2,rash_shtuki,0)' +
        ',0)) as gruz_shtuki,'
      
        '       sum(decode(operid,40,decode(auto_groupid,2,rash_money,0),' +
        '0)) as gruz_money,'
      ''
      
        '       sum(decode(operid,40,decode(auto_groupid,1,0,2,0,4,0,rash' +
        '_tonn),0)) as obor_tonn,'
      
        '       sum(decode(operid,40,decode(auto_groupid,1,0,2,0,4,0,rash' +
        '_shtuki),0)) as obor_shtuki,'
      
        '       sum(decode(operid,40,decode(auto_groupid,1,0,2,0,4,0,rash' +
        '_money),0)) as obor_money,'
      ''
      
        '       sum(decode(operid,6,tonn,152,tonn,51,tonn,151,tonn,49,ton' +
        'n,48,tonn,0)) as rov_tonn,'
      
        '       sum(decode(operid,6,shtuki,152,shtuki,51,shtuki,151,shtuk' +
        'i,49,shtuki,48,shtuki,0)) as rov_shtuki,'
      
        '       sum(decode(operid,6,money,152,money,51,money,151,money,49' +
        ',money,48,money,0)) as rov_money,'
      ''
      
        '       sum(decode(operid,47,rash_tonn,40,decode(auto_groupid,4,r' +
        'ash_tonn,0),0)) as roo_tonn,'
      
        '       sum(decode(operid,47,rash_shtuki,40,decode(auto_groupid,4' +
        ',rash_shtuki,0),0)) as roo_shtuki,'
      
        '       sum(decode(operid,47,rash_money,40,decode(auto_groupid,4,' +
        'rash_money,0),0)) as roo_money,'
      ''
      '       sum(decode(operid,5,rash_tonn,0)) as rob_tonn,'
      '       sum(decode(operid,5,rash_shtuki,0)) as rob_shtuki,'
      '       sum(decode(operid,5,rash_money,0)) as rob_money,'
      ''
      '       sum(decode(operid,52,rash_tonn,0)) as rop_tonn,'
      '       sum(decode(operid,52,rash_shtuki,0)) as rop_shtuki,'
      '       sum(decode(operid,52,rash_money,0)) as rop_money,'
      ''
      '       sum(decode(operid,42,rash_tonn,0)) as roz_tonn,'
      '       sum(decode(operid,42,rash_shtuki,0)) as roz_shtuki,'
      '       sum(decode(operid,42,rash_money,0)) as roz_money,'
      ''
      '       sum(decode(operid,19,rash_tonn,0)) as ron_tonn,'
      '       sum(decode(operid,19,rash_shtuki,0)) as ron_shtuki,'
      '       sum(decode(operid,19,rash_money,0)) as ron_money,'
      ''
      '       sum(decode(operid,16,rash_tonn,0)) as roe_tonn,'
      '       sum(decode(operid,16,rash_shtuki,0)) as roe_shtuki,'
      '       sum(decode(operid,16,rash_money,0)) as roe_money,'
      ''
      '       sum(decode(operid,150,rash_tonn,0)) as roi_tonn,'
      '       sum(decode(operid,150,rash_shtuki,0)) as roi_shtuki,'
      '       sum(decode(operid,150,rash_money,0)) as roi_money,'
      ''
      
        '       sum(decode(operid,12,0,11,0,18,0,150,0,16,0,14,0,40,0,6,0' +
        ',152,0,51,0,151,0,49,0,48,0,47,0,5,0,52,0,42,0,19,0,153,0,rash_t' +
        'onn)) as rpr_tonn,'
      
        '       sum(decode(operid,12,0,11,0,18,0,150,0,16,0,14,0,40,0,6,0' +
        ',152,0,51,0,151,0,49,0,48,0,47,0,5,0,52,0,42,0,19,0,153,0,rash_s' +
        'htuki)) as rpr_shtuki,'
      
        '       sum(decode(operid,12,0,11,0,18,0,150,0,16,0,14,0,40,0,6,0' +
        ',152,0,51,0,151,0,49,0,48,0,47,0,5,0,52,0,42,0,19,0,153,0,rash_m' +
        'oney)) as rpr_money'
      ''
      'from'
      ''
      '(select Q.*,'
      '       -decode(rashprih,0,0,tonn) as prihod_tonn,'
      '       -decode(rashprih,0,0,shtuki) as prihod_shtuki,'
      '       -decode(rashprih,0,0,money) as prihod_money,'
      '       decode(rashprih,0,tonn,0) as rash_tonn,'
      '       decode(rashprih,0,shtuki,0) as rash_shtuki,'
      '       decode(rashprih,0,money,0) as rash_money'
      ' from'
      
        '  (select Org_Name,PponId,OblId,Dog,Dog_Date,partid,partinst,np_' +
        'group,np_group_id,ss,rashprih,InsideNbAzs,IsInsideReal,'
      
        '         -decode(restreal,-1,tonn,0) as rest_tonn,operid,auto_gr' +
        'oupid,'
      '         -decode(restreal,-1,shtuki,0) as rest_shtuki,'
      '         -decode(restreal,-1,money,0) as rest_money,'
      '         decode(restreal,-1,0,tonn) as tonn,'
      '         decode(restreal,-1,0,shtuki) as shtuki,'
      '         decode(restreal,-1,0,money) as money'
      '   from'
      
        '     (select nvl(PponName,OblName) as Org_Name,PponId,OblId,Dog,' +
        'Dog_Date,partid,partinst,np_group,np_groupid as np_group_id,ss,'
      
        '            1 as restreal,rashprih,operid,auto_groupid,InsideNbA' +
        'zs,IsInsideReal,'
      '            tonn,shtuki,summa_ss as money'
      '      from v_oil_npmove'
      
        '      where date_ between :BeginDate and :EndDate and selltypeid' +
        '<>9 and own_goods='#39'O'#39' and operid<>56'
      
        '            and IsTalonDet<>'#39'N'#39' and IsSummary<>'#39'Y'#39' and InsideNbA' +
        'zs<>:NotInsideNbAzs and IsInsideReal<>:InsideReal'
      '      UNION ALL'
      
        '      select nvl(PponName,OblName) as Org_Name,PponId,OblId,Dog,' +
        'Dog_Date,partid,partinst,np_group,np_groupid as np_group_id,ss,'
      
        '            -1 as restreal,rashprih,operid,auto_groupid,InsideNb' +
        'Azs,IsInsideReal,'
      '            tonn,shtuki,summa_ss as money'
      '      from v_oil_npmove'
      
        '      where date_ < :BeginDate and IsSummary<>'#39'N'#39' and own_goods=' +
        #39'O'#39' and operid<>56'
      '     )'
      '  )Q'
      ')Q1'
      ''
      'where 1=1 '
      ' ')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 24
    Top = 24
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NotInsideNbAzs'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'InsideReal'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
  end
end
