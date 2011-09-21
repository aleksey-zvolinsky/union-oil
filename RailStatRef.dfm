inherited RailStatRefForm: TRailStatRefForm
  Left = 223
  Top = 96
  Caption = 'Справочник- Ж.д. станций'
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
    object sbClearName: TSpeedButton
      Left = 288
      Top = 8
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      Visible = False
      OnClick = sbClearNameClick
    end
    object edName: TEdit
      Left = 72
      Top = 8
      Width = 217
      Height = 21
      TabOrder = 0
      Text = 'edName'
      OnChange = edNameChange
    end
  end
  inherited pBase: TPanel
    Top = 47
    Height = 324
    inherited DBGrid1: TDBGridEh
      Height = 324
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
           
          FieldName = 'NAME'
          PickList.Strings = ()
          Width = 345
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
      'Select * from V_OIL_RAIL_STAT'
      'Order By name')
    object qID: TFloatField
      DisplayLabel = 'Номер'
      FieldName = 'ID'
      Origin = 'V_OIL_RAIL_STAT.ID'
    end
    object qNAME: TStringField
      DisplayLabel = 'Название'
      FieldName = 'NAME'
      Origin = 'V_OIL_RAIL_STAT.NAME'
      Size = 50
    end
    object qINST: TFloatField
      FieldName = 'INST'
      Origin = 'V_OIL_RAIL_STAT.INST'
    end
  end
  object SP: TOilStoredProc
        Left = 288
    Top = 108
  end
end
