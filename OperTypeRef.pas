unit OperTypeRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, StdCtrls, Db, DBTables, Grids, DBGrids, Buttons, ExtCtrls, Placemnt,
  Mask, ToolEdit, Menus, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess, DBGridEh;

type
  TOperTypeRefForm = class(TBaseForm)
    Label1: TLabel;
    edName: TEdit;
    SP: TOilStoredProc;
    qID: TFloatField;
    qNAME: TStringField;
    qGRP_ID: TFloatField;
    qGRP_NAME: TStringField;
    Query1: TOilQuery;
    ComboEdit1: TComboEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    ModifyQuery: TOilQuery;
    procedure sbClearNameClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); Override;
    procedure ComboEdit1ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure ActivateQ;
  private
  public
    SgrpId: Integer;
    ToDisable: Boolean;
    Grps: string;    // фильтр групп, типа '7,8,10'. Если пустой, то фильтр отключен
    Opers_id: string; // фильтр на операции
  end;

implementation

Uses Main, OilStd, OperType, UDbFunc, uXMLForm;

{$R *.DFM}

procedure TOperTypeRefForm.sbClearNameClick(Sender: TObject);
begin
  edName.Clear;
end;

procedure TOperTypeRefForm.bbClearClick(Sender: TObject);
begin
 edName.text:='';
 Comboedit1.text:='';
 SGrpId:=-1;
end;

procedure TOperTypeRefForm.ActivateQ;
begin
    if q.Active then q.Close;
    q.Sql.Text:='select * from v_oil_oper_type where state=''Y'' ';
    if edName.Text<>'' then
       q.Sql.Add('and upper(name) like ''%'+ANSIUpperCase(edName.Text)+'%'' ');
    if Comboedit1.Text <> '' then
       q.Sql.Add(' and grp_id='+inttostr(SGRPID)+' ');
    if Grps<>'' then
         q.Sql.Add('and grp_id in ('+Grps+')');
    if Opers_id <> '' then
      q.Sql.Add('and id in ('+Opers_id+')');
    q.Sql.Add(' order by NAME');
    _OpenQuery(q);
end;

procedure TOperTypeRefForm.FormShow(Sender: TObject);
begin
  if SGrpId<>-1 then
  begin
    comboedit1.text:=GetSqlValue('select name from v_oil_oper_grp where id='+inttostr(SGrpId));
    if ToDisable then
    begin
      Comboedit1.color:=clSilver;
      Comboedit1.enabled:=false;
      SpeedButton1.visible:=false;
    end;
  end;
  if edName.text<>'' then
  begin
     edName.color:=clGray;
     edName.enabled:=false;
  end;
  ActivateQ;
end;

procedure TOperTypeRefForm.bbSearchClick(Sender: TObject);
begin
  ActivateQ;
end;

procedure TOperTypeRefForm.sbAddClick(Sender: TObject);
Var OPF:TOperTypeForm;
    Res:string;
begin
 OPF:=TOperTypeForm.Create(Application);
 OPF.ShowModal;
 if OPF.ModalResult=MrCancel then OPF.Free;
 if OPF.ModalResult=MrOk then
 begin
  Try
   With SP do
   Begin
    query1.close;
    query1.sql.text:='select s_oil_oper_type.nextval as sq from sys.dual';
    query1.open;

    StoredProcName := 'OIL.INSORUPDOIL_OPER_TYPE';
    Prepare;
     ParamByName('ID#').AsInteger   := query1.fieldbyname('sq').asinteger;
     ParamByName('STATE#').AsString := 'Y';
     ParamByName('NAME#').AsString  := OPF.GName;
     if OPF.GId<>-1 then ParamByName('GRP#').AsInteger:= OPF.GId
                    else ParamByName('GRP#').clear;
    ExecProc;
    Res:=ParamByName('Result').AsString;
    If Length(Res)>0 Then
     If Res[1]<>'0' Then
      Raise Exception.Create(SubStr(Res,2));
    CommitSQL;
    q.Close;
    q.Open;
    OPF.free;
   End;
  Except On E:Exception Do
   Begin
    OPF.free;
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
   End;
  End;
 end;
end;

procedure TOperTypeRefForm.sbDelClick(Sender: TObject);
Var
  Res: String;
