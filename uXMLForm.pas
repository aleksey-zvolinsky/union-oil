{

Объект, который преобразует XML-представление в форму

  ShowXMLForm(AFileName: string);
  Создает форму, которая будет наследована от BaseFormEnh
и дополнена элементами, представленными в коде XML
AFileName - только имя файла, расширение длолжно быть XML,
местонахождение - папка FORMS корневого каталога программы.

Тэги:

 <form [dialogform=true/false] [caption=S] [menu=S] [menuname=S] [menuposition=N]
   [filters=true/false] [editbuttons=true/false] [width=N] [height=N] [version=?]
   [tablename=S]>
   <editbuttons>
     <addbutton>
     <editbutton>
     <deletebutton>
     <showtotalbutton>
     <showdetailcheckbox>
     <sqlfasterbutton>
   <sql>
   <sqlfaster>
   <sqldetail>
   <editclass [classname="ClassName"] [resultfilter="FilterName"] [printable=true/false]>
     <print>
       <caption>
       <printnumber>
       <rrr>
       <conditionvisible>
         <fieldname>
         <value>

   <columns>
     <column [align=left/right/center] [width=N]>
       <caption [align=left/right/center]>
       <fieldname>
       <total valuetype=avg/count/sum/statictext>
         <fieldname>
         <value>

   <columnsdetail>
     <column [align=left/right/center] [width=N]>
       <caption [align=left/right/center]>
       <fieldname>

   <filters>

     <edit [left=N] [top=N] [width=N] [wholevlue=true/false] [onlynumbers=true/false]>
       <name>
       <caption>
       <fieldname>

     <dateedit [left=N] [top=N] [width=N] [direction=fromdate/todate]>
       <name>
       <caption>
       <fieldname>

     <xmlform [left=N] [top=N] [width=N] [wholevlue=true/false] [orgref=true/false] [orgtype=true/false] [enableflags='yyy']>
       <name>
       <caption>
       <link>
         <srcfield>
         <destfield>

     <editform>
       <dllname>
       <keyfield>
         <name>

     <list [left=N] [top=N] [width=N]>
       <name>
       <caption>
       <fieldname>
       <items>
         <item>


}
unit uXMLForm;

interface

uses uCommonForm,   ExFunc, Base, Forms, ComObj, Dialogs, Sysutils, DBGridEh, stdCtrls,
 Menus, Classes,CurrEdit, Main,ToolEdit, Controls, dbtables, Buttons, Ora, DB, Windows,
 rxctrls, EditBase,uOilQuery,uOilStoredProc{$IFDEF VER150},Variants{$ENDIF};

  type TFilterField = record
    DestFieldName : String;
    SrcFieldName : String;
    FilterName : String;
    Value : String;
    IsWholeValue : Boolean;
    IsNumber : Boolean;
    IsCaptionField : Boolean;
    IsDateField : Boolean;
    Direction : (dirNone, dirFromDate,dirToDate);
    EnableFlags : String;
    OrgType : integer;
  end;

  type TPrintField=record
    Caption,
    MenuName:string;
    PrintNumber:integer;
    RRR:string;
    ConditionVisible:record
      FieldName,
      Value:string;
    end;
  end;

  const
    MAX_FILTERS = 16;
    MAX_PRINTS = 10;
    FORMS_FOLDER = 'Forms';
    {Dict}
    XCAPTION = 'caption';
    XSQL = 'sql';
    XSQLDETAIL = 'sqldetail';    
    XCOLUMNS = 'columns';
    XCOLUMNSDETAIL = 'columnsdetail';    
    XCOLUMN = 'column';
    XFIELDNAME = 'fieldname';
    XFILTERS = 'filters';
    XEDIT = 'edit';
    XNAME = 'name';
    XDEFAULT = 'default';
    XWHOLEVALUE = 'wholevalue';
    XWIDTH = 'width';
    XLEFT='left';
    XTOP = 'top';
    XRIGHT='right';
    XCENTER='center';
    XALIGN='align';
    XONLYNUMBERS = 'onlynumbers';
    XXMLFORM = 'xmlform';
    XSRC = 'srcfield';
    XDEST = 'destfield';
    XLINK = 'link';
    XTEXTFIELD = 'textfield';
    XDATEEDIT = 'dateedit';
    XDIRECTION = 'direction';
    XFROMDATE = 'fromdate';
    XTODATE = 'todate';
    XHEIGHT = 'height';
    XMENU = 'menu';
    XMENUPOSITION = 'menuposition';
    XORGREF ='orgref';
    XORGTYPE = 'orgtype';
    XENABLEFLAGS = 'enableflags';
    XEDITBUTTONS = 'editbuttons';
    XEDITFORM = 'editform';
    XDLLNAME = 'dllname';
    XKEYFIELD = 'keyfield';
    XDIALOGFORM ='dialogform';
    XEDITCLASS = 'editclass';
    XCLASSNAME = 'classname';
    XRESULTFILTER = 'resultfilter';
    XTABLENAME = 'tablename';
    XVERSION = 'version';
    XMENUNAME = 'menuname';
    XPRINTABLE = 'printable';
    XPRINT = 'print';
    XPRINTNUMBER = 'printnumber';
    XCONDITIONVISIBLE = 'conditionvisible';
    XVALUE = 'value';
    XRRR = 'rrr';
    XADDBUTTON = 'addbutton';
    XEDITBUTTON = 'editbutton';
    XDELETEBUTTON = 'deletebutton';
    XSHOWTOTALBUTTON = 'showtotalbutton';
    XSHOWDETAILCHECKBOX = 'showdetailcheckbox';
    XSQLFASTERBUTTON = 'sqlfasterbutton';
    XLIST = 'list';
    XITEMS = 'items';
    XITEM = 'item';
    XTOTAL = 'total';
    XVALUETYPE = 'valuetype';
    
  type TXMLForm = class(TBaseForm)
    private
      FOldWidth : integer;
      FOldHeight : integer;
      FXMLDoc : Variant;
      FRootNode: Variant;
      FCaption : String;
      FColumns : TDBGridColumnsEh;
      FColumn : TDBGridColumnEh;
      FColumnsDetail : TDBGridColumnsEh;
      FColumnDetail : TDBGridColumnEh;
      FClearButton : TSpeedButton;
      FLastWholeValue : Boolean;
      FFilters : array [1..MAX_FILTERS] of TFilterField;
      FFiltersCount : Integer;
      FEdit : Pointer;
      FLabel, FHiddenLabel : TLabel;
      FRxSpeedButton : TRxSpeedButton;
      FVersion : string;
      FPrints : array [1..MAX_PRINTS] of TPrintField;
      FPrintsCount : Integer;
      FEditButtons : boolean;
      {}
      hDll : HWND;
      InitPlugin : procedure (App, Scr, AOraSession, AQuery: Integer); StdCall;
      AddRecord : procedure; StdCall;
      EditRecord : procedure{(AId, AInst: Integer);} StdCall;
      DeleteRecord : procedure{(AId, AInst: Integer)}; StdCall;
      DonePlugin : function : Boolean; StdCall;
      {}
      FEditClass: TEditClass;
      procedure PrintRecord(Sender: TObject);
      procedure EditRecord2(Sender: TObject);
      procedure DeleteRecord2(Sender: TObject);
      procedure SetFormParams;
      procedure ProcessColumns(ANode: Variant);
      procedure ProcessColumnTotal(ANode: Variant);
      procedure ProcessColumnsDetail(ANode: Variant);      
      procedure ProcessFilters(ANode: Variant);
      procedure ProcessEditForm(ANode: Variant);
      procedure ProcessEditButtons(ANode: Variant);
      (** Разбор <editclass> *)
      procedure ProcessEditClass(ANode: Variant);
      procedure ProcessWinControl(ANode: Variant);
      procedure FilterClearClick(Sender: TObject);
      function GetComponent(AName: string): Pointer;
      procedure ShowSQLText(SEnder: TObject);
      procedure OnGridDblClick(Sender: TObject);
      procedure DateEditAcceptDate(Sender: TObject;
        var ADate: TDateTime; var Action: Boolean);
      procedure AddRecFromPlugin(Sender: TObject);
      procedure EditRecFromPlugin(Sender: TObject);
      procedure DelRecFromPlugin(Sender: TObject);
      procedure OnXMLFormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure DataSourceDataChange(Sender: TObject; Field: TField);
    public
      FQuery : TOilQuery;
      FQueryDetail : TOilQuery;      
      (** Разбор xml-файла *)
      procedure Parse(AFileName: string);
      constructor Create(AOwner: TComponent ; AName: String='');  reintroduce;
    protected
      procedure SearchClick(Sender: TObject);
      procedure ClearClick(Sender: TObject);
      procedure FilterOnEditChange(Sender: TObject);
      procedure FilterOnComboClick(Sender: TObject);
      procedure FilterOnComboClickOrg(Sender: TObject);
  end;

  PXMLForm = ^TXmlForm;

  function Up(AString: String): String;
  function GetParseError(Error: Variant): string;
  (** Выдает екземпляр формы *)
  function ShowXMLForm(AFileName: string): TXMLForm;
  function GetXMLFormAsFilter(Sender: TObject): TXMLForm; overload;
  function GetXMLFormAsFilter(AFileName: String): TXMLForm; overload;
  (** Возвращает значения параметра нода *)
  function GetAttrValue(ANode: Variant; AName: String): String;
  (** Функции по быбору данных из XML-справочников *)
  function XMLChoose(p_Name: string; var pp_Id: integer): boolean; overload;
  function XMLChoose(p_Name: string; p_Field: String; var pp_Id: integer; p_CE: TComboEdit): boolean; overload;
  function XMLChoose(p_Name: string; var pp_Id: integer; var pp_Name: string): boolean; overload;
  function XMLChoose(p_Name: string; var pp_Id,pp_Inst: integer; var pp_Name: string): boolean; overload;
  function XMLChoose(p_Name: string; var pp_Id, pp_Inst: integer): boolean; overload;
  function XMLChoose(p_Name: string; p_CE: TComboEdit): boolean; overload;
  function XMLChoose(p_Name: string; var pp_Id: integer; p_CE: TComboEdit): boolean; overload;
  function XMLChoose(p_Name: string; var pp_Id,pp_Inst: integer; p_CE: TComboEdit): boolean; overload;
  function XMLChooseBill(
    FromID, FromINST, ToID, ToINST: integer;
    FromName, ToName: string;
    sType: char;
    DateBegin, DateEnd: TDate;
    var pp_Id, pp_Inst: integer;
    var pp_Name, pp_Date: string
  ): boolean; // загрузка рахунків

  var
    XMLForm : TXMLForm;
    N: Integer = 0;
    M: Integer = 0;

