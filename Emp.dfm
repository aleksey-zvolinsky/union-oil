inherited EmpForm: TEmpForm
  Left = 434
  Top = 271
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
  ClientHeight = 306
  ClientWidth = 409
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 274
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 2
      Width = 49
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
    end
    object Label2: TLabel
      Left = 130
      Top = 2
      Width = 22
      Height = 13
      Caption = #1048#1084#1103
    end
    object Label3: TLabel
      Left = 235
      Top = 2
      Width = 47
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    end
    object Label4: TLabel
      Left = 6
      Top = 42
      Width = 58
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076'.'
    end
    object Label5: TLabel
      Left = 130
      Top = 42
      Width = 45
      Height = 13
      Caption = #1048#1076#1077#1085#1090'.'#8470
    end
    object Label6: TLabel
      Left = 6
      Top = 80
      Width = 31
      Height = 13
      Caption = #1040#1076#1088#1077#1089
    end
    object Label13: TLabel
      Left = 295
      Top = 42
      Width = 45
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085
    end
    object Label14: TLabel
      Left = 365
      Top = 2
      Width = 20
      Height = 13
      Caption = #1055#1086#1083
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 120
      Width = 409
      Height = 58
      Align = alBottom
      Caption = #1055#1072#1089#1087#1086#1088#1090
      TabOrder = 0
      object Label8: TLabel
        Left = 6
        Top = 15
        Width = 31
        Height = 13
        Caption = #1057#1077#1088#1080#1103
      end
      object Label9: TLabel
        Left = 90
        Top = 15
        Width = 33
        Height = 13
        Caption = #1042#1099#1076#1072#1085
      end
      object Label10: TLabel
        Left = 307
        Top = 15
        Width = 52
        Height = 13
        Caption = #1044#1072#1090#1072' '#1074#1099#1076'.'
      end
      object DBEdit6: TDBEdit
        Left = 6
        Top = 31
        Width = 67
        Height = 21
        DataField = 'PASS_NUM'
        DataSource = EmpRefForm.ds
        TabOrder = 0
      end
      object DBEdit7: TDBEdit
        Left = 90
        Top = 31
        Width = 199
        Height = 21
        DataField = 'PASS_GIVE'
        DataSource = EmpRefForm.ds
        TabOrder = 1
      end
      object DBDateEdit2: TDBDateEdit
        Left = 307
        Top = 31
        Width = 93
        Height = 21
        DataField = 'PASS_GIVE_D'
        DataSource = EmpRefForm.ds
        NumGlyphs = 2
        TabOrder = 2
      end
    end
    object GroupBox3: TGroupBox
      Left = 0
      Top = 178
      Width = 409
      Height = 96
      Align = alBottom
      Caption = #1056#1072#1073#1086#1090#1072
      TabOrder = 1
      object Label7: TLabel
        Left = 6
        Top = 54
        Width = 58
        Height = 13
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      end
      object Label11: TLabel
        Left = 203
        Top = 54
        Width = 37
        Height = 13
        Caption = #1055#1088#1080#1085#1103#1090
      end
      object Label12: TLabel
        Left = 310
        Top = 54
        Width = 38
        Height = 13
        Caption = #1059#1074#1086#1083#1077#1085
      end
      object lOrg: TLabel
        Left = 6
        Top = 15
        Width = 67
        Height = 13
        Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      end
      object bClearOrg: TSpeedButton
        Left = 380
        Top = 30
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
        OnClick = bClearOrgClick
      end
      object DBDateEdit3: TDBDateEdit
        Left = 203
        Top = 68
        Width = 90
        Height = 21
        DataField = 'HIRE_DATE'
        DataSource = EmpRefForm.ds
        NumGlyphs = 2
        TabOrder = 0
      end
      object DBDateEdit4: TDBDateEdit
        Left = 310
        Top = 68
        Width = 93
        Height = 21
        DataField = 'DIS_DATE'
        DataSource = EmpRefForm.ds
        NumGlyphs = 2
        TabOrder = 1
      end
      object DBEdit8: TDBEdit
        Left = 6
        Top = 68
        Width = 179
        Height = 21
        DataField = 'POST_'
        DataSource = EmpRefForm.ds
        TabOrder = 2
      end
      object dbceOrg: TRxDBComboEdit
        Left = 6
        Top = 31
        Width = 373
        Height = 21
        DataField = 'ORG_NAME'
        DataSource = EmpRefForm.ds
        DirectInput = False
        GlyphKind = gkDropDown
        NumGlyphs = 1
        TabOrder = 3
        OnButtonClick = dbceOrgButtonClick
        OnDblClick = dbceOrgButtonClick
      end
    end
    object eName: TDBEdit
      Left = 130
      Top = 17
      Width = 92
      Height = 21
      DataField = 'I_NAME'
      DataSource = EmpRefForm.ds
      TabOrder = 2
    end
    object eSecName: TDBEdit
      Left = 235
      Top = 17
      Width = 117
      Height = 21
      DataField = 'O_NAME'
      DataSource = EmpRefForm.ds
      TabOrder = 3
    end
    object eSurName: TDBEdit
      Left = 6
      Top = 17
      Width = 110
      Height = 21
      DataField = 'F_NAME'
      DataSource = EmpRefForm.ds
      TabOrder = 4
    end
    object cbSex: TDBComboBox
      Left = 365
      Top = 17
      Width = 43
      Height = 21
      Style = csDropDownList
      DataField = 'SEX'
      DataSource = EmpRefForm.ds
      ItemHeight = 13
      Items.Strings = (
        #1052
        #1046)
      TabOrder = 5
    end
    object DBEdit4: TDBEdit
      Left = 295
      Top = 58
      Width = 112
      Height = 21
      DataField = 'PHONE'
      DataSource = EmpRefForm.ds
      TabOrder = 6
    end
    object DBDateEdit1: TDBDateEdit
      Left = 6
      Top = 58
      Width = 110
      Height = 21
      DataField = 'DATE_BIRTH'
      DataSource = EmpRefForm.ds
      NumGlyphs = 2
      TabOrder = 7
    end
    object DBEdit5: TDBEdit
      Left = 6
      Top = 96
      Width = 395
      Height = 21
      DataField = 'ADDR'
      DataSource = EmpRefForm.ds
      TabOrder = 8
    end
    object DBEdit9: TDBEdit
      Left = 130
      Top = 58
      Width = 151
      Height = 21
      DataField = 'ID_NUM'
      DataSource = EmpRefForm.ds
      TabOrder = 9
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 274
    Width = 409
    Height = 32
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel3: TPanel
      Left = 212
      Top = 2
      Width = 195
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbOk: TBitBtn
        Left = 10
        Top = 2
        Width = 87
        Height = 25
        Caption = '&'#1055#1088#1080#1085#1103#1090#1100
        Default = True
        TabOrder = 0
        OnClick = bbOkClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object bbCancel: TBitBtn
        Left = 106
        Top = 2
        Width = 87
        Height = 25
        Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 1
        Kind = bkCancel
      end
    end
  end
  object qCheckEmploy: TOilQuery
    SQL.Strings = (
      ' select F_Name'
      '   from Oil_Employ'
      '  where State = '#39'Y'#39
      '    and F_Name = :F_Name'
      '    and I_Name = :I_Name'
      '    and O_Name = :O_Name'
      '    and not(Id = :Id and Inst = :Inst)'
      ' ')
    MasterSource = EmpRefForm.ds
        DataSource = EmpRefForm.ds
    RequestLive = False
    UpdateMode = upWhereAll
    Left = 343
    Top = 363
    ParamData = <
      item
        DataType = ftString
        Name = 'F_NAME'
      end
      item
        DataType = ftString
        Name = 'I_NAME'
      end
      item
        DataType = ftString
        Name = 'O_NAME'
      end
      item
        DataType = ftFloat
        Name = 'ID'
      end
      item
        DataType = ftFloat
        Name = 'INST'
      end>
  end
end
