inherited TalonPriceReport: TTalonPriceReport
  Left = 541
  Top = 266
  Width = 353
  Height = 282
  BorderIcons = [biSystemMenu]
  Caption = #1057#1074#1086#1076#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084' '#1076#1083#1103' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lBeginDate: TLabel
    Left = 6
    Top = 8
    Width = 6
    Height = 13
    Caption = #1089
  end
  object lEndDate: TLabel
    Left = 115
    Top = 8
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object lSubOrg: TLabel
    Left = 6
    Top = 37
    Width = 119
    Height = 13
    Caption = #1060#1080#1083#1090#1088#1072#1094#1080#1103' '#1087#1086' '#1092#1080#1083#1080#1072#1083#1091
    Visible = False
  end
  object SpeedButton3: TSpeedButton
    Left = 321
    Top = 51
    Width = 22
    Height = 22
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD88DDDDDDDD
      88DDDDFFDDDDDDDDFFDDDD888DDDDDD888DDDDFFFDDDDDDFFFDDDDD888DDDD88
      8DDDDDDFFFDDDDFFFDDDDDDD888DD888DDDDDDDDFFFDDFFFDDDDDDDDD888888D
      DDDDDDDDDFFFFFFDDDDDDDDDDD8888DDDDDDDDDDDDFFFFDDDDDDDDDDDD8888DD
      DDDDDDDDDDFFFFDDDDDDDDDDD888888DDDDDDDDDDFFFFFFDDDDDDDDD888DD888
      DDDDDDDDFFFDDFFFDDDDDDD888DDDD888DDDDDDFFFDDDDFFFDDDDD888DDDDDD8
      88DDDDFFFDDDDDDFFFDDDD88DDDDDDDD88DDDDFFDDDDDDDDFFDDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
    NumGlyphs = 2
    OnClick = SpeedButton3Click
  end
  object lSer: TLabel
    Left = 20
    Top = 10
    Width = 31
    Height = 13
    Caption = #1057#1077#1088#1080#1103
    Visible = False
  end
  object deBeginDate: TDateEdit
    Left = 17
    Top = 5
    Width = 91
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object deEndDate: TDateEdit
    Left = 135
    Top = 5
    Width = 91
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object rbOut: TRadioButton
    Left = 240
    Top = 20
    Width = 91
    Height = 17
    Caption = #1054#1090#1087#1091#1097#1077#1085#1085#1099#1077
    TabOrder = 2
    Visible = False
  end
  object rbPrih: TRadioButton
    Left = 240
    Top = 5
    Width = 91
    Height = 17
    Caption = #1054#1090#1086#1074#1072#1088#1077#1085#1085#1099#1077
    Checked = True
    TabOrder = 3
    TabStop = True
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 223
    Width = 345
    Height = 32
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object BitBtn1: TBitBtn
      Left = 250
      Top = 3
      Width = 91
      Height = 26
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 150
      Top = 3
      Width = 91
      Height = 26
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 1
      OnClick = BitBtn2Click
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
  object ceOrgName: TComboEdit
    Left = 6
    Top = 52
    Width = 314
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    TabOrder = 5
    OnButtonClick = ceOrgNameDblClick
    OnDblClick = ceOrgNameDblClick
  end
  object eSer: TEdit
    Left = 55
    Top = 5
    Width = 46
    Height = 21
    TabOrder = 6
    Visible = False
  end
  object qPrihPrice: TOilQuery
    SQL.Strings = (
      '--> qPrihPrice,TalonPriceReport'
      'select NPGrp_Name, Nominal, Price, Amount, Litr'
      '  from (select TalPrih.NPGrp_Name,'
      '               TalPrih.Nominal,'
      '               TalOut.Price,'
      '               count(*) as Amount,'
      '               sum(TalPrih.Nominal) as Litr,'
      '               TalOut.Auto_Id'
      '          from ( --'#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1080#1093#1086#1076#1072' '#1090#1072#1083#1086#1085#1086#1074
      '                select o.Dep_Id,'
      '                        o.Date_ as Prih_Date,'
      '                        o.Ser,'
      '                        o.Num,'
      '                        Oil_NP_Group.Name as NPGrp_Name,'
      '                        o.Nominal'
      
        '                  from V_Oil_Talon_Op o, v_org Oil_Org, Oil_NP_G' +
        'roup'
      '                 where Tip = '#39'P'#39
      '                   and o.Date_ between :BeginDate and :EndDate'
      '                   and Oil_Org.Org_Type = 8'
      '                   and o.Org_Id = Oil_Org.Id'
      '                   and o.Org_Inst = Oil_Org.Inst'
      '                   and o.NPGrp_Id = Oil_NP_Group.Id) TalPrih,'
      '               ( --'#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1090#1072#1083#1086#1085#1086#1074
      '                select TalOut.Ser,'
      '                        TalOut.Num,'
      '                        GetEqual.Prih_Date,'
      '                        TalOut.Price,'
      '                        TalOut.Auto_Id'
      '                  from v_Oil_Talon_GetEqual GetEqual,'
      
        '                        (select Date_ as Out_Date, Ser, Num, Pri' +
        'ce, Auto_Id'
      '                           from V_Oil_Talon_Op'
      '                          where Tip = '#39'O'#39') TalOut'
      '                 where TalOut.Out_Date = GetEqual.Out_Date'
      '                   and TalOut.Ser = GetEqual.Ser'
      '                   and TalOut.Num = GetEqual.Num) TalOut'
      '         where TalPrih.Prih_Date = TalOut.Prih_Date(+)'
      '           and TalPrih.Ser = TalOut.Ser(+)'
      '           and TalPrih.Num = TalOut.Num(+)'
      '           and (TalPrih.Dep_Id = :Inst or :Inst is null)'
      '         group by TalPrih.NPGrp_Name,'
      '                  TalPrih.Nominal,'
      '                  TalOut.Price,'
      '                  TalOut.Auto_Id)'
      ' where Auto_Id is null'
      ' order by 1, 2, 3')
    FetchAll = True
    AutoCalcFields = False
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 15
    Top = 135
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
        Name = 'Inst'
        ParamType = ptInput
      end>
  end
  object qOutPrice: TOilQuery
    SQL.Strings = (
      '--> qOutPrice,TalonPriceReport'
      '--'#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1090#1072#1083#1086#1085#1086#1074
      
        'select Oil_NP_Group.Name, o.Nominal, o.Price, count(*), sum(o.No' +
        'minal)'
      '  from V_Oil_Talon_Op o, v_org Oil_Org, Oil_NP_Group'
      ' where Tip = '#39'O'#39
      '   and o.Date_ between :BeginDate and :EndDate'
      '   and Oil_Org.Org_Type not in (3, 4)'
      '   and o.Org_Id = Oil_Org.Id'
      '   and o.Org_Inst = Oil_Org.Inst'
      '   and o.Auto_Id is null'
      '   and o.NPGRP_ID = Oil_NP_Group.ID'
      '   and (o.Dep_Id = :Inst or :Inst is null)'
      ' group by Oil_NP_Group.Name, o.Nominal, o.Price'
      ''
      'union all'
      ''
      '--'#1042#1099#1073#1086#1088#1082#1072' '#1074#1086#1079#1074#1088#1072#1090#1072' '#1090#1072#1083#1086#1085#1086#1074
      'select NPGrp_Name, Nominal, Price, Amount, Litr'
      '  from (select /*+ORDERED USE_MERGE(TalOut) */'
      '         TalPrih.NPGrp_Name,'
      '         TalPrih.Nominal,'
      '         TalOut.Price,'
      '         -count(*) as Amount,'
      '         -sum(TalPrih.Nominal) as Litr,'
      '         TalOut.Auto_Id'
      '          from ( --'#1042#1099#1073#1086#1088#1082#1072' '#1074#1086#1079#1074#1088#1072#1090#1072' '#1090#1072#1083#1086#1085#1086#1074
      '                select o.Dep_Id,'
      '                        o.Date_ as Prih_Date,'
      '                        o.Ser,'
      '                        o.Num,'
      '                        Oil_NP_Group.Name as NPGrp_Name,'
      '                        o.Nominal'
      
        '                  from V_Oil_Talon_Op o, v_org Oil_Org, Oil_NP_G' +
        'roup'
      '                 where Tip = '#39'P'#39
      '                   and o.Date_ between :BeginDate and :EndDate'
      '                   and Oil_Org.Org_Type not in (3, 4, 8)'
      '                   and o.Org_Id = Oil_Org.Id'
      '                   and o.Org_Inst = Oil_Org.Inst'
      '                   and o.NPGrp_Id = Oil_NP_Group.Id) TalPrih,'
      '               ( --'#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1074#1086#1079#1074#1088#1072#1097#1077#1085#1085#1099#1093' '#1090#1072#1083#1086#1085#1086#1074
      '                select /*+ORDERED NO_MERGE USE_MERGE(TalOut) */'
      '                 TalOut.Ser,'
      '                  TalOut.Num,'
      '                  GetEqual.Prih_Date,'
      '                  TalOut.Price,'
      '                  TalOut.Auto_Id'
      '                  from v_Oil_Talon_GetEqual GetEqual,'
      '                        ( --'#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1090#1072#1083#1086#1085#1086#1074
      
        '                         select Date_ as Out_Date, Ser, Num, Pri' +
        'ce, Auto_Id'
      '                           from V_Oil_Talon_Op'
      '                          where Tip = '#39'O'#39') TalOut'
      '                 where TalOut.Out_Date = GetEqual.Out_Date'
      '                   and TalOut.Ser = GetEqual.Ser'
      '                   and TalOut.Num = GetEqual.Num) TalOut'
      '         where TalPrih.Prih_Date = TalOut.Prih_Date(+)'
      '           and TalPrih.Ser = TalOut.Ser(+)'
      '           and TalPrih.Num = TalOut.Num(+)'
      '           and (TalPrih.Dep_Id = :Inst or :Inst is null)'
      '         group by TalPrih.NPGrp_Name,'
      '                  TalPrih.Nominal,'
      '                  TalOut.Price,'
      '                  TalOut.Auto_Id)'
      ' where Auto_Id is null'
      ' order by 1, 2, 3')
    FetchAll = True
    AutoCalcFields = False
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 80
    Top = 135
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
        Name = 'Inst'
      end>
  end
  object qTalReg: TOilQuery
    SQL.Strings = (
      '--> qTalReg,TalonPriceReport'
      'select *'
      'from'
      '('
      '  select'
      '    dep_name,'
      '    np_group_name,price as out_price,'
      '    sum(is_before*is_oper_out*is_out*nominal) as RestBeginOut,'
      
        '    sum(is_current*(1-q_is_rest)*(is_out-is_return)*nominal) as ' +
        'CurrentOut,'
      
        '    sum(is_current*(1-q_is_rest)*is_prih*nominal) as CurrentPrih' +
        ','
      '    sum(is_rest_full*is_oper_out*is_out*nominal) as RestEndOut,'
      '    sum(is_before*is_prih*nominal) as RestBeginPrih,'
      '    sum(is_rest_full*is_prih*nominal) as RestEndPrih,'
      '    is_rest*q_is_rest*is_prih as order1'
      '  from'
      '    (select v2.*,'
      '      q_is_rest*decode(rnum,1,1,0) as is_rest,'
      '      q_is_rest*decode(rnum_full,1,1,0) as is_rest_full,'
      '      decode(oper_id,181,1,0) as is_return,'
      '      decode(oper_id,190,1,0) as is_oper_out,'
      '      npg.name as np_group_name,'
      '      odep.name as dep_name'
      '    from'
      '     (select v1.*,'
      
        '        row_number() over (partition by is_before,q_is_rest,ser,' +
        'num order by date_ desc, tip desc) rnum,'
      
        '        row_number() over (partition by q_is_rest,ser,num order ' +
        'by date_ desc, tip desc) rnum_full,'
      '        decode(tip,'#39'O'#39',1,0) as is_out,'
      '        decode(tip,'#39'P'#39',1,0) as is_prih,'
      '        decode(tip,'#39'P'#39',to_id,'#39'O'#39',from_id) as dep_id,'
      '        1-is_before as is_current'
      '      from'
      
        '        (select -- '#1086#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1080' '#1085#1072' '#1082#1086#1085#1077#1094', '#1085#1072' '#1088#1091#1082#1072#1093' '#1080' '#1074' '#1082#1072 +
        #1089#1089#1077
      '           tip,oper_id,'
      '           decode(tip,'#39'P'#39',to_number(null),price) as price,'
      '           nominal,'
      '           from_id,to_id,date_,ser,num,npgrp_id,'
      
        '           decode(sign(date_-to_date(:BeginDate)),-1,1,0) as is_' +
        'before,'
      '           1 as q_is_rest'
      '         from v_oil_talon_op_un v'
      '         where date_<=:EndDate'
      '         union all'
      '         select -- '#1086#1090#1087#1091#1089#1082#1080' '#1080' '#1087#1088#1080#1093#1086#1076#1099' '#1079#1072' '#1087#1077#1088#1080#1086#1076
      '           tip,oper_id,'
      '           decode(tip,'#39'O'#39',price,'
      '             decode(prev_is_filial,is_filial,'
      '               decode(prev_oper_id,200,price_azs,prev_price)'
      '               ,price_azs)'
      '           ) as price,'
      '           nominal,'
      '           from_id,to_id,date_,ser,num,npgrp_id,'
      '           0 as is_before,'
      '           0 as q_is_rest'
      '         from v_oil_talon_sropl_un v'
      '         where date_ between :BeginDate and :EndDate'
      '           and not oper_id in (199,200)'
      '        ) v1'
      '      ) v2, oil_org odep, oil_np_group npg'
      '    where v2.dep_id=odep.id and odep.id=odep.inst'
      '      and (rnum=1 or is_before=0)'
      '      and (:inst in (odep.id,odep.par) or :inst is null)'
      '      and v2.npgrp_id=npg.id'
      '    ) v3'
      
        '  group by dep_name,np_group_name,price,is_rest*q_is_rest*is_pri' +
        'h'
      ')'
      
        'where (restbeginout<>0 or currentout<>0 or currentprih<>0 or res' +
        'tendout<>0'
      '  or restbeginprih<>0 or restendprih<>0)'
      '')
    FetchAll = True
    AutoCalcFields = False
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 220
    Top = 135
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
        Name = 'Inst'
      end>
  end
  object qTalonDelta: TOilQuery
    SQL.Strings = (
      '--> qTalonDelta,TalonPriceReport'
      
        'select Dep_Name, Dog, Dog_Date, NP_Name, SS, Price, Weight, Litr' +
        ', SS_Amount'
      '  from (select R.Dep_Name,'
      '               R.Dog,'
      '               R.Dog_Date,'
      '               R.NP_Type as NP_NAME,'
      '               R.SS,'
      '               Round(TalOut.Price * 5 / 6, 4) as Price,'
      '               sum(R.Count_T) as Weight,'
      '               sum(R.Litr) as Litr,'
      '               sum(R.SS_Amount) as SS_Amount,'
      '               TalOut.Auto_Id'
      '          from (select o.Name as Dep_Name,'
      '                       Ser,'
      '                       srt.Num,'
      '                       Litr,'
      '                       Count_T,'
      '                       Round(SS * Count_T, 2) as SS_Amount,'
      '                       SS,'
      '                       date_,'
      '                       Dog,'
      '                       Dog_Date,'
      '                       NP_Type'
      '                  from v_Oil_Talon_Srt srt,'
      '                       v_org o,'
      '                       (select Id, Inst, Name'
      '                          from v_org'
      '                         where Id = :DepId'
      '                           and Inst = :DepInst'
      '                        union all'
      '                        select Id, Inst, Name'
      '                          from v_org'
      '                         where Par = :DepId'
      '                           and Par_Inst = :DepInst) Dep'
      '                 where date_ between :BeginDate and :EndDate'
      '                   and srep_Inst = o.Id'
      '                   and srep_Inst = o.Inst'
      '                   and srep_Inst = Dep.Id'
      '                   and srep_Inst = Dep.Inst) R,'
      '               v_Oil_Talon_GetEqual GetEqual,'
      
        '               (select * from V_Oil_Talon_Op where Tip = '#39'O'#39') Ta' +
        'lOut'
      '         where R.date_ = GetEqual.Prih_Date(+)'
      '           and R.Ser = GetEqual.Ser(+)'
      '           and R.Num = GetEqual.Num(+)'
      '           and TalOut.Date_(+) = GetEqual.Out_Date'
      '           and TalOut.Ser(+) = GetEqual.Ser'
      '           and TalOut.Num(+) = GetEqual.Num'
      '         group by R.Dep_Name,'
      '                  R.Dog,'
      '                  R.Dog_Date,'
      '                  R.NP_Type,'
      '                  R.SS,'
      '                  TalOut.Price,'
      '                  TalOut.Auto_Id)'
      ' where Auto_Id is null')
    FetchAll = True
    AutoCalcFields = False
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 16
    Top = 188
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
  end
  object qTalonCollect: TOilQuery
    SQL.Strings = (
      '--> qTalonCollect,TalonPriceReport'
      
        'select /*+ORDERED USE_HASH(Oil_Daily_Rep, Oil_DR_Money, AZS, Fil' +
        'ial)*/'
      '       Filial.Name,'
      '       AZS.Name,'
      '       Oil_Daily_Rep.Rep_Date,'
      '       Oil_Daily_Rep.Smena_Num,'
      '       Oil_DR_Money.SM_Start,'
      '       Oil_DR_Money.SM_Get,'
      '       Oil_DR_Money.SM_Out,'
      '       Oil_DR_Money.SM_End,'
      '       Oil_DR_Money.SM_Polis_Get'
      '  from Oil_Daily_Rep, Oil_DR_Money, v_org AZS, v_org Filial'
      ' where Oil_Daily_Rep.State = '#39'Y'#39
      '   and Oil_DR_Money.State = '#39'Y'#39
      '   and trunc(Oil_Daily_Rep.Rep_Date) >= :BeginDate'
      '   and trunc(Oil_Daily_Rep.Rep_Date) <= :EndDate'
      '   and Oil_Daily_Rep.Id = Oil_DR_Money.Rep_Id'
      '   and Oil_Daily_Rep.Inst = Oil_DR_Money.Rep_Inst'
      '   and Oil_Daily_Rep.AZS_Id = AZS.Id'
      '   and Oil_Daily_Rep.AZS_Inst = AZS.Inst'
      '   and AZS.Par = Filial.Id'
      '   and AZS.Par_Inst = Filial.Inst'
      '   and (AZS.Par = :Inst or :Inst is null)'
      
        ' order by Filial.Name, AZS.Name, Oil_Daily_Rep.Rep_Date, Oil_Dai' +
        'ly_Rep.Smena_Num'
      '       '
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    FetchAll = True
    AutoCalcFields = False
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 81
    Top = 188
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
        Name = 'Inst'
      end>
  end
  object qTalonDK: TOilQuery
    SQL.Strings = (
      '--> qTalonDK,TalonPriceReport'
      '--'#1048#1090#1086#1075#1086#1074#1072#1103' '#1074#1099#1073#1086#1088#1082#1072
      'select Dep_Name,'
      '       Org_Name,'
      '       Org_OKPO,'
      
        '       decode(sign(sum(BeginSaldo)), -1, abs(sum(BeginSaldo)), n' +
        'ull) as BeginDebet,'
      
        '       decode(sign(sum(BeginSaldo)), 1, abs(sum(BeginSaldo)), nu' +
        'll) as BeginKredit,'
      '       sum(Debet) as Debet,'
      '       sum(Kredit) as Kredit,'
      
        '       decode(sign(sum(EndSaldo)), -1, abs(sum(EndSaldo)), null)' +
        ' as EndDebet,'
      
        '       decode(sign(sum(EndSaldo)), 1, abs(sum(EndSaldo)), null) ' +
        'as EndKredit'
      
        '  from ( --'#1042#1099#1073#1086#1088#1082#1072' '#1086#1087#1083#1072#1090#1099' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1089#1090#1072#1090#1082#1072' '#1085#1072' '#1085#1072#1095#1072 +
        #1083#1086
      '        select /*+ORDERED USE_HASH(Dep, Oil_Money, Org) */'
      '         Dep.Name as Dep_Name,'
      '          Org.Name as Org_Name,'
      '          Org.Id_Num as Org_OKPO,'
      '          Oil_Money.Money as BeginSaldo,'
      '          to_number(null) as Debet,'
      '          to_number(null) as Kredit,'
      '          to_number(null) as EndSaldo'
      '          from (select Id, Inst, Name'
      '                   from v_org'
      '                  where Id = :DepId'
      '                    and Inst = :DepInst'
      '                 union all'
      '                 select Id, Inst, Name'
      '                   from v_org'
      '                  where Par = :DepId'
      '                    and Par_Inst = :DepInst) Dep,'
      '                Oil_Money,'
      '                v_org Org'
      '         where Dep.Id = Oil_Money.Dep_Id'
      '           and Dep.Inst = Oil_Money.Dep_Inst'
      '           and Oil_Money.Org_Id = Org.Id'
      '           and Oil_Money.Org_Inst = Org.Inst'
      '           and Oil_Money.Goal_Part_Type = 8'
      '           and Oil_Money.MDate < :BeginDate'
      '        '
      '        union all'
      '        '
      
        '        --'#1042#1099#1073#1086#1088#1082#1072' '#1086#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1103' '#1090#1072#1083#1086#1085#1086#1074' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1089#1090#1072#1090#1082#1072' '#1085#1072' '#1085#1072 +
        #1095#1072#1083#1086
      '        select /*+ORDERED USE_MERGE(TalOut, GetEqual) */'
      '         TalOut.Dep_Name,'
      '         nvl(TalOut.Org_Name,'
      '             '#39'<'#1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100' '#1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085'>'#39'),'
      '         TalOut.Org_OKPO,'
      '         -TalPrih.Litr * TalOut.Price,'
      '         to_number(null),'
      '         to_number(null),'
      '         to_number(null)'
      '          from ( --'#1042#1099#1073#1086#1088#1082#1072' '#1086#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1103' '#1090#1072#1083#1086#1085#1086#1074
      
        '                select /*+ORDERED NO_MERGE USE_HASH(DailyRep, DR' +
        'Data, SRTal)*/'
      '                 SRTal.Ser,'
      '                  SRTal.Num,'
      '                  SRTal.Litr,'
      '                  trunc(DailyRep.Rep_Date) as Prih_Date'
      '                  from (select Id, Inst'
      '                           from v_org'
      '                          where Id = :DepId'
      '                            and Inst = :DepInst'
      '                         union all'
      '                         select Id, Inst'
      '                           from v_org'
      '                          where Par = :DepId'
      '                            and Par_Inst = :DepInst) Dep,'
      '                        Oil_Daily_Rep DailyRep,'
      '                        Oil_DR_Data DRData,'
      '                        OIL_SRTalon SRTal'
      '                 where DRData.State = '#39'Y'#39
      '                   and SRTal.State = '#39'Y'#39
      '                   and DailyRep.Id = DRData.REP_ID'
      '                   and DailyRep.Inst = DRData.REP_Inst'
      '                   and DRData.ID = SRTal.SRep_Id'
      '                   and DRData.INST = SRTal.SRep_Inst'
      '                   and trunc(DailyRep.Rep_Date) < :BeginDate'
      '                   and DailyRep.Inst = Dep.Id'
      '                   and DailyRep.Inst = Dep.Inst) TalPrih,'
      '               v_Oil_Talon_GetEqual GetEqual,'
      '               ( --'#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1090#1072#1083#1086#1085#1086#1074
      '                select o.Auto_Id,'
      '                        o.Date_ as Out_Date,'
      '                        o.Ser,'
      '                        o.Num,'
      '                        o.Price,'
      '                        Org.Id as Org_Id,'
      '                        Org.Inst as Org_Inst,'
      '                        Org.Name as Org_Name,'
      '                        Org.Id_Num as Org_OKPO,'
      '                        Dep.Name as Dep_Name'
      '                  from V_Oil_Talon_Op o, v_org Org, Oil_Org Dep'
      '                 where Tip = '#39'O'#39
      '                   and o.Org_Id = Org.Id'
      '                   and o.Org_Inst = Org.Inst'
      '                   and o.Dep_Id = Dep.Id'
      '                   and o.Dep_Inst = Dep.Inst) TalOut'
      '         where TalPrih.Prih_Date = GetEqual.Prih_Date'
      '           and TalPrih.Ser = GetEqual.Ser'
      '           and TalPrih.Num = GetEqual.Num'
      '           and TalOut.Out_Date = GetEqual.Out_Date'
      '           and TalOut.Ser = GetEqual.Ser'
      '           and TalOut.Num = GetEqual.Num'
      '           and TalOut.Auto_Id is null'
      '        '
      '        union all'
      '        '
      '        --'#1042#1099#1073#1086#1088#1082#1072' '#1086#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1103' '#1090#1072#1083#1086#1085#1086#1074
      '        select /*+ORDERED USE_MERGE(TalOut, GetEqual) */'
      '         TalOut.Dep_Name,'
      '         nvl(TalOut.Org_Name,'
      '             '#39'<'#1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100' '#1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085'>'#39'),'
      '         TalOut.Org_OKPO,'
      '         to_number(null),'
      '         TalPrih.Litr * TalOut.Price,'
      '         to_number(null),'
      '         to_number(null)'
      
        '          from (select /*+ORDERED NO_MERGE USE_HASH(DailyRep, DR' +
        'Data, SRTal)*/'
      '                 SRTal.Ser,'
      '                 SRTal.Num,'
      '                 SRTal.Litr,'
      '                 trunc(DailyRep.Rep_Date) as Prih_Date'
      '                  from (select Id, Inst'
      '                          from v_org'
      '                         where Id = :DepId'
      '                           and Inst = :DepInst'
      '                        union all'
      '                        select Id, Inst'
      '                          from v_org'
      '                         where Par = :DepId'
      '                           and Par_Inst = :DepInst) Dep,'
      '                       Oil_Daily_Rep DailyRep,'
      '                       Oil_DR_Data DRData,'
      '                       OIL_SRTalon SRTal'
      '                 where DRData.State = '#39'Y'#39
      '                   and SRTal.State = '#39'Y'#39
      '                   and DailyRep.Id = DRData.REP_ID'
      '                   and DailyRep.Inst = DRData.REP_Inst'
      '                   and DRData.ID = SRTal.SRep_Id'
      '                   and DRData.INST = SRTal.SRep_Inst'
      '                   and trunc(DailyRep.Rep_Date) >= :BeginDate'
      '                   and trunc(DailyRep.Rep_Date) <= :EndDate'
      '                   and DailyRep.Inst = Dep.Id'
      '                   and DailyRep.Inst = Dep.Inst) TalPrih,'
      '               v_Oil_Talon_GetEqual GetEqual,'
      '               (select o.Auto_Id,'
      '                       o.Date_ as Out_Date,'
      '                       o.Ser,'
      '                       o.Num,'
      '                       o.Price,'
      '                       Org.Id as Org_Id,'
      '                       Org.Inst as Org_Inst,'
      '                       Org.Name as Org_Name,'
      '                       Org.Id_Num as Org_OKPO,'
      '                       Dep.Name as Dep_Name'
      '                  from V_Oil_Talon_Op o, v_org Org, Oil_Org Dep'
      '                 where Tip = '#39'O'#39
      '                   and o.Org_Id = Org.Id'
      '                   and o.Org_Inst = Org.Inst'
      '                   and o.Dep_Id = Dep.Id'
      '                   and o.Dep_Inst = Dep.Inst) TalOut'
      '         where TalPrih.Prih_Date = GetEqual.Prih_Date'
      '           and TalPrih.Ser = GetEqual.Ser'
      '           and TalPrih.Num = GetEqual.Num'
      '           and TalOut.Out_Date = GetEqual.Out_Date'
      '           and TalOut.Ser = GetEqual.Ser'
      '           and TalOut.Num = GetEqual.Num'
      '           and TalOut.Auto_Id is null'
      '        '
      '        union all'
      '        '
      '        --'#1042#1099#1073#1086#1088#1082#1072' '#1086#1087#1083#1072#1090#1099' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084
      '        select /*+ORDERED USE_HASH(Dep, Oil_Money, Org) */'
      '         Dep.Name,'
      '         Org.Name,'
      '         Org.Id_Num,'
      '         to_number(null),'
      '         to_number(null),'
      '         Oil_Money.Money,'
      '         to_number(null)'
      '          from (select Id, Inst, Name'
      '                  from v_org'
      '                 where Id = :DepId'
      '                   and Inst = :DepInst'
      '                union all'
      '                select Id, Inst, Name'
      '                  from v_org'
      '                 where Par = :DepId'
      '                   and Par_Inst = :DepInst) Dep,'
      '               Oil_Money,'
      '               v_org Org'
      '         where Dep.Id = Oil_Money.Dep_Id'
      '           and Dep.Inst = Oil_Money.Dep_Inst'
      '           and Oil_Money.Org_Id = Org.Id'
      '           and Oil_Money.Org_Inst = Org.Inst'
      '           and Oil_Money.Goal_Part_Type = 8'
      '           and Oil_Money.MDate >= :BeginDate'
      '           and Oil_Money.MDate <= :EndDate'
      '        '
      '        union all'
      '        '
      '        --'#1042#1099#1073#1086#1088#1082#1072' '#1086#1087#1083#1072#1090#1099' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1089#1090#1072#1090#1082#1072' '#1085#1072' '#1082#1086#1085#1077#1094
      '        select /*+ORDERED USE_HASH(Dep, Oil_Money, Org) */'
      '         Dep.Name as Dep_Name,'
      '         Org.Name as Org_Name,'
      '         Org.Id_Num as Org_OKPO,'
      '         to_number(null),'
      '         to_number(null),'
      '         to_number(null),'
      '         Oil_Money.Money'
      '          from (select Id, Inst, Name'
      '                  from v_org'
      '                 where Id = :DepId'
      '                   and Inst = :DepInst'
      '                union all'
      '                select Id, Inst, Name'
      '                  from v_org'
      '                 where Par = :DepId'
      '                   and Par_Inst = :DepInst) Dep,'
      '               Oil_Money,'
      '               v_org Org'
      '         where Dep.Id = Oil_Money.Dep_Id'
      '           and Dep.Inst = Oil_Money.Dep_Inst'
      '           and Oil_Money.Org_Id = Org.Id'
      '           and Oil_Money.Org_Inst = Org.Inst'
      '           and Oil_Money.Goal_Part_Type = 8'
      '           and Oil_Money.MDate <= :EndDate'
      '        '
      '        union all'
      '        '
      
        '        --'#1042#1099#1073#1086#1088#1082#1072' '#1086#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1103' '#1090#1072#1083#1086#1085#1086#1074' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1089#1090#1072#1090#1082#1072' '#1085#1072' '#1082#1086 +
        #1085#1077#1094
      '        select /*+ORDERED USE_MERGE(TalOut, GetEqual) */'
      '         TalOut.Dep_Name,'
      '         nvl(TalOut.Org_Name,'
      '             '#39'<'#1055#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100' '#1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085'>'#39'),'
      '         TalOut.Org_OKPO,'
      '         to_number(null),'
      '         to_number(null),'
      '         to_number(null),'
      '         -TalPrih.Litr * TalOut.Price'
      '          from ( --'#1042#1099#1073#1086#1088#1082#1072' '#1086#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1103' '#1090#1072#1083#1086#1085#1086#1074
      
        '                select /*+ORDERED NO_MERGE USE_HASH(DailyRep, DR' +
        'Data, SRTal)*/'
      '                 SRTal.Ser,'
      '                  SRTal.Num,'
      '                  SRTal.Litr,'
      '                  trunc(DailyRep.Rep_Date) as Prih_Date'
      '                  from (select Id, Inst'
      '                           from v_org'
      '                          where Id = :DepId'
      '                            and Inst = :DepInst'
      '                         union all'
      '                         select Id, Inst'
      '                           from v_org'
      '                          where Par = :DepId'
      '                            and Par_Inst = :DepInst) Dep,'
      '                        Oil_Daily_Rep DailyRep,'
      '                        Oil_DR_Data DRData,'
      '                        OIL_SRTalon SRTal'
      '                 where DRData.State = '#39'Y'#39
      '                   and SRTal.State = '#39'Y'#39
      '                   and DailyRep.Id = DRData.REP_ID'
      '                   and DailyRep.Inst = DRData.REP_Inst'
      '                   and DRData.ID = SRTal.SRep_Id'
      '                   and DRData.INST = SRTal.SRep_Inst'
      '                   and trunc(DailyRep.Rep_Date) <= :EndDate'
      '                   and DailyRep.Inst = Dep.Id'
      '                   and DailyRep.Inst = Dep.Inst) TalPrih,'
      '               v_Oil_Talon_GetEqual GetEqual,'
      '               ( --'#1042#1099#1073#1086#1088#1082#1072' '#1087#1088#1086#1076#1072#1078#1080' '#1090#1072#1083#1086#1085#1086#1074
      '                select o.Auto_Id,'
      '                        o.Date_ as Out_Date,'
      '                        o.Ser,'
      '                        o.Num,'
      '                        o.Price,'
      '                        Org.Id as Org_Id,'
      '                        Org.Inst as Org_Inst,'
      '                        Org.Name as Org_Name,'
      '                        Org.Id_Num as Org_OKPO,'
      '                        Dep.Name as Dep_Name'
      '                  from V_Oil_Talon_Op o, v_org Org, Oil_Org Dep'
      '                 where Tip = '#39'O'#39
      '                   and o.Org_Id = Org.Id'
      '                   and o.Org_Inst = Org.Inst'
      '                   and o.Dep_Id = Dep.Id'
      '                   and o.Dep_Inst = Dep.Inst) TalOut'
      '         where TalPrih.Prih_Date = GetEqual.Prih_Date'
      '           and TalPrih.Ser = GetEqual.Ser'
      '           and TalPrih.Num = GetEqual.Num'
      '           and TalOut.Out_Date = GetEqual.Out_Date'
      '           and TalOut.Ser = GetEqual.Ser'
      '           and TalOut.Num = GetEqual.Num'
      '           and TalOut.Auto_Id is null)'
      ' group by Dep_Name, Org_Name, Org_OKPO')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 145
    Top = 135
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
  end
  object qCardDelta: TOilQuery
    SQL.Strings = (
      '--> qCardDelta,TalonPriceReport'
      ' select Filial_Name,'
      '        Part,'
      '        Part_Date,'
      '        NP_Name,'
      '        SS_Price,'
      '        Term_Price,'
      '        Rec_Price,'
      '        sum(Litr) as Litr,'
      '        sum(Weight) as Weight,'
      '        sum(Rec_Amount) as Rec_Amount '
      '   from (select /*+ORDERED*/'
      '                CS_Equal.Auto_Id,'
      '                CS_Equal.Filial_Name,'
      '                CS_Equal.Part_Dog as Part,'
      '                CS_Equal.Part_Date,'
      '                CS_Equal.NP_Name,'
      '                CS_Equal.Part_SS as SS_Price,'
      '                to_number(null) as Term_Price,'
      '                CS_Equal.Price as Rec_Price,'
      '                CS_Equal.Litr,'
      '                CS_Equal.Weight,'
      '                CS_Equal.Dog_Amount as Rec_Amount'
      '           from v_Card_SR_Equal CS_Equal,'
      
        '                (select Id, Inst from v_org where Id = :DepId or' +
        ' Inst = :DepInst'
      '                  union all'
      
        '                 select Id, Inst from v_org where Par = :DepId o' +
        'r Par_Inst = :DepInst) Dep'
      '          where (CS_Equal.Client_Id = :OrgId or :OrgId = 0)'
      
        '            and (CS_Equal.Client_Inst = :OrgInst or :OrgInst = 0' +
        ')'
      '            and emitent_obl_id = azs_obl_id '
      '            and trunc(CS_Equal.Rep_Date) >= :BeginDate'
      '            and trunc(CS_Equal.Rep_Date) <= :EndDate'
      '            and CS_Equal.Filial_Id = Dep.Id'
      '            and CS_Equal.Filial_Inst = Dep.Inst'
      '            and CS_Equal.CardAlign = 0'
      ''
      '          union all'
      ''
      
        '         select /*+ORDERED NO_MERGE USE_HASH(Card_Expense, Dep) ' +
        'USE_NL(Filial, AZS, Oil_NP_Group, Emitent)*/'
      '                Card_Expense.Auto_Id,'
      '                Filial.Name as Filial_Name,'
      '                to_char(null) as Part,'
      '                to_date(null) as Part_Date,'
      '                Oil_NP_Group.Name as NP_Name,'
      '                to_number(null) as SS_Price,'
      '                Card_Expense.Term_Price,'
      '                Card_Expense.Price as Rec_Price,'
      '                Card_Expense.Litr,'
      '                to_number(null) as Weight,'
      '                Card_Expense.Amount'
      
        '           from v_Card_Equal Card_Expense, Oil_NP_Group, v_org E' +
        'mitent, v_org AZS, v_org Filial,'
      
        '                 (select Id, Inst from v_org where Id = :DepId o' +
        'r Inst = :DepInst'
      '                   union all'
      
        '                  select Id, Inst from v_org where Par = :DepId ' +
        'or Par_Inst = :DepInst) Dep'
      '          where (Card_Expense.To_Id = :OrgId or :OrgId = 0)'
      
        '            and (Card_Expense.To_Inst = :OrgInst or :OrgInst = 0' +
        ')'
      '            and trunc(Card_Expense.Oper_Date) >= :BeginDate'
      '            and trunc(Card_Expense.Oper_Date) <= :EndDate'
      
        '            and Card.GetDep(Card_Expense.Card_Number, Card_Expen' +
        'se.Date_) = Emitent.Id and Emitent.Id = Emitent.Inst '
      '            and Card_Expense.AZS_Id = AZS.Id'
      '            and Card_Expense.AZS_Id = AZS.Inst'
      '            and AZS.Par = Filial.Id'
      '            and AZS.Par_Inst = Filial.Inst'
      '            and Emitent.Id = Dep.Id'
      '            and Emitent.Inst = Dep.Inst'
      '            and Card_Expense.CardAlign = 0'
      '            and Card_Expense.NP_Type = Oil_NP_Group.Petrol_Id'
      '            and Card_Expense.Is_Alien_AZS = 1  )'
      '  where Auto_Id is null'
      
        '  group by Filial_Name, NP_Name, Part, Part_Date, SS_Price, Rec_' +
        'Price, Term_Price'
      
        '  order by Filial_Name, NP_Name, Part, Part_Date, SS_Price, Rec_' +
        'Price, Term_Price'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 144
    Top = 193
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DepId'
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
  end
  object qCheckCardSR: TOilQuery
    SQL.Strings = (
      '--> qCheckCardSR,TalonPriceReport'
      
        ' select Title || '#39' '#39' || AZS_Name || '#39' '#39' || trunc(Rep_Date) || '#39' ' +
        #39' || NP_Name || '#39' '#1085#1072' '#39' || Litr || '#39' '#1083#1080#1090#1088#1086#1074#39' as Title'
      '   from v_Check_Card_SR'
      '  where trunc(Rep_Date) >= :BeginDate'
      '    and trunc(Rep_Date) <= :EndDate'
      ' ')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 225
    Top = 185
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
  end
end
