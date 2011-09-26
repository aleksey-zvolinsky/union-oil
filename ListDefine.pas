unit ListDefine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Ora, MemDS, VirtualTable, Grids, DBGridEh, StdCtrls,
  Buttons, ExtCtrls,
  uImportFunc, Menus, GridsEh, DBGridEhGrouping, DBAccess;

type
  TListDefineForm = class(TForm)
    VirtualTable: TVirtualTable;
    VirtualTableVALUE: TStringField;
    VirtualTableID: TIntegerField;
    VirtualTableINST: TIntegerField;
    VirtualTableNAME: TStringField;
    pBottom: TPanel;
    pBtn: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    pnlGrid: TPanel;
    Grid: TDBGridEh;
    ds: TOraDataSource;
    pm: TPopupMenu;
    miNotUse: TMenuItem;
    procedure bbOkClick(Sender: TObject);
    procedure GridEditButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miNotUseClick(Sender: TObject);
    procedure VirtualTableBeforePost(DataSet: TDataSet);
  private
    FDefined: boolean;
    FDataType: TOilDataType;
    FExeLinkProgram: integer;
    FParamDataSet: TDataSet;
    FParamInField: string;
    FParamOutFields: TStringList;
    FPossibleFields: array[0..2] of string;
    FStoreDefineUnit: TStoreDefineUnit;
    procedure Init;
    procedure Save;
    procedure Test;
    procedure SetDataType(const Value: TOilDataType);
  public
    {
      Пример:
      TListDefineForm.Create(odtOrg, Query, 'IMPORT_NAME',
       ['ID',   'ORG_ID',
        'INST', 'ORG_INST',
        'NAME', 'ORG_NAME'],
        6);
    }
    class function CreateEx(ADataType: TOilDataType; AParamDataSet: TDataSet;
      AParamInField: string; AParamOutFields: array of variant;
      AExeLinkProgram: integer = 0): TListDefineForm;
    destructor Destory;
    class function Define(AQuiet: boolean; ADataType: TOilDataType;
      ATable: TVirtualTable; AFileName: string): boolean;

    procedure LoadFromFile(AFilePath: string);
    procedure SaveToFile(AFilePath: string);
    property Defined: boolean read FDefined;
    property DataType: TOilDataType read FDataType write SetDataType;
    property ExeLinkProgram: integer read FExeLinkProgram;
    property ParamDataSet: TDataSet read FParamDataSet;
    property ParamInField: string read FParamInField;
    property ParamOutFields: TStringList read FParamOutFields;
  end;

var
  ListDefineForm: TListDefineForm;

implementation

uses NPTypeRef, uXMLForm, ChooseOrg, Main, ExFunc, UDbFunc, OperTypeRef;

{$R *.dfm}

{ TListCompareForm }

class function TListDefineForm.CreateEx(ADataType: TOilDataType; AParamDataSet: TDataSet;
  AParamInField: string; AParamOutFields: array of variant; AExeLinkProgram: integer = 0): TListDefineForm;
var
  i: integer;
  ListForm: TListDefineForm;
begin
  ListForm := TListDefineForm.Create(nil);
  ListForm.DataType := ADataType;
  ListForm.FParamDataSet := AParamDataSet;
  ListForm.FParamInField := AParamInField;
  ListForm.FParamOutFields := TStringList.Create;
  ListForm.FExeLinkProgram := AExeLinkProgram;
  if high(AParamOutFields) mod 2 = 0 then
    raise Exception.Create('TListDefineForm: нечетное число элементов в AParamOutFields');
  for i := 0 to (high(AParamOutFields) div 2) do
    ListForm.FParamOutFields.Values[AParamOutFields[i*2]] := AParamOutFields[i*2+1];
  Result := ListForm;              
end;

procedure TListDefineForm.Init;
var
  i, j: integer;
  IsFound: boolean;
  pk: TPrimaryKey;