begin
  If q.Active Then
  If q.RecordCount > 0 Then
  If MessageDlg(TranslateText('Вы уверены что хотите удалить запись?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Try
    With SP Do
    Begin
      StoredProcName := 'OIL.INSORUPDOIL_OPER_TYPE';
      Prepare;
      ParamByName('ID#').AsInteger   := qId.AsInteger;
      ParamByName('STATE#').AsString := 'N';
      ParamByName('NAME#').AsString  := qName.AsString;
      ExecProc;
      Res:=ParamByName('Result').AsString;
      If Length(Res)>0 Then
        If Res[1]<>'0' Then
          Raise Exception.Create(SubStr(Res,2));
      CommitSQL;
      q.Close;
      q.Open;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TOperTypeRefForm.sbEditClick(Sender: TObject);
Var
  OPF:TOperTypeForm;
  Res:string;
  pos2          :integer;
begin
 OPF:=TOperTypeForm.Create(Application);
 OPF.Edit1.text:=qName.asstring;
 Opf.ComboEdit1.text:=qGRP_Name.asstring;
 OPF.GId:=qGRP_Id.asinteger;
 If Pos(','+qID.AsString+',', OPER_NOT_NN) = 0 Then
   OPF.CheckBox1.Checked:=false
 else
   OPF.CheckBox1.Checked:=true;
 OPF.ShowModal;
 if OPF.ModalResult=MrCancel then OPF.Free;
 if OPF.ModalResult=MrOk then
 begin
  Try
   //With SP do
   Begin
    sp.StoredProcName := 'OIL.INSORUPDOIL_OPER_TYPE';
    sp.Prepare;
     sp.ParamByName('ID#').AsInteger   := qId.asinteger;
     sp.ParamByName('STATE#').AsString := 'Y';
     sp.ParamByName('NAME#').AsString  := OPF.GName;
     if OPF.GId<>-1 then sp.ParamByName('GRP#').AsInteger:= OPF.GId
                    else sp.ParamByName('GRP#').clear;
    sp.ExecProc;
    Res:=sp.ParamByName('Result').AsString;
    If Length(Res)>0 Then
     If Res[1]<>'0' Then
      Raise Exception.Create(SubStr(Res,2));
    //CommitSQL;
    if OPF.CheckBox1.checked then
    begin
      // добавление в "черный список"
      If Pos(','+qID.AsString+',', OPER_NOT_NN) = 0 Then
      begin
        OPER_NOT_NN:=OPER_NOT_NN+qID.AsString+',';
        Modifyquery.close;
        Modifyquery.sql.text:='update oil_var set value='''+OPER_NOT_NN+
            ''' where name=''OPER_NOT_NN''';
        Modifyquery.execsql;
      end;
    end
    else
    begin
      // удаление из списка непечатных, если он там был
      If Pos(','+qID.AsString+',', OPER_NOT_NN) <> 0 Then
      begin
        repeat
          pos2:=Pos(','+qID.AsString+',', OPER_NOT_NN);
          delete(OPER_NOT_NN,pos2,length(','+qID.AsString+','));
        until Pos(','+qID.AsString+',', OPER_NOT_NN) = 0 ;
        Modifyquery.close;
        Modifyquery.sql.text:='update oil_var set value='''+OPER_NOT_NN+
            ''' where name=''OPER_NOT_NN''';
        Modifyquery.execsql;
      end;
    end;
    q.Close;
    q.Open;
    OPF.free;
   End;
  Except On E:Exception Do
   Begin
    OPF.free;
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
   End;
  End;
 end;
end;

procedure TOperTypeRefForm.ComboEdit1ButtonClick(Sender: TObject);
begin
  XMLChoose('opergrpref',SGrpId,ComboEdit1);
  ActivateQ;
end;

procedure TOperTypeRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  SGrpId:=-1;
  Grps:='';
  ToDisable:=true;
  RedColorFieldName := 'NAME';
  RedColorFilter := edName;
end;

procedure TOperTypeRefForm.SpeedButton1Click(Sender: TObject);
begin
 comboedit1.text:='';
 SGrpId:=-1;
 ActivateQ;
end;

procedure TOperTypeRefForm.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if qID.asInteger >= 1000 then bbOk.Enabled:=false
  else bbOk.Enabled:=true;
end;

end.
