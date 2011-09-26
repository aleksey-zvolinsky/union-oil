unit URepElClass;

interface

uses uCommonForm,  Controls,Classes,SysUtils,Math,Db,Ora,uOilQuery,uOilStoredProc;

const TEXT_LETTER_HEIGHT = 17;
      TEXT_LETTER_WIDTH = 6.3;

      PNL_UP_OTSTUP=20;
      PNL_DOWN_OTSTUP=10;
      PNL_HOR_OTSTUP=10;
      PNL_VER_OTSTUP=5;

type TRepPanel=class
     private
        function GetCaption: string;
     public
        Name:string;
        PanelType:string;
        Params: TStringList;
        constructor Create; overload;
        constructor Create(p_PanelType:string); overload;
        destructor Destroy; override;
        property Caption: string read GetCaption;
     end;

     TRepPanels=class
     private
        List:TList;
        function GetCount:integer;
        function GetPanel(n:integer):TRepPanel;
     public
        procedure Add(p_Panel:TRepPanel);
        procedure Clear;
        property Count:integer read GetCount;
        property Panel[n:integer]:TRepPanel read GetPanel; default;
        constructor Create;
        destructor Destroy; override;
     end;

     TRepElement=class
     private
     public
        Name:string;
        ElementType:string;
        PanelId:integer;
        Params:TStringList;
        Res:TStringList;
        function CountFunc(p_Func:string; p_Interface: Boolean):string;
        procedure PostConf;
        constructor Create; overload;
        constructor Create(p_Name,p_ElementType:string); overload;
        destructor Destroy; override;
        procedure FillResFromDataSet(q:TDataSet);
        procedure FillResFromMainOrg;
        procedure ClearRes;
     end;

     TRepElements=class
     private
        List:TList;
        function GetCount:integer;
        function GetElement(n:integer):TRepElement;
     public
        procedure Add(p_Element:TRepElement);
        procedure Clear;
        property Count:integer read GetCount;
        property Elements[n:integer]:TRepElement read GetElement; default;
        function CountFunc(s:string; p_Interface: Boolean):string;
        function IndexOf(p_Name:string):integer;
        constructor Create;
        destructor Destroy; override;
     end;

implementation

uses ExFunc,Main,UDbFunc,UIdListsClass,uStart;

constructor TRepPanel.Create;
begin
    Create('PANEL');
end;

constructor TRepPanel.Create(p_PanelType:string);
begin
    Name:='';
    PanelType:=p_PanelType;
    Params:=TStringList.Create;
    Params.Add('WIDTH=0');
    Params.Add('HEIGHT=0');

    if p_PanelType='DATEPANEL' then begin
       Params.Add('ALIGN=TOP');
       Params.Add('NUM=2');
       Params.Add('CAPTION1='+DevideRusUkr('С@Вiд',true));
       Params.Add('CAPTION2=по');
       Params.Add('RESTRICTION=NO');
    end else if p_PanelType='ORGPANEL' then begin
       Params.Add('ALIGN=TOP');
       Params.Add('NUM=1');
       Params.Add('CAPTION1='+DevideRusUkr('Организация@Организацiя',true));
       Params.Add('CAPTION2='+DevideRusUkr('Организация@Организацiя',true));
       Params.Add('NULLVALUE1=YES');
       Params.Add('NULLVALUE2=YES');
       Params.Add('STARTCONDITION1=1');
       Params.Add('STARTCONDITION2=1');
       Params.Add('OPTIONS1=yyy');
       Params.Add('OPTIONS2=yyy');
    end else begin
       Params.Add('ALIGN=NONE');
       Params.Add('CAPTION=');
    end;
end;

destructor TRepPanel.Destroy;
begin
    Params.Destroy;
end;

function TRepPanel.GetCaption: string;
begin
    result:=DevideRusUkr(Params.Values['CAPTION'],true);
end;

