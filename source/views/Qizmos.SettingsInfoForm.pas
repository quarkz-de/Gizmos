unit Qizmos.SettingsInfoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.VirtualImage,
  Qizmos.Forms;

type
  TwSettingsInfoForm = class(TManagedForm)
    imLogo: TVirtualImage;
    txHeaderText: TLabel;
    txCopyright: TLabel;
    txWebsite: TLinkLabel;
    txVersion: TLabel;
    edLicenses: TMemo;
    txLicenses: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure txWebsiteLinkClick(Sender: TObject; const Link: string; LinkType:
        TSysLinkType);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  wSettingsInfoForm: TwSettingsInfoForm;

implementation

{$R *.dfm}

uses
  Qodelib.IOUtils;

{ TwSettingsInfoForm }

procedure TwSettingsInfoForm.FormCreate(Sender: TObject);
begin
  txVersion.Caption := 'Version ' + TVersionHelper.GetAppVersion;
end;

procedure TwSettingsInfoForm.txWebsiteLinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  if LinkType = sltURL then
    ShellExecute(0, 'open', PChar(Link), nil, nil, SW_SHOWNORMAL);
end;

end.
