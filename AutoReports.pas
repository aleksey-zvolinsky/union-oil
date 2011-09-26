unit AutoReports;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, Db, DBTables,
  ComObj, ActiveX,
{$IFDEF VER120}
  OleCtrls,
{$ENDIF}
  Excel8TLB, uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess
  {$IFDEF VER150},Variants{$ENDIF};

type
  NPStruct = record
   NP: integer; // ��� ������ �������������
   Column1: integer; // ����� ������� ��� ���������� �������
   Column2: integer; // ����� ������� ��� �������
   Column3: integer; // ����� ������� ��� �������
   Column4: integer; // ����� ������� ��� ��������� �������
  end;

  NPSumStruct = record
   NP: integer; // ��� ������ ��������������
   Row: integer; // ����� ������� ��� ���� ������
  end;

  TAutoReportsForm = class(TCommonForm)
    GroupBox1: TGroupBox;
    ComboEdit1: TComboEdit;
    GroupBox2: TGroupBox;
    ButtonPanel: TPanel;
    PrintButton: TBitBtn;
    ExitButton: TBitBtn;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    QReport1: TOilQuery;
    qReport2: TOilQuery;
    QReport6: TOilQuery;
    qReport7: TOilQuery;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    qVerify: TOilQuery;
    qVerifyC: TFloatField;
    qReport8: TOilQuery;
    qReport2AUTOID: TFloatField;
    qReport2AUTOMODEL: TStringField;
    qReport2AUTONUMB: TStringField;
    qReport2DATE_: TDateTimeField;
    qReport2WAYNUMBER: TStringField;
    qReport2TTNNUM: TFloatField;
    qReport2NPTYPE: TFloatField;
    qReport2NPNAME: TStringField;
    qReport2RESTAMOUNT: TFloatField;
    qReport2REST: TFloatField;
    qReport2PRIHODAMOUNT: TFloatField;
    qReport2RASHODAMOUNT: TFloatField;
    qReport2PRIHOD: TFloatField;
    qReport2RASHOD: TFloatField;
    QReport6FILIALID: TFloatField;
    QReport6FILIALNAME: TStringField;
    QReport6GROUPNUMBER: TFloatField;
    QReport6NPTYPE: TFloatField;
    QReport6NPNAME: TStringField;
    QReport6RESTAMOUNT: TFloatField;
    QReport6RESTLITRES: TFloatField;
    QReport6RESTTONNS: TFloatField;
    QReport6PRIHODAMOUNT: TFloatField;
    QReport6PRIHODLITRES: TFloatField;
    QReport6PRIHODTONNS: TFloatField;
    QReport6RASHODAMOUNT: TFloatField;
    QReport6RASHODLITRES: TFloatField;
    QReport6RASHODTONNS: TFloatField;
    qReport7FILIALID: TFloatField;
    qReport7FILIALNAME: TStringField;
    qReport7NPTYPE: TFloatField;
    qReport7NPNAME: TStringField;
    qReport7RASH_T_1: TFloatField;
    qReport7RASH_LT_1: TFloatField;
    qReport7COST_1: TFloatField;
    qReport7RASH_T_2: TFloatField;
    qReport7RASH_LT_2: TFloatField;
    qReport7COST_2: TFloatField;
    qReport7RASH_T_3: TFloatField;
    qReport7RASH_LT_3: TFloatField;
    qReport7COST_3: TFloatField;
    qReport7RASH_T_4: TFloatField;
    qReport7RASH_LT_4: TFloatField;
    qReport7COST_4: TFloatField;
    qReport8AUTOID: TFloatField;
    qReport8AUTOMODEL: TStringField;
    qReport8AUTONUMB: TStringField;
    qReport8GROUPNUMBER: TFloatField;
    qReport8NPTYPE: TFloatField;
    qReport8NPNAME: TStringField;
    qReport8RESTLITRES: TFloatField;
    qReport8PRIHODLITRES: TFloatField;
    qReport8RASHODLITRES: TFloatField;
    QReport1GROUPNUMBER: TFloatField;
    QReport1FILLDATE: TDateTimeField;
    QReport1AUTOID: TFloatField;
    QReport1AUTOMODEL: TStringField;
    QReport1AUTONUMB: TStringField;
    QReport1REFUEL_TYPE_NAME: TStringField;
    QReport1PARTYNUMBER: TStringField;
    QReport1DOCNUMBER: TStringField;
    QReport1NPTYPEID: TFloatField;
    QReport1NPTYPENAME: TStringField;
    QReport1GROUPNPTYPE: TFloatField;
    QReport1GROUPNPNAME: TStringField;
    QReport1LITR: TFloatField;
    QReport1TONN: TFloatField;
    QReport1PRICE: TFloatField;
    QReport1SUMCOST: TFloatField;

    procedure ComboEdit1ButtonClick(Sender: TObject);

    procedure PrintButtonClick(Sender: TObject);
  private
    pReportNum: integer;
    pOrgID: integer;
    pOrgINST: integer;

    FIXLSApp: Excel8TLB._Application;
    procedure Log(AText: String);
    procedure CreateExcel(NewInstance: boolean);
    procedure ShowExcel;
    procedure HideExcel;
    procedure ReleaseExcel;
    function AddWorkbook(const WorkbookName: string): Excel8TLB._Workbook;

    procedure Report1;
    procedure Report2;
    procedure Report3;
    procedure Report4_6(group: integer);
    procedure Report7;
    procedure Report8;

  public
    procedure InitForm(Report: integer);
    property IXLSApp: Excel8TLB._Application read FIXLSApp;
  end;

var
  AutoReportsForm: TAutoReportsForm;

implementation

uses ChooseOrg, Main, ExFunc, OilStd, Progr,
  Udbplan, UDbFunc;

{$R *.DFM}

//==============================================================================
//======================= START EXCEL OPERATIONS ===============================
//==============================================================================
procedure TAutoReportsForm.log(AText:string);
var
  iHour,iMin,iSec,iMSec:Word;
begin
  if SysParamExists('AUTOREPORTLOG') then
  begin
    DecodeTime(Now,iHour,iMin,iSec,iMSec);
    exfunc.log('AutoReport.log',format('%d:%d:%d:%d - %s',[iHour,iMin,iSec,iMSec,AText]));
  end;
end;

//==============================================================================
procedure TAutoReportsForm.CreateExcel(NewInstance: boolean);
var IU: IUnknown;
    isCreate: boolean;
begin
  if not Assigned(IXLSApp) then begin // � ����� ��� ���������, ���� ��� ����?
    isCreate := NewInstance or
      (not SUCCEEDED( GetActiveObject(Excel8TLB.CLASS_Application_, nil, IU) ) );
    if isCreate then
      FIXLSApp := CreateComObject(Excel8TLB.CLASS_Application_) as Excel8TLB._Application
    else
      FIXLSApp := IU as Excel8TLB._Application;
  end;
end;

procedure TAutoReportsForm.ShowExcel;
begin
  if Assigned(IXLSApp) then
   begin
    IXLSApp.Visible[0] := true;
    if IXLSApp.WindowState[0] = TOLEEnum(Excel8TLB.xlMinimized) then
      IXLSApp.WindowState[0] := TOLEEnum(Excel8TLB.xlNormal);
     IXLSApp.ScreenUpdating[0] := true;
  end;
end;

function TAutoReportsForm.AddWorkbook(const WorkbookName: string): Excel8TLB._Workbook;
begin
  Result := nil;
  if Assigned(FIXLSApp) and (trim(WorkbookName) <> '') then begin
    Result := FIXLSApp.Workbooks.Add(WorkbookName, 0);
  end;
end;

procedure TAutoReportsForm.HideExcel;
begin
  if Assigned(IXLSApp) then begin
    IXLSApp.Visible[0] := false;
  end;
end;

procedure TAutoReportsForm.ReleaseExcel;
begin
  if Assigned(IXLSApp) then begin
    // ���� ���� ����� � �� ��������
    if (IXLSApp.Workbooks.Count > 0) and (not IXLSApp.Visible[0]) then begin
      IXLSApp.WindowState[0] := TOLEEnum(xlMinimized);
      IXLSApp.Visible[0] := true;
      if not(csDestroying in ComponentState) then Self.SetFocus; // � ��� ��������� ����������?
      Application.BringToFront;
    end;
  end;
  FIXLSApp := nil;
end;

//==============================================================================
//======================== END EXCEL OPERATIONS ================================
//==============================================================================

// ��������� ������������� �����
procedure TAutoReportsForm.InitForm(Report: integer);
begin
 // ��������� �� ��������� �����������
 qVerify.Close;

 try
  qVerify.Open;

  if (qVerifyC.AsInteger > 0) and INTERACTIVE_LAUNCH_MODE then
   if MessageDlg(TranslateText(' � ����������� "����������� � ���. �������" ���������� ��������� ')+#13#10 +
                 TranslateText('�������, ������� ��������� � ������ ������������ ��������.')+#13#10#13#10 +
                 TranslateText(' ��� ����� �������� � ��������� ������������ ������ �� ���� ')+#13#10 +
                 TranslateText('���. ��������� � ������.')+#10#13#13#10 +
                 TranslateText('              �� ������ ���������� ���������� ������?'),
                 mtWarning, [mbYes, mbNo], 0) = mrNo then Abort;
 finally
  qVerify.Close;
 end;

 // �������������� ����������
 pOrgID:= MAIN_ID;
 pOrgINST:= INST;
 ComboEdit1.Text:= MainForm.qOrgNAME.AsString;

 SetCurrentMonth(DateEdit1, DateEdit2);

 pReportNum:=Report;
 case Report of
 1: Self.Caption:= TranslateText('����� : ��������� �������� ��');
 2: Self.Caption:= TranslateText('����� : ��������� ��������� �������� ���');
 3: Self.Caption:= TranslateText('����� : ������ ��� �� ������ �� ������ �2');
 4: Self.Caption:= TranslateText('����� : �������� ����� ������ �� ������ �1');
 5: Self.Caption:= TranslateText('����� : �������� ����� ������ �� ������ �2');
 6: Self.Caption:= TranslateText('����� : �������� ����� ������ �� ������ �3');
 7: Self.Caption:= TranslateText('����� : �������� ����� ������ �� ������ �4');
 8:
  begin
   Self.Caption:= TranslateText('����� : �������� �� ���������');
   GroupBox3.Visible:= false;
   Self.Height:= Self.Height - 95;
  end;
 end;
end;

procedure TAutoReportsForm.ComboEdit1ButtonClick(Sender: TObject);
var pID, pINST, pType: integer;
    pName: String;
begin
 if ChooseOrg.CaptureOrgT(1, MAIN_ID, INST, 'yyy', pID, pINST, pName, pType) then
  begin
   if not (pType in [3, 4]) then
    raise Exception.Create(TranslateText('������ ������������ ��� ����������� !'));

   pOrgID:= pID;
   pOrgINST:= pINST;
   ComboEdit1.Text:= pName;
  end;
end;

procedure TAutoReportsForm.PrintButtonClick(Sender: TObject);
begin
 // �������� - ��� �� ���� ���������
 if ComboEdit1.Text = '' then
  begin
   MessageDlg(TranslateText(' ��������, ����������, �����������!'), mtWarning, [mbOK], 0);
   ActiveControl:= ComboEdit1;
   Exit;
  end;

 if DateEdit1.Date = 0 then
  begin
   MessageDlg(TranslateText(' �������, ����������, ���� ������ �������!'), mtWarning, [mbOK], 0);
   ActiveControl:= DateEdit1;
   Exit;
  end;

 if DateEdit2.Date = 0 then
  begin
   MessageDlg(TranslateText(' �������, ����������, ���� ��������� �������!'), mtWarning, [mbOK], 0);
   ActiveControl:= DateEdit2;
   Exit;
  end;

 // ��������� �� ��������
 if CUT_DATE <> '' then
  begin
   if StrToDate(CUT_DATE) > DateEdit1.Date then
    begin
     MessageDlg(TranslateText(' ���� ������ ������� ������ ��� ���� ������������� ����!'), mtWarning, [mbOK], 0);
     ActiveControl:= DateEdit1;
     Exit;
    end;

   if StrToDate(CUT_DATE) > DateEdit2.Date then
    begin
     MessageDlg(TranslateText(' ���� ����� ������� ������ ��� ���� ������������� ����!'), mtWarning, [mbOK], 0);
     ActiveControl:= DateEdit2;
     Exit;
    end;
  end;

  DefineRepDates(0,DateEdit2.Date);
 // �������� ������x
 case pReportNum of
 1: Report1;
 2: Report2;
 3: Report3;
 4: Report4_6(1);
 5: Report4_6(2);
 6: Report4_6(3);
 7: Report7;
 8: Report8;
 end;
  DefineRepDates(0,0);
end;

// ����� "��������� �������� ��"
procedure TAutoReportsForm.Report1;
const RowOffSet = 9; // ������, � ������� ���������� ���������� ������
var IWorkbook: Excel8TLB._Workbook;
    List: variant;

    CurRow: integer;
    StartRow: integer;


    Summary: array [1..3, 1..9] of real;

    i: integer;
    j: integer;

    OldGroup: integer;
    OldAutoID: integer;
    OldAutoNumber: string;
    OldAutoModel: string;
