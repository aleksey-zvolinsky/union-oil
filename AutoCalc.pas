unit AutoCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, Db, DBTables, NPTypeRef,
  uHelpButton, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TACForm = class(TCommonForm)
    rgTypeCharge: TRadioGroup;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ceNPGrp: TComboEdit;
    ePrice: TEdit;
    eLitr: TEdit;
    grbOrg: TGroupBox;
    lClient: TLabel;
    ceClient: TComboEdit;
    hbSht: TOilHelpButton;
    procedure ceNPGrpButtonClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CurrencyEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure eLitrExit(Sender: TObject);
    procedure ePriceExit(Sender: TObject);
    procedure ceClientButtonClick(Sender: TObject);
    procedure rgTypeChargeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ceNPGrpKeyPress(Sender: TObject; var Key: Char);
    procedure SetShtNptype;
    procedure eLitrKeyPress(Sender: TObject; var Key: Char);
    procedure eLitrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    NPGrpId, ClientId, ClientInst: Integer;
    ClientName: String;
    Litr, Price: Real;
    FGName : string;
    NpList,FNPName,FShtName : STring;
    FNPID,FShtID : integer;
    NPT: TNPTypeRefForm;
    SpecKeyPressed: Boolean;
  end;

var
  ACForm: TACForm;
  FakeOrg : record
              ID, INST : integer;
              name     : string;
            End;

implementation

Uses Main, ChooseOrg, uXMLForm, srep;

{$R *.DFM}

procedure TAcForm.SetShtNptype;
begin
  NPGrpId := NPT.q.fieldbyname('id').AsInteger;
  ceNPGrp.Text := NPT.q.fieldbyname('name').AsString;
  FShtName := ceNPGrp.Text;
  FShtId := NPGrpId;
end;

procedure TACForm.ceNPGrpButtonClick(Sender: TObject);
begin
  if rgTypeCharge.ItemIndex = 4 then begin
    if not Assigned(NPT) then begin
      NpT := TNPTypeRefForm.Create(Application);
      NPT.InitSLPrices(NpList);
    end else
      NPT.q.Next;
      NPT.ShowModal;
    if (not NPT.q.IsEmpty) and (NPT.ModalResult<>mrCancel) then
      SetShtNpType;
  end else begin
    if XMLChoose('npgroupref',NPGrpId,FNpName) then begin
      ceNPGrp.Text:=FNpName;
      FNpId:=NPGrpId;
    end;
  end;
  eLitr.SetFocus;
end;

procedure TACForm.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TACForm.CurrencyEdit2KeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then bitbtn1click(self);
end;

procedure TACForm.BitBtn1Click(Sender: TObject);
begin

if (ceClient.Text = '')and(grbOrg.Enabled)
 then raise Exception.Create(TranslateText('Потребитель не определен !'));
if ceNPGrp.Text = ''
 then raise Exception.Create(TranslateText('Группа НП не определена !'));
if ePrice.Text ='' then ePrice.Text := '0';
if (StrToFloat(ePrice.Text) <= 0) and (rgTypeCharge.ItemIndex <> 4)
 then raise Exception.Create(TranslateText('Введена отрицательная/нулевая цена !'));
if eLitr.Text = ''
 then raise Exception.Create(TranslateText('Не введен литраж !'));
if StrToFloat(eLitr.Text) <= 0
 then raise Exception.Create(TranslateText('Введено отрицательное/нулевое количество !'));

Litr := StrToFloat(eLitr.Text);
Price := StrToFloat(ePrice.Text);
ModalResult := MrOk;
end;

procedure TACForm.eLitrExit(Sender: TObject);
begin
if eLitr.Text <> ''
  then eLitr.Text := FloatToStrF(StrToFloat(eLitr.Text), ffFixed, 15, 3);
end;

procedure TACForm.ePriceExit(Sender: TObject);
begin
if ePrice.Text <> ''
  then ePrice.Text := FloatToStrF(StrToFloat(ePrice.Text), ffFixed, 15, 2);
end;

procedure TACForm.ceClientButtonClick(Sender: TObject);
begin
if CaptureOrg(3, Main.MAIN_ID, Main.INST, 'yyy', ClientId, ClientInst, ClientName)
  then ceClient.Text := ClientName;
end;

procedure TACForm.rgTypeChargeClick(Sender: TObject);
begin
  grbOrg.Enabled := (rgTypeCharge.ItemIndex=1);


//  lClient.Visible := (rgTypeCharge.ItemIndex=1);
//  ceClient.Visible :=(rgTypeCharge.ItemIndex=1);
  if grbOrg.Enabled
     then Begin
       ClientId := FakeOrg.ID;
       ClientInst := FakeOrg.INST;
       ClientName := FakeOrg.NAME;
       ceClient.Text := ClientName;
       ceClient.Color := clWindow;
     End
     else Begin
       ceClient.Clear;
       ceClient.Color := clSilver;
     End;
   if rgTypeCharge.ItemIndex = 4 then
   begin
     label1.Caption := TranslateText('Тип:');
     label3.Caption := TranslateText('Кол-во:');
     ceNpGrp.Text := FShtName;
     ceNpGrp.Tag := FShtId;
   end
   else
   begin
     ceNpGrp.Text := FNpName;
     ceNpGrp.Tag := FNpId;
     label1.Caption := TranslateText('Вид НП:');
     label3.Caption := TranslateText('Литры:');
   end;
  hbSht.Visible:=rgTypeCharge.ItemIndex=4;
end;

procedure TACForm.FormCreate(Sender: TObject);
  var q : TOilQuery;
begin
  inherited;
  // Выбираем фиктивную организацию для ведомости
  FakeOrg.ID := 0;
  FakeOrg.INST := 0;
  FakeOrg.NAME := '';    

  q := TOilQuery.Create(nil);
  q.SQL.Text := 'select O.id, O.inst, O.name from v_org O, oil_org_det OD '+
                ' where O.id=OD.org_id and O.inst=OD.inst and '+
                ' OD.Srep_fake=''Y'' and O.inst='+IntToStr(INST);
  q.Open;
  if not q.IsEmpty
     then Begin
        FakeOrg.ID := q.FieldByName('ID').AsInteger;
        FakeOrg.INST := q.FieldByName('INST').AsInteger;
        FakeOrg.NAME := q.FieldByName('NAME').AsString;
     End;
  q.Free;

end;

procedure TACForm.FormShow(Sender: TObject);
begin
  // Если включена фильтрация по группе НП - по умолчанию установить эту группу
  if NPGrpId<>-1 then ceNPGrp.Text := FGName;

  if Assigned(NPT) and (rgTypeCharge.ItemIndex=4) then begin
    NPT.q.Next;
    SetShtNpType;
    eLitr.SetFocus;
  end;
  SpecKeyPressed:=FALSE;
end;

procedure TACForm.FormDestroy(Sender: TObject);
begin
  NPT.Free;
end;

procedure TACForm.ceNPGrpKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then ceNPGrpButtonClick(Sender);
end;

procedure TACForm.eLitrKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then BitBtn1.Click;
end;

procedure TACForm.eLitrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (SpecKeyPressed) and (rgTypeCharge.ItemIndex=4) and Assigned(NPT) and ((Key=33) or (Key=34)) then begin
    if Key=33 then NPT.q.Prior;
    if Key=34 then NPT.q.Next;
    SetShtNpType;
  end;
  SpecKeyPressed:=Key=255;
end;

end.
