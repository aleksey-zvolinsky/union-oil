unit uAviasRests;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  EditBase, Db, MemDS, DBAccess, Ora, uOilQuery, StdCtrls, Buttons, ExtCtrls,
  ToolEdit, RXSpin, Mask, Grids, DBGridEh, DBTables, MemTable{$IFDEF VER150},
  Variants, CurrEdit{$ENDIF};

type
  TAviasRestsForm = class(TEditBaseForm)
    Panel1: TPanel;
    deDate_: TDateEdit;
    lDate_: TLabel;
    ceAZS: TComboEdit;
    lAZS: TLabel;
    lnpg: TLabel;
    ceNPG: TComboEdit;
    deBuild: TDateEdit;
    l4: TLabel;
    edLitr: TRxCalcEdit;
    l1: TLabel;
    l3: TLabel;
    edCount_: TRxCalcEdit;
    procedure ceAZSButtonClick(Sender: TObject);
    procedure ceAZSKeyPress(Sender: TObject; var Key: Char);
    procedure ceNPGButtonClick(Sender: TObject);
  private
  public
    procedure Save(); override;
    procedure Test(); override;
    procedure Init(); override;
  end;

var
  AviasRestsForm: TAviasRestsForm;

implementation

uses
  ChooseOrg, uDbFunc, ExFunc, Main, uXmlForm, uCrypt, uCommonForm, OilStd;

{$R *.DFM}

//==============================================================================
procedure TAviasRestsForm.ceAZSButtonClick(Sender: TObject);
var
  strName: string;
  AZSId: integer;
begin
  if CaptureOrg(2, MAIN_ID, INST, 'yynr', AZSId, AZSId, strName) then
  begin
    ceAZS.Text := strName;
    ceAZS.Tag := AZSId;
  end;
end;
//==============================================================================
procedure TAviasRestsForm.ceAZSKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;
//==============================================================================
procedure TAviasRestsForm.ceNPGButtonClick(Sender: TObject);
begin
  XMLChoose('npgroupref', ceNPG);
end;
//==============================================================================
procedure TAviasRestsForm.Test();
begin
  if MessageDlg(
    TranslateText('Будут изменены остатки оперативного отчета для Авиаса!') +#13#10+
    TranslateText('Продолжить?'), mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    raise Exception.Create(TranslateText('Отменено пользователем'));
end;
//==============================================================================
procedure TAviasRestsForm.Save();
begin
  DBSaver.SaveRecord('OIL_RESTS_AVIAS',
    ['ID',             ID,
     'INST',           INST,
     'STATE',          'Y',
     'DATE_',          deDate_.Date,
     'AZS_ID',         ceAZS.Tag,
     'NP_GROUP_ID',    ceNPG.Tag,
     'REST_LITR',      MRound(edLitr.Value, 3),
     'REST_KG',        MRound(edCount_.Value, 3),
     'REP_BUILD_DATE', null
    ]);
end;
//==============================================================================
procedure TAviasRestsForm.Init();
begin
  inherited Init;

  if ID = 0 then
    raise Exception.Create(TranslateText('Добавлять остатки нельзя!') +#10#13+
      TranslateText('Для добавления остатков смотрите инструкцию в отчете \Отчеты\Оперативный отчет для Авиаса (новый).'))
  else
  begin
    deDate_.Date   := q.FieldByName('DATE_').AsDateTime;

    ceAZS.Tag      := q.FieldByName('AZS_ID').AsInteger;
    ceAZS.Text     := q.FieldByName('AZS_NAME').AsString;

    ceNPG.Tag      := q.FieldByName('NP_GROUP_ID').AsInteger;
    ceNPG.Text     := q.FieldByName('NPG_NAME').AsString;

    edLitr.Value   := q.FieldByName('REST_LITR').AsFloat;
    edCount_.Value := q.FieldByName('REST_KG').AsFloat;

    deBuild.Date   := q.FieldByName('REP_BUILD_DATE').AsDateTime;
  end;
end;
//==============================================================================

end.