implementation

  uses ChooseOrg, uExeSql, uStart, UDbFunc;

{------------------------------------------------------------------------------}
function GetAttrValue(ANode: Variant; AName: String): string;
var
 Attr : Variant;
begin
  Attr := ANode.GetAttribute(AName);
  if not VarIsNull(Attr)
    then Result := Attr
    else Result := '';
end;
{------------------------------------------------------------------------------}
function GetXMLFormAsFilter(AFileName: String): TXMLForm; overload;
var
  Form : TXmlForm;
  FilterName : String;
begin
  FilterName := AFileName;
  Form := TXMLForm.Create( nil,AFileName );
  with Form do
  begin
    FormStyle := fsNormal;
    Parse(FilterName);
    bbOk.Visible := true;
    bbOk.Kind := bkOk;
    bbOk.Caption := TranslateText('Выбрать');
    DBGrid1.OnDblClick := OnGridDblClick;
  end;
  Result := Form;
end;


{------------------------------------------------------------------------------}
function GetXMLFormAsFilter(Sender: TObject): TXMLForm;
var
  Form : TXmlForm;
  FilterName : String;
  I: integer;
begin
  FilterName := (Sender as TCustomEdit).Name;
  Form := TXMLForm.Create(XMLForm);
  try
    with Form do
    begin
      FormStyle := fsNormal;
      Parse(FilterName);
      bbOk.Visible := true;
      bbOk.Caption := TranslateText('Выбрать');
      bbOk.ModalResult := mrOk;
      DBGrid1.OnDblClick := OnGridDblClick;
      ShowModal;
      if ModalResult = mrOk then
      for I:=1 to Length(XMLForm.FFilters) do
        if (XMLForm.FFilters[I].SrcFieldName <> '') and
         (XMLForm.FFilters[I].FilterName = FilterName)
      then
      begin
        {Заполнить текстом edit}
        if XMLForm.FFilters[I].IsCaptionField then begin
          (Sender as TCustomEdit).Text := FQuery[trim(XMLForm.FFilters[I].SrcFieldName)];
          Continue;
        end;
        {Заполнить значениями массив фильтров}
        XMLForm.FFilters[I].Value :=
          FQuery.FieldByName(trim(XMLForm.FFilters[I].SrcFieldName)).Value;

      end;
    end;
    Result := Form;
  finally
    Form.Free;
  end;
end;
{------------------------------------------------------------------------------}
function ShowXMLForm(AFileName: string): TXMLForm;
begin
  XMLForm := TXMLForm.Create( nil,AFileName );
  try
    XMLForm.Parse(AFileName);
    XMLForm.FormStyle := fsMDIChild;
    XMLForm.Show;
    MainForm.DoMDIButton(XMLForm);
  finally
    Result := XMLForm;
  end;
end;
{------------------------------------------------------------------------------}
function XMLChoose(p_Name: string; var pp_Id: integer): boolean;
var
  Form : TXmlForm;
begin
  Form :=GetXMLFormAsFilter(p_Name);
  try
    result:=Form.ShowModal = mrOk;
    if result then
      pp_Id:=Form.FQuery['ID'];
  finally
    FreeAndNil(Form);
  end;
end;
{------------------------------------------------------------------------------}
function XMLChoose(p_Name: string; p_Field: String; var pp_Id: integer; p_CE: TComboEdit): boolean; overload;
var
  Form : TXmlForm;
