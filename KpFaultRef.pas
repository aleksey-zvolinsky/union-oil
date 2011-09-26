unit KpFaultRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, ToolEdit, Mask, CurrEdit, RxLookup, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TKpFaultRefForm = class(TBaseForm)
    Label3: TLabel;
    xdeDate: TDateEdit;
    sbClearDate: TSpeedButton;
    Label4: TLabel;
    cmeFilial: TComboEdit;
    sbClearFilial: TSpeedButton;
    Label1: TLabel;
    edRespondent: TEdit;
    sbClearRespondent: TSpeedButton;
    qPODR_NAME: TStringField;
    qPODR_ID: TFloatField;
    qSTART_DATE: TDateTimeField;
    qEND_DATE: TDateTimeField;
    qCOMMENTS: TStringField;
    qRESPONDENT: TStringField;
    qID: TFloatField;
    qINST: TFloatField;
    leGroups: TRxLookupEdit;
    qGroups: TOilQuery;
    dsGroups: TOraDataSource;
    qGroupsID: TFloatField;
    qGroupsNAME: TStringField;
    sbClearGroups: TSpeedButton;
    leTypes: TRxLookupEdit;
    sbClearTypes: TSpeedButton;
    qTypes: TOilQuery;
    dsTypes: TOraDataSource;
    Label2: TLabel;
    Label5: TLabel;
    qTypesID: TFloatField;
    qTypesNAME: TStringField;
    qTYPE_NAME: TStringField;
    qGROUP_NAME: TStringField;
    qTYPE_ID: TFloatField;
    qGROUP_ID: TFloatField;
    qOPTIONS: TStringField;
    procedure ActivateQ;
    procedure bbSearchClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbClearDateClick(Sender: TObject);
    procedure sbClearFilialClick(Sender: TObject);
    procedure sbClearRespondentClick(Sender: TObject);
    procedure cmeFilialButtonClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure leGroupsCloseUp(Sender: TObject);
    procedure sbClearGroupsClick(Sender: TObject);
    procedure sbClearTypesClick(Sender: TObject);
    procedure leTypesButtonClick(Sender: TObject);
    procedure leTypesCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KpFaultRefForm: TKpFaultRefForm;

implementation

{$R *.DFM}

uses KpFault,Main,UDbFunc,ChooseOrg;

