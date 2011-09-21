inherited DimRefForm: TDimRefForm
  Left = 210
  Top = 111
  Caption = 'Справочник- Единицы измерения'
  ClientWidth = 470
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 470
    TabOrder = 2
    inherited Panel3: TPanel
      Left = 273
      inherited bbOk: TBitBtn
        Left = 12
      end
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
  end
  inherited Panel2: TPanel
    Width = 470
    Height = 37
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 12
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object sbClearName: TSpeedButton
      Left = 292
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
      Width = 221
      Height = 21
      TabOrder = 0
      Text = 'edName'
    end
  end
  inherited pBase: TPanel
    Top = 47
    Width = 320
    Height = 324
    inherited DBGrid1: TDBGridEh
      Width = 320
      Height = 324
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      Columns = <
        item
           
          FieldName = 'NAME'
          PickList.Strings = ()
          Width = 182
          Visible = True
        end
        item
           
          FieldName = 'ID'
          PickList.Strings = ()
          Width = 84
          Visible = True
        end>
    end
  end
  inherited pnlHideFilter: TPanel
    Width = 470
    inherited pnlTuneGridBtn: TPanel
      Left = 441
    end
  end
  inherited PanelCol: TPanel
    Left = 320
    Top = 47
    Height = 324
    inherited cbCol: TRxCheckListBox
      Height = 296
    end
    inherited pRefresh: TPanel
      Top = 298
    end
  end
  inherited ds: TOraDataSource
    Left = 168
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select * from V_OIL_DIM where state='#39'Y'#39' '
      'order by NAME')
    object qID: TFloatField
      DisplayLabel = 'Номер'
      FieldName = 'ID'
      Origin = 'V_OIL_DIM.ID'
    end
    object qNAME: TStringField
      DisplayLabel = 'Название'
      FieldName = 'NAME'
      Origin = 'V_OIL_DIM.NAME'
      Size = 50
    end
    object qISSHTUKI: TStringField
      FieldName = 'ISSHTUKI'
      Origin = 'V_OIL_DIM.ISSHTUKI'
      Size = 1
    end
    object qISFASOV: TStringField
      FieldName = 'ISFASOV'
      Origin = 'V_OIL_DIM.ISFASOV'
      Size = 1
    end
  end
  object SP: TOilStoredProc
        Left = 232
    Top = 108
  end
end