constructor TRepElement.Create(p_Name,p_ElementType:string);
begin
    Name:=p_Name;
    p_ElementType:=UpperCase(p_ElementType);
    ElementType:=p_ElementType;
    PanelId:=-1;
    Params:=TStringList.Create;
    Res:=TStringList.Create;

    if p_ElementType='COMBOBOX' then begin
       Params.Add('DIRECTEDIT=NO');
       Params.Add('CAPTION=');
       Params.Add('DIRECTINPUT=NO');
       Params.Add('LIST=');
       Params.Add('VALUES=');
       Params.Add('NULLVALUE=YES');
       Params.Add('WIDTH=100');
    end else if p_ElementType='LIST' then begin
       Params.Add('CAPTION=');
       Params.Add('TABLENAME=');
       Params.Add('CONDITION=');
       Params.Add('CODFIELD=ID');
       Params.Add('NAMEFIELD=NAME');
       Params.Add('OILVARNAME=');
       Params.Add('DEFAULT=');
    end else if (p_ElementType='CHECKBOXGROUP') then begin
       Params.Add('COLUMNS=1');
       Params.Add('LIST=');
       Params.Add('VALUES=');
       Params.Add('CONDITION=');
    end else if (p_ElementType='RADIOBUTTONGROUP') then begin
       Params.Add('COLUMNS=1');
       Params.Add('LIST=');
       Params.Add('VALUES=');
       Params.Add('CONDITION=');
       Params.Add('STOREDPROC=');
    end else if p_ElementType='COMBOEDIT' then begin
       Params.Add('NULLVALUE=YES');
       Params.Add('TYPE=');
       Params.Add('NAMEFIELD=');
       Params.Add('STARTCONDITION=');
       Params.Add('CAPTION=');
       Params.Add('OPTIONS=');
       Params.Add('WIDTH=100');
    end else if p_ElementType='EDIT' then begin
       Params.Add('CAPTION=');
       Params.Add('WIDTH=100');
       Params.Add('TEXT=');
    end;
end;

constructor TRepElement.Create;
begin
    Create('','');
end;

destructor TRepElement.Destroy;
begin
    Params.Destroy;
    Res.Destroy;
end;

constructor TRepPanels.Create;
begin
    List:=TList.Create;
end;

destructor TRepPanels.Destroy;
var i:integer;
    p:TRepPanel;
begin
    for i:=0 to List.Count-1 do begin
        P:=List.Items[i];
        P.Destroy;
    end;
    List.Destroy;
end;

function TRepPanels.GetCount:integer;
begin
    result:=List.Count;
end;

function TRepPanels.GetPanel(n:integer):TRepPanel;
begin
    result:=List.Items[n];
end;

procedure TRepPanels.Add(p_Panel:TRepPanel);
begin
    List.Add(p_Panel);
end;

procedure TRepPanels.Clear;
begin
    List.Clear;
end;

constructor TRepElements.Create;
begin
    List:=TList.Create;
end;

destructor TRepElements.Destroy;
var i:integer;
    p:TRepElement;
begin
    for i:=0 to List.Count-1 do begin
        P:=List.Items[i];
        P.Destroy;
    end;
    List.Destroy;
end;

function TRepElements.GetCount:integer;
begin
    result:=List.Count;
end;

function TRepElements.GetElement(n:integer):TRepElement;
begin
    result:=List.Items[n];
end;

procedure TRepElements.Add(p_Element:TRepElement);
begin
    List.Add(p_Element);
end;

procedure TRepElements.Clear;
begin
    List.Clear;
end;

function TRepElements.CountFunc(s:string; p_Interface: Boolean):string;
var n:integer;
    name,func:string;
begin
    if s[1]=':' then s:=copy(s,2,length(s));
    s:=RusUpperCase(s);
    n:=pos('.',s);
    if n=0 then begin
       name:=s; func:='';
    end else begin
       name:=copy(s,1,n-1);
       func:=copy(s,n+1,length(s));
    end;

    n:=IndexOf(name);
    if n=-1 then Raise Exception.Create(TranslateText('Неизвестный параметр ')+s);
    result:=Elements[n].CountFunc(func,p_Interface);
end;

function TRepElements.IndexOf(p_Name:string):integer;
var i:integer;
begin
    result:=-1;
    for i:=0 to Count-1 do
        if UpperCase(Elements[i].Name)=UpperCase(p_Name) then begin
           result:=i;
           exit;
        end;
end;

