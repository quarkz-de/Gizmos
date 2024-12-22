unit Qizmos.Settings.SimulatorsForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.NumberBox,
  Qodelib.Panels, Qodelib.ManagedForms,
  Qizmos.Core.Forms;

type
  TwSettingsSimulatorsForm = class(TManagedForm)
    pnSmtpBlackhole: TQzPanel;
    txSmtpBlackhole: TLabel;
    pnSmtpActiveOnStartup: TQzPanel;
    txSmtpActiveOnStartup: TLabel;
    tsSmtpActiveOnStartup: TToggleSwitch;
    pnHttpBlackhole: TQzPanel;
    txHttpBlackhole: TLabel;
    pnHttpActiveOnStartup: TQzPanel;
    txHttpActiveOnStartup: TLabel;
    tsHttpActiveOnStartup: TToggleSwitch;
    pnHttpPort: TQzPanel;
    txHttpPort: TLabel;
    pnHttpResultText: TQzPanel;
    txHttpResultText: TLabel;
    pnHttpResultCode: TQzPanel;
    txHttpResultCode: TLabel;
    edHttpPort: TNumberBox;
    edHttpResultCode: TNumberBox;
    edHttpResultText: TEdit;
    pnSmtpPresentNotification: TQzPanel;
    txSmtpPresentNotification: TLabel;
    tsSmtpPresentNotification: TToggleSwitch;
    procedure edHttpPortExit(Sender: TObject);
    procedure edHttpResultCodeChange(Sender: TObject);
    procedure edHttpResultTextChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tsHttpActiveOnStartupClick(Sender: TObject);
    procedure tsSmtpActiveOnStartupClick(Sender: TObject);
    procedure tsSmtpPresentNotificationClick(Sender: TObject);
  private
    procedure LoadValues;
  protected
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
    procedure FontChanged; override;
  end;

var
  wSettingsSimulatorsForm: TwSettingsSimulatorsForm;

implementation

{$R *.dfm}

uses
  Qizmos.Core.Types, Qizmos.Core.Settings, Qizmos.Settings.FormHelpers;

{ TwSettingsCommonForm }

procedure TwSettingsSimulatorsForm.edHttpPortExit(Sender: TObject);
begin
  ApplicationSettings.HttpServer.Port := edHttpPort.ValueInt;
end;

procedure TwSettingsSimulatorsForm.edHttpResultCodeChange(Sender: TObject);
begin
  ApplicationSettings.HttpServer.ResultCode := edHttpResultCode.ValueInt;
end;

procedure TwSettingsSimulatorsForm.edHttpResultTextChange(Sender: TObject);
begin
  ApplicationSettings.HttpServer.ResultText := edHttpResultText.Text;
end;

procedure TwSettingsSimulatorsForm.FontChanged;
begin
  inherited;
  TSettingsFormPanelHelper.UpdatePanelFonts(self);
end;

procedure TwSettingsSimulatorsForm.FormCreate(Sender: TObject);
begin
  LoadValues;
end;

function TwSettingsSimulatorsForm.GetFormId: TQzManagedFormId;
begin
  Result := mfSettingsSimulators;
end;

function TwSettingsSimulatorsForm.GetImageIndex: Integer;
begin
  Result := iiSettingsSimulators;
end;

procedure TwSettingsSimulatorsForm.LoadValues;
begin
  tsSmtpActiveOnStartup.State := SwitchStates[ApplicationSettings.SmtpServer.ActiveOnStartup];
  tsSmtpPresentNotification.State := SwitchStates[ApplicationSettings.SmtpServer.PresentNotification];
  tsHttpActiveOnStartup.State := SwitchStates[ApplicationSettings.HttpServer.ActiveOnStartup];
  edHttpPort.Value := ApplicationSettings.HttpServer.Port;
  edHttpResultCode.Value := ApplicationSettings.HttpServer.ResultCode;
  edHttpResultText.Text := ApplicationSettings.HttpServer.ResultText;
end;

procedure TwSettingsSimulatorsForm.tsHttpActiveOnStartupClick(Sender: TObject);
begin
  ApplicationSettings.HttpServer.ActiveOnStartup := tsHttpActiveOnStartup.State = tssOn;
end;

procedure TwSettingsSimulatorsForm.tsSmtpActiveOnStartupClick(Sender: TObject);
begin
  ApplicationSettings.SmtpServer.ActiveOnStartup := tsSmtpActiveOnStartup.State = tssOn;
end;

procedure TwSettingsSimulatorsForm.tsSmtpPresentNotificationClick(
  Sender: TObject);
begin
  ApplicationSettings.SmtpServer.PresentNotification := tsSmtpPresentNotification.State = tssOn;
end;

end.
