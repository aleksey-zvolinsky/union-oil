inherited AutoReportsForm: TAutoReportsForm
  Left = 318
  Top = 203
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 250
  ClientWidth = 314
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 208
    Width = 314
    Height = 42
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object PrintButton: TBitBtn
      Left = 120
      Top = 8
      Width = 91
      Height = 27
      Caption = #1055#1077#1095#1072#1090#1100
      Default = True
      TabOrder = 0
      OnClick = PrintButtonClick
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B004000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000
        000000000000000000000000000000000000000000000000000000C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6C6000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C00000000000000000000000000000000000000000
        00000000000000000000000000000000000000C6C6C6000000C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600FFFF
        00FFFF00FFFFC6C6C6C6C6C6000000000000000000C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C684848484848484
        8484C6C6C6C6C6C6000000C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000C6C6C6C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0000000C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000
        C6C6C6000000C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
        00000000000000000000000000000000000000000000000000C6C6C6000000C6
        C6C6000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C6C6000000C6C6
        C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF00
        0000000000000000000000000000FFFFFF000000000000000000000000C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF000000000000
        000000000000000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000000000000000000000
        00000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0}
    end
    object ExitButton: TBitBtn
      Left = 216
      Top = 8
      Width = 91
      Height = 27
      Cancel = True
      Caption = #1042#1099#1093#1086#1076
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 154
    Width = 314
    Height = 54
    Align = alClient
    Caption = #1055#1077#1088#1080#1086#1076
    TabOrder = 1
    object Label1: TLabel
      Left = 5
      Top = 16
      Width = 10
      Height = 13
      Caption = #1057':'
    end
    object Label2: TLabel
      Left = 160
      Top = 16
      Width = 17
      Height = 13
      Caption = #1055#1086':'
    end
    object DateEdit1: TDateEdit
      Left = 5
      Top = 29
      Width = 148
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 160
      Top = 29
      Width = 148
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 97
    Width = 314
    Height = 57
    Align = alTop
    Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
    TabOrder = 0
    object ComboEdit1: TComboEdit
      Left = 5
      Top = 21
      Width = 303
      Height = 21
      Hint = #1042' '#1101#1090#1086#1084' '#1087#1086#1083#1077' '#1091#1082#1072#1078#1080#1090#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1102' '#1076#1083#1103' '#1082#1086#1090#1086#1088#1086#1081' '#1089#1090#1088#1086#1080#1090#1089#1103' '#1086#1090#1095#1077#1090
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnButtonClick = ComboEdit1ButtonClick
      OnDblClick = ComboEdit1ButtonClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 314
    Height = 97
    Align = alTop
    Caption = #1042#1085#1080#1084#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label3: TLabel
      Left = 2
      Top = 15
      Width = 310
      Height = 80
      Align = alClient
      AutoSize = False
      Caption = 
        '   '#1044#1072#1085#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1073#1091#1076#1077#1090' '#1074#1099#1076#1072#1074#1072#1090#1100' '#1053#1045#1055#1054#1051#1053#1059#1070' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1087#1088#1080' '#1087#1086#1089#1090#1088#1086#1077#1085#1080 +
        #1080' '#1077#1075#1086' '#1085#1072' '#1092#1080#1083#1080#1072#1083#1077', '#1080#1079'-'#1079#1072' '#1086#1090#1089#1091#1090#1089#1090#1074#1080#1103' '#1085#1072' '#1092#1080#1083#1080'- '#1072#1083#1072#1093' '#1087#1086#1083#1085#1086#1081' '#1080#1085#1092#1086#1088#1084#1072#1094 +
        #1080#1080' '#1086' '#1079#1072#1087#1088#1072#1074#1082#1077' '#1058#1057' '#1087#1086' '#1090#1072#1083#1086#1085#1072#1084' '#1080' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1072#1084'.'#13#10'   '#1055#1086#1083#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080 +
        #1103' '#1073#1091#1076#1077#1090' '#1076#1086#1089#1090#1091#1087#1085#1072' '#1090#1086#1083#1100#1082#1086' '#1087#1088#1080' '#1087#1086#1089#1090#1088#1086#1077'- '#1085#1080#1080' '#1076#1072#1085#1085#1086#1075#1086' '#1086#1090#1095#1077#1090#1072' '#1074' '#1091#1087#1088#1072#1074#1083 +
        #1077#1085#1080#1080'.'
      WordWrap = True
    end
  end
  object QReport1: TOilQuery
    SQL.Strings = (
      'SELECT'
      ' A.GroupNumber, /* '#1085#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099' '#1090#1077#1093#1085#1080#1095#1077#1089#1082#1080#1093' '#1089#1088#1077#1076#1089#1090#1074' */'
      ' A.FillDate, /* '#1076#1072#1090#1072' '#1079#1072#1087#1088#1072#1074#1082#1080' */'
      ' A.AutoId, /* '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1084#1072#1096#1080#1085#1077' */'
      ' A.AutoModel,'
      ' A.AutoNumb,'
      ' A.Refuel_type_name, /* '#1090#1080#1087' '#1079#1072#1087#1088#1072#1074#1082#1080' */'
      ' A.PartyNumber, /* '#1085#1086#1084#1077#1088' '#1087#1072#1088#1090#1080#1080' */'
      ' A.DocNumber, /* '#1085#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' */'
      ' A.NPtypeID,  /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1053#1055' */'
      ' A.NPtypeName,  /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      ' A.GroupNPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1053#1055' */'
      ' A.GroupNPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1053#1055' */'
      ' A.Litr, /* '#1079#1072#1083#1080#1090#1086' '#1083#1080#1090#1088#1086#1074' */'
      ' A.Tonn, /* '#1079#1072#1083#1080#1090#1086' '#1090#1086#1085#1085' */'
      ' A.Price, /* '#1091#1095#1077#1090#1085#1072#1103' '#1094#1077#1085#1072' */'
      ' A.SumCost /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' */'
      'FROM'
      '   ('
      '    SELECT'
      
        '      refuel.auto_group_id AS GroupNumber, /* '#1085#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099' '#1090#1077#1093#1085#1080 +
        #1095#1077#1089#1082#1080#1093' '#1089#1088#1077#1076#1089#1090#1074' */'
      '      trunc(refuel.rep_date) AS FillDate, /* '#1076#1072#1090#1072' '#1079#1072#1087#1088#1072#1074#1082#1080' */'
      '      refuel.auto_id AutoId, /* '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1084#1072#1096#1080#1085#1077' */'
      
        '      decode(refuel.auto_type_id, 12, (refuel.f_name||'#39' '#39'||SUBST' +
        'R(refuel.i_name, 1, 1)||'#39'.'#39'||SUBSTR(refuel.o_name, 1, 1)||'#39'.'#39'), ' +
        'refuel.auto_model) AS AutoModel,'
      
        '      decode(refuel.auto_type_id, 12, '#39#1055#1086' '#1072#1082#1090#1091#39', refuel.auto_num' +
        'ber) AS AutoNumb,'
      '      refuel.refuel_type_name,'
      '      refuel.part AS PartyNumber, /* '#1085#1086#1084#1077#1088' '#1087#1072#1088#1090#1080#1080' */'
      '      refuel.card_number AS DocNumber, /* '#1085#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' */'
      '      refuel.nptype_id as NPtypeID,  /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1053#1055' */'
      '      refuel.nptype_name as NPtypeName,  /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      
        '      refuel.npgrp_id AS GroupNPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1053#1055 +
        ' */'
      '      refuel.np_name AS GroupNPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1053#1055' */'
      '      refuel.litr AS Litr, /* '#1079#1072#1083#1080#1090#1086' '#1083#1080#1090#1088#1086#1074' */'
      '      refuel.weight AS Tonn, /* '#1079#1072#1083#1080#1090#1086' '#1090#1086#1085#1085' */'
      '      refuel.price AS Price, /* '#1091#1095#1077#1090#1085#1072#1103' '#1094#1077#1085#1072' */'
      '      refuel.amount AS SumCost /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' */'
      '    FROM'
      '      v_oil_own_refuel refuel'
      '    WHERE'
      '          refuel.auto_inst = :FilialID /* 150 */'
      
        '      AND trunc(refuel.rep_date) >= :BeginDate /* TO_DATE('#39'01.08' +
        '.2001'#39', '#39'DD.MM.YYYY'#39') */'
      
        '      AND trunc(refuel.rep_date) <= :EndDate /* TO_DATE('#39'07.09.2' +
        '001'#39', '#39'DD.MM.YYYY'#39') */'
      '    ) A'
      'ORDER BY'
      ' A.GroupNumber,'
      ' A.AutoNumb,'
      ' A.AutoModel,'
      ' A.FillDate'
      '')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 9
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FilialID'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
        ParamType = ptInput
      end>
    object QReport1GROUPNUMBER: TFloatField
      FieldName = 'GROUPNUMBER'
    end
    object QReport1FILLDATE: TDateTimeField
      FieldName = 'FILLDATE'
    end
    object QReport1AUTOID: TFloatField
      FieldName = 'AUTOID'
    end
    object QReport1AUTOMODEL: TStringField
      FieldName = 'AUTOMODEL'
      Size = 55
    end
    object QReport1AUTONUMB: TStringField
      FieldName = 'AUTONUMB'
      Size = 12
    end
    object QReport1REFUEL_TYPE_NAME: TStringField
      FieldName = 'REFUEL_TYPE_NAME'
      Size = 13
    end
    object QReport1PARTYNUMBER: TStringField
      FieldName = 'PARTYNUMBER'
      Size = 15
    end
    object QReport1DOCNUMBER: TStringField
      FieldName = 'DOCNUMBER'
      Size = 44
    end
    object QReport1NPTYPEID: TFloatField
      FieldName = 'NPTYPEID'
    end
    object QReport1NPTYPENAME: TStringField
      FieldName = 'NPTYPENAME'
      Size = 50
    end
    object QReport1GROUPNPTYPE: TFloatField
      FieldName = 'GROUPNPTYPE'
    end
    object QReport1GROUPNPNAME: TStringField
      FieldName = 'GROUPNPNAME'
      Size = 50
    end
    object QReport1LITR: TFloatField
      FieldName = 'LITR'
    end
    object QReport1TONN: TFloatField
      FieldName = 'TONN'
    end
    object QReport1PRICE: TFloatField
      FieldName = 'PRICE'
    end
    object QReport1SUMCOST: TFloatField
      FieldName = 'SUMCOST'
    end
  end
  object qReport2: TOilQuery
    SQL.Strings = (
      'SELECT'
      ' A.AutoId,'
      ' A.AutoModel, /* '#1090#1080#1087' '#1084#1072#1096#1080#1085#1099' */'
      ' A.AutoNumb, /* '#1085#1086#1084#1077#1088' '#1084#1072#1096#1080#1085#1099' */'
      ' A.Date_, /* '#1076#1072#1090#1072' */'
      ' DECODE(MIN(A.WayBillNumb),'
      '        '#39#1103#1103#1103#1103#1103#1103#1103#1103#39', NULL,'
      
        '        MIN(A.WayBillNumb)) AS WayNumber, /* '#1085#1086#1084#1077#1088' '#1087#1091#1090#1077#1074#1086#1075#1086' '#1083#1080#1089#1090 +
        #1072' */'
      ' MAX(A.TTNNum) AS TTNNum,'
      ' A.NPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1053#1055' */'
      ' A.NPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1053#1055' */'
      ' SUM(A.RestAmount) AS RestAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1086#1089#1090#1072#1090#1082#1072' */'
      ' SUM(A.Rest) AS Rest, /* '#1086#1089#1090#1072#1090#1086#1082' '#1074' '#1083#1080#1090#1088#1072#1093' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' */'
      
        ' SUM(A.PrihodAmount) AS PrihodAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1088#1080#1093#1086#1076#1072' '#1079#1072' '#1076#1077 +
        #1085#1100' */'
      
        ' SUM(A.RashodAmount) AS RashodAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1088#1072#1089#1093#1086#1076#1072' '#1079#1072' '#1076#1077 +
        #1085#1100' */'
      ' SUM(A.Prihod) AS Prihod, /* '#1087#1088#1080#1093#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' '#1079#1072' '#1076#1077#1085#1100' */'
      ' SUM(A.Rashod) AS Rashod /* '#1088#1072#1089#1093#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' '#1079#1072' '#1076#1077#1085#1100' */'
      'FROM'
      '('
      '   /* '#1055#1088#1080#1093#1086#1076' '#1074' '#1073#1072#1082' */'
      '   SELECT'
      
        '    DECODE(SIGN(trunc(refuel.rep_date) - to_date(to_char(:BeginD' +
        'ate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY' +
        #39') */),'
      '           0, trunc(refuel.rep_date),'
      '           1, trunc(refuel.rep_date),'
      
        '          -1, to_date(to_char(:BeginDate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39')' +
        ' /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') */,'
      
        '           trunc(refuel.rep_date)) AS Date_, /* '#1076#1072#1090#1072' '#1087#1088#1080#1093#1086#1076#1072' ('#1087#1086 +
        ' '#1087#1086#1083#1102' '#1080#1076#1077#1090' '#1089#1074#1103#1079#1100') */'
      
        '    '#39#1103#1103#1103#1103#1103#1103#1103#1103#39' AS WayBillNumb, /* '#1095#1090#1086#1073#1099' '#1086#1090#1089#1077#1082#1072#1090#1100' '#1101#1090#1086' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1074' ' +
        #1075#1088#1091#1087#1086#1074#1086#1081' '#1092#1091#1085#1082#1094#1080#1080' */'
      '    0 AS TTNNum, /* '#1085#1086#1084#1077#1088' '#1090#1090#1085' */'
      '    refuel.npgrp_id AS NPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1053#1055' */'
      '    refuel.np_name AS NPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      
        '    DECODE(SIGN(trunc(refuel.rep_date) - to_date(to_char(:BeginD' +
        'ate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY' +
        #39') */),'
      '           0, 0,'
      '           1, 0,'
      '          -1, refuel.amount,'
      '           0) AS RestAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1086#1089#1090#1072#1090#1082#1072' */'
      
        '    DECODE(SIGN(trunc(refuel.rep_date) - to_date(to_char(:BeginD' +
        'ate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY' +
        #39') */),'
      '           0, 0,'
      '           1, 0,'
      '          -1, refuel.litr,'
      '           0) AS Rest, /* '#1086#1089#1090#1072#1090#1086#1082' */'
      
        '    DECODE(SIGN(trunc(refuel.rep_date) - to_date(to_char(:BeginD' +
        'ate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY' +
        #39')*/),'
      '           0, refuel.amount,'
      '           1, refuel.amount,'
      '          -1, 0,'
      '           0) AS PrihodAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1088#1080#1093#1086#1076#1072' */'
      '    0 AS RashodAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1088#1072#1089#1093#1086#1076#1072' */'
      
        '    DECODE(SIGN(trunc(refuel.rep_date) - to_date(to_char(:BeginD' +
        'ate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY' +
        #39')*/),'
      '           0, refuel.litr,'
      '           1, refuel.litr,'
      '          -1, 0,'
      '           0) AS Prihod, /* '#1087#1088#1080#1093#1086#1076' '#1079#1072' '#1076#1077#1085#1100'*/'
      '    0 AS Rashod, /* '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1076#1077#1085#1100' */'
      '    refuel.auto_id AutoId, /* '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1084#1072#1096#1080#1085#1077' */'
      
        '    decode(refuel.auto_type_id, 12, refuel.f_name||'#39' '#39'||SUBSTR(r' +
        'efuel.i_name, 1, 1)||'#39'.'#39'||SUBSTR(refuel.o_name, 1, 1)||'#39'.'#39', refu' +
        'el.auto_model) AS AutoModel,'
      
        '    decode(refuel.auto_type_id, 12, '#39#1055#1086' '#1072#1082#1090#1091#39', refuel.auto_numbe' +
        'r) AS AutoNumb'
      '   FROM'
      '    v_oil_own_refuel refuel'
      '   WHERE'
      '       refuel.auto_inst = :FilialID /* 150 */'
      '   AND refuel.auto_group_id = :AutoGroup /* IN(2,3) */'
      
        '   AND trunc(refuel.rep_date) <= :EndDate /* trunc('#39'06.09.2001'#39',' +
        ' '#39'DD.MM.YYYY'#39') */'
      ''
      '   UNION ALL'
      ''
      '   /* '#1056#1072#1089#1093#1086#1076' '#1080#1079' '#1073#1072#1082#1086#1074' */'
      '   SELECT '
      
        '    DECODE(SIGN(trunc(tank.date_) - to_date(to_char(:BeginDate,'#39 +
        'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') */' +
        '),'
      '           0, trunc(tank.date_),'
      '           1, trunc(tank.date_),'
      
        '          -1, to_date(to_char(:BeginDate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39')' +
        ', /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') */'
      
        '           trunc(tank.date_)) AS Date_, /* '#1076#1072#1090#1072' '#1087#1091#1090#1077#1074#1086#1075#1086' '#1083#1080#1089#1090#1072' (' +
        #1087#1086' '#1087#1086#1083#1102' '#1080#1076#1077#1090' '#1089#1074#1103#1079#1100') */'
      
        '    DECODE(SIGN(trunc(tank.date_) - to_date(to_char(:BeginDate,'#39 +
        'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /*TO_DATE('#39'08.09.2001'#39', '#39'DD.MM.YYYY'#39')*/),'
      '           0, tank.waybillnumb,'
      '           1, tank.waybillnumb,'
      '          -1, '#39#1103#1103#1103#1103#1103#1103#1103#1103#39','
      
        '           '#39#1103#1103#1103#1103#1103#1103#1103#1103#39') AS WayBillNumb, /* '#1085#1086#1084#1077#1088' '#1087#1091#1090#1077#1074#1086#1075#1086' '#1083#1080#1089#1090#1072' *' +
        '/'
      '    0, /* '#1085#1086#1084#1077#1088' '#1090#1090#1085' */'
      '    tank.nptype AS NPType, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1053#1055' */'
      '    tank.npname AS NPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      
        '    DECODE(SIGN(trunc(tank.date_) - to_date(to_char(:BeginDate,'#39 +
        'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') */' +
        '),'
      '           0, 0,'
      '           1, 0,'
      '          -1, -tank.amount,'
      '           0) AS RestAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1086#1089#1090#1072#1090#1082#1072' */'
      
        '    DECODE(SIGN(trunc(tank.date_) - to_date(to_char(:BeginDate,'#39 +
        'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') */' +
        '),'
      '           0, 0,'
      '           1, 0,'
      '          -1, -tank.litr,'
      '           0) AS Rest, /* '#1086#1089#1090#1072#1090#1086#1082' */'
      '    0 AS PrihodAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1088#1080#1093#1086#1076#1072' '#1079#1072' '#1076#1077#1085#1100' */'
      
        '    DECODE(SIGN(trunc(tank.date_) - to_date(to_char(:BeginDate,'#39 +
        'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') */' +
        '),'
      '           0, tank.amount,'
      '           1, tank.amount,'
      '          -1, 0,'
      '           0) AS RashodAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1088#1072#1089#1093#1086#1076#1072' '#1079#1072' '#1076#1077#1085#1100' */'
      '    0 AS Prihod, /* '#1087#1088#1080#1093#1086#1076' '#1079#1072' '#1076#1077#1085#1100' */'
      
        '    DECODE(SIGN(trunc(tank.date_) - to_date(to_char(:BeginDate,'#39 +
        'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') */' +
        '),'
      '           0, tank.litr,'
      '           1, tank.litr,'
      '          -1, 0,'
      '           0) AS Rashod, /* '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1076#1077#1085#1100' */'
      '    tank.auto_id AS AutoId, /* '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1084#1072#1096#1080#1085#1077' */'
      
        '    decode(a.auto_type_id, 12, tank.f_name||'#39' '#39'||SUBSTR(tank.i_n' +
        'ame, 1, 1)||'#39'.'#39'||SUBSTR(tank.o_name, 1, 1)||'#39'.'#39', tank.auto_model' +
        ') AS AutoModel,'
      '    decode(a.auto_type_id, 12, '#39#1055#1086' '#1072#1082#1090#1091#39', tank.numb) AS AutoNumb'
      '   FROM'
      '    v_own_tank tank,'
      '    oil_auto a'
      '   WHERE'
      '       tank.auto_inst = :FilialID /* 150 */'
      '   AND tank.auto_inst = a.inst'
      '   AND tank.auto_id = a.id'
      '   AND tank.auto_group_id = :AutoGroup /* IN(2,3) */'
      
        '   AND trunc(tank.date_) <= :EndDate /* TO_DATE('#39'06.09.2001'#39', '#39'D' +
        'D.MM.YYYY'#39') */'
      ') A'
      'GROUP BY'
      ' A.AutoId,'
      ' A.AutoModel,'
      ' A.AutoNumb,'
      ' A.Date_,'
      ' A.NPtype,'
      ' A.NPName'
      'HAVING'
      
        ' (NVL(SUM(A.REST), 0) + NVL(SUM(A.PRIHOD), 0) + NVL(SUM(A.RASHOD' +
        '), 0)) <> 0'
      ' ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 44
    Top = 120
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FilialID'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'AutoGroup'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
        ParamType = ptInput
      end>
    object qReport2AUTOID: TFloatField
      FieldName = 'AUTOID'
    end
    object qReport2AUTOMODEL: TStringField
      FieldName = 'AUTOMODEL'
      Size = 55
    end
    object qReport2AUTONUMB: TStringField
      FieldName = 'AUTONUMB'
      Size = 12
    end
    object qReport2DATE_: TDateTimeField
      FieldName = 'DATE_'
    end
    object qReport2WAYNUMBER: TStringField
      FieldName = 'WAYNUMBER'
      Size = 100
    end
    object qReport2TTNNUM: TFloatField
      FieldName = 'TTNNUM'
    end
    object qReport2NPTYPE: TFloatField
      FieldName = 'NPTYPE'
    end
    object qReport2NPNAME: TStringField
      FieldName = 'NPNAME'
      Size = 50
    end
    object qReport2RESTAMOUNT: TFloatField
      FieldName = 'RESTAMOUNT'
    end
    object qReport2REST: TFloatField
      FieldName = 'REST'
    end
    object qReport2PRIHODAMOUNT: TFloatField
      FieldName = 'PRIHODAMOUNT'
    end
    object qReport2RASHODAMOUNT: TFloatField
      FieldName = 'RASHODAMOUNT'
    end
    object qReport2PRIHOD: TFloatField
      FieldName = 'PRIHOD'
    end
    object qReport2RASHOD: TFloatField
      FieldName = 'RASHOD'
    end
  end
  object QReport6: TOilQuery
    SQL.Strings = (
      'SELECT'
      ' A.FilialID,'
      ' A.FilialName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1080#1072#1083#1072' */'
      ' A.GroupNumber,  /* '#1085#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099' */'
      ' A.NPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1053#1055' */'
      ' A.NPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      ' SUM(A.RestAmount) AS RestAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1086#1089#1090#1072#1090#1082#1072' */'
      ' SUM(A.RestLitres) AS RestLitres, /* '#1086#1089#1090#1072#1090#1086#1082' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      ' SUM(A.RestTonns) AS RestTonns, /* '#1086#1089#1090#1072#1090#1086#1082' '#1074' '#1090#1086#1085#1085#1072#1093' */'
      
        ' SUM(A.PrihodAmount) AS PrihodAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1088#1080#1093#1086#1076#1072' '#1079#1072' '#1087#1077 +
        #1088#1080#1086#1076' */'
      
        ' SUM(A.PrihodLitres) AS PrihodLitres, /* '#1087#1088#1080#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1083#1080#1090#1088 +
        #1072#1093' */'
      
        ' SUM(A.PrihodTonns) AS PrihodTonns, /* '#1087#1088#1080#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1090#1086#1085#1085#1072#1093 +
        ' */'
      
        ' SUM(A.RashodAmount) AS RashodAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1087#1077#1088 +
        #1086#1080#1076' */ '
      
        ' SUM(A.RashodLitres) AS RashodLitres, /* '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1083#1080#1090#1088 +
        #1072#1093' */'
      
        ' SUM(A.RashodTonns) AS RashodTonns /* '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1090#1086#1085#1085#1072#1093' ' +
        '*/'
      'FROM'
      '('
      '   /* '#1055#1088#1080#1093#1086#1076' '#1074' '#1073#1072#1082'*/'
      '   SELECT'
      '    org.id AS FilialID, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1092#1080#1083#1080#1072#1083#1072' */'
      '    org.name AS FilialName,  /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1080#1072#1083#1072' */'
      '    refuel.auto_group_id AS GroupNumber, /* '#1085#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099' */'
      '    refuel.npgrp_id AS NPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1053#1055' */'
      '    refuel.np_name AS NPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      
        '    DECODE(SIGN(trunc(refuel.rep_date) - to_date(to_char(:BeginD' +
        'ate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /*TO_DATE('#39'01.08.2001'#39', '#39'DD.MM.YYYY'#39 +
        ')*/),'
      '           0, 0,'
      '           1, 0,'
      '          -1, refuel.amount,'
      '           0) AS RestAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1086#1089#1090#1072#1090#1082#1072' */'
      
        '    DECODE(SIGN(trunc(refuel.rep_date) - to_date(to_char(:BeginD' +
        'ate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /*TO_DATE('#39'01.08.2001'#39', '#39'DD.MM.YYYY'#39 +
        ')*/),'
      '           0, 0,'
      '           1, 0,'
      '          -1, refuel.litr,'
      '           0) AS RestLitres, /* '#1086#1089#1090#1072#1090#1086#1082' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      
        '    DECODE(SIGN(trunc(refuel.rep_date) - to_date(to_char(:BeginD' +
        'ate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /*TO_DATE('#39'01.08.2001'#39', '#39'DD.MM.YYYY'#39 +
        ')*/),'
      '           0, 0,'
      '           1, 0,'
      '          -1, refuel.weight,'
      '           0) AS RestTonns, /* '#1086#1089#1090#1072#1090#1086#1082' '#1074' '#1090#1086#1085#1085#1072#1093' */'
      
        '    DECODE(SIGN(trunc(refuel.rep_date) - to_date(to_char(:BeginD' +
        'ate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /*TO_DATE('#39'01.08.2001'#39', '#39'DD.MM.YYYY'#39 +
        ')*/),'
      '           0, refuel.amount,'
      '           1, refuel.amount,'
      '          -1, 0,'
      '           0) AS PrihodAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1088#1080#1093#1086#1076#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076' */'
      
        '    DECODE(SIGN(trunc(refuel.rep_date) - to_date(to_char(:BeginD' +
        'ate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /*TO_DATE('#39'01.08.2001'#39', '#39'DD.MM.YYYY'#39 +
        ')*/),'
      '           0, refuel.litr,'
      '           1, refuel.litr,'
      '          -1, 0,'
      '           0) AS PrihodLitres, /* '#1087#1088#1080#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      
        '    DECODE(SIGN(trunc(refuel.rep_date) - to_date(to_char(:BeginD' +
        'ate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /*TO_DATE('#39'01.08.2001'#39', '#39'DD.MM.YYYY'#39 +
        ')*/),'
      '           0, refuel.weight,'
      '           1, refuel.weight,'
      '          -1, 0,'
      '           0) AS PrihodTonns, /* '#1087#1088#1080#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1090#1086#1085#1085#1072#1093' */'
      '    0 AS RashodAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1088#1072#1089#1093#1086#1076#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076' */'
      '    0 AS RashodLitres, /* '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      '    0 AS RashodTonns /* '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1090#1086#1085#1085#1072#1093' */      '
      '   FROM'
      '    ('
      '     SELECT Id, Inst, Name'
      '     FROM v_org'
      '     WHERE Id = :DepId /* 12 */'
      '      AND Inst = :DepInst /* 12 */'
      ''
      '     UNION ALL'
      ''
      '     SELECT par, par_inst, par_name'
      '     FROM v_oil_org_norek'
      '     WHERE Id = :DepId /* 12 */'
      '      AND Inst = :DepInst /* 12 */'
      ''
      '     UNION ALL'
      ''
      '     SELECT Id, Inst, Name'
      '     FROM v_org'
      '     WHERE Par = :DepId /* 12 */'
      '      AND Par_Inst = :DepInst /* 12 */'
      '    ) org,'
      '    v_oil_own_refuel refuel'
      '   WHERE'
      '       refuel.auto_inst = org.id'
      '   AND refuel.auto_inst = org.inst'
      
        '   AND trunc(refuel.rep_date) <= :EndDate /*TO_DATE('#39'01.10.2001'#39 +
        ', '#39'DD.MM.YYYY'#39')*/'
      ''
      '   UNION ALL'
      ''
      '   /* '#1056#1072#1089#1093#1086#1076' '#1080#1079' '#1073#1072#1082#1086#1074' */'
      '   SELECT '
      '    org.id AS FilialID, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1092#1080#1083#1080#1072#1083#1072' */'
      '    org.name AS FilialName,  /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1080#1072#1083#1072' */'
      '    tank.auto_group_id AS GroupNumber, /* '#1085#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099' */'
      '    tank.nptype AS NPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1053#1055' */'
      '    tank.npname AS NPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      
        '    DECODE(SIGN(trunc(tank.date_) - to_date(to_char(:BeginDate,'#39 +
        'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') */' +
        '),'
      '           0, 0,'
      '           1, 0,'
      '          -1, -tank.amount,'
      '           0) AS RestAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1086#1089#1090#1072#1090#1082#1072' */'
      
        '    DECODE(SIGN(trunc(tank.date_) - to_date(to_char(:BeginDate,'#39 +
        'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') */' +
        '),'
      '           0, 0,'
      '           1, 0,'
      '          -1, -tank.litr,'
      '           0) AS RestLitres, /* '#1086#1089#1090#1072#1090#1086#1082' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      
        '    DECODE(SIGN(trunc(tank.date_) - to_date(to_char(:BeginDate,'#39 +
        'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') */' +
        '),'
      '           0, 0,'
      '           1, 0,'
      '          -1, -tank.weight,'
      '           0) AS RestTonns, /* '#1086#1089#1090#1072#1090#1086#1082' '#1074' '#1090#1086#1085#1085#1072#1093' */'
      '    0 AS PrihodAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1088#1080#1093#1086#1076#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076' */'
      '    0 AS PrihodLitres, /* '#1087#1088#1080#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      '    0 AS PrihodTonns, /* '#1087#1088#1080#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1090#1086#1085#1085#1072#1093' */'
      
        '    DECODE(SIGN(trunc(tank.date_) - to_date(to_char(:BeginDate,'#39 +
        'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') */' +
        '),'
      '           0, tank.amount,'
      '           1, tank.amount,'
      '          -1, 0,'
      '           0) AS RashodAmount, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1088#1072#1089#1093#1086#1076#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076' */'
      
        '    DECODE(SIGN(trunc(tank.date_) - to_date(to_char(:BeginDate,'#39 +
        'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') */' +
        '),'
      '           0, tank.litr,'
      '           1, tank.litr,'
      '          -1, 0,'
      '           0) AS RashodLitres, /* '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      
        '    DECODE(SIGN(trunc(tank.date_) - to_date(to_char(:BeginDate,'#39 +
        'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') */' +
        '),'
      '           0, tank.weight,'
      '           1, tank.weight,'
      '          -1, 0,'
      '           0) AS Rashod /* '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1090#1086#1085#1085#1072#1093' */'
      '   FROM'
      '    ('
      '     SELECT Id, Inst, Name'
      '     FROM v_org'
      '     WHERE Id = :DepId /* 12 */'
      '     AND Inst = :DepInst /* 12 */'
      ''
      '     UNION ALL'
      ''
      '     SELECT par, par_inst, par_name'
      '     FROM v_oil_org_norek'
      '     WHERE Id = :DepId /* 12 */'
      '     AND Inst = :DepInst /* 12 */'
      ''
      '     UNION ALL'
      ''
      '     SELECT Id, Inst, Name'
      '     FROM v_org'
      '     WHERE Par = :DepId /* 12 */'
      '     AND Par_Inst = :DepInst /* 12 */'
      '    ) org,'
      '    v_own_tank tank'
      '   WHERE'
      '       tank.auto_inst = org.id '
      '   AND tank.auto_inst = org.inst '
      
        '   AND tank.date_ <= :EndDate /* TO_DATE('#39'06.09.2001'#39', '#39'DD.MM.YY' +
        'YY'#39') */'
      ') A'
      'GROUP BY'
      ' A.FilialName,'
      ' A.FilialID,'
      ' A.GroupNumber,'
      ' A.NPName,'
      ' A.NPtype'
      'HAVING'
      
        ' (NVL(SUM(A.Restlitres), 0) + NVL(SUM(A.PrihodLitres), 0) + NVL(' +
        'SUM(A.RashodLitres), 0)) <> 0'
      '')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 80
    Top = 121
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DepId'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
        ParamType = ptInput
      end>
    object QReport6FILIALID: TFloatField
      FieldName = 'FILIALID'
    end
    object QReport6FILIALNAME: TStringField
      FieldName = 'FILIALNAME'
      Size = 100
    end
    object QReport6GROUPNUMBER: TFloatField
      FieldName = 'GROUPNUMBER'
    end
    object QReport6NPTYPE: TFloatField
      FieldName = 'NPTYPE'
    end
    object QReport6NPNAME: TStringField
      FieldName = 'NPNAME'
      Size = 50
    end
    object QReport6RESTAMOUNT: TFloatField
      FieldName = 'RESTAMOUNT'
    end
    object QReport6RESTLITRES: TFloatField
      FieldName = 'RESTLITRES'
    end
    object QReport6RESTTONNS: TFloatField
      FieldName = 'RESTTONNS'
    end
    object QReport6PRIHODAMOUNT: TFloatField
      FieldName = 'PRIHODAMOUNT'
    end
    object QReport6PRIHODLITRES: TFloatField
      FieldName = 'PRIHODLITRES'
    end
    object QReport6PRIHODTONNS: TFloatField
      FieldName = 'PRIHODTONNS'
    end
    object QReport6RASHODAMOUNT: TFloatField
      FieldName = 'RASHODAMOUNT'
    end
    object QReport6RASHODLITRES: TFloatField
      FieldName = 'RASHODLITRES'
    end
    object QReport6RASHODTONNS: TFloatField
      FieldName = 'RASHODTONNS'
    end
  end
  object qReport7: TOilQuery
    SQL.Strings = (
      'SELECT'
      ' A.FilialID,'
      ' A.FilialName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1080#1072#1083#1072' */'
      ' A.NPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1053#1055' */'
      ' A.NPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      
        ' SUM(A.RASH_t_1) AS RASH_t_1, /* '#1088#1072#1089#1093#1086#1076#1099' '#1074' '#1090#1086#1085#1085#1072#1093' '#1087#1086' '#1087#1077#1088#1074#1086#1081' '#1086#1087#1077#1088 +
        #1072#1094#1080#1080' */'
      
        ' SUM(A.RASH_lt_1) AS RASH_lt_1, /* '#1088#1072#1089#1093#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' '#1087#1086' '#1087#1077#1088#1074#1086#1081' '#1086#1087#1077 +
        #1088#1072#1094#1080#1080' */'
      ' SUM(A.COST_1) AS COST_1, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086' '#1087#1077#1088#1074#1086#1081' '#1086#1087#1077#1088#1072#1094#1080#1080' */'
      
        ' SUM(A.RASH_t_2) AS RASH_t_2, /* '#1088#1072#1089#1093#1086#1076#1099' '#1074' '#1090#1086#1085#1085#1072#1093' '#1087#1086' '#1074#1090#1086#1088#1086#1081' '#1086#1087#1077#1088 +
        #1072#1094#1080#1080' */'
      
        ' SUM(A.RASH_lt_2) AS RASH_lt_2, /* '#1088#1072#1089#1093#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' '#1087#1086' '#1074#1090#1086#1088#1086#1081' '#1086#1087#1077 +
        #1088#1072#1094#1080#1080' */'
      ' SUM(A.COST_2) AS COST_2, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086' '#1074#1090#1086#1088#1086#1081' '#1086#1087#1077#1088#1072#1094#1080#1080' */'
      
        ' SUM(A.RASH_t_3) AS RASH_t_3, /* '#1088#1072#1089#1093#1086#1076#1099' '#1074' '#1090#1086#1085#1085#1072#1093' '#1087#1086' '#1090#1088#1077#1090#1100#1077#1081' '#1086#1087#1077 +
        #1088#1072#1094#1080#1080' */'
      
        ' SUM(A.RASH_lt_3) AS RASH_lt_3, /* '#1088#1072#1089#1093#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' '#1087#1086' '#1090#1088#1077#1090#1100#1077#1081' '#1086#1087 +
        #1077#1088#1072#1094#1080#1080' */'
      ' SUM(A.COST_3) AS COST_3, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086' '#1090#1088#1077#1090#1100#1077#1081' '#1086#1087#1077#1088#1072#1094#1080#1080' */'
      
        ' SUM(A.RASH_t_4) AS RASH_t_4, /* '#1088#1072#1089#1093#1086#1076#1099' '#1074' '#1090#1086#1085#1085#1072#1093' '#1087#1086' '#1095#1077#1090#1074#1077#1088#1090#1086#1081' '#1086 +
        #1087#1077#1088#1072#1094#1080#1080' */'
      
        ' SUM(A.RASH_lt_4) AS RASH_lt_4, /* '#1088#1072#1089#1093#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' '#1087#1086' '#1095#1077#1090#1074#1077#1088#1090#1086#1081' ' +
        #1086#1087#1077#1088#1072#1094#1080#1080' */'
      ' SUM(A.COST_4) AS COST_4 /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086' '#1095#1077#1090#1074#1077#1088#1090#1086#1081' '#1086#1087#1077#1088#1072#1094#1080#1080' */'
      'FROM'
      '  ('
      '   SELECT'
      '     org.id AS FilialID, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1092#1080#1083#1080#1072#1083#1072' */'
      '     org.name AS FilialName,  /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1080#1072#1083#1072' */'
      '     tank.nptype AS NPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1053#1055' */'
      '     tank.npname AS NPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      '     DECODE(tank.auto_oper_id,'
      '            2, tank.weight,'
      
        '            0) AS RASH_t_1, /* '#1088#1072#1089#1093#1086#1076#1099' '#1074' '#1090#1086#1085#1085#1072#1093' '#1087#1086' '#1087#1077#1088#1074#1086#1081' '#1086#1087#1077#1088#1072#1094 +
        #1080#1080' */'
      '     DECODE(tank.auto_oper_id,'
      '            2, tank.litr,'
      
        '            0) AS RASH_lt_1, /* '#1088#1072#1089#1093#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' '#1087#1086' '#1087#1077#1088#1074#1086#1081' '#1086#1087#1077#1088#1072#1094 +
        #1080#1080' */'
      '     DECODE(tank.auto_oper_id,'
      '            2, tank.amount,'
      '            0) AS COST_1, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086' '#1087#1077#1088#1074#1086#1081' '#1086#1087#1077#1088#1072#1094#1080#1080' */'
      '     DECODE(tank.auto_oper_id,'
      '            3, tank.weight,'
      
        '            0) AS RASH_t_2, /* '#1088#1072#1089#1093#1086#1076#1099' '#1074' '#1090#1086#1085#1085#1072#1093' '#1087#1086' '#1074#1090#1086#1088#1086#1081' '#1086#1087#1077#1088#1072#1094 +
        #1080#1080' */'
      '     DECODE(tank.auto_oper_id,'
      '            3, tank.litr,'
      
        '            0) AS RASH_lt_2, /* '#1088#1072#1089#1093#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' '#1087#1086' '#1074#1090#1086#1088#1086#1081' '#1086#1087#1077#1088#1072#1094 +
        #1080#1080' */'
      '     DECODE(tank.auto_oper_id,'
      '            3, tank.amount,'
      '            0) AS COST_2, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086' '#1074#1090#1086#1088#1086#1081' '#1086#1087#1077#1088#1072#1094#1080#1080' */'
      '     DECODE(tank.auto_oper_id,'
      '            4, tank.weight,'
      
        '            0) AS RASH_t_3, /* '#1088#1072#1089#1093#1086#1076#1099' '#1074' '#1090#1086#1085#1085#1072#1093' '#1087#1086' '#1090#1088#1077#1090#1100#1077#1081' '#1086#1087#1077#1088#1072 +
        #1094#1080#1080' */'
      '     DECODE(tank.auto_oper_id,'
      '            4, tank.litr,'
      
        '            0) AS RASH_lt_3, /* '#1088#1072#1089#1093#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' '#1087#1086' '#1090#1088#1077#1090#1100#1077#1081' '#1086#1087#1077#1088#1072 +
        #1094#1080#1080' */'
      '     DECODE(tank.auto_oper_id,'
      '            4, tank.amount,'
      '            0) AS COST_3, /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086' '#1090#1088#1077#1090#1100#1077#1081' '#1086#1087#1077#1088#1072#1094#1080#1080' */'
      '     DECODE(tank.auto_oper_id,'
      '            5, tank.weight,'
      
        '            0) AS RASH_t_4, /* '#1088#1072#1089#1093#1086#1076#1099' '#1074' '#1090#1086#1085#1085#1072#1093' '#1087#1086' '#1095#1077#1090#1074#1077#1088#1090#1086#1081' '#1086#1087#1077 +
        #1088#1072#1094#1080#1080' */'
      '     DECODE(tank.auto_oper_id,'
      '            5, tank.litr,'
      
        '            0) AS RASH_lt_4, /* '#1088#1072#1089#1093#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' '#1087#1086' '#1095#1077#1090#1074#1077#1088#1090#1086#1081' '#1086#1087#1077 +
        #1088#1072#1094#1080#1080' */'
      '     DECODE(tank.auto_oper_id,'
      '            5, tank.amount,'
      '            0) AS COST_4 /* '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086' '#1095#1077#1090#1074#1077#1088#1090#1086#1081' '#1086#1087#1077#1088#1072#1094#1080#1080' */'
      '   FROM'
      '     ('
      '      SELECT Id, Inst, Name'
      '      FROM v_org'
      '      WHERE Id = :DepId /* 12 */'
      '      AND Inst = :DepInst /* 12 */'
      ''
      '      UNION ALL'
      ''
      '      SELECT par, par_inst, par_name'
      '      FROM v_oil_org_norek'
      '      WHERE Id = :DepId /* 12 */'
      '      AND Inst = :DepInst /* 12 */   '
      ''
      '      UNION ALL'
      '   '
      '      SELECT Id, Inst, Name'
      '      FROM v_org'
      '      WHERE Par = :DepId /* 12 */'
      '      AND Par_Inst = :DepInst /* 12 */'
      '     ) org,'
      '     v_own_tank tank'
      '   WHERE'
      '         tank.auto_inst = org.id '
      '     AND tank.auto_inst = org.inst '
      '     AND tank.auto_group_id = 2 /* '#1073#1077#1088#1077#1084' '#1090#1086#1083#1100#1082#1086' '#1074#1090#1086#1088#1091#1102' '#1075#1088#1091#1087#1087#1091' */'
      
        '     AND tank.date_ >= :BeginDate /* TO_DATE('#39'06.09.2001'#39', '#39'DD.M' +
        'M.YYYY'#39') */'
      
        '     AND tank.date_ <= :EndDate /* TO_DATE('#39'06.09.2001'#39', '#39'DD.MM.' +
        'YYYY'#39') */'
      '  ) A   '
      'GROUP BY'
      '  A.FilialName,'
      '  A.FilialID,'
      '  A.NPName,'
      '  A.NPtype'
      'HAVING'
      '  (NVL(SUM(A.RASH_lt_1), 0) + NVL(SUM(A.RASH_lt_2), 0) +'
      '   NVL(SUM(A.RASH_lt_3), 0) + NVL(SUM(A.RASH_lt_4), 0)) <> 0'
      '')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 116
    Top = 121
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DepId'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DepInst'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
        ParamType = ptInput
      end>
    object qReport7FILIALID: TFloatField
      FieldName = 'FILIALID'
    end
    object qReport7FILIALNAME: TStringField
      FieldName = 'FILIALNAME'
      Size = 100
    end
    object qReport7NPTYPE: TFloatField
      FieldName = 'NPTYPE'
    end
    object qReport7NPNAME: TStringField
      FieldName = 'NPNAME'
      Size = 50
    end
    object qReport7RASH_T_1: TFloatField
      FieldName = 'RASH_T_1'
    end
    object qReport7RASH_LT_1: TFloatField
      FieldName = 'RASH_LT_1'
    end
    object qReport7COST_1: TFloatField
      FieldName = 'COST_1'
    end
    object qReport7RASH_T_2: TFloatField
      FieldName = 'RASH_T_2'
    end
    object qReport7RASH_LT_2: TFloatField
      FieldName = 'RASH_LT_2'
    end
    object qReport7COST_2: TFloatField
      FieldName = 'COST_2'
    end
    object qReport7RASH_T_3: TFloatField
      FieldName = 'RASH_T_3'
    end
    object qReport7RASH_LT_3: TFloatField
      FieldName = 'RASH_LT_3'
    end
    object qReport7COST_3: TFloatField
      FieldName = 'COST_3'
    end
    object qReport7RASH_T_4: TFloatField
      FieldName = 'RASH_T_4'
    end
    object qReport7RASH_LT_4: TFloatField
      FieldName = 'RASH_LT_4'
    end
    object qReport7COST_4: TFloatField
      FieldName = 'COST_4'
    end
  end
  object qVerify: TOilQuery
    SQL.Strings = (
      'SELECT'
      ' SUM(D) AS C'
      'FROM'
      ' (SELECT'
      
        '   UPPER(replace(translate(numb,'#39' `~!@$%^&*()_+-=\|/?{}[];"<>,.:' +
        #39','#39'###############################'#39'),'#39'#'#39')),'
      
        '   COUNT(UPPER(replace(translate(numb,'#39' `~!@$%^&*()_+-=\|/?{}[];' +
        '"<>,.:'#39','#39'###############################'#39'),'#39'#'#39'))) AS D'
      '  FROM'
      '   oil_auto'
      '  WHERE'
      '   state='#39'Y'#39
      '  GROUP BY'
      
        '   UPPER(replace(translate(numb,'#39' `~!@$%^&*()_+-=\|/?{}[];"<>,.:' +
        #39','#39'###############################'#39'),'#39'#'#39'))'
      '  HAVING'
      
        '   COUNT(UPPER(replace(translate(numb,'#39' `~!@$%^&*()_+-=\|/?{}[];' +
        '"<>,.:'#39','#39'###############################'#39'),'#39'#'#39'))) > 1'
      ' )'
      'WHERE D > 1'
      ''
      '')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 232
    Top = 121
    object qVerifyC: TFloatField
      FieldName = 'C'
    end
  end
  object qReport8: TOilQuery
    SQL.Strings = (
      'SELECT'
      ' A.AutoId,'
      ' A.AutoModel, /* '#1090#1080#1087' '#1084#1072#1096#1080#1085#1099' */'
      ' A.AutoNumb, /* '#1085#1086#1084#1077#1088' '#1084#1072#1096#1080#1085#1099' */'
      ' A.GroupNumber,  /* '#1085#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099' */'
      ' A.NPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1053#1055' */'
      ' A.NPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      ' SUM(A.RestLitres) AS RestLitres, /* '#1086#1089#1090#1072#1090#1086#1082' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      
        ' SUM(A.PrihodLitres) AS PrihodLitres, /* '#1087#1088#1080#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1083#1080#1090#1088 +
        #1072#1093' */'
      
        ' SUM(A.RashodLitres) AS RashodLitres /* '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1083#1080#1090#1088#1072 +
        #1093' */'
      'FROM'
      '('
      '   /* '#1055#1088#1080#1093#1086#1076' '#1074' '#1073#1072#1082'*/'
      '   SELECT'
      '    refuel.auto_id AS AutoId, /* '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1084#1072#1096#1080#1085#1077' */'
      
        '    decode(refuel.auto_type_id, 12, refuel.f_name||'#39' '#39'||SUBSTR(r' +
        'efuel.i_name, 1, 1)||'#39'.'#39'||SUBSTR(refuel.o_name, 1, 1)||'#39'.'#39', refu' +
        'el.auto_model) AS AutoModel,'
      
        '    decode(refuel.auto_type_id, 12, '#39#1055#1086' '#1072#1082#1090#1091#39', refuel.auto_numbe' +
        'r) AS AutoNumb,'
      '    refuel.auto_group_id AS GroupNumber, /* '#1085#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099' */'
      '    refuel.npgrp_id AS NPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1053#1055' */'
      '    refuel.np_name AS NPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      
        '    DECODE(SIGN(trunc(refuel.rep_date) - to_date(to_char(:BeginD' +
        'ate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /*TO_DATE('#39'01.08.2001'#39', '#39'DD.MM.YYYY'#39 +
        ')*/),'
      '           0, 0,'
      '           1, 0,'
      '          -1, refuel.litr,'
      '           0) AS RestLitres, /* '#1086#1089#1090#1072#1090#1086#1082' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      
        '    DECODE(SIGN(trunc(refuel.rep_date) - to_date(to_char(:BeginD' +
        'ate,'#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /*TO_DATE('#39'01.08.2001'#39', '#39'DD.MM.YYYY'#39 +
        ')*/),'
      '           0, refuel.litr,'
      '           1, refuel.litr,'
      '          -1, 0,'
      '           0) AS PrihodLitres, /* '#1087#1088#1080#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      '    0 AS RashodLitres /* '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      '   FROM'
      '       v_oil_own_refuel_filial refuel'
      '   WHERE'
      '       refuel.auto_inst = :FilialID /* 150 */'
      
        '   AND trunc(refuel.rep_date) <= :EndDate /*TO_DATE('#39'01.10.2001'#39 +
        ', '#39'DD.MM.YYYY'#39')*/'
      ''
      '   UNION ALL'
      ''
      '   /* '#1056#1072#1089#1093#1086#1076' '#1080#1079' '#1073#1072#1082#1086#1074' */'
      '   SELECT'
      '    auto.id AS AutoId, /* '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1084#1072#1096#1080#1085#1077' */'
      
        '    decode(auto.auto_type_id, 12, employ.f_name||'#39' '#39'||SUBSTR(emp' +
        'loy.i_name, 1, 1)||'#39'.'#39'||SUBSTR(employ.o_name, 1, 1)||'#39'.'#39', auto.a' +
        'uto_model) AS AutoModel,'
      
        '    decode(auto.auto_type_id, 12, '#39#1055#1086' '#1072#1082#1090#1091#39', auto.numb) AS AutoN' +
        'umb,'
      '    autogroup.id AS GroupNumber, /* '#1085#1086#1084#1077#1088' '#1075#1088#1091#1087#1087#1099' */'
      '    np_group.id AS NPtype, /* '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1075#1088#1091#1087#1087#1099' '#1053#1055' */'
      '    np_group.name AS NPName, /* '#1085#1072#1079#1074#1072#1085#1080#1077' '#1053#1055' */'
      
        '    DECODE(SIGN(trunc(waybill_date) - to_date(to_char(:BeginDate' +
        ','#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') ' +
        '*/),'
      '           0, 0,'
      '           1, 0,'
      '          -1, -oper.litres,'
      '           0) AS RestLitres, /* '#1086#1089#1090#1072#1090#1086#1082' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      '    0 AS PrihodLitres, /* '#1087#1088#1080#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      
        '    DECODE(SIGN(trunc(waybill_date) - to_date(to_char(:BeginDate' +
        ','#39'DDMMYYYY'#39'),'#39'DDMMYYYY'#39') /* TO_DATE('#39'04.09.2001'#39', '#39'DD.MM.YYYY'#39') ' +
        '*/),'
      '           0, oper.litres,'
      '           1, oper.litres,'
      '          -1, 0,'
      '           0) AS RashodLitres /* '#1088#1072#1089#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1074' '#1083#1080#1090#1088#1072#1093' */'
      '   FROM'
      '    oil_auto_oper oper,'
      '    oil_waybills waybill,'
      '    oil_auto auto,'
      '    oil_auto_group autogroup,'
      '    oil_auto_type autotype,'
      '    oil_employ employ,'
      '    oil_np_type np_type,'
      '    oil_np_group np_group'
      '   WHERE'
      '        waybill.id = oper.waybill_id'
      '    AND waybill.inst = oper.waybill_inst'
      '    AND waybill.auto_id = auto.id'
      '    AND waybill.auto_inst = auto.inst'
      '    AND auto.auto_type_id = autotype.id'
      '    AND autotype.auto_group = autogroup.id'
      '    AND waybill.employ_id = employ.id'
      '    AND waybill.employ_inst = employ.inst'
      '    AND waybill.np_type = np_type.id'
      '    AND np_type.grp_id = np_group.id'
      '    AND auto.inst = :FilialID /* 150 */'
      
        '    AND waybill.waybill_date <= :EndDate /* TO_DATE('#39'06.09.2001'#39 +
        ', '#39'DD.MM.YYYY'#39') */'
      '    AND oper.state = '#39'Y'#39
      '    AND waybill.state = '#39'Y'#39
      ') A'
      'GROUP BY'
      ' A.GroupNumber,'
      ' A.AutoId,'
      ' A.AutoModel,'
      ' A.AutoNumb,'
      ' A.NPName,'
      ' A.NPtype'
      'HAVING'
      
        ' (NVL(SUM(A.Restlitres), 0) + NVL(SUM(A.PrihodLitres), 0) + NVL(' +
        'SUM(A.RashodLitres), 0)) <> 0'
      '')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 152
    Top = 121
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FilialID'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
        ParamType = ptInput
      end>
    object qReport8AUTOID: TFloatField
      FieldName = 'AUTOID'
    end
    object qReport8AUTOMODEL: TStringField
      FieldName = 'AUTOMODEL'
      Size = 55
    end
    object qReport8AUTONUMB: TStringField
      FieldName = 'AUTONUMB'
      Size = 12
    end
    object qReport8GROUPNUMBER: TFloatField
      FieldName = 'GROUPNUMBER'
    end
    object qReport8NPTYPE: TFloatField
      FieldName = 'NPTYPE'
    end
    object qReport8NPNAME: TStringField
      FieldName = 'NPNAME'
      Size = 50
    end
    object qReport8RESTLITRES: TFloatField
      FieldName = 'RESTLITRES'
    end
    object qReport8PRIHODLITRES: TFloatField
      FieldName = 'PRIHODLITRES'
    end
    object qReport8RASHODLITRES: TFloatField
      FieldName = 'RASHODLITRES'
    end
  end
end
