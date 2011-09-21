inherited ExchWarning: TExchWarning
  Left = 550
  Top = 373
  BorderStyle = bsDialog
  Caption = 'Предупреждение'
  ClientHeight = 198
  ClientWidth = 362
  OldCreateOrder = True
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbWarning: TLabel
    Left = 4
    Top = 7
    Width = 253
    Height = 48
    Caption = 
      '                Внимание !'#13#10'Найдены несинхронизированные '#13#10'     ' +
      '             партии !'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bIgnore: TBitBtn
    Left = 263
    Top = 17
    Width = 96
    Height = 25
    Caption = 'Пропустить'
    ModalResult = 5
    TabOrder = 0
    OnClick = bIgnoreClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
      44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
      00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
      33833F333383F33300003333AA463362A433333333383F333833F33300003333
      6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
      33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
      6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
      000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
      333383333333F3330000333333322AAA4333333333333833333F333300003333
      333322A4333333333333338333F333330000333333344A433333333333333338
      3F333333000033333336A24333333333333333833F333333000033333336AA43
      33333333333333833F3333330000333333336663333333333333333888333333
      0000}
    NumGlyphs = 2
  end
  object dbgPart: TDBGridEh
    Left = 0
    Top = 64
    Width = 260
    Height = 133
    DataSource = dsPart
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DOG_'
        Footers = <>
        Title.Caption = 'Партия'
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'TIMES'
        Footers = <>
        Title.Caption = 'Дней осталось'
        Width = 106
      end>
  end
  object Timer1: TTimer
    Interval = 300
    OnTimer = Timer1Timer
    Left = 323
    Top = 155
  end
  object qPart: TOilQuery
    SQL.Strings = (
      
        'select DOG_, decode(sign(Times),-1,'#39'Срок истек'#39',0,'#39'Срок истек'#39',1' +
        ', trunc(Times)||decode(trunc(Times),1,'#39' день'#39',2,'#39' дня'#39',3,'#39' дня'#39',' +
        '4,'#39' дня'#39','#39' дней'#39')||'#39' '#39'||Trunc((Times-trunc(Times))*24)||'#39' ч.'#39') a' +
        's Times, Times as N'
      'from'
      '(select DOG_, Times+:p_Days as Times from'
      
        '    (select DOG_, sum(ALL_) All_part, sum(ALF) Alfa, min(Times) ' +
        'as Times'
      
        '       from (select UPPER(dog) DOG_, count(UPPER(dog)) ALL_, 0 A' +
        'LF, min(dog_date-sysdate) as Times from oil_part'
      '             where state = '#39'Y'#39
      '             group by UPPER(dog)'
      '           union all'
      
        '             select UPPER(dog) DOG_ , 0 ALL_, count(plan_id) ALF' +
        ', 5000 as Times from oil_part'
      '             where state = '#39'Y'#39
      '             group by UPPER(dog))'
      '      group by DOG_) A'
      '    where (All_part > 1) and (Alfa > 0) and (Alfa < All_part)'
      ')'
      'order by N'
      ' '
      ' '
      ' ')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 321
    Top = 110
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_Days'
        ParamType = ptInput
      end>
    object qPartDOG_: TStringField
      FieldName = 'DOG_'
      Size = 15
    end
    object qPartTIMES: TStringField
      FieldName = 'TIMES'
      Size = 89
    end
    object qPartN: TFloatField
      FieldName = 'N'
    end
  end
  object dsPart: TOraDataSource
    DataSet = qPart
    Left = 321
    Top = 64
  end
end
