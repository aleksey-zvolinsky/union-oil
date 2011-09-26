unit ListSelect;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, Db, DBTables, Main, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TListRecord = class
  public
    SName:     string;
    SId  :     integer;
    SInst:     integer;
  end;

  TListSelectForm = class(TCommonForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    SrcList: TListBox;
    DstList: TListBox;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    Query: TOilQuery;
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    captSrcLabel, captDstLabel: string;
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;  
    procedure SetButtons;
    procedure SetElementsCount;
  public
    TableName             :string;
    AddCondition          :string;
    Order                 :string;
    List                  :string; //уже выбраные
    HasInst               :boolean;
    HasState              :boolean;
    (** Операции после закрытия формы *)
    function GetNameList:string;
    function GetIdList:string;    
  end;

  function ShowListSelect(ATableName, AAddCondition, AOrder, AList: string; AHasInst, AHasState: boolean;var AIdList, ANameList: string):boolean;

implementation

{$R *.DFM}

{
  Инструкция по эксплуатации
  1. Скрейтить форму
  2. Свойство TableName установить в имя таблицы или обзора из которого
     предполагается брать список. Автоматически будут отфильтрованы только
     записи со state = 'Y'
  3. Если запись идентифицируется Id и Inst - установить HasInst:=true
     если только Id, то установить HasInst:=false
  4. В AddCondition задать дополнительные условия запроса.
  5. Выполнить ShowModal формы
  6. Если ModalResult:=mrOk то прочитать свойство List
  7. В запросах использовать конструкцию вида "id in <List>" или
     "(id,inst) in <List>", где <List> - значение переменной List
}

function ShowListSelect(ATableName, AAddCondition, AOrder, AList: string;
  AHasInst, AHasState: boolean;var AIdList, ANameList: string):boolean;
var
  ls:TListSelectForm;
begin
  Result := False;
  ls := TListSelectForm.Create(nil);
  try
    ls.TableName := ATableName;
    ls.AddCondition := AAddCondition;
    ls.Order := AOrder;
    ls.List := AList;
    ls.HasInst := AHasInst;
    ls.HasState := AHasState;
    ls.ShowModal;
    if ls.ModalResult = mrOk then
    begin
      ANameList := ls.GetNameList;
      AIdList := ls.GetIdList;
      Result := True;
    end;
  finally
    ls.Free;
  end;
end;

procedure TListSelectForm.IncludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(SrcList);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, Index);
  SetElementsCount;
end;

procedure TListSelectForm.ExcludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin
  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
  SetElementsCount;
end;

procedure TListSelectForm.IncAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I],
      SrcList.Items.Objects[I]);
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
  SetElementsCount;
end;

procedure TListSelectForm.ExcAllBtnClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
  SetElementsCount;
end;

procedure TListSelectForm.MoveSelected(List: TCustomListBox; Items: TStrings);
var
  I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
end;

procedure TListSelectForm.SetButtons;
var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := SrcList.Items.Count = 0;
  DstEmpty := DstList.Items.Count = 0;
  IncludeBtn.Enabled := not SrcEmpty;
  IncAllBtn.Enabled := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExAllBtn.Enabled := not DstEmpty;
end;

function TListSelectForm.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure TListSelectForm.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then Index := 0
    else if Index > MaxIndex then Index := MaxIndex;
    Selected[Index] := True;
  end;
  SetButtons;
end;

procedure TListSelectForm.FormShow(Sender: TObject);
var
  LR:TListRecord;
begin
  captSrcLabel := SrcLabel.Caption;
  captDstLabel := DstLabel.Caption;
  // Формируем запрос
  Query.SQL.Clear;
  if HasInst then
    Query.SQL.Add ('select id, inst, name')
  else
    Query.SQL.Add ('select id, name');
  Query.SQL.add (' from '+TableName);
  Query.SQL.add (' where 1=1 ');
  if HasState then
    Query.SQL.add ('   and state = ''Y'' ');
  if AddCondition<>'' then
    Query.SQL.add ('   and '+AddCondition);
  if Order <> '' then
    Query.SQL.Add(' order by '+ Order)
  else Query.SQL.Add(' order by name');

  SrcList.Sorted := Order = '';

  Query.Open;
  // Заполняем форму и переменные
  SrcList.Items.Clear; DstList.Items.Clear;
  repeat
    LR:=TListRecord.Create;
    LR.SName:=Query.FieldByName('Name').asString;
    LR.Sid:=Query.FieldByName('Id').asInteger;
    if HasInst then
      LR.Sinst:=Query.FieldByName('Inst').asInteger;
    // В зависимости от наличия в переменной List, помещаем в "выбираемые" и "выбраные" элемент
    if not HasInst and (pos(','+IntToStr(LR.Sid)+',',','+List+',')>0) then
       DstList.Items.AddObject(LR.SName,LR)
    else
       SrcList.Items.AddObject(LR.SName,LR);    
    Query.Next;
  until Query.Eof;
  Query.Close;
  SetButtons;
  SetElementsCount;
end;

procedure TListSelectForm.OKBtnClick(Sender: TObject);
var
  i:integer;
  LR        :TListRecord;
  x         :string;
begin
  List:='(';
  x:='';
  for i:=0 to DstList.Items.Count-1 do
  begin
    LR:=DstList.Items.Objects[i] as TListRecord;
    if HasInst then
      List:=List+x+'('+IntToStr(LR.Sid)+','+IntToStr(Lr.Sinst)+')'
    else
      List:=List+x+IntToStr(LR.Sid);
    x:=',';
  end;
  List:=List+')';
end;

procedure TListSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
    i:integer;
begin
  For i:=0 to SrcList.Items.Count - 1 do
    SrcList.Items.Objects[i].Free;
  for i:=0 to DstList.Items.Count-1 do
    DstList.Items.Objects[i].Free;
  Action:=caFree;
end;

procedure TListSelectForm.FormCreate(Sender: TObject);
begin
inherited;
 AddCondition := '';
 Order := '';
end;

function TListSelectForm.GetIdList:string;
begin
    if (List<>'') and (List[1]='(') then
       result:=copy(List,2,length(List)-2)
    else result:=List;
end;

function TListSelectForm.GetNameList:string;
var i:integer;
begin
    result:='';
    for i:=0 to DstList.Items.Count-1 do
        result:=result+'"'+DstList.Items[i]+'",';
    SetLength(result,length(result)-1);
end;

procedure TListSelectForm.SetElementsCount;
begin
  SrcLabel.Caption := captSrcLabel + ' ('+IntToStr(SrcList.Items.Count)+')';
  DstLabel.Caption := captDstLabel + ' ('+IntToStr(DstList.Items.Count)+')';
end;

end.
