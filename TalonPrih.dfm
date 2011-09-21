inherited TalonPrihRefForm: TTalonPrihRefForm
  Left = 445
  Top = 129
  Caption = #1055#1088#1080#1093#1086#1076' '#1090#1072#1083#1086#1085#1086#1074
  ClientHeight = 415
  ClientWidth = 751
  Constraints.MinHeight = 420
  Constraints.MinWidth = 652
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 382
    Width = 751
    TabOrder = 2
    inherited Panel3: TPanel
      Left = 554
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
    inherited pShowDetail: TPanel
      Width = 186
      Visible = True
      inherited cbShowDetail: TCheckBox
        OnClick = CheckBox1Click
      end
    end
  end
  inherited Panel2: TPanel
    Width = 751
    Height = 55
    TabOrder = 0
    object Label2: TLabel
      Left = 5
      Top = 8
      Width = 13
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1090
    end
    object Label4: TLabel
      Left = 358
      Top = 32
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1090' '#1082#1086#1075#1086
    end
    object SpeedButton2: TSpeedButton
      Left = 628
      Top = 28
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
      OnClick = SpeedButton2Click
    end
    object Label5: TLabel
      Left = 661
      Top = 32
      Width = 11
      Height = 13
      Alignment = taRightJustify
      Caption = #8470
    end
    object Label1: TLabel
      Left = 661
      Top = 8
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = #1057#1077#1088#1080#1103
    end
    object SpeedButton3: TSpeedButton
      Left = 107
      Top = 4
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
      OnClick = SpeedButton3Click
    end
    object Label3: TLabel
      Left = 371
      Top = 8
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1086#1084#1091
    end
    object SpeedButton1: TSpeedButton
      Left = 628
      Top = 4
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
      OnClick = SpeedButton1Click
    end
    object Label6: TLabel
      Left = 158
      Top = 8
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1086#1084#1077#1088
    end
    object sbClearID: TSpeedButton
      Left = 324
      Top = 4
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
      OnClick = sbClearIDClick
    end
    object sbClearOper: TSpeedButton
      Left = 324
      Top = 28
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
      OnClick = sbClearOperClick
    end
    object Label8: TLabel
      Left = 142
      Top = 32
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1087#1077#1088#1072#1094#1080#1103
    end
    object Label7: TLabel
      Left = 5
      Top = 32
      Width = 14
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1086
    end
    object SpeedButton4: TSpeedButton
      Left = 107
      Top = 28
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
      OnClick = SpeedButton4Click
    end
    object deBeginDate: TDateEdit
      Left = 22
      Top = 5
      Width = 86
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
    end
    object ceOrg: TComboEdit
      Left = 400
      Top = 29
      Width = 228
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = ceOrgButtonClick
      OnDblClick = ceOrgButtonClick
    end
    object eTalonNum: TEdit
      Left = 674
      Top = 29
      Width = 71
      Height = 21
      MaxLength = 9
      TabOrder = 7
      OnKeyPress = eTalonNumKeyPress
    end
    object eTalonSer: TEdit
      Left = 695
      Top = 5
      Width = 50
      Height = 21
      MaxLength = 3
      TabOrder = 6
    end
    object ceDep: TComboEdit
      Left = 400
      Top = 5
      Width = 228
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = ceDepButtonClick
      OnDblClick = ceDepButtonClick
    end
    object edOper: TComboEdit
      Left = 196
      Top = 29
      Width = 128
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = edOperButtonClick
      OnDblClick = edOperButtonClick
    end
    object deEndDate: TDateEdit
      Left = 22
      Top = 29
      Width = 86
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 1
    end
    object edNum: TEdit
      Left = 196
      Top = 5
      Width = 128
      Height = 21
      MaxLength = 100
      TabOrder = 2
    end
  end
  inherited pBase: TPanel
    Top = 65
    Width = 601
    Height = 317
    object Splitter1: TSplitter [0]
      Left = 0
      Top = 138
      Width = 601
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ResizeStyle = rsLine
      Visible = False
    end
    inherited SplitterDetail: TSplitter
      Top = 141
      Width = 601
    end
    inherited DBGrid1: TDBGridEh
      Width = 601
      Height = 138
      OnGetCellParams = DBGrid1GetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PRIH_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'PRIH_NUM'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'SMENA_NUM'
          Footers = <>
          Title.Caption = #1057#1084#1077#1085#1072
          Visible = False
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'ORG_NAME'
          Footers = <>
          Title.Caption = #1054#1090' '#1082#1086#1075#1086
          Width = 306
        end
        item
          EditButtons = <>
          FieldName = 'OPER_NAME'
          Footers = <>
          Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
          Width = 170
        end
        item
          EditButtons = <>
          FieldName = 'DEP_NAME'
          Footers = <>
          Title.Caption = #1050#1086#1084#1091
          Width = 306
        end
        item
          EditButtons = <>
          FieldName = 'ALLAMOUNT'
          Footers = <>
          Title.Caption = #1050#1086#1083'-'#1074#1086' '#1096#1090'.'
        end
        item
          EditButtons = <>
          FieldName = 'LITR'
          Footers = <>
          Title.Caption = #1051#1080#1090#1088#1099
        end>
    end
    inherited pDetail: TPanel
      Top = 144
      Width = 601
      TabOrder = 2
      inherited DBGridDetail: TDBGridEh
        Width = 601
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 196
      Width = 601
      Height = 121
      Align = alBottom
      TabOrder = 1
      Visible = False
      object lAmountTalon: TLabel
        Left = 105
        Top = 80
        Width = 5
        Height = 13
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 675
        Top = 30
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'ALLAMOUNT'
        DataSource = dsTalonTotal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 675
        Top = 50
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'LITR'
        DataSource = dsTalonTotal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 605
        Top = 30
        Width = 65
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 605
        Top = 50
        Width = 45
        Height = 13
        Caption = #1051#1080#1090#1088#1072#1078' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBGrid2: TDBGridEh
        Left = 1
        Top = 1
        Width = 392
        Height = 119
        Align = alLeft
        Constraints.MinHeight = 30
        DataSource = dsTalon
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'SER'
            Footers = <>
            Title.Caption = #1057#1077#1088#1080#1103
            Width = 40
          end
          item
            EditButtons = <>
            FieldName = 'NUM'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'NPGRP_NAME'
            Footers = <>
            Title.Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
            Width = 140
          end
          item
            EditButtons = <>
            FieldName = 'NOMINAL'
            Footers = <>
            Title.Caption = #1053#1086#1084#1080#1085#1072#1083
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'PRICE'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072
            Width = 55
          end>
      end
      object GroupBox3: TGroupBox
        Left = 393
        Top = 1
        Width = 181
        Height = 119
        Align = alLeft
        Caption = #1054#1087#1077#1088'. '#1087#1086' '#1090#1072#1083#1086#1085#1091
        TabOrder = 1
        object DBText4: TDBText
          Left = 95
          Top = 0
          Width = 42
          Height = 13
          AutoSize = True
          DataField = 'SER'
          DataSource = dsTalon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBText5: TDBText
          Left = 120
          Top = 0
          Width = 42
          Height = 13
          AutoSize = True
          DataField = 'NUM'
          DataSource = dsTalon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBGrid3: TDBGridEh
          Left = 2
          Top = 15
          Width = 177
          Height = 102
          Align = alClient
          DataSource = dsTalonDetail
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'TITLE'
              Footers = <>
              Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'PRIH_DATE'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072
              Width = 57
            end
            item
              EditButtons = <>
              FieldName = 'PRIH_NUM'
              Footers = <>
              Title.Caption = #1053#1086#1084#1077#1088
              Width = 38
            end>
        end
      end
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 751
    inherited pnlTuneGridBtn: TPanel
      Left = 722
    end
  end
  inherited PanelCol: TPanel
    Left = 601
    Top = 65
    Height = 317
    inherited cbCol: TRxCheckListBox
      Height = 289
    end
    inherited pRefresh: TPanel
      Top = 291
    end
  end
  inherited ds: TOraDataSource
    Left = 130
    Top = 150
  end
  inherited q: TOilQuery
    SQL.Strings = (
      '-- Created on 22.06.2009 by mad '
      'select --+ ORDERED USE_HASH(tp, org, dep, ot, dr)'
      '-- tp.*,'
      
        ' tp.id,tp.inst,tp.state,tp.prih_num,tp.prih_date,tp.org_id,tp.or' +
        'g_inst,tp.dep_id,tp.dep_inst,tp.srep_id,tp.srep_inst,tp.oper_id,' +
        'tp.smena_num,'
      ' org.org_type,'
      ' org.name as org_name,'
      ' dep.inst as dep_inst,'
      ' dep.org_type as dep_type,'
      ' dep.name as dep_name,'
      ' ot.name as oper_name,'
      ' dr.load_prih_talon,'
      ' count(*) as AllAmount,'
      ' sum(Nominal) as Litr'
      '  from oil_talon_prih  tp,'
      '       v_org           org,'
      '       v_org           dep,'
      '       v_oil_oper_type ot,'
      '       oil_daily_rep   dr,'
      '       V_Oil_Talon_Op  op '
      ' where tp.state = '#39'Y'#39
      '   and op.Head_Id = tp.id'
      '   and op.Head_Inst = tp.inst'
      '   and tp.org_id = org.id'
      '   and tp.org_inst = org.inst'
      '   and tp.dep_id = dep.id'
      '   and tp.dep_inst = dep.inst'
      '   and tp.oper_id = ot.id'
      '   and tp.srep_id = dr.id(+)'
      '   and tp.srep_inst = dr.inst(+)'
      '   and (tp.prih_date >= :BeginDate or :BeginDate is null)'
      '   and (tp.prih_date <= :EndDate or :EndDate is null)'
      '   and (:org_id is null or org.id = :org_id)'
      '   and (:org_inst is null or org.inst = :org_inst)'
      '   and (:dep_id is null or dep.id = :dep_id)'
      '   and (:dep_inst is null or dep.inst = :dep_inst)'
      '   and (:prih_num is null or tp.prih_num = :prih_num)'
      '   and (:oper_id is null or tp.oper_id = :oper_id)'
      '   and (:isSmena is null or tp.smena_num is not null)'
      '   and (:ser is null and :num is null or'
      '       (tp.id, tp.inst) in'
      '       (select head_id, head_inst'
      '           from oil_talon_data'
      '          where nvl(:ser, ser) = ser'
      '            and nvl(:num, num) = num))'
      'group by '
      
        ' tp.id,tp.inst,tp.state,tp.prih_num,tp.prih_date,tp.org_id,tp.or' +
        'g_inst,tp.dep_id,tp.dep_inst,tp.srep_id,tp.srep_inst,tp.oper_id,' +
        'tp.smena_num,'
      ' org.org_type,'
      ' org.name,'
      ' dep.inst,'
      ' dep.org_type,'
      ' dep.name,'
      ' ot.name, '
      ' dr.load_prih_talon'
      ' order by tp.prih_date desc, tp.prih_num desc')
    CachedUpdates = True
    UpdateObject = u
    AfterPost = qAfterPost
    AfterDelete = qAfterPost
    Left = 116
    Top = 102
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'org_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'org_inst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'dep_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'dep_inst'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'prih_num'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'oper_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'isSmena'
      end
      item
        DataType = ftString
        Name = 'ser'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'num'
        ParamType = ptInput
      end>
  end
  inherited ADMQ: TOilQuery
    Left = 205
    Top = 185
  end
  inherited PUM: TPopupMenu
    Left = 275
    Top = 89
    object N4: TMenuItem [0]
      Caption = #1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103' ('#1042#1086#1079#1074#1088#1072#1090')'
      OnClick = N2Click
    end
    object N5: TMenuItem [1]
      Caption = #1056#1077#1077#1089#1090#1088' '#1087#1088#1080#1077#1084#1072'-'#1087#1077#1088#1077#1076#1072#1095#1080
      OnClick = N3Click
    end
    object N6: TMenuItem [2]
      Caption = #1055#1088#1080#1093#1086#1076#1085#1072#1103' '#1089#1074#1086#1076#1082#1072
      OnClick = N1Click
    end
    object NFilial: TMenuItem [3]
      Caption = #1060#1080#1083#1080#1072#1083#1100#1085#1099#1081' '#1087#1072#1082#1077#1090' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      OnClick = NFilial_Click
    end
    object miDocAlienAZS: TMenuItem [4]
      Caption = #1054#1090#1086#1074#1072#1088#1080#1074#1072#1085#1080#1077' '#1090#1072#1083#1086#1085#1086#1074' '#1085#1072' '#1040#1047#1057' '#1089#1090#1086#1088#1086#1085#1085#1080#1093' '#1092#1080#1088#1084
      OnClick = miDocAlienAZS_Click
    end
    object N9: TMenuItem [5]
      Caption = '-'
    end
  end
  inherited ActionList: TActionList
    Left = 320
    Top = 87
  end
  object dsTalon: TOraDataSource
    DataSet = qTalon
    Left = 130
    Top = 300
  end
  object sp1: TOilStoredProc
        Left = 240
    Top = 89
  end
  object qTalon: TOilQuery
    SQL.Strings = (
      
        '/* '#1047#1072#1087#1088#1086#1089' '#1080#1079#1084#1077#1085#1103#1077#1090#1089#1103' '#1085#1072' '#1083#1077#1090#1091' - '#1085#1077' '#1084#1077#1085#1103#1090#1100' '#1087#1086#1088#1103#1076#1086#1082' '#1089#1090#1088#1086#1082' '#1074' '#1079#1072#1087#1088#1086#1089#1077 +
        '! */'
      'select /*+ORDERED INDEX(a TALON_DATA_HEAD)*/'
      '       Oil_Talon_Data.Ser,       Oil_Talon_Data.Num,'
      '       Oil_Talon_Data.Price,'
      '       Oil_Talon_Data.Nominal,'
      '       Oil_Talon_Data.Head_id,'
      '       Oil_Talon_Data.Head_inst,'
      '       Oil_Talon_Data.NPGrp_id,'
      '       Oil_Talon_Data.Code_Obl,'
      '       Oil_NP_Group.FullName as NPGrp_Name'
      'from Oil_Talon_Data, v_Oil_NP_Group Oil_NP_Group'
      'where Oil_Talon_Data.state = '#39'Y'#39
      '  and Oil_Talon_Data.head_id = :id'
      '  and Oil_Talon_Data.head_inst = :inst'
      '  and Oil_NP_Group.id = Oil_Talon_Data.npgrp_id'
      'order by Oil_NP_Group.name,'
      '         Oil_Talon_Data.nominal,'
      '         Oil_Talon_Data.price,'
      '         Oil_Talon_Data.ser,'
      '         Oil_Talon_Data.num'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    MasterSource = ds
        DataSource = ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 116
    Top = 308
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
      end
      item
        DataType = ftFloat
        Name = 'INST'
      end>
  end
  object dsTalonTotal: TOraDataSource
    DataSet = qTalonTotal
    Left = 620
    Top = 300
  end
  object dsTalonDetail: TOraDataSource
    DataSet = qTalonDetail
    Left = 490
    Top = 295
  end
  object qWork: TOilQuery
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 365
    Top = 88
  end
  object qNextOut: TOilQuery
    SQL.Strings = (
      'select min(Date_)'
      '  from (select Ser, Num'
      '          from V_Oil_Talon_Op'
      '         where Tip = '#39'P'#39
      '           and Head_Id = :MainId'
      '           and Head_Inst = :MainInst) CurSerNum,'
      '       V_Oil_Talon_Op O'
      ' where Tip = '#39'O'#39
      '   and O.Ser = CurSerNum.Ser'
      '   and O.Num = CurSerNum.Num'
      '   and O.Date_ > :CurDate')
    AutoCalcFields = False
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 30
    Top = 75
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MainId'
      end
      item
        DataType = ftInteger
        Name = 'MainInst'
      end
      item
        DataType = ftDateTime
        Name = 'CurDate'
      end>
  end
  object u: TOraUpdateSQL
    ModifySQL.Strings = (
      'update OIL_TALON_PRIH'
      '   set PRIH_NUM  = :PRIH_NUM,'
      '       PRIH_DATE = :PRIH_DATE,'
      '       ORG_ID    = :ORG_ID,'
      '       ORG_INST  = :ORG_INST,'
      '       DEP_ID    = :DEP_ID,'
      '       DEP_INST  = :DEP_INST,'
      '       SREP_ID   = :SREP_ID,'
      '       SREP_INST = :SREP_INST,'
      '       OPER_ID   = :OPER_ID,'
      '       SMENA_NUM = :SMENA_NUM'
      ' where ID = :OLD_ID'
      '   and INST = :OLD_INST')
    InsertSQL.Strings = (
      'insert into OIL_TALON_PRIH'
      '  (ID,'
      '   INST,'
      '   STATE,'
      '   PRIH_NUM,'
      '   PRIH_DATE,'
      '   ORG_ID,'
      '   ORG_INST,'
      '   DEP_ID,'
      '   DEP_INST,'
      '   SREP_ID,'
      '   SREP_INST,'
      '   OPER_ID,'
      '   SMENA_NUM)'
      'values'
      '  (:ID,'
      '   :INST,'
      '   '#39'Y'#39','
      '   :PRIH_NUM,'
      '   :PRIH_DATE,'
      '   :ORG_ID,'
      '   :ORG_INST,'
      '   :DEP_ID,'
      '   :DEP_INST,'
      '   :SREP_ID,'
      '   :SREP_INST,'
      '   :OPER_ID,'
      '   :SMENA_NUM)')
    DeleteSQL.Strings = (
      'update OIL_TALON_PRIH'
      '   set STATE = '#39'N'#39
      ' where ID = :OLD_ID'
      '   and INST = :OLD_INST')
    Left = 160
    Top = 150
  end
  object qTalonDetail: TOilQuery
    SQL.Strings = (
      '/* '#1047#1072#1087#1088#1086#1089' '#1084#1077#1085#1103#1077#1090#1089#1103' '#1085#1072' '#1083#1077#1090#1091' - '#1085#1077' '#1084#1077#1085#1103#1090#1100' '#1087#1086#1088#1103#1076#1086#1082' '#1089#1090#1088#1086#1082'! */'
      'select decode(Tip, '#39'P'#39', '#39#1055#1088#1080#1093#1086#1076#39', '#39#1054#1090#1087#1091#1089#1082#39') as Title,'
      '       Date_ as Prih_Date,'
      '       decode(Tip, '#39'P'#39', 2, 1),'
      '       Head_Num as Prih_Num,'
      '       Nominal,'
      '       NPGrp_Id,'
      '       NP_Group.fullname as NPGrpName'
      '  from V_Oil_Talon_Op, v_Oil_NP_Group NP_Group'
      ' where Ser = :Ser'
      '   and Num = :Num'
      '   and Code_Obl = :code_obl'
      '   and NPGrp_Id = NP_Group.Id(+)'
      ' order by 2 desc, 3 desc')
    MasterSource = dsTalon
    AutoCalcFields = False
        DataSource = dsTalon
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 476
    Top = 303
    ParamData = <
      item
        DataType = ftString
        Name = 'Ser'
      end
      item
        DataType = ftInteger
        Name = 'Num'
      end
      item
        DataType = ftUnknown
        Name = 'Code_Obl'
      end>
  end
  object qPriorOut: TOilQuery
    SQL.Strings = (
      'select max(Date_)'
      '  from (select Ser, Num'
      '          from V_Oil_Talon_Op'
      '         where Tip = '#39'P'#39
      '           and Head_Id = :MainId'
      '           and Head_Inst = :MainInst) CurSerNum,'
      '       V_Oil_Talon_Op O'
      ' where O.Tip = '#39'O'#39
      '   and O.Ser = CurSerNum.Ser'
      '   and O.Num = CurSerNum.Num'
      '   and O.Date_ <= :CurDate')
    AutoCalcFields = False
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 30
    Top = 125
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MainId'
      end
      item
        DataType = ftInteger
        Name = 'MainInst'
      end
      item
        DataType = ftDateTime
        Name = 'CurDate'
      end>
  end
  object qSumTalon: TOilQuery
    SQL.Strings = (
      'select NPG.FullName as NPGrp_Name,'
      '       TalOut.Price,'
      '       TalOut.Prih_Date,'
      
        '       Round(NDS.GetNoNds_WithNds(TalOut.Price, TalOut.Prih_Date' +
        '), 4) as PriceXNDS,'
      '       sum(td.Nominal) as SumNominal,'
      
        '       Round(NDS.GetNoNds_WithNds(sum(td.Nominal) * TalOut.Price' +
        ','
      '                                  TalOut.Prih_Date),'
      '             2) as WholeXNDS'
      '  from (select O.Ser, O.Num, O.Price, GetEqual.Prih_Date'
      
        '          from (select Ser, Num, Prih_Date, max(Out_Date) as Out' +
        '_Date'
      '                  from (select TalOut.Ser,'
      '                               TalOut.Num,'
      '                               TalOut.Out_Date,'
      '                               min(TalPrih.Prih_Date) Prih_Date'
      
        '                          from (select Date_ as Prih_Date, Ser, ' +
        'Num'
      '                                  from V_Oil_Talon_Op'
      '                                 where Tip = '#39'P'#39
      '                                   and Head_Id = :Id'
      
        '                                   and Head_Inst = :Inst) TalPri' +
        'h,'
      
        '                               (select Date_ as Out_Date, Ser, N' +
        'um'
      '                                  from V_Oil_Talon_Op'
      '                                 where Tip = '#39'O'#39
      '                                   and Head_Inst = :Inst) TalOut'
      
        '                         where TalOut.Out_Date <= TalPrih.Prih_D' +
        'ate'
      '                           and TalPrih.Ser = TalOut.Ser'
      '                           and TalPrih.Num = TalOut.Num'
      
        '                         group by TalOut.Ser, TalOut.Num, TalOut' +
        '.Out_Date)'
      '                 group by Ser, Num, Prih_Date) GetEqual,'
      '               V_Oil_Talon_Op O,'
      '               v_Org Org'
      '         where O.Tip = '#39'O'#39
      '           and O.Date_ = GetEqual.Out_Date'
      '           and O.Ser = GetEqual.Ser'
      '           and O.Num = GetEqual.Num'
      '           and GetEqual.Prih_Date = :PrihDate'
      '           and O.To_Id = Org.Id'
      '           and O.To_Inst = Org.Inst) TalOut,'
      '       Oil_Talon_Data td,'
      '       v_Oil_NP_Group NPG'
      ' where td.State = '#39'Y'#39
      '   and td.Head_Id = :Id'
      '   and td.Head_Inst = :Inst'
      '   and td.Ser = TalOut.Ser(+)'
      '   and td.Num = TalOut.Num(+)'
      '   and NPG.Id = td.NPGrp_Id'
      ' group by NPG.FullName, TalOut.Price, TalOut.Prih_Date'
      ' order by NPG.FullName')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 32
    Top = 183
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
      end
      item
        DataType = ftInteger
        Name = 'INST'
      end
      item
        DataType = ftDateTime
        Name = 'PrihDate'
      end>
  end
  object qTalonTotal: TOilQuery
    SQL.Strings = (
      'select count(*) as AllAmount,'
      '       date_ as data,'
      '       sum(Nominal) as Litr,'
      '       sum(Nominal * Round(Price, 4)) as Whole,'
      
        '       Round(NDS.GetNds_WithNds(sum(Nominal * Round(Price, 4)), ' +
        'date_), 2) as NDS,'
      
        '       Round(NDS.GetNoNds_WithNds(sum(Nominal * Round(Price, 4))' +
        ', date_), 2) as WholeXNDS'
      '  from V_Oil_Talon_Op'
      ' where Tip = '#39'P'#39
      '   and Head_Id = :id'
      '   and Head_Inst = :inst'
      ' group by Head_id, Head_inst, date_')
    MasterSource = ds
    DataSource = ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 606
    Top = 308
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
      end
      item
        DataType = ftFloat
        Name = 'INST'
      end>
  end
  object qTalonFilRN: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select '
      '       np_group_full,'
      '       np_group_id,'
      '       dim.name as dim_name,'
      '       sum(litr) as litr,'
      '       '
      '       ceil(nvl(ov.GetNpgPrice(np_group_id),'
      '                sum(sumnds)/sum(litr))*100)/100 as price,'
      
        '       ceil(nvl(NDS.GetNoNDS_WithNDS(ov.GetNpgPrice(np_group_id)' +
        ',to_date(:EndDate)),'
      
        '                sum(SumXNds)/sum(litr))*10000)/10000 as PriceXNd' +
        's,'
      '       '
      '       nvl(ov.GetNpgPrice(np_group_id)*sum(litr),'
      '           sum(sumnds)) as SumNds,'
      
        '       ceil(nvl(NDS.GetNoNDS_WithNDS(ov.GetNpgPrice(np_group_id)' +
        '*sum(litr),to_date(:EndDate)),'
      '                sum(SumXNds))*100)/100 as SumXNds,'
      '       '
      
        '       nvl(NDS.GetNDS_WithNDS(ov.GetNpgPrice(np_group_id)*sum(li' +
        'tr),to_date(:EndDate)),'
      '           sum(Nds)) as Nds      '
      
        '  from v_oil_talon_srae,v_oil_dimension dim  /*'#1086#1090#1086#1074#1072#1088#1077#1085#1085#1103' '#1085#1072' '#1102#1088'.' +
        #1086#1089#1086#1073#1110' '#1074#1110#1076#1087#1091#1097#1077#1085#1080#1093' '#1079' '#1092#1110#1083#1110#1072#1083#1091'*/'
      ' where date_ between :BeginDate and :EndDate'
      '   and obl_id = :obl_id'
      '   and is_np_docs = 1'
      '   and dim.id=28'
      ' group by np_group_full, np_group_id, dim.name'
      
        ' order by decode(np_group_id, 5,10, 6,20, 7,30, 76,40, 10,50, 3,' +
        '60, 62,70, 100)')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 480
    Top = 78
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'EndDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'obl_id'
        ParamType = ptInput
      end>
  end
  object qTalonFilReestr: TOilQuery
    SQL.Strings = (
      
        'select row_number() over (order by np_group_full,litr,t.num) as ' +
        'por_number,'
      '       t.np_group,'
      '       litr as nominal,'
      '       ser,'
      '       t.num as num,'
      '       1 as co,'
      '       litr,'
      '       t.azs_name,'
      '       t.date_,'
      '       oo.inst as dep_inst,'
      '       oo.name as dep_name'
      '  from v_oil_talon_ae t,'
      '       v_org oo'
      ' where t.dep_id=:obl_id'
      '   and t.date_ between :BeginDate and :EndDate'
      '   and (oo.inst = :dep_id or :dep_id is null)'
      '   and t.prih_inst = oo.inst and oo.inst = oo.id'
      '   and is_np_docs=1'
      
        ' order by decode(t.np_group_id, 5,10, 6,20, 7,30, 76,40, 10,50, ' +
        '3,60, 62,70, 100)')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 480
    Top = 130
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'obl_id'
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
      end
      item
        DataType = ftInteger
        Name = 'dep_id'
        ParamType = ptInput
      end>
  end
  object qTalonFilReestrDop: TOilQuery
    SQL.Strings = (
      'select np_group,np_group_full,nominal,price,'
      '  sum(co) as co,'
      '  sum(litr) as litr,'
      '  decode(ov.language,0,'#39#1058#1072#1083#1086#1085#1099' '#1043#1057#1052' ('#39','
      '         '#39#1058#1072#1083#1086#1085#1080' '#1055#1052#1052' ('#39')'
      '         ||np_group_full||'#39' '#39'||ser||'#39') '#39
      '         ||nominal||'#39#1083#39' as tal_one_name,'
      '  '#39#1096#1090'.'#39' as dim_name,'
      '  sum(co*price) as SumXNds,'
      '  ser'
      'from'
      
        '  (select np_group,np_group_full,litr as nominal,ser,var.price,p' +
        'rih_inst as dep_inst,'
      '    count(*) as co,'
      '    sum(litr) as litr'
      '  from v_oil_talon_ae,'
      
        '    (select to_number(nvl(ov.getval('#39'TALON_ONE_PRICE'#39'),0.25)) as' +
        ' price from dual) var'
      '  where dep_id=:dep_id'
      '    and date_ between :BeginDate and :EndDate'
      '    and is_blank_docs=1'
      '  group by np_group,np_group_full,litr,ser,prih_inst'
      '  )'
      'group by'
      
        '  np_group, np_group_full, nominal, price, np_group_full, ser, n' +
        'ominal')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 484
    Top = 182
    ParamData = <
      item
        DataType = ftInteger
        Name = 'dep_id'
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
  end
  object qDogFil: TOilQuery
    SQL.Strings = (
      'select g.dog,'
      '       g.dog_date,'
      '       t.dog as dog_t,'
      '       t.dog_date as dog_date_t'
      'from'
      '(select d.*, '#39'Z'#39' as z'
      'from oil_dog d'
      'where state='#39'Y'#39' and dog_type='#39'Y'#39
      '  and inst = (select main_inst from oil_info)'
      '  and from_=from_inst'
      '  and to_=to_inst'
      '  and dog_date between :FromDate and :ToDate'
      '  )g,'
      '(select d.*, '#39'Z'#39' as z'
      '  from oil_dog d,   '
      '       oil_dog_detail dd,'
      '       v_oil_np_type np'
      ' where d.id = dd.dog_id (+) '
      '   and d.inst = dd.dog_inst (+) '
      '   and d.state = '#39'Y'#39
      '   and dd.state(+) = '#39'Y'#39
      '   and dd.np_type = np.id       '
      '   and np.np_grp = 74'
      '   and dog_date between :FromDate and :ToDate '
      '   )t,   '
      '   dual x'
      'WHERE  NVL('#39'X'#39', X.dummy) = NVL('#39'X'#39', g.z (+))'
      '   AND NVL('#39'X'#39', X.dummy) = NVL('#39'X'#39', t.z (+))'
      '   and g.from_(+)=:from_id'
      '   and g.to_(+)=:to_id'
      '   and t.from_(+)=:to_id '
      '   and t.to_(+)=:from_id')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 288
    Top = 150
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FromDate'
      end
      item
        DataType = ftUnknown
        Name = 'ToDate'
      end
      item
        DataType = ftInteger
        Name = 'from_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'to_id'
        ParamType = ptInput
      end>
  end
  object qNNFil: TOilQuery
    SQL.Strings = (
      '/*'#1087#1088#1086#1089#1090#1072#1103' '#1090#1072#1083#1086#1085#1085#1072#1103' '#1053#1053'*/'
      'select * from'
      '(select'
      '       sb.s_date as date_,'
      '       sb.id,'
      '       sb.inst,'
      '       npg.fullname as tov_full,'
      '       npg.id as tov_id,'
      '       sbd.nds_t as sumnds,'
      '       price_nds,'
      '       sbd.kol co,'
      '       '#39'G'#39' type_'
      '  from oil_sale_book sb,'
      '       oil_sale_book_det sbd,'
      '       v_oil_np_group npg'
      ' where sb.state='#39'Y'#39' and sbd.state='#39'Y'#39
      '   and sbd.nn_id=sb.id and sbd.nn_inst=sb.inst'
      '   and sbd.tov_id=npg.id'
      '   and sb.nal_t=10'
      '   and sb.s_date = :Date_'
      '   and sb.from_=:from_id and sb.from_inst=sb.from_'
      '   and sb.organ=:to_id and sb.organ=sb.organ_inst'
      'union all'
      '/*'#1090#1072#1083#1086#1085#1085#1072#1103' '#1053#1053' '#1087#1086' '#1087#1077#1088#1077#1076#1072#1095#1077' '#1090#1072#1083#1086#1085#1086#1074'*/'
      'select'
      '       sb.s_date as date_,'
      '       sb.id,'
      '       sb.inst,'
      '       npt.name,'
      '       npt.id,'
      '       sbd.nds_t,'
      '       price_nds,'
      '       sbd.kol co,'
      '       '#39'T'#39' type_'
      '  from oil_sale_book sb,'
      '       oil_sale_book_det sbd,'
      '       v_oil_np_type npt'
      ' where npt.np_grp = 74 -- '#1058#1072#1083#1086#1085#1099' '#1043#1057#1052
      '   and sb.state='#39'Y'#39' and sbd.state='#39'Y'#39
      '   and sbd.nn_id=sb.id and sbd.nn_inst=sb.inst'
      '   and sbd.tov_id=npt.id'
      '   and sb.nal_t=10'
      '   and sb.s_date = :date_'
      '   and sb.from_=:from_id and sb.from_inst=sb.from_'
      '   and sb.organ=:to_id and sb.organ=sb.organ_inst)'
      ' where type_ = :type_ or :type_ is null'
      ' order by type_,tov_full,price_nds'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 288
    Top = 218
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Date_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'from_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'to_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'from_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'to_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'type_'
      end
      item
        DataType = ftUnknown
        Name = 'type_'
      end>
  end
  object qTalonBlanks: TOilQuery
    SQL.Strings = (
      'select date_, np_group, np_group_full, nominal, price, co, litr,'
      '       decode(ov.language,0,'#39#1058#1072#1083#1086#1085#1099' '#1043#1057#1052' ('#39','
      '         '#39#1058#1072#1083#1086#1085#1080' '#1055#1052#1052' ('#39')'
      '         ||np_group_full||'#39' '#39'||ser||'#39') '#39
      '         ||nominal||'#39#1083#39' as tal_one_name,'
      '       '#39#1096#1090'.'#39' as dim_name,'
      '       co*price as SumXNds,'
      '       NDS.GetNds_NoNds(co*price,date_) as Nds,'
      '       NDS.GetWithNds_NoNds(co*price,date_) as SumNds,'
      '       NDS.GetWithNds_NoNds(price,date_) as PriceNds,'
      '       ser,'
      '       dep_inst,'
      '       dep_name'
      '  from'
      
        '       (select date_, np_group, np_group_full, litr as nominal, ' +
        'ser,'
      '               to_number(var.price) as price,'
      '               count(*) as co,'
      '               sum(litr) as litr,'
      '               prih_inst dep_inst,'
      '               oo.name dep_name'
      '          from v_oil_talon_ae ae,'
      
        '               (select nvl(ov.getval('#39'TALON_ONE_PRICE'#39'),0.25) as' +
        ' price from dual) var,'
      '               v_org oo'
      '         where dep_id = :obl_id'
      '           and date_ between :BeginDate and :EndDate'
      '           and ae.prih_inst = oo.inst and oo.inst = oo.id'
      '           and is_blank_docs = 1'
      
        '         group by date_, prih_inst, np_group, np_group_full, lit' +
        'r, ser, oo.name)'
      ' order by dep_inst, np_group, np_group_full, nominal')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 396
    Top = 154
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'obl_id'
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
  end
  object qDogAlien: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select * '
      '  from oil_dog '
      ' where state='#39'Y'#39' and from_=5542 and from_inst=1 and dog_type='#39'Y'#39
      '   and to_=to_inst and to_inst=99')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 672
    Top = 82
  end
  object qTalonAlienRn: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select Price,'
      '       NDS.GetNoNDS_WithNDS(Price, Date_) pricexnds,'
      '       sum(Nominal) litr,'
      '       NPGrp_id,'
      '       NPG.FullName as np_group_full,'
      '       round(Price * sum(Nominal), 2) sumnds,'
      
        '       NDS.GetNoNDS_WithNDS(round(Price * sum(Nominal), 2), Date' +
        '_) sumxnds,'
      '       round(Price * sum(Nominal), 2) -'
      
        '       NDS.GetNoNDS_WithNDS(round(Price * sum(Nominal), 2), Date' +
        '_) nds,'
      '       o.Date_ as Prih_Date,'
      '       '#39#1083#1080#1090#1088#39' dim_name'
      '  from V_Oil_Talon_Op o, v_Oil_NP_Group NPG'
      ' where Tip = '#39'P'#39
      '   and oper_id = 218'
      '   and NPG.id = npgrp_id'
      '   and Date_ between :BeginDate and :EndDate'
      ' group by NPG.name, NPG.FullName, price, NPGrp_id, Date_')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 672
    Top = 130
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
      end>
  end
  object qTalonAlienReestr: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select rownum, s.*'
      '  from (select Nominal litr,'
      '               g.FullName as np_group_full,'
      '               Date_ as Prih_Date,'
      '               count(*) co,'
      '               sum(Nominal) nominal,'
      '               g.name group_name,'
      '               ser,'
      '               num'
      '          from V_Oil_Talon_Op, v_Oil_NP_Group g'
      '         where Tip = '#39'P'#39
      '           and oper_id = 218'
      '           and g.id = npgrp_id'
      '           and Date_ between :BeginDate and :EndDate'
      
        '         group by Date_, g.fullname, g.name, nominal, ser, num) ' +
        's')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 672
    Top = 178
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end>
  end
  object qBlankReestrDop: TOilQuery
    SQL.Strings = (
      'select np_group,np_group_full,nominal,price,co,litr,'
      '  decode(ov.Language,'
      
        '    1,'#39#1058#1072#1083#1086#1085#1080' '#1043#1057#1052' ('#39'||np_group_full||'#39' '#39'||ser||'#39') '#39'||nominal||'#39#1083 +
        #39','
      '    '#39#1058#1072#1083#1086#1085#1099' '#1043#1057#1052' ('#39'||np_group_full||'#39' '#39'||ser||'#39') '#39'||nominal||'#39#1083#39
      '    )as tal_one_name,'
      '  '#39#1096#1090'.'#39' as dim_name,'
      '  co*price as SumXNds,'
      '  NDS.GetNds_NoNds(co*price,to_date(:EndDate)) as Nds,'
      '  NDS.GetWithNds_NoNds(co*price,to_date(:EndDate)) as SumNds,'
      '  NDS.GetWithNds_NoNds(price,to_date(:EndDate)) as PriceNds,'
      '  ser'
      'from'
      '  (select np_group,np_group_full,litr as nominal,ser,var.price,'
      '    count(*) as co,'
      '    sum(litr) as litr'
      '  from v_oil_talon_ae,'
      
        '    (select to_number(nvl(ov.getval('#39'TALON_ONE_PRICE'#39'),0.25)) as' +
        ' price from dual) var'
      '  where dep_id=:dep_id'
      '    and date_ between :BeginDate and :EndDate'
      '    and is_blank_docs=1'
      '  group by np_group,np_group_full,litr,ser'
      '  )')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 396
    Top = 202
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'EndDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'dep_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end>
  end
  object dsTalonGetPrice: TOraDataSource
    DataSet = qTalonGetPrice
    Left = 536
    Top = 5
  end
  object qTalonGetPrice: TOilQuery
    SQLUpdate.Strings = (
      'update faketable set fakefield = fakefield')
    SQL.Strings = (
      'select npg.fullname as np_group_full,'
      '       tr.npgrp_id as np_group_id,      '
      '       sum(nominal) as litr,'
      
        '       round(sum(prev_price_korr*nominal)/sum(nominal),4) as pri' +
        'ce,'
      '       sum(prev_price_korr*nominal) as summ'
      
        '  from v_oil_talon_sropl tr, v_oil_np_group npg  /*'#1074#1089#1077' '#1086#1090#1086#1074#1072#1088#1077#1085#1085 +
        #1103' '#1090#1072#1083#1086#1085#1110#1074' '#1085#1072' '#1102#1088'.'#1086#1089#1086#1073#1110'*/'
      ' where date_ between :BeginDate and :EndDate'
      '   and dep_id = :obl_id'
      '   and npg.id = tr.npgrp_id'
      '   and tr.oper_id = 180'
      ' group by npg.fullname, tr.npgrp_id'
      
        ' order by decode(tr.npgrp_id, 5,10, 6,20, 7,30, 76,40, 10,50, 3,' +
        '60, 62,70, 100)')
    FetchAll = True
    CachedUpdates = True
    AutoCommit = False
    OnCalcFields = qTalonGetPriceCalcFields
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 528
    Top = 14
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
        Name = 'obl_id'
      end>
    object qTalonGetPriceNP_GROUP_FULL: TStringField
      DisplayLabel = #1043#1088#1091#1087#1072' '#1053#1055
      FieldName = 'NP_GROUP_FULL'
      ReadOnly = True
      Size = 50
    end
    object qTalonGetPriceNP_GROUP_ID: TFloatField
      DisplayLabel = 'npg_id'
      FieldName = 'NP_GROUP_ID'
      ReadOnly = True
    end
    object qTalonGetPriceLITR: TFloatField
      DisplayLabel = #1051#1110#1090#1088#1080
      FieldName = 'LITR'
      ReadOnly = True
    end
    object qTalonGetPricePRICE: TFloatField
      DisplayLabel = #1062#1110#1085#1072' '#1079' '#1055#1044#1042
      FieldName = 'PRICE'
      DisplayFormat = '0.#####'
    end
    object qTalonGetPriceSumNds: TFloatField
      DisplayLabel = #1057#1091#1084#1072' '#1079' '#1055#1044#1042
      FieldKind = fkCalculated
      FieldName = 'SumNds'
      DisplayFormat = '0.##'
      Calculated = True
    end
  end
  object qTalonRN: TOilQuery
    Session = frmStart.OraSession1
    SQL.Strings = (
      'select '
      '       npg.fullname as np_group_full,'
      '       tr.npgrp_id as np_group_id,'
      '       dim.name as dim_name,'
      '       sum(nominal) as litr,'
      '       '
      
        '       ceil(nvl(ov.GetNpgPrice(tr.npgrp_id),avg(prev_price_korr)' +
        ')*100'
      '            )/100 as price,'
      
        '       NDS.GetNoNDS_WithNDS(nvl(ov.GetNpgPrice(tr.npgrp_id),avg(' +
        'prev_price_korr)), '
      
        '                                 to_date(:EndDate)) as PriceXNds' +
        ','
      '       '
      '       sum(nominal * nvl(ov.GetNpgPrice(tr.npgrp_id),'
      '                           prev_price_korr)) as SumNds,'
      
        '       NDS.GetNoNDS_WithNDS(sum(nominal * nvl(ov.GetNpgPrice(tr.' +
        'npgrp_id), prev_price_korr)),'
      '                                 to_date(:EndDate)) as SumXNds,'
      '       '
      
        '       NDS.GetNDS_WithNDS(sum(nominal * nvl(ov.GetNpgPrice(tr.np' +
        'grp_id), prev_price_korr)),'
      '                          to_date(:EndDate)'
      '            ) as Nds             '
      
        '  from v_oil_talon_sropl tr, v_oil_np_group npg,v_oil_dimension ' +
        'dim /*'#1074#1089#1077' '#1086#1090#1086#1074#1072#1088#1077#1085#1085#1103' '#1090#1072#1083#1086#1085#1110#1074'*/'
      ' where date_ between :BeginDate and :EndDate'
      '   and dep_id = :obl_id'
      '   and npg.id = tr.npgrp_id'
      '   and tr.oper_id = 180'
      '   and dim.id=28'
      ' group by npg.fullname, tr.npgrp_id, dim.name'
      
        ' order by decode(tr.npgrp_id, 5,10, 6,20, 7,30, 76,40, 10,50, 3,' +
        '60, 62,70, 100)')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 572
    Top = 81
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'obl_id'
      end>
  end
  object qTalonReestr: TOilQuery
    SQL.Strings = (
      
        'select row_number() over (order by npgrp_id,t.nominal,t.num) as ' +
        'por_number,'
      '       npg.name as np_group,'
      '       t.nominal as nominal,'
      '       ser,'
      '       t.num as num,'
      '       1 as co,'
      '       t.nominal as litr,'
      '       azs.name as azs_name,'
      '       t.date_,'
      '       oo.inst as dep_inst,'
      '       oo.name as dep_name'
      '  from v_oil_talon_sropl t,'
      '       v_oil_azs azs,'
      '       v_oil_np_group npg,'
      '       v_org oo'
      ' where t.dep_id=:obl_id'
      '   and t.date_ between :BeginDate and :EndDate'
      '   and (oo.inst = :dep_id or :dep_id is null)'
      '   and t.dep_inst = oo.inst and oo.inst = oo.id'
      '   and t.azs_id = azs.id(+)'
      '   and t.azs_inst = azs.inst(+)'
      '   and npg.id = t.npgrp_id'
      '   and t.oper_id = 180'
      
        ' order by decode(npg.id, 5,10, 6,20, 7,30, 76,40, 10,50, 3,60, 6' +
        '2,70, 100)')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 568
    Top = 141
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'obl_id'
      end
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
        Name = 'dep_id'
      end>
  end
  object qTalonReestrDop: TOilQuery
    SQL.Strings = (
      'select np_group,np_group_full,nominal,price,'
      '  sum(co) as co,'
      '  sum(litr) as litr,'
      '  decode(ov.language,0,'#39#1058#1072#1083#1086#1085#1099' '#1043#1057#1052' ('#39','
      '         '#39#1058#1072#1083#1086#1085#1080' '#1055#1052#1052' ('#39')'
      '         ||np_group_full||'#39' '#39'||ser||'#39') '#39
      '         ||nominal||'#39#1083#39' as tal_one_name,'
      '  '#39#1096#1090'.'#39' as dim_name,'
      '  sum(co*price) as SumXNds,'
      '  ser'
      'from'
      
        '  (select npg.name as np_group,npg.fullname as np_group_full,t.n' +
        'ominal,ser,var.price,t.dep_inst,'
      '    count(*) as co,'
      '    sum(nominal) as litr'
      '  from v_oil_talon_sropl t, v_oil_np_group npg,'
      
        '    (select to_number(nvl(ov.getval('#39'TALON_ONE_PRICE'#39'),0.25)) as' +
        ' price from dual) var'
      '  where dep_id=:dep_id'
      '    and date_ between :BeginDate and :EndDate'
      '    and npg.id = t.npgrp_id'
      '    and t.oper_id = 180'
      '  group by npg.name,npg.fullname,t.nominal,ser,dep_inst'
      '  )'
      'group by'
      
        '  np_group, np_group_full, nominal, price, np_group_full, ser, n' +
        'ominal')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 572
    Top = 209
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dep_id'
      end
      item
        DataType = ftUnknown
        Name = 'BeginDate'
      end
      item
        DataType = ftUnknown
        Name = 'EndDate'
      end>
  end
end
