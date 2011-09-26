unit Rep_KomNB;

interface

Uses Main,OilStd,ComObj, ActiveX,
{$ifDEF VER120}
  OleCtrls,
{$endif}
  Excel8TLB, StdCtrls,Progr,ReportManager,DB,DBTables,SysUtils,Classes,ExFunc,UDbFunc,uOilQuery,Ora, uOilStoredProc, uCommonForm;


Procedure KomisiaNB(var
  RM:TRepManagerForm;
  Progr:TProgrForm;
  List:Variant;Workbook:
  Excel8TLB._Workbook;
  ISheet: Excel8TLB._Worksheet);
implementation

//------------- Здесь пишеться текст отчета
procedure KomisiaNB(var
  RM:TRepManagerForm;
  Progr:TProgrForm;
  List:Variant;
  Workbook: Excel8TLB._Workbook;
  ISheet: Excel8TLB._Worksheet);
var
   q:TOilQuery;
   S,s2,slovo,sTTN:string;
   I, NP_GRP, PART_ID, PART_INST : Integer;
   GRP_NAME, PART_NAME, GBuh, Boss , BossPred, Uch :  String;
   P_Weig, P_Shtuki, P_Sum, P_NDS : Extended;
   G_Weig, G_Shtuki, G_Sum, G_NDS : Extended;
   A_Weig, A_Shtuki, A_Sum, A_NDS : Extended;
   progrposition,progrstep: real;