function TRepElement.CountFunc(p_Func:string; p_Interface: Boolean):string;
var s:string;

   procedure RaiseEx;
   begin
      Raise Exception.Create(TranslateText('Метод ')+p_Func+TranslateText(' не поддерживается элементом типа ')+ElementType);
   end;

   function GetList(p_Params:string):string;
   var SL:TStringList;
       resline:string;
       i,j:integer;
   begin
       SL:=TStringList.Create;
       p_Params:=DevideRusUkr(p_Params,false);
       result:=''; p_Params:=trim(p_Params);
       if p_Params='' then p_Params:=CountFunc('GETCAPTIONS',p_Interface);//Params.Values['LIST'];
       try
         Str2StringList(p_Params,SL);
         resline:=Res.Values['CONDITION'];
         if resline='' then
            Raise Exception.Create(TranslateText('Отсутствует результат по элементу ')+Self.Name);
         if SL.Count =0
           then j := Params.Count
           else j := SL.Count;
         for i:=0 to j do
             if resline[i+1]='y' then
                result:=result+SL[i]+',';
         SetLength(result,length(result)-1);
       finally
         SL.Destroy;
       end;
   end;

   function GetState(p_Params:string):string;
   var SL:TStringList;
       resline:string;
       n:integer;
   begin
       SL:=TStringList.Create;
       result:=''; p_Params:=trim(p_Params);
       if p_Params='' then Raise Exception.Create(TranslateText('Вызов метода GETSTATE без аргументов'));
       try
         Str2StringList(p_Params,SL);
         if SL.Count<2 then SL.Add('1');
         if SL.Count<3 then SL.Add('0');
         resline:=Res.Values['CONDITION'];
         if resline='' then
            Raise Exception.Create(TranslateText('Отсутствует результат по элементу ')+Self.Name);
         n:=StrToInt(SL[0]);
         if n>length(resline) then
            Raise Exception.Create(TranslateText('Вызов метода GETSTATE с недопустимым аргументом'));
         if resline[n+1]='y' then result:=SL[1]
                           else result:=SL[2];
       finally
         SL.Destroy;
       end;
   end;