begin
  Form :=GetXMLFormAsFilter(p_Name);
  try
    result:=Form.ShowModal = mrOk;
    if result and not Form.FQuery.IsEmpty then begin
      pp_Id:=Form.FQuery[p_Field];
      p_CE.Text:=Form.FQuery['NAME'];
    end;
  finally
    FreeAndNil(Form);
  end;
end;
{------------------------------------------------------------------------------}
function XMLChoose(
  p_Name: string;
  var pp_Id: integer;
  var pp_Name: string): boolean; overload;
var
  Form : TXmlForm;
begin
  Form :=GetXMLFormAsFilter(p_Name);
  try
    result:=Form.ShowModal = mrOk;
    if result then begin
      pp_Id:=Form.FQuery['ID'];
      pp_Name:=Form.FQuery['NAME'];
    end;
  finally
    FreeAndNil(Form);
  end;
end;
{------------------------------------------------------------------------------}
function XMLChoose(
  p_Name: string;
  var pp_Id,pp_Inst: integer;
  var pp_Name: string): boolean; overload;
var
  Form : TXmlForm;
begin
  Form :=GetXMLFormAsFilter(p_Name);
  try
    result:=Form.ShowModal = mrOk;
    if result then begin
      pp_Id:=Form.FQuery['ID'];
      pp_Inst:=Form.FQuery['INST'];
      pp_Name:=Form.FQuery['NAME'];
    end;
  finally
    FreeAndNil(Form);
  end;
end;
{------------------------------------------------------------------------------}
function XMLChoose(
  p_Name: string;
  var pp_Id, pp_Inst: integer): boolean; overload;
var
  Form: TXmlForm;
begin
  Form := GetXMLFormAsFilter(p_Name);
  try
    result := Form.ShowModal = mrOk;
    if result then
    begin
      pp_Id := Form.FQuery['ID'];
      pp_Inst := Form.FQuery['INST'];
    end;
  finally
    FreeAndNil(Form);
  end;
end;
{------------------------------------------------------------------------------}
function XMLChoose(
  p_Name: string;
  p_CE: TComboEdit): boolean; overload;
var
  vId: integer;
  vName: string;
begin
  result:=XMLChoose(p_Name,vId,vName);
  if result then begin
    p_CE.Tag:=vId;
    p_CE.Text:=vName;
  end;
end;
{------------------------------------------------------------------------------}
function XMLChoose(p_Name: string; var pp_Id: integer; p_CE: TComboEdit): boolean; overload;
var
  vName: string;
begin
  result:=XMLChoose(p_Name,pp_Id,vName);
  if result then
    p_CE.Text:=vName;
end;
{------------------------------------------------------------------------------}
function XMLChoose(p_Name: string; var pp_Id,pp_Inst: integer; p_CE: TComboEdit): boolean; overload;
var
  vName: string;
begin
  result:=XMLChoose(p_Name,pp_Id,pp_Inst,vName);
  if result then
    p_CE.Text:=vName;
end;
{------------------------------------------------------------------------------}
function Up(AString: String): String;
begin
  Result := AnsiUpperCase(AString);
end;
{------------------------------------------------------------------------------}
function IsNumber(AStr: String): boolean;
begin
  try
    StrToInt(AStr);
    Result := true;
  except
    Result := false;
  end;
end;
{------------------------------------------------------------------------------}
function GetParseError(Error: Variant): string;
begin
  Result :=  TranslateText('Ошибка при загрузке документа ["') + Error.url + ' ]'#13#10
             + Error.reason + #13#10#13#10;
  if (Error.line > 0) then
    Result := Result + TranslateText('строка ') + Error.line + TranslateText(', символ ') + error.linepos + #13#10
                     + Error.srcText;
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.OnGridDblClick(Sender: TObject);
begin
  bbOk.Click;
end;

{--------------------- ---------------------------------------------}
function TXMLForm.GetComponent(AName: String):Pointer;
var
 I: integer;
begin
  Result := nil;
  for I := ComponentCount - 1 downto 0 do
    if Components[I] is TComboEdit
      then if Components[I].Name = AName
        then Result := Pointer(Components[I]);
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.ClearClick(Sender: TObject);
var
  I: Integer;
begin
  for I := ComponentCount - 1 downto 0 do
    if Components[I] is TControl
      then if TWinControl(Components[I]).Parent = Panel2
        then if Components[I] is TSpeedButton
          then FilterClearClick(TSpeedButton(Components[I]))
          else if Components[I] is TCustomEdit
              then if not (Components[I] is TDateEdit)
                then TEdit(Components[I]).Text := '';

end;
{------------------------------------------------------------------------------}
procedure TXMLForm.SearchClick(Sender: TObject);
var
  I: Integer;
  Value : String;
begin
  if Trim(Self.FQuery.SQL.Text) = '' then Exit;
  {вернуть первоначальный вид sql}
  Self.FQuery.SQL.Text := FQuery.BaseSQL;

  for i:=0 to Self.FQuery.Params.Count-1 do
    Self.FQuery.Params.Items[i].Value := Null;
  {применить фильтры}
  for I:=1 to length(FFilters) do
  begin
    if FFilters[I].Value <> '' then
    begin
      {Если фильтр числовой или дата передаем как есть, иначе в кавычки}
      If not (FFilters[I].IsNumber) or (FFilters[I].IsDateField) then
        Value := ''''+FFilters[I].Value+''''
      else
        Value := FFilters[I].Value;

      {обработать Direction поля даты}
      if FFilters[I].DestFieldName<>'' then
      begin
        if FFilters[I].IsDateField then
        begin
          if FFilters[I].Direction = dirFromDate then
            FQuery.AddWhere('  trunc('+FFilters[I].DestFieldName+') >= '+Value)
          else if FFilters[I].Direction = dirToDate then
            FQuery.AddWhere('  trunc('+FFilters[I].DestFieldName+') <= '+Value)
          else
            FQuery.AddWhere('  trunc('+FFilters[I].DestFieldName+') = '+Value);
        end
        else if (FFilters[I].IsWholeValue) then
          Self.FQuery.AddWhere('  '+FFilters[I].DestFieldName+' = '+Value)
        else
          Self.FQuery.AddWhere(' Upper('+FFilters[I].DestFieldName+')'+
                               ' like ''%'+Up(FFilters[I].Value)+'%'' ');
      end;

      if Self.FQuery.Params.FindParam(FFilters[i].FilterName) <> nil then
        Self.FQuery.Params.ParamByName(FFilters[i].FilterName).Value := FFilters[i].Value;
    end;
  end;

  //Self.FQuery.Params.ParamByName('card_number').IsNull
  if Self.FQuery.Active then
    Self.FQuery.Close;
  try
    Screen.Cursor := crSQLWait;
    try
      Self.FQuery.Prepare;
      Self.FQuery.Open;
    finally
      Screen.Cursor := crDefault;
    end;
  except on E: Exception do
    begin
      if Main.Debugging then
        ShowTextInMemo(FQuery.Sql.Text);
      MessageDlg(E.Message,mtError,[mbOk],0);
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.SetFormParams();
begin
  FRxSpeedButton := TRxSpeedButton.Create(Self);
  FRxSpeedButton.Parent := Panel1;
  MainForm.il.GetBitmap(9,FrxSpeedButton.Glyph);
  FRxSpeedButton.Left := bbSearch.Left + bbSearch.Width + 10;
  FRxSpeedButton.Top := bbSearch.Top + 2;
  FRxSpeedButton.Width := 62;
  FRxSpeedButton.DropDownMenu := PUM;
  Self.OnCloseQuery := OnXMLFormCloseQuery;
  bbSearch.OnClick := SearchClick;
  bbClear.OnClick := ClearClick;
  FColumns := DBGrid1.Columns;
  FColumns.Clear;
  FColumnsDetail := DBGridDetail.Columns;
  FColumnsDetail.Clear;
  FFiltersCount := 0;
  FPrintsCount := 0;
  DBGrid1.AutoFitColWidths := false;
  Panel2.AutoSize := true;
