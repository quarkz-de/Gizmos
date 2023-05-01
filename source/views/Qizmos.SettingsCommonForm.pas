unit Qizmos.SettingsCommonForm;

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
  TwSettingsCommonForm = class(TManagedForm)
    pnView: TQzPanel;
    txView: TLabel;
    pnTheme: TQzPanel;
    txTheme: TLabel;
    cbTheme: TComboBox;
    pnAutoRun: TQzPanel;
    txAutoRun: TLabel;
    tsAutoRun: TToggleSwitch;
    pnFontSize: TQzPanel;
    txFontSize: TLabel;
    tbFontSize: TTrackBar;
    pnMinimizeToTray: TQzPanel;
    txMinimizeToTray: TLabel;
    tsMinimizeToTray: TToggleSwitch;
    pnStartMinimized: TQzPanel;
    txStartMinimized: TLabel;
    tsStartMinimized: TToggleSwitch;
    procedure cbAutoRunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbThemeChange(Sender: TObject);
    procedure tbFontSizeChange(Sender: TObject);
    procedure tsAutoRunClick(Sender: TObject);
    procedure tsMinimizeToTrayClick(Sender: TObject);
    procedure tsStartMinimizedClick(Sender: TObject);
  private
    { Private-Deklarationen }
    procedure LoadValues;
    procedure UpdateAutoRun;
    function IsAutoRun: Boolean;
  protected
    procedure FontChanged; override;
  public
    { Public-Deklarationen }
  end;

var
  wSettingsCommonForm: TwSettingsCommonForm;

implementation

{$R *.dfm}

uses
  Qizmos.Types, Qizmos.Settings;

const
  iiSystemTheme = 0;
  iiLightTheme = 1;
  iiDarkTheme = 2;

  RegistryAutoRunKey = 'Software\Microsoft\Windows\CurrentVersion\Run';
  RegistryAutoRunName = 'Qizmos';

{ TwSettingsCommonForm }

procedure TwSettingsCommonForm.cbAutoRunClick(Sender: TObject);
begin
  UpdateAutoRun;
end;

procedure TwSettingsCommonForm.cbThemeChange(Sender: TObject);
begin
  case cbTheme.ItemIndex of
    iiSystemTheme:
      ApplicationSettings.Theme := atSystem;
    iiLightTheme:
      ApplicationSettings.Theme := atLight;
    iiDarkTheme:
      ApplicationSettings.Theme := atDark;
  end;
end;

procedure TwSettingsCommonForm.FontChanged;
const
  DefaultHeight1 = 32;
begin
  inherited;
  txView.Font := Font;
  txView.Font.Size := Font.Size + 2;

  pnView.Height := DefaultHeight1 + Font.Size;
  pnTheme.Height := DefaultHeight1 + Font.Size;
  pnAutoRun.Height := DefaultHeight1 + Font.Size;
  pnFontSize.Height := DefaultHeight1 + Font.Size;
end;

procedure TwSettingsCommonForm.FormCreate(Sender: TObject);
begin
  LoadValues;
end;

function TwSettingsCommonForm.IsAutoRun: Boolean;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.Rootkey:= HKEY_CURRENT_USER;
    Reg.OpenKey(RegistryAutoRunKey, True);
    Result := CompareText(Reg.ReadString(RegistryAutoRunName), Application.ExeName) = 0;
  finally
    Reg.Free;
  end;
end;

procedure TwSettingsCommonForm.LoadValues;
begin
  case ApplicationSettings.Theme of
    atSystem:
      cbTheme.ItemIndex := iiSystemTheme;
    atLight:
      cbTheme.ItemIndex := iiLightTheme;
    atDark:
      cbTheme.ItemIndex := iiDarkTheme;
  end;

  tbFontSize.Position := ApplicationSettings.FontSize;
  tsAutoRun.State := SwitchStates[IsAutoRun];
  tsMinimizeToTray.State := SwitchStates[ApplicationSettings.MinimizeToTray];
  tsStartMinimized.State := SwitchStates[ApplicationSettings.StartMinimized];
end;

procedure TwSettingsCommonForm.tbFontSizeChange(Sender: TObject);
begin
  ApplicationSettings.FontSize := tbFontSize.Position;
end;

procedure TwSettingsCommonForm.tsAutoRunClick(Sender: TObject);
begin
  UpdateAutoRun;
end;

procedure TwSettingsCommonForm.tsMinimizeToTrayClick(Sender: TObject);
begin
  ApplicationSettings.MinimizeToTray := tsMinimizeToTray.State = tssOn;
end;

procedure TwSettingsCommonForm.tsStartMinimizedClick(Sender: TObject);
begin
  ApplicationSettings.StartMinimized := tsStartMinimized.State = tssOn;
end;

procedure TwSettingsCommonForm.UpdateAutoRun;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.Rootkey:= HKEY_CURRENT_USER;
    Reg.OpenKey(RegistryAutoRunKey, True);
    case tsAutoRun.State of
      tssOn:
        Reg.WriteString(RegistryAutoRunName, Application.ExeName);
      tssOff:
        Reg.DeleteValue(RegistryAutoRunName);
    end;
  finally
    Reg.Free;
  end;
end;

end.