begin
  FPossibleFields[0] := 'ID';
  FPossibleFields[1] := 'INST';
  FPossibleFields[2] := 'NAME';
  // Проверка на правильно переданые параметры
  for i := 0 to ParamOutFields.Count - 1 do
  begin
    IsFound := False;
    for j := low(FPossibleFields) to high(FPossibleFields) do
    begin
      if ParamOutFields.Names[i] = FPossibleFields[j] then
        IsFound := True;
    end;
    if not IsFound then
      raise Exception.CreateFmt('Неизвестный параметр %s',[ParamOutFields.ValueFromIndex[i]]);
  end;

  // Переносим данные
  FStoreDefineUnit.UserMode := False;
  VirtualTable.Open;
  ParamDataSet.DisableControls;
  try
    FDefined := True;
    ParamDataSet.First;
    while not ParamDataSet.Eof do
    begin
      VirtualTable.Append;
      VirtualTable.FieldByName('VALUE').AsString := ParamDataSet.FieldByName(ParamInField).AsString;
      // Автоподбор данных
      try
        pk := FStoreDefineUnit.GetLink(ParamDataSet.FieldByName(ParamInField).AsString,ExeLinkProgram,MAIN_ORG.Inst).AsPrimaryKey;
        VirtualTable.FieldByName('ID').AsInteger := pk.Id;
        VirtualTable.FieldByName('INST').AsInteger := pk.Inst;
        VirtualTable.FieldByName('NAME').AsString :=
          nvl(GetQValueByIdInst('NAME', DefineTableArray[DataType], pk.Id, pk.Inst),'');
      except
        on E: ENoDataFound do
          FDefined := False;
        on E: Exception do
          raise;
      end;
      VirtualTable.Post;
      ParamDataSet.Next;
    end;
  finally
    ParamDataSet.EnableControls;
  end;
end;

procedure TListDefineForm.Save;
var
  i: integer;
begin
  VirtualTable.DisableControls;
  ParamDataSet.DisableControls;
  VirtualTable.Filtered := False;
  VirtualTable.First;
  try
    // Переносим значения обратно
    while not VirtualTable.Eof do
    begin
      // Сохраняем данные в структуру
      if VirtualTable.FieldByName('NAME').AsString <> '' then
      begin
        FStoreDefineUnit.SetLink(
          VirtualTable.FieldByName('VALUE').AsString, 0,
          TDefineResult.Create(VirtualTable.FieldByName('ID').AsInteger,VirtualTable.FieldByName('INST').AsInteger));
      end;
      ParamDataSet.Filtered := False;
      if VirtualTable.FieldByName('VALUE').AsString = '' then
        ParamDataSet.Filter := Format(' %s = null ',[ParamInField])
      else
        ParamDataSet.Filter := Format(' %s = %s',[ParamInField, QuotedStr(VirtualTable.FieldByName('VALUE').AsString)]);
      ParamDataSet.Filtered := True;
      if ParamDataSet.IsEmpty then
        raise Exception.Create('Не найдено значение поля NAME для возврата');
      ParamDataSet.Edit;
      for i := low(FPossibleFields) to high(FPossibleFields) do
        if ParamDataSet.Fields.FindField(ParamOutFields.Values[FPossibleFields[i]]) <> nil then
          ParamDataSet.FieldByName(ParamOutFields.Values[FPossibleFields[i]]).Value := VirtualTable.FieldByName(FPossibleFields[i]).Value;
      ParamDataSet.Post;
      VirtualTable.Next;
    end;
  finally
    ParamDataSet.Filtered := False;
    ParamDataSet.EnableControls;
    VirtualTable.EnableControls;
  end;
end;