begin
 try
  CreateExcel(false);

  // ������� ����� ��� ����������� �������� �������� ������
  ProgrForm:= TProgrForm.Create(Self);

  with ProgrForm do
   begin
    Progress:= 0;
    MaxValue:= 100;
    Show;
    Self.Repaint;
    Repaint;
   end;

  ProgrForm.AddProgress(5);

  with qReport1 do
   begin
    Close;

    ParamByName('FilialID').Value:= pOrgID;
    ParamByName('BeginDate').Value:= DateEdit1.Date;
    ParamByName('EndDate').Value:= DateEdit2.Date;

    Prepare;
    Open;
   end;

  ProgrForm.AddProgress(65);

  try
   if Assigned(IXLSApp) then
    begin
     IWorkbook:= AddWorkbook(GetMainDir+'pattern\wbFuelingSheet.xls');

     try
      List:= IWorkbook.ActiveSheet as Excel8TLB._Worksheet;

      // �����������, ��� ������
      List.Cells[1, 1]:= GetOrgName(Main.Main_Id, Main.Inst) + '; ' +
                         DateToStr(Date) + '; ' + TimeToStr(Time);

      // �����
      List.Cells[3, 3]:= GetOrgName(pOrgID, pOrgINST);

      // ������
      List.Cells[4, 3]:= TranslateText('�� ������ c ') + DateEdit1.Text + TranslateText(' �� ') +  DateEdit2.Text;;

      // �������������� ����������-�������
      OldAutoID:= -999;
      OldAutoNumber:= '-----------';
      OldAutoModel:= '-----------';
      OldGroup:= 0;

      // �������������� �������� �����
      CurRow:= RowOffSet - 1;
      StartRow:= RowOffSet;

      QReport1.First;

      // ���������� �����
      // ��������� �������� ��������
      while not QReport1.EOF do
       begin
        if OldGroup <> QReport1GROUPNUMBER.AsInteger then
         begin // �������� ����� ������ � �������������� ����� ������
          if CurRow <> (RowOffSet - 1) then
           begin // ��������� ����� �� ���������� ������ � �� ���������� ������
            // ����� �� ���������� ������
            Inc(CurRow);

            List.Cells[CurRow, 1]:= TranslateText('����� �� �������');
            List.Range['A' + IntToStr(CurRow),'C' + IntToStr(CurRow)].MergeCells:= True;
            List.Range['A' + IntToStr(CurRow),'C' + IntToStr(CurRow)].HorizontalAlignment:= xlHAlignCenter;
            List.Rows[CurRow].Font.Bold:= true;

            // ��� �� �������� ��������� SubTotal ��� ������� ���� ��������� ������� �
            // "������->���������->�������->�������������� ������ � ������ Excel ��� �����"
            List.Cells[CurRow, 10]:=
             '=SUBTOTAL(9;' + 'J' + IntToStr(StartRow) +
                        ':' + 'J' + IntToStr(CurRow - 1) + ')';

            List.Cells[CurRow, 11]:=
             '=SUBTOTAL(9;' + 'K' + IntToStr(StartRow) +
                        ':' + 'K' + IntToStr(CurRow - 1) + ')';

            List.Cells[CurRow, 13]:=
             '=SUBTOTAL(9;' + 'M' + IntToStr(StartRow) +
                        ':' + 'M' + IntToStr(CurRow - 1) + ')';

            // ����� �� ������
            Inc(CurRow, 2);

            List.Cells[CurRow, 1]:= TranslateText('����� �� ������ ') + IntToStr(OldGroup) +
                                    TranslateText(' � ������� ����� ���:');
            List.Range['A' + IntToStr(CurRow),'G' + IntToStr(CurRow + 8)].MergeCells:= True;
            List.Range['A' + IntToStr(CurRow),'G' + IntToStr(CurRow + 8)].HorizontalAlignment:= xlHAlignCenter;
            List.Range['A' + IntToStr(CurRow),'G' + IntToStr(CurRow + 8)].VerticalAlignment:= xlHAlignCenter;
            List.Rows[CurRow].Font.Bold:= true;
            List.Rows[CurRow + 1].Font.Bold:= true;
            List.Rows[CurRow + 2].Font.Bold:= true;
            List.Rows[CurRow + 3].Font.Bold:= true;
            List.Rows[CurRow + 4].Font.Bold:= true;
            List.Rows[CurRow + 5].Font.Bold:= true;
            List.Rows[CurRow + 6].Font.Bold:= true;
            List.Rows[CurRow + 7].Font.Bold:= true;
            List.Rows[CurRow + 8].Font.Bold:= true;

            List.Cells[CurRow, 8]:= TranslateText('�-76');
            List.Cells[CurRow, 10]:= Summary[1, 1];
            List.Cells[CurRow, 11]:= Summary[2, 1];
            List.Cells[CurRow, 13]:= Summary[3, 1];

            List.Cells[CurRow + 1, 8]:= TranslateText('�-80');
            List.Cells[CurRow + 1, 10]:= Summary[1, 2];
            List.Cells[CurRow + 1, 11]:= Summary[2, 2];
            List.Cells[CurRow + 1, 13]:= Summary[3, 2];

            List.Cells[CurRow + 2, 8]:= TranslateText('�-92');
            List.Cells[CurRow + 2, 10]:= Summary[1, 3];
            List.Cells[CurRow + 2, 11]:= Summary[2, 3];
            List.Cells[CurRow + 2, 13]:= Summary[3, 3];

            List.Cells[CurRow + 3, 8]:= TranslateText('�-95');
            List.Cells[CurRow + 3, 10]:= Summary[1, 4];
            List.Cells[CurRow + 3, 11]:= Summary[2, 4];
            List.Cells[CurRow + 3, 13]:= Summary[3, 4];

            List.Cells[CurRow + 4, 8]:= TranslateText('��');
            List.Cells[CurRow + 4, 10]:= Summary[1, 5];
            List.Cells[CurRow + 4, 11]:= Summary[2, 5];
            List.Cells[CurRow + 4, 13]:= Summary[3, 5];

            List.Cells[CurRow + 5, 8]:= TranslateText('�����');
            List.Cells[CurRow + 5, 10]:= Summary[1, 6];
            List.Cells[CurRow + 5, 11]:= Summary[2, 6];
            List.Cells[CurRow + 5, 13]:= Summary[3, 6];

            List.Cells[CurRow + 6, 8]:= TranslateText('������');
            List.Cells[CurRow + 6, 10]:= Summary[1, 7];
            List.Cells[CurRow + 6, 11]:= Summary[2, 7];
            List.Cells[CurRow + 6, 13]:= Summary[3, 7];

            List.Cells[CurRow + 7, 8]:= TranslateText('������');
            List.Cells[CurRow + 7, 10]:= Summary[1, 8];
            List.Cells[CurRow + 7, 11]:= Summary[2, 8];
            List.Cells[CurRow + 7, 13]:= Summary[3, 8];

            List.Cells[CurRow + 8, 8]:= TranslateText('���');
            List.Cells[CurRow + 8, 10]:= Summary[1, 9];
            List.Cells[CurRow + 8, 11]:= Summary[2, 9];
            List.Cells[CurRow + 8, 13]:= Summary[3, 9];

            Inc(CurRow, 8);
           end;

           for i:= 1 to 3 do
            for j:= 1 to 9 do
             Summary[i, j]:= 0;

           Inc(CurRow);

           // ������� ������
           List.Cells[CurRow, 1]:= QReport1GROUPNUMBER.AsInteger;
           List.Cells[CurRow, 2]:= FormatDateTime('dd"."mm"."yyyy', QReport1FILLDATE.AsDateTime);
           List.Cells[CurRow, 3]:= QReport1AUTOMODEL.AsString;
           List.Cells[CurRow, 4]:= QReport1AUTONUMB.AsString;
           List.Cells[CurRow, 5]:= QReport1REFUEL_TYPE_NAME.AsString;
           List.Cells[CurRow, 6]:= QReport1PARTYNUMBER.AsString;
           List.Cells[CurRow, 7]:= QReport1DOCNUMBER.AsString;
           List.Cells[CurRow, 8]:= QReport1GROUPNPNAME.AsString;
           List.Cells[CurRow, 9]:= QReport1NPTYPENAME.AsString;
           List.Cells[CurRow, 10]:= QReport1LITR.AsFloat;
           List.Cells[CurRow, 11]:= QReport1TONN.AsFloat;
           List.Cells[CurRow, 12]:= QReport1PRICE.AsFloat;
           List.Cells[CurRow, 13]:= QReport1SUMCOST.AsFloat;

           // ����������, ����� ��� ��� ��������
           case QReport1GROUPNPTYPE.AsInteger of
            4: begin
                Summary[1, 1]:= Summary[1, 1] + QReport1LITR.AsFloat;
                Summary[2, 1]:= Summary[2, 1] + QReport1TONN.AsFloat;
                Summary[3, 1]:= Summary[3, 1] + QReport1SUMCOST.AsFloat;
               end;
            5: begin
                Summary[1, 2]:= Summary[1, 2] + QReport1LITR.AsFloat;
                Summary[2, 2]:= Summary[2, 2] + QReport1TONN.AsFloat;
                Summary[3, 2]:= Summary[3, 2] + QReport1SUMCOST.AsFloat;
               end;
            6: begin
                Summary[1, 3]:= Summary[1, 3] + QReport1LITR.AsFloat;
                Summary[2, 3]:= Summary[2, 3] + QReport1TONN.AsFloat;
                Summary[3, 3]:= Summary[3, 3] + QReport1SUMCOST.AsFloat;
               end;
            7: begin
                Summary[1, 4]:= Summary[1, 4] + QReport1LITR.AsFloat;
                Summary[2, 4]:= Summary[2, 4] + QReport1TONN.AsFloat;
                Summary[3, 4]:= Summary[3, 4] + QReport1SUMCOST.AsFloat;
               end;
            3: begin
                Summary[1, 5]:= Summary[1, 5] + QReport1LITR.AsFloat;
                Summary[2, 5]:= Summary[2, 5] + QReport1TONN.AsFloat;
                Summary[3, 5]:= Summary[3, 5] + QReport1SUMCOST.AsFloat;
               end;
            8: begin
                Summary[1, 6]:= Summary[1, 6] + QReport1LITR.AsFloat;
                Summary[2, 6]:= Summary[2, 6] + QReport1TONN.AsFloat;
                Summary[3, 6]:= Summary[3, 6] + QReport1SUMCOST.AsFloat;
               end;
           63: begin
                Summary[1, 7]:= Summary[1, 7] + QReport1LITR.AsFloat;
                Summary[2, 7]:= Summary[2, 7] + QReport1TONN.AsFloat;
                Summary[3, 7]:= Summary[3, 7] + QReport1SUMCOST.AsFloat;
               end;
            9: begin
                Summary[1, 8]:= Summary[1, 8] + QReport1LITR.AsFloat;
                Summary[2, 8]:= Summary[2, 8] + QReport1TONN.AsFloat;
                Summary[3, 8]:= Summary[3, 8] + QReport1SUMCOST.AsFloat;
               end;
           62: begin
                Summary[1, 9]:= Summary[1, 9] + QReport1LITR.AsFloat;
                Summary[2, 9]:= Summary[2, 9] + QReport1TONN.AsFloat;
                Summary[3, 9]:= Summary[3, 9] + QReport1SUMCOST.AsFloat;
               end;
           end;

           OldGroup:= QReport1GROUPNUMBER.AsInteger;
           OldAutoID:= QReport1AUTOID.AsInteger;
           OldAutoNumber:= QReport1AUTONUMB.AsString;
           OldAutoModel:= QReport1AUTOMODEL.AsString;
           StartRow:= CurRow;
         end
        else
         begin // ���������� �� ������ �������
          if OldAutoID <> QReport1AUTOID.AsInteger then
           begin // �������� ����� ������
            // ����� �� ���������� ������
            Inc(CurRow);

            List.Cells[CurRow, 1]:= TranslateText('����� �� �������');
            List.Range['A' + IntToStr(CurRow),'C' + IntToStr(CurRow)].MergeCells:= True;
            List.Range['A' + IntToStr(CurRow),'C' + IntToStr(CurRow)].HorizontalAlignment:= xlHAlignCenter;
            List.Rows[CurRow].Font.Bold:= true;

            // ��� �� �������� ��������� SubTotal ��� ������� ���� ��������� ������� �
            // "������->���������->�������->�������������� ������ � ������ Excel ��� �����"
            List.Cells[CurRow, 10]:=
             '=SUBTOTAL(9;' + 'J' + IntToStr(StartRow) +
                        ':' + 'J' + IntToStr(CurRow - 1) + ')';

            List.Cells[CurRow, 11]:=
             '=SUBTOTAL(9;' + 'K' + IntToStr(StartRow) +
                        ':' + 'K' + IntToStr(CurRow - 1) + ')';

            List.Cells[CurRow, 13]:=
             '=SUBTOTAL(9;' + 'M' + IntToStr(StartRow) +
                        ':' + 'M' + IntToStr(CurRow - 1) + ')';

            Inc(CurRow);

            // ������� ������
            List.Cells[CurRow, 1]:= QReport1GROUPNUMBER.AsInteger;
            List.Cells[CurRow, 2]:= FormatDateTime('dd"."mm"."yyyy', QReport1FILLDATE.AsDateTime);
            List.Cells[CurRow, 3]:= QReport1AUTOMODEL.AsString;
            List.Cells[CurRow, 4]:= QReport1AUTONUMB.AsString;
            List.Cells[CurRow, 5]:= QReport1REFUEL_TYPE_NAME.AsString;
            List.Cells[CurRow, 6]:= QReport1PARTYNUMBER.AsString;
            List.Cells[CurRow, 7]:= QReport1DOCNUMBER.AsString;
            List.Cells[CurRow, 8]:= QReport1GROUPNPNAME.AsString;
            List.Cells[CurRow, 9]:= QReport1NPTYPENAME.AsString;
            List.Cells[CurRow, 10]:= QReport1LITR.AsFloat;
            List.Cells[CurRow, 11]:= QReport1TONN.AsFloat;
            List.Cells[CurRow, 12]:= QReport1PRICE.AsFloat;
            List.Cells[CurRow, 13]:= QReport1SUMCOST.AsFloat;

            // ����������, ����� ��� ��� ��������
            case QReport1GROUPNPTYPE.AsInteger of
             4: begin
                 Summary[1, 1]:= Summary[1, 1] + QReport1LITR.AsFloat;
                 Summary[2, 1]:= Summary[2, 1] + QReport1TONN.AsFloat;
                 Summary[3, 1]:= Summary[3, 1] + QReport1SUMCOST.AsFloat;
                end;
             5: begin
                 Summary[1, 2]:= Summary[1, 2] + QReport1LITR.AsFloat;
                 Summary[2, 2]:= Summary[2, 2] + QReport1TONN.AsFloat;
                 Summary[3, 2]:= Summary[3, 2] + QReport1SUMCOST.AsFloat;
                end;
             6: begin
                 Summary[1, 3]:= Summary[1, 3] + QReport1LITR.AsFloat;
                 Summary[2, 3]:= Summary[2, 3] + QReport1TONN.AsFloat;
                 Summary[3, 3]:= Summary[3, 3] + QReport1SUMCOST.AsFloat;
                end;
             7: begin
                 Summary[1, 4]:= Summary[1, 4] + QReport1LITR.AsFloat;
                 Summary[2, 4]:= Summary[2, 4] + QReport1TONN.AsFloat;
                 Summary[3, 4]:= Summary[3, 4] + QReport1SUMCOST.AsFloat;
                end;
             3: begin
                 Summary[1, 5]:= Summary[1, 5] + QReport1LITR.AsFloat;
                 Summary[2, 5]:= Summary[2, 5] + QReport1TONN.AsFloat;
                 Summary[3, 5]:= Summary[3, 5] + QReport1SUMCOST.AsFloat;
                end;
             8: begin
                 Summary[1, 6]:= Summary[1, 6] + QReport1LITR.AsFloat;
                 Summary[2, 6]:= Summary[2, 6] + QReport1TONN.AsFloat;
                 Summary[3, 6]:= Summary[3, 6] + QReport1SUMCOST.AsFloat;
                end;
            63: begin
                 Summary[1, 7]:= Summary[1, 7] + QReport1LITR.AsFloat;
                 Summary[2, 7]:= Summary[2, 7] + QReport1TONN.AsFloat;
                 Summary[3, 7]:= Summary[3, 7] + QReport1SUMCOST.AsFloat;
                end;
             9: begin
                 Summary[1, 8]:= Summary[1, 8] + QReport1LITR.AsFloat;
                 Summary[2, 8]:= Summary[2, 8] + QReport1TONN.AsFloat;
                 Summary[3, 8]:= Summary[3, 8] + QReport1SUMCOST.AsFloat;
                end;
            62: begin
                 Summary[1, 9]:= Summary[1, 9] + QReport1LITR.AsFloat;
                 Summary[2, 9]:= Summary[2, 9] + QReport1TONN.AsFloat;
                 Summary[3, 9]:= Summary[3, 9] + QReport1SUMCOST.AsFloat;
                end;
            end;

            OldAutoID:= QReport1AUTOID.AsInteger;
            OldAutoNumber:= QReport1AUTONUMB.AsString;
            OldAutoModel:= QReport1AUTOMODEL.AsString;
            StartRow:= CurRow;
           end
          else
           begin
            Inc(CurRow);

            // ������� ������
            List.Cells[CurRow, 1]:= QReport1GROUPNUMBER.AsInteger;
            List.Cells[CurRow, 2]:= FormatDateTime('dd"."mm"."yyyy', QReport1FILLDATE.AsDateTime);
            List.Cells[CurRow, 3]:= QReport1AUTOMODEL.AsString;
            List.Cells[CurRow, 4]:= QReport1AUTONUMB.AsString;
            List.Cells[CurRow, 5]:= QReport1REFUEL_TYPE_NAME.AsString;
            List.Cells[CurRow, 6]:= QReport1PARTYNUMBER.AsString;
            List.Cells[CurRow, 7]:= QReport1DOCNUMBER.AsString;
            List.Cells[CurRow, 8]:= QReport1GROUPNPNAME.AsString;
            List.Cells[CurRow, 9]:= QReport1NPTYPENAME.AsString;
            List.Cells[CurRow, 10]:= QReport1LITR.AsFloat;
            List.Cells[CurRow, 11]:= QReport1TONN.AsFloat;
            List.Cells[CurRow, 12]:= QReport1PRICE.AsFloat;
            List.Cells[CurRow, 13]:= QReport1SUMCOST.AsFloat;

            // ����������, ����� ��� ��� ��������
            case QReport1GROUPNPTYPE.AsInteger of
             4: begin
                 Summary[1, 1]:= Summary[1, 1] + QReport1LITR.AsFloat;
                 Summary[2, 1]:= Summary[2, 1] + QReport1TONN.AsFloat;
                 Summary[3, 1]:= Summary[3, 1] + QReport1SUMCOST.AsFloat;
                end;
             5: begin
                 Summary[1, 2]:= Summary[1, 2] + QReport1LITR.AsFloat;
                 Summary[2, 2]:= Summary[2, 2] + QReport1TONN.AsFloat;
                 Summary[3, 2]:= Summary[3, 2] + QReport1SUMCOST.AsFloat;
                end;
             6: begin
                 Summary[1, 3]:= Summary[1, 3] + QReport1LITR.AsFloat;
                 Summary[2, 3]:= Summary[2, 3] + QReport1TONN.AsFloat;
                 Summary[3, 3]:= Summary[3, 3] + QReport1SUMCOST.AsFloat;
                end;
             7: begin
                 Summary[1, 4]:= Summary[1, 4] + QReport1LITR.AsFloat;
                 Summary[2, 4]:= Summary[2, 4] + QReport1TONN.AsFloat;
                 Summary[3, 4]:= Summary[3, 4] + QReport1SUMCOST.AsFloat;
                end;
             3: begin
                 Summary[1, 5]:= Summary[1, 5] + QReport1LITR.AsFloat;
                 Summary[2, 5]:= Summary[2, 5] + QReport1TONN.AsFloat;
                 Summary[3, 5]:= Summary[3, 5] + QReport1SUMCOST.AsFloat;
                end;
             8: begin
                 Summary[1, 6]:= Summary[1, 6] + QReport1LITR.AsFloat;
                 Summary[2, 6]:= Summary[2, 6] + QReport1TONN.AsFloat;
                 Summary[3, 6]:= Summary[3, 6] + QReport1SUMCOST.AsFloat;
                end;
            63: begin
                 Summary[1, 7]:= Summary[1, 7] + QReport1LITR.AsFloat;
                 Summary[2, 7]:= Summary[2, 7] + QReport1TONN.AsFloat;
                 Summary[3, 7]:= Summary[3, 7] + QReport1SUMCOST.AsFloat;
                end;
             9: begin
                 Summary[1, 8]:= Summary[1, 8] + QReport1LITR.AsFloat;
                 Summary[2, 8]:= Summary[2, 8] + QReport1TONN.AsFloat;
                 Summary[3, 8]:= Summary[3, 8] + QReport1SUMCOST.AsFloat;
                end;
            62: begin
                 Summary[1, 9]:= Summary[1, 9] + QReport1LITR.AsFloat;
                 Summary[2, 9]:= Summary[2, 9] + QReport1TONN.AsFloat;
                 Summary[3, 9]:= Summary[3, 9] + QReport1SUMCOST.AsFloat;
                end;
            end;
           end;
         end;

        QReport1.Next;
       end;

      ProgrForm.AddProgress(20);

      // ��������� ������
      if CurRow <> (RowOffSet - 1) then
       begin // ��������� ����� �� ���������� ������ � �� ���������� ������
        // ����� �� ���������� ������
        Inc(CurRow);

        List.Cells[CurRow, 1]:= TranslateText('����� �� �������');
        List.Range['A' + IntToStr(CurRow),'C' + IntToStr(CurRow)].MergeCells:= True;
        List.Range['A' + IntToStr(CurRow),'C' + IntToStr(CurRow)].HorizontalAlignment:= xlHAlignCenter;
        List.Rows[CurRow].Font.Bold:= true;

        // ��� �� �������� ��������� SubTotal ��� ������� ���� ��������� ������� �
        // "������->���������->�������->�������������� ������ � ������ Excel ��� �����"
        List.Cells[CurRow, 10]:=
         '=SUBTOTAL(9;' + 'J' + IntToStr(StartRow) +
                    ':' + 'J' + IntToStr(CurRow - 1) + ')';

        List.Cells[CurRow, 11]:=
         '=SUBTOTAL(9;' + 'K' + IntToStr(StartRow) +
                    ':' + 'K' + IntToStr(CurRow - 1) + ')';

        List.Cells[CurRow, 13]:=
         '=SUBTOTAL(9;' + 'M' + IntToStr(StartRow) +
                    ':' + 'M' + IntToStr(CurRow - 1) + ')';

        // ����� �� ������
        Inc(CurRow, 2);

        List.Cells[CurRow, 1]:= TranslateText('����� �� ������ ') + IntToStr(OldGroup) +
                                TranslateText(' � ������� ����� ���:');
        List.Range['A' + IntToStr(CurRow),'G' + IntToStr(CurRow + 8)].MergeCells:= True;
        List.Range['A' + IntToStr(CurRow),'G' + IntToStr(CurRow + 8)].HorizontalAlignment:= xlHAlignCenter;
        List.Range['A' + IntToStr(CurRow),'G' + IntToStr(CurRow + 8)].VerticalAlignment:= xlHAlignCenter;
        List.Rows[CurRow].Font.Bold:= true;
        List.Rows[CurRow + 1].Font.Bold:= true;
        List.Rows[CurRow + 2].Font.Bold:= true;
        List.Rows[CurRow + 3].Font.Bold:= true;
        List.Rows[CurRow + 4].Font.Bold:= true;
        List.Rows[CurRow + 5].Font.Bold:= true;
        List.Rows[CurRow + 6].Font.Bold:= true;
        List.Rows[CurRow + 7].Font.Bold:= true;
        List.Rows[CurRow + 8].Font.Bold:= true;

        List.Cells[CurRow, 8]:= TranslateText('�-76');
        List.Cells[CurRow, 9]:= Summary[1, 1];
        List.Cells[CurRow, 10]:= Summary[2, 1];
        List.Cells[CurRow, 12]:= Summary[3, 1];

        List.Cells[CurRow + 1, 8]:= TranslateText('�-80');
        List.Cells[CurRow + 1, 10]:= Summary[1, 2];
        List.Cells[CurRow + 1, 11]:= Summary[2, 2];
        List.Cells[CurRow + 1, 13]:= Summary[3, 2];

        List.Cells[CurRow + 2, 8]:= TranslateText('�-92');
        List.Cells[CurRow + 2, 10]:= Summary[1, 3];
        List.Cells[CurRow + 2, 11]:= Summary[2, 3];
        List.Cells[CurRow + 2, 13]:= Summary[3, 3];

        List.Cells[CurRow + 3, 8]:= TranslateText('�-95');
        List.Cells[CurRow + 3, 10]:= Summary[1, 4];
        List.Cells[CurRow + 3, 11]:= Summary[2, 4];
        List.Cells[CurRow + 3, 13]:= Summary[3, 4];

        List.Cells[CurRow + 4, 8]:= TranslateText('��');
        List.Cells[CurRow + 4, 10]:= Summary[1, 5];
        List.Cells[CurRow + 4, 11]:= Summary[2, 5];
        List.Cells[CurRow + 4, 13]:= Summary[3, 5];

        List.Cells[CurRow + 5, 8]:= TranslateText('�����');
        List.Cells[CurRow + 5, 10]:= Summary[1, 6];
        List.Cells[CurRow + 5, 11]:= Summary[2, 6];
        List.Cells[CurRow + 5, 13]:= Summary[3, 6];

        List.Cells[CurRow + 6, 8]:= TranslateText('������');
        List.Cells[CurRow + 6, 10]:= Summary[1, 7];
        List.Cells[CurRow + 6, 11]:= Summary[2, 7];
        List.Cells[CurRow + 6, 13]:= Summary[3, 7];

        List.Cells[CurRow + 7, 8]:= TranslateText('������');
        List.Cells[CurRow + 7, 10]:= Summary[1, 8];
        List.Cells[CurRow + 7, 11]:= Summary[2, 8];
        List.Cells[CurRow + 7, 13]:= Summary[3, 8];

        List.Cells[CurRow + 8, 8]:= TranslateText('���');
        List.Cells[CurRow + 8, 10]:= Summary[1, 9];
        List.Cells[CurRow + 8, 11]:= Summary[2, 9];
        List.Cells[CurRow + 8, 13]:= Summary[3, 9];
       end;


      List.Range['A' + IntToStr(RowOffSet),'M' + IntToStr(CurRow + 8)].
       Borders[xlEdgeBottom].LineStyle:= 1;
