unit Qizmos.Settings.RedmineForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.NumberBox,
  Qodelib.Panels, Qodelib.ManagedForms,
  Qizmos.Core.Forms;

type
  TwSettingsRedmineForm = class(TManagedForm)
    pnServer: TQzPanel;
    txServer: TLabel;
    pnActiveOnStartup: TQzPanel;
    txActiveOnStartup: TLabel;
    tsActiveOnStartup: TToggleSwitch;
    pnUser: TQzPanel;
    txUser: TLabel;
    pnHostname: TQzPanel;
    txHostname: TLabel;
    pnApiKey: TQzPanel;
    txApiKey: TLabel;
    edApiKey: TEdit;
    edHostname: TEdit;
    pnRefresh: TQzPanel;
    txRefresh: TLabel;
    pnTicketListRefreshInterval: TQzPanel;
    txTicketListRefreshInterval: TLabel;
    tbTicketListRefreshInterval: TTrackBar;
    procedure edApiKeyChange(Sender: TObject);
    procedure edHostnameChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbTicketListRefreshIntervalChange(Sender: TObject);
    procedure tsActiveOnStartupClick(Sender: TObject);
  private
    procedure LoadValues;
  protected
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
    procedure FontChanged; override;
  end;

var
  wSettingsRedmineForm: TwSettingsRedmineForm;

implementation

{$R *.dfm}

uses
  Qizmos.Core.Types, Qizmos.Core.Settings, Qizmos.Settings.FormHelpers;

{ TwSettingsCommonForm }

procedure TwSettingsRedmineForm.edApiKeyChange(Sender: TObject);
begin
  ApplicationSettings.Redmine.ApiKey := edApiKey.Text;
end;

procedure TwSettingsRedmineForm.edHostnameChange(Sender: TObject);
begin
  ApplicationSettings.Redmine.Host := edHostname.Text;
end;

procedure TwSettingsRedmineForm.FontChanged;
begin
  inherited;
  TSettingsFormPanelHelper.UpdatePanelFonts(self);
end;

procedure TwSettingsRedmineForm.FormCreate(Sender: TObject);
begin
  LoadValues;
end;

function TwSettingsRedmineForm.GetFormId: TQzManagedFormId;
begin
  Result := mfSettingsRedmine;
end;

function TwSettingsRedmineForm.GetImageIndex: Integer;
begin
  Result := iiSettingsRedmine;
end;

procedure TwSettingsRedmineForm.LoadValues;
begin
  tsActiveOnStartup.State := SwitchStates[ApplicationSettings.Redmine.ActiveOnStartup];
  edHostname.Text := ApplicationSettings.Redmine.Host;
  edApiKey.Text := ApplicationSettings.Redmine.ApiKey;
  tbTicketListRefreshInterval.Position := ApplicationSettings.Redmine.TicketListRefreshInterval;
end;

procedure TwSettingsRedmineForm.tbTicketListRefreshIntervalChange(Sender:
    TObject);
begin
  ApplicationSettings.Redmine.TicketListRefreshInterval := tbTicketListRefreshInterval.Position;
end;

procedure TwSettingsRedmineForm.tsActiveOnStartupClick(Sender: TObject);
begin
  ApplicationSettings.Redmine.ActiveOnStartup := tsActiveOnStartup.State = tssOn;
end;

end.
