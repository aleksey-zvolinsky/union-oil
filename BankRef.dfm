inherited BankRefForm: TBankRefForm
  Left = 317
  Top = 253
  Caption = 'Справочник : Банки'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    TabOrder = 2
    inherited Panel3: TPanel
      inherited bbOk: TBitBtn
        Left = 12
        Hint = 'Выбрать банк'
        ModalResult = 1
      end
      inherited bbCancel: TBitBtn
        Hint = 'Закрыть окно'
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
    Height = 99
    TabOrder = 0
    object Panel5: TPanel
      Left = 2
      Top = 2
      Width = 167
      Height = 95
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 28
        Height = 13
        Caption = 'МФО'
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 82
        Height = 13
        Caption = 'Наименование :'
      end
      object sbClearMFO: TSpeedButton
        Left = 132
        Top = 23
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
        OnClick = sbClearMFOClick
      end
      object sbClearName: TSpeedButton
        Left = 132
        Top = 63
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
        OnClick = sbClearNameClick
      end
      object edMFO: TEdit
        Left = 8
        Top = 24
        Width = 121
        Height = 21
        Hint = 'Поле поиска по коду МФО'
        MaxLength = 20
        TabOrder = 0
        OnChange = edMFOChange
      end
      object edName: TEdit
        Left = 8
        Top = 64
        Width = 121
        Height = 21
        Hint = 'Поле поиска по названию'
        MaxLength = 50
        TabOrder = 1
        OnChange = edNameChange
      end
    end
    object Panel6: TPanel
      Left = 169
      Top = 2
      Width = 466
      Height = 95
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object cbHere: TCheckBox
        Left = 8
        Top = 24
        Width = 121
        Height = 17
        Caption = 'Внесенные здесь'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = bbSearchClick
      end
      object cbAlfa: TCheckBox
        Left = 8
        Top = 44
        Width = 185
        Height = 17
        Caption = 'Присланные из Альфа-Нафты'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = bbSearchClick
      end
      object cbOther: TCheckBox
        Left = 8
        Top = 64
        Width = 97
        Height = 17
        Caption = 'Прочие'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = bbSearchClick
      end
    end
  end
  inherited pBase: TPanel
    Top = 109
    Height = 262
    inherited DBGrid1: TDBGridEh
      Height = 262
      Hint = 'Резуоьтаты поиска'
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Width = 39
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Width = 189
        end
        item
          EditButtons = <>
          FieldName = 'MFO'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'NAME_UKR'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Укр. наименование'
          Width = 170
        end
        item
          EditButtons = <>
          FieldName = 'INST'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
        end>
    end
  end
  inherited PanelCol: TPanel
    Top = 109
    Height = 262
    inherited cbCol: TRxCheckListBox
      Height = 234
    end
    inherited pRefresh: TPanel
      Top = 236
    end
  end
  inherited ds: TOraDataSource
    Left = 108
    Top = 196
  end
  inherited q: TOilQuery
    SQL.Strings = (
      'select * from v_oil_bank order by name')
    Left = 144
    Top = 196
  end
end
