inherited MemoForm: TMemoForm
  Left = 307
  Top = 462
  Width = 658
  Height = 462
  Caption = #1057#1087#1088#1072#1074#1082#1072
  OldCreateOrder = True
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RE1: TRichEdit
    Left = 0
    Top = 0
    Width = 650
    Height = 428
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object ActionList: TActionList
    Left = 24
    Top = 16
    object actClose: TAction
      ShortCut = 27
      OnExecute = actCloseExecute
    end
  end
end