//      List.Range['A' + IntToStr(RowOffSet),'M' + IntToStr(CurRow + 7)].
//       Borders[xlEdgeBottom].Weight:= xlThick;

      List.Range['A' + IntToStr(RowOffSet),'M' + IntToStr(CurRow + 8)].
       Borders[xlEdgeRight].LineStyle:= 1;
//      List.Range['A' + IntToStr(RowOffSet),'M' + IntToStr(CurRow + 7)].
//       Borders[xlEdgeRight].Weight:= xlThick;

      List.Range['A' + IntToStr(RowOffSet),'M' + IntToStr(CurRow + 8)].
       Borders[xlEdgeLeft].LineStyle:= 1;
//      List.Range['A' + IntToStr(RowOffSet),'M' + IntToStr(CurRow + 7)].
//       Borders[xlEdgeLeft].Weight:= xlThick;

      List.Range['A' + IntToStr(RowOffSet),'M' + IntToStr(CurRow + 8)].
       Borders[xlInsideVertical].LineStyle:= 1;
      List.Range['A' + IntToStr(RowOffSet),'M' + IntToStr(CurRow + 8)].
       Borders[xlInsideHorizontal].LineStyle:= 1;

      for i:= 8 to 12 do
       List.Columns[i].AutoFit;

      ProgrForm.AddProgress(10);

      ShowExcel;
     finally
      IWorkbook := nil;
     end;
    end;

  finally
   QReport1.Close;

   ProgrForm.Free;
  end;
 except
  on E:Exception do
   begin
    HideExcel;
    MessageDlg(TranslateText('������: ') + E.message, mtError, [mbOk], 0);
    ReleaseExcel;
   end;
 end;
end;

// ����� "��������� ��������� �������� ���"
procedure TAutoReportsForm.Report2;
const RowOffSet = 9; // ������, � ������� ���������� ���������� ������
  // ������ �������� ��� ������ � ���������������
  NPPrices: array [1..4, 1..9] of NPSumStruct =
   (
    ( // ������ ������ - �������� �������������
     (NP: 4; Row: 9), // �-76
     (NP: 5; Row: 10),  // A-80
     (NP: 6; Row: 11), // A-92
     (NP: 7; Row: 12), // A-95
     (NP: 3; Row: 13), // ��
     (NP: 63; Row: 14), // ������ �������
     (NP: 8; Row: 15), // �����
     (NP: 9; Row: 16), // ������
     (NP: 62; Row: 17) // ���
    ),
    ( // ������ ������ - �������� �������������
     (NP: 4; Row: 19), // �-76
     (NP: 5; Row: 20),  // A-80
     (NP: 6; Row: 21), // A-92
     (NP: 7; Row: 22), // A-95
     (NP: 3; Row: 23), // ��
     (NP: 63; Row: 24), // ������ �������
     (NP: 8; Row: 25), // �����
     (NP: 9; Row: 26), // ������
     (NP: 62; Row: 27) // ���
    ),
    ( // ������ ������ - ������ ���. ��������
     (NP: 4; Row: 29), // �-76
     (NP: 5; Row: 30),  // A-80
     (NP: 6; Row: 31), // A-92
     (NP: 7; Row: 32), // A-95
     (NP: 3; Row: 33), // ��
     (NP: 63; Row: 34), // ������ �������
     (NP: 8; Row: 35), // �����
     (NP: 9; Row: 36), // ������
     (NP: 62; Row: 37) // ���
    ),
    ( // ��������� ������ - ������������ ������������
     (NP: 4; Row: 39), // �-76
     (NP: 5; Row: 40),  // A-80
     (NP: 6; Row: 41), // A-92
     (NP: 7; Row: 42), // A-95
     (NP: 3; Row: 43), // ��
     (NP: 63; Row: 44), // ������ �������
     (NP: 8; Row: 45), // �����
     (NP: 9; Row: 46), // ������
     (NP: 62; Row: 47) // ���
    )
   );
var IWorkbook: Excel8TLB._Workbook;
    List: variant;

    CurRow: integer;
    WorkRow: integer;
    FilialCount: integer;

    i, j, z: integer;
    SumString: string;

    OldFilialID: integer;
begin
 try
  CreateExcel(false);

  // ������� ����� ��� ����������� �������� �������� ������
  ProgrForm:= TProgrForm.Create(Self);

  with ProgrForm do
   begin
    Progress:= 0;
    MaxValue:= 100;
    Show;
    Self.Repaint;
    Repaint;
   end;

  ProgrForm.AddProgress(5);

  with qReport6 do
   begin
    Close;

    ParamByName('DepID').Value:= pOrgID;
    ParamByName('DepINST').Value:= pOrgINST;
    ParamByName('BeginDate').Value:= DateEdit1.Date;
    ParamByName('EndDate').Value:= DateEdit2.Date;

    Prepare;
    Open;
   end;

  ProgrForm.AddProgress(65);

  try
   if Assigned(IXLSApp) then
    begin
     IWorkbook:= AddWorkbook(GetMainDir+'pattern\wbCirculatingSheet.xls');

     try
      List:= IWorkbook.ActiveSheet as Excel8TLB._Worksheet;

      // �����������, ��� ������
      List.Cells[1,1]:= GetOrgName(Main.Main_Id,Main.Inst) + '; ' +
                        DateToStr(Date) + '; ' + TimeToStr(Time);

      List.Cells[3, 2]:= GetOrgName(pOrgID, pOrgINST);

      // ������
      List.Cells[4, 2]:= TranslateText('�� ������ c ') + DateEdit1.Text + TranslateText(' �� ') +  DateEdit2.Text;;

      // �������������� ����������-�������
      OldFilialID:= 0;

      // �������������� �������� �����
      CurRow:= RowOffSet - 50;  // !!!!!!!!!!!!!!!!
      FilialCount:= -1;

      QReport6.First;

      // ���������� �����
      // ��������� �������� ��������
      while not QReport6.EOF do
       begin
        if OldFilialID <> QReport6FILIALID.AsInteger then
         begin // ������� ����� ������ � ����� ������
          Inc(CurRow, 50); // !!!!!!!!!!!!!!!!!!!
          Inc(FilialCount);

          // ��������� ����� ��� ����� ��� �������
          List.Cells[CurRow, 1]:= QReport6FILIALNAME.AsString;
          List.Cells[CurRow, 1].Font.Bold:= true;
          List.Cells[CurRow, 1].HorizontalAlignment:= xlHAlignCenter;
          List.Cells[CurRow, 1].VerticalAlignment:= xlHAlignCenter;
          List.Cells[CurRow, 1].Orientation:= xlUpWard;
          List.Range['A' + IntToStr(CurRow),'A' + IntToStr(CurRow + 39)].MergeCells:= True;
          List.Range['A' + IntToStr(CurRow),'A' + IntToStr(CurRow + 39)].Borders.LineStyle:= 1;
//          List.Range['A' + IntToStr(CurRow),'A' + IntToStr(CurRow + 39)].Borders.Weight:= xlThick;

          List.Cells[CurRow, 2]:= TranslateText('�������� ���������');
          List.Cells[CurRow, 2].Font.Bold:= true;
          List.Cells[CurRow, 2].HorizontalAlignment:= xlHAlignCenter;
          List.Cells[CurRow, 2].VerticalAlignment:= xlHAlignCenter;
          List.Range['B' + IntToStr(CurRow),'B' + IntToStr(CurRow + 9)].MergeCells:= True;
          List.Range['B' + IntToStr(CurRow),'O' + IntToStr(CurRow + 9)].Borders.LineStyle:= 1;
//          List.Range['B' + IntToStr(CurRow),'O' + IntToStr(CurRow + 9)].Borders.Weight:= xlThick;
//          List.Range['B' + IntToStr(CurRow),'O' + IntToStr(CurRow + 9)].Borders[xlInsideHorizontal].Weight:= xlThin;
//          List.Range['B' + IntToStr(CurRow),'O' + IntToStr(CurRow + 9)].Borders[xlInsideVertical].Weight:= xlThin;
           List.Cells[CurRow, 3]:= TranslateText('�-76');
           List.Cells[CurRow + 1, 3]:= TranslateText('�-80');
           List.Cells[CurRow + 2, 3]:= TranslateText('�-92');
           List.Cells[CurRow + 3, 3]:= TranslateText('�-95');
           List.Cells[CurRow + 4, 3]:= TranslateText('��');
           List.Cells[CurRow + 5, 3]:= TranslateText('������');
           List.Cells[CurRow + 6, 3]:= TranslateText('�����');
           List.Cells[CurRow + 7, 3]:= TranslateText('������');
           List.Cells[CurRow + 8, 3]:= TranslateText('���');

           List.Cells[CurRow + 9, 3]:= TranslateText('�����');
           List.Range['A' + IntToStr(CurRow + 9),
                      'O' + IntToStr(CurRow + 9)].Font.Bold:= true;
           for i:= 4 to 15 do
            List.Cells[CurRow + 9, i]:=  '=SUBTOTAL(9;' + ExcelStr(i) + IntToStr(CurRow) +
                                          ':' +  ExcelStr(i) + IntToStr(CurRow + 8) + ')';


          List.Cells[CurRow + 10, 2]:= TranslateText('�������� ���������');
          List.Cells[CurRow + 10, 2].Font.Bold:= true;
          List.Cells[CurRow + 10, 2].HorizontalAlignment:= xlHAlignCenter;
          List.Cells[CurRow + 10, 2].VerticalAlignment:= xlHAlignCenter;
          List.Range['B' + IntToStr(CurRow + 10),'B' + IntToStr(CurRow + 19)].MergeCells:= True;
          List.Range['B' + IntToStr(CurRow + 10),'O' + IntToStr(CurRow + 19)].Borders.LineStyle:= 1;
//          List.Range['B' + IntToStr(CurRow + 10),'O' + IntToStr(CurRow + 19)].Borders.Weight:= xlThick;
//          List.Range['B' + IntToStr(CurRow + 10),'O' + IntToStr(CurRow + 19)].Borders[xlInsideHorizontal].Weight:= xlThin;
//          List.Range['B' + IntToStr(CurRow + 10),'O' + IntToStr(CurRow + 19)].Borders[xlInsideVertical].Weight:= xlThin;
           List.Cells[CurRow + 10, 3]:= TranslateText('�-76');
           List.Cells[CurRow + 11, 3]:= TranslateText('�-80');
           List.Cells[CurRow + 12, 3]:= TranslateText('�-92');
           List.Cells[CurRow + 13, 3]:= TranslateText('�-95');
           List.Cells[CurRow + 14, 3]:= TranslateText('��');
           List.Cells[CurRow + 15, 3]:= TranslateText('������');
           List.Cells[CurRow + 16, 3]:= TranslateText('�����');
           List.Cells[CurRow + 17, 3]:= TranslateText('������');
           List.Cells[CurRow + 18, 3]:= TranslateText('���');

           List.Cells[CurRow + 19, 3]:= TranslateText('�����');
           List.Range['A' + IntToStr(CurRow + 19),
                      'O' + IntToStr(CurRow + 19)].Font.Bold:= true;
           for i:= 4 to 15 do
            List.Cells[CurRow + 19, i]:=  '=SUBTOTAL(9;' + ExcelStr(i) + IntToStr(CurRow + 10) +
                                          ':' +  ExcelStr(i) + IntToStr(CurRow + 18) + ')';


          List.Cells[CurRow + 20, 2]:= TranslateText('������ ���. ��������');
          List.Cells[CurRow + 20, 2].Font.Bold:= true;
          List.Cells[CurRow + 20, 2].HorizontalAlignment:= xlHAlignCenter;
          List.Cells[CurRow + 20, 2].VerticalAlignment:= xlHAlignCenter;
          List.Range['B' + IntToStr(CurRow + 20),'B' + IntToStr(CurRow + 29)].MergeCells:= True;
          List.Range['B' + IntToStr(CurRow + 20),'O' + IntToStr(CurRow + 29)].Borders.LineStyle:= 1;
//          List.Range['B' + IntToStr(CurRow + 20),'O' + IntToStr(CurRow + 29)].Borders.Weight:= xlThick;
//          List.Range['B' + IntToStr(CurRow + 20),'O' + IntToStr(CurRow + 29)].Borders[xlInsideHorizontal].Weight:= xlThin;
//          List.Range['B' + IntToStr(CurRow + 20),'O' + IntToStr(CurRow + 29)].Borders[xlInsideVertical].Weight:= xlThin;
           List.Cells[CurRow + 20, 3]:= TranslateText('�-76');
           List.Cells[CurRow + 21, 3]:= TranslateText('�-80');
           List.Cells[CurRow + 22, 3]:= TranslateText('�-92');
           List.Cells[CurRow + 23, 3]:= TranslateText('�-95');
           List.Cells[CurRow + 24, 3]:= TranslateText('��');
           List.Cells[CurRow + 25, 3]:= TranslateText('������');
           List.Cells[CurRow + 26, 3]:= TranslateText('�����');
           List.Cells[CurRow + 27, 3]:= TranslateText('������');
           List.Cells[CurRow + 28, 3]:= TranslateText('���');

           List.Cells[CurRow + 29, 3]:= TranslateText('�����');
           List.Range['A' + IntToStr(CurRow + 29),
                      'O' + IntToStr(CurRow + 29)].Font.Bold:= true;
           for i:= 4 to 15 do
            List.Cells[CurRow + 29, i]:=  '=SUBTOTAL(9;' + ExcelStr(i) + IntToStr(CurRow + 20) +
                                          ':' +  ExcelStr(i) + IntToStr(CurRow + 28) + ')';


          List.Cells[CurRow + 30, 2]:= TranslateText('������������ ������������');
          List.Cells[CurRow + 30, 2].Font.Bold:= true;
          List.Cells[CurRow + 30, 2].HorizontalAlignment:= xlHAlignCenter;
          List.Cells[CurRow + 30, 2].VerticalAlignment:= xlHAlignCenter;
          List.Range['B' + IntToStr(CurRow + 30),'B' + IntToStr(CurRow + 39)].MergeCells:= True;
          List.Range['B' + IntToStr(CurRow + 30),'O' + IntToStr(CurRow + 39)].Borders.LineStyle:= 1;
//          List.Range['B' + IntToStr(CurRow + 30),'O' + IntToStr(CurRow + 39)].Borders.Weight:= xlThick;
//          List.Range['B' + IntToStr(CurRow + 30),'O' + IntToStr(CurRow + 39)].Borders[xlInsideHorizontal].Weight:= xlThin;
//          List.Range['B' + IntToStr(CurRow + 30),'O' + IntToStr(CurRow + 39)].Borders[xlInsideVertical].Weight:= xlThin;
           List.Cells[CurRow + 30, 3]:= TranslateText('�-76');
           List.Cells[CurRow + 31, 3]:= TranslateText('�-80');
           List.Cells[CurRow + 32, 3]:= TranslateText('�-92');
           List.Cells[CurRow + 33, 3]:= TranslateText('�-95');
           List.Cells[CurRow + 34, 3]:= TranslateText('��');
           List.Cells[CurRow + 35, 3]:= TranslateText('������');
           List.Cells[CurRow + 36, 3]:= TranslateText('�����');
           List.Cells[CurRow + 37, 3]:= TranslateText('������');
           List.Cells[CurRow + 38, 3]:= TranslateText('���');

           List.Cells[CurRow + 39, 3]:= TranslateText('�����');
           List.Range['A' + IntToStr(CurRow + 39),
                      'O' + IntToStr(CurRow + 39)].Font.Bold:= true;
           for i:= 4 to 15 do
            List.Cells[CurRow + 39, i]:=  '=SUBTOTAL(9;' + ExcelStr(i) + IntToStr(CurRow + 30) +
                                          ':' +  ExcelStr(i) + IntToStr(CurRow + 38) + ')';


          List.Cells[CurRow + 40, 1]:= TranslateText('����� �� �������');
          List.Cells[CurRow + 40, 1].Font.Bold:= true;
          List.Cells[CurRow + 40, 1].Font.Size:= 12;
          List.Cells[CurRow + 40, 1].HorizontalAlignment:= xlHAlignCenter;
          List.Cells[CurRow + 40, 1].VerticalAlignment:= xlHAlignCenter;
          List.Range['A' + IntToStr(CurRow + 40),'B' + IntToStr(CurRow + 49)].MergeCells:= True;
          List.Range['A' + IntToStr(CurRow + 40),'O' + IntToStr(CurRow + 49)].Borders.LineStyle:= 1;
