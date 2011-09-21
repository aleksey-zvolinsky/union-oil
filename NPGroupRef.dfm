inherited NPGroupRefForm: TNPGroupRefForm
  Left = 236
  Top = 115
  Caption = 'Справочник- Группы НП'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
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
  end
  inherited Panel2: TPanel
    Height = 37
    object Label1: TLabel
      Left = 12
      Top = 12
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object edName: TEdit
      Left = 72
      Top = 8
      Width = 237
      Height = 21
      TabOrder = 0
      Text = 'edName'
    end
  end
  inherited pBase: TPanel
    Top = 47
    Height = 324
    inherited DBGrid1: TDBGridEh
      Height = 324
      Columns = <
        item
           
          FieldName = 'NAME'
          PickList.Strings = ()
          Width = 358
          Visible = True
        end
        item
           
          FieldName = 'ID'
          PickList.Strings = ()
          Visible = True
        end>
    end
  end
  inherited PanelCol: TPanel
    Top = 47
    Height = 324
    inherited cbCol: TRxCheckListBox
      Height = 296
    end
    inherited pRefresh: TPanel
      Top = 298
    end
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select *'
      '  from Oil_NP_Group'
      ' where State = '#39'Y'#39' '
      ' order by Name'
      ' ')
    object qID: TFloatField
      DisplayLabel = 'Номер'
      FieldName = 'ID'
      Origin = 'V_OIL_NP_GROUP.ID'
    end
    object qNAME: TStringField
      DisplayLabel = 'Название'
      FieldName = 'NAME'
      Origin = 'V_OIL_NP_GROUP.NAME'
      Size = 50
    end
    object qPETROL_ID: TFloatField
      FieldName = 'PETROL_ID'
      Origin = 'OIL_NP_GROUP.PETROL_ID'
    end
  end
  object SP: TOilStoredProc
        Left = 292
    Top = 112
  end
end
