unit Qizmos.App.About;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.VirtualImage;

type
  TwAbout = class(TForm)
    btOk: TButton;
    txCopyright: TLabel;
    txHomepage: TLinkLabel;
    txAppName: TLabel;
    txVersion: TLabel;
    imLogo: TVirtualImage;
    procedure FormCreate(Sender: TObject);
    procedure txHomepageLinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    function Execute: Boolean;
    class function ExecuteDialog: Boolean;
  end;

var
  wAbout: TwAbout;

implementation

uses
  Qodelib.IOUtils;

{$R *.dfm}

{ TwAbout }

procedure TwAbout.FormCreate(Sender: TObject);
begin
  txVersion.Caption := 'Version ' + TVersionHelper.GetAppVersion;
end;

function TwAbout.Execute: Boolean;
begin
  Result := ShowModal = mrOk;
end;

class function TwAbout.ExecuteDialog: Boolean;
var
  Dialog: TwAbout;
begin
  Dialog := TwAbout.Create(nil);
  try
    Result := Dialog.Execute;
  finally
    Dialog.Free;
  end;
end;

procedure TwAbout.txHomepageLinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  if LinkType = sltURL then
    ShellExecute(0, 'open', PChar(Link), nil, nil, SW_SHOWNORMAL);
end;

end.
