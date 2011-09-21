inherited BaseDocsRefForm: TBaseDocsRefForm
  Left = 237
  Top = 115
  Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084
  ClientHeight = 567
  ClientWidth = 951
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 534
    Width = 951
    inherited pShowDetail: TPanel [0]
      Left = 529
      Width = 225
      inherited cbShowDetail: TCheckBox
        Left = 10
      end
    end
    inherited Panel3: TPanel [1]
      Left = 754
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
      Width = 191
      Visible = True
      inherited sbSpeedUp: TSpeedButton
        Caption = #1041#1099#1089#1090#1088#1086
        Layout = blGlyphBottom
        Margin = 0
        ParentBiDiMode = False
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
    Width = 951
    object lblBeginDate: TLabel
      Left = 8
      Top = 4
      Width = 38
      Height = 13
      Caption = #1044#1072#1090#1072' c:'
    end
    object lblEndDate: TLabel
      Left = 8
      Top = 44
      Width = 15
      Height = 13
      Caption = #1087#1086':'
    end
    object lblCreditorOrg: TLabel
      Left = 120
      Top = 4
      Width = 29
      Height = 13
      Caption = #1050#1086#1084#1091':'
    end
    object lblProduct: TLabel
      Left = 120
      Top = 44
      Width = 76
      Height = 13
      Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090':'
    end
    object lblRez: TLabel
      Left = 256
      Top = 4
      Width = 57
      Height = 13
      Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088':'
    end
    object lblAutoNum: TLabel
      Left = 796
      Top = 44
      Width = 63
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1072#1074#1090#1086':'
      Visible = False
    end
    object lblProductGroup: TLabel
      Left = 256
      Top = 44
      Width = 118
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072':'
    end
    object gbDocTypes: TGroupBox
      Left = 412
      Top = 14
      Width = 173
      Height = 61
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
      TabOrder = 11
    end
    object deBeginDate: TDateEdit
      Left = 8
      Top = 20
      Width = 92
      Height = 21
      CheckOnExit = True
      DefaultToday = True
      DirectInput = False
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
      Text = '01.04.2010'
      OnChange = bbSearchClick
    end
    object deEndDate: TDateEdit
      Left = 8
      Top = 60
      Width = 92
      Height = 21
      CheckOnExit = True
      DefaultToday = True
      DirectInput = False
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
      Text = '01.04.2010'
      OnChange = bbSearchClick
    end
    object rgGoodType: TRadioGroup
      Left = 592
      Top = 14
      Width = 77
      Height = 61
      Caption = #1058#1080#1087' '#1090#1086#1074#1072#1088#1072
      ItemIndex = 0
      Items.Strings = (
        #1052#1077#1088#1085#1099#1081
        #1064#1090#1091#1095#1085#1099#1081)
      TabOrder = 2
      OnClick = bbSearchClick
    end
    object CreditorOrg: TEdit
      Left = 120
      Top = 20
      Width = 125
      Height = 21
      TabOrder = 3
      OnChange = CreditorOrgChange
    end
    object Product: TEdit
      Left = 120
      Top = 60
      Width = 125
      Height = 21
      TabOrder = 4
      OnChange = CreditorOrgChange
    end
    object Rez: TEdit
      Left = 256
      Top = 20
      Width = 125
      Height = 21
      TabOrder = 5
      OnChange = CreditorOrgChange
    end
    object AutoNum: TEdit
      Left = 796
      Top = 60
      Width = 125
      Height = 21
      TabOrder = 6
      Visible = False
      OnChange = CreditorOrgChange
    end
    object cbTTN: TCheckBox
      Left = 416
      Top = 32
      Width = 75
      Height = 17
      Caption = #1058#1058#1053
      Checked = True
      State = cbChecked
      TabOrder = 7
      OnClick = CreditorOrgChange
    end
    object cbPrihAuto: TCheckBox
      Left = 416
      Top = 52
      Width = 75
      Height = 17
      Caption = #1055#1088#1080#1093#1086#1076' '#1072#1074
      Checked = True
      State = cbChecked
      TabOrder = 8
      OnClick = CreditorOrgChange
    end
    object cbPrihRail: TCheckBox
      Left = 500
      Top = 32
      Width = 75
      Height = 17
      Caption = #1055#1088#1080#1093#1086#1076' '#1078#1076
      Checked = True
      State = cbChecked
      TabOrder = 9
      OnClick = CreditorOrgChange
    end
    object cbMixing: TCheckBox
      Left = 500
      Top = 52
      Width = 75
      Height = 17
      Caption = #1057#1084#1077#1096#1077#1085#1080#1077
      Checked = True
      State = cbChecked
      TabOrder = 10
      OnClick = CreditorOrgChange
    end
    object rgDocState: TRadioGroup
      Left = 676
      Top = 14
      Width = 117
      Height = 61
      Hint = #1044#1086#1082#1091#1084#1077#1085#1090#1099' '#1073#1077#1079' '#1087#1088#1080#1074#1103#1079#1082#1080' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ItemIndex = 0
      Items.Strings = (
        #1042#1089#1077
        #1053#1077#1087#1088#1086#1074#1077#1076#1077#1085#1085#1099#1077)
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = bbSearchClick
    end
    object ProductGroup: TEdit
      Left = 256
      Top = 60
      Width = 125
      Height = 21
      TabOrder = 13
      OnChange = CreditorOrgChange
    end
  end
  inherited pBase: TPanel
    Width = 801
    Height = 439
    inherited SplitterDetail: TSplitter
      Top = 384
      Width = 801
    end
    inherited DBGrid1: TDBGridEh
      Width = 801
      Height = 384
      DrawGraphicData = True
      DrawMemoText = True
      FooterRowCount = 1
      SumList.Active = True
      UseMultiTitle = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'IS_REZ'
          Footers = <>
          ImageList = ImageList
          KeyList.Strings = (
            '0'
            '1')
          PickList.Strings = (
            #1053#1077' '#1087#1088#1086#1074#1077#1076#1077#1085
            #1055#1088#1086#1074#1077#1076#1077#1085)
          ShowImageAndText = True
          Title.Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
          Width = 93
        end
        item
          EditButtons = <>
          FieldName = 'TR_DATE'
          Footer.Alignment = taRightJustify
          Footer.Value = #1050#1086#1083'-'#1074#1086' :'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Width = 61
        end
        item
          EditButtons = <>
          FieldName = 'TIMESTAMP'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
          Width = 103
        end
        item
          EditButtons = <>
          FieldName = 'TR_KIND'
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'PRODUCT'
          Footers = <>
          Title.Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
          Width = 103
        end
        item
          EditButtons = <>
          FieldName = 'PRODUCT_GROUP_NAME'
          Footers = <>
          Title.Caption = #1043#1088#1091#1087#1087#1072' '#1085#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090#1072
          Width = 89
        end
        item
          EditButtons = <>
          FieldName = 'DEBITOR'
          Footers = <>
          Title.Caption = #1054#1090' '#1082#1086#1075#1086
        end
        item
          EditButtons = <>
          FieldName = 'CREDITOR'
          Footers = <>
          Title.Caption = #1050#1086#1084#1091
        end
        item
          DisplayFormat = '0,'
          EditButtons = <>
          FieldName = 'AMOUNT'
          Footer.DisplayFormat = '0,'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086', '#1082#1075
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = 'TANK_ID'
          Footers = <>
          Title.Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088
        end
        item
          EditButtons = <>
          FieldName = 'PACKED'
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1090#1086#1074#1072#1088#1072
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'WAYBILL_NO'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1087#1091#1090#1077#1074#1082#1080
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = 'DELIVERY'
          Footers = <>
          Title.Caption = #1055#1091#1085#1082#1090' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
          Width = 103
        end
        item
          DisplayFormat = '0,'
          EditButtons = <>
          FieldName = 'VOLUME'
          Footer.DisplayFormat = '0,'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086', '#1083
          Width = 82
        end
        item
          DisplayFormat = '0.0000#'
          EditButtons = <>
          FieldName = 'DENS'
          Footers = <>
          Title.Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
        end
        item
          EditButtons = <>
          FieldName = 'TEMPER'
          Footers = <>
          Title.Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'TRUCK_NO'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1072#1074#1090#1086
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'ARRIVE_NO'
          Footers = <>
          Title.Caption = #1055#1088#1080#1073#1099#1090#1080#1077
        end
        item
          EditButtons = <>
          FieldName = 'WAYLIST_TRIP'
          Footers = <>
          Title.Caption = #1061#1086#1076#1082#1072
        end
        item
          EditButtons = <>
          FieldName = 'DRIVER'
          Footers = <>
          Title.Caption = #1042#1086#1076#1080#1090#1077#1083#1100
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'DISTANCE'
          Footers = <>
          Title.Caption = #1056#1072#1089#1089#1090#1086#1103#1085#1080#1077
        end
        item
          EditButtons = <>
          FieldName = 'wb_kind'
          Footers = <>
          Title.Caption = #1042#1080#1076' '#1086#1090#1087#1091#1089#1082#1072
        end
        item
          EditButtons = <>
          FieldName = 'WHO_FREIGHT'
          Footers = <>
          Title.Caption = #1042#1099#1074#1086#1079
        end
        item
          EditButtons = <>
          FieldName = 'price_kind'
          Footers = <>
          Title.Caption = #1042#1080#1076' '#1094#1077#1085#1099
        end
        item
          EditButtons = <>
          FieldName = 'pay_method'
          Footers = <>
          Title.Caption = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
        end>
    end
    inherited pDetail: TPanel
      Top = 387
      Width = 801
      inherited DBGridDetail: TDBGridEh
        Width = 801
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 951
    inherited pnlTuneGridBtn: TPanel
      Left = 922
    end
  end
  inherited PanelCol: TPanel
    Left = 801
    Height = 439
    inherited cbCol: TRxCheckListBox
      Height = 411
    end
    inherited pRefresh: TPanel
      Top = 413
    end
  end
  inherited q: TOilQuery
    FetchAll = True
    OnFilterRecord = qFilterRecord
  end
  inherited qDetail: TOilQuery
    MasterFields = ''
  end
  object qFast: TOilQuery
    SQL.Strings = (
      'select X.*,'
      '       null as tr_date_1,'
      '       TO_NUMBER(NULL) as p_trans,'
      '       TO_NUMBER(NULL) as WAYBILL_NO,'
      '       TO_NUMBER(NULL) as DELIVERY_ID,'
      '       NULL as DELIVERY,'
      '       TO_NUMBER(NULL) as VOLUME,'
      '       TO_NUMBER(NULL) as DENS,'
      '       TO_NUMBER(NULL) as TEMPER,'
      '       TO_NUMBER(NULL) as PRICE_V,'
      '       TO_NUMBER(NULL) as AMOUNT,'
      '       null as TRUCK_NO,'
      '       TO_NUMBER(NULL) as ARRIVE_NO,'
      '       TO_NUMBER(NULL) as WAYLIST_TRIP,'
      '       null as DRIVER,'
      '       null as NOTE4BASE,'
      '       TO_NUMBER(NULL) as DISTANCE,'
      
        '       decode(is_packed, 1, 1, decode(X.tank_id, null, 0, 1)) as' +
        ' is_rez'
      '  from (select T.P_TRANS_ID,'
      '               T.TR_DATE,'
      '               t.timestamp,'
      '               decode(T.TR_KIND,'
      '                      4,'
      '                      '#39#1058#1058#1053#39','
      '                      7,'
      '                      '#39#1055#1088#1080#1093#1086#1076' '#1072#1074#39','
      '                      8,'
      '                      '#39#1055#1088#1080#1093#1086#1076' '#1078#1076#39','
      '                      15,'
      '                      '#39#1057#1084#1077#1096#1077#1085#1080#1077#39','
      '                      10,'
      '                      '#39#1045#1089#1090'.'#1091#1073#1099#1083#1100#39','
      '                      '#39#1044#1088#1091#1075#1086#1081#39') as TR_KIND,'
      '               T.TR_KIND as TR_KIND_ID,'
      '               1 REC_KIND,'
      '               T.PRODUCT_ID,'
      '               P.NAME PRODUCT,'
      '               P.PRODUCT_GROUP,'
      '               P.LIGHT,'
      '               T.DEBIT_KIND,'
      '               T.DEBITOR_ID,'
      '               CD.NAME DEBITOR,'
      '               T.CREDIT_KIND,'
      '               T.CREDITOR_ID,'
      '               CC.NAME CREDITOR,'
      '               T.AMOUNT,'
      '               T.PRICE PRICE_M,'
      '               decode(T.CREDIT_KIND,'
      '                      102,'
      '                      (select to_number(t.tank_name) as tank_id'
      '                         from tank t'
      '                        where t.tank_id = TF.TANK_FROM),'
      '                      (select to_number(t.tank_name) as tank_id'
      '                         from tank t'
      '                        where t.tank_id = TF.TANK_TO)) TANK_ID,'
      
        '               decode(P.PACKED, 0, '#39#1052#1077#1088#1085#1099#1081#39', '#39#1064#1090#1091#1095#1085#1099#1081#39') as packe' +
        'd,'
      '               P.PACKED as is_packed,'
      '               TF.TR_DATE as transfer_date,'
      '               PG.NAME as PRODUCT_GROUP_NAME'
      '          from P_TRANS T,'
      '               PRODUCT P, '
      '               PRODUCT_GROUP PG,'
      '               TRAN_REF TR,'
      '               TRANSFER TF,'
      '               COMPANY CC,'
      '               COMPANY CD'
      '         where T.TR_DATE between :BeginDate and :EndDate'
      '           and P.PRODUCT_ID = T.PRODUCT_ID'
      '           and TR.P_TRANS_ID(+) = T.P_TRANS_ID'
      '           and TF.TRANSFER_ID(+) = TR.TRANSFER_ID'
      '           and CC.COMPANY_ID(+) = T.CREDITOR_ID'
      '           and CD.COMPANY_ID(+) = T.DEBITOR_ID'
      '           and (P.PACKED = :IsPaked or :IsPaked is null)'
      '           and CC.NAME like upper('#39'%'#39' || :Org || '#39'%'#39')'
      '           and P.NAME like upper('#39'%'#39' || :Product || '#39'%'#39')'
      '           and PG.PRODUCT_GROUP_ID = P.PRODUCT_GROUP'
      '        UNION ALL'
      '        select T.P_TRANS_ID,'
      '               T.TR_DATE,'
      '               t.timestamp,'
      '               decode(T.TR_KIND,'
      '                      4,'
      '                      '#39#1058#1058#1053#39','
      '                      7,'
      '                      '#39#1055#1088#1080#1093#1086#1076' '#1072#1074#39','
      '                      8,'
      '                      '#39#1055#1088#1080#1093#1086#1076' '#1078#1076#39','
      '                      15,'
      '                      '#39#1057#1084#1077#1096#1077#1085#1080#1077#39','
      '                      10,'
      '                      '#39#1045#1089#1090'.'#1091#1073#1099#1083#1100#39','
      '                      '#39#1044#1088#1091#1075#1086#1081#39') as TR_KIND,'
      '               T.TR_KIND as TR_KIND_ID,'
      '               0 REC_KIND,'
      '               T.PRODUCT_ID,'
      '               P.NAME PRODUCT,'
      '               P.PRODUCT_GROUP,'
      '               P.LIGHT,'
      '               0 DEBIT_KIND,'
      '               TO_NUMBER(NULL) DEBITOR_ID,'
      '               NULL DEBITOR,'
      '               0 CREDIT_KIND,'
      '               TO_NUMBER(NULL) CREDITOR_ID,'
      '               NULL CREDITOR,'
      '               TO_NUMBER(NULL) AMOUNT,'
      '               TO_NUMBER(NULL) PRICE_M,'
      '               TO_NUMBER(NULL) TANK_ID,'
      
        '               decode(P.PACKED, 0, '#39#1052#1077#1088#1085#1099#1081#39', '#39#1064#1090#1091#1095#1085#1099#1081#39') as packe' +
        'd,'
      '               P.PACKED as is_packed,'
      '               TO_DATE(NULL) as transfer_date,'
      '               PG.NAME as PRODUCT_GROUP_NAME'
      '          from P_TRANS T, PRODUCT P, PRODUCT_GROUP PG'
      '         where T.TR_DATE between :BeginDate and :EndDate'
      '           and T.TR_KIND = 8'
      '           and T.CREDIT_KIND <> 3'
      '           and P.PRODUCT_ID = T.PRODUCT_ID'
      '           and (P.PACKED = :IsPaked or :IsPaked is null)'
      '           and P.NAME like upper('#39'%'#39' || :Product || '#39'%'#39')'
      '           and P.PRODUCT_GROUP = PG.PRODUCT_GROUP_ID) X'
      ' where (X.tank_id < :IsRez or X.tank_id is null)'
      '   and (X.amount is not null)'
      ' ORDER BY X.TR_DATE desc, X.timestamp desc')
    MasterSource = ds
    FetchAll = True
    BeforeOpen = qBeforeOpen
    OnFilterRecord = qFilterRecord
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 144
    Top = 236
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
        Name = 'IsPaked'
      end
      item
        DataType = ftUnknown
        Name = 'Org'
      end
      item
        DataType = ftUnknown
        Name = 'Product'
      end
      item
        DataType = ftUnknown
        Name = 'IsRez'
      end>
  end
  object qSlow: TOilQuery
    SQL.Strings = (
      'select X.P_TRANS_ID,'
      '       X.TR_DATE,'
      '       X.TIMESTAMP,'
      '       X.TR_KIND,'
      '       X.TR_KIND_ID,'
      '       X.REC_KIND,'
      '       X.PRODUCT_ID,'
      '       X.PRODUCT,'
      '       X.PRODUCT_GROUP,'
      '       X.LIGHT,'
      '       X.DEBIT_KIND,'
      '       X.DEBITOR_ID,'
      '       X.DEBITOR,'
      '       X.CREDIT_KIND,'
      '       X.CREDITOR_ID,'
      '       X.CREDITOR,'
      '       X.AMOUNT,'
      '       X.PRICE_M,'
      '       X.TANK_ID,'
      '       X.PACKED,'
      '       X.TRANSFER_DATE,'
      '       X.PRODUCT_GROUP_NAME,'
      '       Y.WAYBILL_NO,'
      '       Y.DELIVERY_ID,'
      '       Y.DELIVERY,'
      '       Y.VOLUME,'
      '       Y.DENS,'
      '       Y.TEMPER,'
      '       Y.PRICE_V,'
      '       Y.AMOUNT,'
      '       Y.TRUCK_NO,'
      '       Y.ARRIVE_NO,'
      '       Y.WAYLIST_TRIP,'
      '       Y.DRIVER,'
      '       Y.NOTE4BASE,'
      '       Y.DISTANCE,'
      
        '       decode(is_packed, 1, 1, decode(X.tank_id, null, 0, 1)) as' +
        ' is_rez,'
      '       Y.wb_kind,'
      '       Y.WHO_FREIGHT,'
      '       Y.price_kind,'
      '       Y.pay_method'
      '  from (select T.P_TRANS_ID,'
      '               T.TR_DATE,'
      '               t.timestamp,'
      '               decode(T.TR_KIND,'
      '                      4,'
      '                      '#39#1058#1058#1053#39','
      '                      7,'
      '                      '#39#1055#1088#1080#1093#1086#1076' '#1072#1074#39','
      '                      8,'
      '                      '#39#1055#1088#1080#1093#1086#1076' '#1078#1076#39','
      '                      15,'
      '                      '#39#1057#1084#1077#1096#1077#1085#1080#1077#39','
      '                      10,'
      '                      '#39#1045#1089#1090'.'#1091#1073#1099#1083#1100#39','
      '                      '#39#1044#1088#1091#1075#1086#1081#39') as TR_KIND,'
      '               T.TR_KIND as TR_KIND_ID,'
      '               1 REC_KIND,'
      '               T.PRODUCT_ID,'
      '               P.NAME PRODUCT,'
      '               P.PRODUCT_GROUP,'
      '               P.LIGHT,'
      '               T.DEBIT_KIND,'
      '               T.DEBITOR_ID,'
      '               CD.NAME DEBITOR,'
      '               T.CREDIT_KIND,'
      '               T.CREDITOR_ID,'
      '               CC.NAME CREDITOR,'
      '               T.AMOUNT,'
      '               T.PRICE PRICE_M,'
      '               decode(T.CREDIT_KIND,'
      '                      102,'
      '                      (select to_number(t.tank_name) as tank_id'
      '                         from tank t'
      '                        where t.tank_id = TF.TANK_FROM),'
      '                      (select to_number(t.tank_name) as tank_id'
      '                         from tank t'
      '                        where t.tank_id = TF.TANK_TO)) TANK_ID,'
      
        '               decode(P.PACKED, 0, '#39#1052#1077#1088#1085#1099#1081#39', '#39#1064#1090#1091#1095#1085#1099#1081#39') as packe' +
        'd,'
      '               P.PACKED as is_packed,'
      '               TF.Tr_Date as transfer_date,'
      '               pg.name as PRODUCT_GROUP_NAME'
      '          from P_TRANS       T,'
      '               PRODUCT       P,'
      '               PRODUCT_GROUP PG,'
      '               TRAN_REF      TR,'
      '               TRANSFER      TF,'
      '               COMPANY       CC,'
      '               COMPANY       CD'
      '         where T.TR_DATE between :BeginDate and :EndDate'
      '           and P.PRODUCT_ID = T.PRODUCT_ID'
      '           and TR.P_TRANS_ID(+) = T.P_TRANS_ID'
      '           and TF.TRANSFER_ID(+) = TR.TRANSFER_ID'
      '           and CC.COMPANY_ID(+) = T.CREDITOR_ID'
      '           and CD.COMPANY_ID(+) = T.DEBITOR_ID'
      '           and (P.PACKED = :IsPaked or :IsPaked is null)'
      '           and CC.NAME like upper('#39'%'#39' || :Org || '#39'%'#39')'
      '           and P.NAME like upper('#39'%'#39' || :Product || '#39'%'#39')'
      '           AND p.product_group = pg.product_group_id'
      '        UNION ALL'
      '        select T.P_TRANS_ID,'
      '               T.TR_DATE,'
      '               t.timestamp,'
      '               decode(T.TR_KIND,'
      '                      4,'
      '                      '#39#1058#1058#1053#39','
      '                      7,'
      '                      '#39#1055#1088#1080#1093#1086#1076' '#1072#1074#39','
      '                      8,'
      '                      '#39#1055#1088#1080#1093#1086#1076' '#1078#1076#39','
      '                      15,'
      '                      '#39#1057#1084#1077#1096#1077#1085#1080#1077#39','
      '                      10,'
      '                      '#39#1045#1089#1090'.'#1091#1073#1099#1083#1100#39','
      '                      '#39#1044#1088#1091#1075#1086#1081#39') as TR_KIND,'
      '               T.TR_KIND as TR_KIND_ID,'
      '               0 REC_KIND,'
      '               T.PRODUCT_ID,'
      '               P.NAME PRODUCT,'
      '               P.PRODUCT_GROUP,'
      '               P.LIGHT,'
      '               0 DEBIT_KIND,'
      '               TO_NUMBER(NULL) DEBITOR_ID,'
      '               NULL DEBITOR,'
      '               0 CREDIT_KIND,'
      '               TO_NUMBER(NULL) CREDITOR_ID,'
      '               NULL CREDITOR,'
      '               TO_NUMBER(NULL) AMOUNT,'
      '               TO_NUMBER(NULL) PRICE_M,'
      '               TO_NUMBER(NULL) TANK_ID,'
      
        '               decode(P.PACKED, 0, '#39#1052#1077#1088#1085#1099#1081#39', '#39#1064#1090#1091#1095#1085#1099#1081#39') as packe' +
        'd,'
      '               P.PACKED as is_packed,'
      '               T.TR_DATE as transfer_date,'
      '               pg.name as PRODUCT_GROUP_NAME'
      '          from P_TRANS T, PRODUCT P, PRODUCT_GROUP PG'
      '         where T.TR_DATE between :BeginDate and :EndDate'
      '           and T.TR_KIND = 8'
      '           and T.CREDIT_KIND <> 3'
      '           and P.PRODUCT_ID = T.PRODUCT_ID'
      '           and (P.PACKED = :IsPaked or :IsPaked is null)'
      '           and P.NAME like upper('#39'%'#39' || :Product || '#39'%'#39')'
      '           AND p.product_group = pg.product_group_id) X,'
      '       (SELECT /*+ORDERED*/'
      '         H.LOAD_DATE TR_DATE,'
      '         I.P_TRANS,'
      '         H.WAYBILL_NO,'
      '         H.DELIVERY_ID,'
      '         C.NAME DELIVERY,'
      '         I.VOLUME,'
      '         I.DENS,'
      '         I.TEMPER,'
      '         I.PRICE_V,'
      '         M.AMOUNT,'
      '         nvl(TP.TRUCK_NO, H.TRUCK_NO) TRUCK_NO,'
      '         H.ARRIVE_NO,'
      '         H.WAYLIST_TRIP,'
      '         NVL(D.NAME, H.DRIVER) DRIVER,'
      '         H.NOTE4BASE,'
      '         H.DISTANCE,'
      '         decode(H.WB_KIND,'
      '                '#39'W'#39','
      '                '#39#1090#1086#1074#1072#1088#1085#1099#1081#39','
      '                '#39'C'#39','
      '                '#39#1093#1088#1072#1085#1077#1085#1080#1077#39','
      '                '#39'O'#39','
      '                '#39#1089#1086#1073#1089#1090#1074#1077#1085#1085#1099#1081#39','
      '                '#39'F'#39','
      '                '#39#1087#1077#1088#1077#1086#1092#1086#1088#1084#1083'.'#39','
      '                '#39'M'#39','
      '                '#39#1079#1072#1082#1083#1072#1076#1082#1072#39','
      '                '#39'U'#39','
      '                '#39#1074#1085#1077#1073#1072#1083#1072#1085#1089'.'#39') wb_kind,'
      '         decode(H.FREIGHT_ID,'
      '                H.CUSTOMER_ID,'
      '                '#39#1089#1072#1084#1086#1074#1099#1074#1086#1079#39','
      '                1,'
      '                '#39#1094#1077#1085#1090#1088#1086#1074#1099#1074#1086#1079#39','
      '                '#39#1087#1088#1080#1074#1083#1077#1095#1077#1085#1085#1099#1081#39') WHO_FREIGHT,'
      '         decode(h.price_kind,'
      '                1,'
      '                '#39#1054#1090#1087#1091#1089#1082#1085#1072#1103#39','
      '                2,'
      '                '#39#1055#1086#1082#1091#1087#1085#1072#1103#39','
      '                3,'
      '                '#39#1040#1047#1057' '#1085#1072#1083#39','
      '                4,'
      '                '#39#1061#1088#1072#1085#1077#1085#1080#1077#39','
      '                5,'
      '                '#39#1040#1047#1057' '#1073#1077#1079#1085#1072#1083#39','
      '                6,'
      '                '#39#1042#1079#1072#1080#1084#1086#1079#1072#1095#1077#1090#39','
      '                7,'
      '                '#39#1043#1091#1084#1072#1085#1080#1090#1072#1088#1082#1072#39','
      '                8,'
      '                '#39#1054#1090#1087#1091#1089#1082#1085#1072#1103' '#1057#1077#1085#1090#1086#1079#1072#39','
      '                10,'
      '                '#39#1047#1072' '#1090#1072#1083#1086#1085#1099#39','
      '                '#39#1044#1088#1091#1075#1072#1103#39') price_kind,'
      '         decode(h.pay_method,'
      '                1,'
      '                '#39#1055#1083#1072#1085#1086#1074#1099#1077#39','
      '                2,'
      '                '#39#1042#1085#1091#1090#1088#1080#1089#1080#1089#1090#1077#1084#1085#1099#1077#39','
      '                3,'
      '                '#39#1053#1072#1083#1080#1095#1085#1072#1103#39','
      '                4,'
      '                '#39#1041#1077#1079#1085#1072#1083#39','
      '                5,'
      '                '#39#1042#1079#1072#1080#1084#1086#1079#1072#1095#1077#1090#39','
      '                6,'
      '                '#39#1041#1072#1088#1090#1077#1088#39','
      '                7,'
      '                '#39#1063#1077#1082#39','
      '                8,'
      '                '#39#1042#1077#1082#1089#1077#1083#1100#39','
      '                '#39#1044#1088#1091#1075#1072#1103#39') pay_method'
      '          FROM WB_AUTO_HDR  H,'
      '               WB_AUTO_ITEM I,'
      '               DRIVER       D,'
      '               M_TRANS      M,'
      '               COMPANY      C,'
      '               TRUCK_PARK   TP'
      '         WHERE H.LOAD_DATE between :BeginDate and :EndDate'
      '           and I.WB_HDR_ID = H.WB_HDR_ID'
      '           AND H.DRIVER_ID = D.DRIVER_ID'
      '           and I.M_TRANS = M.M_TRANS_ID(+)'
      '           and H.DELIVERY_ID = C.COMPANY_ID(+)'
      '           AND H.TRUCK_ID = TP.TRUCK_ID(+)) Y'
      ' where X.p_trans_id = Y.p_trans(+)'
      '   and X.tr_date = Y.tr_date(+)'
      '   and (X.tank_id < :IsRez or X.tank_id is null)'
      '   and (X.amount is not null)'
      ' ORDER BY X.TR_DATE desc, X.timestamp desc')
    MasterSource = ds
    FetchAll = True
    BeforeOpen = qBeforeOpen
    OnFilterRecord = qFilterRecord
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 104
    Top = 236
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
        Name = 'IsPaked'
      end
      item
        DataType = ftUnknown
        Name = 'Org'
      end
      item
        DataType = ftUnknown
        Name = 'Product'
      end
      item
        DataType = ftUnknown
        Name = 'IsRez'
      end>
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