//  q.Name:='qOld';
//  FQuery := TOilQuery.Create(Self);
  FQuery := q;
  FQuery.Name :='q';
  ds.DataSet := FQuery;
  FQueryDetail := qDetail;
  FQueryDetail.Name :='qDetail';
  dsDetail.DataSet := FQueryDetail;
  Self.Panel1.OnDblClick := ShowSQLText;
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.FilterOnEditChange(Sender: TObject);
var
 I, J: integer;
begin
  {Заполнить массив фильтров значениями}
  for i:= 1 to length(FFilters) do
  begin
    if FFilters[i].FilterName = (Sender as TControl).Name then
    begin
      if Sender.ClassName = 'TComboBox' then
        FFilters[i].Value := (Sender as TComboBox).Text
      else
      begin
        FFilters[i].Value := (Sender as TCustomEdit).Text;
       {Подсвечивать красным только колонки с левым выравниванием}
        for J:=0 to DBGrid1.Columns.Count-1 do
        begin
          Self.RedColorFieldName := FFilters[i].DestFieldName;
          Self.RedColorFilter := (Sender as TCustomEdit);
        end;
      end;
    end;
  end;
  SearchClick(nil);
end;

{------------------------------------------------------------------------------}
procedure TXMLForm.ProcessColumns(ANode: Variant);

  function GetAlignment(ANode: Variant):TAlignment;
  begin
      if GetAttrValue(ANode,XALIGN) = XRIGHT
        then  Result := taRightJustify else
      if GetAttrValue(ANode,XALIGN)= XCENTER
        then Result := taCenter
      else Result := taLeftJustify
  end;

var
 I: Integer;
begin
  {создать колонку в гриде}
  if ANode.NodeName = XCOLUMN then
  begin
    FColumn :=  TDBGridColumnEh.Create(FColumns);
    {выставить align из аттрибута}
    FColumn.Alignment := GetAlignment(ANode);
    if GetAttrValue(ANode,XWIDTH) <>''
      then FColumn.Width := StrToInt(GetAttrValue(ANode,XWIDTH));
  end;
  if Assigned(FColumn) then
  begin
    {CAPTION}
    if ANode.NodeName = XCAPTION then
    begin
      FColumn.Title.Caption := ANode.Text;
     {выставить align из аттрибута}
      FColumn.Title.Alignment := GetAlignment(ANode);
    end else
    {FIELDNAME}
    if ANode.NodeName = XFIELDNAME then
      FColumn.FieldName := ANode.Text else
    if ANode.NodeName = XTOTAL then
    begin
      ProcessColumnTotal(ANode);
      exit;
    end;
  end;
  {Прогнать до конца ветки}
  for I:=0 to ANode.ChildNodes.length-1 do
    ProcessColumns(ANode.ChildNodes.Item[I]);
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.ProcessColumnTotal(ANode: Variant);
var
  i:integer;
begin
  if ANode.NodeName = XTOTAL then
  begin
    if GetAttrValue(ANode,XVALUETYPE) = 'sum' then
      FColumn.Footer.ValueType := fvtSum
    else if GetAttrValue(ANode,XVALUETYPE) = 'avg' then
      FColumn.Footer.ValueType := fvtAvg
    else if GetAttrValue(ANode,XVALUETYPE) = 'count' then
      FColumn.Footer.ValueType := fvtCount
    else if GetAttrValue(ANode,XVALUETYPE) = 'statictext' then
      FColumn.Footer.ValueType := fvtStaticText;
  end
  else if ANode.NodeName = XFIELDNAME then
    FColumn.Footer.FieldName := ANode.Text
  else if ANode.NodeName = XVALUE then
    FColumn.Footer.Value := ANode.Text;

  for I:=0 to ANode.ChildNodes.length-1 do
    ProcessColumnTotal(ANode.ChildNodes.Item[I]);
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.ProcessColumnsDetail(ANode: Variant);
  function GetAlignment(ANode: Variant):TAlignment;
  begin
      if GetAttrValue(ANode,XALIGN) = XRIGHT
        then  Result := taRightJustify else
      if GetAttrValue(ANode,XALIGN)= XCENTER
        then Result := taCenter
      else Result := taLeftJustify
  end;

var
 I: Integer;
begin
  {создать колонку в гриде}
  if ANode.NodeName = XCOLUMN then
  begin
    FColumnDetail :=  TDBGridColumnEh.Create(FColumnsDetail);
    {FColumnDetail align из аттрибута}
    FColumnDetail.Alignment := GetAlignment(ANode);
    if GetAttrValue(ANode,XWIDTH) <>''
      then FColumnDetail.Width := StrToInt(GetAttrValue(ANode,XWIDTH));
  end;
  if Assigned(FColumnDetail) then
  begin
    {CAPTION}
    if ANode.NodeName = XCAPTION then
    begin
      FColumnDetail.Title.Caption := ANode.Text;
     {выставить align из аттрибута}
      FColumnDetail.Title.Alignment := GetAlignment(ANode);
    end else
    {FIELDNAME}
    if ANode.NodeName = XFIELDNAME then
      FColumnDetail.FieldName := ANode.Text;
  end;
  {Прогнать до конца ветки}
  for I:=0 to ANode.ChildNodes.length-1 do
    ProcessColumnsDetail(ANode.ChildNodes.Item[I]);
end;

{------------------------------------------------------------------------------}
procedure TXMLForm.FilterOnComboClick(Sender: TObject);
begin
  GetXMLFormAsFilter(Sender);
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.FilterOnComboClickOrg(Sender: TObject);
var
  I: Integer;
  Query : TOilQuery;
  Succ : Boolean;
begin
  Succ := false;
  for I:=1 to Length(XMLForm.FFilters) do
    if (XMLForm.FFilters[I].FilterName =  (Sender as TCustomEdit).Name)
  then
  begin
    Succ := ChooseOrg.CaptureOrgQ(XMLForm.FFilters[I].OrgType, MAIN_ID, INST, XMLForm.FFilters[I].EnableFlags, Query);
    break;
  end;

  if not Succ then exit;

  for I:=1 to Length(XMLForm.FFilters) do
    if (XMLForm.FFilters[I].SrcFieldName <> '') and
     (XMLForm.FFilters[I].FilterName =  (Sender as TCustomEdit).Name)
  then
  begin
    {Заполнить текстом edit}
    if XMLForm.FFilters[I].IsCaptionField then begin
      (Sender as TCustomEdit).Text := Query[trim(XMLForm.FFilters[I].SrcFieldName)];
      Continue;
    end;
    {Заполнить значениями массив фильтров}
    XMLForm.FFilters[I].Value :=
      Query.FieldByName(trim(XMLForm.FFilters[I].SrcFieldName)).Value;

  end;

  FreeAndNil(Query);
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.FilterClearClick(Sender: TObject);
var
 I: Integer;
 S: String;
