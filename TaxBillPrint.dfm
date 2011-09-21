object dmTaxBill: TdmTaxBill
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object mtTaxBillData: TMemoryTable
    Left = 56
    Top = 24
    object mtTaxBillDimName: TStringField
      FieldName = 'DimName'
    end
    object mtTaxBillLitr: TFloatField
      FieldName = 'Litr'
    end
    object mtTaxBillNpName: TStringField
      FieldName = 'NpName'
      Size = 50
    end
    object mtTaxBillPriceNds: TFloatField
      FieldName = 'PriceNds'
    end
    object mtTaxBillPriceNoNds: TFloatField
      FieldName = 'PriceNoNds'
    end
    object mtTaxBillSumNoNds: TFloatField
      FieldName = 'SumNoNds'
    end
    object mtTaxBillSumNds: TFloatField
      FieldName = 'SumNds'
    end
    object mtTaxBillNds: TFloatField
      FieldName = 'Nds'
    end
    object mtTaxBillShipDate: TStringField
      FieldName = 'ShipDate'
    end
    object mtTaxBillNpgId: TFloatField
      FieldName = 'NpId'
    end
    object mtTaxBillDimId: TFloatField
      FieldName = 'DimId'
    end
    object mtTaxBillText: TStringField
      FieldName = 'Text'
      Size = 50
    end
  end
  object qReport: TOilQuery
    LocalUpdate = True
    SQL.Strings = (
      
        'select /*+ORDERED USE_HASH(Oil_Dog, From_Org,From_Org_Det, Up_Fr' +
        'om_Org, Up_From_Org_Det,From_Rekv, From_Bank, To_Org, To_Org_Det' +
        ',To_Rekv, To_Bank, npt)*/'
      '       Oil_Dog.*,'
      '       npt.np_grp as np_group_id,'
      '       decode(From_Org_Det.Full_Name,'
      '              null,'
      '              From_Org.Name,'
      '              From_Org_Det.Full_Name) as From_Name,'
      '       From_Org.Addr as From_Addr,'
      '       From_Org.Svid_Num as From_Svid_Num,'
      '       From_Org.Nal_Num as From_Nal_Num,'
      '       From_Org.Boss as From_Boss,'
      '       From_Org.Id_Num as From_OKPO,'
      '       From_Org.Phone as From_Phone,'
      '       From_Rekv.Rach_Chet as From_Rach_Chet,'
      '       From_Bank.Name as From_Bank_Name,'
      '       From_Bank.MFO as From_MFO,'
      
        '       decode(To_Org_Det.Full_Name, null, To_Org.Name, To_Org_De' +
        't.Full_Name) as To_Name,'
      '       To_Org.Addr as To_Addr,'
      '       To_Org.Svid_Num as To_Svid_Num,'
      '       To_Org.Nal_Num as To_Nal_Num,'
      '       To_Org.Boss as To_Boss,'
      '       To_Org.Id_Num as To_OKPO,'
      '       To_Org.Phone as To_Phone,'
      '       To_Rekv.Rach_Chet as To_Rach_Chet,'
      '       To_Bank.Name as To_Bank_Name,'
      '       To_Bank.MFO as To_MFO,'
      '       To_Org.Face as To_Face,'
      '       To_Org.Passport_ser as Passp_Ser,'
      '       To_Org.Passport_num as Passp_Num,'
      '       To_Org.Passport_whom as Passp_whom,'
      '       To_Org.Passport_when as Passp_when,'
      '       decode(Up_From_Org_Det.Full_Name,'
      '              null,'
      '              Up_From_Org.Name,'
      '              Up_From_Org_Det.Full_Name) as Up_From_Name,'
      '       Up_From_Org.Addr as Up_From_Addr,'
      '       Up_From_Org.Phone as Up_From_Phone,'
      '       Up_From_Org.Svid_Num as Up_From_Svid_Num,'
      '       Up_From_Org.Nal_Num as Up_From_Nal_Num'
      '  from Oil_Dog,'
      '       v_Org From_Org,'
      '       v_oil_Org_Det From_Org_Det,'
      '       v_Org Up_From_Org,'
      '       v_oil_Org_Det Up_From_Org_Det,'
      '       v_Oil_Rekvizit From_Rekv,'
      '       v_oil_bank From_Bank,'
      '       v_Org To_Org,'
      '       v_oil_Org_Det To_Org_Det,'
      '       v_Oil_Rekvizit To_Rekv,'
      '       v_oil_bank To_Bank,'
      '       v_Oil_NP_Type npt'
      ' where Oil_Dog.State = '#39'Y'#39
      '   and Oil_Dog.Dog_Date ='
      '       (select min(Dog_Date)'
      '          from oil_dog d, card_id_history cih'
      '         where d.state = '#39'Y'#39
      '           and cih.state = '#39'Y'#39
      '           and d.to_ = :OrgId'
      '           and d.to_inst = :OrgInst'
      '           and d.dog_type = '#39'K'#39
      '           and (d.Sub_Type = 101 or :LS = 0)'
      '           and ov.GetVal('#39'MAIN_PAR'#39') = cih.obl_id'
      '           and d.Dog_Date between cih.date_ and cih.date_to)'
      '   and Oil_Dog.to_ = :OrgId'
      '   and Oil_Dog.to_inst = :OrgInst'
      '   and Oil_Dog.dog_type = '#39'K'#39
      '   and (Sub_Type = 101 or :LS = 0)'
      '   and Oil_Dog.From_ = From_Org.Id'
      '   and Oil_Dog.From_Inst = From_Org.Inst'
      '   and From_Org.Id = From_Org_Det.Org_Id(+)'
      '   and From_Org.Inst = From_Org_Det.Inst(+)'
      '   and From_Org_Det.State(+) = '#39'Y'#39
      '   and From_Org.Par = Up_From_Org.Id(+)'
      '   and From_Org.Par_Inst = Up_From_Org.Inst(+)'
      '   and Up_From_Org.Id = Up_From_Org_Det.Org_Id(+)'
      '   and Up_From_Org.Inst = Up_From_Org_Det.Inst(+)'
      '   and Up_From_Org_Det.State(+) = '#39'Y'#39
      '   and Oil_Dog.R_From_ = From_Rekv.Id(+)'
      '   and Oil_Dog.R_From_Inst = From_Rekv.Inst(+)'
      '   and From_Rekv.Id_Bank = From_Bank.Id(+)'
      '   and From_Rekv.Bank_Inst = From_Bank.Inst(+)'
      '   and Oil_Dog.To_ = To_Org.Id'
      '   and Oil_Dog.To_Inst = To_Org.Inst'
      '   and To_Org.Id = To_Org_Det.Org_Id(+)'
      '   and To_Org.Inst = To_Org_Det.Inst(+)'
      '   and To_Org_Det.State(+) = '#39'Y'#39
      '   and Oil_Dog.R_To_ = To_Rekv.Id(+)'
      '   and Oil_Dog.R_To_Inst = To_Rekv.Inst(+)'
      '   and To_Rekv.Id_Bank = To_Bank.Id(+)'
      '   and To_Rekv.Bank_Inst = To_Bank.Inst(+)'
      '   and Oil_Dog.np_type = npt.id(+)'
      '   and (oil_dog.from_ = :FromId or :FromId is null)'
      '   and (oil_dog.from_inst = :FromInst or :FromInst is null)'
      ' order by Oil_Dog.id')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 138
    Top = 117
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
        Name = 'LS'
      end
      item
        DataType = ftUnknown
        Name = 'FromId'
      end
      item
        DataType = ftUnknown
        Name = 'FromInst'
      end>
  end
  object qSaleBook: TOilQuery
    SQL.Strings = (
      'select  /*+ORDERED USE_HASH(sb,sbd,np,dim)*/'
      '  sb.s_Date as TaxBillDate,'
      '  sb.organ,'
      '  sb.organ_inst,'
      '  sb.from_,'
      '  sb.from_inst,'
      '  sb.Num as TaxBillNum,'
      '  sb.F_Doc as ByDogName,'
      '  sb.sale_txt as PayType,'
      '  sb.Nal_t as TaxBillType,'
      '  Sum(sbd.kol) as CountLitr,'
      '  Sum(sbd.Nds_T) as SumNds,'
      
        '  decode(nal_t,8,Sum(sbd.k_nds_b),Sum(sbd.nds_p_base)) as SumNoN' +
        'ds,'
      '  decode(nal_t,8,Sum(sbd.k_nds_20),Sum(sbd.nds_p_20)) as Nds,'
      '  np.np_grp_FullName as NpName,'
      '  Round(sbd.Nds_T /sbd.kol,2) as PriceNds,'
      '  dim.name as DimName,'
      '  dim.id as Dim_Id,'
      '  np.id as np_id'
      'from'
      '  oil_sale_book sb,'
      '  oil_sale_book_det sbd,'
      '  v_oil_np_type np,'
      '  v_oil_dimension dim'
      'where sb.id = sbd.nn_id (+)'
      '  and sb.inst = sbd.nn_inst (+)'
      '  and sb.state = '#39'Y'#39
      '  and sbd.state = sb.state'
      '  and sbd.div_id = dim.id (+)'
      '  and sbd.tov_id = np.id (+)'
      '  and sb.id = :nn_id '
      '  and sb.inst = :nn_inst'
      'group by'
      '  sb.s_Date,'
      '  sb.organ,'
      '  sb.organ_inst,'
      '  sb.from_,'
      '  sb.from_inst,'
      '  sb.Num,'
      '  sb.F_Doc,'
      '  sb.sale_txt,'
      '  sb.Nal_t,'
      '  Round(sbd.Nds_T /sbd.kol,2),'
      '  np.np_grp_FullName,'
      '  dim.name,'
      '  dim.id,'
      '  np.id'
      'order by sb.Num'
      ''
      ' '
      ''
      ' '
      ' '
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 216
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nn_id'
      end
      item
        DataType = ftUnknown
        Name = 'nn_inst'
      end>
  end
  object qTemp: TOilQuery
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 56
    Top = 120
  end
  object qReportByDog: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      
        'select /*+ORDERED USE_HASH(Oil_Dog, From_Org,From_Org_Det, Up_Fr' +
        'om_Org, Up_From_Org_Det,From_Rekv, From_Bank, To_Org, To_Org_Det' +
        ',To_Rekv, To_Bank, npt)*/'
      '        Oil_Dog.* ,'
      '        npt.np_grp as np_group_id,'
      
        '        decode(   From_Org_Det.Full_Name,null, From_Org.Name ,  ' +
        'From_Org_Det.Full_Name  )  as From_Name,'
      '        From_Org.Addr as From_Addr,'
      '        From_Org.Svid_Num as From_Svid_Num,'
      '        From_Org.Nal_Num as From_Nal_Num,'
      '        From_Org.Boss as From_Boss,'
      '        From_Org.Id_Num as From_OKPO,'
      '        From_Org.Phone as From_Phone,'
      '        From_Rekv.Rach_Chet as From_Rach_Chet,'
      '        From_Bank.Name as From_Bank_Name,'
      '        From_Bank.MFO as From_MFO,'
      
        '        decode(To_Org_Det.Full_Name, null,  To_Org.Name, To_Org_' +
        'Det.Full_Name)  as To_Name,'
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
      
        '        decode(Up_From_Org_Det.Full_Name, null, Up_From_Org.Name' +
        ', Up_From_Org_Det.Full_Name) as Up_From_Name,'
      '        Up_From_Org.Addr as Up_From_Addr,'
      '        Up_From_Org.Phone as Up_From_Phone,'
      '        Up_From_Org.Svid_Num as Up_From_Svid_Num,'
      '        Up_From_Org.Nal_Num as Up_From_Nal_Num'
      '   from Oil_Dog,'
      '        v_Org From_Org,'
      '        v_oil_Org_Det From_Org_Det,'
      '        v_Org Up_From_Org,'
      '        v_oil_Org_Det Up_From_Org_Det,'
      '        v_Oil_Rekvizit From_Rekv,'
      '        v_Oil_Bank From_Bank,'
      '        v_Org To_Org,'
      '        v_oil_Org_Det To_Org_Det,'
      '        v_Oil_Rekvizit To_Rekv,'
      '        v_Oil_Bank To_Bank,'
      '        v_Oil_NP_Type npt'
      '  where Oil_Dog.State = '#39'Y'#39
      '    and Oil_Dog.Id = :DogId'
      '    and Oil_Dog.inst = :DogInst'
      '    and Oil_Dog.State = '#39'Y'#39
      '    and Oil_Dog.From_ = From_Org.Id'
      '    and Oil_Dog.From_Inst = From_Org.Inst'
      '    and From_Org.Id =  From_Org_Det.Org_Id  (+)'
      '    and From_Org.Inst = From_Org_Det.Inst (+)'
      '    and From_Org_Det.State (+) ='#39'Y'#39
      '    and From_Org.Par = Up_From_Org.Id (+)'
      '    and From_Org.Par_Inst = Up_From_Org.Inst (+)'
      '    and Up_From_Org.Id = Up_From_Org_Det.Org_Id (+)'
      '    and Up_From_Org.Inst = Up_From_Org_Det.Inst (+)'
      '    and Up_From_Org_Det.State (+) ='#39'Y'#39
      '    and Oil_Dog.R_From_ = From_Rekv.Id (+)'
      '    and Oil_Dog.R_From_Inst = From_Rekv.Inst (+)'
      '    and From_Rekv.Id_Bank = From_Bank.Id (+)'
      '    and From_Rekv.Bank_Inst = From_Bank.Inst (+)'
      '    and Oil_Dog.To_ = To_Org.Id'
      '    and Oil_Dog.To_Inst = To_Org.Inst'
      '    and To_Org.Id =  To_Org_Det.Org_Id  (+)'
      '    and To_Org.Inst = To_Org_Det.Inst (+)'
      '    and To_Org_Det.State (+) ='#39'Y'#39
      '    and Oil_Dog.R_To_ = To_Rekv.Id (+)'
      '    and Oil_Dog.R_To_Inst = To_Rekv.Inst (+)'
      '    and To_Rekv.Id_Bank = To_Bank.Id (+)'
      '    and To_Rekv.Bank_Inst = To_Bank.Inst (+)'
      '    and Oil_Dog.np_type=npt.id(+)'
      '    order by Oil_Dog.id')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 136
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DogId'
      end
      item
        DataType = ftUnknown
        Name = 'DogInst'
      end>
  end
  object qDog: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select'
      ' oil_dog.dog as dog_name,'
      ' oil_dog.dog_date,'
      ' oil_dog.dog_type,'
      ' oil_dog.to_,'
      ' oil_dog.to_inst,'
      ' dim.name as dim_name,'
      ' d.dim_id as dim_id,'
      ' d.*,'
      ' decode(oil_dog.dog_type,'#39'S'#39',ot.name,np.name)  as np_name,'
      ' decode(oil_dog.dog_type,'#39'S'#39',null,np.petrol_id) as petrol_id  ,'
      ' decode(oil_dog.dog_type,'#39'S'#39',ot.id,np.id) as np_id,'
      ' round(d.count_*d.price,2) as SumXNds'
      'from '
      ' oil_dog,'
      ' oil_dog_detail d,'
      ' v_oil_np_type np,'
      ' v_oil_oper_type ot,'
      ' v_oil_dimension dim'
      'where'
      ' Oil_Dog.id = :dog_id and'
      ' Oil_Dog.inst = :dog_inst and'
      ' Oil_Dog.id = d.dog_id and'
      ' Oil_Dog.inst = d.dog_inst  and'
      ' oil_Dog.State='#39'Y'#39' and'
      ' ot.state (+) = '#39'Y'#39' and'
      ' dim.state (+) = '#39'Y'#39' and'
      ' d.state='#39'Y'#39' and'
      ' d.np_type = np.id (+) and'
      ' d.np_type = ot.id (+) and'
      ' d.dim_id = dim.id (+)'
      ' '
      ' '
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 312
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dog_id'
      end
      item
        DataType = ftUnknown
        Name = 'dog_inst'
      end>
  end
  object qNN: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select b.num,'
      '       b.frasch,'
      '       b.f_doc,'
      '       b.s_date s_date,'
      '       nvl(bd.Det_Date, b.s_date) det_date,'
      '       b.organ,'
      '       b.organ_inst,'
      '       sum(nvl(bd.kol,b.kol)) count_,'
      '       bd.price_nds,'
      '       nvl(bd.tov_id,b.tov_id) as tov_id,'
      '       tov_name,'
      '       dim_name,'
      '       b.from_,'
      '       b.from_inst,'
      '       b.nal_t,'
      '       bd.det_text,'
      '       bd.det_date,'
      '       sum(bd.nds_t) nds_t,'
      '       sum(nvl(bd.nds_p_base,bd.nds_np_base)) nds_p_base,'
      '       sum(nvl(bd.nds_p_20,bd.nds_np_20)) nds_p_20,'
      '       b.nn_cause_id,'
      '       b.nn_type_id,'
      '       b.nn_id,'
      '       b.nn_inst'
      '  from OIL_SALE_BOOK b,'
      '       v_OIL_SALE_BOOK_DET bd'
      ' where b.id = :nn_id and b.inst = :nn_inst'
      '   and b.state = '#39'Y'#39
      '   and bd.nn_id = b.id'
      '   and bd.nn_inst = b.inst'
      '   and nvl(bd.nds_t,0) <> 0'
      ' group by b.num,'
      '       b.frasch,'
      '       b.f_doc,'
      '       b.s_date,'
      '       nvl(bd.Det_Date, b.s_date) ,'
      '       b.organ,'
      '       b.organ_inst,'
      '       bd.price_nds,'
      '       nvl(bd.tov_id,b.tov_id),'
      '       tov_name,'
      '       dim_name,'
      '       b.from_,'
      '       b.from_inst,'
      '       b.nal_t,'
      '       bd.det_text,'
      '       bd.det_date,'
      '       b.nn_cause_id,'
      '       b.nn_type_id,'
      '       b.nn_id,'
      '       b.nn_inst'
      ' order by s_date,'
      '          bd.det_date asc,'
      '          decode(b.nn_cause_id, 8,'
      
        '                 decode(tov_id, 4,10, 5,20, 6,30, 9,40, 7,50, 3,' +
        '60, 8,70, 100), -- petrol_id ('#1057#1050') '
      
        '                 decode(tov_id, 4,10, 5,20, 6,30, 7,40, 76,50, 1' +
        '0,60, 3,70, 62,80, 100) -- np_group_id'
      '          )'
      ' ')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 312
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nn_id'
      end
      item
        DataType = ftUnknown
        Name = 'nn_inst'
      end>
  end
  object qTestByDog: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select max(dog_sum) as dog_sum,'
      '       nvl(max(nn_sum), 0) as nn_sum,'
      '       nvl(dog_np_type, nn_np_type) as np_type'
      '  from (select round(is_calc_nds * sum(d.price_nds * d.litr) +'
      '                     (1 - is_calc_nds) *'
      
        '                     sum(nds.GetWithNDS_NoNDS(d.price_x_nds * d.' +
        'litr,'
      '                                              d.dog_date)),'
      '                     2) as dog_sum,'
      '               d.np_type as dog_np_type,'
      '               to_number(null) as nn_sum,'
      '               null as nn_np_type'
      '          from v_oil_dog_full d'
      '         where d.dog_id = :dog_id'
      '           and d.dog_inst = :dog_inst'
      '         group by d.np_type, d.dog_date, d.is_calc_nds'
      '        union all'
      '        select to_number(null) as dog_sum,'
      '               to_number(null) as dog_np_type,'
      '               sum(b.nds_t) as nn_sum,'
      '               b.tov_id as nn_np_type'
      '          from v_oil_sale_book_det b, v_oil_sale_book_link l'
      '         where l.nn_id = b.nn_id'
      '           and l.nn_inst = b.nn_inst'
      '           and l.dog_id = :dog_id'
      '           and l.dog_inst = :dog_inst'
      '           and not (b.nn_id = :nn_id and b.nn_inst = :nn_inst)'
      '         group by b.tov_id)'
      ' group by nvl(dog_np_type, nn_np_type)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 208
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dog_id'
      end
      item
        DataType = ftUnknown
        Name = 'dog_inst'
      end
      item
        DataType = ftUnknown
        Name = 'nn_id'
      end
      item
        DataType = ftUnknown
        Name = 'nn_inst'
      end>
  end
end
