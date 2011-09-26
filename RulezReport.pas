unit RulezReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, ToolEdit, StdCtrls, Mask, RXCtrls, UReportClass,
  ComCtrls, Db, DBTables, ComObj, Excel8TLB, URepElClass,UIdListsClass,
  uCommonForm,uOilQuery,Ora, uOilStoredProc;

const LABEL_OTSTUP=3;

type
  PQuery=^TOilQuery;

  PSpeedButton=^TSpeedButton;

  PComboEdit=^TComboEdit;

  TRulezReportForm = class(TCommonForm)
    PanelDate: TPanel;
    Panel2: TPanel;
    PanelOrg: TPanel;
    deBegin: TDateEdit;
    deEnd: TDateEdit;
    lblDate1: TLabel;
    lblDate2: TLabel;
    CEOrg1: TComboEdit;
    CEOrg2: TComboEdit;
    LabelOrg1: TLabel;
    LabelOrg2: TLabel;
    sbClearOrg2: TSpeedButton;
    sbClearOrg1: TSpeedButton;
    PanelGrp: TPanel;
    CBTypes: TComboBox;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LabelDebug: TLabel;
    SB1: TSpeedButton;
    SB2: TSpeedButton;
    SB3: TSpeedButton;
    SB4: TSpeedButton;
    SB5: TSpeedButton;
    SB6: TSpeedButton;
    SB7: TSpeedButton;
    SB8: TSpeedButton;
    SB9: TSpeedButton;
    SBConstr: TSpeedButton;
    cbSymbols: TCheckBox;
    sbListPicture: TSpeedButton;
    procedure Init(rep: TReport);
    procedure BitBtn1Click(Sender: TObject);
    procedure PrepareTypes;
    procedure PreparePanels;
    procedure SetCBTypes(n:integer);
    procedure SBConfClick(Sender: TObject);
    procedure CBTypesChange(Sender: TObject);
    procedure CBTypesKeyPress(Sender: TObject; var Key: Char);
    procedure CBTypesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SBConstrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBoxClick(Sender:TObject);
    procedure RadioButtonClick(Sender:TObject);
    procedure ComboEditClick(Sender:TObject);
    procedure EditChange(Sender:TObject);
    procedure ListSbClick(Sender:TObject);
    procedure ComboBoxChange(Sender:TObject);
    procedure SBClearClick(Sender:TObject);
    procedure DateEditChange(Sender:TObject);
    procedure cbSymbolsClick(Sender: TObject);
    procedure deBeginChange(Sender: TObject);
    procedure Panel2DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Debugging: Boolean;
    Buttons: array [0..9] of PSpeedButton;
    ClearLinks:TList;
  public
    R: TReport;
  end;

var
  RulezReportForm: TRulezReportForm;

procedure MakeRulezReport(R: TReport);
procedure MakePluginReport(name:string);
function MakePluginReportParam(Name: String): TRulezReportForm;

implementation

uses ExFunc,TextFunc,Progr,Main,UDbFunc,ChooseOrg,RulezReportColumn,ListSelect,
  PartRef,AutoRef,uXMLForm,OperTypeRef,Base,Menus;

{$R *.DFM}

var Rpointer: ^TReport;

function MakePluginReportParam(Name: String): TRulezReportForm;
var
  RR: TReport;
begin
  RR:=TReport.Create;
  RR.GetFromFile(name);
  Application.CreateForm(TRulezReportForm,Result);
  Result.Init(RR);
end;

procedure TRulezReportForm.SetCBTypes(n:integer);
begin
    Buttons[CBTypes.ItemIndex+1].Font.Style:=Buttons[CBTypes.ItemIndex+1].Font.Style-[fsBold];
    Buttons[n].Font.Style:=Buttons[n].Font.Style+[fsBold];
    CBTypes.ItemIndex:=n-1;
    R.SetConfByType(n);
end;

