object frmStart: TfrmStart
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 285
  Top = 163
  Height = 479
  Width = 741
  object OraSession1: TOraSession
    Options.Charset = 'CL8MSWIN1251'
    Options.DateFormat = 'dd.mm.rrrr'
    Options.DateLanguage = 'AMERICAN'
    Options.EnableIntegers = False
    Username = 'victory'
    Password = 'idspispopd'
    AutoCommit = False
    LoginPrompt = False
    OnError = OraSession1Error
    Left = 101
    Top = 56
  end
  object TimerReconnect: TTimer
    Interval = 10000
    OnTimer = TimerReconnectTimer
    Left = 184
    Top = 56
  end
end
