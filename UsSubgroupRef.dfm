inherited UsSubgroupRefForm: TUsSubgroupRefForm
  Left = 349
  Top = 267
  Caption = 'Подгруппы сопутствующего товара'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    TabOrder = 2
    inherited Panel3: TPanel
      inherited bbOk: TBitBtn
        ModalResult = 1
        Visible = True
      end
    end
    inherited Panel4: TPanel
      inherited bbSearch: TBitBtn
        Default = False
        OnClick = bbSearchClick
      end
    end
  end
  inherited Panel2: TPanel
    Height = 55
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object edName: TEdit
      Left = 8
      Top = 24
      Width = 101
      Height = 21
      TabOrder = 0
      OnChange = edNameChange
      OnKeyPress = edNameKeyPress
    end
  end
  inherited pBase: TPanel
    Top = 65
    Height = 261
    TabOrder = 1
    inherited DBGrid1: TDBGridEh
      Height = 261
      OnKeyPress = edNameKeyPress
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Код'
          Width = 33
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Название'
          Width = 136
        end
        item
          EditButtons = <>
          FieldName = 'GROUP_ID'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Код группы'
          Visible = False
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'GROUP_NAME'
          Footers = <>
          KeyList.Strings = ()
          MRUList.Items.Strings = ()
          PickList.Strings = ()
          Title.Caption = 'Группа'
          Width = 107
        end>
    end
  end
  inherited PanelCol: TPanel
    Top = 65
    Height = 261
    inherited cbCol: TRxCheckListBox
      Height = 233
    end
    inherited pRefresh: TPanel
      Top = 235
    end
  end
  inherited q: TOilQuery
    object qID: TFloatField
      FieldName = 'ID'
    end
    object qNAME: TStringField
      FieldName = 'NAME'
      Size = 40
    end
    object qGROUP_ID: TFloatField
      FieldName = 'GROUP_ID'
    end
    object qGROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 40
    end
  end
end
