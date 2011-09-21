object KonkPriceReportDM: TKonkPriceReportDM
  OldCreateOrder = False
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object qNp: TOilQuery
    SQL.Strings = (
      'select distinct decode(oo.org_type,8,0,35,0,1) as AzsMo,'
      '       npdg.id as npg_id, npdg.name as npg_name,npdg.ord '
      'from oil_konk_price kp,v_org oo,oil_np_dop_group npdg '
      'where kp.state='#39'Y'#39' and kp.date_=:date_'
      '      and kp.inst in (&InstList)'
      '      and kp.org_id=oo.id and kp.org_inst=oo.inst'
      '      and kp.np_dop_group_id=npdg.id'
      'order by AzsMo,npdg.ord')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end>
    MacroData = <
      item
        Name = 'InstList'
      end>
  end
  object q: TOilQuery
    SQL.Strings = (
      
        'select Q.*, round(decode(density,0,0,price/density*1000),2) as p' +
        'rice_tonn'
      'from'
      '(select /*+MERGE(DNS) USE_HASH(knk,DNS,oo)*/'
      
        '      oo.name||decode(oo.org_type,8,'#39' '#39'||oo.addr,'#39#39') as org_name' +
        ','
      
        '      oo.id as org_id,oo.inst as org_inst,npdg.id as np_dop_grou' +
        'p,npdg.name as np_dop_group_name,'
      
        '      opar.id as podr_id,opar.inst as podr_inst,opar.name as pod' +
        'r_name,knk.inst,npdg.ord,'
      
        '      decode(nvl(knk.density,0),0,DNS.density,knk.density) as de' +
        'nsity,knk.price,'
      
        '      --knk.price,round(decode(DNS.density,0,0,knk.price/DNS.den' +
        'sity*1000),2) as price_tonn,'
      '      decode(oo.org_type,8,0,35,0,1) as AzsMo,'
      '      odep.id as konk_dep_id,odep.name as konk_dep_name'
      'from (select kp.*,vri.real_inst,var.value as konk_diff_podr'
      '       from oil_konk_price kp,v_oil_real_inst vri,'
      '            (select nvl(value,'#39'N'#39') as value'
      
        '             from oil_var v,(select '#39'KONK_DIFF_PODR'#39' as name fro' +
        'm dual) Q'
      '             where v.name(+)=Q.name'
      '            ) var'
      '     ) knk,'
      ''
      '(select /*+MERGE(DR) ORDERED USE_HASH(DR,r,p,kp,npt)*/'
      
        '       DR.azs_id,DR.azs_inst,npt.np_dop_group,npt.np_dop_group_n' +
        'ame,'
      
        '       to_number(ltrim(substr(min(to_char(r.date_,'#39'YYYYMMDD'#39')||l' +
        'pad(r.ud_weig,10)),9))) as density'
      'from'
      '------------'
      '(select *'
      'from '
      '(select /*+ORDERED USE_HASH(dr,drep)*/'
      '     drep.azs_id,drep.azs_inst,ttn_id,ttn_inst,'
      
        '     sum(nvl(pr_litr,0)-(nvl(out_nal_litr,0)+nvl(out_ved_litr,0)' +
        '+nvl(out_talon_litr,0)+nvl(out_sn_litr,0)+nvl(out_litr,0))) as l' +
        'itr'
      'from oil_daily_rep drep,oil_dr_data dr'
      'where dr.state='#39'Y'#39' and drep.state='#39'Y'#39
      '      and dr.rep_id=drep.id and dr.rep_inst=drep.inst'
      '      and trunc(drep.rep_date)<:date_'
      'group by ttn_id,ttn_inst,drep.azs_id,drep.azs_inst'
      ')'
      'where litr<>0'
      ') DR, oil_rashod r, oil_part p, v_oil_np_type_dop npt'
      ''
      'where DR.ttn_id=r.id and DR.ttn_inst=r.inst'
      '      and r.part_id=p.id and r.part_inst=p.inst'
      '      and r.state='#39'Y'#39' and p.state='#39'Y'#39
      '      and p.np_type=npt.id'
      ''
      
        'group by DR.azs_id,DR.azs_inst,npt.np_dop_group,npt.np_dop_group' +
        '_name'
      ''
      '/*UNION ALL'
      ''
      'select /*+ORDERED USE_HASH(r,p,npt)/'
      
        '      r.from_id,r.from_inst,npt.np_dop_group,npt.np_dop_group_na' +
        'me,'
      '      min(r.ud_weig)'
      'from oil_rashod r,oil_part p,v_oil_np_type_dop npt'
      'where r.state='#39'Y'#39' and r.date_=:date_ '
      '      and p.state='#39'Y'#39' and r.part_id=p.id and r.part_inst=p.inst'
      '      and p.np_type=npt.id'
      
        'group by r.from_id,r.from_inst,npt.np_dop_group,npt.np_dop_group' +
        '_name*/'
      ') DNS, v_org oo, v_org opar, v_org odep, oil_np_dop_group npdg'
      ''
      
        'where knk.org_id=DNS.azs_id(+) and knk.org_inst=DNS.azs_inst(+) ' +
        'and knk.np_dop_group_id=DNS.np_dop_group(+)'
      '      and knk.state='#39'Y'#39
      '      and knk.org_id=oo.id and knk.org_inst=oo.inst'
      '      and decode(nvl(knk.dep_id,0),'
      '             0,decode(knk.inst,'
      
        '                  knk.real_inst,decode(knk.konk_diff_podr,'#39'Y'#39',nu' +
        'll,knk.inst),'
      '               knk.inst),'
      
        '             knk.dep_id )=odep.id(+) and odep.id(+)=odep.inst(+)' +
        ' '
      
        '      and decode(oo.org_type,8,oo.par,35,oo.par,oo.id)=opar.id(+' +
        ') '
      
        '      and decode(oo.org_type,8,oo.par_inst,35,oo.par_inst,oo.ins' +
        't)=opar.inst(+)'
      '      and knk.np_dop_group_id=npdg.id'
      '      and knk.date_=:date_'
      ') Q'
      'order by decode(org_id-org_inst,0,podr_name,konk_dep_name),'
      '         abs(sign(org_id-org_inst)),'
      
        '         podr_name,podr_id,abs(sign(org_id-podr_id)),org_name,or' +
        'g_id,ord'
      '         ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 96
    Top = 16
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end>
    object qORG_NAME: TStringField
      FieldName = 'ORG_NAME'
      Size = 100
    end
    object qORG_ID: TFloatField
      FieldName = 'ORG_ID'
      Required = True
    end
    object qORG_INST: TFloatField
      FieldName = 'ORG_INST'
      Required = True
    end
    object qNP_DOP_GROUP: TFloatField
      FieldName = 'NP_DOP_GROUP'
      Required = True
    end
    object qNP_DOP_GROUP_NAME: TStringField
      FieldName = 'NP_DOP_GROUP_NAME'
      Required = True
      Size = 50
    end
    object qPODR_ID: TFloatField
      FieldName = 'PODR_ID'
    end
    object qPODR_INST: TFloatField
      FieldName = 'PODR_INST'
    end
    object qPODR_NAME: TStringField
      FieldName = 'PODR_NAME'
      Size = 100
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Required = True
    end
    object qORD: TFloatField
      FieldName = 'ORD'
    end
    object qDENSITY: TFloatField
      FieldName = 'DENSITY'
    end
    object qPRICE: TFloatField
      FieldName = 'PRICE'
      Required = True
    end
    object qAZSMO: TFloatField
      FieldName = 'AZSMO'
    end
    object qKONK_DEP_NAME: TStringField
      FieldName = 'KONK_DEP_NAME'
      Size = 100
    end
    object qPRICE_TONN: TFloatField
      FieldName = 'PRICE_TONN'
    end
    object qKONK_DEP_ID: TFloatField
      FieldName = 'KONK_DEP_ID'
    end
  end
  object qObls: TOilQuery
    SQL.Strings = (
      'select *'
      'from'
      '(select /*+ORDERED USE_HASH(kp,oo,opar)*/'
      '     distinct decode(oo.org_type,3,opar.id,oo.id) as oblid,'
      '              decode(oo.org_type,3,opar.name,oo.name) as oblname'
      'from oil_konk_price kp,v_org oo,v_org opar'
      'where kp.inst=oo.id and oo.id=oo.inst'
      '      and oo.state='#39'Y'#39' and opar.state(+)='#39'Y'#39
      '      and oo.par=opar.id(+) and oo.par_inst=opar.inst(+)'
      '      and kp.state='#39'Y'#39' and kp.date_=:date_'
      ')'
      '&InstCondition'
      'order by oblname')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 160
    Top = 16
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end>
    MacroData = <
      item
        Name = 'InstCondition'
      end>
    object qOblsOBLID: TFloatField
      FieldName = 'OBLID'
    end
    object qOblsOBLNAME: TStringField
      FieldName = 'OBLNAME'
      Size = 100
    end
  end
  object qInstList: TOilQuery
    SQL.Strings = (
      'select id,name'
      'from v_oil_org_norek'
      'where org_id in (3,4,10)'
      '      and id=inst'
      '      and oblid=(select oblid'
      'from v_oil_org_norek'
      'where id=:id and id=inst)')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 32
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
    object qInstListID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qInstListNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object qDop: TOilQuery
    SQL.Strings = (
      'select /*+ORDERED USE_HASH(ool,oo,opar)*/'
      
        '       ool.from_id,ool.from_inst,ool.link_type_id,ool.tag as dis' +
        'tance,'
      '       oo.id as org_id,oo.name as org_name,'
      '       opar.id as par_id,opar.name as par_name'
      'from oil_org_link ool,v_org oo,v_org opar'
      'where ool.state='#39'Y'#39' and ool.link_type_id in (3,4,5)'
      '      and ool.to_id=oo.id and ool.to_inst=oo.inst'
      '      and oo.par=opar.id(+) and oo.par_inst=opar.inst(+)'
      'order by par_id,link_type_id,org_name      ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 96
    Top = 72
    object qDopFROM_ID: TFloatField
      FieldName = 'FROM_ID'
      Required = True
    end
    object qDopFROM_INST: TFloatField
      FieldName = 'FROM_INST'
      Required = True
    end
    object qDopLINK_TYPE_ID: TFloatField
      FieldName = 'LINK_TYPE_ID'
      Required = True
    end
    object qDopDISTANCE: TFloatField
      FieldName = 'DISTANCE'
    end
    object qDopORG_ID: TFloatField
      FieldName = 'ORG_ID'
      Required = True
    end
    object qDopORG_NAME: TStringField
      FieldName = 'ORG_NAME'
      Size = 100
    end
    object qDopPAR_ID: TFloatField
      FieldName = 'PAR_ID'
    end
    object qDopPAR_NAME: TStringField
      FieldName = 'PAR_NAME'
      Size = 100
    end
  end
end