procedure TRulezReportForm.PrepareTypes;
var i:integer;
begin
    CBTypes.Items.Clear;
    for i:=1 to R.Types.Count do
        CBTypes.Items.Add(R.Types.Captions[i]);
    CBTypes.ItemIndex:=R.Types.Default_-1;
    R.SetConfByType(R.Types.Default_);
    Buttons[R.Types.Default_].Font.Style:=Buttons[R.Types.Default_].Font.Style+[fsBold];

    if R.Types.Count<9 then SB9.Visible:=FALSE;
    if R.Types.Count<8 then SB8.Visible:=FALSE;
    if R.Types.Count<7 then SB7.Visible:=FALSE;
    if R.Types.Count<6 then SB6.Visible:=FALSE;
    if R.Types.Count<5 then SB5.Visible:=FALSE;
    if R.Types.Count<4 then SB4.Visible:=FALSE;
    if R.Types.Count<3 then SB3.Visible:=FALSE;
    if R.Types.Count<2 then begin
       SB2.Visible:=FALSE;
       SB1.Visible:=FALSE;
    end;

    for i:=1 to R.Types.Count do
        case i of
             1: SB1.Hint:=R.Types.Captions[i];
             2: SB2.Hint:=R.Types.Captions[i];
             3: SB3.Hint:=R.Types.Captions[i];
             4: SB4.Hint:=R.Types.Captions[i];
             5: SB5.Hint:=R.Types.Captions[i];
             6: SB6.Hint:=R.Types.Captions[i];
             7: SB7.Hint:=R.Types.Captions[i];
             8: SB8.Hint:=R.Types.Captions[i];
             9: SB9.Hint:=R.Types.Captions[i];
        end;
end;

function StrToAlign(s:string):TAlign;
begin
    s:=UpperCase(s);
    if s='NONE' then result:=alNone
    else if s='BOTTOM' then result:=alBottom
    else if s='TOP' then result:=alTop
    else if s='LEFT' then result:=alLeft
    else if s='RIGHT' then result:=alRight
    else if s='CLIENT' then result:=alClient
    else Raise Exception.Create(TranslateText('StrToAlign: неизвестный аргумент ')+s);
end;

procedure TRulezReportForm.CheckBoxClick(Sender:TObject);
var ElementNum,ArgNum:integer;
    condition:string;
begin
    ElementNum :=(Sender as TCheckBox).Tag div 1000;
    ArgNum := (Sender as TCheckBox).Tag mod 1000;
    condition:=R.Elements[ElementNum].Res.Values['CONDITION'];
    if (Sender as TCheckBox).Checked then condition[ArgNum]:='y'
    else condition[ArgNum]:='n';
    R.Elements[ElementNum].Res.Values['CONDITION']:=condition;
end;

procedure TRulezReportForm.RadioButtonClick(Sender:TObject);
var ElementNum,ArgNum:integer;
    sl1:TStringList;
begin
    ElementNum:=(Sender as TRadioButton).Tag div 1000;
    ArgNum:=(Sender as TRadioButton).Tag mod 1000;
    sl1:=TStringList.Create;
    Str2StringList(R.Elements[ElementNum].Params.Values['VALUES'],sl1);
    R.Elements[ElementNum].Res.Values['VALUE']:=sl1[ArgNum];
    R.Elements[ElementNum].Res.Values['NAME'] :=(Sender as TRadioButton).Caption;
    sl1.Destroy;
end;

procedure TRulezReportForm.ComboEditClick(Sender:TObject);
var ElementNum:integer;
    ChooseType,startcond,options:string;
    q:TOilQuery;
    F:TBaseForm;
    cl:TFormClass;
    Form: TXMLForm;
