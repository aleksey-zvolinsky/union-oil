object DbFunc: TDbFunc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object QOrg: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 72
    Top = 8
  end
  object Q: TOilQuery
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 16
    Top = 104
  end
  object TempExTable: TTable
    TableName = 'TempEx.db'
    Left = 72
    Top = 104
    object TempExTableA: TStringField
      FieldName = 'A'
      Size = 100
    end
    object TempExTableB: TStringField
      FieldName = 'B'
      Size = 100
    end
    object TempExTableC: TStringField
      FieldName = 'C'
      Size = 100
    end
    object TempExTableD: TStringField
      FieldName = 'D'
      Size = 100
    end
    object TempExTableE: TStringField
      FieldName = 'E'
      Size = 100
    end
    object TempExTableF: TStringField
      FieldName = 'F'
      Size = 100
    end
    object TempExTableG: TStringField
      FieldName = 'G'
      Size = 100
    end
    object TempExTableH: TStringField
      FieldName = 'H'
      Size = 100
    end
  end
  object QRekvizit: TOilQuery
    SQL.Strings = (
      'select rekv.id as r_id,'
      '           rekv.inst as r_inst,'
      '           bank.name as bank_name,'
      '           rekv.rach_chet as rach_chet,'
      '           bank.mfo as bank_mfo'
      'from oil_org_rekvizit rekv, oil_bank bank'
      'where rekv.state='#39'Y'#39
      'and bank.state='#39'Y'#39
      'and rekv.id_org = :id_'
      'and rekv.inst = :inst_'
      'and bank.id=rekv.id_bank'
      'order by def desc')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 128
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_'
      end
      item
        DataType = ftUnknown
        Name = 'inst_'
      end>
  end
  object qOrgName: TOilQuery
    SQL.Strings = (
      'select id,inst,name'
      'from v_org'
      'where state='#39'Y'#39)
    Filtered = True
    OnCalcFields = qOrgNameCalcFields
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 128
    Top = 8
    object qOrgNameID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_ORG.ID'
    end
    object qOrgNameINST: TFloatField
      FieldName = 'INST'
      Origin = 'OIL_ORG.INST'
    end
    object qOrgNameNAME: TStringField
      FieldName = 'NAME'
      Origin = 'OIL_ORG.NAME'
      Size = 100
    end
    object qOrgNameTRUNC_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'TRUNC_NAME'
      Calculated = True
    end
  end
  object QOblInstList: TOilQuery
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
    Left = 192
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
  end
  object qCardId: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select GetCardId(id,:date_) as card_id'
      'from v_org'
      'where GetCardId(id,:date_) is not null'
      '  and org_type in (3,4)'
      '  and state='#39'Y'#39
      '  and :id in (id,par)')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 16
    Top = 56
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
  end
  object scrCompile: TOraScript
    OnError = scrCompileError
    Session = frmStart.OraSession1
    Left = 72
    Top = 56
  end
  object qIdNum: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      '--> qIdNum,DBFunc'
      'select count(*) as co'
      'from '
      '  (select fake_id_num as id_num'
      '  from oil_org_det2'
      '  where state='#39'Y'#39
      '    and not (org_id=:org_id and org_inst=:org_inst)'
      '  union'
      '  select id_num '
      '  from v_org'
      '  where state='#39'Y'#39
      '    and not (id=:org_id and inst=:org_inst)'
      '  )'
      'where id_num=:id_num')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'org_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'org_inst'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'id_num'
        ParamType = ptInput
      end>
  end
  object qCrRegionRest: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'insert into OIL_REGION_REST'
      
        '  (azs_id, azs_inst, ttn_id, ttn_inst, part_id, part_inst, ss, n' +
        'p_type, dog, rep_date, pr_count, pr_litr, out_nal_count, out_nal' +
        '_litr, out_nal_money, out_ved_count, out_ved_litr, out_ved_money' +
        ', out_talon_count, out_talon_litr, out_talon_money, out_sn_count' +
        ', out_sn_litr, out_sn_money, out_count, out_litr, out_money)'
      '('
      'select /*+ORDERED INDEX(dr I_DR_DATA) */'
      '       drep.azs_id,'
      '       drep.azs_inst,'
      '       dr.ttn_id,'
      '       dr.ttn_inst,'
      '       r.part_id,'
      '       r.part_inst,'
      '       p.ss,'
      '       p.np_type,'
      '       p.dog,'
      '       max(rep_date) as rep_date,'
      '       sum(nvl(dr.pr_count,0)) as pr_count,'
      '       sum(nvl(dr.pr_litr,0)) as pr_litr,'
      '       sum(nvl(dr.out_nal_count,0)) as out_nal_count, '
      '       sum(nvl(dr.out_nal_litr,0)) as out_nal_litr,'
      '       sum(nvl(dr.out_nal_money,0)) as out_nal_money,       '
      '       sum(nvl(dr.out_ved_count,0)) as out_ved_count,'
      '       sum(nvl(dr.out_ved_litr,0)) as out_ved_litr,'
      
        '       sum(nvl(dr.out_ved_money,0)) as out_ved_money,           ' +
        '   '
      '       sum(nvl(dr.out_talon_count,0)) as out_talon_count,'
      '       sum(nvl(dr.out_talon_litr,0)) as out_talon_litr,'
      
        '       sum(nvl(dr.out_talon_money,0)) as out_talon_money,       ' +
        '       '
      '       sum(nvl(dr.out_sn_count,0)) as out_sn_count, '
      '       sum(nvl(dr.out_sn_litr,0)) as out_sn_litr, '
      
        '       sum(nvl(dr.out_sn_money,0)) as out_sn_money,             ' +
        '  '
      '       sum(nvl(dr.out_count,0)) as out_count,'
      '       sum(nvl(dr.out_litr,0)) as out_litr,'
      '       sum(nvl(dr.out_money,0)) as out_money'
      
        '  from oil_daily_rep drep, oil_dr_data dr, oil_rashod r, oil_par' +
        't p'
      
        ' where drep.state='#39'Y'#39' and dr.state='#39'Y'#39' and r.state='#39'Y'#39' and p.sta' +
        'te='#39'Y'#39
      '   and dr.rep_id=drep.id and dr.rep_inst=drep.inst'
      '   and dr.ttn_id=r.id and dr.ttn_inst=r.inst'
      '   and r.part_id=p.id and r.part_inst=p.inst'
      '   and trunc(drep.rep_date)<=:date_'
      '   and dr.oper_type in (0,1)'
      '   and r.oper_id in (7,10)'
      ' group by drep.azs_id,'
      '       drep.azs_inst,'
      '       dr.ttn_id,'
      '       dr.ttn_inst,'
      '       r.part_id,'
      '       r.part_inst,'
      '       p.ss,'
      '       p.np_type,'
      '       p.dog)')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 272
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'date_'
      end>
  end
end
