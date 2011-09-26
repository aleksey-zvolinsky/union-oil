unit PartRezLeftRep;

interface

Uses Windows, SysUtils, Classes, Graphics, Controls, Forms,
     Base, Menus, Db, DBTables, Grids, DBGrids, Buttons, ExtCtrls,
     ToolEdit, Mask, RXCtrls,ComObj,Excel8TLB, RXSplit,TalonPotrReport,
     RXDBCtrl, OilStd, Main,ActiveX,Messages,Dialogs,ReportManager,
{$IFDEF VER120}
  OleCtrls,
{$ENDIF}
  StdCtrls,Progr,uOilQuery,Ora, uOilStoredProc;

procedure DoPartRezLeftRep(p_DateBegin:TDateTime;OrgId,OrgInst:integer;p_OrgName:string;
      p_OwnGoodsItogi,p_Shtuki,p_Measured:Boolean;p_List:Variant;p_ProgBar:TProgrForm);

implementation

uses uCommonForm,  UDbFunc,ExFunc,ExcelFunc;

procedure DoPartRezLeftRep(p_DateBegin:TDateTime;OrgId,OrgInst:integer;p_OrgName:string;
      p_OwnGoodsItogi,p_Shtuki,p_Measured:Boolean;p_List:Variant;p_ProgBar:TProgrForm);
const PART_COL = 2;
      SS_COL = 3;
      FIRST_REZ_COL = 4;
      FIRST_HEAD_ROW = 6;

      XL_YELLOW = 27;
      XL_GREEN = 35;
      XL_WHITE = 2;
      XL_BLUE = 5;

