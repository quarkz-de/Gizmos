unit Gizmos.WelcomeForm;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.VirtualImage,
  Eventbus,
  Gizmos.Forms, Gizmos.Events;

type
  TwWelcomeForm = class(TApplicationForm)
    imLogo: TVirtualImage;
    txHeaderText: TLabel;
    txVersion: TLabel;
    txCopyright: TLabel;
    txWebsite: TLinkLabel;
    sbModules: TScrollBox;
    bt1: TButton;
    procedure bt1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imLogoClick(Sender: TObject);
    procedure txHeaderTextClick(Sender: TObject);
    procedure txWebsiteLinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
  private
  public
  end;

implementation

{$R *.dfm}

uses
  Qodelib.HighDpi, Qodelib.IOUtils,
  Gizmos.Settings, Gizmos.Main, Gizmos.DataModule,
  Gizmos.About, Gizmos.ModuleFrame;

{ TwWelcomeForm }

procedure TwWelcomeForm.bt1Click(Sender: TObject);
var
  Frame: TfrBlackholeModule;
begin
  Frame := TfrBlackholeModule.Create(self);
  Frame.Name := '';
  Frame.Parent := sbModules;
  Frame.Align := alTop;
end;

procedure TwWelcomeForm.FormCreate(Sender: TObject);
begin
  txVersion.Caption := 'Version ' + TVersionHelper.GetAppVersion;
end;

procedure TwWelcomeForm.imLogoClick(Sender: TObject);
begin
  TwAbout.ExecuteDialog;
end;

procedure TwWelcomeForm.txHeaderTextClick(Sender: TObject);
begin
  TwAbout.ExecuteDialog;
end;

procedure TwWelcomeForm.txWebsiteLinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  if LinkType = sltURL then
    ShellExecute(0, 'open', PChar(Link), nil, nil, SW_SHOWNORMAL);
end;

end.