//          List.Range['A' + IntToStr(CurRow + 40),'O' + IntToStr(CurRow + 49)].Borders.Weight:= xlThick;
//          List.Range['A' + IntToStr(CurRow + 40),'O' + IntToStr(CurRow + 49)].Borders[xlInsideHorizontal].Weight:= xlThin;
//          List.Range['A' + IntToStr(CurRow + 40),'O' + IntToStr(CurRow + 49)].Borders[xlInsideVertical].Weight:= xlThin;
           List.Cells[CurRow + 40, 3]:= TranslateText('�-76');
           List.Cells[CurRow + 40, 3].Font.Bold:= true;
           List.Cells[CurRow + 41, 3]:= TranslateText('�-80');
           List.Cells[CurRow + 41, 3].Font.Bold:= true;
           List.Cells[CurRow + 42, 3]:= TranslateText('�-92');
           List.Cells[CurRow + 42, 3].Font.Bold:= true;
           List.Cells[CurRow + 43, 3]:= TranslateText('�-95');
           List.Cells[CurRow + 43, 3].Font.Bold:= true;
           List.Cells[CurRow + 44, 3]:= TranslateText('��');
           List.Cells[CurRow + 44, 3].Font.Bold:= true;
           List.Cells[CurRow + 45, 3]:= TranslateText('������');
           List.Cells[CurRow + 45, 3].Font.Bold:= true;
           List.Cells[CurRow + 46, 3]:= TranslateText('�����');
           List.Cells[CurRow + 46, 3].Font.Bold:= true;
           List.Cells[CurRow + 47, 3]:= TranslateText('������');
           List.Cells[CurRow + 47, 3].Font.Bold:= true;
           List.Cells[CurRow + 48, 3]:= TranslateText('���');
           List.Cells[CurRow + 48, 3].Font.Bold:= true;
           List.Cells[CurRow + 49, 3]:= TranslateText('�����');
           List.Range['A' + IntToStr(CurRow + 49),
                      'O' + IntToStr(CurRow + 49)].Font.Bold:= true;

          for i:= 4 to 15 do
           begin
            List.Cells[CurRow + 40, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 10) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 20) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 30);

            List.Cells[CurRow + 41, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 1) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 11) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 21) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 31);

            List.Cells[CurRow + 42, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 2) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 12) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 22) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 32);

            List.Cells[CurRow + 43, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 3) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 13) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 23) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 33);

            List.Cells[CurRow + 44, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 4) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 14) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 24) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 34);

            List.Cells[CurRow + 45, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 5) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 15) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 25) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 35);

            List.Cells[CurRow + 46, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 6) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 16) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 26) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 36);

            List.Cells[CurRow + 47, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 7) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 17) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 27) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 37);

            List.Cells[CurRow + 48, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 8) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 18) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 28) +
                                          '+' + ExcelStr(i) + IntToStr(CurRow + 38);

            // ��� �� �������� ��������� SubTotal ��� ������� ���� ��������� ������� �
            // "������->���������->�������->�������������� ������ � ������ Excel ��� �����"
            List.Cells[CurRow + 49, i]:=  '=SUBTOTAL(9;' + ExcelStr(i) + IntToStr(CurRow + 40) +
                                          ':' + ExcelStr(i) + IntToStr(CurRow + 48) + ')';
           end;

          // ������� ������
          for i:= 1 to 9 do
           if NPPrices[QReport6GROUPNUMBER.AsInteger, i].NP = QReport6NPTYPE.AsInteger then
            begin
             WorkRow:= NPPrices[QReport6GROUPNUMBER.AsInteger, i].Row + (FilialCount * 50);

             // ������ �������
             List.Cells[WorkRow, 4]:= QReport6RESTLITRES.AsFloat;

             if VarToStr(List.Cells[WorkRow, 4]) <> '0' then
              List.Cells[WorkRow, 5]:= QReport6RESTTONNS.AsFloat
             else
              List.Cells[WorkRow, 5]:= 0;

             if VarToStr(List.Cells[WorkRow, 4]) <> '0' then
              List.Cells[WorkRow, 6]:= QReport6RESTAMOUNT.AsFloat
             else
              List.Cells[WorkRow, 6]:= 0;

             // ������ ������
             List.Cells[WorkRow, 7]:= QReport6PRIHODLITRES.AsFloat;
             List.Cells[WorkRow, 8]:= QReport6PRIHODTONNS.AsFloat;
             List.Cells[WorkRow, 9]:= QReport6PRIHODAMOUNT.AsFloat;

             // ������ ������
             List.Cells[WorkRow, 10]:= QReport6RASHODLITRES.AsFloat;
             List.Cells[WorkRow, 11]:= QReport6RASHODTONNS.AsFloat;
             List.Cells[WorkRow, 12]:= QReport6RASHODAMOUNT.AsFloat;

             // ��������� �������� �����
             List.Cells[WorkRow, 13]:= '= D' + IntToStr(WorkRow) +
                                       ' + G' + IntToStr(WorkRow) +
                                       ' - J' + IntToStr(WorkRow);

             if VarToStr(List.Cells[WorkRow, 13]) <> '0' then
              List.Cells[WorkRow, 14]:= '= E' + IntToStr(WorkRow) +
                                        ' + H' + IntToStr(WorkRow) +
                                        ' - K' + IntToStr(WorkRow)
             else
              List.Cells[WorkRow, 14]:= 0;

             if VarToStr(List.Cells[WorkRow, 13]) <> '0' then
              List.Cells[WorkRow, 15]:= '= F' + IntToStr(WorkRow) +
                                        ' + I' + IntToStr(WorkRow) +
                                        ' - L' + IntToStr(WorkRow)
             else
              List.Cells[WorkRow, 15]:= 0;
            end;

          OldFilialID:= QReport6FILIALID.AsInteger;
         end
        else
         begin // ���������� �� ������ ��������
          // ������� ������
          for i:= 1 to 9 do
           if NPPrices[QReport6GROUPNUMBER.AsInteger, i].NP = QReport6NPTYPE.AsInteger then
            begin
             WorkRow:= NPPrices[QReport6GROUPNUMBER.AsInteger, i].Row + (FilialCount * 50);

             // ������ �������
             List.Cells[WorkRow, 4]:= QReport6RESTLITRES.AsFloat;

             if VarToStr(List.Cells[WorkRow, 4]) <> '0' then
              List.Cells[WorkRow, 5]:= QReport6RESTTONNS.AsFloat
             else
              List.Cells[WorkRow, 5]:= 0;

             if VarToStr(List.Cells[WorkRow, 4]) <> '0' then
              List.Cells[WorkRow, 6]:= QReport6RESTAMOUNT.AsFloat
             else
              List.Cells[WorkRow, 6]:= 0;

             // ������ ������
             List.Cells[WorkRow, 7]:= QReport6PRIHODLITRES.AsFloat;
             List.Cells[WorkRow, 8]:= QReport6PRIHODTONNS.AsFloat;
             List.Cells[WorkRow, 9]:= QReport6PRIHODAMOUNT.AsFloat;

             // ������ ������
             List.Cells[WorkRow, 10]:= QReport6RASHODLITRES.AsFloat;
             List.Cells[WorkRow, 11]:= QReport6RASHODTONNS.AsFloat;
             List.Cells[WorkRow, 12]:= QReport6RASHODAMOUNT.AsFloat;

             // ��������� �������� �����
             List.Cells[WorkRow, 13]:= '= D' + IntToStr(WorkRow) +
                                       ' + G' + IntToStr(WorkRow) +
                                       ' - J' + IntToStr(WorkRow);

             if VarToStr(List.Cells[WorkRow, 13]) <> '0' then
              List.Cells[WorkRow, 14]:= '= E' + IntToStr(WorkRow) +
                                        ' + H' + IntToStr(WorkRow) +
                                        ' - K' + IntToStr(WorkRow)
             else
              List.Cells[WorkRow, 14]:= 0;

             if VarToStr(List.Cells[WorkRow, 13]) <> '0' then
              List.Cells[WorkRow, 15]:= '= F' + IntToStr(WorkRow) +
                                        ' + I' + IntToStr(WorkRow) +
                                        ' - L' + IntToStr(WorkRow)
             else
              List.Cells[WorkRow, 15]:= 0;
            end;
         end;

        QReport6.Next;
       end;

      // ��������� ������� �� ���
      Inc(CurRow, 50);

      List.Cells[CurRow, 1]:= TranslateText('����� �� ���');
      List.Cells[CurRow, 1].Font.Bold:= true;
      List.Cells[CurRow, 1].HorizontalAlignment:= xlHAlignCenter;
      List.Cells[CurRow, 1].VerticalAlignment:= xlHAlignCenter;
      List.Cells[CurRow, 1].Orientation:= xlUpWard;
      List.Range['A' + IntToStr(CurRow),'A' + IntToStr(CurRow + 39)].MergeCells:= True;
      List.Range['A' + IntToStr(CurRow),'A' + IntToStr(CurRow + 39)].Borders.LineStyle:= 1;

      List.Cells[CurRow, 2]:= TranslateText('�������� ���������');
      List.Cells[CurRow, 2].Font.Bold:= true;
      List.Cells[CurRow, 2].HorizontalAlignment:= xlHAlignCenter;
      List.Cells[CurRow, 2].VerticalAlignment:= xlHAlignCenter;
      List.Range['B' + IntToStr(CurRow),'B' + IntToStr(CurRow + 9)].MergeCells:= True;
      List.Range['B' + IntToStr(CurRow),'O' + IntToStr(CurRow + 9)].Borders.LineStyle:= 1;
      List.Cells[CurRow, 3]:= TranslateText('�-76');
      List.Cells[CurRow + 1, 3]:= TranslateText('�-80');
      List.Cells[CurRow + 2, 3]:= TranslateText('�-92');
      List.Cells[CurRow + 3, 3]:= TranslateText('�-95');
      List.Cells[CurRow + 4, 3]:= TranslateText('��');
      List.Cells[CurRow + 5, 3]:= TranslateText('������');
      List.Cells[CurRow + 6, 3]:= TranslateText('�����');
      List.Cells[CurRow + 7, 3]:= TranslateText('������');
      List.Cells[CurRow + 8, 3]:= TranslateText('���');

      List.Cells[CurRow + 9, 3]:= TranslateText('�����');
      List.Range['A' + IntToStr(CurRow + 9),
                 'O' + IntToStr(CurRow + 9)].Font.Bold:= true;

      for i:= 4 to 15 do
       List.Cells[CurRow + 9, i]:=  '=SUBTOTAL(9;' + ExcelStr(i) + IntToStr(CurRow) +
                                     ':' +  ExcelStr(i) + IntToStr(CurRow + 8) + ')';


      List.Cells[CurRow + 10, 2]:= TranslateText('�������� ���������');
      List.Cells[CurRow + 10, 2].Font.Bold:= true;
      List.Cells[CurRow + 10, 2].HorizontalAlignment:= xlHAlignCenter;
      List.Cells[CurRow + 10, 2].VerticalAlignment:= xlHAlignCenter;
      List.Range['B' + IntToStr(CurRow + 10),'B' + IntToStr(CurRow + 19)].MergeCells:= True;
      List.Range['B' + IntToStr(CurRow + 10),'O' + IntToStr(CurRow + 19)].Borders.LineStyle:= 1;
      List.Cells[CurRow + 10, 3]:= TranslateText('�-76');
      List.Cells[CurRow + 11, 3]:= TranslateText('�-80');
      List.Cells[CurRow + 12, 3]:= TranslateText('�-92');
      List.Cells[CurRow + 13, 3]:= TranslateText('�-95');
      List.Cells[CurRow + 14, 3]:= TranslateText('��');
      List.Cells[CurRow + 15, 3]:= TranslateText('������');
      List.Cells[CurRow + 16, 3]:= TranslateText('�����');
      List.Cells[CurRow + 17, 3]:= TranslateText('������');
      List.Cells[CurRow + 18, 3]:= TranslateText('���');

      List.Cells[CurRow + 19, 3]:= TranslateText('�����');
      List.Range['A' + IntToStr(CurRow + 19),
                 'O' + IntToStr(CurRow + 19)].Font.Bold:= true;

      for i:= 4 to 15 do
       List.Cells[CurRow + 19, i]:=  '=SUBTOTAL(9;' + ExcelStr(i) + IntToStr(CurRow + 10) +
                                     ':' +  ExcelStr(i) + IntToStr(CurRow + 18) + ')';


      List.Cells[CurRow + 20, 2]:= TranslateText('������ ���. ��������');
      List.Cells[CurRow + 20, 2].Font.Bold:= true;
      List.Cells[CurRow + 20, 2].HorizontalAlignment:= xlHAlignCenter;
      List.Cells[CurRow + 20, 2].VerticalAlignment:= xlHAlignCenter;
      List.Range['B' + IntToStr(CurRow + 20),'B' + IntToStr(CurRow + 29)].MergeCells:= True;
      List.Range['B' + IntToStr(CurRow + 20),'O' + IntToStr(CurRow + 29)].Borders.LineStyle:= 1;
      List.Cells[CurRow + 20, 3]:= TranslateText('�-76');
      List.Cells[CurRow + 21, 3]:= TranslateText('�-80');
      List.Cells[CurRow + 22, 3]:= TranslateText('�-92');
      List.Cells[CurRow + 23, 3]:= TranslateText('�-95');
      List.Cells[CurRow + 24, 3]:= TranslateText('��');
      List.Cells[CurRow + 25, 3]:= TranslateText('������');
      List.Cells[CurRow + 26, 3]:= TranslateText('�����');
      List.Cells[CurRow + 27, 3]:= TranslateText('������');
      List.Cells[CurRow + 28, 3]:= TranslateText('���');

      List.Cells[CurRow + 29, 3]:= TranslateText('�����');
      List.Range['A' + IntToStr(CurRow + 29),
                 'O' + IntToStr(CurRow + 29)].Font.Bold:= true;

      for i:= 4 to 15 do
       List.Cells[CurRow + 29, i]:=  '=SUBTOTAL(9;' + ExcelStr(i) + IntToStr(CurRow + 20) +
                                     ':' +  ExcelStr(i) + IntToStr(CurRow + 28) + ')';


      List.Cells[CurRow + 30, 2]:= TranslateText('������������ ������������');
      List.Cells[CurRow + 30, 2].Font.Bold:= true;
      List.Cells[CurRow + 30, 2].HorizontalAlignment:= xlHAlignCenter;
      List.Cells[CurRow + 30, 2].VerticalAlignment:= xlHAlignCenter;
      List.Range['B' + IntToStr(CurRow + 30),'B' + IntToStr(CurRow + 39)].MergeCells:= True;
      List.Range['B' + IntToStr(CurRow + 30),'O' + IntToStr(CurRow + 39)].Borders.LineStyle:= 1;
      List.Cells[CurRow + 30, 3]:= TranslateText('�-76');
      List.Cells[CurRow + 31, 3]:= TranslateText('�-80');
      List.Cells[CurRow + 32, 3]:= TranslateText('�-92');
      List.Cells[CurRow + 33, 3]:= TranslateText('�-95');
      List.Cells[CurRow + 34, 3]:= TranslateText('��');
      List.Cells[CurRow + 35, 3]:= TranslateText('������');
      List.Cells[CurRow + 36, 3]:= TranslateText('�����');
      List.Cells[CurRow + 37, 3]:= TranslateText('������');
      List.Cells[CurRow + 38, 3]:= TranslateText('���');

      List.Cells[CurRow + 39, 3]:= TranslateText('�����');
      List.Range['A' + IntToStr(CurRow + 39),
                 'O' + IntToStr(CurRow + 39)].Font.Bold:= true;

      for i:= 4 to 15 do
       List.Cells[CurRow + 39, i]:=  '=SUBTOTAL(9;' + ExcelStr(i) + IntToStr(CurRow + 30) +
                                     ':' +  ExcelStr(i) + IntToStr(CurRow + 38) + ')';


      List.Cells[CurRow + 40, 1]:= TranslateText('����� �� ���');
      List.Cells[CurRow + 40, 1].Font.Bold:= true;
      List.Cells[CurRow + 40, 1].Font.Size:= 12;
      List.Cells[CurRow + 40, 1].HorizontalAlignment:= xlHAlignCenter;
      List.Cells[CurRow + 40, 1].VerticalAlignment:= xlHAlignCenter;
      List.Range['A' + IntToStr(CurRow + 40),'B' + IntToStr(CurRow + 49)].MergeCells:= True;
      List.Range['A' + IntToStr(CurRow + 40),'O' + IntToStr(CurRow + 49)].Borders.LineStyle:= 1;
      List.Cells[CurRow + 40, 3]:= TranslateText('�-76');
      List.Cells[CurRow + 40, 3].Font.Bold:= true;
      List.Cells[CurRow + 41, 3]:= TranslateText('�-80');
      List.Cells[CurRow + 41, 3].Font.Bold:= true;
      List.Cells[CurRow + 42, 3]:= TranslateText('�-92');
      List.Cells[CurRow + 42, 3].Font.Bold:= true;
      List.Cells[CurRow + 43, 3]:= TranslateText('�-95');
      List.Cells[CurRow + 43, 3].Font.Bold:= true;
      List.Cells[CurRow + 44, 3]:= TranslateText('��');
      List.Cells[CurRow + 44, 3].Font.Bold:= true;
      List.Cells[CurRow + 45, 3]:= TranslateText('������');
      List.Cells[CurRow + 45, 3].Font.Bold:= true;
      List.Cells[CurRow + 46, 3]:= TranslateText('�����');
      List.Cells[CurRow + 46, 3].Font.Bold:= true;
      List.Cells[CurRow + 47, 3]:= TranslateText('������');
      List.Cells[CurRow + 47, 3].Font.Bold:= true;
      List.Cells[CurRow + 48, 3]:= TranslateText('���');
      List.Cells[CurRow + 48, 3].Font.Bold:= true;
      List.Cells[CurRow + 49, 3]:= TranslateText('�����');
      List.Range['A' + IntToStr(CurRow + 49),
                 'O' + IntToStr(CurRow + 49)].Font.Bold:= true;

      for i:= 4 to 15 do
       begin
        List.Cells[CurRow + 40, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 10) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 20) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 30);

        List.Cells[CurRow + 41, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 1) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 11) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 21) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 31);

        List.Cells[CurRow + 42, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 2) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 12) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 22) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 32);

        List.Cells[CurRow + 43, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 3) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 13) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 23) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 33);

        List.Cells[CurRow + 44, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 4) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 14) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 24) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 34);

        List.Cells[CurRow + 45, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 5) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 15) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 25) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 35);

        List.Cells[CurRow + 46, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 6) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 16) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 26) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 36);

        List.Cells[CurRow + 47, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 7) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 17) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 27) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 37);

        List.Cells[CurRow + 48, i]:=  '=' + ExcelStr(i) + IntToStr(CurRow + 8) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 18) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 28) +
                                      '+' + ExcelStr(i) + IntToStr(CurRow + 38);

        // ��� �� �������� ��������� SubTotal ��� ������� ���� ��������� ������� �
        // "������->���������->�������->�������������� ������ � ������ Excel ��� �����"
        List.Cells[CurRow + 49, i]:=  '=SUBTOTAL(9;' + ExcelStr(i) + IntToStr(CurRow + 40) +
                                      ':' + ExcelStr(i) + IntToStr(CurRow + 48) + ')';
       end;

      // ������� ������
      for i:= 4 to 15 do
       for j:= RowOffSet to RowOffSet + 39 do
        begin
         if (j = 9 + RowOffSet) or
            (j = 19 + RowOffSet) or
            (j = 29 + RowOffSet) or
            (j = 39 + RowOffSet) then continue;

         SumString:= '=';

         for z:= 0 to FilialCount do
          SumString:= SumString + ExcelStr(i) + IntToStr(j + z * 50) + '+';

         SumString[Length(SumString)]:= ' ';

         List.Cells[((FilialCount + 1) * 50) + j, i]:= SumString;
        end;

      for i:= 4 to 15 do
       List.Columns[i].AutoFit;

      ProgrForm.AddProgress(30);

      ShowExcel;
     finally
      IWorkbook := nil;
     end;
    end;

  finally
   QReport6.Close;

   ProgrForm.Free;
  end;
 except
  on E:Exception do
   begin
    HideExcel;
    MessageDlg(TranslateText('������: ') + E.message, mtError, [mbOk], 0);
    ReleaseExcel;
   end;
 end;
end;

// ����� "������ ��� �� ������ �� ������ �2"
procedure TAutoReportsForm.Report3;
const RowOffSet = 9; // ������, � ������� ���������� ���������� ������
var IWorkbook: Excel8TLB._Workbook;
    List: variant;

    CurRow: integer;
    StartRow: integer;

    A76Rows: string; // ���������� ��� �������� ������� �����, � ������� ���������
    A80Rows: string; // ������ �� ��������� � ������ �������� ���������� �������
    A92Rows: string; // �������
    A95Rows: string;
    DTRows: string;
    OilRows: string;
    BurOilRows: string;
    GasRows: string;
    RestRows: string;

    i: integer;

    OldFilialID: integer;
begin
 try
  CreateExcel(false);

  // ������� ����� ��� ����������� �������� �������� ������
  ProgrForm:= TProgrForm.Create(Self);

  with ProgrForm do
   begin
    Progress:= 0;
    MaxValue:= 100;
    Show;
    Self.Repaint;
    Repaint;
   end;

  ProgrForm.AddProgress(5);

  with qReport7 do
   begin
    Close;

    ParamByName('DepID').Value:= pOrgID;
    ParamByName('DepINST').Value:= pOrgINST;
    ParamByName('BeginDate').Value:= DateEdit1.Date;
    ParamByName('EndDate').Value:= DateEdit2.Date;

    Prepare;
    Open;
   end;

  ProgrForm.AddProgress(65);

  try
   if Assigned(IXLSApp) then
    begin
     IWorkbook:= AddWorkbook(GetMainDir+'pattern\wbSecondGroupFull.xls');

     try
      List:= IWorkbook.ActiveSheet as Excel8TLB._Worksheet;

      // �����������, ��� ������
      List.Cells[1,1]:= GetOrgName(Main.Main_Id, Main.Inst) + '; ' +
                        DateToStr(Date) + '; ' + TimeToStr(Time);

      List.Cells[3, 2]:= GetOrgName(pOrgID, pOrgINST);

      // ������
      List.Cells[4, 2]:= TranslateText('�� ������ c ') + DateEdit1.Text + TranslateText(' �� ') +  DateEdit2.Text;;

      // �������������� �������� �����
      CurRow:= RowOffSet - 1;
      StartRow:= RowOffSet;

      // �������������� ����������-�������
      OldFilialID:= 0;

      QReport7.First;

      // ���������� �����
      // ��������� �������� ��������
      while not QReport7.EOF do
       begin
        if OldFilialID <> qReport7FILIALID.AsInteger then
         begin // ������� ����� ������
          if CurRow <> (RowOffSet - 1) then
           begin // ��������� �������� ������ �� �������
            if StartRow <> CurRow then
             List.Range['A' + IntToStr(StartRow), 'Q' + IntToStr(CurRow)].
              Borders[xlInsideHorizontal].LineStyle:= 1;

            List.Range['A' + IntToStr(StartRow), 'Q' + IntToStr(CurRow)].
             Borders[xlInsideVertical].LineStyle:= 1;

            List.Range['A' + IntToStr(StartRow), 'Q' + IntToStr(CurRow)].
             Borders[xlEdgeRight].LineStyle:= 1;
//            List.Range['A' + IntToStr(StartRow), 'Q' + IntToStr(CurRow)].
//             Borders[xlEdgeRight].Weight:= xlThick;

            List.Range['A' + IntToStr(StartRow), 'Q' + IntToStr(CurRow)].
             Borders[xlEdgeLeft].LineStyle:= 1;
