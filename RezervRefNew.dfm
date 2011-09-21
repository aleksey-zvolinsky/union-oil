inherited RezervRefNewForm: TRezervRefNewForm
  Left = 359
  Top = 229
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel4: TPanel
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
  end
  inherited Panel2: TPanel
    Height = 47
    object lblNpGroup: TLabel
      Left = 4
      Top = 4
      Width = 54
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1053#1055
    end
    object sbClearGrp: TSpeedButton
      Left = 146
      Top = 19
      Width = 22
      Height = 21
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
      OnClick = sbClearGrpClick
    end
    object edNPGroup: TComboEdit
      Left = 3
      Top = 19
      Width = 142
      Height = 21
      TabStop = False
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = edNPGroupButtonClick
      OnDblClick = edNPGroupButtonClick
    end
  end
  inherited pBase: TPanel
    Top = 57
    Height = 314
    inherited SplitterDetail: TSplitter
      Top = 259
    end
    inherited DBGrid1: TDBGridEh
      Height = 259
      UseMultiTitle = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NUMB'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1053#1055
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'CURAMOUNT'
          Footers = <>
          Title.Caption = #1050#1085#1080#1078#1085#1099#1077' '#1086#1089#1090#1072#1090#1082#1080
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'LITRES_ALL'
          Footers = <>
          Title.Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077' '#1086#1089#1090#1072#1090#1082#1080
          Width = 81
        end
        item
          EditButtons = <>
          FieldName = 'DIFF'
          Footers = <>
          Title.Caption = #1056#1072#1079#1085#1080#1094#1072
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'PERCENT'
          Footers = <>
          Title.Caption = #1047#1072#1087#1086#1083#1085#1077#1085#1086#1089#1090#1100
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'MAXAMOUNT'
          Footers = <>
          Title.Caption = #1054#1073#1098#1077#1084
          Width = 81
        end
        item
          EditButtons = <>
          FieldName = 'TUMB'
          Footers = <>
          Title.Caption = #1058#1088#1091#1073#1086#1087#1088#1086#1074#1086#1076
          Width = 78
        end>
    end
    inherited pDetail: TPanel
      Top = 262
    end
  end
  inherited PanelCol: TPanel
    Top = 57
    Height = 314
    inherited cbCol: TRxCheckListBox
      Height = 286
    end
    inherited pRefresh: TPanel
      Top = 288
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select * from ('
      'select np.name, '
      '       tp.curamount,'
      '       tp.litres_all,'
      '       trunc(tp.litres_all /t.maxamount *100)||'#39'%'#39' as percent,'
      
        '       decode(sign(tp.curamount - tp.litres_all), 1,tp.curamount' +
        ' - tp.litres_all, -1,-(tp.curamount - tp.litres_all), 0) as diff' +
        ','
      '       t.minamount, t.maxamount, t.tumb,'
      '       row_number() over(order by np.name, numb) as numb'
      ''
      '       '
      '       /*, t.fuel_id,'
      
        '       decode(row_number() over (partition by dr.azs_id, np.id o' +
        'rder by dr.rep_date desc),1,1,0) as is_tank*/'
      
        '  from (select rownum*100 as numb from user_objects where rownum' +
        ' < 8),'
      '       oil_daily_rep dr, '
      '       oil_azs_tankparams tp, '
      '       (select dr.azs_id, t.tank_id, t.fuel_id,'
      
        '               to_number(substr(max(to_char(dr.rep_date, '#39'ddmmyy' +
        'yy_'#39') || t.minamount), 10)) as minamount,'
      
        '               to_number(substr(max(to_char(dr.rep_date, '#39'ddmmyy' +
        'yy_'#39') || t.maxamount), 10)) as maxamount,'
      
        '               to_number(substr(max(to_char(dr.rep_date, '#39'ddmmyy' +
        'yy_'#39') || t.tumb), 10)) as tumb,'
      '               np.name as np_name,'
      '               azs.name as azs_name'
      
        '          from oil_daily_rep dr, oil_azs_tanks t, oil_np_group n' +
        'p, v_org azs'
      '         where dr.state = '#39'Y'#39
      '           and t.state = '#39'Y'#39
      '           and dr.id = t.rep_id'
      '           and dr.inst = t.rep_inst'
      '           and t.fuel_id = np.id'
      '           and dr.azs_id = :azs_id'
      '           and dr.azs_inst = :azs_id'
      '           and azs.id = dr.azs_id'
      '           and azs.inst = dr.azs_inst'
      '           and dr.rep_date = (select max(dr.rep_date)'
      
        '                                from oil_daily_rep dr, oil_azs_t' +
        'anks t'
      '                               where dr.state = '#39'Y'#39
      '                                 and t.state = '#39'Y'#39
      '                                 and dr.id = t.rep_id'
      '                                 and dr.inst = t.rep_inst'
      '                                 and dr.azs_id = :azs_id'
      '                                 and dr.azs_inst = :azs_id)'
      
        '         group by azs.name, dr.azs_id, np.name, t.tank_id, t.fue' +
        'l_id) t,'
      '       oil_np_group np'
      ' where dr.id = tp.rep_id'
      '   and dr.inst = tp.rep_inst'
      '   and t.tank_id = tp.tanks_id'
      '   and dr.state = '#39'Y'#39
      '   and tp.state = '#39'Y'#39
      '   and t.fuel_id = np.id'
      '   and t.azs_id = dr.azs_id'
      '   and dr.azs_id = :azs_id'
      '   and dr.azs_inst = :azs_id'
      '   and trunc(dr.rep_date) between :begin_date and :end_date'
      '   and (np.id = :fuel_id or :fuel_id = 0)'
      '   and abs(tp.curamount - tp.litres_all) <= 4000'
      
        '   and tp.id not in (26771,26766,26756,26762,26765, 26754, 26760' +
        ', 26757,26761,26764)'
      'order by np.name, numb'
      ' )'
      'where numb <= 40')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'azs_id'
      end
      item
        DataType = ftUnknown
        Name = 'begin_date'
      end
      item
        DataType = ftUnknown
        Name = 'end_date'
      end
      item
        DataType = ftUnknown
        Name = 'fuel_id'
      end>
  end
end
