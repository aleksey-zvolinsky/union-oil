unit Synchro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Buttons, uHelpButton, ExtCtrls, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TSynchroForm = class(TCommonForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnClose: TBitBtn;
    btnOne: TBitBtn;
    ceFrom: TComboEdit;
    ceTo: TComboEdit;
    lblFrom: TLabel;
    lblTo: TLabel;
    procedure Test;
    procedure btnOneClick(Sender: TObject);
    procedure ceFromButtonClick(Sender: TObject);
    procedure ceToButtonClick(Sender: TObject);
    procedure Choose(p_CE: TComboEdit; var pp_Id,pp_Inst: integer);
    procedure ClearFields;
  private
    { Private declarations }
    IdFrom,InstFrom,IdTo,InstTo: integer;
  public
    { Public declarations }
    TableName: string;
  end;

var
  SynchroForm: TSynchroForm;

implementation

{$R *.DFM}

uses OilStd,UDbFunc,ChooseOrg,Main,ExFunc,AutoRef, EmpRef;

//==============================================================================
procedure TSynchroForm.Test;
var
  OkpoFrom,OkpoTo: string;
  q:TOilQuery;
begin
  if (IdFrom=0) or (IdTo=0) then
    raise exception.create(TranslateText('Не введены обе записи!!!'));
  if (IdFrom=IdTo) and (InstFrom=InstTo) then
    raise exception.create(TranslateText('Нельзя синхронизировать запись саму с собой!'));

  q:=TOilQuery.Create(nil);
  try
    q.SQL.Text:='select distinct owner from all_objects where object_name like ''CARD_DUMP%'' and object_type=''TRIGGER'' and owner<>''DEMO'' ';
    _OpenQuery(q);
    q.First;
    while not q.Eof do
    begin
      if (TableName='OIL_ORG') and DbObjectExists('ECFIL108','TABLE',q['OWNER'])
        and (GetSqlValue(Format(
          ' select count(*) from '+q['OWNER']+'.ecfil108'+
          ' where id_klienta_importa=%d||lpad(%d,3,0)',[IdFrom,InstFrom]))>0)
      then
        raise exception.create(TranslateText('Исходная организация не должна быть привязана в Петроле'));
      q.Next;
    end;
  finally
    q.Free;
  end;

  if MessageDlg(TranslateText('Исходящая запись будет удалена, а всё движение ')+#13#10+
                TranslateText('по ней перепривязано к целевой записи.')+#13#10+
                TranslateText('Вы уверены, что хотите этого?'),mtWarning,[mbYes,mbNo],0)=mrNo
  then
    raise exception.create(TranslateText('Операция отменена!'));
  if TableName = 'OIL_ORG' then begin
    OkpoFrom:=nvl(GetQValueByIdInst('id_num','oil_org',IdFrom,InstFrom),'');
    OkpoTo:=nvl(GetQValueByIdInst('id_num','oil_org',IdTo,InstTo),'');
    if (OkpoFrom<>'') and (OkpoTo<>'') and (OkpoFrom<>OkpoTo) then
      if MessageDlg(TranslateText('ОКПО выбранных организаций не совпадают.')+#13#10+
                    TranslateText('Вы уверены что хотите провести замену?'),mtWarning,[mbYes,mbNo],0)=mrNo
      then
        raise exception.create(TranslateText('Операция отменена!'));
  end;
  if TableName<>'OIL_ORG' then
    if MessageDlg(TranslateText('Названия не совпадают! Вы уверены что хотите провести замену?'),mtWarning,[mbYes,mbNo],0)=mrNo then
      raise exception.create(TranslateText('Операция отменена'));
end;
//==============================================================================
procedure TSynchroForm.btnOneClick(Sender: TObject);
begin
  Test;
  StartSqlOra;
  try
    if TableName = 'OIL_ORG' then
      _ExecProcOra('OILT.SYNCHRONIZEORG',
        ['p_IdFrom',        IdFrom,
         'p_InstFrom',      InstFrom,
         'p_IdTo',          IdTo,
         'p_InstTo',        InstTo])
    else
      _ExecProcOra('OILT.SYNCHRONIZE',
        ['p_Table',         TableName,
         'p_IdFrom',        IdFrom,
         'p_InstFrom',      InstFrom,
         'p_IdTo',          IdTo,
         'p_InstTo',        InstTo]);
    showmessage(TranslateText('Замена прошла успешно'));
    ClearFields;
  except
    on E: Exception do begin
      RollbackSqlOra;
      raise exception.create(E.Message);
    end;
  end;
  CommitSqlOra;
end;
//==============================================================================
procedure TSynchroForm.ceFromButtonClick(Sender: TObject);
begin
  Choose(ceFrom,IdFrom,InstFrom);
end;
//==============================================================================
procedure TSynchroForm.ceToButtonClick(Sender: TObject);
begin
  Choose(ceTo,IdTo,InstTo);
end;
//==============================================================================
procedure TSynchroForm.Choose(p_CE: TComboEdit; var pp_Id,
  pp_Inst: integer);
var
  vName: string;
  FAuto: TAutoRefForm;
  FEmploy: TEmpRefForm;
begin
  if TableName = 'OIL_ORG' then
  begin
    if CaptureOrg(4,Main.INST,Main.INST,'yyy',pp_Id,pp_Inst,vName) then
      p_CE.Text:=vName;
  end
  else if TableName = 'OIL_AUTO' then
  begin
    Application.CreateForm(TAutoRefForm, FAuto);
    try
      if FAuto.ShowModal = mrOk then
      begin
        pp_Id := FAuto.qId.AsInteger;
        pp_Inst := FAuto.qInst.AsInteger;
        p_CE.Text := FAuto.qNumb.AsString;
      end;
    finally
      FAuto.Free;
    end;
  end
  else if TableName = 'OIL_EMPLOY' then
  begin
    Application.CreateForm(TEmpRefForm, FEmploy);
    try
      FEmploy.ShowModal;
      if FEmploy.ModalResult = mrOk then
      begin
        pp_Id := FEmploy.qID.AsInteger;
        pp_Inst := FEmploy.qInst.AsInteger;
        p_CE.Text := FEmploy.qF_NAME.AsString+' '
          +FEmploy.qI_NAME.AsString+' '
          +FEmploy.qO_NAME.AsString;
      end;
    finally
      FEmploy.Free;
    end;
  end;
end;
//==============================================================================
procedure TSynchroForm.ClearFields;
begin
  IdFrom:=0;
  InstFrom:=0;
  IdTo:=0;
  InstTo:=0;
  ceFrom.Text:='';
  ceTo.Text:='';
end;
//==============================================================================
end.