begin
 with RM do
 begin
 try
  q:=TOilQuery.Create(nil);
  q.FetchAll:=true;
  q.SQL.Add('select /*ORDERED USE_HASH(vnpm,dog,sb)*/ vnpm.*, sb.num as sb_num,dog.dog as dogovorname,dog.dog_date as dogovor_date '+
            'from v_oil_npmove vnpm,oil_dog dog,oil_sale_book sb '+
            'where vnpm.nn_id=sb.id(+) and vnpm.nn_inst=sb.inst(+) '+
            ' and vnpm.dog_id=dog.id(+) and vnpm.dog_inst=dog.inst(+) '+
            ' and vnpm.NbAzs=0 and vnpm.RashPrih=0  '+
            GetKOSCondition('vnpm.own_goods',CheckList1.Checked[0],CheckList1.Checked[2],CheckList1.Checked[1]));
  if NpList<>'' then q.Sql.Add('and instr('',''||'''+NpList+'''||'','','',''||vnpm.np_groupid||'','')>0');
  if SpeedButton9.Down then q.SQL.Add('and vnpm.operid in '+OperList)
  else begin
    if edOper.Text = '' then S := REPKOMNP
                        else S := IntToStr(edOper.Tag);
    q.SQL.Add('and vnpm.operid in (' + S + ')');
  end;
  if from_date2.Text[1] <> ' ' then q.SQL.Add('and vnpm.Date_ >= To_Date('''+from_date2.Text+''',''DD.MM.YYYY'')');
  if to_date2.Text[1] <> ' ' then q.SQL.Add('and vnpm.Date_ <= To_Date('''+to_date2.Text+''',''DD.MM.YYYY'')');
  if ceOrg.Text   <> ''  then q.SQL.Add('and vnpm.OrgId=vnpm.OrgInst and '+IntToStr(OrgID)+' in (vnpm.PponId,vnpm.OblId) ');
  q.SQL.Add('order by vnpm.np_groupid, vnpm.PartId, vnpm.PartInst');
  _OpenQuery(q);

  BossPred := List.Cells[1,'A'].Value;
  Boss := List.Cells[2,'A'].Value;
  GBuh := List.Cells[3,'A'].Value;
  Uch := List.Cells[4,'A'].Value;
  List.Cells[1,'A'].Value := '';
  List.Cells[2,'A'].Value := '';
  List.Cells[3,'A'].Value := '';
  List.Cells[4,'A'].Value := '';

  if (OrgId=4331) and (OrgId=OrgInst) and CheckList1.Checked[0] and not CheckList1.Checked[1] and not CheckList1.Checked[2] then begin
      List.Cells[1,'B']:='';
      List.Cells[1,'B']:=TranslateText('Комитент ООО "НК Альфа-Нафта"');


      if s='10' then List.Cells[1,'K']:=List.Cells[1,'R'].Value
      else if s<>REPKOMNP then List.Cells[1,'K']:='';

      if s='10' then begin
         List.Cells[3,'B']:=TranslateText('Отчет по перемещению на АЗС');
         List.Cells[4,'D']:=TranslateText('о внутреннем перемещении комиссионного товара');
         List.Cells[7,'I']:=TranslateText('Итого без НДС');
      end;

      if s=REPKOMNP then List.Cells[7,'I']:=TranslateText('Итого с НДС');

  end else begin
      List.Cells[1,'B'].Font.Size:=8;
      List.Cells[1,'B'] := FormatDateTime('dd.mm.yyyy hh:nn:ss', GetSystemDate) +' '+ CURRENT_NAME;
      List.Rows[1].EntireRow.RowHeight:=15 ;
      List.Cells[1,'K']:='';
  end;

//--------
  s2:=TranslateText('Отчет по реализации ');

  if not CheckList1.Checked[0] then begin
     List.Cells[4,'B']:='';
     List.Cells[7,'K']:=TranslateText('Перечисл.На р/с');
  end;
  if not (CheckList1.Checked[0] and CheckList1.Checked[1] and CheckList1.Checked[2]) then
     s2:=s2+GetConstructedString([TranslateText('комиссионного'),TranslateText('хранимого'),TranslateText('собственного')],
            [CheckList1.Checked[0],CheckList1.Checked[1],CheckList1.Checked[2]])
  else s2:=s2+TranslateText('всего');
  if s<>'10' then List.Cells[3,'B']:= S2+TranslateText(' товара');
  if q.RecordCount <> 0 then begin
     progr.AddProgress(5);


     List.Cells[2,'C'] := Num_Edit.Text;
     List.Cells[3,'F'] := FormatDateTime2('dd.mm.yyyy',From_date2.Date);
     List.Cells[3,'I'] := FormatDateTime2('dd.mm.yyyy',to_date2.Date);

     if CheckList1.Checked[0] and not CheckList1.Checked[1] and not CheckList1.Checked[2] then
        List.Cells[2,'G']:=q.FieldByName('OblName').AsString;
     progr.AddProgress(5);

     progr.AddProgress(5);
     progrposition:=progr.Progress;
     progrstep := (100-progrposition)/q.RecordCount;

     List.Cells[5,'C'] := Main.Main_Org.Name;
     q.First;
     PART_ID    := 0;
     PART_INST  := 0;
     NP_GRP     := q.fieldbyname('np_groupid').AsInteger;
     I          := 0;
     P_Weig     := 0;
     P_Shtuki   := 0;
     P_Sum      := 0;
     P_NDS      := 0;
     G_Weig     := 0;
     G_Shtuki   := 0;
     G_Sum      := 0;
     G_NDS      := 0;
     A_Weig     := 0;
     A_Shtuki   := 0;
     A_Sum      := 0;
     A_NDS      := 0;
     GRP_NAME   := '';
     while not q.EOF do begin
            Inc(I);
            if (q.fieldbyname('PartId').AsInteger<>PART_ID)Or(q.fieldbyname('PartInst').AsInteger<>PART_INST) then begin // New Part
              if I <> 1 then begin
                List.Cells[9 + I,'B'] := TranslateText('Итого по ')+PART_NAME+':';
                List.Cells[9 + I,'F'] := P_Weig;
                List.Cells[9 + I,'G'] := P_Shtuki;
                List.Cells[9 + I,'I'] := P_Sum;
                List.Cells[9 + I,'J'] := P_NDS;
                G_Weig     := G_Weig + P_Weig ;
                G_Shtuki   := G_Shtuki + P_Shtuki;
                G_Sum      := G_Sum  + P_Sum  ;
                G_NDS      := G_NDS  + P_NDS  ;
                P_Weig     := 0;
                P_Shtuki   := 0;
                P_Sum      := 0;
                P_NDS      := 0;
                List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeTop].LineStyle    := 1;
                List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeTop].Weight       := xlSingle;
                List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeBottom].LineStyle := 1;
                List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeBottom].Weight    := xlSingle;
                Inc(I);
                if q.fieldbyname('np_groupid').AsInteger <> NP_GRP then begin // New NP Group
                  List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Interior.ColorIndex := 35;
                  List.Cells[9 + I,'B'] := TranslateText('Итого по группе ') + GRP_NAME +' :';
                  List.Cells[9 + I,'F'] := G_Weig;
                  List.Cells[9 + I,'G'] := G_Shtuki;
                  List.Cells[9 + I,'I'] := G_Sum;
                  List.Cells[9 + I,'J'] := G_NDS;
                  A_Weig     := A_Weig + G_Weig ;
                  A_Shtuki   := A_Shtuki + G_Shtuki ;
                  A_Sum      := A_Sum  + G_Sum  ;
                  A_NDS      := A_NDS  + G_NDS  ;
                  G_Weig     := 0;
                  G_Shtuki   := 0;
                  G_Sum      := 0;
                  G_NDS      := 0;
                  NP_GRP := q.fieldbyname('np_groupid').AsInteger;
                  Inc(I);
                end;
              end;
              GRP_NAME := q.fieldbyname('np_group').AsString;
              PART_ID := q.fieldbyname('PartId').AsInteger;
              PART_INST := q.fieldbyname('PartInst').AsInteger;
              PART_NAME := q.FieldByName('Dog').AsString;
              List.Range['C'+IntToStr(9+I)+':E'+IntToStr(9+I)].Merge;
              if q.FieldByName('own_goods').AsString='K' then slovo:=TranslateText('комиссии ')
                                                         else slovo:='';
              List.Cells[9 + I,'C'] := TranslateText('Договор ')+slovo+q.fieldbyname('Dog').AsString + TranslateText(' от ') + FormatDateTime2('dd.mm.yyyy', q.fieldbyname('Dog_Date').AsDateTime);
              List.Range['H'+IntToStr(9+I)+':K'+IntToStr(9+I)].Merge;
              List.Cells[9 + I,'H'] := q.fieldbyname('np_type').AsString;

              //пишем учетную цену
              if RM.rep6cbSS.Checked then
              begin
                List.Range['L'+IntToStr(9+I)+':N'+IntToStr(9+I)].Merge;
                List.Cells[9 + I,'L'] := TranslateText('С\с ')+q.fieldbyname('Ss').AsString;
              end;
              List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeTop].LineStyle    := 1;
              List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeTop].Weight       := xlSingle;
              List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeBottom].LineStyle := 1;
              List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeBottom].Weight    := xlSingle;
            end
            else //Old Part
            begin
              List.Cells[9 + I,'B'] := q.fieldbyname('ClientName').AsString + TranslateText('; № нал. ')+q.fieldbyname('ClientNalNum').AsString + TranslateText('; Свид. ')+q.fieldbyname('ClientSvidNum').AsString+ TranslateText('; Ид. № ') + q.fieldbyname('ClientOkpo').AsString;
              if q.FieldByName('IsSoputst').AsString='Y' then sTTN:=''
              else sTTN:=TranslateText(' ТТН ')+q.fieldbyname('ttn_num').AsString+TranslateText(' от ')+FormatDateTime2('dd.mm.yyyy', q.fieldbyname('ttn_date').AsDateTime);

              if q.fieldByName('DOG_ID').isNull then
                List.Cells[9 + I,'C'] := '№ '+q.fieldbyname('id').AsString+TranslateText(' от ')+FormatDateTime2('dd.mm.yyyy', q.fieldbyname('Date_').AsDateTime)+sTTN
              else
                List.Cells[9 + I,'C'] := '№ '+q.fieldbyname('dogovorname').AsString+TranslateText(' от ')+FormatDateTime2('dd.mm.yyyy', q.fieldbyname('dogovor_Date').AsDateTime)+sTTN;
              List.Cells[9 + I,'D'] := q.fieldbyname('Dov_Serial').AsString+' №'+q.fieldbyname('Dov_Num').AsString+TranslateText(' от ')+FormatDateTime2('dd.mm.yyyy', q.fieldbyname('Dov_Date').AsDateTime);
              List.Cells[9 + I,'E'] := q.fieldbyname('Rez_Num').AsString;
              List.Cells[9 + I,'F'] := q.fieldbyname('tonn').AsFloat;
              List.Cells[9 + I,'G'] := q.fieldbyname('shtuki').AsFloat;
              List.Cells[9 + I,'H'] := q.fieldbyname('price_no_nds').AsFloat;
              List.Cells[9 + I,'I'] := Round(q.fieldbyname('summa').AsFloat*100)/100;
              List.Cells[9 + I,'J'] := Round(q.fieldbyname('nds').AsFloat*100)/100;
              if not q.fieldbyname('sb_num').isNull then
                List.Cells[9 + I,'N'] := q.fieldbyname('sb_num').AsString + '  ' + FormatDateTime2('dd.mm.yyyy',q.fieldbyname('Date_').AsDateTime);

              List.Rows[IntToStr(9+I) + ':' + IntToStr(9+I)].RowHeight := 14.25 * 2;

              List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders.LineStyle    := 1;
              List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders.Weight       := xlSingle;
              P_Weig := P_Weig + q.fieldbyname('tonn').AsFloat;
              P_Shtuki := P_Shtuki + q.fieldbyname('shtuki').AsFloat;
              P_Sum  := P_Sum  + Round(q.fieldbyname('summa').AsFloat*100)/100;
              P_NDS  := P_NDS  + Round(q.fieldbyname('nds').AsFloat*100)/100;
              q.Next;
              progrposition:=progrposition+progrstep;
              if round(progrposition)<>progr.Progress then begin
                 progr.Progress:=round(progrposition);
                 progr.Refresh;
              end;
            end;
          end;
          Inc(I);
          if I <> 1 then
          begin
            List.Cells[9 + I,'B'] := TranslateText('Итого по ')+PART_NAME+':';
            List.Cells[9 + I,'F'] := P_Weig;
            List.Cells[9 + I,'G'] := P_Shtuki;
            List.Cells[9 + I,'I'] := P_Sum;
            List.Cells[9 + I,'J'] := P_NDS;
            G_Weig     := G_Weig + P_Weig ;
            G_Shtuki   := G_Shtuki + P_Shtuki;
            G_Sum      := G_Sum  + P_Sum  ;
            G_NDS      := G_NDS  + P_NDS  ;
            List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeTop].LineStyle    := 1;
            List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeTop].Weight       := xlSingle;
            List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeBottom].LineStyle := 1;
            List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeBottom].Weight    := xlMedium;
            Inc(I);
            List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Interior.ColorIndex := 35;
            List.Cells[9 + I,'B'] := TranslateText('Итого по группе ') + GRP_NAME +' :';
            List.Cells[9 + I,'F'] := G_Weig;
            List.Cells[9 + I,'G'] := G_Shtuki;
            List.Cells[9 + I,'I'] := G_Sum;
            List.Cells[9 + I,'J'] := G_NDS;
            A_Weig     := A_Weig + G_Weig ;
            A_Sum      := A_Sum  + G_Sum  ;
            A_Shtuki   := A_Shtuki + G_Shtuki;
            A_NDS      := A_NDS  + G_NDS  ;
            Inc(I);
          end;
          List.Range['B'+IntToStr(10)+':N'+IntToStr(9+I)].Borders[xlEdgeTop].LineStyle    := 1;
          List.Range['B'+IntToStr(10)+':N'+IntToStr(9+I)].Borders[xlEdgeTop].Weight       := xlMedium;
          List.Range['B'+IntToStr(10)+':N'+IntToStr(9+I)].Borders[xlEdgeLeft].LineStyle   := 1;
          List.Range['B'+IntToStr(10)+':N'+IntToStr(9+I)].Borders[xlEdgeLeft].Weight      := xlMedium;
          List.Range['B'+IntToStr(10)+':N'+IntToStr(9+I)].Borders[xlEdgeRight].LineStyle  := 1;
          List.Range['B'+IntToStr(10)+':N'+IntToStr(9+I)].Borders[xlEdgeRight].Weight     := xlMedium;
          List.Range['B'+IntToStr(10)+':N'+IntToStr(9+I)].Borders[xlEdgeBottom].LineStyle := 1;
          List.Range['B'+IntToStr(10)+':N'+IntToStr(9+I)].Borders[xlEdgeBottom].Weight    := xlMedium;
          List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeTop].LineStyle    := 1;
          List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeTop].Weight       := xlMedium;
          List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeBottom].LineStyle := 1;
          List.Range['B'+IntToStr(9+I)+':N'+IntToStr(9+I)].Borders[xlEdgeBottom].Weight    := xlMedium;
          List.Cells[9 + I,'B'] := TranslateText('Итого:');
          List.Cells[9 + I,'F'] := A_Weig;
          List.Cells[9 + I,'G'] := A_Shtuki;
          List.Cells[9 + I,'I'] := A_Sum;
          List.Cells[9 + I,'J'] := A_NDS;

          if CheckList1.Checked[0] and not CheckList1.Checked[1] and not CheckList1.Checked[2] then
          begin
            List.Cells[11 + I,'B'] := TranslateText('Председатель правления (Заместитель председателя)');
            List.Cells[11 + I,'C'] := BossPred;

            List.Cells[12 + I,'B'] := TranslateText('Главный бухгалтер');
            List.Cells[12 + I,'C'] := GBuh;
          end
          else begin
            //List.Cells[4,'B'] := '';
            List.Cells[4,'C'] := '';
            List.Cells[2,'D'] := '';
            List.Range['G2:N2'].Borders[xlEdgeBottom].LineStyle    := 0;
          end;

          List.Cells[11 + I,'G'] := MANAGER_SHIP;
          List.Cells[11 + I,'I'] := Boss;

          List.Cells[12 + I,'G'] := TranslateText('Старший учётчик');
          List.Cells[12 + I,'I'] := Uch;

  end;
 finally
  q.free;
 end
 end;
end;

end.
