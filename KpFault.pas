unit KpFault;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, Db, DBTables, RxLookup,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess;

type
  TKpFaultForm = class(TCommonForm)
    Label3: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    deBegin: TDateEdit;
    Label2: TLabel;
    deEnd: TDateEdit;
    Label4: TLabel;
    edComment: TEdit;
    Label5: TLabel;
    edRespondent: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    cePodrazd: TComboEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    qTest: TOilQuery;
    qTestCO: TFloatField;
    Label8: TLabel;
    qGroups: TOilQuery;
    qGroupsID: TFloatField;
    qGroupsNAME: TStringField;
    dsGroups: TOraDataSource;
    dsTypes: TOraDataSource;
    qTypes: TOilQuery;
    qTypesID: TFloatField;
    qTypesNAME: TStringField;
    leGroups: TRxLookupEdit;
    leTypes: TRxLookupEdit;
    qTypesOPTIONS: TStringField;
    procedure bbCancelClick(Sender: TObject);
    procedure Save;
    procedure Test;
    procedure cbCrashTypeKeyPress(Sender: TObject; var Key: Char);
    procedure bbOkClick(Sender: TObject);
    procedure cePodrazdButtonClick(Sender: TObject);
    procedure cbCrashTypeChange(Sender: TObject);
    procedure leGroupsCloseUp(Sender: TObject);
    procedure leTypesButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure leTypesCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Id,Inst: integer;
    Options: string;
  end;

var
  KpFaultForm: TKpFaultForm;

implementation

{$R *.DFM}

uses UDbFunc,OilStd,ChooseOrg,Main;

//==============================================================================
procedure TKpFaultForm.bbCancelClick(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;
//==============================================================================
procedure TKpFaultForm.Test;
var s: string;
begin
    if leGroups.Tag=0 then
       Raise Exception.Create(TranslateText('Не выбрана группа сбоя'));
    if leTypes.Tag=0 then
       Raise Exception.Create(TranslateText('Не выбран тип сбоя'));
    if cePodrazd.Tag=0 then
       Raise Exception.Create(TranslateText('Не выбрано подразделение!'));
    if deBegin.Date>deEnd.Date then
       Raise Exception.Create(TranslateText('Начало сбоя не должно быть позже конца сбоя!'));
    if trim(edComment.Text)='' then
       Raise Exception.Create(TranslateText('Не введено описание!'));
    if trim(edRespondent.Text)='' then
       Raise Exception.Create(TranslateText('Не введена фамилия сотрудника!'));
    S := trim(edRespondent.Text);
    if (Length(S) <3) or
       (ANSIUpperCase(Copy(S,1,1))<> Copy(S,1,1)) or
       (Pos('1',S)+Pos('2',S)+Pos('3',S)+Pos('4',S)+Pos('5',S)+Pos('6',S)+
        Pos('7',S)+Pos('8',S)+Pos('9',S)+Pos('0',S)<>0)
    then Raise Exception.Create(TranslateText('Неправильно введена фамилия !'));

    if qTest.Active then qTest.Close;
    DefineQParams(qTest,
       ['crash_type',           leTypes.Tag,
        'dep_id',               cePodrazd.Tag,
        'start_date',           deBegin.Date,
        'end_date',             deEnd.Date]);
    _OpenQuery(qTest);
    if (qTestCo.AsInteger>0) and (Id=0) or (qTestCo.AsInteger>1) and (Id>0) then
       Raise Exception.Create(TranslateText('За этот период по этому подразделению уже введен сбой!'));
end;
//==============================================================================
procedure TKpFaultForm.Save;
begin
    if Id=0 then Id:=GetSeqNextVal('S_OIL_KP_CRASH');
    StartSqlOra;
    _ExecProcOra('OIL.INSORUPDOIL_KP_CRASH',
        ['ID#',              Id,
         'STATE#',           'Y',
         'INST#',            Inst,
         'CRASH_TYPE#',      leTypes.Tag,
         'DEP_ID#',          cePodrazd.Tag,
         'START_DATE#',      deBegin.Date,
         'END_DATE#',        deEnd.Date,
         'RESPONDENT#',      edRespondent.Text,
         'COMMENTS#',        edComment.Text
        ],TRUE);
    CommitSqlOra;
end;
//==============================================================================
procedure TKpFaultForm.cbCrashTypeKeyPress(Sender: TObject; var Key: Char);
begin
    Key:=#0;
end;
//==============================================================================
procedure TKpFaultForm.bbOkClick(Sender: TObject);
begin
    Test;
    Save;
    ModalResult:=mrOk;
end;
//==============================================================================
procedure TKpFaultForm.cePodrazdButtonClick(Sender: TObject);
var vId, vInst,n: Integer;
    vName: String;
begin
    if Options[1]='y' then n:=1
                      else n:=2;
    if ChooseOrg.CaptureOrg(n, MAIN_ID, INST, 'yyy'+Options[1]+Options+'nn', vId, vInst, vName) then begin
       cePodrazd.Tag := vId;
       cePodrazd.Text := vName;
    end;
end;
//==============================================================================
procedure TKpFaultForm.cbCrashTypeChange(Sender: TObject);
begin
    if leTypes.Tag=0 then begin
       cePodrazd.Tag:=REAL_INST;
       cePodrazd.Text:=GetOrgName(REAL_INST,REAL_INST);
       cePodrazd.Enabled:=FALSE;
    end else begin
       cePodrazd.Enabled:=TRUE;
    end;
end;
//==============================================================================
procedure TKpFaultForm.leGroupsCloseUp(Sender: TObject);
begin
    if leGroups.Tag<>qGroupsId.AsInteger then begin
       leGroups.Tag:=qGroupsId.AsInteger;
       leGroups.Text:=qGroupsName.AsString;
       leTypes.Tag:=0;
       leTypes.Text:='';
    end;
end;
//==============================================================================
procedure TKpFaultForm.leTypesButtonClick(Sender: TObject);
begin
    if leGroups.Text='' then leGroups.Tag:=0;

    if qTypes.Active then qTypes.Close;
    qTypes.ParamByName('id').Value:=leGroups.Tag;
    _OpenQuery(qTypes);
end;
//==============================================================================
procedure TKpFaultForm.FormCreate(Sender: TObject);
begin
  inherited;
    if not qGroups.Active then _OpenQuery(qGroups);
    if not qTypes.Active then _OpenQuery(qTypes);
end;
//==============================================================================
procedure TKpFaultForm.leTypesCloseUp(Sender: TObject);
begin
    if qTypes.RecordCount=0 then exit;
    leTypes.Tag:=qTypesId.AsInteger;
    Options:=qTypesOptions.AsString;
    cePodrazd.Enabled:=(Options<>'nn');
    if Options='nn' then begin
       cePodrazd.Tag:=Inst;
       cePodrazd.Text:=GetOrgName(inst,inst);
    end else begin
       if (Options[1]='n') and (cePodrazd.Tag<1000000) or (Options[2]='n') and (cePodrazd.Tag>1000000) then begin
          cePodrazd.Text:='';
          cePodrazd.Tag:=0;
       end;
    end;
end;
//==============================================================================
end.