begin
  S := copy((Sender as TSpeedButton).Name,3,length((Sender as TSpeedButton).Name));
  For I:=1 to length(FFilters) do
    if FFilters[I].FilterName = S
      then FFilters[I].Value := '';
  TCustomEdit(GetComponent(S)).Text := '';
  //TCustomEdit(Sender as TSpeedButton).Text := '';
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.DateEditAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
var
 i: Integer;
begin
  for i:= 1 to length(FFilters) do
    if FFilters[i].FilterName = (Sender as TCustomEdit).Name
      then FFilters[i].Value := DateToStr(ADate);
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.ProcessWinControl(ANode : Variant);
begin
  {Счетчик фильтров}
  Inc(FFiltersCount);

  {LIST}
  if ANode.NodeName = XLIST then
  begin
    FEdit := TComboBox.Create(Self);
    TComboBox(FEdit).OnChange := FilterOnEditChange;
  end;

  {EDIT}
  if ANode.NodeName = XEDIT then
  begin
    {Будет простой Eidt или CalcEdit}
    FFilters[FFiltersCount].IsNumber := GetAttrValue(ANode,XONLYNUMBERS) ='true';
    if  FFilters[FFiltersCount].IsNumber then
    {CalcEdit}
    begin
      FEdit := TRxCalcEdit.Create(Self);
      with TRxCalcEdit(FEdit) do
      begin
        ZeroEmpty := true;
        Parent := Self.Panel2;
        ButtonWidth := 0;
      end;
    end
    else
      FEdit := TEdit.Create(Self);
    TEdit(FEdit).OnChange := FilterOnEditChange;
  end;

  {DATEEDIT}
  if ANode.NodeName = XDATEEDIT then
  begin
    FEdit := TDateEdit.Create(Self);
    TDateEdit(FEdit).OnAcceptDate := DateEditAcceptDate;
    TDateEdit(FEdit).Date := now;

    {set date filter direction}
    FFilters[FFiltersCount].IsDateField := true;
    if GetAttrValue(ANode,XDIRECTION) = XFROMDATE then
      FFilters[FFiltersCount].Direction := dirFromDate
    else if GetAttrValue(ANode,XDIRECTION) = XTODATE then
      FFilters[FFiltersCount].Direction := dirToDate
    else
      FFilters[FFiltersCount].Direction := dirNone;
  end;

  {XMLFORM}
  if ANode.NodeName = XXMLFORM then
  begin
    FEdit := TComboEdit.Create(Self);
    with TComboEdit(FEdit) do
    begin
      DirectInput := False;
      MainForm.il.GetBitmap(7,Glyph);
      Parent := Self.Panel2;
      ButtonWidth := 16;
      FFilters[FFiltersCount].EnableFlags := GetAttrValue(ANode,XENABLEFLAGS);

      if GetAttrValue(ANode,XORGTYPE) <> ''
        then FFilters[FFiltersCount].OrgType := StrToInt(GetAttrValue(ANode,XORGTYPE));

      if GetAttrValue(ANode,XORGREF) ='true'
        then OnButtonClick := FilterOnComboClickOrg
        else OnButtonClick := FilterOnComboClick;
      OnDblClick := OnButtonClick;
    end;
    {Кнопка очистки фильтра}
    FClearButton := TSpeedButton.Create(Self);
    with FClearButton do
    begin
      MainForm.il.GetBitmap(8,Glyph);
      Parent := Self.Panel2;
      Flat := true;
      OnClick := FilterClearClick;
      Name := 'spbUnnamed';
    end;
  end;

  {Eсли ничего не создано - нах}
  if FEdit = nil then Exit;

  TCustomEdit(FEdit).Parent := Self.Panel2;
  {Название фильтра}
  FLabel := TLabel.Create(Self);
  FLabel.Parent := Self.Panel2;
  {Скрытый лейбл}
  FHiddenLabel := TLabel.Create(Self);
  FHiddenLabel.Parent := Self.Panel2;
  {width}
   if GetAttrValue(ANode,XWIDTH) <>''  then
   begin
     TCustomEdit(FEdit).Width := StrToInt(GetAttrValue(ANode,XWIDTH));
     TCustomEdit(FLabel).Width := TCustomEdit(FEdit).Width;
   end;
  {top}
   if GetAttrValue(ANode,XTOP) <>''  then
   begin
     FLabel.Top := StrToInt(GetAttrValue(ANode,XTOP));
     TCustomEdit(FEdit).Top := FLabel.Top+FLabel.Height-3;
   end;
  {left}
   if GetAttrValue(ANode,XLEFT) <>''  then
   begin
     FLabel.Left := StrToInt(GetAttrValue(ANode,XLEFT));
     TCustomEdit(FEdit).Left := FLabel.Left ;
   end;
   {Скрытый элемент не дает налазить AutoSize панели на нижний бордюр фильтра}
   FHiddenLabel.Top := TCustomEdit(FEdit).Top + TCustomEdit(FEdit).Height div 2;
   FHiddenLabel.Left := TCustomEdit(FEdit).Left;
   FHiddenLabel.Width := 0;
   {как фильтровать}
   FFilters[FFiltersCount].IsWholeValue := GetAttrValue(ANode,XWHOLEVALUE) ='true';
   FLastWholeValue := FFilters[FFiltersCount].IsWholeValue;
   {Кнопка очистки фильтра}
   if ANode.NodeName = XXMLFORM then
   if Assigned(FClearButton) then
   begin
     FClearButton.Top := TCustomEdit(FEdit).Top;
     FClearButton.Left := TCustomEdit(FEdit).Left+TCustomEdit(FEdit).Width;
     FClearButton.Width := TCustomEdit(FEdit).Height;
     FClearButton.Height := FClearButton.Width
   end;   
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.ProcessFilters(ANode: Variant);
var
  I: Integer;
  s: string;
  TmpDate : TDateTime;
  TmpAction : Boolean;
