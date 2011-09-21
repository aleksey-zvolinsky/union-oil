object PrihChartForm: TPrihChartForm
  Left = 263
  Top = 215
  Width = 870
  Height = 640
  Caption = #1040#1085#1072#1083#1080#1079' '#1087#1088#1080#1093#1086#1076#1086#1074
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
    Height = 573
    Title.Text.Strings = (
      'TDBChart')
    Title.Visible = False
    BottomAxis.Increment = 1.000000000000000000
    BottomAxis.LabelsAngle = 90
    BottomAxis.MaximumOffset = 10
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
    RightAxis.Inverted = True
    RightAxis.LabelsFont.Color = clRed
    RightAxis.StartPosition = 10.000000000000000000
    RightAxis.PositionPercent = -75.000000000000000000
    RightAxis.PositionUnits = muPixels
    RightAxis.Title.Caption = #1056#1072#1079#1085#1080#1094#1072' '#1087#1088#1080' '#1087#1088#1080#1077#1084#1077', '#1082#1075
    RightAxis.Title.Font.Color = clMaroon
    RightAxis.Title.Color = clRed
    RightAxis.ZPosition = 0.010000000000000000
    Align = alClient
    TabOrder = 0
    ColorPaletteIndex = 13
    object DocSeries: TBarSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      DataSource = qChart
      SeriesColor = 8454143
      Title = #1055#1088#1080#1093#1086#1076' '#1087#1086' '#1078'/'#1076' '#1076#1086#1082#1091#1084#1077#1090#1072#1084
      Transparency = 19
      BarWidthPercent = 50
      DepthPercent = 50
      Gradient.Direction = gdTopBottom
      MultiBar = mbNone
      Shadow.Color = 8947848
      Shadow.SmoothBlur = 7
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'MDATE'
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'DOC_MASS'
    end
    object FactSeries: TBarSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      DataSource = qChart
      SeriesColor = 12615680
      Title = #1055#1088#1080#1093#1086#1076' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081
      Transparency = 20
      BarWidthPercent = 50
      DepthPercent = 50
      Gradient.Direction = gdTopBottom
      MultiBar = mbNone
      Shadow.Color = 8947848
      StackGroup = 1
      YOrigin = 1.000000000000000000
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'MDATE'
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'FACT_MASS'
    end
    object DiffAgrSeries: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Callout.Length = 20
      Marks.Visible = True
      DataSource = qChart
      SeriesColor = 8421631
      Title = #1056#1072#1079#1085#1080#1094#1072' '#1085#1072#1082#1086#1087#1080#1090#1077#1083#1100#1085#1072#1103
      VertAxis = aRightAxis
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'MDATE'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'RAIL_LOSS_MINUS_AGR'
    end
    object DiffSeries: TBarSeries
      ColorEachPoint = True
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Shadow.Color = 8618883
      Marks.Visible = False
      DataSource = qChart
      SeriesColor = clRed
      Title = #1056#1072#1079#1085#1080#1094#1072' '#1085#1072' '#1087#1086#1079#1080#1094#1080#1102
      Transparency = 20
      VertAxis = aRightAxis
      BeforeDrawValues = DiffSeriesBeforeDrawValues
      BarWidthPercent = 25
      DepthPercent = 25
      Gradient.Direction = gdTopBottom
      MultiBar = mbNone
      Shadow.Color = 8618883
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'MDATE'
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'RAIL_LOSS_MINUS'
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
      Caption = #1056#1072#1079#1085#1080#1094#1072' '#1087#1088#1080' '#1087#1088#1080#1093#1086#1076#1077' '#1087#1086' '#1090#1086#1087#1083#1080#1074#1091' %s'
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
      'select min(T.P_TRANS_ID) as P_TRANS_ID,'
      '       trunc(nvl(TF.TR_DATE, T.TR_DATE)) as MDATE,'
      '       nvl(-dg.id, npg.id) as fuel_id,'
      '       nvl(dg.name, npg.name) as fuel_name,'
      '       sum(T.AMOUNT) as AMOUNT,'
      '       to_number(null) TANK_ID,'
      '       decode(tr_kind,'
      '              15,'
      '              decode(credit_kind, 6, -1, 8, 1),'
      
        '              decode(tr_kind, 7, 1, 8, 1, 4, -1, 9, -1, 10, -1, ' +
        '0)) as in_out,'
      '       to_char(null) as numb,'
      
        '       decode(tr_kind, 4, 1, 0) as is_loading, /*'#1040#1074#1090#1086#1085#1072#1083#1080#1074' ('#1058#1058#1053')' +
        '*/'
      '       decode(tr_kind, 15, 1, 0) as is_mixing, /*'#1057#1084#1077#1096#1077#1085#1080#1077' */'
      '       tr_kind,'
      '       sum(ri.mass) as fact_mass,'
      '       sum(ri.wb_mass) as  doc_mass,'
      '       sum(ri.mass - ri.wb_mass) as rail_loss_minus,'
      
        '       sum(sum(ri.mass - ri.wb_mass))over (order by trunc(nvl(TF' +
        '.TR_DATE, T.TR_DATE))) as rail_loss_minus_agr'
      '  from P_TRANS T,'
      '       TRAN_REF TR,'
      '       TRANSFER TF,'
      '       V_PRODUCT P,'
      '       OIL_NP_GROUP NPG,'
      '       VM_OIL_NP_DOP_GROUP DG,'
      '       ACT_RAIL_ITEM RI'
      ' where TR.P_TRANS_ID = T.P_TRANS_ID'
      '   and TF.TRANSFER_ID = TR.TRANSFER_ID'
      '   and P.PRODUCT_ID = T.PRODUCT_ID'
      '   and npg.id = p.oil_npg_id'
      '   and dg.super_group_id(+) = 2'
      '   and dg.np_id(+) = p.oil_np_id'
      '   and T.p_trans_id = ri.p_trans'
      '   and tr_kind = 8'
      '   and T.TR_DATE >= (select max(date_on)'
      '                       from oil_rez_rest)'
      
        '   and trunc(nvl(TF.TR_DATE, T.TR_DATE)) between :BeginDate and ' +
        ':EndDate'
      ' group by trunc(nvl(TF.TR_DATE, T.TR_DATE)),'
      '          nvl(-dg.id, npg.id),'
      '          nvl(dg.name, npg.name),'
      '          decode(tr_kind,'
      '                 15,'
      '                 decode(credit_kind, 6, -1, 8, 1),'
      
        '                 decode(tr_kind, 7, 1, 8, 1, 4, -1, 9, -1, 10, -' +
        '1, 0)),'
      '          decode(tr_kind, 4, 1, 0),'
      '          decode(tr_kind, 15, 1, 0),'
      '          tr_kind'
      '   having nvl(-dg.id, npg.id) = :fuel_id')
    Left = 16
    Top = 104
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
        Name = 'fuel_id'
      end>
  end
end
