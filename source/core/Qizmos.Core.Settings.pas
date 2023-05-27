unit Qizmos.Core.Settings;

interface

uses
  System.SysUtils, System.Classes,
  Winapi.Windows, Win.Registry,
  Vcl.Forms, Vcl.Themes;

type
  TApplicationSettingValue = (svFont, svHttpPort);

  TSmtpServerSettings = class(TPersistent)
  private
    FActiveOnStartup: Boolean;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
  published
    property ActiveOnStartup: Boolean read FActiveOnStartup write FActiveOnStartup;
  end;

  THttpServerSettings = class(TPersistent)
  private
    FActiveOnStartup: Boolean;
    FPort: Integer;
    FResultCode: Integer;
    FResultText: String;
    procedure SetPort(AValue: Integer);
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
  published
    property ActiveOnStartup: Boolean read FActiveOnStartup write FActiveOnStartup;
    property Port: Integer read FPort write SetPort;
    property ResultCode: Integer read FResultCode write FResultCode;
    property ResultText: String read FResultText write FResultText;
  end;

  TApplicationFormPosition = class(TPersistent)
  private
    FWindowState: TWindowState;
    FTop: Integer;
    FLeft: Integer;
    FHeight: Integer;
    FWidth: Integer;
  public
    procedure Assign(Source: TPersistent); override;
    procedure LoadPosition(const AForm: TForm);
    procedure SavePosition(const AForm: TForm);
  published
    property WindowState: TWindowState read FWindowState write FWindowState;
    property Top: Integer read FTop write FTop;
    property Left: Integer read FLeft write FLeft;
    property Height: Integer read FHeight write FHeight;
    property Width: Integer read FWidth write FWidth;
  end;

  TApplicationTheme = (atSystem, atLight, atDark);

  TApplicationSettings = class(TPersistent)
  private
    FFormPosition: TApplicationFormPosition;
    FSmtpServer: TSmtpServerSettings;
    FHttpServer: THttpServerSettings;
    FTheme: TApplicationTheme;
    FThemeName: String;
    FIsDarkTheme: Boolean;
    FDrawerOpened: Boolean;
    FFontSize: Integer;
    FStartMinimized: Boolean;
    FMinimizeToTray: Boolean;
    procedure SetTheme(const AValue: TApplicationTheme);
    procedure SetFontSize(const AValue: Integer);
    function GetTheme: TApplicationTheme;
    function GetSettingsFilename: String;
    function GetSettingsFoldername: String;
    procedure SetFormPositon(const Value: TApplicationFormPosition);
    procedure SetSmtpServer(const Value: TSmtpServerSettings);
    procedure SetHttpServer(const Value: THttpServerSettings);
    procedure InitTheme;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadSettings;
    procedure SaveSettings;
  published
    procedure WindowsThemeChanged;
    property Theme: TApplicationTheme read GetTheme write SetTheme;
    property IsDarkTheme: Boolean read FIsDarkTheme;
    property DrawerOpened: Boolean read FDrawerOpened write FDrawerOpened;
    property FormPosition: TApplicationFormPosition read FFormPosition
      write SetFormPositon;
    property SmtpServer: TSmtpServerSettings read FSmtpServer write SetSmtpServer;
    property HttpServer: THttpServerSettings read FHttpServer write SetHttpServer;
    property SettingsFoldername: String read GetSettingsFoldername;
    property FontSize: Integer read FFontSize write SetFontSize;
    property StartMinimized: Boolean read FStartMinimized write FStartMinimized;
    property MinimizeToTray: Boolean read FMinimizeToTray write FMinimizeToTray;
  end;

var
  ApplicationSettings: TApplicationSettings;

implementation

uses
  System.IOUtils, System.JSON,
  Neon.Core.Persistence, Neon.Core.Persistence.JSON,
  EventBus,
  Qodelib.IOUtils,
  Qizmos.Core.Events;

const
{$ifdef DEBUG}
  SSettingsFilename = 'Qizmos-debug.json';
{$else}
  SSettingsFilename = 'Qizmos.json';
{$endif}
  SAppDataFolder = 'quarkz\Qizmos';

procedure SettingChangeEvent(const AValue: TApplicationSettingValue);
begin
  GlobalEventBus.Post(TEventFactory.NewSettingChangeEvent(AValue));
end;

{ TApplicationSettings }

constructor TApplicationSettings.Create;
begin
  inherited Create;
  FTheme := atSystem;
  FFormPosition := TApplicationFormPosition.Create;
  FSmtpServer := TSmtpServerSettings.Create;
  FHttpServer := THttpServerSettings.Create;
  FDrawerOpened := true;
  FFontSize := 9;
  FStartMinimized := false;
  FMinimizeToTray := false;
end;

destructor TApplicationSettings.Destroy;
begin
  FSmtpServer.Free;
  FHttpServer.Free;
  FormPosition.Free;
  inherited;
end;

function TApplicationSettings.GetSettingsFilename: String;
begin
  Result := TPath.Combine(GetSettingsFoldername, SSettingsFilename);
end;

function TApplicationSettings.GetSettingsFoldername: String;
begin
  Result := TPath.Combine(TKnownFolders.GetAppDataPath, SAppDataFolder);
end;

function TApplicationSettings.GetTheme: TApplicationTheme;
begin
  Result := FTheme;
end;

procedure TApplicationSettings.InitTheme;
const
  SWindowsTheme = 'Windows';
  SDarkTheme = 'Windows11 Modern Dark';
  SLightTheme = 'Windows11 Modern Light';