begin
  ElementNum:=(Sender as TComboEdit).Tag;
  ChooseType:=R.Elements[ElementNum].Params.Values['TYPE'];
  if ChooseType='OIL_ORG' then
  begin
    startcond:=decode([R.Elements[ElementNum].Params.Values['STARTCONDITION'],'',4]);
    options:=decode([R.Elements[ElementNum].Params.Values['OPTIONS'],'','yyy']);

    if CaptureOrgQ(StrToInt(startcond),
                   MAIN_ORG.ID,MAIN_ORG.INST,options,q) then
    begin
      R.Elements[ElementNum].FillResFromDataSet(q);
      (Sender as TComboEdit).Text:=q.FieldByName(R.Elements[ElementNum].Params.Values['NAMEFIELD']).AsString;
      q.Destroy;
    end
  end
  else if ChooseType='OIL_NP_GROUP' then
    begin
      Form := GetXMLFormAsFilter('AzsDeviceTypes');
      try
        if Form.ShowModal = mrOk then
        begin
          (Sender as TComboEdit).Text:=Form.FQuery['name'];
          R.Elements[ElementNum].FillResFromDataSet(Form.FQuery);
        end;
      finally
        FreeAndNil(Form);
      end;
    end
  else
  begin
    if ChooseType='OIL_PART' then
      cl:=TPartRefForm
    else if ChooseType='OIL_AUTO' then
      cl:=TAutoRefForm
    else if ChooseType='OIL_OPER_TYPE' then
      cl:=TOperTypeRefForm
    else
      Raise Exception.Create(TranslateText('RulezReport: неизвестный тип ComboEdit - ')+ChooseType);

    Application.CreateForm(cl,F);
    try
      F.ShowModal;
      if (F.ModalResult = mrOk) and not F.q.Eof then
      begin
        (Sender as TComboEdit).Text:=F.q.FieldByName(R.Elements[ElementNum].Params.Values['NAMEFIELD']).AsString;
         R.Elements[ElementNum].FillResFromDataSet(F.q);
      end;
    finally
      F.free;
    end;
  end;
end;

procedure TRulezReportForm.ComboBoxChange(Sender:TObject);
var cmb:TComboBox;
begin
    cmb:=Sender as TComboBox;
    R.Elements[cmb.Tag].Res.Values['INDEX']:=IntToStr(cmb.ItemIndex);
    R.Elements[cmb.Tag].Res.Values['NAME']:=cmb.Items[cmb.ItemIndex];
end;

procedure TRulezReportForm.EditChange(Sender:TObject);
var ElementNum:integer;
begin
    ElementNum:=(Sender as TEdit).Tag;
    R.Elements[ElementNum].Res.Values['RESULT']:=(Sender as TEdit).Text;
end;

procedure ListMenuClick(p_IdList: TGroupIdList; p_Num: integer; p_Sb: TSpeedButton; p_Report: TObject = nil);
var R: TReport;
begin
    p_Sb.Hint:=p_IdList.NameList[p_Num];
    p_Sb.Down:=TRUE;
    R:=p_Report as TReport;
    R.Elements[p_SB.Tag].Res.Values['INDEXLIST']:=p_IdList[p_Num].CommaList;
    R.Elements[p_SB.Tag].Res.Values['NAMELIST']:=p_SB.Hint;
end;

procedure TRulezReportForm.ListSbClick(Sender:TObject);
var sb:TSpeedButton;
    LSF:TListSelectForm;
begin
    sb:=Sender as TSpeedButton;
    if sb.Down then begin
       Application.CreateForm(TListSelectForm,LSF);
       Lsf.TableName:=R.Elements[sb.Tag].Params.Values['TABLENAME'];
       Lsf.HasInst:=false;
       Lsf.AddCondition:=R.Elements[sb.Tag].Params.Values['CONDITION'];
       if LSF.ShowModal = mrOk then begin
          R.Elements[sb.Tag].Res.Values['INDEXLIST']:=copy(LSF.List,2,length(LSF.List)-2);
          R.Elements[sb.Tag].Res.Values['NAMELIST']:=LSF.DstList.Items.CommaText;
          R.Elements[sb.Tag].Res.Values['CHECKED']:='1';
          sb.Hint:=R.Elements[sb.Tag].Res.Values['NAMELIST'];
       end else begin
          sb.Down:=false;
          R.Elements[sb.Tag].ClearRes;
       end;
       LSF.Free;
    end else begin
       sb.Hint:=TranslateText('Все');
       R.Elements[sb.Tag].ClearRes;
    end;