begin
    p_Func:=trim(RusUpperCase(p_Func));
    if ElementType='COMBOBOX' then
       if (p_Func='INDEX') or (p_Func='NAME') then
          result:=Res.Values[p_Func]
       else if p_Func='DESCRIPTION' then result:=Res.Values['NAME']
       else if p_Func='CAPTION' then result:=Params.Values['CAPTION']
       else RaiseEx
    else if ElementType='RADIOBUTTONGROUP' then
       if (p_Func='VALUE') or (p_Func='NAME') then
          result:=Res.Values[p_Func]
       else if p_Func='DESCRIPTION' then result:=Res.Values['NAME']
       else if p_Func='GETCAPTIONS' then result:=Params.Values['LIST']
       else RaiseEx
    else if ElementType='LIST' then
       if (p_Func='INDEXLIST') or (p_Func='NAMELIST') or (p_Func='CHECKED') then
          result:=Res.Values[p_Func]
       else if p_Func='DESCRIPTION' then result:=decode([Res.Values['NAMELIST'],'',DevideRusUkr(TranslateText('Все@Всi'),false),Res.Values['NAMELIST']])
       else if copy(p_Func,1,8)='ISINLIST' then begin
          if (pos('{',p_Func)=0) or (pos('}',p_Func)=0) then
             Raise Exception.Create(TranslateText('В методе ISINLIST не найден список параметров в скобках'));
          if Res.Values['CHECKED']='0' then result:='1=1'
          else begin
             s:=copy(p_Func,pos('{',p_Func)+1,length(p_Func)-pos('{',p_Func)-1);
             result:='instr('',''||'''+Res.Values['INDEXLIST']+'''||'','','',''||'+s+'||'','')>0';
          end;
       end
       else if p_Func='CAPTION' then result:=Params.Values['CAPTION']
       else if p_Func='NAMELIST' then result:=Params.Values['NAMELIST']
       else RaiseEx
    else if ElementType='CHECKBOXGROUP' then
       if p_Func='GETLIST' then begin
          if (pos('(',p_Func)=0) or (pos(')',p_Func)=0) then
             Raise Exception.Create(TranslateText('В методе GETLIST не найден список параметров в скобках'));
          s:=copy(p_Func,pos('(',p_Func),length(p_Func)-pos('(',p_Func)-1);
          result:=GetList(s);
       end else if copy(p_Func,1,8)='GETSTATE' then begin
          if (pos('{',p_Func)=0) or (pos('}',p_Func)=0) then
             Raise Exception.Create(TranslateText('В методе GETSTATE не найден список параметров в скобках'));
          s:=copy(p_Func,pos('{',p_Func)+1,length(p_Func)-pos('{',p_Func)-1);
          result:=GetState(s);
       end else if p_Func='GETCAPTIONS' then
          result:=Params.Values['LIST']
       else if p_Func='DESCRIPTION' then result:=CountFunc('GETCAPTIONS',p_Interface)
       else if p_Func='GETVALUES' then
            if Params.Values['VALUES']='' then Raise Exception.Create(TranslateText('Вызов метода GetValues без определения VALUES'))
            else result:=GetList(Params.Values['VALUES'])
       else RaiseEx
    else if ElementType='COMBOEDIT' then begin
       if p_Func='DESCRIPTION' then result:=decode([Res.Values[Params.Values['NAMEFIELD']],'',
         DevideRusUkr('Все@Всi',false),Res.Values[Params.Values['NAMEFIELD']]]) // *NO_TRANSLATE*
       else if p_Func='CAPTION' then result:=Params.Values['CAPTION']
       else if Res.IndexOfName(p_Func)=-1 then result:='null'
       else result:=Res.Values[p_Func]
    end else if (ElementType='EDIT') then begin
       if (p_Func='') or (p_Func='DESCRIPTION') then result:=''''+Res.Values['RESULT']+''''
       else if p_Func='CAPTION' then result:=Params.Values['CAPTION']
       else RaiseEx
    end else if (ElementType='DATEEDIT') or (ElementType='VARSQL') then
       if (p_Func='') or (p_Func='DESCRIPTION') then result:=Res.Values['RESULT']
       else RaiseEx
    else Raise Exception.Create(TranslateText('Неизвестный тип элемента'));
    result:=DevideRusUkr(result,p_Interface);
end;

procedure TRepElement.PostConf;
var i,n:integer;
    s,varname:string;
    idlist: TIdList;
    groupidlist: TGroupIdList;
    vartype:TIdListOilVarType;
begin
    //---------------------------------------------------------------------------------
    if (ElementType='CHECKBOXGROUP') and (Params.Values['CONDITION']='') then begin
       s:='';
       for i:=0 to CountSubstr(CountFunc('GETCAPTIONS',false),',') do
           s:=s+'y';
       Params.Values['CONDITION']:=s;
       Res.Values['CONDITION']:=s;
    //---------------------------------------------------------------------------------
    end else if (ElementType='RADIOBUTTONGROUP') or (ElementType='COMBOBOX') then begin
       if Params.Values['VALUES']='' then begin
          s:='';
          for i:=0 to CountSubstr(CountFunc('GETCAPTIONS',false),',') do
              s:=s+IntToStr(i)+',';
          Params.Values['VALUES']:=copy(s,1,length(s)-1);
       end;
       if Params.Values['CONDITION']='' then
          Params.Values['CONDITION']:='0';
       Res.Values['VALUE']:=Params.Values['CONDITION'];
    //---------------------------------------------------------------------------------
    end else if ElementType='EDIT' then begin
       Res.Values['RESULT']:=Params.Values['TEXT'];
    //---------------------------------------------------------------------------------
    end else if ElementType='LIST' then begin
       varname:=Params.Values['OILVARNAME'];
       vartype:=DetectIdListOilVarType(varname);
       if varname<>'' then begin
          case vartype of
              UNKNOWN: Raise Exception.Create(TranslateText('TRepElement.PostConf: неизвестный тип переменной ')+varname+TranslateText(' в OIL_VAR!!!'));
              GROUP: begin
                  groupidlist:=TGroupIdList.Create(varname);
                  if (UpperCase(Params.Values['TABLENAME'])<>UpperCase(groupidlist.Table)) and (Params.Values['TABLENAME']<>'') then
                     Raise Exception.Create('TRepElement.PostConf: '+#13#10+
                                            TranslateText('Указанное имя таблицы ')+Params.Values['TABLENAME']+TranslateText(' не совпадает с ')+#13#10+
                                            TranslateText('содержащимся в переменной ')+varname+TranslateText(' в OIL_VAR'));
                  Params.Values['NAMEFIELD']:=groupidlist.NameField;
                  s:=Params.Values['DEFAULT'];
                  if s='' then n:=0
                  else
                     if copy(s,1,5)='GROUP' then begin
                        n:=StrToInt(copy(s,7,length(s)-7))
                     end;
                  Res.Values['INDEXLIST']:=groupidlist[n].CommaList;
                  Res.Values['NAMELIST']:=groupidlist.NameList[n];
                  groupidlist.Destroy;
                  Params.Add('OILVARTYPE=GROUP');
              end;
              WITH_TABLE_NAME,NO_TABLE_NAME: begin
                  idlist:=TIdList.CreateOilVar(varname,Params.Values['TABLENAME'],Params.Values['NAMEFIELD']);
                  if vartype=WITH_TABLE_NAME then
                     Params.Values['NAMEFIELD']:=idlist.NameField
                  else begin
                     if Params.Values['TABLENAME']='' then
                        Raise Exception.Create('TRepElement.PostConf: '+#13#10+
                                               TranslateText('Имя таблицы не указано ни в параметрах отчета ')+#13#10+
                                               TranslateText('ни в переменной ')+varname+TranslateText(' в OIL_VAR'));
                  end;
                  if Params.Values['DEFAULT']<>'' then
                     Raise Exception.Create(TranslateText('TRepElement.PostConf: ненулевое значение DEFAULT не совместимо со значением OILVARNAME!!!'));
                  Res.Values['INDEXLIST']:=idlist.CommaList;
                  Res.Values['NAMELIST']:=idlist.NameList;

                  idlist.Destroy;
                  Params.Add('OILVARTYPE=SIMPLE');
              end;
          end;
       end else begin
          Res.Values['INDEXLIST']:=Params.Values['DEFAULT'];
          Res.Values['NAMELIST']:=GetNameList(Res.Values['INDEXLIST'],Params.Values['TABLENAME']);
          Params.Add('OILVARTYPE=NONE');
       end;
       Res.Values['CHECKED']:=decode([Res.Values['INDEXLIST'],'',0,1]);
    //---------------------------------------------------------------------------------
    end else if ElementType='COMBOEDIT' then begin
       if Params.Values['NAMEFIELD']='' then
          Params.Values['NAMEFIELD']:=
              decode([Params.Values['TYPE'],'OIL_PART','DOG','NAME']);
    end;
end;

procedure TRepElement.FillResFromDataSet(q:TDataSet);
var i:integer;
    s:string;
begin
    Res.Clear;
    for i:=0 to q.Fields.Count-1 do begin
        if q.Fields[i].DataType in [ftString,ftDate,ftTime,ftDateTime] then s:=''''
        else s:='';
        Res.Add(RusUpperCase(q.Fields[i].FieldName)+'='+s+q.FieldByName(q.Fields[i].FieldName).AsString+s);
    end;
