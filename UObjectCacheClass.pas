unit UObjectCacheClass;

interface

uses uCommonForm,  Classes,Buttons,Menus,UIdListsClass,uOilQuery,Ora, uOilStoredProc;

type TObjectCache = class
       private
         function GetValues(p_Num:integer):pointer;
       public
         List: TList;
         property Values[p_Num:integer]:pointer read GetValues; default;
         function NextIndex:integer;
         function Add(p_Pointers: array of pointer):integer;
         procedure Delete(p_Num: integer);
         procedure MenuGroupClick(Sender: TObject);

         constructor Create; overload;
         destructor Destroy; override;
     end;

implementation

uses UReportClass;
//==============================================================================
constructor TObjectCache.Create;
begin
    List:=TList.Create;
end;
//==============================================================================
destructor TObjectCache.Destroy;
begin
    List.Destroy;
end;
//==============================================================================
function TObjectCache.NextIndex:integer;
begin
    result:=List.Count;
end;
//==============================================================================
function TObjectCache.Add(p_Pointers: array of pointer): integer;
var newlist: TList;
    i: integer;
begin
    newlist:=TList.Create;
    for i:=Low(p_Pointers) to High(p_Pointers) do
        newlist.Add(p_Pointers[i]);
    List.Add(newlist);
    result:=List.Count-1;
end;
//==============================================================================
procedure TObjectCache.Delete(p_Num: integer);
var templist:TList;
begin
    templist:=List[p_Num];
    templist.Destroy;
    List[p_Num]:=nil;
end;
//==============================================================================
function TObjectCache.GetValues(p_Num:integer):pointer;
begin
    result:=List[p_Num];
end;
//==============================================================================
procedure TObjectCache.MenuGroupClick(Sender: TObject);
var ObjectCacheIndex,MenuItemIndex: integer;
    lst: TList;
    sb: TSpeedButton;
    groupidlist: TGroupIdList;
    proc: TMenuGroupProcedure;
    R: TReport;
begin
    ObjectCacheIndex:=(Sender as TMenuItem).Tag div 1000;
    MenuItemIndex:=(Sender as TMenuItem).Tag mod 1000;
    lst:=List[ObjectCacheIndex];
    sb:=lst[0];
    groupidlist:=lst[1];
    proc:=lst[2];
    R:=lst[3];
    proc(groupidlist,MenuItemIndex,sb,R);
end;

end.