end;

procedure TRulezReportForm.SBClearClick(Sender:TObject);
var ce:TControl;
begin
    ce:=ClearLinks[(Sender as TSpeedButton).Tag];
    ce.SetTextBuf(PChar(''));
    R.Elements[ce.Tag].ClearRes;
end;

procedure TRulezReportForm.DateEditChange(Sender:TObject);
begin
    R.Elements[(Sender as TDateEdit).Tag].Res.Values['RESULT']:=
      ''''+DateToStr((Sender as TDateEdit).Date)+'''';
end;

procedure TRulezReportForm.PreparePanels;
var i:integer;
    left,top,height,maxheight:integer;
    PanelList:TList;
    pnl:TPanel;
    //maxpanelsheight:integer;

    procedure PrepareOrgPanel;
    begin
         PanelOrg.Visible:=TRUE;
         if R.Panels[i].Params.Values['NUM']='1' then
            PanelOrg.Height:=35;
         LabelOrg1.Caption:=R.Panels[i].Params.Values['CAPTION1'];
         LabelOrg2.Caption:=R.Panels[i].Params.Values['CAPTION2'];
         if R.Panels[i].Params.Values['NULLVALUE1']='NO' then
            sbClearOrg1.Visible:=FALSE;
         if R.Panels[i].Params.Values['NULLVALUE2']='NO' then
            sbClearOrg2.Visible:=FALSE;
         ceOrg1.Tag:=R.Elements.IndexOf('ORG1');
         ceOrg2.Tag:=R.Elements.IndexOf('ORG2');
         ceOrg1.Text:=MAIN_ORG.NAME;
         ceOrg2.Text:='';
         R.Elements[ceOrg1.Tag].FillResFromMainOrg;
         PanelOrg.Align:=StrToAlign(R.Panels[i].Params.Values['ALIGN']);
    end;

    procedure PrepareDatePanel;
    begin
        PanelDate.Visible:=TRUE;
        lblDate1.Caption:=R.Panels[i].Params.Values['CAPTION1'];
        lblDate2.Caption:=R.Panels[i].Params.Values['CAPTION2'];
        deBegin.Tag:=R.Elements.IndexOf('BEGINDATE');
        deEnd.Tag:=R.Elements.IndexOf('ENDDATE');
        if R.Panels[i].Params.Values['RESTRICTION']<>'NO' then begin
           deEnd.Enabled:=FALSE;
           R.Elements[deBegin.Tag].Params.Values['RESTRICTION']:=R.Panels[i].Params.Values['RESTRICTION'];
        end;
        if R.Panels[i].Params.Values['NUM']='1' then begin
           lblDate2.Visible:=FALSE;
           deEnd.Visible:=FALSE;
           deBegin.Date:=Date;
        end else SetCurrentMonth(deBegin,deEnd);
    end;

    procedure PutTextElement(p_Panel:TGroupBox;p_Control:TControl;
                p_Caption:string;
                p_Button :string;
                p_Width,
                p_Left,p_Top:integer;var pp_Width,pp_NewTop:integer);

    var lbl:TLabel;
        sb:TSpeedButton;
    begin
        pp_NewTop:=p_Top; pp_Width:=0;
        if p_Caption<>'' then begin
           lbl:=TLabel.Create(Application);
           lbl.Caption:=p_Caption; lbl.Width:=GetTextWidth(p_Caption);
           lbl.Left:=p_Left; lbl.Top:=p_Top;
           pp_NewTop:=pp_NewTop+lbl.Height+LABEL_OTSTUP;
           if lbl.Width>pp_Width then pp_Width:=lbl.Width;
           p_Panel.InsertControl(lbl);
        end;
        if p_Width>pp_Width then pp_Width:=p_Width
                      else p_Width:=pp_Width;

        if p_Button='YES' then p_Width:=p_Width-23;

        p_Control.Top:=pp_NewTop; p_Control.Left:=p_Left; p_Control.Width:=p_Width;
        p_Panel.InsertControl(p_Control);

        if p_Button='YES' then begin
           sb:=TSpeedButton.Create(Application);
           p_Panel.InsertControl(sb);
           sb.Top:=pp_NewTop; sb.Width:=22;
           sb.Left:=p_Left+p_Width+1;
           sb.Glyph:=sbClearOrg1.Glyph;
           sb.Flat:=TRUE;
           ClearLinks.Add(p_Control);
           sb.Tag:=ClearLinks.Count-1;
           sb.OnClick:=sbClearClick;
        end;

        pp_NewTop:=pp_NewTop+p_Control.Height;
    end;

    procedure PutElement(p_Panel:TGroupBox;p_Left,p_Top,p_Num:integer;var pp_Width,pp_Height:integer);
    var cb:TCheckBox;
        rb:TRadioButton;
        ce:TComboEdit;
        ed:TEdit;
        cmb:TComboBox;
        SL,SV:TStringList;
        lbl:TLabel;
        sb:TSpeedButton;
        i,h:integer;
        menu: TPopupMenu;
        GroupIdLIst: TGroupIdList;
    begin
        SL:=TStringList.Create;
        SV:=TStringList.Create;
      try
        //################### CHECKBOXGROUP ###########################
        if R.Elements[p_Num].ElementType='CHECKBOXGROUP' then begin
           Str2StringList(R.Elements[p_Num].CountFunc('GETCAPTIONS',true),SL);
           pp_Width:=0; h:=p_Top;
           for i:=0 to SL.Count-1 do begin
               cb:=TCheckBox.Create(Application);
               cb.Left:=PNL_HOR_OTSTUP;
               cb.Top:=h;
               h:=h+cb.Height+PNL_VER_OTSTUP;
               cb.Caption:=SL[i];
               cb.Width:=GetTextWidth(SL[i])+20;
               cb.Checked:=(R.Elements[p_Num].Params.Values['CONDITION'][i+1]='y');
               cb.Tag:=p_Num*1000+i+1;
               cb.OnClick:=CheckBoxClick;
               if cb.Width>pp_Width then pp_Width:=cb.Width;
               p_Panel.InsertControl(cb);
           end;
           pp_Height:=h-PNL_VER_OTSTUP;
        //################### RADIOBUTTONGROUP ###########################
        end else if R.Elements[p_Num].ElementType='RADIOBUTTONGROUP' then begin
           Str2StringList(R.Elements[p_Num].CountFunc('GETCAPTIONS',true),SL);
           Str2StringList(R.Elements[p_Num].Params.Values['VALUES'],SV);

           pp_Width:=0; h:=p_Top;
           for i:=0 to SL.Count-1 do begin
               rb:=TRadioButton.Create(Application);
               rb.Left:=PNL_HOR_OTSTUP;
               rb.Top:=h;
               rb.Width:=GetTextWidth(SL[i])+20;
               h:=h+rb.Height+PNL_VER_OTSTUP;
               rb.Caption:=SL[i];
               if R.Elements[p_Num].Params.Values['CONDITION']=IntToStr(i) then begin
                  rb.Checked:=TRUE;
                  R.Elements[p_Num].Res.Values['VALUE']:=SV[i];
                  R.Elements[p_Num].Res.Values['NAME']:=SL[i];
               end;
               rb.Tag:=p_Num*1000+i;
               rb.OnClick:=RadioButtonClick;
               if rb.Width>pp_Width then pp_Width:=rb.Width;
               p_Panel.InsertControl(rb);
           end;
           pp_Height:=h-PNL_VER_OTSTUP;
        //####################### COMBOEDIT ###########################
        end else if R.Elements[p_Num].ElementType='COMBOEDIT' then begin
           ce:=TComboEdit.Create(Application);
           PutTextElement(p_Panel,ce,
                   R.Elements[p_Num].CountFunc('CAPTION',true),
                   R.Elements[p_Num].Params.Values['NULLVALUE'],
                   StrToInt(R.Elements[p_Num].Params.Values['WIDTH']),
                   p_Left,p_Top,pp_Width,pp_Height);
           ce.GlyphKind:=gkDropDown;
           ce.DirectInput:=FALSE;
           ce.Tag:=p_Num;
           ce.OnButtonClick:=ComboEditClick;
           ce.OnDblClick:=ce.OnButtonClick;
        //####################### EDIT #################################
        end else if R.Elements[p_Num].ElementType='EDIT' then begin
           ed:=TEdit.Create(Application);
           PutTextElement(p_Panel,ed,
                   R.Elements[p_Num].CountFunc('CAPTION',true),
                   'YES',
                   StrToInt(R.Elements[p_Num].Params.Values['WIDTH']),
                   p_Left,p_Top,pp_Width,pp_Height);
           ed.Tag:=p_Num;
           ed.OnChange:=EditChange;
           ed.Text:=R.Elements[p_Num].Res.Values['RESULT'];
        //####################### COMBOBOX #############################
        end else if R.Elements[p_Num].ElementType='COMBOBOX' then begin
           cmb:=TComboBox.Create(Application);
           PutTextElement(p_Panel,cmb,
                   R.Elements[p_Num].CountFunc('CAPTION',true),
                   R.Elements[p_Num].Params.Values['NULLVALUE'],
                   StrToInt(R.Elements[p_Num].Params.Values['WIDTH']),
                   p_Left,p_Top,pp_Width,pp_Height);
           cmb.Items.CommaText:=R.Elements[p_Num].Params.Values['LIST'];
           cmb.OnChange:=ComboBoxChange;
           cmb.ItemIndex:=0;
           cmb.Tag:=p_Num;
           cmb.OnKeyPress:=cbTypesKeyPress;
        //########################### LIST #############################
        end else if R.Elements[p_Num].ElementType='LIST' then begin
           lbl:=TLabel.Create(Application);
           lbl.Caption:=R.Elements[p_Num].CountFunc('CAPTION',true);
           lbl.Width:=GetTextWidth(lbl.Caption);
           lbl.Top:=p_Top+5; lbl.Left:=p_Left;
           p_Panel.InsertControl(lbl);

           sb:=TSpeedButton.Create(Application);
           sb.Width:=25; sb.Height:=25;
           sb.Top:=p_Top; sb.Left:=p_Left+lbl.Width+10;
           sb.Tag:=p_Num; sb.GroupIndex:=p_Num;
           p_Panel.InsertControl(sb);
           sb.Glyph:=sbListPicture.Glyph;
           sb.ShowHint:=TRUE;
           sb.Flat:=TRUE; sb.AllowAllUp:=TRUE;
           sb.OnClick:=ListSbClick;
           sb.Down:=(R.Elements[p_Num].Res.Values['CHECKED']='1');
           if sb.Down then sb.Hint:=R.Elements[p_Num].Res.Values['NAMELIST']
                      else sb.Hint:=TranslateText('Все');
           pp_Width:=lbl.Width+10+sb.Width;
           pp_Height:=p_Top+sb.Height+PNL_VER_OTSTUP;

           if R.Elements[p_Num].Params.Values['OILVARTYPE']='GROUP' then begin
              GroupIdList:=TGroupIdList.Create(R.Elements[p_Num].Params.Values['OILVARNAME']);
              menu:=TPopupMenu.Create(Self);
              GroupIdList.MakeMenu(sb,menu,ListMenuClick,-1,R);
           end;
        end;
      finally
        SL.Destroy; SV.Destroy;
      end;
    end;

    procedure PreparePanel(var p_Left,p_Top,p_Height:integer);
    var FormPanel:TGroupBox;
        j,CurHeight:integer;
        maxwidth,height,width:integer;
    begin
        FormPanel:=TGroupBox.Create(Application);
        FormPanel.Parent:=Self;
        if R.Panels[i].Caption='' then CurHeight:=PNL_UP_OTSTUP-6
                                  else CurHeight:=PNL_UP_OTSTUP;
        maxwidth:=0;
        for j:=0 to R.Elements.Count-1 do
            if R.Elements[j].PanelId=i then begin
               PutElement(FormPanel,PNL_HOR_OTSTUP,CurHeight,j,width,height);
               CurHeight:={CurHeight+}height+PNL_VER_OTSTUP;
               if width>maxwidth then maxwidth:=width;
            end;
        CurHeight:=CurHeight+PNL_VER_OTSTUP;
        if R.Panels[i].Params.Values['HEIGHT']='0' then
          FormPanel.Height:=CurHeight//+PNL_UP_OTSTUP
        else
          FormPanel.Height:=StrToInt(R.Panels[i].Params.Values['HEIGHT']);
        p_Height:=FormPanel.Height;

        if R.Panels[i].Params.Values['WIDTH']='0' then
           FormPanel.Width:=maxwidth+2*PNL_HOR_OTSTUP
        else FormPanel.Width:=StrToInt(R.Panels[i].Params.Values['WIDTH']);
        FormPanel.Caption:=R.Panels[i].Caption;
        FormPanel.Left := p_Left;
        FormPanel.Top := p_Top;
        //FormPanel.Align := alTop;
        p_Left := p_Left+FormPanel.Width+2;
        PanelList.Add(FormPanel);
    end;