end;

procedure TRepElement.FillResFromMainOrg;
var q: TOilQuery;
begin
    Res.Clear;
    if MAIN_ORG.ID=0 then exit;
    q:=TOilQuery.Create(nil);
    try
      q.Session:=frmStart.OraSession1;
      q.Sql.Text:=Format(
        ' select * from v_oil_org where id=%d and inst=%d'+
        ' order by def desc',[MAIN_ORG.ID,MAIN_ORG.INST]);
      _OpenQueryOra(q);
      FillResFromDataSet(q);
    finally
      q.Free;
    end;
    {Res.Add('ID='+IntToStr(MAIN_ORG.ID));
    Res.Add('INST='+IntToStr(MAIN_ORG.INST));
    Res.Add('FACE='+IntToStr(MAIN_ORG.FACE));
    Res.Add('PAR='+IntToStr(MAIN_ORG.PAR));
    Res.Add('PAR_INST='+IntToStr(MAIN_ORG.PAR_INST));
    Res.Add('ORG_TYPE='+IntToStr(MAIN_ORG.ORG_TYPE));
    Res.Add('TALON_CODE='+IntToStr(MAIN_ORG.TALON_CODE));
    Res.Add('CARD_ID='+IntToStr(MAIN_ORG.CARD_ID));
    Res.Add('NAME='+MAIN_ORG.NAME);
    Res.Add('NAL_NUM='+MAIN_ORG.NAL_NUM);
    Res.Add('SVID_NUM='+MAIN_ORG.SVID_NUM);
    Res.Add('ADDR='+MAIN_ORG.ADDR);
    Res.Add('NUM='+MAIN_ORG.NUM);
    Res.Add('DOGOVOR='+MAIN_ORG.DOGOVOR);}
end;

procedure TRepElement.ClearRes;
begin
    if ElementType='COMBOEDIT' then Res.Clear
    else if (ElementType='EDIT') then Res.Values['RESULT']:=''
    else if ElementType='' then begin
        Res.Values['INDEXLIST']:='';
        Res.Values['NAMELIST']:='';
    end else if ElementType='COMBOBOX' then begin
        Res.Values['INDEX']:='';
        Res.Values['NAME']:='';
    end else if ElementType='LIST' then begin
        Res.Values['INDEXLIST']:='';
        Res.Values['NAMELIST']:='';
        Res.Values['CHECKED']:='0';
    end else Raise Exception.Create(TranslateText('ClearRes: недопустимый вызов для элемента типа ')+ElementType);
end;

end.