var
  Reg: TRegistry;
begin
  case FTheme of
    atSystem:
      begin
        Reg := TRegistry.Create(KEY_READ);
        Reg.RootKey := HKEY_CURRENT_USER;
        if Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize', false) then
          begin
            if Reg.ReadBool('AppsUseLightTheme') then
              begin
                FThemeName := SLightTheme;
                FIsDarkTheme := false;
              end
            else
              begin
                FThemeName := SDarkTheme;
                FIsDarkTheme := true;
              end;
          end
        else
          begin
            FThemeName := SWindowsTheme;
            FIsDarkTheme := false;
          end;
        Reg.Free;
      end;
    atLight:
      begin
        FThemeName := SLightTheme;
        FIsDarkTheme := false;
      end;
    atDark:
      begin
        FThemeName := SDarkTheme;
        FIsDarkTheme := true;
      end;
    else
      begin
        FThemeName := SWindowsTheme;
        FIsDarkTheme := false;
      end;
  end;
end;

procedure TApplicationSettings.LoadSettings;
var
  JSON: TJSONValue;
  Strings: TStringList;
begin
  if FileExists(GetSettingsFilename) then
    begin
      Strings := TStringList.Create;
      Strings.LoadFromFile(GetSettingsFilename);
      JSON := TJSONObject.ParseJSONValue(Strings.Text);
      TNeon.JSONToObject(self, JSON, TNeonConfiguration.Default);
      JSON.Free;
      Strings.Free;
    end;
end;

procedure TApplicationSettings.SaveSettings;
var
  JSON: TJSONValue;
  Stream: TFileStream;
begin
  ForceDirectories(GetSettingsFoldername);
  JSON := TNeon.ObjectToJSON(self);
  Stream := TFileStream.Create(GetSettingsFilename, fmCreate);
  TNeon.PrintToStream(JSON, Stream, true);
  Stream.Free;
  JSON.Free;
end;

procedure TApplicationSettings.SetFontSize(const AValue: Integer);
begin
  if FFontSize <> AValue then
    begin
      FFontSize := AValue;
      SettingChangeEvent(svFont);
    end;
end;

procedure TApplicationSettings.SetFormPositon(
  const Value: TApplicationFormPosition);
begin
  FFormPosition.Assign(Value);
end;

procedure TApplicationSettings.SetHttpServer(const Value: THttpServerSettings);
begin
  FHttpServer.Assign(Value);
end;

procedure TApplicationSettings.SetSmtpServer(const Value: TSmtpServerSettings);
begin
  FSmtpServer.Assign(Value);
end;

procedure TApplicationSettings.SetTheme(const AValue: TApplicationTheme);
begin
  FTheme := AValue;
  InitTheme;
  TStyleManager.TrySetStyle(FThemeName);
  GlobalEventBus.Post(TEventFactory.NewThemeChangeEvent);
end;

procedure TApplicationSettings.WindowsThemeChanged;
begin
  if FTheme = atSystem then
    TStyleManager.TrySetStyle(FThemeName);
end;

{ TApplicationFormPosition }

procedure TApplicationFormPosition.Assign(Source: TPersistent);
begin
  if Source is TApplicationFormPosition then
    begin
      WindowState := TApplicationFormPosition(Source).WindowState;
      Top := TApplicationFormPosition(Source).Top;
      Left := TApplicationFormPosition(Source).Left;
      Height := TApplicationFormPosition(Source).Height;
      Width := TApplicationFormPosition(Source).Width;
    end
  else
    inherited Assign(Source);
end;

procedure TApplicationFormPosition.SavePosition(const AForm: TForm);
begin
  WindowState := AForm.WindowState;
  Top := AForm.Top;
  Left := AForm.Left;
  Height := AForm.Height;
  Width := AForm.Width;
end;

procedure TApplicationFormPosition.LoadPosition(const AForm: TForm);
begin
  if (Width > 0) and (Height > 0) then
    begin
      AForm.WindowState := WindowState;
      AForm.Top := Top;
      AForm.Left := Left;
      AForm.Height := Height;
      AForm.Width := Width;
    end;
end;

{ TSmtpServerSettings }

procedure TSmtpServerSettings.Assign(Source: TPersistent);
begin
  if Source is TSmtpServerSettings then
    begin
      ActiveOnStartup := TSmtpServerSettings(Source).ActiveOnStartup;
    end
  else
    inherited Assign(Source);
end;

constructor TSmtpServerSettings.Create;
begin
  inherited Create;
  FActiveOnStartup := false;
end;

{ THttpServerSettings }

procedure THttpServerSettings.Assign(Source: TPersistent);
begin
  if Source is THttpServerSettings then
    begin
      ActiveOnStartup := THttpServerSettings(Source).ActiveOnStartup;
    end
  else
    inherited Assign(Source);
end;

constructor THttpServerSettings.Create;
begin
  inherited Create;
  FActiveOnStartup := false;
  FPort := 80;
  FResultCode := 200;
  FResultText := 'successful';
end;

procedure THttpServerSettings.SetPort(AValue: Integer);
begin
  if FPort <> AValue then
    begin
      FPort := AValue;
      SettingChangeEvent(svHttpPort);
    end;
end;

initialization
  ApplicationSettings := TApplicationSettings.Create;

finalization
  FreeAndNil(ApplicationSettings);

end.

