inherited BaseRepPoteriRezForm: TBaseRepPoteriRezForm
  Left = 275
  Top = 221
  Caption = #1055#1086#1090#1077#1088#1080' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1086#1074
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
        Visible = False
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
      Flat = True
      ReadOnly = True
      SumList.Active = True
      UseMultiTitle = True
      OnGetCellParams = DBGrid1GetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NP'
          Footers = <>
          Title.Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
        end
        item
          EditButtons = <>
          FieldName = 'TANK_NAME'
          Footers = <>
          Title.Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088
          Width = 82
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'MASS_BEGIN'
          Footers = <>
          Title.Caption = #1042#1077#1089' '#1085#1087' '#1085#1072' '#1085#1072#1095#1072#1083#1086', '#1082#1075
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'MASS_END'
          Footers = <>
          Title.Caption = #1042#1077#1089' '#1085#1087' '#1085#1072' '#1082#1086#1085#1077#1094', '#1082#1075
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'DIFF_ZA_PERIOD'
          Footers = <>
          Title.Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1079#1072' '#1087#1077#1088#1080#1086#1076', '#1082#1075
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'OBOROT'
          Footers = <>
          Title.Caption = #1054#1073#1086#1088#1086#1090', '#1082#1075
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'MASS_0'
          Footers = <>
          Title.Caption = #1055#1088#1080#1093#1086#1076'|'#1055#1077#1088#1077#1082#1072#1095#1082#1072'|'#1054#1087#1077#1088#1072#1094#1080#1080
          Width = 53
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'WASTE_0'
          Footers = <>
          Title.Caption = #1055#1088#1080#1093#1086#1076'|'#1055#1077#1088#1077#1082#1072#1095#1082#1072'|'#1055#1086#1090#1077#1088#1080
          Width = 53
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'MASS_1'
          Footers = <>
          Title.Caption = #1055#1088#1080#1093#1086#1076'|'#1046#1077#1083#1077#1079#1085#1072#1103' '#1076#1086#1088#1086#1075#1072'|'#1054#1087#1077#1088#1072#1094#1080#1080
          Width = 53
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'WASTE_1'
          Footers = <>
          Title.Caption = #1055#1088#1080#1093#1086#1076'|'#1046#1077#1083#1077#1079#1085#1072#1103' '#1076#1086#1088#1086#1075#1072'|'#1055#1086#1090#1077#1088#1080
          Width = 53
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'MASS_2'
          Footers = <>
          Title.Caption = #1055#1088#1080#1093#1086#1076'|'#1041#1077#1085#1079#1086#1074#1086#1079#1099'|'#1054#1087#1077#1088#1072#1094#1080#1080
          Width = 53
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'WASTE_2'
          Footers = <>
          Title.Caption = #1055#1088#1080#1093#1086#1076'|'#1041#1077#1085#1079#1086#1074#1086#1079#1099'|'#1055#1086#1090#1077#1088#1080
          Width = 53
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'MASS_3'
          Footers = <>
          Title.Caption = #1056#1072#1089#1093#1086#1076'|'#1055#1077#1088#1077#1082#1072#1095#1082#1072'|'#1054#1087#1077#1088#1072#1094#1080#1080
          Width = 53
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'WASTE_3'
          Footers = <>
          Title.Caption = #1056#1072#1089#1093#1086#1076'|'#1055#1077#1088#1077#1082#1072#1095#1082#1072'|'#1055#1086#1090#1077#1088#1080
          Width = 53
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'MASS_4'
          Footers = <>
          Title.Caption = #1056#1072#1089#1093#1086#1076'|'#1046#1077#1083#1077#1079#1085#1072#1103' '#1076#1086#1088#1086#1075#1072'|'#1054#1087#1077#1088#1072#1094#1080#1080
          Width = 53
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'WASTE_4'
          Footers = <>
          Title.Caption = #1056#1072#1089#1093#1086#1076'|'#1046#1077#1083#1077#1079#1085#1072#1103' '#1076#1086#1088#1086#1075#1072'|'#1055#1086#1090#1077#1088#1080
          Width = 53
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'MASS_5'
          Footers = <>
          Title.Caption = #1056#1072#1089#1093#1086#1076'|'#1041#1077#1085#1079#1086#1074#1086#1079#1099'|'#1054#1087#1077#1088#1072#1094#1080#1080
          Width = 53
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'WASTE_5'
          Footers = <>
          Title.Caption = #1056#1072#1089#1093#1086#1076'|'#1041#1077#1085#1079#1086#1074#1086#1079#1099'|'#1055#1086#1090#1077#1088#1080
          Width = 53
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'ZAMERI'
          Footers = <>
          Title.Caption = #1047#1040#1052#1045#1056#1067', '#1082#1075
        end
        item
          DisplayFormat = ',0'
          EditButtons = <>
          FieldName = 'POTERI'
          Footers = <>
          Title.Caption = #1048#1090#1090#1086#1075#1086' '#1087#1086#1090#1077#1088#1080', '#1082#1075
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
      'SELECT GROUP_ID,'
      '       IS_PIPE,'
      '       TANK_NAME,'
      '       np,'
      '       /* '#1054#1089#1090#1072#1090#1082#1080' '#1085#1072#1095#1072#1083#1072' */'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(mass_begin) over(),'
      '              decode(is_pipe,'
      '                     2,'
      
        '                     sum(mass_begin) over(partition by group_id)' +
        ','
      '                     mass_begin)) mass_begin,'
      '       /* '#1054#1089#1090#1072#1090#1082#1080' '#1082#1086#1085#1094#1072' */'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(mass_end) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(mass_end) over(partition by group_id),'
      '                     mass_end)) mass_end,'
      '       /* '#1056#1072#1079#1085#1080#1094#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076' */'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(diff_za_period) over(),'
      '              decode(is_pipe,'
      '                     2,'
      
        '                     sum(diff_za_period) over(partition by group' +
        '_id),'
      '                     diff_za_period)) diff_za_period,'
      '       /* '#1054#1073#1086#1088#1086#1090' '#1079#1072' '#1087#1077#1088#1080#1086#1076' */'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(oborot) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(oborot) over(partition by group_id),'
      '                     oborot)) oborot,'
      '       /* '#1055#1088#1080#1093#1086#1076' */'
      '       -----------'
      '       /*'#1055#1077#1088#1077#1082#1072#1095#1082#1072'*/'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(mass_0) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(MASS_0) over(partition by group_id),'
      '                     MASS_0)) MASS_0,'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(waste_0) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(waste_0) over(partition by group_id),'
      '                     waste_0)) waste_0,'
      '       /*'#1046#1077#1083#1077#1079#1085#1072#1103' '#1076#1086#1088#1086#1075#1072'*/'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(mass_1) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(MASS_1) over(partition by group_id),'
      '                     MASS_1)) MASS_1,'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(waste_1) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(waste_1) over(partition by group_id),'
      '                     waste_1)) waste_1,'
      '       /*'#1041#1077#1085#1079#1086#1074#1086#1079#1099'*/'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(mass_2) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(MASS_2) over(partition by group_id),'
      '                     MASS_2)) MASS_2,'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(waste_2) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(waste_2) over(partition by group_id),'
      '                     waste_2)) waste_2,'
      '       /* '#1056#1072#1089#1093#1086#1076' */'
      '       -----------'
      '       /*'#1055#1077#1088#1077#1082#1072#1095#1082#1072'*/'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(mass_3) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(MASS_3) over(partition by group_id),'
      '                     MASS_3)) MASS_3,'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(waste_3) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(waste_3) over(partition by group_id),'
      '                     waste_3)) waste_3,'
      '       /*'#1046#1077#1083#1077#1079#1085#1072#1103' '#1076#1086#1088#1086#1075#1072'*/'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(mass_4) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(MASS_4) over(partition by group_id),'
      '                     MASS_4)) MASS_4,'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(waste_4) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(waste_4) over(partition by group_id),'
      '                     waste_4)) waste_4,'
      '       /*'#1041#1077#1085#1079#1086#1074#1086#1079#1099'*/'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(mass_5) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(MASS_5) over(partition by group_id),'
      '                     MASS_5)) MASS_5,'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(waste_5) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(waste_5) over(partition by group_id),'
      '                     waste_5)) waste_5,'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(zameri) over(),'
      '              decode(is_pipe,'
      '                     2,'
      '                     sum(zameri) over(partition by group_id),'
      '                     zameri)) zameri,'
      '       decode(group_id,'
      '              '#39'-1'#39','
      '              sum(-poteri - zameri) over(),'
      '              decode(is_pipe,'
      '                     2,'
      
        '                     sum(-poteri - zameri) over(partition by gro' +
        'up_id),'
      '                     -poteri - zameri)) poteri,'
      '       det'
      '  from (select GROUP_ID,'
      '               IS_PIPE,'
      '               TANK_NAME,'
      '               --q.PRODUCT_ID,'
      '               p.name np,'
      '               --TANK_ID,'
      '               /* '#1054#1089#1090#1072#1090#1082#1080' '#1085#1072#1095#1072#1083#1072' */'
      '               sum(MASS_BEGIN) mass_begin,'
      '               /* '#1054#1089#1090#1072#1090#1082#1080' '#1082#1086#1085#1094#1072' */'
      '               sum(MASS_END) mass_end,'
      
        '               sum(MASS_END) - sum(MASS_BEGIN) as diff_za_period' +
        ','
      
        '               sum(MASS_0) + sum(waste_0) + sum(MASS_1) + sum(wa' +
        'ste_1) +'
      
        '               sum(MASS_2) + sum(waste_2) + sum(MASS_3) + sum(wa' +
        'ste_3) +'
      
        '               sum(MASS_4) + sum(waste_4) + sum(MASS_5) + sum(wa' +
        'ste_5) oborot,'
      '               /* '#1055#1088#1080#1093#1086#1076' */'
      '               -----------'
      '               /*'#1055#1077#1088#1077#1082#1072#1095#1082#1072'*/'
      '               sum(MASS_0) MASS_0,'
      '               sum(waste_0) waste_0,'
      '               /*'#1046#1077#1083#1077#1079#1085#1072#1103' '#1076#1086#1088#1086#1075#1072'*/'
      '               sum(MASS_1) MASS_1,'
      '               sum(waste_1) waste_1,'
      '               /*'#1041#1077#1085#1079#1086#1074#1086#1079#1099'*/'
      '               sum(MASS_2) MASS_2,'
      '               sum(waste_2) waste_2,'
      '               /* '#1056#1072#1089#1093#1086#1076' */'
      '               -----------'
      '               /*'#1055#1077#1088#1077#1082#1072#1095#1082#1072'*/'
      '               sum(MASS_3) MASS_3,'
      '               sum(waste_3) waste_3,'
      '               /*'#1046#1077#1083#1077#1079#1085#1072#1103' '#1076#1086#1088#1086#1075#1072'*/'
      '               sum(MASS_4) MASS_4,'
      '               sum(waste_4) waste_4,'
      '               /*'#1041#1077#1085#1079#1086#1074#1086#1079#1099'*/'
      '               sum(MASS_5) MASS_5,'
      '               sum(waste_5) waste_5,'
      '               sum(poteri) poteri,'
      
        '               sum(MASS_END) - sum(MASS_BEGIN) - sum(MASS_0) - s' +
        'um(waste_0) -'
      
        '               sum(MASS_1) - sum(waste_1) - sum(MASS_2) - sum(wa' +
        'ste_2) +'
      
        '               sum(MASS_3) + sum(waste_3) + sum(MASS_4) + sum(wa' +
        'ste_4) +'
      '               sum(MASS_5) + sum(waste_5) as zameri,'
      '               0 det'
      '          from (SELECT GROUP_ID,'
      '                       IS_PIPE,'
      '                       TANK_NAME,'
      '                       --q.PRODUCT_ID,'
      '                       min(product_id) product_id,'
      '                       --TANK_ID,'
      '                       /* '#1054#1089#1090#1072#1090#1082#1080' '#1085#1072#1095#1072#1083#1072' */ '
      '                       sum(MASS_B) mass_begin,'
      '                       /* '#1054#1089#1090#1072#1090#1082#1080' '#1082#1086#1085#1094#1072' */'
      '                       sum(MASS_E) mass_end,'
      
        '                       sum(MASS_E) - sum(MASS_B) as diff_za_peri' +
        'od,'
      
        '                       sum(MASS_0) + sum(waste_0) + sum(MASS_1) ' +
        '+'
      
        '                       sum(waste_1) + sum(MASS_2) + sum(waste_2)' +
        ' +'
      
        '                       sum(MASS_3) + sum(waste_3) + sum(MASS_4) ' +
        '+'
      
        '                       sum(waste_4) + sum(MASS_5) + sum(waste_5)' +
        ' oborot,'
      '                       /* '#1055#1088#1080#1093#1086#1076' */'
      '                       -----------'
      '                       /*'#1055#1077#1088#1077#1082#1072#1095#1082#1072'*/'
      '                       sum(MASS_0) MASS_0,'
      '                       sum(waste_0) waste_0,'
      '                       /*'#1046#1077#1083#1077#1079#1085#1072#1103' '#1076#1086#1088#1086#1075#1072'*/'
      '                       sum(MASS_1) MASS_1,'
      '                       sum(waste_1) waste_1,'
      '                       /*'#1041#1077#1085#1079#1086#1074#1086#1079#1099'*/'
      '                       sum(MASS_2) MASS_2,'
      '                       sum(waste_2) waste_2,'
      '                       /* '#1056#1072#1089#1093#1086#1076' */'
      '                       -----------'
      '                       /*'#1055#1077#1088#1077#1082#1072#1095#1082#1072'*/'
      '                       sum(MASS_3) MASS_3,'
      '                       sum(waste_3) waste_3,'
      '                       /*'#1046#1077#1083#1077#1079#1085#1072#1103' '#1076#1086#1088#1086#1075#1072'*/'
      '                       sum(MASS_4) MASS_4,'
      '                       sum(waste_4) waste_4,'
      '                       /*'#1041#1077#1085#1079#1086#1074#1086#1079#1099'*/'
      '                       sum(MASS_5) MASS_5,'
      '                       sum(waste_5) waste_5,'
      '                       sum(poteri) poteri,'
      
        '                       sum(MASS_E) - sum(MASS_B) - sum(MASS_0) -' +
        ' sum(waste_0) -'
      
        '                       sum(MASS_1) - sum(waste_1) - sum(MASS_2) ' +
        '- sum(waste_2) +'
      
        '                       sum(MASS_3) + sum(waste_3) + sum(MASS_4) ' +
        '+ sum(waste_4) +'
      '                       sum(MASS_5) + sum(waste_5) as zameri,'
      '                       0 det'
      '                  from (SELECT GROUP_ID,'
      '                               IS_PIPE,'
      '                               TANK_NAME,'
      '                               min(product_id) PRODUCT_ID,'
      '                               TANK_ID,'
      '                               /* '#1054#1089#1090#1072#1090#1082#1080' '#1085#1072#1095#1072#1083#1072' */'
      
        '                               sum(decode(maxmet - minmet, 0, MA' +
        'SS_B, 0)) MASS_B,'
      '                               /* '#1054#1089#1090#1072#1090#1082#1080' '#1082#1086#1085#1094#1072' */'
      
        '                               sum(decode(maxmet - minmet, 0, 0,' +
        ' MASS_E)) MASS_E,'
      '                               0 MASS_0,'
      '                               0 waste_0,'
      '                               0 MASS_1,'
      '                               0 waste_1,'
      '                               0 MASS_2,'
      '                               0 waste_2,'
      '                               0 MASS_3,'
      '                               0 waste_3,'
      '                               0 MASS_4,'
      '                               0 waste_4,'
      '                               0 MASS_5,'
      '                               0 waste_5,'
      '                               0 poteri'
      '                          from (SELECT P.PRODUCT_GROUP GROUP_ID,'
      
        '                                       DECODE(T.TANK_KIND, 2, 1,' +
        ' 0) IS_PIPE,'
      '                                       min(DECODE(T.TANK_KIND,'
      '                                                  2,'
      '                                                  '#39#1058#1088#1091#1073#1099#39','
      
        '                                                  T.TANK_NAME)) ' +
        'TANK_NAME,'
      
        '                                       min(M.PRODUCT_ID) PRODUCT' +
        '_ID,'
      
        '                                       DECODE(T.TANK_KIND, 2, 0,' +
        ' T.TANK_ID) TANK_ID,'
      '                                       M.METERING_ACT_ID,'
      
        '                                       --                       ' +
        '        min(M.METERING_ACT_ID) over(partition by P.PRODUCT_GROUP' +
        ', T.TANK_KIND, DECODE(T.TANK_KIND, 2, 0, T.TANK_ID) order by M.M' +
        'ETERING_ACT_ID) minmet,'
      
        '                                       min(M.METERING_ACT_ID) ov' +
        'er(order by M.METERING_ACT_ID) minmet,'
      
        '                                       max(M.METERING_ACT_ID) ov' +
        'er(order by M.METERING_ACT_ID) maxmet,'
      '                                       sum(M.MASS) MASS_B,'
      '                                       sum(M.MASS) MASS_E'
      
        '                                  FROM TANK T, METERING M, PRODU' +
        'CT P'
      '                                 WHERE M.METERING_ACT_ID in'
      '                                       (SELECT METERING_ACT_ID'
      '                                          FROM METERING_ACT'
      
        '                                         WHERE (ACT_DATE >= :Beg' +
        'in_Date and'
      
        '                                               ACT_DATE < :Begin' +
        '_Date + 1)'
      
        '                                            or (ACT_DATE >= :End' +
        '_Date and'
      
        '                                               ACT_DATE < :End_D' +
        'ate + 1))'
      
        '                                   and P.PRODUCT_ID = M.PRODUCT_' +
        'ID'
      '                                   and P.LIGHT = 1'
      '                                   and T.TANK_ID = M.TANK_ID'
      '                                 group by P.PRODUCT_GROUP,'
      '                                          T.TANK_KIND,'
      
        '                                          DECODE(T.TANK_KIND, 2,' +
        ' 0, T.TANK_ID),'
      '                                          METERING_ACT_ID)'
      '                         group by GROUP_ID,'
      '                                  IS_PIPE,'
      '                                  TANK_NAME, /*PRODUCT_ID,*/'
      '                                  TANK_ID'
      '                        union all'
      '                        /* '#1055#1088#1080#1093#1086#1076' */'
      '                        select GROUP_ID,'
      '                               IS_PIPE,'
      '                               TANK_NAME,'
      '                               min(product_id) PRODUCT_ID,'
      '                               TANK_ID,'
      '                               0 MASS_B,'
      '                               0 MASS_E,'
      
        '                               sum(decode(INOUT_KIND, 0, MASS_0,' +
        ' 0)) MASS_0,'
      
        '                               sum(decode(INOUT_KIND, 0, WASTE_0' +
        ', 0)) WASTE_0,'
      
        '                               sum(decode(INOUT_KIND, 3, MASS_1,' +
        ' 0)) MASS_1,'
      
        '                               sum(decode(INOUT_KIND, 3, WASTE_1' +
        ', 0)) WASTE_1,'
      
        '                               sum(decode(INOUT_KIND, 6, MASS_2,' +
        ' 0)) MASS_2,'
      
        '                               sum(decode(INOUT_KIND, 6, WASTE_2' +
        ', 0)) WASTE_2,'
      '                               0 MASS_3,'
      '                               0 waste_3,'
      '                               0 MASS_4,'
      '                               0 waste_4,'
      '                               0 MASS_5,'
      '                               0 waste_5,'
      '                               0 poteri'
      '                          from (select P.PRODUCT_GROUP GROUP_ID,'
      
        '                                       DECODE(T.TANK_KIND, 2, 1,' +
        ' 0) IS_PIPE,'
      '                                       min(DECODE(T.TANK_KIND,'
      '                                                  2,'
      '                                                  '#39#1058#1088#1091#1073#1099#39','
      
        '                                                  T.TANK_NAME)) ' +
        'TANK_NAME,'
      
        '                                       min(P.PRODUCT_ID) PRODUCT' +
        '_ID,'
      
        '                                       DECODE(T.TANK_KIND, 2, 0,' +
        ' T.TANK_ID) TANK_ID,'
      
        '                                       nvl(TI.INOUT_KIND, 0) INO' +
        'UT_KIND,'
      '                                       SUM(TR.MASS) MASS_0,'
      
        '                                       sum(-1 * TRW.MASS) WASTE_' +
        '0,'
      '                                       SUM(TR.MASS) MASS_1,'
      
        '                                       sum(-1 * TRW.MASS) WASTE_' +
        '1,'
      '                                       SUM(TR.MASS) MASS_2,'
      
        '                                       sum(-1 * TRW.MASS) WASTE_' +
        '2'
      '                                  from TRANSFER        TR,'
      '                                       PRODUCT         P,'
      '                                       TANK            T,'
      '                                       TANK_INOUT      TI,'
      '                                       TRANSFER        TRW,'
      '                                       base_inout_kind bik'
      '                                 where TR.TR_DATE >='
      '                                       (SELECT max(ma.act_date)'
      '                                          FROM METERING_ACT ma'
      
        '                                         WHERE (ACT_DATE >= :Beg' +
        'in_Date and'
      
        '                                               ACT_DATE < :Begin' +
        '_Date + 1))'
      '                                   and TR.TR_DATE <'
      '                                       (SELECT max(ma.act_date)'
      '                                          FROM METERING_ACT ma'
      
        '                                         WHERE (ACT_DATE >= :End' +
        '_Date and'
      
        '                                               ACT_DATE < :End_D' +
        'ate + 1))'
      
        '                                   and TR.TANK_TO <> TR.TANK_FRO' +
        'M'
      '                                   and TR.PARENT_ID is null'
      '                                   and T.TANK_ID = TR.TANK_TO'
      '                                   and T.TANK_KIND <= 3'
      
        '                                   and TI.TANK_ID(+) = TR.TANK_F' +
        'ROM'
      
        '                                   and P.PRODUCT_ID = TR.PRODUCT' +
        '_TO'
      '                                   and P.LIGHT = 1'
      
        '                                   and TRW.PARENT_ID(+) = TR.TRA' +
        'NSFER_ID'
      
        '                                   and TRW.TANK_TO(+) = TR.TANK_' +
        'TO'
      
        '                                   and TI.INOUT_KIND = bik.inout' +
        '_kind_id(+)'
      '                                 group by P.PRODUCT_GROUP,'
      '                                          T.TANK_KIND,'
      
        '                                          DECODE(T.TANK_KIND, 2,' +
        ' 0, T.TANK_ID),'
      '                                          nvl(TI.INOUT_KIND, 0))'
      '                         group by GROUP_ID,'
      '                                  IS_PIPE,'
      '                                  TANK_NAME, /*PRODUCT_ID,*/'
      '                                  TANK_ID'
      '                        union all'
      '                        /* '#1056#1072#1089#1093#1086#1076' */'
      '                        select GROUP_ID,'
      '                               IS_PIPE,'
      '                               TANK_NAME,'
      '                               min(product_id) PRODUCT_ID,'
      '                               TANK_ID,'
      '                               0 MASS_B,'
      '                               0 MASS_E,'
      '                               0 MASS_0,'
      '                               0 waste_0,'
      '                               0 MASS_1,'
      '                               0 waste_1,'
      '                               0 MASS_2,'
      '                               0 waste_2,'
      
        '                               sum(decode(INOUT_KIND, 0, MASS_1,' +
        ' 0)) MASS_3,'
      
        '                               sum(decode(INOUT_KIND, 0, WASTE_1' +
        ', 0)) WASTE_3,'
      
        '                               sum(decode(INOUT_KIND, 4, MASS_1,' +
        ' 0)) MASS_4,'
      
        '                               sum(decode(INOUT_KIND, 4, WASTE_1' +
        ', 0)) WASTE_4,'
      
        '                               sum(decode(INOUT_KIND, 5, MASS_2,' +
        ' 0)) MASS_5,'
      
        '                               sum(decode(INOUT_KIND, 5, WASTE_2' +
        ', 0)) WASTE_5,'
      '                               0 poteri'
      '                          from (select P.PRODUCT_GROUP GROUP_ID,'
      
        '                                       DECODE(T.TANK_KIND, 2, 1,' +
        ' 0) IS_PIPE,'
      '                                       min(DECODE(T.TANK_KIND,'
      '                                                  2,'
      '                                                  '#39#1058#1088#1091#1073#1099#39','
      
        '                                                  T.TANK_NAME)) ' +
        'TANK_NAME,'
      
        '                                       min(P.PRODUCT_ID) PRODUCT' +
        '_ID,'
      
        '                                       DECODE(T.TANK_KIND, 2, 0,' +
        ' T.TANK_ID) TANK_ID,'
      
        '                                       nvl(TI.INOUT_KIND, 0) INO' +
        'UT_KIND,'
      '                                       SUM(TR.MASS) MASS_0,'
      
        '                                       sum(-1 * TRW.MASS) WASTE_' +
        '0,'
      '                                       SUM(TR.MASS) MASS_1,'
      
        '                                       sum(-1 * TRW.MASS) WASTE_' +
        '1,'
      '                                       SUM(TR.MASS) MASS_2,'
      
        '                                       sum(-1 * TRW.MASS) WASTE_' +
        '2'
      '                                  from TRANSFER        TR,'
      '                                       PRODUCT         P,'
      '                                       TANK            T,'
      '                                       TANK_INOUT      TI,'
      '                                       TRANSFER        TRW,'
      '                                       base_inout_kind bik'
      '                                 where TR.TR_DATE >='
      '                                       (SELECT max(ma.act_date)'
      '                                          FROM METERING_ACT ma'
      
        '                                         WHERE (ACT_DATE >= :Beg' +
        'in_Date and'
      
        '                                               ACT_DATE < :Begin' +
        '_Date + 1))'
      '                                   and TR.TR_DATE <'
      '                                       (SELECT max(ma.act_date)'
      '                                          FROM METERING_ACT ma'
      
        '                                         WHERE (ACT_DATE >= :End' +
        '_Date and'
      
        '                                               ACT_DATE < :End_D' +
        'ate + 1))'
      
        '                                   and TR.TANK_TO <> TR.TANK_FRO' +
        'M'
      '                                   and TR.PARENT_ID is null'
      '                                   and T.TANK_ID = TR.TANK_FROM'
      '                                   and T.TANK_KIND <= 3'
      
        '                                   and TI.TANK_ID(+) = TR.TANK_T' +
        'O'
      
        '                                   and P.PRODUCT_ID = TR.PRODUCT' +
        '_FROM'
      '                                   and P.LIGHT = 1'
      
        '                                   and TRW.PARENT_ID(+) = TR.TRA' +
        'NSFER_ID'
      
        '                                   and TRW.TANK_FROM(+) = TR.TAN' +
        'K_FROM'
      
        '                                   and TI.INOUT_KIND = bik.inout' +
        '_kind_id(+)'
      '                                 group by P.PRODUCT_GROUP,'
      '                                          T.TANK_KIND,'
      
        '                                          DECODE(T.TANK_KIND, 2,' +
        ' 0, T.TANK_ID),'
      '                                          nvl(TI.INOUT_KIND, 0)'
      '                                '
      '                                )'
      '                         group by GROUP_ID,'
      '                                  IS_PIPE,'
      '                                  TANK_NAME, /*PRODUCT_ID,*/'
      '                                  TANK_ID'
      '                        union all'
      '                        /* '#1040#1082#1090#1099' */'
      '                        SELECT P.PRODUCT_GROUP GROUP_ID,'
      '                               1.5 IS_PIPE,'
      '                               '#39#1057#1087#1080#1089#1072#1085#1080#1077' '#1087#1086' '#1072#1082#1090#1091#39' TANK_NAME,'
      '                               MIN(T.PRODUCT_ID) PRODUCT_ID,'
      '                               -1 TANK_ID,'
      '                               0 MASS_B,'
      '                               0 MASS_E,'
      '                               0 MASS_0,'
      '                               0 waste_0,'
      '                               0 MASS_1,'
      '                               0 waste_1,'
      '                               0 MASS_2,'
      '                               0 waste_2,'
      '                               0 MASS_3,'
      '                               0 WASTE_3,'
      '                               0 MASS_4,'
      '                               0 WASTE_4,'
      '                               0 MASS_5,'
      '                               0 WASTE_5,'
      '                               SUM(AMOUNT) poteri'
      
        '                          FROM CHANGE_ACT C, P_TRANS T, PRODUCT ' +
        'P'
      '                         WHERE C.DOC_DATE >= :Begin_Date'
      '                           and C.DOC_DATE < :End_Date'
      '                           and C.DOC_KIND = 4'
      '                           and C.DOC_MERGE = 0'
      '                           and C.P_TRANS_OUT = T.P_TRANS_ID'
      '                           AND P.PRODUCT_ID = T.PRODUCT_ID'
      '                           and P.LIGHT = 1'
      '                         GROUP BY P.PRODUCT_GROUP'
      '                        UNION ALL'
      '                        SELECT P.PRODUCT_GROUP GROUP_ID,'
      '                               1.5 IS_PIPE,'
      '                               '#39#1057#1087#1080#1089#1072#1085#1080#1077' '#1087#1086' '#1072#1082#1090#1091#39' TANK_NAME,'
      '                               MIN(T.PRODUCT_ID) PRODUCT_ID,'
      '                               -1 TANK_ID,'
      '                               0 MASS_B,'
      '                               0 MASS_E,'
      '                               0 MASS_0,'
      '                               0 waste_0,'
      '                               0 MASS_1,'
      '                               0 waste_1,'
      '                               0 MASS_2,'
      '                               0 waste_2,'
      '                               0 MASS_3,'
      '                               0 WASTE_3,'
      '                               0 MASS_4,'
      '                               0 WASTE_4,'
      '                               0 MASS_5,'
      '                               0 WASTE_5,'
      '                               SUM(AMOUNT) poteri'
      '                          FROM P_TRANS T, PRODUCT P'
      '                         WHERE TR_DATE >= :Begin_Date'
      '                           and TR_DATE <= :End_Date'
      '                           and CREDIT_KIND IN (3, 4, 5)'
      '                           and P.PRODUCT_ID = T.PRODUCT_ID'
      '                           and P.LIGHT = 1'
      '                         group by P.PRODUCT_GROUP)'
      '                 group by GROUP_ID,'
      '                          IS_PIPE,'
      '                          TANK_NAME, /*PRODUCT_ID,*/'
      '                          TANK_ID) Q,'
      '               product p'
      '         where q.PRODUCT_ID = p.product_id'
      '         group by GROUP_ID, IS_PIPE, TANK_NAME, p.name'
      '        union all'
      '        select to_number(1) as GROUP_ID,'
      '               to_number(2) IS_PIPE,'
      '               to_char(null) TANK_NAME,'
      '               '#39#1040'-80'#39' as np,'
      '               to_number(0) mass_begin,'
      '               to_number(0) mass_end,'
      '               to_number(0) diff_za_period,'
      '               to_number(0) oborot,'
      '               to_number(0) MASS_0,'
      '               to_number(0) waste_0,'
      '               to_number(0) MASS_1,'
      '               to_number(0) waste_1,'
      '               to_number(0) MASS_2,'
      '               to_number(0) waste_2,'
      '               to_number(0) MASS_3,'
      '               to_number(0) waste_3,'
      '               to_number(0) MASS_4,'
      '               to_number(0) waste_4,'
      '               to_number(0) MASS_5,'
      '               to_number(0) waste_5,'
      '               to_number(0) poteri,'
      '               to_number(0) as zameri,'
      '               1 det'
      '          from dual'
      '        union all'
      '        select to_number(2) as GROUP_ID,'
      '               to_number(2) IS_PIPE,'
      '               to_char(null) TANK_NAME,'
      '               '#39#1040'-92'#39' as np,'
      '               to_number(0) mass_begin,'
      '               to_number(0) mass_end,'
      '               to_number(0) diff_za_period,'
      '               to_number(0) oborot,'
      '               to_number(0) MASS_0,'
      '               to_number(0) waste_0,'
      '               to_number(0) MASS_1,'
      '               to_number(0) waste_1,'
      '               to_number(0) MASS_2,'
      '               to_number(0) waste_2,'
      '               to_number(0) MASS_3,'
      '               to_number(0) waste_3,'
      '               to_number(0) MASS_4,'
      '               to_number(0) waste_4,'
      '               to_number(0) MASS_5,'
      '               to_number(0) waste_5,'
      '               to_number(0) poteri,'
      '               to_number(0) as zameri,'
      '               1 det'
      '          from dual'
      '        union all'
      '        select to_number(3) as GROUP_ID,'
      '               to_number(2) IS_PIPE,'
      '               to_char(null) TANK_NAME,'
      '               '#39#1040'-95'#39' as np,'
      '               to_number(0) mass_begin,'
      '               to_number(0) mass_end,'
      '               to_number(0) diff_za_period,'
      '               to_number(0) oborot,'
      '               to_number(0) MASS_0,'
      '               to_number(0) waste_0,'
      '               to_number(0) MASS_1,'
      '               to_number(0) waste_1,'
      '               to_number(0) MASS_2,'
      '               to_number(0) waste_2,'
      '               to_number(0) MASS_3,'
      '               to_number(0) waste_3,'
      '               to_number(0) MASS_4,'
      '               to_number(0) waste_4,'
      '               to_number(0) MASS_5,'
      '               to_number(0) waste_5,'
      '               to_number(0) poteri,'
      '               to_number(0) as zameri,'
      '               1 det'
      '          from dual'
      '        union all'
      '        select to_number(4) as GROUP_ID,'
      '               to_number(2) IS_PIPE,'
      '               to_char(null) TANK_NAME,'
      '               '#39#1044#1058#39' as np,'
      '               to_number(0) mass_begin,'
      '               to_number(0) mass_end,'
      '               to_number(0) diff_za_period,'
      '               to_number(0) oborot,'
      '               to_number(0) MASS_0,'
      '               to_number(0) waste_0,'
      '               to_number(0) MASS_1,'
      '               to_number(0) waste_1,'
      '               to_number(0) MASS_2,'
      '               to_number(0) waste_2,'
      '               to_number(0) MASS_3,'
      '               to_number(0) waste_3,'
      '               to_number(0) MASS_4,'
      '               to_number(0) waste_4,'
      '               to_number(0) MASS_5,'
      '               to_number(0) waste_5,'
      '               to_number(0) poteri,'
      '               to_number(0) as zameri,'
      '               1 det'
      '          from dual'
      '        union all'
      '        select to_number(6) as GROUP_ID,'
      '               to_number(2) IS_PIPE,'
      '               to_char(null) TANK_NAME,'
      '               '#39#1055#1088#1086#1095#1077#1077#39' as np,'
      '               to_number(0) mass_begin,'
      '               to_number(0) mass_end,'
      '               to_number(0) diff_za_period,'
      '               to_number(0) oborot,'
      '               to_number(0) MASS_0,'
      '               to_number(0) waste_0,'
      '               to_number(0) MASS_1,'
      '               to_number(0) waste_1,'
      '               to_number(0) MASS_2,'
      '               to_number(0) waste_2,'
      '               to_number(0) MASS_3,'
      '               to_number(0) waste_3,'
      '               to_number(0) MASS_4,'
      '               to_number(0) waste_4,'
      '               to_number(0) MASS_5,'
      '               to_number(0) waste_5,'
      '               to_number(0) poteri,'
      '               to_number(0) as zameri,'
      '               1 det'
      '          from dual'
      '        union all'
      '        select to_number(-1) as GROUP_ID,'
      '               to_number(2) IS_PIPE,'
      '               to_char(null) TANK_NAME,'
      '               '#39#1042#1089#1077#1075#1086#39' as np,'
      '               to_number(0) mass_begin,'
      '               to_number(0) mass_end,'
      '               to_number(0) diff_za_period,'
      '               to_number(0) oborot,'
      '               to_number(0) MASS_0,'
      '               to_number(0) waste_0,'
      '               to_number(0) MASS_1,'
      '               to_number(0) waste_1,'
      '               to_number(0) MASS_2,'
      '               to_number(0) waste_2,'
      '               to_number(0) MASS_3,'
      '               to_number(0) waste_3,'
      '               to_number(0) MASS_4,'
      '               to_number(0) waste_4,'
      '               to_number(0) MASS_5,'
      '               to_number(0) waste_5,'
      '               to_number(0) poteri,'
      '               to_number(0) as zameri,'
      '               1 det'
      '          from dual)'
      ' order by decode(group_id, -1, -1, 0) desc, group_id, 2, 3')
    FetchAll = True
    OnFilterRecord = qFilterRecord
    Left = 140
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Begin_Date'
      end
      item
        DataType = ftDateTime
        Name = 'End_Date'
      end>
    object qGROUP_ID: TFloatField
      FieldName = 'GROUP_ID'
    end
    object qIS_PIPE: TFloatField
      FieldName = 'IS_PIPE'
    end
    object qTANK_NAME: TStringField
      FieldName = 'TANK_NAME'
      Size = 15
    end
    object qNP: TStringField
      FieldName = 'NP'
      Size = 16
    end
    object qMASS_BEGIN: TFloatField
      FieldName = 'MASS_BEGIN'
    end
    object qMASS_END: TFloatField
      FieldName = 'MASS_END'
    end
    object qDIFF_ZA_PERIOD: TFloatField
      FieldName = 'DIFF_ZA_PERIOD'
    end
    object qOBOROT: TFloatField
      FieldName = 'OBOROT'
    end
    object qMASS_0: TFloatField
      FieldName = 'MASS_0'
    end
    object qWASTE_0: TFloatField
      FieldName = 'WASTE_0'
    end
    object qMASS_1: TFloatField
      FieldName = 'MASS_1'
    end
    object qWASTE_1: TFloatField
      FieldName = 'WASTE_1'
    end
    object qMASS_2: TFloatField
      FieldName = 'MASS_2'
    end
    object qWASTE_2: TFloatField
      FieldName = 'WASTE_2'
    end
    object qMASS_3: TFloatField
      FieldName = 'MASS_3'
    end
    object qWASTE_3: TFloatField
      FieldName = 'WASTE_3'
    end
    object qMASS_4: TFloatField
      FieldName = 'MASS_4'
    end
    object qWASTE_4: TFloatField
      FieldName = 'WASTE_4'
    end
    object qMASS_5: TFloatField
      FieldName = 'MASS_5'
    end
    object qWASTE_5: TFloatField
      FieldName = 'WASTE_5'
    end
    object qZAMERI: TFloatField
      FieldName = 'ZAMERI'
    end
    object qDET: TFloatField
      FieldName = 'DET'
    end
    object qPOTERI: TFloatField
      FieldName = 'POTERI'
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
