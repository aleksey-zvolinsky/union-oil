inherited CardBlankForm: TCardBlankForm
  Left = 666
  Top = 287
  Width = 438
  Height = 461
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1073#1083#1072#1085#1082#1086#1074' '#1089#1084#1072#1088#1090'-'#1082#1072#1088#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited pBottom: TPanel
    Top = 397
    Width = 430
    Height = 37
    inherited pBtn: TPanel
      Left = 232
      Width = 196
      Height = 33
      inherited bbOk: TBitBtn
        Left = 19
      end
      inherited bbCancel: TBitBtn
        Left = 109
      end
    end
    object ToolBar: TToolBar
      Left = 2
      Top = 2
      Width = 103
      Height = 33
      Align = alLeft
      BorderWidth = 1
      ButtonHeight = 25
      ButtonWidth = 25
      Caption = 'ToolBar'
      DisabledImages = MainForm.BaseImage
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = MainForm.BaseImage
      TabOrder = 1
      object tbAdd: TToolButton
        Left = 0
        Top = 2
        Action = actAddCard
        DropdownMenu = pmAdd
        Style = tbsDropDown
      end
      object tbDelete: TToolButton
        Left = 38
        Top = 2
        Action = actDeleteRecord
      end
    end
  end
  object DBGrid: TDBGridEh [1]
    Left = 0
    Top = 164
    Width = 430
    Height = 233
    Align = alClient
    DataSource = dsDetail
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnExit = DBGridExit
    Columns = <
      item
        DisplayFormat = '000 000 000'
        EditButtons = <>
        FieldName = 'CARD_NUMBER'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footer.ValueType = fvtCount
        Footers = <>
        Width = 104
      end
      item
        AlwaysShowEditButton = True
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'PURSE'
        Footers = <>
        Width = 285
        OnEditButtonClick = DBGridColumns2EditButtonClick
      end>
  end
  object pTop: TPanel [2]
    Left = 0
    Top = 0
    Width = 430
    Height = 123
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      430
      123)
    object LblNumber: TLabel
      Left = 27
      Top = 8
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1086#1084#1077#1088':'
    end
    object sbAuto: TSpeedButton
      Left = 274
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
      Left = 305
      Top = 8
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072':'
    end
    object LblFrom: TLabel
      Left = 22
      Top = 32
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1090' '#1082#1086#1075#1086':'
    end
    object LblTo: TLabel
      Left = 35
      Top = 58
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1086#1084#1091':'
    end
    object LblDogDate: TLabel
      Left = 305
      Top = 106
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072':'
    end
    object LblOper: TLabel
      Left = 11
      Top = 82
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1087#1077#1088#1072#1094#1080#1103':'
    end
    object LblDog: TLabel
      Left = 17
      Top = 106
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1086#1075#1086#1074#1086#1088':'
    end
    object Label2: TLabel
      Left = 200
      Top = 106
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = #1062#1077#1085#1072':'
    end
    object eDocNumber: TEdit
      Left = 64
      Top = 3
      Width = 209
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object deDate_: TDateEdit
      Left = 334
      Top = 3
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 1
      OnChange = deDate_Change
    end
    object ceFrom: TComboEdit
      Left = 64
      Top = 27
      Width = 360
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
      Left = 64
      Top = 53
      Width = 360
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 3
      OnButtonClick = ceToButtonClick
      OnDblClick = ceToButtonClick
    end
    object ceOper: TComboEdit
      Left = 64
      Top = 77
      Width = 360
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      PopupMenu = pmOper
      TabOrder = 4
      OnButtonClick = ceOperButtonClick
      OnChange = ceOperChange
      OnDblClick = ceOperButtonClick
    end
    object ceDog: TComboEdit
      Left = 64
      Top = 101
      Width = 127
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 5
      OnButtonClick = ceDogButtonClick
      OnChange = ceDogChange
      OnDblClick = ceDogButtonClick
    end
    object deDogDate: TDateEdit
      Left = 334
      Top = 101
      Width = 90
      Height = 21
      Enabled = False
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 7
    end
    object ceBlankPrice: TCurrencyEdit
      Left = 229
      Top = 101
      Width = 71
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
      Enabled = False
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 6
    end
  end
  object gbTaxBill: TGroupBox [3]
    Left = 0
    Top = 123
    Width = 430
    Height = 41
    Align = alTop
    Caption = #1053#1072#1083#1086#1075#1086#1074#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
    TabOrder = 3
    DesignSize = (
      430
      41)
    object Label3: TLabel
      Left = 192
      Top = 18
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = #1057#1091#1084#1084#1072':'
    end
    object Label1: TLabel
      Left = 305
      Top = 18
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072':'
    end
    object LblNNNumber: TLabel
      Left = 91
      Top = 18
      Width = 37
      Height = 13
      Caption = #1053#1086#1084#1077#1088':'
    end
    object IsNN: TCheckBox
      Left = 11
      Top = 18
      Width = 65
      Height = 17
      Hint = #1057#1086#1079#1076#1072#1074#1072#1090#1100' '#1053#1053
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1079#1076#1072#1090#1100
      TabOrder = 0
    end
    object eNNNumber: TEdit
      Left = 128
      Top = 14
      Width = 63
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 1
    end
    object ceNNSum: TCurrencyEdit
      Left = 229
      Top = 14
      Width = 71
      Height = 21
      AutoSize = False
      Color = clBtnFace
      DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
      Enabled = False
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 2
    end
    object deNNDate: TDateEdit
      Left = 334
      Top = 14
      Width = 90
      Height = 21
      Color = clBtnFace
      Enabled = False
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 3
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select *'
      '  from v_card_blank_full blank'
      ' where blank.head_id = :id'
      '   and blank.head_inst = :inst'
      ' order by card_number')
  end
  object dsDetail: TDataSource
    DataSet = mtDetail
    Left = 152
    Top = 192
  end
  object mtDetail: TMemoryTable
    BeforeInsert = mtDetailBeforeInsert
    AfterInsert = AfterAction
    AfterEdit = AfterAction
    BeforePost = mtDetailBeforePost
    AfterPost = mtDetailAfterPost
    BeforeDelete = mtDetailBeforeDelete
    AfterDelete = mtDetailAfterDelete
    Left = 136
    Top = 184
    object mtDetailID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object mtDetailINST: TIntegerField
      FieldName = 'INST'
      Visible = False
    end
    object mtDetailCARD_NUMBER: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1099
      FieldName = 'CARD_NUMBER'
    end
    object mtDetailPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
    end
    object mtDetailLOCAL_ID: TIntegerField
      FieldName = 'LOCAL_ID'
    end
    object mtDetailPURSE: TStringField
      DisplayLabel = #1050#1086#1096#1077#1083#1100#1082#1080
      FieldName = 'PURSE'
      Size = 60
    end
    object mtDetailPURSE_IDS: TStringField
      FieldName = 'PURSE_IDS'
    end
  end
  object pmOper: TPopupMenu
    Left = 248
    Top = 168
    object miIn: TMenuItem
      Caption = #1055#1088#1080#1093#1086#1076
      OnClick = miInClick
    end
    object miOut: TMenuItem
      Caption = #1054#1090#1087#1091#1089#1082
      OnClick = miOutClick
    end
  end
  object mtCopy: TMemoryTable
    Left = 48
    Top = 184
    object mtCopyID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object mtCopyINST: TIntegerField
      FieldName = 'INST'
      Visible = False
    end
    object mtCopyCARD_NUMBER: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1099
      FieldName = 'CARD_NUMBER'
    end
    object mtCopyPRICE: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
    end
    object mtCopyLOCAL_ID: TIntegerField
      FieldName = 'LOCAL_ID'
    end
    object mtCopyPURSE: TStringField
      DisplayLabel = #1050#1086#1096#1077#1083#1100#1082#1080
      FieldName = 'PURSE'
      Size = 60
    end
    object mtCopyPURSE_IDS: TStringField
      FieldName = 'PURSE_IDS'
    end
  end
  object ActionList: TActionList
    Images = MainForm.BaseImage
    Left = 160
    Top = 304
    object actAddCard: TAction
      Caption = #1053#1086#1084#1077#1088' +1'
      ImageIndex = 0
      OnExecute = actAddCardExecute
    end
    object actAddCardsAll: TAction
      Caption = #1042#1085#1077#1089#1090#1080' '#1074#1089#1077' ('#1085#1077' '#1087#1088#1086#1076#1072#1085#1099#1077')'
      ImageIndex = 0
      OnExecute = actAddCardsAllExecute
    end
    object actAddCardsList: TAction
      Caption = #1042#1085#1077#1089#1090#1080' '#1080#1079' '#1089#1087#1080#1089#1082#1072' ('#1085#1077' '#1087#1088#1086#1076#1072#1085#1099#1077')'
      Hint = #1057#1084#1072#1088#1090'-'#1082#1072#1088#1090#1099', '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1077#1089#1090#1100' '#1076#1074#1080#1078#1077#1085#1080#1077' '
      ImageIndex = 0
      OnExecute = actAddCardsListExecute
    end
    object actDeleteRecord: TAction
      ImageIndex = 2
      OnExecute = actDeleteRecordExecute
    end
  end
  object qPurse: TOilQuery
    SQL.Strings = (
      'select * from V_CARD_BLANK_DET_PURSE '
      ' where head_id=:id '
      '   and head_inst=:inst')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 48
    Top = 8
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
      '  from (select sum(d.litr) dog_count'
      '          from v_oil_dog_full d'
      '         where d.np_type = 455'
      '           and d.dog_id = :dog_id'
      '           and d.dog_inst = :dog_inst) dog,'
      '       (select count(b.id)-count(ret.id) blank_count'
      
        '          from v_card_blank_full_base b, v_oil_dog_full d , v_ca' +
        'rd_blank_full_base ret'
      '         where b.dog_id(+) = d.dog_id'
      '           and b.dog_inst(+) = d.dog_inst'
      '           and d.np_type = 455'
      '           and d.dog_id = :dog_id'
      '           and d.dog_inst = :dog_inst'
      '           and not (b.head_id = :id and b.head_inst = :inst)'
      '           and ret.oper_id(+) = 252 /* '#1042#1086#1079#1074#1088#1072#1090' */'
      '           and b.card_number = ret.card_number(+)'
      '           and b.to_id = ret.from_id(+)'
      '           and b.to_inst = ret.from_inst(+)) blank        ')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 312
    Top = 168
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
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'inst'
      end>
  end
  object qHistory: TOilQuery
    SQL.Strings = (
      'select (1 - decode(q.rn,'
      '                   1,'
      '                   is_emmision,'
      '                   2,'
      '                   1 - is_emmision,'
      
        '                   decode(q.prev_in_out + q.in_out, 0, 1, 0))) i' +
        's_error,'
      '       sign(sum((1 - decode(q.rn,'
      '                   1,'
      '                   is_emmision,'
      '                   2,'
      '                   1 - is_emmision,'
      
        '                   decode(q.prev_in_out + q.in_out, 0, 1, 0)))) ' +
        'over (partition by card_number)) is_error_card,'
      '       q.*'
      
        '  from (select lag(in_out) over(partition by card_number order b' +
        'y date_, order_) as prev_in_out,'
      
        '               lag(oper_id) over(partition by card_number order ' +
        'by date_, order_) as prev_oper_id,'
      
        '               row_number() over(partition by card_number order ' +
        'by date_, order_) as rn,'
      
        '               decode(oper_id, 254, decode(in_out, 1, 1, 0), 0) ' +
        'is_emmision,'
      '               b.*'
      
        '          from (select head_id, head_inst, in_out,date_,oper_id,' +
        'card_number,'
      
        '                       decode(oper_id, 254,1, 256,2, 253,3, 257,' +
        '6,'
      
        '                         decode(oper_grp_id, 17,5, 18,4, 10)) as' +
        ' order_ '
      '                  from v_card_blank_full_base b'
      '                 union all '
      
        '                select 0,0,to_number(:test_in_out),to_date(:test' +
        '_date),nvl(:oper_id,0),to_number(:card_number),'
      
        '                       decode(:oper_id, 254,1, 256,2, 253,3, 257' +
        ',6,'
      
        '                         decode(:oper_grp_id, 17,5, 18,4, 10)) a' +
        's order_ '
      '                  from dual where :test=1)b'
      '         where card_number = :card_number'
      
        '           and (not(b.head_id=:id and b.head_inst=:inst)or(:id=-' +
        '1 and :inst=-1))'
      '       ) q')
    FetchAll = True
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 80
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'test_in_out'
      end
      item
        DataType = ftUnknown
        Name = 'test_date'
      end
      item
        DataType = ftInteger
        Name = 'oper_id'
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'card_number'
      end
      item
        DataType = ftUnknown
        Name = 'oper_grp_id'
      end
      item
        DataType = ftUnknown
        Name = 'test'
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
  object pmAdd: TPopupMenu
    Left = 16
    Top = 328
    object miPlus1: TMenuItem
      Action = actAddCard
      Checked = True
      GroupIndex = 1
      RadioItem = True
    end
    object miAddAll: TMenuItem
      Action = actAddCardsAll
      GroupIndex = 1
      Hint = #1057#1084#1072#1088#1090'-'#1082#1072#1088#1090#1099', '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1077#1089#1090#1100' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103' '#1076#1083#1103' '#1076#1072#1085#1085#1086#1075#1086' '#1082#1083#1080#1077#1085#1090#1072
      RadioItem = True
    end
    object miAddList: TMenuItem
      Action = actAddCardsList
      GroupIndex = 1
      Hint = #1057#1084#1072#1088#1090'-'#1082#1072#1088#1090#1099', '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1077#1089#1090#1100' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103' '#1076#1083#1103' '#1076#1072#1085#1085#1086#1075#1086' '#1082#1083#1080#1077#1085#1090#1072
      RadioItem = True
    end
  end
  object qClientCards: TOilQuery
    SQL.Strings = (
      'select distinct card_number, to_id, to_inst, '
      '       -- '#1076#1083#1103' ListSelect'
      '       card_number as id, card_number as name  '
      '  from (select card_number, to_id, to_inst'
      '          from v_card_transaction ct'
      '         where ct.oper_num in (5, 7, 12)'
      '         group by card_number, to_id, to_inst) ct'
      ' where to_id = :to_id'
      '   and to_inst = :to_inst'
      '   and not exists (select *'
      '          from card_blank b, v_card_blank_det cb'
      '         where b.id = cb.head_id'
      '           and b.inst = cb.head_inst'
      '           and b.state = '#39'Y'#39
      '           and cb.card_number = ct.card_number'
      '           and b.to_id = ct.to_id'
      '           and b.to_inst = ct.to_inst'
      '           and b.oper_id = 255)')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 264
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'to_id'
      end
      item
        DataType = ftInteger
        Name = 'to_inst'
      end>
  end
end