begin
  {Если тэги фильтров - создать их}
  if (ANode.NodeName = XEDIT) or
     (ANode.NodeName = XXMLFORM) or
     (ANode.NodeName = XDATEEDIT) or
     (ANode.NodeName = XLIST)
  then
    ProcessWinControl(ANode);

  if FEdit <> nil then
  begin

    {NAME}
    if ANode.NodeName = XNAME then
    begin
      TCustomEdit(FEdit).Name := ANode.Text;
      FFilters[FFiltersCount].FilterName := ANode.Text;

      {Установить текст по-умолчанию}
      if TCustomEdit(FEdit).ClassName = 'TDateEdit' then
      begin
        TmpDate := now;
        TDateEdit(FEdit).OnAcceptDate(TDateEdit(FEdit),TmpDate,TmpAction);
      end
      else TCustomEdit(FEdit).Text := '';

      if Assigned(FClearButton)
        then if FClearButton.Name = 'spbUnnamed'
          then FClearButton.Name := 'S_'+ANode.Text;
    end;

    {CAPTION}
    if ANode.NodeName = XCAPTION then
      FLabel.Caption := ANode.Text;

   {FIELDNAME}
    if ANode.NodeName = XFIELDNAME then
      FFilters[FFiltersCount].DestFieldName := Up(ANode.Text);

    {LINK}
    if ANode.NodeName = XLINK then
      if FFilters[FFiltersCount].SrcFieldName <> ''
        then inc(FFiltersCount);

    {SRC, DEST}
    if ANode.NodeName = XSRC then
      FFilters[FFiltersCount].SrcFieldName := ANode.Text;

    if ANode.NodeName = XDEST then begin
      FFilters[FFiltersCount].DestFieldName := ANode.Text;
      FFilters[FFiltersCount].FilterName := TCustomEdit(FEdit).Name;
      FFilters[FFiltersCount].IsWholeValue := FLastWholeValue;
    end;
    {TEXTFIELD}
    if ANode.NodeName = XTEXTFIELD then begin
      inc(FFiltersCount);
      FFilters[FFiltersCount].SrcFieldName := ANode.Text;
      FFilters[FFiltersCount].IsCaptionField := true;
      FFilters[FFiltersCount].FilterName := TCustomEdit(FEdit).Name;
    end;
    {DEFAULT}
    if ANode.NodeName = XDEFAULT then begin
      if TCustomEdit(FEdit).ClassName = 'TDateEdit' then
      begin
        s:=UpperCase(ANode.Text);
        if s='NOW' then TmpDate:=Date
        else if s='MONTH_BEGIN' then TmpDate:=GetMonthBegin(Date)
        else if s='MONTH_AGO' then TmpDate:=Date-30
        else if s='LONG_AGO' then TmpDate:=StrToDate('01.01.1990');
        TDateEdit(FEdit).Date:=TmpDate;
        TDateEdit(FEdit).OnAcceptDate(TDateEdit(FEdit),TmpDate,TmpAction);
      end
      else TCustomEdit(FEdit).Text := ANode.Text;
    end;
    {ITEM}
    if ANode.NodeName = XITEM then
    begin
      if TCustomEdit(FEdit).ClassName = 'TComboBox' then
        TComboBox(FEdit).Items.Add(DevideRusUkr(ANode.Text));
    end;

  end;
  {Прогнать до конца ветки}
  for I:=0 to ANode.ChildNodes.length-1 do
    ProcessFilters(ANode.ChildNodes.Item[I]);

end;
{------------------------------------------------------------------------------}
procedure TXMLForm.Parse(AFileName: string);
var
 I: integer;
 s: string;
 CurrNode: Variant;
