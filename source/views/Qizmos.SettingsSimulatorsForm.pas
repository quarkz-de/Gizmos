unit Qizmos.SettingsSimulatorsForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  System.Win.Registry,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.NumberBox,
  Qizmos.Forms, Qodelib.Panels, Qodelib.ManagedForms;

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
    procedure edHttpPortExit(Sender: TObject);
    procedure edHttpResultCodeChange(Sender: TObject);
    procedure edHttpResultTextChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tsHttpActiveOnStartupClick(Sender: TObject);
    procedure tsSmtpActiveOnStartupClick(Sender: TObject);
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
  Qizmos.Types, Qizmos.Settings, Qizmos.SettingsFormHelpers;

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

end.
