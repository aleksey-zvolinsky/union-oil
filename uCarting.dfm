inherited CartingForm: TCartingForm
  Left = 352
  Top = 377
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1047#1072#1103#1074#1082#1072' '#1085#1072' '#1087#1086#1089#1083#1091#1075#1091
  ClientHeight = 326
  ClientWidth = 615
  PixelsPerInch = 96
  TextHeight = 13
  inherited pBottom: TPanel
    Top = 293
    Width = 615
    object sbDel: TSpeedButton [0]
      Left = 4
      Top = 4
      Width = 25
      Height = 25
      Action = actDeleteRecord
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888000000000000888877777777777788880FFFFFFFFFF
        0888878888888888788880FFFFFFFFFF0888878888888888788880FF00000000
        0088878877777777778880FF09999999908887887FFFFFFFF78880FF09999999
        908887887FFFFFFFF78880FF000000000088878877777777778880FFFFFFFFFF
        0888878888888888788880F0F00F000F0888878787787778788880FFFFFFFFFF
        0888878888888888788880F000F0FFFF0888878777878888788880FFFFFFF000
        0888878888888777788880F000FFF0808888878777888787888880FFFFFFF008
        8888878888888778888880000000008888888777777777888888}
      Layout = blGlyphTop
      NumGlyphs = 2
    end
    inherited pBtn: TPanel
      Left = 418
    end
  end
  object pnlHeader: TPanel [1]
    Left = 0
    Top = 0
    Width = 615
    Height = 81
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      615
      81)
    object lbClient: TLabel
      Left = 63
      Top = 10
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1083#1110#1108#1085#1090':'
    end
    object lbMobTel: TLabel
      Left = 235
      Top = 34
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = #1052#1086#1073'. '#1090#1077#1083'.:'
    end
    object lbBeginDate: TLabel
      Left = 39
      Top = 34
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1086#1095#1072#1090#1086#1082' '#1076#1110#1111':'
    end
    object lbEndDate: TLabel
      Left = 48
      Top = 58
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1110#1085#1077#1094#1100' '#1076#1110#1111':'
    end
    object ceClient: TComboEdit
      Left = 103
      Top = 6
      Width = 506
      Height = 21
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = ceClientChange
      OnDblClick = ceClientChange
    end
    object meMobTel: TMaskEdit
      Left = 290
      Top = 30
      Width = 129
      Height = 21
      EditMask = '+38!\ (\000\) 000-00-00;0;_'
      MaxLength = 19
      TabOrder = 1
    end
    object deBegin: TDateEdit
      Left = 103
      Top = 30
      Width = 98
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    object deEnd: TDateEdit
      Left = 103
      Top = 54
      Width = 99
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
  end
  object pnlDetails: TPanel [2]
    Left = 0
    Top = 81
    Width = 615
    Height = 212
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object grDetail: TDBGridEh
      Left = 0
      Top = 0
      Width = 615
      Height = 212
      Align = alClient
      Ctl3D = True
      DataSource = dsDetail
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.Tracking = True
      Columns = <
        item
          DisplayFormat = '000 000 000'
          EditButtons = <>
          FieldName = 'CARD_NUMBER'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1082#1080
          Width = 102
        end
        item
          AutoFitColWidth = False
          ButtonStyle = cbsEllipsis
          EditButtons = <>
          FieldName = 'OPER_NAME'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1055#1086#1089#1083#1091#1075#1072
          Width = 371
          OnEditButtonClick = grDetailColumns1EditButtonClick
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'IS_REGULAR'
          Footers = <>
          KeyList.Strings = (
            '1;'
            '0;')
          Title.Alignment = taCenter
          Title.Caption = #1056#1077#1075#1091#1083#1103#1088#1085#1072
          Width = 80
        end>
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select c.*,'
      '       opt.name as oper_name'
      'from v_card_carting_full c, v_oil_oper_type opt'
      'where c.id=:id and c.inst=:inst'
      '  and opt.id = c.oper_id')
    Top = 124
  end
  object dsDetail: TDataSource
    DataSet = mtDetail
    Left = 96
    Top = 141
  end
  object mtDetail: TMemoryTable
    BeforeInsert = mtDetailBeforeInsert
    Left = 76
    Top = 125
    object mtDetailID: TIntegerField
      FieldName = 'ID'
    end
    object mtDetailINST: TIntegerField
      FieldName = 'INST'
    end
    object mtDetailCARD_NUMBER: TIntegerField
      DisplayWidth = 3
      FieldName = 'CARD_NUMBER'
    end
    object mtDetailOPER_NAME: TStringField
      FieldName = 'OPER_NAME'
      Size = 200
    end
    object mtDetailOPER_ID: TFloatField
      FieldName = 'OPER_ID'
    end
    object mtDetailIS_REGULAR: TIntegerField
      FieldName = 'IS_REGULAR'
    end
  end
  object ActionList: TActionList
    Images = MainForm.BaseImage
    Left = 20
    Top = 245
    object actDeleteRecord: TAction
      ImageIndex = 2
      OnExecute = actDeleteRecordExecute
    end
  end
end
