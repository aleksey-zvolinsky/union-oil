unit UIdListsClass;

interface

uses uCommonForm,  Classes, Controls, Menus, Buttons,uOilQuery,Ora, uOilStoredProc;

type
    TIdListMode=(STATIC_MODE,DYNAMIC_MODE);
    TIdListOilVarType=(WITH_TABLE_NAME,NO_TABLE_NAME,GROUP,UNKNOWN);

    TGroupIdList=class;

    TMenuGroupProcedure = procedure (p_IdList: TGroupIdList; p_Num: integer; p_Sb: TSpeedButton; p_DopObject: TObject = nil);

    TIdListBase=class
       private
           FValue           : string;
           function GetCommaList:string;
           procedure SetCommaList(p_Value:string);
           function GetFullCommaList:string;
           function GetBracketCommaList:string;
           function GetId(p_Num: integer):string;
       public
           Name             : string;
           property CommaList: string read GetCommaList write SetCommaList;
           property FullCommaList: string read GetFullCommaList;
           property BracketCommaList: string read GetBracketCommaList;
           property Id [p_Num: integer]: string read GetId;
           procedure Refresh(p_Force:Boolean=FALSE); virtual;
           function IsEmpty: Boolean;
           function IsInList(p_Id: integer):Boolean;
           function NameListOfTable(p_Table:string; p_NameField: string='NAME'):string;
           function StatSqlCondition(p_Field: string):string;
           constructor Create(p_IdList: string); overload;
    end;
    //==================================================================================
    TIdList=class(TIdListBase)
       private
           FSql             : string;
           FOilVarName      : string;
           FOilVarType      : TIdListOilVarType;
           FMode            : TIdListMode;
           FWriteProtected  : Boolean;
           FTable           : string;
           FNameField       : string;
           function GetWriteProtected:Boolean;
           procedure SetWriteProtected(p_Value:Boolean);
           function GetMode:TIdListMode;
           procedure SetMode(p_Value: TIdListMode);
           function GetNameField: string;
           function GetTable: string;
       public
           property WriteProtected: Boolean read GetWriteProtected write SetWriteProtected;
           property Mode: TIdListMode read GetMode write SetMode;
           property NameField: string read GetNameField;
           property Table: string read GetTable;
           function NameList: string;
           function DynSqlCondition(p_Field: string):string;
           procedure Refresh; overload;
           procedure Save;

           constructor Create(p_IdList: string; p_Table :string=''; p_NameField :string='NAME'); overload;
           constructor CreateSql(p_Sql: string; p_Table :string=''; p_NameField :string='NAME'); overload;
           constructor CreateOilVar(p_OilVarName: string; p_Table:string=''; p_NameField:string='NAME'); overload;
    end;
    //==================================================================================
    TGroupIdList=class
       private
           FTable           : string;
           FNameField       : string;
           FOilVarName      : string;
           FOilVarType      : string;
           FList            : TList;
           function GetCount: integer;
           function GetValue(n:integer): TIdListBase;
           function GetNameList(n:integer): string;
           function GetTable: string;
           function GetNameField: string;
       public
           property Count: integer read GetCount;
           property Values[n:integer]: TIdListBase read GetValue; default;
           property NameList[n:integer]: string read GetNameList;
           property Table: string read GetTable;
           property NameField: string read GetNameField;
           function IsUnique: Boolean;
           procedure Refresh;
           procedure MakeMenu(pp_SB:TSpeedButton; pp_Menu:TPopupMenu;
                     p_Proc: TMenuGroupProcedure; p_Default: integer=-1; p_DopObject: TObject = nil);

           procedure Clear;
           procedure Add(p_Name,p_Value:string);

           constructor Create; overload;
           constructor Create(p_OilVarName: string); overload;
           destructor Destroy; override;
    end;

    function DetectIdListOilVarType(p_OilVarName:string): TIdListOilVarType;

implementation

uses UDbFunc,TextFunc,ExFunc,SysUtils,UObjectCacheClass,Main,forms;

//==============================================================================
//******************************************************************************
//***************************** TIdListBase ************************************
//******************************************************************************
//==============================================================================
constructor TIdListBase.Create(p_IdList: string);
begin
    FValue:=p_IdList;
