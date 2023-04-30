unit Qizmos.SettingsSimulatorsForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  System.Win.Registry,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls,
  Qodelib.Panels,
  Qizmos.Forms;

type
  TwSettingsSimulatorsForm = class(TManagedForm)
    pnSmtpBlackhole: TQzPanel;
    txSmtpBlackhole: TLabel;
    pnSmtpActiveOnStartup: TQzPanel;
    txSmtpActiveOnStartup: TLabel;
    tsSmtpActiveOnStartup: TToggleSwitch;
    procedure FormCreate(Sender: TObject);
    procedure tsSmtpActiveOnStartupClick(Sender: TObject);
  private
    { Private-Deklarationen }
    procedure LoadValues;
  protected
    procedure FontChanged; override;
  public
    { Public-Deklarationen }
  end;

var
  wSettingsSimulatorsForm: TwSettingsSimulatorsForm;

implementation

{$R *.dfm}

uses
  Qizmos.Settings;

{ TwSettingsCommonForm }

procedure TwSettingsSimulatorsForm.FontChanged;
const
  DefaultHeight1 = 32;
begin
  inherited;
  txSmtpBlackhole.Font := Font;
  txSmtpBlackhole.Font.Size := Font.Size + 2;

  pnSmtpBlackhole.Height := DefaultHeight1 + Font.Size;
  pnSmtpActiveOnStartup.Height := DefaultHeight1 + Font.Size;
end;

procedure TwSettingsSimulatorsForm.FormCreate(Sender: TObject);
begin
  LoadValues;
end;

procedure TwSettingsSimulatorsForm.LoadValues;
const
  ToggleSwitcheStates: array[Boolean] of TToggleSwitchState = (tssOff, tssOn);
begin
  tsSmtpActiveOnStartup.State := ToggleSwitcheStates[ApplicationSettings.SmtpServer.ActiveOnStartup];
end;

procedure TwSettingsSimulatorsForm.tsSmtpActiveOnStartupClick(Sender: TObject);
begin
  ApplicationSettings.SmtpServer.ActiveOnStartup := tsSmtpActiveOnStartup.State = tssOn;
end;

end.
