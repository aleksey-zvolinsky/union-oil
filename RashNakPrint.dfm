object dmRashNakPrint: TdmRashNakPrint
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object qRekv: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select'
      '  Name,'
      '  Addr,'
      '  Svid_Num,'
      '  Nal_Num,'
      '  Boss,'
      '  id_num as OKPO,'
      '  Phone,'
      '  Rach_Chet,'
      '  Bank_Name,'
      '  MFO,'
      '  Face,'
      '  dogovor,'
      '  rn_through'
      'from  v_oil_org'
      'where id = :id'
      'and inst = :inst'
      'order by def desc')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 128
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
  object qDog: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select Dog, Dog_Date'
      '  from oil_dog,'
      '       (select Min(Dog_Date) as MinDate'
      '          from oil_dog'
      '         where State = '#39'Y'#39
      '           and dog_type = '#39'K'#39
      '           and (sub_type <> 101 or :LS = 1)'
      '           and (sub_type = 101 or :LS = 0)'
      '           and ((From_ = :FromId and From_Inst = :FromInst) or'
      '               (From_, From_inst) in'
      '               (select id, inst'
      '                   from oil_org'
      '                  where id = inst'
      '                    and par = :FromId'
      '                    and par_inst = :FromInst))'
      '           and To_ = :ToId'
      '           and To_Inst = :ToInst) FirstDog'
      ' where ((From_ = :FromId and From_Inst = :FromInst) or'
      '       (From_, From_inst) in'
      '       (select id, inst'
      '           from oil_org'
      '          where id = inst'
      '            and par = :FromId'
      '            and par_inst = :FromInst))'
      '   and To_ = :ToId'
      '   and To_Inst = :ToInst'
      '   and Dog_type = '#39'K'#39
      '   and State = '#39'Y'#39
      '   and MinDate = Dog_date'
      '   and (sub_type <> 101 or :LS = 1)'
      '   and (sub_type = 101 or :LS = 0)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 72
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'LS'
      end
      item
        DataType = ftUnknown
        Name = 'FromId'
      end
      item
        DataType = ftUnknown
        Name = 'FromInst'
      end
      item
        DataType = ftUnknown
        Name = 'ToId'
      end
      item
        DataType = ftUnknown
        Name = 'ToInst'
      end>
  end
  object vt: TMemoryTable
    Left = 16
    Top = 64
    object vtDepartment: TStringField
      FieldName = 'Department'
      Size = 200
    end
    object vtAZS: TStringField
      FieldName = 'AZS'
      Size = 150
    end
    object vtNPName: TStringField
      FieldName = 'NPName'
      Size = 40
    end
    object vtCardNumber: TStringField
      FieldName = 'CardNumber'
    end
    object vtDraft: TStringField
      FieldName = 'Draft'
      Size = 100
    end
    object vtDraftDate: TStringField
      FieldName = 'DraftDate'
    end
    object vtDimName: TStringField
      FieldName = 'DimName'
    end
    object vtCount: TFloatField
      FieldName = 'Count'
    end
    object vtPriceNds: TFloatField
      FieldName = 'PriceNds'
    end
    object vtPriceNdsDis: TFloatField
      FieldName = 'PriceNdsDis'
    end
    object vtPriceNoNds: TFloatField
      FieldName = 'PriceNoNds'
    end
    object vtPriceNoNdsDis: TFloatField
      FieldName = 'PriceNoNdsDis'
    end
    object vtNds: TFloatField
      FieldName = 'Nds'
    end
    object vtSumNoNds: TFloatField
      FieldName = 'SumNoNds'
    end
    object vtSumNds: TFloatField
      FieldName = 'SumNds'
    end
    object vtDovSer: TStringField
      FieldName = 'DovSer'
      Size = 10
    end
    object vtDovNum: TStringField
      FieldName = 'DovNum'
    end
    object vtDovWho: TStringField
      FieldName = 'DovWho'
      Size = 40
    end
    object vtDovDate: TDateField
      FieldName = 'DovDate'
    end
    object vtPosNum: TFloatField
      FieldName = 'PosNum'
    end
    object vtPartName: TStringField
      FieldName = 'PartName'
      Size = 50
    end
    object vtCountWanted: TFloatField
      FieldName = 'CountWanted'
    end
    object vtStation: TStringField
      DisplayWidth = 50
      FieldName = 'Station'
      Size = 50
    end
    object vtCertName: TStringField
      FieldName = 'CertName'
      Size = 50
    end
    object vtTalon5L: TFloatField
      FieldName = 'Talon5L'
    end
    object vtTalon10L: TFloatField
      FieldName = 'Talon10L'
    end
    object vtTalon20L: TFloatField
      FieldName = 'Talon20L'
    end
    object vtTalon50L: TFloatField
      FieldName = 'Talon50L'
    end
    object vtShareActive: TBooleanField
      FieldName = 'ShareActive'
    end
    object vtRequest: TStringField
      FieldName = 'Request'
    end
    object vtRequestDate: TDateField
      FieldName = 'RequestDate'
    end
  end
  object qReport: TOilQuery
    SQL.Strings = (
      
        'select /*+ORDERED USE_NL(Oil_Dog, From_Org, From_Rekv, From_Bank' +
        ', To_Org, To_Rekv, To_Bank)*/'
      ' Oil_Dog.*,'
      ' From_Org.Name as From_Name,'
      ' From_Org.Addr as From_Addr,'
      ' From_Org.Svid_Num as From_Svid_Num,'
      ' From_Org.Nal_Num as From_Nal_Num,'
      ' From_Org.Boss as From_Boss,'
      ' From_Org.Id_Num as From_OKPO,'
      ' From_Org.Phone as From_Phone,'
      ' From_Rekv.Rach_Chet as From_Rach_Chet,'
      ' From_Bank.Name as From_Bank_Name,'
      ' From_Bank.MFO as From_MFO,'
      ' To_Org.Name as To_Name,'
      ' To_Org.Addr as To_Addr,'
      ' To_Org.Svid_Num as To_Svid_Num,'
      ' To_Org.Nal_Num as To_Nal_Num,'
      ' To_Org.Boss as To_Boss,'
      ' To_Org.Id_Num as To_OKPO,'
      ' To_Org.Phone as To_Phone,'
      ' To_Rekv.Rach_Chet as To_Rach_Chet,'
      ' To_Bank.Name as To_Bank_Name,'
      ' To_Bank.MFO as To_MFO,'
      ' To_Org.Face as To_Face,'
      ' To_Org.Passport_ser as Passp_Ser,'
      ' To_Org.Passport_num as Passp_Num,'
      ' To_Org.Passport_whom as Passp_whom,'
      ' To_Org.Passport_when as Passp_when,'
      ' Up_From_Org.Name as Up_From_Name,'
      ' Up_From_Org.Addr as Up_From_Addr,'
      ' Up_From_Org.Phone as Up_From_Phone,'
      ' Up_From_Org.Svid_Num as Up_From_Svid_Num,'
      ' Up_From_Org.Nal_Num as Up_From_Nal_Num'
      '  from Oil_Dog,'
      '       V_Org From_Org,'
      '       V_Org Up_From_Org,'
      '       V_Oil_Rekvizit From_Rekv,'
      '       V_Oil_Bank From_Bank,'
      '       V_Org To_Org,'
      '       V_Oil_Rekvizit To_Rekv,'
      '       V_Oil_Bank To_Bank'
      ' where Oil_Dog.State = '#39'Y'#39
      '   and Oil_Dog.Dog_Date = (select min(Dog_Date)'
      '                             from oil_dog'
      '                            where state = '#39'Y'#39
      '                              and to_ = :OrgId'
      '                              and to_inst = :OrgInst'
      '                              and dog_type = '#39'K'#39')'
      '   and Oil_Dog.to_ = :OrgId'
      '   and Oil_Dog.to_inst = :OrgInst'
      '   and Oil_Dog.dog_type = '#39'K'#39
      '   and Oil_Dog.From_ = From_Org.Id'
      '   and Oil_Dog.From_Inst = From_Org.Inst'
      '   and From_Org.Par = Up_From_Org.Id(+)'
      '   and From_Org.Par_Inst = Up_From_Org.Inst(+)'
      '   and Oil_Dog.R_From_ = From_Rekv.Id(+)'
      '   and Oil_Dog.R_From_Inst = From_Rekv.Inst(+)'
      '   and From_Rekv.Id_Bank = From_Bank.Id(+)'
      '   and From_Rekv.Bank_Inst = From_Bank.Inst(+)'
      '   and Oil_Dog.To_ = To_Org.Id'
      '   and Oil_Dog.To_Inst = To_Org.Inst'
      '   and Oil_Dog.R_To_ = To_Rekv.Id(+)'
      '   and Oil_Dog.R_To_Inst = To_Rekv.Inst(+)'
      '   and To_Rekv.Id_Bank = To_Bank.Id(+)'
      '   and To_Rekv.Bank_Inst = To_Bank.Inst(+)'
      '   and rownum = 1')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 192
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end>
    object qReportDOG: TStringField
      FieldName = 'DOG'
      Size = 15
    end
    object qReportDOG_DATE: TDateTimeField
      FieldName = 'DOG_DATE'
    end
    object qReportFROM_NAME: TStringField
      FieldName = 'FROM_NAME'
      Size = 100
    end
    object qReportFROM_ADDR: TStringField
      FieldName = 'FROM_ADDR'
      Size = 200
    end
    object qReportFROM_SVID_NUM: TStringField
      FieldName = 'FROM_SVID_NUM'
      Size = 50
    end
    object qReportFROM_NAL_NUM: TStringField
      FieldName = 'FROM_NAL_NUM'
      Size = 50
    end
    object qReportFROM_BOSS: TStringField
      FieldName = 'FROM_BOSS'
      Size = 50
    end
    object qReportFROM_OKPO: TStringField
      FieldName = 'FROM_OKPO'
    end
    object qReportFROM_PHONE: TStringField
      FieldName = 'FROM_PHONE'
      Size = 30
    end
    object qReportFROM_RACH_CHET: TStringField
      FieldName = 'FROM_RACH_CHET'
    end
    object qReportFROM_BANK_NAME: TStringField
      FieldName = 'FROM_BANK_NAME'
      Size = 50
    end
    object qReportFROM_MFO: TStringField
      FieldName = 'FROM_MFO'
    end
    object qReportTO_NAME: TStringField
      FieldName = 'TO_NAME'
      Size = 100
    end
    object qReportTO_ADDR: TStringField
      FieldName = 'TO_ADDR'
      Size = 200
    end
    object qReportTO_SVID_NUM: TStringField
      FieldName = 'TO_SVID_NUM'
      Size = 50
    end
    object qReportTO_NAL_NUM: TStringField
      FieldName = 'TO_NAL_NUM'
      Size = 50
    end
    object qReportTO_BOSS: TStringField
      FieldName = 'TO_BOSS'
      Size = 50
    end
    object qReportTO_OKPO: TStringField
      FieldName = 'TO_OKPO'
    end
    object qReportTO_PHONE: TStringField
      FieldName = 'TO_PHONE'
      Size = 30
    end
    object qReportTO_RACH_CHET: TStringField
      FieldName = 'TO_RACH_CHET'
    end
    object qReportTO_BANK_NAME: TStringField
      FieldName = 'TO_BANK_NAME'
      Size = 50
    end
    object qReportTO_MFO: TStringField
      FieldName = 'TO_MFO'
    end
    object qReportTO_FACE: TFloatField
      FieldName = 'TO_FACE'
    end
    object qReportPASSP_SER: TStringField
      FieldName = 'PASSP_SER'
      Size = 2
    end
    object qReportPASSP_NUM: TStringField
      FieldName = 'PASSP_NUM'
      Size = 6
    end
    object qReportPASSP_WHOM: TStringField
      FieldName = 'PASSP_WHOM'
      Size = 100
    end
    object qReportPASSP_WHEN: TDateTimeField
      FieldName = 'PASSP_WHEN'
    end
    object qReportUP_FROM_NAME: TStringField
      FieldName = 'UP_FROM_NAME'
      Size = 100
    end
    object qReportUP_FROM_ADDR: TStringField
      FieldName = 'UP_FROM_ADDR'
      Size = 200
    end
    object qReportUP_FROM_PHONE: TStringField
      FieldName = 'UP_FROM_PHONE'
      Size = 30
    end
    object qReportUP_FROM_SVID_NUM: TStringField
      FieldName = 'UP_FROM_SVID_NUM'
      Size = 50
    end
    object qReportUP_FROM_NAL_NUM: TStringField
      FieldName = 'UP_FROM_NAL_NUM'
      Size = 50
    end
  end
  object qWork: TOilQuery
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 16
    Top = 8
  end
  object qDogLink: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select'
      '  Dog,'
      '  Dog_Date'
      'from '
      '  lnk_oil_dog,'
      '  ('
      '  select Min(Dog_Date) as MinDate'
      '  from lnk_oil_dog '
      '  where State='#39'Y'#39' and'
      '  dog_type='#39'K'#39' and'
      '  From_ = :FromId and'
      '  From_Inst = :FromInst and'
      '  To_ = :ToId and'
      '  To_Inst = :ToInst'
      '  ) FirstDog'
      'where'
      '  From_ = :FromId and'
      '  From_Inst = :FromInst and'
      '  To_ = :ToId and'
      '  To_Inst = :ToInst and'
      '  dog_type='#39'K'#39' and'
      '  State = '#39'Y'#39' and'
      '  MinDate =Dog_date'
      ''
      ''
      ''
      '')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 72
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FromId'
      end
      item
        DataType = ftUnknown
        Name = 'FromInst'
      end
      item
        DataType = ftUnknown
        Name = 'ToId'
      end
      item
        DataType = ftUnknown
        Name = 'ToInst'
      end>
  end
  object qRekvLink: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select'
      '  Name,'
      '  Addr,'
      '  Svid_Num,'
      '  Nal_Num,'
      '  Boss,'
      '  id_num as OKPO,'
      '  Phone,'
      '  Rach_Chet,'
      '  Bank_Name,'
      '  MFO,'
      '  Face,'
      '  dogovor,'
      '  rn_through'
      'from  lnk_v_oil_org'
      'where id = :id'
      'and inst = :inst')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 128
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
  object qReportLS: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      
        'select /*+ORDERED USE_NL(Oil_Dog, From_Org, From_Rekv, From_Bank' +
        ', To_Org, To_Rekv, To_Bank)*/'
      '        Oil_Dog.* ,'
      '        From_Org.Name as From_Name,'
      '        From_Org.Addr as From_Addr,'
      '        From_Org.Svid_Num as From_Svid_Num,'
      '        From_Org.Nal_Num as From_Nal_Num,'
      '        From_Org.Boss as From_Boss,'
      '        From_Org.Id_Num as From_OKPO,'
      '        From_Org.Phone as From_Phone,'
      '        From_Rekv.Rach_Chet as From_Rach_Chet,'
      '        From_Bank.Name as From_Bank_Name,'
      '        From_Bank.MFO as From_MFO,'
      '        To_Org.Name as To_Name,'
      '        To_Org.Addr as To_Addr,'
      '        To_Org.Svid_Num as To_Svid_Num,'
      '        To_Org.Nal_Num as To_Nal_Num,'
      '        To_Org.Boss as To_Boss,'
      '        To_Org.Id_Num as To_OKPO,'
      '        To_Org.Phone as To_Phone,'
      '        To_Rekv.Rach_Chet as To_Rach_Chet,'
      '        To_Bank.Name as To_Bank_Name,'
      '        To_Bank.MFO as To_MFO,'
      '        To_Org.Face as To_Face,'
      '        To_Org.Passport_ser as Passp_Ser,'
      '        To_Org.Passport_num as Passp_Num,'
      '        To_Org.Passport_whom as Passp_whom,'
      '        To_Org.Passport_when as Passp_when,'
      '        Up_From_Org.Name as Up_From_Name,'
      '        Up_From_Org.Addr as Up_From_Addr,'
      '        Up_From_Org.Phone as Up_From_Phone,'
      '        Up_From_Org.Svid_Num as Up_From_Svid_Num,'
      '        Up_From_Org.Nal_Num as Up_From_Nal_Num'
      '   from Oil_Dog,'
      '        v_Org From_Org,'
      '        v_Org Up_From_Org,'
      '        v_Oil_Rekvizit From_Rekv,'
      '        v_Oil_Bank From_Bank,'
      '        v_Org To_Org,'
      '        v_Oil_Rekvizit To_Rekv,'
      '        v_Oil_Bank To_Bank'
      '  where Oil_Dog.State = '#39'Y'#39
      '    and Oil_Dog.Dog_Date ='
      '      ('
      '        select min(Dog_Date)'
      '        from oil_dog'
      '        where state = '#39'Y'#39
      '        and to_ = :OrgId'
      '        and to_inst = :OrgInst'
      '        and dog_type = '#39'K'#39
      '        and Sub_Type  = 101'
      '      )'
      '    and Oil_Dog.to_ = :OrgId'
      '    and Oil_Dog.to_inst = :OrgInst'
      '    and Oil_Dog.dog_type = '#39'K'#39
      '    and Oil_DOg.Sub_Type = 101'
      '    and Oil_Dog.From_ = From_Org.Id'
      '    and Oil_Dog.From_Inst = From_Org.Inst'
      '    and From_Org.Par = Up_From_Org.Id (+)'
      '    and From_Org.Par_Inst = Up_From_Org.Inst (+)'
      '    and Oil_Dog.R_From_ = From_Rekv.Id (+)'
      '    and Oil_Dog.R_From_Inst = From_Rekv.Inst (+)'
      '    and From_Rekv.Id_Bank = From_Bank.Id (+)'
      '    and From_Rekv.Bank_Inst = From_Bank.Inst (+)'
      '    and Oil_Dog.To_ = To_Org.Id'
      '    and Oil_Dog.To_Inst = To_Org.Inst'
      '    and Oil_Dog.R_To_ = To_Rekv.Id (+)'
      '    and Oil_Dog.R_To_Inst = To_Rekv.Inst (+)'
      '    and To_Rekv.Id_Bank = To_Bank.Id (+)'
      '    and To_Rekv.Bank_Inst = To_Bank.Inst (+)'
      '    and rownum = 1'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
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
    Left = 192
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end>
  end
end
