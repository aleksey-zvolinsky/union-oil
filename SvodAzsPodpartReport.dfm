inherited SvodAzsPodpartReportForm: TSvodAzsPodpartReportForm
  Left = 473
  Top = 287
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Сводная ведомость по АЗС с подпартиями'
  ClientHeight = 213
  ClientWidth = 301
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 13
    Height = 13
    Caption = 'От'
  end
  object Label2: TLabel
    Left = 138
    Top = 10
    Width = 12
    Height = 13
    Caption = 'по'
  end
  object Label3: TLabel
    Left = 8
    Top = 29
    Width = 83
    Height = 13
    Caption = 'Подразделение:'
  end
  object SpeedButton1: TSpeedButton
    Left = 275
    Top = 44
    Width = 23
    Height = 22
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
    OnClick = SpeedButton1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 181
    Width = 301
    Height = 32
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 7
    object BitBtn1: TBitBtn
      Left = 4
      Top = 3
      Width = 100
      Height = 25
      Caption = 'Печать'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B004000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000
        000000000000000000000000000000000000000000000000000000C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000C6C6C6000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C00000000000000000000000000000000000000000
        00000000000000000000000000000000000000C6C6C6000000C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600FFFF
        00FFFF00FFFFC6C6C6C6C6C6000000000000000000C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C684848484848484
        8484C6C6C6C6C6C6000000C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000C6C6C6C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0000000C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000
        C6C6C6000000C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
        00000000000000000000000000000000000000000000000000C6C6C6000000C6
        C6C6000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C6C6000000C6C6
        C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF00
        0000000000000000000000000000FFFFFF000000000000000000000000C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF000000000000
        000000000000000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000000000000000000000000000
        00000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0}
    end
    object btnOk: TBitBtn
      Left = 108
      Top = 3
      Width = 100
      Height = 25
      Caption = 'Выход'
      TabOrder = 1
      OnClick = btnOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 160
    Top = 70
    Width = 137
    Height = 75
    Caption = 'Тип товара'
    TabOrder = 4
    object CBKom: TCheckBox
      Left = 10
      Top = 15
      Width = 98
      Height = 17
      Caption = 'Комиссия'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CBHr: TCheckBox
      Left = 10
      Top = 51
      Width = 97
      Height = 17
      Caption = 'Хранение'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CBSob: TCheckBox
      Left = 10
      Top = 33
      Width = 95
      Height = 17
      Caption = 'Собственный'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object DateEdit1: TDateEdit
    Left = 34
    Top = 6
    Width = 90
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object DateEdit2: TDateEdit
    Left = 164
    Top = 6
    Width = 90
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object CEPpon: TComboEdit
    Left = 8
    Top = 44
    Width = 265
    Height = 21
    Hint = 'В этом поле укажите организацию для которой строиться отчет'
    DirectInput = False
    GlyphKind = gkDropDown
    NumGlyphs = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnButtonClick = CEPponButtonClick
    OnDblClick = CEPponButtonClick
  end
  object RGStoimost: TRadioGroup
    Left = 8
    Top = 70
    Width = 145
    Height = 52
    Hint = 'Отпуск талонов отображается только при собственной оплате'
    Caption = 'Стоимость'
    ItemIndex = 0
    Items.Strings = (
      'По учетной цене'
      'По цене продаж')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object RGSort: TRadioGroup
    Left = 8
    Top = 125
    Width = 145
    Height = 52
    Caption = 'Группировка'
    ItemIndex = 0
    Items.Strings = (
      'По АЗС'
      'По партиям')
    TabOrder = 5
    OnClick = RGSortClick
  end
  object CBPartItogo: TCheckBox
    Left = 160
    Top = 152
    Width = 137
    Height = 17
    Caption = 'Итоги по партиям'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object q: TOilQuery
    SQL.Strings = (
      '--> SvodAzsPodpart,Reports'
      
        'select Q2.*, RestOnEndSt - RestOnBeginSt - PrihodSt + RashSt as ' +
        'Pereoc'
      '  from (select Q1.*,'
      
        '               RestOnBeginSht + PrihodSht - RashSht as RestOnEnd' +
        'Sht,'
      
        '               RestOnBeginTonn + PrihodTonn - RashTonn as RestOn' +
        'EndTonn,'
      
        '               RestOnBeginLitr + PrihodLitr - RashLitr as RestOn' +
        'EndLitr,'
      '               Round((RestOnBeginLitr + PrihodLitr - RashLitr +'
      
        '                     RestOnBeginSht + PrihodSht - RashSht) * nvl' +
        '(E_Price, 0),'
      '                     2) as RestOnEndSt,'
      '               Round((RestOnBeginTonn + PrihodTonn - RashTonn +'
      '                     RestOnBeginSht + PrihodSht - RashSht) * Ss,'
      '                     2) as RestOnEndSs'
      '          from (select Q.*,'
      
        '                       Round((RestOnBeginLitr + RestOnBeginSht) ' +
        '* B_Price, 2) as RestOnBeginSt'
      
        '                  from (select /*+ORDERED USE_MERGE(Q, BegPrice,' +
        ' EndPrice)*/'
      '                               Q.*,'
      
        '                               decode(Q.RestOnBeginTonn + Q.Rest' +
        'OnBeginSht,'
      '                                 0, 0, '
      
        '                                 NVL(BegPrice.s_price, NVL(EndPr' +
        'ice.s_price, 0))) as B_Price,'
      
        '                               NVL(EndPrice.s_price, 0) as E_Pri' +
        'ce'
      '                          from (select *'
      
        '                                  from (select np_groupid as grp' +
        '_id,'
      
        '                                               np_group as group' +
        'name,'
      '                                               azsname as name,'
      
        '                                               dimname as dim_na' +
        'me,'
      '                                               ttn_id,'
      '                                               ttn_inst,'
      '                                               part_id as id,'
      
        '                                               part_inst as inst' +
        ','
      '                                               dog,'
      '                                               dog_date,'
      '                                               ss,'
      '                                               base_,'
      
        '                                               np_type as nptype' +
        'name,'
      '                                               dimid as dim_id,'
      '                                               sub_part,'
      
        '                                               sum(RestOnBegin) ' +
        'as RestOnBeginTonn,'
      
        '                                               sum(RestOnBeginLi' +
        'tr) as RestOnBeginLitr,'
      
        '                                               sum(RestOnBeginSh' +
        'tuki) as RestOnBeginSht,'
      
        '                                               sum(RestOnBeginSs' +
        ') as RestOnBeginSs,'
      
        '                                               sum(prihod) as Pr' +
        'ihodTonn,'
      
        '                                               sum(prihodLitr) a' +
        's PrihodLitr,'
      
        '                                               sum(prihodshtuki)' +
        ' as PrihodSht,'
      
        '                                               sum(prihodst) as ' +
        'PrihodSt,'
      
        '                                               sum(prihodss) as ' +
        'PrihodSs,'
      
        '                                               sum(IsNal*rashod_' +
        'tonn) as NalTonn,'
      
        '                                               sum(IsNal*rashod_' +
        'litr) as NalLitr,'
      
        '                                               sum(IsNal*rashod_' +
        'shtuki) as NalSht,'
      
        '                                               sum(IsNal*rashod_' +
        'st) as NalSt,'
      
        '                                               sum(IsNal*rashod_' +
        'ss) as NalSs,'
      
        '                                               sum(IsTalon*rasho' +
        'd_tonn) as TalonTonn,'
      
        '                                               sum(IsTalon*rasho' +
        'd_litr) as TalonLitr,'
      
        '                                               sum(IsTalon*rasho' +
        'd_shtuki) as TalonSht,'
      
        '                                               sum(IsTalon*rasho' +
        'd_st) as TalonSt,'
      
        '                                               sum(IsTalon*rasho' +
        'd_ss) as TalonSs,'
      
        '                                               sum(IsCard*rashod' +
        '_tonn) as CardTonn,'
      
        '                                               sum(IsCard*rashod' +
        '_litr) as CardLitr,'
      
        '                                               sum(IsCard*rashod' +
        '_shtuki) as CardSht,'
      
        '                                               sum(IsCard*rashod' +
        '_st) as CardSt,'
      
        '                                               sum(IsCard*rashod' +
        '_ss) as CardSs,'
      
        '                                               sum(IsBNal*rashod' +
        '_tonn) as BNalTonn,'
      
        '                                               sum(IsBNal*rashod' +
        '_litr) as BNalLitr,'
      
        '                                               sum(IsBNal*rashod' +
        '_shtuki) as BNalSht,'
      
        '                                               sum(IsBNal*rashod' +
        '_st) as BNalSt,'
      
        '                                               sum(IsBNal*rashod' +
        '_ss) as BNalSs,'
      
        '                                               sum(IsOwnNeeds*ra' +
        'shod_tonn) as Own_needsTonn,'
      
        '                                               sum(IsOwnNeeds*ra' +
        'shod_litr) as Own_needsLitr,'
      
        '                                               sum(IsOwnNeeds*ra' +
        'shod_shtuki) as Own_needsSht,'
      
        '                                               sum(IsOwnNeeds*ra' +
        'shod_st) as Own_needsSt,'
      
        '                                               sum(IsOwnNeeds*ra' +
        'shod_ss) as Own_needsSs,'
      
        '                                               sum(IsNaturalLeak' +
        '*rashod_tonn) as Natural_leakTonn,'
      
        '                                               sum(IsNaturalLeak' +
        '*rashod_litr) as Natural_leakLitr,'
      
        '                                               sum(IsNaturalLeak' +
        '*rashod_shtuki) as Natural_leakSht,'
      
        '                                               sum(IsNaturalLeak' +
        '*rashod_st) as Natural_leakSt,'
      
        '                                               sum(IsNaturalLeak' +
        '*rashod_ss) as Natural_leakSs,'
      
        '                                               sum(IsOther*rasho' +
        'd_tonn) as OtherTonn,'
      
        '                                               sum(IsOther*rasho' +
        'd_litr) as OtherLitr,'
      
        '                                               sum(IsOther*rasho' +
        'd_shtuki) as OtherSht,'
      
        '                                               sum(IsOther*rasho' +
        'd_st) as OtherSt,'
      
        '                                               sum(IsOther*rasho' +
        'd_ss) as OtherSs,'
      
        '                                               sum(IsShortage*ra' +
        'shod_tonn) as ShortageTonn,'
      
        '                                               sum(IsShortage*ra' +
        'shod_litr) as ShortageLitr,'
      
        '                                               sum(IsShortage*ra' +
        'shod_shtuki) as ShortageSht,'
      
        '                                               sum(IsShortage*ra' +
        'shod_st) as ShortageSt,'
      
        '                                               sum(IsShortage*ra' +
        'shod_ss) as ShortageSs,'
      
        '                                               sum(IsAuto*rashod' +
        '_tonn) as AvtoTonn,'
      
        '                                               sum(IsAuto*rashod' +
        '_litr) as AvtoLitr,'
      
        '                                               sum(IsAuto*rashod' +
        '_shtuki) as AvtoSht,'
      
        '                                               sum(IsAuto*rashod' +
        '_st) as AvtoSt,'
      
        '                                               sum(IsAuto*rashod' +
        '_ss) as AvtoSs,'
      
        '                                               sum(IsSetOffCommu' +
        'n*rashod_tonn) as SetOffCommunTonn,'
      
        '                                               sum(IsSetOffCommu' +
        'n*rashod_litr) as SetOffCommunLitr,'
      
        '                                               sum(IsSetOffCommu' +
        'n*rashod_shtuki) as SetOffCommunSht,'
      
        '                                               sum(IsSetOffCommu' +
        'n*rashod_st) as SetOffCommunSt,'
      
        '                                               sum(IsSetOffCommu' +
        'n*rashod_ss) as SetOffCommunSs,'
      
        '                                               sum(IsSetOffSecur' +
        '*rashod_tonn) as SetOffSecurTonn,'
      
        '                                               sum(IsSetOffSecur' +
        '*rashod_litr) as SetOffSecurLitr,'
      
        '                                               sum(IsSetOffSecur' +
        '*rashod_shtuki) as SetOffSecurSht,'
      
        '                                               sum(IsSetOffSecur' +
        '*rashod_st) as SetOffSecurSt,'
      
        '                                               sum(IsSetOffSecur' +
        '*rashod_ss) as SetOffSecurSs,'
      
        '                                               sum(rashod_tonn) ' +
        'as RashTonn,'
      
        '                                               sum(rashod_litr) ' +
        'as RashLitr,'
      
        '                                               sum(rashod_shtuki' +
        ') as RashSht,'
      
        '                                               sum(rashod_st) as' +
        ' RashSt,'
      
        '                                               sum(rashod_ss) as' +
        ' RashSs'
      
        '                                          from (select decode(op' +
        'erid,12,1,0)as IsNal,'
      
        '                                                       decode(op' +
        'erid,14,1,0)as IsTalon,'
      
        '                                                       decode(op' +
        'erid,153,1,0)as IsCard,'
      
        '                                                       decode(op' +
        'erid,11,1,0)as IsBNal,'
      
        '                                                       decode(op' +
        'erid,15,1,47,1,0) as IsOwnNeeds,'
      
        '                                                       decode(op' +
        'erid,16,1,0)as IsNaturalLeak,'
      
        '                                                       decode(op' +
        'erid,11,0,12,0,15,0,14,0,47,0,16,0,19,0,40,0,49,0,51,0,153,0,1) ' +
        'as IsOther,'
      
        '                                                       decode(op' +
        'erid,19,1,0) as IsShortage,'
      
        '                                                       decode(op' +
        'erid,40,1,0) as IsAuto,'
      
        '                                                       decode(op' +
        'erid,49,1,0) as IsSetOffCommun,'
      
        '                                                       decode(op' +
        'erid,51,1,0) as IsSetOffSecur,'
      '                                                       AzsId,'
      '                                                       OblId,'
      '                                                       PponId,'
      '                                                       date_,'
      '                                                       AzsName,'
      '                                                       operid,'
      '                                                       dimid,'
      
        '                                                       np_typeid' +
        ','
      '                                                       np_type,'
      
        '                                                       np_groupi' +
        'd,'
      '                                                       np_group,'
      '                                                       base_,'
      '                                                       ss,'
      '                                                       dog,'
      '                                                       dog_date,'
      '                                                       dimname,'
      
        '                                                       own_goods' +
        ','
      
        '                                                       partid as' +
        ' part_id,'
      
        '                                                       partinst ' +
        'as part_inst,'
      '                                                       sub_part,'
      '                                                       ttn_id,'
      '                                                       ttn_inst,'
      
        '                                                       -nvl(tonn' +
        ', 0) as RestOnBegin,'
      
        '                                                       -nvl(litr' +
        ', 0) as RestOnBeginLitr,'
      
        '                                                       -nvl(shtu' +
        'ki, 0) as RestOnBeginShtuki,'
      
        '                                                       -nvl(summ' +
        'a_ss, 0) as RestOnBeginSs,'
      
        '                                                       0 as prih' +
        'od,'
      
        '                                                       0 as prih' +
        'odlitr,'
      
        '                                                       0 as prih' +
        'odshtuki,'
      
        '                                                       0 as prih' +
        'odst,'
      
        '                                                       0 as prih' +
        'odss,'
      
        '                                                       0 as rash' +
        'od_tonn,'
      
        '                                                       0 as rash' +
        'od_litr,'
      
        '                                                       0 as rash' +
        'od_shtuki,'
      
        '                                                       0 as rash' +
        'od_st,'
      
        '                                                       0 as rash' +
        'od_ss'
      
        '                                                  from v_oil_npm' +
        'ove'
      
        '                                                 where IsSummary' +
        ' <> '#39'N'#39
      '                                                   and NbAzs = 1'
      
        '                                                   and date_ < :' +
        'BeginDate'
      '                                                UNION ALL'
      
        '                                                select decode(op' +
        'erid,12,1,0)as IsNal,'
      
        '                                                       decode(op' +
        'erid,14,1,0)as IsTalon,'
      
        '                                                       decode(op' +
        'erid,153,1,0)as IsCard,'
      
        '                                                       decode(op' +
        'erid,11,1,0)as IsBNal,'
      
        '                                                       decode(op' +
        'erid,15,1,47,1,0) as IsOwnNeeds,'
      
        '                                                       decode(op' +
        'erid,16,1,0)as IsNaturalLeak,'
      
        '                                                       decode(op' +
        'erid,11,0,12,0,15,0,14,0,47,0,16,0,19,0,40,0,49,0,51,0,153,0,1) ' +
        'as IsOther,'
      
        '                                                       decode(op' +
        'erid,19,1,0) as IsShortage,'
      
        '                                                       decode(op' +
        'erid,40,1,0) as IsAuto,'
      
        '                                                       decode(op' +
        'erid,49,1,0) as IsSetOffCommun,'
      
        '                                                       decode(op' +
        'erid,51,1,0) as IsSetOffSecur,'
      '                                                       AzsId,'
      '                                                       OblId,'
      '                                                       PponId,'
      '                                                       date_,'
      '                                                       AzsName,'
      '                                                       operid,'
      '                                                       dimid,'
      
        '                                                       np_typeid' +
        ','
      '                                                       np_type,'
      
        '                                                       np_groupi' +
        'd,'
      '                                                       np_group,'
      '                                                       base_,'
      '                                                       ss,'
      '                                                       dog,'
      '                                                       dog_date,'
      '                                                       dimname,'
      
        '                                                       own_goods' +
        ','
      
        '                                                       partid as' +
        ' part_id,'
      
        '                                                       partinst ' +
        'as part_inst,'
      '                                                       sub_part,'
      '                                                       ttn_id,'
      '                                                       ttn_inst,'
      
        '                                                       0 as Rest' +
        'OnBegin,'
      
        '                                                       0 as Rest' +
        'OnBeginLitr,'
      
        '                                                       0 as Rest' +
        'OnBeginShtuki,'
      
        '                                                       0 as Rest' +
        'OnBeginSs,'
      
        '                                                       -nvl(Rash' +
        'Prih*tonn,0) as prihod,'
      
        '                                                       -nvl(Rash' +
        'Prih*litr,0) as prihodlitr,'
      
        '                                                       -nvl(Rash' +
        'Prih*shtuki,0) as prihodshtuki,'
      
        '                                                       -nvl(Rash' +
        'Prih*summa,0) as prihodst,'
      
        '                                                       -nvl(Rash' +
        'Prih*summa_ss,0) as prihodss,'
      
        '                                                       nvl((1-Ra' +
        'shPrih)*tonn,0) as rashod_tonn,'
      
        '                                                       nvl((1-Ra' +
        'shPrih)*litr,0) as rashod_litr,'
      
        '                                                       nvl((1-Ra' +
        'shPrih)*shtuki,0) as rashod_shtuki,'
      
        '                                                       nvl((1-Ra' +
        'shPrih)*summa,0) as rashod_summa,'
      
        '                                                       nvl((1-Ra' +
        'shPrih)*summa_ss,0) as rashod_ss'
      
        '                                                  from v_oil_npm' +
        'ove'
      
        '                                                 where IsSummary' +
        ' <> '#39'Y'#39
      '                                                   and NbAzs = 1'
      
        '                                                   and IsTalonDe' +
        't <> '#39'Y'#39
      
        '                                                   and date_ bet' +
        'ween :BeginDate and'
      '                                                       :EndDate)'
      '                                                       '
      
        '                                         where :OrgId in (AzsId,' +
        ' PponId, OblId)'
      '                                           and own_goods in'
      
        '                                               (:own1, :own2, :o' +
        'wn3)'
      '                                         group by np_groupid,'
      '                                                  np_group,'
      '                                                  azsname,'
      '                                                  dimname,'
      '                                                  ttn_id,'
      '                                                  ttn_inst,'
      '                                                  part_id,'
      '                                                  part_inst,'
      '                                                  dog,'
      '                                                  dog_date,'
      '                                                  ss,'
      '                                                  base_,'
      '                                                  np_type,'
      '                                                  dimid,'
      '                                                  sub_part)'
      '                                                  '
      '                                 where RestOnBeginTonn <> 0'
      '                                    or PrihodTonn <> 0'
      '                                    or NalTonn <> 0'
      '                                    or TalonTonn <> 0'
      '                                    or CardTonn <> 0'
      '                                    or BNalTonn <> 0'
      '                                    or Own_needsTonn <> 0'
      '                                    or Natural_leakTonn <> 0'
      '                                    or OtherTonn <> 0'
      '                                    or ShortageTonn <> 0'
      '                                    or AvtoTonn <> 0'
      '                                    or SetOffCommunTonn <> 0'
      '                                    or SetOffSecurTonn <> 0'
      '                                    or RestOnBeginSht <> 0'
      '                                    or PrihodSht <> 0'
      '                                    or NalSht <> 0'
      '                                    or TalonSht <> 0'
      '                                    or CardSht <> 0'
      '                                    or BNalSht <> 0'
      '                                    or Own_needsSht <> 0'
      '                                    or Natural_leakSht <> 0'
      '                                    or OtherSht <> 0'
      '                                    or ShortageSht <> 0'
      '                                    or AvtoSht <> 0'
      '                                    or SetOffCommunSht <> 0'
      '                                    or SetOffSecurSht <> 0) Q,'
      '                                    '
      
        '                               (select /*+ORDERED USE_HASH(dr,dr' +
        'ep) USE_MERGE(Q)*/'
      '                                       dr.ttn_id, '
      '                                       dr.ttn_inst, '
      '                                       dr.s_price'
      '                                  from oil_daily_rep drep,'
      '                                       oil_dr_data dr,'
      '                                       '
      
        '                                       (select /*+ORDERED USE_HA' +
        'SH(dr,drep)*/'
      '                                               ttn_id,'
      '                                               ttn_inst,'
      
        '                                               min(to_number(to_' +
        'char(rep_date, '#39'yyyymmdd'#39') || '#39'.'#39' '
      
        '                                                 || lpad(smena_n' +
        'um, 5, '#39'0'#39'))) as code'
      
        '                                          from oil_daily_rep dre' +
        'p,'
      '                                               oil_dr_data dr'
      '                                         where dr.state = '#39'Y'#39
      '                                           and drep.state = '#39'Y'#39
      
        '                                           and dr.rep_id = drep.' +
        'id'
      
        '                                           and dr.rep_inst = dre' +
        'p.inst'
      
        '                                              /*and dr.oper_type' +
        '=1*/'
      
        '                                           and trunc(drep.rep_da' +
        'te) >= :BeginDate'
      
        '                                         group by ttn_id, ttn_in' +
        'st) Q'
      '                                         '
      '                                 where dr.state = '#39'Y'#39
      '                                   and drep.state = '#39'Y'#39
      '                                   and dr.rep_id = drep.id'
      '                                   and dr.rep_inst = drep.inst'
      '                                   and dr.ttn_id = Q.ttn_id'
      '                                   and dr.ttn_inst = Q.ttn_inst'
      
        '                                   and trunc(drep.rep_date) = to' +
        '_date(substr(Q.code, 1, 8), '#39'yyyymmdd'#39')'
      '                                   and dr.oper_type = 1'
      '                                   and drep.smena_num ='
      
        '                                       substr(Q.code, instr(Q.co' +
        'de, '#39'.'#39') + 1)) BegPrice,'
      '                                       '
      
        '                               (select /*+ORDERED USE_HASH(dr,dr' +
        'ep) USE_MERGE(Q)*/'
      '                                       dr.ttn_id, '
      '                                       dr.ttn_inst, '
      '                                       dr.s_price'
      '                                  from oil_daily_rep drep,'
      '                                       oil_dr_data dr,'
      '                                       '
      
        '                                       (select /*+ORDERED USE_HA' +
        'SH(dr,drep)*/'
      '                                               ttn_id,'
      '                                               ttn_inst,'
      
        '                                               max(to_number(to_' +
        'char(rep_date, '#39'yyyymmdd'#39') '
      
        '                                                 ||decode(dr.ope' +
        'r_type,1,2,2,1,0) || '#39'.'#39' '
      
        '                                                 ||lpad(smena_nu' +
        'm, 5, '#39'0'#39'))) as code'
      
        '                                          from oil_daily_rep dre' +
        'p,'
      '                                               oil_dr_data dr'
      '                                         where dr.state = '#39'Y'#39
      '                                           and drep.state = '#39'Y'#39
      
        '                                           and dr.rep_id = drep.' +
        'id'
      
        '                                           and dr.rep_inst = dre' +
        'p.inst'
      
        '                                           and trunc(drep.rep_da' +
        'te) <= :EndDate'
      
        '                                         group by ttn_id, ttn_in' +
        'st) Q'
      '                                         '
      '                                 where dr.state = '#39'Y'#39
      '                                   and drep.state = '#39'Y'#39
      '                                   and dr.rep_id = drep.id'
      '                                   and dr.rep_inst = drep.inst'
      '                                   and dr.ttn_id = Q.ttn_id'
      '                                   and dr.ttn_inst = Q.ttn_inst'
      
        '                                   and trunc(drep.rep_date) = to' +
        '_date(substr(Q.code, 1, 8), '#39'yyyymmdd'#39')'
      
        '                                   and decode(dr.oper_type, 1, 2' +
        ', 2, 1, 0) = to_number(substr(Q.code, 9, 1))'
      
        '                                   and drep.smena_num = substr(Q' +
        '.code, instr(Q.code, '#39'.'#39') + 1)) EndPrice'
      '                                   '
      '                         where BegPrice.ttn_id(+) = Q.ttn_id'
      '                           and BegPrice.ttn_inst(+) = Q.ttn_inst'
      '                           and EndPrice.ttn_id(+) = Q.ttn_id'
      
        '                           and EndPrice.ttn_inst(+) = Q.ttn_inst' +
        ') Q) Q1) Q2')
        RequestLive = False
    UpdateMode = upWhereAll
    Left = 256
    Top = 72
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'BeginDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'EndDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OrgId'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'own1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'own2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'own3'
        ParamType = ptInput
      end>
    object qGRP_ID: TFloatField
      FieldName = 'GRP_ID'
    end
    object qGROUPNAME: TStringField
      FieldName = 'GROUPNAME'
      Size = 50
    end
    object qNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object qDIM_NAME: TStringField
      FieldName = 'DIM_NAME'
      Size = 50
    end
    object qTTN_ID: TFloatField
      FieldName = 'TTN_ID'
    end
    object qTTN_INST: TFloatField
      FieldName = 'TTN_INST'
    end
    object qID: TFloatField
      FieldName = 'ID'
    end
    object qINST: TFloatField
      FieldName = 'INST'
    end
    object qDOG: TStringField
      FieldName = 'DOG'
      Size = 15
    end
    object qDOG_DATE: TDateTimeField
      FieldName = 'DOG_DATE'
    end
    object qSS: TFloatField
      FieldName = 'SS'
    end
    object qBASE_: TFloatField
      FieldName = 'BASE_'
    end
    object qNPTYPENAME: TStringField
      FieldName = 'NPTYPENAME'
      Size = 50
    end
    object qDIM_ID: TFloatField
      FieldName = 'DIM_ID'
    end
    object qSUB_PART: TStringField
      FieldName = 'SUB_PART'
    end
    object qRESTONBEGINTONN: TFloatField
      FieldName = 'RESTONBEGINTONN'
    end
    object qRESTONBEGINLITR: TFloatField
      FieldName = 'RESTONBEGINLITR'
    end
    object qRESTONBEGINSHT: TFloatField
      FieldName = 'RESTONBEGINSHT'
    end
    object qRESTONBEGINSS: TFloatField
      FieldName = 'RESTONBEGINSS'
    end
    object qPRIHODTONN: TFloatField
      FieldName = 'PRIHODTONN'
    end
    object qPRIHODLITR: TFloatField
      FieldName = 'PRIHODLITR'
    end
    object qPRIHODSHT: TFloatField
      FieldName = 'PRIHODSHT'
    end
    object qPRIHODST: TFloatField
      FieldName = 'PRIHODST'
    end
    object qPRIHODSS: TFloatField
      FieldName = 'PRIHODSS'
    end
    object qNALTONN: TFloatField
      FieldName = 'NALTONN'
    end
    object qNALLITR: TFloatField
      FieldName = 'NALLITR'
    end
    object qNALSHT: TFloatField
      FieldName = 'NALSHT'
    end
    object qNALST: TFloatField
      FieldName = 'NALST'
    end
    object qNALSS: TFloatField
      FieldName = 'NALSS'
    end
    object qTALONTONN: TFloatField
      FieldName = 'TALONTONN'
    end
    object qTALONLITR: TFloatField
      FieldName = 'TALONLITR'
    end
    object qTALONSHT: TFloatField
      FieldName = 'TALONSHT'
    end
    object qTALONST: TFloatField
      FieldName = 'TALONST'
    end
    object qTALONSS: TFloatField
      FieldName = 'TALONSS'
    end
    object qCARDTONN: TFloatField
      FieldName = 'CARDTONN'
    end
    object qCARDLITR: TFloatField
      FieldName = 'CARDLITR'
    end
    object qCARDSHT: TFloatField
      FieldName = 'CARDSHT'
    end
    object qCARDST: TFloatField
      FieldName = 'CARDST'
    end
    object qCARDSS: TFloatField
      FieldName = 'CARDSS'
    end
    object qBNALTONN: TFloatField
      FieldName = 'BNALTONN'
    end
    object qBNALLITR: TFloatField
      FieldName = 'BNALLITR'
    end
    object qBNALSHT: TFloatField
      FieldName = 'BNALSHT'
    end
    object qBNALST: TFloatField
      FieldName = 'BNALST'
    end
    object qBNALSS: TFloatField
      FieldName = 'BNALSS'
    end
    object qOWN_NEEDSTONN: TFloatField
      FieldName = 'OWN_NEEDSTONN'
    end
    object qOWN_NEEDSLITR: TFloatField
      FieldName = 'OWN_NEEDSLITR'
    end
    object qOWN_NEEDSSHT: TFloatField
      FieldName = 'OWN_NEEDSSHT'
    end
    object qOWN_NEEDSST: TFloatField
      FieldName = 'OWN_NEEDSST'
    end
    object qOWN_NEEDSSS: TFloatField
      FieldName = 'OWN_NEEDSSS'
    end
    object qNATURAL_LEAKTONN: TFloatField
      FieldName = 'NATURAL_LEAKTONN'
    end
    object qNATURAL_LEAKLITR: TFloatField
      FieldName = 'NATURAL_LEAKLITR'
    end
    object qNATURAL_LEAKSHT: TFloatField
      FieldName = 'NATURAL_LEAKSHT'
    end
    object qNATURAL_LEAKST: TFloatField
      FieldName = 'NATURAL_LEAKST'
    end
    object qNATURAL_LEAKSS: TFloatField
      FieldName = 'NATURAL_LEAKSS'
    end
    object qOTHERTONN: TFloatField
      FieldName = 'OTHERTONN'
    end
    object qOTHERLITR: TFloatField
      FieldName = 'OTHERLITR'
    end
    object qOTHERSHT: TFloatField
      FieldName = 'OTHERSHT'
    end
    object qOTHERST: TFloatField
      FieldName = 'OTHERST'
    end
    object qOTHERSS: TFloatField
      FieldName = 'OTHERSS'
    end
    object qSHORTAGETONN: TFloatField
      FieldName = 'SHORTAGETONN'
    end
    object qSHORTAGELITR: TFloatField
      FieldName = 'SHORTAGELITR'
    end
    object qSHORTAGESHT: TFloatField
      FieldName = 'SHORTAGESHT'
    end
    object qSHORTAGEST: TFloatField
      FieldName = 'SHORTAGEST'
    end
    object qSHORTAGESS: TFloatField
      FieldName = 'SHORTAGESS'
    end
    object qAVTOTONN: TFloatField
      FieldName = 'AVTOTONN'
    end
    object qAVTOLITR: TFloatField
      FieldName = 'AVTOLITR'
    end
    object qAVTOSHT: TFloatField
      FieldName = 'AVTOSHT'
    end
    object qAVTOST: TFloatField
      FieldName = 'AVTOST'
    end
    object qAVTOSS: TFloatField
      FieldName = 'AVTOSS'
    end
    object qSETOFFCOMMUNTONN: TFloatField
      FieldName = 'SETOFFCOMMUNTONN'
    end
    object qSETOFFCOMMUNLITR: TFloatField
      FieldName = 'SETOFFCOMMUNLITR'
    end
    object qSETOFFCOMMUNSHT: TFloatField
      FieldName = 'SETOFFCOMMUNSHT'
    end
    object qSETOFFCOMMUNST: TFloatField
      FieldName = 'SETOFFCOMMUNST'
    end
    object qSETOFFCOMMUNSS: TFloatField
      FieldName = 'SETOFFCOMMUNSS'
    end
    object qSETOFFSECURTONN: TFloatField
      FieldName = 'SETOFFSECURTONN'
    end
    object qSETOFFSECURLITR: TFloatField
      FieldName = 'SETOFFSECURLITR'
    end
    object qSETOFFSECURSHT: TFloatField
      FieldName = 'SETOFFSECURSHT'
    end
    object qSETOFFSECURST: TFloatField
      FieldName = 'SETOFFSECURST'
    end
    object qSETOFFSECURSS: TFloatField
      FieldName = 'SETOFFSECURSS'
    end
    object qB_PRICE: TFloatField
      FieldName = 'B_PRICE'
    end
    object qE_PRICE: TFloatField
      FieldName = 'E_PRICE'
    end
    object qRESTONBEGINST: TFloatField
      FieldName = 'RESTONBEGINST'
    end
    object qRASHTONN: TFloatField
      FieldName = 'RASHTONN'
    end
    object qRASHLITR: TFloatField
      FieldName = 'RASHLITR'
    end
    object qRASHSHT: TFloatField
      FieldName = 'RASHSHT'
    end
    object qRASHST: TFloatField
      FieldName = 'RASHST'
    end
    object qRESTONENDSHT: TFloatField
      FieldName = 'RESTONENDSHT'
    end
    object qRESTONENDTONN: TFloatField
      FieldName = 'RESTONENDTONN'
    end
    object qRESTONENDLITR: TFloatField
      FieldName = 'RESTONENDLITR'
    end
    object qRESTONENDST: TFloatField
      FieldName = 'RESTONENDST'
    end
    object qRESTONENDSS: TFloatField
      FieldName = 'RESTONENDSS'
    end
    object qPEREOC: TFloatField
      FieldName = 'PEREOC'
    end
    object qRASHSS: TFloatField
      FieldName = 'RASHSS'
    end
  end
end