var
    q : TOilQuery;
    LastColumn:integer;
    ProgrInc: real;

    CurPartId,CurPartInst:integer;
    CurNpGroup,CurOwnGoods:string;
    CurLine:integer;
    FirstNpGroupLine,FirstOwnGoodsLine:integer;
    rez_col:integer;
    ss_sum,count_sum:real;

    RezTabl:TStringList; // таблица резервуар - колонка. Записи в формате: rez_id,rez_inst=номер колонки

    procedure ShowRez(p_Column:integer);
    begin
        p_List.Cells[FIRST_HEAD_ROW,p_Column] := q.FieldByName('rezname').AsString;
        p_List.Cells[FIRST_HEAD_ROW+1,p_Column].Value := '№ '+ q.FieldByName('reznum').AsString;
    end;

    procedure MakeHead;
    // создает надписи в заголовке и список резервуаров, а так же заполняет таблицу резервуар - колонка
    var i:integer;
    begin
        p_List.Cells[2,'H'] := DateToStr(p_DateBegin);
        p_List.Cells[4,'C'] := p_OrgName;
        PutTitle(p_List);

        q.SQL.Text := 'select id as rezid,inst as rezinst,name as rezname,num as reznum ';
        q.Sql.Add('    from V_OIL_REZERVUAR ');
        q.Sql.Add('    where id_org ='+IntToStr(OrgId)+' and inst=id_org or id=1000001 and inst=1 order by num,id,inst');
        q.FetchAll:=true;
        _OpenQuery(q);

        if q.IsEmpty then raise Exception.Create(TranslateText('У выбранной организации нет резервуаров'));

        for i:=1 to q.RecordCount do begin
            ShowRez(FIRST_REZ_COL+i-1);
            RezTabl.Add(q.FieldByName('rezid').AsString+','+q.FieldByName('rezinst').AsString+'='+IntToStr(FIRST_REZ_COL+i-1));
            q.Next;
        end;

        LastColumn:=FIRST_REZ_COL+q.RecordCount-1;
        q.Close;
    end;

    function ColumnByRez(p_RezId,p_RezInst:integer):integer;
    begin
         try
            result:=StrToInt(RezTabl.Values[IntToStr(p_RezId)+','+IntToStr(p_RezInst)]);
         except
            result:=0;
         end;
    end;

    procedure AddRezIfNeeded;
    begin
        q.First;
        while not q.Eof do begin
            if ColumnByRez(q.FieldByName('rezid').AsInteger,q.FieldByName('rezinst').AsInteger)=0 then begin
               inc(LastColumn);
               RezTabl.Add(q.FieldByName('rezid').AsString+','+q.FieldByName('rezinst').AsString+'='+IntToStr(LastColumn));
               ShowRez(LastColumn);
            end;
            q.Next;
        end;
        q.First;
    end;

    procedure SaveCurValues;
    begin
        CurPartId:=q.FieldByName('partid').AsInteger;
        CurPartInst:=q.FieldByName('partinst').AsInteger;
        CurNpGroup:=q.FieldByName('np_group').AsString;
        if p_OwnGoodsItogi then
           CurOwnGoods:=q.FieldByName('own_goods_name').AsString;
    end;

    procedure ShowPart;
    begin
        p_List.Cells[CurLine,PART_COL]:=q.FieldByName('dog').AsString;
        p_List.Cells[CurLine,SS_COL]:=q.FieldByName('ss').AsFloat;
        p_List.Cells[CurLine,LastColumn+1]:=
             '=SUM('+ExcelNumberToColumn(FIRST_REZ_COL)+IntToStr(CurLine)+':'+
                     ExcelNumberToColumn(LastColumn)+IntToStr(CurLine)+')';
        DrawLineInExcel(p_List,FIRST_REZ_COL,LastColumn+1,CurLine,CurLine,xlEdgeBottom,1,xlThin);
    end;

    procedure OpenRestQ;
    begin
        q.SQL.Text:='select dog,partid,partinst,ss,rezid,rezinst,reznum,rezname,np_group,-sum(tonn+shtuki) as rest '+
                     BoolTo_(p_OwnGoodsItogi,',own_goods_name','');
        q.Sql.Add('from v_oil_npmove ');
        q.Sql.Add('where date_<'''+DateToStr(p_DateBegin)+''' ');
        q.Sql.Add('  and NbAzs=0 and nvl(pponid,oblid)='+IntToStr(OrgId));
        q.Sql.Add('  and IsShtuki in ('+GetConstructedString(['''Y''','''N'''],[p_Shtuki,p_Measured],',','null')+') ');
        q.Sql.Add('group by dog,partid,partinst,ss,rezid,rezinst,reznum,rezname,np_group '+BoolTo_(p_OwnGoodsItogi,',own_goods_name',''));
        q.Sql.Add('having abs(sum(tonn+shtuki))>0.000001 ');
        q.Sql.Add('order by '+BoolTo_(p_OwnGoodsItogi,'own_goods_name,','')+'np_group,dog');
        _OpenQuery(q);
        if q.IsEmpty then raise Exception.Create(TranslateText('В резервуарах нет остатков партий'));
        ProgrInc:=(100-p_ProgBar.Progress)/q.RecordCount;
    end;

    procedure ShowItogi(p_Name:string;p_FirstRow,p_Color:integer);
    var i:integer;
        s:string;
    begin
        p_List.Cells[CurLine,PART_COL]:=p_Name;
        for i:=FIRST_REZ_COL to LastColumn+1 do begin
            s:=ExcelNumberToColumn(i);
            p_List.Cells[CurLine,i]:='=SUBTOTAL(9,'+s+IntToStr(p_FirstRow)+':'+s+IntToStr(CurLine-1)+')';
        end;
        p_List.Range[ExcelNumberToColumn(PART_COL)+IntToStr(CurLine)+
                   ':'+ExcelNumberToColumn(LastColumn+1)+IntToStr(CurLine)].Interior.ColorIndex:=p_Color;
        DrawNetInExcel(p_List,PART_COL,LastColumn+1,CurLine,CurLine,xlMedium);
        inc(CurLine);
    end;

    procedure ShowNpGroupItogi;
    begin
        if count_sum=0 then p_List.Cells[CurLine,SS_COL]:=0
        else p_List.Cells[CurLine,SS_COL]:=ss_sum/count_sum;
        p_List.Cells[CurLine,SS_COL].Font.Italic:=TRUE;
        p_List.Cells[CurLine,SS_COL].Font.ColorIndex:=XL_BLUE;
        ss_sum:=0; count_sum:=0;
        ShowItogi(CurNpGroup,FirstNpGroupLine,XL_GREEN);
        FirstNpGroupLine:=CurLine;
    end;

    procedure ShowOwnGoodsItogi;
    begin
        ShowNpGroupItogi;
        ShowItogi(CurOwnGoods,FirstOwnGoodsLine,XL_YELLOW);
        FirstOwnGoodsLine:=CurLine;
    end;

    procedure FillData;
    begin
        CurLine:=FIRST_HEAD_ROW+2;
        SaveCurValues;
        ShowPart;
        FirstOwnGoodsLine:=CurLine;
        FirstNpGroupLine:=CurLine;
        count_sum:=0; ss_sum:=0;
        while not q.Eof do begin
            if (q.FieldByName('partid').AsInteger=CurPartId) and (q.FieldByName('partinst').AsInteger=CurPartInst) then begin
               rez_col:=ColumnByRez(q.FieldByName('rezid').AsInteger,q.FieldByName('rezinst').AsInteger);
               p_List.Cells[CurLine,rez_col]:=q.FieldByName('rest').AsFloat;
               count_sum:=count_sum+q.FieldByName('rest').AsFloat;
               ss_sum:=ss_sum+q.FieldByName('rest').AsFloat*q.FieldByName('ss').AsFloat;
               p_ProgBar.Progress:=p_ProgBar.Progress+trunc(ProgrInc);
               q.Next;
               continue;
            end;

            inc(CurLine);

            if p_OwnGoodsItogi and (CurOwnGoods<>q.FieldByName('own_goods_name').AsString) then
               ShowOwnGoodsItogi
            else if CurNpGroup<>q.FieldByName('np_group').AsString then begin
               ShowNpGroupItogi;
            end;

            ShowPart;
            SaveCurValues;
        end;

        inc(CurLine);
        if p_OwnGoodsItogi then ShowOwnGoodsItogi
                           else ShowNpGroupItogi;
        ShowItogi('',FIRST_HEAD_ROW,XL_WHITE);
    end;

    procedure MakeBorders;
    begin
        DrawLineInExcel(p_List,PART_COL,SS_COL,FIRST_HEAD_ROW+2,CurLine-2,xlInsideVertical,1,xlSingle);
        DrawNetInExcel(p_List,FIRST_REZ_COL,LastColumn,FIRST_HEAD_ROW,CurLine-1,xlMedium,FALSE);
        DrawNetInExcel(p_List,PART_COL,SS_COL,FIRST_HEAD_ROW+2,CurLine-2,xlMedium,FALSE);
        DrawNetInExcel(p_List,FIRST_REZ_COL,LastColumn+1,FIRST_HEAD_ROW+2,CurLine-1,xlMedium,FALSE);
        DrawLineInExcel(p_List,FIRST_REZ_COL,LastColumn,FIRST_HEAD_ROW,CurLine-1,xlInsideVertical);
    end;

begin
  q := TOilQuery.Create(nil);
  RezTabl := TStringList.Create;
  try
    MakeHead;
    OpenRestQ;
    AddRezIfNeeded;
    FillData;
    MakeBorders;
  finally
    q.Destroy;
    RezTabl.Destroy;
  end;
end;

end.
