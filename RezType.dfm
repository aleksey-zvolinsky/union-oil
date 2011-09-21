inherited RezTypeForm: TRezTypeForm
  Caption = 'Конструктивный тип резервуара'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel4: TPanel
      Visible = False
      inherited bbSearch: TBitBtn
        OnClick = bbSearchClick
      end
    end
  end
  inherited Panel2: TPanel
    Height = 0
  end
  inherited pBase: TPanel
    Top = 10
    Height = 361
    inherited DBGrid1: TDBGridEh
      Height = 361
    end
  end
  inherited PanelCol: TPanel
    Top = 10
    Height = 361
    inherited cbCol: TRxCheckListBox
      Height = 333
    end
    inherited pRefresh: TPanel
      Top = 335
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select * from oil_rez_types where state = '#39'Y'#39)
    object qID: TFloatField
      FieldName = 'ID'
      Origin = 'OIL_REZ_TYPES.ID'
      Visible = False
    end
    object qSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'OIL_REZ_TYPES.STATE'
      Visible = False
      Size = 1
    end
    object qNAME: TStringField
      DisplayLabel = 'Конструктивный тип резервуара'
      FieldName = 'NAME'
      Origin = 'OIL_REZ_TYPES.NAME'
      Size = 70
    end
  end
end
