unit Qizmos.Redmine.UserForm;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes, System.ImageList,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls,
  Vcl.VirtualImage, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ImgList, Vcl.VirtualImageList,
  Qodelib.ManagedForms, Qodelib.Panels,
  Qizmos.Core.Forms, Qizmos.Core.Settings, Qizmos.Redmine.Api,
  Qizmos.Redmine.Classes;

type
  TwRedmineUserForm = class(TManagedForm)
    pnHeader: TQzPanel;
    txCaption: TLabel;
    imIcon: TVirtualImage;
    txIdLabel: TLabel;
    txId: TLabel;
    txLoginLabel: TLabel;
    txLogin: TLabel;
    txVornameLabel: TLabel;
    txFirstname: TLabel;
    txLastnameLabel: TLabel;
    txLastname: TLabel;
    txMailLabel: TLabel;
    txMail: TLabel;
    btRefresh: TSpeedButton;
    vilLargeIcons: TVirtualImageList;
    txMyPage: TLinkLabel;
    imMyPage: TVirtualImage;
    procedure btRefreshClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure txMyPageLinkClick(Sender: TObject; const Link: string; LinkType:
        TSysLinkType);
  private
    FRedmineUser: TRedmineUser;
  protected
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
    procedure LoadValues;
    procedure UpdateValues;
    procedure ClearValues;
    property RedmineUser: TRedmineUser read FRedmineUser;
  end;

var
  wRedmineUserForm: TwRedmineUserForm;

implementation

{$R *.dfm}

uses
  Qizmos.Core.Types;

{ TwRedmineUserForm }

procedure TwRedmineUserForm.btRefreshClick(Sender: TObject);
begin
  LoadValues;
end;

procedure TwRedmineUserForm.ClearValues;
begin
  txId.Caption := '';
  txLogin.Caption := '';
  txFirstname.Caption := '';
  txLastname.Caption := '';
  txMail.Caption := '';
end;

procedure TwRedmineUserForm.FormCreate(Sender: TObject);
begin
  FRedmineUser := TRedmineUser.Create;
  if ApplicationSettings.Redmine.ActiveOnStartup then
    LoadValues
  else
    ClearValues;
  txMyPage.Caption := Format('<a href="%s">Meine Seite</a>', [TRedmineApi.GetMyPageUrl]);
end;

procedure TwRedmineUserForm.FormDestroy(Sender: TObject);
begin
  FRedmineUser.Free;
end;

function TwRedmineUserForm.GetFormId: TQzManagedFormId;
begin
  Result := mfRedmineUser;
end;

function TwRedmineUserForm.GetImageIndex: Integer;
begin
  Result := iiRedmineUser;
end;

procedure TwRedmineUserForm.LoadValues;
begin
  TRedmineApi.LoadUserData(RedmineUser);
  UpdateValues;
end;

procedure TwRedmineUserForm.txMyPageLinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  if LinkType = sltURL then
    ShellExecute(0, 'open', PChar(Link), nil, nil, SW_SHOWNORMAL);
end;

procedure TwRedmineUserForm.UpdateValues;
begin
  txId.Caption := RedmineUser.Id.ToString;
  txLogin.Caption := RedmineUser.Login;
  txFirstname.Caption := RedmineUser.Firstname;
  txLastname.Caption := RedmineUser.Lastname;
  txMail.Caption := RedmineUser.Mail;
end;

end.
