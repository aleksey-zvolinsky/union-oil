inherited CardRequestForm: TCardRequestForm
  Left = 395
  Top = 260
  Width = 559
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1103#1074#1082#1080' '#1085#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1077
  PixelsPerInch = 96
  TextHeight = 13
  inherited pBottom: TPanel
    Width = 551
    object sbDel: TSpeedButton [0]
      Left = 6
      Top = 4
      Width = 25
      Height = 25
      Action = actDeleteRecord
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF0000000000FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000FF000000
        FF000000FF000000FF000000FF0000000000FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
        000000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00000000000000000000000000FFFFFF0000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
        0000FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
    end
    inherited pBtn: TPanel
      Left = 354
    end
  end
  object DbGrid: TDBGridEh [1]
    Left = 0
    Top = 123
    Width = 551
    Height = 186
    Align = alClient
    DataSource = dsDetail
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = [fsBold]
    FooterRowCount = 1
    ParentFont = False
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        Alignment = taLeftJustify
        Checkboxes = True
        EditButtons = <>
        FieldName = 'CREATE_BLANK_OUT'
        Footers = <>
        KeyList.Strings = (
          '1;'
          '0;')
        Title.Caption = #1054#1090#1087#1091#1089#1082' '#1073#1083#1072#1085#1082#1086#1074
        Width = 47
      end
      item
        DisplayFormat = '000 000 000'
        EditButtons = <>
        FieldName = 'CARD_NUMBER'
        Footers = <>
        Width = 78
      end
      item
        AlwaysShowEditButton = True
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'NP_GROUP_NAME'
        Footers = <>
        ReadOnly = True
        Width = 192
        OnEditButtonClick = DbGridColumns3EditButtonClick
      end
      item
        EditButtons = <>
        FieldName = 'PRICE'
        Footer.Value = #1057#1091#1084#1084#1099':'
        Footer.ValueType = fvtStaticText
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'LITR'
        Footer.FieldName = 'LITR'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        Color = 15658991
        EditButtons = <>
        FieldName = 'SUM'
        Footer.FieldName = 'SUM'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
      end>
  end
  object pTop: TPanel [2]
    Left = 0
    Top = 0
    Width = 551
    Height = 123
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      551
      123)
    object Label10: TLabel
      Left = 51
      Top = 8
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1086#1084#1077#1088':'
    end
    object sbAuto: TSpeedButton
      Left = 395
      Top = 3
      Width = 25
      Height = 21
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1085#1086#1084#1077#1088
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 1
      Down = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000015000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777777777000777777777777777777777000788778878877788778877000F087
        F0800087F08780087000F087F080FF08F08F0FF08000F087F0808F08F08F08F0
        8000F08870808F08F08F08F08000F00000808F08F08F08F08000F07FF0808F0F
        F08808F08000F087F08000700000F0087000F087F080087FFFFF7FF77000F087
        F08080877777777770007F087080808777777777700077F0008F0F7777777777
        7000777FFF77F777777777777000777777777777777777777000777777777777
        777777777000}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbAutoClick
    end
    object LblDate_: TLabel
      Left = 422
      Top = 8
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072':'
    end
    object Label2: TLabel
      Left = 27
      Top = 32
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082':'
    end
    object Label3: TLabel
      Left = 25
      Top = 56
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
    end
    object Label1: TLabel
      Left = 422
      Top = 102
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072':'
    end
    object Label4: TLabel
      Left = 4
      Top = 80
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1090#1087#1091#1089#1082' '#1073#1083#1072#1085#1082#1086#1074':'
    end
    object Label5: TLabel
      Left = 41
      Top = 104
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1086#1075#1086#1074#1086#1088':'
    end
    object Label6: TLabel
      Left = 422
      Top = 78
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072':'
    end
    object sbAutoDog: TSpeedButton
      Left = 395
      Top = 99
      Width = 25
      Height = 21
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1085#1086#1084#1077#1088
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 3
      Down = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000015000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777777777000777777777777777777777000788778878877788778877000F087
        F0800087F08780087000F087F080FF08F08F0FF08000F087F0808F08F08F08F0
        8000F08870808F08F08F08F08000F00000808F08F08F08F08000F07FF0808F0F
        F08808F08000F087F08000700000F0087000F087F080087FFFFF7FF77000F087
        F08080877777777770007F087080808777777777700077F0008F0F7777777777
        7000777FFF77F777777777777000777777777777777777777000777777777777
        777777777000}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbAutoDogClick
    end
    object sbAutoBlank: TSpeedButton
      Left = 323
      Top = 75
      Width = 25
      Height = 21
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1085#1086#1084#1077#1088
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 2
      Down = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000015000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777777777000777777777777777777777000788778878877788778877000F087
        F0800087F08780087000F087F080FF08F08F0FF08000F087F0808F08F08F08F0
        8000F08870808F08F08F08F08000F00000808F08F08F08F08000F07FF0808F0F
        F08808F08000F087F08000700000F0087000F087F080087FFFFF7FF77000F087
        F08080877777777770007F087080808777777777700077F0008F0F7777777777
        7000777FFF77F777777777777000777777777777777777777000777777777777
        777777777000}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbAutoBlankClick
    end
    object eDocNumber: TEdit
      Left = 88
      Top = 3
      Width = 306
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object deDate_: TDateEdit
      Left = 455
      Top = 3
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 1
    end
    object ceFrom: TComboEdit
      Left = 88
      Top = 27
      Width = 457
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 2
      OnButtonClick = ceFromButtonClick
      OnDblClick = ceFromButtonClick
    end
    object ceTo: TComboEdit
      Left = 88
      Top = 51
      Width = 457
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = ceToButtonClick
      OnDblClick = ceToButtonClick
    end
    object ceBlank: TComboEdit
      Left = 88
      Top = 75
      Width = 233
      Height = 21
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 4
      OnButtonClick = ceBlankButtonClick
      OnChange = ceBlankChange
      OnDblClick = ceBlankButtonClick
    end
    object ceDog: TComboEdit
      Left = 88
      Top = 99
      Width = 305
      Height = 21
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = ceDogButtonClick
      OnChange = ceDogChange
      OnDblClick = ceDogButtonClick
      OnKeyPress = ceDogKeyPress
    end
    object deDogDate: TDateEdit
      Left = 455
      Top = 99
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 6
    end
    object deBlankDate: TDateEdit
      Left = 455
      Top = 75
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 7
    end
    object ceBlankPrice: TCurrencyEdit
      Left = 352
      Top = 75
      Width = 68
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
      Anchors = [akTop, akRight]
      TabOrder = 8
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select r.*,  '
      '       nvl(sign(b.card_number),0) as CREATE_BLANK_OUT'
      '  from v_card_request_full r, v_card_blank_det b'
      ' where blank_id=b.head_id(+)'
      '   and blank_inst=b.head_inst(+)'
      '   and r.card_number=b.card_number(+)'
      '   and r.head_id=:id and r.head_inst=:inst')
  end
  object dsDetail: TDataSource
    DataSet = mtDetail
    OnDataChange = dsDetailDataChange
    Left = 152
    Top = 192
  end
  object mtDetail: TMemoryTable
    AfterInsert = AfterAction
    AfterEdit = AfterAction
    BeforePost = mtDetailBeforePost
    AfterPost = mtDetailAfterPost
    BeforeDelete = mtDetailBeforeDelete
    AfterDelete = mtDetailAfterDelete
    OnCalcFields = mtDetailCalcFields
    Left = 136
    Top = 184
    object mtDetailID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object mtDetailINST: TFloatField
      FieldName = 'INST'
      Required = True
      Visible = False
    end
    object mtDetailCARD_NUMBER: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1099
      FieldName = 'CARD_NUMBER'
    end
    object mtDetailPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
    end
    object mtDetailLITR: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'LITR'
    end
    object mtDetailNP_GROUP_ID: TFloatField
      FieldName = 'NP_GROUP_ID'
      Visible = False
    end
    object mtDetailNP_GROUP_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1090#1086#1087#1083#1080#1074#1072
      FieldName = 'NP_GROUP_NAME'
      Size = 50
    end
    object mtDetailLOCAL_ID: TIntegerField
      FieldName = 'LOCAL_ID'
    end
    object mtDetailSUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldKind = fkCalculated
      FieldName = 'SUM'
      Calculated = True
    end
    object mtDetailCREATE_BLANK_OUT: TIntegerField
      FieldName = 'CREATE_BLANK_OUT'
    end
  end
  object mtCopy: TMemoryTable
    Left = 48
    Top = 184
    object mtCopyID: TFloatField
      FieldName = 'ID'
    end
    object mtCopyINST: TFloatField
      FieldName = 'INST'
    end
    object mtCopyCARD_NUMBER: TFloatField
      FieldName = 'CARD_NUMBER'
    end
    object mtCopyPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object mtCopyLITR: TFloatField
      FieldName = 'LITR'
    end
    object mtCopyNP_GROUP_ID: TFloatField
      FieldName = 'NP_GROUP_ID'
    end
    object mtCopyNP_GROUP_NAME: TStringField
      FieldName = 'NP_GROUP_NAME'
      Size = 50
    end
    object mtCopyLOCAL_ID: TIntegerField
      FieldName = 'LOCAL_ID'
    end
    object mtCopyCREATE_BLANK_OUT: TIntegerField
      FieldName = 'CREATE_BLANK_OUT'
    end
  end
  object ActionList: TActionList
    Images = MainForm.BaseImage
    Left = 216
    Top = 192
    object actDeleteRecord: TAction
      ImageIndex = 2
      OnExecute = actDeleteRecordExecute
    end
  end
  object qDogAuto: TOilQuery
    SQL.Strings = (
      'select litr as count, '
      '       np.id np_id,'
      '       NDS.GetNoNDS_WithNDS(price, date_) price, '
      '       price as price2, '
      '       28 dim_id'
      '  from v_card_request_full q,'
      
        '       (select max(id) id, np_grp from v_oil_np_type t group by ' +
        'np_grp) np'
      ' where q.np_group_id = np.np_grp'
      '   and q.head_id=:id and q.head_inst=:inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 80
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
  object qTestDog: TOilQuery
    SQL.Strings = (
      'select *'
      '  from (select sum(d.summ_nds) as dog_sum,'
      '               sum(d.litr) as dog_count'
      '          from v_oil_dog_full d, v_oil_np_type np'
      '         where d.np_type = np.id'
      '           and np.np_grp = :np_group_id'
      '           and d.dog_id = :dog_id'
      '           and d.dog_inst = :dog_inst) dog,'
      '       (select sum(round(b.price * b.litr, 2)) as request_sum,'
      '               sum(b.litr) as request_count'
      '          from v_card_request_full b, v_oil_dog_full d'
      '         where b.dog_id(+) = d.dog_id'
      '           and b.dog_inst(+) = d.dog_inst'
      '           and b.np_group_id = :np_group_id'
      '           and d.dog_id = :dog_id'
      '           and d.dog_inst = :dog_inst'
      
        '           and not (head_id = :id and head_inst = :inst)) reques' +
        't')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 312
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'np_group_id'
      end
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
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
  object qRequest: TOilQuery
    SQL.Strings = (
      'select Card_Number,'
      '       NP_Name,'
      '       Price,'
      '       sum(Litr) as Litr,'
      '       max(Clean_Z_Num) as Clean_Z_Num,'
      '       sum(SumNDS) as SumNDS'
      '  from (select /*+ORDERED USE_HASH(Receipt, Oil_NP_Group)*/'
      
        '         decode(:PrintCard, null, '#39#39', Receipt.Card_Number) as Ca' +
        'rd_Number,'
      '         Oil_NP_Group.FullName as NP_Name,'
      '         Receipt.Price,'
      '         Receipt.Litr,'
      '         to_number(null) as Clean_Z_Num,'
      '         round(Litr * Price, 2) as SumNDS'
      
        '          from v_Card_Request_Full Receipt, v_Oil_NP_Group Oil_N' +
        'P_Group'
      '         where Receipt.Numb = :DocNum'
      '           and Receipt.Date_ = :DocDate'
      '           and Receipt.To_Id = :OrgId'
      '           and Receipt.To_Inst = :OrgInst'
      
        '           and Receipt.np_group_petrol_id = Oil_NP_Group.Petrol_' +
        'Id)'
      ' group by Card_Number, NP_Name, Price')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 504
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'PrintCard'
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'DocNum'
      end
      item
        DataType = ftUnknown
        Name = 'DocDate'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end>
  end
  object qReport: TOilQuery
    SQL.Strings = (
      
        'select /*+ORDERED USE_NL(Oil_Dog, From_Org, From_Rekv, From_Bank' +
        ', To_Org, To_Rekv, To_Bank)*/'
      '        Oil_Dog.* ,'
      '        From_Org.Name as From_Name,'
      '        From_Org.Addr as From_Addr,'
      '        From_Org.Svid_Num as From_Svid_Num,'
      '        From_Org.Nal_Num as From_Nal_Num,'
      '        From_Org.Boss as From_Boss,'
      '        From_Org.Id_Num as From_OKPO,'
      '        From_Org.Phone as From_Phone,'
      '        From_Rekv.Rach_Chet as From_Rach_Chet,'
      '        From_Bank.Name as From_Bank_Name,'
      '        From_Bank.MFO as From_MFO,'
      '        To_Org.Name as To_Name,'
      '        To_Org.Addr as To_Addr,'
      '        To_Org.Svid_Num as To_Svid_Num,'
      '        To_Org.Nal_Num as To_Nal_Num,'
      '        To_Org.Boss as To_Boss,'
      '        To_Org.Id_Num as To_OKPO,'
      '        To_Org.Phone as To_Phone,'
      '        To_Rekv.Rach_Chet as To_Rach_Chet,'
      '        To_Bank.Name as To_Bank_Name,'
      '        To_Bank.MFO as To_MFO,'
      '        To_Org.Face as To_Face,'
      '        To_Org.Passport_ser as Passp_Ser,'
      '        To_Org.Passport_num as Passp_Num,'
      '        To_Org.Passport_whom as Passp_whom,'
      '        To_Org.Passport_when as Passp_when,'
      '        Up_From_Org.Name as Up_From_Name,'
      '        Up_From_Org.Addr as Up_From_Addr,'
      '        Up_From_Org.Phone as Up_From_Phone,'
      '        Up_From_Org.Svid_Num as Up_From_Svid_Num,'
      '        Up_From_Org.Nal_Num as Up_From_Nal_Num'
      '   from Oil_Dog,'
      '        v_Org From_Org,'
      '        v_Org Up_From_Org,'
      '        v_Oil_Rekvizit From_Rekv,'
      '        v_Oil_Bank From_Bank,'
      '        v_Org To_Org,'
      '        v_Oil_Rekvizit To_Rekv,'
      '        v_Oil_Bank To_Bank'
      '  where Oil_Dog.State = '#39'Y'#39
      '    and Oil_Dog.Dog_Date ='
      '      ('
      '        select min(Dog_Date)'
      '        from oil_dog'
      '        where state = '#39'Y'#39
      '        and to_ = :OrgId'
      '        and to_inst = :OrgInst'
      '        and dog_type = '#39'K'#39
      '        and nvl(Sub_Type,0) <> 101'
      '      )'
      '    and Oil_Dog.to_ = :OrgId'
      '    and Oil_Dog.to_inst = :OrgInst'
      '    and Oil_Dog.dog_type = '#39'K'#39
      '    and nvl(Oil_Dog.Sub_type,0) <> 101'
      '    and Oil_Dog.From_ = From_Org.Id'
      '    and Oil_Dog.From_Inst = From_Org.Inst'
      '    and From_Org.Par = Up_From_Org.Id (+)'
      '    and From_Org.Par_Inst = Up_From_Org.Inst (+)'
      '    and Oil_Dog.R_From_ = From_Rekv.Id (+)'
      '    and Oil_Dog.R_From_Inst = From_Rekv.Inst (+)'
      '    and From_Rekv.Id_Bank = From_Bank.Id (+)'
      '    and From_Rekv.Bank_Inst = From_Bank.Inst (+)'
      '    and Oil_Dog.To_ = To_Org.Id'
      '    and Oil_Dog.To_Inst = To_Org.Inst'
      '    and Oil_Dog.R_To_ = To_Rekv.Id (+)'
      '    and Oil_Dog.R_To_Inst = To_Rekv.Inst (+)'
      '    and To_Rekv.Id_Bank = To_Bank.Id (+)'
      '    and To_Rekv.Bank_Inst = To_Bank.Inst (+)'
      '    and rownum = 1'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    FetchAll = True
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 504
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
      end
      item
        DataType = ftInteger
        Name = 'OrgInst'
      end>
  end
end