end;
//==============================================================================
function TIdListBase.GetCommaList:string;
begin
    Refresh;
    result:=FValue;
end;
//==============================================================================
procedure TIdListBase.SetCommaList(p_Value:string);
begin
    p_Value:=trim(p_Value);
    if (p_Value='') or SatisfyPatternExact(p_Value,'(\d+,)+\d+') then
       FValue:=p_Value
    else Raise Exception.Create('TIdListBase.PutCommaList: '+#13#10+p_Value+#13#10+TranslateText('неверный формат'));
end;
//==============================================================================
function TIdListBase.GetFullCommaList:string;
begin
    result:=','+GetCommaList+',';
end;
//==============================================================================
function TIdListBase.GetBracketCommaList:string;
begin
    result:='('+CommaList+')';
end;
//==============================================================================
procedure TIdLIstBase.Refresh;
begin
    exit;
end;
//==============================================================================
function TIdLIstBase.IsEmpty: Boolean;
begin
    result:=(FValue='');
end;
//==============================================================================
function TIdListBase.IsInList(p_Id: integer):Boolean;
begin
    result:=(pos(','+IntToStr(p_Id)+',',FullCommaList)>0);
end;
//==============================================================================
function TIdListBase.NameListOfTable(p_Table:string; p_NameField: string='NAME'):string;
begin
    result:=GetNameList(FValue,p_Table);
end;
//==============================================================================
function TIdListBase.StatSqlCondition(p_Field: string):string;
begin
    if IsEmpty then result:=' 0=1 '
    else result:=p_Field+' in '+BracketCommaList+' ';
end;
//==============================================================================
function TIdListBase.GetId(p_Num: integer):string;
var i,n,start,finish:integer;
    s:string;
begin
    s:=FullCommaList; n:=0;
    start:=0; finish:=0;
    for i:=1 to length(s) do begin
        if s[i]=',' then inc(n);
        if n=p_Num then start:=i+1;
        if n=p_Num+1 then begin
           finish:=i;
           break;
        end;
    end;
    if finish=0 then Raise Exception.Create(TranslateText('TIdListBase.GetId: недопустимый индекс'));
    result:=copy(s,start,finish-start);
end;
//==============================================================================
//******************************************************************************
//***************************** TIdList ****************************************
//******************************************************************************
//==============================================================================
constructor TIdList.Create(p_IdList: string; p_Table:string=''; p_NameField:string='NAME');
begin
    FValue          := p_IdList;
    FSql            := '';
    FOilVarName     := '';
    FTable          := p_Table;
    FNameField      := p_NameField;
end;
//==============================================================================
constructor TIdList.CreateSql(p_Sql: string; p_Table:string=''; p_NameField:string='NAME');
var n:integer;
begin
    n:=GetSqlValue('select count(*) from ('+p_Sql+')');
    if n<>1 then
       Raise Exception.Create(TranslateText('TIdList.CreateSql: запрос ')+#13#10+p_Sql+#13#10+
                              TranslateText('возвратил ')+IntToStr(n)+TranslateText('значений вместо одного'));
    FSql            := p_Sql;
    FOilVarName     := '';
    FTable          := p_Table;
    FNameField      := p_NameField;
    FMode           := STATIC_MODE;
    Refresh;
end;
//==============================================================================
constructor TIdList.CreateOilVar(p_OilVarName: string; p_Table:string=''; p_NameField:string='NAME');
begin
    if GetSqlValue('select count(*) from oil_var where name='''+p_OilVarName+''' ')=0 then
       ShowDebugWarning(TranslateText('TIdList.CreateOilVar: переменной ')+p_OilVarName+TranslateText(' в OIL_VAR не найдено'));

    FSql :=
         ' select value '+
         ' from oil_var v,(select '''+p_OilVarName+''' as name from dual) Q '+
         ' where v.name(+)=Q.name ';

    FOilVarName     := p_OilVarName;
    //FTable:=GetSqlValue(
    //     ' select
    FTable          := p_Table;
    FNameField      := p_NameField;
    FMode           := STATIC_MODE;
    FWriteProtected := FALSE;
    Refresh;
end;
//==============================================================================
procedure TIdList.Refresh;
var s,table,field:string;
    n:integer;
begin
    if FOilVarName<>'' then FValue:=GetSqlValue(FSql)
    else begin
       s:=GetSqlValue(FSql);
       n:=pos('#',s);
       s:=copy(s,n+1,length(s));
       if n=0 then exit;
       s:=copy(s,1,n-1);
       n:=pos('/',s);
       if n=0 then begin
          table:=s;
          FOilVarType:=NO_TABLE_NAME;
       end else begin
          table:=copy(s,1,n-1);
          field:=copy(s,n+1,length(s));

          if (FTable<>'') and (table<>FTable) then
             Raise Exception.Create(TranslateText('TIdList.Refresh: из переменной ')+FOilVarName+TranslateText(' в OIL_VAR считано значение таблицы ')+table+#13#10+
                                 TranslateText('в то время, как ранее указанной значение являлось ')+FTable);

          FOilVarType:=WITH_TABLE_NAME;
          FTable:=table;
          FNameField:=field;
       end;
    end;
end;
//==============================================================================
function TIdList.GetWriteProtected:Boolean;
begin
    result:=FWriteProtected;
end;
//==============================================================================
function TIdList.GetNameField: string;
begin
    result:=FNameField;
end;
//==============================================================================
function TIdList.GetTable: string;
begin
    result:=FTable; 
end;
//==============================================================================
procedure TIdList.SetWriteProtected(p_Value:Boolean);
begin
    if (FOilVarName='') then
       ShowDebugWarning('TIdList.SetWriteProtected: '+#13#10+
                    TranslateText('вызов функции для списка, не связанного с OIL_VAR!!!'));
    FWriteProtected:=p_Value;
end;
//==============================================================================
function TIdList.GetMode:TIdListMode;
begin
    result:=FMode;
end;
//==============================================================================
procedure TIdList.SetMode(p_Value: TIdListMode);
begin
    if (FOilVarName='') then
       ShowDebugWarning('TIdList.SetMode: '+#13#10+
                    TranslateText('вызов функции для списка, не связанного с базой данных!!!'));
    FMode:=p_Value;
end;
//==============================================================================
function TIdList.NameList: string;
begin
    if FTable='' then
       Raise Exception.Create(TranslateText('TIdList.NameList: вызов при пустом значении FTable'));
    result:=NameListOfTable(FTable,FNameField);
end;
//==============================================================================
function TIdList.DynSqlCondition(p_Field: string):string;
begin
    ShowDebugWarning(TranslateText('TIdList.DynSqlCondition: Функция не работает!!!'));
end;
//==============================================================================
procedure TIdList.Save;
begin
    if FOilVarName='' then
       Raise Exception.Create(TranslateText('TIdList.Save: попытка записи списка, не связанного с OIL_VAR!'));
    if WriteProtected then
       Raise Exception.Create(TranslateText('TIdList.Sqve: попытка записи списка, защищеного от записи!'));
    _ExecSql('update oil_var set value='''+FValue+''' where name='''+FOilVarName+''' ');
end;

//==============================================================================
//******************************************************************************
//***************************** TGroupIdList ***********************************
//******************************************************************************
//==============================================================================
constructor TGroupIdList.Create;
begin
    FList:=TList.Create;
end;
//==============================================================================
destructor TGroupIdList.Destroy;
begin
    FList.Destroy;
end;
//==============================================================================
constructor TGroupIdList.Create(p_OilVarName :string);
begin
    Create;
    if GetSqlValue('select count(*) from oil_var where name='''+p_OilVarName+''' ')=0 then
       ShowDebugWarning(TranslateText('TGroupIdList.CreateOilVar: переменной ')+p_OilVarName+TranslateText(' в OIL_VAR не найдено'));

    FOilVarName      := p_OilVarName;
    Refresh;
end;
//==============================================================================
procedure TGroupIdList.Refresh;
// в OIL_VAR содержится переменная вида TABLE_NAME/NAMEFIELD#Группа 1{id1,id2,...,idn}Группа2{id1,id2,...,idn}...Группа N{id1,id2,...,idn}
var s,s1:string;
    n:integer;
begin
    s:=GetSqlValue(
       ' select value '+
       ' from oil_var v,(select '''+FOilVarName+''' as name from dual) Q '+
       ' where v.name(+)=Q.name ');
    if s='' then exit;
    n:=pos('#',s);
    if n=0 then Raise Exception.Create(TranslateText('TGroupIdList.Refresh: в переменной ')+FOilVarName+TranslateText(' в OIL_VAR не найдено имя таблицы'));
    s1:=copy(s,1,n-1);
    s:=copy(s,n+1,length(s));
    n:=pos('/',s1);
    if n=0 then begin
       FTable:=s1;
       FNameField:='NAME';
    end else begin
       FTable:=copy(s1,1,n-1);
       FNameField:=copy(s1,n+1,length(s1));
    end;

    Clear;
    repeat
       n:=pos('}',s);
       if n=0 then break;
       s1:=copy(s,1,n-1);
       s:=copy(s,n+1,length(s));
       n:=pos('{',s1);
       if n=0 then Raise Exception.Create(TranslateText('TGroupIdList.Refresh: не найдена открывающая фигурная скобка ')+#13#10+
                                          TranslateText('в переменной ')+FOilVarName+TranslateText(' в OIL_VAR'));
       Add(copy(s1,1,n-1),copy(s1,n+1,length(s1)));
    until FALSE;
end;
//==============================================================================
procedure TGroupIdList.Clear;
begin
    FList.Clear;
end;
//==============================================================================
procedure TGroupIdList.Add(p_Name,p_Value:string);
var idlist:TIdListBase;
begin
    idlist:=TIdList.Create(p_Value);
    idlist.Name:=p_Name;
    FList.Add(idlist);
end;
//==============================================================================
function TGroupIdList.GetCount:integer;
begin
    result:=FList.Count;
end;
//==============================================================================
function TGroupIdList.GetTable: string;
begin
    result:=uppercase(FTable);
end;
//==============================================================================
function TGroupIdList.GetNameField: string;
begin
    result:=uppercase(FNameField);
end;
//==============================================================================
function TGroupIdList.GetValue(n:integer): TIdLIstBase;
begin
    result:=FList[n];
end;
//==============================================================================
function TGroupIdList.GetNameList(n:integer): string;
var idlist: TIdListBase;
begin
    idlist:=FList[n];
    result:=idlist.NameListOfTable(FTable);
end;
//==============================================================================
function TGroupIdLIst.IsUnique:Boolean;
begin
    ShowDebugWarning(TranslateText('TGroupIdList.IsUnique: функция временно не работает'));
    result:=FALSE;
end;
//==============================================================================
procedure TGroupIdLIst.MakeMenu(pp_SB:TSpeedButton; pp_Menu:TPopupMenu;
        p_Proc: TMenuGroupProcedure; p_Default: integer=-1; p_DopObject: TObject = nil);
var i,n:integer;
    menuitem: TMenuItem;
    idlist: TIdListBase;
begin
    pp_Menu:=TPopupMenu.Create(Application);

    for i:=0 to pp_Menu.Items.Count-1 do begin
        menuitem:=pp_Menu.Items[i];
        pp_Menu.Items.Remove(menuitem);
        menuitem.Destroy;
    end;
    n:=ObjectCache.Add([pp_Sb,Self,@p_Proc,p_DopObject]);
    for i:=0 to FList.Count-1 do begin
        menuitem:=TMenuItem.Create(Application);
        idlist:=FList[i];
        menuitem.Caption:=idlist.Name;
        menuitem.Tag:=1000*n+i;
        menuitem.OnClick:=ObjectCache.MenuGroupClick;
        pp_Menu.Items.Add(menuitem);
    end;
    pp_SB.PopupMenu:=pp_Menu;
    if p_Default<>-1 then begin
       if p_Default>Count then Raise Exception.Create(TranslateText('TGroupIdList.MakeMenu: значение p_Default выходит за рамки допустимого'));
       p_Proc(Self,p_Default,pp_SB);
    end;
end;
//==============================================================================
//******************************************************************************
//***************************** FREE ZONE **************************************
//******************************************************************************
//==============================================================================
function DetectIdListOilVarType(p_OilVarName:string): TIdListOilVarType;
var s:string;
begin
    s:=ReadOilVar(p_OilVarName);
    if s='' then result:=UNKNOWN
    else if pos('{',s)>0 then result:=GROUP
    else if pos('#',s)>0 then result:=WITH_TABLE_NAME
    else result:=NO_TABLE_NAME;
end;

end.