//            List.Range['A' + IntToStr(StartRow), 'Q' + IntToStr(CurRow)].
//             Borders[xlEdgeLeft].Weight:= xlThick;

            inc(CurRow);

            List.Range['A' + IntToStr(CurRow), 'Q' + IntToStr(CurRow)].
             Borders.LineStyle:= 1;
//            List.Range['A' + IntToStr(CurRow), 'Q' + IntToStr(CurRow)].
//             Borders.Weight:= xlThick;

            List.Rows[CurRow].Font.Bold:= true;

            List.Cells[CurRow, 1]:= TranslateText('�����:');

            for i:= 3 to 17 do
             begin
              // ��� �� �������� ��������� SubTotal ��� ������� ���� ��������� ������� �
              // "������->���������->�������->�������������� ������ � ������ Excel ��� �����"
              List.Cells[CurRow, i]:=
               '=SUBTOTAL(9;' +  ExcelStr(i) + IntToStr(StartRow) +
                          ':' +  ExcelStr(i) + IntToStr(CurRow - 1) + ')';
             end;
           end;

          Inc(CurRow);

          // ������� ������
          List.Cells[CurRow, 1]:= qReport7FILIALNAME.AsString;
          List.Cells[CurRow, 2]:= qReport7NPNAME.AsString;

          List.Cells[CurRow, 3]:= '=' + 'F' + IntToStr(CurRow) + '+' +
                                        'I' + IntToStr(CurRow) + '+' +
                                        'L' + IntToStr(CurRow) + '+' +
                                        'O' + IntToStr(CurRow);
          List.Cells[CurRow, 4]:= '=' + 'G' + IntToStr(CurRow) + '+' +
                                        'J' + IntToStr(CurRow) + '+' +
                                        'M' + IntToStr(CurRow) + '+' +
                                        'P' + IntToStr(CurRow);
          List.Cells[CurRow, 5]:= '=' + 'H' + IntToStr(CurRow) + '+' +
                                        'K' + IntToStr(CurRow) + '+' +
                                        'N' + IntToStr(CurRow) + '+' +
                                        'Q' + IntToStr(CurRow);

          List.Cells[CurRow, 6]:= qReport7RASH_T_1.AsFloat;
          List.Cells[CurRow, 7]:= qReport7RASH_LT_1.AsFloat;
          List.Cells[CurRow, 8]:= qReport7COST_1.AsFloat;

          List.Cells[CurRow, 9]:= qReport7RASH_T_2.AsFloat;
          List.Cells[CurRow, 10]:= qReport7RASH_LT_2.AsFloat;
          List.Cells[CurRow, 11]:= qReport7COST_2.AsFloat;

          List.Cells[CurRow, 12]:= qReport7RASH_T_3.AsFloat;
          List.Cells[CurRow, 13]:= qReport7RASH_LT_3.AsFloat;
          List.Cells[CurRow, 14]:= qReport7COST_3.AsFloat;

          List.Cells[CurRow, 15]:= qReport7RASH_T_4.AsFloat;
          List.Cells[CurRow, 16]:= qReport7RASH_LT_4.AsFloat;
          List.Cells[CurRow, 17]:= qReport7COST_4.AsFloat;

          // ����������, ����� ��� ��� ��������
          case QReport7NPTYPE.AsInteger of
           4: A76Rows:= A76Rows + '*' + IntToStr(CurRow) + '+'; // �-76
           5: A80Rows:= A80Rows + '*' + IntToStr(CurRow) + '+'; // A-80
           6: A92Rows:= A92Rows + '*' + IntToStr(CurRow) + '+'; // A-92
           7: A95Rows:= A95Rows + '*' + IntToStr(CurRow) + '+'; // A-95
           3: DTRows:= DTRows + '*' + IntToStr(CurRow) + '+'; // ��
           8: OilRows:= OilRows + '*' + IntToStr(CurRow) + '+'; // �����
          63: BurOilRows:= BurOilRows + '*' + IntToStr(CurRow) + '+'; // ������ �������
          62: GasRows:= GasRows + '*' + IntToStr(CurRow) + '+'; // ���
           9: RestRows:= RestRows + '*' + IntToStr(CurRow) + '+'; // ������
          end;

          OldFilialID:= QReport7FILIALID.AsInteger;
          StartRow:= CurRow;
         end
        else
         begin // ���������� �� ������ ��������
          Inc(CurRow);

          // ������� ������
          List.Cells[CurRow, 2]:= qReport7NPNAME.AsString;

          List.Cells[CurRow, 3]:= '=' + 'F' + IntToStr(CurRow) + '+' +
                                        'I' + IntToStr(CurRow) + '+' +
                                        'L' + IntToStr(CurRow) + '+' +
                                        'O' + IntToStr(CurRow);
          List.Cells[CurRow, 4]:= '=' + 'G' + IntToStr(CurRow) + '+' +
                                        'J' + IntToStr(CurRow) + '+' +
                                        'M' + IntToStr(CurRow) + '+' +
                                        'P' + IntToStr(CurRow);
          List.Cells[CurRow, 5]:= '=' + 'H' + IntToStr(CurRow) + '+' +
                                        'K' + IntToStr(CurRow) + '+' +
                                        'N' + IntToStr(CurRow) + '+' +
                                        'Q' + IntToStr(CurRow);

          List.Cells[CurRow, 6]:= qReport7RASH_T_1.AsFloat;
          List.Cells[CurRow, 7]:= qReport7RASH_LT_1.AsFloat;
          List.Cells[CurRow, 8]:= qReport7COST_1.AsFloat;

          List.Cells[CurRow, 9]:= qReport7RASH_T_2.AsFloat;
          List.Cells[CurRow, 10]:= qReport7RASH_LT_2.AsFloat;
          List.Cells[CurRow, 11]:= qReport7COST_2.AsFloat;

          List.Cells[CurRow, 12]:= qReport7RASH_T_3.AsFloat;
          List.Cells[CurRow, 13]:= qReport7RASH_LT_3.AsFloat;
          List.Cells[CurRow, 14]:= qReport7COST_3.AsFloat;

          List.Cells[CurRow, 15]:= qReport7RASH_T_4.AsFloat;
          List.Cells[CurRow, 16]:= qReport7RASH_LT_4.AsFloat;
          List.Cells[CurRow, 17]:= qReport7COST_4.AsFloat;

          // ����������, ����� ��� ��� ��������
          case QReport7NPTYPE.AsInteger of
           4: A76Rows:= A76Rows + '*' + IntToStr(CurRow) + '+'; // �-76
           5: A80Rows:= A80Rows + '*' + IntToStr(CurRow) + '+'; // A-80
           6: A92Rows:= A92Rows + '*' + IntToStr(CurRow) + '+'; // A-92
           7: A95Rows:= A95Rows + '*' + IntToStr(CurRow) + '+'; // A-95
           3: DTRows:= DTRows + '*' + IntToStr(CurRow) + '+'; // ��
           8: OilRows:= OilRows + '*' + IntToStr(CurRow) + '+'; // �����
          63: BurOilRows:= BurOilRows + '*' + IntToStr(CurRow) + '+'; // ������ �������
          62: GasRows:= GasRows + '*' + IntToStr(CurRow) + '+'; // ���
           9: RestRows:= RestRows + '*' + IntToStr(CurRow) + '+'; // ������
          end;
         end;

        QReport7.Next;
       end;

      // ��������� ������
      if CurRow <> (RowOffSet - 1) then
       begin
        if StartRow <> CurRow then
         List.Range['A' + IntToStr(StartRow), 'Q' + IntToStr(CurRow)].
          Borders[xlInsideHorizontal].LineStyle:= 1;

        List.Range['A' + IntToStr(StartRow), 'Q' + IntToStr(CurRow)].
         Borders[xlInsideVertical].LineStyle:= 1;

        List.Range['A' + IntToStr(StartRow), 'Q' + IntToStr(CurRow)].
         Borders[xlEdgeRight].LineStyle:= 1;
//        List.Range['A' + IntToStr(StartRow), 'Q' + IntToStr(CurRow)].
//         Borders[xlEdgeRight].Weight:= xlThick;

        List.Range['A' + IntToStr(StartRow), 'Q' + IntToStr(CurRow)].
         Borders[xlEdgeLeft].LineStyle:= 1;
//        List.Range['A' + IntToStr(StartRow), 'Q' + IntToStr(CurRow)].
//         Borders[xlEdgeLeft].Weight:= xlThick;

        inc(CurRow);

        List.Range['A' + IntToStr(CurRow), 'Q' + IntToStr(CurRow)].
         Borders.LineStyle:= 1;
//        List.Range['A' + IntToStr(CurRow), 'Q' + IntToStr(CurRow)].
//         Borders.Weight:= xlThick;

        List.Rows[CurRow].Font.Bold:= true;

        List.Cells[CurRow, 1]:= TranslateText('�����:');

        for i:= 3 to 17 do
         begin
          // ��� �� �������� ��������� SubTotal ��� ������� ���� ��������� ������� �
          // "������->���������->�������->�������������� ������ � ������ Excel ��� �����"
          List.Cells[CurRow, i]:=
           '=SUBTOTAL(9;' +  ExcelStr(i) + IntToStr(StartRow) +
                      ':' +  ExcelStr(i) + IntToStr(CurRow - 1) + ')';
         end;
       end;

      inc(CurRow);

      List.Range['A' + IntToStr(CurRow), 'Q' + IntToStr(CurRow)].
       Borders[xlEdgeRight].LineStyle:= 1;
//      List.Range['A' + IntToStr(CurRow), 'Q' + IntToStr(CurRow)].
//       Borders[xlEdgeRight].Weight:= xlThick;

      List.Range['A' + IntToStr(CurRow), 'Q' + IntToStr(CurRow)].
       Borders[xlEdgeLeft].LineStyle:= 1;

      List.Range['A' + IntToStr(CurRow), 'Q' + IntToStr(CurRow)].
       Borders[xlInsideVertical].LineStyle:= 1;

      inc(CurRow);


      List.Cells[CurRow, 1]:= TranslateText('����� �� ���:');
      List.Range['A' + IntToStr(CurRow),'A' + IntToStr(CurRow + 8)].MergeCells:= True;
      List.Range['A' + IntToStr(CurRow),'A' + IntToStr(CurRow + 8)].HorizontalAlignment:= xlHAlignCenter;
      List.Range['A' + IntToStr(CurRow),'A' + IntToStr(CurRow + 8)].VerticalAlignment:= xlHAlignCenter;
      List.Rows[CurRow].Font.Bold:= true;
      List.Rows[CurRow + 1].Font.Bold:= true;
      List.Rows[CurRow + 2].Font.Bold:= true;
      List.Rows[CurRow + 3].Font.Bold:= true;
      List.Rows[CurRow + 4].Font.Bold:= true;
      List.Rows[CurRow + 5].Font.Bold:= true;
      List.Rows[CurRow + 6].Font.Bold:= true;
      List.Rows[CurRow + 7].Font.Bold:= true;
      List.Rows[CurRow + 8].Font.Bold:= true;
      List.Rows[CurRow + 9].Font.Bold:= true;

      Delete(A76Rows, Length(A76Rows), 1);
      Delete(A80Rows, Length(A80Rows), 1);
      Delete(A92Rows, Length(A92Rows), 1);
      Delete(A95Rows, Length(A95Rows), 1);
      Delete(DTRows, Length(DTRows), 1);
      Delete(OilRows, Length(OilRows), 1);
      Delete(BurOilRows, Length(BurOilRows), 1);
      Delete(RestRows, Length(RestRows), 1);
      Delete(GasRows, Length(GasRows), 1);

      List.Cells[CurRow, 2]:= TranslateText('�-76');
      if Length(A76Rows) > 0 then
       for i:= 3 to 17 do
        List.Cells[CurRow, i]:=
         '=' + StringReplace(A76Rows, '*', ExcelStr(i), [rfReplaceAll, rfIgnoreCase]);

      List.Cells[CurRow + 1, 2]:= TranslateText('�-80');
      if Length(A80Rows) > 0 then
       for i:= 3 to 17 do
        List.Cells[CurRow + 1, i]:=
         '=' + StringReplace(A80Rows, '*', ExcelStr(i), [rfReplaceAll, rfIgnoreCase]);

      List.Cells[CurRow + 2, 2]:= TranslateText('�-92');
      if Length(A92Rows) > 0 then
       for i:= 3 to 17 do
        List.Cells[CurRow + 2, i]:=
         '=' + StringReplace(A92Rows, '*', ExcelStr(i), [rfReplaceAll, rfIgnoreCase]);

      List.Cells[CurRow + 3, 2]:= TranslateText('�-95');
      if Length(A95Rows) > 0 then
       for i:= 3 to 17 do
        List.Cells[CurRow + 3, i]:=
         '=' + StringReplace(A95Rows, '*', ExcelStr(i), [rfReplaceAll, rfIgnoreCase]);

      List.Cells[CurRow + 4, 2]:= TranslateText('��');
      if Length(DTRows) > 0 then
       for i:= 3 to 17 do
        List.Cells[CurRow + 4, i]:=
         '=' + StringReplace(DTRows, '*', ExcelStr(i), [rfReplaceAll, rfIgnoreCase]);

      List.Cells[CurRow + 5, 2]:= TranslateText('�����');
      if Length(OilRows) > 0 then
       for i:= 3 to 17 do
        List.Cells[CurRow + 5, i]:=
         '=' + StringReplace(OilRows, '*', ExcelStr(i), [rfReplaceAll, rfIgnoreCase]);

      List.Cells[CurRow + 6, 2]:= TranslateText('������');
      if Length(BurOilRows) > 0 then
       for i:= 3 to 17 do
        List.Cells[CurRow + 6, i]:=
         '=' + StringReplace(BurOilRows, '*', ExcelStr(i), [rfReplaceAll, rfIgnoreCase]);

      List.Cells[CurRow + 7, 2]:= TranslateText('������');
      if Length(RestRows) > 0 then
       for i:= 3 to 17 do
        List.Cells[CurRow + 7, i]:=
         '=' + StringReplace(RestRows, '*', ExcelStr(i), [rfReplaceAll, rfIgnoreCase]);

      List.Cells[CurRow + 8, 2]:= TranslateText('���');
      if Length(GasRows) > 0 then
       for i:= 3 to 17 do
        List.Cells[CurRow + 8, i]:=
         '=' + StringReplace(GasRows, '*', ExcelStr(i), [rfReplaceAll, rfIgnoreCase]);

      List.Cells[CurRow + 9, 2]:= '�����';
      for i:= 3 to 17 do
       begin
        // ��� �� �������� ��������� SubTotal ��� ������� ���� ��������� ������� �
        // "������->���������->�������->�������������� ������ � ������ Excel ��� �����"
        List.Cells[CurRow + 9, i]:=
         '=SUBTOTAL(9;' +  ExcelStr(i) + IntToStr(CurRow) +
                    ':' +  ExcelStr(i) + IntToStr(CurRow + 8) + ')';
       end;

      List.Range['A' + IntToStr(CurRow),'Q' + IntToStr(CurRow + 8)].
       Borders[xlInsideVertical].LineStyle:= 1;
      List.Range['A' + IntToStr(CurRow),'Q' + IntToStr(CurRow + 8)].
       Borders[xlInsideHorizontal].LineStyle:= 1;

      List.Range['A' + IntToStr(CurRow),'Q' + IntToStr(CurRow + 9)].
       Borders.LineStyle:= 1;
//      List.Range['A' + IntToStr(CurRow),'Q' + IntToStr(CurRow + 9)].
//       Borders.Weight:= xlThick;

      for i:= 3 to 17 do
       List.Columns[i].AutoFit;

      ProgrForm.AddProgress(10);

      ShowExcel;
     finally
      IWorkbook := nil;
     end;
    end;

  finally
   QReport7.Close;

   ProgrForm.Free;
  end;
 except
  on E:Exception do
   begin
    HideExcel;
    MessageDlg(TranslateText('������: ') + E.message, mtError, [mbOk], 0);
    ReleaseExcel;
   end;
 end;
end;

// ������ "�������� ����� ������" ��� ����� �1 - �3
procedure TAutoReportsForm.Report4_6(Group: integer);
const RowOffSet = 11; // ������, � ������� ���������� ���������� ������
  // ������ �������� ��� ������ � ���������������
  // NP - ��� ������ � ������� ������ ������������
  // ColumnN - ����� ������� � ������� ��������� ������ ��
  //  N = 1 - ������� �� ������
  //  N = 2 - ������
  //  N = 3 - ������
  //  N = 4 - ������� �� �����
  //  ��� ���������� ������ �������������
  // Price - ���� ������ ������ �������������� - �������� �� �������
  NPPrices: array [1..10] of NPStruct =
   ((NP:  4; Column1:  5; Column2: 25; Column3: 45; Column4: 65), // �-76
    (NP:  5; Column1:  7; Column2: 27; Column3: 47; Column4: 67),  // A-80
    (NP:  6; Column1:  9; Column2: 29; Column3: 49; Column4: 69), // A-92
    (NP:  7; Column1: 11; Column2: 31; Column3: 51; Column4: 71), // A-95
    (NP:  3; Column1: 13; Column2: 33; Column3: 53; Column4: 73), // ��
    (NP:  8; Column1: 15; Column2: 35; Column3: 55; Column4: 75), // �����
    (NP: 63; Column1: 17; Column2: 37; Column3: 57; Column4: 77), // ������ �������
    (NP:  9; Column1: 19; Column2: 39; Column3: 59; Column4: 79), // ������
    (NP: 62; Column1: 21; Column2: 41; Column3: 61; Column4: 81), // ���
    (NP: -1; Column1: 23; Column2: 43; Column3: 63; Column4: 83)); // �����

var IWorkbook: Excel8TLB._Workbook;
    List: variant;

    CurRow: integer;
    StartRow: integer;
    SumRows: string;

    i: integer;

    OldDate: TDateTime;
    OldAutoNumber: string;
    OldAutoModel: string;
    OldAutoID: integer;