begin
  left:=-1; maxheight:=0;
  PanelList:=TList.Create;
  for i:=0 to R.Panels.Count-1 do
  begin
    if R.Panels[i].PanelType='ORGPANEL' then
      PrepareOrgPanel
    else if R.Panels[i].PanelType='DATEPANEL' then
      PrepareDatePanel
    else
    begin
      if left=-1 then
      begin
       left:=1;
       top := 0;
       if PanelDate.Visible then
         top := PanelDate.Top + PanelDate.Height;
       if PanelOrg.Visible and (top < PanelOrg.Top + PanelOrg.Height)then
         top := PanelOrg.Top + PanelOrg.Height;
       if PanelList.Count <> 0 then
       begin
         pnl := PanelList.Items[PanelList.Count-1];
         if top < pnl.Top + pnl.Height then
           top := pnl.Top + pnl.Height;
       end;
      end;
      PreparePanel(left,top,height);
      if height > maxheight then
        maxheight := height;
    end;
  end;
  if left+8>Self.Width then
    Self.Width:=left+8;
  height := 25+PanelGrp.Height+maxheight+Panel2.Height;
  if PanelDate.Visible then
    height := height+PanelDate.Height;
  if PanelOrg.Visible then
    height := height+PanelOrg.Height;
  Self.Height := height;
  for i:=0 to PanelList.Count-1 do
  begin
    pnl := PanelList.Items[i];
    //pnl.Height := maxheight;
  end;
  PanelList.Destroy;