//==============================================================================
procedure TKpFaultRefForm.ActivateQ;
begin
    q.Sql.Text:=
       ' select crash.id,crash.inst, '+
       '        group_name,group_id,type_name,type_id,'+
       '        oo.name as podr_name, oo.id as podr_id,'+
       '        start_date,end_date,comments,respondent,crash.options '+
       ' from v_oil_crash crash,v_org oo '+
       ' where crash.dep_id=oo.id(+) and crash.dep_id=oo.inst(+) ';
    if xdeDate.Date>0 then
       q.Sql.Add('       and '''+DateToStr(xdeDate.Date)+''' between crash.start_date and crash.end_date ');
    if cmeFilial.Tag<>0 then
       q.Sql.Add('       and crash.dep_id='+IntToStr(cmeFilial.Tag));
    if trim(edRespondent.Text)<>'' then
       q.Sql.Add('       and crash.respondent like ''%'+trim(edRespondent.Text)+'%'' ');
    if leGroups.Tag<>0 then
       q.Sql.Add(' and crash.group_id='+IntToStr(leGroups.Tag));
    if leTypes.Tag<>0 then
       q.Sql.Add(' and crash.type_id='+IntToStr(leTypes.Tag));
    _OpenQuery(q);
end;
//==============================================================================
procedure TKpFaultRefForm.bbSearchClick(Sender: TObject);
begin
    inherited;
    if leGroups.Text='' then leGroups.Tag:=0;
    if leTypes.Text='' then leTypes.Tag:=0;
    ActivateQ;
end;
//==============================================================================
procedure TKpFaultRefForm.sbAddClick(Sender: TObject);
var F: TKpFaultForm;
begin
    inherited;
    F:=TKpFaultForm.Create(Application);
    F.Id:=0; F.Inst:=REAL_INST;
    //F.cePodrazd.Tag:=REAL_INST;
    //F.cePodrazd.Text:=GetOrgName(REAL_INST,REAL_INST);
    F.cePodrazd.Enabled:=FALSE;
    F.deBegin.Date:=Date; F.deEnd.Date:=Date;
    F.ShowModal;
    bbSearch.Click;
end;
//==============================================================================
procedure TKpFaultRefForm.sbEditClick(Sender: TObject);
var F: TKpFaultForm;
begin
    inherited;
    F:=TKpFaultForm.Create(Application);
    F.Id:=q.FieldByName('id').AsInteger;
    F.Inst:=q.FieldByName('inst').AsInteger;
    F.leTypes.Tag:=q.FieldByName('type_id').AsInteger;
    F.leTypes.Text:=q.FieldByName('type_name').AsString;
    F.leGroups.Tag:=q.FieldByName('group_id').AsInteger;
    F.leGroups.Text:=q.FieldByName('group_name').AsString;
    F.cePodrazd.Tag:=q.FieldByName('podr_id').AsInteger;
    F.cePodrazd.Text:=q.FieldByName('podr_name').AsString;
    F.cePodrazd.Enabled:=(q.FieldByName('options').AsString<>'nn');
    F.deBegin.Date:=q.FieldByName('start_date').Value;
    F.deEnd.Date:=q.FieldByName('end_date').Value;
    F.edComment.Text:=q.FieldByName('comments').AsString;
    F.edRespondent.Text:=q.FieldByName('respondent').AsString;
    F.Options:=q.FieldByName('options').AsString;
    F.ShowModal;
    bbSearch.Click;
end;
//==============================================================================
procedure TKpFaultRefForm.sbDelClick(Sender: TObject);
begin
   inherited;
   if q.RecordCount=0 then exit;
   if MessageDlg(TranslateText('¬ы уверены, что хотите удалить запись?'),mtConfirmation,[mbYes,mbNo],0)=mrYes then begin
      _ExecSql(' update oil_kp_crash set state=''N'' '+
               ' where id='+qId.AsString+' and inst='+qInst.AsString);
      bbSearch.Click;
   end;
end;
//==============================================================================
procedure TKpFaultRefForm.sbClearDateClick(Sender: TObject);
begin
    inherited;
    xdeDate.Clear;
end;
//==============================================================================
procedure TKpFaultRefForm.sbClearFilialClick(Sender: TObject);
begin
    inherited;
    cmeFilial.Tag:=0;
    cmeFilial.Text:='';
end;
//==============================================================================
procedure TKpFaultRefForm.sbClearRespondentClick(Sender: TObject);
begin
    inherited;
    edRespondent.Clear;
end;
//==============================================================================
procedure TKpFaultRefForm.cmeFilialButtonClick(Sender: TObject);
var vId, vInst: Integer;
    vName: String;
begin
    if CaptureOrg(1, MAIN_ID, INST, 'yyyyyynn', vId, vInst, vName) then begin
       cmeFilial.Tag := vId;
       cmeFilial.Text := vName;
    end;
end;
//==============================================================================
procedure TKpFaultRefForm.bbClearClick(Sender: TObject);
begin
    inherited;
    sbClearDate.Click;
    sbClearFilial.Click;
    sbClearRespondent.Click;
end;
//==============================================================================
procedure TKpFaultRefForm.FormShow(Sender: TObject);
begin
    inherited;
    if not qGroups.Active then _OpenQuery(qGroups);
    if qTypes.Active then qTypes.Close;
    bbSearch.Click;
end;
//==============================================================================
procedure TKpFaultRefForm.leGroupsCloseUp(Sender: TObject);
begin
    inherited;
    if leGroups.Tag<>qGroupsId.AsInteger then begin
       leGroups.Tag:=qGroupsId.AsInteger;
       leGroups.Text:=qGroupsName.AsString;
       sbClearTypes.Click;
    end;
end;
//==============================================================================
procedure TKpFaultRefForm.sbClearGroupsClick(Sender: TObject);
begin
    inherited;
    leGroups.Tag:=0;
    leGroups.Text:='';
    if qTypes.Active then qTypes.Close;
end;
//==============================================================================
procedure TKpFaultRefForm.sbClearTypesClick(Sender: TObject);
begin
    inherited;
    leTypes.Text:='';
    leTypes.Tag:=0;
end;
//==============================================================================
procedure TKpFaultRefForm.leTypesButtonClick(Sender: TObject);
begin
    inherited;
    if leGroups.Text='' then leGroups.Tag:=0;
    
    if qTypes.Active then qTypes.Close;
    qTypes.ParamByName('id').Value:=leGroups.Tag;
    _OpenQuery(qTypes);
end;
//==============================================================================
procedure TKpFaultRefForm.leTypesCloseUp(Sender: TObject);
begin
    inherited;
    leTypes.Tag:=qTypesId.AsInteger;
end;
//==============================================================================
end.