begin
 try
  log('������...');
  log('�������� ������');
  CreateExcel(false);


  // ������� ����� ��� ����������� �������� �������� ������
  log('������ �������� ���������');
  ProgrForm:= TProgrForm.Create(Self);

  with ProgrForm do
   begin
    Progress:= 0;
    MaxValue:= 100;
    Show;
    Self.Repaint;
    Repaint;
   end;

  ProgrForm.AddProgress(5);

  log('�������� �������������� ���: '+GetRepDatesDesc);
  with qReport2 do
   begin
    Close;

    ParamByName('FilialID').Value:= pOrgID;
    ParamByName('AutoGroup').Value:= Group;
    ParamByName('BeginDate').Value:= DateEdit1.Date;
    ParamByName('EndDate').Value:= DateEdit2.Date;

    log('�������� ������');
    log(#13#10+FullSqlText(qReport2));
    Open;
    log('������ ������; '+IntToStr(RecordCount)+' �������');

//    ShowTextInMemo(qReport2.Text);
   end;

  ProgrForm.AddProgress(65);

  try
   if Assigned(IXLSApp) then
    begin
     log('�������� ������� �����');
     case Group of
      1: IWorkbook:= AddWorkbook(GetMainDir+'pattern\wbCard1.xls');
      2: IWorkbook:= AddWorkbook(GetMainDir+'pattern\wbCard2.xls');
      3: IWorkbook:= AddWorkbook(GetMainDir+'pattern\wbCard3.xls');
     end;


     try
      log('������� ����');
      List:= IWorkbook.ActiveSheet as Excel8TLB._Worksheet;

      log('������ ����� ������');
      // �����������, ��� ������
      List.Cells[1, 1]:= GetOrgName(Main.Main_Id, Main.Inst) + '; ' +
                               DateToStr(Date) + '; ' + TimeToStr(Time);

      List.Cells[4, 2]:= GetOrgName(pOrgID, pOrgINST);

      // ������
      List.Cells[5, 2]:= TranslateText('�� ������ c ') + DateEdit1.Text + TranslateText(' �� ') +  DateEdit2.Text;;

      ProgrForm.AddProgress(10);

      // �������� �����
      // �������������� ����������-�������
      OldAutoNumber:= '-----------';
      OldAutoModel:= '-----------';
      OldAutoID:= -999;
      OldDate:= 0;

      // �������������� �������� �����
      CurRow:= RowOffSet - 1;
      StartRow:= RowOffSet;

      // ����� ����� ������� ������ ����� � ������� ��������� �������� ������
      // �� ��������� �������
      SumRows:= '';

      // ���������� �����
      // ��������� �������� ��������
      log('������� ����� ������');
      while not qReport2.EOF do
       begin
        if OldAutoID <> qReport2AUTOID.AsInteger then
         begin // �������� ����� ������ �, ��������������, ����� ����, ���!
          if CurRow <> (RowOffSet - 1) then
           begin // ��������� ����� �� ������� ���� � �� ������
           log('������ ����� �� id='+IntToStr(OldAutoID));
            List.Cells[CurRow, NPPrices[10].Column1]:=
              '= ' + ExcelStr(NPPrices[1].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column1) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column1 + 1]:=
              '= ' + ExcelStr(NPPrices[1].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column1 + 1) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column2]:=
              '= ' + ExcelStr(NPPrices[1].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column2) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column2 + 1]:=
              '= ' + ExcelStr(NPPrices[1].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column2 + 1) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column3]:=
              '= ' + ExcelStr(NPPrices[1].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column3) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column3 + 1]:=
              '= ' + ExcelStr(NPPrices[1].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column3 + 1) + IntToStr(CurRow);

            for i:= 1 to 10 do
             begin
              List.Cells[CurRow, NPPrices[i].Column4]:=
               '= ' + ExcelStr(NPPrices[i].Column1) + IntToStr(CurRow) + '+'
                    + ExcelStr(NPPrices[i].Column2) + IntToStr(CurRow) + '-'
                    + ExcelStr(NPPrices[i].Column3) + IntToStr(CurRow);

              if VarToStr(List.Cells[CurRow, NPPrices[i].Column4]) <> '0' then
               List.Cells[CurRow, NPPrices[i].Column4 + 1]:=
                '= ' + ExcelStr(NPPrices[i].Column1 + 1) + IntToStr(CurRow) + '+'
                     + ExcelStr(NPPrices[i].Column2 + 1) + IntToStr(CurRow) + '-'
                     + ExcelStr(NPPrices[i].Column3 + 1) + IntToStr(CurRow)
              else
               List.Cells[CurRow, NPPrices[i].Column4 + 1]:= 0;

             end;

            if StartRow <> CurRow then
             List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                        IntToStr(CurRow)].Borders[xlInsideHorizontal].LineStyle:= 1;

            List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                       IntToStr(CurRow)].Borders[xlInsideVertical].LineStyle:= 1;
            List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                       IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;
            List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                       IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;

            inc(CurRow);

            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                      IntToStr(CurRow)].Borders[xlEdgeBottom].LineStyle:= 1;
//            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                      IntToStr(CurRow)].Borders[xlEdgeBottom].Weight:= xlThick;

            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                      IntToStr(CurRow)].Borders[xlEdgeTop].LineStyle:= 1;
//            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                      IntToStr(CurRow)].Borders[xlEdgeTop].Weight:= xlThick;

            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                      IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;
//            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                      IntToStr(CurRow)].Borders[xlEdgeRight].Weight:= xlThick;

            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                      IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;
//            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                      IntToStr(CurRow)].Borders[xlEdgeLeft].Weight:= xlThick;

            List.Rows[CurRow].Borders[xlInsideVertical].LineStyle:= 1;

            List.Rows[CurRow].Font.Bold:= true;

            List.Cells[CurRow, 1]:= TranslateText('����� �� ') + OldAutoNumber;
            List.Range['A' + IntToStr(CurRow),'D' + IntToStr(CurRow)].MergeCells:= True;
            List.Range['A' + IntToStr(CurRow),'D' + IntToStr(CurRow)].HorizontalAlignment:= xlHAlignCenter;
            SumRows:= SumRows + '*' + IntToStr(CurRow) + '+';

            // ��������� �������� ������ �� ������
            for i:= 1 to 10 do
             begin
              List.Cells[CurRow, NPPrices[i].Column1].Value:=
               List.Cells[StartRow, NPPrices[i].Column1].Value;

              List.Cells[CurRow, NPPrices[i].Column1 + 1].Value:=
               List.Cells[StartRow, NPPrices[i].Column1 + 1].Value;
             end;

            for i:= NPPrices[1].Column2 to NPPrices[10].Column3 + 1 do
             begin
              // ��� �� �������� ��������� SubTotal ��� ������� ���� ��������� ������� �
              // "������->���������->�������->�������������� ������ � ������ Excel ��� �����"
              List.Cells[CurRow, i]:=
               '=SUBTOTAL(9;' +  ExcelStr(i) + IntToStr(StartRow) +
                          ':' +  ExcelStr(i) + IntToStr(CurRow - 1) + ')';
             end;

            for i:= 1 to 10 do
             begin
              List.Cells[CurRow, NPPrices[i].Column4]:=
               '= ' + ExcelStr(NPPrices[i].Column1) + IntToStr(CurRow) + '+'
                    + ExcelStr(NPPrices[i].Column2) + IntToStr(CurRow) + '-'
                    + ExcelStr(NPPrices[i].Column3) + IntToStr(CurRow);


              if VarToStr(List.Cells[CurRow, NPPrices[i].Column4]) <> '0' then
               List.Cells[CurRow, NPPrices[i].Column4 + 1]:=
                '= ' + ExcelStr(NPPrices[i].Column1 + 1) + IntToStr(CurRow) + '+'
                     + ExcelStr(NPPrices[i].Column2 + 1) + IntToStr(CurRow) + '-'
                     + ExcelStr(NPPrices[i].Column3 + 1) + IntToStr(CurRow)
              else
               List.Cells[CurRow, NPPrices[i].Column4 + 1]:= 0;
             end;
          end;

          // �������� ����� ������ � ����� ����
          log('������� ����� ������');
          Inc(CurRow);

          List.Cells[CurRow, 1]:= qReport2AUTOMODEL.AsString;
          List.Cells[CurRow, 2]:= qReport2AUTONUMB.AsString;
          List.Cells[CurRow, 3]:= FormatDateTime('dd"."mm"."yyyy', qReport2DATE_.AsDateTime);;
          List.Cells[CurRow, 4]:= qReport2WAYNUMBER.AsString;

          // ������� ������� �� ������
          log('������ ������� �� ������');
          if (not qReport2REST.IsNull) and (not (qReport2REST.AsFloat = 0)) then
           begin
            for i:= 1 to 9 do
             if NPPrices[i].NP = qReport2NPTYPE.AsInteger then
              begin
               List.Cells[CurRow, NPPrices[i].Column1]:=
                qReport2REST.AsFloat;

               List.Cells[CurRow, NPPrices[i].Column1 + 1]:=
                qReport2RESTAMOUNT.AsFloat;
              end;
           end;

          // ������� �������� �� ������
          log('������ �������� �� ������');
          for i:= 1 to 9 do
           if NPPrices[i].NP = qReport2NPTYPE.AsInteger then
            begin
             if (not qReport2PRIHOD.IsNull) and (not (qReport2PRIHOD.AsFloat = 0)) then
              List.Cells[CurRow, NPPrices[i].Column2]:= qReport2PRIHOD.AsFloat;

             if (not qReport2PRIHOD.IsNull) and (not (qReport2PRIHOD.AsFloat = 0)) then
              List.Cells[CurRow, NPPrices[i].Column2 + 1]:=
               qReport2PRIHODAMOUNT.AsFloat;

             if (not qReport2RASHOD.IsNull) and (not (qReport2RASHOD.AsFloat = 0)) then
              List.Cells[CurRow, NPPrices[i].Column3]:= qReport2RASHOD.AsFloat;

             if (not qReport2RASHOD.IsNull) and (not (qReport2RASHOD.AsFloat = 0)) then
              List.Cells[CurRow, NPPrices[i].Column3 + 1]:=
               qReport2RASHODAMOUNT.AsFloat;
            end;

          OldDate:= qReport2DATE_.AsDateTime;
          OldAutoID:= qReport2AUTOID.AsInteger;
          OldAutoNumber:= qReport2AUTONUMB.AsString;
          OldAutoModel:= qReport2AUTOMODEL.AsString;
          StartRow:= CurRow;
         end
        else
         begin // ���������� �� ������ �������
          if OldDate <> qReport2DATE_.AsDateTime then
           begin // ������� ����� ����
            // ��������� ����� �� ����������� ���
            log('�������� ����� �� ����������� ���');
            List.Cells[CurRow, NPPrices[10].Column1]:=
              '= ' + ExcelStr(NPPrices[1].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column1) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column1 + 1]:=
              '= ' + ExcelStr(NPPrices[1].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column1 + 1) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column2]:=
              '= ' + ExcelStr(NPPrices[1].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column2) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column2 + 1]:=
              '= ' + ExcelStr(NPPrices[1].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column2 + 1) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column3]:=
              '= ' + ExcelStr(NPPrices[1].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column3) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column3 + 1]:=
              '= ' + ExcelStr(NPPrices[1].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column3 + 1) + IntToStr(CurRow);

            for i:= 1 to 10 do
             begin
              List.Cells[CurRow, NPPrices[i].Column4]:=
               '= ' + ExcelStr(NPPrices[i].Column1) + IntToStr(CurRow) + '+'
                    + ExcelStr(NPPrices[i].Column2) + IntToStr(CurRow) + '-'
                    + ExcelStr(NPPrices[i].Column3) + IntToStr(CurRow);

              if VarToStr(List.Cells[CurRow, NPPrices[i].Column4]) <> '0' then
               List.Cells[CurRow, NPPrices[i].Column4 + 1]:=
                '= ' + ExcelStr(NPPrices[i].Column1 + 1) + IntToStr(CurRow) + '+'
                     + ExcelStr(NPPrices[i].Column2 + 1) + IntToStr(CurRow) + '-'
                     + ExcelStr(NPPrices[i].Column3 + 1) + IntToStr(CurRow)
              else
               List.Cells[CurRow, NPPrices[i].Column4 + 1]:= 0;

              // ��������� ������� �� ��������� ����
              List.Cells[CurRow + 1, NPPrices[i].Column1].Value:=
               List.Cells[CurRow, NPPrices[i].Column4].Value;

              List.Cells[CurRow + 1, NPPrices[i].Column1 + 1].Value:=
               List.Cells[CurRow, NPPrices[i].Column4 + 1].Value;
             end;

            Inc(CurRow);

            // �������� ������
            List.Cells[CurRow, 3]:= FormatDateTime('dd"."mm"."yyyy', qReport2DATE_.AsDateTime);;
            List.Cells[CurRow, 4]:= qReport2WAYNUMBER.AsString;

            for i:= 1 to 9 do
             if NPPrices[i].NP = qReport2NPTYPE.AsInteger then
              begin
               if (not qReport2PRIHOD.IsNull) and (not (qReport2PRIHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column2]:= qReport2PRIHOD.AsFloat;

               if (not qReport2PRIHOD.IsNull) and (not (qReport2PRIHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column2 + 1]:=
                 qReport2PRIHODAMOUNT.AsFloat;

               if (not qReport2RASHOD.IsNull) and (not (qReport2RASHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column3]:= qReport2RASHOD.AsFloat;

               if (not qReport2RASHOD.IsNull) and (not (qReport2RASHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column3 + 1]:=
                 qReport2RASHODAMOUNT.AsFloat;
              end;

            OldDate:= qReport2DATE_.AsDateTime;
           end
          else
           begin // ���������� ������ ����
            // �������� ������� �� ������
            log('������ ������� �� ������');
            if (not qReport2REST.IsNull) and (not (qReport2REST.AsFloat = 0)) then
             begin
              for i:= 1 to 9 do
               if NPPrices[i].NP = qReport2NPTYPE.AsInteger then
                begin
                 List.Cells[CurRow, NPPrices[i].Column1]:=
                  qReport2REST.AsFloat;

                 List.Cells[CurRow, NPPrices[i].Column1 + 1]:=
                  qReport2RESTAMOUNT.AsFloat;
                end;
             end;

            // �������� ������ �� �������� � �������� �� ����
            log('������ ������ �� ����');
            for i:= 1 to 9 do
             if NPPrices[i].NP = qReport2NPTYPE.AsInteger then
              begin
               if (not qReport2PRIHOD.IsNull) and (not (qReport2PRIHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column2]:= qReport2PRIHOD.AsFloat;

               if (not qReport2PRIHOD.IsNull) and (not (qReport2PRIHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column2 + 1]:=
                 qReport2PRIHODAMOUNT.AsFloat;

               if (not qReport2RASHOD.IsNull) and (not (qReport2RASHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column3]:= qReport2RASHOD.AsFloat;

               if (not qReport2RASHOD.IsNull) and (not (qReport2RASHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column3 + 1]:=
                 qReport2RASHODAMOUNT.AsFloat;
              end;
           end;
         end;

         log('�������� � ��������� ������');
        qReport2.Next;
       end;

     ProgrForm.AddProgress(15);

     // ��������� ������
     log('�������� ������');
     if CurRow <> (RowOffSet - 1) then
      begin
       // ��������� ���������� ����
       List.Cells[CurRow, NPPrices[10].Column1]:=
         '= ' + ExcelStr(NPPrices[1].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[2].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[3].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[4].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[5].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[6].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[7].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[8].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[9].Column1) + IntToStr(CurRow);

       List.Cells[CurRow, NPPrices[10].Column1 + 1]:=
         '= ' + ExcelStr(NPPrices[1].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[2].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[3].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[4].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[5].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[6].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[7].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[8].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[9].Column1 + 1) + IntToStr(CurRow);

       List.Cells[CurRow, NPPrices[10].Column2]:=
         '= ' + ExcelStr(NPPrices[1].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[2].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[3].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[4].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[5].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[6].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[7].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[8].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[9].Column2) + IntToStr(CurRow);

       List.Cells[CurRow, NPPrices[10].Column2 + 1]:=
         '= ' + ExcelStr(NPPrices[1].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[2].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[3].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[4].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[5].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[6].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[7].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[8].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[9].Column2 + 1) + IntToStr(CurRow);

       List.Cells[CurRow, NPPrices[10].Column3]:=
         '= ' + ExcelStr(NPPrices[1].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[2].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[3].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[4].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[5].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[6].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[7].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[8].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[9].Column3) + IntToStr(CurRow);

       List.Cells[CurRow, NPPrices[10].Column3 + 1]:=
         '= ' + ExcelStr(NPPrices[1].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[2].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[3].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[4].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[5].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[6].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[7].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[8].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[9].Column3 + 1) + IntToStr(CurRow);

       for i:= 1 to 10 do
        begin
         List.Cells[CurRow, NPPrices[i].Column4]:=
          '= ' + ExcelStr(NPPrices[i].Column1) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[i].Column2) + IntToStr(CurRow) + '-'
               + ExcelStr(NPPrices[i].Column3) + IntToStr(CurRow);

         if VarToStr(List.Cells[CurRow, NPPrices[i].Column4]) <> '0' then
          List.Cells[CurRow, NPPrices[i].Column4 + 1]:=
           '= ' + ExcelStr(NPPrices[i].Column1 + 1) + IntToStr(CurRow) + '+'
                + ExcelStr(NPPrices[i].Column2 + 1) + IntToStr(CurRow) + '-'
                + ExcelStr(NPPrices[i].Column3 + 1) + IntToStr(CurRow)
         else
          List.Cells[CurRow, NPPrices[i].Column4 + 1]:= 0;
        end;

       if StartRow <> CurRow then
        List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                   IntToStr(CurRow)].Borders[xlInsideHorizontal].LineStyle:= 1;

       List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                  IntToStr(CurRow)].Borders[xlInsideVertical].LineStyle:= 1;
       List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                  IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;
       List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                  IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;

       inc(CurRow);

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeBottom].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeBottom].Weight:= xlThick;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeTop].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeTop].Weight:= xlThick;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeRight].Weight:= xlThick;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeLeft].Weight:= xlThick;

       List.Rows[CurRow].Borders[xlInsideVertical].LineStyle:= 1;

       List.Rows[CurRow].Font.Bold:= true;

       List.Cells[CurRow, 1]:= TranslateText('����� �� ') + OldAutoNumber;
       List.Range['A' + IntToStr(CurRow),'D' + IntToStr(CurRow)].MergeCells:= True;
       List.Range['A' + IntToStr(CurRow),'D' + IntToStr(CurRow)].HorizontalAlignment:= xlHAlignCenter;
       SumRows:= SumRows + '*' + IntToStr(CurRow);

       // ��������� �������� ������ �� ������
       log('�������� �������� ������ �� ������');
       for i:= 1 to 10 do
        begin
         List.Cells[CurRow, NPPrices[i].Column1].Value:=
          List.Cells[StartRow, NPPrices[i].Column1].Value;

         List.Cells[CurRow, NPPrices[i].Column1 + 1].Value:=
          List.Cells[StartRow, NPPrices[i].Column1 + 1].Value;
        end;

       for i:= NPPrices[1].Column2 to NPPrices[10].Column3 + 1 do
        begin
         // ��� �� �������� ��������� SubTotal ��� ������� ���� ��������� ������� �
         // "������->���������->�������->�������������� ������ � ������ Excel ��� �����"
         List.Cells[CurRow, i]:=
          '=SUBTOTAL(9;' +  ExcelStr(i) + IntToStr(StartRow) +
                     ':' +  ExcelStr(i) + IntToStr(CurRow - 1) + ')';
        end;

       for i:= 1 to 10 do
        begin
         List.Cells[CurRow, NPPrices[i].Column4]:=
          '= ' + ExcelStr(NPPrices[i].Column1) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[i].Column2) + IntToStr(CurRow) + '-'
               + ExcelStr(NPPrices[i].Column3) + IntToStr(CurRow);

         if VarToStr(List.Cells[CurRow, NPPrices[i].Column4]) <> '0' then
          List.Cells[CurRow, NPPrices[i].Column4 + 1]:=
           '= ' + ExcelStr(NPPrices[i].Column1 + 1) + IntToStr(CurRow) + '+'
                + ExcelStr(NPPrices[i].Column2 + 1) + IntToStr(CurRow) + '-'
                + ExcelStr(NPPrices[i].Column3 + 1) + IntToStr(CurRow)
         else
          List.Cells[CurRow, NPPrices[i].Column4 + 1]:= 0;
        end;

       Inc(CurRow);

       // ��������� ����� �����
       log('�������� ����� �����');
       List.Rows[CurRow].Borders[xlInsideVertical].LineStyle:= 1;
       List.Rows[CurRow].Borders[xlEdgeRight].LineStyle:= 1;
       List.Rows[CurRow].Borders[xlEdgeLeft].LineStyle:= 1;

       Inc(CurRow);

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeBottom].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeBottom].Weight:= xlThick;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeTop].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeTop].Weight:= xlThick;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeRight].Weight:= xlThick;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeLeft].Weight:= xlThick;

       List.Rows[CurRow].Borders[xlInsideVertical].LineStyle:= 1;

       List.Rows[CurRow].Font.Bold:= true;


       case Group of
       1: List.Cells[CurRow, 1]:= TranslateText('����� �� ��������� ��������������');
       2: List.Cells[CurRow, 1]:= TranslateText('����� �� ��������� ��������������');
       3: List.Cells[CurRow, 1]:= TranslateText('����� �� �� ������ ���. ���������');
       end;


       List.Range['A' + IntToStr(CurRow),'D' + IntToStr(CurRow)].MergeCells:= True;
       List.Range['A' + IntToStr(CurRow),'D' + IntToStr(CurRow)].HorizontalAlignment:= xlHAlignCenter;

       // ��������� �������� ����� � ����������� �������
       log('�������� �������� ����� � ���������� �������');
       for i:= NPPrices[1].Column1 to NPPrices[10].Column4 + 1 do
        begin
         List.Cells[CurRow, i]:=
          '=' + StringReplace(SumRows, '*', ExcelStr(i), [rfReplaceAll, rfIgnoreCase]);

         List.Columns[i].AutoFit;
        end;
      end;

      ProgrForm.AddProgress(5);

      ProgrForm.Close;
      Self.Repaint;

      log('��������� ������');
      ShowExcel;
     finally
      log('���������� ������ �� �����');
      IWorkbook := nil;
     end;
    end;

  finally
   log('�������� ������');
   qReport2.Close;

   ProgrForm.Free;
  end;

 except
  on E:Exception do
   begin
    log('������!!!');
    log('����� ������');
    HideExcel;
    MessageDlg(TranslateText('������: ') + E.message, mtError, [mbOk], 0);
    ReleaseExcel;
   end;
 end;