begin
  FXMLDoc := CreateOleObject('Microsoft.XMLDOM.1.0');
  FXMLDoc.Load(GetMainDir+FORMS_FOLDER+'\'+AFileName+'.xml');
  FXMLDoc.PreserveWhiteSpace := true;
  FXMLDoc.Async := false;
  if FXMLDoc.parseError.ErrorCode <> 0 then
  begin
    ShowMessage( GetParseError(FXMLDoc.parseError) );
    Exit;
  end;
  SetFormParams();
  FRootNode := FXMLDoc.DocumentElement;

  if GetAttrValue(FRootNode,XDIALOGFORM) = 'true' then
  begin
    //DO NOTHING
  end;

  {Панель фильтров}
  Self.Panel2.Visible := GetAttrValue(FRootNode,XFILTERS) = 'true';

  {Кнопки редактирования}
  FEditButtons := GetAttrValue(FRootNode,XEDITBUTTONS) = 'true';
  pAdd.Visible := FEditButtons;
  pEdit.Visible := FEditButtons;
  pDel.Visible := FEditButtons;

  if 0 <> GetSqlValueParSimple(
    'select count(*) from adm_object where upper(name) = upper(:name) and type = ''F'' ',
    ['name', NormalizeFormName]) then
  begin
    ADMQ.Close;
    _OpenQueryPar(ADMQ, ['emp_id', EMp_id, 'object_name', NormalizeFormName]);
    pAdd.Visible  := IsHaveRight(1);
    pEdit.Visible := IsHaveRight(2);
    pDel.Visible  := IsHaveRight(3);
  end;

  {EditClass}
  s:=GetAttrValue(FRootNode,XEDITCLASS);
  if s<>'' then ProcessEditClass(s);

  {Ширина формы}
  if GetAttrValue(FRootNode,XWIDTH) <> ''
    then Width := StrToInt(GetAttrValue(FRootNode,XWIDTH))
    else Width := FOldWidth;

  {Высота формы}
  if GetAttrValue(FRootNode,XHEIGHT) <> ''
    then Height := StrToInt(GetAttrValue(FRootNode,XHEIGHT))
    else Height := FOldHeight;

  {VERSION}
  FVersion := GetAttrValue(FRootNode,XVERSION);

  {CAPTION}
  FCaption := GetAttrValue(FRootNode,XCAPTION);

  {Разбор элементов}
  for I:=0 to FRootNode.ChildNodes.length-1 do
  begin
    CurrNode := FRootNode.ChildNodes.Item[i];
    {SQL}
    if CurrNode.NodeName = XSQL then
    begin
      FQuery.SQL.Text := trim(FRootNode.ChildNodes.Item[i].Text);
      LoadExeSQL(FQuery.SQL);
    end
    else
    {SQLDetail}
    if CurrNode.NodeName = XSQLDETAIL then
    begin
      FQueryDetail.SQL.Text := trim(FRootNode.ChildNodes.Item[i].Text);
      LoadExeSQL(FQueryDetail.SQL);
    end
    else
    {Columns}
    if CurrNode.NodeName = XCOLUMNS then
    begin
      ProcessColumns(CurrNode);
      //загрузка грида
      LoadGrigColumns( DBGrid1,Name );
    end
    else
    {ColumnsDetail}
    if CurrNode.NodeName = XCOLUMNSDETAIL then
      ProcessColumnsDetail(CurrNode)
    else
    {Filters}
    if CurrNode.NodeName = XFILTERS then
      ProcessFilters(CurrNode) else
    {EditForm}
    if CurrNode.NodeName = XEDITFORM then
      ProcessEditForm(CurrNode) else
    {EditClass}
    if CurrNode.NodeName = XEDITCLASS then
      ProcessEditClass(CurrNode);
    if (CurrNode.NodeName = XEDITBUTTONS) and FEditButtons then
      ProcessEditButtons(CurrNode);
  end;
  sbDel.OnClick:=DeleteRecord2;

  Self.bbSearch.Click;
  if FVersion<>'' then
    Self.Caption:= FCaption+', версия '+FVersion
  else
    Self.Caption := FCaption;
  Panel2.AutoSize := False;
  Panel2.AutoSize := True;
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.ShowSQLText(SEnder: TObject);
begin
   if Main.Debugging then ShowTextInMemo(FQuery.Sql.Text);
end;
{------------------------------------------------------------------------------}
constructor TXMLForm.Create(AOwner: TComponent; AName: String);
begin
  inherited Create(AOwner);
  Name:=AName;
  FOldWidth := Width;
  FOldHeight := Height;
  Width := 0;
  Height := 0;
  Position := poDefaultPosOnly;
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.ProcessEditForm(ANode: Variant);
var
  I: Integer;
begin
  if ANode.NodeName = XDLLNAME then
  begin
    hDll := Loadlibrary(PAnsiChar(String(ANode.Text)));
    if hDll = 0 then raise Exception.Create(TranslateText('Не могу загрузить плагин'));
    @InitPlugin := GetProcAddress(hDll,'InitPlugin');
    @AddRecord := GetProcAddress(hDll,'AddRecord');
    @EditRecord := GetProcAddress(hDll,'EditRecord');
    @DeleteRecord := GetProcAddress(hDll,'DeleteRecord');
    @DonePlugin := GetProcAddress(hDll,'DonePlugin');

    if Assigned(InitPlugin)
      then InitPlugin(Integer(Application),Integer(Screen), Integer(frmStart.OraSession1), Integer(FQuery));

    if Assigned(AddRecord)
      then sbAdd.OnClick := AddRecFromPlugin;

    if Assigned(EditRecord)
      then sbEdit.OnClick := EditRecFromPlugin;

    if Assigned(DeleteRecord)
      then sbDel.OnClick := DelRecFromPlugin;
  end;

  if ANode.NodeName = XKEYFIELD then
  begin

  end;
  {Прогнать до конца ветки}
  for I:=0 to ANode.ChildNodes.length-1 do
    ProcessEditForm(ANode.ChildNodes.Item[I]);
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.ProcessEditButtons(ANode: Variant);
var
  I:integer;
begin
  Self.pAdd.Visible := false;
  Self.pEdit.Visible := false;
  Self.pDel.Visible := false;
  Self.pTotal.Visible := false;
  Self.pShowDetail.Visible := false;
  Self.pSpeedUp.Visible := false;
  for I:=0 to ANode.ChildNodes.length-1 do
  begin
    if ANode.ChildNodes.Item[I].NodeName=XADDBUTTON then
      Self.pAdd.Visible := true;
    if ANode.ChildNodes.Item[I].NodeName=XEDITBUTTON then
      Self.pEdit.Visible := true;
    if ANode.ChildNodes.Item[I].NodeName=XDELETEBUTTON then
      Self.pDel.Visible := true;
    if ANode.ChildNodes.Item[I].NodeName=XSHOWTOTALBUTTON then
    begin
      Self.pTotal.Visible := true;
      Self.DBGrid1.SumList.Active := true;
    end;
    if ANode.ChildNodes.Item[I].NodeName=XSHOWDETAILCHECKBOX then
      Self.pShowDetail.Visible := true;
    if ANode.ChildNodes.Item[I].NodeName=XSQLFASTERBUTTON then
      Self.pSpeedUp.Visible := true;
  end;
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.AddRecFromPlugin(Sender: TObject);
begin
  AddRecord();
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.EditRecFromPlugin(Sender: TObject);
begin
  EditRecord{(0,0)};
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.DelRecFromPlugin(Sender: TObject);
begin
  DeleteRecord{(0,0)};
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.OnXMLFormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Assigned(DonePlugin)
    then if DonePlugin then FreeLibrary(hDll);
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.DataSourceDataChange(Sender: TObject; Field: TField);
var
  I,J:integer;
  Cond:boolean;
begin
  for I:=low(FPrints) to FPrintsCount do
  if (FPrints[I].ConditionVisible.FieldName<>'') then
    if q.Fields.FindField(FPrints[I].ConditionVisible.FieldName)<>nil then
    begin
      Cond:=q[FPrints[I].ConditionVisible.FieldName]=FPrints[I].ConditionVisible.Value;
      for J:=0 to self.PUM.Items.Count-1 do
        if(self.PUM.Items[J].Name=FPrints[I].MenuName)then
          self.PUM.Items[J].Visible:=Cond;
    end;
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.ProcessEditClass(ANode: Variant);
var
  ClassName,FilterName: string;
  CurrNode,PrintNode,CondVisNode:Variant;
  I,J,K:integer;
  Print:TPrintField;
  mi:TMenuItem;
begin
  ClassName:=GetAttrValue(ANode,XCLASSNAME);
  FilterName:=GetAttrValue(ANode,XRESULTFILTER);

  FEditClass:=GetEditClassByName(ClassName);
  if FEditClass <> nil then
  begin
    sbAdd.OnClick:=EditRecord2;
    sbEdit.OnClick:=EditRecord2;
    (** Обработка печати *)
    if GetAttrValue(ANode,XPRINTABLE)='true' then
    begin
      self.pPrint.Visible:=true;
      for I:=0 to ANode.ChildNodes.length-1 do
      begin
        CurrNode:=ANode.ChildNodes.Item[I];
        if CurrNode.NodeName=XPRINT then
        begin
          // Обнуление переменных
          Print.Caption:=''; Print.MenuName:='';Print.RRR:=''; Print.PrintNumber:=-1;
          Print.ConditionVisible.FieldName:=''; Print.ConditionVisible.Value:='';
          // Начали заполнение переменных
          for J:=0 to CurrNode.ChildNodes.length-1 do
          begin
            PrintNode:=CurrNode.ChildNodes.Item[J];
            //ShowMessage(PrintNode.NodeName);
            // название меню
            if PrintNode.NodeName=XCAPTION then
              Print.Caption:=PrintNode.Text;
            // имя меню
            if PrintNode.NodeName=XMENUNAME then
              Print.MenuName:=PrintNode.Text;
            // номер отчета
            if (PrintNode.NodeName=XPRINTNUMBER) and IsNumber(PrintNode.Text) then
              Print.PrintNumber:=StrToInt(PrintNode.Text);
            // имя ррр
            if PrintNode.NodeName=XRRR then
              Print.RRR:=PrintNode.Text;
            // признаки видимости
            if PrintNode.NodeName=XCONDITIONVISIBLE then
              for K:=0 to PrintNode.ChildNodes.length-1 do
              begin
                CondVisNode:=PrintNode.ChildNodes.Item[K];
                // поле на которое смотреть
                if CondVisNode.NodeName=XFIELDNAME then
                  Print.ConditionVisible.FieldName:=CondVisNode.Text;
                // значение которое там должно быть, чтобы отображать печать
                if CondVisNode.NodeName=XVALUE then
                  Print.ConditionVisible.Value:=CondVisNode.Text;
              end; // for K:=0 to PrintNode ... length-1 do // XCONDITIONVISIBLE
          end;// for J:=0 to CurrNode ... length-1 do // XPRINT
        end;
        // добавляем меню на форму
        if    (Print.Caption<>'') and (Print.MenuName<>'')
          and ((Print.RRR<>'') or (Print.PrintNumber>=0) )then
        begin
           //sbAdd.OnClick:=EditRecord2;
           mi:=TMenuItem.Create(self);
           mi.Name:=Print.MenuName;
           mi.Caption:=Print.Caption;
           if Print.RRR<>'' then
           begin
             mi.Tag:=-1;
             mi.Hint:=Print.RRR;
           end
           else
             mi.Tag:=Print.PrintNumber;
           mi.OnClick:=PrintRecord;
           self.ds.OnDataChange:=DataSourceDataChange;
           self.PUM.Items.Add(mi);
           inc(FPrintsCount);
           FPrints[FPrintsCount]:=Print;
        end;
      end; // for I:=0 to ANode.ChildNodes.length-1 do // XPRINTABLE
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.PrintRecord(Sender: TObject);
begin
  if (Sender as TMenuItem).Tag=-1 then
    FEditClass.Print((Sender as TMenuItem).Hint)
  else
    FEditClass.Print(q['id'],q['inst'],(Sender as TMenuItem).Tag);
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.EditRecord2(Sender: TObject);
var res: Boolean;
begin
  res := false;
  if (Sender as TSpeedButton).Name='sbAdd' then
    res:=FEditClass.Edit(0,MAIN_ORG.INST,Self.Name)
  else if q.Active and (q.RecordCount>0) then
    res:=FEditClass.Edit(q['id'],q['inst'],Self.Name);

  if res then bbSearch.Click;
end;
{------------------------------------------------------------------------------}
procedure TXMLForm.DeleteRecord2(Sender: TObject);
var
  table,s,errnum,tableref: string;
  i: integer;
begin
  if not( Self.pDel.Visible and Self.pDel.Enabled and Self.sbDel.Visible and Self.sbDel.Enabled )then
    exit;
  table:=GetAttrValue(FRootNode,XTABLENAME);
  if table='' then exit;
  if MessageDlg(TranslateText('Вы уверены, что хотите удалить запись?'),mtWarning,[mbYes,mbNo],0)=mrNo then
    exit;
  try
    FEditClass.TestDelete(q['id'],q['inst']);
    _ExecProcOra('OILT.SetStateN',
      ['p_Table',    table,
       'p_Id',       q['id'],
       'p_Inst',     q['inst']
      ]);
    bbSearch.Click;
  except
    on E:Exception do begin
      s:=E.Message;
      if copy(s,1,3)='ORA' then
      begin
        errnum:=copy(s,5,5);
        if errnum='20020' then
        begin
          delete(s,1,3);//удаляем первое ORA
          if pos('ORA',s)>0 then
            s:=copy(s,1,pos('ORA',s)-2);
          i:=length(s);
          while s[i]<>' ' do dec(i);
          tableref:=copy(s,i+1,length(s));
        end;
      end
      else
        errnum:='';
      if errnum='20020' then
        raise exception.create(
          TranslateText('Обнаружены записи, ссылающиеся на данную (таблица ')+tableref+')'+#13#10+
          TranslateText('Данную запись удалить нельзя.'))
      else
        raise exception.create(TranslateText('Ошибка при удалении записи:')+#13#10+E.Message);
    end;
  end;
end;
{------------------------------------------------------------------------------}

//==============================================================================
function XMLChooseBill(
  FromID, FromINST, ToID, ToINST: integer;
  FromName, ToName: string;
  sType: char;
  DateBegin, DateEnd: TDate;
  var pp_Id, pp_Inst: integer;
  var pp_Name, pp_Date: string
): boolean; // загрузка рахунків
var
  Form: TXMLForm;
  I: Integer;
begin
  Form := GetXMLFormAsFilter('BillRef');
  try
    for I := 1 to Length(Form.FFilters) do
    begin
      // FromOrg
      if FromID <> 0 then
        if (Form.FFilters[I].SrcFieldName <> '') and (AnsiUpperCase(Form.FFilters[I].FilterName) = 'FROMORG')
          and (FromName <> '') then
        begin
          if Form.FFilters[I].IsCaptionField then
            (Form.FindComponent('FROMORG') as TComboEdit).Text := FromName;
          if AnsiUpperCase(Form.FFilters[I].DestFieldName) = 'FROM_ID' then Form.FFilters[I].Value := IntToStr(FromID);
          if AnsiUpperCase(Form.FFilters[I].DestFieldName) = 'FROM_INST' then Form.FFilters[I].Value := IntToStr(FromINST);
        end;

      // ToOrg
      if ToID <> 0 then
        if (Form.FFilters[I].SrcFieldName <> '') and (AnsiUpperCase(Form.FFilters[I].FilterName) = 'TOORG')
          and (ToName <> '') then
        begin
          if Form.FFilters[I].IsCaptionField then
            (Form.FindComponent('TOORG') as TComboEdit).Text := ToName;
          if AnsiUpperCase(Form.FFilters[I].DestFieldName) = 'TO_ID' then Form.FFilters[I].Value := IntToStr(ToID);
          if AnsiUpperCase(Form.FFilters[I].DestFieldName) = 'TO_INST' then Form.FFilters[I].Value := IntToStr(ToINST);
        end;

      // DateFrom
      if DateBegin <> 0 then
        if (AnsiUpperCase(Form.FFilters[I].FilterName) = 'DATEFROM') and (DateBegin <> 0) then
        begin
          (Form.FindComponent('DATEFROM') as TDateEdit).Date := DateBegin;
          Form.FFilters[i].Value := DateToStr(DateBegin);
        end;

      // DateTo
      if DateEnd <> 0 then
        if (AnsiUpperCase(Form.FFilters[I].FilterName) = 'DATETO') and (DateEnd <> 0) then
        begin
          (Form.FindComponent('DATETO') as TDateEdit).Date := DateEnd;
          Form.FFilters[i].Value := DateToStr(DateEnd);
        end;

      // sType
      if sType <> '' then
        if (AnsiUpperCase(Form.FFilters[I].FilterName) = 'EDITDOGTYPE') and (DateEnd <> 0) then
        begin
          case sType of
            'K': (Form.FindComponent('EDITDOGTYPE') as TComboBox).ItemIndex := 0;
            'Y': (Form.FindComponent('EDITDOGTYPE') as TComboBox).ItemIndex := 1;
            'S': (Form.FindComponent('EDITDOGTYPE') as TComboBox).ItemIndex := 2;
            'V': (Form.FindComponent('EDITDOGTYPE') as TComboBox).ItemIndex := 3;
            'N': (Form.FindComponent('EDITDOGTYPE') as TComboBox).ItemIndex := 4;
          end;
          Form.FFilters[i].Value := (Form.FindComponent('EDITDOGTYPE') as TComboBox).Text;
        end;

      // CANCELED
      if (AnsiUpperCase(Form.FFilters[I].FilterName) = 'EDITCANCELED') then
      begin
        (Form.FindComponent('EDITCANCELED') as TComboBox).ItemIndex := 0;
        Form.FFilters[i].Value := (Form.FindComponent('EDITCANCELED') as TComboBox).Text;
      end;
    end;

    Form.SearchClick(nil);

    result := Form.ShowModal = mrOk;
    if result then
    begin
      pp_Id   := Form.FQuery['ID'];
      pp_Inst := Form.FQuery['INST'];
      pp_Name := Form.FQuery['doc_number'];
      pp_Date := Form.FQuery['date_'];
    end;
  finally
    FreeAndNil(Form);
  end;
end;
//==============================================================================

end.