procedure TListDefineForm.Test;
begin
  VirtualTable.Filtered := False;
  VirtualTable.Filter := 'NAME = '''' ';
  VirtualTable.Filtered := True;
  if not VirtualTable.IsEmpty then
    raise Exception.Create('Не все поля заполнены!');
end;

procedure TListDefineForm.bbOkClick(Sender: TObject);
begin
  Test;
  Save;
  ModalResult := mrOk;
end;

procedure TListDefineForm.GridEditButtonClick(Sender: TObject);
var
 vName: string;
 vId, vInst: integer;
 OTR: TOperTypeRefForm;
begin
  if Grid.SelectedField.FieldName = 'NAME' then
  begin
    case DataType of
      odtNpGroup:
      begin
        if XMLChoose('npgroupref',vId,vName) then
        begin
          VirtualTable.Edit;
          VirtualTable.FieldByName('ID').AsInteger := vId;
          VirtualTable.FieldByName('NAME').AsString := vName;
          VirtualTable.Post;
        end;
      end;
      odtNpType:
      begin
        TNPTypeRefForm.Choose(VirtualTable.FieldByName('ID'), VirtualTable.FieldByName('NAME'));
      end;
      odtAZS:
      begin
        if ChooseOrg.CaptureOrg(2,Main_id,Main_id,'yyy',vId,vInst,vName) then
        begin
          VirtualTable.Edit;
          VirtualTable.FieldByName('ID').AsInteger := vId;
          VirtualTable.FieldByName('INST').AsInteger := vInst;
          VirtualTable.FieldByName('NAME').AsString := vName;
          VirtualTable.Post;
        end;
      end;
      odtOrg:
      begin
        if ChooseOrg.CaptureOrg(3,Main_id,Inst,'yyy',vId,vInst,vName) then
        begin
          VirtualTable.Edit;
          VirtualTable.FieldByName('ID').AsInteger := vId;
          VirtualTable.FieldByName('INST').AsInteger := vInst;
          VirtualTable.FieldByName('NAME').AsString := vName;
          VirtualTable.Post;
        end;
      end;
      odtOper:
      begin
        Application.CreateForm(TOperTypeRefForm, OTR);
        try
          OTR.ShowModal;
          if OTR.ModalResult = mrOk then
          begin
            VirtualTable.Edit;
            VirtualTable.FieldByName('ID').AsInteger := OTR.q.fieldbyname('ID').AsInteger;
            VirtualTable.FieldByName('NAME').AsString := OTR.q.fieldbyname('NAME').AsString;
            VirtualTable.Post;
          end;
        finally
          OTR.Free;
        end;
      end
      else
        raise Exception.Create('Неудалось распознать тип данных');
    end;
  end;
end;

destructor TListDefineForm.Destory;
begin
  if Assigned(FStoreDefineUnit) then
    FStoreDefineUnit.Free;
  inherited;
end;

procedure TListDefineForm.LoadFromFile(AFilePath: string);
begin
  FStoreDefineUnit.LoadFromFile(AFilePath);
end;

procedure TListDefineForm.SaveToFile(AFilePath: string);
begin
  FStoreDefineUnit.SaveToFile(AFilePath);
end;

procedure TListDefineForm.SetDataType(const Value: TOilDataType);
begin
  FDataType := Value;
  if Assigned(FStoreDefineUnit) then
    FStoreDefineUnit.Free;
  FStoreDefineUnit := TStoreDefineUnit.Create(Value);
end;

procedure TListDefineForm.FormShow(Sender: TObject);
begin
  Init;
end;

class function TListDefineForm.Define(AQuiet: boolean; ADataType: TOilDataType; ATable: TVirtualTable; AFileName: string): boolean;
var
  ListDefine: TListDefineForm;
begin
  Result := False;
  ListDefine := TListDefineForm.CreateEx(ADataType, ATable,
   'VALUE', ['ID', 'ALIAS'], 6);
  try
    if FileExists(GetMainDir+AFileName) then
      ListDefine.LoadFromFile(GetMainDir+AFileName);
    if AQuiet then
    begin
      ListDefine.Init;
      if ListDefine.Defined then
        Result := True;
      ListDefine.Save;
      ListDefine.SaveToFile(GetMainDir+AFileName);
    end
    else if ListDefine.ShowModal = mrOk then
    begin
      Result := True;
      ListDefine.SaveToFile(GetMainDir+AFileName);
    end;
  finally
    ListDefine.Free;
  end;
end;

procedure TListDefineForm.miNotUseClick(Sender: TObject);
begin
  VirtualTable.Edit;
  VirtualTable.FieldByName('ID').AsInteger := -1;
  if DefineKeyCountArray[DataType] = 2 then
    VirtualTable.FieldByName('INST').AsInteger := -1;
  VirtualTable.Post;    
end;

procedure TListDefineForm.VirtualTableBeforePost(DataSet: TDataSet);
begin
  if VirtualTable.FieldByName('ID').AsInteger = -1 then
    VirtualTable.FieldByName('NAME').AsString := 'Не использовать';
end;

end.