end;

procedure TRulezReportForm.Init(rep: TReport);
begin
  R:=rep;
  Rpointer:=@rep;
  Debugging:=FALSE;
  Caption:=R.FormTitle;
  cbSymbols.Checked:=R.Razm_Symbols;
  PrepareTypes;
  PreparePanels;
end;

procedure MakeRulezReport(R: TReport);
var F: TRulezReportForm;
begin
     Application.CreateForm(TRulezReportForm,F);
     F.Init(R);
     F.ShowModal;
     F.Free;
end;


procedure TRulezReportForm.BitBtn1Click(Sender: TObject);
begin
  if PanelDate.Visible and deBegin.Visible and deEnd.Visible then begin
    try
      DefineRepDates(deBegin.Date,deEnd.Date,1);
    except
      showmessage(TranslateText('Не поддерживается функция SetRepBeginDate! Отчет будет строиться дольше!'));
    end;
  end;
  ApplicationInfo.Action := TranslateText('Отчет')+': '+R.Title;
  R.MakeReport;
  ApplicationInfo.Action := '';  
end;

procedure MakePluginReport(name:string);
var RR: TReport;
begin
     RR:=TReport.Create;
   try
     RR.GetLastVersion(name);
     MakeRulezReport(RR);
   finally
     RR.Destroy;
   end;
