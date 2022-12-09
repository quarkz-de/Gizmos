unit Blackholes.WelcomeForm;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.VirtualImage,
  Eventbus,
  Blackholes.Forms, Blackholes.Events;

type
  TwWelcomeForm = class(TApplicationForm)
    imLogo: TVirtualImage;
    txHeaderText: TLabel;
    txVersion: TLabel;
    txCopyright: TLabel;
    txWebsite: TLinkLabel;
    procedure FormCreate(Sender: TObject);
    procedure txWebsiteLinkClick(Sender: TObject; const Link: string; LinkType:
        TSysLinkType);
  private
  public
    [Subscribe]
    procedure OnThemeChange(AEvent: IThemeChangeEvent);
  end;

implementation

{$R *.dfm}

uses
  Qodelib.HighDpi, Qodelib.IOUtils,
  Blackholes.Settings, Blackholes.Main, Blackholes.DataModule;

{ TwWelcomeForm }

procedure TwWelcomeForm.FormCreate(Sender: TObject);
begin
  txVersion.Caption := 'Version ' + TVersionHelper.GetAppVersion;
  GlobalEventBus.RegisterSubscriberForEvents(Self);
end;

procedure TwWelcomeForm.OnThemeChange(AEvent: IThemeChangeEvent);
begin
  //
end;

procedure TwWelcomeForm.txWebsiteLinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  if LinkType = sltURL then
    ShellExecute(0, 'open', PChar(Link), nil, nil, SW_SHOWNORMAL);
end;

end.
