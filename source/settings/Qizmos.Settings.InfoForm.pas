unit Qizmos.Settings.InfoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.VirtualImage,
  Qodelib.ManagedForms,
  Qizmos.Core.Forms;

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
  protected
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
  end;

var
  wSettingsInfoForm: TwSettingsInfoForm;

implementation

{$R *.dfm}

uses
  Qodelib.IOUtils,
  Qizmos.Core.Types;

{ TwSettingsInfoForm }

procedure TwSettingsInfoForm.FormCreate(Sender: TObject);
begin
  txVersion.Caption := 'Version ' + TVersionHelper.GetAppVersion;
end;

function TwSettingsInfoForm.GetFormId: TQzManagedFormId;
begin
  Result := mfSettingsInfo;
end;

function TwSettingsInfoForm.GetImageIndex: Integer;
begin
  Result := iiSettingsInfo;
end;

procedure TwSettingsInfoForm.txWebsiteLinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  if LinkType = sltURL then
    ShellExecute(0, 'open', PChar(Link), nil, nil, SW_SHOWNORMAL);
end;

end.
