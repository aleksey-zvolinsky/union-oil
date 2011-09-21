inherited GoalPartForm: TGoalPartForm
  Top = 202
  Caption = 'Типы целевых партий'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
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
      'Select * from V_OIL_GOAL_PART_TYPE'
      'order by Name')
    object qID: TFloatField
      FieldName = 'ID'
      Origin = 'V_OIL_GOAL_PART_TYPE.ID'
    end
    object qNAME: TStringField
      FieldName = 'NAME'
      Origin = 'V_OIL_GOAL_PART_TYPE.NAME'
      Size = 50
    end
  end
end