end;

// ������ "�������� ����� ������" ��� ������ �4
procedure TAutoReportsForm.Report7;
const RowOffSet = 11; // ������, � ������� ���������� ���������� ������
  // ������ �������� ��� ������ � ���������������
  // NP - ��� ������ � ������� ������ ������������
  // ColumnN - ����� ������� � ������� ��������� ������ ��
  //  N = 1 - ������� �� ������
  //  N = 2 - ������
  //  N = 3 - ������
  //  N = 4 - ������� �� �����
  //  ��� ���������� ������ �������������
  // Price - ���� ������ ������ �������������� - �������� �� �������
  NPPrices: array [1..10] of NPStruct =
   ((NP:  4; Column1:  5; Column2: 25; Column3: 45; Column4: 65), // �-76
    (NP:  5; Column1:  7; Column2: 27; Column3: 47; Column4: 67),  // A-80
    (NP:  6; Column1:  9; Column2: 29; Column3: 49; Column4: 69), // A-92
    (NP:  7; Column1: 11; Column2: 31; Column3: 51; Column4: 71), // A-95
    (NP:  3; Column1: 13; Column2: 33; Column3: 53; Column4: 73), // ��
    (NP:  8; Column1: 15; Column2: 35; Column3: 55; Column4: 75), // �����
    (NP: 63; Column1: 17; Column2: 37; Column3: 57; Column4: 77), // ������ �������
    (NP:  9; Column1: 19; Column2: 39; Column3: 59; Column4: 79), // ������
    (NP: 62; Column1: 21; Column2: 41; Column3: 61; Column4: 81), // ���
    (NP: -1; Column1: 23; Column2: 43; Column3: 63; Column4: 83)); // �����

var IWorkbook: Excel8TLB._Workbook;
    List: variant;

    CurRow: integer;
    StartRow: integer;
    SumRows: string;

    i: integer;

    OldDate: TDateTime;
    OldAutoID: integer;
    OldAutoNumber: string;
    OldAutoModel: string;
begin
 try
  CreateExcel(false);

  // ������� ����� ��� ����������� �������� �������� ������
  ProgrForm:= TProgrForm.Create(Self);

  with ProgrForm do
   begin
    Progress:= 0;
    MaxValue:= 100;
    Show;
    Self.Repaint;
    Repaint;
   end;

  ProgrForm.AddProgress(5);

  with qReport2 do
   begin
    Close;

    ParamByName('FilialID').Value:= pOrgID;
    ParamByName('AutoGroup').Value:= 4;
    ParamByName('BeginDate').Value:= DateEdit1.Date;
    ParamByName('EndDate').Value:= DateEdit2.Date;

    Open;
   end;

  ProgrForm.AddProgress(65);

  try
   if Assigned(IXLSApp) then
    begin
     IWorkbook:= AddWorkbook(GetMainDir+'pattern\wbCard4.xls');

     try
      List:= IWorkbook.ActiveSheet as Excel8TLB._Worksheet;

      // �����������, ��� ������
      List.Cells[1, 1]:= GetOrgName(Main.Main_Id, Main.Inst) + '; ' +
                               DateToStr(Date) + '; ' + TimeToStr(Time);

      List.Cells[4, 2]:= GetOrgName(pOrgID, pOrgINST);

      // ������
      List.Cells[5, 2]:= TranslateText('�� ������ c ') + DateEdit1.Text + TranslateText(' �� ') +  DateEdit2.Text;;

      ProgrForm.AddProgress(10);

      // �������� �����
      // �������������� ����������-�������
      OldAutoNumber:= '-----------';
      OldAutoModel:= '-----------';
      OldAutoID:= -999;
      OldDate:= 0;

      // �������������� �������� �����
      CurRow:= RowOffSet - 1;
      StartRow:= RowOffSet;

      // ����� ����� ������� ������ ����� � ������� ��������� �������� ������
      // �� ��������� �������
      SumRows:= '';

      // ���������� �����
      // ��������� �������� ��������
      while not qReport2.EOF do
       begin
        if OldAutoID <> qReport2AUTOID.AsInteger then
         begin // �������� ����� ������ �, ��������������, ����� ����, ���!
          if CurRow <> (RowOffSet - 1) then
           begin // ��������� ����� �� ������� ���� � �� ������
            List.Cells[CurRow, NPPrices[10].Column1]:=
              '= ' + ExcelStr(NPPrices[1].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column1) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column1 + 1]:=
              '= ' + ExcelStr(NPPrices[1].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column1 + 1) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column2]:=
              '= ' + ExcelStr(NPPrices[1].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column2) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column2 + 1]:=
              '= ' + ExcelStr(NPPrices[1].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column2 + 1) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column3]:=
              '= ' + ExcelStr(NPPrices[1].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column3) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column3 + 1]:=
              '= ' + ExcelStr(NPPrices[1].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column3 + 1) + IntToStr(CurRow);

            for i:= 1 to 10 do
             begin
              List.Cells[CurRow, NPPrices[i].Column4]:=
               '= ' + ExcelStr(NPPrices[i].Column1) + IntToStr(CurRow) + '+'
                    + ExcelStr(NPPrices[i].Column2) + IntToStr(CurRow) + '-'
                    + ExcelStr(NPPrices[i].Column3) + IntToStr(CurRow);

              if VarToStr(List.Cells[CurRow, NPPrices[i].Column4]) <> '0' then
               List.Cells[CurRow, NPPrices[i].Column4 + 1]:=
                '= ' + ExcelStr(NPPrices[i].Column1 + 1) + IntToStr(CurRow) + '+'
                     + ExcelStr(NPPrices[i].Column2 + 1) + IntToStr(CurRow) + '-'
                     + ExcelStr(NPPrices[i].Column3 + 1) + IntToStr(CurRow)
              else
               List.Cells[CurRow, NPPrices[i].Column4 + 1]:= 0;
             end;

            if StartRow <> CurRow then
             List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                        IntToStr(CurRow)].Borders[xlInsideHorizontal].LineStyle:= 1;

            List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                       IntToStr(CurRow)].Borders[xlInsideVertical].LineStyle:= 1;
            List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                       IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;
            List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                       IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;

            inc(CurRow);

            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                      IntToStr(CurRow)].Borders[xlEdgeBottom].LineStyle:= 1;
//            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                      IntToStr(CurRow)].Borders[xlEdgeBottom].Weight:= xlThick;

            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                      IntToStr(CurRow)].Borders[xlEdgeTop].LineStyle:= 1;
//            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                      IntToStr(CurRow)].Borders[xlEdgeTop].Weight:= xlThick;

            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                      IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;
//            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                      IntToStr(CurRow)].Borders[xlEdgeRight].Weight:= xlThick;

            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                      IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;
//            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                      IntToStr(CurRow)].Borders[xlEdgeLeft].Weight:= xlThick;

            List.Rows[CurRow].Borders[xlInsideVertical].LineStyle:= 1;

            List.Rows[CurRow].Font.Bold:= true;

            List.Cells[CurRow, 1]:= TranslateText('����� �� ') + OldAutoNumber;
            List.Range['A' + IntToStr(CurRow),'D' + IntToStr(CurRow)].MergeCells:= True;
            List.Range['A' + IntToStr(CurRow),'D' + IntToStr(CurRow)].HorizontalAlignment:= xlHAlignCenter;
            SumRows:= SumRows + '*' + IntToStr(CurRow) + '+';

            // ��������� �������� ������ �� ������
            for i:= 1 to 10 do
             begin
              List.Cells[CurRow, NPPrices[i].Column1].Value:=
               List.Cells[StartRow, NPPrices[i].Column1].Value;

              List.Cells[CurRow, NPPrices[i].Column1 + 1].Value:=
               List.Cells[StartRow, NPPrices[i].Column1 + 1].Value;
             end;

            for i:= NPPrices[1].Column2 to NPPrices[10].Column3 + 1 do
             begin
              // ��� �� �������� ��������� SubTotal ��� ������� ���� ��������� ������� �
              // "������->���������->�������->�������������� ������ � ������ Excel ��� �����"
              List.Cells[CurRow, i]:=
               '=SUBTOTAL(9;' +  ExcelStr(i) + IntToStr(StartRow) +
                          ':' +  ExcelStr(i) + IntToStr(CurRow - 1) + ')';
             end;

            for i:= 1 to 10 do
             begin
              List.Cells[CurRow, NPPrices[i].Column4]:=
               '= ' + ExcelStr(NPPrices[i].Column1) + IntToStr(CurRow) + '+'
                    + ExcelStr(NPPrices[i].Column2) + IntToStr(CurRow) + '-'
                    + ExcelStr(NPPrices[i].Column3) + IntToStr(CurRow);

              if VarToStr(List.Cells[CurRow, NPPrices[i].Column4]) <> '0' then
               List.Cells[CurRow, NPPrices[i].Column4 + 1]:=
                '= ' + ExcelStr(NPPrices[i].Column1 + 1) + IntToStr(CurRow) + '+'
                     + ExcelStr(NPPrices[i].Column2 + 1) + IntToStr(CurRow) + '-'
                     + ExcelStr(NPPrices[i].Column3 + 1) + IntToStr(CurRow)
              else
               List.Cells[CurRow, NPPrices[i].Column4 + 1]:= 0;
             end;
          end;

          // �������� ����� ������ � ����� ����
          Inc(CurRow);

          List.Cells[CurRow, 1]:= qReport2AUTONUMB.AsString;
          List.Cells[CurRow, 2]:= FormatDateTime('dd"."mm"."yyyy', qReport2DATE_.AsDateTime);
          List.Cells[CurRow, 3]:= qReport2TTNNUM.AsInteger;
          List.Cells[CurRow, 4]:= qReport2WAYNUMBER.AsString;

          // ������� ������� �� ������
          if (not qReport2REST.IsNull) and (not (qReport2REST.AsFloat = 0)) then
           begin
            for i:= 1 to 9 do
             if NPPrices[i].NP = qReport2NPTYPE.AsInteger then
              begin
               List.Cells[CurRow, NPPrices[i].Column1]:=
                qReport2REST.AsFloat;

               List.Cells[CurRow, NPPrices[i].Column1 + 1]:=
                qReport2RESTAMOUNT.AsFloat;
              end;
           end;

          // ������� �������� �� ������
          for i:= 1 to 9 do
           if NPPrices[i].NP = qReport2NPTYPE.AsInteger then
            begin
             if (not qReport2PRIHOD.IsNull) and (not (qReport2PRIHOD.AsFloat = 0)) then
              List.Cells[CurRow, NPPrices[i].Column2]:= qReport2PRIHOD.AsFloat;

             if (not qReport2PRIHOD.IsNull) and (not (qReport2PRIHOD.AsFloat = 0)) then
              List.Cells[CurRow, NPPrices[i].Column2 + 1]:=
               qReport2PRIHODAMOUNT.AsFloat;

             if (not qReport2RASHOD.IsNull) and (not (qReport2RASHOD.AsFloat = 0)) then
              List.Cells[CurRow, NPPrices[i].Column3]:= qReport2RASHOD.AsFloat;

             if (not qReport2RASHOD.IsNull) and (not (qReport2RASHOD.AsFloat = 0)) then
              List.Cells[CurRow, NPPrices[i].Column3 + 1]:=
               qReport2RASHODAMOUNT.AsFloat;
            end;

          OldDate:= qReport2DATE_.AsDateTime;
          OldAutoID:= qReport2AUTOID.AsInteger;
          OldAutoNumber:= qReport2AUTONUMB.AsString;
          OldAutoModel:= qReport2AUTOMODEL.AsString;
          StartRow:= CurRow;
         end
        else
         begin // ���������� �� ������ �������
          if OldDate <> qReport2DATE_.AsDateTime then
           begin // ������� ����� ����
            // ��������� ����� �� ����������� ���
            List.Cells[CurRow, NPPrices[10].Column1]:=
              '= ' + ExcelStr(NPPrices[1].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column1) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column1 + 1]:=
              '= ' + ExcelStr(NPPrices[1].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column1 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column1 + 1) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column2]:=
              '= ' + ExcelStr(NPPrices[1].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column2) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column2 + 1]:=
              '= ' + ExcelStr(NPPrices[1].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column2 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column2 + 1) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column3]:=
              '= ' + ExcelStr(NPPrices[1].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column3) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column3 + 1]:=
              '= ' + ExcelStr(NPPrices[1].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column3 + 1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column3 + 1) + IntToStr(CurRow);

            for i:= 1 to 10 do
             begin
              List.Cells[CurRow, NPPrices[i].Column4]:=
               '= ' + ExcelStr(NPPrices[i].Column1) + IntToStr(CurRow) + '+'
                    + ExcelStr(NPPrices[i].Column2) + IntToStr(CurRow) + '-'
                    + ExcelStr(NPPrices[i].Column3) + IntToStr(CurRow);

              if VarToStr(List.Cells[CurRow, NPPrices[i].Column4]) <> '0' then
               List.Cells[CurRow, NPPrices[i].Column4 + 1]:=
                '= ' + ExcelStr(NPPrices[i].Column1 + 1) + IntToStr(CurRow) + '+'
                     + ExcelStr(NPPrices[i].Column2 + 1) + IntToStr(CurRow) + '-'
                     + ExcelStr(NPPrices[i].Column3 + 1) + IntToStr(CurRow)
              else
               List.Cells[CurRow, NPPrices[i].Column4 + 1]:= 0;

              // ��������� ������� �� ��������� ����
              List.Cells[CurRow + 1, NPPrices[i].Column1].Value:=
               List.Cells[CurRow, NPPrices[i].Column4].Value;

              List.Cells[CurRow + 1, NPPrices[i].Column1 + 1].Value:=
               List.Cells[CurRow, NPPrices[i].Column4 + 1].Value;
             end;

            Inc(CurRow);

            // �������� ������
            List.Cells[CurRow, 2]:= FormatDateTime('dd"."mm"."yyyy', qReport2DATE_.AsDateTime);;
            List.Cells[CurRow, 3]:= qReport2TTNNUM.AsInteger;
            List.Cells[CurRow, 4]:= qReport2WAYNUMBER.AsString;

            for i:= 1 to 9 do
             if NPPrices[i].NP = qReport2NPTYPE.AsInteger then
              begin
               if (not qReport2PRIHOD.IsNull) and (not (qReport2PRIHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column2]:= qReport2PRIHOD.AsFloat;

               if (not qReport2PRIHOD.IsNull) and (not (qReport2PRIHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column2 + 1]:=
                 qReport2PRIHODAMOUNT.AsFloat;

               if (not qReport2RASHOD.IsNull) and (not (qReport2RASHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column3]:= qReport2RASHOD.AsFloat;

               if (not qReport2RASHOD.IsNull) and (not (qReport2RASHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column3 + 1]:=
                 qReport2RASHODAMOUNT.AsFloat;
              end;

            OldDate:= qReport2DATE_.AsDateTime;
           end
          else
           begin // ���������� ������ ����
            // �������� ������� �� ������ - ���� ��� ������ ���� ��� ���� ������
            if (not qReport2REST.IsNull) and (not (qReport2REST.AsFloat = 0)) then
             begin
              for i:= 1 to 9 do
               if NPPrices[i].NP = qReport2NPTYPE.AsInteger then
                begin
                 List.Cells[CurRow, NPPrices[i].Column1]:=
                  qReport2REST.AsFloat;

                 List.Cells[CurRow, NPPrices[i].Column1 + 1]:=
                  qReport2RESTAMOUNT.AsFloat;
                end;
             end;

            // �������� ������ �� �������� � �������� �� ����
            for i:= 1 to 9 do
             if NPPrices[i].NP = qReport2NPTYPE.AsInteger then
              begin
               if (not qReport2PRIHOD.IsNull) and (not (qReport2PRIHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column2]:= qReport2PRIHOD.AsFloat;

               if (not qReport2PRIHOD.IsNull) and (not (qReport2PRIHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column2 + 1]:=
                 qReport2PRIHODAMOUNT.AsFloat;

               if (not qReport2RASHOD.IsNull) and (not (qReport2RASHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column3]:= qReport2RASHOD.AsFloat;

               if (not qReport2RASHOD.IsNull) and (not (qReport2RASHOD.AsFloat = 0)) then
                List.Cells[CurRow, NPPrices[i].Column3 + 1]:=
                 qReport2RASHODAMOUNT.AsFloat;
              end;
           end;
         end;

        qReport2.Next;
       end;

     ProgrForm.AddProgress(15);

     // ��������� ������
     if CurRow <> (RowOffSet - 1) then
      begin
       // ��������� ���������� ����
       List.Cells[CurRow, NPPrices[10].Column1]:=
         '= ' + ExcelStr(NPPrices[1].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[2].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[3].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[4].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[5].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[6].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[7].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[8].Column1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[9].Column1) + IntToStr(CurRow);

       List.Cells[CurRow, NPPrices[10].Column1 + 1]:=
         '= ' + ExcelStr(NPPrices[1].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[2].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[3].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[4].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[5].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[6].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[7].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[8].Column1 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[9].Column1 + 1) + IntToStr(CurRow);

       List.Cells[CurRow, NPPrices[10].Column2]:=
         '= ' + ExcelStr(NPPrices[1].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[2].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[3].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[4].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[5].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[6].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[7].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[8].Column2) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[9].Column2) + IntToStr(CurRow);

       List.Cells[CurRow, NPPrices[10].Column2 + 1]:=
         '= ' + ExcelStr(NPPrices[1].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[2].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[3].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[4].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[5].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[6].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[7].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[8].Column2 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[9].Column2 + 1) + IntToStr(CurRow);

       List.Cells[CurRow, NPPrices[10].Column3]:=
         '= ' + ExcelStr(NPPrices[1].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[2].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[3].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[4].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[5].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[6].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[7].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[8].Column3) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[9].Column3) + IntToStr(CurRow);

       List.Cells[CurRow, NPPrices[10].Column3 + 1]:=
         '= ' + ExcelStr(NPPrices[1].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[2].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[3].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[4].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[5].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[6].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[7].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[8].Column3 + 1) + IntToStr(CurRow) + '+'
              + ExcelStr(NPPrices[9].Column3 + 1) + IntToStr(CurRow);

       for i:= 1 to 10 do
        begin
         List.Cells[CurRow, NPPrices[i].Column4]:=
          '= ' + ExcelStr(NPPrices[i].Column1) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[i].Column2) + IntToStr(CurRow) + '-'
               + ExcelStr(NPPrices[i].Column3) + IntToStr(CurRow);

         if VarToStr(List.Cells[CurRow, NPPrices[i].Column4]) <> '0' then
          List.Cells[CurRow, NPPrices[i].Column4 + 1]:=
           '= ' + ExcelStr(NPPrices[i].Column1 + 1) + IntToStr(CurRow) + '+'
                + ExcelStr(NPPrices[i].Column2 + 1) + IntToStr(CurRow) + '-'
                + ExcelStr(NPPrices[i].Column3 + 1) + IntToStr(CurRow)
         else
          List.Cells[CurRow, NPPrices[i].Column4 + 1]:= 0;
        end;

       if StartRow <> CurRow then
        List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                   IntToStr(CurRow)].Borders[xlInsideHorizontal].LineStyle:= 1;

       List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                  IntToStr(CurRow)].Borders[xlInsideVertical].LineStyle:= 1;
       List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                  IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;
       List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4 + 1) +
                  IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;

       inc(CurRow);

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeBottom].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeBottom].Weight:= xlThick;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeTop].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeTop].Weight:= xlThick;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeRight].Weight:= xlThick;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeLeft].Weight:= xlThick;

       List.Rows[CurRow].Borders[xlInsideVertical].LineStyle:= 1;

       List.Rows[CurRow].Font.Bold:= true;

       List.Cells[CurRow, 1]:= TranslateText('����� �� ') + OldAutoNumber;
       List.Range['A' + IntToStr(CurRow),'D' + IntToStr(CurRow)].MergeCells:= True;
       List.Range['A' + IntToStr(CurRow),'D' + IntToStr(CurRow)].HorizontalAlignment:= xlHAlignCenter;
       SumRows:= SumRows + '*' + IntToStr(CurRow);

       // ��������� �������� ������ �� ������
       for i:= 1 to 10 do
        begin
         List.Cells[CurRow, NPPrices[i].Column1].Value:=
          List.Cells[StartRow, NPPrices[i].Column1].Value;

         List.Cells[CurRow, NPPrices[i].Column1 + 1].Value:=
          List.Cells[StartRow, NPPrices[i].Column1 + 1].Value;
        end;

       for i:= NPPrices[1].Column2 to NPPrices[10].Column3 + 1 do
        begin
         // ��� �� �������� ��������� SubTotal ��� ������� ���� ��������� ������� �
         // "������->���������->�������->�������������� ������ � ������ Excel ��� �����"
         List.Cells[CurRow, i]:=
          '=SUBTOTAL(9;' +  ExcelStr(i) + IntToStr(StartRow) +
                     ':' +  ExcelStr(i) + IntToStr(CurRow - 1) + ')';
        end;

       for i:= 1 to 10 do
        begin
         List.Cells[CurRow, NPPrices[i].Column4]:=
          '= ' + ExcelStr(NPPrices[i].Column1) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[i].Column2) + IntToStr(CurRow) + '-'
               + ExcelStr(NPPrices[i].Column3) + IntToStr(CurRow);

         if VarToStr(List.Cells[CurRow, NPPrices[i].Column4]) <> '0' then
          List.Cells[CurRow, NPPrices[i].Column4 + 1]:=
           '= ' + ExcelStr(NPPrices[i].Column1 + 1) + IntToStr(CurRow) + '+'
                + ExcelStr(NPPrices[i].Column2 + 1) + IntToStr(CurRow) + '-'
                + ExcelStr(NPPrices[i].Column3 + 1) + IntToStr(CurRow)
         else
          List.Cells[CurRow, NPPrices[i].Column4 + 1]:= 0;
        end;

       Inc(CurRow);

       // ��������� ����� �����
       List.Rows[CurRow].Borders[xlInsideVertical].LineStyle:= 1;
       List.Rows[CurRow].Borders[xlEdgeRight].LineStyle:= 1;
       List.Rows[CurRow].Borders[xlEdgeLeft].LineStyle:= 1;

       Inc(CurRow);

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeBottom].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeBottom].Weight:= xlThick;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeTop].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeTop].Weight:= xlThick;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeRight].Weight:= xlThick;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;
//       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
//                 IntToStr(CurRow)].Borders[xlEdgeLeft].Weight:= xlThick;

       List.Rows[CurRow].Borders[xlInsideVertical].LineStyle:= 1;

       List.Rows[CurRow].Font.Bold:= true;

       List.Cells[CurRow, 1]:= TranslateText('����� �� ������������� ������������');


       List.Range['A' + IntToStr(CurRow),'D' + IntToStr(CurRow)].MergeCells:= True;
       List.Range['A' + IntToStr(CurRow),'D' + IntToStr(CurRow)].HorizontalAlignment:= xlHAlignCenter;

       // ��������� �������� ����� � ����������� �������
       for i:= NPPrices[1].Column1 to NPPrices[10].Column4 + 1 do
        begin
         List.Cells[CurRow, i]:=
          '=' + StringReplace(SumRows, '*', ExcelStr(i), [rfReplaceAll, rfIgnoreCase]);

         List.Columns[i].AutoFit;
        end;
      end;

      ProgrForm.AddProgress(5);

      ProgrForm.Close;
      Self.Repaint;

      ShowExcel;
     finally
      IWorkbook := nil;
     end;
    end;

  finally
   qReport2.Close;

   ProgrForm.Free;
  end;

 except
  on E:Exception do
   begin
    HideExcel;
    MessageDlg(TranslateText('������: ') + E.message, mtError, [mbOk], 0);
    ReleaseExcel;
   end;
 end;