end;

procedure TRulezReportForm.SBConfClick(Sender: TObject);
begin
     SetCBTypes((Sender as TSpeedButton).Tag);
end;

procedure TRulezReportForm.CBTypesChange(Sender: TObject);
var n,i:integer;
begin
     n:=CBTypes.ItemIndex+1;
     R.SetConfByType(n);
     for i:=1 to 9 do
         if i=n then Buttons[i].Font.Style:=Buttons[i].Font.Style+[fsBold]
         else Buttons[i].Font.Style:=Buttons[i].Font.Style-[fsBold];
end;

procedure TRulezReportForm.CBTypesKeyPress(Sender: TObject; var Key: Char);
begin
     Key:=#0;
end;

procedure TRulezReportForm.CBTypesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Key:=0;
end;

procedure TRulezReportForm.SBConstrClick(Sender: TObject);
begin
     if SetCustomConf(R) then begin
        Buttons[CBTypes.ItemIndex+1].Font.Style:=Buttons[CBTypes.ItemIndex+1].Font.Style-[fsBold];
        Buttons[0].Font.Style:=Buttons[0].Font.Style+[fsBold];
        CBTypes.ItemIndex:=-1;
        CBTypes.Text:=TranslateText('Отчет пользователя');
     end;
end;

procedure TRulezReportForm.FormCreate(Sender: TObject);
begin
  inherited;
     Buttons[0]:=@SBConstr;
     Buttons[1]:=@SB1;
     Buttons[2]:=@SB2;
     Buttons[3]:=@SB3;
     Buttons[4]:=@SB4;
     Buttons[5]:=@SB5;
     Buttons[6]:=@SB6;
     Buttons[7]:=@SB7;
     Buttons[8]:=@SB8;
     Buttons[9]:=@SB9;
     ClearLinks:=TList.Create;
     ClearLinks.Add(ceOrg1);
     ClearLinks.Add(ceOrg2);
end;

procedure TRulezReportForm.cbSymbolsClick(Sender: TObject);
begin
     R.Razm_Symbols:=cbSymbols.Checked;
end;

procedure TRulezReportForm.deBeginChange(Sender: TObject);
var day,month,year:word;
    date1,date2:TDateTime;
begin
    DecodeDate(deBegin.Date,Year,Month,Day);
    GetMonthLimits(month,year,date1,date2);
    if (R.Elements[deBegin.Tag].Params.Values['RESTRICTION']='MONTH') and (Day<>1) then
       deBegin.Date:=date1;
    if deEnd.Visible then deEnd.Date:=date2;
    DateEditChange(Sender);
end;

procedure TRulezReportForm.Panel2DblClick(Sender: TObject);
begin
    if Main.Debugging then
       ShowTextInMemo(GetNiceSql(R.GetSqlText));
end;

procedure TRulezReportForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DefineRepDates(0,0);
end;

end.
