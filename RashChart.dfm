object RashChartForm: TRashChartForm
  Left = 283
  Top = 157
  Width = 870
  Height = 640
  Caption = #1040#1085#1072#1083#1080#1079' '#1086#1090#1087#1091#1089#1082#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Chart: TDBChart
    Left = 0
    Top = 33
    Width = 862
    Height = 580
    Title.Text.Strings = (
      'TDBChart')
    Title.Visible = False
    BottomAxis.Increment = 1.000000000000000000
    BottomAxis.LabelsAngle = 90
    CustomAxes = <
      item
        Horizontal = False
        OtherSide = True
        LabelsFont.Color = 8404992
        StartPosition = 20.000000000000000000
        PositionPercent = -13.000000000000000000
        Title.Angle = 270
        Title.Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072', '#1057#176
        Title.Font.Color = 8404992
        ZPosition = 0.010000000000000000
      end>
    LeftAxis.Title.Caption = #1042#1077#1089', '#1082#1075
    Legend.Alignment = laTop
    Legend.CheckBoxes = True
    Legend.ColorWidth = 15
    Legend.Symbol.Width = 15
    Legend.Symbol.WidthUnits = lcsPixels
    Legend.TextStyle = ltsPlain
    Legend.Title.Visible = False
    Legend.Title.Text.Strings = (
      #1051#1077#1075#1077#1085#1076#1072)
    Legend.Title.TextAlignment = taCenter
    Legend.VertSpacing = -1
    RightAxis.Automatic = False
    RightAxis.AutomaticMaximum = False
    RightAxis.LabelsFont.Color = 28527
    RightAxis.LabelsFont.Style = [fsBold]
    RightAxis.Maximum = 20000.000000000000000000
    RightAxis.Title.Caption = #1056#1072#1079#1085#1080#1094#1072', '#1082#1075
    RightAxis.Title.Font.Color = 28527
    RightAxis.Title.Font.Style = [fsBold]
    Align = alClient
    TabOrder = 0
    ColorPaletteIndex = 13
    object OutSeries: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      DataSource = qChart
      SeriesColor = 4227327
      Title = #1042#1077#1089' '#1086#1090#1087#1091#1097#1077#1085#1085#1099#1081
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'TR_DATE'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'VOLUME'
    end
    object OutReducedSeries: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      DataSource = qChart
      SeriesColor = 16744576
      Title = #1042#1077#1089' '#1087#1088#1080#1074#1077#1076#1077#1085#1085#1099#1081
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'TR_DATE'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'REDUCED_VOLUME'
    end
    object DiffSeries: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      DataSource = qChart
      SeriesColor = 8454143
      Title = #1056#1072#1079#1085#1080#1094#1072
      VertAxis = aRightAxis
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'TR_DATE'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'DIFF'
    end
    object TempSeries: TLineSeries
      Active = False
      Depth = 1
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      DataSource = qChart
      SeriesColor = 7157302
      Title = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
      VertAxis = aCustomVertAxis
      Dark3D = False
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'TR_DATE'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'TEMPER'
      CustomVertAxis = 0
    end
  end
  object pnlFilters: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 33
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      862
      33)
    object lblTitleChart: TLabel
      Left = 238
      Top = 7
      Width = 622
      Height = 18
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Caption = #1056#1072#1079#1085#1080#1094#1072' '#1087#1088#1080' '#1086#1090#1087#1091#1089#1082#1077' '#1090#1086#1087#1083#1080#1074#1072' %s'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object pnlChartDate: TPanel
      Left = 2
      Top = 2
      Width = 236
      Height = 29
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblBeginDate: TLabel
        Left = 6
        Top = 8
        Width = 7
        Height = 13
        Caption = 'C'
      end
      object lblEndDate: TLabel
        Left = 119
        Top = 8
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object deBeginDate: TDateEdit
        Left = 21
        Top = 4
        Width = 91
        Height = 21
        DefaultToday = True
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        YearDigits = dyFour
        TabOrder = 0
        Text = '08.01.2008'
        OnChange = deBeginDateChange
      end
      object deEndDate: TDateEdit
        Left = 138
        Top = 4
        Width = 93
        Height = 21
        CheckOnExit = True
        DefaultToday = True
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        YearDigits = dyFour
        TabOrder = 1
        Text = '08.01.2008'
        OnChange = deBeginDateChange
      end
    end
  end
  object qChart: TOraQuery
    SQL.Strings = (
      'select X.TR_DATE,'
      '       npg.id as fuel_id,'
      '       npg.name as fuel_name,'
      '       sum(Y.VOLUME) as VOLUME,'
      '       min(Y.DENS) as dens,'
      '       min(Y.TEMPER) as TEMPER,'
      '       min(nrd.reduced_density) as reduced_density,'
      
        '       sum(round(Y.VOLUME / Y.DENS * nrd.reduced_density, 0)) as' +
        ' reduced_volume,'
      
        '       sum(Y.VOLUME - round(Y.VOLUME / Y.DENS * nrd.reduced_dens' +
        'ity, 0)) as diff'
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
      '               bt.FIRST_TIMESTAMP,'
      '               TF.Tr_Date as transfer_date,'
      '               pg.name as PRODUCT_GROUP_NAME'
      '          from P_TRANS T,'
      '               PRODUCT P,'
      '               PRODUCT_GROUP PG,'
      '               TRAN_REF TR,'
      '               TRANSFER TF,'
      '               COMPANY CC,'
      '               COMPANY CD,'
      '               Base_p_Trans_Timestamp bt'
      '         where T.TR_DATE between :BeginDate and :EndDate'
      '           and P.PRODUCT_ID = T.PRODUCT_ID'
      '           and TR.P_TRANS_ID(+) = T.P_TRANS_ID'
      '           and TF.TRANSFER_ID(+) = TR.TRANSFER_ID'
      '           and CC.COMPANY_ID(+) = T.CREDITOR_ID'
      '           and CD.COMPANY_ID(+) = T.DEBITOR_ID'
      '           and (P.PACKED = 0)'
      '           AND T.P_TRANS_ID = BT.P_TRANS_ID(+)'
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
      '               bt.FIRST_TIMESTAMP,'
      '               T.TR_DATE as transfer_date,'
      '               pg.name as PRODUCT_GROUP_NAME'
      '          from P_TRANS T,'
      '               PRODUCT P,'
      '               PRODUCT_GROUP PG,'
      '               Base_p_Trans_Timestamp bt'
      '         where T.TR_DATE between :BeginDate and :EndDate'
      '           and T.TR_KIND = 8'
      '           and T.CREDIT_KIND <> 3'
      '           and P.PRODUCT_ID = T.PRODUCT_ID'
      '           and (P.PACKED = 0)'
      '           AND T.P_TRANS_ID = BT.P_TRANS_ID(+)'
      '           AND p.product_group = pg.product_group_id) X,'
      '       (SELECT H.LOAD_DATE TR_DATE,'
      '               I.P_TRANS,'
      '               H.WAYBILL_NO,'
      '               H.DELIVERY_ID,'
      '               C.NAME DELIVERY,'
      '               I.VOLUME,'
      '               I.DENS,'
      '               I.TEMPER,'
      '               I.PRICE_V,'
      '               M.AMOUNT,'
      '               nvl(TP.TRUCK_NO, H.TRUCK_NO) TRUCK_NO,'
      '               H.ARRIVE_NO,'
      '               H.WAYLIST_TRIP,'
      '               NVL(D.NAME, H.DRIVER) DRIVER,'
      '               H.NOTE4BASE,'
      '               H.DISTANCE'
      '          FROM WB_AUTO_HDR H,'
      '               WB_AUTO_ITEM I,'
      '               M_TRANS M,'
      '               COMPANY C,'
      '               TRUCK_PARK TP,'
      '               DRIVER D'
      '         WHERE H.LOAD_DATE between :BeginDate and :EndDate'
      '           and I.WB_HDR_ID = H.WB_HDR_ID'
      '           and M.M_TRANS_ID(+) = I.M_TRANS'
      '           and C.COMPANY_ID(+) = H.DELIVERY_ID'
      '           AND H.TRUCK_ID = TP.TRUCK_ID(+)'
      '           AND H.DRIVER_ID = D.DRIVER_ID) Y,'
      '       oil_np_reduced_density nrd,'
      '       exe_link el,'
      '       oil_np_group npg'
      ' where X.p_trans_id = Y.p_trans(+)'
      '   and X.tr_date = Y.tr_date(+)'
      '   and (X.amount is not null)'
      '   and TR_KIND_ID = 4'
      '   and round(Y.DENS, 2) = nrd.density(+)'
      '   and Y.TEMPER = nrd.temp(+)'
      '   and el.out_program(+) = 7'
      '   and el.oil_table_name(+) = '#39'OIL_NP_GROUP'#39
      '   and el.out_code(+) = X.PRODUCT_GROUP'
      '   and npg.id = el.oil_id '
      '   and el.oil_id = :fuel_id'
      '   group by npg.id,'
      '       npg.name,'
      '       X.TR_DATE,'
      '       el.oil_id'
      ' ORDER BY npg.name, X.TR_DATE desc')
    Left = 16
    Top = 96
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
        Value = 40238d
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
        ParamType = ptInput
        Value = 40299d
      end
      item
        DataType = ftInteger
        Name = 'fuel_id'
        ParamType = ptInput
        Value = 7
      end>
  end
end
