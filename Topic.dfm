inherited TopicForm: TTopicForm
  Left = 216
  Top = 195
  Width = 716
  Height = 478
  Caption = 'Надо почитать'
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 708
    Height = 413
    Align = alClient
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 413
    Width = 708
    Height = 38
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel2: TPanel
      Left = 607
      Top = 2
      Width = 99
      Height = 34
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bClose: TBitBtn
        Left = 6
        Top = 6
        Width = 86
        Height = 25
        Anchors = [akTop]
        Caption = 'Закрыть'
        TabOrder = 0
        OnClick = bCloseClick
        Kind = bkClose
      end
    end
  end
  object qText: TOilQuery
    SQL.Strings = (
      '\B{16}Изменения и дополнения в версии 102:\D{10}'
      '\B{BLUE}1.\D Вот такое супер изменнение'
      '\B{BLUE}2.\D Вот такое второе супер изменнение')
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 464
    Top = 184
  end
end
