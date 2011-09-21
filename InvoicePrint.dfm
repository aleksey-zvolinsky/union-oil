object dmInvoicePrint: TdmInvoicePrint
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object qRekv: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      
        'select decode(vorg.Full_Name, null, vorg.Name, vorg.Full_Name) a' +
        's Name,'
      '       vorg.Addr,'
      '       vorg.Svid_Num,'
      '       vorg.Nal_Num,'
      '       vorg.Boss,'
      '       vorg.id_num as OKPO,'
      '       vorg.id_num,'
      '       vorg.Phone,'
      '       vorg.Rach_Chet,'
      '       vorg.rach_chet_nds,'
      '       vorg.Bank_Name,'
      '       vorg.MFO,'
      '       vorg.Face,'
      '       face.passport_ser,'
      '       face.passport_num,'
      '       face.passport_whom,'
      '       face.passport_when,'
      '       rek_id,'
      '       rek_inst'
      '  from v_oil_org vorg, v_org face'
      ' where vorg.id = :id'
      '   and vorg.inst = :inst'
      '   and (vorg.rek_id = :rek_id or nvl(:rek_id, 0) = 0)'
      '   and (vorg.rek_inst = :rek_inst or nvl(:rek_id, 0) = 0)'
      '   and vorg.id = face.id'
      '   and vorg.inst = face.inst'
      '   and face.state = '#39'Y'#39
      ' order by vorg.def desc')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 64
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end
      item
        DataType = ftUnknown
        Name = 'rek_id'
      end
      item
        DataType = ftUnknown
        Name = 'rek_inst'
      end>
  end
  object qDog: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select dog,'
      '       dog_date,'
      '       from_,'
      '       from_inst,'
      '       r_from_,'
      '       r_from_inst,'
      '       to_,'
      '       to_inst,'
      '       r_to_,'
      '       r_to_inst'
      '  from oil_dog'
      ' where state = '#39'Y'#39
      '   and ((Dog_Date = (select min(Dog_Date)'
      '                       from oil_dog'
      '                      where state = '#39'Y'#39
      '                        and to_ = :Org_Id'
      '                        and to_inst = :Org_Inst'
      '                        and (dog_type, sub_type, forepay) in'
      '                            (select dog_type, sub_type, forepay'
      '                               from oil_dog'
      '                              where state = '#39'Y'#39
      '                                and id = :Dog_Id'
      '                                and inst = :Dog_Inst'
      '                                and to_ = :Org_Id'
      '                                and to_inst = :Org_Inst)) and'
      '       :IsFirstDog = 1) or :IsFirstDog = 0)'
      '   and to_ = :Org_Id'
      '   and to_inst = :Org_Inst'
      '   and (id = :Dog_Id or :IsFirstDog = 1)'
      '   and (inst = :Dog_Inst or :IsFirstDog = 1)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 66
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'org_id'
      end
      item
        DataType = ftUnknown
        Name = 'org_inst'
      end
      item
        DataType = ftUnknown
        Name = 'Dog_Id'
      end
      item
        DataType = ftUnknown
        Name = 'Dog_Inst'
      end
      item
        DataType = ftUnknown
        Name = 'IsFirstDog'
      end>
  end
  object vt: TMemoryTable
    Left = 8
    Top = 8
    object vtNpName: TStringField
      DisplayWidth = 50
      FieldName = 'NpName'
      Size = 50
    end
    object vtDimName: TStringField
      FieldName = 'DimName'
    end
    object vtPriceNoNds: TFloatField
      FieldName = 'PriceNoNds'
    end
    object vtPriceNDS: TFloatField
      FieldName = 'PriceNDS'
    end
    object vtCount: TFloatField
      FieldName = 'Count'
    end
    object vtSumNds: TFloatField
      FieldName = 'SumNds'
    end
    object vtSumNoNds: TFloatField
      FieldName = 'SumNoNds'
    end
  end
  object qParent: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select p.*, c.boss c_boss, c.dov c_dov, c.dov_date c_dov_date'
      '  from v_oil_org c, v_oil_org p'
      ' where c.id = :id'
      '   and c.inst = :inst'
      '   and c.par = p.id(+)'
      '   and c.par_inst = p.inst(+)')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 10
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id'
      end
      item
        DataType = ftUnknown
        Name = 'Inst'
      end>
  end
end
