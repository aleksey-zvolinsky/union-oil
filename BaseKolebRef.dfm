inherited BaseKolebRefForm: TBaseKolebRefForm
  Left = 275
  Top = 221
  Caption = #1050#1086#1083#1077#1073#1072#1085#1080#1103' '#1088#1072#1079#1085#1080#1094#1099' '#1082#1085#1080#1078#1085#1086#1075#1086' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1080' '#1079#1072#1084#1077#1088#1086#1074
  ClientHeight = 597
  ClientWidth = 911
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 564
    Width = 911
    inherited pShowDetail: TPanel [0]
      Left = 393
      Width = 321
      inherited cbShowDetail: TCheckBox
        Left = 10
      end
    end
    inherited Panel3: TPanel [1]
      Left = 714
    end
    inherited PAdd: TPanel [2]
    end
    inherited PEdit: TPanel [3]
    end
    inherited pDel: TPanel [4]
    end
    inherited Panel4: TPanel [5]
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
    inherited pPrint: TPanel [6]
    end
    inherited pTotal: TPanel [7]
      Visible = True
      inherited sbTotal: TSpeedButton
        Down = True
      end
    end
    inherited pSpeedUp: TPanel [8]
      Width = 55
      Visible = True
      inherited sbSpeedUp: TSpeedButton
        Left = -134
        Caption = #1041#1099#1089#1090#1088#1086
        Layout = blGlyphBottom
        Margin = 0
        ParentBiDiMode = False
        Visible = False
        OnClick = nil
      end
      object sbButtonLabel: TLabel
        Left = 48
        Top = 8
        Width = 3
        Height = 13
      end
    end
  end
  inherited Panel2: TPanel
    Width = 911
    Height = 47
    object lblBeginDate: TLabel
      Left = 8
      Top = 4
      Width = 38
      Height = 13
      Caption = #1044#1072#1090#1072' c:'
    end
    object lblEndDate: TLabel
      Left = 108
      Top = 4
      Width = 15
      Height = 13
      Caption = #1087#1086':'
    end
    object lblProduct: TLabel
      Left = 340
      Top = 4
      Width = 76
      Height = 13
      Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090':'
    end
    object lblRez: TLabel
      Left = 208
      Top = 4
      Width = 57
      Height = 13
      Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088':'
    end
    object deBeginDate: TDateEdit
      Left = 8
      Top = 20
      Width = 90
      Height = 21
      CheckOnExit = True
      DefaultToday = True
      DirectInput = False
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
      Text = '01.10.2010'
    end
    object deEndDate: TDateEdit
      Left = 108
      Top = 20
      Width = 90
      Height = 21
      CheckOnExit = True
      DefaultToday = True
      DirectInput = False
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
      Text = '01.11.2010'
    end
    object Product: TEdit
      Left = 340
      Top = 20
      Width = 125
      Height = 21
      TabOrder = 2
      OnChange = CreditorOrgChange
    end
    object Rez: TEdit
      Left = 208
      Top = 20
      Width = 125
      Height = 21
      TabOrder = 3
      OnChange = CreditorOrgChange
    end
    object cbKolebTubes: TCheckBox
      Left = 480
      Top = 24
      Width = 193
      Height = 17
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1083#1077#1073#1072#1085#1080#1103' '#1090#1088#1091#1073
      TabOrder = 4
      OnClick = cbKolebTubesClick
    end
  end
  inherited pBase: TPanel
    Top = 57
    Width = 761
    Height = 507
    inherited SplitterDetail: TSplitter
      Top = 452
      Width = 761
    end
    inherited DBGrid1: TDBGridEh
      Width = 761
      Height = 452
      DrawGraphicData = True
      DrawMemoText = True
      FooterRowCount = 1
      ReadOnly = True
      SumList.Active = True
      UseMultiTitle = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'MDATE'
          Footer.Alignment = taRightJustify
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Width = 170
        end
        item
          EditButtons = <>
          FieldName = 'NUMB'
          Footers = <>
          Title.Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088
          Width = 82
        end
        item
          EditButtons = <>
          FieldName = 'FUEL_NAME'
          Footers = <>
          Title.Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
          Width = 82
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'DIFF'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1056#1072#1079#1085#1080#1094#1072
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'LAGDIFF'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1056#1072#1079#1085#1080#1094#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1072#1103
          Width = 67
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'DIFF2'
          Footer.DisplayFormat = ',0'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1044#1077#1083#1100#1090#1072
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'POGR'
          Footers = <>
          Title.Caption = #1044#1086#1087#1091#1089#1090#1080#1084#1072#1103' '#1087#1086#1075#1088#1077#1096#1085#1086#1089#1090#1100' (0.65% '#1080#1083#1080' 0.5% '#1086#1090' '#1090#1077#1082#1091#1097#1077#1081' '#1084#1072#1089#1089#1099')'
          Width = 117
        end>
    end
    inherited pDetail: TPanel
      Top = 455
      Width = 761
      inherited DBGridDetail: TDBGridEh
        Width = 761
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 911
    inherited pnlTuneGridBtn: TPanel
      Left = 882
    end
  end
  inherited PanelCol: TPanel
    Left = 761
    Top = 57
    Height = 507
    inherited cbCol: TRxCheckListBox
      Height = 479
    end
    inherited pRefresh: TPanel
      Top = 481
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      
        'select  to_char(decode(mdate_,:end_date+1,'#39#1048#1090#1086#1075#1086' '#1087#1086' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1091' '#1079 +
        #1072' '#1087#1077#1088#1080#1086#1076#39',mdate_)) as mdate, numb, Pogr, '
      '--ValidError2,'
      '--ValidError1, '
      'DIFF2, diff, lagdiff, fuel_id, fuel_name from'
      '(select mdate as mdate_,q6.numb, Pogr, '
      '--ValidError2,'
      '--ValidError1, '
      'DIFF2, diff, lagDIFF, fuel_id, fuel_name from ('
      'select '
      '       /*'#1088#1072#1079#1085#1080#1094#1072'*/'
      '       DIFF,'
      '       /*'#1088#1072#1079#1085#1080#1094#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1072#1103'*/'
      
        '       nvl(lag(DIFF) over(partition by numb order by mdate), 0) ' +
        'as lagDIFF,'
      '       /*'#1082#1086#1083#1077#1073#1072#1085#1080#1077' '#1088#1072#1079#1085#1080#1094#1099'*/'
      
        '       (DIFF - (nvl(lag(DIFF) over(partition by numb order by md' +
        'ate), 0))) as DIFF2,'
      '       /*'#1087#1086#1075#1088#1077#1096#1085#1086#1089#1090#1100'*/'
      
        '       round(decode(sign(LITRES_ALL_-120000),1,0.0065,0.005) * L' +
        'ITRES_ALL_, 0) as Pogr,'
      '       /*'#1082#1086#1083#1077#1073#1072#1085#1080#1077' '#1088#1072#1079#1085#1080#1094#1099' '#1085#1072' 10%*/'
      
        '       abs((nvl(lag(DIFF) over(partition by numb order by mdate)' +
        ', 0)) - DIFF) - abs(DIFF) * .1 as ValidError1,'
      '       /*'#1082#1086#1083#1077#1073#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086' '#1073#1099#1090#1100' '#1073#1086#1083#1100#1096#1077' '#1087#1086#1075#1088#1077#1096#1085#1086#1089#1090#1080' '#1074' 1,5 '#1088#1072#1079#1072' */'
      
        '       abs(DIFF - (nvl(lag(DIFF) over(partition by numb order by' +
        ' mdate), 0))) - 1.5*round(decode(sign(LITRES_ALL_-120000),1,0.00' +
        '65,0.005) * LITRES_ALL_, 0) as ValidError2,'
      '       mdate,numb,fuel_id, fuel_name  '
      '       /*mdate, numb, Q5.* */ from ('
      
        'select nvl(LITRES_ALL_POINTS, trunc(Q4.fact_diff_date_ratio * Q4' +
        '.fact_diff_litres) + LITRES_ALL_CONTINUOS) as LITRES_ALL,'
      
        '       nvl(CURAMOUNT_POINTS_, trunc(Q4.book_diff_date_ratio * Q4' +
        '.book_diff_litres) + CURAMOUNT_CONTINUOS)/*)*/ as CURAMOUNT,'
      
        '       /* '#1056#1072#1079#1085#1080#1094#1072' '#1085#1072' '#1079#1072#1084#1077#1088' '#1074' '#1089#1088#1072#1074#1085#1077#1085#1080#1080' '#1089' '#1087#1086#1089#1083#1077#1076#1085#1080#1084' '#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1086' ' +
        #1085#1077#1075#1086' '#1082#1085#1080#1078#1085#1099#1084' */'
      
        '       max(DIFF_ON_FACT)over(partition by numb/*, fuel_id*/, fac' +
        't_typ_sum) as DIFF,'
      
        '       max(CURAMOUNT_ON_FACT)over(partition by numb/*, fuel_id*/' +
        ', fact_typ_sum) as CURAMOUNT_ON_FACT_CONTINUOS,       '
      '       /* '#1040#1087#1088#1086#1082#1089#1080#1084#1080#1088#1086#1074#1072#1085#1072#1103' '#1088#1072#1079#1085#1080#1094#1072' '#1079#1072#1084#1077#1088#1072' '#1080' '#1082#1085#1080#1078#1085#1086#1075#1086' */'
      
        '       (nvl(LITRES_ALL_POINTS, trunc(Q4.fact_diff_date_ratio * Q' +
        '4.fact_diff_litres) + LITRES_ALL_CONTINUOS)) /*as LITRES_ALL*/ '
      
        '         - (nvl(CURAMOUNT_POINTS_, trunc(Q4.book_diff_date_ratio' +
        ' * Q4.book_diff_litres) + CURAMOUNT_CONTINUOS)) /*as CURAMOUNT*/' +
        ' as DIFF_APROX,'
      
        '       trunc(row_number()over(partition by numb/*, fuel_id*/ ORD' +
        'ER BY Q4.MDATE)/greatest(count(*)over(partition by numb/*, fuel_' +
        'id*/),1)*100) as rn,'
      '       case '
      '         when trunc(MDATE) between :begin_date and :end_date '
      '           then 1 '
      '           else 0'
      '        end as is_chart,'
      '       Q4.*,'
      '       (CURAMOUNT_) as CURAMOUNT_POINTS'
      '  from ('
      'select Q3.*,'
      
        '       max(decode(typ,1,FUEL_NAME,null)) over(partition by numb/' +
        '*, fuel_id*/, fact_typ_sum) as FACT_FUEL_NAME_CONTINUOS,'
      
        '       max(decode(typ,1,FUEL_ID,null)) over(partition by numb/*,' +
        ' fuel_id*/, fact_typ_sum) as FACT_FUEL_ID_CONTINUOS,       '
      
        '       max(LITRES_ALL_) over(partition by numb/*, fuel_id*/, fac' +
        't_typ_sum) as LITRES_ALL_CONTINUOS,'
      
        '       LITRES_ALL_ - max(CURAMOUNT_) over(partition by numb/*, f' +
        'uel_id*/, book_typ_num) as DIFF_ON_FACT,'
      
        '       decode(LITRES_ALL_,null,null,max(CURAMOUNT_) over(partiti' +
        'on by numb/*, fuel_id*/, book_typ_num)) as CURAMOUNT_ON_FACT,'
      
        '       max(TEMPER) over(partition by numb/*, fuel_id*/, fact_typ' +
        '_sum) as TEMPER_CONTINUOS,'
      
        '       max(CURAMOUNT_) over(partition by numb/*, fuel_id*/, book' +
        '_typ_num) as CURAMOUNT_CONTINUOS,'
      ''
      
        '       /* - ('#1042#1077#1089' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1079#1072#1084#1077#1088#1072') + ('#1042#1077#1089' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1079#1072#1084#1077#1088#1072') =' +
        ' '#1056#1072#1079#1085#1080#1094#1072' '#1084#1077#1078#1076#1091' '#1090#1077#1082#1091#1097#1080#1084' '#1080' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1084' '#1079#1072#1084#1077#1088#1086#1084' */'
      
        '       nvl((-max(LITRES_ALL_) over(partition by numb/*, fuel_id*' +
        '/, fact_typ_sum) /*as LITRES_ALL*/ + max(FACT_ALL_LEAD) over(par' +
        'tition by numb/*, fuel_id*/, fact_typ_sum)),0)'
      '         as fact_diff_litres,   '
      '       /* '#1055#1086' '#1072#1085#1072#1083#1086#1075#1080#1080' '#1082#1085#1080#1078#1085#1099#1077' */  '
      
        '       nvl((-max(CURAMOUNT_) over(partition by numb/*, fuel_id*/' +
        ', book_typ_num) /*as LITRES_ALL*/ + max(BOOK_ALL_LEAD) over(part' +
        'ition by numb/*, fuel_id*/, book_typ_num)),0)'
      '         as book_diff_litres,                '
      '       /*'
      '         ('#1042#1088#1077#1084#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072') - ('#1042#1088#1077#1084#1103' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1079#1072#1084#1077#1088#1072')'
      
        '        --------------'#1076#1077#1083#1080#1090#1100'------------------------------------' +
        '  = '#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' ('#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1086' '#1076#1074#1091#1093' '#1079#1072#1084#1077#1088#1086#1074') '
      
        '         ('#1042#1088#1077#1084#1103' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1079#1072#1084#1077#1088#1072') - ('#1042#1088#1077#1084#1103' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1079#1072#1084#1077#1088#1072') ' +
        '       '
      '       */       '
      
        '       nvl(round((mdate - min(mdate) over(partition by numb/*, f' +
        'uel_id*/, fact_typ_sum)/* as MDATE_FACT*/ + 1e-10) /'
      
        '         greatest(min(FACT_MDATE_LEAD) over(partition by numb/*,' +
        ' fuel_id*/, fact_typ_sum) /*as MDATE_LEAD*/ - min(mdate) over(pa' +
        'rtition by numb/*, fuel_id*/, fact_typ_sum),1)/* as MDATE_FACT*/' +
        ',4),0) '
      '         as fact_diff_date_ratio,     '
      '       /* '#1055#1086' '#1072#1085#1072#1083#1086#1075#1080#1080' '#1082#1085#1080#1078#1085#1099#1077' */'
      
        '       nvl(round((mdate - min(mdate) over(partition by numb/*, f' +
        'uel_id*/, book_typ_num)/* as MDATE_FACT*/ + 1e-10) /'
      
        '         greatest(min(BOOK_MDATE_LEAD) over(partition by numb/*,' +
        ' fuel_id*/, book_typ_num) /*as MDATE_LEAD*/ - min(mdate) over(pa' +
        'rtition by numb/*, fuel_id*/, book_typ_num),1)/* as MDATE_FACT*/' +
        ',4),0) '
      '         as book_diff_date_ratio,          '
      '          '
      '       LITRES_ALL_ as LITRES_ALL_POINTS,'
      '       CURAMOUNT_ as CURAMOUNT_POINTS_'
      
        '  from (select sum(decode(typ,1,1,0)) over(partition by numb/*, ' +
        'fuel_id*/ order by numc) as fact_typ_sum,'
      
        '               sum(1 - decode(typ,1,1,0)) over(partition by numb' +
        '/*, fuel_id*/ order by numc) as book_typ_num,'
      
        '               nvl(trunc(sysdate - max(MDATE_Valid) over(partiti' +
        'on by numb/*, fuel_id*/)),9999) as valid,'
      '               Q2.*'
      '          from (select Q1.*,'
      
        '                       row_number() over(order by numb,/* fuel_i' +
        'd,*/ MDATE, decode(typ,0,1,0), book_rn) as numc'
      '                  from (/* '#1060#1072#1082#1090#1080#1095#1077#1089#1082#1086#1077' '#1076#1074#1080#1078#1077#1085#1080#1077' */'
      
        '                        select /*+ORDERED USE_HASH(ma, m, t, p, ' +
        'pg, npg)*/ '
      '                               f.fuel_id,'
      '                               f.fuel_name,'
      '                               f.MDATE,'
      '                               to_date(null) as MDATE_Valid,'
      '                               f.MDATE_OUT,'
      '                               f.numb,'
      '                               to_number(null) as CURAMOUNT_,'
      
        '                               f.LITRES_ALL as LITRES_ALL_, /* '#1087 +
        #1086' '#1079#1072#1084#1077#1088#1072#1084' '#1074#1077#1089'!!! */'
      '                               f.temper,'
      
        '                               lead(f.LITRES_ALL) over(partition' +
        ' by f.numb/*, f.fuel_id*/ order by f.MDATE) as FACT_ALL_LEAD,'
      
        '                               lead(f.MDATE) over(partition by f' +
        '.numb/*, f.fuel_id*/ order by f.MDATE) as FACT_MDATE_LEAD,      ' +
        '                         '
      '                               to_number(null) as BOOK_ALL_LEAD,'
      
        '                               to_date(null) as BOOK_MDATE_LEAD,' +
        '                              '
      '                               0 as diff_,'
      '                               0 as is_book_rests,'
      
        '                               decode(row_number() over(partitio' +
        'n by f.numb/*, f.fuel_id*/ order by f.MDATE desc), 1, 1, 0) as i' +
        's_gauged,                               '
      '                               1 as typ,'
      '                               0 as is_initial_rests,'
      '                               to_number(null) as book_in_out,'
      '                               to_number(null) as book_amount,'
      '                               to_number(null) as book_rn,'
      '                               f.product_name,'
      
        '                               f.is_tube*f.LITRES_ALL as LITRES_' +
        'ALL_TUBES                               '
      '                          from v_oil_rez_fact_rest f'
      '                         where trunc(f.MDATE) <= :end_date'
      '                           and f.org_inst = :org_inst'
      '                           and f.inst = :org_inst'
      
        '                           and (f.fuel_id = :fuel_id or :fuel_id' +
        ' = 0)'
      '                           and (f.numb = :numb or :numb = '#39'0'#39')'
      '                           --and 1=0'
      '                        '
      '                        union all'
      
        '                        /* '#1050#1085#1080#1078#1085#1086#1077' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1088#1072#1074#1085#1086' '#1079#1072#1084#1077#1088#1072#1084', '#1082#1086#1075#1076#1072 +
        ' '#1085#1077#1090' '#1088#1077#1072#1083#1100#1085#1086#1075#1086' '#1082#1085#1080#1078#1085#1086#1075#1086' */'
      '                        select f.fuel_id as fuel_id,'
      '                               f.fuel_name as fuel_name,'
      '                               f.mdate as MDATE,'
      '                               f.mdate as MDATE_Valid,'
      
        '                               to_char(MDATE, '#39'dd.mm   hh24:mi'#39')' +
        ' as MDATE_OUT,'
      '                               numb as numb,'
      '                               sum(f.litres_all) as CURAMOUNT,'
      '                               to_number(null) as LITRES_ALL,'
      '                               to_number(null) as temper,'
      '                               to_number(null) as FACT_ALL_LEAD,'
      '                               to_date(null) as FACT_MDATE_LEAD,'
      
        '                               sum(f.litres_all) - lead(sum(f.li' +
        'tres_all)) over(partition by numb/*, fuel_id*/ order by MDATE) a' +
        's BOOK_ALL_LEAD,                                                ' +
        '              '
      
        '                               lead(MDATE) over(partition by num' +
        'b/*, fuel_id*/ order by MDATE) as BOOK_MDATE_LEAD,              ' +
        '                '
      '                               0 as diff_,'
      
        '                               decode(row_number() over(partitio' +
        'n by F.numb/*,'
      
        '                                           Q.fuel_id*/ order by ' +
        'F.MDATE desc),'
      '                                      1,'
      '                                      1,'
      '                                      0) as is_book_rests,'
      
        '                               0 as is_gauged,                  ' +
        '             '
      '                               2 as typ,'
      '                               0 as is_initial_rests,'
      '                               to_number(null) as book_in_out,'
      '                               to_number(null) as book_amount,'
      
        '                               row_number() over(partition by f.' +
        'numb/*, f.fuel_id*/ order by f.MDATE) as book_rn,'
      '                               f.product_name,'
      
        '                               to_number(null) as LITRES_ALL_TUB' +
        'ES'
      '                          from v_oil_rez_fact_rest f'
      
        '                         where ((numb in ('#39'87'#39','#39'88'#39') and inst = ' +
        '624)or(inst <> 624))'
      '                           and trunc(f.MDATE) <= :end_date'
      '                           and f.org_inst = :org_inst'
      '                           and f.inst = :org_inst'
      
        '                           and (f.fuel_id = :fuel_id or :fuel_id' +
        ' = 0)'
      
        '                           and (f.numb = :numb or :numb = '#39'0'#39')  ' +
        '                                 '
      
        '                         group by f.mdate, f.fuel_id, f.fuel_nam' +
        'e, f.numb, f.product_name'
      '         '
      '                        union all'
      '                        /* '#1050#1085#1080#1078#1085#1086#1077' '#1076#1074#1080#1078#1077#1085#1080#1077' */'
      '                        select fuel_id,'
      '                               fuel_name,'
      '                               MDATE,'
      '                               MDATE as MDATE_Valid,'
      
        '                               to_char(MDATE, '#39'dd.mm   hh24:mi'#39')' +
        ' as MDATE_OUT,'
      '                               numb,'
      '                               CURAMOUNT,'
      '                               to_number(null) as LITRES_ALL,'
      '                               to_number(null) as temper,'
      '                               to_number(null) as FACT_ALL_LEAD,'
      '                               to_date(null) as FACT_MDATE_LEAD,'
      
        '                               lead(CURAMOUNT) over(partition by' +
        ' numb/*, fuel_id*/ order by RN) as BOOK_ALL_LEAD,               ' +
        '                                               '
      
        '                               lead(MDATE) over(partition by num' +
        'b/*, fuel_id*/ order by RN) as BOOK_MDATE_LEAD,'
      '                               diff,'
      '                               is_book_rests,'
      '                               0 as is_gauged,'
      '                               typ,'
      '                               is_initial_rests,'
      '                               book_in_out,'
      '                               book_amount,'
      '                               RN as book_rn,'
      '                               product_name,'
      
        '                               to_number(null) as LITRES_ALL_TUB' +
        'ES'
      '                          from (select Q.fuel_id,'
      '                                       Q.fuel_name,'
      '                                       Q.MDATE as MDATE,'
      '                                       Q.numb as numb,'
      
        '                                       row_number() over(partiti' +
        'on by Q.numb/*, Q.fuel_id*/ order by Q.MDATE, Q.IN_OUT, Q.P_TRAN' +
        'S_ID) as RN,'
      
        '                                       sum(AMOUNT * IN_OUT) over' +
        '(partition by Q.numb/*, Q.fuel_id*/ order by Q.MDATE, Q.IN_OUT, ' +
        'Q.P_TRANS_ID) as CURAMOUNT,'
      '                                       0 as diff,'
      
        '                                       decode(row_number() over(' +
        'partition by Q.numb/*,'
      
        '                                                   Q.fuel_id*/ o' +
        'rder by Q.MDATE desc,'
      
        '                                                   Q.IN_OUT desc' +
        ','
      
        '                                                   Q.P_TRANS_ID ' +
        'desc),'
      '                                              1,'
      '                                              1,'
      
        '                                              0) as is_book_rest' +
        's,'
      '                                       0 as typ,'
      '                                       is_initial_rests,'
      '                                       Q.in_out as book_in_out,'
      
        '                                       Q.in_out * Q.AMOUNT as bo' +
        'ok_amount,'
      '                                       Q.product_name'
      '                                  from (select br.fuel_id,'
      '                                               br.fuel_name,'
      
        '                                               br.MDATE as MDATE' +
        ','
      '                                               br.numb, '
      '                                               br.IN_OUT, '
      '                                               br.P_TRANS_ID,'
      '                                               br.inst,'
      '                                               br.org_inst,'
      '                                               br.product_name,'
      '                                               br.AMOUNT,'
      
        '                                               br.is_initial_res' +
        'ts'
      
        '                                          from v_oil_rez_book_re' +
        'st br'
      
        '                                         where br.UnionNum in (0' +
        ', 1, 2, 3, 4,11/*, 5*/)'
      
        '                                           and (trunc(MDATE) <= ' +
        ':end_date or MDATE is null)'
      
        '                                           and ((br.TANK_ID not ' +
        'in (5,11) and inst = 624)or(inst <> 624))'
      
        '                                         /* '#1047#1072#1082#1086#1084#1077#1085#1090#1080#1088#1086#1074#1072#1085#1099' '#1073#1083#1086#1082 +
        #1080' '#1087#1086#1089#1082#1086#1083#1100#1082#1091' '#1085#1077' '#1080#1089#1087#1086#1083#1100#1079#1091#1102#1090#1089#1103' '
      
        '                                          * '#1074' '#1079#1072#1087#1088#1086#1089#1077' '#1087#1086' '#1075#1088#1091#1087#1087#1077' ' +
        '*/'
      '                                        union all'
      '                                        select br.fuel_id,'
      '                                               br.fuel_name,'
      
        '                                               :end_date+1 as MD' +
        'ATE,'
      '                                               br.numb, '
      '                                               br.IN_OUT, '
      '                                               br.P_TRANS_ID,'
      '                                               br.inst,'
      '                                               br.org_inst,'
      '                                               br.product_name,'
      '                                               br.AMOUNT,'
      
        '                                               br.is_initial_res' +
        'ts'
      
        '                                          from v_oil_rez_book_re' +
        'st br'
      
        '                                         where br.UnionNum in (9' +
        '/*'#1047#1072#1075#1083#1091#1096#1082#1080' '#1076#1083#1103' '#1087#1088#1086#1090#1103#1075#1080#1074#1072#1085#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074'*/)'
      
        '                                           and ((br.TANK_ID not ' +
        'in (5,11) and inst = 624)or(inst <> 624))'
      '                                         union all'
      '                                        select br.fuel_id,'
      '                                               br.fuel_name,'
      
        '                                               :begin_date+1/24/' +
        '60/60 as MDATE,'
      '                                               br.numb, '
      '                                               br.IN_OUT, '
      '                                               br.P_TRANS_ID,'
      '                                               br.inst,'
      '                                               br.org_inst,'
      '                                               br.product_name,'
      '                                               br.AMOUNT,'
      
        '                                               br.is_initial_res' +
        'ts'
      
        '                                          from v_oil_rez_book_re' +
        'st br'
      
        '                                         where br.UnionNum in (9' +
        '/*'#1047#1072#1075#1083#1091#1096#1082#1080' '#1076#1083#1103' '#1087#1088#1086#1090#1103#1075#1080#1074#1072#1085#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074'*/)'
      
        '                                           and ((br.TANK_ID not ' +
        'in (5,11) and inst = 624)or(inst <> 624))'
      '                                           ) Q'
      '                                 where Q.org_inst = :org_inst'
      '                                   and Q.inst = :org_inst'
      
        '                                   and (Q.fuel_id = :fuel_id or ' +
        ':fuel_id = 0)'
      
        '                                   and (Q.numb = :numb or :numb ' +
        '= '#39'0'#39')'
      '                                   ) Q0) Q1) Q2) Q3) Q4) Q5'
      
        'where trunc(MDATE) between :begin_date and :end_date            ' +
        '                       '
      '                                   )Q6'
      'where '
      '  q6.ValidError1 > 0'
      '  and q6.ValidError2 > 0'
      '  and pogr > 0 '
      'union all'
      'select :end_date+1 as mdate_, q6.numb, round(avg(Pogr),0), '
      '--max(abs(diff2)-pogr) as ValidError2, '
      '--1 ValidError1, '
      'sum(DIFF2), '
      'q6.diff_ as diff, q6.lagDIFF_ as lagdiff, '
      'fuel_id, fuel_name from ('
      'select '
      '--       DIFF,'
      
        '--       nvl(lag(DIFF) over(partition by numb order by mdate), 0' +
        ') as lagDIFF,       '
      
        '       (DIFF - (nvl(lag(DIFF) over(partition by numb order by md' +
        'ate), DIFF))) as DIFF2,'
      
        '       round(decode(sign(LITRES_ALL_-120000),1,0.0065,0.005) * L' +
        'ITRES_ALL_, 0) as Pogr,'
      
        '--       abs((nvl(lag(DIFF) over(partition by numb order by mdat' +
        'e), 0)) - DIFF) - abs(DIFF) * .1 as ValidError1,'
      
        '--       abs(DIFF - (nvl(lag(DIFF) over(partition by numb order ' +
        'by mdate), 0)))-round(decode(sign(LITRES_ALL_-120000),1,0.0065,0' +
        '.005) * LITRES_ALL_, 0) as ValidError2,'
      
        '       last_value(diff) over(partition by numb,fuel_id) as diff_' +
        ', first_value(diff) over(partition by numb,fuel_id) as lagDIFF_,'
      '       mdate,numb,fuel_id, fuel_name  '
      '     /*mdate, numb,*/ /*Q5.**/ from ('
      
        'select nvl(LITRES_ALL_POINTS, trunc(Q4.fact_diff_date_ratio * Q4' +
        '.fact_diff_litres) + LITRES_ALL_CONTINUOS) as LITRES_ALL,'
      
        '       nvl(CURAMOUNT_POINTS_, trunc(Q4.book_diff_date_ratio * Q4' +
        '.book_diff_litres) + CURAMOUNT_CONTINUOS)/*)*/ as CURAMOUNT,'
      
        '       /* '#1056#1072#1079#1085#1080#1094#1072' '#1085#1072' '#1079#1072#1084#1077#1088' '#1074' '#1089#1088#1072#1074#1085#1077#1085#1080#1080' '#1089' '#1087#1086#1089#1083#1077#1076#1085#1080#1084' '#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1086' ' +
        #1085#1077#1075#1086' '#1082#1085#1080#1078#1085#1099#1084' */'
      
        '       max(DIFF_ON_FACT)over(partition by numb/*, fuel_id*/, fac' +
        't_typ_sum) as DIFF,'
      
        '       max(CURAMOUNT_ON_FACT)over(partition by numb/*, fuel_id*/' +
        ', fact_typ_sum) as CURAMOUNT_ON_FACT_CONTINUOS,       '
      '       /* '#1040#1087#1088#1086#1082#1089#1080#1084#1080#1088#1086#1074#1072#1085#1072#1103' '#1088#1072#1079#1085#1080#1094#1072' '#1079#1072#1084#1077#1088#1072' '#1080' '#1082#1085#1080#1078#1085#1086#1075#1086' */'
      
        '       (nvl(LITRES_ALL_POINTS, trunc(Q4.fact_diff_date_ratio * Q' +
        '4.fact_diff_litres) + LITRES_ALL_CONTINUOS)) /*as LITRES_ALL*/ '
      
        '         - (nvl(CURAMOUNT_POINTS_, trunc(Q4.book_diff_date_ratio' +
        ' * Q4.book_diff_litres) + CURAMOUNT_CONTINUOS)) /*as CURAMOUNT*/' +
        ' as DIFF_APROX,'
      
        '       trunc(row_number()over(partition by numb/*, fuel_id*/ ORD' +
        'ER BY Q4.MDATE)/greatest(count(*)over(partition by numb/*, fuel_' +
        'id*/),1)*100) as rn,'
      '       case '
      '         when trunc(MDATE) between :begin_date and :end_date '
      '           then 1 '
      '           else 0'
      '        end as is_chart,'
      '       Q4.*,'
      '       (CURAMOUNT_) as CURAMOUNT_POINTS'
      '  from ('
      'select Q3.*,'
      
        '       max(decode(typ,1,FUEL_NAME,null)) over(partition by numb/' +
        '*, fuel_id*/, fact_typ_sum) as FACT_FUEL_NAME_CONTINUOS,'
      
        '       max(decode(typ,1,FUEL_ID,null)) over(partition by numb/*,' +
        ' fuel_id*/, fact_typ_sum) as FACT_FUEL_ID_CONTINUOS,       '
      
        '       max(LITRES_ALL_) over(partition by numb/*, fuel_id*/, fac' +
        't_typ_sum) as LITRES_ALL_CONTINUOS,'
      
        '       LITRES_ALL_ - max(CURAMOUNT_) over(partition by numb/*, f' +
        'uel_id*/, book_typ_num) as DIFF_ON_FACT,'
      
        '       decode(LITRES_ALL_,null,null,max(CURAMOUNT_) over(partiti' +
        'on by numb/*, fuel_id*/, book_typ_num)) as CURAMOUNT_ON_FACT,'
      
        '       max(TEMPER) over(partition by numb/*, fuel_id*/, fact_typ' +
        '_sum) as TEMPER_CONTINUOS,'
      
        '       max(CURAMOUNT_) over(partition by numb/*, fuel_id*/, book' +
        '_typ_num) as CURAMOUNT_CONTINUOS,'
      ''
      
        '       /* - ('#1042#1077#1089' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1079#1072#1084#1077#1088#1072') + ('#1042#1077#1089' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1079#1072#1084#1077#1088#1072') =' +
        ' '#1056#1072#1079#1085#1080#1094#1072' '#1084#1077#1078#1076#1091' '#1090#1077#1082#1091#1097#1080#1084' '#1080' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1084' '#1079#1072#1084#1077#1088#1086#1084' */'
      
        '       nvl((-max(LITRES_ALL_) over(partition by numb/*, fuel_id*' +
        '/, fact_typ_sum) /*as LITRES_ALL*/ + max(FACT_ALL_LEAD) over(par' +
        'tition by numb/*, fuel_id*/, fact_typ_sum)),0)'
      '         as fact_diff_litres,   '
      '       /* '#1055#1086' '#1072#1085#1072#1083#1086#1075#1080#1080' '#1082#1085#1080#1078#1085#1099#1077' */  '
      
        '       nvl((-max(CURAMOUNT_) over(partition by numb/*, fuel_id*/' +
        ', book_typ_num) /*as LITRES_ALL*/ + max(BOOK_ALL_LEAD) over(part' +
        'ition by numb/*, fuel_id*/, book_typ_num)),0)'
      '         as book_diff_litres,                '
      '       /*'
      '         ('#1042#1088#1077#1084#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072') - ('#1042#1088#1077#1084#1103' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1079#1072#1084#1077#1088#1072')'
      
        '        --------------'#1076#1077#1083#1080#1090#1100'------------------------------------' +
        '  = '#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' ('#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1086' '#1076#1074#1091#1093' '#1079#1072#1084#1077#1088#1086#1074') '
      
        '         ('#1042#1088#1077#1084#1103' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1079#1072#1084#1077#1088#1072') - ('#1042#1088#1077#1084#1103' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1079#1072#1084#1077#1088#1072') ' +
        '       '
      '       */       '
      
        '       nvl(round((mdate - min(mdate) over(partition by numb/*, f' +
        'uel_id*/, fact_typ_sum)/* as MDATE_FACT*/ + 1e-10) /'
      
        '         greatest(min(FACT_MDATE_LEAD) over(partition by numb/*,' +
        ' fuel_id*/, fact_typ_sum) /*as MDATE_LEAD*/ - min(mdate) over(pa' +
        'rtition by numb/*, fuel_id*/, fact_typ_sum),1)/* as MDATE_FACT*/' +
        ',4),0) '
      '         as fact_diff_date_ratio,     '
      '       /* '#1055#1086' '#1072#1085#1072#1083#1086#1075#1080#1080' '#1082#1085#1080#1078#1085#1099#1077' */'
      
        '       nvl(round((mdate - min(mdate) over(partition by numb/*, f' +
        'uel_id*/, book_typ_num)/* as MDATE_FACT*/ + 1e-10) /'
      
        '         greatest(min(BOOK_MDATE_LEAD) over(partition by numb/*,' +
        ' fuel_id*/, book_typ_num) /*as MDATE_LEAD*/ - min(mdate) over(pa' +
        'rtition by numb/*, fuel_id*/, book_typ_num),1)/* as MDATE_FACT*/' +
        ',4),0) '
      '         as book_diff_date_ratio,          '
      '          '
      '       LITRES_ALL_ as LITRES_ALL_POINTS,'
      '       CURAMOUNT_ as CURAMOUNT_POINTS_'
      
        '  from (select sum(decode(typ,1,1,0)) over(partition by numb/*, ' +
        'fuel_id*/ order by numc) as fact_typ_sum,'
      
        '               sum(1 - decode(typ,1,1,0)) over(partition by numb' +
        '/*, fuel_id*/ order by numc) as book_typ_num,'
      
        '               nvl(trunc(sysdate - max(MDATE_Valid) over(partiti' +
        'on by numb/*, fuel_id*/)),9999) as valid,'
      '               Q2.*'
      '          from (select Q1.*,'
      
        '                       row_number() over(order by numb,/* fuel_i' +
        'd,*/ MDATE, decode(typ,0,1,0), book_rn) as numc'
      '                  from (/* '#1060#1072#1082#1090#1080#1095#1077#1089#1082#1086#1077' '#1076#1074#1080#1078#1077#1085#1080#1077' */'
      
        '                        select /*+ORDERED USE_HASH(ma, m, t, p, ' +
        'pg, npg)*/ '
      '                               f.fuel_id,'
      '                               f.fuel_name,'
      '                               f.MDATE,'
      '                               to_date(null) as MDATE_Valid,'
      '                               f.MDATE_OUT,'
      '                               f.numb,'
      '                               to_number(null) as CURAMOUNT_,'
      
        '                               f.LITRES_ALL as LITRES_ALL_, /* '#1087 +
        #1086' '#1079#1072#1084#1077#1088#1072#1084' '#1074#1077#1089'!!! */'
      '                               f.temper,'
      
        '                               lead(f.LITRES_ALL) over(partition' +
        ' by f.numb/*, f.fuel_id*/ order by f.MDATE) as FACT_ALL_LEAD,'
      
        '                               lead(f.MDATE) over(partition by f' +
        '.numb/*, f.fuel_id*/ order by f.MDATE) as FACT_MDATE_LEAD,      ' +
        '                         '
      '                               to_number(null) as BOOK_ALL_LEAD,'
      
        '                               to_date(null) as BOOK_MDATE_LEAD,' +
        '                              '
      '                               0 as diff_,'
      '                               0 as is_book_rests,'
      
        '                               decode(row_number() over(partitio' +
        'n by f.numb/*, f.fuel_id*/ order by f.MDATE desc), 1, 1, 0) as i' +
        's_gauged,                               '
      '                               1 as typ,'
      '                               0 as is_initial_rests,'
      '                               to_number(null) as book_in_out,'
      '                               to_number(null) as book_amount,'
      '                               to_number(null) as book_rn,'
      '                               f.product_name,'
      
        '                               f.is_tube*f.LITRES_ALL as LITRES_' +
        'ALL_TUBES                               '
      '                          from v_oil_rez_fact_rest f'
      '                         where trunc(f.MDATE) <= :end_date'
      '                           and f.org_inst = :org_inst'
      '                           and f.inst = :org_inst'
      
        '                           and (f.fuel_id = :fuel_id or :fuel_id' +
        ' = 0)'
      '                           and (f.numb = :numb or :numb = '#39'0'#39')'
      '                           --and 1=0'
      '                        '
      '                        union all'
      
        '                        /* '#1050#1085#1080#1078#1085#1086#1077' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1088#1072#1074#1085#1086' '#1079#1072#1084#1077#1088#1072#1084', '#1082#1086#1075#1076#1072 +
        ' '#1085#1077#1090' '#1088#1077#1072#1083#1100#1085#1086#1075#1086' '#1082#1085#1080#1078#1085#1086#1075#1086' */'
      '                        select f.fuel_id as fuel_id,'
      '                               f.fuel_name as fuel_name,'
      '                               f.mdate as MDATE,'
      '                               f.mdate as MDATE_Valid,'
      
        '                               to_char(MDATE, '#39'dd.mm   hh24:mi'#39')' +
        ' as MDATE_OUT,'
      '                               numb as numb,'
      '                               sum(f.litres_all) as CURAMOUNT,'
      '                               to_number(null) as LITRES_ALL,'
      '                               to_number(null) as temper,'
      '                               to_number(null) as FACT_ALL_LEAD,'
      '                               to_date(null) as FACT_MDATE_LEAD,'
      
        '                               sum(f.litres_all) - lead(sum(f.li' +
        'tres_all)) over(partition by numb/*, fuel_id*/ order by MDATE) a' +
        's BOOK_ALL_LEAD,                                                ' +
        '              '
      
        '                               lead(MDATE) over(partition by num' +
        'b/*, fuel_id*/ order by MDATE) as BOOK_MDATE_LEAD,              ' +
        '                '
      '                               0 as diff_,'
      
        '                               decode(row_number() over(partitio' +
        'n by F.numb/*,'
      
        '                                           Q.fuel_id*/ order by ' +
        'F.MDATE desc),'
      '                                      1,'
      '                                      1,'
      '                                      0) as is_book_rests,'
      
        '                               0 as is_gauged,                  ' +
        '             '
      '                               2 as typ,'
      '                               0 as is_initial_rests,'
      '                               to_number(null) as book_in_out,'
      '                               to_number(null) as book_amount,'
      
        '                               row_number() over(partition by f.' +
        'numb/*, f.fuel_id*/ order by f.MDATE) as book_rn,'
      '                               f.product_name,'
      
        '                               to_number(null) as LITRES_ALL_TUB' +
        'ES'
      '                          from v_oil_rez_fact_rest f'
      
        '                         where ((numb in ('#39'87'#39','#39'88'#39') and inst = ' +
        '624)or(inst <> 624))'
      '                           and trunc(f.MDATE) <= :end_date'
      '                           and f.org_inst = :org_inst'
      '                           and f.inst = :org_inst'
      
        '                           and (f.fuel_id = :fuel_id or :fuel_id' +
        ' = 0)'
      
        '                           and (f.numb = :numb or :numb = '#39'0'#39')  ' +
        '                                 '
      
        '                         group by f.mdate, f.fuel_id, f.fuel_nam' +
        'e, f.numb, f.product_name'
      '         '
      '                        union all'
      '                        /* '#1050#1085#1080#1078#1085#1086#1077' '#1076#1074#1080#1078#1077#1085#1080#1077' */'
      '                        select fuel_id,'
      '                               fuel_name,'
      '                               MDATE,'
      '                               MDATE as MDATE_Valid,'
      
        '                               to_char(MDATE, '#39'dd.mm   hh24:mi'#39')' +
        ' as MDATE_OUT,'
      '                               numb,'
      '                               CURAMOUNT,'
      '                               to_number(null) as LITRES_ALL,'
      '                               to_number(null) as temper,'
      '                               to_number(null) as FACT_ALL_LEAD,'
      '                               to_date(null) as FACT_MDATE_LEAD,'
      
        '                               lead(CURAMOUNT) over(partition by' +
        ' numb/*, fuel_id*/ order by RN) as BOOK_ALL_LEAD,               ' +
        '                                               '
      
        '                               lead(MDATE) over(partition by num' +
        'b/*, fuel_id*/ order by RN) as BOOK_MDATE_LEAD,'
      '                               diff,'
      '                               is_book_rests,'
      '                               0 as is_gauged,'
      '                               typ,'
      '                               is_initial_rests,'
      '                               book_in_out,'
      '                               book_amount,'
      '                               RN as book_rn,'
      '                               product_name,'
      
        '                               to_number(null) as LITRES_ALL_TUB' +
        'ES'
      '                          from (select Q.fuel_id,'
      '                                       Q.fuel_name,'
      '                                       Q.MDATE as MDATE,'
      '                                       Q.numb as numb,'
      
        '                                       row_number() over(partiti' +
        'on by Q.numb/*, Q.fuel_id*/ order by Q.MDATE, Q.IN_OUT, Q.P_TRAN' +
        'S_ID) as RN,'
      
        '                                       sum(AMOUNT * IN_OUT) over' +
        '(partition by Q.numb/*, Q.fuel_id*/ order by Q.MDATE, Q.IN_OUT, ' +
        'Q.P_TRANS_ID) as CURAMOUNT,'
      '                                       0 as diff,'
      
        '                                       decode(row_number() over(' +
        'partition by Q.numb/*,'
      
        '                                                   Q.fuel_id*/ o' +
        'rder by Q.MDATE desc,'
      
        '                                                   Q.IN_OUT desc' +
        ','
      
        '                                                   Q.P_TRANS_ID ' +
        'desc),'
      '                                              1,'
      '                                              1,'
      
        '                                              0) as is_book_rest' +
        's,'
      '                                       0 as typ,'
      '                                       is_initial_rests,'
      '                                       Q.in_out as book_in_out,'
      
        '                                       Q.in_out * Q.AMOUNT as bo' +
        'ok_amount,'
      '                                       Q.product_name'
      '                                  from (select br.fuel_id,'
      '                                               br.fuel_name,'
      
        '                                               br.MDATE as MDATE' +
        ','
      '                                               br.numb, '
      '                                               br.IN_OUT, '
      '                                               br.P_TRANS_ID,'
      '                                               br.inst,'
      '                                               br.org_inst,'
      '                                               br.product_name,'
      '                                               br.AMOUNT,'
      
        '                                               br.is_initial_res' +
        'ts'
      
        '                                          from v_oil_rez_book_re' +
        'st br'
      
        '                                         where br.UnionNum in (0' +
        ', 1, 2, 3, 4,11/*, 5*/)'
      
        '                                           and (trunc(MDATE) <= ' +
        ':end_date or MDATE is null)'
      
        '                                           and ((br.TANK_ID not ' +
        'in (5,11) and inst = 624)or(inst <> 624))'
      
        '                                         /* '#1047#1072#1082#1086#1084#1077#1085#1090#1080#1088#1086#1074#1072#1085#1099' '#1073#1083#1086#1082 +
        #1080' '#1087#1086#1089#1082#1086#1083#1100#1082#1091' '#1085#1077' '#1080#1089#1087#1086#1083#1100#1079#1091#1102#1090#1089#1103' '
      
        '                                          * '#1074' '#1079#1072#1087#1088#1086#1089#1077' '#1087#1086' '#1075#1088#1091#1087#1087#1077' ' +
        '*/'
      '/*                                        union all'
      '                                        select br.fuel_id,'
      '                                               br.fuel_name,'
      
        '                                               :end_date+1 as MD' +
        'ATE,'
      '                                               br.numb, '
      '                                               br.IN_OUT, '
      '                                               br.P_TRANS_ID,'
      '                                               br.inst,'
      '                                               br.org_inst,'
      '                                               br.product_name,'
      '                                               br.AMOUNT,'
      
        '                                               br.is_initial_res' +
        'ts'
      
        '                                          from v_oil_rez_book_re' +
        'st br'
      
        '                                         where br.UnionNum in (9' +
        '\*'#1047#1072#1075#1083#1091#1096#1082#1080' '#1076#1083#1103' '#1087#1088#1086#1090#1103#1075#1080#1074#1072#1085#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074'*\)'
      
        '                                           and ((br.TANK_ID not ' +
        'in (5,11) and inst = 624)or(inst <> 624))'
      '                                         union all'
      '                                        select br.fuel_id,'
      '                                               br.fuel_name,'
      
        '                                               :begin_date+1/24/' +
        '60/60 as MDATE,'
      '                                               br.numb, '
      '                                               br.IN_OUT, '
      '                                               br.P_TRANS_ID,'
      '                                               br.inst,'
      '                                               br.org_inst,'
      '                                               br.product_name,'
      '                                               br.AMOUNT,'
      
        '                                               br.is_initial_res' +
        'ts'
      
        '                                          from v_oil_rez_book_re' +
        'st br'
      
        '                                         where br.UnionNum in (9' +
        '\*'#1047#1072#1075#1083#1091#1096#1082#1080' '#1076#1083#1103' '#1087#1088#1086#1090#1103#1075#1080#1074#1072#1085#1080#1103' '#1086#1089#1090#1072#1090#1082#1086#1074'*\)'
      
        '                                           and ((br.TANK_ID not ' +
        'in (5,11) and inst = 624)or(inst <> 624))*/'
      '                                           ) Q'
      '                                 where Q.org_inst = :org_inst'
      '                                   and Q.inst = :org_inst'
      
        '                                   and (Q.fuel_id = :fuel_id or ' +
        ':fuel_id = 0)'
      
        '                                   and (Q.numb = :numb or :numb ' +
        '= '#39'0'#39')'
      '                                   ) Q0) Q1) Q2) Q3) Q4) Q5'
      'where trunc(MDATE) between :begin_date and :end_date'
      '                                   )Q6'
      'where '
      '  pogr > 0'
      '--  AND DIFF2 > pogr'
      'group by numb,fuel_id, fuel_name,diff_,lagDIFF_'
      ')'
      'where (abs(diff2)>pogr'
      'and   pogr > 100) or (abs(diff2)>150 and pogr <= 100)'
      
        'order by nvl(to_number(substr(mdate_,4,2)),0),nvl(to_number(subs' +
        'tr(mdate_,9,2)),0),mdate,numb')
    FetchAll = True
    OnFilterRecord = qFilterRecord
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'end_date'
      end
      item
        DataType = ftDateTime
        Name = 'begin_date'
      end
      item
        DataType = ftFloat
        Name = 'org_inst'
      end
      item
        DataType = ftFloat
        Name = 'fuel_id'
      end
      item
        DataType = ftString
        Name = 'numb'
        Value = ''
      end>
    object qMDATE: TStringField
      FieldName = 'MDATE'
      Size = 29
    end
    object qNUMB: TStringField
      FieldName = 'NUMB'
      Size = 89
    end
    object qDIFF: TFloatField
      FieldName = 'DIFF'
    end
    object qLAGDIFF: TFloatField
      FieldName = 'LAGDIFF'
    end
    object qDIFF2: TFloatField
      FieldName = 'DIFF2'
    end
    object qFUEL_ID: TFloatField
      FieldName = 'FUEL_ID'
    end
    object qFUEL_NAME: TStringField
      FieldName = 'FUEL_NAME'
      Size = 89
    end
    object qPOGR: TFloatField
      FieldName = 'POGR'
    end
  end
  inherited qDetail: TOilQuery
    MasterFields = ''
  end
  object ImageList: TImageList
    Left = 240
    Top = 344
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC000000000000000000000000000000
      000000000000CCCCCC00CCCCCC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003A82CA00397FC800387DC700387C
      C700397CC700397CC700387DC700387EC900387EC900387DC700397CC700397C
      C700387CC700387DC700397FC8003A82CA000000000000000000000000000000
      0000CCCCCC000089490000894900CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003B86CD0055E3FF0055E3FF0056E1
      FF0056E1FF0056E2FF0056E5FF0055E9FF0055E9FF0056E5FF0056E2FF0056E1
      FF0056E1FF0055E3FF0055E3FF003B86CD00000000000000000000000000CCCC
      CC00008645000BE9AB000BE9AB0000864500CCCCCC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008CB5E0007AB8E40052DBFF004BD5
      FF004DD5FF004DD6FF004BDCFF0067493F0067493F004BDCFF004DD6FF004DD5
      FF004BD5FF0052DBFF007AB8E4008CB5E0000000000000000000CCCCCC000086
      44000BE7A90000D89D0000D89D000BE7A90000864400CCCCCC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F82C900A3E0FA0040CF
      FF0044CEFF0046CFFF0044D6FF00775C5000775C500044D6FF0046CFFF0044CE
      FF0040CFFF00A3E0FA003F82C9000000000000000000CCCCCC00008644001DE9
      B00000D39D0000D19A0000D19A0000D39D001DE9B00000864400CCCCCC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C9DDF1005B97D4009EE8
      FF0038C7FF003DC8FF003DCFFF004BBCE9004BBCE9003DCFFF003DC8FF0038C7
      FF009EE8FF005B97D400C9DDF10000000000CCCCCC00008644002DEBB90000CF
      9C0000CD9A0000CC990000CC990000CD9A0000CF9C002DEBB90000864300CCCC
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000069A0D70090BF
      E6006FD7FF0032C3FF0034CBFF00644B3F00644B3F0034CBFF0032C3FF006FD7
      FF0090BFE60069A0D7000000000000000000008948003CEFC40000C99B0000C8
      990000C99A003CE9BD003CE9BD0000C99A0000C89A0000CA9B003EEEC2000086
      4300CCCCCC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003C82
      C900C1E8FD0050CCFF0027C5FF0069554C0069554C0027C5FF0050CCFF00C1E8
      FD003C82C900000000000000000000000000008947004EF0CD0000C69B0000C5
      9B004FEFCA0000834000008340004FEFCA0000C69B0000C59A0000C69C004FF0
      CB0000864200CCCCCC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B9D3
      EC005797D500C6F3FF003ACAFF006C5B54006C5B54003ACAFF00C6F3FF005797
      D500B9D3EC0000000000000000000000000000000000008642005EF2D4005FF2
      D4000086420000000000000000000085420060F1D20000C19B0000C09A0000C2
      9B0060F2D20000864200CCCCCC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005996D20086BEEA00A4ECFF006C5D53006C5D5300A4ECFF0086BEEA005996
      D200000000000000000000000000000000000000000000000000008947000089
      4700000000000000000000000000000000000086420072F3DB0000BC9A0000BC
      990000BD9B005FF2D20000864200CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7FAFD003A83CB00B2E5FF009EC8DE009EC8DE00B2E5FF003A83CB00F7FA
      FD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000086410083F4E40000B8
      9B0000B79A0000B79B006FF4DC00008946000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A9C9E8005398D700C1F0FF00C1F0FF005398D700A9C9E8000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000086410083F4
      E40000B29A0000B29A0081F5E500008946000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005996D20084C3F10084C3F1005996D200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000086
      410091F8EE0091F8EE0000864100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E5EFF8003384CD003384CD00E5EFF800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008946000089460000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000000000F9FF00000000
      0000F0FF000000000000E07F000000000000C03F000000008001801F00000000
      8001000F00000000C003000700000000E007000300000000E007860100000000
      F00FCF0000000000F00FFF8000000000F81FFFC000000000FC3FFFE100000000
      FC3FFFF300000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
end
