inherited PipeRefForm: TPipeRefForm
  Caption = 'Технологические трубопроводы'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    TabOrder = 3
    inherited Panel3: TPanel
      TabOrder = 3
      inherited bbOk: TBitBtn
        ModalResult = 1
      end
    end
    inherited PAdd: TPanel
      TabOrder = 1
      Visible = True
      inherited sbAdd: TSpeedButton
        OnClick = sbAddClick
      end
    end
    inherited PEdit: TPanel
      TabOrder = 2
      Visible = True
      inherited sbEdit: TSpeedButton
        Top = 3
        Height = 24
      end
    end
    inherited pDel: TPanel
      TabOrder = 4
      Visible = True
      inherited sbDel: TSpeedButton
        OnClick = sbDelClick
      end
    end
    inherited Panel4: TPanel
      TabOrder = 0
      inherited bbClear: TBitBtn
        OnClick = bbClearClick
      end
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
  end
  inherited Panel2: TPanel
    Height = 39
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 67
      Height = 13
      Caption = 'Организация'
    end
    object edFrom: TComboEdit
      Left = 88
      Top = 8
      Width = 377
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = edFromButtonClick
    end
  end
  inherited pBase: TPanel
    Top = 49
    Height = 322
    TabOrder = 0
    inherited DBGrid1: TDBGridEh
      Height = 322
    end
  end
  inherited PanelCol: TPanel
    Top = 49
    Height = 322
    inherited cbCol: TRxCheckListBox
      Height = 294
    end
    inherited pRefresh: TPanel
      Top = 296
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select op.*, oo.name from'
      '  oil_pipe op,'
      '  v_org oo '
      'where'
      '  op.state = '#39'Y'#39' and'
      '  oo.State = '#39'Y'#39' and'
      '  op.org_id = oo.id and'
      '  op.org_inst = oo.inst ')
    object qID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_PIPE.ID'
      Visible = False
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Origin = 'OIL_PIPE.INST'
      Visible = False
    end
    object qSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'OIL_PIPE.STATE'
      Visible = False
      Size = 1
    end
    object qORG_ID: TFloatField
      FieldName = 'ORG_ID'
      Origin = 'OIL_PIPE.ORG_ID'
      Visible = False
    end
    object qORG_INST: TFloatField
      FieldName = 'ORG_INST'
      Origin = 'OIL_PIPE.ORG_INST'
      Visible = False
    end
    object qBOUNDS: TStringField
      DisplayLabel = 'Границы участка'
      FieldName = 'BOUNDS'
      Origin = 'OIL_PIPE.BOUNDS'
      Size = 80
    end
    object qDIAMETER: TFloatField
      DisplayLabel = 'Диаметр мм'
      FieldName = 'DIAMETER'
      Origin = 'OIL_PIPE.DIAMETER'
    end
    object qLENGTH_: TFloatField
      DisplayLabel = 'Длина м'
      FieldName = 'LENGTH_'
      Origin = 'OIL_PIPE.LENGTH_'
    end
    object qNAME: TStringField
      DisplayLabel = 'Организация - владелец'
      FieldName = 'NAME'
      Origin = 'OIL_ORG.NAME'
      Size = 100
    end
  end
  object delQ: TOilQuery
    SQL.Strings = (
      'update oil_pipe set state = '#39'N'#39' where id = :id and inst = :inst')
    MasterSource = ds
        DataSource = ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 144
    Top = 237
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
end
