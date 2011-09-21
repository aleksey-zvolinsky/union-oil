inherited MoneyRefForm: TMoneyRefForm
  Left = 193
  Top = 149
  Caption = #1059#1095#1077#1090' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077#1085#1085#1099#1093' '#1086#1087#1083#1072#1090
  ClientHeight = 395
  ClientWidth = 787
  Position = poDefaultPosOnly
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 362
    Width = 787
    inherited Panel3: TPanel
      Left = 590
    end
    inherited PAdd: TPanel
      inherited sbAdd: TSpeedButton
        OnClick = sbAddClick
      end
    end
    inherited pDel: TPanel
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      inherited bbClear: TBitBtn
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
    inherited pPrint: TPanel
      Visible = True
    end
    inherited pTotal: TPanel
      Visible = True
    end
    inherited pShowDetail: TPanel
      Width = 222
    end
  end
  inherited Panel2: TPanel
    Width = 787
    Height = 90
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = #1044#1072#1090#1072' c:'
    end
    object Label3: TLabel
      Left = 110
      Top = 8
      Width = 86
      Height = 13
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' :'
    end
    object Label2: TLabel
      Left = 110
      Top = 48
      Width = 73
      Height = 13
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' :'
    end
    object sbOrgClear: TSpeedButton
      Left = 408
      Top = 63
      Width = 23
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
      OnClick = sbOrgClearClick
    end
    object sbDepClear: TSpeedButton
      Left = 408
      Top = 23
      Width = 23
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
      OnClick = sbDepClearClick
    end
    object Label5: TLabel
      Left = 438
      Top = 8
      Width = 118
      Height = 13
      Caption = #1058#1080#1087' '#1094#1077#1083#1077#1074#1086#1075#1086' '#1087#1083#1072#1090#1077#1078#1072':'
    end
    object sbPayTypeClear: TSpeedButton
      Left = 569
      Top = 25
      Width = 23
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
      OnClick = sbPayTypeClearClick
    end
    object Label4: TLabel
      Left = 598
      Top = 8
      Width = 57
      Height = 13
      Caption = #8470' '#1086#1087#1083#1072#1090#1099' :'
    end
    object Label7: TLabel
      Left = 8
      Top = 48
      Width = 15
      Height = 13
      Caption = #1087#1086':'
    end
    object sbOperClear: TSpeedButton
      Left = 569
      Top = 61
      Width = 23
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
      OnClick = sbOperClearClick
    end
    object Label6: TLabel
      Left = 598
      Top = 48
      Width = 56
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1053#1053':'
    end
    object Label8: TLabel
      Left = 438
      Top = 48
      Width = 53
      Height = 13
      Caption = #1054#1087#1077#1088#1072#1094#1080#1103':'
    end
    object LabelDog: TLabel
      Left = 672
      Top = 8
      Width = 50
      Height = 13
      Caption = #1044#1086#1075#1086#1074#1086#1088' :'
    end
    object deBeginDate: TDateEdit
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      CheckOnExit = True
      DefaultToday = True
      DirectInput = False
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
      Text = '16.05.2003'
    end
    object ceDepName: TComboEdit
      Left = 110
      Top = 24
      Width = 297
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 1
      OnButtonClick = ceDepNameButtonClick
      OnDblClick = ceDepNameButtonClick
    end
    object ceOrgName: TComboEdit
      Left = 110
      Top = 64
      Width = 297
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = ceOrgNameButtonClick
      OnDblClick = ceOrgNameButtonClick
    end
    object cbPayType: TComboBox
      Left = 438
      Top = 26
      Width = 131
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        #1041#1077#1085#1079#1080#1085#1099
        #1044#1080#1079#1077#1083#1100#1085#1086#1077' '#1090#1086#1087#1083#1080#1074#1086)
    end
    object edTaxBillNum: TEdit
      Left = 598
      Top = 63
      Width = 65
      Height = 21
      TabOrder = 4
    end
    object edPayNum: TEdit
      Left = 598
      Top = 24
      Width = 65
      Height = 21
      TabOrder = 5
    end
    object deEndDate: TDateEdit
      Left = 8
      Top = 64
      Width = 97
      Height = 21
      CheckOnExit = True
      DefaultToday = True
      DirectInput = False
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 6
      Text = '16.05.2003'
    end
    object ceOperName: TComboEdit
      Left = 438
      Top = 63
      Width = 131
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 7
      OnButtonClick = ceOperNameButtonClick
      OnDblClick = ceOperNameButtonClick
    end
    object edDog: TEdit
      Left = 672
      Top = 24
      Width = 81
      Height = 21
      TabOrder = 8
    end
    object cbMoneyOut: TCheckBox
      Left = 672
      Top = 64
      Width = 81
      Height = 17
      Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1077
      TabOrder = 9
    end
  end
  inherited pBase: TPanel
    Top = 100
    Width = 637
    Height = 262
    inherited SplitterDetail: TSplitter
      Top = 207
      Width = 637
    end
    inherited DBGrid1: TDBGridEh
      Width = 637
      Height = 207
      RowSizingAllowed = True
      SumList.Active = True
      Columns = <
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'NUM'
          Footers = <
            item
              Alignment = taRightJustify
              Value = #1054#1087#1083#1072#1090':'
              ValueType = fvtStaticText
            end>
          Title.Alignment = taCenter
          Title.Caption = #8470
          Width = 43
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'MDATE'
          Footers = <
            item
              ValueType = fvtCount
            end>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Width = 61
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'DOGOVOR'
          Footers = <
            item
            end>
          Title.Alignment = taCenter
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'NN_NUM'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084#1077#1088' '#1053#1053
          Width = 65
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'SUM_NN'
          Footers = <
            item
              FieldName = 'SUM_NN'
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072' '#1053#1053
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'MONEY'
          Footers = <
            item
              FieldName = 'MONEY'
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 60
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'ORG_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          Width = 147
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'RASC_CHET'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1056'/'#1057
          Width = 91
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'DEP_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
          Width = 160
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'OPER_NAME'
          Footers = <>
          Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
        end>
    end
    inherited pDetail: TPanel
      Top = 210
      Width = 637
      inherited DBGridDetail: TDBGridEh
        Width = 637
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 787
    inherited pnlTuneGridBtn: TPanel
      Left = 758
    end
  end
  inherited PanelCol: TPanel
    Left = 637
    Top = 100
    Height = 262
    inherited cbCol: TRxCheckListBox
      Height = 234
    end
    inherited pRefresh: TPanel
      Top = 236
    end
  end
  inherited ds: TOraDataSource
    Left = 47
    Top = 135
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select *'
      '  from (select m.ID,'
      '               m.INST,'
      '               m.NUM,'
      '               m.MDATE,'
      '               m.ORG_ID,'
      '               m.ORG_INST,'
      '               oto.NAME org_name,'
      '               m.REKV_ID,'
      '               m.REKV_INST,'
      '               r.ID_BANK bank_id,'
      '               r.BANK_INST,'
      '               r.RACH_CHET RASC_CHET,'
      '               m.PART_ID,'
      '               m.PART_INST,'
      '               p.DOG part_name,'
      '               m.DEP_ID,'
      '               m.DEP_INST,'
      '               ofrom.NAME dep_name,'
      '               m.OPER_ID,'
      '               oper.NAME oper_name,'
      '               m.RASCH_ID,'
      '               oto.nal_num as RASCH_NAME,'
      '               m.MONEY,'
      '               m.TEXT,'
      '               dog.DOG dogovor,'
      '               m.MONEY_T,'
      '               m.DOG_ID,'
      '               m.DOG_INST,'
      '               dog.DOG_DATE,'
      '               m.NN_ID,'
      '               m.NN_INST,'
      '               Sb.NUM nn_num,'
      '               m.GOAL_PART_TYPE,'
      '               GP.NAME goal_part_name,'
      '               dog.DOG_TYPE,'
      '               dog.sub_type,'
      '               dog.Forepay,'
      '               m.CASH_METHOD,'
      '               Sb.NAL_T,'
      '               Sb.FRASCH,'
      '               nvl(sum(sdet.nds_t), sb.nds_t) as sum_nn,'
      '               dog.share_id'
      '          FROM OIL_MONEY m,'
      '               v_org oto,'
      '               v_org ofrom,'
      '               OIL_DOG dog,'
      '               OIL_PART p,'
      '               OIL_SALE_BOOK Sb,'
      '               OIL_SALE_BOOK_DET sdet,'
      '               oil_goal_part_type GP,'
      '               V_OIL_OPER_TYPE oper,'
      '               V_OIL_REKVIZIT r'
      '         WHERE m.STATE = '#39'Y'#39
      '           AND oto.state = '#39'Y'#39
      '           AND m.ORG_ID = oto.ID'
      '           AND m.ORG_INST = oto.INST'
      '           AND ofrom.state = '#39'Y'#39
      '           AND m.DEP_ID = ofrom.ID'
      '           AND m.DEP_INST = ofrom.INST'
      '           AND oper.state = '#39'Y'#39
      '           AND m.OPER_ID = oper.ID'
      '           AND p.state(+) = '#39'Y'#39
      '           AND m.PART_ID = p.ID(+)'
      '           AND m.PART_INST = p.INST(+)'
      '           AND m.REKV_ID = r.ID(+)'
      '           AND m.REKV_INST = r.INST(+)'
      '           AND dog.State(+) = '#39'Y'#39
      '           AND m.DOG_ID = dog.ID(+)'
      '           AND m.DOG_INST = dog.INST(+)'
      '           AND GP.State(+) = '#39'Y'#39
      '           AND m.GOAL_PART_TYPE = GP.ID(+)'
      '              /* SALE_BOOK */'
      '           AND m.NN_ID = Sb.ID(+)'
      '           AND m.NN_INST = Sb.INST(+)'
      '           AND sb.STATE(+) = '#39'Y'#39
      '           AND nvl(sb.nal_t(+), 1) <> 6'
      '           AND sdet.nn_id(+) = sb.id'
      '           AND sdet.nn_inst(+) = sb.inst'
      '           AND sb.S_DATE(+) = m.mdate'
      '              /* FILTERS */'
      '           and m.MDate between :BeginDate and :EndDate'
      '           AND sign(money) = :inout'
      '         group by m.ID,'
      '                  m.INST,'
      '                  m.NUM,'
      '                  m.MDATE,'
      '                  m.ORG_ID,'
      '                  m.ORG_INST,'
      '                  oto.NAME,'
      '                  m.REKV_ID,'
      '                  m.REKV_INST,'
      '                  r.ID_BANK,'
      '                  r.BANK_INST,'
      '                  r.RACH_CHET,'
      '                  m.PART_ID,'
      '                  m.PART_INST,'
      '                  p.DOG,'
      '                  m.DEP_ID,'
      '                  m.DEP_INST,'
      '                  ofrom.NAME,'
      '                  m.OPER_ID,'
      '                  oper.NAME,'
      '                  m.RASCH_ID,'
      '                  oto.nal_num,'
      '                  m.MONEY,'
      '                  m.TEXT,'
      '                  dog.DOG,'
      '                  m.MONEY_T,'
      '                  m.DOG_ID,'
      '                  m.DOG_INST,'
      '                  dog.DOG_DATE,'
      '                  m.NN_ID,'
      '                  m.NN_INST,'
      '                  Sb.NUM,'
      '                  m.GOAL_PART_TYPE,'
      '                  GP.NAME,'
      '                  dog.DOG_TYPE,'
      '                  dog.sub_type,'
      '                  dog.Forepay,'
      '                  m.CASH_METHOD,'
      '                  Sb.NAL_T,'
      '                  Sb.FRASCH,'
      '                  sb.nds_t,'
      '                  dog.share_id) m'
      '')
    Left = 16
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
        DataType = ftUnknown
        Name = 'inout'
      end>
  end
  inherited PUM: TPopupMenu
    Left = 193
    Top = 277
    object miPrintTax: TMenuItem [0]
      Caption = #1055#1077#1095#1072#1090#1100' &'#1053#1072#1083#1086#1075#1086#1074#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      OnClick = miPrintTaxClick
    end
    object N2: TMenuItem [1]
      Caption = '-'
    end
  end
  object pmPrint: TPopupMenu
    Left = 288
    Top = 320
  end
  object sp1: TOilStoredProc
        Left = 630
    Top = 305
  end
  object qryDog: TOilQuery
    SQL.Strings = (
      'select'
      ' d.*,'
      ' np.name  as np_name,'
      ' np.petrol_id as petrol_id  ,'
      ' np.id as np_id'
      'from '
      ' oil_dog_detail d,'
      ' v_oil_np_type np'
      'where'
      ' d.dog_id = :dog_id and'
      ' d.dog_inst = :dog_inst and'
      ' d.state='#39'Y'#39' and'
      ' d.np_type = np.id (+) '
      ' '
      ' '
      ' ')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 339
    Top = 134
    ParamData = <
      item
        DataType = ftInteger
        Name = 'dog_id'
      end
      item
        DataType = ftInteger
        Name = 'dog_inst'
      end>
  end
  object qChecker: TOilQuery
    SQL.Strings = (
      'select * from OIL_MONEY M  '
      'where M.DOG_ID = :dog_id '
      '  and M.DOG_INST = :dog_inst '
      '  and M.NN_INST = :nn_inst'
      '  and M.NN_ID > :nn_id')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 64
    Top = 284
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
        Name = 'nn_inst'
      end
      item
        DataType = ftUnknown
        Name = 'nn_id'
      end>
  end
end
