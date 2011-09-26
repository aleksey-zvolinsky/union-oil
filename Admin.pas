{******************************************************************************}
{                              Предназначение:                                 }
{  администрирование программы OIL (формы типа "Base" и меню главной формы)    }
{  Модифицирован : 25 ноября 2008 года                                         }
{******************************************************************************}

unit Admin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids,
  ExtCtrls, StdCtrls, ComCtrls, Mask, ToolEdit, Buttons, RXCtrls, Db, MemDS,
  DBTables, CheckLst, ImgList, Menus, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  DBAccess, MemTable, DBGridEh, Variants, DBGridEhGrouping, GridsEh;

type
  TAdminForm = class(TCommonForm)
    Panel1: TPanel;
    nbWork: TNotebook;
    bUserClose: TBitBtn;
    bUserOk: TBitBtn;
    bFormClose: TBitBtn;
    ImageTree: TImageList;
    mtFormAccess: TMemoryTable;
    mtFormAccessFormName: TStringField;
    dsFormAccess: TDataSource;
    mtFormAccessid: TIntegerField;
    mtFormAccessFormText: TStringField;
    pAccess: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    PageControl3: TPageControl;
    tsMenu: TTabSheet;
    MenuTree: TTreeView;
    tsForm: TTabSheet;
    dbgFormAccess: TDBGridEh;
    qWork2: TOilQuery;
    qWork1: TOilQuery;
    mtFormAccessBAdd: TBooleanField;
    mtFormAccessBDel: TBooleanField;
    mtFormAccessBEdit: TBooleanField;
    mtFormAccessBAddPrevious: TBooleanField;
    mtFormAccessBEditPrevious: TBooleanField;
    mtFormAccessBDelPrevious: TBooleanField;
    Label1: TLabel;
    ceUsers: TComboEdit;
    GroupBox1: TGroupBox;
    lLogin: TLabel;
    lEnterPassw: TLabel;
    lConfirmPassw: TLabel;
    edLogin: TEdit;
    edEnterPassw: TEdit;
    edConfirmPassw: TEdit;
    Label4: TLabel;
    edPost: TEdit;
    edMail: TEdit;
    Label6: TLabel;
    edPhone: TEdit;
    Label5: TLabel;
    mtUser: TMemoryTable;
    dsUser: TDataSource;
    mtUserID: TIntegerField;
    mtUserLOGIN: TStringField;
    mtUserPASSWORD: TStringField;
    mtUserU_NAME: TStringField;
    mtUserPOST: TStringField;
    mtUserTEL: TStringField;
    mtUserE_MAIL: TStringField;
    mtUserHIDDEN: TStringField;
    pmFormAccess: TPopupMenu;
    nFormAccess1: TMenuItem;
    nFormAccess2: TMenuItem;
    pUser: TPanel;
    dbgUsers: TDBGridEh;
    nFormAccess3: TMenuItem;
    qMenu: TOilQuery;
    qMenu1: TOilQuery;
    qMenu2: TOilQuery;
    qMenu3: TOilQuery;
    qMainMenu: TOilQuery;
    qUserMenu: TOilQuery;
    Panel2: TPanel;
    sbAddUser: TSpeedButton;
    sbDelUser: TSpeedButton;
    sbEditUser: TSpeedButton;
    Panel3: TPanel;
    bbPrint: TBitBtn;
    mtUserEMP_ID: TIntegerField;
    mtUserEMP_INST: TIntegerField;
    procedure ceUsersButtonClick(Sender: TObject);
    procedure bUserCloseClick(Sender: TObject); // відміна
    procedure bUserOkClick(Sender: TObject); // прийняти
    function CheckPassword(var Msg : string): boolean;
    procedure MenuTreeChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
    procedure GetFormAccess(p_User: integer);
    procedure dbgFormAccessGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GetUsers;
    procedure nFormAccess1Click(Sender: TObject);
    procedure nFormAccess2Click(Sender: TObject);
    procedure SelectAll(Rez: integer);
    procedure sbAddUserClick(Sender: TObject);
    procedure sbDelUserClick(Sender: TObject);
    procedure sbEditUserClick(Sender: TObject);
    procedure nFormAccess3Click(Sender: TObject);
    procedure AccessRef(Rez: boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsUserDataChange(Sender: TObject; Field: TField);
    procedure pAccessChange(Sender: TObject);
    procedure bbPrintClick(Sender: TObject);
  private
    FEmpId, FEmpInst: integer;
  public
  end;

 TObjMenu = ^PObjMenu; // права на меню
 PObjMenu =
   record
     index: integer; // AbsoluteIndex в дереві або id_user
     object_id: integer;
     object_name: string[50];
     default: string[1];
   end;

implementation

{$R *.DFM}

Uses Passw, EmpRef, Main, OilStd, UDbFunc, ExcelFunc, ExFunc;

var
  UserID: integer; // 0 - користувача не вибрали, не 0 - користувач вибраний
  MenuObj: TObjMenu; // об'єкти меню із БД
  MenuObjList: TList;

//==============================================================================
procedure TAdminForm.bUserOkClick(Sender: TObject); // кнопка принять
var
  Msg: string;
  i: integer;
begin
  if not CheckPassword(Msg) then
  begin
    MessageDlg(Msg, mtError,[mbOk],0);
    exit;
  end;

  if (ceUsers.text = '') or (edLogin.text = '') then
  begin
    MessageDlg(TranslateText('Не полностью определены параметры пользователя'), mtError, [mbOk], 0);
    exit;
  end;

  try
    StartSqlOra;
    if UserID = 0 then UserID := GetSeqNextVal('S_ADM_USERS');
    InsOrUpdRecord('ADM_USERS',
      ['ID',        UserID,
       'PASSWORD',  edEnterPassw.Text,
       'LOGIN',     edLogin.Text,
       'U_NAME',    ceUsers.Text,
       'POST',      edPost.Text,
       'TEL',       edPhone.Text,
       'E_MAIL',    edMail.Text,
       'HIDDEN',    'N',
       'EMP_ID',    BoolTo_(FEmpId=0,null,FEmpId),
       'EMP_INST',  BoolTo_(FEmpInst=0,null,FEmpInst)
      ]);
    _ExecSql(' delete from adm_user_right where user_id = ' + IntToStr(UserID));
    // зберігаємо права на кнопочки
    dbgFormAccess.DataSource.DataSet.DisableControls;
    mtFormAccess.First;
    while not mtFormAccess.Eof do
    begin
      if mtFormAccess.FieldByName('BAdd').AsBoolean = true then
        InsOrUpdRecord('ADM_USER_RIGHT',
          ['ID',         GetSeqNextVal('S_ADM_USER_RIGHT'),
           'USER_ID',    UserID,
           'OBJECT_ID',  mtFormAccess.FieldByName('id').AsInteger,
           'RIGHT_ID',   1
          ]);
      if mtFormAccess.FieldByName('BEdit').AsBoolean = true then
        InsOrUpdRecord('ADM_USER_RIGHT',
          ['ID',         GetSeqNextVal('S_ADM_USER_RIGHT'),
           'USER_ID',    UserID,
           'OBJECT_ID',  mtFormAccess.FieldByName('id').AsInteger,
           'RIGHT_ID',   2
          ]);
      if mtFormAccess.FieldByName('BDel').AsBoolean = true then
        InsOrUpdRecord('ADM_USER_RIGHT',
          ['ID',         GetSeqNextVal('S_ADM_USER_RIGHT'),
           'USER_ID',    UserID,
           'OBJECT_ID',  mtFormAccess.FieldByName('id').AsInteger,
           'RIGHT_ID',   3
          ]);
      mtFormAccess.Next;
    end;
    dbgFormAccess.DataSource.DataSet.EnableControls;
    // зберігаємо права на меню
    for i := 0 to MenuObjList.Count - 1 do
    begin
      MenuObj := MenuObjList.Items[i];
      if (MenuTree.Items.Item[MenuObj.Index].ImageIndex = 1) or (MenuTree.Items.Item[MenuObj.Index].ImageIndex = 0) then
        InsOrUpdRecord('ADM_USER_RIGHT',
          ['ID',         GetSeqNextVal('S_ADM_USER_RIGHT'),
           'USER_ID',    UserID,
           'OBJECT_ID',  MenuObj.Object_id,
           'RIGHT_ID',   10
          ]);
    end;
    CommitSqlOra;
    UserID := 0;
    FEmpId := 0;
    FEmpInst := 0;
    AccessRef(false);
    GetUsers;
  except On E:Exception Do
    begin
      MessageDlg(TranslateText('Ошибка : ') + E.message, mtError, [mbOk], 0);
      RollbackSQL;
    end;
  end;
end;
//==============================================================================
procedure TAdminForm.MenuTreeChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
var
  IsAll: boolean;
  //****************************************************************************
  procedure TopChecked(ImageIndex: integer); // якщо усі Checked, то і верх також Checked
  var
    i: integer;
    //--------------------------------------------------------------------------
    procedure ParentChecked;
    begin
      if Node.Parent <> nil then
      begin
        Node.Parent.ImageIndex := 0;
        if Node.Parent.Parent <> nil then
        Begin
          Node.Parent.Parent.ImageIndex := 0;
          if Node.Parent.Parent.Parent <> nil then Node.Parent.Parent.Parent.ImageIndex := 0;
        End;
      end;
      IsAll := False;
    end;
    //--------------------------------------------------------------------------
  begin
    if ImageIndex = 1 then
    begin
      if Node.Parent <> nil then
        for i := Node.Parent.getFirstChild.AbsoluteIndex to Node.Parent.GetLastChild.AbsoluteIndex do
          if ((Sender as TTreeView).Items.Item[i].ImageIndex = 1) then
          begin
            ParentChecked;
            break;
          end
          else IsAll := true;
      if IsAll = true then Node.Parent.ImageIndex := 2;
    end
    else
    begin
      if Node.Parent <> nil then
        for i := Node.Parent.getFirstChild.AbsoluteIndex to Node.Parent.GetLastChild.AbsoluteIndex do
          if ((Sender as TTreeView).Items.Item[i].ImageIndex = 2)
            or ((Sender as TTreeView).Items.Item[i].ImageIndex = 0) then
          begin
            ParentChecked;
            break;
          end
          else IsAll := true;
      if IsAll = true then Node.Parent.ImageIndex := 1;
    end;
  end;
  //****************************************************************************

  //****************************************************************************
  procedure BottomChecked(ImageIndex: integer); // якщо верх Checked, то і увесь низ Checked
  var
    i, j, p: integer;
  begin
    if Node.HasChildren then
      for i := Node.AbsoluteIndex to Node.GetLastChild.AbsoluteIndex do
      begin
        (Sender as TTreeView).Items.Item[i].ImageIndex := ImageIndex;
        if (Sender as TTreeView).Items.Item[i].HasChildren then
          for j := (Sender as TTreeView).Items.Item[i].AbsoluteIndex to
            (Sender as TTreeView).Items.Item[i].GetLastChild.AbsoluteIndex do
          begin
            (Sender as TTreeView).Items.Item[j].ImageIndex := ImageIndex;
            if (Sender as TTreeView).Items.Item[j].HasChildren then
              for p := (Sender as TTreeView).Items.Item[j].AbsoluteIndex to
                (Sender as TTreeView).Items.Item[j].GetLastChild.AbsoluteIndex do
                (Sender as TTreeView).Items.Item[p].ImageIndex := ImageIndex;
          end;
      end
    else Node.ImageIndex := ImageIndex;
  end;
  //****************************************************************************
begin
  AllowChange := false;
  IsAll := False;
  //if Node.AbsoluteIndex = 0 then exit;
  try
    if Node.ImageIndex = 1 then
    Begin
      BottomChecked(2);
      TopChecked(1);
    End
    else
    Begin
      BottomChecked(1);
      TopChecked(0);
    End;
  except
  end;
end;
//==============================================================================
procedure TAdminForm.GetFormAccess(p_User: integer);
begin
  dbgFormAccess.DataSource.DataSet.DisableControls;
  qWork1.Close;
  qWork1.SQL.Text :=
    ' select id, name as FormName, text as FormText from adm_object ' +
    ' where type = ''F'' and name <> ''MainForm'' ' +
    ' order by text';
  qWork1.Open;
  CopyToMemoryTable(qWork1, mtFormAccess, 'id,FormName,FormText');
  dbgFormAccess.DataSource.DataSet.EnableControls;
  // вставляємо розрішення на кнопки
  mtFormAccess.First;
  while not mtFormAccess.Eof do
  begin
    qWork1.Close;
    qWork1.SQL.Text :=
      ' select o.name as object_name, ' +
      '        o.text as object_text, ' +
      '        o.id as object_id, ' +
      '        u.right_id ' +
      '   from adm_user_right u, adm_object o ' +
      '  where u.user_id(+) = ' + IntToStr(UserID) + ' ' +
      '    and o.id = u.object_id(+) ' +
      '    and o.type = ''F'' ' +
      '    and o.name <> ''MainForm'' ' +
      '    and o.id = ' + mtFormAccess.FieldByName('ID').AsString;
    qWork1.Open;
    mtFormAccess.Edit;
    while not qWork1.Eof do
    begin
      case qWork1.FieldByName('right_id').AsInteger of
        1: mtFormAccess.FieldByName('BAdd').AsBoolean := true;
        2: mtFormAccess.FieldByName('BEdit').AsBoolean := true;
        3: mtFormAccess.FieldByName('BDel').AsBoolean := true;
      end;
      qWork1.Next;
    end;
    mtFormAccess.FieldByName('BAddPrevious').AsBoolean  := mtFormAccess.FieldByName('BAdd').AsBoolean;
    mtFormAccess.FieldByName('BEditPrevious').AsBoolean := mtFormAccess.FieldByName('BEdit').AsBoolean;
    mtFormAccess.FieldByName('BDelPrevious').AsBoolean  := mtFormAccess.FieldByName('BDel').AsBoolean;
    mtFormAccess.Post;
    mtFormAccess.Next;
  end;
  mtFormAccess.First;
end;
//==============================================================================
procedure TAdminForm.dbgFormAccessGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  rez: boolean;
begin
  if not ((Column.FieldName = 'BAdd') or (Column.FieldName = 'BEdit') or (Column.FieldName = 'BDel')) then exit;
  rez := false;
  if mtFormAccess.FieldByName(Column.FieldName+'Previous').AsBoolean =
    mtFormAccess.FieldByName(Column.FieldName).AsBoolean then rez := true;
  if mtFormAccess.FieldByName(Column.FieldName+'Previous').AsBoolean =
    mtFormAccess.FieldByName(Column.FieldName).AsBoolean then rez := true;
  if mtFormAccess.FieldByName(Column.FieldName+'Previous').AsBoolean =
    mtFormAccess.FieldByName(Column.FieldName).AsBoolean then rez := true;
  if rez then Background := clWindow
  else BackGround := clRed;
end;
//==============================================================================
procedure TAdminForm.GetUsers;
begin
  dbgUsers.DataSource.DataSet.DisableControls;
  qWork1.Close;
  qWork1.SQL.Text := 'select u.id, u.login, u.password, u.u_name, u.post, u.tel, u.e_mail, u.hidden, nvl(e.id,0) as emp_id, nvl(e.inst,0) as emp_inst' + #13#10 +
    '  from adm_users u, oil_employ e' + #13#10 +
    ' where u.id > 1' + #13#10 +
    '   and (u.hidden = ''N'' or u.hidden is null)' + #13#10 +
    '   and u.emp_id = e.id (+)' + #13#10 +
    '   and u.emp_inst = e.inst (+)' + #13#10 +
    '   and e.state (+) = ''Y''' + #13#10 +
    ' order by u.u_name';
  qWork1.Open;
  CopyToMemoryTable(qWork1, mtUser);
  dbgUsers.DataSource.DataSet.EnableControls;
  mtUser.First;
end;
//==============================================================================
procedure TAdminForm.nFormAccess1Click(Sender: TObject);
begin
  SelectAll(1);
end;
//==============================================================================
procedure TAdminForm.nFormAccess2Click(Sender: TObject);
begin
  SelectAll(2);
end;
//==============================================================================
procedure TAdminForm.SelectAll(Rez: integer); // 1 - вибираємо усе, 2 - убераємо усе, 3 - відновлюємо усе
begin
  dbgFormAccess.DataSource.DataSet.DisableControls;
  mtFormAccess.First;
  while not mtFormAccess.Eof do
  begin
    mtFormAccess.Edit;
    if Rez <> 3 then
    begin
      mtFormAccess.FieldByName('BAdd').AsBoolean := Rez = 1;
      mtFormAccess.FieldByName('BEdit').AsBoolean := Rez = 1;
      mtFormAccess.FieldByName('BDel').AsBoolean := Rez = 1;
    end
    else
    begin
      mtFormAccess.FieldByName('BAdd').AsBoolean := mtFormAccess.FieldByName('BAddPrevious').AsBoolean;
      mtFormAccess.FieldByName('BEdit').AsBoolean := mtFormAccess.FieldByName('BEditPrevious').AsBoolean;
      mtFormAccess.FieldByName('BDel').AsBoolean := mtFormAccess.FieldByName('BDelPrevious').AsBoolean;
    end;
    mtFormAccess.Next;
  end;
  dbgFormAccess.DataSource.DataSet.EnableControls;
  mtFormAccess.First;
end;
//==============================================================================
procedure TAdminForm.nFormAccess3Click(Sender: TObject);
begin
  SelectAll(3);
end;
//==============================================================================
procedure TAdminForm.sbAddUserClick(Sender: TObject); // новий користувач
var
  i: integer;
begin
  UserID := 0;
  FEmpId := 0;
  FEmpInst := 0;
  AccessRef(true);
  GetFormAccess(-1);
  if MessageDlg(TranslateText('Вы хотите загрузить стандартную конфигурацию меню ?'),
    mtInformation, [mbYes, mbNo], 0) = mrYes then
  Begin
    for i := 0 to MenuObjList.Count - 1 do
    begin
      MenuObj := MenuObjList.Items[i];
      if MenuObj.default = 'Y' then MenuTree.Items.Item[MenuObj.Index].ImageIndex := 1
      else MenuTree.Items.Item[MenuObj.Index].ImageIndex := 2;
    end;
  end;
end;
//==============================================================================
procedure TAdminForm.sbDelUserClick(Sender: TObject);
begin
  try
    if not mtUser.IsEmpty then
      if mtUser.FieldByName('ID').AsInteger = 1 then
      begin
        MessageDlg(TranslateText('Данного пользователя нельзя удалять!'), mtInformation, [mbOk], 0);
        exit;
      end;

      If (mtUser.FieldByName('ID').AsInteger > 0) and
        (MessageDlg(TranslateText('Вы уверены что хотите удалить пользователя ?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
      begin
        StartSQL;
        _ExecSql(' DELETE FROM ADM_USER_RIGHT WHERE USER_ID = ' + mtUser.FieldByName('ID').AsString);
        _ExecSql(' DELETE FROM ADM_USERS WHERE ID = ' + mtUser.FieldByName('ID').AsString);
        CommitSQL;
        AccessRef(false);
        GetUsers;
      end;
  except On E: Exception Do
    begin
      MessageDlg(TranslateText('Ошибка : ') + E.message, mtError, [mbOk], 0);
      RollbackSQL;
    end;
  end;
end;
//==============================================================================
procedure TAdminForm.sbEditUserClick(Sender: TObject); // редагування користувача
var
  i: integer;
begin
  if not mtUser.IsEmpty then
  begin
    dsUserDataChange(nil, nil);
    GetFormAccess(UserID);
    // Беремо права на меню і підставляємо
    qWork1.Close;
    qWork1.SQl.Text := 'select * from v_user_rights_menu where user_id = ' + IntToStr(UserID);
    qWork1.Open;

    qMainMenu.Close;
    qMainMenu.Open;
    qUserMenu.Close;
    qUserMenu.ParamByName('user_id').AsInteger := UserID;
    qUserMenu.Open;

    for i := 0 to MenuTree.Items.count - 1 do
      MenuTree.Items.Item[i].ImageIndex := 2;
    while not qWork1.Eof do
    begin
      for i := 0 to MenuObjList.Count - 1 do
      begin
        MenuObj := MenuObjList.Items[i];
        if MenuObj.Object_id = qWork1.FieldByName('object_id').Value then
        begin
          MenuTree.Items.Item[MenuObj.Index].ImageIndex := 1;
          break;
        end;

        if MenuTree.Items.Item[MenuObj.Index].HasChildren then
        begin
          qMainMenu.Filtered := false;
          qMainMenu.Filter := 'mainmenu = ' + IntToStr(MenuObj.Object_id);
          qMainMenu.Filtered := true;

          qUserMenu.Filtered := false;
          qUserMenu.Filter := 'mainmenu = ' + IntToStr(MenuObj.Object_id);
          qUserMenu.Filtered := true;

          if qMainMenu.FieldByName('mnum').AsInteger > qUserMenu.FieldByName('mnum').AsInteger then
            MenuTree.Items.Item[MenuObj.Index].ImageIndex := 0;
          if qUserMenu.FieldByName('mnum').AsInteger = 0 then
            MenuTree.Items.Item[MenuObj.Index].ImageIndex := 2;
        end;
      end;
      qWork1.Next;
    end;
    AccessRef(true);
  end;
end;
//==============================================================================
procedure TAdminForm.AccessRef(Rez: boolean);
begin
  pUser.Enabled := not Rez;
  sbAddUser.Enabled := not Rez;
  sbDelUser.Enabled := not Rez;
  sbEditUser.Enabled := not Rez;

  if Rez = false then
  begin
    ceUsers.Color := clBtnFace;
    edLogin.Color := clBtnFace;
    edEnterPassw.Color := clBtnFace;
    edConfirmPassw.Color := clBtnFace;
    edPost.Color := clBtnFace;
    edPhone.Color := clBtnFace;
    edMail.Color := clBtnFace;
    dbgFormAccess.Color := clBtnFace;
    MenuTree.Color := clBtnFace;
    nbWork.ActivePage := '2';
    pAccess.ActivePage := TabSheet3;
    PageControl3.ActivePage := tsMenu;
  end
  else
  begin
    ceUsers.Color := clWindow;
    edLogin.Color := clWindow;
    edEnterPassw.Color := clWindow;
    edConfirmPassw.Color := clWindow;
    edPost.Color := clWindow;
    edPhone.Color := clWindow;
    edMail.Color := clWindow;
    dbgFormAccess.Color := clWindow;
    MenuTree.Color := clWindow;
    nbWork.ActivePage := '1';
  end;

  if (UserID = 0) then
  begin
    ceUsers.Text := '';
    edLogin.Text := '';
    edEnterPassw.Text := '';
    edConfirmPassw.Text := '';
    edPost.Text := '';
    edPhone.Text := '';
    edMail.Text := '';
    FEmpId := 0;
    FEmpInst := 0;
  end;

  ceUsers.Enabled := Rez;
  edLogin.Enabled := Rez;
  edEnterPassw.Enabled := Rez;
  edConfirmPassw.Enabled := Rez;
  edPost.Enabled := Rez;
  edPhone.Enabled := Rez;
  edMail.Enabled := Rez;
  dbgFormAccess.Enabled := Rez;
  MenuTree.Enabled := Rez;
end;
//==============================================================================
procedure TAdminForm.ceUsersButtonClick(Sender: TObject);
Var
  US: TEmpRefForm;
begin
  US := TEmpRefForm.Create(Application);
  try
    US.ShowModal;
    if US.ModalResult = mrOk then
      if not us.q.eof then
      begin
        ceUsers.Text := US.q.fieldbyname('F_Name').value+' '+US.q.fieldbyname('I_Name').value+' '+US.q.fieldbyname('O_Name').value;
        edPost.Text  := US.q.fieldbyname('post_').AsString;
        edPhone.Text := US.q.fieldbyname('phone').AsString;
        FEmpId := US.q.fieldbyname('id').AsInteger;
        FEmpInst := US.q.fieldbyname('inst').AsInteger;
      end;
  finally
    US.Free;
  end;
end;
//==============================================================================
procedure TAdminForm.bUserCloseClick(Sender: TObject); // отменить
begin
  GetUsers;
  AccessRef(false);
  dsUserDataChange(nil, nil);
end;
//============================================================================== 
procedure TAdminForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
//==============================================================================
procedure TAdminForm.FormShow(Sender: TObject);
begin
  inherited;
  GetUsers;
  AccessRef(false);
  UserID := 0;
  FEmpId := 0;
  FEmpInst := 0;
  nbWork.ActivePage := '2';
  pAccess.ActivePage := TabSheet3;
  PageControl3.ActivePage := tsMenu;
end;
//==============================================================================
function TAdminForm.CheckPassword(var Msg: string): boolean;
Begin
  Msg := '';
  if edEnterPassw.Text = '' then Msg := TranslateText('Не введен пароль !');
  if edEnterPassw.Text <> edConfirmPassw.Text then Msg := TranslateText('Пароль некорректно подтвержден !');
  Result := Msg = '';
End;
//==============================================================================
procedure TAdminForm.FormCreate(Sender: TObject);
var
  TreeNode1, TreeNode2, TreeNode3: TTreeNode;
  i: integer;
begin
  inherited;
  MenuObjList := Tlist.Create;
  qMenu.ParamByName('MainMenu_Id').AsInteger := 0;
  qMenu.Open;
  MenuTree.Items.Add(nil, '..');
  while not qMenu.Eof do
  Begin
    TreeNode1 := MenuTree.Items.Add(nil, qMenu.FieldByName('Text').AsString);

    new(MenuObj);
    MenuObj.index       := TreeNode1.AbsoluteIndex;
    MenuObj.object_id   := qMenu.FieldByName('id').AsInteger;
    MenuObj.object_name := qMenu.FieldByName('Text').AsString;
    MenuObj.default     := qMenu.FieldByName('Default_').AsString;
    MenuObjList.Add(MenuObj);

    qMenu1.Close;
    qMenu1.ParamByName('MainMenu_Id').AsInteger := qMenu.FieldByName('id').AsInteger;
    qMenu1.Open;
    if not qMenu1.IsEmpty then
      while not qMenu1.Eof do
      begin
        TreeNode2 := MenuTree.Items.AddChild(TreeNode1, qMenu1.FieldByName('Text').AsString);

        new(MenuObj);
        MenuObj.index       := TreeNode2.AbsoluteIndex;
        MenuObj.object_id   := qMenu1.FieldByName('id').AsInteger;
        MenuObj.object_name := qMenu1.FieldByName('Text').AsString;
        MenuObj.default     := qMenu1.FieldByName('Default_').AsString;
        MenuObjList.Add(MenuObj);

        qMenu2.Close;
        qMenu2.ParamByName('MainMenu_Id').AsInteger := qMenu1.FieldByName('id').AsInteger;
        qMenu2.Open;
        if not qMenu2.IsEmpty then
          while not qMenu2.Eof do
          begin
            TreeNode3 := MenuTree.Items.AddChild(TreeNode2, qMenu2.FieldByName('Text').AsString);

            new(MenuObj);
            MenuObj.index       := TreeNode3.AbsoluteIndex;
            MenuObj.object_id   := qMenu2.FieldByName('id').AsInteger;
            MenuObj.object_name := qMenu2.FieldByName('Text').AsString;
            MenuObj.default     := qMenu2.FieldByName('Default_').AsString;
            MenuObjList.Add(MenuObj);

            qMenu3.Close;
            qMenu3.ParamByName('MainMenu_Id').AsInteger := qMenu2.FieldByName('id').AsInteger;
            qMenu3.Open;
            if not qMenu3.IsEmpty then
              while not qMenu3.Eof do
              begin
                MenuTree.Items.AddChild(TreeNode3, qMenu3.FieldByName('Text').AsString);

                new(MenuObj);
                MenuObj.index       := TreeNode1.AbsoluteIndex;
                MenuObj.object_id   := qMenu3.FieldByName('id').AsInteger;
                MenuObj.object_name := qMenu3.FieldByName('Name').AsString;
                MenuObj.default     := qMenu3.FieldByName('Default_').AsString;
                MenuObjList.Add(MenuObj);

                qMenu3.Next;
              End;
            qMenu2.Next;
          End;
        qMenu1.Next;
      End;
    qMenu.next;
  End;
  qMenu.close;
  qMenu1.close;
  qMenu2.close;
  qMenu3.close;
  for i := 0 to MenuTree.Items.count - 1 do
    MenuTree.Items.Item[i].ImageIndex := 2;
end;
//==============================================================================
procedure TAdminForm.dsUserDataChange(Sender: TObject; Field: TField); // редагування користувача
begin
  if not mtUser.IsEmpty then
  begin
    UserID := mtUser.FieldByName('ID').AsInteger;
    FEmpId := mtUser.FieldByName('EMP_ID').AsInteger;
    FEmpInst := mtUser.FieldByName('EMP_INST').AsInteger;
    ceUsers.Text := mtUser.FieldByName('U_NAME').AsString;
    edLogin.Text := mtUser.FieldByName('LOGIN').AsString;
    edEnterPassw.Text := mtUser.FieldByName('PASSWORD').AsString;
    edConfirmPassw.Text := mtUser.FieldByName('PASSWORD').AsString;
    edPost.Text := mtUser.FieldByName('POST').AsString;
    edPhone.Text := mtUser.FieldByName('TEL').AsString;
    edMail.Text := mtUser.FieldByName('E_MAIL').AsString;
  end;
end;
//==============================================================================
procedure TAdminForm.pAccessChange(Sender: TObject);
begin
  if pUser.Enabled = true then
  begin
    pAccess.ActivePage := TabSheet3;
    MessageDlg(TranslateText('Права доступа доступны только при редактировании или добавлении пользователя'), mtInformation, [mbOk], 0);
  end;
end;
//==============================================================================
procedure TAdminForm.bbPrintClick(Sender: TObject);
begin
  if not mtFormAccess.IsEmpty then
  begin
    dbgFormAccess.DataSource.DataSet.DisableControls;
    PutGridEhToExcel(dbgFormAccess, tsForm.Caption +' для '+ ceUsers.Text);
    dbgFormAccess.DataSource.DataSet.EnableControls;
  end;
end;
//==============================================================================

end.