end;

// �����
procedure TAutoReportsForm.Report8;
const RowOffSet = 11; // ������, � ������� ���������� ���������� ������
  // ������ �������� ��� ������ � ���������������
  // NP - ��� ������ � ������� ������ ������������
  // ColumnN - ����� ������� � ������� ��������� ������ ��
  //  N = 1 - ������� �� ������
  //  N = 2 - ������
  //  N = 3 - ������
  //  N = 4 - ������� �� �����
  //  ��� ���������� ������ �������������
  NPPrices: array [1..10] of NPStruct =
   ((NP:  4; Column1:  4; Column2: 14; Column3: 24; Column4: 34), // �-76
    (NP:  5; Column1:  5; Column2: 15; Column3: 25; Column4: 35),  // A-80
    (NP:  6; Column1:  6; Column2: 16; Column3: 26; Column4: 36), // A-92
    (NP:  7; Column1:  7; Column2: 17; Column3: 27; Column4: 37), // A-95
    (NP:  3; Column1:  8; Column2: 18; Column3: 28; Column4: 38), // ��
    (NP:  8; Column1:  9; Column2: 19; Column3: 29; Column4: 39), // �����
    (NP: 63; Column1: 10; Column2: 20; Column3: 30; Column4: 40), // ������ �������
    (NP:  9; Column1: 11; Column2: 21; Column3: 31; Column4: 41), // ������
    (NP: 62; Column1: 12; Column2: 22; Column3: 32; Column4: 42), // ���
    (NP: -1; Column1: 13; Column2: 23; Column3: 33; Column4: 43)); // �����
var IWorkbook: Excel8TLB._Workbook;
    List: variant;

    CurRow: integer;
    StartRow: integer;
    SumRows: string;

    i: integer;

    OldGroup: integer;
    OldAutoID: integer;
    OldAutoNumber: string;
    OldAutoModel: string;
begin
 try
  CreateExcel(false);

  // ������� ����� ��� ����������� �������� �������� ������
  ProgrForm:= TProgrForm.Create(Self);

  with ProgrForm do
   begin
    Progress:= 0;
    MaxValue:= 100;
    Show;
    Self.Repaint;
    Repaint;
   end;

  ProgrForm.AddProgress(5);

  with qReport8 do
   begin
    Close;

    ParamByName('FilialID').Value:= pOrgID;
    ParamByName('BeginDate').Value:= DateEdit1.Date;
    ParamByName('EndDate').Value:= DateEdit2.Date;

    Open;
   end;

  ProgrForm.AddProgress(65);

  try
   if Assigned(IXLSApp) then
    begin
     IWorkbook:= AddWorkbook(GetMainDir+'pattern\wbFilial.xls');

     try
      List:= IWorkbook.ActiveSheet as Excel8TLB._Worksheet;

      // �����������, ��� ������
      List.Cells[1, 1]:= GetOrgName(Main.Main_Id, Main.Inst) + '; ' +
                               DateToStr(Date) + '; ' + TimeToStr(Time);

      List.Cells[4, 3]:= GetOrgName(pOrgID, pOrgINST);

      // ������
      List.Cells[5, 3]:= TranslateText('�� ������ c ') + DateEdit1.Text + TranslateText(' �� ') +  DateEdit2.Text;;

      ProgrForm.AddProgress(10);

      // �������� �����
      // �������������� ����������-�������
      OldAutoNumber:= '-----------';
      OldAutoModel:= '-----------';
      OldAutoID:= -999;
      OldGroup:= 0;

      // �������������� �������� �����
      CurRow:= RowOffSet - 1;
      StartRow:= RowOffSet;

      // ����� ����� ������� ������ ����� � ������� ��������� �������� ������
      // �� ��������� �������
      SumRows:= '';

      while not qReport8.EOF do
       begin
        if OldGroup <> qReport8GROUPNUMBER.AsInteger then
         begin // �������� ����� ������ � �������������� ����� ������
          if CurRow <> (RowOffSet - 1) then
           begin // ��������� ����� �� ���������� ������ � �� ���������� ������
            // ����� �� ���������� ������
            List.Cells[CurRow, NPPrices[10].Column1]:=
              '= ' + ExcelStr(NPPrices[1].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column1) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column2]:=
              '= ' + ExcelStr(NPPrices[1].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column2) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column3]:=
              '= ' + ExcelStr(NPPrices[1].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column3) + IntToStr(CurRow);

            for i:= 1 to 10 do
             begin
              List.Cells[CurRow, NPPrices[i].Column4]:=
               '= ' + ExcelStr(NPPrices[i].Column1) + IntToStr(CurRow) + '+'
                    + ExcelStr(NPPrices[i].Column2) + IntToStr(CurRow) + '-'
                    + ExcelStr(NPPrices[i].Column3) + IntToStr(CurRow);
             end;

            if StartRow <> CurRow then
             List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4) +
                        IntToStr(CurRow)].Borders[xlInsideHorizontal].LineStyle:= 1;

            List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4) +
                       IntToStr(CurRow)].Borders[xlInsideVertical].LineStyle:= 1;
            List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4) +
                       IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;
            List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4) +
                       IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;

            Inc(CurRow);

            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4) +
                      IntToStr(CurRow)].Borders[xlEdgeBottom].LineStyle:= 1;

            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4) +
                      IntToStr(CurRow)].Borders[xlEdgeTop].LineStyle:= 1;

            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4) +
                      IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;

            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4) +
                      IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;

            List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                      IntToStr(CurRow)].Borders[xlInsideVertical].LineStyle:= 1;
//            List.Rows[CurRow].Borders[xlInsideVertical].LineStyle:= 1;

            List.Rows[CurRow].Font.Bold:= true;

            List.Cells[CurRow, 1]:= TranslateText('����� �� ������ �') + IntToStr(OldGroup);
            List.Range['A' + IntToStr(CurRow),'C' + IntToStr(CurRow)].MergeCells:= True;
            List.Range['A' + IntToStr(CurRow),'C' + IntToStr(CurRow)].HorizontalAlignment:= xlHAlignCenter;
            SumRows:= SumRows + '*' + IntToStr(CurRow) + '+';

            for i:= NPPrices[1].Column1 to NPPrices[10].Column4 do
             begin
              // ��� �� �������� ��������� SubTotal ��� ������� ���� ��������� ������� �
              // "������->���������->�������->�������������� ������ � ������ Excel ��� �����"
              List.Cells[CurRow, i]:=
               '=SUBTOTAL(9;' +  ExcelStr(i) + IntToStr(StartRow) +
                          ':' +  ExcelStr(i) + IntToStr(CurRow - 1) + ')';
             end;
           end;

           // ������� ������
           Inc(CurRow);


           List.Cells[CurRow, 1]:= qReport8GROUPNUMBER.AsString;
           List.Cells[CurRow, 2]:= QReport8AUTOMODEL.AsString;
           List.Cells[CurRow, 3]:= QReport8AUTONUMB.AsString;

           // ������� �������� �� ������
           for i:= 1 to 9 do
            if NPPrices[i].NP = qReport8NPTYPE.AsInteger then
             begin
              List.Cells[CurRow, NPPrices[i].Column1]:= qReport8RESTLITRES.AsFloat;
              List.Cells[CurRow, NPPrices[i].Column2]:= qReport8PRIHODLITRES.AsFloat;
              List.Cells[CurRow, NPPrices[i].Column3]:= qReport8RASHODLITRES.AsFloat;
             end;

           OldAutoID:= qReport8AUTOID.AsInteger;
           OldGroup:= qReport8GROUPNUMBER.AsInteger;
           StartRow:= CurRow;
         end
        else
         begin // ���������� �� ������ �������
          if OldAutoID <> qReport8AUTOID.AsInteger then
           begin // �������� ����� ������
            // ����� �� ���������� ������
            List.Cells[CurRow, NPPrices[10].Column1]:=
              '= ' + ExcelStr(NPPrices[1].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column1) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column1) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column2]:=
              '= ' + ExcelStr(NPPrices[1].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column2) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column2) + IntToStr(CurRow);

            List.Cells[CurRow, NPPrices[10].Column3]:=
              '= ' + ExcelStr(NPPrices[1].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[2].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[3].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[4].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[5].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[6].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[7].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[8].Column3) + IntToStr(CurRow) + '+'
                   + ExcelStr(NPPrices[9].Column3) + IntToStr(CurRow);

            for i:= 1 to 10 do
             begin
              List.Cells[CurRow, NPPrices[i].Column4]:=
               '= ' + ExcelStr(NPPrices[i].Column1) + IntToStr(CurRow) + '+'
                    + ExcelStr(NPPrices[i].Column2) + IntToStr(CurRow) + '-'
                    + ExcelStr(NPPrices[i].Column3) + IntToStr(CurRow);
             end;


            // ������� ������
            Inc(CurRow);

            List.Cells[CurRow, 1]:= qReport8GROUPNUMBER.AsString;
            List.Cells[CurRow, 2]:= QReport8AUTOMODEL.AsString;
            List.Cells[CurRow, 3]:= QReport8AUTONUMB.AsString;

            // ������� �������� �� ������
            for i:= 1 to 9 do
             if NPPrices[i].NP = qReport8NPTYPE.AsInteger then
              begin
               List.Cells[CurRow, NPPrices[i].Column1]:= qReport8RESTLITRES.AsFloat;
               List.Cells[CurRow, NPPrices[i].Column2]:= qReport8PRIHODLITRES.AsFloat;
               List.Cells[CurRow, NPPrices[i].Column3]:= qReport8RASHODLITRES.AsFloat;
              end;

            OldAutoID:= qReport8AUTOID.AsInteger;
           end
          else
           begin
            // ������� �������� �� ������
            for i:= 1 to 9 do
             if NPPrices[i].NP = qReport8NPTYPE.AsInteger then
              begin
               List.Cells[CurRow, NPPrices[i].Column1]:= qReport8RESTLITRES.AsFloat;
               List.Cells[CurRow, NPPrices[i].Column2]:= qReport8PRIHODLITRES.AsFloat;
               List.Cells[CurRow, NPPrices[i].Column3]:= qReport8RASHODLITRES.AsFloat;
              end;
           end;
         end;

        QReport8.Next;
       end;

      ProgrForm.AddProgress(20);

      // ��������� ������
      if CurRow <> (RowOffSet - 1) then
       begin
        // ����� �� ���������� ������
        List.Cells[CurRow, NPPrices[10].Column1]:=
          '= ' + ExcelStr(NPPrices[1].Column1) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[2].Column1) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[3].Column1) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[4].Column1) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[5].Column1) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[6].Column1) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[7].Column1) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[8].Column1) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[9].Column1) + IntToStr(CurRow);

        List.Cells[CurRow, NPPrices[10].Column2]:=
          '= ' + ExcelStr(NPPrices[1].Column2) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[2].Column2) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[3].Column2) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[4].Column2) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[5].Column2) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[6].Column2) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[7].Column2) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[8].Column2) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[9].Column2) + IntToStr(CurRow);

        List.Cells[CurRow, NPPrices[10].Column3]:=
          '= ' + ExcelStr(NPPrices[1].Column3) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[2].Column3) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[3].Column3) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[4].Column3) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[5].Column3) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[6].Column3) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[7].Column3) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[8].Column3) + IntToStr(CurRow) + '+'
               + ExcelStr(NPPrices[9].Column3) + IntToStr(CurRow);

        for i:= 1 to 10 do
         begin
          List.Cells[CurRow, NPPrices[i].Column4]:=
           '= ' + ExcelStr(NPPrices[i].Column1) + IntToStr(CurRow) + '+'
                + ExcelStr(NPPrices[i].Column2) + IntToStr(CurRow) + '-'
                + ExcelStr(NPPrices[i].Column3) + IntToStr(CurRow);
         end;

        if StartRow <> CurRow then
         List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4) +
                    IntToStr(CurRow)].Borders[xlInsideHorizontal].LineStyle:= 1;

        List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4) +
                   IntToStr(CurRow)].Borders[xlInsideVertical].LineStyle:= 1;
        List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4) +
                   IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;
        List.Range['A' + IntToStr(StartRow), ExcelStr(NPPrices[10].Column4) +
                   IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;

        Inc(CurRow);

        List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4) +
                  IntToStr(CurRow)].Borders[xlEdgeBottom].LineStyle:= 1;

        List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4) +
                  IntToStr(CurRow)].Borders[xlEdgeTop].LineStyle:= 1;

        List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4) +
                  IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;

        List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4) +
                  IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;

        List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                  IntToStr(CurRow)].Borders[xlInsideVertical].LineStyle:= 1;
//        List.Rows[CurRow].Borders[xlInsideVertical].LineStyle:= 1;

        List.Rows[CurRow].Font.Bold:= true;

        List.Cells[CurRow, 1]:= TranslateText('����� �� ������ �') + IntToStr(OldGroup);
        List.Range['A' + IntToStr(CurRow),'C' + IntToStr(CurRow)].MergeCells:= True;
        List.Range['A' + IntToStr(CurRow),'C' + IntToStr(CurRow)].HorizontalAlignment:= xlHAlignCenter;
        SumRows:= SumRows + '*' + IntToStr(CurRow);

        for i:= NPPrices[1].Column1 to NPPrices[10].Column4 do
         begin
          // ��� �� �������� ��������� SubTotal ��� ������� ���� ��������� ������� �
          // "������->���������->�������->�������������� ������ � ������ Excel ��� �����"
          List.Cells[CurRow, i]:=
           '=SUBTOTAL(9;' +  ExcelStr(i) + IntToStr(StartRow) +
                      ':' +  ExcelStr(i) + IntToStr(CurRow - 1) + ')';
         end;
       end;

       Inc(CurRow);

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4) +
                 IntToStr(CurRow)].Borders[xlEdgeBottom].LineStyle:= 1;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4) +
                 IntToStr(CurRow)].Borders[xlEdgeTop].LineStyle:= 1;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4) +
                 IntToStr(CurRow)].Borders[xlEdgeRight].LineStyle:= 1;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4) +
                 IntToStr(CurRow)].Borders[xlEdgeLeft].LineStyle:= 1;

       List.Range['A' + IntToStr(CurRow), ExcelStr(NPPrices[10].Column4 + 1) +
                 IntToStr(CurRow)].Borders[xlInsideVertical].LineStyle:= 1;
//       List.Rows[CurRow].Borders[xlInsideVertical].LineStyle:= 1;

       List.Rows[CurRow].Font.Bold:= true;

       List.Cells[CurRow, 1]:= '����� �� �������';


       List.Range['A' + IntToStr(CurRow),'C' + IntToStr(CurRow)].MergeCells:= True;
       List.Range['A' + IntToStr(CurRow),'C' + IntToStr(CurRow)].HorizontalAlignment:= xlHAlignCenter;

       // ��������� �������� ����� � ����������� �������
       for i:= NPPrices[1].Column1 to NPPrices[10].Column4 do
        begin
         List.Cells[CurRow, i]:=
          '=' + StringReplace(SumRows, '*', ExcelStr(i), [rfReplaceAll, rfIgnoreCase]);

         List.Columns[i].AutoFit;
        end;

      ProgrForm.AddProgress(5);

      ProgrForm.Close;
      Self.Repaint;

      ShowExcel;
     finally
      IWorkbook := nil;
     end;
    end;

  finally
   qReport8.Close;

   ProgrForm.Free;
  end;

 except
  on E:Exception do
   begin
    HideExcel;
    MessageDlg(TranslateText('������: ') + E.message, mtError, [mbOk], 0);
    ReleaseExcel;
   end;
 end;
end;

end.
