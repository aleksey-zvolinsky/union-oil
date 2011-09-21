object Dbplan: TDbplan
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 361
  Top = 198
  Height = 479
  Width = 741
  object qGrpDensity: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select npg.name,dns.date_,dns.density'
      'from oil_grp_density dns,oil_np_group npg'
      'where dns.npgroup_id=npg.id'
      'order by name,date_')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 120
    Top = 56
    object qGrpDensityNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object qGrpDensityDATE_: TDateTimeField
      FieldName = 'DATE_'
    end
    object qGrpDensityDENSITY: TFloatField
      FieldName = 'DENSITY'
    end
  end
  object qDopGroups: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      
        'select id,name,substr(value,pos2,instr(value,'#39','#39',pos2)-pos2) as ' +
        'groupname'
      'from'
      
        '   (select id,name,value,instr(value,'#39':'#39',pos-length(value))+1 as' +
        ' pos2'
      '    from'
      
        '      (select id,name,value,instr(var.value,'#39','#39'||npt.id||'#39','#39') as' +
        ' pos'
      '       from oil_np_type npt,'
      
        '            (select value from oil_var where name='#39'DOP_NP_GROUPS' +
        #39') var'
      '       where instr(var.value,'#39','#39'||npt.id||'#39','#39')<>0'
      '      )'
      '   )'
      'order by groupname')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 120
    Top = 8
  end
  object qOperList: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'SELECT name, id'
      'FROM oil_oper_type'
      'WHERE state='#39'Y'#39
      'ORDER BY name')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 120
    Top = 101
  end
  object qKP_Alien: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select decode(crash.co,0,decode(Q.co,0,1,Q1.co/Q.co),1) as d'
      'from'
      '(select count(*) as co'
      ' from oil_org_det'
      ' where org_id<>inst and state='#39'Y'#39
      '       and konk_show='#39'Y'#39
      ') Q,'
      '(select count(*) as co'
      ' from'
      '   (select distinct org_id,org_inst'
      '    from oil_konk_price'
      '    where state='#39'Y'#39' and inst=:dep_id and date_=:date_'
      '   )'
      ') Q1,'
      '(select count(*) as co'
      '        from oil_kp_crash'
      '        where dep_id=:dep_id and state='#39'Y'#39' and crash_type=1'
      '              and :date_ between start_date and end_date'
      '       ) crash'
      ''
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 41
    Top = 148
    ParamData = <
      item
        DataType = ftInteger
        Name = 'dep_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end>
  end
  object qKP_Own: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select oo.id, oo.name'
      '  from (select id'
      '          from (select orgs.id, knk.org_id'
      '                  from (select id'
      '                          from (select oo.*,'
      '                                       oo1.par as grand_id,'
      '                                       odet.konk_show'
      '                                  from oil_org     oo,'
      '                                       oil_org     oo1,'
      '                                       oil_org_det odet'
      '                                 where oo.state = '#39'Y'#39
      '                                   and oo1.state = '#39'Y'#39
      '                                   and oo.par = oo1.id(+)'
      '                                   and oo.par_inst = oo1.inst(+)'
      '                                   and oo.id = oo.inst'
      '                                   and oo1.id(+) = oo1.inst(+)'
      '                                   and oo.org_type in (3, 4, 8)'
      '                                   and odet.org_id(+) = oo.id'
      '                                   and odet.inst(+) = oo.inst)'
      '                         where :dep_id in (id, par, grand_id)'
      '                           and not'
      
        '                                (org_type = 3 and (substr(name, ' +
        '1, 3) = '#39#1040#1047#1057#39' or'
      '                                substr(name, 1, 4) = '#39#1040#1043#1047#1057#39'))'
      
        '                           and (:dep_id not in (7, 12, 19, 37, 1' +
        '38, 149, 201) or'
      '                               konk_show = '#39'Y'#39')) orgs,'
      '                       '
      '                       (select distinct org_id'
      '                          from oil_konk_price'
      '                         where inst = :dep_id'
      '                           and date_ = :date_'
      '                           and org_id = org_inst) knk,'
      '                       '
      '                       (select count(*) as co'
      '                          from oil_kp_crash'
      '                         where dep_id = :dep_id'
      '                           and state = '#39'Y'#39
      '                           and crash_type = 1'
      
        '                           and :date_ between start_date and end' +
        '_date) crash'
      '                '
      '                 where orgs.id = knk.org_id(+)'
      '                   and crash.co = 0)'
      '         where org_id is null'
      '        '
      '        minus'
      '        '
      '        select S.azs_id'
      '          from oil_dr_summary S'
      '         where not'
      
        '                (end_date < '#39'20.01.2003'#39' and comment_ like '#39'%'#1053#1072#1095 +
        '. '#1079#1085#1072#1095#1077#1085#1080#1103'%'#39')'
      
        '           and not (Begin_date = End_date and rep_id is not null' +
        ')'
      '           and :date_ between begin_date and end_date'
      '        '
      '        minus'
      '        '
      '        select dep_id'
      '          from oil_kp_crash'
      '         where state = '#39'Y'#39
      '           and crash_type = 2'
      '           and :date_ between start_date and end_date) Q,'
      '       v_org oo'
      ''
      ' where Q.id = oo.id'
      '   and oo.id = oo.inst')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 121
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'dep_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end>
  end
  object qRegionRest: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '--> qRegionRest,Reports'
      'select /*VERSION=107.0*/'
      '       Q2.*,'
      '       RezervDeadTonnAll as AZS_RezervDeadTonn'
      '  from'
      ' (select /*+ORDERED USE_HASH(Q1,dns_last,oo_dep)*/'
      '       np_grp as id,np_grp_name as name,dep_id,'
      
        '       -- if (restsale=0) and (inway>0) and (oo_par.org_type=3 *' +
        #1085'/'#1073'*) then oo_par.id as org_id'
      
        '       decode(sign(sum(InWay)), 1,decode(sign(sum(RestSale)), 0,' +
        'decode(oo_par.org_type, 3,oo_dep.par,'
      
        '                                                                ' +
        'oo_dep.id), oo_dep.id), oo_dep.id) as org_id,'
      
        '       decode(sign(sum(InWay)), 1,decode(sign(sum(RestSale)), 0,' +
        'decode(oo_par.org_type, 3,oo_par.name,'
      
        '                                                                ' +
        'oo_dep.name), oo_dep.name), oo_dep.name) as dep_name,'
      '       azs_id_int as azs_id,'
      '       oo_azs.name ||'#39' '#39'|| oo_azs.addr as azs_name,'
      '       PrihLastDate as AZS_PrihLastDate,'
      '       decode(np_grp,62,1,75,1,0) as IsNpGaz,'
      
        '       decode(np_grp,3,0,4,0,5,0,6,0,7,0,59,0,10,0,62,0,71,0,75,' +
        '0,76,0,9980,0,9995,0,9996,0,9997,0,9998,0,9999,0,1) as IsNpOther' +
        ','
      
        '       sum(sum(RestSale)) over (partition by dep_id,np_grp)   as' +
        ' RestSale,'
      
        '       sum(sum(RestSalePs)) over (partition by dep_id,np_grp) as' +
        ' RestSalePs,'
      '       sum(RestSalePs) as AZS_RestSalePs,'
      
        '       sum(sum(RestStore)) over (partition by dep_id,np_grp)    ' +
        '  as RestStore,'
      
        '       sum(sum(RestTNKStore)) over (partition by dep_id,np_grp) ' +
        '  as RestTNKStore,'
      
        '       sum(sum(RestCVOStore)) over (partition by dep_id,np_grp) ' +
        '  as RestCVOStore,'
      
        '       sum(sum(RestOwn)) over (partition by dep_id,np_grp)      ' +
        '  as RestOwn,'
      
        '       sum(sum(RestTalon)) over (partition by dep_id,np_grp)    ' +
        '  as RestTalon,'
      
        '       sum(sum(LastDay)) over (partition by dep_id,np_grp)      ' +
        '  as LastDay,'
      
        '       sum(sum(LastDayPS)) over (partition by dep_id,np_grp)    ' +
        '  as LastDayPS,'
      
        '       sum(sum(LastDayLitrPS)) over (partition by dep_id,np_grp)' +
        '  as LastDayLitrPS,'
      
        '       sum(sum(PriceLastDay)) over (partition by dep_id,np_grp) ' +
        '  as PriceLastDay,'
      
        '       sum(sum(PriceLastDayPS)) over (partition by dep_id,np_grp' +
        ') as PriceLastDayPS,'
      
        '       sum(sum(Period)) over (partition by dep_id,np_grp)       ' +
        '  as Period,'
      
        '       sum(sum(PricePeriod)) over (partition by dep_id,np_grp)  ' +
        '  as PricePeriod,'
      
        '       sum(sum(PeriodPS)) over (partition by dep_id,np_grp)     ' +
        '  as PeriodPS,'
      
        '       sum(sum(PricePeriodPS)) over (partition by dep_id,np_grp)' +
        '  as PricePeriodPS,'
      
        '       round(sum(sum(PrevPeriodPs)) over (partition by dep_id,np' +
        '_grp)/prev_period_days,6) as AvgPrevPeriodPs,'
      
        '       round(sum(PrevPeriodPs)/prev_period_days,6) as AZS_AvgPre' +
        'vPeriodPs,'
      
        '       sum(sum(Auxiliary)) over (partition by dep_id,np_grp)    ' +
        '  as Auxiliary,'
      
        '       sum(sum(Exchange_)) over (partition by dep_id,np_grp)    ' +
        '  as Exchange_,'
      
        '       sum(sum(Reckoning)) over (partition by dep_id,np_grp)    ' +
        '  as Reckoning,'
      
        '       sum(sum(LastDayBankCard)) over (partition by dep_id,np_gr' +
        'p)      as LastDayBankCard,'
      
        '       sum(sum(PriceLastDayBankCard)) over (partition by dep_id,' +
        'np_grp) as PriceLastDayBankCard,'
      
        '       sum(sum(PeriodBankCard)) over (partition by dep_id,np_grp' +
        ')       as PeriodBankCard,'
      
        '       sum(sum(PricePeriodBankCard)) over (partition by dep_id,n' +
        'p_grp)  as PricePeriodBankCard,'
      
        '       sum(sum(LastDayTalon)) over (partition by dep_id,np_grp) ' +
        '        as LastDayTalon,'
      
        '       sum(sum(PriceLastDayTalon)) over (partition by dep_id,np_' +
        'grp)    as PriceLastDayTalon,'
      
        '       sum(sum(PeriodTalon)) over (partition by dep_id,np_grp)  ' +
        '        as PeriodTalon,'
      
        '       sum(sum(PricePeriodTalon)) over (partition by dep_id,np_g' +
        'rp)     as PricePeriodTalon,'
      
        '       sum(sum(Expense)) over (partition by dep_id,np_grp)      ' +
        '        as Expense,'
      
        '       sum(sum(LastDayCard)) over (partition by dep_id,np_grp)  ' +
        '        as LastDayCard,'
      
        '       sum(sum(PriceLastDayCard)) over (partition by dep_id,np_g' +
        'rp)     as PriceLastDayCard,'
      
        '       sum(sum(PeriodCard)) over (partition by dep_id,np_grp)   ' +
        '        as PeriodCard,'
      
        '       sum(sum(PricePeriodCard)) over (partition by dep_id,np_gr' +
        'p)      as PricePeriodCard,'
      
        '       sum(sum(InWay)) over (partition by dep_id,np_grp)        ' +
        '        as InWay,'
      '       sum(RezervCapacity)      as RezervCapacity,'
      '       sum(RezervFreeSpace)     as RezervFreeSpace,'
      '       sum(RezervDeadTonnAll)   as RezervDeadTonnAll,'
      '       sum(RezervDeadTonnZapas) as RezervDeadTonnZapas,'
      
        '       sum(RezervTubCapacityTonnZapas) as RezervTubCapacityTonnZ' +
        'apas,'
      '       is_to_total,'
      '       is_cards_subtotal,'
      
        '       decode(oo_dep.id,201,0,223,1,229,2,228,3,225,4,226,5,224,' +
        '6,227,7,412,8,oo_dep.id) as order_id'
      'from'
      '   (-- '#1087#1086#1076#1079#1072#1087#1088#1086#1089' '#1089' '#1076#1072#1085#1085#1099#1084#1080' '#1087#1086' '#1085#1077#1092#1090#1077#1073#1072#1079#1072#1084' '#1080' '#1040#1047#1057
      '    select real_np_group,np_grp,np_grp_name,dep_id,azs_id_int,'
      '           is_real*is_nb*filter_komown*rest_tonn as RestSale,'
      '           is_real*is_azs*filter_komown*rest_tonn as RestSalePs,'
      '           0 as RestSalePsNB,'
      
        '           is_store*(1-is_tnk_store)*(1-is_cvo_store)*is_right_p' +
        'ost*rest_tonn as RestStore,'
      
        '           is_store*is_tnk_store*is_right_post*rest_tonn as Rest' +
        'TNKStore,'
      
        '           is_store*is_cvo_store*is_right_post*rest_tonn as Rest' +
        'CVOStore,'
      '           is_own*is_part_o*rest_tonn as RestOwn,'
      '           is_own*is_part_to*rest_tonn as RestTalon,'
      ''
      
        '           is_lastday*filter_internal*is_real*is_oper_real*is_nb' +
        '*filter_komown*real_tonn as LastDay,'
      
        '           is_lastday*filter_internal*is_real*is_azs*filter_komo' +
        'wn*real_tonn as LastDayPs,'
      
        '           is_lastday*filter_internal*is_real*is_azs*filter_komo' +
        'wn*real_litr as LastDayLitrPs,'
      
        '           is_lastday*filter_internal*is_real*is_oper_real*is_nb' +
        '*filter_komown*real_summa as PriceLastDay,'
      
        '           is_lastday*filter_internal*is_real*is_azs*filter_komo' +
        'wn*real_summa as PriceLastDayPs,'
      ''
      
        '           is_period*filter_internal*is_real*is_oper_real*is_nb*' +
        'filter_komown*real_tonn as Period,'
      
        '           is_period*filter_internal*is_real*is_oper_real*is_nb*' +
        'filter_komown*real_summa as PricePeriod,'
      
        '           is_period*filter_internal*is_real*is_azs*filter_komow' +
        'n*real_tonn as PeriodPs,'
      
        '           is_period*filter_internal*is_real*is_azs*filter_komow' +
        'n*real_summa as PricePeriodPs,'
      ''
      
        '           is_prev_period*filter_internal*filter_komown*filter_o' +
        'nly_cards*(real_tonn+talon_tonn) as PrevPeriodPs,'
      ''
      '           is_lastday*is_oper_aux*real_tonn as Auxiliary,'
      '           is_lastday*is_oper_exch*real_tonn as Exchange_,'
      '           is_lastday*is_oper_reck*real_tonn as Reckoning,'
      '           is_period*is_oper_exp*real_tonn as Expense,'
      ''
      '           is_lastday*is_bank_card*real_tonn as LastDayBankCard,'
      
        '           is_lastday*is_bank_card*real_summa as PriceLastDayBan' +
        'kCard,'
      '           is_period*is_bank_card*real_tonn as PeriodBankCard,'
      
        '           is_period*is_bank_card*real_summa as PricePeriodBankC' +
        'ard,'
      ''
      
        '           :OtpOtov*is_lastday*is_own*is_part_to*talon_tonn as L' +
        'astDayTalon,'
      
        '           :OtpOtov*is_lastday*is_own*is_part_to*talon_summa as ' +
        'PriceLastDayTalon,'
      
        '           :OtpOtov*is_period*is_own*is_part_to*talon_tonn as Pe' +
        'riodTalon,'
      
        '           :OtpOtov*is_period*is_own*is_part_to*talon_summa as P' +
        'ricePeriodTalon,'
      ''
      '           0 as LastDayCard,'
      '           0 as PriceLastDayCard,'
      '           0 as PeriodCard,'
      '           0 as PricePeriodCard,'
      ''
      '           0 as RezervCapacity,'
      '           0 as RezervFreeSpace,'
      '           0 as RezervDeadTonnAll,'
      '           0 as RezervDeadTonnZapas,'
      '           0 as RezervTubCapacityTonnZapas,'
      '           0 as InWay,'
      '           is_to_total,'
      '           is_cards_subtotal,'
      
        '           trunc(to_date(:p_EndDate),'#39'mm'#39') - add_months(trunc(to' +
        '_date(:p_EndDate),'#39'mm'#39'),-1) as prev_period_days'
      ''
      '     from'
      ''
      
        '       (select Q1.*, is_komission*is_right_post+is_own*(1-is_par' +
        't_o)*(1-is_part_to) as is_real,'
      
        '               sign(1-is_internal_real+:InternalReal) as filter_' +
        'internal,'
      
        '               (1-:KomOwn)*is_komission+:KomOwn*is_own as filter' +
        '_komown,'
      
        '               is_prevperiod_begin*is_prevperiod_end as is_prev_' +
        'period,'
      
        '               decode(tip_id,4,sign(is_card + is_azs),is_azs) as' +
        ' filter_only_cards'
      ''
      '        from'
      ''
      '          (select /*+ORDERED USE_HASH(Q,p,npt,dim,dng)*/'
      ''
      '                  azs_id as azs_id_int,'
      
        '                  p.own_goods,decode(p.own_goods,'#39'K'#39',1,0) as is_' +
        'komission,decode(p.own_goods,'#39'O'#39',1,0) as is_own,'
      '                  decode(p.own_goods,'#39'S'#39',1,0) as is_store,'
      
        '                  decode(substr(p.dog,1,2),'#39#1054#1041#39',1,'#39#1054#1042#39',1,'#39#1054#1047#39',1,' +
        #39#1054#1053#39',1,'#39#1054#1054#39',1,'#39#1054#1055#39',1,'#39#1054#1057#39',1,0) as is_part_o,'
      
        '                  decode(substr(p.dog,1,2),'#39#1058#1054#39',1,0) as is_part_' +
        'to,'
      
        '                  decode(sign(to_date(:p_EndDate)-date_-:NumDays' +
        '+1),1,0,1) as is_lastday,'
      
        '                  decode(sign(date_-to_date(:p_BeginDate)),-1,0,' +
        '1) as is_period,'
      
        '                  decode(sign(date_ - add_months(trunc(to_date(:' +
        'p_EndDate),'#39'mm'#39'),-1)),-1,0,1) as is_prevperiod_begin,'
      
        '                  decode(sign(trunc(to_date(:p_EndDate),'#39'mm'#39')-1 ' +
        '- date_),-1,0,1) as is_prevperiod_end,'
      '                  decode(p.from_,1452,1,7842,1,7856,1,10775,1,'
      
        '                    decode(p.from_,decode(:post,0,decode(p.from_' +
        ',38,38,4587,4587,0),:post),1,0)'
      '                  ) as is_right_post,'
      
        '                  decode(p.own_goods,'#39'S'#39',decode(decode(p.from_,1' +
        '452,1,7842,1,7856,1,0),1,'
      
        '                    decode(p.from_inst,1,1,0),0),0) as is_tnk_st' +
        'ore,'
      
        '                  decode(p.own_goods,'#39'S'#39',decode(decode(p.from_,1' +
        '0775,1,0),1, decode(p.from_inst,1,1,0),0),0) as is_cvo_store,'
      '                  decode(tip_id,1,1,2,1,0) as is_nb,'
      '                  decode(tip_id,3,1,5,1,0) as is_azs,'
      '                  decode(oper_id,11,1,12,1,0) as is_oper_real,'
      
        '                  decode(oper_id,15,1,40,1,47,1,0) as is_oper_au' +
        'x,'
      '                  decode(oper_id,5,1,0) as is_oper_exch, '
      
        '                  decode(oper_id,48,1,49,1,50,1,51,1,52,1,0) as ' +
        'is_oper_reck,'
      
        '                  decode(oper_id,5,1,15,1,40,1,47,1,48,1,49,1,50' +
        ',1,51,1,52,1,0) as is_oper_exp,'
      '                  decode(oper_id,153,1,201,1,0) as is_card,'
      '                  decode(oper_id,201,1,0) as is_bank_card,'
      '                  npt.np_grp as real_np_group,'
      
        '                  decode(:DopGroups,0,npt.np_grp,nvl(10000+dng.g' +
        'roup_number,npt.np_grp)) as np_grp,'
      
        '                  decode(:DopGroups,0,npt.np_grp_name,nvl(dng.gr' +
        'oupname,npt.np_grp_name)) as np_grp_name,'
      
        '                  decode(:DopGroups,0,1,nvl(dng.is_to_total,1)) ' +
        'as is_to_total,'
      
        '                  decode(:DopGroups,0,1,nvl(dng.is_cards_subtota' +
        'l,1)) as is_cards_subtotal,'
      '                  Q.*'
      ''
      '           from'
      '              -- '#1087#1088#1080#1073#1091#1090#1082#1080'/'#1074#1080#1076#1072#1090#1082#1080' '#1085#1072' '#1053#1041
      '              (select'
      
        '                      1 as tip_id,pr.date_,pr.part_id,pr.part_in' +
        'st,'
      
        '                      pr.to_ as dep_id,pr.to_inst as dep_inst,pr' +
        '.oper_id,'
      '                      0 as azs_id,'
      '                      0 as is_internal_real,'
      '                      0 as is_prihod,'
      '                      prd.fact_count as rest_tonn,'
      
        '                      0 as real_litr,0 as real_tonn,0 as real_su' +
        'mma,'
      
        '                      0 as talon_litr,0 as talon_tonn,0 as talon' +
        '_summa'
      '               from oil_prihod pr,oil_prih_det prd'
      '               where pr.state='#39'Y'#39' and prd.state='#39'Y'#39
      
        '                     and prd.prihod_id=pr.id and prd.inst=pr.ins' +
        't'
      '                     and pr.date_<=to_date(:p_EndDate)'
      '                     and pr.oper_id<>56'
      '               UNION ALL'
      '               select /*+ORDERED USE_HASH(r,oo)*/'
      '                      2 as tip_id,r.date_,r.part_id,r.part_inst,'
      
        '                      r.from_id as dep_id,r.from_inst as dep_ins' +
        't,r.oper_id,'
      '                      0 as azs_id,'
      
        '                      decode(oo.org_type,4,1,5,1,0) as is_intern' +
        'al_real,'
      '                      0 as is_prihod,'
      '                      -r.count_ as rest_tonn,'
      '                      0 as real_litr,r.count_ as real_tonn,'
      
        '                      round(round(r.count_*r.price,2)*decode(r.u' +
        'ch_price,'#39'Y'#39',1,1.2),2) as real_summa,'
      
        '                      0 as talon_litr,0 as talon_tonn,0 as talon' +
        '_summa'
      '               from oil_rashod r,oil_org oo'
      
        '               where r.state='#39'Y'#39' and r.to_id=oo.id(+) and r.to_i' +
        'nst=oo.inst(+)'
      '                     and r.date_<=to_date(:p_EndDate)'
      '                     and r.oper_id<>56'
      ''
      '               UNION ALL'
      '               -- '#1040#1047#1057' '#1058#1072#1083#1086#1085#1080' '#1086#1090#1086#1074#1072#1088#1077#1085#1110' + '#1053#1072#1083
      '               select'
      '                      3 as tip_id,'
      '                      trunc(rep_date) as date_,'
      '                      part_id,'
      '                      part_inst,'
      '                      oo.par as dep_id,'
      '                      oo.par_inst as dep_inst,'
      '                      to_number(null) as oper_id,'
      '                      rp.azs_id,'
      '                      0 as is_internal_real,'
      '                      is_prihod,'
      '                      rest_tonn,'
      '                      out_nal_litr as real_litr,'
      '                      out_nal_count as real_tonn,'
      '                      out_nal_money as real_summa,'
      '                      out_talon_litr as talon_litr,'
      '                      out_talon_count as talon_tonn,'
      '                      out_talon_money as talon_summa'
      '                from'
      '                  (select '#39'drep'#39' as tp,'
      '                          drep.rep_date,'
      '                          r.part_id,'
      '                          r.part_inst,'
      '                          drep.azs_id as azs_id,'
      '                          drep.azs_inst as azs_inst,       '
      
        '                          sign(nvl(dr.pr_count, 0)) as is_prihod' +
        ','
      
        '                          nvl(dr.pr_count, 0) - nvl(dr.out_nal_c' +
        'ount, 0) -'
      
        '                              nvl(dr.out_ved_count, 0) - nvl(dr.' +
        'out_count, 0) -'
      
        '                              nvl(dr.out_talon_count, 0) - nvl(d' +
        'r.out_sn_count, 0) as rest_tonn,'
      
        '                          nvl(dr.out_nal_litr,0) as out_nal_litr' +
        ','
      
        '                          nvl(dr.out_nal_count,0) as out_nal_cou' +
        'nt,'
      
        '                          nvl(dr.out_nal_money,0) as out_nal_mon' +
        'ey,'
      
        '                          nvl(dr.out_talon_litr,0) as out_talon_' +
        'litr,'
      
        '                          nvl(dr.out_talon_count,0) as out_talon' +
        '_count,'
      
        '                          nvl(dr.out_talon_money,0) as out_talon' +
        '_money'
      '                     from oil_daily_rep drep,'
      '                          oil_dr_data dr,'
      '                          oil_rashod r,'
      
        '                          (select max(rep_date) as rep_date, azs' +
        '_id, azs_inst'
      
        '                             from (select rep_date, azs_id, azs_' +
        'inst'
      '                                     from oil_region_rest'
      
        '                                    where trunc(rep_date) <= to_' +
        'date(:p_EndDate)'
      '                                   union all'
      
        '                                   select to_date('#39'01.01.1990'#39','#39 +
        'dd.mm.yyyy'#39') as rep_date, id as azs_id, inst as azs_inst'
      '                                     from oil_org'
      
        '                                    where state='#39'Y'#39' and id=inst ' +
        'and org_type=8)'
      '                               group by azs_id, azs_inst'
      '                           ) orr'
      
        '                    where drep.state = '#39'Y'#39' and dr.state = '#39'Y'#39' an' +
        'd r.state = '#39'Y'#39
      
        '                      and trunc(drep.rep_date) <= to_date(:p_End' +
        'Date)  -- '#1074#1088#1072#1093#1086#1074#1091#1108#1084#1086' '#1074#1077#1089#1100' '#1088#1091#1093' '#1076#1086' 23:59:59,999 '#1076#1072#1090#1080' :p_EndDate'
      
        '                      and trunc(drep.rep_date) > trunc(orr.rep_d' +
        'ate)   -- '#1075#1088#1072#1085#1080#1095#1085#1072' '#1076#1072#1090#1072' '#1074#1088#1072#1093#1086#1074#1072#1085#1072' '#1074' oil_region_rest'
      
        '                      and trunc(drep.rep_date, '#39'mm'#39') >= trunc(or' +
        'r.rep_date,'#39'mm'#39')  -- '#1084#1110#1089#1103#1095#1085#1077' '#1076#1077#1088#1077#1074#1094#1077
      '                      and dr.oper_type in (0, 1)'
      
        '                      and r.oper_id <> 52  -- '#1042#1079#1072#1108#1084#1086#1079#1072#1083#1110#1082' '#1089#1087#1086#1085#1089#1086 +
        #1088#1089#1100#1082#1072' '#1076#1086#1087#1086#1084#1086#1075#1072
      
        '                      and dr.ttn_id = r.id and dr.ttn_inst = r.i' +
        'nst'
      
        '                      and dr.rep_id = drep.id and dr.rep_inst = ' +
        'drep.inst'
      
        '                      and drep.azs_id = orr.azs_id and drep.azs_' +
        'inst = orr.azs_inst'
      '                  union all'
      '                   select '#39'orr'#39' as tp,'
      '                          rep_date,'
      '                          part_id,'
      '                          part_inst,'
      '                          azs_id,'
      '                          azs_inst,'
      '                          sign(nvl(pr_count, 0)) as is_prihod,'
      
        '                          nvl(pr_count, 0) - nvl(out_nal_count, ' +
        '0) -'
      
        '                              nvl(out_ved_count, 0) - nvl(out_co' +
        'unt, 0) -'
      
        '                              nvl(out_talon_count, 0) - nvl(out_' +
        'sn_count, 0) as rest_tonn,'
      '                          out_nal_litr,'
      '                          out_nal_count,'
      '                          out_nal_money,'
      '                          out_talon_litr,'
      '                          out_talon_count,'
      '                          out_talon_money'
      '                      from oil_region_rest'
      
        '                     where trunc(rep_date) <= to_date(:p_EndDate' +
        ')'
      '                      ) rp,'
      '                      oil_org oo'
      '                where oo.state = '#39'Y'#39
      
        '                  and rp.azs_id = oo.id and rp.azs_inst = oo.ins' +
        't'
      ''
      '               UNION ALL'
      
        '               -- '#1040#1047#1057' Sr_Other - '#1074#1110#1076#1087#1091#1089#1082' '#1087#1086' '#1082#1072#1088#1090#1082#1072#1093', '#1090#1072' '#1073#1072#1085#1082'-'#1082#1072#1088 +
        #1090#1082#1072#1093
      '               select'
      
        '                      4 as tip_id,trunc(drep.rep_date) as date_,' +
        'r.part_id,r.part_inst,'
      
        '                      oo.par as dep_id,oo.par_inst as dep_inst,s' +
        'ro.oper_id,'
      '                      drep.azs_id as azs_id,'
      '                      0 as is_internal_real,'
      '                      0 as is_prihod,'
      
        '                      0 as rest_tonn,sro.litr as real_litr,sro.c' +
        'ount_t as real_tonn,'
      
        '                      nvl(sro.amount,round(sro.litr*sro.price,2)' +
        ') as real_summa,'
      
        '                      0 as talon_litr,0 as talon_tonn,0 as talon' +
        '_summa'
      
        '               from oil_daily_rep drep,oil_dr_data dr,oil_srothe' +
        'r sro,oil_rashod r,oil_org oo'
      
        '               where drep.state='#39'Y'#39' and dr.state='#39'Y'#39' and sro.sta' +
        'te='#39'Y'#39' and r.state='#39'Y'#39
      
        '                 and trunc(rep_date) between add_months(trunc(to' +
        '_date(:p_BeginDate),'#39'mm'#39'),-1) and :p_EndDate'
      '                 and dr.oper_type = 1'
      '                 and dr.rep_id=drep.id and dr.rep_inst=drep.inst'
      '                 and dr.ttn_id=r.id and dr.ttn_inst=r.inst'
      '                 and sro.srep_id=dr.id and sro.srep_inst=dr.inst'
      '                 and drep.azs_id=oo.id and drep.azs_inst=oo.inst'
      '               UNION ALL'
      '               -- '#1040#1047#1057' oil_vedomost - '#1074#1110#1076#1087#1091#1089#1082' '#1087#1086' '#1074#1110#1076#1086#1084#1086#1089#1090#1110
      '               select'
      
        '                     5 as tip_id,trunc(drep.rep_date) as date_,r' +
        '.part_id,r.part_inst,'
      
        '                     oo.par as dep_id,oo.par_inst as dep_inst,11' +
        ' as oper_id,'
      '                     drep.azs_id as azs_id,'
      
        '                     decode(ocl.org_type,4,1,5,1,0) as is_intern' +
        'al_real,'
      '                     0 as is_prihod,'
      
        '                     0 as rest_tonn,v.litr as real_litr,v.count_' +
        't as real_tonn,'
      '                     round(v.litr*v.price,2) as real_summa,'
      
        '                     0 as talon_litr,0 as talon_tonn,0 as talon_' +
        'summa'
      
        '                from oil_daily_rep drep,oil_dr_data dr,oil_vedom' +
        'ost v,oil_rashod r,oil_org oo,oil_org ocl'
      
        '               where drep.state='#39'Y'#39' and dr.state='#39'Y'#39' and v.state' +
        '='#39'Y'#39' and r.state='#39'Y'#39
      
        '                 and trunc(rep_date) between add_months(trunc(to' +
        '_date(:p_BeginDate),'#39'mm'#39'),-1) and :p_EndDate'
      '                 and dr.oper_type = 1'
      
        '                 and r.oper_id <> 52  -- '#1042#1079#1072#1108#1084#1086#1079#1072#1083#1110#1082' '#1089#1087#1086#1085#1089#1086#1088#1089#1100#1082#1072 +
        ' '#1076#1086#1087#1086#1084#1086#1075#1072
      '                 and dr.rep_id=drep.id and dr.rep_inst=drep.inst'
      '                 and dr.ttn_id=r.id and dr.ttn_inst=r.inst'
      '                 and v.srep_id=dr.id and v.srep_inst=dr.inst'
      
        '                 and drep.azs_id=oo.id and drep.azs_inst=oo.inst' +
        '                 '
      '                 and v.org_id=ocl.id and v.org_inst=ocl.inst'
      
        '               ) Q, oil_part p, v_oil_dim dim, v_oil_np_type npt' +
        ','
      '               -- '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1075#1088#1091#1087#1087#1099' '#1084#1072#1089#1077#1083' '#1080' '#1053#1055
      '         v_oil_dop_np_groups dng'
      ''
      '           where p.state='#39'Y'#39' and dim.IsShtuki='#39'N'#39
      '             and p.dim_id=dim.id'
      '             and p.np_type=npt.id'
      '             and p.np_type=dng.id(+)'
      '             and Q.part_id=p.id and Q.part_inst=p.inst'
      '           ) Q1'
      '       )'
      '       UNION ALL'
      
        '       -- '#1087#1086#1076#1079#1072#1087#1088#1086#1089' '#1089' '#1076#1072#1085#1085#1099#1084#1080' '#1087#1086' '#1086#1090#1087#1091#1089#1082#1091' '#1090#1072#1083#1086#1085#1086#1074', '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103#1084' '#1082#1072 +
        #1088#1090#1086#1095#1077#1082' '#1080' '#1089#1087#1080#1089#1072#1085#1080#1103#1084' '#1087#1086' '#1083#1080#1084#1080#1090#1085#1086#1081' '#1089#1093#1077#1084#1077
      '       select np_grp as real_np_group,'
      
        '              decode(:DopGroups,0,np_grp,nvl(10000+group_number,' +
        'np_grp)) as np_grp,'
      
        '              decode(:DopGroups,0,np_grp_name,nvl(groupname,np_g' +
        'rp_name)) as np_grp_name,'
      '              dep_id,'
      '              0 as azs_id_int,'
      '              0 as RestSale,'
      '              0 as RestSalePs,'
      '              0 as RestSalePsNB,'
      '              0 as RestStore,'
      '              0 as RestTNKStore,'
      '              0 as RestCVOStore,'
      '              0 as RestOwn,'
      '              0 as RestTalon,'
      '              0 as LastDay,'
      '              0 as LastDayPs,'
      '              0 as LastDayLitrPs,'
      '              0 as PriceLastDay,'
      '              0 as PriceLastDayPs,'
      '              0 as Period,'
      '              0 as PricePeriod,'
      '              0 as PeriodPs,'
      '              0 as PricePeriodPs,'
      '              0 as PrevPeriodPs,'
      '              0 as Auxiliary,'
      '              0 as Exchange_,'
      '              0 as Reckoning,'
      '              0 as Expense,'
      '              0 as LastDayBankCard,'
      '              0 as PriceLastDayBankCard,'
      '              0 as PeriodBankCard,'
      '              0 as PricePeriodBankCard,'
      ''
      '              is_talon*is_lastday*tonn as LastDayTalon,'
      '              is_talon*is_lastday*summa as PriceLastDayTalon,'
      '              is_talon*is_period*tonn as PeriodTalon,'
      '              is_talon*is_period*summa as PricePeriodTalon,'
      ''
      '              is_card*is_lastday*tonn as LastDayCard,'
      '              is_card*is_lastday*summa as PriceLastDayCard,'
      '              is_card*is_period*tonn as PeriodCard,'
      '              is_card*is_period*summa as PricePeriodCard,'
      ''
      '              0 as RezervCapacity,'
      '              0 as RezervFreeSpace,'
      '              0 as RezervDeadTonnAll,'
      '              0 as RezervDeadTonnZapas,'
      '              0 as RezervTubCapacityTonnZapas,'
      '              0 as InWay,'
      
        '              decode(:DopGroups,0,1,nvl(is_to_total,1)) as is_to' +
        '_total,'
      
        '              decode(:DopGroups,0,1,nvl(is_cards_subtotal,1)) as' +
        ' is_cards_subtotal,'
      
        '              trunc(to_date(:p_EndDate),'#39'mm'#39') - add_months(trunc' +
        '(to_date(:p_EndDate),'#39'mm'#39'),-1) as prev_period_days'
      ''
      '       from'
      ''
      '          (select /*+ORDERED USE_HASH(QQ,dns)*/'
      '                  decode(tip_id,101,1,0) as is_talon,'
      
        '                  decode(tip_id,102,1,103,1,104,1,105,1,0) as is' +
        '_card,'
      
        '                  decode(sign(to_date(:p_EndDate)-date_-:NumDays' +
        '+1),1,0,1) as is_lastday,'
      
        '                  decode(sign(date_-to_date(:p_BeginDate)),-1,0,' +
        '1) as is_period,'
      '                  round(QQ.litr*dns.density/1000,6) as tonn,'
      '                  dng.is_to_total,'
      '                  dng.is_cards_subtotal,'
      '                  dng.groupname,'
      '                  dng.group_number,'
      '                  QQ.*'
      '           from'
      '              ('
      '              -- '#1074#1110#1076#1087#1091#1089#1082#1080' '#1090#1072#1083#1086#1085#1110#1074' ('#1087#1086#1074#1077#1088#1085#1077#1085#1085#1103' '#1074#1088#1072#1093#1086#1074#1072#1085#1086')'
      '              select  /*+ ALL_ROWS*/'
      '                     101 as tip_id,'
      '                     date_,'
      '                     dep_id,'
      '                     npg.id as np_grp,'
      '                     npg.name as np_grp_name,'
      '                     decode(oper_id,181,-1,1) * nominal as litr,'
      
        '                     decode(oper_id,181,-1,1) * round(nominal * ' +
        'price, 2) as summa'
      '                from v_oil_talon_op, v_oil_np_group npg'
      '               where :OtpOtov = 0'
      
        '                 and Tip = decode(oper_id,181,'#39'P'#39','#39'O'#39') -- '#1087#1086#1074#1077#1088#1085 +
        #1077#1085#1085#1103' '#1073#1077#1088#1091#1090#1100#1089#1103' '#1079' '#39'P'#39
      
        '                 and date_ between (to_date(:p_BeginDate)-:NumDa' +
        'ys) and :p_EndDate'
      '                 and org_id <> org_inst'
      '                 and npgrp_id = npg.id'
      
        '                 and oper_id not in (243,244,245)  -- '#1073#1077#1079' '#1074#1110#1076#1087#1091#1089 +
        #1082' '#1087#1086' '#1086#1073#1084#1110#1085#1091'; '#1089#1087#1086#1085#1089'.'#1076#1086#1087#1086#1084#1086#1075#1072'; '
      ''
      '               UNION ALL'
      '              -- '#1087#1086#1087#1086#1074#1085#1077#1085#1085#1103' '#1045#1050
      '              select'
      '                     102 as tip_id,'
      '                     ct.date_,'
      '                     decode(nvl(ct.request_inst,0),0,'
      
        '                                  nvl(card.GetDep(ct.gr_card_num' +
        ',rest.date_),ct.'#1085#1086#1084#1077#1088'_'#1090#1077#1088#1084#1080#1085#1072#1083#1072'+1e6),'
      '                                  ct.request_inst) as dep_id,'
      '                     npg.id as np_grp,'
      '                     npg.name as np_grp_name,'
      '                     rest.Litr as litr,'
      '                     rest.Amount as summa'
      
        '                from v_card_receipts rest, card_transaction ct, ' +
        'v_oil_np_group npg'
      
        '               where rest.date_ between :p_BeginDate and :p_EndD' +
        'ate'
      '                 and rest.auto_id is null'
      '                 and rest.share_id is null'
      '                 and rest.oil_id = ct.oil_id'
      '                 and rest.oil_inst = ct.oil_inst'
      '                 and rest.cardalign = 0'
      
        '                 and nvl(ct.request_id,0) = decode(:OPRefReq,0,n' +
        'vl(ct.request_id,0),0)'
      
        '                 and decode(rest.np_type,4,5,rest.np_type)=decod' +
        'e(rest.np_type,4,npg.id,npg.petrol_id)'
      '                 '
      '              /*****************************************'
      '               *** '#1047#1072#1083#1080#1096#1077#1085#1086' '#1076#1083#1103' '#1085#1072#1089#1090#1091#1087#1085#1086#1075#1086' '#1087#1086#1082#1086#1083#1110#1085#1085#1103' ***'
      '               ***       '#1072#1073#1086' '#1079#1084#1110#1085#1080' '#1082#1077#1088#1110#1074#1085#1080#1094#1090#1074#1072'       ***'
      '               *****************************************'
      '               UNION ALL -- '#1089#1087#1080#1089#1072#1085#1085#1103' '#1087#1086' '#1051#1057
      
        '              select 103 as tip_id,vcel.Chek_Date as date_,Card.' +
        'GetDep(vcel.card_number,vcel.date_) as dep_id,'
      
        '                     npg.id as np_grp,npg.name as np_grp_name,vc' +
        'el.litr,vcel.SumNds as summa'
      '                from v_card_equal_ls vcel, oil_np_group npg'
      
        '               where vcel.Chek_Date between :p_BeginDate and :p_' +
        'EndDate'
      
        '                 and decode(vcel.np_type,4,5,vcel.np_type)=decod' +
        'e(vcel.np_type,4,npg.id,npg.petrol_id)'
      
        '               UNION ALL -- '#1086#1087#1083#1072#1090#1080' '#1087#1086' '#1051#1057' '#1076#1083#1103' '#1087#1088#1077#1076#1086#1087#1083#1072#1090#1085#1080#1093' '#1076#1086#1075#1086#1074#1086 +
        #1088#1110#1074
      
        '              select 104 as tip_id,vcl.DogDate as date_,d.from_ ' +
        'as dep_id,npg.id as np_grp,'
      
        '                     npg.name as np_grp_name,vcl.doglitr as litr' +
        ',vcl.amount as summa'
      
        '                from V_CARD_RECEIPTS_LS vcl, oil_dog d,oil_np_gr' +
        'oup npg,'
      
        '                     (select distinct m.dog_id,m.dog_inst from o' +
        'il_money m where state='#39'Y'#39')m'
      
        '               where vcl.forepay=1 and vcl.dogdate between :p_Be' +
        'ginDate and :p_EndDate and d.id=vcl.dog_id '
      
        '                 and d.inst=vcl.dog_inst and m.dog_id=vcl.dog_id' +
        ' and m.dog_inst=vcl.dog_inst and vcl.petrolid=npg.petrol_id     ' +
        '           '
      '                ----------------------------------------*/'
      '                '
      '               UNION ALL'
      
        '               -- '#1089#1087#1080#1089#1072#1085#1085#1103' '#1087#1086' '#1051#1057' ('#1087#1110#1089#1083#1103#1086#1087#1083#1072#1090#1072', '#1087#1077#1088#1077#1076#1086#1087#1083#1072#1090#1072' + '#1087#1077#1088 +
        #1077#1074#1080#1076#1072#1090#1086#1082')'
      '              select 103          as tip_id,'
      '                     cls.date_    as date_,'
      '                     cls.oil_inst as dep_id,'
      '                     npg.id       as np_grp,'
      '                     npg.name     as np_grp_name,'
      '                     cls.Litr     as litr,'
      
        '                     nvl(cls.SumNds,round(cls.Litr*last_pricends' +
        ',2)) as summa'
      '                from v_card_equal_ls cls, v_oil_np_group npg,'
      '                     (select toid,toinst,petrolid,'
      
        '                             to_number(substr(max(to_char(dogdat' +
        'e,'#39'YYYYMMDD'#39')||pricends),9)) last_pricends'
      '                        from v_card_receipts_ls t '
      '                       where forepay = 1'
      
        '                       group by toid,toinst, petrolid) last_pric' +
        'e'
      
        '               where cls.date_ between :p_BeginDate and :p_EndDa' +
        'te'
      
        '                 and decode(cls.np_type,4,5,cls.np_type)=decode(' +
        'cls.np_type,4,npg.id,npg.petrol_id)'
      '                 and cls.oil_inst is not null                 '
      '                 and last_price.toid(+) = cls.to_id'
      '                 and last_price.toinst(+) = cls.to_inst'
      '                 and last_price.petrolid(+) = cls.Np_type'
      '               UNION ALL'
      '              -- '#1079#1072#1103#1074#1082#1080' '#1085#1072' '#1087#1086#1087#1086#1074#1085#1077#1085#1085#1103' ('#1074#1110#1076#1082#1083#1072#1076#1077#1085#1110')'
      '              select 105 as tip_id,'
      '                     req.date_ as date_,'
      '                     req.from_id as dep_id,'
      '                     npg.id as np_grp,'
      '                     npg.name as np_grp_name,'
      '                     req.litr as litr,'
      '                     round(req.litr*req.price,2) as summa'
      '                from v_card_request_full req, v_oil_np_group npg'
      '               where :OPRefReq = 1'
      
        '                 and req.date_ between :p_BeginDate and :p_EndDa' +
        'te'
      
        '                 and decode(req.np_group_id,4,5,req.np_group_id)' +
        '=decode(req.np_group_id,4,npg.id,npg.id)'
      '              ) QQ, v_oil_grp_density dns,'
      
        '              (select groupname,group_number,is_to_total,is_card' +
        's_subtotal,real_group,real_group_name,petrol_id'
      '                 from v_oil_dop_np_groups t'
      '                where is_cards_subtotal=1'
      
        '                group by groupname,group_number,is_to_total,is_c' +
        'ards_subtotal,real_group,real_group_name,petrol_id) dng'
      '           where QQ.np_grp=dns.npgroup_id(+)'
      '             and QQ.np_grp=dng.real_group(+)'
      
        '             and QQ.date_>=dns.date_from(+) and QQ.date_<=dns.da' +
        'te_to(+)'
      '          )'
      ''
      '       UNION ALL'
      '       -- '#1086#1073#1097#1080#1081' '#1086#1073#1098#1077#1084' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1086#1074' '#1080' '#1089#1074#1086#1073#1086#1076#1085#1086#1077' '#1084#1077#1089#1090#1086' '#1074' '#1085#1080#1093
      '       select'
      '         real_np_group, np_grp, np_grp_name, dep_id, azs_id_int,'
      
        '         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0' +
        ',0,0,0,0,0,0,'
      '         sum(RezervCapacity) as RezervCapacity,'
      '         sum(RezervFreeSpace) as RezervFreeSpace,'
      '         sum(RezervDeadTonn) as RezervDeadTonnAll,'
      
        '         sum(decode(sign(TNK_own_RestTonn),1,RezervDeadTonn,0)) ' +
        'as RezervDeadTonnZapas,'
      
        '         sum(decode(sign(TNK_own_RestTonn),1,RezervTubCapacityTo' +
        'nn,0)) as RezervTubCapacityTonnZapas,'
      '         0 as InWay,'
      '         is_to_total,'
      '         is_cards_subtotal,'
      
        '         trunc(to_date(:p_EndDate),'#39'mm'#39') - add_months(trunc(to_d' +
        'ate(:p_EndDate),'#39'mm'#39'),-1) as prev_period_days'
      '       from'
      '         (select /*+ORDERED USE_HASH(rzRest,rz,npt,rzn)*/'
      '           npt.np_grp real_np_group,'
      
        '           decode(:DopGroups,0,npt.np_grp,nvl(10000+dng.group_nu' +
        'mber,npt.np_grp)) as np_grp,'
      
        '           decode(:DopGroups,0,npt.np_grp_name,nvl(dng.groupname' +
        ',npt.np_grp_name)) as np_grp_name,'
      
        '           decode(:DopGroups,0,1,nvl(dng.is_to_total,1)) as is_t' +
        'o_total,'
      
        '           decode(:DopGroups,0,1,nvl(dng.is_cards_subtotal,1)) a' +
        's is_cards_subtotal,'
      '           decode(oo.org_type,8,oo.par,rz.id_org) as dep_id,'
      '           decode(oo.org_type,8,rz.id_org,0) as azs_id_int,'
      '           nvl(rzRest.tnk_own_rest,0) as TNK_own_RestTonn,'
      '           rz.capacity as RezervCapacity,'
      
        '           rz.capacity*dns.density-nvl(rzRest.rest,0) as RezervF' +
        'reeSpace,'
      '           rz.dead*dns.density as RezervDeadTonn,'
      
        '           rz.tubingcapacity*dns.density as RezervTubCapacityTon' +
        'n'
      '         from'
      
        '           oil_rezervuar rz, v_oil_rez_np_type rzn, v_oil_np_typ' +
        'e npt, v_oil_grp_density dns, oil_org oo,'
      '           (select rezid, rezinst,'
      
        '                   -sum(tonn) as rest,                          ' +
        '          -- '#1079#1072#1075#1072#1083#1100#1085#1110' '#1079#1072#1083#1080#1096#1082#1080
      
        '                   -sum(sign(is_tnk_store+is_own)*tonn) as tnk_o' +
        'wn_rest   -- '#1074#1083#1072#1089#1085#1110' '#1072#1073#1086' '#1079#1073#1077#1088#1110#1075#1072#1085#1085#1103' '#1058#1053#1050
      '             from (select vnp.rezid, vnp.rezinst,'
      '                          vnp.tonn as tonn,'
      
        '                          decode(vnp.own_goods,'#39'S'#39',decode(decode' +
        '(vnp.partpostid,1452,1,7842,1,7856,1,0),1,'
      
        '                                     decode(vnp.partpostinst,1,1' +
        ',0),0),0) as is_tnk_store,'
      
        '                          decode(vnp.own_goods,'#39'O'#39',1,0) as is_ow' +
        'n'
      '                     from v_oil_npmove vnp'
      '                    where vnp.date_<=:p_EndDate and vnp.NbAzs=0)'
      '                 group by rezid,rezinst) rzRest,'
      '            v_oil_dop_np_groups dng'
      ''
      
        '         where rz.state='#39'Y'#39' and rz.realvirt=1 and nvl(rz.conditi' +
        'on,0)<1'
      '           and oo.state = '#39'Y'#39
      
        '           and to_date(:p_EndDate) between rzn.date_from and rzn' +
        '.date_to'
      '           and to_date(:p_EndDate) >= dns.date_from(+)'
      '           and to_date(:p_EndDate) <= dns.date_to(+)'
      '           and rzn.np_type=npt.id'
      
        '           and rzRest.rezid(+)=rz.id and rzRest.rezinst(+)=rz.in' +
        'st'
      '           and rzn.rez_id=rz.id and rzn.rez_inst=rz.inst'
      '           and rzn.np_type=dng.id(+)'
      '           and npt.np_grp=dns.npgroup_id(+)'
      '           and oo.id = rz.id_org'
      '       )'
      
        '       group by np_grp,np_grp_name,dep_id,azs_id_int,is_to_total' +
        ',is_cards_subtotal,real_np_group,TNK_own_RestTonn,RezervDeadTonn'
      ''
      '       UNION ALL'
      '       -- '#1094#1080#1089#1090#1077#1088#1085#1099' '#1074' '#1087#1091#1090#1080
      
        '       select decode(:DopGroups,0,npt.np_grp,nvl(10000+dng.group' +
        '_number,npt.np_grp)) as real_np_group,'
      
        '              decode(:DopGroups,0,npt.np_grp,nvl(10000+dng.group' +
        '_number,npt.np_grp)) as np_grp,'
      
        '              decode(:DopGroups,0,npt.np_grp_name,nvl(dng.groupn' +
        'ame,npt.np_grp_name)) as np_grp_name,'
      '              dep_id,'
      
        '              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,' +
        '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'
      '              v.weight as InWay,'
      
        '              decode(:DopGroups,0,1,nvl(dng.is_to_total,1)) as i' +
        's_to_total,'
      
        '              decode(:DopGroups,0,1,nvl(dng.is_cards_subtotal,1)' +
        ') as is_cards_subtotal,'
      
        '              trunc(to_date(:p_EndDate),'#39'mm'#39') - add_months(trunc' +
        '(to_date(:p_EndDate),'#39'mm'#39'),-1) as prev_period_days'
      '       from v_oil_tsw v,v_oil_np_type npt,'
      '            v_oil_dop_np_groups dng'
      '       where v.w_np_type=npt.id and v.date_rast<=:p_EndDate'
      '         and v.w_np_type=dng.id(+)'
      ''
      '      UNION ALL'
      
        '      -- '#1076#1086#1076#1072#1090#1082#1086#1074#1110' '#1085#1091#1083#1100#1086#1074#1110' '#1088#1103#1076#1082#1080' '#1076#1083#1103' '#1092#1110#1083#1100#1090#1088#1072#1094#1110#1111' '#1089#1091#1084' '#1087#1086' '#1092#1110#1083#1110#1072#1083#1072#1084' ' +
        #1074#1110#1076' '#1089#1091#1084' '#1087#1086' '#1040#1047#1057'.'
      '      select distinct'
      
        '               decode(:DopGroups,0,npt.np_grp,nvl(10000+dng.grou' +
        'p_number,npt.np_grp)) as real_np_group,'
      
        '               decode(:DopGroups,0,npt.np_grp,nvl(10000+dng.grou' +
        'p_number,npt.np_grp)) as np_grp,'
      
        '               decode(:DopGroups,0,npt.np_grp_name,nvl(dng.group' +
        'name,npt.np_grp_name)) as np_grp_name,'
      '               oo.id as dep_id,'
      
        '               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0' +
        ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'
      
        '               decode(:DopGroups,0,1,nvl(dng.is_to_total,1)) as ' +
        'is_to_total,'
      
        '               decode(:DopGroups,0,1,nvl(dng.is_cards_subtotal,1' +
        ')) as is_cards_subtotal,'
      
        '               trunc(to_date(:p_EndDate),'#39'mm'#39') - add_months(trun' +
        'c(to_date(:p_EndDate),'#39'mm'#39'),-1) as prev_period_days'
      
        '        from v_oil_np_type npt, v_oil_dop_np_groups dng, oil_org' +
        ' oo'
      '       where oo.state='#39'Y'#39
      '         and oo.org_type<>8'
      '         and :p_dep in (oo.id,oo.par)'
      '         and oo.id=oo.inst'
      '         and npt.id=dng.id(+)'
      ''
      '   ) Q1, v_oil_org_norek oo_dep, oil_org oo_par, oil_org oo_azs,'
      ''
      '   (select /*+ORDERED USE_HASH(g1,g2)*/'
      '           g1.npgroup_id,g1.density'
      '    from oil_grp_density g1,'
      '         (select npgroup_id,max(date_) as last_date'
      '          from oil_grp_density g2'
      '          where state='#39'Y'#39
      '          group by npgroup_id) g2'
      '    where g1.npgroup_id=g2.npgroup_id'
      '      and g1.date_=g2.last_date'
      '   ) dns_last,'
      ''
      '   (select ov.GetVal('#39'NP_FUEL'#39') as value from dual) np_filtr,'
      ''
      '   -- '#1076#1072#1090#1072' '#1086#1089#1090#1072#1085#1085#1100#1086#1075#1086' '#1087#1088#1080#1093#1086#1076#1091' '#1085#1087' '#1085#1072' '#1072#1079#1089
      '   (select distinct'
      
        '             decode(:DopGroups,0,npt.np_grp,nvl(10000+grp.group_' +
        'number,npt.np_grp)) as grp_id, azs_id,'
      '             max(rep.rep_date) as PrihLastDate'
      
        '      from oil_daily_rep rep, oil_dr_data dr, oil_rashod rash, o' +
        'il_part op, v_oil_dop_np_groups grp, v_oil_np_type npt'
      
        '     where rep.state='#39'Y'#39' and dr.state='#39'Y'#39' and rash.state='#39'Y'#39' and' +
        ' op.state='#39'Y'#39
      
        '       and trunc(rep.rep_date,'#39'mm'#39') <= trunc(to_date(:p_EndDate)' +
        ','#39'mm'#39')'
      '       and rep.rep_date <= to_date(:p_EndDate)'
      '       and nvl(dr.pr_count,0) > 0'
      '       and rep.id = dr.rep_id'
      '       and rep.inst = dr.rep_inst'
      '       and dr.ttn_id = rash.id'
      '       and dr.ttn_inst = rash.inst'
      '       and rash.part_id = op.id'
      '       and rash.part_inst = op.inst'
      '       and op.np_type = grp.id(+)'
      '       and op.np_type = npt.id(+)'
      
        '      group by decode(:DopGroups,0,npt.np_grp,nvl(10000+grp.grou' +
        'p_number,npt.np_grp)), azs_id'
      '    ) prih_last'
      ''
      ' where Q1.np_grp=dns_last.npgroup_id(+)'
      
        '   and (np_filtr.value is null or instr('#39','#39'||np_filtr.value||'#39','#39 +
        ','#39','#39'||Q1.real_np_group||'#39','#39')>0 or Q1.real_np_group in(9980,9995,' +
        '9996,9998,9999,9997))'
      '   and Q1.dep_id=oo_dep.id and oo_dep.id=oo_dep.inst'
      '   and oo_par.id=oo_dep.par and oo_par.inst=oo_dep.par_inst'
      '   and oo_par.state='#39'Y'#39
      '   and oo_dep.org_id in (3,4)'
      '   and Q1.np_grp = prih_last.grp_id(+)'
      '   and azs_id_int=prih_last.azs_id(+)'
      '   and azs_id_int=oo_azs.id(+)'
      '   and oo_azs.id(+)=oo_azs.inst(+)'
      '   and :p_dep in (oo_dep.id,oo_dep.par)'
      
        ' group by np_grp,np_grp_name,dep_id,azs_id_int,oo_dep.id,oo_dep.' +
        'par,oo_dep.name,oo_par.org_type,oo_par.name,oo_azs.name,oo_azs.a' +
        'ddr,PrihLastDate,prev_period_days,dns_last.density,decode(np_grp' +
        ',62,1,75,1,0),decode(np_grp,3,0,4,0,5,0,6,0,7,0,59,0,10,0,62,0,7' +
        '1,0,75,0,76,0,9980,0,9995,0,9996,0,9997,0,9998,0,9999,0,1),is_to' +
        '_total,is_cards_subtotal'
      ''
      
        'order by decode(sign(id-10000),1,id,decode(id, 3,3, 4,4, 5,5, 6,' +
        '6, 7,7, 76,76, 10,10,59,59, 8,20000, 9980,2.8, 9996,2.4, 9995,2.' +
        '5, 9998,2.7, 9999,2.9,9997,5.5, 50000+id)),decode(org_id,201,0,2' +
        '23,1,229,2,228,3,225,4,226,5,224,6,227,7,412,8,org_id),'
      
        '         lpad(substr(oo_azs.name||'#39' '#39',instr(oo_azs.name,'#39#8470#39')+1,i' +
        'nstr(oo_azs.name||'#39' '#39','#39' '#39',instr(oo_azs.name,'#39#8470#39'))-instr(oo_azs.n' +
        'ame,'#39#8470#39')-1),5,'#39'0'#39'),'
      '         dep_name'
      ') Q2'
      'where ('
      '        azs_id<>0 and'
      '         (AZS_RestSalePs<>0 or AZS_AvgPrevPeriodPs<>0)'
      '      ) or ('
      '        azs_id=0 and'
      
        '         (RestSale<>0 or RestSalePs<>0 or RestStore<>0 or RestTN' +
        'KStore<>0 or RestCVOStore<>0 or'
      
        '          RestOwn<>0 or RestTalon<>0 or LastDay<>0 or LastDayPS<' +
        '>0 or LastDayLitrPS<>0 or'
      
        '          PriceLastDay<>0 or PriceLastDayPS<>0 or Period<>0 or P' +
        'ricePeriod<>0 or PeriodPS<>0 or'
      
        '          PricePeriodPS<>0 or AvgPrevPeriodPs<>0 or Auxiliary<>0' +
        ' or Exchange_<>0 or Reckoning<>0 or LastDayBankCard<>0 or'
      
        '          PriceLastDayBankCard<>0 or PeriodBankCard<>0 or PriceP' +
        'eriodBankCard<>0 or LastDayTalon<>0 or PriceLastDayTalon<>0 or'
      
        '          PeriodTalon<>0 or PricePeriodTalon<>0 or Expense<>0 or' +
        ' LastDayCard<>0 or PriceLastDayCard<>0 or PeriodCard<>0 or'
      
        '          PricePeriodCard<>0 or RezervCapacity<>0 or RezervDeadT' +
        'onnAll<>0 or InWay<>0))'
      '--v7.18')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 40
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OtpOtov'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'p_EndDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'InternalReal'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'KomOwn'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NumDays'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'p_BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'post'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DopGroups'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OPRefReq'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_dep'
        ParamType = ptInput
      end>
  end
  object mtDebitors: TMemoryTable
    Left = 192
    Top = 144
    object mtDebitorsDEP_NAME: TStringField
      FieldName = 'DEP_NAME'
      Size = 100
    end
    object mtDebitorsNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object mtDebitorsID_NUM: TStringField
      FieldName = 'ID_NUM'
      Size = 100
    end
    object mtDebitorsSUM: TFloatField
      FieldName = 'SUM'
    end
    object mtDebitorsSUM_BEFORE_ALFA: TFloatField
      FieldName = 'SUM_BEFORE_ALFA'
    end
    object mtDebitorsSUM_PRE: TFloatField
      FieldName = 'SUM_PRE'
    end
    object mtDebitorsSUM_LAST: TFloatField
      FieldName = 'SUM_LAST'
    end
    object mtDebitorsSUM0: TFloatField
      FieldName = 'SUM0'
    end
    object mtDebitorsSUM30: TFloatField
      FieldName = 'SUM30'
    end
    object mtDebitorsSUM60: TFloatField
      FieldName = 'SUM60'
    end
    object mtDebitorsSUM90: TFloatField
      FieldName = 'SUM90'
    end
    object mtDebitorsDEB_INSIDE: TStringField
      FieldName = 'DEB_INSIDE'
      Size = 1
    end
    object mtDebitorsEXP_DATE: TStringField
      FieldName = 'EXP_DATE'
    end
    object mtDebitorsDEB_DATE: TStringField
      FieldName = 'DEB_DATE'
    end
  end
  object tblExtDebitorka: TTable
    TableName = 'OIL_ExtDebitorka.db'
    Left = 193
    Top = 56
    object tblExtDebitorkaDEP: TStringField
      FieldName = 'DEP'
      Size = 100
    end
    object tblExtDebitorkaORG: TStringField
      FieldName = 'ORG'
      Size = 100
    end
    object tblExtDebitorkaORG_ID: TIntegerField
      FieldName = 'ORG_ID'
    end
    object tblExtDebitorkaORG_INST: TIntegerField
      FieldName = 'ORG_INST'
    end
    object tblExtDebitorkaOWN_GOODS: TStringField
      FieldName = 'OWN_GOODS'
      Size = 1
    end
    object tblExtDebitorkaTIP: TStringField
      FieldName = 'TIP'
      Size = 100
    end
    object tblExtDebitorkaDEB_DATE: TDateField
      FieldName = 'DEB_DATE'
    end
    object tblExtDebitorkaEXP_DATE: TDateField
      FieldName = 'EXP_DATE'
    end
    object tblExtDebitorkaTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object tblExtDebitorkaOKPO: TStringField
      FieldName = 'OKPO'
    end
    object tblExtDebitorkaOPER_TYPE: TIntegerField
      FieldName = 'OPER_TYPE'
    end
    object tblExtDebitorkaDEB_INSIDE: TStringField
      FieldName = 'DEB_INSIDE'
      Size = 1
    end
    object tblExtDebitorkaDOG_ID: TIntegerField
      FieldName = 'DOG_ID'
    end
    object tblExtDebitorkaDOG_INST: TIntegerField
      FieldName = 'DOG_INST'
    end
    object tblExtDebitorkaDOG_NAME: TStringField
      FieldName = 'DOG_NAME'
      Size = 100
    end
    object tblExtDebitorkaSUM_BEFORE_ALFA: TFloatField
      FieldName = 'SUM_BEFORE_ALFA'
    end
    object tblExtDebitorkaSUMPREV: TFloatField
      FieldName = 'SUMPREV'
    end
    object tblExtDebitorkaSUM2000: TFloatField
      FieldName = 'SUM2000'
    end
    object tblExtDebitorkaSUM90: TFloatField
      FieldName = 'SUM90'
    end
    object tblExtDebitorkaSUM60: TFloatField
      FieldName = 'SUM60'
    end
    object tblExtDebitorkaSUM30: TFloatField
      FieldName = 'SUM30'
    end
    object tblExtDebitorkaSUM0: TFloatField
      FieldName = 'SUM0'
    end
  end
  object qRegionRestGazNew: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '--> qRegionRestGazNew,Reports'
      'select azs_id,'
      '       azs_name,'
      '       azs_addr,'
      '       ppon_id,'
      '       to_number('
      
        '         decode(instr(azs_name,'#39#8470#39'),0,null,substr(azs_name,instr' +
        '(azs_name,'#39#8470#39')+1,'
      
        '         decode(nvl(instr(azs_name,'#39' '#39',instr(azs_name,'#39#8470#39')+1),0)' +
        ' ,0,1000,'
      
        '         nvl(instr(azs_name, '#39' '#39', instr(azs_name, '#39#8470#39')+1), 0) )-' +
        'instr(azs_name,'#39#8470#39')-1)'
      '         )'
      '       ) as azsnum,'
      '       sum(prih_tonn) as prih_tonn,'
      '       sum(rash_tonn) as rash_tonn,'
      '       sum(rash_other_tonn) as rash_other_tonn,'
      '       sum(rash_talon_tonn) as rash_talon_tonn,'
      
        '       sum(prih_tonn - rash_tonn - rash_other_tonn - rash_talon_' +
        'tonn) as rest_tonn,'
      '       sum(is_lastday * rash_tonn) as lastday_tonn,'
      '       sum(is_lastday * rash_money) as lastday_money,'
      '       sum(is_period * rash_tonn) as period_tonn,'
      '       sum(is_period * rash_money) as period_money,'
      '       sum(is_lastday * rash_talon_tonn) as lastday_tal_tonn,'
      '       sum(is_period * rash_talon_tonn) as period_tal_tonn,'
      '       sum(is_lastday * rash_card_tonn) as lastday_card_tonn,'
      '       sum(is_period * rash_card_tonn) as period_card_tonn'
      '  from (select Q.*,'
      
        '               decode(sign(to_date(:p_EndDate) - date_ - :NumDay' +
        's + 1), 1, 0, 1) as is_lastday,'
      
        '               decode(sign(date_ - to_date(:p_BeginDate)), -1, 0' +
        ', 1) as is_period,'
      
        '               decode(substr(dog, 1, 2), '#39#1054#1041#39', 1, '#39#1054#1042#39', 1, '#39#1054#1047#39',' +
        ' 1, '#39#1054#1053#39', 1, '#39#1054#1054#39', 1, '#39#1054#1055#39', 1, '#39#1054#1057#39', 1, 0) as is_part_o'
      '          from (select tip,'
      '                       trunc(rep_date) as date_,'
      '                       rep_date,'
      '                       azs.id as azs_id,'
      '                       azs.name as azs_name,'
      '                       azs.addr as azs_addr,'
      '                       azs.par as ppon_id,'
      '                       rs.dog,'
      '                       prih_tonn,'
      '                       rash_tonn,'
      '                       rash_money,'
      '                       rash_talon_tonn,'
      '                       rash_talon_money,'
      '                       rash_other_tonn,'
      '                       0 as rash_card_tonn,'
      '                       0 as rash_card_money'
      '                  from (select --+ ALL_ROWS'
      '                               '#39'o'#39' as tip,'
      '                               drep.rep_date,'
      '                               nvl(dr.pr_count, 0) as prih_tonn,'
      
        '                               nvl(dr.out_nal_count, 0) + nvl(dr' +
        '.out_ved_count, 0) as rash_tonn,'
      
        '                               nvl(dr.out_nal_money, 0) + nvl(dr' +
        '.out_ved_money, 0) as rash_money,'
      
        '                               nvl(dr.out_talon_count, 0) as ras' +
        'h_talon_tonn,'
      
        '                               nvl(dr.out_talon_money, 0) as ras' +
        'h_talon_money,'
      
        '                               nvl(dr.out_sn_count, 0) + nvl(dr.' +
        'out_count, 0) as rash_other_tonn,'
      '                               drep.azs_id,'
      '                               drep.azs_inst,'
      '                               np_type,'
      '                               p.dog'
      '                          from oil_daily_rep drep,'
      '                               oil_dr_data dr,'
      '                               oil_rashod r,'
      '                               oil_part p,'
      
        '                               (select max(rep_date) rep_date, a' +
        'zs_id, azs_inst'
      
        '                                  from (select rep_date, azs_id,' +
        ' azs_inst'
      '                                          from oil_region_rest'
      
        '                                         where trunc(rep_date) <' +
        '= :p_EndDate'
      '                                        union all'
      
        '                                        select to_date('#39'01.01.19' +
        '90'#39', '#39'DD.MM.YYYY'#39') as rep_date,'
      '                                               id as azs_id,'
      '                                               inst as azs_inst'
      '                                          from oil_org'
      '                                         where state='#39'Y'#39' '
      '                                           and id = inst '
      '                                           and org_type = 8)'
      '                                 group by azs_id, azs_inst) rs'
      
        '                         where drep.state = '#39'Y'#39' and dr.state = '#39 +
        'Y'#39' and r.state = '#39'Y'#39' and p.state = '#39'Y'#39
      '                           and dr.oper_type in (0, 1)'
      '                           and r.oper_id in (7, 10)'
      
        '                           and trunc(drep.rep_date) <= :p_EndDat' +
        'e  -- '#1074#1088#1072#1093#1086#1074#1091#1108#1084#1086' '#1074#1077#1089#1100' '#1088#1091#1093' '#1087#1086' 23:59:59,999 '#1076#1072#1090#1080' :p_EndDate'
      
        '                           and trunc(drep.rep_date) > rs.rep_dat' +
        'e  -- '#1075#1088#1072#1085#1080#1095#1085#1072' '#1076#1072#1090#1072' '#1074#1088#1072#1093#1086#1074#1072#1085#1072' '#1074' oil_region_rest'
      
        '                           and trunc(drep.rep_date, '#39'MM'#39') >= tru' +
        'nc(rs.rep_date, '#39'MM'#39')  -- '#1084#1110#1089#1103#1095#1085#1077' '#1076#1077#1088#1077#1074#1094#1077'  '
      '                           and dr.rep_id = drep.id'
      '                           and dr.rep_inst = drep.inst'
      '                           and dr.ttn_id = r.id'
      '                           and dr.ttn_inst = r.inst'
      '                           and r.part_id = p.id'
      '                           and r.part_inst = p.inst'
      '                           and rs.azs_id = drep.azs_id'
      '                           and rs.azs_inst = drep.azs_inst'
      '                        union all'
      '                        select '#39'r'#39' as tip,'
      '                               rs.rep_date,'
      '                               rs.pr_count,'
      
        '                               rs.out_nal_count + rs.out_ved_cou' +
        'nt as rash_tonn,'
      
        '                               rs.out_nal_money + rs.out_ved_mon' +
        'ey as rash_money,'
      
        '                               rs.out_talon_count as rash_talon_' +
        'tonn,'
      
        '                               rs.out_talon_money as rash_talon_' +
        'money,'
      
        '                               rs.out_sn_count + rs.out_count as' +
        ' rash_other_tonn,'
      '                               rs.azs_id,'
      '                               rs.azs_inst,'
      '                               rs.np_type,'
      '                               dog'
      '                          from oil_region_rest rs'
      
        '                         where trunc(rs.rep_date) <= :p_EndDate)' +
        ' rs,'
      '                       v_oil_org_norek azs,'
      '                       oil_np_type npt'
      '                 where rs.np_type = npt.id'
      '                   and rs.azs_id = azs.id'
      '                   and rs.azs_inst = azs.inst'
      '                   and npt.grp_id in (62, 75)'
      '                   and :obl_id in (azs.pponid, azs.oblid)'
      '                union all'
      '                select '#39'c'#39' tip,'
      '                       trunc(rep_date) as date_,'
      '                       rep_date,'
      '                       v.azs_id,'
      '                       v.azs_name,'
      '                       azs.addr as azs_addr,'
      '                       azs.par as ppon_id,'
      '                       v.part_dog as dog,'
      '                       0 as prih_tonn,'
      '                       0 as rash_tonn,'
      '                       0 as rash_money,'
      '                       0 as rash_talon_tonn,'
      '                       0 as rash_talon_money,'
      '                       0 as rash_other_tonn,'
      '                       v.weight as rash_card_tonn,'
      
        '                       round(v.litr * v.rep_price, 2) as rash_ca' +
        'rd_money'
      '                  from v_card_sr_equal v, v_org azs'
      '                 where v.azs_id = azs.id'
      '                   and v.azs_inst = azs.inst'
      '                   and v.np_id in (62, 75)'
      '                   and v.auto_id is null'
      
        '                   and trunc(v.rep_date) between :p_BeginDate an' +
        'd :p_EndDate) Q)'
      ' where is_part_o = 0'
      ' group by ppon_id, azs_name, azs_id, azs_addr'
      
        'having sum(prih_tonn - rash_tonn - rash_other_tonn - rash_talon_' +
        'tonn) <> 0 '
      '    or sum(is_lastday * rash_tonn) <> 0 '
      '    or sum(is_period * rash_tonn) <> 0'
      ' order by ppon_id, azsnum, azs_name')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 40
    Top = 256
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p_EndDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NumDays'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'p_BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'obl_id'
        ParamType = ptInput
      end>
  end
  object qRashVedom: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      
        'select g.rep_date rep_date, c.name np_name,e.name dim_name,sum(t' +
        't.count_) litr,'
      
        '           decode(tt.dim,'#39#1083#1080#1090#1088#39',tt.price,NDS.GetWithNDS_NoNDS(b.' +
        'ss,:date2)) price,b.dog dog,sum(decode(tt.dim,'#39#1083#1080#1090#1088#39',tt.amount,(' +
        'NDS.GetWithNDS_NoNDS(b.ss,:date2)*tt.count_))) as amount,tt.org_' +
        'id'
      'from '
      '( select  t.*,'
      '              decode(t.oper_id,52,t.count_t,t.litr) count_,'
      '              decode(t.oper_id,52,'#39#1090#1086#1085#1085#1072#39','#39#1083#1080#1090#1088#39') dim'
      ' from '
      ' ('
      
        '   select s.id,s.inst,s.oper_id,s.litr,s.price,s.srep_id,s.srep_' +
        'inst,s.date_mod,s.count_t,s.amount,s.org_id,s.org_inst'
      '   from oil_srother s'
      ' union all'
      
        '   select v.id,v.inst,11 as oper_id, v.litr,v.price,v.srep_id,v.' +
        'srep_inst,v.date_mod,v.count_t,v.amount,v.org_id,v.org_inst'
      '   from oil_vedomost v'
      ' ) t'
      
        ')tt, oil_dr_data f, oil_daily_rep g, oil_rashod a, oil_part b, v' +
        '_oil_np_type c, v_oil_dimension e '
      'where f.ttn_id=a.id'
      '    and f.ttn_inst=a.inst'
      '    and f.id=tt.srep_id'
      '    and f.inst=tt.srep_inst'
      '    and f.rep_id=g.id'
      '    and f.rep_inst=g.inst'
      '    and a.part_id=b.id'
      '    and a.part_inst=b.inst'
      '    and b.np_type=c.id'
      '    and e.id=decode(tt.dim,'#39#1083#1080#1090#1088#39',28,'#39#1090#1086#1085#1085#1072#39',2,b.dim_id)'
      
        '    and a.state='#39'Y'#39' and b.state='#39'Y'#39' and e.state='#39'Y'#39'and f.state='#39 +
        'Y'#39'and g.state='#39'Y'#39
      '    --'#1092#1080#1083#1100#1090#1088#1099' '#1089' '#1087#1072#1088#1072#1084#1077#1090#1088#1072#1084#1080
      '    and g.rep_date>=:date1'
      '    and g.rep_date<=:date2'
      '    and g.azs_id=:azs_id'
      '    and g.azs_inst=:azs_inst'
      '    and tt.oper_id=nvl(:oper_id,tt.oper_id)'
      '    and tt.org_id=nvl(:org_id,tt.org_id)'
      
        'group by c.name,decode(tt.dim,'#39#1083#1080#1090#1088#39', tt.price,NDS.GetWithNDS_No' +
        'NDS(b.ss,:date2)),g.rep_date,e.name,b.dog,tt.org_id'
      '   ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 120
    Top = 187
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'date2'
      end
      item
        DataType = ftUnknown
        Name = 'date1'
      end
      item
        DataType = ftUnknown
        Name = 'azs_id'
      end
      item
        DataType = ftUnknown
        Name = 'azs_inst'
      end
      item
        DataType = ftUnknown
        Name = 'oper_id'
      end
      item
        DataType = ftUnknown
        Name = 'org_id'
      end>
    object qRashVedomREP_DATE: TDateTimeField
      FieldName = 'REP_DATE'
    end
    object qRashVedomNP_NAME: TStringField
      FieldName = 'NP_NAME'
      Size = 50
    end
    object qRashVedomDIM_NAME: TStringField
      FieldName = 'DIM_NAME'
      Size = 50
    end
    object qRashVedomLITR: TFloatField
      FieldName = 'LITR'
    end
    object qRashVedomPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object qRashVedomDOG: TStringField
      FieldName = 'DOG'
      Size = 15
    end
    object qRashVedomAMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
  end
  object qTest: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select wt.Name_np,wt.pricetonn,sum(wt.tonn) as tonn,'
      '       sum(wt.litr) as litr,sum(wt.pricetonn*wt.tonn) as sum_'
      'from'
      '('
      ' select  t.*,b.ss priceTonn,c.name Name_Np,g.rep_date from '
      '  ('
      
        '    select s.id,s.inst,s.oper_id,s.litr,s.price,s.srep_id,s.srep' +
        '_inst,s.date_mod,s.count_t tonn,s.amount,s.org_id,s.org_inst'
      '    from oil_srother s'
      '       union all'
      
        '    select v.id,v.inst,11 as oper_id, v.litr,v.price,v.srep_id,v' +
        '.srep_inst,v.date_mod,v.count_t,v.amount,v.org_id,v.org_inst'
      '    from oil_vedomost v'
      
        '   ) t,oil_dr_data f, oil_daily_rep g, oil_rashod a, oil_part b,' +
        ' v_oil_np_type c'
      '      where f.ttn_id=a.id'
      '      and f.ttn_inst=a.inst'
      '      and f.id=t.srep_id'
      '      and f.inst=t.srep_inst'
      '      and f.rep_id=g.id'
      '      and f.rep_inst=g.inst'
      '      and a.part_id=b.id'
      '      and a.part_inst=b.inst'
      '      and b.np_type=c.id'
      
        '      and a.state='#39'Y'#39' and b.state='#39'Y'#39' and f.state='#39'Y'#39'and g.state' +
        '='#39'Y'#39
      '      and g.rep_date>=:Date1'
      '      and g.rep_date<=:Date2'
      '      and g.azs_id=:azs_id'
      '      and g.azs_inst=:azs_inst'
      '      and t.oper_id=nvl(:Oper_id,t.oper_id)'
      ' ) wt'
      ' group by wt.Name_np,wt.pricetonn')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 282
    Top = 55
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date1'
      end
      item
        DataType = ftUnknown
        Name = 'Date2'
      end
      item
        DataType = ftUnknown
        Name = 'azs_id'
      end
      item
        DataType = ftUnknown
        Name = 'azs_inst'
      end
      item
        DataType = ftUnknown
        Name = 'Oper_id'
      end>
    object qTestNAME_NP: TStringField
      FieldName = 'NAME_NP'
      Size = 50
    end
    object qTestPRICETONN: TFloatField
      FieldName = 'PRICETONN'
    end
    object qTestTONN: TFloatField
      FieldName = 'TONN'
    end
    object qTestLITR: TFloatField
      FieldName = 'LITR'
    end
    object qTestSUM_: TFloatField
      FieldName = 'SUM_'
    end
  end
  object qRegionRestGazNB: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '--> qRegionRestGazNb,Reports '
      'select'
      '  sum(rest_store) as rest_store,'
      '  sum(rest_alfa_store) as rest_alfa_store,'
      '  sum(rash_tonn) as rash_tonn,'
      '  sum(rash_summa) as rash_summa,'
      '  sum(rash_lastday_tonn) as rash_lastday_tonn,'
      '  sum(rash_lastday_summa) as rash_lastday_summa,'
      '  sum(in_way) as in_way'
      'from'
      '  (select'
      '    (1-is_store*is_alfa_store)*tonn as rest_store,'
      '    is_store*is_alfa_store*tonn as rest_alfa_store,'
      '    -is_rash*is_oper_real*is_period*tonn as rash_tonn,'
      '    is_rash*is_oper_real*is_period*summa as rash_summa,'
      
        '    -is_rash*is_oper_real*is_lastday*is_period*tonn as rash_last' +
        'day_tonn,'
      
        '    is_rash*is_oper_real*is_lastday*is_period*summa as rash_last' +
        'day_summa,'
      '    0 as in_way'
      '  from'
      '    (select'
      '       date_, tonn, summa,'
      '       decode(own_goods,'#39'O'#39',1,0) as is_own,'
      '       decode(own_goods,'#39'S'#39',1,0) as is_store,'
      
        '       decode(sign(date_-to_date(:BeginDate)),-1,0,1) as is_peri' +
        'od,'
      
        '       decode(sign(to_date(:EndDate)-date_-:NumDays+1),1,0,1) as' +
        ' is_lastday,'
      
        '       decode(partpostid,partpostinst,decode(partpostid,4587,1,3' +
        '8,1,0),0) as is_alfa_store,'
      '       decode(sign(tonn),1,0,1) as is_rash,'
      '       decode(operid,11,1,12,1,0) as is_oper_real'
      '     from'
      '       (select'
      '          date_, partpostid, partpostinst,'
      '          own_goods, operid,'
      '          -tonn as tonn, summa'
      '        from v_oil_npmove'
      '        where nbazs=0'
      '          and date_<=:EndDate'
      '          and oblid = :obl_id'
      '          and np_groupid in (62,75))'
      '    )'
      '  union all'
      '  select'
      '    0, 0, 0, 0, 0, 0,'
      '    v.weight as in_way'
      '  from v_oil_tsw v, oil_np_type npt'
      '  where v.w_np_type=npt.id'
      '    and npt.grp_id in (62,75)'
      '    and v.date_rast<=:EndDate'
      ' )')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 40
    Top = 102
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
        DataType = ftInteger
        Name = 'NumDays'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'obl_id'
        ParamType = ptInput
      end>
  end
  object qRegionRestRezervs: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '--> qRegionRestRezervs,Reports '
      'select /*+ORDERED USE_HASH (rz,npt,rzn)*/'
      '       rz.id_org,'
      '       nvl(dng.group_number + 10000, npt.np_grp) as np_grp_id,'
      
        '       '#39'('#39'||num||'#39') '#39'||inspection_date||'#39': '#39'||capacity||'#39' '#1084'.'#1082#1091#1073';' +
        ' '#39'||comments as str'
      '  from oil_rezervuar       rz,'
      '       v_oil_rez_np_type   rzn,'
      '       v_oil_dop_np_groups dng,'
      '       v_oil_np_type       npt'
      ' where rz.state = '#39'Y'#39
      '   and rz.realvirt = 1'
      '   and rz.condition between 1 and 4'
      '   and rzn.rez_id = rz.id'
      '   and rzn.rez_inst = rz.inst'
      '   and :date_ between rzn.date_from and rzn.date_to'
      '   and rzn.np_type = dng.id(+)'
      '   and rzn.np_type = npt.id'
      '   and rz.inspection_date <= :date_'
      'order by rz.inspection_date')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 282
    Top = 8
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end>
  end
  object mtDep: TMemoryTable
    Left = 120
    Top = 231
    object mtDepNum: TIntegerField
      FieldName = 'Num'
    end
    object mtDepDEP_NAME: TStringField
      DisplayWidth = 20
      FieldName = 'DEP_NAME'
      Size = 250
    end
    object mtDepDEP_ID: TIntegerField
      FieldName = 'DEP_ID'
    end
  end
  object qExtDebitors: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '--> qExtDebitors,Dbplan'
      'select dep,'
      '       org,'
      '       dep_id,'
      '       dep_inst,'
      '       org_id,'
      '       org_inst,'
      '       okpo,'
      '       oper_type,'
      '       deb_date,'
      '       own_goods,'
      '       tip,'
      '       exp_date,'
      '       pay_type,'
      '       pay_corr,'
      '       ord,'
      '       deb_inside,'
      '       decode(pos_type, 0, 0, dog_id) as dog_id,'
      '       decode(pos_type, 0, 0, dog_inst) as dog_inst,'
      '       decode(pos_type, 0, '#39#39', dog_name) as dog_name,'
      '       decode(pos_type, 0, null, dog_date) as dog_date,'
      '       decode(pos_type, 0, '#39#39', dog_type) as dog_type,'
      '       pos_type,'
      '       total'
      '  from (select dep_name as dep,'
      '               org_name as org,'
      '               dep_id,'
      '               dep_inst,'
      '               org_id,'
      '               org_inst,'
      '               okpo,'
      '               oper_type,'
      '               deb_date,'
      '               own_goods,'
      '               tip,'
      '               exp_date,'
      '               pay_type,'
      '               pay_corr,'
      '               ord,'
      '               deb_inside,'
      '               d.dog_id,'
      '               d.dog_inst,'
      '               dog_name,'
      '               dog_date,'
      '               dog_type,'
      
        '               decode(nvl(sign(trunc(dog_date) - to_date('#39'01.10.' +
        '2007'#39')), 0),'
      '                      1,'
      '                      decode(dog_type,'
      '                             '#39'K'#39','
      '                             decode(nvl(sign(trunc(dog_date) -'
      
        '                                             to_date('#39'01.09.2008' +
        #39')),'
      '                                        0),'
      '                                    1,'
      
        '                                    decode(count(m.dog_id), 0, 0' +
        ', d.dog_id),'
      '                                    0),'
      
        '                             decode(count(m.dog_id), 0, 0, d.dog' +
        '_id)),'
      '                      0) as pos_type,'
      '               sum(total) as total'
      '          from v_oil_debitorka d,'
      '               (select dog_id, dog_inst'
      '                  from oil_money m, oil_dog d'
      '                 where m.state = '#39'Y'#39
      '                   and d.state = '#39'Y'#39
      '                   and m.dog_id = d.id'
      '                   and m.dog_inst = d.inst'
      '                 group by dog_id, dog_inst) m'
      '         where deb_date < :p_BeginDate'
      '           and :p_dep in (dep_id, dep_par_id)'
      '           and (org_type in (1, 11) or Deb_Inside = '#39'Y'#39')'
      '           and m.dog_id(+) = d.dog_id'
      '           and m.dog_inst(+) = d.dog_inst'
      '         group by dep_name,'
      '                  org_name,'
      '                  dep_id,'
      '                  dep_inst,'
      '                  org_id,'
      '                  org_inst,'
      '                  okpo,'
      '                  oper_type,'
      '                  deb_date,'
      '                  own_goods,'
      '                  tip,'
      '                  exp_date,'
      '                  pay_type,'
      '                  pay_corr,'
      '                  d.dog_id,'
      '                  d.dog_inst,'
      '                  dog_name,'
      '                  dog_date,'
      '                  dog_type,'
      '                  ord,'
      '                  deb_inside)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 193
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'p_dep'
      end>
  end
  object qExtDebitReport: TQuery
    OnCalcFields = qExtDebitReportCalcFields
    SQL.Strings = (
      
        'select * from oil_extdebitorka order by dep, own_goods, org, deb' +
        '_date')
    Left = 192
    Top = 100
    object qExtDebitReportDEP: TStringField
      FieldName = 'DEP'
      Origin = '"oil_extdebitorka.DB".DEP'
      Size = 100
    end
    object qExtDebitReportORG: TStringField
      FieldName = 'ORG'
      Origin = '"oil_extdebitorka.DB".ORG'
      Size = 100
    end
    object qExtDebitReportORG_ID: TIntegerField
      FieldName = 'ORG_ID'
      Origin = '"oil_extdebitorka.DB".ORG_ID'
    end
    object qExtDebitReportORG_INST: TIntegerField
      FieldName = 'ORG_INST'
      Origin = '"oil_extdebitorka.DB".ORG_INST'
    end
    object qExtDebitReportOWN_GOODS: TStringField
      FieldName = 'OWN_GOODS'
      Origin = '"oil_extdebitorka.DB".OWN_GOODS'
      Size = 1
    end
    object qExtDebitReportTIP: TStringField
      FieldName = 'TIP'
      Origin = '"oil_extdebitorka.DB".TIP'
      Size = 100
    end
    object qExtDebitReportDEB_DATE: TDateField
      FieldName = 'DEB_DATE'
      Origin = '"oil_extdebitorka.DB".DEB_DATE'
    end
    object qExtDebitReportEXP_DATE: TDateField
      FieldName = 'EXP_DATE'
      Origin = '"oil_extdebitorka.DB".EXP_DATE'
    end
    object qExtDebitReportTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = '"oil_extdebitorka.DB".TOTAL'
    end
    object qExtDebitReportOKPO: TStringField
      FieldName = 'OKPO'
      Origin = '"oil_extdebitorka.DB".OKPO'
    end
    object qExtDebitReportDEBIT_OWN_TYPE: TStringField
      FieldKind = fkCalculated
      FieldName = 'DEBIT_OWN_TYPE'
      Calculated = True
    end
    object qExtDebitReportSTR_EXP_DATE: TStringField
      FieldKind = fkCalculated
      FieldName = 'STR_EXP_DATE'
      Size = 30
      Calculated = True
    end
    object qExtDebitReportSTR_DEB_DATE: TStringField
      FieldKind = fkCalculated
      FieldName = 'STR_DEB_DATE'
      Size = 30
      Calculated = True
    end
    object qExtDebitReportOPER_TYPE: TIntegerField
      FieldName = 'OPER_TYPE'
      Origin = '"oil_extdebitorka.DB".OPER_TYPE'
    end
    object qExtDebitReportDEB_INSIDE: TStringField
      FieldName = 'DEB_INSIDE'
      Origin = '"oil_extdebitorka.DB".DEB_INSIDE'
      Size = 1
    end
    object qExtDebitReportDOG_ID: TIntegerField
      FieldName = 'DOG_ID'
    end
    object qExtDebitReportDOG_INST: TIntegerField
      FieldName = 'DOG_INST'
    end
    object qExtDebitReportDOG_NAME: TStringField
      FieldName = 'DOG_NAME'
      Size = 100
    end
    object qExtDebitReportSUM_BEFORE_ALFA: TFloatField
      FieldName = 'SUM_BEFORE_ALFA'
    end
    object qExtDebitReportSUMPREV: TFloatField
      FieldName = 'SUMPREV'
    end
    object qExtDebitReportSUM2000: TFloatField
      FieldName = 'SUM2000'
    end
    object qExtDebitReportSUM90: TFloatField
      FieldName = 'SUM90'
    end
    object qExtDebitReportSUM60: TFloatField
      FieldName = 'SUM60'
    end
    object qExtDebitReportSUM30: TFloatField
      FieldName = 'SUM30'
    end
    object qExtDebitReportSUM0: TFloatField
      FieldName = 'SUM0'
    end
  end
  object qRegionRestGaz: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '--> qRegionRestGaz,Reports'
      'select'
      '  azs_id, azs_name, azs_addr, ppon_id,'
      '  to_number('
      
        '    decode(instr(azs_name,'#39#8470#39'),0,null,substr(azs_name,instr(azs_' +
        'name,'#39#8470#39')+1,'
      
        '    decode(nvl(instr(azs_name,'#39' '#39',instr(azs_name,'#39#8470#39')+1),0) ,0,1' +
        '000,'
      
        '    nvl(instr(azs_name, '#39' '#39', instr(azs_name, '#39#8470#39')+1), 0) )-instr' +
        '(azs_name,'#39#8470#39')-1)'
      '    )'
      '  ) as azsnum,'
      
        '  sum(prih_tonn-rash_tonn-rash_other_tonn-rash_talon_tonn) as re' +
        'st_tonn,'
      '  sum(is_lastday*rash_tonn) as lastday_tonn,'
      '  sum(is_lastday*rash_money) as lastday_money,'
      '  sum(is_period*rash_tonn) as period_tonn,'
      '  sum(is_period*rash_money) as period_money,'
      '  sum(is_lastday*rash_talon_tonn) as lastday_tal_tonn,'
      '  sum(is_period*rash_talon_tonn) as period_tal_tonn,'
      '  sum(is_lastday*rash_card_tonn) as lastday_card_tonn,'
      '  sum(is_period*rash_card_tonn) as period_card_tonn'
      'from'
      '   (select'
      '      Q.*,'
      
        '      decode(sign(to_date(:p_EndDate)-date_-:NumDays+1),1,0,1) a' +
        's is_lastday,'
      
        '      decode(sign(date_-to_date(:p_BeginDate)),-1,0,1) as is_per' +
        'iod,'
      
        '      decode(substr(dog,1,2),'#39#1054#1041#39',1,'#39#1054#1042#39',1,'#39#1054#1047#39',1,'#39#1054#1053#39',1,'#39#1054#1054#39',1,' +
        #39#1054#1055#39',1,'#39#1054#1057#39',1,0) as is_part_o'
      '      from'
      '       (select'
      '          trunc(drep.rep_date) as date_,'
      
        '          azs.id as azs_id, azs.name as azs_name, azs.addr as az' +
        's_addr, azs.par as ppon_id,p.dog,'
      '          nvl(dr.pr_count,0) as prih_tonn,'
      
        '          nvl(dr.out_nal_count,0)+nvl(dr.out_ved_count,0) as ras' +
        'h_tonn,'
      
        '          nvl(dr.out_nal_money,0)+nvl(dr.out_ved_money,0) as ras' +
        'h_money,'
      '          nvl(dr.out_talon_count,0) as rash_talon_tonn,'
      '          nvl(dr.out_talon_money,0) as rash_talon_money,'
      
        '          nvl(dr.out_sn_count,0)+nvl(dr.out_count,0) as rash_oth' +
        'er_tonn,'
      '          0 as rash_card_tonn,'
      '          0 as rash_card_money'
      
        '        from oil_daily_rep drep, oil_dr_data dr, oil_rashod r, o' +
        'il_part p, v_oil_org_norek azs, oil_np_type npt'
      
        '        where drep.state='#39'Y'#39' and dr.state='#39'Y'#39' and r.state='#39'Y'#39' an' +
        'd p.state='#39'Y'#39
      '          and dr.rep_id=drep.id and dr.rep_inst=drep.inst'
      '          and dr.ttn_id=r.id and dr.ttn_inst=r.inst'
      '          and r.part_id=p.id and r.part_inst=p.inst'
      '          and p.np_type=npt.id'
      '          and drep.azs_id=azs.id and drep.azs_inst=azs.inst'
      '          and npt.grp_id in (62,75)'
      '          and trunc(drep.rep_date)<=:p_EndDate'
      '          and :obl_id in (azs.pponid,azs.oblid)'
      '        union all'
      '        select'
      '          trunc(rep_date) as date_,'
      '          v.azs_id, v.azs_name,'
      '          azs.addr as azs_addr,'
      '          azs.par as ppon_id,'
      '          v.part_dog as dog,'
      '          0 as prih_tonn,'
      '          0 as rash_tonn,'
      '          0 as rash_money,'
      '          0 as rash_talon_tonn,'
      '          0 as rash_talon_money,'
      '          0 as rash_other_tonn,'
      '          v.weight as rash_card_tonn,'
      '          round(v.litr*v.rep_price,2) as rash_card_money'
      '        from v_card_sr_equal v, v_org azs'
      '        where v.azs_id=azs.id and v.azs_inst=azs.inst'
      '          and v.np_id in (62,75)'
      '          and v.auto_id is null'
      
        '          and trunc(v.rep_date) between :p_BeginDate and :p_EndD' +
        'ate'
      '          and share_id is null'
      '     ) Q'
      '   )'
      'where is_part_o=0'
      'group by ppon_id, azs_name,azs_id, azs_addr'
      'having'
      '  sum(prih_tonn-rash_tonn-rash_other_tonn-rash_talon_tonn)<>0 or'
      '  sum(is_lastday*rash_tonn)<>0 or'
      '  sum(is_period*rash_tonn)<>0'
      'order by ppon_id,azsnum,azs_name')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 40
    Top = 56
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p_EndDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NumDays'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'p_BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'obl_id'
        ParamType = ptInput
      end>
  end
  object qExtDebitorsLS: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '--> qExtDebitorsLS,Dbplan'
      'select forepay,'
      '       org_grp_name,'
      '       org_name,'
      '       dog,'
      '       okpo,'
      '       days_allowed,'
      '       summa_allowed,'
      '       otov30,'
      '       sum(total) as total,'
      '       sum(total_allowed) as total_allowed,'
      '       sum(total_not_allowed) as total_not_allowed,'
      '       sum(total_30) as total_30,'
      '       sum(total_60) as total_60,'
      '       sum(total_90) as total_90,'
      '       sum(total_greater_90) as total_greater_90,'
      '       sum(total_prev_year) as total_prev_year,'
      '       sum(total_last_year) as total_last_year,'
      '       sum(otov_no_bill) as otov_no_bill,'
      '       min_date_no_bill,'
      '       max_date_no_bill'
      '  from (select own_goods_name,'
      '               org_name,'
      '               tip,'
      '               tip_id,'
      '               okpo,'
      '               org_grp_name,'
      '               total,'
      '               deb_date,'
      '               waited_date,'
      '               dog,'
      '               forepay,'
      '               otov30,'
      '               otov_no_bill,'
      '               max_date_no_bill,'
      '               min_date_no_bill,'
      '               days_allowed,'
      '               summa_allowed,'
      '               is_allowed * total as total_allowed,'
      '               total - is_allowed * total as total_not_allowed,'
      '               (1 - is_allowed) * is_30 * total as total_30,'
      
        '               (1 - is_allowed) * (1 - is_30) * is_60 * total as' +
        ' total_60,'
      
        '               (1 - is_allowed) * (1 - is_60) * is_90 * total as' +
        ' total_90,'
      
        '               (1 - is_allowed) * (1 - is_90) * is_curr_year * t' +
        'otal as total_greater_90,'
      
        '               (1 - is_allowed) * (1 - is_90) * is_last_year * t' +
        'otal as total_last_year,'
      '               is_prev_year * total as total_prev_year'
      '          from (select org_id,'
      '                       org_inst,'
      '                       org_name,'
      '                       okpo,'
      '                       org_grp_name,'
      '                       own_goods_name,'
      '                       tip,'
      '                       tip_id,'
      '                       deb_date,'
      '                       waited_date,'
      '                       dog,'
      '                       forepay,'
      '                       otov30,'
      '                       otov_no_bill,'
      '                       max_date_no_bill,'
      '                       min_date_no_bill,'
      
        '                       decode(sign(days_allowed - days), 1, 1, 0' +
        ') as is_allowed,'
      
        '                       decode(sign(30 - days), 1, 1, 0) as is_30' +
        ','
      
        '                       decode(sign(60 - days), 1, 1, 0) as is_60' +
        ','
      
        '                       decode(sign(90 - days), 1, 1, 0) as is_90' +
        ','
      
        '                       decode(year, curr_year, 1, 0) as is_curr_' +
        'year,'
      
        '                       decode(year, curr_year - 1, 1, 0) as is_l' +
        'ast_year,'
      
        '                       decode(sign(curr_year - 1 - year), 1, 1, ' +
        '0) as is_prev_year,'
      '                       days_allowed,'
      '                       summa_allowed,'
      
        '                       decode(tip_id, 2, summ_tip, total) as tot' +
        'al'
      '                  from (select Q2.*,'
      
        '                               min(rnum) over(partition by own_g' +
        'oods, org_id, org_inst, tip) as rnum_min_tip,'
      
        '                               sum(total) over(partition by own_' +
        'goods, org_id, org_inst, tip) as summ_tip'
      
        '                          from (select Q1.*, least(total_base, s' +
        'umm) as total'
      '                                  from (select /*+ORDERED*/'
      '                                         org_id,'
      '                                         org_inst,'
      '                                         org_name,'
      '                                         okpo,'
      
        '                                         org_grp_name as org_grp' +
        '_name,'
      '                                         own_goods_name,'
      '                                         tip,'
      '                                         tip_id,'
      '                                         deb.dog,'
      '                                         decode(deb.forepay,'
      '                                                1,'
      '                                                '#39#1087#1088#1077#1076#1086#1087#1083#1072#1090#1072#39','
      
        '                                                '#39#1086#1090#1089#1088#1086#1095#1082#1072#39') as f' +
        'orepay,'
      '                                         own_goods,'
      '                                         deb_date,'
      '                                         waited_date,'
      '                                         ord,'
      '                                         rnum,'
      '                                         total as total_base,'
      
        '                                         nvl(crd.otov30, 0) as o' +
        'tov30,'
      
        '                                         trunc(to_date(:p_BeginD' +
        'ate)) - deb_date as days,'
      
        '                                         to_number(to_char(deb_d' +
        'ate, '#39'YYYY'#39')) as year,'
      
        '                                         to_number(to_char(to_da' +
        'te(:p_BeginDate),'
      
        '                                                           '#39'YYYY' +
        #39')) as curr_year,'
      
        '                                         nvl(days_allowed, 0) as' +
        ' days_allowed,'
      
        '                                         trunc(nvl(summa_allowed' +
        ', 0) / 1000) as summa_allowed,'
      
        '                                         sum(total) over(partiti' +
        'on by own_goods, org_id, org_inst order by rnum) as summ,'
      
        '                                         nvl(crd_no_bill.otov_no' +
        '_bill, 0) as otov_no_bill,'
      '                                         min_date_no_bill,'
      '                                         max_date_no_bill'
      
        '                                          from (select --+PUSH_S' +
        'UBQ'
      '                                                 v.*,'
      
        '                                                 row_number() ov' +
        'er(order by ord, deb_date, tip_id) as rnum,'
      '                                                 dog.forepay,'
      '                                                 dog.dog'
      
        '                                                  from v_oil_deb' +
        'itorka v,'
      
        '                                                       (select t' +
        'o_,'
      
        '                                                               t' +
        'o_inst,'
      
        '                                                               d' +
        'og,'
      
        '                                                               f' +
        'orepay'
      
        '                                                          from (' +
        'select dog.*,'
      
        '                                                                ' +
        '       row_number() over(partition by to_, to_inst order by dog_' +
        'date) as rnum'
      
        '                                                                ' +
        '  from oil_dog dog'
      
        '                                                                ' +
        ' where state = '#39'Y'#39
      
        '                                                                ' +
        '   and dog_type = '#39'K'#39
      
        '                                                                ' +
        '   and sub_type = 101)'
      
        '                                                         where r' +
        'num = 1) dog'
      
        '                                                 where v.deb_ins' +
        'ide <> '#39'Y'#39
      
        '                                                   and v.deb_dat' +
        'e < :p_BeginDate'
      
        '                                                   and v.dep_id ' +
        '= :p_dep'
      
        '                                                   and v.dep_ins' +
        't = :p_dep'
      
        '                                                   and v.org_id ' +
        '= dog.to_'
      
        '                                                   and v.org_ins' +
        't = dog.to_inst) deb,'
      '                                               (select to_id,'
      '                                                       to_inst,'
      
        '                                                       sum(round' +
        '(pricends * litr,'
      
        '                                                                ' +
        ' 2)) as otov30'
      
        '                                                  from v_card_eq' +
        'ual_ls'
      
        '                                                 where date_ bet' +
        'ween'
      
        '                                                       to_date(:' +
        'p_BeginDate) - 30 and'
      
        '                                                       to_date(:' +
        'p_BeginDate) - 1'
      
        '                                                 group by to_id,' +
        ' to_inst) crd,'
      '                                               (select to_id,'
      '                                                       to_inst,'
      
        '                                                       sum(sumnd' +
        's) as otov_no_bill,'
      
        '                                                       min(date_' +
        ') as min_date_no_bill,'
      
        '                                                       max(date_' +
        ') as max_date_no_bill'
      
        '                                                  from v_card_eq' +
        'ual_ls'
      
        '                                                 where rest is n' +
        'ull'
      
        '                                                   and prepay = ' +
        '0'
      
        '                                                   and chek_date' +
        ' is null'
      
        '                                                 group by to_id,' +
        ' to_inst) crd_no_bill'
      
        '                                         where deb.org_id = crd.' +
        'to_id(+)'
      
        '                                           and deb.org_inst = cr' +
        'd.to_inst(+)'
      
        '                                           and deb.org_id = crd_' +
        'no_bill.to_id(+)'
      '                                           and deb.org_inst ='
      
        '                                               crd_no_bill.to_in' +
        'st(+)) Q1'
      '                                 where summ > 0) Q2)'
      '                 where tip_id <> 2'
      '                    or rnum = rnum_min_tip) Q3)'
      ' where tip_id = 12'
      ' group by org_grp_name,'
      '          dog,'
      '          okpo,'
      '          forepay,'
      '          org_name,'
      '          days_allowed,'
      '          summa_allowed,'
      '          otov30,'
      '          min_date_no_bill,'
      '          max_date_no_bill')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 193
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'p_dep'
      end>
  end
  object qSvodFilAZS: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '-->qSvodFilAZS,Reports'
      'select /*VERSION=107.1.2*/'
      
        '       decode(sign(out_bankcard_litr+out_talon_litr+out_nal_litr' +
        '+out_card_litr+out_ved_litr),'
      
        '                       0,0,round((out_bankcard_summa+out_talon_s' +
        'umma+out_nal_summa+out_card_summa+out_ved_summa)/(out_bankcard_l' +
        'itr+out_talon_litr+out_nal_litr+out_card_litr+out_ved_litr),'
      '                                 2)) as avg_litrprice,'
      
        '       decode(sign(out_bankcard_litr+out_talon_litr+out_nal_litr' +
        '+out_card_litr+out_ved_litr),'
      
        '                       0,0,round((out_bankcard_kg+out_talon_kg+o' +
        'ut_nal_kg+out_card_kg+out_ved_kg)/(out_bankcard_litr+out_talon_l' +
        'itr+out_nal_litr+out_card_litr+out_ved_litr),'
      '                                 2)) as density,    '
      '       Q2.*'
      '       from ('
      'select distinct tip_id,'
      '                azs.id as azs_id,'
      '                substr(azs.name||'#39' '#39','
      '                       instr(azs.name, '#39#8470#39')+1,'
      
        '                       instr(azs.name||'#39' '#39', '#39' '#39', instr(azs.name,' +
        ' '#39#8470#39')) - instr(azs.name, '#39#8470#39')-1)'
      '                       as azs_num,'
      '                azs.name as azs_name,'
      '                nb_id,'
      '                oo.name as nb_name,'
      '                substr(oo.name||'#39' '#39','
      '                       instr(oo.name, '#39#8470#39')+1,'
      
        '                       instr(oo.name||'#39' '#39', '#39' '#39', instr(oo.name, '#39 +
        #8470#39')) - instr(oo.name, '#39#8470#39')-1)'
      '                       as nb_num,'
      '                npg.id as npg_id,'
      '                npg.name as npg_name,'
      '                rest_kg,'
      '                rest_litr,'
      '                prih_nb_kg,'
      '                prih_nb_litr,'
      '                out_nal_kg,'
      '                out_nal_litr,'
      '                out_nal_summa,'
      '                out_bankcard_kg,'
      '                out_bankcard_litr,'
      '                out_bankcard_summa,'
      '                out_talon_kg,'
      '                out_talon_litr,'
      '                out_talon_summa,'
      '                out_card_kg,'
      '                out_card_litr,'
      '                out_card_summa,'
      '                out_ved_kg,'
      '                out_ved_litr,'
      '                out_ved_summa,'
      '                out_other_kg,'
      '                out_other_litr,'
      '                out_other_summa,'
      '                tubing_litr'
      '  from (select'
      '           tip_id,'
      '           oper_id,'
      '           nb_id,'
      '           azs_id,'
      '           npg_id,'
      '           1000*real_tonn as real_kg,'
      '           real_litr,'
      '           real_summa,'
      
        '           1000*sum(prih_tonn) over (partition by nb_id, azs_id,' +
        ' npg_id) as prih_nb_kg,'
      
        '           sum(prih_litr) over (partition by nb_id, azs_id, npg_' +
        'id) as prih_nb_litr,'
      
        '           1000*sum(rest_tonn) over (partition by azs_id, npg_id' +
        ') as rest_kg,'
      
        '           sum(rest_litr) over (partition by azs_id, npg_id) as ' +
        'rest_litr,'
      
        '           1000*sum(out_nal_tonn) over (partition by azs_id, npg' +
        '_id) as out_nal_kg,'
      
        '           sum(out_nal_litr) over (partition by azs_id, npg_id) ' +
        'as out_nal_litr,'
      
        '           sum(out_nal_summa) over (partition by azs_id, npg_id)' +
        ' as out_nal_summa,'
      
        '           1000*sum(decode(oper_id, 201, real_tonn, 0)) over (pa' +
        'rtition by azs_id, npg_id) as out_bankcard_kg,'
      
        '           sum(decode(oper_id, 201, real_litr, 0)) over (partiti' +
        'on by azs_id, npg_id) as out_bankcard_litr,'
      
        '           sum(decode(oper_id, 201, real_summa, 0)) over (partit' +
        'ion by azs_id, npg_id) as out_bankcard_summa,'
      
        '           1000*sum(out_talon_tonn) over (partition by azs_id, n' +
        'pg_id) as out_talon_kg,'
      
        '           sum(out_talon_litr) over (partition by azs_id, npg_id' +
        ') as out_talon_litr,'
      
        '           sum(out_talon_summa) over (partition by azs_id, npg_i' +
        'd) as out_talon_summa,'
      
        '           1000*sum(decode(oper_id, 153, real_tonn, 0)) over (pa' +
        'rtition by azs_id, npg_id) as out_card_kg,'
      
        '           sum(decode(oper_id, 153, real_litr, 0)) over (partiti' +
        'on by azs_id, npg_id) as out_card_litr,'
      
        '           sum(decode(oper_id, 153, real_summa, 0)) over (partit' +
        'ion by azs_id, npg_id) as out_card_summa,'
      
        '           1000*sum(decode(oper_id, 11, real_tonn, 0)) over (par' +
        'tition by azs_id, npg_id) as out_ved_kg,'
      
        '           sum(decode(oper_id, 11, real_litr, 0)) over (partitio' +
        'n by azs_id, npg_id) as out_ved_litr,'
      
        '           sum(decode(oper_id, 11, real_summa, 0)) over (partiti' +
        'on by azs_id, npg_id) as out_ved_summa,'
      
        '           1000*sum(decode(oper_id,11,0,153,0,201,0,real_tonn)) ' +
        'over (partition by azs_id, npg_id) as out_other_kg,'
      
        '           sum(decode(oper_id,11,0,153,0,201,0,real_litr)) over ' +
        '(partition by azs_id, npg_id) as out_other_litr,'
      
        '           sum(decode(oper_id,11,0,153,0,201,0,real_summa)) over' +
        ' (partition by azs_id, npg_id) as out_other_summa,'
      
        '           sum(tubing_litr) over (partition by azs_id, npg_id) a' +
        's tubing_litr'
      '          from ('
      
        '                select -- '#1047#1072#1083#1080#1096#1082#1080' + '#1055#1088#1080#1093#1086#1076#1080' '#1079' '#1053#1041' + '#1058#1072#1083#1086#1085#1080' '#1086#1090#1086#1074#1072#1088 +
        #1077#1085#1110' + '#1053#1072#1083
      
        '                       decode(sign(sum(prih_tonn)), 1, 1, 2) as ' +
        'tip_id,'
      '                       decode(np_grp,4,5,np_grp) as npg_id,'
      '                       to_number(null) as oper_id,'
      '                       azs_id,'
      '                       nb_id,'
      '                       nvl(sum(prih_tonn),0) as prih_tonn,'
      '                       nvl(sum(prih_litr),0) as prih_litr,'
      '                       nvl(sum(rest_tonn),0) as rest_tonn,'
      '                       nvl(sum(rest_litr),0) as rest_litr,'
      '                       0 as real_litr,'
      '                       0 as real_tonn,'
      '                       0 as real_summa,'
      '                       sum(out_nal_litr) as out_nal_litr,'
      '                       sum(out_nal_tonn) as out_nal_tonn,'
      '                       sum(out_nal_summa) as out_nal_summa,'
      '                       sum(out_talon_litr) as out_talon_litr,'
      '                       sum(out_talon_tonn) as out_talon_tonn,'
      '                       sum(out_talon_summa) as out_talon_summa,'
      '                       0 as tubing_litr'
      '                  from (select '#39'drep'#39' as tp,'
      '                                np.np_grp as np_grp,'
      '                                drep.azs_id as azs_id,'
      '                                r.from_id as nb_id,'
      
        '                                sum(decode(trunc(drep.rep_date),' +
        'to_date(:p_RepDate),1,0)*nvl(dr.pr_count,0)) as prih_tonn,'
      
        '                                sum(decode(trunc(drep.rep_date),' +
        'to_date(:p_RepDate),1,0)*nvl(dr.pr_litr,0)) as prih_litr,'
      
        '                                sum(decode(trunc(drep.rep_date),' +
        'to_date(:p_RepDate),0,1)* --'#1079#1072#1083#1080#1096#1086#1082' ['#1082#1075'] '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082' '#1076#1085#1103
      
        '                                     (nvl(dr.pr_count,0) - nvl(d' +
        'r.out_nal_count,0) -'
      
        '                                      nvl(dr.out_ved_count,0) - ' +
        'nvl(dr.out_count,0) -'
      
        '                                      nvl(dr.out_talon_count,0) ' +
        '- nvl(dr.out_sn_count,0))'
      '                                    ) as rest_tonn,'
      
        '                                sum(decode(trunc(drep.rep_date),' +
        'to_date(:p_RepDate),0,1)* --'#1079#1072#1083#1080#1096#1086#1082' ['#1083'] '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082' '#1076#1085#1103
      
        '                                     (nvl(dr.pr_litr,0) - nvl(dr' +
        '.out_nal_litr,0) -'
      
        '                                      nvl(dr.out_ved_litr,0) - n' +
        'vl(dr.out_litr,0) -'
      
        '                                      nvl(dr.out_talon_litr,0) -' +
        ' nvl(dr.out_sn_litr,0))'
      '                                    ) as rest_litr,'
      
        '                                sum(decode(trunc(drep.rep_date),' +
        'to_date(:p_RepDate),1,0)*nvl(dr.out_nal_litr,0)) as out_nal_litr' +
        ','
      
        '                                sum(decode(trunc(drep.rep_date),' +
        'to_date(:p_RepDate),1,0)*nvl(dr.out_nal_count,0)) as out_nal_ton' +
        'n,'
      
        '                                sum(decode(trunc(drep.rep_date),' +
        'to_date(:p_RepDate),1,0)*nvl(dr.out_nal_money,0)) as out_nal_sum' +
        'ma,'
      
        '                                sum(decode(trunc(drep.rep_date),' +
        'to_date(:p_RepDate),1,0)*nvl(dr.out_talon_litr,0)) as out_talon_' +
        'litr,'
      
        '                                sum(decode(trunc(drep.rep_date),' +
        'to_date(:p_RepDate),1,0)*nvl(dr.out_talon_count,0)) as out_talon' +
        '_tonn,'
      
        '                                sum(decode(trunc(drep.rep_date),' +
        'to_date(:p_RepDate),1,0)*decode(nvl(dr.out_talon_money,0),0,dr.o' +
        'ut_talon_litr*dr.s_price,nvl(dr.out_talon_money,0))) as out_talo' +
        'n_summa                         '
      '                           from oil_daily_rep drep,'
      '                                oil_dr_data dr,'
      '                                oil_rashod r,'
      '                                oil_part p,'
      '                                v_oil_np_type np,'
      
        '                                (select max(rep_date) as rep_dat' +
        'e,'
      '                                        azs_id,'
      '                                        azs_inst'
      
        '                                   from (select rep_date, azs_id' +
        ', azs_inst'
      '                                           from oil_region_rest'
      
        '                                          where trunc(rep_date) ' +
        '<= to_date(:p_RepDate)'
      '                                         union all'
      
        '                                         select to_date('#39'01.01.1' +
        '990'#39', '#39'dd.mm.yyyy'#39') as rep_date,'
      '                                                id as azs_id,'
      '                                                inst as azs_inst'
      '                                           from oil_org'
      '                                          where state = '#39'Y'#39
      '                                            and id = inst'
      '                                            and org_type = 8)'
      '                                  group by azs_id, azs_inst) orr'
      
        '                          where drep.state = '#39'Y'#39' and dr.state = ' +
        #39'Y'#39' and r.state = '#39'Y'#39' and p.state='#39'Y'#39
      
        '                            and trunc(drep.rep_date) <= to_date(' +
        ':p_RepDate) -- '#1074#1088#1072#1093#1086#1074#1091#1108#1084#1086' '#1074#1077#1089#1100' '#1088#1091#1093' '#1076#1086' 23:59:59,999 '#1076#1072#1090#1080' :p_RepDa' +
        'te'
      
        '                            and trunc(drep.rep_date) > trunc(orr' +
        '.rep_date) -- '#1075#1088#1072#1085#1080#1095#1085#1072' '#1076#1072#1090#1072' '#1074#1088#1072#1093#1086#1074#1072#1085#1072' '#1074' oil_region_rest'
      
        '                            and trunc(drep.rep_date, '#39'mm'#39') >= tr' +
        'unc(orr.rep_date, '#39'mm'#39') -- '#1084#1110#1089#1103#1095#1085#1077' '#1076#1077#1088#1077#1074#1094#1077
      '                            and dr.oper_type in (0, 1)'
      
        '                            and r.oper_id <> 52 -- '#1042#1079#1072#1108#1084#1086#1079#1072#1083#1110#1082' '#1089 +
        #1087#1086#1085#1089#1086#1088#1089#1100#1082#1072' '#1076#1086#1087#1086#1084#1086#1075#1072
      '                            and dr.ttn_id = r.id'
      '                            and dr.ttn_inst = r.inst'
      '                            and r.part_id = p.id'
      '                            and r.part_inst = p.inst'
      '                            and p.np_type = np.id'
      '                            and dr.rep_id = drep.id'
      '                            and dr.rep_inst = drep.inst'
      '                            and drep.azs_id = orr.azs_id'
      '                            and drep.azs_inst = orr.azs_inst'
      
        '                          group by np.np_grp, drep.azs_id, r.fro' +
        'm_id, decode(trunc(drep.rep_date),to_date(:p_RepDate),1,0)'
      '                          union all'
      '                         select '#39'orr'#39' as tp,'
      '                                np.np_grp,'
      '                                azs_id,'
      '                                to_number(null) as nb_id,'
      '                                0 as prih_tonn,'
      '                                0 as prih_litr,'
      
        '                                sum(nvl(pr_count, 0) - nvl(out_n' +
        'al_count, 0) -'
      
        '                                    nvl(out_ved_count, 0) - nvl(' +
        'out_count, 0) -'
      
        '                                    nvl(out_talon_count, 0) - nv' +
        'l(out_sn_count, 0)) as rest_tonn,'
      
        '                                sum(nvl(pr_litr, 0) - nvl(out_na' +
        'l_litr, 0) -'
      
        '                                    nvl(out_ved_litr, 0) - nvl(o' +
        'ut_litr, 0) -'
      
        '                                    nvl(out_talon_litr, 0) - nvl' +
        '(out_sn_litr, 0)) as rest_litr,'
      '                                0 as out_nal_litr,'
      '                                0 as out_nal_tonn,'
      '                                0 as out_nal_summa,'
      '                                0 as out_talon_litr,'
      '                                0 as out_talon_tonn,'
      '                                0 as out_talon_summa'
      
        '                           from oil_region_rest r, oil_part p, v' +
        '_oil_np_type np'
      '                          where p.state='#39'Y'#39
      
        '                            and trunc(rep_date) <= to_date(:p_Re' +
        'pDate)-1'
      '                            and p.id = r.part_id'
      '                            and p.inst = r.part_inst'
      '                            and np.id = p.np_type'
      '                          group by azs_id, np.np_grp'
      
        '                         having sum(nvl(pr_count, 0) - nvl(out_n' +
        'al_count, 0) -'
      
        '                                    nvl(out_ved_count, 0) - nvl(' +
        'out_count, 0) -'
      
        '                                    nvl(out_talon_count, 0) - nv' +
        'l(out_sn_count, 0))>0'
      
        '                            and sum(nvl(pr_litr, 0) - nvl(out_na' +
        'l_litr, 0) -'
      
        '                                    nvl(out_ved_litr, 0) - nvl(o' +
        'ut_litr, 0) -'
      
        '                                    nvl(out_talon_litr, 0) - nvl' +
        '(out_sn_litr, 0))>0)'
      '                 group by decode(np_grp,4,5,np_grp),azs_id,nb_id'
      ''
      '                 UNION ALL'
      ''
      
        '                select -- '#1040#1047#1057' Sr_Other - '#1074#1110#1076#1087#1091#1089#1082' '#1087#1086' '#1082#1072#1088#1090#1082#1072#1093', '#1073#1072#1085 +
        #1082'-'#1082#1072#1088#1090#1082#1072#1093' '#1090#1072' '#1110#1085#1096#1077
      '                       2 as tip_id,'
      
        '                       decode(np.np_grp,4,5,np.np_grp) as npg_id' +
        ','
      '                       sro.oper_id,'
      '                       drep.azs_id as azs_id,'
      '                       to_number(null) as nb_id,'
      '                       0 as prih_tonn,'
      '                       0 as prih_litr,'
      '                       0 as rest_tonn,'
      '                       0 as rest_litr,'
      '                       sro.litr as real_litr,'
      '                       sro.count_t as real_tonn,'
      
        '                       nvl(sro.amount, round(sro.litr*sro.price,' +
        '2)) as real_summa,'
      '                       0 as out_nal_litr,'
      '                       0 as out_nal_tonn,'
      '                       0 as out_nal_summa,'
      '                       0 as out_talon_litr,'
      '                       0 as out_talon_tonn,'
      '                       0 as out_talon_summa,'
      '                       0 as tubing_litr'
      '                  from oil_daily_rep drep,'
      '                       oil_dr_data   dr,'
      '                       oil_srother   sro,'
      '                       oil_rashod    r,'
      '                       oil_part      p,'
      '                       v_oil_np_type np'
      
        '                 where drep.state = '#39'Y'#39' and p.state = '#39'Y'#39' and dr' +
        '.state = '#39'Y'#39' and sro.state = '#39'Y'#39' and r.state = '#39'Y'#39
      '                   and trunc(rep_date) = to_date(:p_RepDate)'
      '                   and dr.oper_type = 1'
      '                   and dr.rep_id = drep.id'
      '                   and dr.rep_inst = drep.inst'
      '                   and dr.ttn_id = r.id'
      '                   and dr.ttn_inst = r.inst'
      '                   and sro.srep_id = dr.id'
      '                   and sro.srep_inst = dr.inst'
      '                   and r.part_id = p.id'
      '                   and r.part_inst = p.inst'
      '                   and p.np_type = np.id'
      ''
      '                 UNION ALL'
      ''
      
        '                select -- '#1040#1047#1057' oil_vedomost - '#1074#1110#1076#1087#1091#1089#1082' '#1087#1086' '#1074#1110#1076#1086#1084#1086#1089#1090 +
        #1110
      '                       2 as tip_id,'
      
        '                       decode(np.np_grp,4,5,np.np_grp) as npg_id' +
        ','
      '                       11 as oper_id,'
      '                       drep.azs_id as azs_id,'
      '                       to_number(null) as nb_id,'
      '                       0 as prih_tonn,'
      '                       0 as prih_litr,'
      '                       0 as rest_tonn,'
      '                       0 as rest_litr,'
      '                       v.litr as real_litr,'
      '                       v.count_t as real_tonn,'
      '                       round(v.litr * v.price, 2) as real_summa,'
      '                       0 as out_nal_litr,'
      '                       0 as out_nal_tonn,'
      '                       0 as out_nal_summa,'
      '                       0 as out_talon_litr,'
      '                       0 as out_talon_tonn,'
      '                       0 as out_talon_summa,'
      '                       0 as tubing_litr'
      '                  from oil_daily_rep drep,'
      '                       oil_dr_data   dr,'
      '                       oil_vedomost  v,'
      '                       oil_rashod    r,'
      '                       oil_part      p,'
      '                       v_oil_np_type np'
      
        '                 where drep.state = '#39'Y'#39' and dr.state = '#39'Y'#39' and v' +
        '.state = '#39'Y'#39' and r.state = '#39'Y'#39' and p.state = '#39'Y'#39
      '                   and trunc(rep_date) = to_date(:p_RepDate)'
      '                   and dr.oper_type = 1'
      
        '                   and r.oper_id <> 52 -- '#1042#1079#1072#1108#1084#1086#1079#1072#1083#1110#1082' '#1089#1087#1086#1085#1089#1086#1088#1089#1100#1082 +
        #1072' '#1076#1086#1087#1086#1084#1086#1075#1072
      '                   and dr.rep_id = drep.id'
      '                   and dr.rep_inst = drep.inst'
      '                   and dr.ttn_id = r.id'
      '                   and dr.ttn_inst = r.inst'
      '                   and v.srep_id = dr.id'
      '                   and v.srep_inst = dr.inst'
      '                   and r.part_id = p.id'
      '                   and r.part_inst = p.inst'
      '                   and p.np_type = np.id'
      ''
      '                 UNION ALL'
      ''
      '                select -- '#1090#1088#1091#1073#1086#1087#1088#1086#1074#1086#1076#1080' '#1074' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072#1093
      '                       2 as tip_id,'
      
        '                       decode(np.np_grp,4,5,np.np_grp) as npg_id' +
        ','
      '                       to_number(null) as oper_id,'
      '                       azs.id as azs_id,'
      '                       to_number(null) as nb_id,'
      '                       0 as prih_tonn,'
      '                       0 as prih_litr,'
      '                       0 as rest_tonn,'
      '                       0 as rest_litr,'
      '                       0 as real_litr,'
      '                       0 as real_tonn,'
      '                       0 as real_summa,'
      '                       0 as out_nal_litr,'
      '                       0 as out_nal_tonn,'
      '                       0 as out_nal_summa,'
      '                       0 as out_talon_litr,'
      '                       0 as out_talon_tonn,'
      '                       0 as out_talon_summa,'
      '                       rez.tubingcapacity*1000 as tubing_litr'
      
        '                  from oil_rezervuar rez, v_card_azs azs, v_oil_' +
        'np_type np'
      '                 where rez.condition = 0'
      '                   and rez.id_org = azs.id'
      '                   and rez.inst_org = azs.inst'
      '                   and rez.np_type_id = np.id'
      '                )) Q,'
      '       v_oil_np_group npg,'
      '       oil_org oo,'
      '       v_card_azs azs'
      ' where npg.id = npg_id'
      '   and npg.id in (3,4,5,6,7,10,76)'
      '   and oo.state(+) = '#39'Y'#39' '
      '   and oo.id(+) = oo.inst(+)'
      '   and oo.inst(+) = nb_id'
      '   and azs.id = Q.azs_id'
      '   and not (tip_id=2 and nvl(nb_id,0)<>0)'
      'order by nb_num nulls last,'
      '         nb_id nulls last,'
      '         npg_id'
      '   )Q2')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 192
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_Repdate'
      end>
  end
  object qAZS: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select /*VERSION=108.0.0*/'
      '       azs.*'
      '  from v_oil_azs azs'
      ' where obl_id = nvl(:obl_id,ov.getval('#39'INST'#39'))'
      ' order by lpad(azs_num, 10,'#39'0'#39'),'
      '          id')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 248
    Top = 240
    ParamData = <
      item
        Name = 'obl_id'
        Value = ''
        ExtDataType = 107
      end>
  end
  object qGKSU_opt: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '-->qGKSU_opt,Reports'
      'select /*VERSION=107.4*/'
      '       npg.id as np_grp_id,'
      '       npg.name as np_grp_name,'
      '       sum(decode(gksu_type, 1, tonn, 0)) as nb_tonn,'
      '       sum(decode(gksu_type, 1, summa, 0)) as nb_summa,'
      '       sum(decode(tip, 2, tonn, 0)) as talon_tonn,'
      '       sum(decode(tip, 2, summa, 0)) as talon_summa,'
      '       sum(decode(tip, 3, tonn, 0)) as card_tonn,'
      '       sum(decode(tip, 3, summa, 0)) as card_summa,'
      
        '       sum(decode(gksu_type, 41, tonn, 42, tonn, 0)) as ved_tonn' +
        ','
      
        '       sum(decode(gksu_type, 41, summa, 42, summa, 0)) as ved_su' +
        'mma'
      
        '  from v_oil_npmove_gksu g, v_org oo, v_oil_np_group npg, v_oil_' +
        'azs azs'
      ' where g.date_ between :BeginDate and :EndDate'
      '   and ov.GetVal('#39'INST'#39') in (oo.inst, oo.par_inst)'
      '   and oo.org_type in (3,4)'
      '   and g.inst = oo.inst'
      '   and g.azs_id = azs.id'
      '   and g.azs_id = azs.inst'
      '   and g.inst = oo.id'
      
        '   and decode(np_grp_id,4,5,np_grp_id) = decode(np_grp_id,4,npg.' +
        'id,npg.id)'
      '   and g.OptRozn = 0'
      '   and (upper(g.part_dog) not like '#39#1058#1044'%'#39' '
      '        or upper(g.part_dog) like '#39#1058#1044'%'#1048#39' '
      '        or :OhneCommision = 0'
      '        or azs.is_filial = 0 )'
      ' group by npg.id, npg.name'
      ' order by decode(np_grp_id,62,100,75,110,np_grp_id)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 376
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end
      item
        DataType = ftUnknown
        Name = 'OhneCommision'
      end>
  end
  object qSvodFilAZSCard: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '-->qSvodFilAZSCard1,Reports'
      'select Q.date_, '
      '       Q.npg_id, '
      '       nvl(crd.litr,0) as sum_litr'
      ''
      '  from (select ct.date_, '
      '               decode(npg.id,4,5,npg.id) as npg_id, '
      '               sum(rest.Litr) as litr'
      
        '          from v_card_receipts rest, card_transaction ct, v_oil_' +
        'np_group npg'
      '         where rest.date_ between :BeginDate and :EndDate'
      '           and rest.auto_id is null'
      '           and rest.share_id is null'
      
        '           and rest.cardalign = decode(ov.GetVal('#39'INST'#39'),666,CAR' +
        'D.GetGeneration(rest.card_number, rest.date_),0)'
      '           and rest.Price > 0'
      '           and rest.Tr_Type in (5, 7)'
      '           and rest.oil_id = ct.oil_id'
      '           and rest.oil_inst = ct.oil_inst'
      
        '           and decode(rest.np_type,4,5,rest.np_type)=decode(rest' +
        '.np_type,4,npg.id,npg.petrol_id)'
      
        '           and CARD.GetObl(rest.card_number, rest.date_) = :obl_' +
        'id'
      '         group by ct.date_, npg.id'
      '         ) crd,'
      '       '
      '       (select to_date(c.date_of, '#39'DD.MM.YYYY'#39') as date_, '
      '               decode(npg.id,4,5,npg.id) as npg_id'
      '          from oil_calendar c, v_oil_np_group npg'
      
        '         where to_date(c.date_of, '#39'DD.MM.YYYY'#39') between :BeginDa' +
        'te and :EndDate'
      '           and npg.id in (&npg_id)'
      '           ) Q'
      ' where crd.date_(+) = Q.date_'
      '   and crd.npg_id(+) = Q.npg_id'
      
        ' order by date_, decode(Q.npg_id,&np1,10,&np2,20,&np3,30,&np4,40' +
        ',&np5,50,&np6,60)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 392
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end
      item
        DataType = ftUnknown
        Name = 'obl_id'
      end>
    MacroData = <
      item
        Name = 'npg_id'
      end
      item
        Name = 'np1'
      end
      item
        Name = 'np2'
      end
      item
        Name = 'np3'
      end
      item
        Name = 'np4'
      end
      item
        Name = 'np5'
      end
      item
        Name = 'np6'
      end>
  end
  object qSvodFilAZSTalon: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '-->qSvodFilAZSTalon1,Reports'
      'select to_date(cal.date_of, '#39'DD.MM.YYYY'#39') as date_,'
      '       cal.npg_id,'
      '       cal.TalType,'
      '       rest.rest_sum_litr,'
      '       t.sum_litr'
      '  from (select LastTal.NPGrp_Id,'
      '                sum(nvl(LastTal.Litr, 0)) as rest_sum_litr,'
      '                :BeginDate as date_,'
      '                sign(LastTal.Num - 500000000) as TalType'
      '           from (select t.Ser,'
      '                        t.Num,'
      '                        t.Nominal as Litr,'
      
        '                        decode(NPGrp_Id, 4, 5, NPGrp_Id) as NPGr' +
        'p_Id,'
      
        '                        max(to_char(t.date_, '#39'YYYYMMDD'#39') || t.ti' +
        'p || '#39'_'#39' ||'
      
        '                            lpad(nvl(t.srep_id, 0), 20, 0) || '#39'-' +
        #39' ||'
      
        '                            lpad(nvl(t.srep_inst, 0), 20, 0) || ' +
        #39'_'#39' ||'
      '                            decode(t.tip,'
      '                                   '#39'P'#39','
      '                                   '#39'1'#39','
      
        '                                   decode(t.oper_id, 192, '#39'2'#39', '#39 +
        '0'#39'))) as DateCode'
      '                   from v_oil_talon_op t'
      '                  where code_obl = :obl_id'
      '                    and Date_ <= :BeginDate'
      '                    and Ser is not null'
      '                 '
      '                  group by t.Ser,'
      '                           t.Num,'
      '                           t.Nominal,'
      
        '                           decode(NPGrp_Id, 4, 5, NPGrp_Id)) Las' +
        'tTal'
      '          where substr(DateCode, -1) = '#39'1'#39
      '               --and rownum < 100'#39
      '           and not exists'
      '         (select /*+CACHE(dr,srt)*/'
      '                 '#39'X'#39
      '                  from oil_dr_data dr, oil_srtalon srt'
      '                 where srt.state = '#39'Y'#39
      '                   and dr.state = '#39'Y'#39
      '                   and srt.srep_id = dr.id'
      '                   and srt.srep_Inst = dr.inst'
      '                   and dr.oper_type = 1'
      '                   and srt.intheway = 4'
      '                   and srt.code_obl = :obl_id'
      '                   and dr.rep_id = substr(DateCode, 11, 20)'
      '                   and dr.rep_inst = substr(DateCode, 32, 20)'
      '                   and srt.Ser = LastTal.Ser'
      '                   and srt.Num = LastTal.Num)'
      
        '         group by LastTal.NPGrp_Id, sign(LastTal.Num - 500000000' +
        ')) rest,'
      '       '
      '       (select t.Date_,'
      '               decode(t.npgrp_id, 4, 5, t.npgrp_id) as npgrp_id,'
      '               sum(nvl(t.nominal, 0)) as sum_litr,'
      '               sign(Num - 500000000) as TalType'
      '          from v_oil_talon_op t'
      '         where t.Tip = '#39'O'#39
      '           and code_obl = :obl_id'
      '        '
      '         group by t.Date_,'
      '                  decode(t.npgrp_id, 4, 5, t.npgrp_id),'
      '                  sign(Num - 500000000)) t,'
      '       '
      
        '       (select c.date_of, decode(npg.id, 4, 5, npg.id) as npg_id' +
        ', t.TalType'
      '          from oil_calendar c,'
      '               v_oil_np_group npg,'
      '               (select -1 as TalType'
      '                  from dual'
      '                union all'
      '                select 1 as TalType'
      '                  from dual) t'
      
        '         where to_date(c.date_of, '#39'DD.MM.YYYY'#39') between :BeginDa' +
        'te and'
      '               :EndDate'
      '           and npg.id in (&npg_id)) cal'
      ' where rest.NPGrp_Id(+) = cal.npg_id'
      '   and rest.TalType(+) = cal.TalType'
      '   and to_date(cal.date_of, '#39'DD.MM.YYYY'#39') = rest.date_(+)     '
      '   and t.date_(+) between :BeginDate and :EndDate'
      '   and t.TalType(+) = cal.TalType'
      '   and t.npgrp_id(+) = cal.npg_id'
      '   and to_date(cal.date_of, '#39'DD.MM.YYYY'#39') = t.date_(+)'
      ' order by to_date(date_of, '#39'DD.MM.YYYY'#39'),'
      '          cal.TalType,'
      
        '          decode(cal.npg_id, &np1, 10, &np2, 20, &np3, 30, &np4,' +
        ' 40, &np5,50, &np6,60)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 393
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'obl_id'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end>
    MacroData = <
      item
        Name = 'npg_id'
      end
      item
        Name = 'np1'
      end
      item
        Name = 'np2'
      end
      item
        Name = 'np3'
      end
      item
        Name = 'np4'
      end
      item
        Name = 'np5'
      end
      item
        Name = 'np6'
      end>
  end
  object qSvodFilAZSPrice: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '-->qSvodFilAZSPrice1,Reports'
      'select '
      '  tip_id,'
      '  date_,'
      '  np_groupid,'
      '  np_group_name,'
      '  azs_id,'
      '  azs_num,'
      '  azs_addr,  '
      '  decode(ret_price,0,to_number(null),ret_price) as ret_price, '
      '  decode(tal_price,0,to_number(null),tal_price) as tal_price,'
      '  decode(card_price,0,to_number(null),card_price) as card_price'
      'from (select 1 as tip_id,'
      '       Q1.date_,'
      '       Q1.np_groupid,'
      '       Q1.np_group_name,'
      '       Q1.azs_id,'
      '       Q1.azs_num,'
      '       Q1.azs_addr,'
      
        '       row_number() over (partition by Q1.np_groupid, Q1.date_ o' +
        'rder by lpad(Q1.azs_num, 10,'#39'0'#39')) as rn,'
      '       nvl(ret.ret_price,0) as ret_price,'
      '       0 as tal_price,'
      '       0 as card_price'
      '       '
      '  from (select /*+ORDERED*/'
      '               trunc(drep.rep_date) as date_,'
      '               round(dr.s_price,2) as ret_price,'
      '               decode(np.np_grp,4,5,np.np_grp) as np_groupid,'
      '               drep.azs_id,'
      
        '               row_number() over (partition by drep.azs_id, deco' +
        'de(np.np_grp,4,5,np.np_grp), trunc(drep.rep_date) order by drep.' +
        'rep_date desc) as rn'
      
        '          from oil_daily_rep drep, oil_dr_data dr, oil_rashod r,' +
        ' oil_part p, v_oil_np_type np'
      
        '         where drep.state='#39'Y'#39' and dr.state='#39'Y'#39' and r.state='#39'Y'#39' a' +
        'nd p.state='#39'Y'#39
      '           and drep.id = dr.rep_id and drep.inst = dr.rep_inst'
      '           and r.id = dr.ttn_id    and r.inst = dr.rep_inst'
      '           and p.id = r.part_id    and p.inst = r.part_inst'
      '           and p.np_type = np.id'
      
        '           and trunc(drep.rep_date) between :BeginDate and :EndD' +
        'ate'
      '           and decode(np.np_grp,4,5,np.np_grp) in (&npg_id)'
      '           and drep.azs_id in (&azs_list)'
      '          ) ret,'
      '          '
      '          (select azs.id as azs_id,'
      '                  azs.azs_num,'
      '                  azs.addr as azs_addr,'
      '                  to_date(c.date_of, '#39'DD.MM.YYYY'#39') as date_,'
      '                  decode(npg.id,4,5,npg.id) as np_groupid,'
      
        '                  decode(npg.id,4,'#39#1040'-80'#39',npg.name) as np_group_n' +
        'ame'
      
        '             from oil_calendar c, v_oil_np_group npg, v_oil_azs ' +
        'azs'
      
        '            where to_date(c.date_of, '#39'DD.MM.YYYY'#39') between :Begi' +
        'nDate and :EndDate'
      '              and npg.id in (&npg_id)'
      '              and azs.id in (&azs_list)'
      '              and azs.obl_id = :obl_id'
      '            ) Q1'
      '               '
      'where ret.rn(+)=1'
      '  and ret.np_groupid(+) = Q1.np_groupid'
      '  and ret.date_(+) = Q1.date_'
      '  and ret.azs_id(+) = Q1.azs_id'
      ''
      'union all'
      ''
      ''
      'select 2 as tip_id,'
      '       Q2.date_,'
      '       Q2.np_groupid,'
      '       Q2.np_group_name,'
      '       0 as azs_id,'
      '       '#39'0'#39' as azs_num,'
      '       '#39#39' as azs_addr,'
      '       0 as rn,'
      '       0 as nal_price,'
      '       nvl(tal.tal_price,0) as tal_price,'
      '       nvl(crd.card_price,0) as card_price'
      ''
      
        'from       (select decode(t.npgrp_id,4,5,t.npgrp_id) as np_group' +
        'id,'
      '                   t.date_ as date_,'
      '                   round(avg(t.Price), 2) as tal_price'
      '              from v_oil_talon_op t'
      '             where t.Tip = '#39'O'#39
      '               and t.price > 0'
      
        '               and decode(t.npgrp_id,4,5,t.npgrp_id) in (&npg_id' +
        ')'
      '               and t.date_ between :BeginDate and :EndDate'
      '               and t.code_obl = :obl_id'
      '             group by decode(t.npgrp_id,4,5,t.npgrp_id), t.date_'
      '            ) tal,'
      '               '
      '           (select ct.date_,'
      
        '                   decode(npg.id,4,5,npg.id) as np_groupid,     ' +
        '   '
      '                   round(avg(rest.Price),2) as card_price'
      
        '              from v_card_receipts rest, card_transaction ct, v_' +
        'oil_np_group npg'
      '             where rest.date_ between :BeginDate and :EndDate'
      '               and rest.auto_id is null'
      '               and rest.share_id is null'
      
        '               and rest.cardalign = decode(ov.GetVal('#39'INST'#39'),666' +
        ',CARD.GetGeneration(rest.card_number, rest.date_),0)'
      '               and rest.Price > 0'
      '               and rest.Tr_Type in (5,7)'
      '               and rest.oil_id = ct.oil_id'
      '               and rest.oil_inst = ct.oil_inst'
      
        '               and decode(rest.np_type,4,5,rest.np_type)=decode(' +
        'rest.np_type,4,npg.id,npg.petrol_id)'
      
        '               and CARD.Getobl(rest.card_number,rest.Date_) = :o' +
        'bl_id'
      '             group by ct.date_, decode(npg.id,4,5,npg.id)'
      '            ) crd,'
      '               '
      '           (select to_date(c.date_of, '#39'DD.MM.YYYY'#39') as date_,'
      '                   decode(npg.id,4,5,npg.id) as np_groupid,'
      
        '                   decode(npg.id,4,'#39#1040'-80'#39',npg.name) as np_group_' +
        'name'
      '              from oil_calendar c, v_oil_np_group npg'
      
        '             where to_date(c.date_of, '#39'DD.MM.YYYY'#39') between :Beg' +
        'inDate and :EndDate'
      '               and npg.id in (&npg_id)'
      '            ) Q2'
      'where tal.date_(+) = Q2.date_'
      '  and crd.date_(+) = Q2.date_'
      '  and tal.np_groupid(+) = Q2.np_groupid'
      '  and crd.np_groupid(+) = Q2.np_groupid'
      '  )'
      
        'order by tip_id, rn, date_, decode(np_groupid,&np1,10,&np2,20,&n' +
        'p3,30,&np4,40, &np5,50, &np6,60)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 394
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end
      item
        DataType = ftUnknown
        Name = 'obl_id'
      end>
    MacroData = <
      item
        Name = 'npg_id'
      end
      item
        Name = 'azs_list'
      end
      item
        Name = 'np1'
      end
      item
        Name = 'np2'
      end
      item
        Name = 'np3'
      end
      item
        Name = 'np4'
      end
      item
        Name = 'np5'
      end
      item
        Name = 'np6'
      end>
  end
  object qSvodFilAZS_RestOnBegin: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '-->qSvodFilAZS_RestOnBegin1,Reports'
      'select Q.azs_id,'
      '       Q.azs_num,'
      '       Q.npg_id,'
      
        '       round(nvl(restAvias.rest_kg, nvl(restOil.rest_kg,0)),0) a' +
        's rest_kg,'
      
        '       nvl(restAvias.rest_litr, nvl(restOil.rest_litr,0)) as res' +
        't_litr,'
      '       nvl(TrkCnt.begin_counter,0) as begin_counter'
      ''
      '  from (select rp.azs_id,'
      '               decode(np.np_grp,4,5,np.np_grp) as np_grp,'
      '               1000*sum(rest_tonn) as rest_kg,'
      '               sum(rest_litr) as rest_litr'
      '        '
      '          from (select '#39'drep'#39' as tp,'
      '                       r.part_id,'
      '                       r.part_inst,'
      '                       drep.azs_id as azs_id,'
      '                       drep.azs_inst as azs_inst,'
      
        '                       sum(nvl(dr.pr_count,0) - nvl(dr.out_nal_c' +
        'ount,0) -'
      
        '                           nvl(dr.out_ved_count,0) - nvl(dr.out_' +
        'count,0) -'
      '                           nvl(dr.out_talon_count,0) -'
      '                           nvl(dr.out_sn_count,0)) as rest_tonn,'
      
        '                       sum(nvl(dr.pr_litr,0) - nvl(dr.out_nal_li' +
        'tr,0) -'
      
        '                           nvl(dr.out_ved_litr,0) - nvl(dr.out_l' +
        'itr,0) -'
      
        '                           nvl(dr.out_talon_litr,0) - nvl(dr.out' +
        '_sn_litr,0)) as rest_litr'
      '                '
      '                  from oil_daily_rep drep,'
      '                       oil_dr_data dr,'
      '                       oil_rashod r,'
      
        '                       (select max(rep_date) as rep_date, azs_id' +
        ', azs_inst'
      
        '                          from (select rep_date, azs_id, azs_ins' +
        't'
      '                                  from oil_region_rest'
      
        '                                 where trunc(rep_date) <= to_dat' +
        'e(:BeginDate) - 1'
      '                                union all'
      
        '                                select to_date('#39'01.01.1990'#39', '#39'dd' +
        '.mm.yyyy'#39') as rep_date,'
      '                                       id as azs_id,'
      '                                       inst as azs_inst'
      '                                  from oil_org'
      '                                 where state = '#39'Y'#39
      '                                   and id = inst'
      '                                   and org_type = 8)'
      '                         group by azs_id, azs_inst) orr'
      '                 where drep.state = '#39'Y'#39
      '                   and dr.state = '#39'Y'#39
      '                   and r.state = '#39'Y'#39
      
        '                   and trunc(drep.rep_date) <= to_date(:BeginDat' +
        'e) - 1'
      
        '                   and trunc(drep.rep_date) > trunc(orr.rep_date' +
        ')'
      
        '                   and trunc(drep.rep_date, '#39'mm'#39') >= trunc(orr.r' +
        'ep_date, '#39'mm'#39')'
      '                   and dr.oper_type in (0, 1)'
      '                   and r.oper_id <> 52'
      '                   and dr.ttn_id = r.id'
      '                   and dr.ttn_inst = r.inst'
      '                   and dr.rep_id = drep.id'
      '                   and dr.rep_inst = drep.inst'
      '                   and drep.azs_id = orr.azs_id'
      '                   and drep.azs_inst = orr.azs_inst'
      
        '                 group by r.part_id, r.part_inst, drep.azs_id, d' +
        'rep.azs_inst'
      '                union all'
      '                select '#39'orr'#39' as tp,'
      '                       part_id,'
      '                       part_inst,'
      '                       azs_id,'
      '                       azs_inst,'
      
        '                       sum(nvl(pr_count,0) - nvl(out_nal_count,0' +
        ') -'
      
        '                           nvl(out_ved_count,0) - nvl(out_count,' +
        '0) -'
      
        '                           nvl(out_talon_count,0) - nvl(out_sn_c' +
        'ount,0)) as rest_tonn,'
      
        '                       sum(nvl(pr_litr,0) - nvl(out_nal_litr,0) ' +
        '-'
      
        '                           nvl(out_ved_litr,0) - nvl(out_litr,0)' +
        ' -'
      
        '                           nvl(out_talon_litr,0) - nvl(out_sn_li' +
        'tr,0)) as rest_litr'
      '                  from oil_region_rest'
      
        '                 where trunc(rep_date) <= to_date(:BeginDate) - ' +
        '1'
      '                 group by part_id, part_inst, azs_id, azs_inst'
      '                 ) rp,               '
      '               oil_part      p,'
      '               v_oil_np_type np'
      '        '
      '         where p.state = '#39'Y'#39
      '           and rp.part_id = p.id'
      '           and rp.part_inst = p.inst'
      '           and p.np_type = np.id'
      '           and decode(np.np_grp,4,5,np.np_grp) in (&npg_id)'
      '           and rp.azs_id in (&azs_list)'
      '         group by rp.azs_id, decode(np.np_grp,4,5,np.np_grp)'
      '         ) restOil,'
      '         '
      '       (select * '
      '          from (select r.azs_id, r.np_group_id,'
      '                       r.rest_litr, r.rest_kg,'
      
        '                       row_number() over (partition by azs_id, n' +
        'p_group_id, date_ order by rep_build_date desc nulls first) rn'
      '                  from oil_rests_avias r'
      '                 where r.state='#39'Y'#39
      '                   and r.azs_id in (&azs_list)'
      '                   and r.np_group_id in (&npg_id)'
      '                   and r.date_ = :BeginDate'
      '                   and inst = :obl_id'
      '                   and to_char(to_date(:BeginDate),'#39'dd'#39')='#39'01'#39
      '                   )'
      '         where rn=1'
      '         ) restAvias,'
      ''
      '       (        select '#39'trk_counter'#39' as tip,  '
      '                       trunc(dr.rep_date) as rep_date,'
      
        '                       decode(cnt.np_id,4,5,cnt.np_id) as npg_id' +
        ','
      '                       dr.azs_id as azs_id,'
      
        '                       to_number(substr(max(to_char(dr.rep_date,' +
        #39'HH24MISS'#39')||'#39'_'#39'||cnt.begin_counter),8)) as begin_counter,'
      
        '                       to_number(substr(max(to_char(dr.rep_date,' +
        #39'HH24MISS'#39')||'#39'_'#39'||cnt.end_counter),8)) as end_counter'
      '                  from oil_daily_rep dr, oil_azs_trkcounters cnt'
      '                 where cnt.state = '#39'Y'#39
      '                   and dr.state = '#39'Y'#39
      '                   and dr.id = cnt.rep_id'
      '                   and dr.inst = cnt.rep_inst'
      
        '                   and decode(cnt.np_id, 4,5, cnt.np_id) in (&np' +
        'g_id)'
      '                   and dr.azs_id in (&azs_list)'
      '                   and trunc(dr.rep_date) = :BeginDate'
      '                 group by trunc(dr.rep_date),'
      '                       dr.azs_id,'
      '                       dr.azs_inst,'
      '                       decode(cnt.np_id,4,5,cnt.np_id) ) TrkCnt,'
      '       '
      '       (select azs.id      as azs_id,'
      '               azs.azs_num as azs_num,'
      '               decode(npg.id,4,5,npg.id) as npg_id'
      '          from v_oil_azs azs, v_oil_np_group npg'
      '         where npg.id in (&npg_id)'
      '           and azs.id in (&azs_list)'
      '           and azs.obl_id = :obl_id'
      '           ) Q'
      ''
      ' where Q.azs_id = restOil.azs_id(+)'
      '   and Q.npg_id = restOil.np_grp(+)'
      '   and Q.azs_id = restAvias.azs_id(+)'
      '   and Q.npg_id = restAvias.np_group_id(+)'
      '   and Q.azs_id = TrkCnt.azs_id(+)'
      '   and Q.npg_id = TrkCnt.npg_id(+)'
      '   '
      
        ' order by lpad(Q.azs_num, 10,'#39'0'#39'), Q.azs_id, decode(Q.npg_id, &n' +
        'p1,10, &np2,20, &np3,30, &np4,40, &np5,50, &np6,60)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 396
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'obl_id'
      end>
    MacroData = <
      item
        Name = 'npg_id'
      end
      item
        Name = 'azs_list'
      end
      item
        Name = 'np1'
      end
      item
        Name = 'np2'
      end
      item
        Name = 'np3'
      end
      item
        Name = 'np4'
      end
      item
        Name = 'np5'
      end
      item
        Name = 'np6'
      end>
  end
  object qSvodFilAZS_Realiz: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '-->qSvodFilAZS_Realiz1,Reports'
      'select Q.date_, '
      '       Q.azs_num,'
      '       Q.azs_id, '
      '       Q.np_groupid,'
      '       nvl(out_nal_litr,0) as out_nal_litr,'
      '       nvl(out_nal_money,0) as out_nal_money,'
      '       nvl(out_visa_litr,0) as out_visa_litr,'
      '       nvl(out_visa_count, 0) as out_visa_count,'
      '       nvl(out_visa_money, 0) as out_visa_money,'
      '       nvl(out_card_litr,0) as out_card_litr,'
      '       nvl(out_card_count, 0) as out_card_count,'
      '       nvl(out_card_money, 0) as out_card_money,'
      '       nvl(out_tkun_litr,0) as out_tkun_litr,'
      '       nvl(out_tkun_count, 0) as out_tkun_count,'
      '       nvl(out_tkun_money, 0) as out_tkun_money,'
      '       nvl(out_tkr_litr,0) as out_tkr_litr,'
      '       nvl(out_tkr_count, 0) as out_tkr_count,'
      '       nvl(out_tkr_money, 0) as out_tkr_money,'
      '       nvl(out_tku_litr,0) as out_tku_litr,'
      '       nvl(out_tku_count, 0) as out_tku_count,'
      '       nvl(out_tku_money, 0) as out_tku_money,'
      '       nvl(out_skr_litr,0) as out_skr_litr,'
      '       nvl(out_skr_count, 0) as out_skr_count,'
      '       nvl(out_skr_money, 0) as out_skr_money,'
      '       nvl(out_sku_litr,0) as out_sku_litr,'
      '       nvl(out_sku_count, 0) as out_sku_count,'
      '       nvl(out_sku_money, 0) as out_sku_money,'
      '       nvl(out_btu_litr,0) as out_btu_litr,'
      '       nvl(out_btu_count, 0) as out_btu_count,'
      '       nvl(out_btu_money, 0) as out_btu_money,'
      '       nvl(out_ptr_litr,0) as out_ptr_litr,'
      '       nvl(out_ptr_count, 0) as out_ptr_count,'
      '       nvl(out_ptr_money, 0) as out_ptr_money,'
      '       nvl(out_ptu_litr,0) as out_ptu_litr, '
      '       nvl(out_ptu_count, 0) as out_ptu_count,'
      '       nvl(out_ptu_money, 0) as out_ptu_money,'
      '       nvl(out_ved_litr,0) as out_ved_litr,'
      '       nvl(out_ved_count, 0) as out_ved_count,'
      '       nvl(out_ved_money, 0) as out_ved_money,'
      '       nvl(out_talon_litr,0) as out_talon_litr,'
      '       nvl(out_other_litr,0) as out_other_litr,'
      '       nvl(out_other_kg,0) as out_other_kg,'
      '       nvl(tubing_litr,0) as tubing_litr,'
      '       nvl(begin_counter,0) as begin_counter,'
      '       nvl(end_counter,0) as end_counter'
      ''
      '  from (select rep_date,'
      '               npg_id,'
      '               azs_id,'
      '               sum(out_nal_litr) as out_nal_litr,'
      '               sum(out_nal_money) as out_nal_money,'
      '               sum(out_visa_litr) as out_visa_litr,'
      '               sum(out_visa_count) as out_visa_count,'
      '               sum(out_visa_money) as out_visa_money,'
      '               sum(out_card_litr) as out_card_litr,'
      '               sum(out_card_count) as out_card_count,'
      '               sum(out_card_money) as out_card_money,'
      '               sum(out_tkun_litr) as out_tkun_litr,'
      '               sum(out_tkun_count) as out_tkun_count,'
      '               sum(out_tkun_money) as out_tkun_money,'
      '               sum(out_tkr_litr) as out_tkr_litr,'
      '               sum(out_tkr_count) as out_tkr_count,'
      '               sum(out_tkr_money) as out_tkr_money,'
      '               sum(out_tku_litr) as out_tku_litr,'
      '               sum(out_tku_count) as out_tku_count,'
      '               sum(out_tku_money) as out_tku_money,'
      '               sum(out_skr_litr) as out_skr_litr,'
      '               sum(out_skr_count) as out_skr_count,'
      '               sum(out_skr_money) as out_skr_money,'
      '               sum(out_sku_litr) as out_sku_litr,'
      '               sum(out_sku_count) as out_sku_count,'
      '               sum(out_sku_money) as out_sku_money,'
      '               sum(out_btu_litr) as out_btu_litr,'
      '               sum(out_btu_count) as out_btu_count,'
      '               sum(out_btu_money) as out_btu_money,'
      '               sum(out_ptr_litr) as out_ptr_litr,'
      '               sum(out_ptr_count) as out_ptr_count,'
      '               sum(out_ptr_money) as out_ptr_money,'
      '               sum(out_ptu_litr) as out_ptu_litr,'
      '               sum(out_ptu_count) as out_ptu_count,'
      '               sum(out_ptu_money) as out_ptu_money,'
      
        '               sum(out_ved_litr) as out_ved_litr,               ' +
        ' '
      '               sum(out_ved_count) as out_ved_count,'
      '               sum(out_ved_money) as out_ved_money,'
      '               sum(out_talon_litr) as out_talon_litr,'
      '               sum(out_other_litr) as out_other_litr,'
      '               1000*sum(out_other_tonn) as out_other_kg,'
      '               sum(begin_counter) as begin_counter,'
      '               sum(end_counter) as end_counter'
      '          from ('
      '                select /*+ORDERED*/'#39'tal-nal'#39' as tip,'
      '                       trunc(rep_date) as rep_date,'
      
        '                       decode(np.np_grp,4,5,np.np_grp) as npg_id' +
        ','
      '                       drep.azs_id as azs_id,                '
      
        '                       sum(nvl(dr.out_nal_litr,0)) as out_nal_li' +
        'tr,'
      
        '                       sum(nvl(dr.out_nal_money,0)) as out_nal_m' +
        'oney,                '
      '                       0 as out_visa_litr,'
      '                       0 as out_visa_count,'
      '                       0 as out_visa_money,'
      '                       0 as out_card_litr,'
      '                       0 as out_card_count,'
      '                       0 as out_card_money,'
      '                       0 as out_tkun_litr,'
      '                       0 as out_tkun_count,'
      '                       0 as out_tkun_money,'
      '                       0 as out_tkr_litr,'
      '                       0 as out_tkr_count,'
      '                       0 as out_tkr_money,'
      '                       0 as out_tku_litr,'
      '                       0 as out_tku_count,'
      '                       0 as out_tku_money,'
      '                       0 as out_skr_litr,'
      '                       0 as out_skr_count,'
      '                       0 as out_skr_money,'
      '                       0 as out_sku_litr,'
      '                       0 as out_sku_count,'
      '                       0 as out_sku_money,'
      '                       0 as out_btu_litr,'
      '                       0 as out_btu_count,'
      '                       0 as out_btu_money,'
      '                       0 as out_ptr_litr,'
      '                       0 as out_ptr_count,'
      '                       0 as out_ptr_money,'
      '                       0 as out_ptu_litr,'
      '                       0 as out_ptu_count,'
      '                       0 as out_ptu_money,'
      '                       0 as out_ved_litr,                '
      '                       0 as out_ved_count,'
      '                       0 as out_ved_money,'
      
        '                       sum(nvl(dr.out_talon_litr,0)) as out_talo' +
        'n_litr,'
      '                       0 as out_other_litr,'
      '                       0 as out_other_tonn,'
      '                       0 as begin_counter,'
      '                       0 as end_counter'
      
        '                  from oil_daily_rep drep, oil_dr_data dr, oil_r' +
        'ashod r, oil_part p, v_oil_np_type np'
      
        '                 where drep.state = '#39'Y'#39' and p.state = '#39'Y'#39' and dr' +
        '.state = '#39'Y'#39' and r.state = '#39'Y'#39
      
        '                   and trunc(rep_date) between :BeginDate and :E' +
        'ndDate'
      
        '                   and decode(np.np_grp,4,5,np.np_grp) in (&npg_' +
        'id)'
      '                   and drep.azs_id in (&azs_list)'
      '                   and dr.oper_type = 1'
      '                   and r.oper_id <> 52'
      
        '                   and dr.rep_id = drep.id and dr.rep_inst = dre' +
        'p.inst'
      
        '                   and dr.ttn_id = r.id    and dr.ttn_inst = r.i' +
        'nst'
      
        '                   and r.part_id = p.id    and r.part_inst = p.i' +
        'nst'
      '                   and p.np_type = np.id'
      
        '                 group by trunc(rep_date), decode(np.np_grp,4,5,' +
        'np.np_grp), drep.azs_id'
      '         '
      '                 union all'
      '         '
      '                 select /*+ORDERED*/'#39'card-other'#39' as tip,'
      '                        trunc(rep_date) as rep_date,'
      
        '                        decode(np.np_grp,4,5,np.np_grp) as npg_i' +
        'd,'
      '                        drep.azs_id as azs_id,                '
      '                        0 as out_nal_litr, '
      '                        0 as out_nal_money,               '
      
        '                        sum(decode(sro.oper_id,201,nvl(sro.litr,' +
        '0),0)) as out_visa_litr,'
      
        '                        sum(decode(sro.oper_id, 201, nvl(sro.cou' +
        'nt_t * 1000, 0), 0)) as out_visa_count,'
      
        '                        sum(decode(sro.oper_id, 201, nvl(sro.pri' +
        'ce*sro.litr, 0), 0)) as out_visa_money,'
      
        '                        sum(decode(sro.oper_id,153,nvl(sro.litr,' +
        '0),0)) as out_card_litr,'
      
        '                        sum(decode(sro.oper_id, 153, nvl(sro.cou' +
        'nt_t * 1000, 0), 0)) as out_card_count,'
      
        '                        sum(decode(sro.oper_id, 153, nvl(sro.pri' +
        'ce*sro.litr, 0), 0)) as out_card_money,'
      
        '                        sum(decode(sro.oper_id,277,nvl(sro.litr,' +
        '0),0)) as out_tkun_litr,'
      
        '                        sum(decode(sro.oper_id, 277, nvl(sro.cou' +
        'nt_t * 1000, 0), 0)) as out_tkun_count,'
      
        '                        sum(decode(sro.oper_id, 277, nvl(sro.pri' +
        'ce*sro.litr, 0), 0)) as out_tkun_money,'
      
        '                        sum(decode(sro.oper_id,276,nvl(sro.litr,' +
        '0),0)) as out_tkr_litr,'
      
        '                        sum(decode(sro.oper_id, 276, nvl(sro.cou' +
        'nt_t * 1000, 0), 0)) as out_tkr_count,'
      
        '                        sum(decode(sro.oper_id, 276, nvl(sro.pri' +
        'ce*sro.litr, 0), 0)) as out_tkr_money,'
      
        '                        sum(decode(sro.oper_id,275,nvl(sro.litr,' +
        '0),0)) as out_tku_litr,'
      
        '                        sum(decode(sro.oper_id, 275, nvl(sro.cou' +
        'nt_t * 1000, 0), 0)) as out_tku_count,'
      
        '                        sum(decode(sro.oper_id, 275, nvl(sro.pri' +
        'ce*sro.litr, 0), 0)) as out_tku_money,'
      
        '                        sum(decode(sro.oper_id,274,nvl(sro.litr,' +
        '0),0)) as out_skr_litr,'
      
        '                        sum(decode(sro.oper_id, 274, nvl(sro.cou' +
        'nt_t * 1000, 0), 0)) as out_skr_count,'
      
        '                        sum(decode(sro.oper_id, 274, nvl(sro.pri' +
        'ce*sro.litr, 0), 0)) as out_skr_money,'
      
        '                        sum(decode(sro.oper_id,273,nvl(sro.litr,' +
        '0),0)) as out_sku_litr,'
      
        '                        sum(decode(sro.oper_id, 273, nvl(sro.cou' +
        'nt_t * 1000, 0), 0)) as out_sku_count,'
      
        '                        sum(decode(sro.oper_id, 273, nvl(sro.pri' +
        'ce*sro.litr, 0), 0)) as out_sku_money,'
      
        '                        sum(decode(sro.oper_id,272,nvl(sro.litr,' +
        '0),0)) as out_btu_litr,'
      
        '                        sum(decode(sro.oper_id, 272, nvl(sro.cou' +
        'nt_t * 1000, 0), 0)) as out_btu_count,'
      
        '                        sum(decode(sro.oper_id, 272, nvl(sro.pri' +
        'ce*sro.litr, 0), 0)) as out_btu_money,'
      
        '                        sum(decode(sro.oper_id,271,nvl(sro.litr,' +
        '0),0)) as out_ptr_litr,'
      
        '                        sum(decode(sro.oper_id, 271, nvl(sro.cou' +
        'nt_t * 1000, 0), 0)) as out_ptr_count,'
      
        '                        sum(decode(sro.oper_id, 271, nvl(sro.pri' +
        'ce*sro.litr, 0), 0)) as out_ptr_money,'
      
        '                        sum(decode(sro.oper_id,270,nvl(sro.litr,' +
        '0),0)) as out_ptu_litr,'
      
        '                        sum(decode(sro.oper_id, 270, nvl(sro.cou' +
        'nt_t * 1000, 0), 0)) as out_ptu_count,'
      
        '                        sum(decode(sro.oper_id, 270, nvl(sro.pri' +
        'ce*sro.litr, 0), 0)) as out_ptu_money,'
      '                        0 as out_ved_litr,         '
      '                        0 as out_ved_count,'
      '                        0 as out_ved_money,       '
      '                        0 as out_talon_litr,     '
      '                        sum(case '
      
        '                           when (sro.oper_id in (201,153) or sro' +
        '.oper_id between 270 and 277) '
      '                             then 0 '
      '                           else nvl(sro.litr,0) '
      '                         end) as out_other_litr,'
      '                        sum(case '
      
        '                           when (sro.oper_id in (201,153) or sro' +
        '.oper_id between 270 and 277) '
      '                             then 0 '
      '                           else nvl(sro.count_t,0) '
      '                         end) as out_other_tonn,'
      '                        0 as begin_counter,'
      '                        0 as end_counter'
      
        '                  from oil_daily_rep drep, oil_dr_data dr, oil_s' +
        'rother sro, oil_rashod r, oil_part p, v_oil_np_type np'
      
        '                 where drep.state = '#39'Y'#39' and p.state = '#39'Y'#39' and dr' +
        '.state = '#39'Y'#39' and sro.state(+) = '#39'Y'#39' and r.state = '#39'Y'#39
      
        '                   and trunc(rep_date) between :BeginDate and :E' +
        'ndDate'
      
        '                   and decode(np.np_grp, 4,5, np.np_grp) in (&np' +
        'g_id)'
      '                   and drep.azs_id in (&azs_list)'
      '                   and dr.oper_type = 1'
      '                   and r.oper_id <> 52'
      '                   and sro.oper_id not in (278, 55)'
      
        '                   and dr.rep_id = drep.id and dr.rep_inst = dre' +
        'p.inst'
      
        '                   and dr.ttn_id = r.id    and dr.ttn_inst = r.i' +
        'nst'
      
        '                   and sro.srep_id = dr.id and sro.srep_inst = d' +
        'r.inst'
      
        '                   and r.part_id = p.id    and r.part_inst = p.i' +
        'nst'
      '                   and p.np_type = np.id'
      
        '                 group by trunc(rep_date), decode(np.np_grp,4,5,' +
        'np.np_grp), drep.azs_id'
      '         '
      '                 union all '
      '         '
      '                 select /*+ORDERED*/'#39'ved'#39' as tip,'
      '                        trunc(rep_date) as rep_date,'
      
        '                        decode(np.np_grp,4,5,np.np_grp) as npg_i' +
        'd,'
      '                        drep.azs_id as azs_id,                '
      '                        0 as out_nal_litr, '
      '                        0 as out_nal_money,               '
      '                        0 as out_visa_litr,'
      '                        0 as out_visa_count,'
      '                        0 as out_visa_money,'
      '                        0 as out_card_litr,'
      '                        0 as out_card_count,'
      '                        0 as out_card_money,'
      '                        0 as out_tkun_litr,'
      '                        0 as out_tkun_count,'
      '                        0 as out_tkun_money,'
      '                        0 as out_tkr_litr,'
      '                        0 as out_tkr_count,'
      '                        0 as out_tkr_money,'
      '                        0 as out_tku_litr,'
      '                        0 as out_tku_count,'
      '                        0 as out_tku_money,'
      '                        0 as out_skr_litr,'
      '                        0 as out_skr_count,'
      '                        0 as out_skr_money,'
      '                        0 as out_sku_litr,'
      '                        0 as out_sku_count,'
      '                        0 as out_sku_money,'
      '                        0 as out_btu_litr,'
      '                        0 as out_btu_count,'
      '                        0 as out_btu_money,'
      '                        0 as out_ptr_litr,'
      '                        0 as out_ptr_count,'
      '                        0 as out_ptr_money,'
      '                        0 as out_ptu_litr,'
      '                        0 as out_ptu_count,'
      '                        0 as out_ptu_money,'
      
        '                        sum(nvl(v.litr,0)) as out_ved_litr,     ' +
        '           '
      
        '                        sum(nvl(v.count_t*1000,0)) as out_ved_co' +
        'unt,                                        '
      
        '                        sum(nvl(v.price*v.litr,0)) as out_ved_mo' +
        'ney,'
      '                        0 as out_talon_litr,'
      '                        0 as out_other_litr,'
      '                        0 as out_other_tonn,'
      '                        0 as begin_counter,'
      '                        0 as end_counter'
      
        '                  from oil_daily_rep drep, oil_dr_data dr, oil_v' +
        'edomost v, oil_rashod r, oil_part p, v_oil_np_type np'
      
        '                 where drep.state = '#39'Y'#39' and p.state = '#39'Y'#39' and dr' +
        '.state = '#39'Y'#39' and r.state = '#39'Y'#39' and v.state(+) = '#39'Y'#39
      
        '                   and trunc(rep_date) between :BeginDate and :E' +
        'ndDate'
      
        '                   and decode(np.np_grp,4,5,np.np_grp) in (&npg_' +
        'id)'
      '                   and drep.azs_id in (&azs_list)'
      '                   and dr.oper_type = 1'
      '                   and r.oper_id <> 52'
      
        '                   and dr.rep_id = drep.id and dr.rep_inst = dre' +
        'p.inst'
      
        '                   and dr.ttn_id = r.id    and dr.ttn_inst = r.i' +
        'nst'
      
        '                   and v.srep_id = dr.id   and v.srep_inst = dr.' +
        'inst'
      
        '                   and r.part_id = p.id    and r.part_inst = p.i' +
        'nst'
      '                   and p.np_type = np.id'
      
        '                 group by trunc(rep_date), decode(np.np_grp,4,5,' +
        'np.np_grp), drep.azs_id'
      '                 '
      '                 union all'
      '                select '#39'trk_counter'#39' as tip,  '
      '                       trunc(dr.rep_date) as rep_date,'
      
        '                       decode(cnt.np_id,4,5,cnt.np_id) as npg_id' +
        ','
      '                       dr.azs_id as azs_id,'
      '                       0 as out_nal_litr, '
      '                       0 as out_nal_money,               '
      '                       0 as out_visa_litr,'
      '                       0 as out_visa_count,'
      '                       0 as out_visa_money,'
      '                       0 as out_card_litr,'
      '                       0 as out_card_count,'
      '                       0 as out_card_money,'
      '                       0 as out_tkun_litr,'
      '                       0 as out_tkun_count,'
      '                       0 as out_tkun_money,'
      '                       0 as out_tkr_litr,'
      '                       0 as out_tkr_count,'
      '                       0 as out_tkr_money,'
      '                       0 as out_tku_litr,'
      '                       0 as out_tku_count,'
      '                       0 as out_tku_money,'
      '                       0 as out_skr_litr,'
      '                       0 as out_skr_count,'
      '                       0 as out_skr_money,'
      '                       0 as out_sku_litr,'
      '                       0 as out_sku_count,'
      '                       0 as out_sku_money,'
      '                       0 as out_btu_litr,'
      '                       0 as out_btu_count,'
      '                       0 as out_btu_money,'
      '                       0 as out_ptr_litr,'
      '                       0 as out_ptr_count,'
      '                       0 as out_ptr_money,'
      '                       0 as out_ptu_litr,'
      '                       0 as out_ptu_count,'
      '                       0 as out_ptu_money,'
      '                       0 as out_ved_litr,                '
      '                       0 as out_ved_count,'
      '                       0 as out_ved_money,'
      '                       0 as out_talon_litr,'
      '                       0 as out_other_litr,'
      '                       0 as out_other_tonn,'
      '                       sum(cnt.begin_counter) as begin_counter,'
      '                       sum(cnt.end_counter) as end_counter'
      '                  from oil_daily_rep dr, oil_azs_trkcounters cnt'
      '                 where cnt.state = '#39'Y'#39
      '                   and dr.state = '#39'Y'#39
      '                   and dr.id = cnt.rep_id'
      '                   and dr.inst = cnt.rep_inst'
      
        '                   and decode(cnt.np_id,4,5,cnt.np_id) in (&npg_' +
        'id)'
      '                   and dr.azs_id in (&azs_list)'
      '                 group by dr.rep_date,'
      '                       dr.azs_id,'
      '                       dr.azs_inst,'
      '                       cnt.np_id                 '
      '                 )'
      '          group by rep_date, npg_id, azs_id'
      '          ) rl,'
      '         '
      '        (select azs.id as azs_id,'
      '                decode(np.np_grp,4,5,np.np_grp) as np_grp,'
      '                1000*sum(rez.tubingcapacity) as tubing_litr'
      
        '           from oil_rezervuar rez, v_oil_azs azs, v_oil_np_type ' +
        'np'
      '          where rez.condition = 0'
      '            and rez.id_org = azs.id'
      '            and rez.inst_org = azs.inst'
      '            and rez.np_type_id = np.id'
      '            and decode(np.np_grp,4,5,np.np_grp) in (&npg_id)'
      '            and azs.id in (&azs_list)'
      '            and azs.obl_id = :obl_id'
      '          group by azs.id, decode(np.np_grp,4,5,np.np_grp)'
      '          ) tub,'
      '           '
      '           (select to_date(c.date_of, '#39'DD.MM.YYYY'#39') as date_,'
      '                   decode(npg.id,4,5,npg.id) as np_groupid,'
      '                   azs.id as azs_id,'
      '                   azs.azs_num'
      
        '              from oil_calendar c, v_oil_np_group npg, v_oil_azs' +
        ' azs'
      
        '             where to_date(c.date_of, '#39'DD.MM.YYYY'#39') between :Beg' +
        'inDate and :EndDate'
      '               and npg.id in (&npg_id)'
      '               and azs.id in (&azs_list)'
      '               and azs.obl_id = :obl_id'
      '               ) Q'
      'where Q.date_ = rl.rep_date(+)'
      '  and Q.azs_id = rl.azs_id(+)'
      '  and Q.np_groupid = rl.npg_id(+)'
      '  and Q.azs_id = tub.azs_id(+)'
      '  and Q.np_groupid=tub.np_grp(+)'
      
        '  order by Q.date_, lpad(Q.azs_num, 10,'#39'0'#39'), Q.azs_id, decode(Q.' +
        'np_groupid,&np1,10,&np2,20,&np3,30,&np4,40, &np5,50, &np6,60)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 396
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end
      item
        DataType = ftUnknown
        Name = 'obl_id'
      end>
    MacroData = <
      item
        Name = 'npg_id'
      end
      item
        Name = 'azs_list'
      end
      item
        Name = 'np1'
      end
      item
        Name = 'np2'
      end
      item
        Name = 'np3'
      end
      item
        Name = 'np4'
      end
      item
        Name = 'np5'
      end
      item
        Name = 'np6'
      end>
  end
  object qSvodFilAZS_Prihod: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '-->qSvodFilAZS_Prihod1,Reports'
      'select Q.date_,'
      '       Q.np_groupid,'
      '       from_id,'
      '       from_inst,'
      '       from_name,'
      '       from_nb_num,'
      '       is_from_filial,'
      '       Q.azs_id,'
      '       Q.azs_num,'
      '       nvl(prih_litr,0) as prih_litr,'
      '       round(nvl(prih_kg,0),0) as prih_kg'
      ' '
      '  from (select n.to_id as from_id,'
      '               n.to_inst as from_inst,'
      '               oo.name as from_name,'
      '               substr(oo.name || '#39' '#39','
      '                      instr(oo.name, '#39#8470#39') + 1,'
      '                      instr(oo.name || '#39' '#39','
      '                            '#39' '#39','
      '                            instr(oo.name, '#39#8470#39')) -'
      '                      instr(oo.name, '#39#8470#39') - 1) as from_nb_num,'
      '               decode(oo.par, 4587, 1, 0) as is_from_filial,'
      '               azsid as azs_id,'
      
        '               decode(n.np_groupid, 4, 5, n.np_groupid) as np_gr' +
        'oupid,'
      '               sum(litr) as prih_litr,'
      '               sum(tonn) * 1000 as prih_kg,'
      '               trunc(n.rep_date) as rep_date              '
      '          from (select /*+ORDERED*/ '
      '                       dr.id,'
      '                       dr.inst,'
      '                       dp.azs_id as azsid,'
      '                       dp.azs_inst as azsinst,'
      
        '                       decode(r.from_inst,r.from_id,decode(r.fro' +
        'm_id, 430, 624, r.from_id),r.from_id) as to_id,'
      
        '                       decode(r.from_inst,r.from_id,decode(r.fro' +
        'm_inst, 430, 624, r.from_inst), r.from_inst) as to_inst,'
      '                       dr.pr_litr as litr,'
      '                       dr.pr_count as tonn,'
      '                       rep_date,'
      '                       np.grp_id as np_groupid'
      
        '                  from oil_daily_rep dp, oil_dr_data dr, oil_ras' +
        'hod r, oil_part p, oil_np_type np'
      '                 where dr.state = '#39'Y'#39
      '                   and dp.state = '#39'Y'#39
      '                   and r.state = '#39'Y'#39
      '                   and dr.oper_type = 0'
      '                   and dr.rep_id = dp.id'
      '                   and dr.rep_inst = dp.inst'
      '                   and dr.ttn_id = r.id'
      '                   and dr.ttn_inst = r.inst'
      '                   and r.oper_id in (7, 10, 44)'
      '                   and r.part_id = p.id'
      '                   and r.part_inst = p.inst'
      '                   and p.np_type = np.id'
      '                 union all'
      '                select /*+ORDERED*/ '
      '                       dr.id,'
      '                       dr.inst,'
      '                       dp.azs_id as azsid,'
      '                       dp.azs_inst as azsinst,'
      '                       11407 as to_id,'
      '                       11407 as to_inst,'
      '                       -sr.litr as litr,'
      '                       -sr.count_t as tonn,'
      '                       rep_date,'
      '                       np.grp_id as np_groupid'
      
        '                  from oil_daily_rep dp, oil_dr_data dr, oil_ras' +
        'hod r, oil_part p, oil_np_type np, oil_srother sr'
      '                 where dr.state = '#39'Y'#39
      '                   and dp.state = '#39'Y'#39
      '                   and r.state = '#39'Y'#39
      '                   and dr.oper_type = 1'
      '                   and dr.rep_id = dp.id'
      '                   and dr.rep_inst = dp.inst'
      '                   and dr.ttn_id = r.id'
      '                   and dr.ttn_inst = r.inst'
      '                   and r.oper_id in (7, 10, 44)'
      '                   and r.part_id = p.id'
      '                   and r.part_inst = p.inst'
      '                   and p.np_type = np.id'
      '                   and sr.srep_id = dr.id'
      '                   and sr.srep_inst = dr.inst'
      '                   and sr.oper_id = 55) n,'
      '               v_org oo'
      
        '         where decode(n.np_groupid,4,5,n.np_groupid) in (&npg_id' +
        ')'
      '           and azsid in (&azs_list)'
      '           and trunc(rep_date) between :BeginDate and :EndDate'
      '           and oo.state='#39'Y'#39
      '           and oo.id = n.to_id '
      '           and oo.inst = n.to_inst'
      
        '         group by n.to_id, n.to_inst, oo.name, decode(oo.par,458' +
        '7,1,0), azsid, decode(n.np_groupid,4,5,n.np_groupid), trunc(n.re' +
        'p_date)'
      '        ) npm,'
      '  '
      '       (select to_date(c.date_of, '#39'DD.MM.YYYY'#39') as date_,'
      '                   decode(npg.id,4,5,npg.id) as np_groupid,'
      '                   azs.id as azs_id,'
      '                   azs.azs_num,'
      '                   azs.name as azs_name'
      
        '              from oil_calendar c, v_oil_np_group npg, v_oil_azs' +
        ' azs'
      
        '             where to_date(c.date_of, '#39'DD.MM.YYYY'#39') between :Beg' +
        'inDate and :EndDate'
      '               and npg.id in (&npg_id)'
      '               and azs.id in (&azs_list)'
      '               and azs.obl_id = :obl_id'
      '               ) Q'
      '               '
      '  where Q.date_ = npm.rep_date(+)'
      '    and Q.azs_id = npm.azs_id(+)'
      '    and Q.np_groupid = npm.np_groupid(+)'
      '            '
      'order by Q.date_, '
      '         lpad(Q.azs_num, 10,'#39'0'#39'), '
      
        '         decode(Q.np_groupid,&np1,10,&np2,20,&np3,30,&np4,40, &n' +
        'p5,50, &np6,60), '
      '         is_from_filial, '
      '         npm.from_nb_num nulls last, '
      '         npm.from_id nulls last')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 520
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end
      item
        DataType = ftUnknown
        Name = 'obl_id'
      end>
    MacroData = <
      item
        Name = 'npg_id'
      end
      item
        Name = 'azs_list'
      end
      item
        Name = 'np1'
      end
      item
        Name = 'np2'
      end
      item
        Name = 'np3'
      end
      item
        Name = 'np4'
      end
      item
        Name = 'np5'
      end
      item
        Name = 'np6'
      end>
  end
  object qSvodFilAZSTalon666: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '-->qSvodFilAZSTalon1,Reports'
      'select to_date(cal.date_of, '#39'DD.MM.YYYY'#39') as date_,'
      '       cal.npg_id,'
      '       cal.TalType,'
      '       rest.rest_sum_litr,'
      '       t.sum_litr'
      '  from (select LastTal.NPGrp_Id,'
      '               sum(nvl(LastTal.Litr, 0)) as rest_sum_litr,'
      '               :BeginDate as date_,'
      '               sign(LastTal.Num - 500000000) as TalType'
      '          from (select t.Ser,'
      '                       t.Num,'
      '                       t.Nominal as Litr,'
      
        '                       decode(NPGrp_Id, 4, 5, NPGrp_Id) as NPGrp' +
        '_Id,'
      
        '                       max(to_char(t.date_, '#39'YYYYMMDD'#39') || t.tip' +
        ' || '#39'_'#39' '
      
        '                         || lpad(nvl(t.srep_id,0),20,0) ||'#39'-'#39'|| ' +
        'lpad(nvl(t.srep_inst,0),20,0) '
      
        '                         || '#39'_'#39' || decode(t.tip, '#39'P'#39', '#39'1'#39', decod' +
        'e(t.oper_id, 192, '#39'2'#39', '#39'0'#39'))) as DateCode'
      '                  from v_oil_talon_op t'
      '                 where code_obl = :obl_id'
      '                   and Date_ <= :BeginDate'
      '                   and Ser is not null '
      
        '                   and 0=(select count(*) from oil_add.oil_talon' +
        '_rest where date_on = :BeginDate and obl_id = :obl_id and state ' +
        '= '#39'Y'#39')'
      
        '                 group by t.Ser, t.Num, t.Nominal, decode(NPGrp_' +
        'Id, 4, 5, NPGrp_Id))LastTal'
      '         where substr(DateCode,-1) = '#39'1'#39
      '           --and rownum < 100'
      '           and not exists (select /*+CACHE(dr,srt)*/'
      '                 '#39'X'#39
      '                  from oil_dr_data dr, oil_srtalon srt'
      '                 where srt.state = '#39'Y'#39
      '                   and dr.state = '#39'Y'#39
      '                   and srt.srep_id = dr.id'
      '                   and srt.srep_Inst = dr.inst'
      '                   and dr.oper_type = 1'
      '                   and srt.intheway = 4'
      '                   and srt.code_obl = :obl_id'
      '                   and dr.rep_id = substr(DateCode, 11, 20)'
      '                   and dr.rep_inst = substr(DateCode, 32, 20)'
      '                   and srt.Ser = LastTal.Ser'
      '                   and srt.Num = LastTal.Num)'
      
        '         group by LastTal.NPGrp_Id, sign(LastTal.Num - 500000000' +
        ')'
      '         union all'
      '         select tr.np_grp_id as npgrp_id, '
      '                tr.litr as rest_sum_litr, '
      '                tr.date_on as date_, '
      '                talon_type as TalType'
      '           from oil_add.oil_talon_rest tr'
      '          where date_on = :BeginDate '
      '            and obl_id = :obl_id '
      '            and state = '#39'Y'#39
      '         ) rest,'
      '       '
      '       (select t.Date_,'
      '               decode(t.npgrp_id,4,5,t.npgrp_id) as npgrp_id,'
      '               sum(nvl(t.nominal, 0)) as sum_litr,'
      '               sign(Num - 500000000) as TalType'
      '          from v_oil_talon_op t'
      '         where t.Tip = '#39'O'#39
      '           and code_obl = :obl_id'
      
        '         group by t.Date_, decode(t.npgrp_id,4,5,t.npgrp_id), si' +
        'gn(Num - 500000000)'
      '         ) t,'
      '       '
      
        '       (select c.date_of, decode(npg.id,4,5,npg.id) as npg_id, t' +
        '.TalType'
      '          from oil_calendar c,'
      '               v_oil_np_group npg,'
      '               (select -1 as TalType from dual'
      '                 union all'
      '                select 1 as TalType from dual'
      '                ) t'
      
        '         where to_date(c.date_of, '#39'DD.MM.YYYY'#39') between :BeginDa' +
        'te and :EndDate'
      '           and npg.id in (&npg_id)'
      '           ) cal'
      ''
      ' where rest.NPGrp_Id(+) = cal.npg_id'
      '   and rest.TalType(+) = cal.TalType'
      '   and to_date(cal.date_of, '#39'DD.MM.YYYY'#39') = rest.date_(+)'
      '      '
      '   and t.date_(+) between :BeginDate and :EndDate'
      '   and t.TalType(+) = cal.TalType'
      '   and t.npgrp_id(+) = cal.npg_id'
      '   and to_date(cal.date_of, '#39'DD.MM.YYYY'#39') = t.date_(+)'
      ''
      ' order by to_date(date_of, '#39'DD.MM.YYYY'#39'),'
      '          cal.TalType,'
      
        '          decode(cal.npg_id, &np1,10, &np2,20, &np3,30, &np4,40,' +
        ' &np5,50, &np6,60)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 497
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'obl_id'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end>
    MacroData = <
      item
        Name = 'npg_id'
      end
      item
        Name = 'np1'
      end
      item
        Name = 'np2'
      end
      item
        Name = 'np3'
      end
      item
        Name = 'np4'
      end
      item
        Name = 'np5'
      end
      item
        Name = 'np6'
      end>
  end
  object qSvodFilAZSCustom_Realiz: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '-->qSvodFilAZSCustom_Realiz,Reports'
      'select rep_date as date_, '
      '       azs_id, '
      '       npg_id as np_groupid,'
      '       oper_id,'
      '       nvl(out_litr,0) as out_litr,'
      '       nvl(out_money,0) as out_money,'
      '       nvl(out_count, 0) as out_count'
      '  from (select rep_date,'
      '               decode(npg_id,4,5,npg_id) as npg_id,'
      '               azs_id,'
      '               oper_id,'
      '               sum(out_litr) as out_litr,'
      '               sum(out_money) as out_money,'
      '               sum(out_count) as out_count'
      '          from ('
      '                select /*+ORDERED*/'#39'tal'#39' as tip,'
      '                       trunc(rep_date) as rep_date,'
      '                       np.np_grp as npg_id,'
      '                       drep.azs_id as azs_id,                '
      '                       14 as oper_id, '
      
        '                       sum(nvl(dr.out_talon_litr,0)) as out_litr' +
        ','
      
        '                       sum(nvl(dr.out_talon_money,0)) as out_mon' +
        'ey,'
      
        '                       sum(nvl(dr.out_talon_count,0)) as out_cou' +
        'nt'
      
        '                  from oil_daily_rep drep, oil_dr_data dr, oil_r' +
        'ashod r, oil_part p, v_oil_np_type np'
      
        '                 where drep.state = '#39'Y'#39' and p.state = '#39'Y'#39' and dr' +
        '.state = '#39'Y'#39' and r.state = '#39'Y'#39
      
        '                   and trunc(rep_date) between :BeginDate and :E' +
        'ndDate'
      
        '                   and decode(np.np_grp,4,5,np.np_grp) in (&npg_' +
        'id)'
      '                   and drep.azs_id in (&azs_list)'
      '                   and dr.oper_type = 1'
      '                   and r.oper_id <> 52'
      
        '                   and dr.rep_id = drep.id and dr.rep_inst = dre' +
        'p.inst'
      
        '                   and dr.ttn_id = r.id    and dr.ttn_inst = r.i' +
        'nst'
      
        '                   and r.part_id = p.id    and r.part_inst = p.i' +
        'nst'
      '                   and p.np_type = np.id'
      '                   and dr.out_talon_litr <> 0'
      
        '                 group by trunc(rep_date), np.np_grp, drep.azs_i' +
        'd'
      '         '
      '                 union all'
      ''
      '                select /*+ORDERED*/'#39'nal'#39' as tip,'
      '                       trunc(rep_date) as rep_date,'
      '                       np.np_grp as npg_id,'
      '                       drep.azs_id as azs_id,                '
      '                       12 as oper_id, '
      '                       sum(nvl(dr.out_nal_litr,0)) as out_litr,'
      
        '                       sum(nvl(dr.out_nal_money,0)) as out_money' +
        ','
      '                       sum(nvl(dr.out_nal_count,0)) as out_count'
      
        '                  from oil_daily_rep drep, oil_dr_data dr, oil_r' +
        'ashod r, oil_part p, v_oil_np_type np'
      
        '                 where drep.state = '#39'Y'#39' and p.state = '#39'Y'#39' and dr' +
        '.state = '#39'Y'#39' and r.state = '#39'Y'#39
      
        '                   and trunc(rep_date) between :BeginDate and :E' +
        'ndDate'
      
        '                   and decode(np.np_grp,4,5,np.np_grp) in (&npg_' +
        'id)'
      '                   and drep.azs_id in (&azs_list)'
      '                   and dr.oper_type = 1'
      '                   and r.oper_id <> 52'
      
        '                   and dr.rep_id = drep.id and dr.rep_inst = dre' +
        'p.inst'
      
        '                   and dr.ttn_id = r.id    and dr.ttn_inst = r.i' +
        'nst'
      
        '                   and r.part_id = p.id    and r.part_inst = p.i' +
        'nst'
      '                   and p.np_type = np.id'
      '                   and dr.out_nal_litr <> 0'
      
        '                 group by trunc(rep_date), np.np_grp, drep.azs_i' +
        'd'
      '         '
      '                 union all'
      '         '
      '                 select /*+ORDERED*/'#39'card-other'#39' as tip,'
      '                        trunc(rep_date) as rep_date,'
      '                        np.np_grp as npg_id,'
      '                        drep.azs_id as azs_id,  '
      '                        sro.oper_id,'
      '                        sum(nvl(sro.litr,0)) as out_litr,'
      
        '                        sum(nvl(sro.price*sro.litr, 0)) as out_m' +
        'oney,'
      
        '                        sum(nvl(sro.count_t * 1000, 0)) as out_c' +
        'ount'
      ''
      ''
      '                        /* '#1055#1088#1086#1095#1077#1077', '#1087#1086#1082#1072' '#1085#1077' '#1087#1086#1085#1103#1090#1085#1086' '#1082#1091#1076#1072' '#1087#1080#1093#1072#1090#1100
      '                        sum(case '
      
        '                           when (sro.oper_id in (201,153) or sro' +
        '.oper_id between 270 and 277) '
      '                             then 0 '
      '                           else nvl(sro.litr,0) '
      '                         end) as out_other_litr,'
      '                        sum(case '
      
        '                           when (sro.oper_id in (201,153) or sro' +
        '.oper_id between 270 and 277) '
      '                             then 0 '
      '                           else nvl(sro.count_t,0) '
      '                         end) as out_other_tonn,*/'
      
        '                  from oil_daily_rep drep, oil_dr_data dr, oil_s' +
        'rother sro, oil_rashod r, oil_part p, v_oil_np_type np'
      
        '                 where drep.state = '#39'Y'#39' and p.state = '#39'Y'#39' and dr' +
        '.state = '#39'Y'#39' and sro.state(+) = '#39'Y'#39' and r.state = '#39'Y'#39
      
        '                   and trunc(rep_date) between :BeginDate and :E' +
        'ndDate'
      
        '                   and decode(np.np_grp, 4,5, np.np_grp) in (&np' +
        'g_id)'
      '                   and drep.azs_id in (&azs_list)'
      '                   and dr.oper_type = 1'
      '                   and r.oper_id <> 52'
      '                   and sro.oper_id not in (278, 55)'
      
        '                   and dr.rep_id = drep.id and dr.rep_inst = dre' +
        'p.inst'
      
        '                   and dr.ttn_id = r.id    and dr.ttn_inst = r.i' +
        'nst'
      
        '                   and sro.srep_id = dr.id and sro.srep_inst = d' +
        'r.inst'
      
        '                   and r.part_id = p.id    and r.part_inst = p.i' +
        'nst'
      '                   and p.np_type = np.id'
      
        '                 group by trunc(rep_date), np.np_grp, drep.azs_i' +
        'd, sro.oper_id '
      '         '
      '                 union all '
      '         '
      '                 select /*+ORDERED*/'#39'ved'#39' as tip,'
      '                        trunc(rep_date) as rep_date,'
      '                        np.np_grp as npg_id,'
      '                        drep.azs_id as azs_id,                '
      '                        11 as oper_id,'
      
        '                        sum(nvl(v.litr,0)) as out_litr,         ' +
        '       '
      
        '                        sum(nvl(v.count_t*1000,0)) as out_count,' +
        '                                        '
      '                        sum(nvl(v.price*v.litr,0)) as out_money'
      
        '                  from oil_daily_rep drep, oil_dr_data dr, oil_v' +
        'edomost v, oil_rashod r, oil_part p, v_oil_np_type np'
      
        '                 where drep.state = '#39'Y'#39' and p.state = '#39'Y'#39' and dr' +
        '.state = '#39'Y'#39' and r.state = '#39'Y'#39' and v.state(+) = '#39'Y'#39
      
        '                   and trunc(rep_date) between :BeginDate and :E' +
        'ndDate'
      
        '                   and decode(np.np_grp,4,5,np.np_grp) in (&npg_' +
        'id)'
      '                   and drep.azs_id in (&azs_list)'
      '                   and dr.oper_type = 1'
      '                   and r.oper_id <> 52'
      
        '                   and dr.rep_id = drep.id and dr.rep_inst = dre' +
        'p.inst'
      
        '                   and dr.ttn_id = r.id    and dr.ttn_inst = r.i' +
        'nst'
      
        '                   and v.srep_id = dr.id   and v.srep_inst = dr.' +
        'inst'
      
        '                   and r.part_id = p.id    and r.part_inst = p.i' +
        'nst'
      '                   and p.np_type = np.id'
      
        '                 group by trunc(rep_date), np.np_grp, drep.azs_i' +
        'd'
      '                 )'
      
        '          group by rep_date, decode(npg_id,4,5,npg_id), azs_id, ' +
        'oper_id'
      '         having sum(out_litr) <> 0'
      '          ) rl'
      '  order by rep_date, azs_id, oper_id')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 220
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end>
    MacroData = <
      item
        Name = 'npg_id'
      end
      item
        Name = 'azs_list'
      end>
  end
end
